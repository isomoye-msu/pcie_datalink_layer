module phy_recieve
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
    input logic                                    clk_i,              //! 100MHz clock signal
    input logic                                    rst_i,              //! Reset signal
    // !Control
    input logic                                    en_i,
    input logic                                    link_up_i,
    input logic [( MAX_NUM_LANES* DATA_WIDTH)-1:0] pipe_data_i,
    input logic [               MAX_NUM_LANES-1:0] pipe_data_valid_i,
    input logic [           (4*MAX_NUM_LANES)-1:0] pipe_data_k_i,
    input logic [           (2*MAX_NUM_LANES)-1:0] pipe_sync_header_i,




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

  localparam int PcieDataSize = $size(
      flat_descrambler_data
  ) + $size(
      flat_descrambler_data_valid
  ) + $size(
      flat_descrambler_data_k
  ) + $size(
      flat_descrambler_sync_header
  );


  //link values
  logic              [         (MAX_NUM_LANES * 8)-1:0] link_num;
  logic              [         (MAX_NUM_LANES * 8)-1:0] lane_num;
  ts_symbol6_union_t [               MAX_NUM_LANES-1:0] symbol6;
  training_ctrl_t    [               MAX_NUM_LANES-1:0] training_ctrl;
  rate_id_t          [               MAX_NUM_LANES-1:0] rate_id;
  logic              [               MAX_NUM_LANES-1:0] ts1_valid;
  logic              [               MAX_NUM_LANES-1:0] ts2_valid;
  logic              [               MAX_NUM_LANES-1:0] idle_valid;
  logic                                                 link_up;


  logic              [( MAX_NUM_LANES* DATA_WIDTH)-1:0] block_alignment_data;
  logic              [               MAX_NUM_LANES-1:0] block_alignment_data_valid;
  logic              [           (4*MAX_NUM_LANES)-1:0] block_alignment_data_k;
  logic              [           (2*MAX_NUM_LANES)-1:0] block_alignment_sync_header;

  logic              [( MAX_NUM_LANES* DATA_WIDTH)-1:0] packer_data;
  logic              [               MAX_NUM_LANES-1:0] packer_data_valid;
  logic              [           (4*MAX_NUM_LANES)-1:0] packer_data_k;
  logic              [           (2*MAX_NUM_LANES)-1:0] packer_sync_header;

  logic              [( MAX_NUM_LANES* DATA_WIDTH)-1:0] fifo_data;
  logic              [               MAX_NUM_LANES-1:0] fifo_data_valid;
  logic              [           (4*MAX_NUM_LANES)-1:0] fifo_data_k;
  logic              [           (2*MAX_NUM_LANES)-1:0] fifo_sync_header;


  logic              [                  DATA_WIDTH-1:0] rx_dllp_axis_tdata;
  logic              [                  KEEP_WIDTH-1:0] rx_dllp_axis_tkeep;
  logic                                                 rx_dllp_axis_tvalid;
  logic                                                 rx_dllp_axis_tlast;
  logic              [                  USER_WIDTH-1:0] rx_dllp_axis_tuser;
  logic                                                 rx_dllp_axis_tready;

  logic              [                  DATA_WIDTH-1:0] rx_tlp_axis_tdata;
  logic              [                  KEEP_WIDTH-1:0] rx_tlp_axis_tkeep;
  logic                                                 rx_tlp_axis_tvalid;
  logic                                                 rx_tlp_axis_tlast;
  logic              [                  USER_WIDTH-1:0] rx_tlp_axis_tuser;
  logic                                                 rx_tlp_axis_tready;

  for (genvar lane = 0; lane < MAX_NUM_LANES; lane++) begin : gen_lane_descramble

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
  end

  block_alignment #(
      .DATA_WIDTH(DATA_WIDTH),
      .MAX_NUM_LANES(MAX_NUM_LANES)
  ) block_alignment_inst (
      .clk_i(clk_i),
      .rst_i(rst_i),
      .phy_link_up_i(link_up),
      .lane_reverse_i('0),
      .curr_data_rate_i(curr_data_rate),
      .data_i(flat_descrambler_data),
      .data_valid_i(flat_descrambler_data_valid),
      .data_k_i(flat_descrambler_data_k),
      .sync_header_i(flat_descrambler_sync_header),
      .data_o(block_alignment_data),
      .data_valid_o(block_alignment_data_valid),
      .data_k_o(block_alignment_data_k),
      .sync_header_o(block_alignment_sync_header),
      .pipe_width_i(lm_pipe_width),
      .num_active_lanes_i(num_active_lanes_i)
  );

  pack_data #(
      .DATA_WIDTH(DATA_WIDTH),
      .MAX_NUM_LANES(MAX_NUM_LANES)
  ) pack_data_inst (
      .clk_i(clk_i),
      .rst_i(rst_i),
      .phy_link_up_i(link_up),
      .lane_reverse_i('0),
      .curr_data_rate_i(curr_data_rate),
      .data_i(block_alignment_data),
      .data_valid_i(block_alignment_data_valid),
      .data_k_i(block_alignment_data_k),
      .sync_header_i(block_alignment_sync_header),
      .data_o(packer_data),
      .data_valid_o(packer_data_valid),
      .data_k_o(packer_data_k),
      .sync_header_o(packer_sync_header),
      .pipe_width_i(lm_pipe_width),
      .fifo_wr_o(wr_en),
      .num_active_lanes_i(num_active_lanes_i)
  );


  //packed data storage fifo
  synchronous_fifo #(
      .DEPTH(20),
      .DATA_WIDTH(PcieDataSize)
  ) synchronous_fifo_inst (
      .clk_i(clk_i),
      .rst_i(rst_i),
      .w_en_i(wr_en),
      .r_en_i(rd_en),
      .data_in({packer_data, packer_data_k, packer_data_valid, packer_sync_header}),
      .data_out({fifo_data, fifo_data_k, fifo_data_valid, fifo_sync_header}),
      .full_o(fifo_full),
      .empty_o(fifo_empty)
  );

  data_handler #(
      .DATA_WIDTH(DATA_WIDTH),
      .STRB_WIDTH(STRB_WIDTH),
      .KEEP_WIDTH(KEEP_WIDTH),
      .USER_WIDTH(USER_WIDTH),
      .MAX_NUM_LANES(MAX_NUM_LANES)
  ) data_handler_inst (
      .clk_i(clk_i),
      .rst_i(rst_i),
      .phy_link_up_i(link_up),
      .phy_fifo_empty_i(fifo_empty),
      .phy_fifo_rd_en_o(rd_en),
      .lane_reverse_i('0),
      .curr_data_rate_i(curr_data_rate),
      .data_i(fifo_data),
      .data_valid_i(fifo_data_valid),
      .data_k_i(fifo_data_k),
      .sync_header_i(fifo_sync_header),
      .m_dllp_axis_tdata(rx_dllp_axis_tdata),
      .m_dllp_axis_tkeep(rx_dllp_axis_tkeep),
      .m_dllp_axis_tvalid(rx_dllp_axis_tvalid),
      .m_dllp_axis_tlast(rx_dllp_axis_tlast),
      .m_dllp_axis_tuser(rx_dllp_axis_tuser),
      .m_dllp_axis_tready(rx_dllp_axis_tready),
      .m_tlp_axis_tdata(rx_tlp_axis_tdata),
      .m_tlp_axis_tkeep(rx_tlp_axis_tkeep),
      .m_tlp_axis_tvalid(rx_tlp_axis_tvalid),
      .m_tlp_axis_tlast(rx_tlp_axis_tlast),
      .m_tlp_axis_tuser(rx_tlp_axis_tuser),
      .m_tlp_axis_tready(rx_tlp_axis_tready),
      .pipe_width_i(lm_pipe_width),
      .num_active_lanes_i(num_active_lanes_i)
  );

endmodule
