
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
    input  logic                                    clk_i,               //! 100MHz clock signal
    input  logic                                    rst_i,               //! Reset signal
    input  logic                                    en_i,
    input  logic [                             5:0] num_active_lanes_i,
    input  logic [               MAX_NUM_LANES-1:0] lane_active_i,
    input  logic [               MAX_NUM_LANES-1:0] lane_status_i,
    output logic                                    fc_initialized_o,
    //pipe interface output
    output logic [( MAX_NUM_LANES* DATA_WIDTH)-1:0] pipe_data_o,
    output logic [               MAX_NUM_LANES-1:0] pipe_data_valid_o,
    output logic [           (4*MAX_NUM_LANES)-1:0] pipe_data_k_o,
    output logic [           (2*MAX_NUM_LANES)-1:0] pipe_sync_header_o,
    //pipe interface input
    input  logic [( MAX_NUM_LANES* DATA_WIDTH)-1:0] pipe_data_i,
    input  logic [               MAX_NUM_LANES-1:0] pipe_data_valid_i,
    input  logic [           (4*MAX_NUM_LANES)-1:0] pipe_data_k_i,
    input  logic [           (2*MAX_NUM_LANES)-1:0] pipe_sync_header_i,
    //TLP AXIS inputs
    input  logic [                  DATA_WIDTH-1:0] s_tlp_axis_tdata,
    input  logic [                  KEEP_WIDTH-1:0] s_tlp_axis_tkeep,
    input  logic                                    s_tlp_axis_tvalid,
    input  logic                                    s_tlp_axis_tlast,
    input  logic [                  USER_WIDTH-1:0] s_tlp_axis_tuser,
    output logic                                    s_tlp_axis_tready,
    //TLP AXIS output
    output logic [                  DATA_WIDTH-1:0] m_tlp_axis_tdata,
    output logic [                  KEEP_WIDTH-1:0] m_tlp_axis_tkeep,
    output logic                                    m_tlp_axis_tvalid,
    output logic                                    m_tlp_axis_tlast,
    output logic [                  USER_WIDTH-1:0] m_tlp_axis_tuser,
    input  logic                                    m_tlp_axis_tready
);


  parameter int RX_FIFO_SIZE = 3;
  parameter int RETRY_TLP_SIZE = 3;
  parameter int MAX_PAYLOAD_SIZE = 4096;

  logic                                      link_up;
  ts_symbol6_union_t [    MAX_NUM_LANES-1:0] symbol6;
  logic              [(MAX_NUM_LANES*8)-1:0] lane_number;
  logic              [(MAX_NUM_LANES*8)-1:0] link_number;
  logic              [    MAX_NUM_LANES-1:0] ts1_valid;
  logic              [    MAX_NUM_LANES-1:0] ts2_valid;
  logic              [    MAX_NUM_LANES-1:0] idle_valid;
  training_ctrl_t    [    MAX_NUM_LANES-1:0] training_ctrl;
  rate_speed_e                               curr_data_rate;
  pcie_ordered_set_t                         ordered_set;
  logic                                      ordered_set_tranmitted;
  logic                                      send_ordered_set;
  rate_id_t          [    MAX_NUM_LANES-1:0] rate_id;
  logic              [                  5:0] pipe_width;


  logic              [       DATA_WIDTH-1:0] m_dllp_axis_tdata;
  logic              [       KEEP_WIDTH-1:0] m_dllp_axis_tkeep;
  logic                                      m_dllp_axis_tvalid;
  logic                                      m_dllp_axis_tlast;
  logic              [       USER_WIDTH-1:0] m_dllp_axis_tuser;
  logic                                      m_dllp_axis_tready;


  logic              [       DATA_WIDTH-1:0] s_dllp_axis_tdata;
  logic              [       KEEP_WIDTH-1:0] s_dllp_axis_tkeep;
  logic                                      s_dllp_axis_tvalid;
  logic                                      s_dllp_axis_tlast;
  logic              [       USER_WIDTH-1:0] s_dllp_axis_tuser;
  logic                                      s_dllp_axis_tready;


  phy_recieve #(
      .CLK_RATE(CLK_RATE),
      .MAX_NUM_LANES(MAX_NUM_LANES),
      .DATA_WIDTH(DATA_WIDTH),
      .STRB_WIDTH(STRB_WIDTH),
      .KEEP_WIDTH(KEEP_WIDTH),
      .USER_WIDTH(USER_WIDTH)
  ) phy_recieve_inst (
      .clk_i(clk_i),
      .rst_i(rst_i),
      .en_i(en_i),
      .link_up_i(link_up),
      .pipe_data_i(pipe_data_i),
      .pipe_data_valid_i(pipe_data_valid_i),
      .pipe_data_k_i(pipe_data_k_i),
      .pipe_sync_header_i(pipe_sync_header_i),
      .pipe_width_i(pipe_width),
      .num_active_lanes_i(num_active_lanes_i),
      .ts1_valid_o(ts1_valid),
      .ts2_valid_o(ts2_valid),
      .idle_valid_o(idle_valid),
      .rate_id_o(rate_id),
      .link_num_o(link_number),
      .lane_num_o(lane_number),
      .symbol6_o(symbol6),
      .training_ctrl_o(training_ctrl),
      .curr_data_rate_i(curr_data_rate),
      .m_dllp_axis_tdata(m_dllp_axis_tdata),
      .m_dllp_axis_tkeep(m_dllp_axis_tkeep),
      .m_dllp_axis_tvalid(m_dllp_axis_tvalid),
      .m_dllp_axis_tlast(m_dllp_axis_tlast),
      .m_dllp_axis_tuser(m_dllp_axis_tuser),
      .m_dllp_axis_tready(m_dllp_axis_tready)
  );


  phy_transmit #(
      .CLK_RATE(CLK_RATE),
      .MAX_NUM_LANES(MAX_NUM_LANES),
      .DATA_WIDTH(DATA_WIDTH),
      .STRB_WIDTH(STRB_WIDTH),
      .KEEP_WIDTH(KEEP_WIDTH),
      .USER_WIDTH(USER_WIDTH)
  ) phy_transmit_inst (
      .clk_i(clk_i),
      .rst_i(rst_i),
      .en_i(en_i),
      .link_up_i(link_up),
      .pipe_data_o(pipe_data_o),
      .pipe_data_valid_o(pipe_data_valid_o),
      .pipe_data_k_o(pipe_data_k_o),
      .pipe_sync_header_o(pipe_sync_header_o),
      .pipe_width_o(pipe_width),
      //   .num_active_lanes_o(num_active_lanes_o),
      .num_active_lanes_i(num_active_lanes_i),
      .send_ordered_set_i(send_ordered_set),
      .ordered_set_i(ordered_set),
      .curr_data_rate_i(curr_data_rate),
      .ordered_set_tranmitted_o(ordered_set_tranmitted),
      .s_dllp_axis_tdata(s_dllp_axis_tdata),
      .s_dllp_axis_tkeep(s_dllp_axis_tkeep),
      .s_dllp_axis_tvalid(s_dllp_axis_tvalid),
      .s_dllp_axis_tlast(s_dllp_axis_tlast),
      .s_dllp_axis_tuser(s_dllp_axis_tuser),
      .s_dllp_axis_tready(s_dllp_axis_tready)
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
      .link_up_o(link_up),
      .is_timeout_i(),
      .recovery_i(),
      .error_o(),
      .success_o(),
      .error_loopback_o(),
      .error_disable_o(),
      .ts1_valid_i(ts1_valid),
      .ts2_valid_i(ts2_valid),
      .idle_valid_i(idle_valid),
      .cfg_link_num_i(),
      .cfg_lane_num_i(),
      .link_num_i(link_number),
      .lane_num_i(lane_number),
      .lane_num_transmitted_i(),
      .lane_active_i(lane_active_i),
      .lanes_ts2_satisfied_i(),
      .config_copmlete_ts2_i(),
      .from_l0_i(),
      .reciever_detected_i(),
      .electrical_idle_i(),
      .tx_enter_elec_idle_o(),
      .goto_cfg_o(),
      .goto_detect_o(),
      .symbol6_i(symbol6),
      .training_ctrl_i(training_ctrl),
      .rate_id_i(rate_id),
      .max_rate_i(),
      .extended_synch_i(),
      .directed_speed_change_i(),
      .lane_status_i(lane_status_i),
      .curr_data_rate_o(curr_data_rate),
      .data_rate_o(),
      //   .gen_os_o(ordered_set),
      .ordered_set_tranmitted_i(ordered_set_tranmitted),
      .ordered_set_o(ordered_set),
      .send_ordered_set_o(send_ordered_set),
      .changed_speed_recovery_o()
  );

  pcie_datalink_layer #(
      .DATA_WIDTH(DATA_WIDTH),
      .STRB_WIDTH(STRB_WIDTH),
      .KEEP_WIDTH(KEEP_WIDTH),
      .USER_WIDTH(USER_WIDTH),
      .RX_FIFO_SIZE(RX_FIFO_SIZE),
      .RETRY_TLP_SIZE(RETRY_TLP_SIZE),
      .MAX_PAYLOAD_SIZE(MAX_PAYLOAD_SIZE)
  ) pcie_datalink_layer_inst (
      .clk_i(clk_i),
      .rst_i(rst_i),
      .s_tlp_axis_tdata(s_tlp_axis_tdata),
      .s_tlp_axis_tkeep(s_tlp_axis_tkeep),
      .s_tlp_axis_tvalid(s_tlp_axis_tvalid),
      .s_tlp_axis_tlast(s_tlp_axis_tlast),
      .s_tlp_axis_tuser(s_tlp_axis_tuser),
      .s_tlp_axis_tready(s_tlp_axis_tready),
      .m_tlp_axis_tdata(m_tlp_axis_tdata),
      .m_tlp_axis_tkeep(m_tlp_axis_tkeep),
      .m_tlp_axis_tvalid(m_tlp_axis_tvalid),
      .m_tlp_axis_tlast(m_tlp_axis_tlast),
      .m_tlp_axis_tuser(m_tlp_axis_tuser),
      .m_tlp_axis_tready(m_tlp_axis_tready),
      .s_phy_axis_tdata(m_dllp_axis_tdata),
      .s_phy_axis_tkeep(m_dllp_axis_tkeep),
      .s_phy_axis_tvalid(m_dllp_axis_tvalid),
      .s_phy_axis_tlast(m_dllp_axis_tlast),
      .s_phy_axis_tuser(m_dllp_axis_tuser),
      .s_phy_axis_tready(m_dllp_axis_tready),
      .m_phy_axis_tdata(s_dllp_axis_tdata),
      .m_phy_axis_tkeep(s_dllp_axis_tkeep),
      .m_phy_axis_tvalid(s_dllp_axis_tvalid),
      .m_phy_axis_tlast(s_dllp_axis_tlast),
      .m_phy_axis_tuser(s_dllp_axis_tuser),
      .m_phy_axis_tready(s_dllp_axis_tready),
      .phy_link_up_i(link_up),
      .fc_initialized_o(fc_initialized_o),
      .bus_num_o(),
      .ext_tag_enable_o(),
      .rcb_128b_o(),
      .max_read_request_size_o(),
      .max_payload_size_o(),
      .msix_enable_o(),
      .msix_mask_o(),
      .status_error_cor_i(),
      .status_error_uncor_i(),
      .rx_cpl_stall_i()
  );

endmodule
