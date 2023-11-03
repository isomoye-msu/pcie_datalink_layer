module ltssm_detect
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

    input logic       en_i,
    input logic [2:0] phy_rate_i,


    input  logic [MAX_NUM_LANES-1:0] lane_status_i,
    output logic [MAX_NUM_LANES-1:0] lane_detected_o,
    output logic [MAX_NUM_LANES-1:0] lane_elec_idle_o,
    output logic [MAX_NUM_LANES-1:0] txdetectrx_o,

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


  localparam int TimeOutPeriod = 32'h0000DACA;

  typedef enum logic {
    ST_IDLE,
    ST_DETECT_QUIET,
    ST_DETECT_ACTIVE,
    ST_DETECT_RX,
    ST_WAIT_EN_LOW
  } detect_st_e;

  detect_st_e curr_state, next_state;
  pcie_tsos_t tsos_c, tsos_r;

  logic [31:0] timer_c, timer_r;
  logic error_c, error_r;
  logic success_c, success_r;
  logic [MAX_NUM_LANES-1:0] lane_status_c, lane_status_r;
  logic [MAX_NUM_LANES-1:0] lanes_detected_c, lanes_detected_r;
  logic [MAX_NUM_LANES-1:0] ena_lane_detect_c, ena_lane_detect_r;
  logic [MAX_NUM_LANES-1:0] lane_elec_idle_c, lane_elec_idle_r;
  logic [7:0] axis_tsos_cnt_c, axis_tsos_cnt_r;


  //axis signals
  logic [DATA_WIDTH-1:0] m_axis_tdata_c, m_axis_tdata_r;
  logic [KEEP_WIDTH-1:0] m_axis_tkeep_c, m_axis_tkeep_r;
  logic m_axis_tvalid_c, m_axis_tvalid_r;
  logic m_axis_tlast_c, m_axis_tlast_r;
  logic [USER_WIDTH-1:0] m_axis_tuser_c, m_axis_tuser_r;


  always_ff @(posedge clk_i or posedge rst_i) begin : main_seq
    if (rst_i) begin
      curr_state <= ST_IDLE;
      timer_r <= '0;
      error_r <= '0;
      succes_r <= '0;
      lane_status_r <= '0;
      lanes_detected_r <= '0;
      ena_lane_detect_r <= '0;
      lane_elec_idle_r <= '0;
      //axis signals
      m_axis_tvalid_r <= '0;
    end else begin
      curr_state <= next_state;
      timer_r <= timer_c;
      error_r <= error_c;
      success_r <= success_c;
      lane_status_r <= lane_status_c;
      lanes_detected_r <= lanes_detected_c;
      ena_lane_detect_r <= ena_lane_detect_c;
      lane_elec_idle_r <= lane_elec_idle_c;
      //axis signals
      m_axis_tvalid_r <= m_axis_tvalid_c;
    end
    //non-resetable
    tsos_r <= tsos_c;
    axis_tsos_cnt_r <= axis_tsos_cnt_c;
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
    ena_lane_detect_c = ena_lane_detect_r;
    lane_elec_idle_c = lane_elec_idle_r;
    case (curr_state)
      ST_IDLE: begin
        if (en_i) begin
          timer_c = '0;
          tsos_c = gen_idle();
          next_state = ST_DETECT_QUIET;
        end
      end
      ST_DETECT_QUIET: begin
        timer_c = timer_r + 1;
        if ((|lane_status_i) || (timer_r >= TimeOutPeriod)) begin
          next_state = ST_DETECT_ACTIVE;
          timer_c = '0;
          lane_status_c = lane_status_i;
        end
      end
      ST_DETECT_ACTIVE: begin
        if (lane_status_i == '1) begin
          success_c = '1;
          lanes_detected_c = lane_status_i;
          next_state = ST_WAIT_EN_LOW;
        end else if (lane_status_i == '0) begin
          error_c = '1;
          next_state = ST_WAIT_EN_LOW;
        end else begin
          next_state = ST_DETECT_RX;
          ena_lane_detect_c = ~lane_status_i;
        end
      end
      ST_DETECT_RX: begin
        timer_c = timer_r + 1;
        if (timer_r >= TimeOutPeriod) begin
          if ((lane_status_i == '1) || (lane_status_i == lane_status_r)) begin
            success_c = '1;
            ena_lane_detect_c = '0;
            lanes_detected_c = lane_status_i;
            lane_elec_idle_c = ~lane_status_i;
            next_state = ST_WAIT_EN_LOW;
          end else begin
            error_c = '1;
            next_state = ST_WAIT_EN_LOW;
          end
        end
      end
      ST_WAIT_EN_LOW: begin
        if (!en_i) begin
          success_c = '0;
          error_c = '0;
          next_state = ST_IDLE;
        end
      end
      default: begin

      end
    endcase
  end


  always_comb begin : send_idle
    //axis signals
    m_axis_tdata_c  = m_axis_tdata_r;
    m_axis_tkeep_c  = m_axis_tkeep_r;
    m_axis_tvalid_c = m_axis_tvalid_r;
    m_axis_tlast_c  = m_axis_tlast_r;
    m_axis_tuser_c  = m_axis_tuser_r;
    case (curr_state)
      ST_IDLE: begin
        m_axis_tvalid_c = '0;
        axis_tsos_cnt_c = '0;
      end
      ST_DETECT_QUIET: begin
        if (m_axis_tready_i || !m_axis_tvalid_r) begin
          m_axis_tvalid_c = '1;
          axis_tsos_cnt_c = (axis_tsos_cnt_r == 8'h03) ? '0 : axis_tsos_cnt_r + 1;
          m_axis_tdata_c  = tsos_r[32*axis_tsos_cnt_r+:32];
          m_axis_tkeep_c  = '1;
          m_axis_tvalid_c = '1;
          m_axis_tlast_c  = '1;
          m_axis_tuser_c  = 8'h03;
        end
      end
      ST_WAIT_EN_LOW, ST_DETECT_ACTIVE, ST_DETECT_RX: begin
        if (m_axis_tready_i || !m_axis_tvalid_r) begin
          m_axis_tvalid_c = '0;
        end
      end
      default: begin
      end
    endcase
  end


  assign lane_detected_o = lanes_detected_r;
  assign lane_elec_idle_o = lane_elec_idle_r;
  assign txdetectrx_o = ena_lane_detect_r;

endmodule
