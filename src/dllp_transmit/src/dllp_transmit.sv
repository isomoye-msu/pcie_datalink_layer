module dllp_transmit
  import pcie_datalink_pkg::*;
#(
    // TLP data width
    parameter int DATA_WIDTH = 32,
    // TLP strobe width
    parameter int STRB_WIDTH = DATA_WIDTH / 8,
    parameter int KEEP_WIDTH = STRB_WIDTH,
    parameter int USER_WIDTH = 1,
    parameter int S_COUNT = 1,
    parameter int MAX_PAYLOAD_SIZE = 0,
    // Width of AXI stream interfaces in bits
    parameter int RETRY_TLP_SIZE = 3
) (
    input logic clk_i,  // Clock signal
    input logic rst_i,  // Reset signal


    //TLP AXIS inputs
    input  logic [DATA_WIDTH-1:0] s_axis_tlp_tdata,
    input  logic [KEEP_WIDTH-1:0] s_axis_tlp_tkeep,
    input  logic [   S_COUNT-1:0] s_axis_tlp_tvalid,
    input  logic [   S_COUNT-1:0] s_axis_tlp_tlast,
    input  logic [USER_WIDTH-1:0] s_axis_tlp_tuser,
    output logic [   S_COUNT-1:0] s_axis_tlp_tready,
    //dllp AXIS output
    output logic [DATA_WIDTH-1:0] m_axis_dllp_tdata,
    output logic [KEEP_WIDTH-1:0] m_axis_dllp_tkeep,
    output logic                  m_axis_dllp_tvalid,
    output logic                  m_axis_dllp_tlast,
    output logic [USER_WIDTH-1:0] m_axis_dllp_tuser,
    input  logic                  m_axis_dllp_tready,
    //dllp tlp sequence ack/nack
    input  logic                  ack_nack_i,
    input  logic                  ack_nack_vld_i,
    input  logic [          11:0] ack_seq_num_i,
    //flow control
    input  logic [           7:0] tx_fc_ph_i,
    input  logic [          11:0] tx_fc_pd_i,
    input  logic [           7:0] tx_fc_nph_i,
    input  logic [          11:0] tx_fc_npd_i
);


  parameter int MaxTlpHdrSizeDW = 4;
  parameter int MaxTlpTotalSizeDW = MaxTlpHdrSizeDW + (8 << (4 + MAX_PAYLOAD_SIZE)) + 1;
  parameter int MinRxBufferSize = MaxTlpTotalSizeDW * (RETRY_TLP_SIZE);
  parameter int RAM_DATA_WIDTH = DATA_WIDTH;
  parameter int RAM_ADDR_WIDTH = $clog2(MinRxBufferSize);
  parameter int KEEP_ENABLE = (DATA_WIDTH > 8);
  parameter int ID_ENABLE = 0;
  parameter int ID_WIDTH = 8;
  parameter int DEST_ENABLE = 0;
  parameter int DEST_WIDTH = 8;
  parameter int USER_ENABLE = 1;
  parameter int LAST_ENABLE = 1;
  parameter int ARB_TYPE_ROUND_ROBIN = 0;
  parameter int ARB_LSB_HIGH_PRIORITY = 1;


  //RETRY AXIS output
  logic [  (DATA_WIDTH)-1:0] m_axis_retry_tdata;
  logic [  (KEEP_WIDTH)-1:0] m_axis_retry_tkeep;
  logic                      m_axis_retry_tvalid;
  logic                      m_axis_retry_tlast;
  logic [    USER_WIDTH-1:0] m_axis_retry_tuser;
  logic                      m_axis_retry_tready;
  //DLLP AXIS output
  logic [  (DATA_WIDTH)-1:0] m_axis_tlp2dllp_tdata;
  logic [  (KEEP_WIDTH)-1:0] m_axis_tlp2dllp_tkeep;
  logic                      m_axis_tlp2dllp_tvalid;
  logic                      m_axis_tlp2dllp_tlast;
  logic [    USER_WIDTH-1:0] m_axis_tlp2dllp_tuser;
  logic                      m_axis_tlp2dllp_tready;
  //bram retry signals
  logic                      bram_retry_wr;
  logic [RAM_ADDR_WIDTH-1:0] bram_retry_addr;
  logic [RAM_DATA_WIDTH-1:0] bram_retry_data_in;
  logic [RAM_DATA_WIDTH-1:0] bram_retry_data_out;
  //bram dllp signals
  logic                      bram_dllp_wr;
  logic [RAM_ADDR_WIDTH-1:0] bram_dllp_addr;
  logic [RAM_DATA_WIDTH-1:0] bram_dllp_data_in;
  logic [RAM_DATA_WIDTH-1:0] bram_dllp_data_out;
  logic [              11:0] ackd_transmit_seq;
  logic                      dllp_valid;
  logic                      retry_available;
  logic [               7:0] retry_index;
  logic                      retry_err;

  retry_management #(
      .DATA_WIDTH(DATA_WIDTH),
      .STRB_WIDTH(STRB_WIDTH),
      .KEEP_WIDTH(KEEP_WIDTH),
      .USER_WIDTH(USER_WIDTH),
      .S_COUNT(1),
      .RAM_ADDR_WIDTH(RAM_ADDR_WIDTH),
      .RAM_DATA_WIDTH(RAM_DATA_WIDTH),
      .MAX_PAYLOAD_SIZE(MAX_PAYLOAD_SIZE),
      .RETRY_TLP_SIZE(RETRY_TLP_SIZE)
  ) retry_management_inst (
      .clk_i            (clk_i),
      .rst_i            (rst_i),
      //seq num
      .tx_seq_num_i     (ackd_transmit_seq),
      .tx_valid_i       (dllp_valid),
      //retry
      .retry_available_o(retry_available),
      .retry_index_o    (retry_index),
      .retry_err_o      (retry_err),
      //ack/nack from dllp
      .ack_nack_i       (ack_nack_i),
      .ack_nack_vld_i   (ack_nack_vld_i),
      .ack_seq_num_i    (ack_seq_num_i),
      //bram
      .bram_wr_o        (bram_retry_wr),
      .bram_addr_o      (bram_retry_addr),
      .bram_data_out_o  (bram_retry_data_in),
      .bram_data_in_i   (bram_retry_data_out),
      //axis out to phy
      .m_axis_tdata     (m_axis_retry_tdata),
      .m_axis_tkeep     (m_axis_retry_tkeep),
      .m_axis_tvalid    (m_axis_retry_tvalid),
      .m_axis_tlast     (m_axis_retry_tlast),
      .m_axis_tuser     (m_axis_retry_tuser),
      .m_axis_tready    (m_axis_retry_tready)
  );


  tlp2dllp #(
      .DATA_WIDTH(DATA_WIDTH),
      .KEEP_WIDTH(KEEP_WIDTH),
      .USER_WIDTH(USER_WIDTH),
      .RAM_ADDR_WIDTH(RAM_ADDR_WIDTH),
      .RAM_DATA_WIDTH(RAM_DATA_WIDTH),
      .MAX_PAYLOAD_SIZE(MAX_PAYLOAD_SIZE),
      .S_COUNT(S_COUNT)
  ) tlp2dllp_inst (
      .clk_i            (clk_i),
      .rst_i            (rst_i),
      //axis tlp in
      .s_axis_tdata     (s_axis_tlp_tdata),
      .s_axis_tkeep     (s_axis_tlp_tkeep),
      .s_axis_tvalid    (s_axis_tlp_tvalid),
      .s_axis_tlast     (s_axis_tlp_tlast),
      .s_axis_tuser     (s_axis_tlp_tuser),
      .s_axis_tready    (s_axis_tlp_tready),
      //axis out to phy
      .m_axis_tdata     (m_axis_tlp2dllp_tdata),
      .m_axis_tkeep     (m_axis_tlp2dllp_tkeep),
      .m_axis_tvalid    (m_axis_tlp2dllp_tvalid),
      .m_axis_tlast     (m_axis_tlp2dllp_tlast),
      .m_axis_tuser     (m_axis_tlp2dllp_tuser),
      .m_axis_tready    (m_axis_tlp2dllp_tready),
      //bram
      .bram_wr_o        (bram_dllp_wr),
      .bram_addr_o      (bram_dllp_addr),
      .bram_data_out_o  (bram_dllp_data_in),
      .bram_data_in_i   (bram_dllp_data_out),
      //sequence number
      .seq_num_o        (ackd_transmit_seq),
      .dllp_valid_o     (dllp_valid),
      .retry_available_i(retry_available),
      .retry_index_i    (retry_index),
      //flow control
      .tx_fc_ph_i       (tx_fc_ph_i),
      .tx_fc_pd_i       (tx_fc_pd_i),
      .tx_fc_nph_i      (tx_fc_nph_i),
      .tx_fc_npd_i      (tx_fc_npd_i)
  );


  axis_arb_mux #(
      .S_COUNT(2),
      .DATA_WIDTH(DATA_WIDTH),
      .KEEP_ENABLE(KEEP_ENABLE),
      .KEEP_WIDTH(KEEP_WIDTH),
      .ID_ENABLE(ID_ENABLE),
      .S_ID_WIDTH(ID_WIDTH),
      .DEST_ENABLE(DEST_ENABLE),
      .DEST_WIDTH(DEST_WIDTH),
      .USER_ENABLE(USER_ENABLE),
      .USER_WIDTH(USER_WIDTH),
      .LAST_ENABLE(LAST_ENABLE),
      .ARB_TYPE_ROUND_ROBIN(ARB_TYPE_ROUND_ROBIN),
      .ARB_LSB_HIGH_PRIORITY(ARB_LSB_HIGH_PRIORITY)
  ) arbiter_mux_inst (
      .clk(clk_i),
      .rst(rst_i),
      // AXI inputs
      .s_axis_tdata({m_axis_dllp_tdata, m_axis_retry_tdata}),
      .s_axis_tkeep({m_axis_dllp_tkeep, m_axis_retry_tkeep}),
      .s_axis_tvalid({m_axis_dllp_tvalid, m_axis_retry_tvalid}),
      .s_axis_tready({m_axis_dllp_tready, m_axis_retry_tready}),
      .s_axis_tlast({m_axis_dllp_tlast, m_axis_retry_tlast}),
      .s_axis_tid(),
      .s_axis_tdest(),
      .s_axis_tuser({m_axis_dllp_tuser, m_axis_retry_tuser}),
      // AXI output
      .m_axis_tdata(m_axis_dllp_tdata),
      .m_axis_tkeep(m_axis_dllp_tkeep),
      .m_axis_tvalid(m_axis_dllp_tvalid),
      .m_axis_tready(m_axis_dllp_tready),
      .m_axis_tlast(m_axis_dllp_tlast),
      .m_axis_tid(),
      .m_axis_tdest(),
      .m_axis_tuser(m_axis_dllp_tuser)
  );


  bram_dp #(
      .RAM_DATA_WIDTH(DATA_WIDTH),
      .RAM_ADDR_WIDTH(RAM_ADDR_WIDTH)
  ) retry_buffer_inst (
      .rst       (rst_i),
      .a_clk     (clk_i),
      .a_wr      (bram_retry_wr),
      .a_addr    (bram_retry_addr),
      .a_data_in (bram_retry_data_in),
      .a_data_out(bram_retry_data_out),
      .b_clk     (clk_i),
      .b_wr      (bram_dllp_wr),
      .b_addr    (bram_dllp_addr),
      .b_data_in (bram_dllp_data_in),
      .b_data_out(bram_dllp_data_out)
  );

endmodule
