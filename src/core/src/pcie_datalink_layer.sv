`timescale 1ns / 1ps

//! @title pcie_datalink_layern
//! @author Idris Somoye
//
//! Implements a pcie datalink layer.
//! Module accepts TLPs in AXI-Stream format and converts them into packets to be
//! transmitted to the PHY logical layer.
//!
//!
//! Module accepts packets from the phy logical layer and either handles them as DLLPs,
//! or converts them to TLPs to be output as AXI-Stream packets
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
    parameter int MAX_PAYLOAD_SIZE = 4
) (
    input  logic                  clk_i,                    // Clock signal
    input  logic                  rst_i,                    // Reset signal
    //TLP AXIS inputs
    input  logic [DATA_WIDTH-1:0] s_axis_tlp_tdata,
    input  logic [KEEP_WIDTH-1:0] s_axis_tlp_tkeep,
    input  logic                  s_axis_tlp_tvalid,
    input  logic                  s_axis_tlp_tlast,
    input  logic [USER_WIDTH-1:0] s_axis_tlp_tuser,
    output logic                  s_axis_tlp_tready,
    //TLP AXIS output
    output logic [DATA_WIDTH-1:0] m_axis_tlp_tdata,
    output logic [KEEP_WIDTH-1:0] m_axis_tlp_tkeep,
    output logic                  m_axis_tlp_tvalid,
    output logic                  m_axis_tlp_tlast,
    output logic [USER_WIDTH-1:0] m_axis_tlp_tuser,
    input  logic                  m_axis_tlp_tready,
    //DLLP AXIS inputs
    input  logic [DATA_WIDTH-1:0] s_axis_phy_tdata,
    input  logic [KEEP_WIDTH-1:0] s_axis_phy_tkeep,
    input  logic                  s_axis_phy_tvalid,
    input  logic                  s_axis_phy_tlast,
    input  logic [USER_WIDTH-1:0] s_axis_phy_tuser,
    output logic                  s_axis_phy_tready,
    //PHY -> DLLP AXIS output
    output logic [DATA_WIDTH-1:0] m_axis_phy_tdata,
    output logic [KEEP_WIDTH-1:0] m_axis_phy_tkeep,
    output logic                  m_axis_phy_tvalid,
    output logic                  m_axis_phy_tlast,
    output logic [USER_WIDTH-1:0] m_axis_phy_tuser,
    input  logic                  m_axis_phy_tready,
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
  logic            [(DATA_WIDTH)-1:0] phy_fc_axis_tdata;
  logic            [(KEEP_WIDTH)-1:0] phy_fc_axis_tkeep;
  logic                               phy_fc_axis_tvalid;
  logic                               phy_fc_axis_tlast;
  logic            [  USER_WIDTH-1:0] phy_fc_axis_tuser;
  logic                               phy_fc_axis_tready;


  //DLLP AXIS output
  logic            [(DATA_WIDTH)-1:0] phy_rx_axis_tdata;
  logic            [(KEEP_WIDTH)-1:0] phy_rx_axis_tkeep;
  logic                               phy_rx_axis_tvalid;
  logic                               phy_rx_axis_tlast;
  logic            [  USER_WIDTH-1:0] phy_rx_axis_tuser;
  logic                               phy_rx_axis_tready;


  //TLP AXIS output
  logic            [(DATA_WIDTH)-1:0] phy_tlp_axis_tdata;
  logic            [(KEEP_WIDTH)-1:0] phy_tlp_axis_tkeep;
  logic                               phy_tlp_axis_tvalid;
  logic                               phy_tlp_axis_tlast;
  logic            [  USER_WIDTH-1:0] phy_tlp_axis_tuser;
  logic                               phy_tlp_axis_tready;

  //tlp ack/nak
  logic            [            11:0] seq_num;
  logic                               seq_num_vld;
  logic                               seq_num_acknack;
  //flow control
  logic            [             7:0] tx_fc_ph;
  logic            [            11:0] tx_fc_pd;
  logic            [             7:0] tx_fc_nph;
  logic            [            11:0] tx_fc_npd;
  logic                               init_ack;
  logic                               ack_nack;
  logic                               ack_nack_vld;
  logic                               ack_seq_num;


  //Ports
  logic                               init_flow_control;
  logic                               soft_reset;
  logic                               fc1_values_stored;
  logic                               fc2_values_stored;


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
      .m_axis_tdata(phy_fc_axis_tdata),
      .m_axis_tkeep(phy_fc_axis_tkeep),
      .m_axis_tvalid(phy_fc_axis_tvalid),
      .m_axis_tlast(phy_fc_axis_tlast),
      .m_axis_tuser(phy_fc_axis_tuser),
      .m_axis_tready(phy_fc_axis_tready),
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
      .s_axis_tdata(s_axis_tlp_tdata),
      .s_axis_tkeep(s_axis_tlp_tkeep),
      .s_axis_tvalid(s_axis_tlp_tvalid),
      .s_axis_tlast(s_axis_tlp_tlast),
      .s_axis_tuser(s_axis_tlp_tuser),
      .s_axis_tready(s_axis_tlp_tready),
      .m_axis_tdata(phy_tlp_axis_tdata),
      .m_axis_tkeep(phy_tlp_axis_tkeep),
      .m_axis_tvalid(phy_tlp_axis_tvalid),
      .m_axis_tlast(phy_tlp_axis_tlast),
      .m_axis_tuser(phy_tlp_axis_tuser),
      .m_axis_tready(phy_tlp_axis_tready),
      .ack_nack_i(seq_num_acknack),
      .ack_nack_vld_i(seq_num_vld),
      .ack_seq_num_i(seq_num),
      .tx_fc_ph_i(tx_fc_ph),
      .tx_fc_pd_i(tx_fc_pd),
      .tx_fc_nph_i(tx_fc_nph),
      .tx_fc_npd_i(tx_fc_npd)
  );


  //dllp recieve
  dllp_receive #(
      .DATA_WIDTH(DATA_WIDTH),
      .STRB_WIDTH(STRB_WIDTH),
      .KEEP_WIDTH(KEEP_WIDTH),
      .USER_WIDTH(USER_WIDTH),
      .MAX_PAYLOAD_SIZE(MAX_PAYLOAD_SIZE),
      .RX_FIFO_SIZE(RX_FIFO_SIZE)
  ) dllp_receive_inst (
      .clk_i                 (clk_i),
      .rst_i                 (rst_i || soft_reset),
      .link_status_i         (link_status),
      .phy_link_up_i         (phy_link_up_i),
      .s_axis_tdata          (s_axis_phy_tdata),
      .s_axis_tkeep          (s_axis_phy_tkeep),
      .s_axis_tvalid         (s_axis_phy_tvalid),
      .s_axis_tlast          (s_axis_phy_tlast),
      .s_axis_tuser          (s_axis_phy_tuser),
      .s_axis_tready         (s_axis_phy_tready),
      .m_axis_dllp2tlp_tdata (m_axis_tlp_tdata),
      .m_axis_dllp2tlp_tkeep (m_axis_tlp_tkeep),
      .m_axis_dllp2tlp_tvalid(m_axis_tlp_tvalid),
      .m_axis_dllp2tlp_tlast (m_axis_tlp_tlast),
      .m_axis_dllp2tlp_tuser (m_axis_tlp_tuser),
      .m_axis_dllp2tlp_tready(m_axis_tlp_tready),
      .m_axis_dllp2phy_tdata (phy_rx_axis_tdata),
      .m_axis_dllp2phy_tkeep (phy_rx_axis_tkeep),
      .m_axis_dllp2phy_tvalid(phy_rx_axis_tvalid),
      .m_axis_dllp2phy_tlast (phy_rx_axis_tlast),
      .m_axis_dllp2phy_tuser (phy_rx_axis_tuser),
      .m_axis_dllp2phy_tready(phy_rx_axis_tready),
      .seq_num_o             (seq_num),
      .seq_num_vld_o         (seq_num_vld),
      .seq_num_acknack_o     (seq_num_acknack),
      .fc1_values_stored_o   (fc1_values_stored),
      .fc2_values_stored_o   (fc2_values_stored),
      .tx_fc_ph_o            (tx_fc_ph),
      .tx_fc_pd_o            (tx_fc_pd),
      .tx_fc_nph_o           (tx_fc_nph),
      .tx_fc_npd_o           (tx_fc_npd)
  );


  axis_arb_mux #(
      .S_COUNT(3),
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
      .s_axis_tdata({phy_rx_axis_tdata, phy_fc_axis_tdata, phy_tlp_axis_tdata}),
      .s_axis_tkeep({phy_rx_axis_tkeep, phy_fc_axis_tkeep, phy_tlp_axis_tkeep}),
      .s_axis_tvalid({phy_rx_axis_tvalid, phy_fc_axis_tvalid, phy_tlp_axis_tvalid}),
      .s_axis_tready({phy_rx_axis_tready, phy_fc_axis_tready, phy_tlp_axis_tready}),
      .s_axis_tlast({phy_rx_axis_tlast, phy_fc_axis_tlast, phy_tlp_axis_tlast}),
      .s_axis_tid(),
      .s_axis_tdest(),
      .s_axis_tuser({phy_rx_axis_tuser, phy_fc_axis_tuser, phy_tlp_axis_tuser}),
      // AXI output
      .m_axis_tdata(m_axis_phy_tdata),
      .m_axis_tkeep(m_axis_phy_tkeep),
      .m_axis_tvalid(m_axis_phy_tvalid),
      .m_axis_tready(m_axis_phy_tready),
      .m_axis_tlast(m_axis_phy_tlast),
      .m_axis_tid(),
      .m_axis_tdest(),
      .m_axis_tuser(m_axis_phy_tuser)
  );

  assign bus_num_o    = '0;
  assign ext_tag_enable_o    = '0;
  assign rcb_128b_o    = '0;
  assign max_read_request_size_o    = '0;
  assign max_payload_size_o    =   '0;
  assign msix_enable_o    =   '0;
  assign msix_mask_o    =   '0;


endmodule
