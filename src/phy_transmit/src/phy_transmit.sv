
module phy_transmit
  import pcie_phy_pkg::*;
#(
    parameter int CLK_RATE      = 100,             //!Clock speed in MHz, Defualt is 100
    parameter int MAX_NUM_LANES = 16,              //! Maximum number of lanes module can support
    // TLP data width
    parameter int DATA_WIDTH    = 32,              //! AXIS data width
    // TLP strobe width
    parameter int STRB_WIDTH    = DATA_WIDTH / 8,
    parameter int KEEP_WIDTH    = STRB_WIDTH,
    parameter int USER_WIDTH    = 5
) (
    input logic clk_i,  //! 100MHz clock signal
    input logic rst_i,  //! Reset signal


    input  logic                                                 en_i,
    input  logic                                                 link_up_i,
    output logic              [( MAX_NUM_LANES* DATA_WIDTH)-1:0] pipe_data_o,
    output logic              [               MAX_NUM_LANES-1:0] pipe_data_valid_o,
    output logic              [           (4*MAX_NUM_LANES)-1:0] pipe_data_k_o,
    output logic              [           (2*MAX_NUM_LANES)-1:0] pipe_sync_header_o,
    output logic              [                             5:0] pipe_width_o,
    input  logic              [                             5:0] num_active_lanes_i,
    input  logic                                                 send_ordered_set_i,
    input  pcie_ordered_set_t                                    ordered_set_i,
    input  rate_speed_e                                          curr_data_rate_i,
    output logic                                                 ordered_set_tranmitted_o,
    input  gen_os_struct_t                                       gen_os_ctrl_i,
    input  logic              [                  DATA_WIDTH-1:0] s_dllp_axis_tdata,
    input  logic              [                  KEEP_WIDTH-1:0] s_dllp_axis_tkeep,
    input  logic                                                 s_dllp_axis_tvalid,
    input  logic                                                 s_dllp_axis_tlast,
    input  logic              [                  USER_WIDTH-1:0] s_dllp_axis_tuser,
    output logic                                                 s_dllp_axis_tready
);




  //   logic [DATA_WIDTH-1:0] dllp_axis_tdata;
  //   logic [KEEP_WIDTH-1:0] dllp_axis_tkeep;
  //   logic dllp_axis_tvalid;
  //   logic dllp_axis_tlast;
  //   logic [USER_WIDTH-1:0] dllp_axis_tuser;
  //   logic dllp_axis_tready;

  logic [                  DATA_WIDTH-1:0] framed_axis_tdata;
  logic [                  KEEP_WIDTH-1:0] framed_axis_tkeep;
  logic                                    framed_axis_tvalid;
  logic                                    framed_axis_tlast;
  logic [                  USER_WIDTH-1:0] framed_axis_tuser;
  logic                                    framed_axis_tready;

  logic [  (DATA_WIDTH*MAX_NUM_LANES)-1:0] phy_axis_tdata;
  logic [  (KEEP_WIDTH*MAX_NUM_LANES)-1:0] phy_axis_tkeep;
  logic                                    phy_axis_tvalid;
  logic                                    phy_axis_tlast;
  logic [  (USER_WIDTH*MAX_NUM_LANES)-1:0] phy_axis_tuser;
  logic                                    phy_axis_tready;

  logic [( MAX_NUM_LANES* DATA_WIDTH)-1:0] lm_data_out;
  logic [               MAX_NUM_LANES-1:0] lm_data_valid;
  logic [           (4*MAX_NUM_LANES)-1:0] lm_d_k_out;
  logic [           (2*MAX_NUM_LANES)-1:0] lm_sync_header;
  logic [                             5:0] lm_pipe_width;


  //   assign m_axis_tready   = phy_axis_tready;
  assign pipe_width_o = lm_pipe_width;

  frame_symbols #(
      .USER_WIDTH(USER_WIDTH),
      .DATA_WIDTH(DATA_WIDTH),
      .KEEP_WIDTH(KEEP_WIDTH)
  ) frame_symbols_inst (
      .clk_i(clk_i),
      .rst_i(rst_i),
      .curr_data_rate_i(curr_data_rate_i),
      .s_axis_tdata(s_dllp_axis_tdata),
      .s_axis_tkeep(s_dllp_axis_tkeep),
      .s_axis_tvalid(s_dllp_axis_tvalid),
      .s_axis_tlast(s_dllp_axis_tlast),
      .s_axis_tuser(s_dllp_axis_tuser),
      .s_axis_tready(s_dllp_axis_tready),
      .m_axis_tdata(framed_axis_tdata),
      .m_axis_tkeep(framed_axis_tkeep),
      .m_axis_tvalid(framed_axis_tvalid),
      .m_axis_tlast(framed_axis_tlast),
      .m_axis_tuser(framed_axis_tuser),
      .m_axis_tready(framed_axis_tready)
  );


  for (genvar lane = 0; lane < MAX_NUM_LANES; lane++) begin : gen_lane_scramble
    scrambler scrambler_inst (
        .clk_i(clk_i),
        .rst_i(rst_i),
        .lane_number(lane),
        .curr_data_rate_i(curr_data_rate_i),
        .pipe_width_i(lm_pipe_width),
        .data_in_i(lm_data_out[lane*32+:32]),
        .data_k_in_i(lm_d_k_out[lane*4+:4]),
        .data_valid_i(lm_data_valid[lane]),
        .sync_header_i(lm_sync_header[lane*2+:2]),
        .data_valid_o(pipe_data_valid_o[lane]),
        .data_out_o(pipe_data_o[lane*32+:32]),
        .data_k_out_o(pipe_data_k_o[lane*4+:4]),
        .sync_header_o(pipe_sync_header_o[lane*2+:2])
    );
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
      .s_dllp_axis_tdata(framed_axis_tdata),
      .s_dllp_axis_tkeep(framed_axis_tkeep),
      .s_dllp_axis_tvalid(framed_axis_tvalid),
      .s_dllp_axis_tlast(framed_axis_tlast),
      .s_dllp_axis_tuser(framed_axis_tuser),
      .s_dllp_axis_tready(framed_axis_tready),
      .s_phy_axis_tdata(phy_axis_tdata),
      .s_phy_axis_tkeep(phy_axis_tkeep),
      .s_phy_axis_tvalid(phy_axis_tvalid),
      .s_phy_axis_tlast(phy_axis_tlast),
      .s_phy_axis_tuser(phy_axis_tuser),
      .s_phy_axis_tready(phy_axis_tready),
      .curr_data_rate_i(curr_data_rate_i),
      .lane_reverse_i('0),
      .data_out_o(lm_data_out),
      .data_valid_o(lm_data_valid),
      .d_k_out_o(lm_d_k_out),
      .sync_header_o(lm_sync_header),
      .pipe_width_o(lm_pipe_width),
      .num_active_lanes_i(num_active_lanes_i)
  );


  os_generator #(
      .CLK_RATE(CLK_RATE),
      .DATA_WIDTH(DATA_WIDTH),
      .KEEP_WIDTH(KEEP_WIDTH),
      .USER_WIDTH(USER_WIDTH),
      .MAX_NUM_LANES(MAX_NUM_LANES)
  ) os_generator_inst (
      .clk_i(clk_i),
      .rst_i(rst_i),
      .curr_data_rate_i(curr_data_rate_i),
      .send_ltssm_os_i(send_ordered_set_i),
      .preset_i('0),
      .gen_os_ctrl_i(gen_os_ctrl_i),
      .os_sent_o(ordered_set_tranmitted_o),
      .ordered_set_i(ordered_set_i),
      .m_axis_tdata(phy_axis_tdata),
      .m_axis_tkeep(phy_axis_tkeep),
      .m_axis_tvalid(phy_axis_tvalid),
      .m_axis_tlast(phy_axis_tlast),
      .m_axis_tuser(phy_axis_tuser),
      .m_axis_tready(phy_axis_tready)
  );

  //always #5  clk = ! clk ;

endmodule
