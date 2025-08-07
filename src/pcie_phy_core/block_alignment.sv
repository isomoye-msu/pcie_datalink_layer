module block_alignment
  import pcie_phy_pkg::*;
#(
    // TLP data width
    parameter int DATA_WIDTH    = 32,
    // TLP strobe width
    // parameter int STRB_WIDTH    = DATA_WIDTH / 8,
    // parameter int KEEP_WIDTH    = STRB_WI1DTH,
    // parameter int USER_WIDTH    = 1,
    parameter int MAX_NUM_LANES = 4
) (
    //clocks and resets
    input  logic                                           clk_i,              // Clock signal
    input  logic                                           rst_i,              // Reset signal
    input  logic                                           phy_link_up_i,
    input  logic                                           lane_reverse_i,
    input  rate_speed_e                                    curr_data_rate_i,
    input  logic        [( MAX_NUM_LANES* DATA_WIDTH)-1:0] data_i,
    input  logic        [               MAX_NUM_LANES-1:0] data_valid_i,
    input  logic        [           (4*MAX_NUM_LANES)-1:0] data_k_i,
    input  logic        [           (2*MAX_NUM_LANES)-1:0] sync_header_i,
    output logic        [( MAX_NUM_LANES* DATA_WIDTH)-1:0] data_o,
    output logic        [               MAX_NUM_LANES-1:0] data_valid_o,
    output logic        [           (4*MAX_NUM_LANES)-1:0] data_k_o,
    output logic        [           (2*MAX_NUM_LANES)-1:0] sync_header_o,
    input  logic        [                             5:0] pipe_width_i,
    input  logic        [                             5:0] num_active_lanes_i
);



  localparam int PipeWidthGen1 = 8;
  localparam int PipeWidthGen2 = 16;
  localparam int PipeWidthGen3 = 16;
  localparam int PipeWidthGen4 = 32;
  localparam int PipeWidthGen5 = 32;
  localparam int BytesPerTransfer = DATA_WIDTH / 8;
  localparam int MaxWordsPerTransaction = 512 / DATA_WIDTH;
  localparam int MaxBytesPerTransfer = MAX_NUM_LANES * BytesPerTransfer;

  // typedef enum logic [4:0] {
  //   ST_IDLE,
  //   ST_SEND_DATA,
  //   ST_LAST_DATA
  // } data_mux_st_e;


  // block_alignment_st_e                                    curr_state;
  // block_alignment_st_e                                    next_state;

  logic [( MAX_NUM_LANES* DATA_WIDTH)-1:0] data_c;
  logic [( MAX_NUM_LANES* DATA_WIDTH)-1:0] data_r;
  logic [               MAX_NUM_LANES-1:0] data_valid_c;
  logic [               MAX_NUM_LANES-1:0] data_valid_r;
  logic [           (4*MAX_NUM_LANES)-1:0] data_k_c;
  logic [           (4*MAX_NUM_LANES)-1:0] data_k_r;
  logic [           (2*MAX_NUM_LANES)-1:0] sync_header_c;
  logic [           (2*MAX_NUM_LANES)-1:0] sync_header_r;



  logic [                             5:0] word_count_c;
  logic [                             5:0] word_count_r;

  logic                                    is_ordered_set;
  logic                                    is_data;
  logic                                    ready_out;
  logic [                             7:0] lane_number;
  logic [                             7:0] byte_number;
  logic [                             7:0] pipewidth_shift_idx;
  logic [                             7:0] lanes_shift_idx;
  logic [                             7:0] lane_idx;
  logic [                            15:0] mask;
  logic [                             3:0] data_k;
  logic [                            31:0] data_out;
  logic [                             7:0] pipewidth_bytes;


  always_ff @(posedge clk_i) begin : main_seq_block
    if (rst_i) begin
      data_valid_r <= '0;
      // os_data_valid_r       <= '0;
      // tlp_dllp_data_valid_r <= '0;
    end else begin
      data_valid_r <= data_valid_c;
    end
    sync_header_r <= sync_header_c;
    data_k_r      <= data_k_c;
    data_r        <= data_c;
    // data_r                 <= data_c;
  end



  always_comb begin : block_alignment_combinational_logic
    data_c              = '0;
    data_valid_c        = '0;
    data_k_c            = '0;
    sync_header_c       = '0;
    lane_number         = '0;
    byte_number         = '0;
    data_out            = '0;
    data_k              = '0;
    pipewidth_bytes     = (pipe_width_i >> 3);
    pipewidth_shift_idx = (pipewidth_bytes) - 1;
    lanes_shift_idx     = 1 + (num_active_lanes_i >> 1);
    mask                = '0;
    if (phy_link_up_i) begin
      // if (pipe_width_i == 8'd8 && |data_valid_i) begin
      //   for (int lane = 0; lane < MAX_NUM_LANES; lane++) begin
      //     lane_number = lane_reverse_i ? (num_active_lanes_i - 1) - lane : lane;
      //     if (lane < num_active_lanes_i) begin
      //       // data_c[lane*8+:8]        = data_i[BytesPerTransfer*lane_number*8+:8];
      //       // data_valid_c[lane]       = data_valid_i[lane_number];
      //       // data_k_c[lane]           = data_k_i[lane_number*4];
      //       // sync_header_c[lane*2+:2] = sync_header_i[lane_number*2+:2];
      //     end
      //   end
      // end
      if (|data_valid_i) begin
        sync_header_c = sync_header_i;
        data_valid_c  = data_valid_i;
        // for (int lane = 0; lane < MAX_NUM_LANES; lane++) begin
        //   lane_number = lane_reverse_i ? (num_active_lanes_i - 1) - lane : lane;
        //   sync_header_c[2*lane+:2] = sync_header_i[2*lane_number+:2];
        //   if (lane < num_active_lanes_i) begin
        //     data_out = data_i[32*lane+:32];
        //     data_valid_c[lane] = data_valid_i[lane_number];
        //   end

        for (logic [15:0] byte_idx = 0; (byte_idx < MaxBytesPerTransfer); byte_idx++) begin
          if (byte_idx < num_active_lanes_i * pipewidth_bytes) begin
            mask = '0;
            for (int i = 0; i < 16; i++) begin
              if (i < pipewidth_shift_idx) begin
                mask[i] = '1;
              end
            end
            lane_number = byte_idx & mask;
            byte_number = (BytesPerTransfer - 1)
            - ((byte_idx >> pipewidth_shift_idx) & 8'b00000011);
            data_out = data_i[lane_number*32+:32];
            data_k = data_k_i[lane_number*4+:4];
            data_c[byte_idx*8+:8] = data_out[byte_idx*8+:8];
            data_k_c[byte_idx] = data_k[byte_idx];
          end
        end


        // for (int lane = 0; lane < MAX_NUM_LANES; lane++) begin
        //   lane_number = lane_reverse_i ? (num_active_lanes_i - 1) - lane : lane;
        //   sync_header_c[2*lane+:2] = sync_header_i[2*lane_number+:2];
        //   if (lane < num_active_lanes_i) begin
        //     data_out = data_i[32*lane+:32];
        //     data_valid_c[lane] = data_valid_i[lane_number];
        //     // sync_header_c[lane<<1+:2] = sync_header_i[lane_number<<1+:2];
        //     for (int byte_idx = 0; byte_idx < 4; byte_idx++) begin
        //       if (byte_idx < (pipewidth_bytes)) begin
        //         data_c[byte_idx] = data_i[]

        //         lane_idx = (pipewidth_shift_idx - byte_idx);
        //         data_c[(lane<<3)+((byte_idx<<3)<<lanes_shift_idx)+:8]
        //         = data_i[((lane<<2)<<3)+(lane_idx<<3)+:8];
        //         data_k_c[((lane))+(byte_idx<<lanes_shift_idx)+:1] =
        //         data_k_i[(lane<<2)+(lane_idx)+:1];

        //       end
        //     end
        //   end
        // end
      end
    end
  end


  assign sync_header_o = sync_header_r;
  assign data_valid_o  = data_valid_r;
  assign data_k_o      = data_k_r;
  assign data_o        = data_r;
endmodule
