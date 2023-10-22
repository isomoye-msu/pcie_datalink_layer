`timescale 1ns / 1ps
module pcie_datalink_layer
  import pcie_datalink_pkg::*;
#(
    // Parameters
    parameter int DATA_WIDTH = 32,
    parameter int STRB_WIDTH = DATA_WIDTH / 8,
    parameter int KEEP_WIDTH = STRB_WIDTH,
    parameter int USER_WIDTH = 3,
    parameter int S_COUNT = 2,
    parameter int RX_FIFO_SIZE = 3,
    parameter int RETRY_TLP_SIZE = 3,
    parameter int MAX_PAYLOAD_SIZE = 0,
    parameter int RAM_DATA_WIDTH = 0,
    parameter int RAM_ADDR_WIDTH = 0
) (
    input  logic                  clk_i,                     // Clock signal
    input  logic                  rst_i,                     // Reset signal
    //TLP AXIS inputs
    input  logic [DATA_WIDTH-1:0] s_axis_tlp_tdata_i,
    input  logic [KEEP_WIDTH-1:0] s_axis_tlp_tkeep_i,
    input  logic                  s_axis_tlp_tvalid_i,
    input  logic                  s_axis_tlp_tlast_i,
    input  logic [USER_WIDTH-1:0] s_axis_tlp_tuser_i,
    output logic                  s_axis_tlp_tready_o,
    //TLP AXIS output
    output logic [DATA_WIDTH-1:0] m_axis_tlp_tdata_o,
    output logic [KEEP_WIDTH-1:0] m_axis_tlp_tkeep_o,
    output logic                  m_axis_tlp_tvalid_o,
    output logic                  m_axis_tlp_tlast_o,
    output logic [USER_WIDTH-1:0] m_axis_tlp_tuser_o,
    input  logic                  m_axis_tlp_tready_i,
    //DLLP AXIS inputs
    input  logic [DATA_WIDTH-1:0] s_axis_phy2dllp_tdata_i,
    input  logic [KEEP_WIDTH-1:0] s_axis_phy2dllp_tkeep_i,
    input  logic                  s_axis_phy2dllp_tvalid_i,
    input  logic                  s_axis_phy2dllp_tlast_i,
    input  logic [USER_WIDTH-1:0] s_axis_phy2dllp_tuser_i,
    output logic                  s_axis_phy2dllp_tready_o,
    //PHY -> DLLP AXIS output
    output logic [DATA_WIDTH-1:0] m_axis_dllp2phy_tdata_o,
    output logic [KEEP_WIDTH-1:0] m_axis_dllp2phy_tkeep_o,
    output logic                  m_axis_dllp2phy_tvalid_o,
    output logic                  m_axis_dllp2phy_tlast_o,
    output logic [USER_WIDTH-1:0] m_axis_dllp2phy_tuser_o,
    input  logic                  m_axis_dllp2phy_tready_i,
    //PHY -> TLP AXIS inputs
    input  logic [DATA_WIDTH-1:0] s_axis_phy2tlp_tdata_i,
    input  logic [KEEP_WIDTH-1:0] s_axis_phy2tlp_tkeep_i,
    input  logic                  s_axis_phy2tlp_tvalid_i,
    input  logic                  s_axis_phy2tlp_tlast_i,
    input  logic [USER_WIDTH-1:0] s_axis_phy2tlp_tuser_i,
    output logic                  s_axis_phy2tlp_tready_o,
    //TLP -> DLLP AXIS output
    output logic [DATA_WIDTH-1:0] m_axis_tlp2phy_tdata_o,
    output logic [KEEP_WIDTH-1:0] m_axis_tlp2phy_tkeep_o,
    output logic                  m_axis_tlp2phy_tvalid_o,
    output logic                  m_axis_tlp2phy_tlast_o,
    output logic [USER_WIDTH-1:0] m_axis_tlp2phy_tuser_o,
    input  logic                  m_axis_tlp2phy_tready_i,
    //Configuration
    input  logic                  phy_link_up_i,
    output logic [           7:0] bus_num_o,
    output logic                  ext_tag_enable_o,
    output logic                  rcb_128b_o,
    output logic [           2:0] max_read_request_size_o,
    output logic [           2:0] max_payload_size_o,
    output logic                  msix_enable_o,
    output logic                  msix_mask_o,
    //Status
    input  logic                  status_error_cor_i,
    input  logic                  status_error_uncor_i,
    //Control and status
    input  logic                  rx_cpl_stall_i
);


  //localparam int SLAVE_COUNT = 2;
  parameter int KEEP_ENABLE = (DATA_WIDTH > 8);
  parameter int ID_ENABLE = 0;
  parameter int ID_WIDTH = 8;
  parameter int DEST_ENABLE = 0;
  parameter int DEST_WIDTH = 8;
  parameter int USER_ENABLE = 1;
  // parameter int USER_WIDTH = 1;
  parameter int LAST_ENABLE = 1;
  parameter int ARB_TYPE_ROUND_ROBIN = 0;
  parameter int ARB_LSB_HIGH_PRIORITY = 1;
  parameter int M_COUNT = 2;


  //RETRY AXIS output
  logic [(DATA_WIDTH)-1:0] m_axis_dllpfc2phy_tdata;
  logic [(KEEP_WIDTH)-1:0] m_axis_dllpfc2phy_tkeep;
  logic                    m_axis_dllpfc2phy_tvalid;
  logic                    m_axis_dllpfc2phy_tlast;
  logic [  USER_WIDTH-1:0] m_axis_dllpfc2phy_tuser;
  logic                    m_axis_dllpfc2phy_tready;


  //DLLP AXIS output
  logic [(DATA_WIDTH)-1:0] m_axis_dllprx2phy_tdata;
  logic [(KEEP_WIDTH)-1:0] m_axis_dllprx2phy_tkeep;
  logic                    m_axis_dllprx2phy_tvalid;
  logic                    m_axis_dllprx2phy_tlast;
  logic [  USER_WIDTH-1:0] m_axis_dllprx2phy_tuser;
  logic                    m_axis_dllprx2phy_tready;

  //tlp ack/nak
  logic [            11:0] seq_num;
  logic                    seq_num_vld;
  logic                    seq_num_acknack;
  //flow control
  logic [             7:0] tx_fc_ph;
  logic [            11:0] tx_fc_pd;
  logic [             7:0] tx_fc_nph;
  logic [            11:0] tx_fc_npd;


  //Ports
  logic                    init_flow_control;
  logic                    soft_reset;
  logic                    fc1_values_stored;
  logic                    fc2_values_stored;


  pcie_dl_status_e                    link_status;

  pcie_datalink_init #() pcie_datalink_init_inst (
      .clk_i(clk_i),
      .rst_i(rst_i),
      .phy_link_up_i(phy_link_up_i),
      .init_flow_control_o(init_flow_control),
      .soft_reset_o(soft_reset),
      .link_status_o(link_status),
      .fc1_values_stored_i(fc1_values_stored),
      .fc2_values_stored_i(fc2_values_stored),
      .init_ack_i(init_ack)
  );


  pcie_flow_ctrl_init #(
      .DATA_WIDTH(DATA_WIDTH),
      .STRB_WIDTH(STRB_WIDTH),
      .KEEP_WIDTH(KEEP_WIDTH),
      .USER_WIDTH(USER_WIDTH),
      .S_COUNT(S_COUNT),
      .MAX_PAYLOAD_SIZE(MAX_PAYLOAD_SIZE)
  ) pcie_flow_ctrl_init_inst (
      .clk_i(clk_i),
      .rst_i(rst_i || soft_reset),
      .start_flow_control_i(init_flow_control),
      .fc1_values_stored_i(fc1_values_stored),
      .fc2_values_stored_i(fc2_values_stored),
      .m_axis_tdata_o(m_axis_dllpfc2phy_tdata),
      .m_axis_tkeep_o(m_axis_dllpfc2phy_tkeep),
      .m_axis_tvalid_o(m_axis_dllpfc2phy_tvalid),
      .m_axis_tlast_o(m_axis_dllpfc2phy_tlast),
      .m_axis_tuser_o(m_axis_dllpfc2phy_tuser),
      .m_axis_tready_i(m_axis_dllpfc2phy_tready),
      .init_ack_o(init_ack)
  );

  //dllp transmit
  dllp_transmit #(
      .DATA_WIDTH(DATA_WIDTH),
      .STRB_WIDTH(STRB_WIDTH),
      .KEEP_WIDTH(KEEP_WIDTH),
      .USER_WIDTH(USER_WIDTH),
      .MAX_PAYLOAD_SIZE(MAX_PAYLOAD_SIZE),
      .S_COUNT(S_COUNT),
      .RETRY_TLP_SIZE(RETRY_TLP_SIZE)
  ) dllp_transmit_inst (
      .clk_i(clk_i),
      .rst_i(rst_i || soft_reset),
      .s_axis_tlp_tdata_i(s_axis_tlp_tdata_i),
      .s_axis_tlp_tkeep_i(s_axis_tlp_tkeep_i),
      .s_axis_tlp_tvalid_i(s_axis_tlp_tvalid_i),
      .s_axis_tlp_tlast_i(s_axis_tlp_tlast_i),
      .s_axis_tlp_tuser_i(s_axis_tlp_tuser_i),
      .s_axis_tlp_tready_o(s_axis_tlp_tready_o),
      .m_axis_dllp_tdata_o(m_axis_dllp_tdata_o),
      .m_axis_dllp_tkeep_o(m_axis_dllp_tkeep_o),
      .m_axis_dllp_tvalid_o(m_axis_dllp_tvalid_o),
      .m_axis_dllp_tlast_o(m_axis_dllp_tlast_o),
      .m_axis_dllp_tuser_o(m_axis_dllp_tuser_o),
      .m_axis_dllp_tready_i(m_axis_dllp_tready_i),
      .ack_nack_i(ack_nack),
      .ack_nack_vld_i(ack_nack_vld),
      .ack_seq_num_i(ack_seq_num),
      .tx_fc_ph_i(tx_fc_ph),
      .tx_fc_pd_i(tx_fc_pd),
      .tx_fc_nph_i(tx_fc_nph),
      .tx_fc_npd_i(tx_fc_npd)
  );


  //dllp recieve
  dllp_recieve #(
      .DATA_WIDTH(DATA_WIDTH),
      .STRB_WIDTH(STRB_WIDTH),
      .KEEP_WIDTH(KEEP_WIDTH),
      .USER_WIDTH(USER_WIDTH),
      .S_COUNT(S_COUNT),
      .M_COUNT(M_COUNT),
      .MAX_PAYLOAD_SIZE(MAX_PAYLOAD_SIZE),
      .RX_FIFO_SIZE(RX_FIFO_SIZE)
  ) dllp_recieve_inst (
      .clk_i(clk_i),
      .rst_i(rst_i || soft_reset),
      .link_status_i(link_status),
      .phy_link_up_i(phy_link_up_i),
      .s_axis_tdata_i(   {s_axis_phy2tlp_tdata_i, s_axis_phy2dllp_tdata_i}  ),
      .s_axis_tkeep_i(   {s_axis_phy2tlp_tkeep_i, s_axis_phy2dllp_tkeep_i}  ),
      .s_axis_tvalid_i(  {s_axis_phy2tlp_tvalid_i, s_axis_phy2dllp_tvalid_i}),
      .s_axis_tlast_i(   {s_axis_phy2tlp_tlast_i, s_axis_phy2dllp_tlast_i}  ),
      .s_axis_tuser_i(   {s_axis_phy2tlp_tuser_i, s_axis_phy2dllp_tuser_i}  ),
      .s_axis_tready_o(  {s_axis_phy2tlp_tready_o, s_axis_phy2dllp_tready_o}),
      .m_axis_tdata_o(  {  m_axis_tlp_tdata_o, m_axis_dllprx2phy_tdata}),
      .m_axis_tkeep_o(  {  m_axis_tlp_tkeep_o, m_axis_dllprx2phy_tkeep}),
      .m_axis_tvalid_o( {  m_axis_tlp_tvalid_o, m_axis_dllprx2phy_tvalid}),
      .m_axis_tlast_o(  {  m_axis_tlp_tlast_o, m_axis_dllprx2phy_tlast}),
      .m_axis_tuser_o(  {  m_axis_tlp_tuser_o, m_axis_dllprx2phy_tuser}),
      .m_axis_tready_i( {  m_axis_tlp_tready_i, m_axis_dllprx2phy_tready}),
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
      .rst(rst_i || soft_reset),
      // AXI inputs
      .s_axis_tdata({m_axis_dllprx2phy_tdata, m_axis_dllpfc2phy_tdata}),
      .s_axis_tkeep({m_axis_dllprx2phy_tkeep, m_axis_dllpfc2phy_tkeep}),
      .s_axis_tvalid({m_axis_dllprx2phy_tvalid, m_axis_dllpfc2phy_tvalid}),
      .s_axis_tready({m_axis_dllprx2phy_tready, m_axis_dllpfc2phy_tready}),
      .s_axis_tlast({m_axis_dllprx2phy_tlast, m_axis_dllpfc2phy_tlast}),
      .s_axis_tid(),
      .s_axis_tdest(),
      .s_axis_tuser({m_axis_dllprx2phy_tuser, m_axis_dllpfc2phy_tuser}),
      // AXI output
      .m_axis_tdata(m_axis_dllp2phy_tdata_o),
      .m_axis_tkeep(m_axis_dllp2phy_tkeep_o),
      .m_axis_tvalid(m_axis_dllp2phy_tvalid_o),
      .m_axis_tready(m_axis_dllp2phy_tready_i),
      .m_axis_tlast(m_axis_dllp2phy_tlast_o),
      .m_axis_tid(),
      .m_axis_tdest(),
      .m_axis_tuser(m_axis_dllp2phy_tuser_o)
  );

  assign bus_num_o    = '0;
  assign ext_tag_enable_o    = '0;
  assign rcb_128b_o    = '0;
  assign max_read_request_size_o    = '0;
  assign max_payload_size_o    =   '0;
  assign msix_enable_o    =   '0;
  assign msix_mask_o    =   '0;


endmodule
