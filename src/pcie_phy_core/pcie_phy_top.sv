
module pcie_phy_top
  import pcie_phy_pkg::*;
#(
    parameter int CLK_RATE      = 100,             //!Clock speed in MHz, Defualt is 100
    parameter int PHY_CLK_RATE = 250,             //! PHY Clock speed in MHz, Default is 250 for Gen1/Gen2 and 250/4 for Gen3;
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
    input  logic                                    clk_i,              //! 100MHz clock signal
    input  logic                                    rst_i,              //! Reset signal
    input  logic                                    en_i,
    input  logic                                    pipe_rx_usr_clk_i,
    input  logic                                    pipe_tx_usr_clk_i,
    // input  logic [                             5:0] num_active_lanes_i,
    // input  logic [               MAX_NUM_LANES-1:0] lane_active_i,
    // input  logic [               MAX_NUM_LANES-1:0] lane_status_i,
    output logic                                    fc_initialized_o,
    //pipe interface output
    (* syn_keep = "true", mark_debug = "true" *) output logic [( MAX_NUM_LANES* DATA_WIDTH)-1:0] phy_txdata,
    (* syn_keep = "true", mark_debug = "true" *) output logic [               MAX_NUM_LANES-1:0] phy_txdata_valid,
    (* syn_keep = "true", mark_debug = "true" *) output logic [           (4*MAX_NUM_LANES)-1:0] phy_txdatak,
    (* syn_keep = "true", mark_debug = "true" *) output logic [               MAX_NUM_LANES-1:0] phy_txstart_block,
    (* syn_keep = "true", mark_debug = "true" *) output logic [           (2*MAX_NUM_LANES)-1:0] phy_txsync_header,
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
    (* syn_keep = "true", mark_debug = "true" *) input  wire [     MAX_NUM_LANES-1:0] phy_rxvalid,
    (* syn_keep = "true", mark_debug = "true" *) input  wire [     MAX_NUM_LANES-1:0] phy_phystatus,
    (* syn_keep = "true", mark_debug = "true" *) input  wire                          phy_phystatus_rst,
    (* syn_keep = "true", mark_debug = "true" *) input  wire [     MAX_NUM_LANES-1:0] phy_rxelecidle,
    (* syn_keep = "true", mark_debug = "true" *) input  wire [ (MAX_NUM_LANES*3)-1:0] phy_rxstatus,
    // TX Driver
    output wire [                   2:0] phy_txmargin,
    output wire                          phy_txswing,
    output wire                          phy_txdeemph,
    // TX Equalization (Gen3/4)
    output wire [ (MAX_NUM_LANES*2)-1:0] phy_txeq_ctrl,
    output wire [ (MAX_NUM_LANES*4)-1:0] phy_txeq_preset,
    output wire [ (MAX_NUM_LANES*6)-1:0] phy_txeq_coeff,
    input  wire [                   5:0] phy_txeq_fs,
    input  wire [                   5:0] phy_txeq_lf,
    input  wire [(MAX_NUM_LANES*18)-1:0] phy_txeq_new_coeff,
    input  wire [     MAX_NUM_LANES-1:0] phy_txeq_done,
    // RX Equalization (Gen3/4)
    output wire [ (MAX_NUM_LANES*2)-1:0] phy_rxeq_ctrl,
    output wire [ (MAX_NUM_LANES*4)-1:0] phy_rxeq_txpreset,
    input  wire [     MAX_NUM_LANES-1:0] phy_rxeq_preset_sel,
    input  wire [(MAX_NUM_LANES*18)-1:0] phy_rxeq_new_txcoeff,
    input  wire [     MAX_NUM_LANES-1:0] phy_rxeq_adapt_done,
    input  wire [     MAX_NUM_LANES-1:0] phy_rxeq_done,
    output wire [                 8-1:0] pipe_width_o,


    output logic [7:0] cfg_bus_number_o,
    output logic [4:0] cfg_device_number_o,
    output logic [2:0] cfg_function_number_o,

    //detect phy signals
    output reg as_mac_in_detect,
    output reg as_cdr_hold_req,

    // Debug output

    (* mark_debug *) output wire [20:0] ltssm_debug_state,

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


  parameter int DEPTH = 6;
  parameter int ID_ENABLE = 0;
  parameter int ID_WIDTH = 8;
  parameter int DEST_ENABLE = 0;
  parameter int DEST_WIDTH = 8;
  parameter int USER_ENABLE = 1;
  parameter int LAST_ENABLE = 1;
  parameter int KEEP_ENABLE = 0;

  logic                                                      link_up;
  logic link_up_100MHz;
  ts_symbol6_union_t [    MAX_NUM_LANES-1:0]                 symbol6;
  logic              [(MAX_NUM_LANES*8)-1:0]                 lane_number;
  logic              [(MAX_NUM_LANES*8)-1:0]                 link_number;
  logic              [    MAX_NUM_LANES-1:0]                 ts1_valid;
  logic              [    MAX_NUM_LANES-1:0]                 ts2_valid;
  logic              [    MAX_NUM_LANES-1:0]                 idle_valid;
  training_ctrl_t    [    MAX_NUM_LANES-1:0]                 training_ctrl;
  rate_speed_e                                               curr_data_rate;
  pcie_ordered_set_t                                         ordered_set;
  logic                                                      ordered_set_tranmitted;
  logic                                                      ordered_set_tranmitted_reg;

  logic                                                      send_ordered_set;
  rate_id_t          [    MAX_NUM_LANES-1:0]                 rate_id;
  logic              [                  5:0]                 pipe_width;
  logic              [                  5:0]                 num_active_lanes_i;



  //training set configuration signals
  logic              [    MAX_NUM_LANES-1:0][OsDataSize-1:0] os_axis_tdata;
  logic              [    MAX_NUM_LANES-1:0][KEEP_WIDTH-1:0] os_axis_tkeep;
  logic              [    MAX_NUM_LANES-1:0]                 os_axis_tvalid;
  logic              [    MAX_NUM_LANES-1:0]                 os_axis_tlast;
  logic              [    MAX_NUM_LANES-1:0][USER_WIDTH-1:0] os_axis_tuser;
  logic              [    MAX_NUM_LANES-1:0]                 os_axis_tready;

  //training async fifo set configuration signals
  logic              [    MAX_NUM_LANES-1:0][OsDataSize-1:0] os_fifo_axis_tdata;
  logic              [    MAX_NUM_LANES-1:0][KEEP_WIDTH-1:0] os_fifo_axis_tkeep;
  logic              [    MAX_NUM_LANES-1:0]                 os_fifo_axis_tvalid;
  logic              [    MAX_NUM_LANES-1:0]                 os_fifo_axis_tlast;
  logic              [    MAX_NUM_LANES-1:0][USER_WIDTH-1:0] os_fifo_axis_tuser;
  logic              [    MAX_NUM_LANES-1:0]                 os_fifo_axis_tready;


  assign pipe_width_o = pipe_width;
  // assign phy_txelecidle = '0;


  pcie_ordered_set_t [MAX_NUM_LANES-1:0] rx_ordered_set;
  //   logic              [   DATA_WIDTH-1:0] phy_to_dllp_axis_tdata;
  //   logic              [   KEEP_WIDTH-1:0] phy_to_dllp_axis_tkeep;
  //   logic                                  phy_to_dllp_axis_tvalid;
  //   logic                                  phy_to_dllp_axis_tlast;
  //   logic              [   USER_WIDTH-1:0] phy_to_dllp_axis_tuser;
  //   logic                                  phy_to_dllp_axis_tready;

  //   logic              [   DATA_WIDTH-1:0] phy_to_fifo_dllp_axis_tdata;
  //   logic              [   KEEP_WIDTH-1:0] phy_to_fifo_dllp_axis_tkeep;
  //   logic                                  phy_to_fifo_dllp_axis_tvalid;
  //   logic                                  phy_to_fifo_dllp_axis_tlast;
  //   logic              [   USER_WIDTH-1:0] phy_to_fifo_dllp_axis_tuser;
  //   logic                                  phy_to_fifo_dllp_axis_tready;
  os_tx_holder_t                         tx_os_data;

  logic              [   DATA_WIDTH-1:0] dllp_to_phy_axis_tdata;
  logic              [   KEEP_WIDTH-1:0] dllp_to_phy_axis_tkeep;
  logic                                  dllp_to_phy_axis_tvalid;
  logic                                  dllp_to_phy_axis_tlast;
  logic              [   USER_WIDTH-1:0] dllp_to_phy_axis_tuser;
  logic                                  dllp_to_phy_axis_tready;


  logic              [   DATA_WIDTH-1:0] dllp_to_phy_fifo_axis_tdata;
  logic              [   KEEP_WIDTH-1:0] dllp_to_phy_fifo_axis_tkeep;
  logic                                  dllp_to_phy_fifo_axis_tvalid;
  logic                                  dllp_to_phy_fifo_axis_tlast;
  logic              [   USER_WIDTH-1:0] dllp_to_phy_fifo_axis_tuser;
  logic                                  dllp_to_phy_fifo_axis_tready;



  logic              [   DATA_WIDTH-1:0] phy_to_dllp_axis_tdata;
  logic              [   KEEP_WIDTH-1:0] phy_to_dllp_axis_tkeep;
  logic                                  phy_to_dllp_axis_tvalid;
  logic                                  phy_to_dllp_axis_tlast;
  logic              [   USER_WIDTH-1:0] phy_to_dllp_axis_tuser;
  logic                                  phy_to_dllp_axis_tready;

  logic              [   DATA_WIDTH-1:0] phy_to_dllp_fifo_axis_tdata;
  logic              [   KEEP_WIDTH-1:0] phy_to_dllp_fifo_axis_tkeep;
  logic                                  phy_to_dllp_fifo_axis_tvalid;
  logic                                  phy_to_dllp_fifo_axis_tlast;
  logic              [   USER_WIDTH-1:0] phy_to_dllp_fifo_axis_tuser;
  logic                                  phy_to_dllp_fifo_axis_tready;


  logic              [ TxOsDataSize-1:0] tx_os_axis_tdata;
  logic              [   KEEP_WIDTH-1:0] tx_os_axis_tkeep;
  logic                                  tx_os_axis_tvalid;
  logic                                  tx_os_axis_tlast;
  logic              [   USER_WIDTH-1:0] tx_os_axis_tuser;
  logic                                  tx_os_axis_tready;

  logic              [ TxOsDataSize-1:0] tx_os_fifo_axis_tdata;
  logic              [   KEEP_WIDTH-1:0] tx_os_fifo_axis_tkeep;
  logic                                  tx_os_fifo_axis_tvalid;
  logic                                  tx_os_fifo_axis_tlast;
  logic              [   USER_WIDTH-1:0] tx_os_fifo_axis_tuser;
  logic                                  tx_os_fifo_axis_tready;

  gen_os_struct_t                        gen_os_ctrl;
  os_holder_t        [MAX_NUM_LANES-1:0] rx_os_data;
  logic              [MAX_NUM_LANES-1:0] active_lanes;
  logic              [MAX_NUM_LANES-1:0] lane_status;
  os_holder_t        [              3:0] rx_os_data_250;
  os_holder_t        [MAX_NUM_LANES-1:0] rx_os_data_reg;

    async_fifo #(
        .DSIZE(1),
        .ASIZE(2)
    ) os_transmitted_async_fifo_inst (
        .wclk(pipe_rx_usr_clk_i),
        .wrst_n(!rst_i ),
        .winc('1),
        .wdata(link_up),
        .wfull(),
        .awfull(),
        .rclk(clk_i),
        .rrst_n(!rst_i),
        .rinc('1),
        .rdata(link_up_100MHz),
        .rempty(),
        .arempty()
    );

  logic [3:0] os_transmited_250;

  always_ff @(posedge pipe_tx_usr_clk_i) begin
    os_transmited_250 <= {os_transmited_250[3:1], ordered_set_tranmitted};
  end

  // always_ff @(posedge pipe_tx_usr_clk_i) begin
  //   rx_os_data_250 <= {rx_os_data_250[3:1],rx_os_data};
  // end

  assign ordered_set_tranmitted_reg = |os_transmited_250;

  assign phy_rate = curr_data_rate - 1'b1;
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
      .CLK_RATE     (PHY_CLK_RATE),
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
      //training set configuration signals
      .os_holder_o       (rx_os_data),
      .curr_data_rate_i  (curr_data_rate),
      .m_dllp_axis_tdata (phy_to_dllp_axis_tdata),
      .m_dllp_axis_tkeep (phy_to_dllp_axis_tkeep),
      .m_dllp_axis_tvalid(phy_to_dllp_axis_tvalid),
      .m_dllp_axis_tlast (phy_to_dllp_axis_tlast),
      .m_dllp_axis_tuser (phy_to_dllp_axis_tuser),
      .m_dllp_axis_tready(phy_to_dllp_axis_tready)
  );


  phy_transmit #(
      .CLK_RATE     (PHY_CLK_RATE),
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
      .tx_os_data_i            (tx_os_data),
      .num_active_lanes_i      (num_active_lanes_i),
      .ordered_set_tranmitted_o(ordered_set_tranmitted),
      .s_dllp_axis_tdata       (dllp_to_phy_axis_tdata),
      .s_dllp_axis_tkeep       (dllp_to_phy_axis_tkeep),
      .s_dllp_axis_tvalid      (dllp_to_phy_axis_tvalid),
      .s_dllp_axis_tlast       (dllp_to_phy_axis_tlast),
      .s_dllp_axis_tuser       (dllp_to_phy_axis_tuser),
      .s_dllp_axis_tready      (dllp_to_phy_axis_tready)
  );

  pcie_ltssm_downstream #(
      .CLK_RATE     (PHY_CLK_RATE),
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
      // .gen_os_ctrl_o           (gen_os_ctrl),
      .preset_coeff_o          (),
      //   .rate_id_i(rate_id),
      .extended_synch_i        (),
      .directed_speed_change_i ('0),
      .lane_status_i           (lane_status),
      // .curr_data_rate_o        (curr_data_rate),
      .data_rate_o             (),
      .ordered_set_tranmitted_i(ordered_set_tranmitted_reg),
      .ltssm_state_o           (ltssm_debug_state),
      .changed_speed_recovery_o(),
      .idle_valid_o            (idle_valid),
      .os_holder_o(tx_os_data),
      .os_holder_i(rx_os_data)
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
      .s_phy_axis_tdata       (phy_to_dllp_axis_tdata),
      .s_phy_axis_tkeep       (phy_to_dllp_axis_tkeep),
      .s_phy_axis_tvalid      (phy_to_dllp_axis_tvalid),
      .s_phy_axis_tlast       (phy_to_dllp_axis_tlast),
      .s_phy_axis_tuser       (phy_to_dllp_axis_tuser),
      .s_phy_axis_tready      (phy_to_dllp_axis_tready),
      .m_phy_axis_tdata       (dllp_to_phy_axis_tdata),
      .m_phy_axis_tkeep       (dllp_to_phy_axis_tkeep),
      .m_phy_axis_tvalid      (dllp_to_phy_axis_tvalid),
      .m_phy_axis_tlast       (dllp_to_phy_axis_tlast),
      .m_phy_axis_tuser       (dllp_to_phy_axis_tuser),
      .m_phy_axis_tready      (dllp_to_phy_axis_tready),
      .cfg_bus_number_o       (cfg_bus_number_o),
      .cfg_device_number_o    (cfg_device_number_o),
      .cfg_function_number_o  (cfg_function_number_o),
      .phy_link_up_i          (link_up_100MHz),
      .fc_initialized_o       (fc_initialized_o),
      .idle_valid_i           (idle_valid),
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
