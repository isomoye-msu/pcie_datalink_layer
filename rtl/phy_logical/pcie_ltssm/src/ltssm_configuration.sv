// !upconfig not supported
// !crosslink not supported
module ltssm_configuration
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
    input logic clk_i,  // Clock signal
    input logic rst_i,  // Reset signal

    // Control
    input  logic en_i,
    input  logic link_up_i,
    input  logic is_timeout_i,
    input  logic recovery_i,
    output logic error_o,
    output logic success_o,
    output logic error_loopback_o,
    output logic error_disable_o,

    input logic [MAX_NUM_LANES-1:0] link_width_satisfied_i,
    input logic link_lanes_formed_i,
    input logic link_lanes_nums_match_i,
    input logic link_lane_reconfig_i,
    input logic [MAX_NUM_LANES-1:0] lanes_ts1_satisfied_i,
    input logic [MAX_NUM_LANES-1:0] lanes_ts2_satisfied_i,
    input logic [MAX_NUM_LANES-1:0] config_copmlete_ts2_i,

    input logic single_idle_recieved_i,
    input logic link_idle_satisfied_i,

    /*
 * TLP AXI output
 */
    output logic [DATA_WIDTH-1:0] m_axis_tdata_o,
    output logic [KEEP_WIDTH-1:0] m_axis_tkeep_o,
    output logic m_axis_tvalid_o,
    output logic m_axis_tlast_o,
    output logic [USER_WIDTH-1:0] m_axis_tuser_o,
    input logic m_axis_tready_i
);

  localparam int TwentyFourMsTimeOut = 32'h015B8D80;  //temp value
  localparam int TwoMsTimeOut = 32'h000B8D80;  //temp value


  typedef enum logic [4:0] {
    ST_IDLE,
    ST_CONFIG_LINK_WIDTH,
    ST_CONFIG_SEND_LINK_TS1,
    ST_CONFIG_LINK_WIDTH_ACCEPT,
    ST_CONFIG_SEND_LINK_LANE_TS1,
    ST_CONFIG_LANE_NUM_ACCEPT,
    ST_CONFIG_LANENUM_WAIT_SEND_TS1,
    ST_CONFIG_COMPLETE,
    ST_CONFIG_COMPLETE_SEND_TS2,
    ST_CONFIG_IDLE,
    // ST_CONFIG_CHECK_LINK_TS1,
    // ST_CONFIG_LANE_WIDTH,
    // ST_CONFIG_CHECK_LANE_TS1,
    ST_WAIT_EN_LOW
  } detect_st_e;


  detect_st_e curr_state, next_state;
  pcie_tsos_t tsos_c, tsos_r;

  logic [31:0] timer_c, timer_r;
  logic error_c, error_r;
  logic success_c, success_r;
  logic [MAX_NUM_LANES-1:0] lane_status_c, lane_status_r;
  logic [MAX_NUM_LANES-1:0] lanes_detected_c, lanes_detected_r;
  logic [15:0] ts1_sent_cnt_c, ts1_sent_cnt_r;
  logic [7:0] axis_tsos_cnt_c, axis_tsos_cnt_r;

  //axis signals
  logic [DATA_WIDTH-1:0] m_axis_tdata_c, m_axis_tdata_r;
  logic [KEEP_WIDTH-1:0] m_axis_tkeep_c, m_axis_tkeep_r;
  logic m_axis_tvalid_c, m_axis_tvalid_r;
  logic m_axis_tlast_c, m_axis_tlast_r;
  logic [USER_WIDTH-1:0] m_axis_tuser_c, m_axis_tuser_r;


  always_ff @(posedge clk_i or posedge rst_i) begin : main_seq
    if (rst_i) begin
      curr_state       <= ST_IDLE;
      timer_r          <= '0;
      error_r          <= '0;
      success_r        <= '0;
      lane_status_r    <= '0;
      lanes_detected_r <= '0;
      ts1_sent_cnt_r   <= '0;
      axis_tsos_cnt_r  <= '0;
      //axis signals
      m_axis_tvalid_r  <= m_axis_tvalid_c;
    end else begin
      curr_state       <= next_state;
      timer_r          <= timer_c;
      error_r          <= error_c;
      success_r        <= success_c;
      lane_status_r    <= lane_status_c;
      lanes_detected_r <= lanes_detected_c;
      ts1_sent_cnt_r   <= ts1_sent_cnt_c;
      axis_tsos_cnt_r  <= axis_tsos_cnt_c;
      //axis signals
      m_axis_tvalid_r  <= '0;
    end
    //non-resetable
    tsos_r <= tsos_c;
    //axis
    m_axis_tdata_r <= m_axis_tdata_c;
    m_axis_tkeep_r <= m_axis_tkeep_c;
    m_axis_tlast_r <= m_axis_tlast_c;
    m_axis_tuser_r <= m_axis_tuser_c;
  end

  if (!IS_UPSTREAM) begin : gen_downstream
    always_comb begin : main_combo
      next_state = curr_state;
      timer_c = timer_r;
      error_c = error_r;
      success_c = success_r;
      lane_status_c = lane_status_r;
      lanes_detected_c = lanes_detected_r;
      ts1_sent_cnt_c = ts1_sent_cnt_r;
      axis_tsos_cnt_c = axis_tsos_cnt_r;
      //axis signals
      m_axis_tdata_c = m_axis_tdata_r;
      m_axis_tkeep_c = m_axis_tkeep_r;
      m_axis_tvalid_c = m_axis_tvalid_r;
      m_axis_tlast_c = m_axis_tlast_r;
      m_axis_tuser_c = m_axis_tuser_r;
      //training seq
      tsos_c = tsos_r;
      //DOWNSTREAM port
      case (curr_state)
        ST_IDLE: begin
          if (en_i) begin
            timer_c = '0;
            next_state = ST_CONFIG_LINK_WIDTH;
            tsos_c = gen_tsos(TS1, LINK_NUM);
            ts1_sent_cnt_c = '0;
          end
        end
        ST_CONFIG_LINK_WIDTH: begin
          timer_c = (timer_r >= TwentyFourMsTimeOut) ? TwentyFourMsTimeOut : timer_r + 1;
          axis_tsos_cnt_c = axis_tsos_cnt_r + 1;
          m_axis_tdata_c = tsos_r[32*axis_tsos_cnt_r+:32];
          m_axis_tkeep_c = '1;
          m_axis_tvalid_c = '1;
          m_axis_tlast_c = '0;
          m_axis_tuser_c = 8'h01;
          next_state = ST_CONFIG_SEND_LINK_TS1;
        end
        ST_CONFIG_SEND_LINK_TS1: begin
          timer_c = (timer_r >= TwentyFourMsTimeOut) ? TwentyFourMsTimeOut : timer_r + 1;
          if (m_axis_tready_i) begin
            axis_tsos_cnt_c = axis_tsos_cnt_r + 1;
            m_axis_tdata_c  = tsos_r[32*axis_tsos_cnt_r+:32];
            if (axis_tsos_cnt_r == 8'h03) begin
              m_axis_tlast_c = '1;
            end
            if (axis_tsos_cnt_r == 8'h04) begin
              ts1_sent_cnt_c  = '0;
              m_axis_tvalid_c = '0;
              axis_tsos_cnt_c = '0;
              m_axis_tdata_c  = '0;
              if (|link_width_satisfied_i) begin
                next_state = ST_CONFIG_LINK_WIDTH_ACCEPT;
                tsos_c = gen_tsos(TS1, LINK_NUM, 0);
                timer_c = '0;
              end else if (timer_r >= TwentyFourMsTimeOut) begin
                error_c = '1;
                next_state = ST_WAIT_EN_LOW;
              end else begin
                next_state = ST_CONFIG_LINK_WIDTH;
              end
            end
          end
        end
        ST_CONFIG_LINK_WIDTH_ACCEPT: begin
          timer_c = (timer_r >= TwoMsTimeOut) ? TwoMsTimeOut : timer_r + 1;
          if (link_lanes_formed_i) begin
            //not implemented
            axis_tsos_cnt_c = axis_tsos_cnt_r + 1;
            m_axis_tdata_c = tsos_r[32*axis_tsos_cnt_r+:32];
            m_axis_tkeep_c = '1;
            m_axis_tvalid_c = '1;
            m_axis_tlast_c = '0;
            m_axis_tuser_c = 8'h01;
            next_state = ST_CONFIG_SEND_LINK_LANE_TS1;
          end else if (timer_r >= TwoMsTimeOut) begin
            error_c = '1;
            axis_tsos_cnt_c = '0;
            next_state = ST_WAIT_EN_LOW;
          end
        end
        ST_CONFIG_SEND_LINK_LANE_TS1: begin
          if (m_axis_tready_i) begin
            axis_tsos_cnt_c = axis_tsos_cnt_r + 1;
            m_axis_tdata_c  = tsos_r[32*axis_tsos_cnt_r+:32];
            m_axis_tkeep_c  = '1;
            m_axis_tvalid_c = '1;
            m_axis_tlast_c  = '0;
            m_axis_tuser_c  = 8'h03;
            if (axis_tsos_cnt_r == 8'h03) begin
              m_axis_tlast_c = '1;
            end
            if (axis_tsos_cnt_r == 8'h04) begin
              next_state = ST_CONFIG_LANE_NUM_ACCEPT;
              m_axis_tdata_c = '0;
              ts1_sent_cnt_c = '0;
              m_axis_tvalid_c = '0;
              axis_tsos_cnt_c = '0;
            end
          end
        end
        ST_CONFIG_LANE_NUM_ACCEPT: begin
          if (link_lanes_nums_match_i) begin
            next_state = ST_CONFIG_COMPLETE;
            timer_c = '0;
          end else if (link_lane_reconfig_i) begin
            axis_tsos_cnt_c = axis_tsos_cnt_r + 1;
            m_axis_tdata_c = tsos_r[32*axis_tsos_cnt_r+:32];
            m_axis_tkeep_c = '1;
            m_axis_tvalid_c = '1;
            m_axis_tlast_c = '0;
            m_axis_tuser_c = 8'h03;
            next_state = ST_CONFIG_LANENUM_WAIT_SEND_TS1;
          end
        end
        ST_CONFIG_LANENUM_WAIT_SEND_TS1: begin
          timer_c = (timer_r >= TwoMsTimeOut) ? TwoMsTimeOut : timer_r + 1;
          if (m_axis_tready_i) begin
            axis_tsos_cnt_c = axis_tsos_cnt_r + 1;
            m_axis_tdata_c  = tsos_r[32*axis_tsos_cnt_r+:32];
            m_axis_tkeep_c  = '1;
            m_axis_tvalid_c = '1;
            m_axis_tlast_c  = '0;
            m_axis_tuser_c  = 8'h03;
            if (axis_tsos_cnt_r == 8'h03) begin
              m_axis_tlast_c = '1;
            end
            if (axis_tsos_cnt_r == 8'h04) begin
              next_state = ST_CONFIG_LANE_NUM_ACCEPT;
              ts1_sent_cnt_c = '0;
              m_axis_tdata_c = '0;
              m_axis_tvalid_c = '0;
              axis_tsos_cnt_c = '0;
            end
          end
        end
        // ST_CONFIG_LANENUM_WAIT_SEND_TS1: begin
        //   timer_c = (timer_r >= TwoMsTimeOut) ? TwoMsTimeOut : timer_r + 1;
        //   if (link_lanes_formed_i) begin
        //     m_axis_tvalid_c = '0;
        //     next_state = ST_CONFIG_LANE_NUM_ACCEPT;
        //   end else if (timer_r >= TwoMsTimeOut) begin
        //     axis_tsos_cnt_c = '0;
        //     error_c = '1;
        //     next_state = ST_WAIT_EN_LOW;
        //   end
        // end
        ST_CONFIG_COMPLETE: begin
          timer_c = (timer_r >= TwoMsTimeOut) ? TwoMsTimeOut : timer_r + 1;
          if (m_axis_tready_i) begin
            next_state = ST_WAIT_EN_LOW;
            if (&lanes_ts2_satisfied_i) begin
              next_state = ST_CONFIG_COMPLETE_SEND_TS2;
              tsos_c = gen_tsos(TS1, LINK_NUM, 0);
              axis_tsos_cnt_c = '0;
              timer_c = '0;
            end else begin
              axis_tsos_cnt_c = '0;
              error_c = '1;
            end
          end
        end
        ST_CONFIG_COMPLETE_SEND_TS2: begin
          timer_c = (timer_r >= TwoMsTimeOut) ? TwoMsTimeOut : timer_r + 1;
          if (m_axis_tready_i) begin
            axis_tsos_cnt_c = axis_tsos_cnt_r + 1;
            m_axis_tdata_c  = tsos_r[32*axis_tsos_cnt_r+:32];
            m_axis_tkeep_c  = '1;
            m_axis_tvalid_c = '1;
            m_axis_tlast_c  = '0;
            m_axis_tuser_c  = 8'h03;
            if (axis_tsos_cnt_r == 8'h03) begin
              m_axis_tlast_c = '1;
            end
            if (axis_tsos_cnt_r == 8'h04) begin
              ts1_sent_cnt_c  = '0;
              m_axis_tvalid_c = '0;
              axis_tsos_cnt_c = '0;
              m_axis_tdata_c  = '0;
              if (&config_copmlete_ts2_i) begin
                next_state = ST_CONFIG_IDLE;
                tsos_c = gen_tsos(TS2, LINK_NUM, 0);
              end else if (timer_r >= TwoMsTimeOut) begin
                error_c = '1;
                next_state = ST_WAIT_EN_LOW;
              end else begin
                m_axis_tvalid_c = '1;
              end
            end
          end
        end
        ST_CONFIG_IDLE: begin
          if (m_axis_tready_i) begin
            axis_tsos_cnt_c = axis_tsos_cnt_r + 1;
            m_axis_tdata_c  = tsos_r[32*axis_tsos_cnt_r+:32];
            m_axis_tkeep_c  = '1;
            m_axis_tvalid_c = '1;
            m_axis_tlast_c  = '0;
            m_axis_tuser_c  = 8'h03;
            if (axis_tsos_cnt_r == 8'h03) begin
              m_axis_tlast_c = '1;
            end
            if (axis_tsos_cnt_r == 8'h04) begin
              ts1_sent_cnt_c  = '0;
              m_axis_tvalid_c = '0;
              axis_tsos_cnt_c = '0;
              m_axis_tdata_c  = '0;
              if (single_idle_recieved_i) begin
                ts1_sent_cnt_c = ts1_sent_cnt_r + 1;
              end
              if (link_idle_satisfied_i && (ts1_sent_cnt_r >= 16)) begin
                success_c  = '1;
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
  end else begin: gen_upstream
    always_comb begin : main_combo
      next_state = curr_state;
      timer_c = timer_r;
      error_c = error_r;
      success_c = success_r;
      lane_status_c = lane_status_r;
      lanes_detected_c = lanes_detected_r;
      ts1_sent_cnt_c = ts1_sent_cnt_r;
      axis_tsos_cnt_c = axis_tsos_cnt_r;
      //axis signals
      m_axis_tdata_c = m_axis_tdata_r;
      m_axis_tkeep_c = m_axis_tkeep_r;
      m_axis_tvalid_c = m_axis_tvalid_r;
      m_axis_tlast_c = m_axis_tlast_r;
      m_axis_tuser_c = m_axis_tuser_r;
      //training seq
      tsos_c = tsos_r;
      //DOWNSTREAM port
      //UPSTREAM LINK
      case (curr_state)
        ST_IDLE: begin
          if (en_i) begin
            timer_c = '0;
            next_state = ST_CONFIG_LINK_WIDTH;
            tsos_c = gen_tsos(TS1);
            ts1_sent_cnt_c = '0;
            if(recovery_i && !is_timeout_i) begin
              tsos_c.rate_id[6] = '1;
            end
          end
        end
        ST_CONFIG_LINK_WIDTH: begin
          timer_c = (timer_r >= TwentyFourMsTimeOut) ? TwentyFourMsTimeOut : timer_r + 1;
          axis_tsos_cnt_c = axis_tsos_cnt_r + 1;
          m_axis_tdata_c = tsos_r[32*axis_tsos_cnt_r+:32];
          m_axis_tkeep_c = '1;
          m_axis_tvalid_c = '1;
          m_axis_tlast_c = '0;
          m_axis_tuser_c = 8'h01;
          next_state = ST_CONFIG_SEND_LINK_TS1;
        end
        ST_CONFIG_SEND_LINK_TS1: begin
          timer_c = (timer_r >= TwentyFourMsTimeOut) ? TwentyFourMsTimeOut : timer_r + 1;
          if (m_axis_tready_i) begin
            axis_tsos_cnt_c = axis_tsos_cnt_r + 1;
            m_axis_tdata_c  = tsos_r[32*axis_tsos_cnt_r+:32];
            if (axis_tsos_cnt_r == 8'h03) begin
              m_axis_tlast_c = '1;
            end
            if (axis_tsos_cnt_r == 8'h04) begin
              ts1_sent_cnt_c  = '0;
              m_axis_tvalid_c = '0;
              axis_tsos_cnt_c = '0;
              m_axis_tdata_c  = '0;
              if (|link_width_satisfied_i) begin
                next_state = ST_CONFIG_LINK_WIDTH_ACCEPT;
                tsos_c = gen_tsos(TS1, LINK_NUM, 0);
                timer_c = '0;
              end else if (timer_r >= TwentyFourMsTimeOut) begin
                error_c = '1;
                next_state = ST_WAIT_EN_LOW;
              end else begin
                next_state = ST_CONFIG_LINK_WIDTH;
              end
            end
          end
        end
        ST_CONFIG_LINK_WIDTH_ACCEPT: begin
          timer_c = (timer_r >= TwoMsTimeOut) ? TwoMsTimeOut : timer_r + 1;
          if (link_lanes_formed_i) begin
            //not implemented
            axis_tsos_cnt_c = axis_tsos_cnt_r + 1;
            m_axis_tdata_c = tsos_r[32*axis_tsos_cnt_r+:32];
            m_axis_tkeep_c = '1;
            m_axis_tvalid_c = '1;
            m_axis_tlast_c = '0;
            m_axis_tuser_c = 8'b00000101;
            next_state = ST_CONFIG_SEND_LINK_LANE_TS1;
          end else if (timer_r >= TwoMsTimeOut) begin
            error_c = '1;
            axis_tsos_cnt_c = '0;
            next_state = ST_WAIT_EN_LOW;
          end
        end
        ST_CONFIG_SEND_LINK_LANE_TS1: begin
          if (m_axis_tready_i) begin
            axis_tsos_cnt_c = axis_tsos_cnt_r + 1;
            m_axis_tdata_c  = tsos_r[32*axis_tsos_cnt_r+:32];
            m_axis_tkeep_c  = '1;
            m_axis_tvalid_c = '1;
            m_axis_tlast_c  = '0;
            m_axis_tuser_c  = 8'h03;
            if (axis_tsos_cnt_r == 8'h03) begin
              m_axis_tlast_c = '1;
            end
            if (axis_tsos_cnt_r == 8'h04) begin
              next_state = ST_CONFIG_LANENUM_WAIT_SEND_TS1;
              m_axis_tdata_c = '0;
              ts1_sent_cnt_c = '0;
              m_axis_tvalid_c = '0;
              axis_tsos_cnt_c = '0;
            end
          end
        end
        ST_CONFIG_LANE_NUM_ACCEPT: begin
          if (link_lanes_nums_match_i) begin
            next_state = ST_CONFIG_COMPLETE;
            timer_c = '0;
          end else if (link_lane_reconfig_i) begin
            axis_tsos_cnt_c = axis_tsos_cnt_r + 1;
            m_axis_tdata_c = tsos_r[32*axis_tsos_cnt_r+:32];
            m_axis_tkeep_c = '1;
            m_axis_tvalid_c = '1;
            m_axis_tlast_c = '0;
            m_axis_tuser_c = 8'h03;
            next_state = ST_CONFIG_LANENUM_WAIT_SEND_TS1;
          end
        end
        ST_CONFIG_LANENUM_WAIT_SEND_TS1: begin
          timer_c = (timer_r >= TwoMsTimeOut) ? TwoMsTimeOut : timer_r + 1;
          if (m_axis_tready_i) begin
            axis_tsos_cnt_c = axis_tsos_cnt_r + 1;
            m_axis_tdata_c  = tsos_r[32*axis_tsos_cnt_r+:32];
            m_axis_tkeep_c  = '1;
            m_axis_tvalid_c = '1;
            m_axis_tlast_c  = '0;
            m_axis_tuser_c  = 8'h03;
            if (axis_tsos_cnt_r == 8'h03) begin
              m_axis_tlast_c = '1;
            end
            if (axis_tsos_cnt_r == 8'h04) begin
              next_state = ST_CONFIG_LANE_NUM_ACCEPT;
              ts1_sent_cnt_c = '0;
              m_axis_tdata_c = '0;
              m_axis_tvalid_c = '0;
              axis_tsos_cnt_c = '0;
            end
          end
        end
        // ST_CONFIG_LANENUM_WAIT_SEND_TS1: begin
        //   timer_c = (timer_r >= TwoMsTimeOut) ? TwoMsTimeOut : timer_r + 1;
        //   if (link_lanes_formed_i) begin
        //     m_axis_tvalid_c = '0;
        //     next_state = ST_CONFIG_LANE_NUM_ACCEPT;
        //   end else if (timer_r >= TwoMsTimeOut) begin
        //     axis_tsos_cnt_c = '0;
        //     error_c = '1;
        //     next_state = ST_WAIT_EN_LOW;
        //   end
        // end
        ST_CONFIG_COMPLETE: begin
          timer_c = (timer_r >= TwoMsTimeOut) ? TwoMsTimeOut : timer_r + 1;
          if (m_axis_tready_i) begin
            next_state = ST_WAIT_EN_LOW;
            if (&lanes_ts2_satisfied_i) begin
              next_state = ST_CONFIG_COMPLETE_SEND_TS2;
              tsos_c = gen_tsos(TS2, LINK_NUM, 0);
              axis_tsos_cnt_c = '0;
              timer_c = '0;
            end else begin
              axis_tsos_cnt_c = '0;
              error_c = '1;
            end
          end
        end
        ST_CONFIG_COMPLETE_SEND_TS2: begin
          timer_c = (timer_r >= TwoMsTimeOut) ? TwoMsTimeOut : timer_r + 1;
          if (m_axis_tready_i) begin
            axis_tsos_cnt_c = axis_tsos_cnt_r + 1;
            m_axis_tdata_c  = tsos_r[32*axis_tsos_cnt_r+:32];
            m_axis_tkeep_c  = '1;
            m_axis_tvalid_c = '1;
            m_axis_tlast_c  = '0;
            m_axis_tuser_c  = 8'h03;
            if (axis_tsos_cnt_r == 8'h03) begin
              m_axis_tlast_c = '1;
            end
            if (axis_tsos_cnt_r == 8'h04) begin
              ts1_sent_cnt_c  = '0;
              m_axis_tvalid_c = '0;
              axis_tsos_cnt_c = '0;
              m_axis_tdata_c  = '0;
              timer_c = '0;
              if (&config_copmlete_ts2_i) begin
                next_state = ST_CONFIG_IDLE;
                tsos_c = gen_tsos(SDS, LINK_NUM, 0);
              end else if (timer_r >= TwoMsTimeOut) begin
                error_c = '1;
                next_state = ST_WAIT_EN_LOW;
              end else begin
                m_axis_tvalid_c = '1;
              end
            end
          end
        end
        ST_CONFIG_IDLE: begin
          timer_c = (timer_r >= TwoMsTimeOut) ? TwoMsTimeOut : timer_r + 1;
          if (m_axis_tready_i) begin
            axis_tsos_cnt_c = axis_tsos_cnt_r + 1;
            m_axis_tdata_c  = tsos_r[32*axis_tsos_cnt_r+:32];
            m_axis_tkeep_c  = '1;
            m_axis_tvalid_c = '1;
            m_axis_tlast_c  = '0;
            m_axis_tuser_c  = 8'h03;
            if (axis_tsos_cnt_r == 8'h03) begin
              m_axis_tlast_c = '1;
              tsos_c = gen_tsos(IDLE, LINK_NUM, 0);
            end
            if (axis_tsos_cnt_r == 8'h04) begin
              ts1_sent_cnt_c  = '0;
              m_axis_tvalid_c = '0;
              axis_tsos_cnt_c = '0;
              m_axis_tlast_c = '0;
              //m_axis_tdata_c  = '0;
              //tsos_c = gen_tsos(SDS, LINK_NUM, 0);
              if (single_idle_recieved_i) begin
                ts1_sent_cnt_c = ts1_sent_cnt_r + 1;
              end
              if (link_idle_satisfied_i && (ts1_sent_cnt_r >= 16)) begin
                success_c  = '1;
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
  end

  assign m_axis_tdata_o = m_axis_tdata_r;
  assign m_axis_tkeep_o = m_axis_tkeep_r;
  assign m_axis_tvalid_o = m_axis_tvalid_r;
  assign m_axis_tlast_o = m_axis_tlast_r;
  assign m_axis_tuser_o = m_axis_tuser_r;


  assign success_o = success_r;
  assign error_o = error_r;

endmodule
