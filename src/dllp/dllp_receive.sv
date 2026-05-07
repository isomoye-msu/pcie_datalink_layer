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
  import pcie_config_reg_pkg::*;
#(
    // Parameters
    parameter int DATA_WIDTH = 32,
    parameter int STRB_WIDTH = DATA_WIDTH / 8,
    parameter int KEEP_WIDTH = STRB_WIDTH,
    parameter int USER_WIDTH = 4,
    parameter int MAX_PAYLOAD_SIZE = 1,
    parameter int RX_FIFO_SIZE = 2
) (
    input  logic                               clk_i,                   // Clock signal
    input  logic                               rst_i,                   // Reset signal
    //link status signals
    input  pcie_dl_status_e                    link_status_i,
    input  logic                               phy_link_up_i,
    //phy2dllp slave axis
    input  logic            [(DATA_WIDTH)-1:0] s_axis_tdata,
    input  logic            [(KEEP_WIDTH)-1:0] s_axis_tkeep,
    input  logic                               s_axis_tvalid,
    input  logic                               s_axis_tlast,
    input  logic            [(USER_WIDTH)-1:0] s_axis_tuser,
    output logic                               s_axis_tready,
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
    // TLP cfg completion
    output logic            [(DATA_WIDTH)-1:0] m_cpl_from_cfg_tdata,
    output logic            [(KEEP_WIDTH)-1:0] m_cpl_from_cfg_tkeep,
    output logic                               m_cpl_from_cfg_tvalid,
    output logic                               m_cpl_from_cfg_tlast,
    output logic            [(USER_WIDTH)-1:0] m_cpl_from_cfg_tuser,
    input  logic                               m_cpl_from_cfg_tready,

    output logic [ 7:0] cfg_bus_number_o,
    output logic [ 4:0] cfg_device_number_o,
    output logic [ 2:0] cfg_function_number_o,
    //tlp ack/nak
    output logic [11:0] seq_num_o,
    output logic        seq_num_vld_o,
    output logic        seq_num_acknack_o,
    //flow control values
    output logic        fc1_values_stored_o,
    output logic        fc2_values_stored_o,
    output logic        first_tlp_valid_o,
    //Flow control
    output logic [ 7:0] tx_fc_ph_o,
    output logic [11:0] tx_fc_pd_o,
    output logic [ 7:0] tx_fc_nph_o,
    output logic [11:0] tx_fc_npd_o,
    output logic [ 7:0] tx_fc_cplh_o,
    output logic [11:0] tx_fc_cpld_o,
    output logic        update_fc_o
);

  localparam int UserIsTlp = 1;
  localparam int UserIsDllp = 0;
  parameter int TLP_DATA_WIDTH = 256;
  parameter int TLP_STRB_WIDTH = TLP_DATA_WIDTH / 32;
  parameter int TLP_HDR_WIDTH = 128;

  parameter int ID_ENABLE = 0;
  parameter int ID_WIDTH = 8;
  parameter int DEST_ENABLE = 0;
  parameter int DEST_WIDTH = 8;
  parameter int USER_ENABLE = 1;
  parameter int LAST_ENABLE = 1;
  parameter int ARB_TYPE_ROUND_ROBIN = 0;
  parameter int ARB_LSB_HIGH_PRIORITY = 1;
  parameter int M_COUNT = 2;
  parameter int KEEP_ENABLE = (DATA_WIDTH > 8);

  //internal signals
  logic                                     dllp_ready;
  logic                                     tlp_ready;
  logic                                     start_flow_control;
  logic                                     start_flow_control_ack;
  logic                  [            15:0] next_transmit_seq;
  logic                                     tlp_nullified;
  logic                  [             7:0] ph_credits_consumed;
  logic                  [            11:0] pd_credits_consumed;
  logic                  [             7:0] nph_credits_consumed;
  logic                  [            11:0] npd_credits_consumed;


  logic                  [(DATA_WIDTH)-1:0] tlp_axis_tdata;
  logic                  [(KEEP_WIDTH)-1:0] tlp_axis_tkeep;
  logic                                     tlp_axis_tvalid;
  logic                                     tlp_axis_tlast;
  logic                  [(USER_WIDTH)-1:0] tlp_axis_tuser;
  logic                                     tlp_axis_tready;


  logic                  [(DATA_WIDTH)-1:0] dllp_axis_tdata;
  logic                  [(KEEP_WIDTH)-1:0] dllp_axis_tkeep;
  logic                                     dllp_axis_tvalid;
  logic                                     dllp_axis_tlast;
  logic                  [(USER_WIDTH)-1:0] dllp_axis_tuser;
  logic                                     dllp_axis_tready;

  //   logic                  [  DATA_WIDTH-1:0] cpl_from_cfg_tdata;
  //   logic                  [  KEEP_WIDTH-1:0] cpl_from_cfg_tkeep;
  //   logic                                     cpl_from_cfg_tvalid;
  //   logic                                     cpl_from_cfg_tlast;
  //   logic                  [  USER_WIDTH-1:0] cpl_from_cfg_tuser;
  //   logic                                     cpl_from_cfg_tready;

  logic                  [  DATA_WIDTH-1:0] tlp_to_mac_tdata;
  logic                  [  KEEP_WIDTH-1:0] tlp_to_mac_tkeep;
  logic                                     tlp_to_mac_tvalid;
  logic                                     tlp_to_mac_tlast;
  logic                  [  USER_WIDTH-1:0] tlp_to_mac_tuser;
  logic                                     tlp_to_mac_tready;


  logic                  [  DATA_WIDTH-1:0] dllp_fc_tdata;
  logic                  [  KEEP_WIDTH-1:0] dllp_fc_tkeep;
  logic                                     dllp_fc_tvalid;
  logic                                     dllp_fc_tlast;
  logic                  [  USER_WIDTH-1:0] dllp_fc_tuser;
  logic                                     dllp_fc_tready;

  // logic                                     first_tlp_valid;

  pcie_config_reg__in_t                     hwif_in;
  pcie_config_reg__out_t                    hwif_out;


  assign hwif_in = '{default: 'd0};

  axis_user_demux #(
      .DATA_WIDTH      (DATA_WIDTH),
      .STRB_WIDTH      (STRB_WIDTH),
      .KEEP_WIDTH      (KEEP_WIDTH),
      .USER_WIDTH      (USER_WIDTH),
      .MAX_PAYLOAD_SIZE(MAX_PAYLOAD_SIZE),
      .RX_FIFO_SIZE    (RX_FIFO_SIZE)
  ) axis_user_demux_inst (
      .clk_i             (clk_i),
      .rst_i             (rst_i),
      .link_status_i     (link_status_i),
      .first_tlp_valid_o (first_tlp_valid_o),
      .s_axis_tdata      (s_axis_tdata),
      .s_axis_tkeep      (s_axis_tkeep),
      .s_axis_tvalid     (s_axis_tvalid),
      .s_axis_tlast      (s_axis_tlast),
      .s_axis_tuser      (s_axis_tuser),
      .s_axis_tready     (s_axis_tready),
      .m_tlp_axis_tdata  (tlp_axis_tdata),
      .m_tlp_axis_tkeep  (tlp_axis_tkeep),
      .m_tlp_axis_tvalid (tlp_axis_tvalid),
      .m_tlp_axis_tlast  (tlp_axis_tlast),
      .m_tlp_axis_tuser  (tlp_axis_tuser),
      .m_tlp_axis_tready (tlp_axis_tready),
      .m_dllp_axis_tdata (dllp_axis_tdata),
      .m_dllp_axis_tkeep (dllp_axis_tkeep),
      .m_dllp_axis_tvalid(dllp_axis_tvalid),
      .m_dllp_axis_tlast (dllp_axis_tlast),
      .m_dllp_axis_tuser (dllp_axis_tuser),
      .m_dllp_axis_tready(dllp_axis_tready)
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
      .s_axis_tdata       (dllp_axis_tdata),
      .s_axis_tkeep       (dllp_axis_tkeep),
      .s_axis_tvalid      (dllp_axis_tvalid),
      .s_axis_tlast       (dllp_axis_tlast),
      .s_axis_tuser       (dllp_axis_tuser),
      .s_axis_tready      (dllp_axis_tready),
      .seq_num_o          (seq_num_o),
      .seq_num_vld_o      (seq_num_vld_o),
      .seq_num_acknack_o  (seq_num_acknack_o),
      .fc1_values_stored_o(fc1_values_stored_o),
      .fc2_values_stored_o(fc2_values_stored_o),
      .tx_fc_ph_o         (tx_fc_ph_o),
      .tx_fc_pd_o         (tx_fc_pd_o),
      .tx_fc_nph_o        (tx_fc_nph_o),
      .tx_fc_npd_o        (tx_fc_npd_o),
      .tx_fc_cplh_o       (tx_fc_cplh_o),
      .tx_fc_cpld_o       (tx_fc_cpld_o),
      .update_fc_o        (update_fc_o)
  );

  //dllp flow control update module instance
  dllp_fc_update #(
      .DATA_WIDTH      (DATA_WIDTH),
      .STRB_WIDTH      (STRB_WIDTH),
      .KEEP_WIDTH      (KEEP_WIDTH),
      .USER_WIDTH      (USER_WIDTH),
      .MAX_PAYLOAD_SIZE(MAX_PAYLOAD_SIZE)
  ) dllp_fc_update_inst (
      .clk_i                   (clk_i),
      .rst_i                   (rst_i),
      .link_status_i           (link_status_i),
      .start_flow_control_i    (start_flow_control),
      .start_flow_control_ack_o(start_flow_control_ack),
      .next_transmit_seq_i     (next_transmit_seq),
      .tlp_nullified_i         (tlp_nullified),
      .ph_credits_consumed_i   (ph_credits_consumed),
      .pd_credits_consumed_i   (pd_credits_consumed),
      .nph_credits_consumed_i  (nph_credits_consumed),
      .npd_credits_consumed_i  (npd_credits_consumed),
      .m_axis_tdata            (m_axis_dllp2phy_tdata),
      .m_axis_tkeep            (m_axis_dllp2phy_tkeep),
      .m_axis_tvalid           (m_axis_dllp2phy_tvalid),
      .m_axis_tlast            (m_axis_dllp2phy_tlast),
      .m_axis_tuser            (m_axis_dllp2phy_tuser),
      .m_axis_tready           (m_axis_dllp2phy_tready)
  );

  //dllp2tlp converter
  dllp2tlp #(
      .DATA_WIDTH      (DATA_WIDTH),
      .STRB_WIDTH      (STRB_WIDTH),
      .KEEP_WIDTH      (KEEP_WIDTH),
      .USER_WIDTH      (USER_WIDTH),
      .MAX_PAYLOAD_SIZE(MAX_PAYLOAD_SIZE),
      .RX_FIFO_SIZE    (RX_FIFO_SIZE)
  ) dllp2tlp_inst (
      .clk_i                   (clk_i),
      .rst_i                   (rst_i),
      .link_status_i           (link_status_i),
      .s_axis_tdata            (tlp_axis_tdata),
      .s_axis_tkeep            (tlp_axis_tkeep),
      .s_axis_tvalid           (tlp_axis_tvalid),
      .s_axis_tlast            (tlp_axis_tlast),
      .s_axis_tuser            (tlp_axis_tuser),
      .s_axis_tready           (tlp_axis_tready),
      .start_flow_control_o    (start_flow_control),
      .start_flow_control_ack_i(start_flow_control_ack),
      .next_transmit_seq_o     (next_transmit_seq),
      .tlp_nullified_o         (tlp_nullified),
      .ph_credits_consumed_o   (ph_credits_consumed),
      .pd_credits_consumed_o   (pd_credits_consumed),
      .nph_credits_consumed_o  (nph_credits_consumed),
      .npd_credits_consumed_o  (npd_credits_consumed),
      .m_tlp_axis_tdata        (tlp_to_mac_tdata),
      .m_tlp_axis_tkeep        (tlp_to_mac_tkeep),
      .m_tlp_axis_tvalid       (tlp_to_mac_tvalid),
      .m_tlp_axis_tlast        (tlp_to_mac_tlast),
      .m_tlp_axis_tuser        (tlp_to_mac_tuser),
      .m_tlp_axis_tready       (tlp_to_mac_tready)
  );


  pcie_cfg_wrapper #(
      .DATA_WIDTH    (DATA_WIDTH),
      .STRB_WIDTH    (STRB_WIDTH),
      .KEEP_WIDTH    (KEEP_WIDTH),
      .USER_WIDTH    (USER_WIDTH),
      .TLP_DATA_WIDTH(TLP_DATA_WIDTH),
      .TLP_STRB_WIDTH(TLP_STRB_WIDTH),
      .TLP_HDR_WIDTH (TLP_HDR_WIDTH)
  ) pcie_cfg_wrapper_inst (
      .clk_i        (clk_i),
      .rst_i        (rst_i),
      .s_axis_tdata (tlp_to_mac_tdata),
      .s_axis_tkeep (tlp_to_mac_tkeep),
      .s_axis_tvalid(tlp_to_mac_tvalid),
      .s_axis_tlast (tlp_to_mac_tlast),
      .s_axis_tuser (tlp_to_mac_tuser),
      .s_axis_tready(tlp_to_mac_tready),

      .cpl_axis_tdata (m_cpl_from_cfg_tdata),
      .cpl_axis_tkeep (m_cpl_from_cfg_tkeep),
      .cpl_axis_tvalid(m_cpl_from_cfg_tvalid),
      .cpl_axis_tlast (m_cpl_from_cfg_tlast),
      .cpl_axis_tuser (m_cpl_from_cfg_tuser),
      .cpl_axis_tready(m_cpl_from_cfg_tready),

      .cfg_bus_number_o     (cfg_bus_number_o),
      .cfg_device_number_o  (cfg_device_number_o),
      .cfg_function_number_o(cfg_function_number_o),

      .m_tlp_axis_tdata (m_axis_dllp2tlp_tdata),
      .m_tlp_axis_tkeep (m_axis_dllp2tlp_tkeep),
      .m_tlp_axis_tvalid(m_axis_dllp2tlp_tvalid),
      .m_tlp_axis_tlast (m_axis_dllp2tlp_tlast),
      .m_tlp_axis_tuser (m_axis_dllp2tlp_tuser),
      .m_tlp_axis_tready(m_axis_dllp2tlp_tready),
      .hwif_in          (hwif_in),
      .hwif_out         (hwif_out)
  );


  //   axis_arb_mux #(
  //       .S_COUNT              (2),
  //       .DATA_WIDTH           (DATA_WIDTH),
  //       .KEEP_ENABLE          (KEEP_ENABLE),
  //       .KEEP_WIDTH           (KEEP_WIDTH),
  //       .ID_ENABLE            (ID_ENABLE),
  //       .S_ID_WIDTH           (ID_WIDTH),
  //       .DEST_ENABLE          (DEST_ENABLE),
  //       .DEST_WIDTH           (DEST_WIDTH),
  //       .USER_ENABLE          (USER_ENABLE),
  //       .USER_WIDTH           (USER_WIDTH),
  //       .LAST_ENABLE          (LAST_ENABLE),
  //       .ARB_TYPE_ROUND_ROBIN (ARB_TYPE_ROUND_ROBIN),
  //       .ARB_LSB_HIGH_PRIORITY(ARB_LSB_HIGH_PRIORITY)
  //   ) arbiter_mux_inst (
  //       .clk          (clk_i),
  //       .rst          (rst_i),
  //       // AXI inputs
  //       .s_axis_tdata ({cpl_from_cfg_tdata, dllp_fc_tdata}),
  //       .s_axis_tkeep ({cpl_from_cfg_tkeep, dllp_fc_tkeep}),
  //       .s_axis_tvalid({cpl_from_cfg_tvalid, dllp_fc_tvalid}),
  //       .s_axis_tready({cpl_from_cfg_tready, dllp_fc_tready}),
  //       .s_axis_tlast ({cpl_from_cfg_tlast, dllp_fc_tlast}),
  //       .s_axis_tid   (),
  //       .s_axis_tdest (),
  //       .s_axis_tuser ({cpl_from_cfg_tuser, dllp_fc_tuser}),
  //       // AXI output
  //       .m_axis_tdata (m_axis_dllp2phy_tdata),
  //       .m_axis_tkeep (m_axis_dllp2phy_tkeep),
  //       .m_axis_tvalid(m_axis_dllp2phy_tvalid),
  //       .m_axis_tready(m_axis_dllp2phy_tready),
  //       .m_axis_tlast (m_axis_dllp2phy_tlast),
  //       .m_axis_tid   (),
  //       .m_axis_tdest (),
  //       .m_axis_tuser (m_axis_dllp2phy_tuser)
  //   );
  //mux the tready input...
  // assign s_axis_tready = s_axis_tuser[UserIsDllp] ? dllp_ready :
  // s_axis_tuser[UserIsTlp] ? tlp_ready : '0;


  // the "macro" to dump signals
`ifdef COCOTB_SIM
  initial begin
    $dumpfile("dllp_receive.fst");
    $dumpvars(0, dllp_receive);
    #1;
  end
`endif

endmodule
