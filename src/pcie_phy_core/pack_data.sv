module pack_data
  import pcie_phy_pkg::*;
#(
    // TLP data width
    parameter int DATA_WIDTH    = 32,
    parameter int MAX_NUM_LANES = 16
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
    output logic                                           fifo_wr_o,
    input  logic        [                             5:0] num_active_lanes_i
);



  localparam int PipeWidthGen1 = 8;
  localparam int PipeWidthGen2 = 16;
  localparam int PipeWidthGen3 = 16;
  localparam int PipeWidthGen4 = 32;
  localparam int PipeWidthGen5 = 32;
  localparam int BytesPerTransfer = DATA_WIDTH / 8;
  localparam int MaxWordsPerTransaction = 512 / DATA_WIDTH;
  localparam int BytesPerTransaction = 512 / 8;

  typedef enum logic [4:0] {
    ST_IDLE,
    ST_SEND_DATA,
    ST_GEN3_TLP,
    ST_GEN3_DLLP,
    ST_LAST_DATA
  } pack_st_e;

  // logic     [                            31:0] data_out_c       [MAX_NUM_LANES];
  // logic     [                            31:0] data_out_r       [MAX_NUM_LANES];
  // logic     [               MAX_NUM_LANES-1:0] data_valid_c;
  // logic     [               MAX_NUM_LANES-1:0] data_valid_r;
  // logic     [                             3:0] data_k_out_c     [MAX_NUM_LANES];
  // logic     [                             3:0] data_k_out_r     [MAX_NUM_LANES];

  logic        is_ordered_set;
  logic        is_data;
  logic        ready_out;

  // logic     [                             1:0] sync_header_c    [MAX_NUM_LANES];
  // logic     [                             1:0] sync_header_r    [MAX_NUM_LANES];

  logic [15:0] bytes_per_packet;


  logic        end_packet;
  logic [31:0] byte_shift;


  typedef struct packed {
    pack_st_e                                state;
    logic [( MAX_NUM_LANES* DATA_WIDTH)-1:0] data;
    logic [MAX_NUM_LANES-1:0]                data_valid;
    logic [(4*MAX_NUM_LANES)-1:0]            data_k;
    logic [(2*MAX_NUM_LANES)-1:0]            sync_header;
    logic [5:0]                              word_count;
    logic [5:0]                              tlp_byte_count;
    logic                                    fifo_wr;
    logic [3:0]                              count;
  } pack_data_t;


  pack_data_t D;
  pack_data_t Q;




  always_ff @(posedge clk_i) begin : main_seq_block
    if (rst_i) begin
      Q <= '{state: ST_IDLE, default: 'd0};
    end else begin
      Q <= D;
    end
  end

  //assign bytes per packet based on number of lanes
  //will only work with number of lanes that are powers of two
  always_comb begin : calc_bytes_per_packet
    bytes_per_packet = '0;
    for (int i = 0; i < 8; i++) begin
      if (num_active_lanes_i == (1 << i)) begin
        bytes_per_packet = (pipe_width_i) << i;
      end
    end
  end



  always_comb begin : block_alignment_combinational_logic
    D            = Q;
    end_packet   = '0;
    byte_shift   = (bytes_per_packet * Q.word_count);
    D.data_valid = '0;
    D.fifo_wr    = '0;
    D.data_valid  = '0;
    case (Q.state)
      ST_IDLE: begin
        if (phy_link_up_i && (|data_valid_i)) begin
          D.word_count = '0;
          if (Q.count == 0) begin
            D.count       = 3'd1;
            D.data[15:0]  = data_i[15:0];
            D.data_k[1:0] = data_k_i[1:0];
            D.sync_header = sync_header_i;
            D.fifo_wr     = '1;
          end else begin
            D.count       = 3'd0;
            D.data[31:16]  = data_i[15:0];
            D.data_k[3:2] = data_k_i[1:0];
            D.sync_header = sync_header_i;
            D.fifo_wr     = '1;
            D.data_valid  = '1;
          end
        end
      end
      // ST_SEND_DATA: begin
      //   if (|data_valid_i) begin
      //     word_count_c = word_count_r + 1'b1;
      //     // data_c        = data_i;
      //     // data_valid_c  = (data_valid_r << num_active_lanes_i) | data_valid_i;
      //     // data_k_c      = (data_k_r << bytes_per_packet) | data_k_i;
      //     // sync_header_c = (sync_header_r << num_active_lanes_i) | sync_header_i;
      //     // data_c[(byte_shift*8):512] = data_i;
      //     for (int i = 0; i < MAX_NUM_LANES; i++) begin
      //       sync_header_c[(byte_shift)+(2*i)+:2] = sync_header_r[2*i+:2];
      //     end
      //     for (int i = 0; i < BytesPerTransaction; i++) begin
      //       // data_c[8*i+:8] = data_r[8*i+:8];
      //       if (i < bytes_per_packet) begin
      //         // data_c[8*i+:8]                                          = data_r[8*i+:8];
      //         data_c[(byte_shift*8)+(8*i)+:8] = data_i[8*i+:8];
      //         data_valid_c[byte_shift+(i)]    = data_valid_i[i];
      //         data_k_c[(byte_shift)+(1*i)+:1] = data_k_i[1*i+:1];
      //         if (data_i[8*i+:8] == ENDP) begin
      //           end_packet = '1;
      //         end
      //       end
      //     end
      //     if (((byte_shift) >= BytesPerTransaction) || end_packet) begin
      //       next_state = ST_IDLE;
      //       word_count_c = '0;
      //       fifo_wr_c = '1;
      //     end
      //   end
      // end
      // ST_GEN3_DLLP: begin
      //   if (|data_valid_i) begin
      //     word_count_c = word_count_r + 1'b1;
      //     // data_c        = data_i;
      //     // data_valid_c  = (data_valid_r << num_active_lanes_i) | data_valid_i;
      //     // data_k_c      = (data_k_r << bytes_per_packet) | data_k_i;
      //     // sync_header_c = (sync_header_r << num_active_lanes_i) | sync_header_i;
      //     for (int i = 0; i < MAX_NUM_LANES; i++) begin
      //       sync_header_c[(byte_shift)+(2*i)+:2] = sync_header_r[2*i+:2];
      //     end
      //     for (int i = 0; i < BytesPerTransaction; i++) begin
      //       // data_c[8*i+:8] = data_r[8*i+:8];
      //       if (i < bytes_per_packet) begin
      //         // data_c[8*i+:8]                                          = data_r[8*i+:8];
      //         data_c[(byte_shift*8)+(8*i)+:8] = data_i[8*i+:8];
      //         data_valid_c[(byte_shift)+(i)]  = data_valid_i[i];
      //         data_k_c[(byte_shift)+(1*i)+:1] = data_k_i[1*i+:1];
      //         // sync_header_c[(byte_shift)+(1*i)+:1] = sync_header_r[1*i+:1];
      //         // if (data_i[8*i+:8] == ENDP) begin
      //         //   end_packet = '1;
      //         // end
      //       end
      //     end
      //     if (((byte_shift) >= BytesPerTransaction) || ((byte_shift) >= 8'h8)) begin
      //       next_state = ST_IDLE;
      //       word_count_c = '0;
      //       fifo_wr_c = '1;
      //     end
      //   end
      // end
      // ST_GEN3_TLP: begin
      //   if (|data_valid_i) begin
      //     word_count_c = word_count_r + 1'b1;
      //     // data_c        = data_i;
      //     // data_valid_c  = (data_valid_r << num_active_lanes_i) | data_valid_i;
      //     // data_k_c      = (data_k_r << bytes_per_packet) | data_k_i;
      //     // sync_header_c = (sync_header_r << num_active_lanes_i) | sync_header_i;
      //     for (int i = 0; i < MAX_NUM_LANES; i++) begin
      //       sync_header_c[(byte_shift)+(2*i)+:2] = sync_header_r[2*i+:2];
      //     end
      //     for (int i = 0; i < BytesPerTransaction; i++) begin
      //       // data_c[8*i+:8] = data_r[8*i+:8];
      //       if (i < bytes_per_packet) begin
      //         // data_c[8*i+:8]                                          = data_r[8*i+:8];
      //         data_c[(bytes_per_packet*8*word_count_r)+(8*i)+:8] = data_i[8*i+:8];
      //         data_valid_c[(byte_shift)+(i)]                     = data_valid_i[i];
      //         data_k_c[(byte_shift)+(1*i)+:1]                    = data_k_i[1*i+:1];
      //         // sync_header_c[(byte_shift)+(1*i)+:1] = sync_header_r[1*i+:1];
      //         // if (data_i[8*i+:8] == ENDP) begin
      //         //   end_packet = '1;
      //         // end
      //       end
      //     end
      //     if (((byte_shift) >= BytesPerTransaction) || ((byte_shift) >= 8'h8)) begin
      //       next_state = ST_IDLE;
      //       word_count_c = '0;
      //       fifo_wr_c = '1;
      //     end
      //   end
      // end
      default: begin
      end
    endcase
  end



  assign sync_header_o = Q.sync_header;
  assign data_valid_o  = Q.data_valid;
  assign data_k_o      = Q.data_k;
  assign data_o        = Q.data;
  assign fifo_wr_o     = Q.fifo_wr;
endmodule
