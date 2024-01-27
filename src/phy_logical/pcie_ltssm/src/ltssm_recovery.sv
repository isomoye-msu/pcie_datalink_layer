//! @title ltssm_recovery
//! @author Idris Somoye
//! Module implements the pcie physical layer link training recovery state.
//! master axis bus.
//!
//! Module does not support upconfig!
//!
//! Module does not support crosslink!
module ltssm_recovery
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
    input  logic                           clk_i,                    //! 100MHz clock signal
    input  logic                           rst_i,                    //! Reset signal
    // !Control
    input  logic                           en_i,
    input  logic                           link_up_i,
    input  logic                           is_timeout_i,
    input  logic                           recovery_i,
    output logic                           error_o,
    output logic                           success_o,
    input  logic [      MAX_NUM_LANES-1:0] ts1_valid_i,
    input  logic [      MAX_NUM_LANES-1:0] ts2_valid_i,
    input  logic [      MAX_NUM_LANES-1:0] idle_valid_i,
    input  logic [(MAX_NUM_LANES * 8)-1:0] cfg_link_num_i,
    input  logic [(MAX_NUM_LANES * 8)-1:0] cfg_lane_num_i,
    input  logic [(MAX_NUM_LANES * 8)-1:0] link_num_i,
    input  logic [(MAX_NUM_LANES * 8)-1:0] lane_num_i,
    input  logic [(MAX_NUM_LANES * 8)-1:0] lane_num_transmitted_i,
    input  logic [(MAX_NUM_LANES * 8)-1:0] training_ctrl_i,
    input  logic [      MAX_NUM_LANES-1:0] lane_active_i,
    input  logic [      MAX_NUM_LANES-1:0] lanes_ts2_satisfied_i,
    input  logic [      MAX_NUM_LANES-1:0] config_copmlete_ts2_i,
    input  logic                           directed_speed_change_i,
    input  logic                           from_l0_i,

    output logic goto_cfg_o,
    output logic goto_detect_o,

    //training set configuration signals
    input  ts_symbol6_union_t [MAX_NUM_LANES-1:0] symbol6_i,
    input  rate_id_t          [MAX_NUM_LANES-1:0] rate_id_i,
    input  rate_id_e                              max_rate_i,
    input  logic                                  extended_synch_i,
    //TODO: this needs to be computed from ts1's/ ts2's with
    //speed change bit or sw active
    input  logic                                  directed_speed_change_i,
    input  rate_id_t                              curr_data_rate_i,
    output rate_id_t                              data_rate_o,
    output logic                                  changed_speed_recovery_o,
    //! @virtualbus master_axis_bus @dir out
    output logic              [   DATA_WIDTH-1:0] m_axis_tdata,
    output logic              [   KEEP_WIDTH-1:0] m_axis_tkeep,
    output logic                                  m_axis_tvalid,
    output logic                                  m_axis_tlast,
    output logic              [   USER_WIDTH-1:0] m_axis_tuser,
    input  logic                                  m_axis_tready
    //! @end
);

  localparam int TwentyFourMsTimeOut = 32'h015B8D80;//int'((CLK_RATE) * ((24**(2)))); //32'h015B8D80;  //temp value
  localparam int TwoMsTimeOut =  32'h000B8D80;//int'((CLK_RATE) * ((2**(2)))); // 32'h000B8D80;  //temp value

  //! module state machine enum
  typedef enum logic [4:0] {
    ST_IDLE,
    ST_RCVR_LOCK,
    ST_RCVR_EQUAL,
    ST_RCVR_SPEED,
    ST_RCVR_CFG,
    ST_RCVR_IDLE,
    ST_RCVR_COMPLETE,
    ST_WAIT_EN_LOW
  } detect_st_e;

  typedef enum logic {
    ST_CNT_IDLE,
    ST_CNT_TS1
  } state_e;



  detect_st_e                            curr_state;
  detect_st_e                            next_state;
  pcie_ordered_set_t                     ordered_set_c;
  pcie_ordered_set_t                     ordered_set_r;
  logic              [             31:0] timer_c;
  logic              [             31:0] timer_r;
  logic                                  error_c;
  logic                                  error_r;
  logic                                  success_c;
  logic                                  success_r;

  logic                                  goto_detect_c;
  logic                                  goto_cfg_c;



  logic              [MAX_NUM_LANES-1:0] at_least_one_ts1_ts2;

  logic              [             15:0] ordered_set_sent_cnt_c;
  logic              [             15:0] ordered_set_sent_cnt_r;
  logic              [              7:0] axis_pkt_cnt_c;
  logic              [              7:0] axis_pkt_cnt_r;
  logic              [              7:0] try_cnt_c;
  logic              [              7:0] try_cnt_r;
  rate_id_t                              last_rate_c;
  rate_id_t                              last_rate_r;
  logic                                  changed_speed_recovery_c;
  logic                                  changed_speed_recovery_r;
  //! internal_axis_signals
  logic              [   DATA_WIDTH-1:0] rcvr_axis_tdata;
  logic              [   KEEP_WIDTH-1:0] rcvr_axis_tkeep;
  logic                                  rcvr_axis_tvalid;
  logic                                  rcvr_axis_tlast;
  logic              [   USER_WIDTH-1:0] rcvr_axis_tuser;
  logic                                  rcvr_axis_tready;

  //!link training helper signals
  logic              [MAX_NUM_LANES-1:0] link_width_satisfied;
  logic              [MAX_NUM_LANES-1:0] speed_change_bit_set;
  logic              [              7:0] link_selected;
  logic              [MAX_NUM_LANES-1:0] link_lanes_formed;
  logic              [MAX_NUM_LANES-1:0] lane_num_formed;
  logic              [MAX_NUM_LANES-1:0] lane_num_satisfied;

  logic              [MAX_NUM_LANES-1:0] link_lanes_nums_match;
  logic              [MAX_NUM_LANES-1:0] link_lane_reconfig;

  logic              [MAX_NUM_LANES-1:0] ts1_lanenum_wait_satisfied;
  // logic [MAX_NUM_LANES-1:0] link_lane_reconfig;

  logic              [MAX_NUM_LANES-1:0] lane_status_c;
  logic              [MAX_NUM_LANES-1:0] lane_status_r;
  logic              [MAX_NUM_LANES-1:0] lanes_detected_c;
  logic              [MAX_NUM_LANES-1:0] lanes_detected_r;


  logic              [MAX_NUM_LANES-1:0] single_idle_recieved;
  logic              [MAX_NUM_LANES-1:0] link_idle_satisfied;

  logic                                  ts1_ts2_cnt_satisfied;


  //! main sequential block
  always_ff @(posedge clk_i or posedge rst_i) begin : main_seq
    if (rst_i) begin
      curr_state               <= ST_IDLE;
      timer_r                  <= '0;
      error_r                  <= '0;
      success_r                <= '0;
      lane_status_r            <= '0;
      lanes_detected_r         <= '0;
      ordered_set_sent_cnt_r   <= '0;
      axis_pkt_cnt_r           <= '0;
      try_cnt_r                <= '0;
      changed_speed_recovery_r <= '0;
      goto_detect_o            <= '0;
      goto_cfg_o               <= '0;
      last_rate_r              <= gen3_basic;
    end else begin
      curr_state               <= next_state;
      timer_r                  <= timer_c;
      error_r                  <= error_c;
      success_r                <= success_c;
      lane_status_r            <= lane_status_c;
      lanes_detected_r         <= lanes_detected_c;
      ordered_set_sent_cnt_r   <= ordered_set_sent_cnt_c;
      axis_pkt_cnt_r           <= axis_pkt_cnt_c;
      try_cnt_r                <= try_cnt_c;
      last_rate_r              <= last_rate_c;
      changed_speed_recovery_r <= changed_speed_recovery_c;
      goto_detect_o            <= goto_detect_c;
      goto_cfg_o               <= goto_cfg_c;
    end
    //non-resetable
    ordered_set_r <= ordered_set_c;
  end


  //***********************************************************
  //-----------------------------------------------------------
  // DOWNSTREAM LANES LOGIC
  //-----------------------------------------------------------
  //***********************************************************
  if (!IS_UPSTREAM) begin : gen_downstream
    always_comb begin : main_combo
      next_state               = curr_state;
      timer_c                  = timer_r;
      error_c                  = error_r;
      success_c                = success_r;
      lane_status_c            = lane_status_r;
      lanes_detected_c         = lanes_detected_r;
      ordered_set_sent_cnt_c   = ordered_set_sent_cnt_r;
      axis_pkt_cnt_c           = axis_pkt_cnt_r;
      try_cnt_c                = try_cnt_r;
      last_rate_c              = last_rate_r;
      goto_detect_c            = goto_detect_o;
      goto_cfg_c               = goto_cfg_o;
      //axis signals
      rcvr_axis_tdata          = '0;
      rcvr_axis_tkeep          = '0;
      rcvr_axis_tvalid         = '0;
      rcvr_axis_tlast          = '0;
      rcvr_axis_tuser          = 8'h01;
      //ordered set
      ordered_set_c            = ordered_set_r;
      changed_speed_recovery_c = changed_speed_recovery_r;
      case (curr_state)
        ST_IDLE: begin
          if (en_i) begin
            rate_id_t rate_id;
            rate_id = last_rate_r;
            timer_c = '0;
            //if data rate is gen1 and we've tried three times stay at gen1
            if (last_rate_r.rate != gen1) begin
              last_rate_c.speed_change = '1;
            end
            gen_tsos(ordered_set_c, last_rate_r.rate, TS1, link_num_i, lane_num_i, last_rate_c);
            ordered_set_sent_cnt_c = '0;
            // if (recovery_i && !is_timeout_i) begin
            // ordered_set_c.rate_id[6] = '1;
            // end
            next_state             = ST_RCVR_LOCK;
          end
        end
        //-----------------------------------------------------------
        //  Recoverty.Lock
        //-----------------------------------------------------------
        ST_RCVR_LOCK: begin
          //TODO: WAY too much happening in this state... break it up man.
          //bounded counter for timeout scenario
          timer_c = (timer_r >= TwentyFourMsTimeOut) ? TwentyFourMsTimeOut : timer_r + 1;
          rcvr_axis_tvalid = '1;
          //packet accepted or empty
          if (rcvr_axis_tready) begin
            //increment packet frame counter and build axis packet
            axis_pkt_cnt_c  = axis_pkt_cnt_r + 1;
            rcvr_axis_tdata = ordered_set_r[32*axis_pkt_cnt_r+:32];
            //check if last packet in frame
            if (axis_pkt_cnt_r == 8'h03) begin
              //assert last and reset counter
              rcvr_axis_tlast = '1;
              axis_pkt_cnt_c  = '0;
            end
            //check if new frame
            if (axis_pkt_cnt_r == 8'h00) begin
              //check if pcie state continue scenario satisfied
              if (&ts1_ts2_cnt_satisfied) begin
                ts_symbol6_union_t ts2_symbol6;
                ts2_symbol6            = '0;
                //deassert valid and reset counter
                rcvr_axis_tvalid       = '0;
                axis_pkt_cnt_c         = '0;
                ordered_set_sent_cnt_c = '0;
                timer_c                = '0;
                if (extended_synch_i) begin
                  //goto next pcie ltssm state
                  next_state = ST_RCVR_EXT_SYNCH;
                end else begin
                  //build next ordered set
                  if (max_rate_i == gen3) begin
                    ts2_symbol6.ts2.req_equal = '1;
                  end
                  gen_tsos(ordered_set_c, last_rate_r.rate, TS2, link_num_i, lane_num_i,
                           last_rate_r, '0, ts2_symbol6);
                  //goto next pcie ltssm state
                  next_state = ST_RCVR_CFG;
                end
              end  //check timeout counter
              else if (timer_r >= TwentyFourMsTimeOut) begin
                next_state = ST_RCVR_LOCK_TIMEOUT;
              end
            end
          end
          ST_RCVR_LOCK_TIMEOUT : begin
            ts_symbol6_union_t ts2_symbol6;
            //check secondary config transition
            if ((|(ts1_ts2_cnt_satisfied & speed_change_bit_set)) ||
              curr_data_rate_i.rate != gen1 ||
              max_rate_i != gen1 || last_rate_r.rate != gen1) begin
              //build next ordered set
              if (max_rate_i == gen3) begin
                ts2_symbol6.ts2.req_equal = '1;
              end
              gen_tsos(ordered_set_c, last_rate_r.rate, TS2, link_num_i, lane_num_i, last_rate_r,
                       '0, ts2_symbol6);
              //goto next pcie ltssm state
              next_state = ST_RCVR_CFG;
            end else begin
              if (!changed_speed_recovery_r && curr_data_rate_i.rate != gen1) begin
                gen_tsos(ordered_set_c, last_rate_r.rate, TS2, link_num_i, lane_num_i, last_rate_r,
                         '0, ts2_symbol6);
                //goto next pcie ltssm state
                next_state = ST_RCVR_SPEED;
              end else if (changed_speed_recovery_r) begin
                //goto next pcie ltssm state
                next_state = ST_RCVR_SPEED;
              end else if (changed_speed_recovery_r && (|at_least_one_ts1_ts2)) begin
                //assert error
                error_c    = '1;
                goto_cfg_c = '1;
                //goto detect
                next_state = ST_WAIT_EN_LOW;
              end else begin
                //assert error
                error_c       = '1;
                goto_detect_c = '1;
                //goto detect
                next_state    = ST_WAIT_EN_LOW;
              end
            end
          end
        end
        ST_RCVR_EXT_SYNCH: begin
          rcvr_axis_tvalid = '1;
          //packet accepted or empty
          if (rcvr_axis_tready) begin
            //increment packet frame counter and build axis packet
            axis_pkt_cnt_c  = axis_pkt_cnt_r + 1;
            rcvr_axis_tdata = ordered_set_r[32*axis_pkt_cnt_r+:32];
            //check if last packet in frame
            if (axis_pkt_cnt_r == 8'h03) begin
              //assert last and reset counter
              rcvr_axis_tlast = '1;
              axis_pkt_cnt_c = '0;
              ordered_set_sent_cnt_c = ordered_set_sent_cnt_r + 1'b1;
            end
            //check if new frame
            if (axis_pkt_cnt_r == 8'h00) begin
              //check if pcie state continue scenario satisfied
              if (ordered_set_sent_cnt_r >= 12'd1024) begin
                ts_symbol6_union_t ts2_symbol6;
                ts2_symbol6            = '0;
                //deassert valid and reset counter
                rcvr_axis_tvalid       = '0;
                axis_pkt_cnt_c         = '0;
                ordered_set_sent_cnt_c = '0;
                timer_c                = '0;
                //build next ordered set
                if (max_rate_i == gen3) begin
                  ts2_symbol6.ts2.req_equal = '1;
                end
                gen_tsos(ordered_set_c, last_rate_r.rate, TS2, link_num_i, lane_num_i, last_rate_r,
                         '0, ts_symbol6_union_t);
                next_state = ST_RCVR_CFG;
              end
            end
          end
        end
        //recovery speed scenario
        //8 TS2 Ordered on any lane sets with speed_change bit...at_least_one_ts1_ts2
        // and 8 TS2 OS are standard i.e no IEQUES TS2 if gen1/gen2
        //
        //8 consecutive EQ TS2 recived on all configured lanes, speed_change bit
        //set to 1
        //8 consecutive EQ TS2 OS
        ST_RCVR_CFG: begin
          //bounded counter for timeout scenario
          timer_c = (timer_r >= TwentyFourMsTimeOut) ? TwentyFourMsTimeOut : timer_r + 1;
          rcvr_axis_tvalid = '1;
          //packet accepted or empty
          if (rcvr_axis_tready) begin
            //increment packet frame counter and build axis packet
            axis_pkt_cnt_c  = axis_pkt_cnt_r + 1;
            rcvr_axis_tdata = ordered_set_r[32*axis_pkt_cnt_r+:32];
            //check if last packet in frame
            if (axis_pkt_cnt_r == 8'h03) begin
              //assert last and reset counter
              rcvr_axis_tlast = '1;
              axis_pkt_cnt_c  = '0;
            end
            //check if new frame
            if (axis_pkt_cnt_r == 8'h00) begin
              if (timer_r >= TwentyFourMsTimeOut) begin
                next_state = ST_RCVR_LOCK_TIMEOUT;
              end
            end
          end
        end
        ST_WAIT_EN_LOW: begin
          //wait until enable is low
          if (!en_i) begin
            //go back to idle
            next_state    = ST_IDLE;
            success_c     = '0;
            goto_cfg_c    = '0;
            goto_detect_c = '0;
            error_c       = '0;
          end
        end
        default: begin
        end
      endcase
    end

    //-----------------------------------------------------------
    //  Lane based Ordered set handling logic
    //-----------------------------------------------------------
    for (genvar lane = 0; lane < MAX_NUM_LANES; lane++) begin : gen_cnt_ordered_set
      logic              [7:0] ts1_cnt;
      logic              [7:0] ts2_cnt;
      logic              [7:0] lane_in_save;
      logic                    first_ts1;
      ts_symbol6_union_t       temp_ts6;
      rate_id_t                temp_rate_id;
      logic                    lane_speed_change_bit;
      //determine if TS1 req satisfied for lane by its count
      assign link_width_satisfied[lane]       = (ts1_cnt == 8'h2);
      //determine if TS1 req satisfied for lane by its count
      assign link_lanes_formed[lane]          = (ts1_cnt == 8'h2);
      //determine if TS1 req satisfied
      assign ts1_lanenum_wait_satisfied[lane] = (ts1_cnt == 8'h2);
      assign link_lanes_nums_match[lane]      = (ts1_cnt == 8'h2);
      assign link_lane_reconfig[lane]         = (ts1_cnt == 8'h2);
      assign lane_num_formed[lane]            = lane_active_i[lane] ? (ts2_cnt == 8'h8) : '1;
      //determine if TS1 req satisfied for lane by its count
      assign link_idle_satisfied[lane]        = (ts1_cnt == 8'h8);
      assign ts1_ts2_cnt_satisfied[lane]      = (ts1_cnt == 8'h8) || (ts2_cnt == 8'h8);
      assign speed_change_bit_set[lane]       = ts1_ts2_cnt_satisfied & lane_speed_change_bit;
      assign at_least_one_ts1_ts2[lane]       = (ts1_cnt != '0) | (ts2_cnt != '0);
      always_ff @(posedge clk_i) begin : cnt_ts1
        if (rst_i) begin
          //reset count and selected incoming link number
          ts1_cnt                    <= '0;
          ts2_cnt                    <= '0;
          first_ts1                  <= '0;
          link_selected              <= '0;
          lane_in_save               <= '0;
          single_idle_recieved[lane] <= '0;
          temp_ts6                   <= '0;
          speed_change_bit           <= '0;
        end else begin
          case (curr_state)
            ST_IDLE: begin
              ts1_cnt                    <= '0;
              ts2_cnt                    <= '0;
              first_ts1                  <= '0;
              single_idle_recieved[lane] <= '0;
            end
            ST_RCVR_LOCK, ST_RCVR_LOCK_TIMEOUT: begin
              if (next_state != curr_state && (next_state != ST_RCVR_LOCK_TIMEOUT)) begin
                ts1_cnt                    <= '0;
                ts2_cnt                    <= '0;
                single_idle_recieved[lane] <= '0;
              end else
              //wait for incoming ts1-os...//skip if threshhold already reached
              if (ts1_valid_i[lane]) begin
                if ((symbol6_i[lane].ec != '0) || !((lane_num_i[i*8+:8] == cfg_lane_num_i[i*8+:8]) &&
                link_num_i[i*8+:8] && cfg_link_num_i[i*8+:8])) begin
                  ts1_cnt <= '0;
                end else begin
                  ts1_cnt <= ts1_cnt + 1;
                  if (rate_id_i.speed_change) begin
                    speed_change_bit <= '1;
                  end else begin
                    speed_change_bit <= '0;
                  end
                end
              end
              //wait for incoming ts2-os...//skip if threshhold already reached
              if (ts2_valid_i[lane]) begin
                if ((symbol6_i.ec != '0) || !((lane_num_i[i*8+:8] == cfg_lane_num_i[i*8+:8]) &&
                link_num_i[i*8+:8] && cfg_link_num_i[i*8+:8])) begin
                  ts2_cnt <= '0;
                end else begin
                  ts2_cnt <= ts2_cnt + 1;
                  if (rate_id_i.speed_change) begin
                    speed_change_bit <= '1;
                  end else begin
                    speed_change_bit <= '0;
                  end
                end
              end
            end
            ST_RCVR_CFG: begin
              if (next_state != curr_state) begin
                ts1_cnt                    <= '0;
                ts2_cnt                    <= '0;
                single_idle_recieved[lane] <= '0;
              end else
              //wait for incoming ts1-os...//skip if threshhold already reached
              if (ts2_valid_i[lane]) begin
                temp_ts6 <= symbol6_i;
                temp_rate_id <= curr_data_rate_i;
                if (curr_data_rate_i.rate != gen3 && symbol6_i.ts2.req_equal 
                && symbol6_i == temp_ts6) begin
                  ts2_cnt <= ts2_cnt + 1;
                end
                else if((curr_data_rate_i.rate == gen3) && (
                  curr_data_rate_i == temp_rate_id) && (curr_data_rate_i.speed == '1)) begin
                  ts2_cnt <= ts2_cnt + 1;
                end else begin
                  ts2_cnt <= '0;
                end
              end
            end
            default: begin
            end
          endcase
        end
      end
    end : gen_cnt_ordered_set
  end


  //axis skid buffer
  axis_register #(
      .DATA_WIDTH(DATA_WIDTH),
      .KEEP_ENABLE('1),
      .KEEP_WIDTH(KEEP_WIDTH),
      .LAST_ENABLE('1),
      .ID_ENABLE('0),
      .ID_WIDTH(1),
      .DEST_ENABLE('0),
      .DEST_WIDTH(1),
      .USER_ENABLE('1),
      .USER_WIDTH(USER_WIDTH),
      .REG_TYPE(SkidBuffer)
  ) axis_register_inst (
      .clk(clk_i),
      .rst(rst_i),
      .s_axis_tdata(rcvr_axis_tdata),
      .s_axis_tkeep(rcvr_axis_tkeep),
      .s_axis_tvalid(rcvr_axis_tvalid),
      .s_axis_tready(rcvr_axis_tready),
      .s_axis_tlast(rcvr_axis_tlast),
      .s_axis_tuser(rcvr_axis_tuser),
      .s_axis_tid('0),
      .s_axis_tdest('0),
      .m_axis_tdata(m_axis_tdata),
      .m_axis_tkeep(m_axis_tkeep),
      .m_axis_tvalid(m_axis_tvalid),
      .m_axis_tready(m_axis_tready),
      .m_axis_tlast(m_axis_tlast),
      .m_axis_tid(),
      .m_axis_tdest(),
      .m_axis_tuser(m_axis_tuser)
  );


  //------------------------------------------------------------
  //output assignments
  //------------------------------------------------------------
  assign success_o = success_r;
  assign error_o   = error_r;

endmodule
