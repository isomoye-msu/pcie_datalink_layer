module lane_management
  import pcie_phy_pkg::*;
#(
    // TLP data width
    parameter int DATA_WIDTH    = 32,
    // TLP strobe width
    parameter int STRB_WIDTH    = DATA_WIDTH / 8,
    parameter int KEEP_WIDTH    = STRB_WIDTH,
    parameter int USER_WIDTH    = 4,
    parameter int MAX_NUM_LANES = 16
) (
    //clocks and resets
    input  logic                  clk_i,               // Clock signal
    input  logic                  rst_i,               // Reset signal
    input  logic                  phy_link_up_i,
    //Dllp AXIS inputs
    input  logic [DATA_WIDTH-1:0] s_dllp_axis_tdata,
    input  logic [KEEP_WIDTH-1:0] s_dllp_axis_tkeep,
    input  logic                  s_dllp_axis_tvalid,
    input  logic                  s_dllp_axis_tlast,
    input  logic [USER_WIDTH-1:0] s_dllp_axis_tuser,
    output logic                  s_dllp_axis_tready,

    //physical layer ordered sets AXIS inputs
    input  logic [(DATA_WIDTH*MAX_NUM_LANES)-1:0] s_phy_axis_tdata,
    input  logic [(KEEP_WIDTH*MAX_NUM_LANES)-1:0] s_phy_axis_tkeep,
    input  logic                                  s_phy_axis_tvalid,
    input  logic                                  s_phy_axis_tlast,
    input  logic [(USER_WIDTH*MAX_NUM_LANES)-1:0] s_phy_axis_tuser,
    output logic                                  s_phy_axis_tready,

    input  logic                                           lane_reverse_i,
    input  rate_speed_e                                    curr_data_rate_i,
    output logic        [( MAX_NUM_LANES* DATA_WIDTH)-1:0] data_out_o,
    output logic        [               MAX_NUM_LANES-1:0] data_valid_o,
    output logic        [           (4*MAX_NUM_LANES)-1:0] d_k_out_o,
    output logic        [           (2*MAX_NUM_LANES)-1:0] sync_header_o,
    output logic        [                             5:0] pipe_width_o,
    output logic        [               MAX_NUM_LANES-1:0] start_block_o,
    input  logic        [                             5:0] num_active_lanes_i
);



  localparam int PipeWidthGen1 = 16;
  localparam int PipeWidthGen2 = 16;
  localparam int PipeWidthGen3 = 32;
  localparam int PipeWidthGen4 = 32;
  localparam int PipeWidthGen5 = 32;
  localparam int BytesPerTransfer = DATA_WIDTH / 8;
  localparam int MaxWordsPerTransaction = 512 / DATA_WIDTH;



  //retry mechanism enum
  typedef enum logic [4:0] {
    ST_IDLE,
    ST_LANE_MNGT_PHY,
    ST_LANE_MNGT_DATA,
    ST_LANE_MNGT_TX_PHY,
    ST_LANE_MNGT_TX_DATA,
    ST_LANE_MNGT_TX_GEN1,
    ST_LANE_MNGT_TX_GEN2,
    ST_LANE_MNGT_TX_GEN3,
    ST_LANE_MNGT_TX_GEN4,
    ST_LANE_MNGT_TX_GEN5
  } lane_mngt_state_e;


  lane_mngt_state_e                                    curr_state;
  lane_mngt_state_e                                    next_state;
  //   logic [5:0] pipe_width_o;
  logic             [                             4:0] sync_width_c;
  logic             [                             4:0] sync_width_r;


  logic             [                             4:0] sync_count_c;
  logic             [                             4:0] sync_count_r;
  logic             [                             4:0] sync_width;
  logic             [                             4:0] sync_count;
  logic             [                             4:0] axis_sync_c;
  logic             [                             4:0] axis_sync_r;
  logic             [                             5:0] pipe_width_c;
  logic             [                             5:0] pipe_width_r;
  logic             [                             5:0] pkt_count_c;
  logic             [                             5:0] pkt_count_r;

  logic             [                             5:0] lanes_count_c;
  logic             [                             5:0] lanes_count_r;
  logic             [                             5:0] byte_count_c;
  logic             [                             5:0] byte_count_r;
  logic             [                             5:0] bytes_sent_c;
  logic             [                             5:0] bytes_sent_r;

  logic             [                             5:0] word_count_c;
  logic             [                             5:0] word_count_r;

  logic             [                             5:0] fifo_word_count_c;
  logic             [                             5:0] fifo_word_count_r;
  logic             [( MAX_NUM_LANES* DATA_WIDTH)-1:0] data_out_c;
  logic             [( MAX_NUM_LANES* DATA_WIDTH)-1:0] data_out_r;
  logic             [               MAX_NUM_LANES-1:0] data_valid_c;
  logic             [               MAX_NUM_LANES-1:0] data_valid_r;
  logic             [           (4*MAX_NUM_LANES)-1:0] d_k_out_c;
  logic             [           (4*MAX_NUM_LANES)-1:0] d_k_out_r;

  logic                                                is_ordered_set;
  logic                                                is_data;
  logic                                                ready_out;

  logic             [                             1:0] sync_header_c            [MAX_NUM_LANES];
  logic             [                             1:0] sync_header_r            [MAX_NUM_LANES];

  logic             [               MAX_NUM_LANES-1:0] block_start_c;
  logic             [               MAX_NUM_LANES-1:0] block_start_r;

  logic             [                           511:0] data_in_c;
  logic             [                           511:0] data_in_r;
  logic             [                    (512/8) -1:0] data_k_in_c;
  logic             [                    (512/8) -1:0] data_k_in_r;
  logic             [                             7:0] byte_start_index_c;
  logic             [                             7:0] byte_start_index_r;
  logic             [                             7:0] lane_start_index_c;
  logic             [                             7:0] lane_start_index_r;
  logic             [                             7:0] input_byte_start_index_c;
  logic             [                             7:0] input_byte_start_index_r;
  logic                                                is_phy_c;
  logic                                                is_phy_r;
  logic                                                is_dllp_c;
  logic                                                is_dllp_r;
  logic                                                replace_lane_c;
  logic                                                replace_lane_r;
  logic                                                complete_c;
  logic                                                complete_r;
  logic             [                            31:0] lane_data;
  logic             [                            31:0] data_out;
  logic             [                            31:0] bytes_per_packet;
  logic             [                             3:0] data_k_out;
  logic             [                             7:0] lane_idx;
  logic             [                             7:0] lane_shift_idx;
  logic             [                             7:0] pipewidth_shift_idx;
  logic             [                         (4)-1:0] temp_d_k;
  logic             [                             7:0] current_byte;

  logic                                                fifo_full;
  logic                                                fifo_empty;


  logic             [           (4*MAX_NUM_LANES)-1:0] d_k_out_temp;
  logic             [           (2*MAX_NUM_LANES)-1:0] sync_header_temp;


  logic                                                read_en_r;
  logic                                                read_en_c;
  logic             [( MAX_NUM_LANES* DATA_WIDTH)-1:0] temp_data_out;



  logic             [  (DATA_WIDTH*MAX_NUM_LANES)-1:0] fifo_phy_axis_tdata;
  logic             [  (KEEP_WIDTH*MAX_NUM_LANES)-1:0] fifo_phy_axis_tkeep;
  logic                                                fifo_phy_axis_tvalid;
  logic                                                fifo_phy_axis_tlast;
  logic             [  (USER_WIDTH*MAX_NUM_LANES)-1:0] fifo_phy_axis_tuser;
  logic                                                fifo_phy_axis_tready;

  localparam int PcieDataSize = $size(
      data_valid_r
  ) + $size(
      data_out_r
  ) + $size(
      block_start_r
  ) + $size(
      d_k_out_r
  ) + $size(
      sync_header_r
  );


  assign is_ordered_set = fifo_phy_axis_tvalid & fifo_phy_axis_tready;
  assign is_data        = s_dllp_axis_tvalid & s_dllp_axis_tready;


  always_ff @(posedge clk_i) begin : main_seq_block
    if (rst_i || (pipe_width_c != pipe_width_r)) begin
      pipe_width_r      <= PipeWidthGen1;
      sync_count_r      <= '0;
      sync_width_r      <= '0;
      // sync_header_r <= '0;
      d_k_out_r         <= '{default: 'd0};
      axis_sync_r       <= '0;
      data_valid_r      <= '0;
      block_start_r     <= '0;
      read_en_r         <= '0;
      fifo_word_count_r <= '0;
      curr_state        <= ST_IDLE;
    end else begin
      block_start_r     <= block_start_c;
      sync_count_r      <= sync_count_c;
      sync_width_r      <= sync_width_c;
      d_k_out_r         <= d_k_out_c;
      axis_sync_r       <= axis_sync_c;
      data_valid_r      <= data_valid_c;
      fifo_word_count_r <= fifo_word_count_c;
      read_en_r         <= read_en_c;
      pipe_width_r      <= pipe_width_c;
      curr_state        <= next_state;
    end
    // d_k_out_r                <= d_k_out_c;
    data_in_r                <= data_in_c;
    is_phy_r                 <= is_phy_c;
    is_dllp_r                <= is_dllp_c;
    pkt_count_r              <= pkt_count_c;
    word_count_r             <= word_count_c;
    lane_start_index_r       <= lane_start_index_c;
    byte_start_index_r       <= byte_start_index_c;
    replace_lane_r           <= replace_lane_c;
    complete_r               <= complete_c;
    sync_header_r            <= sync_header_c;
    data_out_r               <= data_out_c;
    data_k_in_r              <= data_k_in_c;
    byte_count_r             <= byte_count_c;
    lanes_count_r            <= lanes_count_c;
    bytes_sent_r             <= bytes_sent_c;
    input_byte_start_index_r <= input_byte_start_index_c;
    // for (int i = 0; i < MAX_NUM_LANES; i++) begin
    //   sync_header_r[i] <= sync_header_c[i];
    //   data_out_r[i]    <= data_out_c[i];
    // end
  end


  always_comb begin : data_rate_block
    pipe_width_c = pipe_width_r;
    sync_width_c = sync_width_r;
    case (curr_data_rate_i)
      gen1: begin
        pipe_width_c = PipeWidthGen1;
      end
      gen2: begin
        pipe_width_c = PipeWidthGen2;
      end
      gen3: begin
        pipe_width_c = PipeWidthGen3;
        sync_width_c = 5'd8;
      end
      gen4: begin
        pipe_width_c = PipeWidthGen4;
        sync_width_c = 5'd8;
      end
      gen5: begin
        pipe_width_c = PipeWidthGen5;
        sync_width_c = 5'd4;
      end
      default: begin
        pipe_width_c = PipeWidthGen1;
        sync_width_c = 5'd16;
      end
    endcase
  end

  always_comb begin : sync_header_combo_block
    sync_count_c  = sync_count_r;
    sync_header_c = sync_header_r;
    block_start_c = block_start_r;
    if (curr_data_rate_i >= gen3) begin
      block_start_c = data_valid_c;
      //increment count only if valid transaction
      if (is_phy_r || is_dllp_r) begin
        sync_count_c = sync_count_r >= sync_width_r ? '0 : sync_count_r + 1'b1;
      end
    end else begin
      sync_count_c = '0;
    end
    //per lane sync header output
    for (int i = 0; i < MAX_NUM_LANES; i++) begin
      if (sync_count_r == '0 && (curr_data_rate_i >= gen3)) begin
        sync_header_c[i] = is_phy_r ? 2'b10 : 2'b01;
      end
    end
  end

  //assign bytes per packet based on number of lanes
  //will only work with number of lanes that are powers of two
  always_comb begin : calc_bytes_per_packet
    bytes_per_packet = '0;
    for (int i = 0; i < 8; i++) begin
      if (num_active_lanes_i == (1 << i)) begin
        bytes_per_packet = (pipe_width_r) << i;
      end
    end
  end

  always_comb begin : lane_data_sync
    d_k_out_c                = d_k_out_r;
    data_k_in_c              = data_k_in_r;
    data_out_c               = data_out_r;
    data_valid_c             = '0;
    data_in_c                = data_in_r;
    is_dllp_c                = is_dllp_r;
    is_phy_c                 = is_phy_r;
    lane_start_index_c       = lane_start_index_r;
    pkt_count_c              = pkt_count_r;
    word_count_c             = word_count_r;
    next_state               = curr_state;
    byte_start_index_c       = byte_start_index_r;
    replace_lane_c           = replace_lane_r;
    input_byte_start_index_c = input_byte_start_index_r;
    ready_out                = '0;
    complete_c               = '0;
    data_out                 = '0;
    lane_idx                 = '0;
    data_k_out               = '0;
    temp_d_k                 = '0;
    lane_data                = '0;
    pipewidth_shift_idx      = (pipe_width_r >> 3) - 1;
    lane_shift_idx           = (num_active_lanes_i >> 1);
    current_byte             = pipewidth_shift_idx - byte_start_index_r;
    byte_count_c             = byte_count_r;
    lanes_count_c            = lanes_count_r;
    bytes_sent_c             = bytes_sent_r;
    case (curr_state)
      ST_IDLE: begin
        if (s_phy_axis_tvalid) begin
          pkt_count_c        = '0;
          word_count_c       = '0;
          lane_start_index_c = '0;
          byte_start_index_c = '0;
          is_dllp_c          = '0;
          is_phy_c           = '1;
          next_state         = ST_LANE_MNGT_TX_PHY;
          byte_count_c       = '0;
          lanes_count_c      = '0;
          replace_lane_c     = '0;
          bytes_sent_c       = '0;
          data_out_c         = '0;
          for (int i = 0; i < MAX_NUM_LANES; i++) begin
            data_in_c[8*i+:8]  = curr_data_rate_i >= gen3 ? 8'hf7 : '0;
            data_out_c[8*i+:8] = curr_data_rate_i >= gen3 ? 8'hf7 : '0;
          end
        end else if (s_dllp_axis_tvalid) begin
          pkt_count_c              = '0;
          word_count_c             = '0;
          lane_start_index_c       = '0;
          byte_start_index_c       = '0;
          next_state               = ST_LANE_MNGT_TX_DATA;
          is_dllp_c                = '1;
          is_phy_c                 = '0;
          replace_lane_c           = '0;
          byte_count_c             = '0;
          data_out_c               = '0;
          lanes_count_c            = '0;
          bytes_sent_c             = '0;
          input_byte_start_index_c = '0;
          for (int i = 0; i < MAX_NUM_LANES * BytesPerTransfer; i++) begin
            data_in_c[8*i+:8]  = curr_data_rate_i >= gen3 ? 8'hf7 : '0;
            data_out_c[8*i+:8] = curr_data_rate_i >= gen3 ? 8'hf7 : '0;
          end
        end
      end
      ST_LANE_MNGT_TX_DATA: begin
        if (s_dllp_axis_tvalid) begin
          // TODO: change to lane reversal flag ... lane_idx = (pipe_width_r >> 3) - 1 - byte_count_r;
          // ready_out = '1;
          byte_count_c = byte_count_r + ((pipe_width_r >> 3));
          for (logic [7:0] lane = 0; lane < MAX_NUM_LANES; lane = lane + 1) begin
            if (lane < num_active_lanes_i) begin
              data_valid_c[lane]      = '1;
              d_k_out_c[lane*4+:4]    = '0;
              data_out_c[lane*32+:32] = '0;
              for (int byte_ = 0; byte_ < DATA_WIDTH / 8; byte_++) begin
                if (byte_ < (pipe_width_r >> 3)) begin
                  data_out_c[(lane*32)+(byte_*8)+:8]   =
                  s_dllp_axis_tdata[(lane*32)+((byte_+byte_count_r)*8)+:8];
                  d_k_out_c[(lane*4)+(byte_*1)+:1] = s_dllp_axis_tuser[(lane*4)+((byte_+byte_count_r)*1)+:1];
                end
              end
            end
          end
          if ((byte_count_r + ((pipe_width_r >> 3))) >= (DATA_WIDTH / 8) - 1) begin
            byte_count_c = '0;
            ready_out = '1;
            if (s_dllp_axis_tlast) begin
              if (s_dllp_axis_tvalid) begin

              end else begin
                next_state = ST_IDLE;
              end
              complete_c   = '1;
              pkt_count_c  = '0;
              word_count_c = '0;
            end
          end
        end
      end
      ST_LANE_MNGT_TX_PHY: begin
        if (fifo_phy_axis_tvalid) begin
          // TODO: change to lane reversal flag ... lane_idx = (pipe_width_r >> 3) - 1 - byte_count_r;
          // ready_out = '1;
          byte_count_c = byte_count_r + (pipe_width_r >> 3);
          for (logic [7:0] lane = 0; lane < MAX_NUM_LANES; lane = lane + 1) begin
            if (lane < num_active_lanes_i) begin
              data_valid_c[lane]      = '1;
              d_k_out_c[lane*4+:4]    = '0;
              data_out_c[lane*32+:32] = '0;
              for (int byte_ = 0; byte_ < DATA_WIDTH / 8; byte_++) begin
                if (byte_ < (pipe_width_r >> 3)) begin
                  data_out_c[(lane*32)+(byte_*8)+:8]   =
                  fifo_phy_axis_tdata[(lane*32)+((byte_+byte_count_r)*8)+:8];
                  d_k_out_c[byte_] = fifo_phy_axis_tuser[byte_ + byte_count_r];
                end
              end
            end
          end
          if ((byte_count_r + (pipe_width_r >> 3)) >= (DATA_WIDTH / 8) - 1) begin
            byte_count_c = '0;
            ready_out = '1;
            if (fifo_phy_axis_tlast) begin
              if (s_phy_axis_tvalid) begin

              end else begin
                next_state = ST_IDLE;
              end
              complete_c   = '1;
              pkt_count_c  = '0;
              word_count_c = '0;
            end
          end

          // lane_idx = byte_count_r;
          // bytes_sent_c = bytes_sent_r + 1'b1;
          // byte_count_c = byte_count_r + 1'b1;
          // if (byte_count_r >= DATA_WIDTH/8 - 1) begin
          //   word_count_c = word_count_r + 1'b1;
          //   byte_count_c = '0;
          //   for (logic [7:0] lane = 0; lane < MAX_NUM_LANES; lane = lane + 1) begin
          //     if (lane < num_active_lanes_i) begin
          //       data_valid_c[lane] = '1;
          //     end
          //   end
          //   if (bytes_sent_r >= (DATA_WIDTH / 8) - 1) begin
          //     ready_out = '1;
          //     bytes_sent_c = '0;
          //     if (s_phy_axis_tlast) begin
          //       next_state   = ST_IDLE;
          //       complete_c   = '1;
          //       pkt_count_c  = '0;
          //       word_count_c = '0;
          //     end
          //   end
          // end
          // for (int i = 0; i < MAX_NUM_LANES; i++) begin
          //   data_out  = data_out_r[i*32+:32];
          //   temp_d_k  = d_k_out_r[i*4+:4] | 4'b0;
          //   lane_data = s_phy_axis_tdata[i*32+:32];
          //   if (i < num_active_lanes_i) begin
          //     temp_d_k[lane_idx]      = s_phy_axis_tuser[bytes_sent_r];
          //     data_out[8*lane_idx+:8] = lane_data[bytes_sent_r*8+:8];
          //   end
          //   d_k_out_c[i*4+:4]    = temp_d_k;
          //   data_out_c[i*32+:32] = data_out;
          // end
        end
      end
      default: begin
      end
    endcase
  end

  always_comb begin : set_sync_fifo_ready
    read_en_c         = read_en_r;
    fifo_word_count_c = fifo_word_count_r;
    if (complete_c) begin
      fifo_word_count_c = word_count_r;
      read_en_c = '1;
    end else if (read_en_r) begin
      fifo_word_count_c = fifo_word_count_r - 1'b1;
      if (fifo_word_count_r <= 32'b0) begin
        read_en_c = '0;
      end
    end
  end

  always_comb begin : flatten_decrambler
    for (int i = 0; i < MAX_NUM_LANES; i++) begin
      // data_out_o[32*i+:32]  = data_out_r[32*i+:32];
      // data_valid_o[i]       = data_valid_r[i];
      // d_k_out_temp[4*i+:4]     = d_k_out_r[i*4+:4];
      sync_header_temp[2*i+:2] = sync_header_r[i];
    end
  end



  //axi-stream output register instance
  axis_register #(
      .DATA_WIDTH(DATA_WIDTH * MAX_NUM_LANES),
      .KEEP_ENABLE('1),
      .KEEP_WIDTH(KEEP_WIDTH * MAX_NUM_LANES),
      .LAST_ENABLE('1),
      .ID_ENABLE('0),
      .ID_WIDTH(1),
      .DEST_ENABLE('0),
      .DEST_WIDTH(1),
      .USER_ENABLE('1),
      .USER_WIDTH(USER_WIDTH * MAX_NUM_LANES),
      .REG_TYPE(SkidBuffer)
  ) axis_register_inst (
      .clk          (clk_i),
      .rst          (rst_i),
      .s_axis_tdata (s_phy_axis_tdata),
      .s_axis_tkeep (s_phy_axis_tkeep),
      .s_axis_tvalid(s_phy_axis_tvalid),
      .s_axis_tready(s_phy_axis_tready),
      .s_axis_tlast (s_phy_axis_tlast),
      .s_axis_tuser (s_phy_axis_tuser),
      .s_axis_tid   ('0),
      .s_axis_tdest ('0),
      .m_axis_tdata (fifo_phy_axis_tdata),
      .m_axis_tkeep (fifo_phy_axis_tkeep),
      .m_axis_tvalid(fifo_phy_axis_tvalid),
      .m_axis_tready(fifo_phy_axis_tready),
      .m_axis_tlast (fifo_phy_axis_tlast),
      .m_axis_tuser (fifo_phy_axis_tuser),
      .m_axis_tid   (),
      .m_axis_tdest ()
  );


  // synchronous_lifo #(
  //     .DEPTH(100),
  //     .DATA_W(PcieDataSize),
  //     .FWFT_MODE("FALSE")
  // ) synchronous_lifo_inst (
  //     .clk (clk_i),
  //     .nrst(!rst_i),

  //     .w_req (data_valid_r),
  //     .w_data({d_k_out_r, data_valid_r, data_out_r}),

  //     .r_req (complete_r),
  //     .r_data({d_k_out_o, data_valid_o, temp_data_out}),

  //     .cnt  (),
  //     .empty(fifo_empty),
  //     .full ()
  // );

  //packed data storage fifo
  // synchronous_fifo #(
  //     .DEPTH(100),
  //     .DATA_WIDTH(PcieDataSize)
  // ) synchronous_fifo_inst (
  //     .clk_i   (clk_i),
  //     .rst_i   (rst_i),
  //     .w_en_i  (data_valid_r),
  //     .r_en_i  (read_en_r),
  //     .data_in ({sync_header_temp, block_start_r, d_k_out_temp,data_valid_r,data_out_r}),
  //     .data_out({sync_header_o   ,start_block_o , d_k_out_o,data_valid_o,data_out_o}),
  //     .full_o  (fifo_full),
  //     .empty_o (fifo_empty)
  // );

  // assign sync_header_o      = sync_header_r;
  assign s_dllp_axis_tready   = ready_out & is_dllp_r;
  assign fifo_phy_axis_tready = ready_out & is_phy_r;

  assign data_valid_o         = '1;
  assign data_out_o           = data_valid_r ? data_out_r : '0;
  // // assign data_valid_o       = data_valid_r;
  assign d_k_out_o            = d_k_out_r;
  // assign data_out_o           = temp_data_out;
  assign pipe_width_o         = pipe_width_r;
  // assign start_block_o      = block_start_r;

endmodule
