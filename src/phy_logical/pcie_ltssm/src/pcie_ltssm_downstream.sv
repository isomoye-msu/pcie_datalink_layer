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
    parameter int IS_ROOT_PORT  = 1,
    parameter int LINK_NUM      = 0,
    parameter int IS_UPSTREAM   = 0,                  //downstream by default
    parameter int CROSSLINK_EN  = 0,                  //crosslink not supported
    parameter int UPCONFIG_EN   = 0                   //upconfig not supported
) (
    input  logic                           clk_i,                   //! 100MHz clock signal
    input  logic                           rst_i,                   //! Reset signal
    // !Control
    input  logic                           en_i,
    input  logic                           link_up_i,
    input  logic                           is_timeout_i,
    input  logic                           recovery_i,
    output logic                           error_o,
    output logic                           success_o,
    output logic                           error_loopback_o,
    output logic                           error_disable_o,
    input  logic [      MAX_NUM_LANES-1:0] ts1_valid_i,
    input  logic [      MAX_NUM_LANES-1:0] ts2_valid_i,
    input  logic [      MAX_NUM_LANES-1:0] idle_valid_i,
    input  logic [(MAX_NUM_LANES * 8)-1:0] cfg_link_num_i,
    input  logic [(MAX_NUM_LANES * 8)-1:0] cfg_lane_num_i,
    input  logic [(MAX_NUM_LANES * 8)-1:0] link_num_i,
    input  logic [(MAX_NUM_LANES * 8)-1:0] lane_num_i,
    input  logic [(MAX_NUM_LANES * 8)-1:0] lane_num_transmitted_i,
    input  logic [      MAX_NUM_LANES-1:0] lane_active_i,
    input  logic [      MAX_NUM_LANES-1:0] lanes_ts2_satisfied_i,
    input  logic [      MAX_NUM_LANES-1:0] config_copmlete_ts2_i,
    input  logic                           from_l0_i,
    input  logic [      MAX_NUM_LANES-1:0] reciever_detected_i,
    input  logic [      MAX_NUM_LANES-1:0] electrical_idle_i,
    output logic [      MAX_NUM_LANES-1:0] tx_enter_elec_idle_o,

    output logic goto_cfg_o,
    output logic goto_detect_o,

    input  logic              ordered_set_tranmitted_i,
    output pcie_ordered_set_t ordered_set_o,
    output logic              send_ordered_set_o,

    //training set configuration signals
    input  ts_symbol6_union_t [MAX_NUM_LANES-1:0] symbol6_i,
    input  training_ctrl_t    [MAX_NUM_LANES-1:0] training_ctrl_i,
    input  rate_id_t          [MAX_NUM_LANES-1:0] rate_id_i,
    input  rate_id_e                              max_rate_i,
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
  localparam longint TwentyFourMsTimeOut = (24 * (10 ** 6)) / ClockPeriodNs;
  localparam longint FourtyEightMsTimeOut = (48 * (10 ** 6)) / ClockPeriodNs;
  localparam longint TwelveMsTimeOut = (12 * (10 ** 6)) / ClockPeriodNs;
  localparam longint TwoMsTimeOut = (2 * (10 ** 5)) / ClockPeriodNs;
  localparam longint OneMsTimeOut = (1 * (10 ** 6)) / ClockPeriodNs;
  localparam int SixUsTimeOut = (6 * (10 ** 3)) / ClockPeriodNs;
  localparam int EigthHundredNanoSecondTimeOut = (800) / ClockPeriodNs;
  localparam int TwentyNanoSeconds = 20* (10 **0)/ ClockPeriodNs;//(20 * (10** -9)); //)) / int'((1 / (CLK_RATE * $pow(10, 6))));

  typedef enum logic [7:0] {
    ST_IDLE,
    ST_DETECT,
    ST_DETECT_WAIT_ONE_MS,
    ST_DETECT_QUIET,
    ST_DETECT_ACTIVE,
    ST_DETECT_RX,
    ST_POLLING,
    ST_POLLING_ACTIVE,
    ST_POLLING_CONFIGURATION,
    ST_POLLING_COMPLIANCE,
    ST_CONFIGURATION,
    ST_CONFIGURATION_LINKWIDTH_START,
    ST_CONFIGURATION_LINKWIDTH_ACCEPT,
    ST_CONFIGURATION_LANENUM_ACCEPT,
    ST_CONFIGURATION_LANENUM_WAIT,
    ST_CONFIGURATION_COMPLETE,
    ST_CONFIGURATION_IDLE,
    ST_RECOVERY,
    ST_RECOVERY_RCVR_LOCK,
    ST_RECOVERY_RCVR_LOCK_TIMEOUT,
    ST_RECOVERY_EQUAL,
    ST_RECOVERY_SPEED,
    ST_RECOVERY_SPEED_WAIT,
    ST_RECOVERY_RCVR_CFG,
    ST_RECOVERY_IDLE,
    ST_RECOVERY_COMPLETE,
    ST_RECOVERY_EXT_SYNCH,
    ST_L0,
    ST_L0s,
    ST_L1,
    ST_L2,
    ST_DISABLED,
    ST_LOOPBACK,
    ST_HOT_RESET
  } ltssm_state_e;

  ltssm_state_e                          curr_state;
  ltssm_state_e                          next_state;
  pcie_ordered_set_t                     ordered_set_c;
  pcie_ordered_set_t                     ordered_set_r;
  logic              [             63:0] timer_c;
  logic              [             63:0] timer_r;
  logic                                  error_c;
  logic                                  error_r;
  logic                                  success_c;
  logic                                  success_r;
  logic                                  goto_detect_c;
  logic                                  goto_cfg_c;



  logic              [MAX_NUM_LANES-1:0] at_least_one_ts1_ts2;
  logic              [              7:0] axis_pkt_cnt_c;
  logic              [              7:0] axis_pkt_cnt_r;
  logic              [              7:0] try_cnt_c;
  logic              [              7:0] try_cnt_r;
  rate_id_t                              curr_data_rate_c;
  rate_id_t                              curr_data_rate_r;
  rate_id_t                              last_data_rate_c;
  rate_id_t                              last_data_rate_r;
  logic                                  successful_speed_negotiation_c;
  logic                                  successful_speed_negotiation_r;
  logic                                  changed_speed_recovery_c;
  logic                                  changed_speed_recovery_r;
  //! internal_axis_signals
  logic              [   DATA_WIDTH-1:0] ltssm_axis_tdata;
  logic              [   KEEP_WIDTH-1:0] ltssm_axis_tkeep;
  logic                                  ltssm_axis_tvalid;
  logic                                  ltssm_axis_tlast;
  logic              [   USER_WIDTH-1:0] ltssm_axis_tuser;
  logic                                  ltssm_axis_tready;

  //!link training helper signals
  logic              [MAX_NUM_LANES-1:0] link_width_satisfied;
  logic              [MAX_NUM_LANES-1:0] speed_change_bit_set;
  logic              [              7:0] link_selected;
  logic              [MAX_NUM_LANES-1:0] link_lanes_formed;
  logic              [MAX_NUM_LANES-1:0] lane_num_formed;
  logic              [MAX_NUM_LANES-1:0] lane_num_satisfied;

  logic              [             15:0] ordered_set_sent_cnt_c;
  logic              [             15:0] ordered_set_sent_cnt_r;

  logic              [MAX_NUM_LANES-1:0] link_lanes_nums_match;
  logic              [MAX_NUM_LANES-1:0] link_lane_reconfig;

  logic              [MAX_NUM_LANES-1:0] ts1_lanenum_wait_satisfied;
  logic              [              7:0] idle_to_rlock_transitioned_c;
  logic              [              7:0] idle_to_rlock_transitioned_r;

  logic              [MAX_NUM_LANES-1:0] lane_status_c;
  logic              [MAX_NUM_LANES-1:0] lane_status_r;
  logic              [MAX_NUM_LANES-1:0] lanes_detected_c;
  logic              [MAX_NUM_LANES-1:0] lanes_detected_r;


  logic              [MAX_NUM_LANES-1:0] single_idle_recieved;
  logic              [MAX_NUM_LANES-1:0] link_idle_satisfied;

  //training sequence satisfy signals
  logic              [MAX_NUM_LANES-1:0] lanes_ts1_satisfied;
  logic              [MAX_NUM_LANES-1:0] lanes_ts2_satisfied;

  logic              [MAX_NUM_LANES-1:0] ts1_ts2_cnt_satisfied;
  logic                                  transmit_ordered_set;
  logic                                  ordered_set_tx_in_process_c;
  logic                                  ordered_set_tx_in_process_r;
  ts2_symbol6_t                          ts2_symbol6;
  rate_id_t                              rate_id;
  // rate_id = last_data_rate_r;



  //! main sequential block
  always_ff @(posedge clk_i) begin : main_seq
    if (rst_i) begin
      curr_state                  <= ST_IDLE;
      timer_r                     <= '0;
      error_r                     <= '0;
      success_r                   <= '0;
      lane_status_r               <= '0;
      ordered_set_sent_cnt_r      <= '0;
      axis_pkt_cnt_r              <= '0;
      try_cnt_r                   <= '0;
      changed_speed_recovery_r    <= '0;
      goto_detect_o               <= '0;
      goto_cfg_o                  <= '0;
      lane_status_r               <= '0;
      lanes_detected_r            <= '0;
      ordered_set_tx_in_process_r <= '0;
      curr_data_rate_r            <= gen1_basic;
    end else begin
      curr_state                  <= next_state;
      timer_r                     <= timer_c;
      error_r                     <= error_c;
      success_r                   <= success_c;
      lane_status_r               <= lane_status_c;
      ordered_set_sent_cnt_r      <= ordered_set_sent_cnt_c;
      axis_pkt_cnt_r              <= axis_pkt_cnt_c;
      try_cnt_r                   <= try_cnt_c;
      last_data_rate_r            <= last_data_rate_c;
      changed_speed_recovery_r    <= changed_speed_recovery_c;
      goto_detect_o               <= goto_detect_c;
      goto_cfg_o                  <= goto_cfg_c;
      lane_status_r               <= lane_status_c;
      lanes_detected_r            <= lanes_detected_c;
      curr_data_rate_r            <= curr_data_rate_c;
      ordered_set_tx_in_process_r <= ordered_set_tx_in_process_c;
    end
    //non-resetable
    last_data_rate_r               <= gen1_basic;
    send_ordered_set_o             <= transmit_ordered_set;
    ordered_set_r                  <= ordered_set_c;
    successful_speed_negotiation_r <= successful_speed_negotiation_c;
    idle_to_rlock_transitioned_r   <= idle_to_rlock_transitioned_c;
  end


  always_comb begin : ltssm_combo
    next_state                     = curr_state;
    timer_c                        = timer_r;
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
    //ordered set
    ordered_set_c                  = ordered_set_r;
    changed_speed_recovery_c       = changed_speed_recovery_r;
    successful_speed_negotiation_c = successful_speed_negotiation_r;
    idle_to_rlock_transitioned_c   = idle_to_rlock_transitioned_r;
    transmit_ordered_set           = '0;
    rate_id                        = last_data_rate_r;
    case (curr_state)
      //*********************************************************
      // Idle
      //*********************************************************
      ST_IDLE: begin
        if (en_i) begin
          timer_c                      = '0;
          idle_to_rlock_transitioned_c = '0;
          gen_idle(ordered_set_c);
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
        //bounded timeout counter
        timer_c = (timer_r >= OneMsTimeOut) ? OneMsTimeOut : timer_r + 1;
        if (timer_r >= OneMsTimeOut) begin
          next_state = ST_DETECT_QUIET;
        end
      end
      //*********************************************************
      // Detect.Quiet
      //*********************************************************
      ST_DETECT_QUIET: begin
        //bounded timeout counter
        timer_c              = (timer_r >= TwelveMsTimeOut) ? TwelveMsTimeOut : timer_r + 1;
        transmit_ordered_set = '1;
        if (((|lane_status_i) || (timer_r >= TwelveMsTimeOut)) && (ordered_set_tranmitted_i)) begin
          //reset counts
          timer_c       = '0;
          next_state    = ST_DETECT_ACTIVE;
          timer_c       = '0;
          lane_status_c = lane_status_i;
        end
      end
      //*********************************************************
      // Detect.Active
      //*********************************************************
      ST_DETECT_ACTIVE: begin
        //bounded timeout counter
        timer_c              = (timer_r >= TwoMsTimeOut) ? TwoMsTimeOut : timer_r + 1;
        transmit_ordered_set = '1;
        if ((ordered_set_tranmitted_i)) begin
          if (&lane_status_i) begin
            success_c        = '1;
            timer_c          = '0;
            lanes_detected_c = lane_status_i;
            next_state       = ST_POLLING;
          end else if ((timer_r >= TwoMsTimeOut)) begin
            if (|lane_status_i) begin
              success_c        = '1;
              timer_c          = '0;
              lanes_detected_c = lane_status_i;
              next_state       = ST_DETECT_RX;
            end else begin
              error_c    = '1;
              timer_c    = '0;
              next_state = ST_IDLE;
            end
          end
        end
      end
      //*********************************************************
      // Detect.Recever.Detection
      //*********************************************************
      ST_DETECT_RX: begin
        timer_c              = timer_r + 1;
        transmit_ordered_set = '1;
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
        timer_c                = '0;
        next_state             = ST_POLLING_ACTIVE;
        ordered_set_sent_cnt_c = '0;
        gen_tsos(ordered_set_c, gen1, TS1);
      end
      //*********************************************************
      // Polling.Active
      //*********************************************************
      ST_POLLING_ACTIVE: begin
        //bounded timeout counter
        timer_c = (timer_r >= TwentyFourMsTimeOut) ? TwentyFourMsTimeOut : timer_r + 1;
        transmit_ordered_set = '1;
        //The Transmitter must wait for its TX common mode to settle before exiting from Electrical
        //Idle and transmitting the TS1 Ordered Sets.
        // Phy transmitter handles common mode settling, will throttle with tready
        //check if timer reached or TSOS sent count met
        //check if last packet in frame
        if (ordered_set_tranmitted_i) begin
          ordered_set_sent_cnt_c = ordered_set_sent_cnt_r + 1;

          if ((timer_r >= TwentyFourMsTimeOut) || (ordered_set_sent_cnt_r >= 1024)) begin
            //reset counts
            timer_c                = '0;
            ordered_set_sent_cnt_c = '0;
            //check if ts1 reqs satisfied
            if (&lanes_ts1_satisfied) begin
              //build ts2 ordered set
              gen_tsos(ordered_set_c, gen1, TS2);
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
        timer_c = (timer_r >= FourtyEightMsTimeOut) ? FourtyEightMsTimeOut : timer_r + 1;
        transmit_ordered_set = '1;
        if (ordered_set_tranmitted_i) begin
          if (&lanes_ts2_satisfied) begin
            //assert success
            success_c  = '1;
            //reset counts
            timer_c    = '0;
            ordered_set_sent_cnt_c = '0;
            gen_tsos(ordered_set_c, gen1, TS1);
            //goto wait low
            next_state = ST_CONFIGURATION;
          end  //check timeout count
      else if (timer_r >= TwentyFourMsTimeOut) begin
            timer_c    = '0;
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
        transmit_ordered_set = '1;
        if (ordered_set_tranmitted_i) begin
          ordered_set_sent_cnt_c = ordered_set_sent_cnt_r + 1'b1;
          if (ordered_set_sent_cnt_r >= 4) begin
            gen_tsos(ordered_set_c, gen1, TS1, train_seq_e'(LINK_NUM));
            ordered_set_sent_cnt_c = '0;
            next_state             = ST_CONFIGURATION_LINKWIDTH_START;
          end
        end
      end
      //-----------------------------------------------------------
      //  Configuration.Linkwidth.Start
      //-----------------------------------------------------------
      ST_CONFIGURATION_LINKWIDTH_START: begin
        //bounded counter for timeout scenario
        timer_c              = (timer_r >= TwentyFourMsTimeOut) ? TwentyFourMsTimeOut : timer_r + 1;
        transmit_ordered_set = '1;
        if (ordered_set_tranmitted_i) begin
          //check if pcie state continue scenario satisfied
          if (|link_width_satisfied) begin
            //reset ordered set sent counter
            ordered_set_sent_cnt_c = '0;
            //build next ordered set
            gen_tsos(ordered_set_c, gen1, TS1, train_seq_e'(link_selected));
            //reset timer
            timer_c = '0;
            //goto next pcie ltssm state
            next_state = ST_CONFIGURATION_LINKWIDTH_ACCEPT;
          end  //check timeout counter
          else if (timer_r >= TwentyFourMsTimeOut) begin
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
        //bounded counter for timeout scenario
        timer_c              = (timer_r >= TwoMsTimeOut) ? TwoMsTimeOut : timer_r + 1;
        transmit_ordered_set = '1;
        if ((ordered_set_tranmitted_i)) begin
          //check if pcie state continue scenario satisfied
          if ((|link_lanes_formed) && (!(^link_lanes_formed))) begin
            timer_c = '0;
            gen_tsos(ordered_set_c, gen1, TS2, train_seq_e'(link_selected), train_seq_e'(0));
            next_state = ST_CONFIGURATION_LANENUM_WAIT;
          end  //check timeout counter
          else if (timer_r >= TwoMsTimeOut) begin
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
        timer_c              = (timer_r >= TwoMsTimeOut) ? TwoMsTimeOut : timer_r + 1;
        transmit_ordered_set = '1;
        if (ordered_set_tranmitted_i) begin
          //check if lanes can be formed
          if (|link_lanes_nums_match) begin
            //build ts2 ordered set
            gen_tsos(ordered_set_c, gen1, TS2, train_seq_e'(LINK_NUM), train_seq_e'(0));
            timer_c    = '0;
            //goto config complete
            next_state = ST_CONFIGURATION_COMPLETE;
          end  //check reconfiguration scenario
          else if (|link_lane_reconfig) begin
            timer_c    = '0;
            next_state = ST_CONFIGURATION_LANENUM_WAIT;
          end  //check timeout counter
          else if (timer_r >= TwoMsTimeOut) begin
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
        //bounded timeout counter increment
        timer_c              = (timer_r >= TwoMsTimeOut) ? TwoMsTimeOut : timer_r + 1;
        transmit_ordered_set = '1;
        if (ordered_set_tranmitted_i) begin
          //check if lane wait exit scenario satisfied
          if (|ts1_lanenum_wait_satisfied) begin
            timer_c = '0;
            gen_tsos(ordered_set_c, gen1, TS1, train_seq_e'(LINK_NUM), train_seq_e'(0));
            //goto lanenum accept
            next_state = ST_CONFIGURATION_LANENUM_ACCEPT;
          end  //check timeout counter
          else if (timer_r >= TwoMsTimeOut) begin
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
        //bounded timeout counter
        timer_c              = (timer_r >= TwoMsTimeOut) ? TwoMsTimeOut : timer_r + 1;
        transmit_ordered_set = '1;
        if (ordered_set_tranmitted_i) begin
          //check exit scenario
          if (&lane_num_formed) begin
            //decrement counts
            ordered_set_sent_cnt_c = '0;

            timer_c                = '0;
            //build idle ordered set
            gen_idle(ordered_set_c);
            //goto config idle
            next_state = ST_CONFIGURATION_IDLE;
          end  //check timeout counter
          else if (timer_r >= TwoMsTimeOut) begin
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
        //bounded timeout counter
        timer_c              = (timer_r >= TwoMsTimeOut) ? TwoMsTimeOut : timer_r + 1;
        transmit_ordered_set = '1;
        if (ordered_set_tranmitted_i) begin
          //check if idle recieved
          if (|single_idle_recieved) begin
            //start counting idle OS sent
            ordered_set_sent_cnt_c = ordered_set_sent_cnt_r + 1;
          end
          //check if number of idle OS recieved and idle OS sent
          if (link_idle_satisfied && (ordered_set_sent_cnt_r >= 16)) begin
            //assert success.. tells ltssm hierarchy to move to its next state
            success_c                    = '1;
            //reset counters
            ordered_set_sent_cnt_c       = '0;
            //increment idle_to_rlock_transitioned_c
            idle_to_rlock_transitioned_c = idle_to_rlock_transitioned_r + 1;
            //goto wait for ena low
            next_state                   = ST_L0;
          end  //check timeout counter
          else if (timer_r >= TwoMsTimeOut) begin

            idle_to_rlock_transitioned_c = '1;
            //assert error
            error_c                      = '1;
            //goto wait low
            next_state                   = ST_IDLE;
          end
        end
      end
      ST_RECOVERY: begin
        timer_c = '0;
        //if data rate is gen1 and we've tried three times stay at gen1
        if (last_data_rate_r.rate != gen1) begin
          last_data_rate_c.speed_change = '1;
        end
        gen_tsos(ordered_set_c, rate_speed_e'(last_data_rate_r.rate), TS1, train_seq_e'(LINK_NUM),
                 train_seq_e'(0), last_data_rate_c);
        ordered_set_sent_cnt_c = '0;
        // if (recovery_i && !is_timeout_i) begin
        // ordered_set_c.rate_id[6] = '1;
        // end
        next_state             = ST_RECOVERY_RCVR_LOCK;
      end
      //-----------------------------------------------------------
      //  Recoverty.Lock
      //-----------------------------------------------------------
      ST_RECOVERY_RCVR_LOCK: begin
        //TODO: WAY too much happening in this state... break it up man.
        //bounded counter for timeout scenario
        timer_c              = (timer_r >= TwentyFourMsTimeOut) ? TwentyFourMsTimeOut : timer_r + 1;
        transmit_ordered_set = '1;
        //check if pcie state continue scenario satisfied
        if (&ts1_ts2_cnt_satisfied) begin
          ts2_symbol6            = '0;
          //deassert valid and reset counter
          ordered_set_sent_cnt_c = '0;
          timer_c                = '0;
          if (extended_synch_i) begin
            //goto next pcie ltssm state
            next_state = ST_RECOVERY_EXT_SYNCH;
          end else begin
            //build next ordered set
            if (max_rate_i == gen3) begin
              ts2_symbol6.req_equal = '1;
            end
            gen_tsos(ordered_set_c, rate_speed_e'(last_data_rate_r.rate), TS2,
                     train_seq_e'(LINK_NUM), train_seq_e'(0), last_data_rate_r, '0, ts2_symbol6);
            //goto next pcie ltssm state
            next_state = ST_RECOVERY_RCVR_CFG;
          end
        end  //check timeout counter
        else if (timer_r >= TwentyFourMsTimeOut) begin
          next_state = ST_RECOVERY_RCVR_LOCK_TIMEOUT;
        end
      end
      ST_RECOVERY_RCVR_LOCK_TIMEOUT: begin
        //check secondary config transition
        if ((|(ts1_ts2_cnt_satisfied & speed_change_bit_set)) ||
          curr_data_rate_r.rate != gen1 ||
          max_rate_i != gen1 || last_data_rate_r.rate != gen1) begin
          //build next ordered set
          if (max_rate_i == gen3) begin
            ts2_symbol6.req_equal = '1;
          end
          gen_tsos(ordered_set_c, rate_speed_e'(last_data_rate_r.rate), TS2, train_seq_e'(LINK_NUM),
                   train_seq_e'(0), last_data_rate_r, '0, ts2_symbol6);
          //goto next pcie ltssm state
          next_state = ST_RECOVERY_RCVR_CFG;
        end else begin
          if (!changed_speed_recovery_r && curr_data_rate_r.rate != gen1) begin
            gen_tsos(ordered_set_c, rate_speed_e'(last_data_rate_r.rate), TS2,
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
      ST_RECOVERY_EXT_SYNCH: begin
        transmit_ordered_set = '1;
        //check if last packet in frame
        if (ordered_set_tranmitted_i) begin
          ordered_set_sent_cnt_c = ordered_set_sent_cnt_r + 1'b1;
        end
        //check if pcie state continue scenario satisfied
        if (ordered_set_sent_cnt_r >= 12'd1024) begin
          ts2_symbol6            = '0;
          //deassert valid and reset counter
          ordered_set_sent_cnt_c = '0;
          timer_c                = '0;
          //build next ordered set
          if (max_rate_i == gen3) begin
            ts2_symbol6.req_equal = '1;
          end
          // gen_tsos(ordered_set_c, last_data_rate_r.rate, TS2, link_num_i, lane_num_i, last_data_rate_r, '0,
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
      ST_RECOVERY_RCVR_CFG: begin
        //bounded counter for timeout scenario
        timer_c = (timer_r >= TwentyFourMsTimeOut) ? TwentyFourMsTimeOut : timer_r + 1;
        if (timer_r >= TwentyFourMsTimeOut) begin
          timer_c = '0;
          next_state = ST_RECOVERY_RCVR_LOCK_TIMEOUT;
        end
      end
      ST_RECOVERY_SPEED: begin
        tx_enter_elec_idle_o = '1;
        //bounded counter for timeout scenario
        timer_c = (timer_r >= TwentyFourMsTimeOut) ? TwentyFourMsTimeOut : timer_r + 1;
        if (&electrical_idle_i) begin
          //bounded counter for timeout scenario
          next_state = ST_RECOVERY_SPEED_WAIT;
        end  //check timeout counter
        else if (timer_r >= FourtyEightMsTimeOut) begin
          next_state = ST_IDLE;
        end
      end
      ST_RECOVERY_SPEED_WAIT: begin
        //bounded counter for timeout scenario
        timer_c = (timer_r >= TwentyFourMsTimeOut) ? TwentyFourMsTimeOut : timer_r + 1;
        if (successful_speed_negotiation_r) begin
          if (timer_r >= EigthHundredNanoSecondTimeOut) begin
            curr_data_rate_c = max_rate_i;
            changed_speed_recovery_c = '1;
            next_state = ST_RECOVERY_RCVR_LOCK;
          end
        end else if (timer_r >= SixUsTimeOut) begin
          if (changed_speed_recovery_r) begin
            curr_data_rate_c = curr_data_rate_r;
            changed_speed_recovery_c = '0;
            next_state = ST_RECOVERY_RCVR_LOCK;
          end
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

    logic              [7:0] lane_in_save;
    logic                    first_ts1;
    ts_symbol6_union_t       temp_ts6;
    rate_id_t                temp_rate_id;
    logic                    lane_speed_change_bit;


    //determine if TS1 req satisfied for lane by its count
    assign link_width_satisfied[lane]       = (ts1_cnt == 8'h2) | (ts2_cnt == 8'h2);
    //determine if TS1 req satisfied for lane by its count
    assign link_lanes_formed[lane]          = (ts1_cnt == 8'h2);
    //determine if TS1 req satisfied
    assign ts1_lanenum_wait_satisfied[lane] = (ts1_cnt == 8'h2);
    assign link_lanes_nums_match[lane]      = (ts1_cnt == 8'h2);
    assign link_lane_reconfig[lane]         = (ts1_cnt == 8'h2);
    assign lane_num_formed[lane]            = lane_active_i[lane] ? (ts2_cnt == 8'h8) : '1;
    //determine if TS1 req satisfied for lane by its count
    assign link_idle_satisfied[lane]        = (ts1_cnt >= 8'h8);
    assign ts1_ts2_cnt_satisfied[lane]      = (ts1_cnt == 8'h8) || (ts2_cnt == 8'h8);
    assign speed_change_bit_set[lane]       = ts1_ts2_cnt_satisfied & lane_speed_change_bit;
    assign at_least_one_ts1_ts2[lane]       = (ts1_cnt != '0) | (ts2_cnt != '0);
    //assignments for state exit scenarios
    assign lanes_ts1_satisfied[lane]        = reciever_detected_i[lane] ? (ts1_cnt == 8'h8) : '1;
    assign lanes_ts2_satisfied[lane]        = reciever_detected_i[lane] ? (ts2_cnt == 8'h8) : '1;
    //sequential block
    always_ff @(posedge clk_i) begin : cnt_ts1
      if (rst_i) begin
        ts1_cnt                    <= '0;
        ts2_cnt                    <= '0;
        first_ts1                  <= '0;
        link_selected              <= '0;
        lane_in_save               <= '0;
        single_idle_recieved[lane] <= '0;
        temp_ts6                   <= '0;
        lane_speed_change_bit      <= '0;
      end else begin
        case (curr_state)
          ST_IDLE: begin
            ts1_cnt                    <= '0;
            ts2_cnt                    <= '0;
            first_ts1                  <= '0;
            single_idle_recieved[lane] <= '0;
          end
          ST_POLLING_ACTIVE: begin
            if (next_state != curr_state) begin
              ts1_cnt <= '0;
              ts2_cnt <= '0;
            end else if (ts1_valid_i[lane] && (ts1_cnt != 8'h8)) begin
              if(((link_num_i[lane*8 +: 8] == PAD) && (lane_num_i[lane*8 +: 8] == PAD)) &&
                training_ctrl_i[lane].loopback || training_ctrl_i[lane][4]) begin
                ts1_cnt <= ts1_cnt + 1;
              end else begin
                ts1_cnt <= '0;
              end
            end else if (ts2_valid_i[lane] && (ts1_cnt != 8'h8)) begin
              if (((link_num_i[lane*8+:8] == PAD) && (lane_num_i[lane*8+:8] == PAD))) begin
                ts1_cnt <= ts1_cnt + 1;
              end else begin
                ts1_cnt <= '0;
              end
            end
          end
          ST_POLLING_CONFIGURATION: begin
            if (next_state != curr_state) begin
              ts1_cnt <= '0;
              ts2_cnt <= '0;
            end else if (ts2_valid_i[lane] && (ts2_cnt != 8'h8)) begin
              if (((link_num_i[lane*8+:8] == PAD) && (lane_num_i[lane*8+:8] == PAD))) begin
                ts2_cnt <= ts2_cnt + 1;
              end else begin
                ts2_cnt <= '0;
              end
            end
          end
          ST_RECOVERY_RCVR_LOCK, ST_RECOVERY_RCVR_LOCK_TIMEOUT: begin
            if (next_state != curr_state && (next_state != ST_RECOVERY_RCVR_LOCK_TIMEOUT)) begin
              ts1_cnt                    <= '0;
              ts2_cnt                    <= '0;
              single_idle_recieved[lane] <= '0;
            end else
            //wait for incoming ts1-os...//skip if threshhold already reached
            if (ts1_valid_i[lane]) begin
              if ((symbol6_i[lane].ts1.ec != '0) ||
              !((lane_num_i[lane*8+:8] == cfg_lane_num_i[lane*8+:8]) &&
              link_num_i[lane*8+:8] && cfg_link_num_i[lane*8+:8])) begin
                ts1_cnt <= '0;
              end else begin
                ts1_cnt <= ts1_cnt + 1;
                if (rate_id_i[lane].speed_change) begin
                  lane_speed_change_bit <= '1;
                end else begin
                  lane_speed_change_bit <= '0;
                end
              end
            end
            //wait for incoming ts2-os...//skip if threshhold already reached
            if (ts2_valid_i[lane]) begin
              if ((symbol6_i[lane].ts1.ec != '0) || !((lane_num_i[lane*8+:8] == cfg_lane_num_i[lane*8+:8]) &&
              link_num_i[lane*8+:8] && cfg_link_num_i[lane*8+:8])) begin
                ts2_cnt <= '0;
              end else begin
                ts2_cnt <= ts2_cnt + 1;
                if (rate_id_i[lane].speed_change) begin
                  lane_speed_change_bit <= '1;
                end else begin
                  lane_speed_change_bit <= '0;
                end
              end
            end
          end
          ST_RECOVERY_RCVR_CFG: begin
            if (next_state != curr_state) begin
              ts1_cnt                    <= '0;
              ts2_cnt                    <= '0;
              single_idle_recieved[lane] <= '0;
            end else
            //wait for incoming ts1-os...//skip if threshhold already reached
            if (ts2_valid_i[lane]) begin
              temp_ts6 <= symbol6_i;
              temp_rate_id <= curr_data_rate_r;
              if (curr_data_rate_r.rate != gen3 && symbol6_i[lane].ts2.req_equal
              && symbol6_i == temp_ts6) begin
                ts2_cnt <= ts2_cnt + 1;
              end
              else if((curr_data_rate_r.rate == gen3) && (
                curr_data_rate_r == temp_rate_id) && (curr_data_rate_r.speed_change == '1)) begin
                ts2_cnt <= ts2_cnt + 1;
              end else begin
                ts2_cnt <= '0;
              end
            end
          end
          ST_CONFIGURATION_LINKWIDTH_START: begin
            if (next_state != curr_state) begin
              ts1_cnt <= '0;
              ts2_cnt <= '0;
              single_idle_recieved[lane] <= '0;
            end else
            //wait for incoming ts1-os...//skip if threshhold already reached
            if (ts1_valid_i[lane] && (ts1_cnt != 8'h2)) begin
              if (((link_num_i[lane*8+:8] == PAD) && (lane_num_i[lane*8+:8] == PAD))) begin
                first_ts1 <= '1;
              end
              //check that link number is not pad and that lane number is pad
              if ((link_num_i[lane*8+:8] != PAD) && (lane_num_i[lane*8+:8] == PAD) && first_ts1) begin
                //incrment ts1 count
                ts1_cnt <= ts1_cnt + 1;
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
                link_selected <= link_num_i[lane*8+:8];
              end
            end
          end
          ST_CONFIGURATION_LINKWIDTH_ACCEPT: begin
            if (next_state != curr_state) begin
              ts1_cnt <= '0;
              ts2_cnt <= '0;
              single_idle_recieved[lane] <= '0;
            end else
            //wait for incoming ts1-os...//skip if threshhold already reached
            if (ts1_valid_i[lane] && (ts1_cnt != 8'h2)) begin
              //check that incoming link number matches the "link_selected"
              //that we are now transmitting and that lane number is different
              //from the one stored when we entered this state
              if ((link_num_i[lane*8+:8] == link_selected)) begin
                //increment count
                ts1_cnt <= ts1_cnt + 1;
                lane_in_save <= link_num_i[lane*8+:8];
              end else begin
                ts1_cnt <= '0;
              end
            end
          end
          ST_CONFIGURATION_LANENUM_WAIT: begin
            if (next_state != curr_state) begin
              ts1_cnt <= '0;
              ts2_cnt <= '0;
              single_idle_recieved[lane] <= '0;
            end else if (ts1_valid_i[lane] && (ts1_cnt != 8'h2)) begin
              if (((link_num_i[lane*8+:8] != PAD) && (lane_num_i[lane*8+:8] != lane_in_save))) begin
                ts1_cnt <= ts1_cnt + 1;
              end else begin
                ts1_cnt <= '0;
              end
            end
          end
          ST_CONFIGURATION_LANENUM_ACCEPT: begin
            if (next_state != curr_state) begin
              ts1_cnt <= '0;
              ts2_cnt <= '0;
              single_idle_recieved[lane] <= '0;
            end else if (ts1_valid_i[lane] && (ts1_cnt != 8'h2)) begin
              if ((link_num_i[lane*8+:8] == link_selected) && (lane_num_i[lane*8+:8] != PAD)) begin
                ts1_cnt <= ts1_cnt + 1;
              end else begin
                ts1_cnt <= '0;
              end
            end
          end
          ST_CONFIGURATION_COMPLETE: begin
            if (next_state != curr_state) begin
              ts1_cnt <= '0;
              ts2_cnt <= '0;
              single_idle_recieved[lane] <= '0;
            end else if (ts2_valid_i[lane] && (ts2_cnt != 8'h8)) begin
              if ((link_num_i[lane*8+:8] == link_selected) &&
              (lane_num_i[lane*8+:8] == lane_num_transmitted_i[lane*8+:8]) &&
              rate_id_i[lane] == gen3_basic) begin
                ts2_cnt <= ts2_cnt + 1;
                ts1_cnt <= '0;
              end else begin
                ts1_cnt <= '0;
                ts2_cnt <= '0;
              end
            end
          end
          ST_CONFIGURATION_IDLE: begin
            if (next_state != curr_state) begin
              ts1_cnt <= '0;
              ts2_cnt <= '0;
              single_idle_recieved[lane] <= '0;
            end else
            //wait for incoming ts1-os...//skip if threshhold already reached
            //using ts1_cnt as idle count
            if (idle_valid_i[lane] && (ts1_cnt != 8'h8)) begin
              single_idle_recieved[lane] <= '1;
              ts1_cnt <= ts1_cnt + 1;
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

endmodule
