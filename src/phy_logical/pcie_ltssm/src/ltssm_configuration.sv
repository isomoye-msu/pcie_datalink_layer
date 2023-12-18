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
    output logic goto_recovery_o,
    output logic error_o,
    output logic success_o,
    output logic error_loopback_o,
    output logic error_disable_o,

    input logic [(MAX_NUM_LANES * 8)-1:0] rate_id_i,
    input logic [MAX_NUM_LANES-1:0] ts1_valid_i,
    input logic [MAX_NUM_LANES-1:0] ts2_valid_i,
    input logic [MAX_NUM_LANES-1:0] idle_valid_i,
    input logic [(MAX_NUM_LANES * 8)-1:0] link_num_i,
    input logic [(MAX_NUM_LANES * 8)-1:0] lane_num_i,
    input logic [(MAX_NUM_LANES * 8)-1:0] lane_num_transmitted_i,
    input logic [(MAX_NUM_LANES * 8)-1:0] training_ctrl_i,

    //input logic [MAX_NUM_LANES-1:0] link_width_satisfied,
    //input logic link_lanes_formed,
    //input logic link_lanes_nums_match,
    //input logic link_lane_reconfig,
    input logic [MAX_NUM_LANES-1:0] lane_active_i,
    input logic [MAX_NUM_LANES-1:0] lanes_ts2_satisfied_i,
    input logic [MAX_NUM_LANES-1:0] config_copmlete_ts2_i,
    //TLP AXIS output
    output logic [DATA_WIDTH-1:0] m_axis_tdata,
    output logic [KEEP_WIDTH-1:0] m_axis_tkeep,
    output logic m_axis_tvalid,
    output logic m_axis_tlast,
    output logic [USER_WIDTH-1:0] m_axis_tuser,
    input logic m_axis_tready
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



  detect_st_e curr_state, next_state;
  pcie_ordered_set_t ordered_set_c, ordered_set_r;

  logic [31:0] timer_c, timer_r;
  logic error_c, error_r;
  logic success_c, success_r;
  logic [MAX_NUM_LANES-1:0] lane_status_c, lane_status_r;
  logic [MAX_NUM_LANES-1:0] lanes_detected_c, lanes_detected_r;
  logic [15:0] ordered_set_sent_cnt_c, ordered_set_sent_cnt_r;
  logic [7:0] axis_pkt_cnt_c, axis_pkt_cnt_r;
  logic rst_cnt_c, rst_cnt_r;

  //axis signals
  logic [DATA_WIDTH-1:0] m_axis_tdata_c, m_axis_tdata_r;
  logic [KEEP_WIDTH-1:0] m_axis_tkeep_c, m_axis_tkeep_r;
  logic m_axis_tvalid_c, m_axis_tvalid_r;
  logic m_axis_tlast_c, m_axis_tlast_r;
  logic [USER_WIDTH-1:0] m_axis_tuser_c, m_axis_tuser_r;

  //link training helper signals
  logic [MAX_NUM_LANES-1:0] link_width_satisfied;
  logic [7:0] link_selected;
  logic [MAX_NUM_LANES-1:0] link_lanes_formed;
  logic [MAX_NUM_LANES-1:0] lane_num_formed;
  logic [MAX_NUM_LANES-1:0] lane_num_satisfied;

  logic [MAX_NUM_LANES-1:0] link_lanes_nums_match;
  logic [MAX_NUM_LANES-1:0] link_lane_reconfig;

  logic [MAX_NUM_LANES-1:0] ts1_lanenum_wait_satisfied;
  // logic [MAX_NUM_LANES-1:0] link_lane_reconfig;


  logic [MAX_NUM_LANES-1:0] single_idle_recieved;
  logic [MAX_NUM_LANES-1:0] link_idle_satisfied;

  logic [7:0] idle_to_rlock_transitioned_c,idle_to_rlock_transitioned_r;
  logic goto_recovery_c, goto_recovery_r;


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
      idle_to_rlock_transitioned_r <= '0;
    end else begin
      curr_state             <= next_state;
      timer_r                <= timer_c;
      error_r                <= error_c;
      success_r              <= success_c;
      lane_status_r          <= lane_status_c;
      lanes_detected_r       <= lanes_detected_c;
      ordered_set_sent_cnt_r <= ordered_set_sent_cnt_c;
      axis_pkt_cnt_r         <= axis_pkt_cnt_c;
      idle_to_rlock_transitioned_r <= idle_to_rlock_transitioned_c;
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
    goto_recovery_r <= goto_recovery_c;
  end


  //***********************************************************
  //-----------------------------------------------------------
  // DOWNSTREAM LANES LOGIC
  //-----------------------------------------------------------
  //***********************************************************
  if (!IS_UPSTREAM) begin : gen_downstream
    `include "downstream_config.sv"
  end

  //***********************************************************
  //-----------------------------------------------------------
  //  UPSTREAM LANES LOGIC
  //-----------------------------------------------------------
  //***********************************************************
  if (IS_UPSTREAM) begin : gen_upstream
    `include "../includes/upstream_config.sv"
  end

  //------------------------------------------------------------
  //output assignments
  //------------------------------------------------------------
  assign m_axis_tdata = m_axis_tdata_r;
  assign m_axis_tkeep = m_axis_tkeep_r;
  assign m_axis_tvalid = m_axis_tvalid_r;
  assign m_axis_tlast = m_axis_tlast_r;
  assign m_axis_tuser = m_axis_tuser_r;
  assign goto_recovery_o = goto_recovery_r;
  assign success_o = success_r;
  assign error_o = error_r;

endmodule
