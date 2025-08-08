module phy_receive
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
    input logic clk_i,  // 100MHz clock signal
    input logic rst_i,  // Reset signal

    //Control
    input  logic                                                 en_i,
    input  logic                                                 link_up_i,
    input  logic                                                 pipe_rx_usr_clk_i,
    input  logic              [( MAX_NUM_LANES* DATA_WIDTH)-1:0] pipe_data_i,
    input  logic              [               MAX_NUM_LANES-1:0] pipe_data_valid_i,
    input  logic              [           (4*MAX_NUM_LANES)-1:0] pipe_data_k_i,
    input  logic              [           (2*MAX_NUM_LANES)-1:0] pipe_sync_header_i,
    input  logic              [             (MAX_NUM_LANES)-1:0] pipe_block_start_i,
    input  logic              [                             5:0] pipe_width_i,
    input  logic              [                             5:0] num_active_lanes_i,
    //training set configuration signals
    output pcie_ordered_set_t [               MAX_NUM_LANES-1:0] ordered_set_o,
    output logic              [               MAX_NUM_LANES-1:0] ts1_valid_o,
    output logic              [               MAX_NUM_LANES-1:0] ts2_valid_o,
    output logic              [               MAX_NUM_LANES-1:0] idle_valid_o,
    // output logic        [         (MAX_NUM_LANES * 8)-1:0] link_num_o,
    // output logic        [         (MAX_NUM_LANES * 8)-1:0] lane_num_o,
    // output logic        [         (MAX_NUM_LANES * 8)-1:0] symbol6_o,
    // output logic        [         (MAX_NUM_LANES * 8)-1:0] training_ctrl_o,
    // output logic        [         (MAX_NUM_LANES * 8)-1:0] rate_id_o,
    input  rate_speed_e                                          curr_data_rate_i,
    //pcie dllp outputs
    output logic              [                  DATA_WIDTH-1:0] m_dllp_axis_tdata,
    output logic              [                  KEEP_WIDTH-1:0] m_dllp_axis_tkeep,
    output logic                                                 m_dllp_axis_tvalid,
    output logic                                                 m_dllp_axis_tlast,
    output logic              [                  USER_WIDTH-1:0] m_dllp_axis_tuser,
    input  logic                                                 m_dllp_axis_tready
);



  //link values
  //   logic              [         (MAX_NUM_LANES * 8)-1:0] link_num;
  //   logic              [         (MAX_NUM_LANES * 8)-1:0] lane_num;
  //   ts_symbol6_union_t [               MAX_NUM_LANES-1:0] symbol6;
  //   training_ctrl_t    [               MAX_NUM_LANES-1:0] training_ctrl;
  //   rate_id_t          [               MAX_NUM_LANES-1:0] rate_id;
  //   logic              [               MAX_NUM_LANES-1:0] ts1_valid;
  //   logic              [               MAX_NUM_LANES-1:0] ts2_valid;
  //   logic              [               MAX_NUM_LANES-1:0] idle_valid;
  //   logic                                                 link_up;

  logic [( MAX_NUM_LANES* DATA_WIDTH)-1:0] descrambler_data;
  logic [               MAX_NUM_LANES-1:0] descrambler_data_valid;
  logic [           (4*MAX_NUM_LANES)-1:0] descrambler_data_k;
  logic [           (2*MAX_NUM_LANES)-1:0] descrambler_sync_header;

  logic [( MAX_NUM_LANES* DATA_WIDTH)-1:0] block_alignment_data;
  logic [               MAX_NUM_LANES-1:0] block_alignment_data_valid;
  logic [           (4*MAX_NUM_LANES)-1:0] block_alignment_data_k;
  logic [           (2*MAX_NUM_LANES)-1:0] block_alignment_sync_header;

  logic [( MAX_NUM_LANES* DATA_WIDTH)-1:0] packer_data;
  logic [               MAX_NUM_LANES-1:0] packer_data_valid;
  logic [           (4*MAX_NUM_LANES)-1:0] packer_data_k;
  logic [           (2*MAX_NUM_LANES)-1:0] packer_sync_header;

  logic [( MAX_NUM_LANES* DATA_WIDTH)-1:0] fifo_data;
  logic [               MAX_NUM_LANES-1:0] fifo_data_valid;
  logic [           (4*MAX_NUM_LANES)-1:0] fifo_data_k;
  logic [           (2*MAX_NUM_LANES)-1:0] fifo_sync_header;


  logic                                    fifo_empty;
  logic                                    fifo_full;
  logic                                    wr_en;
  logic                                    rd_en;


//   logic [( MAX_NUM_LANES* DATA_WIDTH)-1:0] fifo_pipe_data;
//   logic [               MAX_NUM_LANES-1:0] fifo_pipe_data_valid;
//   logic [           (4*MAX_NUM_LANES)-1:0] fifo_pipe_data_k;
//   logic [           (2*MAX_NUM_LANES)-1:0] fifo_pipe_sync_header;
//   logic [             (MAX_NUM_LANES)-1:0] fifo_pipe_block_start;

  localparam int PcieDataSize = $size(
      descrambler_data
  ) + $size(
      descrambler_data_valid
  ) + $size(
      descrambler_data_k
  ) + $size(
      descrambler_sync_header
  );

  localparam int PcieLaneDataSize = 1 + DATA_WIDTH + 4 + 2 + 1;


  //   logic              [                  DATA_WIDTH-1:0] m_dllp_axis_tdata;
  //   logic              [                  KEEP_WIDTH-1:0] m_dllp_axis_tkeep;
  //   logic                                                 m_dllp_axis_tvalid;
  //   logic                                                 m_dllp_axis_tlast;
  //   logic              [                  USER_WIDTH-1:0] m_dllp_axis_tuser;
  //   logic                                                 m_dllp_axis_tready;

  //   logic              [                  DATA_WIDTH-1:0] tlp_axis_tdata;
  //   logic              [                  KEEP_WIDTH-1:0] tlp_axis_tkeep;
  //   logic                                                 tlp_axis_tvalid;
  //   logic                                                 tlp_axis_tlast;
  //   logic              [                  USER_WIDTH-1:0] tlp_axis_tuser;
  //   logic                                                 tlp_axis_tready;

  for (genvar lane = 0; lane < MAX_NUM_LANES; lane++) begin : gen_lane_descramble

    logic read_ready;
    logic read_ready_reg;


    always_ff @(posedge clk_i) begin
      if (rst_i) begin
        read_ready_reg <= '0;
      end else begin
        read_ready_reg <= read_ready == '0;
      end
    end


    scrambler descrambler_inst (
        .clk_i           (pipe_rx_usr_clk_i),
        .rst_i           (rst_i),
        .lane_number     (lane),
        .curr_data_rate_i(curr_data_rate_i),
        .pipe_width_i    (pipe_width_i),
        .data_valid_i    (pipe_data_valid_i[lane]),
        .data_in_i       (pipe_data_i[DATA_WIDTH*lane+:DATA_WIDTH]),
        .data_k_in_i     (pipe_data_k_i[4*lane+:4]),
        .sync_header_i   (pipe_sync_header_i[2*lane+:2]),
        .block_start_i   (pipe_block_start_i[lane]),
        .data_valid_o    (descrambler_data_valid[lane]),
        .data_out_o      (descrambler_data[DATA_WIDTH*lane+:DATA_WIDTH]),
        .data_k_out_o    (descrambler_data_k[4*lane+:4]),
        .sync_header_o   (descrambler_sync_header[2*lane+:2]),
        .block_start_o   ()
    );


    ordered_set_handler #(
        .CLK_RATE  (CLK_RATE),
        .DATA_WIDTH(DATA_WIDTH),
        .KEEP_WIDTH(KEEP_WIDTH),
        .USER_WIDTH(USER_WIDTH)
    ) ordered_set_handler_inst (
        .clk_i           (pipe_rx_usr_clk_i),
        .rst_i           (rst_i),
        .curr_data_rate_i(curr_data_rate_i),
        .pipe_width_i    (pipe_width_i),
        .data_valid_i    (descrambler_data_valid[lane]),
        .data_in_i       (descrambler_data[DATA_WIDTH*lane+:DATA_WIDTH]),
        .data_k_in_i     (descrambler_data_k[4*lane+:4]),
        .sync_header_i   (descrambler_sync_header[2*lane+:2]),
        .ordered_set_o   (ordered_set_o[lane]),
        .idle_valid_o    (idle_valid_o[lane]),
        .ts1_valid_o     (ts1_valid_o[lane]),
        .ts2_valid_o     (ts2_valid_o[lane]),
        .eieos_valid_o   ()
    );
  end

  block_alignment #(
      .DATA_WIDTH(DATA_WIDTH),
      .MAX_NUM_LANES(MAX_NUM_LANES)
  ) block_alignment_inst (
      .clk_i             (pipe_rx_usr_clk_i),
      .rst_i             (rst_i),
      .phy_link_up_i     (link_up_i),
      .lane_reverse_i    ('0),
      .curr_data_rate_i  (curr_data_rate_i),
      .data_valid_i      (descrambler_data_valid),
      .data_i            (descrambler_data),
      .data_k_i          (descrambler_data_k),
      .sync_header_i     (descrambler_sync_header),
      .data_o            (block_alignment_data),
      .data_valid_o      (block_alignment_data_valid),
      .data_k_o          (block_alignment_data_k),
      .sync_header_o     (block_alignment_sync_header),
      .pipe_width_i      (pipe_width_i),
      .num_active_lanes_i(num_active_lanes_i)
  );

  pack_data #(
      .DATA_WIDTH(DATA_WIDTH),
      .MAX_NUM_LANES(MAX_NUM_LANES)
  ) pack_data_inst (
      .clk_i             (pipe_rx_usr_clk_i),
      .rst_i             (rst_i),
      .phy_link_up_i     (link_up_i),
      .lane_reverse_i    ('0),
      .curr_data_rate_i  (curr_data_rate_i),
      .data_i            (block_alignment_data),
      .data_valid_i      (block_alignment_data_valid),
      .data_k_i          (block_alignment_data_k),
      .sync_header_i     (block_alignment_sync_header),
      .data_o            (packer_data),
      .data_valid_o      (packer_data_valid),
      .data_k_o          (packer_data_k),
      .sync_header_o     (packer_sync_header),
      .pipe_width_i      (pipe_width_i),
      .fifo_wr_o         (wr_en),
      .num_active_lanes_i(num_active_lanes_i)
  );


    // async_fifo #(
    //     .DSIZE(PcieDataSize),
    //     .ASIZE(10)
    // ) async_fifo_inst (
    //     .wclk(pipe_rx_usr_clk_i),
    //     .wrst_n(!rst_i || link_up_i),
    //     .winc(wr_en),
    //     .wdata({packer_data, packer_data_k, packer_data_valid, packer_sync_header}),
    //     .wfull(fifo_full),
    //     .awfull(),
    //     .rclk(clk_i),
    //     .rrst_n(!rst_i),
    //     .rinc(read_ready_reg),
    //     .rdata({fifo_data, fifo_data_k, fifo_data_valid, fifo_sync_header}),
    //     .rempty(fifo_empty),
    //     .arempty()
    // );


  //packed data storage fifo
//   synchronous_fifo #(
//       .DEPTH(20),
//       .DATA_WIDTH(PcieDataSize)
//   ) synchronous_fifo_inst (
//       .clk_i   (clk_i),
//       .rst_i   (rst_i || !link_up_i),
//       .w_en_i  (wr_en),
//       .r_en_i  (rd_en),
//       .data_in ({packer_data, packer_data_k, packer_data_valid, packer_sync_header}),
//       .data_out({fifo_data, fifo_data_k, fifo_data_valid, fifo_sync_header}),
//       .full_o  (fifo_full),
//       .empty_o (fifo_empty)
//   );

  data_handler #(
      .DATA_WIDTH(DATA_WIDTH),
      .STRB_WIDTH(STRB_WIDTH),
      .KEEP_WIDTH(KEEP_WIDTH),
      .USER_WIDTH(USER_WIDTH),
      .MAX_NUM_LANES(MAX_NUM_LANES)
  ) data_handler_inst (
      .clk_i             (clk_i),
      .rst_i             (rst_i),
      .phy_link_up_i     (link_up_i),
      .phy_fifo_empty_i  ('0),
      .phy_fifo_rd_en_o  (),
      .lane_reverse_i    ('0),
      .curr_data_rate_i  (curr_data_rate_i),
      .data_i            (packer_data),
      .data_valid_i      (packer_data_valid),
      .data_k_i          (packer_data_k),
      .sync_header_i     (packer_sync_header),
      .m_dllp_axis_tdata (m_dllp_axis_tdata),
      .m_dllp_axis_tkeep (m_dllp_axis_tkeep),
      .m_dllp_axis_tvalid(m_dllp_axis_tvalid),
      .m_dllp_axis_tlast (m_dllp_axis_tlast),
      .m_dllp_axis_tuser (m_dllp_axis_tuser),
      .m_dllp_axis_tready(m_dllp_axis_tready),
      .pipe_width_i      (pipe_width_i),
      .num_active_lanes_i(num_active_lanes_i)
  );

endmodule
