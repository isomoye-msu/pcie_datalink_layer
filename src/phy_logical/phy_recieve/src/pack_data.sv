module pack_data
  import pcie_phy_pkg::*;
#(
    // TLP data width
    parameter int DATA_WIDTH    = 32,
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
    ST_LAST_DATA
  } pack_st_e;


  pack_st_e                                    curr_state;
  pack_st_e                                    next_state;

  logic     [( MAX_NUM_LANES* DATA_WIDTH)-1:0] data_c;
  logic     [( MAX_NUM_LANES* DATA_WIDTH)-1:0] data_r;
  logic     [               MAX_NUM_LANES-1:0] data_valid_c;
  logic     [               MAX_NUM_LANES-1:0] data_valid_r;
  logic     [           (4*MAX_NUM_LANES)-1:0] data_k_c;
  logic     [           (4*MAX_NUM_LANES)-1:0] data_k_r;
  logic     [           (2*MAX_NUM_LANES)-1:0] sync_header_c;
  logic     [           (2*MAX_NUM_LANES)-1:0] sync_header_r;



  logic     [                             5:0] word_count_c;
  logic     [                             5:0] word_count_r;
  // logic     [                            31:0] data_out_c       [MAX_NUM_LANES];
  // logic     [                            31:0] data_out_r       [MAX_NUM_LANES];
  // logic     [               MAX_NUM_LANES-1:0] data_valid_c;
  // logic     [               MAX_NUM_LANES-1:0] data_valid_r;
  // logic     [                             3:0] data_k_out_c     [MAX_NUM_LANES];
  // logic     [                             3:0] data_k_out_r     [MAX_NUM_LANES];

  logic                                        is_ordered_set;
  logic                                        is_data;
  logic                                        ready_out;

  // logic     [                             1:0] sync_header_c    [MAX_NUM_LANES];
  // logic     [                             1:0] sync_header_r    [MAX_NUM_LANES];

  logic     [                             7:0] bytes_per_packet;


  logic                                        fifo_wr_c;
  logic                                        fifo_wr_r;
  logic                                        end_packet;



  always_ff @(posedge clk_i) begin : main_seq_block
    if (rst_i) begin
      data_valid_r <= '0;
      fifo_wr_r <= '0;
      curr_state <= ST_IDLE;
    end else begin
      data_valid_r <= data_valid_c;
      fifo_wr_r <= fifo_wr_c;
      curr_state <= next_state;
    end
    word_count_r  <= word_count_c;
    sync_header_r <= sync_header_c;
    data_k_r      <= data_k_c;
    data_r        <= data_c;
  end



  always_comb begin : block_alignment_combinational_logic
    data_c           = data_r;
    data_valid_c     = data_valid_r;
    data_k_c         = data_k_r;
    sync_header_c    = sync_header_r;
    // lane_number      = '0;
    fifo_wr_c        = '0;
    bytes_per_packet = num_active_lanes_i * (pipe_width_i >> 3);
    next_state       = curr_state;
    end_packet       = '0;
    case (curr_state)
      ST_IDLE: begin
        if (phy_link_up_i) begin
          if (|data_valid_i && data_i[7:0] inside {SDP, STP}) begin
            word_count_c  = '0;
            data_c        = data_i;
            data_valid_c  = data_valid_i;
            data_k_c      = data_k_i;
            sync_header_c = sync_header_r;
            fifo_wr_c     = '1;
            for (int i = 0; i < BytesPerTransaction; i++) begin
              // data_c[8*i+:8] = data_r[8*i+:8];
              if (i < bytes_per_packet) begin
                // data_c[8*i+:8]                                          = data_r[8*i+:8];
                data_c[(bytes_per_packet*8*word_count_r)+(8*i)+:8]      = data_i[8*i+:8];
                data_valid_c[(bytes_per_packet*word_count_r)+(i)]       = data_valid_i[i];
                data_k_c[(bytes_per_packet*word_count_r)+(4*i)+:4]      = data_k_i[4*i+:4];
                sync_header_c[(bytes_per_packet*word_count_r)+(2*i)+:2] = sync_header_r[2*i+:2];
                if (data_i[8*i+:8] == ENDP) begin
                  end_packet = '1;
                end
              end
            end
            if (bytes_per_packet < BytesPerTransaction && !end_packet) begin
              next_state   = ST_SEND_DATA;
              word_count_c = 1'b1;
              fifo_wr_c    = '0;
            end
          end
        end
      end
      ST_SEND_DATA: begin
        if (|data_valid_i) begin
          word_count_c = word_count_r + 1'b1;
          // data_c        = data_i;
          // data_valid_c  = data_valid_i;
          // data_k_c      = data_k_i;
          // sync_header_c = sync_header_r;
          // data_c[(bytes_per_packet*word_count_r*8):512] = data_i;
          for (int i = 0; i < BytesPerTransaction; i++) begin
            // data_c[8*i+:8] = data_r[8*i+:8];
            if (i < bytes_per_packet) begin
              // data_c[8*i+:8]                                          = data_r[8*i+:8];
              data_c[(bytes_per_packet*8*word_count_r)+(8*i)+:8]      = data_i[8*i+:8];
              data_valid_c[(bytes_per_packet*word_count_r)+(i)]       = data_valid_i[i];
              data_k_c[(bytes_per_packet*word_count_r)+(4*i)+:4]      = data_k_i[4*i+:4];
              sync_header_c[(bytes_per_packet*word_count_r)+(2*i)+:2] = sync_header_r[2*i+:2];
              if (data_i[8*i+:8] == ENDP) begin
                end_packet = '1;
              end
            end
          end
          if (((bytes_per_packet * word_count_r) >= BytesPerTransaction) || end_packet) begin
            next_state = ST_IDLE;
            word_count_c = '0;
            fifo_wr_c = '1;
          end
        end
      end
      default: begin
      end
    endcase
  end



  assign sync_header_o = sync_header_r;
  assign data_valid_o  = data_valid_r;
  assign data_k_o      = data_k_r;
  assign data_o        = data_r;
  assign fifo_wr_o     = fifo_wr_r;
endmodule
