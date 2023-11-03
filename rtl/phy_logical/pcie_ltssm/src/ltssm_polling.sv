module ltssm_polling
  import pcie_phy_pkg::*;
#(
    parameter int MAX_NUM_LANES = 4,
    // TLP data width
    parameter int DATA_WIDTH = 32,
    // TLP keep width
    parameter int KEEP_WIDTH = DATA_WIDTH / 8,
    parameter int USER_WIDTH = $bits(phy_user_t)

) (
    input logic clk_i,  // Clock signal
    input logic rst_i,  // Reset signal

    // Control
    input  logic en_i,
    output logic error_o,
    output logic success_o,

    input logic [MAX_NUM_LANES-1:0] reciever_detected_i,
    input logic [MAX_NUM_LANES-1:0] ts1_valid_i,
    input logic [MAX_NUM_LANES-1:0] ts2_valid_i,
    input logic [7:0][MAX_NUM_LANES-1:0] link_num_i,
    input logic [7:0][MAX_NUM_LANES-1:0] lane_num_i,
    input training_ctrl_t [MAX_NUM_LANES-1:0] training_ctrl_i,

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

  localparam int FourtyEightMsTimeOut = 32'h2B71B00;  //temp value
  localparam int TwentyFourMsTimeOut = 32'h015B8D80;  //temp value

  typedef enum logic [4:0] {
    ST_IDLE,
    ST_POLLING_ACTIVE,
    ST_POLLING_SEND_TS1,
    ST_POLLING_CHECK_TS1,
    ST_POLLING_CONFIGURATION,
    ST_POLLING_SEND_TS2,
    ST_POLLING_CHECK_TS2,
    ST_POLLING_COMPLIANCE,
    ST_POLLING_SEND_MARGIN,
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
  logic rst_cnt_c, rst_cnt_r;

  //training sequence satisfy signals
  logic [MAX_NUM_LANES-1:0] lanes_ts1_satisfied;
  logic [MAX_NUM_LANES-1:0] lanes_ts2_satisfied;

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
      succes_r         <= '0;
      lane_status_r    <= '0;
      lanes_detected_r <= '0;
      ts1_sent_cnt_r   <= '0;
      axis_tsos_cnt_r  <= '0;
      //axis signals
      m_axis_tvalid_r  <= '0;
      rst_cnt_r        <= '0;
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
      m_axis_tvalid_r  <= m_axis_tvalid_c;
      rst_cnt_r        <= rst_cnt_c;
    end
    //non-resetable
    tsos_r <= tsos_c;
    //axis
    m_axis_tdata_r <= m_axis_tdata_c;
    m_axis_tkeep_r <= m_axis_tkeep_c;
    m_axis_tlast_r <= m_axis_tlast_c;
    m_axis_tuser_r <= m_axis_tuser_c;
  end


  always_comb begin : main_combo
    next_state = curr_state;
    timer_c = timer_r;
    error_c = error_r;
    success_c = success_r;
    lane_status_c = lane_status_r;
    lanes_detected_c = lanes_detected_r;
    ts1_sent_cnt_c = ts1_sent_cnt_r;
    axis_tsos_cnt_c = axis_tsos_cnt_r;
    rst_cnt_c = '0;

    //axis signals
    m_axis_tdata_c = m_axis_tdata_r;
    m_axis_tkeep_c = m_axis_tkeep_r;
    m_axis_tvalid_c = m_axis_tvalid_r;
    m_axis_tlast_c = m_axis_tlast_r;
    m_axis_tuser_c = m_axis_tuser_r;

    //training seq
    tsos_c = tsos_r;
    case (curr_state)
      ST_IDLE: begin
        if (en_i) begin
          timer_c = '0;
          next_state = ST_POLLING_ACTIVE;
          tsos_c = gen_tsos(TS1);
          ts1_sent_cnt_c = '0;
          rst_cnt_c = '0;
        end
      end
      ST_POLLING_ACTIVE: begin
        timer_c = timer_r + 1;
        axis_tsos_cnt_c = axis_tsos_cnt_r + 1;
        m_axis_tdata_c = tsos_r[32*axis_tsos_cnt_r+:32];
        m_axis_tkeep_c = '1;
        m_axis_tvalid_c = '1;
        m_axis_tlast_c = '0;
        m_axis_tuser_c = 8'h01;
        next_state = ST_POLLING_SEND_TS1;

      end
      ST_POLLING_SEND_TS1: begin
        timer_c = (timer_r >= TwentyFourMsTimeOut) ? TwentyFourMsTimeOut : timer_r + 1;
        if (m_axis_tready_i) begin
          axis_tsos_cnt_c = axis_tsos_cnt_r + 1;
          m_axis_tdata_c  = tsos_r[32*axis_tsos_cnt_r+:32];
          m_axis_tkeep_c  = '1;
          m_axis_tvalid_c = '1;
          m_axis_tlast_c  = '0;
          m_axis_tuser_c  = 8'h01;
          if (axis_tsos_cnt_r == 8'h03) begin
            m_axis_tlast_c = '1;
          end
          if (axis_tsos_cnt_r == 8'h04) begin
            m_axis_tlast_c = '0;
            if ((timer_r >= TwentyFourMsTimeOut) || (ts1_sent_cnt_r >= 1024)) begin
              if (&lanes_ts1_satisfied) begin
                next_state = ST_POLLING_CONFIGURATION;
                axis_tsos_cnt_c = '0;
                rst_cnt_c = '0;
                tsos_c = gen_tsos(TS2);
                timer_c = '0;
              end else begin
                next_state = ST_POLLING_COMPLIANCE;
              end
            end else begin
              next_state = ST_POLLING_ACTIVE;
            end
          end
        end
      end
      // ST_POLLING_CHECK_TS1: begin
      //   timer_c = (timer_r >= TwentyFourMsTimeOut) ? TwentyFourMsTimeOut : timer_r + 1;
      //   if (m_axis_tready_i) begin
      //     m_axis_tlast_c = '0;
      //     if ((timer_r >= TwentyFourMsTimeOut) || (ts1_sent_cnt_r >= 1024)) begin
      //       if (&lanes_ts1_satisfied) begin
      //         next_state = ST_POLLING_CONFIGURATION;
      //         tsos_c = gen_tsos(TS2);
      //         timer_c = '0;
      //       end else begin
      //         next_state = ST_POLLING_COMPLIANCE;
      //       end
      //     end else begin
      //       next_state = ST_POLLING_ACTIVE;
      //     end
      //   end
      // end
      ST_POLLING_COMPLIANCE: begin
        //not implemented
      end
      ST_POLLING_SEND_MARGIN: begin
        //not implemented
      end
      ST_POLLING_CONFIGURATION: begin
        axis_tsos_cnt_c = axis_tsos_cnt_r + 1;
        m_axis_tdata_c = tsos_r[32*axis_tsos_cnt_r+:32];
        m_axis_tkeep_c = '1;
        m_axis_tvalid_c = '1;
        m_axis_tlast_c = '0;
        m_axis_tuser_c = 8'h01;
        next_state = ST_POLLING_SEND_TS2;
        timer_c = (timer_r >= FourtyEightMsTimeOut) ? FourtyEightMsTimeOut : timer_r + 1;
      end
      ST_POLLING_SEND_TS2: begin
        timer_c = (timer_r >= FourtyEightMsTimeOut) ? FourtyEightMsTimeOut : timer_r + 1;
        if (m_axis_tready_i) begin
          axis_tsos_cnt_c = axis_tsos_cnt_r + 1;
          m_axis_tdata_c  = tsos_r[32*axis_tsos_cnt_r+:32];
          m_axis_tkeep_c  = '1;
          m_axis_tvalid_c = '1;
          m_axis_tlast_c  = '0;
          m_axis_tuser_c  = 8'h01;
          if (axis_tsos_cnt_r == 8'h03) begin
            m_axis_tlast_c = '1;
          end
          if (axis_tsos_cnt_r == 8'h04) begin
            m_axis_tlast_c = '0;
            if (&lanes_ts2_satisfied) begin
              success_c = '1;
              timer_c = '0;
              next_state = ST_WAIT_EN_LOW;
              rst_cnt_c = '0;
            end else if (timer_r >= TwentyFourMsTimeOut) begin
              error_c = '1;
              timer_c = '0;
              rst_cnt_c = '0;
              next_state = ST_WAIT_EN_LOW;
            end
          end
          // if (axis_tsos_cnt_r >= 8'h03) begin
          //   next_state = ST_POLLING_CHECK_TS2;
          //   axis_tsos_cnt_c = '0;
          //   m_axis_tlast_c = '1;
          // end
        end
      end
      // ST_POLLING_CHECK_TS2: begin
      //   if (m_axis_tready_i) begin
      //     m_axis_tlast_c = '0;
      //     next_state = ST_WAIT_EN_LOW;
      //     if (&lanes_ts2_satisfied) begin
      //       success_c = '1;
      //       timer_c   = '0;
      //     end else begin
      //       error_c = '1;
      //     end
      //   end
      // end
      ST_WAIT_EN_LOW: begin
        if (!en_i) begin
          next_state = ST_IDLE;
          success_c = '0;
          error_c = '0;
          rst_cnt_c = '0;
        end
      end
      default: begin
      end
    endcase
  end


  for (genvar i = 0; i < MAX_NUM_LANES; i++) begin : gen_cnt_ts1
    logic [7:0] ts1_cnt;
    always_ff @(posedge clk_i) begin : cnt_ts1
      if (rst_i) begin
        ts1_cnt <= '0;
      end else begin
        if (rst_cnt_r) begin
          ts1_cnt <= '0;
        end else if (ts1_valid_i[i] && (ts1_cnt != 8'h8)) begin
          if(((link_num_i[i] == PAD) && (lane_num_i[i] == PAD)) &&
          training_ctrl_i[i].loopback || training_ctrl_i[i][4]) begin
            ts1_cnt <= ts1_cnt + 1;
          end else begin
            ts1_cnt <= '0;
          end
        end else if (ts2_valid_i[i] && (ts1_cnt != 8'h8)) begin
          if (((link_num_i[i] == PAD) && (lane_num_i[i] == PAD))) begin
            ts1_cnt <= ts1_cnt + 1;
          end else begin
            ts1_cnt <= '0;
          end
        end
      end
    end : cnt_ts1
    assign lanes_ts1_satisfied[i] = reciever_detected_i[i] ? (ts1_cnt == 8'h8) : '1;
  end



  for (genvar i = 0; i < MAX_NUM_LANES; i++) begin : gen_cnt_ts2
    logic [7:0] ts2_cnt;
    always_ff @(posedge clk_i) begin : cnt_ts2
      if (rst_i) begin
        ts2_cnt <= '0;
      end else begin
        if (rst_cnt_r) begin
          ts2_cnt <= '0;
        end else if (ts2_valid_i[i] && (ts2_cnt != 8'h8)) begin
          if (((link_num_i[i] == PAD) && (lane_num_i[i] == PAD))) begin
            ts2_cnt <= ts2_cnt + 1;
          end else begin
            ts2_cnt <= '0;
          end
        end
      end
    end : cnt_ts2
    assign lanes_ts2_satisfied[i] = reciever_detected_i[i] ? (ts2_cnt == 8'h8) : '1;
  end

  assign m_axis_tdata_o = m_axis_tdata_r;
  assign m_axis_tkeep_o = m_axis_tkeep_r;
  assign m_axis_tvalid_o = m_axis_tvalid_r;
  assign m_axis_tlast_o = m_axis_tlast_r;
  assign m_axis_tuser_o = m_axis_tuser_r;


  assign success_o = success_r;
  assign error_o = error_r;

endmodule
