// !upconfig not supported
// !crosslink not supported
module ltssm_recovery
  import pcie_phy_pkg::*;
#(
    parameter int MAX_NUM_LANES = 4,
    // TLP data width
    parameter int DATA_WIDTH = 32,
    // TLP keep width
    parameter int KEEP_WIDTH = DATA_WIDTH / 8,
    parameter int USER_WIDTH = $bits(phy_user_t),
    parameter int IS_ROOT_PORT = 1,
    parameter int LINK_NUM = 0,
    parameter int IS_UPSTREAM = 0,  //downstream by default
    parameter int CROSSLINK_EN = 0,  //crosslink not supported
    parameter int UPCONFIG_EN = 0  //upconfig not supported

) (
    input  logic                           clk_i,                   // Clock signal
    input  logic                           rst_i,                   // Reset signal
    // Control
    input  logic                           en_i,
    input  logic                           link_up_i,
    input  logic                           is_timeout_i,
    input  logic                           recovery_i,
    output logic                           error_o,
    output logic                           success_o,
    output logic                           error_loopback_o,
    output logic                           error_disable_o,
    input  logic [(MAX_NUM_LANES * 8)-1:0] rate_id_i,
    input  logic [      MAX_NUM_LANES-1:0] ts1_valid_i,
    input  logic [      MAX_NUM_LANES-1:0] ts2_valid_i,
    input  logic [      MAX_NUM_LANES-1:0] idle_valid_i,
    input  logic [(MAX_NUM_LANES * 8)-1:0] link_num_i,
    input  logic [(MAX_NUM_LANES * 8)-1:0] lane_num_i,
    input  logic [(MAX_NUM_LANES * 8)-1:0] lane_num_transmitted_i,
    input  logic [(MAX_NUM_LANES * 8)-1:0] training_ctrl_i,
    input  logic [      MAX_NUM_LANES-1:0] lane_active_i,
    input  logic [      MAX_NUM_LANES-1:0] lanes_ts2_satisfied_i,
    input  logic [      MAX_NUM_LANES-1:0] config_copmlete_ts2_i,
    //TLP AXI output
    output logic [         DATA_WIDTH-1:0] m_axis_tdata,
    output logic [         KEEP_WIDTH-1:0] m_axis_tkeep,
    output logic                           m_axis_tvalid,
    output logic                           m_axis_tlast,
    output logic [         USER_WIDTH-1:0] m_axis_tuser,
    input  logic                           m_axis_tready
);

  localparam int TwentyFourMsTimeOut = 32'h015B8D80;  //temp value
  localparam int TwoMsTimeOut = 32'h000B8D80;  //temp value


  typedef enum logic [4:0] {
    ST_IDLE,
    ST_CONFIG_LINKWIDTH_START,
    ST_CONFIG_LINKWIDTH_ACCEPT,
    ST_CONFIG_LANENUM_ACCEPT,
    ST_CONFIG_LANENUM_WAIT,
    ST_CONFIG_COMPLETE,
    ST_CONFIG_IDLE,
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
  logic              [MAX_NUM_LANES-1:0] lane_status_c;
  logic              [MAX_NUM_LANES-1:0] lane_status_r;
  logic              [MAX_NUM_LANES-1:0] lanes_detected_c;
  logic              [MAX_NUM_LANES-1:0] lanes_detected_r;
  logic              [             15:0] ordered_set_sent_cnt_c;
  logic              [             15:0] ordered_set_sent_cnt_r;
  logic              [              7:0] axis_pkt_cnt_c;
  logic              [              7:0] axis_pkt_cnt_r;
  logic                                  rst_cnt_c;
  logic                                  rst_cnt_r;
  //axis signals
  logic              [   DATA_WIDTH-1:0] m_axis_tdata_c;
  logic              [   KEEP_WIDTH-1:0] m_axis_tkeep_c;
  logic                                  m_axis_tvalid_c;
  logic                                  m_axis_tlast_c;
  logic              [   USER_WIDTH-1:0] m_axis_tuser_c;
  //axis reg
  logic              [   DATA_WIDTH-1:0] m_axis_tdata_r;
  logic              [   KEEP_WIDTH-1:0] m_axis_tkeep_r;
  logic                                  m_axis_tvalid_r;
  logic                                  m_axis_tlast_r;
  logic              [   USER_WIDTH-1:0] m_axis_tuser_r;

  //link training helper signals
  logic              [MAX_NUM_LANES-1:0] link_width_satisfied;
  logic              [              7:0] link_selected;
  logic              [MAX_NUM_LANES-1:0] link_lanes_formed;
  logic              [MAX_NUM_LANES-1:0] lane_num_formed;
  logic              [MAX_NUM_LANES-1:0] lane_num_satisfied;

  logic              [MAX_NUM_LANES-1:0] link_lanes_nums_match;
  logic              [MAX_NUM_LANES-1:0] link_lane_reconfig;

  logic              [MAX_NUM_LANES-1:0] ts1_lanenum_wait_satisfied;
  // logic [MAX_NUM_LANES-1:0] link_lane_reconfig;


  logic              [MAX_NUM_LANES-1:0] single_idle_recieved;
  logic              [MAX_NUM_LANES-1:0] link_idle_satisfied;



  always_ff @(posedge clk_i or posedge rst_i) begin : main_seq
    if (rst_i) begin
      curr_state             <= ST_IDLE;
      timer_r                <= '0;
      error_r                <= '0;
      success_r              <= '0;
      lane_status_r          <= '0;
      lanes_detected_r       <= '0;
      ordered_set_sent_cnt_r <= '0;
      axis_pkt_cnt_r         <= '0;
      //axis signals
      m_axis_tvalid_r        <= '0;
      rst_cnt_r              <= '0;
    end else begin
      curr_state             <= next_state;
      timer_r                <= timer_c;
      error_r                <= error_c;
      success_r              <= success_c;
      lane_status_r          <= lane_status_c;
      lanes_detected_r       <= lanes_detected_c;
      ordered_set_sent_cnt_r <= ordered_set_sent_cnt_c;
      axis_pkt_cnt_r         <= axis_pkt_cnt_c;
      //axis signals
      m_axis_tvalid_r        <= m_axis_tvalid_c;
      rst_cnt_r              <= rst_cnt_c;
    end
    //non-resetable
    ordered_set_r  <= ordered_set_c;
    //axis
    m_axis_tdata_r <= m_axis_tdata_c;
    m_axis_tkeep_r <= m_axis_tkeep_c;
    m_axis_tlast_r <= m_axis_tlast_c;
    m_axis_tuser_r <= m_axis_tuser_c;
  end


  //***********************************************************
  //-----------------------------------------------------------
  // DOWNSTREAM LANES LOGIC
  //-----------------------------------------------------------
  //***********************************************************
  if (!IS_UPSTREAM) begin : gen_downstream
    always_comb begin : main_combo
      next_state             = curr_state;
      timer_c                = timer_r;
      error_c                = error_r;
      success_c              = success_r;
      lane_status_c          = lane_status_r;
      lanes_detected_c       = lanes_detected_r;
      ordered_set_sent_cnt_c = ordered_set_sent_cnt_r;
      axis_pkt_cnt_c         = axis_pkt_cnt_r;
      rst_cnt_c              = rst_cnt_r;
      //axis signals
      m_axis_tdata_c         = m_axis_tdata_r;
      m_axis_tkeep_c         = m_axis_tkeep_r;
      m_axis_tvalid_c        = m_axis_tvalid_r;
      m_axis_tlast_c         = m_axis_tlast_r;
      m_axis_tuser_c         = m_axis_tuser_r;
      //ordered set
      ordered_set_c          = ordered_set_r;
      case (curr_state)
        ST_IDLE: begin
          if (en_i) begin
            timer_c                = '0;
            next_state             = ST_CONFIG_LINKWIDTH_START;
            ordered_set_c          = gen_tsos(TS1);
            ordered_set_sent_cnt_c = '0;
            if (recovery_i && !is_timeout_i) begin
              ordered_set_c.rate_id[6] = '1;
            end
          end
        end
        //-----------------------------------------------------------
        //  Configuration.Linkwidth.Start
        //-----------------------------------------------------------
        ST_CONFIG_LINKWIDTH_START: begin
          //bounded counter for timeout scenario
          timer_c = (timer_r >= TwentyFourMsTimeOut) ? TwentyFourMsTimeOut : timer_r + 1;
          //packet accepted or empty
          if (m_axis_tready_i || !m_axis_tvalid_r) begin
            //increment packet frame counter
            axis_pkt_cnt_c  = axis_pkt_cnt_r + 1;
            //build axis packet
            m_axis_tdata_c  = ordered_set_r[32*axis_pkt_cnt_r+:32];
            m_axis_tkeep_c  = '1;
            m_axis_tvalid_c = '1;
            m_axis_tlast_c  = '0;
            m_axis_tuser_c  = 8'h01;
            //check if last packet in frame
            if (axis_pkt_cnt_r == 8'h03) begin
              //assert last
              m_axis_tlast_c = '1;
              //reset counter
              axis_pkt_cnt_c = '0;
            end
            //check if new frame
            if (axis_pkt_cnt_r == 8'h00) begin
              //check if pcie state continue scenario satisfied
              if (|link_width_satisfied) begin
                //reset ordered set sent counter
                ordered_set_sent_cnt_c = '0;
                //deassert valid
                m_axis_tvalid_c        = '0;
                axis_pkt_cnt_c         = '0;
                //build next ordered set
                ordered_set_c          = gen_tsos(TS1, link_selected, 0);
                //reset timer
                timer_c                = '0;
                //goto next pcie ltssm state
                next_state             = ST_CONFIG_LINKWIDTH_ACCEPT;
              end  //check timeout counter
            else if (timer_r >= TwentyFourMsTimeOut) begin
                //assert error
                error_c    = '1;
                //goto detect
                next_state = ST_WAIT_EN_LOW;
              end
            end
          end
        end
        //-----------------------------------------------------------
        //  Configuration.Linkwidth.Accept
        //-----------------------------------------------------------
        ST_CONFIG_LINKWIDTH_ACCEPT: begin
          //bounded counter for timeout scenario
          timer_c = (timer_r >= TwoMsTimeOut) ? TwoMsTimeOut : timer_r + 1;
          //packet accepted or empty
          if (m_axis_tready_i || !m_axis_tvalid_r) begin
            //increment packet frame counter
            axis_pkt_cnt_c  = axis_pkt_cnt_r + 1;
            //build axis packet
            m_axis_tdata_c  = ordered_set_r[32*axis_pkt_cnt_r+:32];
            m_axis_tkeep_c  = '1;
            m_axis_tvalid_c = '1;
            m_axis_tlast_c  = '0;
            m_axis_tuser_c  = 8'h03;
            //check if last packet in frame
            if (axis_pkt_cnt_r == 8'h03) begin
              m_axis_tlast_c = '1;
              axis_pkt_cnt_c = '0;
            end
            //check if new frame
            if (axis_pkt_cnt_r == 8'h0) begin
              //check if pcie state continue scenario satisfied
              if ((|link_lanes_formed) && (!(^link_lanes_formed))) begin
                m_axis_tvalid_c = '0;
                axis_pkt_cnt_c = '0;
                timer_c = '0;
                next_state = ST_CONFIG_LANENUM_WAIT;
              end  //check timeout counter
            else if (timer_r >= TwoMsTimeOut) begin
                error_c = '1;
                axis_pkt_cnt_c = '0;
                next_state = ST_WAIT_EN_LOW;
              end
            end
          end
        end
        //-----------------------------------------------------------
        // Configuration.Lanenum.Accept
        //-----------------------------------------------------------
        ST_CONFIG_LANENUM_ACCEPT: begin
          //bounded counter for timeout scenario
          timer_c = (timer_r >= TwoMsTimeOut) ? TwoMsTimeOut : timer_r + 1;
          //packet accepted or empty
          if (m_axis_tready_i | !m_axis_tvalid_r) begin
            axis_pkt_cnt_c  = axis_pkt_cnt_r + 1;
            //build axis packet
            m_axis_tdata_c  = ordered_set_r[32*axis_pkt_cnt_r+:32];
            m_axis_tkeep_c  = '1;
            m_axis_tvalid_c = '1;
            m_axis_tlast_c  = '0;
            m_axis_tuser_c  = 8'h03;
            //check if last packet in frame
            if (axis_pkt_cnt_r == 8'h03) begin
              m_axis_tlast_c = '1;
              axis_pkt_cnt_c = '0;
            end
            //check if first packet in frame
            if (axis_pkt_cnt_r == 8'h00) begin
              //check if lanes can be formed
              if (|link_lanes_nums_match) begin
                //build ts2 ordered set
                ordered_set_c = gen_tsos(TS2, LINK_NUM, 0);
                axis_pkt_cnt_c = '0;
                m_axis_tvalid_c = '0;
                timer_c = '0;
                //goto config complete
                next_state = ST_CONFIG_COMPLETE;
              end  //check reconfiguration scenario
            else if (|link_lane_reconfig) begin
                timer_c = '0;
                next_state = ST_CONFIG_LANENUM_WAIT;
              end  //check timeout counter
            else if (timer_r >= TwoMsTimeOut) begin
                //assert error
                error_c = '1;
                //reset counter
                axis_pkt_cnt_c = '0;
                //goto detect
                next_state = ST_WAIT_EN_LOW;
              end
            end
          end
        end
        //-----------------------------------------------------------
        //  Configuration.Lanenum.Wait
        //-----------------------------------------------------------
        ST_CONFIG_LANENUM_WAIT: begin
          //bounded timeout counter increment
          timer_c = (timer_r >= TwoMsTimeOut) ? TwoMsTimeOut : timer_r + 1;
          //packet accepted or empty
          if (m_axis_tready_i | !m_axis_tvalid_r) begin
            //increment packet count
            axis_pkt_cnt_c  = axis_pkt_cnt_r + 1;
            //build axis packet
            m_axis_tdata_c  = ordered_set_r[32*axis_pkt_cnt_r+:32];
            m_axis_tkeep_c  = '1;
            m_axis_tvalid_c = '1;
            m_axis_tlast_c  = '0;
            m_axis_tuser_c  = 8'h03;
            //check if last packet in frame
            if (axis_pkt_cnt_r == 8'h03) begin
              //assert last
              m_axis_tlast_c = '1;
              axis_pkt_cnt_c = '0;
            end
            //check if first packet in frame or last packet in frame has been sent
            if (axis_pkt_cnt_r == 8'h00) begin
              //check if lane wait exit scenario satisfied
              if (|ts1_lanenum_wait_satisfied) begin
                axis_pkt_cnt_c = '0;
                m_axis_tvalid_c = '0;
                timer_c = '0;
                //goto lanenum accept
                next_state = ST_CONFIG_LANENUM_ACCEPT;
              end  //check timeout counter
            else if (timer_r >= TwoMsTimeOut) begin
                //assert error
                error_c = '1;
                //goto detect
                next_state = ST_WAIT_EN_LOW;
              end
            end
          end
        end
        //-----------------------------------------------------------
        //  Configuration.Complete
        //-----------------------------------------------------------
        ST_CONFIG_COMPLETE: begin
          //bounded timeout counter
          timer_c = (timer_r >= TwoMsTimeOut) ? TwoMsTimeOut : timer_r + 1;
          //packet sent or empty
          if (m_axis_tready_i | !m_axis_tvalid_r) begin
            //increment packet counter
            axis_pkt_cnt_c  = axis_pkt_cnt_r + 1;
            //build axis pkt
            m_axis_tdata_c  = ordered_set_r[32*axis_pkt_cnt_r+:32];
            m_axis_tkeep_c  = '1;
            m_axis_tvalid_c = '1;
            m_axis_tlast_c  = '0;
            m_axis_tuser_c  = 8'h03;
            //check if last pkt in frame
            if (axis_pkt_cnt_r == 8'h03) begin
              m_axis_tlast_c = '1;
              axis_pkt_cnt_c = '0;
            end
            //check if first pkt in frame or last pkt is sent
            if (axis_pkt_cnt_r == 8'h00) begin
              //check exit scenario
              if (&lane_num_formed) begin
                //decrement counts
                axis_pkt_cnt_c = '0;
                ordered_set_sent_cnt_c = '0;
                m_axis_tvalid_c = '0;
                timer_c = '0;
                //build idle ordered set
                ordered_set_c = gen_idle();
                //goto config idle
                next_state = ST_CONFIG_IDLE;
              end  //check timeout counter 
            else if (timer_r >= TwoMsTimeOut) begin
                //assert error
                error_c = '1;
                //goto idle
                next_state = ST_WAIT_EN_LOW;
              end
            end
          end
        end
        //-----------------------------------------------------------
        //  Configuration.Idle
        //-----------------------------------------------------------
        ST_CONFIG_IDLE: begin
          //bounded timeout counter
          timer_c = (timer_r >= TwoMsTimeOut) ? TwoMsTimeOut : timer_r + 1;
          //pkt empty
          if (m_axis_tready_i | !m_axis_tvalid_r) begin
            //increment pkt cnt
            axis_pkt_cnt_c  = axis_pkt_cnt_r + 1;
            //build axis pkt
            m_axis_tdata_c  = ordered_set_r[32*axis_pkt_cnt_r+:32];
            m_axis_tkeep_c  = '1;
            m_axis_tvalid_c = '1;
            m_axis_tlast_c  = '0;
            m_axis_tuser_c  = 8'h03;
            //check if pkt is last
            if (axis_pkt_cnt_r == 8'h03) begin
              //reset pkt count
              axis_pkt_cnt_c = '0;
              //assert last
              m_axis_tlast_c = '1;
            end
            //check last pkt sent
            if (axis_pkt_cnt_r == 8'h00) begin
              //check if idle recieved
              if (single_idle_recieved) begin
                //start counting idle OS sent
                ordered_set_sent_cnt_c = ordered_set_sent_cnt_r + 1;
              end
              //check if number of idle OS recieved and idle OS sent
              if (link_idle_satisfied && (ordered_set_sent_cnt_r >= 16)) begin
                //assert success.. tells ltssm hierarchy to move to its next state
                success_c = '1;
                //reset counters
                ordered_set_sent_cnt_c = '0;
                //deassert valid
                m_axis_tvalid_c = '0;
                axis_pkt_cnt_c = '0;
                //goto wait for ena low
                next_state = ST_WAIT_EN_LOW;
              end  //check timeout counter
            else if (timer_r >= TwoMsTimeOut) begin
                //assert error
                error_c = '1;
                //goto wait low
                next_state = ST_WAIT_EN_LOW;
              end
            end
          end
        end
        ST_WAIT_EN_LOW: begin
          //wait until enable is low
          if (!en_i) begin
            //go back to idle
            next_state = ST_IDLE;
            success_c = '0;
            error_c = '0;
          end
        end
        default: begin
        end
      endcase
    end

    //-----------------------------------------------------------
    //  Lane based Ordered set handling logic
    //-----------------------------------------------------------
    for (genvar i = 0; i < MAX_NUM_LANES; i++) begin : gen_cnt_ordered_set
      logic [7:0] ts1_cnt;
      logic [7:0] ts2_cnt;
      logic [7:0] lane_in_save;
      logic first_ts1;
      //determine if TS1 req satisfied for lane by its count
      assign link_width_satisfied[i] = (ts1_cnt == 8'h2);
      //determine if TS1 req satisfied for lane by its count
      assign link_lanes_formed[i] = (ts1_cnt == 8'h2);
      //determine if TS1 req satisfied
      assign ts1_lanenum_wait_satisfied[i] = (ts1_cnt == 8'h2);
      assign link_lanes_nums_match[i] = (ts1_cnt == 8'h2);
      assign link_lane_reconfig[i] = (ts1_cnt == 8'h2);
      assign lane_num_formed[i] = lane_active_i[i] ? (ts2_cnt == 8'h8) : '1;
      //determine if TS1 req satisfied for lane by its count
      assign link_idle_satisfied[i] = (ts1_cnt == 8'h8);
      always_ff @(posedge clk_i) begin : cnt_ts1
        if (rst_i) begin
          //reset count and selected incoming link number
          ts1_cnt <= '0;
          ts2_cnt <= '0;
          first_ts1 <= '0;
          link_selected <= '0;
          lane_in_save <= '0;
          single_idle_recieved[i] <= '0;
        end else begin
          case (curr_state)
            ST_IDLE: begin
              ts1_cnt <= '0;
              ts2_cnt <= '0;
              first_ts1 <= '0;
              single_idle_recieved[i] <= '0;
            end
            ST_CONFIG_LINKWIDTH_START: begin
              if (next_state != curr_state) begin
                ts1_cnt <= '0;
                ts2_cnt <= '0;
                single_idle_recieved[i] <= '0;
              end else
              //wait for incoming ts1-os...//skip if threshhold already reached
              if (ts1_valid_i[i] && (ts1_cnt != 8'h2)) begin
                if (((link_num_i[i*8+:8] == PAD) && (lane_num_i[i*8+:8] == PAD))) begin
                  first_ts1 <= '1;
                end
                //check that link number is not pad and that lane number is pad
                if ((link_num_i[i*8+:8] != PAD) && (lane_num_i[i*8+:8] == PAD) && first_ts1) begin
                  //incrment ts1 count
                  ts1_cnt <= ts1_cnt + 1;
                end else begin
                  //reset ts1 cnt... this ensures that the TS1-OS are consecutive per the spec
                  ts1_cnt <= '0;
                end
              end
              //check if consecutive TS1's satisfied for this lane
              if (link_width_satisfied[i]) begin
                //select link number by choosing lowest significanct lane satisfied
                //ignore all other lanes
                if ((i == 0) || (link_width_satisfied[i:0] == '0)) begin
                  link_selected <= link_num_i[i];
                end
              end
            end
            ST_CONFIG_LINKWIDTH_ACCEPT: begin
              if (next_state != curr_state) begin
                ts1_cnt <= '0;
                ts2_cnt <= '0;
                single_idle_recieved[i] <= '0;
              end else
              //wait for incoming ts1-os...//skip if threshhold already reached
              if (ts1_valid_i[i] && (ts1_cnt != 8'h2)) begin
                //check that incoming link number matches the "link_selected"
                //that we are now transmitting and that lane number is different
                //from the one stored when we entered this state
                if ((link_num_i[i] == link_selected)) begin
                  //increment count
                  ts1_cnt <= ts1_cnt + 1;
                  lane_in_save <= link_num_i[i];
                end else begin
                  ts1_cnt <= '0;
                end
              end
            end
            ST_CONFIG_LANENUM_WAIT: begin
              if (next_state != curr_state) begin
                ts1_cnt <= '0;
                ts2_cnt <= '0;
                single_idle_recieved[i] <= '0;
              end else if (ts1_valid_i[i] && (ts1_cnt != 8'h2)) begin
                if (((link_num_i[i] != PAD) && (lane_num_i[i] != lane_in_save))) begin
                  ts1_cnt <= ts1_cnt + 1;
                end else begin
                  ts1_cnt <= '0;
                end
              end
            end
            ST_CONFIG_LANENUM_ACCEPT: begin
              if (next_state != curr_state) begin
                ts1_cnt <= '0;
                ts2_cnt <= '0;
                single_idle_recieved[i] <= '0;
              end else if (ts1_valid_i[i] && (ts1_cnt != 8'h2)) begin
                if ((link_num_i[i] == link_selected) && (lane_num_i[i] != PAD)) begin
                  ts1_cnt <= ts1_cnt + 1;
                end else begin
                  ts1_cnt <= '0;
                end
              end
            end
            ST_CONFIG_COMPLETE: begin
              if (next_state != curr_state) begin
                ts1_cnt <= '0;
                ts2_cnt <= '0;
                single_idle_recieved[i] <= '0;
              end else if (ts2_valid_i[i] && (ts2_cnt != 8'h8)) begin
                if ((link_num_i[i] == link_selected) &&
            (lane_num_i[i] == lane_num_transmitted_i[i]) &&
            rate_id_i == gen3) begin
                  ts2_cnt <= ts2_cnt + 1;
                  ts1_cnt <= '0;
                end else begin
                  ts1_cnt <= '0;
                  ts2_cnt <= '0;
                end
              end
            end
            ST_CONFIG_IDLE: begin
              if (next_state != curr_state) begin
                ts1_cnt <= '0;
                ts2_cnt <= '0;
                single_idle_recieved[i] <= '0;
              end else
              //wait for incoming ts1-os...//skip if threshhold already reached
              if (idle_valid_i[i] && (ts1_cnt != 8'h8)) begin
                single_idle_recieved[i] <= '1;
                ts1_cnt <= ts1_cnt + 1;
              end else if (ts1_valid_i || ts2_valid_i) begin
                ts1_cnt <= '0;
              end
            end
            default: begin
            end
          endcase
        end
      end
    end : gen_cnt_ordered_set
  end

  //***********************************************************
  //-----------------------------------------------------------
  //  UPSTREAM LANES LOGIC
  //-----------------------------------------------------------
  //***********************************************************
  if (IS_UPSTREAM) begin : gen_upstream
    always_comb begin : main_combo
      next_state = curr_state;
      timer_c = timer_r;
      error_c = error_r;
      success_c = success_r;
      lane_status_c = lane_status_r;
      lanes_detected_c = lanes_detected_r;
      ordered_set_sent_cnt_c = ordered_set_sent_cnt_r;
      axis_pkt_cnt_c = axis_pkt_cnt_r;
      rst_cnt_c = rst_cnt_r;
      //axis signals
      m_axis_tdata_c = m_axis_tdata_r;
      m_axis_tkeep_c = m_axis_tkeep_r;
      m_axis_tvalid_c = m_axis_tvalid_r;
      m_axis_tlast_c = m_axis_tlast_r;
      m_axis_tuser_c = m_axis_tuser_r;
      //training seq
      ordered_set_c = ordered_set_r;
      case (curr_state)
        ST_IDLE: begin
          if (en_i) begin
            timer_c = '0;
            next_state = ST_CONFIG_LINKWIDTH_START;
            ordered_set_c = gen_tsos(TS1);
            ordered_set_sent_cnt_c = '0;
            if (recovery_i && !is_timeout_i) begin
              ordered_set_c.rate_id[6] = '1;
            end
          end
        end
        //-----------------------------------------------------------
        //  Configuration.Linkwidth.Start
        //-----------------------------------------------------------
        ST_CONFIG_LINKWIDTH_START: begin
          timer_c = (timer_r >= TwentyFourMsTimeOut) ? TwentyFourMsTimeOut : timer_r + 1;
          if (m_axis_tready_i || !m_axis_tvalid_r) begin
            axis_pkt_cnt_c  = axis_pkt_cnt_r + 1;
            m_axis_tdata_c  = ordered_set_r[32*axis_pkt_cnt_r+:32];
            m_axis_tkeep_c  = '1;
            m_axis_tvalid_c = '1;
            m_axis_tlast_c  = '0;
            m_axis_tuser_c  = 8'h01;
            if (axis_pkt_cnt_r == 8'h03) begin
              m_axis_tlast_c = '1;
              axis_pkt_cnt_c = '0;
            end
            if (axis_pkt_cnt_r == 8'h00) begin
              if (|link_width_satisfied) begin
                ordered_set_sent_cnt_c = '0;
                m_axis_tvalid_c = '0;
                axis_pkt_cnt_c = '0;
                next_state = ST_CONFIG_LINKWIDTH_ACCEPT;
                ordered_set_c = gen_tsos(TS1, link_selected, 0);
                timer_c = '0;
              end else if (timer_r >= TwentyFourMsTimeOut) begin
                error_c = '1;
                next_state = ST_WAIT_EN_LOW;
              end
            end
          end
        end
        //-----------------------------------------------------------
        //  Configuration.Linkwidth.Accept
        //-----------------------------------------------------------
        ST_CONFIG_LINKWIDTH_ACCEPT: begin
          timer_c = (timer_r >= TwoMsTimeOut) ? TwoMsTimeOut : timer_r + 1;
          if (m_axis_tready_i || !m_axis_tvalid_r) begin
            axis_pkt_cnt_c  = axis_pkt_cnt_r + 1;
            m_axis_tdata_c  = ordered_set_r[32*axis_pkt_cnt_r+:32];
            m_axis_tkeep_c  = '1;
            m_axis_tvalid_c = '1;
            m_axis_tlast_c  = '0;
            m_axis_tuser_c  = 8'h03;
            if (axis_pkt_cnt_r == 8'h03) begin
              m_axis_tlast_c = '1;
              axis_pkt_cnt_c = '0;
            end
            if (axis_pkt_cnt_r == 8'h0) begin
              if ((|link_lanes_formed) && (!(^link_lanes_formed))) begin
                m_axis_tvalid_c = '0;
                axis_pkt_cnt_c = '0;
                timer_c = '0;
                next_state = ST_CONFIG_LANENUM_WAIT;
              end else if (timer_r >= TwoMsTimeOut) begin
                error_c = '1;
                axis_pkt_cnt_c = '0;
                next_state = ST_WAIT_EN_LOW;
              end
            end
          end
        end
        //-----------------------------------------------------------
        // Configuration.Lanenum.Accept
        //-----------------------------------------------------------
        ST_CONFIG_LANENUM_ACCEPT: begin
          if (m_axis_tready_i | !m_axis_tvalid_r) begin
            axis_pkt_cnt_c  = axis_pkt_cnt_r + 1;
            m_axis_tdata_c  = ordered_set_r[32*axis_pkt_cnt_r+:32];
            m_axis_tkeep_c  = '1;
            m_axis_tvalid_c = '1;
            m_axis_tlast_c  = '0;
            m_axis_tuser_c  = 8'h03;
            if (axis_pkt_cnt_r == 8'h03) begin
              m_axis_tlast_c = '1;
              axis_pkt_cnt_c = '0;
            end
            if (axis_pkt_cnt_r == 8'h00) begin
              if (|link_lanes_nums_match) begin
                ordered_set_c = gen_tsos(TS2, LINK_NUM, 0);
                next_state = ST_CONFIG_COMPLETE;
                axis_pkt_cnt_c = '0;
                m_axis_tvalid_c = '0;
                timer_c = '0;
              end else if (|link_lane_reconfig) begin
                timer_c = '0;
                next_state = ST_CONFIG_LANENUM_WAIT;
              end
            end
          end
        end
        //-----------------------------------------------------------
        //  Configuration.Lanenum.Wait
        //-----------------------------------------------------------
        ST_CONFIG_LANENUM_WAIT: begin
          timer_c = (timer_r >= TwoMsTimeOut) ? TwoMsTimeOut : timer_r + 1;
          if (m_axis_tready_i | !m_axis_tvalid_r) begin
            axis_pkt_cnt_c  = axis_pkt_cnt_r + 1;
            m_axis_tdata_c  = ordered_set_r[32*axis_pkt_cnt_r+:32];
            m_axis_tkeep_c  = '1;
            m_axis_tvalid_c = '1;
            m_axis_tlast_c  = '0;
            m_axis_tuser_c  = 8'h03;
            if (axis_pkt_cnt_r == 8'h03) begin
              m_axis_tlast_c = '1;
              axis_pkt_cnt_c = '0;
            end
            if (axis_pkt_cnt_r == 8'h00) begin
              if (|ts1_lanenum_wait_satisfied) begin
                axis_pkt_cnt_c = '0;
                m_axis_tvalid_c = '0;
                timer_c = '0;
                next_state = ST_CONFIG_LANENUM_ACCEPT;
              end else if (timer_r >= TwoMsTimeOut) begin
                error_c = '1;
                next_state = ST_WAIT_EN_LOW;
              end
            end
          end
        end
        //-----------------------------------------------------------
        //  Configuration.Complete
        //-----------------------------------------------------------
        ST_CONFIG_COMPLETE: begin
          timer_c = (timer_r >= TwoMsTimeOut) ? TwoMsTimeOut : timer_r + 1;
          if (m_axis_tready_i | !m_axis_tvalid_r) begin
            axis_pkt_cnt_c  = axis_pkt_cnt_r + 1;
            m_axis_tdata_c  = ordered_set_r[32*axis_pkt_cnt_r+:32];
            m_axis_tkeep_c  = '1;
            m_axis_tvalid_c = '1;
            m_axis_tlast_c  = '0;
            m_axis_tuser_c  = 8'h03;
            if (axis_pkt_cnt_r == 8'h03) begin
              m_axis_tlast_c = '1;
              axis_pkt_cnt_c = '0;
            end
            if (axis_pkt_cnt_r == 8'h00) begin
              if (&lane_num_formed) begin
                axis_pkt_cnt_c = '0;
                ordered_set_sent_cnt_c = '0;
                m_axis_tvalid_c = '0;
                timer_c = '0;
                next_state = ST_CONFIG_IDLE;
                ordered_set_c = gen_sds_os();
              end else if (timer_r >= TwoMsTimeOut) begin
                error_c = '1;
                next_state = ST_WAIT_EN_LOW;
              end
            end
          end
        end
        //-----------------------------------------------------------
        //  Configuration.Idle
        //-----------------------------------------------------------
        ST_CONFIG_IDLE: begin
          timer_c = (timer_r >= TwoMsTimeOut) ? TwoMsTimeOut : timer_r + 1;
          if (m_axis_tready_i | !m_axis_tvalid_r) begin
            axis_pkt_cnt_c  = axis_pkt_cnt_r + 1;
            m_axis_tdata_c  = ordered_set_r[32*axis_pkt_cnt_r+:32];
            m_axis_tkeep_c  = '1;
            m_axis_tvalid_c = '1;
            m_axis_tlast_c  = '0;
            m_axis_tuser_c  = 8'h03;
            if (axis_pkt_cnt_r == 8'h03) begin
              m_axis_tlast_c = '1;
            end
            if (axis_pkt_cnt_r == 8'h00) begin
              ordered_set_c = gen_idle();
              if (single_idle_recieved) begin
                ordered_set_sent_cnt_c = ordered_set_sent_cnt_r + 1;
              end
              if (link_idle_satisfied && (ordered_set_sent_cnt_r >= 16)) begin
                success_c = '1;
                ordered_set_sent_cnt_c = '0;
                m_axis_tvalid_c = '0;
                axis_pkt_cnt_c = '0;
                next_state = ST_WAIT_EN_LOW;
              end else if (timer_r >= TwoMsTimeOut) begin
                error_c = '1;
                next_state = ST_WAIT_EN_LOW;
              end
            end
          end
        end
        ST_WAIT_EN_LOW: begin
          if (!en_i) begin
            next_state = ST_IDLE;
            success_c = '0;
            error_c = '0;
          end
        end
        default: begin
        end
      endcase
    end

    //-----------------------------------------------------------
    //  Lane based Ordered set handling logic
    //-----------------------------------------------------------
    for (genvar i = 0; i < MAX_NUM_LANES; i++) begin : gen_cnt_ordered_set
      logic [7:0] ts1_cnt;
      logic [7:0] ts2_cnt;

      //determine if TS1 req satisfied for lane by its count
      assign link_width_satisfied[i] = (ts1_cnt == 8'h2);
      //determine if TS1 req satisfied for lane by its count
      assign link_lanes_formed[i] = (ts1_cnt == 8'h2);
      //determine if TS1 req satisfied
      assign ts1_lanenum_wait_satisfied[i] = (ts1_cnt == 8'h2) | (ts2_cnt == 8'h2);
      assign link_lanes_nums_match[i] = (ts2_cnt == 8'h2);
      assign link_lane_reconfig[i] = (ts1_cnt == 8'h2);
      assign lane_num_formed[i] = lane_active_i[i] ? (ts2_cnt == 8'h8) : '1;
      //determine if TS1 req satisfied for lane by its count
      assign link_idle_satisfied[i] = (ts1_cnt == 8'h8);


      always_ff @(posedge clk_i) begin : cnt_ts1
        if (rst_i) begin
          //reset count and selected incoming link number
          ts1_cnt <= '0;
          ts2_cnt <= '0;
          link_selected <= '0;
          single_idle_recieved[i] <= '0;
        end else begin
          case (curr_state)
            ST_IDLE: begin
              ts1_cnt <= '0;
              ts2_cnt <= '0;
              single_idle_recieved[i] <= '0;
            end
            ST_CONFIG_LINKWIDTH_START: begin
              if (next_state != curr_state) begin
                ts1_cnt <= '0;
                ts2_cnt <= '0;
                single_idle_recieved[i] <= '0;
              end else
              //wait for incoming ts1-os...//skip if threshhold already reached
              if (ts1_valid_i[i] && (ts1_cnt != 8'h2)) begin
                //check that link number is not pad and that lane number is pad
                if (((link_num_i[i*8+:8] != PAD) && (lane_num_i[i*8+:8] == PAD))) begin
                  //incrment ts1 count
                  ts1_cnt <= ts1_cnt + 1;
                end else begin
                  //reset ts1 cnt... this ensures that the TS1-OS are consecutive per the spec
                  ts1_cnt <= '0;
                end
              end
              //check if consecutive TS1's satisfied for this lane
              if (link_width_satisfied[i]) begin
                //select link number by choosing lowest significanct lane satisfied
                //ignore all other lanes
                if ((i == 0) || (link_width_satisfied[i:0] == '0)) begin
                  link_selected <= link_num_i[i];
                end
              end
            end
            ST_CONFIG_LINKWIDTH_ACCEPT: begin
              if (next_state != curr_state) begin
                ts1_cnt <= '0;
                ts2_cnt <= '0;
                single_idle_recieved[i] <= '0;
              end else
              //wait for incoming ts1-os...//skip if threshhold already reached
              if (ts1_valid_i[i] && (ts1_cnt != 8'h2)) begin
                //check that incoming link number matches the "link_selected"
                //that we are now transmitting and that lane number is different
                //from the one stored when we entered this state
                if (((link_num_i[i] == link_selected) &&
                (lane_num_i[i] != lane_num_transmitted_i[i]))) begin
                  //increment count
                  ts1_cnt <= ts1_cnt + 1;
                end else begin
                  ts1_cnt <= '0;
                end
              end
            end
            ST_CONFIG_LANENUM_WAIT: begin
              if (next_state != curr_state) begin
                ts1_cnt <= '0;
                ts2_cnt <= '0;
                single_idle_recieved[i] <= '0;
              end else if (ts1_valid_i[i] && (ts1_cnt != 8'h2)) begin
                if (ts2_cnt != 8'h2) begin
                  ts2_cnt <= '0;
                end
                if (((link_num_i[i] == link_selected) && (lane_num_i[i] != PAD))) begin
                  ts1_cnt <= ts1_cnt + 1;
                end else begin
                  ts1_cnt <= '0;
                end
              end else if (ts2_valid_i[i] && (ts2_cnt != 8'h2)) begin
                if (ts1_cnt != 8'h2) begin
                  ts1_cnt <= '0;
                end
                ts2_cnt <= ts2_cnt + 1;
              end
            end
            ST_CONFIG_LANENUM_ACCEPT: begin
              if (next_state != curr_state) begin
                ts1_cnt <= '0;
                ts2_cnt <= '0;
                single_idle_recieved[i] <= '0;
              end else if (ts2_valid_i[i] && (ts2_cnt != 8'h2)) begin
                if (ts1_cnt != 8'h2) begin
                  ts1_cnt <= '0;
                end
                if ((link_num_i[i] == link_selected) &&
              (lane_num_i[i] == lane_num_transmitted_i[i])) begin
                  ts2_cnt <= ts2_cnt + 1;
                end else begin
                  ts2_cnt <= '0;
                end
              end else if (ts1_valid_i[i] && (ts1_cnt != 8'h2)) begin
                if (ts2_cnt != 8'h2) begin
                  ts2_cnt <= '0;
                end
                if ((link_num_i[i] == link_selected) && (lane_num_i[i] != PAD)) begin
                  ts1_cnt <= ts1_cnt + 1;
                end else begin
                  ts1_cnt <= '0;
                end
              end
            end
            ST_CONFIG_COMPLETE: begin
              if (next_state != curr_state) begin
                ts1_cnt <= '0;
                ts2_cnt <= '0;
                single_idle_recieved[i] <= '0;
              end else if (ts2_valid_i[i] && (ts2_cnt != 8'h8)) begin
                if ((link_num_i[i] == link_selected) &&
            (lane_num_i[i] == lane_num_transmitted_i[i]) ) begin
                  ts2_cnt <= ts2_cnt + 1;
                  ts1_cnt <= '0;
                end else begin
                  ts1_cnt <= '0;
                  ts2_cnt <= '0;
                end
              end
            end
            ST_CONFIG_IDLE: begin
              if (next_state != curr_state) begin
                ts1_cnt <= '0;
                ts2_cnt <= '0;
                single_idle_recieved[i] <= '0;
              end else
              //wait for incoming ts1-os...//skip if threshhold already reached
              if (idle_valid_i[i] && (ts1_cnt != 8'h8)) begin
                single_idle_recieved[i] <= '1;
                ts1_cnt <= ts1_cnt + 1;
              end else if (ts1_valid_i || ts2_valid_i) begin
                ts1_cnt <= '0;
              end
            end
            default: begin
            end
          endcase
        end
      end
    end : gen_cnt_ordered_set
  end

  //------------------------------------------------------------
  //output assignments
  //------------------------------------------------------------
  assign m_axis_tdata_o = m_axis_tdata_r;
  assign m_axis_tkeep_o = m_axis_tkeep_r;
  assign m_axis_tvalid_o = m_axis_tvalid_r;
  assign m_axis_tlast_o = m_axis_tlast_r;
  assign m_axis_tuser_o = m_axis_tuser_r;
  assign success_o = success_r;
  assign error_o = error_r;

endmodule
