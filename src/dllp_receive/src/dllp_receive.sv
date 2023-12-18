//! @title dllp_receive
//! @author Idris Somoye
//! Module handles datalink packets recieved from the physical layer.
//! It incorporates two axis slave interfaces, one indicating packets
//! intended for the tlp layer and the other for packets intended for the
//! dllp layer.
//!
//! Packets intended for the tlp layer are decoded and sent through the tlp
//! master axis bus. Datalink packets are decoded and replies are sent to
//! the physical layer through the phy master axis bus.
module dllp_receive
  import pcie_datalink_pkg::*;
#(
    // Parameters
    parameter int DATA_WIDTH = 32,
    parameter int STRB_WIDTH = DATA_WIDTH / 8,
    parameter int KEEP_WIDTH = STRB_WIDTH,
    parameter int USER_WIDTH = 4,
    parameter int MAX_PAYLOAD_SIZE = 0,
    parameter int RX_FIFO_SIZE = 0
) (
    input  logic                               clk_i,                   // Clock signal
    input  logic                               rst_i,                   // Reset signal
    //link status signals
    input  pcie_dl_status_e                    link_status_i,
    input  logic                               phy_link_up_i,
    //phy2tlp slave axis
    input  logic            [(DATA_WIDTH)-1:0] s_axis_phy2tlp_tdata,
    input  logic            [(KEEP_WIDTH)-1:0] s_axis_phy2tlp_tkeep,
    input  logic                               s_axis_phy2tlp_tvalid,
    input  logic                               s_axis_phy2tlp_tlast,
    input  logic            [(USER_WIDTH)-1:0] s_axis_phy2tlp_tuser,
    output logic                               s_axis_phy2tlp_tready,
    //phy2tlp slave axis
    input  logic            [(DATA_WIDTH)-1:0] s_axis_phy2dllp_tdata,
    input  logic            [(KEEP_WIDTH)-1:0] s_axis_phy2dllp_tkeep,
    input  logic                               s_axis_phy2dllp_tvalid,
    input  logic                               s_axis_phy2dllp_tlast,
    input  logic            [(USER_WIDTH)-1:0] s_axis_phy2dllp_tuser,
    output logic                               s_axis_phy2dllp_tready,
    // TLP dllp2tlp output
    output logic            [(DATA_WIDTH)-1:0] m_axis_dllp2tlp_tdata,
    output logic            [(KEEP_WIDTH)-1:0] m_axis_dllp2tlp_tkeep,
    output logic                               m_axis_dllp2tlp_tvalid,
    output logic                               m_axis_dllp2tlp_tlast,
    output logic            [(USER_WIDTH)-1:0] m_axis_dllp2tlp_tuser,
    input  logic                               m_axis_dllp2tlp_tready,
    // TLP dllp2tlp output
    output logic            [(DATA_WIDTH)-1:0] m_axis_dllp2phy_tdata,
    output logic            [(KEEP_WIDTH)-1:0] m_axis_dllp2phy_tkeep,
    output logic                               m_axis_dllp2phy_tvalid,
    output logic                               m_axis_dllp2phy_tlast,
    output logic            [(USER_WIDTH)-1:0] m_axis_dllp2phy_tuser,
    input  logic                               m_axis_dllp2phy_tready,
    //tlp ack/nak
    output logic            [            11:0] seq_num_o,
    output logic                               seq_num_vld_o,
    output logic                               seq_num_acknack_o,
    //flow control values
    output logic                               fc1_values_stored_o,
    output logic                               fc2_values_stored_o,
    //Flow control
    output logic            [             7:0] tx_fc_ph_o,
    output logic            [            11:0] tx_fc_pd_o,
    output logic            [             7:0] tx_fc_nph_o,
    output logic            [            11:0] tx_fc_npd_o
);

  //dllp handler instance
  dllp_handler #(
      .DATA_WIDTH(DATA_WIDTH),
      .STRB_WIDTH(STRB_WIDTH),
      .KEEP_WIDTH(KEEP_WIDTH),
      .USER_WIDTH(USER_WIDTH)
  ) dllp_handler_inst (
      .clk_i              (clk_i),
      .rst_i              (rst_i),
      .phy_link_up_i      (phy_link_up_i),
      .s_axis_tdata       (s_axis_phy2dllp_tdata),
      .s_axis_tkeep       (s_axis_phy2dllp_tkeep),
      .s_axis_tvalid      (s_axis_phy2dllp_tvalid),
      .s_axis_tlast       (s_axis_phy2dllp_tlast),
      .s_axis_tuser       (s_axis_phy2dllp_tuser),
      .s_axis_tready      (s_axis_phy2dllp_tready),
      .seq_num_o          (seq_num_o),
      .seq_num_vld_o      (seq_num_vld_o),
      .seq_num_acknack_o  (seq_num_acknack_o),
      .fc1_values_stored_o(fc1_values_stored_o),
      .fc2_values_stored_o(fc2_values_stored_o),
      .tx_fc_ph_o         (tx_fc_ph_o),
      .tx_fc_pd_o         (tx_fc_pd_o),
      .tx_fc_nph_o        (tx_fc_nph_o),
      .tx_fc_npd_o        (tx_fc_npd_o)
  );

  //dllp2tlp converter
  dllp2tlp #(
      .DATA_WIDTH(DATA_WIDTH),
      .STRB_WIDTH(STRB_WIDTH),
      .KEEP_WIDTH(KEEP_WIDTH),
      .USER_WIDTH(USER_WIDTH),
      .MAX_PAYLOAD_SIZE(MAX_PAYLOAD_SIZE),
      .RX_FIFO_SIZE(RX_FIFO_SIZE)
  ) dllp2tlp_inst (
      .clk_i                 (clk_i),
      .rst_i                 (rst_i),
      .link_status_i         (link_status_i),
      .s_axis_tdata          (s_axis_phy2tlp_tdata),
      .s_axis_tkeep          (s_axis_phy2tlp_tkeep),
      .s_axis_tvalid         (s_axis_phy2tlp_tvalid),
      .s_axis_tlast          (s_axis_phy2tlp_tlast),
      .s_axis_tuser          (s_axis_phy2tlp_tuser),
      .s_axis_tready         (s_axis_phy2tlp_tready),
      .m_axis_dllp2phy_tdata (m_axis_dllp2phy_tdata),
      .m_axis_dllp2phy_tkeep (m_axis_dllp2phy_tkeep),
      .m_axis_dllp2phy_tvalid(m_axis_dllp2phy_tvalid),
      .m_axis_dllp2phy_tlast (m_axis_dllp2phy_tlast),
      .m_axis_dllp2phy_tuser (m_axis_dllp2phy_tuser),
      .m_axis_dllp2phy_tready(m_axis_dllp2phy_tready),
      .m_axis_dllp2tlp_tdata (m_axis_dllp2tlp_tdata),
      .m_axis_dllp2tlp_tkeep (m_axis_dllp2tlp_tkeep),
      .m_axis_dllp2tlp_tvalid(m_axis_dllp2tlp_tvalid),
      .m_axis_dllp2tlp_tlast (m_axis_dllp2tlp_tlast),
      .m_axis_dllp2tlp_tuser (m_axis_dllp2tlp_tuser),
      .m_axis_dllp2tlp_tready(m_axis_dllp2tlp_tready)
  );

  // the "macro" to dump signals
`ifdef COCOTB_SIM
  initial begin
    $dumpfile("dllp_receive.fst");
    $dumpvars(0, dllp_receive);
    #1;
  end
`endif

endmodule
