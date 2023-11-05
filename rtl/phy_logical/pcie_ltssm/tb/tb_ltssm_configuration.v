
module tb_ltssm_configuration;

  // Parameters
  localparam int MAX_NUM_LANES = 4;
  localparam int DATA_WIDTH = 32;
  localparam int KEEP_WIDTH = DATA_WIDTH / 8;
  localparam int USER_WIDTH = DATA_WIDTH / 8;

  //Ports
  reg clk;
  reg rst;
  reg en;
  reg link_up;
  reg is_timeout;
  reg recovery;
  wire error;
  wire success;
  wire error_loopback;
  wire error_disable;
  reg [(MAX_NUM_LANES * 8)-1:0] rate_id;
  reg [MAX_NUM_LANES-1:0] ts1_valid;
  reg [MAX_NUM_LANES-1:0] ts2_valid;
  reg [MAX_NUM_LANES-1:0] idle_valid;
  reg [(MAX_NUM_LANES * 8)-1:0] link_num;
  reg [(MAX_NUM_LANES * 8)-1:0] lane_num;
  reg [(MAX_NUM_LANES * 8)-1:0] lane_num_transmitted;
  reg [(MAX_NUM_LANES * 8)-1:0] training_ctrl;
  reg [MAX_NUM_LANES-1:0] lane_active;
  reg [MAX_NUM_LANES-1:0] lanes_ts2_satisfied;
  reg [MAX_NUM_LANES-1:0] config_copmlete_ts2;
  wire [DATA_WIDTH-1:0] m_axis_tdata;
  wire [KEEP_WIDTH-1:0] m_axis_tkeep;
  wire m_axis_tvalid;
  wire m_axis_tlast;
  wire [USER_WIDTH-1:0] m_axis_tuser;
  reg m_axis_tready;

  ltssm_configuration #(
      .MAX_NUM_LANES(MAX_NUM_LANES),
      .DATA_WIDTH(DATA_WIDTH),
      .KEEP_WIDTH(KEEP_WIDTH),
      .USER_WIDTH(USER_WIDTH),
      .IS_UPSTREAM(1)
  ) ltssm_configuration_inst (
      .clk_i(clk),
      .rst_i(rst),
      .en_i(en),
      .link_up_i(link_up),
      .is_timeout_i(is_timeout),
      .recovery_i(recovery),
      .error_o(error),
      .success_o(success),
      .error_loopback_o(error_loopback),
      .error_disable_o(error_disable),
      .rate_id_i(rate_id),
      .ts1_valid_i(ts1_valid),
      .ts2_valid_i(ts2_valid),
      .idle_valid_i(idle_valid),
      .link_num_i(link_num),
      .lane_num_i(lane_num),
      .lane_num_transmitted_i(lane_num_transmitted),
      .training_ctrl_i(training_ctrl),
      .lane_active_i(lane_active),
      .lanes_ts2_satisfied_i(lanes_ts2_satisfied),
      .config_copmlete_ts2_i(config_copmlete_ts2),
      .m_axis_tdata_o(m_axis_tdata),
      .m_axis_tkeep_o(m_axis_tkeep),
      .m_axis_tvalid_o(m_axis_tvalid),
      .m_axis_tlast_o(m_axis_tlast),
      .m_axis_tuser_o(m_axis_tuser),
      .m_axis_tready_i(m_axis_tready)
  );

  //always #5  clk = ! clk ;

endmodule
