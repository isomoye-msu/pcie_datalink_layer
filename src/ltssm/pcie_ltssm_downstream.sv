//! @title pcie_ltssm_downstream
//! @author Idris Somoye
//! Module implements the pcie physical layer link training state machine.
//! master axis bus.
//!
//! Module does not support upconfig!
//!
//! Module does not support crosslink!
module pcie_ltssm_downstream
  import pcie_phy_pkg::*;
#(
    parameter int CLK_RATE      = 100,                //!Clock speed in MHz, Defualt is 100
    parameter int MAX_NUM_LANES = 4,                  //! Maximum number of lanes module can support
    // TLP data width
    parameter int DATA_WIDTH    = 32,                 //! AXIS data width
    // TLP keep width
    parameter int KEEP_WIDTH    = DATA_WIDTH / 8,
    parameter int USER_WIDTH    = $bits(phy_user_t),
    parameter int SIM_FAST_LINK = 1,

    parameter int          IS_ROOT_PORT       = 1,
    parameter int          LINK_NUM           = 0,
    parameter int          IS_UPSTREAM        = 0,    //downstream by default
    parameter int          CROSSLINK_EN       = 0,    //crosslink not supported
    parameter int          UPCONFIG_EN        = 0,    //upconfig not supported
    parameter rate_speed_e MAX_SUPPORTED_RATE = gen3
) (
    input  logic                         clk_i,                //! 100MHz clock signal
    input  logic                         rst_i,                //! Reset signal
    // !Control
    input  logic                         en_i,
    output logic                         link_up_o,
    input  logic                         is_timeout_i,
    input  logic                         recovery_i,
    output logic                         error_o,
    output logic                         success_o,
    output logic                         error_loopback_o,
    output logic                         error_disable_o,
    input  logic [    MAX_NUM_LANES-1:0] ts1_valid_i,
    input  logic [    MAX_NUM_LANES-1:0] ts2_valid_i,
    input  logic [    MAX_NUM_LANES-1:0] idle_valid_i,
    input  logic [(MAX_NUM_LANES*3)-1:0] phy_rxstatus_i,
    input  logic [    MAX_NUM_LANES-1:0] phy_phystatus_i,
    input  logic                         phy_phystatus_rst_i,
    output logic                         phy_txdetectrx_o,

    output logic [MAX_NUM_LANES-1:0] phy_txelecidle_o,
    output logic                     phy_txdeemph_o,
    output logic [              1:0] phy_powerdown_o,
    output logic                     phy_txcompliance_o,
    output logic                     phy_rxpolarity_o,
    output logic [              2:0] phy_txmargin_o,
    // input  logic [      MAX_NUM_LANES-1:0] lane_active_i,
    input  logic [MAX_NUM_LANES-1:0] lanes_ts2_satisfied_i,
    input  logic [MAX_NUM_LANES-1:0] config_copmlete_ts2_i,
    input  logic                     from_l0_i,
    input  logic [MAX_NUM_LANES-1:0] receiver_detected_i,
    input  logic [MAX_NUM_LANES-1:0] phy_rxelecidle_i,
    output logic [MAX_NUM_LANES-1:0] tx_enter_elec_idle_o,
    output logic [              19:0] ltssm_state_o,
    output logic                     goto_cfg_o,
    output logic                     goto_detect_o,
    input  logic                     ordered_set_tranmitted_i,
    output logic                     send_ordered_set_o,
    output logic [MAX_NUM_LANES-1:0] active_lanes_o,

    output gen_os_struct_t                        gen_os_ctrl_o,
    //training set configuration signals
    input  pcie_tsos_t        [MAX_NUM_LANES-1:0] ordered_set_i,
    output presets_coeff_t    [MAX_NUM_LANES-1:0] preset_coeff_o,
    output pcie_ordered_set_t                     ordered_set_o,
    // input  ts_symbol6_union_t [MAX_NUM_LANES-1:0] symbol6_i,
    // input  training_ctrl_t    [MAX_NUM_LANES-1:0] training_ctrl_i,
    // input  rate_id_t          [MAX_NUM_LANES-1:0] rate_id_i,
    input  logic                                  extended_synch_i,
    // output logic                                  gen_os_o,
    //TODO: this needs to be computed from ts1's/ ts2's with
    //speed change bit or sw active
    input  logic                                  directed_speed_change_i,
    input  logic              [MAX_NUM_LANES-1:0] lane_status_i,
    output rate_speed_e                           curr_data_rate_o,
    output rate_id_t                              data_rate_o,
    output logic                                  changed_speed_recovery_o
    // //! @virtualbus master_axis_bus @dir out
    // output logic              [   DATA_WIDTH-1:0] m_axis_tdata,
    // output logic              [   KEEP_WIDTH-1:0] m_axis_tkeep,
    // output logic                                  m_axis_tvalid,
    // output logic                                  m_axis_tlast,
    // output logic              [   USER_WIDTH-1:0] m_axis_tuser,
    // input  logic                                  m_axis_tready
    //! @end
);

  localparam int ClockPeriodNs = ((10 ** 3) / CLK_RATE);
  localparam longint TwentyFourMsTimeOut = (24 * (10 ** 4)) / ClockPeriodNs;
  localparam longint FourtyEightMsTimeOut = (48 * (10 ** 4)) / ClockPeriodNs;
  localparam longint TwelveMsTimeOut = SIM_FAST_LINK ? (12 * (10 ** 4)) / (ClockPeriodNs *10): 
  (12 * (10 ** 4)) / ClockPeriodNs;
  localparam longint TwoMsTimeOut = (2 * (10 ** 4)) / ClockPeriodNs;
  localparam longint OneMsTimeOut = SIM_FAST_LINK ? (1 * (10 ** 4)) / (ClockPeriodNs *10): (1 * (10 ** 4)) / ClockPeriodNs;
  localparam int SixUsTimeOut = (6 * (10 ** 3)) / ClockPeriodNs;
  localparam int EigthHundredNanoSecondTimeOut = (800) / ClockPeriodNs;
  localparam int TwentyNanoSeconds = 20* (10 **0)/ ClockPeriodNs;  //(20 * (10** -9)); //)) / int'((1 / (CLK_RATE * $pow(10, 6))));
  localparam int MinTS1sPolling = 48;  //24;  //1024

  typedef enum logic [19:0] {
    ST_IDLE                           = 20'b00000000000000000000,
    ST_DETECT                         = 20'b00000000000000000001,
    ST_POLLING                        = 20'b00000000000000000010,
    ST_CONFIGURATION                  = 20'b00000000000000000011,
    ST_RECOVERY                       = 20'b00000000000000000100,
    ST_L0                             = 20'b00000000000000000101,
    ST_L0s                            = 20'b00000000000000000110,
    ST_L1                             = 20'b00000000000000000111,
    ST_L2                             = 20'b00000000000000001000,
    ST_DISABLED                       = 20'b00000000000000001001,
    ST_LOOPBACK                       = 20'b00000000000000001010,
    ST_HOT_RESET                      = 20'b00000000000000001011,
    ST_DETECT_WAIT_ONE_MS             = 20'b00000000000000100001,
    ST_DETECT_QUIET                   = 20'b00000000000001000001,
    ST_DETECT_ACTIVE                  = 20'b00000000000001100001,
    ST_DETECT_RX                      = 20'b00000000000010000001,
    ST_POLLING_ACTIVE                 = 20'b00000000000000100010,
    ST_POLLING_CONFIGURATION          = 20'b00000000000001000010,
    ST_POLLING_COMPLIANCE             = 20'b00000000000001100010,
    ST_CONFIGURATION_LINKWIDTH_START  = 20'b00000000000000100011,
    ST_CONFIGURATION_LINKWIDTH_ACCEPT = 20'b00000000000001000011,
    ST_CONFIGURATION_LANENUM_ACCEPT   = 20'b00000000000001100011,
    ST_CONFIGURATION_LANENUM_WAIT     = 20'b00000000000010000011,
    ST_CONFIGURATION_COMPLETE         = 20'b00000000000010100011,
    ST_CONFIGURATION_IDLE             = 20'b00000000000011100011,
    ST_RECOVERY_RCVR_LOCK             = 20'b00000000000000100100,
    ST_RECOVERY_RCVR_LOCK_TIMEOUT     = 20'b00000000000001000100,
    ST_RECOVERY_EQUAL                 = 20'b00000000000001100100,
    ST_RECOVERY_SPEED                 = 20'b00000000000010000100,
    ST_RECOVERY_SPEED_WAIT            = 20'b00000000000010100100,
    ST_RECOVERY_SPEED_EIEOS           = 20'b00000000000011000100,
    ST_RECOVERY_RCVR_CFG              = 20'b00000000000011100100,
    ST_RECOVERY_IDLE                  = 20'b00000000000100000100,
    ST_RECOVERY_COMPLETE              = 20'b00000000000100100100,
    ST_RECOVERY_EXT_SYNCH             = 20'b00000000000101000100,
    ST_RECOVERY_SEND_SDS              = 20'b00000000000101100100,
    ST_RECOVERY_EQUAL_PHASE_0         = 20'b00000000000110000100,
    ST_RECOVERY_EQUAL_PHASE_1         = 20'b00000000000110100100,
    ST_RECOVERY_EQUAL_PHASE_2         = 20'b00000000000111000100,
    ST_RECOVERY_EQUAL_PHASE_3         = 20'b00000000000111100100
  } ltssm_state_e;

  typedef struct packed {
    logic equal_complete;
    logic link_equal_req;
    logic phase3_successful;
    logic phase2_successful;
    logic phase1_successful;
    logic phase0_successful;
  } equal_t;

  ltssm_state_e                               curr_state;
  ltssm_state_e                               next_state;
  pcie_ordered_set_t                          ordered_set_c;
  pcie_ordered_set_t                          ordered_set_r;
  logic              [                  63:0] timer_c;
  logic              [                  63:0] timer_r;
  logic                                       error_c;
  logic                                       error_r;
  logic                                       success_c;
  logic                                       success_r;
  logic                                       goto_detect_c;
  logic                                       goto_cfg_c;

  logic              [     MAX_NUM_LANES-1:0] lane_active_c;
  logic              [     MAX_NUM_LANES-1:0] lane_active_r;



  logic              [     MAX_NUM_LANES-1:0] at_least_one_ts1_ts2;
  logic              [     MAX_NUM_LANES-1:0] equal_req;
  logic              [                   7:0] axis_pkt_cnt_c;
  logic              [                   7:0] axis_pkt_cnt_r;
  logic              [                   7:0] try_cnt_c;
  logic              [                   7:0] try_cnt_r;
  rate_id_t                                   curr_data_rate_c;
  rate_id_t                                   curr_data_rate_r;
  rate_id_t                                   last_data_rate_c;
  rate_id_t                                   last_data_rate_r;
  logic                                       successful_speed_negotiation_c;
  logic                                       successful_speed_negotiation_r;
  logic                                       changed_speed_recovery_c;
  logic                                       changed_speed_recovery_r;
  logic                                       equalization_done_8gb_c;
  logic                                       equalization_done_8gb_r;
  logic                                       start_equalization_w_preset_c;
  logic                                       start_equalization_w_preset_r;
  //! internal_axis_signals
  // logic              [   DATA_WIDTH-1:0] ltssm_axis_tdata;
  // logic              [   KEEP_WIDTH-1:0] ltssm_axis_tkeep;
  // logic                                  ltssm_axis_tvalid;
  // logic                                  ltssm_axis_tlast;
  // logic              [   USER_WIDTH-1:0] ltssm_axis_tuser;
  // logic                                  ltssm_axis_tready;

  //!link training helper signals
  logic              [     MAX_NUM_LANES-1:0] link_width_satisfied;
  logic              [     MAX_NUM_LANES-1:0] speed_change_bit_set;
  logic              [                   7:0] link_number_selected;
  logic              [(MAX_NUM_LANES *8)-1:0] link_number_selected_per_lane;
  logic              [   MAX_NUM_LANES-1 : 0] lane_link_number_selected;
  logic              [     MAX_NUM_LANES-1:0] link_lanes_formed;
  logic              [     MAX_NUM_LANES-1:0] lane_num_formed;
  logic              [     MAX_NUM_LANES-1:0] lane_num_satisfied;

  logic              [                  15:0] ordered_set_sent_cnt_c;
  logic              [                  15:0] ordered_set_sent_cnt_r;

  logic              [     MAX_NUM_LANES-1:0] link_lanes_nums_match;
  logic              [     MAX_NUM_LANES-1:0] link_lane_reconfig;

  logic              [     MAX_NUM_LANES-1:0] ts1_lanenum_wait_satisfied;
  logic              [                   7:0] idle_to_rlock_transitioned_c;
  logic              [                   7:0] idle_to_rlock_transitioned_r;

  logic              [     MAX_NUM_LANES-1:0] lane_status_c;
  logic              [     MAX_NUM_LANES-1:0] lane_status_r;
  logic              [     MAX_NUM_LANES-1:0] lanes_detected_c;
  logic              [     MAX_NUM_LANES-1:0] lanes_detected_r;


  logic              [     MAX_NUM_LANES-1:0] single_idle_received;
  logic              [     MAX_NUM_LANES-1:0] link_idle_satisfied;

  //training sequence satisfy signals
  logic              [     MAX_NUM_LANES-1:0] lanes_ts1_satisfied;
  logic              [     MAX_NUM_LANES-1:0] lanes_ts2_satisfied;
  logic              [     MAX_NUM_LANES-1:0] lanes_idle_satisfied;

  logic              [     MAX_NUM_LANES-1:0] ts1_cnt_satisfied;
  logic              [     MAX_NUM_LANES-1:0] ts2_cnt_satisfied;
  logic                                       transmit_ordered_set;
  logic                                       ordered_set_tx_in_process_c;
  logic                                       ordered_set_tx_in_process_r;
  ts2_symbol6_t                               ts2_symbol6;
  rate_id_t                                   rate_id;
  // rate_id = last_data_rate_r;
  rate_speed_e                                max_rate;
  rate_speed_e       [     MAX_NUM_LANES-1:0] max_rate_per_lane;
  logic              [     MAX_NUM_LANES-1:0] lane_max_rate_asserted;
  rate_speed_e                                max_supported_rate_c;
  rate_speed_e                                max_supported_rate_r;
  logic                                       equalization_requested;

  gen_os_struct_t                             gen_os_ctrl_c;
  gen_os_struct_t                             gen_os_ctrl_r;
  presets_coeff_t    [     MAX_NUM_LANES-1:0] preset_coeff_c;
  presets_coeff_t    [     MAX_NUM_LANES-1:0] preset_coeff_r;
  equal_t                                     equal_status_c;
  equal_t                                     equal_status_r;

  assign active_lanes_o         = lane_active_r;
  assign ltssm_state_o          = curr_state;
  assign equalization_requested = (equal_req != '0 | !(equal_status_r.equal_complete));


  always_ff @(posedge clk_i) begin : gen_link_number
    if (rst_i) begin
      link_number_selected <= '0;
      max_rate             <= gen1;
    end else begin
      logic [MAX_NUM_LANES-1:0] flag_lane;
      logic [MAX_NUM_LANES-1:0] flag_rate;
      flag_lane = '0;
      flag_rate = '0;
      for (int i = 0; i < MAX_NUM_LANES; i++) begin
        if (i == 0) begin
          if (lane_link_number_selected[i]) begin
            link_number_selected <= link_number_selected_per_lane[8*i+:8];
          end

          if (lane_max_rate_asserted[i]) begin
            max_rate <= max_rate_per_lane[i];
          end
        end else begin

          if (lane_link_number_selected[i] && ((flag_lane >> i) == '0)) begin
            link_number_selected <= link_number_selected_per_lane[8*i+:8];
            flag_lane[i] = '1;
          end

          if (lane_max_rate_asserted[i] && (flag_rate >> i) == '0) begin
            max_rate <= max_rate_per_lane[i];
            flag_rate[i] = '1;
          end
        end
      end

    end
  end

  //! main sequential block
  always_ff @(posedge clk_i) begin : main_seq
    if (rst_i) begin
      curr_state                     <= ST_IDLE;
      timer_r                        <= '0;
      error_r                        <= '0;
      success_r                      <= '0;
      lane_status_r                  <= '0;
      ordered_set_sent_cnt_r         <= '0;
      axis_pkt_cnt_r                 <= '0;
      try_cnt_r                      <= '0;
      changed_speed_recovery_r       <= '0;
      goto_detect_o                  <= '0;
      goto_cfg_o                     <= '0;
      lane_status_r                  <= '0;
      lanes_detected_r               <= '0;
      ordered_set_tx_in_process_r    <= '0;
      lane_active_r                  <= '0;
      equalization_done_8gb_r        <= '0;
      gen_os_ctrl_r.valid            <= '0;
      start_equalization_w_preset_r  <= '1;
      last_data_rate_r               <= gen3_basic;
      curr_data_rate_r               <= gen1_basic;
      preset_coeff_r                 <= '0;
      equal_status_r                 <= '0;
      send_ordered_set_o             <= '0;
      ordered_set_r                  <= pcie_ordered_set_t'('0);
      successful_speed_negotiation_r <= '0;
      idle_to_rlock_transitioned_r   <= '0;
      max_supported_rate_r           <= gen1;
      gen_os_ctrl_r                  <= '0;
      // for(i = 0; i < MAX_NUM_LANES; i++) begin
      //   preset_coeff_r.rx_preset <=
      //   tx_preset <=
      //   pre_cursor
      //   cursor_coef
      // end
    end else begin
      curr_state                     <= next_state;
      timer_r                        <= timer_c;
      error_r                        <= error_c;
      success_r                      <= success_c;
      lane_status_r                  <= lane_status_c;
      ordered_set_sent_cnt_r         <= ordered_set_sent_cnt_c;
      axis_pkt_cnt_r                 <= axis_pkt_cnt_c;
      try_cnt_r                      <= try_cnt_c;
      last_data_rate_r               <= last_data_rate_c;
      changed_speed_recovery_r       <= changed_speed_recovery_c;
      goto_detect_o                  <= goto_detect_c;
      goto_cfg_o                     <= goto_cfg_c;
      lane_status_r                  <= lane_status_c;
      lanes_detected_r               <= lanes_detected_c;
      curr_data_rate_r               <= curr_data_rate_c;
      lane_active_r                  <= lane_active_c;
      equalization_done_8gb_r        <= equalization_done_8gb_c;
      ordered_set_tx_in_process_r    <= ordered_set_tx_in_process_c;
      equal_status_r                 <= equal_status_c;
      start_equalization_w_preset_r  <= start_equalization_w_preset_c;
      send_ordered_set_o             <= transmit_ordered_set;
      ordered_set_r                  <= ordered_set_c;
      successful_speed_negotiation_r <= successful_speed_negotiation_c;
      idle_to_rlock_transitioned_r   <= idle_to_rlock_transitioned_c;
      max_supported_rate_r           <= max_supported_rate_c;
      gen_os_ctrl_r                  <= gen_os_ctrl_c;
    end
    //non-resetable
  end


  always_comb begin : timer_and_ordered_set_counter
    timer_c = timer_r;
    // ordered_set_sent_cnt_c = ordered_set_sent_cnt_r;
    if (next_state != curr_state && (next_state != ST_RECOVERY_RCVR_LOCK_TIMEOUT)) begin
      timer_c = '0;
      // ordered_set_sent_cnt_c = '0;
    end else begin
      // if (ordered_set_tranmitted_i) begin
      //   ordered_set_sent_cnt_c = ordered_set_sent_cnt_r;
      // end
      timer_c = (timer_r >= FourtyEightMsTimeOut) ? FourtyEightMsTimeOut : timer_r + 1;
    end
  end


  always_comb begin : lane_status
    lane_active_c = lane_active_r;
    if (phy_phystatus_rst_i) begin
      lane_active_c = '0;
    end else begin
      for (int i = 0; i < MAX_NUM_LANES; i++) begin
        if (phy_phystatus_i[i] && phy_rxstatus_i[3*i+:3] == 3'b011) begin
          lane_active_c[i] = '1;
        end
      end
    end
  end



  always_comb begin : ltssm_combo
    next_state                     = curr_state;
    // timer_c                        = timer_r;
    error_c                        = error_r;
    success_c                      = success_r;
    lane_status_c                  = lane_status_r;
    lanes_detected_c               = lanes_detected_r;
    ordered_set_sent_cnt_c         = ordered_set_sent_cnt_r;
    try_cnt_c                      = try_cnt_r;
    last_data_rate_c               = last_data_rate_r;
    goto_detect_c                  = goto_detect_o;
    goto_cfg_c                     = goto_cfg_o;
    tx_enter_elec_idle_o           = '0;
    curr_data_rate_c               = curr_data_rate_r;
    ts2_symbol6                    = '0;
    link_up_o                      = '0;
    //ordered set
    ordered_set_c                  = ordered_set_r;
    changed_speed_recovery_c       = changed_speed_recovery_r;
    successful_speed_negotiation_c = successful_speed_negotiation_r;
    idle_to_rlock_transitioned_c   = idle_to_rlock_transitioned_r;
    equalization_done_8gb_c        = equalization_done_8gb_r;
    start_equalization_w_preset_c  = start_equalization_w_preset_r;
    transmit_ordered_set           = '0;
    rate_id                        = last_data_rate_r;
    max_supported_rate_c           = max_supported_rate_r;
    gen_os_ctrl_c                  = gen_os_ctrl_r;
    equal_status_c                 = equal_status_r;
    phy_txdetectrx_o               = '0;
    phy_txelecidle_o               = '0;
    phy_powerdown_o                = '0;
    phy_txdeemph_o                 = '1;
    phy_txcompliance_o             = '0;
    phy_rxpolarity_o               = '0;
    phy_txmargin_o                 = '0;
    // gen_os_ctrl_c                  = '0;
    case (curr_state)
      //*********************************************************
      // Idle
      //*********************************************************
      ST_IDLE: begin
        if (en_i) begin
          // timer_c                      = '0;
          idle_to_rlock_transitioned_c = '0;
          gen_os_ctrl_c                = '0;
          gen_os_ctrl_c.gen_idle       = '1;
          gen_os_ctrl_c.valid          = '1;
          phy_txelecidle_o             = '1;
          phy_powerdown_o              = 2'b10;
          transmit_ordered_set         = '1;
          ordered_set_c = gen_zeros();
          if (curr_data_rate_r.rate != gen1) begin
            next_state = ST_DETECT_WAIT_ONE_MS;
          end else begin
            next_state = ST_DETECT_QUIET;
          end
        end
      end
      //*********************************************************
      // Detect.Wait.One.Ms
      //*********************************************************
      ST_DETECT_WAIT_ONE_MS: begin
        // gen_os_ctrl_c.gen_idle = '1;
        //bounded timeout counter
        // timer_c = (timer_r >= OneMsTimeOut) ? OneMsTimeOut : timer_r + 1;
        phy_powerdown_o  = 2'b10;
        phy_txelecidle_o = '1;
        if (timer_r >= OneMsTimeOut) begin
          next_state = ST_DETECT_QUIET;
          gen_os_ctrl_c.valid    = '1;
        end
      end
      //*********************************************************
      // Detect.Quiet
      //*********************************************************
      ST_DETECT_QUIET: begin
        //bounded timeout counter
        // gen_os_ctrl_c.gen_idle = '1;
        // timer_c          = (timer_r >= TwelveMsTimeOut) ? TwelveMsTimeOut : timer_r + 1;
        // gen_os_ctrl_c.valid = '1;
        phy_txelecidle_o = '1;
        phy_powerdown_o  = 2'b10;
        phy_txdeemph_o   = '0;
        if (((|lane_status_i) || (timer_r >= TwelveMsTimeOut)) && (ordered_set_tranmitted_i) 
        && (!phy_phystatus_rst_i)) begin
          //reset counts
          // timer_c       = '0;
          next_state    = ST_DETECT_ACTIVE;
          // timer_c       = '0;
          lane_status_c = lane_status_i;
        end
      end
      //*********************************************************
      // Detect.Active
      //*********************************************************
      ST_DETECT_ACTIVE: begin
        // gen_os_ctrl_c.gen_idle = '1;
        //bounded timeout counter
        // timer_c             = (timer_r >= TwoMsTimeOut) ? TwoMsTimeOut : timer_r + 1;
        gen_os_ctrl_c.valid = '1;
        phy_txdetectrx_o = '1;
        phy_txelecidle_o = '1;
        if ((ordered_set_tranmitted_i)) begin
          if (&lane_status_i) begin
            success_c        = '1;
            // timer_c          = '0;
            lanes_detected_c = lane_status_i;
            next_state       = ST_POLLING;
          end else if ((timer_r >= TwoMsTimeOut)) begin
            if (|lane_status_i) begin
              success_c        = '1;
              // timer_c          = '0;
              lanes_detected_c = lane_status_i;
              next_state       = ST_DETECT_RX;
            end else begin
              error_c    = '1;
              // timer_c    = '0;
              next_state = ST_IDLE;
            end
          end
        end
      end
      //*********************************************************
      // Detect.Recever.Detection
      //*********************************************************
      ST_DETECT_RX: begin
        // timer_c = timer_r + 1;
        // gen_os_ctrl_c.valid    = '1;
        // gen_os_ctrl_c.gen_idle = '1;
        phy_txdetectrx_o = '1;
        phy_txelecidle_o = '1;
        if (timer_r >= TwoMsTimeOut) begin
          if ((ordered_set_tranmitted_i)) begin
            if ((lane_status_i == '1) || (lane_status_i == lane_status_r)) begin
              success_c        = '1;
              lanes_detected_c = lane_status_i;
              next_state       = ST_POLLING;
            end else begin
              error_c    = '1;
              next_state = ST_IDLE;
            end
          end
        end
      end
      //*********************************************************
      // Polling
      //*********************************************************
      ST_POLLING: begin
        // timer_c                = '0;
        next_state             = ST_POLLING_ACTIVE;
        ordered_set_sent_cnt_c = '0;
        gen_os_ctrl_c          = '0;
        // gen_os_ctrl_c.gen_idle = '1;
        // gen_os_ctrl_c.gen_idle = '1;
        gen_os_ctrl_c.gen_idle = '0;
        gen_os_ctrl_c.valid    = '1;
        gen_os_ctrl_c.gen_ts1  = '1;
        transmit_ordered_set   = '1;
        ordered_set_c = gen_ts_os( gen1, TS1);
      end
      //*********************************************************
      // Polling.Active
      //*********************************************************
      ST_POLLING_ACTIVE: begin
        //bounded timeout counter
        // timer_c = (timer_r >= TwentyFourMsTimeOut) ? TwentyFourMsTimeOut : timer_r + 1;
        //The Transmitter must wait for its TX common mode to settle before exiting from Electrical
        //Idle and transmitting the TS1 Ordered Sets.
        // Phy transmitter handles common mode settling, will throttle with tready
        //check if timer reached or TSOS sent count met
        //check if last packet in frame
        if (ordered_set_tranmitted_i) begin
          ordered_set_sent_cnt_c = ordered_set_sent_cnt_r + 1;

          if ((timer_r >= TwentyFourMsTimeOut) || (ordered_set_sent_cnt_r >= MinTS1sPolling)) begin
            //reset counts
            // timer_c                = '0;
            ordered_set_sent_cnt_c = '0;
            //check if ts1 reqs satisfied
            if (&lanes_ts1_satisfied) begin
              //build ts2 ordered set
              gen_os_ctrl_c.gen_ts1 = '0;
              gen_os_ctrl_c.gen_ts2 = '1;
              // ordered_set_c = gen_ts_os( gen1, TS1,PAD_,PAD_,'1);
              ordered_set_c = gen_ts_os( gen1, TS2);
              transmit_ordered_set = '1;
              //goto cofig
              next_state = ST_POLLING_CONFIGURATION;
            end else begin
              //goto compliance
              next_state = ST_POLLING_COMPLIANCE;
            end
          end
        end
      end
      //*********************************************************
      // Polling.Compliance: NOT IMPLEMENTED
      //*********************************************************
      ST_POLLING_COMPLIANCE: begin
        //not implemented
        //assert error and go back to deteect low
        error_c    = '1;
        next_state = ST_IDLE;
      end
      //-----------------------------------------------------------
      //  Polling.Configuration
      //-----------------------------------------------------------
      ST_POLLING_CONFIGURATION: begin
        //bounded timeout counter
        if (ordered_set_tranmitted_i) begin
          ordered_set_sent_cnt_c = ordered_set_sent_cnt_r + 1'b1;
          if (&lanes_ts2_satisfied && ordered_set_sent_cnt_r >= 8'h8) begin
            //assert success
            success_c = '1;
            //reset counts
            // timer_c    = '0;
            ordered_set_sent_cnt_c = '0;
            gen_os_ctrl_c.gen_ts1 = '1;
            gen_os_ctrl_c.gen_ts2 = '0;
            transmit_ordered_set = '1;
            ordered_set_c = gen_ts_os( gen1, TS1);
            //goto wait low
            next_state = ST_CONFIGURATION;
          end  //check timeout count
          else if (timer_r >= TwentyFourMsTimeOut)
          begin
            // timer_c    = '0;
            //assert error.
            error_c    = '1;
            //goto wait low
            next_state = ST_IDLE;
          end
        end
      end
      //-----------------------------------------------------------
      //  Configuration
      //-----------------------------------------------------------
      ST_CONFIGURATION: begin
        if (ordered_set_tranmitted_i) begin
          ordered_set_sent_cnt_c = ordered_set_sent_cnt_r + 1'b1;
          if (ordered_set_sent_cnt_r >= 4) begin
            gen_os_ctrl_c.gen_ts1  = '1;
            ordered_set_sent_cnt_c = '0;
            next_state             = ST_CONFIGURATION_LINKWIDTH_START;
          end
        end
      end
      //-----------------------------------------------------------
      //  Configuration.Linkwidth.Start
      //-----------------------------------------------------------
      ST_CONFIGURATION_LINKWIDTH_START: begin
        // if (ordered_set_sent_cnt_r) begin
        //   transmit_ordered_set = '1;
        //   ordered_set_c = gen_ts_os( gen1, TS1, train_seq_e'(LINK_NUM));
        // end
        // gen_os_ctrl_c.valid = '1;
        // gen_os_ctrl_c.gen_ts1 = '1;
        if (ordered_set_tranmitted_i) begin
          ordered_set_sent_cnt_c = ordered_set_sent_cnt_r + 1'b1;
          //check if pcie state continue scenario satisfied
          if ((|link_width_satisfied) && (ordered_set_sent_cnt_r >= 8'h08)) begin
            //reset ordered set sent counter
            ordered_set_sent_cnt_c = '0;
            transmit_ordered_set   = '1;
            //build next ordered set
            ordered_set_c = gen_ts_os( gen1, TS1, train_seq_e'(link_number_selected));
            //goto next pcie ltssm state
            next_state = ST_CONFIGURATION_LINKWIDTH_ACCEPT;
          end  //check timeout counter
          else if (timer_r >= TwentyFourMsTimeOut)
          begin
            //assert error
            error_c    = '1;
            //goto detect
            next_state = ST_IDLE;
          end
        end
      end
      //-----------------------------------------------------------
      //  Configuration.Linkwidth.Accept
      //-----------------------------------------------------------
      ST_CONFIGURATION_LINKWIDTH_ACCEPT: begin
        // gen_os_ctrl_c.gen_ts1 = '1;
        //bounded counter for timeout scenario
        gen_os_ctrl_c.valid = '1;
        if ((ordered_set_tranmitted_i)) begin
          ordered_set_sent_cnt_c = ordered_set_sent_cnt_r + 1'b1;
          //check if pcie state continue scenario satisfied
          //link lane formed xor was put for some spec reason, removing for single lane test as it
          //fails to proceed
          if ((|link_lanes_formed) && /*(!(^link_lanes_formed)) &&*/
          ordered_set_sent_cnt_r >= 8'h08)
          begin
            ordered_set_sent_cnt_c = '0;
            gen_os_ctrl_c.gen_ts1  = '1;
            gen_os_ctrl_c.gen_ts2  = '0;
            transmit_ordered_set   = '1;
            ordered_set_c = gen_ts_os( gen1, TS1, train_seq_e'(link_number_selected));
            next_state = ST_CONFIGURATION_LANENUM_WAIT;
          end  //check timeout counter
          else if (timer_r >= TwoMsTimeOut)
          begin
            error_c    = '1;
            next_state = ST_IDLE;
          end
        end
      end
      //-----------------------------------------------------------
      // Configuration.Lanenum.Accept
      //-----------------------------------------------------------
      ST_CONFIGURATION_LANENUM_ACCEPT: begin
        //bounded counter for timeout scenario
        if (ordered_set_tranmitted_i) begin
          ordered_set_sent_cnt_c = ordered_set_sent_cnt_r + 1'b1;
          //check if lanes can be formed
          if (|link_lanes_nums_match && ordered_set_sent_cnt_r >= 8'h8) begin
            //build ts2 ordered set
            transmit_ordered_set  = '1;
            gen_os_ctrl_c.gen_ts1 = '0;
            gen_os_ctrl_c.gen_ts2 = '1;
            ordered_set_c = gen_ts_os( gen1, TS2, train_seq_e'(link_number_selected), train_seq_e'(0));
            ordered_set_sent_cnt_c = '0;
            //goto config complete
            next_state = ST_CONFIGURATION_COMPLETE;
          end  //check reconfiguration scenario
          else if (|link_lane_reconfig && ordered_set_sent_cnt_r >= 8'h8)
          begin
            next_state = ST_CONFIGURATION_LANENUM_WAIT;
          end  //check timeout counter
          else if (timer_r >= TwoMsTimeOut)
          begin
            //assert error
            error_c    = '1;
            //reset counter
            //goto detect
            next_state = ST_IDLE;
          end
        end
      end
      //-----------------------------------------------------------
      //  Configuration.Lanenum.Wait
      //-----------------------------------------------------------
      ST_CONFIGURATION_LANENUM_WAIT: begin
        if (ordered_set_tranmitted_i) begin
          //check if lane wait exit scenario satisfied
          ordered_set_sent_cnt_c = ordered_set_sent_cnt_r + 1'b1;
          if ((|ts1_lanenum_wait_satisfied) && (ordered_set_sent_cnt_r >= 8'h8)) begin
            // timer_c = '0;
            ordered_set_sent_cnt_c = 0;
            gen_os_ctrl_c.gen_ts1  = '0;
            gen_os_ctrl_c.gen_ts2  = '1;
            transmit_ordered_set   = '1;
            gen_os_ctrl_c.set_lane = '1;
            ordered_set_c = gen_ts_os( gen1, TS1, train_seq_e'(link_number_selected));
            //goto lanenum accept
            next_state = ST_CONFIGURATION_LANENUM_ACCEPT;
          end  //check timeout counter
          else if (timer_r >= TwoMsTimeOut)
          begin
            //assert error
            error_c    = '1;
            //goto detect
            next_state = ST_IDLE;
          end
        end
      end
      //-----------------------------------------------------------
      //  Configuration.Complete
      //-----------------------------------------------------------
      ST_CONFIGURATION_COMPLETE: begin
        if (ordered_set_tranmitted_i) begin
          ordered_set_sent_cnt_c = ordered_set_sent_cnt_r + 1'b1;
          //check exit scenario
          if (&lane_num_formed && (ordered_set_sent_cnt_r >= 8'h8)) begin
            //decrement counts
            ordered_set_sent_cnt_c = '0;

            // timer_c                = '0;
            //build idle ordered set
            transmit_ordered_set   = '1;
            ordered_set_c = gen_zeros();
            gen_os_ctrl_c.gen_ts2  = '0;
            gen_os_ctrl_c.gen_ts1  = '0;
            gen_os_ctrl_c.gen_idle = '1;
            //goto config idle
            next_state             = ST_CONFIGURATION_IDLE;
          end  //check timeout counter
          else if (timer_r >= TwoMsTimeOut)
          begin
            //assert error
            error_c    = '1;
            //goto idle
            next_state = ST_IDLE;
          end
        end
      end
      //-----------------------------------------------------------
      //  Configuration.Idle
      //-----------------------------------------------------------
      ST_CONFIGURATION_IDLE: begin
        if (ordered_set_tranmitted_i) begin
          //check if idle received
          if (|single_idle_received) begin
            //start counting idle OS sent
            ordered_set_sent_cnt_c = ordered_set_sent_cnt_r + 1;
          end
          //check if number of idle OS received and idle OS sent
          if (link_idle_satisfied && (ordered_set_sent_cnt_r >= 16)) begin
            //assert success.. tells ltssm hierarchy to move to its next state
            success_c                    = '1;
            //reset counters
            ordered_set_sent_cnt_c       = '0;
            gen_os_ctrl_c.gen_ts1        = '0;
            gen_os_ctrl_c.gen_ts2        = '0;
            gen_os_ctrl_c.gen_idle       = '0;
            gen_os_ctrl_c.valid          = '0;
            transmit_ordered_set         = '1;
            //increment idle_to_rlock_transitioned_c
            idle_to_rlock_transitioned_c = idle_to_rlock_transitioned_r + 1;
            //goto wait for ena low
            next_state                   = ST_L0;
          end  //check timeout counter
          else if (timer_r >= TwoMsTimeOut)
          begin
            idle_to_rlock_transitioned_c = '1;
            //assert error
            error_c                      = '1;
            //goto wait low
            next_state                   = ST_IDLE;
          end
        end
      end
      //-----------------------------------------------------------
      //  L0
      //-----------------------------------------------------------
      ST_L0: begin
        link_up_o = '1;
        transmit_ordered_set         = '1;
        if (|ts1_valid_i || |ts2_valid_i || (directed_speed_change_i && !changed_speed_recovery_r))
        begin
          next_state = ST_RECOVERY;
        end
      end
      //-----------------------------------------------------------
      //  Recovery
      //-----------------------------------------------------------
      ST_RECOVERY: begin
        // timer_c = timer_r + 1'b1;

        if (timer_r >= 8'h0A) begin
          rate_id_t temp_rate_id;
          // timer_c = '0;
          temp_rate_id = gen3_basic;
          gen_os_ctrl_c.gen_ts1 = '1;
          // gen_os_ctrl_c.set_lane = '1;
          gen_os_ctrl_c.valid = '1;
          //if data rate is gen1 and we've tried three times stay at gen1
          if ((last_data_rate_r.rate > gen1) && (try_cnt_r < 8'h3) && !successful_speed_negotiation_r)
          begin
            last_data_rate_c.speed_change = '1;
            temp_rate_id.speed_change = '1;
          end
          transmit_ordered_set = '1;
          ordered_set_c = gen_ts_os( curr_data_rate_r.rate, TS1, train_seq_e'(link_number_selected),
                   train_seq_e'(0), last_data_rate_c);
          ordered_set_sent_cnt_c = '0;
          // if (recovery_i && !is_timeout_i) begin
          // ordered_set_c.rate_id[6] = '1;
          // end
          next_state             = ST_RECOVERY_RCVR_LOCK;
        end
      end
      //-----------------------------------------------------------
      //  Recovery.Lock
      //-----------------------------------------------------------
      ST_RECOVERY_RCVR_LOCK: begin
        //bounded counter for timeout scenario
        ts2_symbol6 = '0;
        if (equalization_requested && curr_data_rate_r.rate == gen3) begin
          next_state = ST_RECOVERY_EQUAL;
        end
        if (|speed_change_bit_set && !changed_speed_recovery_r) begin
          last_data_rate_c.speed_change = '1;
          transmit_ordered_set = '1;
          ordered_set_c = gen_ts_os( curr_data_rate_r.rate, TS1, train_seq_e'(link_number_selected),
                   train_seq_e'(0), last_data_rate_c);
        end
        if (&(ts1_cnt_satisfied | ts2_cnt_satisfied)) begin
          //deassert valid and reset counter
          ordered_set_sent_cnt_c = '0;
          // timer_c                = '0;
          if (extended_synch_i) begin
            //goto next pcie ltssm state
            next_state = ST_RECOVERY_EXT_SYNCH;
          end else begin
            //build next ordered set
            if (max_rate >= gen3) begin
              ts2_symbol6.req_equal = '1;
            end
            gen_os_ctrl_c.gen_ts1 = '0;
            gen_os_ctrl_c.gen_ts2 = '1;
            transmit_ordered_set  = '1;
            ordered_set_c = gen_ts_os( curr_data_rate_r.rate, TS2, train_seq_e'(link_number_selected),
                     train_seq_e'(0), last_data_rate_r, '0, ts2_symbol6);
            //goto next pcie ltssm state
            next_state = ST_RECOVERY_RCVR_CFG;
          end
        end  //check timeout counter
        else if (timer_r >= TwentyFourMsTimeOut)
        begin
          next_state = ST_RECOVERY_RCVR_LOCK_TIMEOUT;
        end
      end
      //-----------------------------------------------------------
      //  Recovery.Rcvr.Lock.Timeout
      //-----------------------------------------------------------
      ST_RECOVERY_RCVR_LOCK_TIMEOUT: begin
        //check secondary config transition
        if ((|((ts1_cnt_satisfied | ts2_cnt_satisfied) & lane_active_r) && (|speed_change_bit_set)) ||
            curr_data_rate_r.rate != gen1 ||
            max_rate != gen1 || last_data_rate_r.rate != gen1)
        begin
          //build next ordered set
          ts2_symbol6 = '0;
          if (max_rate >= gen3) begin
            // ts2_symbol6.req_equal = '1;
          end
          transmit_ordered_set = '1;
          ordered_set_c = gen_ts_os( rate_speed_e'(last_data_rate_r.rate), TS2, train_seq_e'(LINK_NUM),
                   train_seq_e'(0), last_data_rate_r, '0, ts2_symbol6);
          //goto next pcie ltssm state
          next_state = ST_RECOVERY_RCVR_CFG;
        end else begin
          if (!changed_speed_recovery_r && curr_data_rate_r.rate != gen1) begin
            transmit_ordered_set = '1;
            ordered_set_c = gen_ts_os( rate_speed_e'(last_data_rate_r.rate), TS2,
                     train_seq_e'(LINK_NUM), train_seq_e'(0), last_data_rate_r, '0, ts2_symbol6);
            //goto next pcie ltssm state
            next_state = ST_RECOVERY_SPEED;
          end else if (changed_speed_recovery_r) begin
            //goto next pcie ltssm state
            next_state = ST_RECOVERY_SPEED;
          end else if (changed_speed_recovery_r && (|at_least_one_ts1_ts2)) begin
            //assert error
            error_c    = '1;
            goto_cfg_c = '1;
            //goto detect
            next_state = ST_CONFIGURATION;
          end else begin
            //assert error
            error_c       = '1;
            goto_detect_c = '1;
            //goto detect
            next_state    = ST_IDLE;
          end
        end
      end
      ST_RECOVERY_EQUAL: begin
        ts1_symbol6_t temp_ts6;
        ordered_set_sent_cnt_c = '0;
        equal_status_c         = '0;
        // gen_os_ctrl_c          = '0;
        gen_os_ctrl_c.valid    = '1;
        gen_os_ctrl_c.gen_ts2  = '0;
        gen_os_ctrl_c.gen_ts1  = '1;
        // last_data_rate_c.speed_change = '1;
        temp_ts6.ec            = 2'b01;
        transmit_ordered_set   = '1;
        ordered_set_c = gen_ts_os( curr_data_rate_r.rate, TS1, train_seq_e'(link_number_selected),
                 train_seq_e'(0), last_data_rate_c,, temp_ts6);
        next_state = ST_RECOVERY_EQUAL_PHASE_1;
      end
      ST_RECOVERY_EQUAL_PHASE_1: begin
        if (ordered_set_tranmitted_i) begin
          ordered_set_sent_cnt_c = ordered_set_sent_cnt_r + 1'b1;
          if (ordered_set_sent_cnt_r == 32'd31) begin
            gen_os_ctrl_c.gen_ts1    = '0;
            gen_os_ctrl_c.gen3_eieos = '1;
            transmit_ordered_set = '1;
            gen_eieos(ordered_set_c, max_supported_rate_r);
            ordered_set_sent_cnt_c = '0;
            curr_data_rate_c.rate  = gen3;
          end
          if (ordered_set_sent_cnt_r == '0) begin
            ts1_symbol6_t temp_ts6;
            temp_ts6                 = '0;
            gen_os_ctrl_c.gen3_eieos = '0;
            gen_os_ctrl_c.gen_ts1    = '1;
            temp_ts6.ec              = 2'b01;
            transmit_ordered_set     = '1;
            ordered_set_c = gen_ts_os( curr_data_rate_r.rate, TS1, train_seq_e'(link_number_selected),
                     train_seq_e'(0), last_data_rate_c,, temp_ts6);
          end
        end
        if (&(ts1_lanenum_wait_satisfied ^ ~lane_active_r)) begin
          equal_status_c.equal_complete = '1;
          equal_status_c.phase1_successful = '1;
          //skip phase 2 and 3
          //next_state = ST_RECOVERY_EQUAL_PHASE_2;
          next_state = ST_RECOVERY;
        end else if (timer_r >= TwentyFourMsTimeOut) begin
          next_state = ST_RECOVERY_SPEED;
          // timer_c = '0;
        end
      end
      ST_RECOVERY_EQUAL_PHASE_2: begin
        // timer_c = (timer_r >= TwentyFourMsTimeOut) ? TwentyFourMsTimeOut : timer_r + 1;
        if (ts1_cnt_satisfied) begin
          ts1_symbol6_t temp_ts6;
          temp_ts6.ec = 2'b11;
          transmit_ordered_set = '1;
          ordered_set_c = gen_ts_os( curr_data_rate_r.rate, TS1, train_seq_e'(link_number_selected),
                   train_seq_e'(0), last_data_rate_c,, temp_ts6);
          // next_state = ST_RECOVERY_EQUAL;
          // timer_c = '0;
          next_state = ST_RECOVERY_EQUAL_PHASE_3;
        end else if (timer_r >= TwentyFourMsTimeOut) begin
          next_state = ST_RECOVERY_SPEED;
          // timer_c = '0;
        end
      end
      ST_RECOVERY_EQUAL_PHASE_3: begin
        if (ts1_cnt_satisfied) begin
          gen_os_ctrl_c = '0;
          next_state = ST_RECOVERY_RCVR_LOCK;
        end else if (timer_r >= TwentyFourMsTimeOut) begin
          next_state = ST_RECOVERY_SPEED;
          // timer_c = '0;
        end
      end
      //-----------------------------------------------------------
      //  Recovery.Ext.Synch
      //-----------------------------------------------------------
      ST_RECOVERY_EXT_SYNCH: begin
        gen_os_ctrl_c.valid = '1;
        gen_os_ctrl_c.gen_ts1 = '1;
        gen_os_ctrl_c.set_lane = '1;
        //check if last packet in frame
        if (ordered_set_tranmitted_i) begin
          ordered_set_sent_cnt_c = ordered_set_sent_cnt_r + 1'b1;
        end
        //check if pcie state continue scenario satisfied
        if (ordered_set_sent_cnt_r >= 12'd1024) begin
          ts2_symbol6            = '0;
          //deassert valid and reset counter
          ordered_set_sent_cnt_c = '0;
          // timer_c                = '0;
          //build next ordered set
          if (max_rate == gen3) begin
            ts2_symbol6.req_equal = '1;
          end
          // ordered_set_c = gen_ts_os( last_data_rate_r.rate, TS2, link_num_i, lane_num_i, last_data_rate_r, '0,
          //          ts_symbol6_union_t);
          next_state = ST_RECOVERY_RCVR_CFG;
        end
      end
      //recovery speed scenario
      //8 TS2 Ordered on any lane sets with speed_change bit...at_least_one_ts1_ts2
      // and 8 TS2 OS are standard i.e no IEQUES TS2 if gen1/gen2
      //
      //8 consecutive EQ TS2 recived on all configured lanes, speed_change bit
      //set to 1
      //8 consecutive EQ TS2 OS
      //-----------------------------------------------------------
      //  Recovery.Rcvr.Cfg
      //-----------------------------------------------------------
      ST_RECOVERY_RCVR_CFG: begin
        //bounded counter for timeout scenario
        // gen_os_ctrl_c.gen_ts1 = '1;
        // gen_os_ctrl_c.set_lane = '1;
        // timer_c = (timer_r >= TwentyFourMsTimeOut) ? TwentyFourMsTimeOut : timer_r + 1;
        // gen_os_ctrl_c.valid = '1;
        if (ordered_set_tranmitted_i && at_least_one_ts1_ts2) begin
          ordered_set_sent_cnt_c = ordered_set_sent_cnt_r + 1'b1;
        end
        //recovery idle scenario
        if((|(ts2_cnt_satisfied & lane_active_r)
            && (speed_change_bit_set=='0)
            && ordered_set_sent_cnt_r >= 8'd4) && ordered_set_tranmitted_i)
        begin
          successful_speed_negotiation_c = '0;
          gen_os_ctrl_c                  = '0;
          gen_os_ctrl_c.valid            = '1;
          gen_os_ctrl_c.gen_eios         = '1;
          // timer_c                        = '0;
          ordered_set_sent_cnt_c         = '0;
          next_state                     = ST_RECOVERY_IDLE;
          transmit_ordered_set           = '1;
          gen_eios(ordered_set_c, curr_data_rate_r.rate);
        end
        if((|((ts1_cnt_satisfied || ts2_cnt_satisfied) & lane_active_r)) &&
            (|speed_change_bit_set) &&  (curr_data_rate_r.rate < gen3) &&
            (curr_data_rate_r.rate > gen1 || max_rate > gen1) &&
            ordered_set_sent_cnt_r >= 16'd32)
        begin
          // timer_c                = '0;
          ordered_set_sent_cnt_c = '0;
          for (int i = 0; i < MAX_NUM_LANES; i++) begin
            if (lane_active_r[i]) begin
              if (i == '0) begin
                max_supported_rate_c = last_data_rate_r.rate;
              end else begin
                max_supported_rate_c = max_rate > max_supported_rate_c ? max_supported_rate_c :
                  max_rate;
              end
            end
          end
          if (max_supported_rate_c == gen1) begin
            next_state = ST_RECOVERY_IDLE;
            successful_speed_negotiation_c = '0;
          end else begin
            next_state = ST_RECOVERY_SPEED;
            successful_speed_negotiation_c = '1;
          end
          // timer_c = '0;
          gen_os_ctrl_c          = '0;
          gen_os_ctrl_c.valid    = '1;
          gen_os_ctrl_c.gen_eios = '1;
          ordered_set_sent_cnt_c = '0;
          transmit_ordered_set   = '1;
          gen_eios(ordered_set_c, curr_data_rate_r.rate);
        end
        else if(&(ts1_cnt_satisfied | ts2_cnt_satisfied) && curr_data_rate_r.rate >= gen3
                && (&(speed_change_bit_set ^ lane_active_r)) && ordered_set_sent_cnt_r >= 32'd128)
        begin
          // timer_c                = '0;
          ordered_set_sent_cnt_c = '0;
          for (int i = 0; i < MAX_NUM_LANES; i++) begin
            if (lane_active_r[i]) begin
              if (i == '0) begin
                max_supported_rate_c = last_data_rate_r.rate;
              end else begin
                max_supported_rate_c = max_rate > max_supported_rate_c ? max_supported_rate_c :
                  max_rate;
              end
            end
          end
          gen_os_ctrl_c                  = '0;
          gen_os_ctrl_c.valid            = '1;
          gen_os_ctrl_c.gen_eios         = '1;
          successful_speed_negotiation_c = max_supported_rate_c != gen1;
          transmit_ordered_set           = '1;
          gen_eios(ordered_set_c, curr_data_rate_r.rate);
          next_state = ST_RECOVERY_SPEED;
        end
        if (timer_r >= FourtyEightMsTimeOut) begin
          // timer_c = '0;
          next_state = ST_RECOVERY_RCVR_LOCK_TIMEOUT;
        end
      end
      //-----------------------------------------------------------
      //  Recovery.Speed
      //-----------------------------------------------------------
      ST_RECOVERY_SPEED: begin
        tx_enter_elec_idle_o = '1;
        gen_os_ctrl_c.gen_ts1 = '1;
        gen_os_ctrl_c.set_lane = '1;
        // curr_data_rate_c.rate = max_supported_rate_r;
        //bounded counter for timeout scenario
        // timer_c = (timer_r >= TwentyFourMsTimeOut) ? TwentyFourMsTimeOut : timer_r + 1;
        gen_os_ctrl_c.valid = '1;
        // if (ordered_set_tranmitted_i) begin
        //   ordered_set_sent_cnt_c = ordered_set_sent_cnt_r + 1'b1;
        // end

        // if (curr_data_rate_r.rate == gen1 || curr_data_rate_r.rate == gen3) begin
        //   if (ordered_set_sent_cnt_r >= 8'h1) begin
        //     gen_os_ctrl_c.valid = '0;
        //   end
        //   if (&(phy_rxelecidle_i | ~lane_active_r)) begin
        //     //bounded counter for timeout scenario
        //     gen_os_ctrl_c.valid = '0;
        //     next_state = ST_RECOVERY_SPEED_WAIT;
        //   end
        // end else begin
        //   if (ordered_set_sent_cnt_r >= 8'h2) begin
        //     gen_os_ctrl_c.valid = '0;
        //   end
        //   if (&(phy_rxelecidle_i | ~lane_active_r)) begin
        //     gen_os_ctrl_c.valid = '0;
        //     //bounded counter for timeout scenario
        //     next_state = ST_RECOVERY_SPEED_WAIT;
        //   end
        // end
        if (ordered_set_tranmitted_i) begin
          ordered_set_sent_cnt_c = ordered_set_sent_cnt_r + 1'b1;
        end
        if (&(phy_rxelecidle_i | ~lane_active_r) && ordered_set_sent_cnt_r >= 2) begin
          gen_os_ctrl_c.valid = '0;
          //bounded counter for timeout scenario
          next_state = ST_RECOVERY_SPEED_WAIT;
        end
        //check timeout counter
        if (timer_r >= FourtyEightMsTimeOut) begin
          next_state = ST_IDLE;
        end
      end
      //-----------------------------------------------------------
      //  Recovery.Speed.Wait
      //-----------------------------------------------------------
      ST_RECOVERY_SPEED_WAIT: begin
        //bounded counter for timeout scenario
        // timer_c = (timer_r >= TwentyFourMsTimeOut) ? TwentyFourMsTimeOut : timer_r + 1;
        if (successful_speed_negotiation_r) begin
          last_data_rate_c = '0;
          if (timer_r >= EigthHundredNanoSecondTimeOut) begin
            curr_data_rate_c.rate    = max_supported_rate_r;
            last_data_rate_c.rate    = max_supported_rate_r;
            changed_speed_recovery_c = '1;
            if (max_supported_rate_r >= gen3) begin
              gen_os_ctrl_c.valid      = '1;
              gen_os_ctrl_c.gen3_eieos = '1;
              next_state               = ST_RECOVERY_SPEED_EIEOS;
              transmit_ordered_set     = '1;
              gen_eieos(ordered_set_c, max_supported_rate_r);
              ordered_set_sent_cnt_c = '0;
            end else begin
              next_state = ST_RECOVERY_RCVR_LOCK;
              transmit_ordered_set = '1;
              ordered_set_c = gen_ts_os( last_data_rate_c.rate, TS1,
                       train_seq_e'(link_number_selected), train_seq_e'(0), last_data_rate_c);
            end
          end
        end else if (timer_r >= SixUsTimeOut) begin
          changed_speed_recovery_c = '0;
          curr_data_rate_c         = curr_data_rate_r;
          last_data_rate_c         = curr_data_rate_r.rate;
          transmit_ordered_set     = '1;
          ordered_set_c = gen_ts_os( last_data_rate_c.rate, TS1, train_seq_e'(link_number_selected),
                   train_seq_e'(0), last_data_rate_c);
          next_state = ST_RECOVERY_RCVR_LOCK;
        end
      end
      //-----------------------------------------------------------
      //  Recovery.Speed.Eieos
      //-----------------------------------------------------------
      //this state exists to ensure that eieos is transmitted before going into tx elec idle
      ST_RECOVERY_SPEED_EIEOS: begin
        gen_os_ctrl_c = '0;
        gen_os_ctrl_c.valid = '1;
        if (ordered_set_tranmitted_i) begin
          ordered_set_sent_cnt_c = ordered_set_sent_cnt_r + 1'b1;
        end
        if (ordered_set_sent_cnt_r >= 8'h8) begin
          next_state = ST_RECOVERY_RCVR_LOCK;
          transmit_ordered_set = '1;
          ordered_set_c = gen_ts_os( last_data_rate_r.rate, TS1, train_seq_e'(link_number_selected),
                   train_seq_e'(0), last_data_rate_r);
        end
      end
      //-----------------------------------------------------------
      //  Recovery.Idle
      //-----------------------------------------------------------
      ST_RECOVERY_IDLE: begin
        //bounded counter for timeout scenario
        // timer_c = (timer_r >= TwentyFourMsTimeOut) ? TwentyFourMsTimeOut : timer_r + 1;
        gen_os_ctrl_c.valid = '1;
        if (ordered_set_tranmitted_i) begin
          if (single_idle_received) begin
            ordered_set_sent_cnt_c = ordered_set_sent_cnt_r + 1'b1;
          end
          //recovery idle scenario
          if (((|lanes_idle_satisfied) && ordered_set_sent_cnt_r >= 8'd16)) begin
            gen_os_ctrl_c        = '0;
            gen_os_ctrl_c.valid  = '1;
            next_state           = ST_RECOVERY_SEND_SDS;
            transmit_ordered_set = '1;
            gen_sds_os(ordered_set_c);
          end else if (at_least_one_ts1_ts2) begin
            // timer_c                = '0;
            gen_os_ctrl_c.valid    = '0;
            ordered_set_sent_cnt_c = '0;
            next_state             = ST_CONFIGURATION;
          end else if (timer_r >= TwoMsTimeOut) begin
            //goto recovery scenario
            if (idle_to_rlock_transitioned_r != '1) begin
              // timer_c                = '0;
              gen_os_ctrl_c.valid    = '0;
              ordered_set_sent_cnt_c = '0;
              //check data rate for retry options
              if (curr_data_rate_r.rate == gen1) begin
                idle_to_rlock_transitioned_c = idle_to_rlock_transitioned_r == '1 ?
                '1 : idle_to_rlock_transitioned_r + 1'b1;
              end
              if (curr_data_rate_r.rate == gen2) begin
                idle_to_rlock_transitioned_c = '1;
              end
              next_state = ST_RECOVERY;
            end  //goto detect
            else
            begin
              // timer_c                = '0;
              gen_os_ctrl_c.valid    = '0;
              ordered_set_sent_cnt_c = '0;
              next_state             = ST_DETECT;
            end
          end
        end
      end
      //-----------------------------------------------------------
      //  Recovery.Send.SDS
      //-----------------------------------------------------------
      ST_RECOVERY_SEND_SDS: begin
        gen_os_ctrl_c.valid = '1;
        if (ordered_set_tranmitted_i) begin
          idle_to_rlock_transitioned_c = '0;
          gen_os_ctrl_c.valid          = '0;
          next_state                   = ST_L0;
        end
      end
      default: begin
      end
    endcase
  end


  //-----------------------------------------------------------
  //  Lane based Ordered set handling logic
  //-----------------------------------------------------------
  for (genvar lane = 0; lane < MAX_NUM_LANES; lane++) begin : gen_cnt_ts1
    //local helper counters
    logic              [7:0] ts1_cnt;
    logic              [7:0] ts2_cnt;
    logic              [7:0] idle_cnt;

    logic              [7:0] lane_in_save;
    logic                    first_ts1;
    ts_symbol6_union_t       temp_ts6;
    rate_id_t                temp_rate_id;
    logic                    lane_speed_change_bit;



    always_ff @(posedge clk_i) begin : output_registers
      if (rst_i) begin
        //determine if TS1 req satisfied for lane by its count
        link_width_satisfied[lane]       <= '0;
        //determine if TS1 req satisfied for lane by its count
        link_lanes_formed[lane]          <= '0;
        //determine if TS1 req satisfied
        ts1_lanenum_wait_satisfied[lane] <= '0;
        link_lanes_nums_match[lane]      <= '0;
        link_lane_reconfig[lane]         <= '0;
        lane_num_formed[lane]            <= '0;
        //determine if TS1 req satisfied for lane by its count
        link_idle_satisfied[lane]        <= '0;
        ts1_cnt_satisfied[lane]          <= '0;
        ts2_cnt_satisfied[lane]          <= '0;
        at_least_one_ts1_ts2[lane]       <= '0;
        //assignments for state exit scenarios
        lanes_ts1_satisfied[lane]        <= '0;
        lanes_ts2_satisfied[lane]        <= '0;
        lanes_idle_satisfied[lane]       <= '0;
        speed_change_bit_set[lane]       <= '0;
      end else begin
        //determine if TS1 req satisfied for lane by its count
        link_width_satisfied[lane]       <= (ts1_cnt >= 8'h2) | (ts2_cnt == 8'h2);
        //determine if TS1 req satisfied for lane by its count
        link_lanes_formed[lane]          <= (ts1_cnt >= 8'h2);
        //determine if TS1 req satisfied
        ts1_lanenum_wait_satisfied[lane] <= (ts1_cnt >= 8'h2);
        link_lanes_nums_match[lane]      <= (ts1_cnt >= 8'h2) | (ts2_cnt >= 8'h2);
        link_lane_reconfig[lane]         <= (ts1_cnt >= 8'h2);
        lane_num_formed[lane]            <= lane_active_r[lane] ? (ts2_cnt == 8'h8) : '1;
        //determine if TS1 req satisfied for lane by its count
        link_idle_satisfied[lane]        <= (ts1_cnt >= 8'h8);
        ts1_cnt_satisfied[lane]          <= lane_active_r[lane] ? (ts1_cnt == 8'h8) : '1;
        ts2_cnt_satisfied[lane]          <= lane_active_r[lane] ? (ts2_cnt == 8'h8) : '1;
        at_least_one_ts1_ts2[lane]       <= (ts1_cnt != '0) | (ts2_cnt != '0);
        //assignments for state exit scenarios
        lanes_ts1_satisfied[lane]        <= receiver_detected_i[lane] ? (ts1_cnt == 8'h8) : '1;
        lanes_ts2_satisfied[lane]        <= receiver_detected_i[lane] ? (ts2_cnt == 8'h8) : '1;
        lanes_idle_satisfied[lane]       <= idle_cnt >= 8'h8;
        speed_change_bit_set[lane]       <= lane_speed_change_bit != '0;
      end

    end



    //sequential block
    always_ff @(posedge clk_i) begin : cnt_ts1
      if (rst_i) begin
        ts1_cnt                                  <= '0;
        ts2_cnt                                  <= '0;
        idle_cnt                                 <= '0;
        first_ts1                                <= '0;
        link_number_selected_per_lane[lane*8+:8] <= '0;
        lane_in_save                             <= PAD_;
        single_idle_received[lane]               <= '0;
        temp_ts6                                 <= '0;
        lane_speed_change_bit                    <= '0;
        max_rate_per_lane[lane]                  <= gen1;
        lane_max_rate_asserted[lane]             <= '0;
      end else begin
        lane_link_number_selected[lane] <= '0;
        lane_max_rate_asserted[lane] <= '0;
        if (next_state != curr_state && (next_state != ST_RECOVERY_RCVR_LOCK_TIMEOUT)) begin
          ts1_cnt                    <= '0;
          ts2_cnt                    <= '0;
          first_ts1                  <= '0;
          idle_cnt                   <= '0;
          lane_speed_change_bit      <= '0;
          single_idle_received[lane] <= '0;
        end
        case (curr_state)
          ST_IDLE: begin
            ts1_cnt                    <= '0;
            ts2_cnt                    <= '0;
            first_ts1                  <= '0;
            idle_cnt                   <= '0;
            single_idle_received[lane] <= '0;
          end
          ST_POLLING_ACTIVE: begin
            if (ts1_valid_i[lane]) begin
              if (((ordered_set_i[lane].link_num == PAD) && (ordered_set_i[lane].lane_num == PAD))
                  /*&& ordered_set_i[lane].train_ctrl.loopback*/
                  ) begin
                ts1_cnt <= ts1_cnt >= 8'h8 ? 8'h8 : ts1_cnt + 1;
              end else begin
                ts1_cnt <= '0;
              end
            end else if (ts2_valid_i[lane]) begin
              if (((ordered_set_i[lane].link_num == PAD) && (ordered_set_i[lane].lane_num == PAD)))
              begin
                ts2_cnt <= ts2_cnt >= 8'h8 ? 8'h8 : ts2_cnt + 1;
              end else begin
                ts1_cnt <= '0;
              end
            end
          end
          ST_POLLING_CONFIGURATION: begin
            if (ts2_valid_i[lane]) begin
              if (((ordered_set_i[lane].link_num == PAD) && (ordered_set_i[lane].lane_num == PAD)))
              begin
                ts2_cnt <= ts2_cnt >= 8'h8 ? 8'h8 : ts2_cnt + 1;
              end else begin
                ts2_cnt <= '0;
              end
            end
          end
          ST_RECOVERY_RCVR_LOCK, ST_RECOVERY_RCVR_LOCK_TIMEOUT: begin
            //wait for incoming ts1-os...//skip if threshhold already reached
            if (ts1_valid_i[lane] || ts2_valid_i[lane]) begin
              if (lane == '0) begin
                max_rate_per_lane[lane] <= ordered_set_i[lane].rate_id.rate > max_rate
                ? ordered_set_i[lane].rate_id.rate : max_rate;
                lane_max_rate_asserted[lane] <= '1;
              end
              // $display("speed change: %s ", ordered_set_i[lane].rate_id.speed_change);
              if (1
                  /*(ordered_set_i[lane].lane_num == lane) &&
                  (ordered_set_i[lane].link_num == link_number_selected )
                  */
                  ) begin
                ts1_cnt <= ts1_cnt >= 8'h8 ? 8'h8 : ts1_cnt + 1;
                if (ordered_set_i[lane].rate_id.speed_change) begin
                  lane_speed_change_bit <= '1;
                end else begin
                  lane_speed_change_bit <= '0;
                end
              end else begin
                ts1_cnt <= '0;
              end
            end
            //wait for incoming ts2-os...//skip if threshhold already reached
            if (ts2_valid_i[lane]) begin
              if (1
                  /*((ordered_set_i[lane].lane_num == lane) &&
                  ordered_set_i[lane].link_num && link_number_selected)*/
                  ) begin
                ts1_cnt <= ts1_cnt >= 8'h8 ? 8'h8 : ts1_cnt + 1;
                if (ordered_set_i[lane].rate_id.speed_change) begin
                  lane_speed_change_bit <= '1;
                end else begin
                  lane_speed_change_bit <= '0;
                end
              end else begin
                ts2_cnt <= '0;
              end
            end
          end
          ST_RECOVERY_RCVR_CFG: begin
            // pcie_tsos_t temp_os_holder = pcie_tsos_t'(ordered_set_r);
            //wait for incoming ts1-os...//skip if threshhold already reached
            if (ts2_valid_i[lane]) begin
              if((temp_ts6 == ordered_set_i[lane].ts_s6)
                  && ((curr_data_rate_r.rate < gen3) || ((curr_data_rate_r.rate >= gen3)
                                                         && ordered_set_i[lane].ts_s6.ts2.req_equal)) &&
                  (temp_rate_id == ordered_set_i[lane].rate_id) || !first_ts1)
              begin
                temp_ts6     <= ordered_set_i[lane].ts_s6;
                first_ts1    <= '1;
                temp_rate_id <= ordered_set_i[lane].rate_id;
                ts2_cnt      <= ts2_cnt >= 8'h8 ? 8'h8 : ts2_cnt + 1;
                if (ordered_set_i[lane].rate_id.speed_change) begin
                  lane_speed_change_bit <= '1;
                end else begin
                  lane_speed_change_bit <= '0;
                end
              end else begin
                first_ts1             <= '0;
                lane_speed_change_bit <= '0;
                ts2_cnt               <= '0;
              end
              // if (ordered_set_i[lane].ts_s6 == temp_os_holder.ts_s6
              // && ordered_set_i[lane].rate_id.rate == temp_os_holder.rate_id.rate) begin
              //   ts1_cnt <= ts1_cnt >= 8'h8 ? 8'h8 : ts1_cnt + 1;
              // end
              // else if((curr_data_rate_r.rate > gen2) &&
              //   (ordered_set_i[lane].lane_num == lane)
              //   &&(ordered_set_i[lane].link_num == link_number_selected )) begin
              //   ts1_cnt <= ts1_cnt >= 8'h8 ? 8'h8 : ts1_cnt + 1;
              // end else begin
              //   ts2_cnt <= '0;
              // end
            end
          end
          ST_RECOVERY_EQUAL_PHASE_1: begin
            if (ts1_valid_i[lane] && ((ordered_set_i[lane].ts_s6.ts1.ec == 2'b01))) begin
              ts1_cnt <= ts1_cnt >= 8'h2 ? 8'h2 : ts1_cnt + 1'b1;
              single_idle_received[lane] <= '0;
            end
          end
          ST_RECOVERY_IDLE: begin
            //wait for incoming ts1-os...//skip if threshhold already reached
            //using ts1_cnt as idle count
            if (idle_valid_i[lane]) begin
              single_idle_received[lane] <= '1;
              idle_cnt <= idle_cnt >= 8'h8 ? 8'h8 : idle_cnt + 1'b1;
              // ts1_cnt <= ts1_cnt + 1;
            end else if (ts1_valid_i[lane] || ts2_valid_i[lane]) begin
              idle_cnt <= '0;
            end
            if(ts1_valid_i[lane] || ts2_valid_i[lane] &&
                ((ordered_set_i[lane].link_num == PAD) && (ordered_set_i[lane].lane_num == PAD)))
            begin
              ts2_cnt <= ts2_cnt >= 8'h8 ? 8'h8 : ts2_cnt + 1'b1;
              single_idle_received[lane] <= '0;
            end
          end
          ST_CONFIGURATION_LINKWIDTH_START: begin
            //wait for incoming ts1-os...//skip if threshhold already reached
            if (ts1_valid_i[lane]) begin
              if (((ordered_set_i[lane].link_num == PAD) && (ordered_set_i[lane].lane_num == PAD)))
              begin
                first_ts1 <= '1;
              end
              //check that link number is not pad and that lane number is pad
              if ((ordered_set_i[lane].link_num != PAD) 
              && (ordered_set_i[lane].lane_num == PAD) /*&& first_ts1*/)
              begin
                //incrment ts1 count
                ts1_cnt <= ts1_cnt >= 8'hFF ? 8'hFF : ts1_cnt + 1;
              end else begin
                //reset ts1 cnt... this ensures that the TS1-OS are consecutive per the spec
                ts1_cnt <= '0;
              end
            end
            //check if consecutive TS1's satisfied for this lane
            if (link_width_satisfied[lane]) begin
              //select link number by choosing lowest significant lane satisfied
              //ignore all other lanes
              if ((lane == 0) || (link_width_satisfied[lane:0] == '0)) begin
                link_number_selected_per_lane[lane*8+:8] <= ordered_set_i[lane].link_num;
                lane_link_number_selected[lane] <= '1;
              end
            end
          end
          ST_CONFIGURATION_LINKWIDTH_ACCEPT: begin
            //wait for incoming ts1-os...//skip if threshhold already reached
            if (ts1_valid_i[lane]) begin
              //check that incoming link number matches the "link_number_selected"
              //that we are now transmitting and that lane number is different
              //from the one stored when we entered this state
              if ((ordered_set_i[lane].link_num == link_number_selected)) begin
                //increment count
                ts1_cnt <= ts1_cnt >= 8'h3 ? 8'h3 : ts1_cnt + 1;
                lane_in_save <= ordered_set_i[lane].lane_num;
              end else begin
                ts1_cnt <= '0;
              end
            end
          end
          ST_CONFIGURATION_LANENUM_WAIT: begin
            if (ts1_valid_i[lane] || ts2_valid_i[lane]) begin
              if (((ordered_set_i[lane].link_num != PAD)
                   && (ordered_set_i[lane].lane_num != lane_in_save)))
              begin
                ts1_cnt <= ts1_cnt >= 8'h3 ? 8'h3 : ts1_cnt + 1;
              end else begin
                ts1_cnt <= '0;
              end
            end
          end
          ST_CONFIGURATION_LANENUM_ACCEPT: begin
            if (ts1_valid_i[lane] || ts2_valid_i[lane]) begin
              if ((ordered_set_i[lane].link_num == link_number_selected)
                  && (ordered_set_i[lane].lane_num != PAD))
              begin
                ts1_cnt <= ts1_cnt >= 8'h8 ? 8'h8 : ts1_cnt + 1;
                if (lane == '0) begin
                  max_rate_per_lane[lane] <= ordered_set_i[lane].rate_id.rate > max_rate
                  ? ordered_set_i[lane].rate_id.rate : max_rate;
                  lane_max_rate_asserted[lane] <= '1;
                end
              end else begin
                ts1_cnt <= '0;
              end
            end
          end
          ST_CONFIGURATION_COMPLETE: begin
            if (ts2_valid_i[lane]) begin
              if ((ordered_set_i[lane].link_num == link_number_selected)
                  && (ordered_set_i[lane].lane_num == lane))
              begin
                ts2_cnt <= ts2_cnt >= 8'h8 ? 8'h8 : ts2_cnt + 1;
                ts1_cnt <= '0;
              end else begin
                ts1_cnt <= '0;
                ts2_cnt <= '0;
              end
            end
          end
          ST_CONFIGURATION_IDLE: begin
            //wait for incoming ts1-os...//skip if threshhold already reached
            //using ts1_cnt as idle count
            if (idle_valid_i[lane]) begin
              single_idle_received[lane] <= '1;
              ts1_cnt <= ts1_cnt >= 8'h8 ? 8'h8 : ts1_cnt + 1;
            end else if (ts1_valid_i[lane] || ts2_valid_i[lane]) begin
              ts1_cnt <= '0;
            end
          end
          default: begin
          end
        endcase
      end
    end
  end

  assign ordered_set_o    = ordered_set_r;
  assign curr_data_rate_o = curr_data_rate_r.rate;
  assign gen_os_ctrl_o    = gen_os_ctrl_r;

endmodule
