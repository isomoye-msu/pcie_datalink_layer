//!module: retry_management
//! Author: Idris Somoye
//! Module implements a retry management controller. It uses a timer to track the time
//! between transmissions and ack/nack. Module resend TLPs stored in the retry FIFO and the
//! PCIe mandated retry increments.
module retry_management
  import pcie_datalink_pkg::*;
#(
    parameter int DATA_WIDTH       = 32,              //AXIS data width
    parameter int STRB_WIDTH       = DATA_WIDTH / 8,  // TLP strobe width
    parameter int KEEP_WIDTH       = STRB_WIDTH,
    parameter int USER_WIDTH       = 1,
    parameter int S_COUNT          = 1,
    parameter int MAX_PAYLOAD_SIZE = 256,
    parameter int RAM_DATA_WIDTH   = 32,              // width of the data
    parameter int RETRY_TLP_SIZE   = 3,               // Width of AXI stream interfaces in bits
    parameter int REPLAY_TIMER_CYCLES = 16'hAA0,
    parameter int MAX_REPLAY_ATTEMPTS = 2,

    parameter int RAM_ADDR_WIDTH = $clog2(RAM_DATA_WIDTH)  // number of address bits
) (
    input logic clk_i,  // Clock signal
    input logic rst_i,  // Reset signal

    input  logic [              11:0] tx_seq_num_i,
    input  logic                      tx_valid_i,
    //retry signals
    output logic                      retry_available_o,
    output logic [               7:0] retry_index_o,
    output logic                      retry_err_o,
    output logic [RETRY_TLP_SIZE-1:0] retry_valid_o,
    input  logic [RETRY_TLP_SIZE-1:0] retry_ack_i,
    input  logic [RETRY_TLP_SIZE-1:0] retry_complete_i,
    //dllp tlp sequence ack/nack
    input  logic                      ack_nack_i,
    input  logic                      ack_nack_vld_i,
    input  logic [              11:0] ack_seq_num_i
);

  //maxbytesper tlp
  localparam int MaxTlpHdrSizeDW = 4;
  localparam int MaxBytesPerTLP = MAX_PAYLOAD_SIZE;
  localparam int MaxTlpTotalSizeDW = MaxTlpHdrSizeDW + MaxBytesPerTLP + 1;

  //retry mechanism enum
  typedef enum logic [2:0] {
    ST_RETRY_IDLE,
    ST_CNT_RETRY,
    ST_REPLAY,
    ST_WAIT_REPLAY,
    ST_RETRY_ERR
  } retry_st_e;

  //error tracking signals
  logic [RETRY_TLP_SIZE-1:0]       error_c;
  logic [RETRY_TLP_SIZE-1:0]       error_r;
  //retry signals
  logic [               7:0]       next_retry_index_c;
  logic [               7:0]       next_retry_index_r;
  logic [RETRY_TLP_SIZE-1:0]       retry_valid_c;
  logic [RETRY_TLP_SIZE-1:0]       retry_valid_r;
  logic [RETRY_TLP_SIZE-1:0]       retrys_c;
  logic [RETRY_TLP_SIZE-1:0]       retrys_r;
  logic                            next_index_found;
  //sequence number signals
  logic [RETRY_TLP_SIZE-1:0][11:0] ack_seq_mem_c;
  logic [RETRY_TLP_SIZE-1:0][11:0] ack_seq_mem_r;

  // Outstanding windows are smaller than half of the 12-bit sequence space,
  // so this modulo comparison remains unambiguous across 0xfff -> 0x000.
  function automatic logic seq_acked(
      input logic [11:0] sequence_number,
      input logic [11:0] ack_number
  );
    logic [11:0] distance;
    begin
      distance = ack_number - sequence_number;
      seq_acked = !distance[11];
    end
  endfunction

  //main  sequential block
  always_ff @(posedge clk_i) begin : main_sequential_block
    if (rst_i) begin
      retrys_r           <= '0;
      error_r            <= '0;
      next_retry_index_r <= '0;
      retry_valid_r      <= '0;
      ack_seq_mem_r      <= '0;
    end else begin
      retrys_r           <= retrys_c;
      error_r            <= error_c;
      next_retry_index_r <= next_retry_index_c;
      retry_valid_r      <= retry_valid_c;
      ack_seq_mem_r      <= ack_seq_mem_c;
    end
  end

  //retry tracking combo block
  always_comb begin : retry_tracking_combo
    retrys_c           = retrys_r;
    next_retry_index_c = next_retry_index_r;
    next_index_found   = '0;
    for (int i = 0; i < RETRY_TLP_SIZE; i++) begin
      ack_seq_mem_c[i] = ack_seq_mem_r[i];
    end

    // Apply an ACK before allocating a TLP arriving on the same cycle.  This
    // permits a just-acknowledged FIFO slot to be reused without a bubble.
    if (ack_nack_vld_i && ack_nack_i) begin
      for (int i = 0; i < RETRY_TLP_SIZE; i++) begin  //free retry
        if (retrys_r[i] && seq_acked(ack_seq_mem_r[i], ack_seq_num_i)) begin
          retrys_c[i] = '0;
        end
      end
    end

    if (tx_valid_i && !retrys_c[next_retry_index_r]) begin
      ack_seq_mem_c[next_retry_index_r] = tx_seq_num_i;
      retrys_c[next_retry_index_r]      = '1;
    end

    // Select a bounded free slot.  Searching from zero also guarantees a
    // deterministic wrap to slot zero after the last slot is consumed.
    for (int i = 0; i < RETRY_TLP_SIZE; i++) begin
      if (!retrys_c[i] && !next_index_found) begin
        next_retry_index_c = i;
        next_index_found   = '1;
      end
    end
  end


  //retry generate loop
  for (genvar i = 0; i < RETRY_TLP_SIZE; i++) begin : gen_retry_counters
    retry_st_e curr_state, next_state;
    localparam int REPLAY_COUNT_WIDTH =
        (MAX_REPLAY_ATTEMPTS < 2) ? 1 : $clog2(MAX_REPLAY_ATTEMPTS + 1);
    logic [REPLAY_COUNT_WIDTH-1:0] replay_cnt_c, replay_cnt_r;
    logic [31:0] retry_timer_c, retry_timer_r;
    //main sequential block
    always @(posedge clk_i) begin : retry_buffer_seq
      if (rst_i) begin
        retry_timer_r <= '0;
        replay_cnt_r  <= '0;
        curr_state    <= ST_RETRY_IDLE;
      end else begin
        retry_timer_r <= retry_timer_c;
        replay_cnt_r  <= replay_cnt_c;
        curr_state    <= next_state;
      end
    end
    //main retry combinational block
    always_comb begin : retry_timer
      replay_cnt_c     = replay_cnt_r;
      retry_timer_c    = retry_timer_r;
      next_state       = curr_state;
      retry_valid_c[i] = retry_valid_r[i];
      error_c[i]       = error_r[i];
      case (curr_state)
        ST_RETRY_IDLE: begin
          //wait for tlp send at this retry index
          if (retrys_r[i]) begin
            retry_timer_c = '0;
            if (ack_nack_vld_i && ack_nack_i &&
                seq_acked(ack_seq_mem_r[i], ack_seq_num_i)) begin
              retry_valid_c[i] = '0;
            end else if (ack_nack_vld_i && !ack_nack_i) begin
              retry_valid_c[i] = '1;
              next_state       = ST_REPLAY;
            end else begin
              next_state = ST_CNT_RETRY;
            end
          end
        end
        ST_CNT_RETRY: begin
          if (!retrys_r[i]) begin  //check if tlp acked
            replay_cnt_c  = '0;
            retry_timer_c = '0;
            next_state    = ST_RETRY_IDLE;
          end else if (ack_nack_vld_i && ack_nack_i &&
                       seq_acked(ack_seq_mem_r[i], ack_seq_num_i)) begin
            replay_cnt_c     = '0;
            retry_timer_c    = '0;
            retry_valid_c[i] = '0;
            next_state       = ST_RETRY_IDLE;
          end else if (ack_nack_vld_i && !ack_nack_i) begin
            // NAK wins if it arrives on the timeout boundary.
            retry_timer_c = '0;
            retry_valid_c[i] = '1;
            next_state       = ST_REPLAY;
          end else if (REPLAY_TIMER_CYCLES == 0 ||
                       retry_timer_r == REPLAY_TIMER_CYCLES - 1) begin
            retry_timer_c = '0;
            if (replay_cnt_r >= MAX_REPLAY_ATTEMPTS) begin
              next_state = ST_RETRY_ERR;
            end else begin
              replay_cnt_c     = replay_cnt_r + 1'b1;
              next_state       = ST_REPLAY;
              retry_valid_c[i] = '1;
            end
          end else begin
            retry_timer_c = retry_timer_r + 1'b1;
          end
        end
        ST_REPLAY: begin
          //check if late ack
          if (!retrys_r[i] ||
              (ack_nack_vld_i && ack_nack_i &&
               seq_acked(ack_seq_mem_r[i], ack_seq_num_i))) begin
            replay_cnt_c     = '0;
            retry_timer_c    = '0;
            retry_valid_c[i] = '0;
            next_state       = ST_RETRY_IDLE;
          end  //check that retry fifo has accepted resend request
          else begin
            if (retry_ack_i[i]) begin
              retry_timer_c    = '0;
              retry_valid_c[i] = '0;
              next_state       = ST_WAIT_REPLAY;
            end
          end
        end
        ST_WAIT_REPLAY: begin
          //wait for an ack..
          if (!retrys_r[i] ||
              (ack_nack_vld_i && ack_nack_i &&
               seq_acked(ack_seq_mem_r[i], ack_seq_num_i))) begin
            replay_cnt_c  = '0;
            retry_timer_c = '0;
            next_state    = ST_RETRY_IDLE;
          end  //wait for a resend complete from retry fifo
          else begin
            if (retry_complete_i[i]) begin
              next_state    = ST_CNT_RETRY;
              retry_timer_c = '0;
            end
          end
        end
        ST_RETRY_ERR: begin
          error_c[i] = '1;
          if (!retrys_r[i]) begin
            error_c[i]       = '0;
            replay_cnt_c     = '0;
            retry_timer_c    = '0;
            retry_valid_c[i] = '0;
            next_state       = ST_RETRY_IDLE;
          end
        end
        default: begin
        end
      endcase
    end
  end : gen_retry_counters


  assign retry_err_o       = (error_r != '0);
  assign retry_available_o = !(&retrys_r);
  assign retry_index_o     = next_retry_index_r;
  assign retry_valid_o     = retry_valid_r;

endmodule
