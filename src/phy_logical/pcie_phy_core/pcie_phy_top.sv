
module pcie_phy_top
  import pcie_phy_pkg::*;
#(
    parameter int CLK_RATE      = 100,             //!Clock speed in MHz, Defualt is 100
    parameter int MAX_NUM_LANES = 16,              //! Maximum number of lanes module can support
    // TLP data width
    parameter int DATA_WIDTH    = 32,              //! AXIS data width
    // TLP strobe width
    parameter int STRB_WIDTH    = DATA_WIDTH / 8,
    parameter int KEEP_WIDTH    = STRB_WIDTH,
    parameter int USER_WIDTH    = 5,
    // TLP keep width
    parameter int IS_ROOT_PORT  = 1,
    parameter int LINK_NUM      = 0,
    parameter int IS_UPSTREAM   = 0,               //downstream by default
    parameter int CROSSLINK_EN  = 0,               //crosslink not supported
    parameter int UPCONFIG_EN   = 0                //upconfig not supported
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
    input  logic [                    5:0] num_active_lanes_i,

    output logic goto_cfg_o,
    output logic goto_detect_o,

    //training set configuration signals
    input  ts_symbol6_union_t [MAX_NUM_LANES-1:0] symbol6_i,
    input  training_ctrl_t    [MAX_NUM_LANES-1:0] training_ctrl_i,
    input  rate_id_t          [MAX_NUM_LANES-1:0] rate_id_i,
    input  rate_speed_e                           max_rate_i,
    // input  rate_speed_e                           curr_data_rate_i,
    input  logic                                  extended_synch_i,
    //TODO: this needs to be computed from ts1's/ ts2's with
    //speed change bit or sw active
    input  logic                                  directed_speed_change_i,
    input  logic              [MAX_NUM_LANES-1:0] lane_status_i,
    // input  rate_id_t                              curr_data_rate_i,
    output rate_id_t                              data_rate_o,
    output logic                                  changed_speed_recovery_o,
    //! @end
    output logic              [   DATA_WIDTH-1:0] m_axis_tdata,
    output logic              [   KEEP_WIDTH-1:0] m_axis_tkeep,
    output logic                                  m_axis_tvalid,
    output logic                                  m_axis_tlast,
    output logic              [   USER_WIDTH-1:0] m_axis_tuser,
    input  logic                                  m_axis_tready


);


  //! @virtualbus master_axis_bus @dir out
  logic              [         DATA_WIDTH-1:0] ltssm_axis_tdata;
  logic              [         KEEP_WIDTH-1:0] ltssm_axis_tkeep;
  logic                                        ltssm_axis_tvalid;
  logic                                        ltssm_axis_tlast;
  logic              [         USER_WIDTH-1:0] ltssm_axis_tuser;
  logic                                        ltssm_axis_tready;

  logic              [         DATA_WIDTH-1:0] dllp_axis_tdata;
  logic              [         KEEP_WIDTH-1:0] dllp_axis_tkeep;
  logic                                        dllp_axis_tvalid;
  logic                                        dllp_axis_tlast;
  logic              [         USER_WIDTH-1:0] dllp_axis_tuser;
  logic                                        dllp_axis_tready;

  logic              [         DATA_WIDTH-1:0] phy_axis_tdata;
  logic              [         KEEP_WIDTH-1:0] phy_axis_tkeep;
  logic                                        phy_axis_tvalid;
  logic                                        phy_axis_tlast;
  logic              [         USER_WIDTH-1:0] phy_axis_tuser;
  logic                                        phy_axis_tready;

  logic              [                   31:0] lm_data_out             [MAX_NUM_LANES];
  logic              [      MAX_NUM_LANES-1:0] lm_data_valid;
  logic              [                    3:0] lm_d_k_out              [MAX_NUM_LANES];
  logic              [                    5:0] lm_pipe_width;
  logic              [                    1:0] lm_sync_header          [MAX_NUM_LANES];


  logic              [                   31:0] scrambler_data_out      [MAX_NUM_LANES];
  logic              [      MAX_NUM_LANES-1:0] scrambler_data_valid;
  logic              [                    3:0] scrambler_d_k_out       [MAX_NUM_LANES];
  logic              [                    5:0] scrambler_pipe_width;
  logic              [                    1:0] scrambler_sync_header   [MAX_NUM_LANES];



  logic              [                   31:0] de_scrambler_data_out   [MAX_NUM_LANES];
  logic              [      MAX_NUM_LANES-1:0] de_scrambler_data_valid;
  logic              [                    3:0] de_scrambler_d_k_out    [MAX_NUM_LANES];
  logic              [                    5:0] de_scrambler_pipe_width;
  logic              [                    1:0] de_scrambler_sync_header[MAX_NUM_LANES];

  rate_speed_e                                 curr_data_rate;

  logic              [(MAX_NUM_LANES * 8)-1:0] link_num;
  logic              [(MAX_NUM_LANES * 8)-1:0] lane_num;
  ts_symbol6_union_t [      MAX_NUM_LANES-1:0] symbol6;
  training_ctrl_t    [      MAX_NUM_LANES-1:0] training_ctrl;
  rate_id_t          [      MAX_NUM_LANES-1:0] rate_id;
  logic              [      MAX_NUM_LANES-1:0] ts1_valid;
  logic              [      MAX_NUM_LANES-1:0] ts2_valid;
  logic              [      MAX_NUM_LANES-1:0] idle_valid;

  assign m_axis_tdata  = ltssm_axis_tdata;
  assign m_axis_tkeep  = ltssm_axis_tkeep;
  assign m_axis_tvalid = ltssm_axis_tvalid;
  assign m_axis_tlast  = ltssm_axis_tlast;
  assign m_axis_tuser  = ltssm_axis_tuser;
  //   assign m_axis_tready   = ltssm_axis_tready;



  frame_symbols #(
      .USER_WIDTH(USER_WIDTH),
      .DATA_WIDTH(DATA_WIDTH),
      .KEEP_WIDTH(KEEP_WIDTH)
  ) frame_symbols_inst (
      .clk_i(clk_i),
      .rst_i(rst_i),
      .curr_data_rate_i(curr_data_rate),
      .s_axis_tdata(dllp_axis_tdata),
      .s_axis_tkeep(dllp_axis_tkeep),
      .s_axis_tvalid(dllp_axis_tvalid),
      .s_axis_tlast(dllp_axis_tlast),
      .s_axis_tuser(dllp_axis_tuser),
      .s_axis_tready(dllp_axis_tready),
      .m_axis_tdata(phy_axis_tdata),
      .m_axis_tkeep(phy_axis_tkeep),
      .m_axis_tvalid(phy_axis_tvalid),
      .m_axis_tlast(phy_axis_tlast),
      .m_axis_tuser(phy_axis_tuser),
      .m_axis_tready(phy_axis_tready)
  );


  pcie_flow_ctrl_init #(
      .DATA_WIDTH(DATA_WIDTH),
      .STRB_WIDTH(STRB_WIDTH),
      .KEEP_WIDTH(KEEP_WIDTH),
      .USER_WIDTH(USER_WIDTH),
      .MAX_PAYLOAD_SIZE(256)
  ) pcie_flow_ctrl_init_inst (
      .clk_i(clk_i),
      .rst_i(rst_i),
      .start_flow_control_i('1),
      .fc1_values_stored_i('0),
      .fc2_values_stored_i('0),
      .m_axis_tdata(dllp_axis_tdata),
      .m_axis_tkeep(dllp_axis_tkeep),
      .m_axis_tvalid(dllp_axis_tvalid),
      .m_axis_tlast(dllp_axis_tlast),
      .m_axis_tuser(dllp_axis_tuser),
      .m_axis_tready(dllp_axis_tready),
      .fc2_values_sent_o(),
      .init_ack_o()
  );


  for (genvar lane = 0; lane < MAX_NUM_LANES; lane++) begin : gen_lane_scramble
    scrambler scrambler_inst (
        .clk_i(clk_i),
        .rst_i(rst_i),
        .lane_number(lane),
        .sync_header_i(lm_sync_header[lane]),
        .curr_data_rate_i(curr_data_rate),
        .data_in_i(lm_data_out[lane]),
        .data_valid_i(lm_data_valid[lane]),
        .data_valid_o(scrambler_data_valid[lane]),
        .data_out_o(scrambler_data_out[lane]),
        .data_k_in_i(lm_d_k_out[lane]),
        .pipe_width_i(lm_pipe_width),
        .data_k_out_o(scrambler_d_k_out[lane]),
        .sync_header_o(scrambler_sync_header[lane])
    );


    descrambler descrambler_inst (
        .clk_i(clk_i),
        .rst_i(rst_i),
        .lane_number(lane),
        .sync_header_i(scrambler_sync_header[lane]),
        .curr_data_rate_i(curr_data_rate),
        .data_in_i(scrambler_data_out[lane]),
        .data_valid_i(scrambler_data_valid[lane]),
        .data_valid_o(de_scrambler_data_valid[lane]),
        .data_out_o(de_scrambler_data_out[lane]),
        .data_k_in_i(scrambler_d_k_out[lane]),
        .pipe_width_i(lm_pipe_width),
        .data_k_out_o(de_scrambler_d_k_out[lane]),
        .sync_header_o(de_scrambler_sync_header[lane])
    );

    ordered_set_handler #(
        .CLK_RATE  (CLK_RATE),
        .DATA_WIDTH(DATA_WIDTH),
        .KEEP_WIDTH(KEEP_WIDTH),
        .USER_WIDTH(USER_WIDTH)
    ) ordered_set_handler_inst (
        .clk_i(clk_i),
        .rst_i(rst_i),
        .sync_header_i(de_scrambler_sync_header[lane]),
        .curr_data_rate_i(curr_data_rate[lane]),
        .data_in_i(de_scrambler_data_out[lane]),
        .data_valid_i(de_scrambler_data_valid[lane]),
        .data_k_in_i(de_scrambler_d_k_out[lane]),
        .pipe_width_i(lm_pipe_width),
        .link_num_o(link_num[lane*8+:8]),
        .lane_num_o(lane_num[lane*8+:8]),
        .nfts_o(),
        .symbol6_o(symbol6[lane]),
        .training_ctrl_o(training_ctrl[lane]),
        .rate_id_o(rate_id[lane]),
        .idle_valid_o(idle_valid[lane]),
        .ts1_valid_o(ts1_valid[lane]),
        .ts2_valid_o(ts2_valid[lane]),
        .eieos_valid_o()
    );

    // scrambler scramble_inst (
    //     .clk_i(clk_i),
    //     .rst_i(rst_i),
    //     .data_in_i('0),
    //     .data_valid_o(),
    //     .data_k_out_o(),
    //     .data_valid_i(lm_data_valid[lane]),
    //     .data_out_o(),
    //     .data_k_in_i(lm_d_k_out[lane]),
    //     .pipe_width_i(lm_pipe_width)
    // );
  end


  lane_management #(
      .DATA_WIDTH(DATA_WIDTH),
      .STRB_WIDTH(STRB_WIDTH),
      .KEEP_WIDTH(KEEP_WIDTH),
      .USER_WIDTH(USER_WIDTH),
      .MAX_NUM_LANES(MAX_NUM_LANES)
  ) lane_management_inst (
      .clk_i(clk_i),
      .rst_i(rst_i),
      .phy_link_up_i(),
      .s_dllp_axis_tdata(phy_axis_tdata),
      .s_dllp_axis_tkeep(phy_axis_tkeep),
      .s_dllp_axis_tvalid(phy_axis_tvalid),
      .s_dllp_axis_tlast(phy_axis_tlast),
      .s_dllp_axis_tuser(phy_axis_tuser),
      .s_dllp_axis_tready(phy_axis_tready),
      .s_phy_axis_tdata(ltssm_axis_tdata),
      .s_phy_axis_tkeep(ltssm_axis_tkeep),
      .s_phy_axis_tvalid(ltssm_axis_tvalid),
      .s_phy_axis_tlast(ltssm_axis_tlast),
      .s_phy_axis_tuser(ltssm_axis_tuser),
      .s_phy_axis_tready(ltssm_axis_tready),
      .curr_data_rate_i(curr_data_rate),
      .lane_reverse_i(),
      .data_out_o(lm_data_out),
      .data_valid_o(lm_data_valid),
      .d_k_out_o(lm_d_k_out),
      .sync_header_o(lm_sync_header),
      .pipe_width_o(lm_pipe_width),
      .num_active_lanes_i(num_active_lanes_i)
  );


  pcie_ltssm_downstream #(
      .CLK_RATE(CLK_RATE),
      .MAX_NUM_LANES(MAX_NUM_LANES),
      .DATA_WIDTH(DATA_WIDTH),
      .KEEP_WIDTH(KEEP_WIDTH),
      .USER_WIDTH(USER_WIDTH)
  ) pcie_ltssm_downstream_inst (
      .clk_i(clk_i),
      .rst_i(rst_i),
      .en_i(en_i),
      .link_up_i(link_up_i),
      .is_timeout_i(is_timeout_i),
      .recovery_i(recovery_i),
      .error_o(error_o),
      .success_o(success_o),
      .error_loopback_o(error_loopback_o),
      .error_disable_o(error_disable_o),
      .ts1_valid_i(ts1_valid),
      .ts2_valid_i(ts2_valid),
      .idle_valid_i(idle_valid),
      .cfg_link_num_i(cfg_link_num_i),
      .cfg_lane_num_i(cfg_lane_num_i),
      .link_num_i(link_num),
      .lane_num_i(lane_num),
      .lane_num_transmitted_i(lane_num_transmitted_i),
      .lane_active_i(lane_active_i),
      .lanes_ts2_satisfied_i(lanes_ts2_satisfied_i),
      .config_copmlete_ts2_i(config_copmlete_ts2_i),
      .from_l0_i(from_l0_i),
      .reciever_detected_i(reciever_detected_i),
      .electrical_idle_i(electrical_idle_i),
      .tx_enter_elec_idle_o(tx_enter_elec_idle_o),
      .goto_cfg_o(goto_cfg_o),
      .goto_detect_o(goto_detect_o),
      .symbol6_i(symbol6),
      .training_ctrl_i(training_ctrl),
      .rate_id_i(rate_id),
      .max_rate_i(max_rate_i),
      .extended_synch_i(extended_synch_i),
      .directed_speed_change_i(directed_speed_change_i),
      .lane_status_i(lane_status_i),
      .curr_data_rate_o(curr_data_rate),
      .data_rate_o(data_rate_o),
      //   .gen_os_o(ordered_set),
      .ordered_set_tranmitted_i(ordered_set_tranmitted),
      .ordered_set_o(ordered_set),
      .send_ordered_set_o(send_ordered_set),
      .changed_speed_recovery_o(changed_speed_recovery_o)
  );



  os_generator #(
      .CLK_RATE  (CLK_RATE),
      .DATA_WIDTH(DATA_WIDTH),
      .KEEP_WIDTH(KEEP_WIDTH),
      .USER_WIDTH(USER_WIDTH)
  ) os_generator_inst (
      .clk_i(clk_i),
      .rst_i(rst_i),
      .gen_os_ctrl_i('0),
      .curr_data_rate_i(curr_data_rate),
      .send_ltssm_os_i(send_ordered_set),
      .os_sent_o(ordered_set_tranmitted),
      .ordered_set_i(ordered_set),
      .m_axis_tdata(ltssm_axis_tdata),
      .m_axis_tkeep(ltssm_axis_tkeep),
      .m_axis_tvalid(ltssm_axis_tvalid),
      .m_axis_tlast(ltssm_axis_tlast),
      .m_axis_tuser(ltssm_axis_tuser),
      .m_axis_tready(ltssm_axis_tready)
  );

  logic send_ordered_set;
  pcie_ordered_set_t ordered_set;
  logic ordered_set_tranmitted;

  //always #5  clk = ! clk ;

endmodule
