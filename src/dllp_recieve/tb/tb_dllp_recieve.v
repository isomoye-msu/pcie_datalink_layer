
module tb_dllp_recieve;

  import pcie_datalink_pkg::*;

  // Parameters
  localparam int DATA_WIDTH = 32;
  localparam int STRB_WIDTH = DATA_WIDTH / 8;
  localparam int KEEP_WIDTH = STRB_WIDTH;
  localparam int USER_WIDTH = 4;
  localparam int S_COUNT = 2;
  localparam int M_COUNT = 2;
  localparam int RAM_DATA_WIDTH = 32;
  localparam int RAM_ADDR_WIDTH = 12;
  localparam int RETRY_TLP_SIZE = 3;
  localparam int RX_FIFO_SIZE = 3;

  //Ports
  reg                   clk;
  reg                   rst;

  reg  [1:0] link_status;
  reg  [DATA_WIDTH-1:0] s_axis_phy2tlp_tdata  ;
  reg  [KEEP_WIDTH-1:0] s_axis_phy2tlp_tkeep  ;
  reg  [   1-1:0] s_axis_phy2tlp_tvalid ;
  reg  [   1-1:0] s_axis_phy2tlp_tlast  ;
  reg  [USER_WIDTH-1:0] s_axis_phy2tlp_tuser  ;
  wire  [   1-1:0] s_axis_phy2tlp_tready ;

  reg  [DATA_WIDTH-1:0] s_axis_phy2dllp_tdata ;
  reg  [KEEP_WIDTH-1:0] s_axis_phy2dllp_tkeep ;
  reg  [   1-1:0] s_axis_phy2dllp_tvalid;
  reg  [   1-1:0] s_axis_phy2dllp_tlast ;
  reg  [USER_WIDTH-1:0] s_axis_phy2dllp_tuser ;
  wire  [   1-1:0] s_axis_phy2dllp_tready;

  wire  [DATA_WIDTH-1:0] m_axis_dllp2tlp_tdata  ;
  wire  [KEEP_WIDTH-1:0] m_axis_dllp2tlp_tkeep  ;
  wire                   m_axis_dllp2tlp_tvalid ;
  wire                   m_axis_dllp2tlp_tlast  ;
  wire  [USER_WIDTH-1:0] m_axis_dllp2tlp_tuser  ;
  reg                   m_axis_dllp2tlp_tready ;

  wire  [DATA_WIDTH-1:0] m_axis_dllp2phy_tdata;
  wire  [KEEP_WIDTH-1:0] m_axis_dllp2phy_tkeep;
  wire                   m_axis_dllp2phy_tvalid;
  wire                   m_axis_dllp2phy_tlast;
  wire  [USER_WIDTH-1:0] m_axis_dllp2phy_tuser;
  reg                   m_axis_dllp2phy_tready;



  wire [          11:0] seq_num;
  wire                  seq_num_vld;
  wire                  seq_num_acknack;
  wire                  fc1_values_stored;
  wire                  fc2_values_stored;
  wire [           7:0] tx_fc_ph;
  wire [          11:0] tx_fc_pd;
  wire [           7:0] tx_fc_nph;
  wire [          11:0] tx_fc_npd;


  dllp_recieve # (
    .DATA_WIDTH(DATA_WIDTH),
    .STRB_WIDTH(STRB_WIDTH),
    .KEEP_WIDTH(KEEP_WIDTH),
    .USER_WIDTH(USER_WIDTH),
    .S_COUNT(S_COUNT),
    .M_COUNT(M_COUNT),
    .RX_FIFO_SIZE(RX_FIFO_SIZE),
    .RAM_DATA_WIDTH(RAM_DATA_WIDTH),
    .RAM_ADDR_WIDTH(RAM_ADDR_WIDTH)
  )
  dllp_recieve_inst (
    .clk_i(clk),
    .rst_i(rst),
    .link_status_i(link_status),

    .s_axis_tdata_i( {s_axis_phy2tlp_tdata , s_axis_phy2dllp_tdata } ),
    .s_axis_tkeep_i( {s_axis_phy2tlp_tkeep , s_axis_phy2dllp_tkeep } ),
    .s_axis_tvalid_i({s_axis_phy2tlp_tvalid, s_axis_phy2dllp_tvalid} ),
    .s_axis_tlast_i( {s_axis_phy2tlp_tlast , s_axis_phy2dllp_tlast } ),
    .s_axis_tuser_i( {s_axis_phy2tlp_tuser , s_axis_phy2dllp_tuser } ),
    .s_axis_tready_o({s_axis_phy2tlp_tready, s_axis_phy2dllp_tready} ),

    .m_axis_tdata_o(  {m_axis_dllp2tlp_tdata , m_axis_dllp2phy_tdata } ),
    .m_axis_tkeep_o(  {m_axis_dllp2tlp_tkeep , m_axis_dllp2phy_tkeep } ),
    .m_axis_tvalid_o( {m_axis_dllp2tlp_tvalid, m_axis_dllp2phy_tvalid} ),
    .m_axis_tlast_o(  {m_axis_dllp2tlp_tlast , m_axis_dllp2phy_tlast } ),
    .m_axis_tuser_o(  {m_axis_dllp2tlp_tuser , m_axis_dllp2phy_tuser } ),
    .m_axis_tready_i( {m_axis_dllp2tlp_tready, m_axis_dllp2phy_tready} ),

    .seq_num_o(seq_num),
    .seq_num_vld_o(seq_num_vld),
    .seq_num_acknack_o(seq_num_acknack),
    .fc1_values_stored_o(fc1_values_stored),
    .fc2_values_stored_o(fc2_values_stored),
    .tx_fc_ph_o(tx_fc_ph),
    .tx_fc_pd_o(tx_fc_pd),
    .tx_fc_nph_o(tx_fc_nph),
    .tx_fc_npd_o(tx_fc_npd)
  );

  // always begin
  //   #5 clk = ~clk;
  // end

  // initial begin
  //   $dumpfile("tb_dllp_recieve.vcd");
  //   $dumpvars(0, tb_dllp_recieve);
  //   rst_i <= 1'b1;
  //   #200 rst_i <= 1'b0;
  //   $display("done reset");
  //   #100000;
  //   $finish;
  // end

endmodule
