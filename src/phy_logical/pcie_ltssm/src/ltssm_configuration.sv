// !upconfig not supported
// !crosslink not supported
module ltssm_configuration
  import pcie_phy_pkg::*;
#(
    parameter int CLK_RATE      = 100,
    parameter int MAX_NUM_LANES = 4,
    // TLP data width
    parameter int DATA_WIDTH    = 32,
    // TLP keep width
    parameter int KEEP_WIDTH    = DATA_WIDTH / 8,
    parameter int USER_WIDTH    = $bits(phy_user_t),
    parameter int IS_ROOT_PORT  = 1,
    parameter int LINK_NUM      = 0,
    parameter int IS_UPSTREAM   = 0,                  //downstream by default
    parameter int CROSSLINK_EN  = 0,                  //crosslink not supported
    parameter int UPCONFIG_EN   = 0                   //upconfig not supported

) (
    input  logic                           clk_i,                   // Clock signal
    input  logic                           rst_i,                   // Reset signal
    // Control
    input  logic                           en_i,
    input  logic                           link_up_i,
    input  logic                           is_timeout_i,
    input  logic                           recovery_i,
    output logic                           goto_recovery_o,
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
    //TLP AXIS output
    output logic [         DATA_WIDTH-1:0] m_axis_tdata,
    output logic [         KEEP_WIDTH-1:0] m_axis_tkeep,
    output logic                           m_axis_tvalid,
    output logic                           m_axis_tlast,
    output logic [         USER_WIDTH-1:0] m_axis_tuser,
    input  logic                           m_axis_tready
);

  localparam int TwentyFourMsTimeOut = (CLK_RATE * (24 ** 5));  //32'h015B8D80;  //temp value
  localparam int TwoMsTimeOut = (CLK_RATE * (2 ** 5));  //32'h000B8D80;  //temp value

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
  logic              [              7:0] transfer_timer_c;
  logic              [              7:0] transfer_timer_r;
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
  logic              [   DATA_WIDTH-1:0] phy_axis_tdata;
  logic              [   KEEP_WIDTH-1:0] phy_axis_tkeep;
  logic                                  phy_axis_tvalid;
  logic                                  phy_axis_tlast;
  logic              [   USER_WIDTH-1:0] phy_axis_tuser;
  logic                                  phy_axis_tready;

  //link training helper signals
  logic              [MAX_NUM_LANES-1:0] link_width_satisfied;
  logic              [              7:0] link_selected;
  logic              [MAX_NUM_LANES-1:0] link_lanes_formed;
  logic              [MAX_NUM_LANES-1:0] lane_num_formed;
  logic              [MAX_NUM_LANES-1:0] lane_num_satisfied;

  logic              [MAX_NUM_LANES-1:0] link_lanes_nums_match;
  logic              [MAX_NUM_LANES-1:0] link_lane_reconfig;

  logic              [MAX_NUM_LANES-1:0] ts1_lanenum_wait_satisfied;

  logic              [MAX_NUM_LANES-1:0] single_idle_recieved;
  logic              [MAX_NUM_LANES-1:0] link_idle_satisfied;

  logic              [              7:0] idle_to_rlock_transitioned_c;
  logic              [              7:0] idle_to_rlock_transitioned_r;
  logic                                  goto_recovery_c;
  logic                                  goto_recovery_r;


  always_ff @(posedge clk_i or posedge rst_i) begin : main_seq
    if (rst_i) begin
      curr_state                   <= ST_IDLE;
      timer_r                      <= '0;
      error_r                      <= '0;
      success_r                    <= '0;
      lane_status_r                <= '0;
      lanes_detected_r             <= '0;
      ordered_set_sent_cnt_r       <= '0;
      axis_pkt_cnt_r               <= '0;
      rst_cnt_r                    <= '0;
      idle_to_rlock_transitioned_r <= '0;
    end else begin
      curr_state                   <= next_state;
      timer_r                      <= timer_c;
      error_r                      <= error_c;
      success_r                    <= success_c;
      lane_status_r                <= lane_status_c;
      lanes_detected_r             <= lanes_detected_c;
      ordered_set_sent_cnt_r       <= ordered_set_sent_cnt_c;
      axis_pkt_cnt_r               <= axis_pkt_cnt_c;
      idle_to_rlock_transitioned_r <= idle_to_rlock_transitioned_c;
      rst_cnt_r                    <= rst_cnt_c;
    end
    //non-resetable
    ordered_set_r <= ordered_set_c;
    goto_recovery_r <= goto_recovery_c;
    transfer_timer_r <= transfer_timer_c;
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
    `include "upstream_config.sv"
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
      .s_axis_tdata(phy_axis_tdata),
      .s_axis_tkeep(phy_axis_tkeep),
      .s_axis_tvalid(phy_axis_tvalid),
      .s_axis_tready(phy_axis_tready),
      .s_axis_tlast(phy_axis_tlast),
      .s_axis_tuser(phy_axis_tuser),
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
  // assign m_axis_tdata    = m_axis_tdata_r;
  // assign m_axis_tkeep    = m_axis_tkeep_r;
  // assign m_axis_tvalid   = m_axis_tvalid_r;
  // assign m_axis_tlast    = m_axis_tlast_r;
  // assign m_axis_tuser    = m_axis_tuser_r;
  assign goto_recovery_o = goto_recovery_r;
  assign success_o       = success_r;
  assign error_o         = error_r;

endmodule
