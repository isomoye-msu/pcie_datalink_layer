
module tb_ltssm_configuration;

  // Parameters
  localparam int MAX_NUM_LANES = 4;
  localparam int DATA_WIDTH = 32;
  localparam int KEEP_WIDTH = DATA_WIDTH/8;
  localparam int USER_WIDTH = 5;

  //Ports
  reg clk;
  reg rst;
  reg en;
  reg link_up;
  wire error;
  wire success;
  wire error_loopback;
  wire error_disable;
  reg [MAX_NUM_LANES-1:0] link_width_satisfied;
  reg link_lanes_formed;
  reg link_lanes_nums_match;
  reg link_lane_reconfig;
  reg [MAX_NUM_LANES-1:0] lanes_ts1_satisfied;
  reg [MAX_NUM_LANES-1:0] lanes_ts2_satisfied;
  reg [MAX_NUM_LANES-1:0] config_copmlete_ts2;
  reg single_idle_recieved;
  reg link_idle_satisfied;
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
      .USER_WIDTH(USER_WIDTH)
  ) ltssm_configuration_inst (
      .clk_i(clk),
      .rst_i(rst),
      .en_i(en),
      .link_up_i(link_up),
      .error_o(error),
      .success_o(success),
      .error_loopback_o(error_loopback),
      .error_disable_o(error_disable),
      .link_width_satisfied_i(link_width_satisfied),
      .link_lanes_formed_i(link_lanes_formed),
      .link_lanes_nums_match_i(link_lanes_nums_match),
      .link_lane_reconfig_i(link_lane_reconfig),
      .lanes_ts1_satisfied_i(lanes_ts1_satisfied),
      .lanes_ts2_satisfied_i(lanes_ts2_satisfied),
      .config_copmlete_ts2_i(config_copmlete_ts2),
      .single_idle_recieved_i(single_idle_recieved),
      .link_idle_satisfied_i(link_idle_satisfied),
      .m_axis_tdata_o(m_axis_tdata),
      .m_axis_tkeep_o(m_axis_tkeep),
      .m_axis_tvalid_o(m_axis_tvalid),
      .m_axis_tlast_o(m_axis_tlast),
      .m_axis_tuser_o(m_axis_tuser),
      .m_axis_tready_i(m_axis_tready)
  );

  //always #5  clk = ! clk ;

endmodule
