
module pcie_phy_top
  import pcie_phy_pkg::*;
#(
    parameter int CLK_RATE      = 100,             //!Clock speed in MHz, Defualt is 100
    parameter int MAX_NUM_LANES = 1,               //! Maximum number of lanes module can support
    // TLP data width
    parameter int DATA_WIDTH    = 32,              //! AXIS data width
    // TLP strobe width
    parameter int STRB_WIDTH    = DATA_WIDTH / 8,
    parameter int KEEP_WIDTH    = STRB_WIDTH,
    parameter int USER_WIDTH    = 5,
    // TLP keep width
    parameter int IS_ROOT_PORT  = 1,
    parameter int LINK_NUM      = 0,
    parameter int IS_UPSTREAM   = 0,               //downstream by default
    parameter int CROSSLINK_EN  = 0,               //crosslink not supported
    parameter int UPCONFIG_EN   = 0                //upconfig not supported
) (
    input  logic                                    clk_i,                 //! 100MHz clock signal
    input  logic                                    rst_i,                 //! Reset signal
    input  logic                                    en_i,
    input  logic                                    pipe_rx_usr_clk_i,
    input  logic                                    pipe_tx_usr_clk_i,
    // input  logic [                             5:0] num_active_lanes_i,
    // input  logic [               MAX_NUM_LANES-1:0] lane_active_i,
    // input  logic [               MAX_NUM_LANES-1:0] lane_status_i,
    output logic                                    fc_initialized_o,
    //pipe interface output
    output logic [( MAX_NUM_LANES* DATA_WIDTH)-1:0] phy_txdata,
    output logic [               MAX_NUM_LANES-1:0] phy_txdata_valid,
    output logic [           (4*MAX_NUM_LANES)-1:0] phy_txdatak,
    output logic [               MAX_NUM_LANES-1:0] phy_txstart_block,
    output logic [           (2*MAX_NUM_LANES)-1:0] phy_txsync_header,
    //pipe interface input
    input  logic [( MAX_NUM_LANES* DATA_WIDTH)-1:0] phy_rxdata,
    input  logic [               MAX_NUM_LANES-1:0] phy_rxdata_valid,
    input  logic [           (4*MAX_NUM_LANES)-1:0] phy_rxdatak,
    input  logic [               MAX_NUM_LANES-1:0] phy_rxstart_block,
    input  logic [           (2*MAX_NUM_LANES)-1:0] phy_rxsync_header,
    // PHY Command
    output wire                                     phy_txdetectrx,
    output wire  [               MAX_NUM_LANES-1:0] phy_txelecidle,
    output wire  [               MAX_NUM_LANES-1:0] phy_txcompliance,
    output wire  [               MAX_NUM_LANES-1:0] phy_rxpolarity,
    output wire  [                             1:0] phy_powerdown,
    output wire  [                             2:0] phy_rate,
    // PHY Status
    input  wire  [               MAX_NUM_LANES-1:0] phy_rxvalid,
    input  wire  [               MAX_NUM_LANES-1:0] phy_phystatus,
    input  wire                                     phy_phystatus_rst,
    input  wire  [               MAX_NUM_LANES-1:0] phy_rxelecidle,
    input  wire  [           (MAX_NUM_LANES*3)-1:0] phy_rxstatus,
    // TX Driver
    output wire  [                             2:0] phy_txmargin,
    output wire                                     phy_txswing,
    output wire                                     phy_txdeemph,
    // TX Equalization (Gen3/4)
    output wire  [           (MAX_NUM_LANES*2)-1:0] phy_txeq_ctrl,
    output wire  [           (MAX_NUM_LANES*4)-1:0] phy_txeq_preset,
    output wire  [           (MAX_NUM_LANES*6)-1:0] phy_txeq_coeff,
    input  wire  [                             5:0] phy_txeq_fs,
    input  wire  [                             5:0] phy_txeq_lf,
    input  wire  [          (MAX_NUM_LANES*18)-1:0] phy_txeq_new_coeff,
    input  wire  [               MAX_NUM_LANES-1:0] phy_txeq_done,
    // RX Equalization (Gen3/4)
    output wire  [           (MAX_NUM_LANES*2)-1:0] phy_rxeq_ctrl,
    output wire  [           (MAX_NUM_LANES*4)-1:0] phy_rxeq_txpreset,
    input  wire  [               MAX_NUM_LANES-1:0] phy_rxeq_preset_sel,
    input  wire  [          (MAX_NUM_LANES*18)-1:0] phy_rxeq_new_txcoeff,
    input  wire  [               MAX_NUM_LANES-1:0] phy_rxeq_adapt_done,
    input  wire  [               MAX_NUM_LANES-1:0] phy_rxeq_done,
    output wire  [                           8-1:0] pipe_width_o,
    //detect phy signals
    output reg                                      as_mac_in_detect,
    output reg                                      as_cdr_hold_req,

    // Debug output

    (* mark_debug *) output wire [7:0] debug_state,

    // Bringup Control Inputs
    (* mark_debug *) input wire tx_elec_idle,
    (* mark_debug *) input wire phy_ready_en,


    output logic link_up_o,


    //TLP AXIS inputs
    input  logic [DATA_WIDTH-1:0] s_tlp_axis_tdata,
    input  logic [KEEP_WIDTH-1:0] s_tlp_axis_tkeep,
    input  logic                  s_tlp_axis_tvalid,
    input  logic                  s_tlp_axis_tlast,
    input  logic [USER_WIDTH-1:0] s_tlp_axis_tuser,
    output logic                  s_tlp_axis_tready,
    //TLP AXIS output
    output logic [DATA_WIDTH-1:0] m_tlp_axis_tdata,
    output logic [KEEP_WIDTH-1:0] m_tlp_axis_tkeep,
    output logic                  m_tlp_axis_tvalid,
    output logic                  m_tlp_axis_tlast,
    output logic [USER_WIDTH-1:0] m_tlp_axis_tuser,
    input  logic                  m_tlp_axis_tready
);


  parameter int RX_FIFO_SIZE = 3;
  parameter int RETRY_TLP_SIZE = 3;
  parameter int MAX_PAYLOAD_SIZE = 256;


  logic                                      link_up;
  ts_symbol6_union_t [    MAX_NUM_LANES-1:0] symbol6;
  logic              [(MAX_NUM_LANES*8)-1:0] lane_number;
  logic              [(MAX_NUM_LANES*8)-1:0] link_number;
  logic              [    MAX_NUM_LANES-1:0] ts1_valid;
  logic              [    MAX_NUM_LANES-1:0] ts2_valid;
  logic              [    MAX_NUM_LANES-1:0] idle_valid;
  training_ctrl_t    [    MAX_NUM_LANES-1:0] training_ctrl;
  rate_speed_e                               curr_data_rate;
  pcie_ordered_set_t                         ordered_set;
  logic                                      ordered_set_tranmitted;
  logic                                      send_ordered_set;
  rate_id_t          [    MAX_NUM_LANES-1:0] rate_id;
  logic              [                  5:0] pipe_width;
  logic              [                  5:0] num_active_lanes_i;

  assign pipe_width_o = pipe_width;
  // assign phy_txelecidle = '0;


  pcie_ordered_set_t [MAX_NUM_LANES-1:0] rx_ordered_set;
  logic              [   DATA_WIDTH-1:0] m_dllp_axis_tdata;
  logic              [   KEEP_WIDTH-1:0] m_dllp_axis_tkeep;
  logic                                  m_dllp_axis_tvalid;
  logic                                  m_dllp_axis_tlast;
  logic              [   USER_WIDTH-1:0] m_dllp_axis_tuser;
  logic                                  m_dllp_axis_tready;


  logic              [   DATA_WIDTH-1:0] s_dllp_axis_tdata;
  logic              [   KEEP_WIDTH-1:0] s_dllp_axis_tkeep;
  logic                                  s_dllp_axis_tvalid;
  logic                                  s_dllp_axis_tlast;
  logic              [   USER_WIDTH-1:0] s_dllp_axis_tuser;
  logic                                  s_dllp_axis_tready;
  gen_os_struct_t                        gen_os_ctrl;
  logic              [MAX_NUM_LANES-1:0] active_lanes;
  logic              [MAX_NUM_LANES-1:0] lane_status;

  assign phy_rate  = curr_data_rate - 1'b1;
  // assign phy_powerdown = '0;
  assign link_up_o = link_up;

  always_ff @(posedge pipe_rx_usr_clk_i) begin
    if (rst_i || phy_phystatus_rst) begin
      lane_status        <= '0;
      num_active_lanes_i <= '0;
    end else begin
      for (int i = 0; i < MAX_NUM_LANES; i++) begin
        if (phy_phystatus[i] && phy_rxstatus[i*3+:3] == 3'b011) begin
          lane_status[i] <= '1;
        end
      end
      for (int i = 0; i < MAX_NUM_LANES; i++) begin
        if (lane_status[i]) begin
          num_active_lanes_i <= i + 1;
        end
      end
      // num_active_lanes_i
    end
  end

  phy_receive #(
      .CLK_RATE     (CLK_RATE),
      .MAX_NUM_LANES(MAX_NUM_LANES),
      .DATA_WIDTH   (DATA_WIDTH),
      .STRB_WIDTH   (STRB_WIDTH),
      .KEEP_WIDTH   (KEEP_WIDTH),
      .USER_WIDTH   (USER_WIDTH)
  ) phy_receive_inst (
      .clk_i             (clk_i),
      .rst_i             (rst_i || phy_phystatus_rst),
      .pipe_rx_usr_clk_i (pipe_rx_usr_clk_i),
      .en_i              (en_i),
      .link_up_i         (link_up),
      .pipe_data_i       (phy_rxdata),
      .pipe_data_valid_i (phy_rxdata_valid),
      .pipe_data_k_i     (phy_rxdatak),
      .pipe_sync_header_i(phy_rxsync_header),
      .pipe_block_start_i(phy_rxstart_block),
      .pipe_width_i      (pipe_width),
      .num_active_lanes_i(num_active_lanes_i),
      .ts1_valid_o       (ts1_valid),
      .ts2_valid_o       (ts2_valid),
      .idle_valid_o      (idle_valid),
      .ordered_set_o     (rx_ordered_set),
      .curr_data_rate_i  (curr_data_rate),
      .m_dllp_axis_tdata (m_dllp_axis_tdata),
      .m_dllp_axis_tkeep (m_dllp_axis_tkeep),
      .m_dllp_axis_tvalid(m_dllp_axis_tvalid),
      .m_dllp_axis_tlast (m_dllp_axis_tlast),
      .m_dllp_axis_tuser (m_dllp_axis_tuser),
      .m_dllp_axis_tready(m_dllp_axis_tready)
  );


  phy_transmit #(
      .CLK_RATE     (CLK_RATE),
      .MAX_NUM_LANES(MAX_NUM_LANES),
      .DATA_WIDTH   (DATA_WIDTH),
      .STRB_WIDTH   (STRB_WIDTH),
      .KEEP_WIDTH   (KEEP_WIDTH),
      .USER_WIDTH   (USER_WIDTH)
  ) phy_transmit_inst (
      .clk_i                   (clk_i),
      .pipe_rx_usr_clk_i       (pipe_rx_usr_clk_i),
      .pipe_tx_usr_clk_i       (pipe_tx_usr_clk_i),
      .rst_i                   (rst_i || phy_phystatus_rst),
      .en_i                    (en_i),
      .link_up_i               (link_up),
      .pipe_data_o             (phy_txdata),
      .pipe_data_valid_o       (phy_txdata_valid),
      .pipe_data_k_o           (phy_txdatak),
      .pipe_sync_header_o      (phy_txsync_header),
      .pipe_txstart_block_o    (phy_txstart_block),
      .pipe_width_o            (pipe_width),
      .gen_os_ctrl_i           (gen_os_ctrl),
      //   .num_active_lanes_o(num_active_lanes_o),
      .num_active_lanes_i      (num_active_lanes_i),
      .send_ordered_set_i      (send_ordered_set),
      .ordered_set_i           (ordered_set),
      .curr_data_rate_i        (curr_data_rate),
      .ordered_set_tranmitted_o(ordered_set_tranmitted),
      .s_dllp_axis_tdata       (s_dllp_axis_tdata),
      .s_dllp_axis_tkeep       (s_dllp_axis_tkeep),
      .s_dllp_axis_tvalid      (s_dllp_axis_tvalid),
      .s_dllp_axis_tlast       (s_dllp_axis_tlast),
      .s_dllp_axis_tuser       (s_dllp_axis_tuser),
      .s_dllp_axis_tready      (s_dllp_axis_tready)
  );


  pcie_ltssm_downstream #(
      .CLK_RATE     (CLK_RATE),
      .MAX_NUM_LANES(MAX_NUM_LANES),
      .DATA_WIDTH   (DATA_WIDTH),
      .KEEP_WIDTH   (KEEP_WIDTH),
      .USER_WIDTH   (USER_WIDTH)
  ) pcie_ltssm_downstream_inst (
      .clk_i              (pipe_rx_usr_clk_i),
      .rst_i              (rst_i || phy_phystatus_rst),
      .en_i               (en_i),
      .link_up_o          (link_up),
      .is_timeout_i       (),
      .recovery_i         (),
      .error_o            (),
      .success_o          (),
      .error_loopback_o   (),
      .error_disable_o    (),
      .ts1_valid_i        (ts1_valid),
      .ts2_valid_i        (ts2_valid),
      .idle_valid_i       (idle_valid),
      .phy_rxstatus_i     (phy_rxstatus),
      .phy_phystatus_i    (phy_phystatus),
      .phy_phystatus_rst_i(phy_phystatus_rst),
      .phy_txdetectrx_o   (phy_txdetectrx),
      .active_lanes_o     (active_lanes),
      .phy_txelecidle_o   (phy_txelecidle),
      .phy_txdeemph_o     (phy_txdeemph),
      .phy_powerdown_o    (phy_powerdown),
      .phy_txcompliance_o (phy_txcompliance),
      .phy_rxpolarity_o   (phy_rxpolarity),
      .phy_txmargin_o     (phy_txmargin),

      //   .lane_active_i(lane_active_i),
      .lanes_ts2_satisfied_i   (),
      .config_copmlete_ts2_i   (),
      .from_l0_i               (),
      .receiver_detected_i     (lane_status),
      .phy_rxelecidle_i        (phy_rxelecidle),
      .tx_enter_elec_idle_o    (),
      .goto_cfg_o              (),
      .goto_detect_o           (),
      .gen_os_ctrl_o           (gen_os_ctrl),
      .preset_coeff_o          (),
      //   .rate_id_i(rate_id),
      .extended_synch_i        (),
      .directed_speed_change_i ('0),
      .lane_status_i           (lane_status),
      .curr_data_rate_o        (curr_data_rate),
      .data_rate_o             (),
      .ltssm_state_o           (),
      //   .gen_os_o(ordered_set),
      .ordered_set_i           (rx_ordered_set),
      .ordered_set_tranmitted_i(ordered_set_tranmitted),
      .ordered_set_o           (ordered_set),
      .send_ordered_set_o      (send_ordered_set),
      .changed_speed_recovery_o()
  );

  pcie_datalink_layer #(
      .DATA_WIDTH      (DATA_WIDTH),
      .STRB_WIDTH      (STRB_WIDTH),
      .KEEP_WIDTH      (KEEP_WIDTH),
      .USER_WIDTH      (USER_WIDTH),
      .RX_FIFO_SIZE    (RX_FIFO_SIZE),
      .RETRY_TLP_SIZE  (RETRY_TLP_SIZE),
      .MAX_PAYLOAD_SIZE(MAX_PAYLOAD_SIZE)
  ) pcie_datalink_layer_inst (
      .clk_i                  (clk_i),
      .rst_i                  (rst_i),
      .s_tlp_axis_tdata       (s_tlp_axis_tdata),
      .s_tlp_axis_tkeep       (s_tlp_axis_tkeep),
      .s_tlp_axis_tvalid      (s_tlp_axis_tvalid),
      .s_tlp_axis_tlast       (s_tlp_axis_tlast),
      .s_tlp_axis_tuser       (s_tlp_axis_tuser),
      .s_tlp_axis_tready      (s_tlp_axis_tready),
      .m_tlp_axis_tdata       (m_tlp_axis_tdata),
      .m_tlp_axis_tkeep       (m_tlp_axis_tkeep),
      .m_tlp_axis_tvalid      (m_tlp_axis_tvalid),
      .m_tlp_axis_tlast       (m_tlp_axis_tlast),
      .m_tlp_axis_tuser       (m_tlp_axis_tuser),
      .m_tlp_axis_tready      (m_tlp_axis_tready),
      .s_phy_axis_tdata       (m_dllp_axis_tdata),
      .s_phy_axis_tkeep       (m_dllp_axis_tkeep),
      .s_phy_axis_tvalid      (m_dllp_axis_tvalid),
      .s_phy_axis_tlast       (m_dllp_axis_tlast),
      .s_phy_axis_tuser       (m_dllp_axis_tuser),
      .s_phy_axis_tready      (m_dllp_axis_tready),
      .m_phy_axis_tdata       (s_dllp_axis_tdata),
      .m_phy_axis_tkeep       (s_dllp_axis_tkeep),
      .m_phy_axis_tvalid      (s_dllp_axis_tvalid),
      .m_phy_axis_tlast       (s_dllp_axis_tlast),
      .m_phy_axis_tuser       (s_dllp_axis_tuser),
      .m_phy_axis_tready      (s_dllp_axis_tready),
      .phy_link_up_i          (link_up),
      .fc_initialized_o       (fc_initialized_o),
      .idle_valid_i(idle_valid),
      .bus_num_o              (),
      .ext_tag_enable_o       (),
      .rcb_128b_o             (),
      .max_read_request_size_o(),
      .max_payload_size_o     (),
      .msix_enable_o          (),
      .msix_mask_o            (),
      .status_error_cor_i     (),
      .status_error_uncor_i   (),
      .rx_cpl_stall_i         ()
  );

endmodule
