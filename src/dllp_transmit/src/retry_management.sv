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
  localparam int RetryTimer = 8'hA0;
  localparam int MaxBytesPerTLP = 8 << (4 + MAX_PAYLOAD_SIZE);
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
  logic                            free_retry_c;
  logic                            free_retry_r;
  logic [RETRY_TLP_SIZE-1:0]       retrys_c;
  logic [RETRY_TLP_SIZE-1:0]       retrys_r;
  logic [RETRY_TLP_SIZE-1:0]       retry_index_flag;
  //sequence number signals
  logic [              11:0]       store_seq_c;
  logic [              11:0]       store_seq_r;
  logic [              11:0]       seq_num_out;
  logic [RETRY_TLP_SIZE-1:0][11:0] ack_seq_mem_c;
  logic [RETRY_TLP_SIZE-1:0][11:0] ack_seq_mem_r;

  //main  sequential block
  always_ff @(posedge clk_i) begin : main_sequential_block
    if (rst_i) begin
      retrys_r           <= '0;
      error_r            <= '0;
      next_retry_index_r <= '0;
      retry_valid_r      <= '0;
      store_seq_r        <= '0;
      free_retry_r       <= '0;
    end else begin
      retrys_r           <= retrys_c;
      error_r            <= error_c;
      next_retry_index_r <= next_retry_index_c;
      retry_valid_r      <= retry_valid_c;
      store_seq_r        <= store_seq_c;
      free_retry_r       <= free_retry_c;
    end
    //non-resetable
    ack_seq_mem_r <= ack_seq_mem_c;
  end

  //retry tracking combo block
  always_comb begin : retry_tracking_combo
    retrys_c           = retrys_r;
    next_retry_index_c = next_retry_index_r;
    retry_index_flag   = '0;
    for (int i = 0; i < RETRY_TLP_SIZE; i++) begin
      ack_seq_mem_c[i] = ack_seq_mem_r[i];
    end
    if (free_retry_r) begin  //check if incoming acked seq
      for (int i = 0; i < RETRY_TLP_SIZE; i++) begin  //free retry
        if (ack_seq_mem_r[i] == store_seq_r) begin
          retrys_c[i] = '0;
        end
      end
    end else begin
      if (tx_valid_i) begin  //wait for dllp layer to send a tlp
        ack_seq_mem_c[next_retry_index_r] = tx_seq_num_i;
        retrys_c[next_retry_index_r]      = '1;
        for (int i = 0; i < RETRY_TLP_SIZE; i++) begin
          //check if there's a free retry fifo
          if (!retrys_r[i] && (i != next_retry_index_r)) begin
            retry_index_flag[i] = 1'b0;
            //select lowest available index checking all indexes before
            //this unrolled loop index
            for (int j = 1; j < RETRY_TLP_SIZE; j++) begin
              if (!retrys_r[j] && (j != next_retry_index_r) && (j < i)) begin
                retry_index_flag[i] = 1'b1;
              end
            end
            //this check ensures that either the zero index
            //or the lowest index is selected
            if (!retry_index_flag || i == 0) begin
              next_retry_index_c = i;
            end
          end
        end
      end
    end
  end

  //retry free combo block
  always_comb begin : retry_free_combo
    free_retry_c = '0;
    store_seq_c  = store_seq_r;
    //check if tlp is acked or nacked
    if (ack_nack_vld_i && ack_nack_i) begin
      free_retry_c = '1;
      store_seq_c  = ack_seq_num_i;
    end
  end


  //retry generate loop
  for (genvar i = 0; i < RETRY_TLP_SIZE; i++) begin : gen_retry_counters
    retry_st_e curr_state, next_state;
    logic [1:0] replay_cnt_c, replay_cnt_r;
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
            next_state = ST_CNT_RETRY;
          end
        end
        ST_CNT_RETRY: begin
          //timer counter increment
          retry_timer_c = retry_timer_r + 1'b1;
          if (!retrys_r[i]) begin  //check if tlp acked
            replay_cnt_c  = '0;
            retry_timer_c = '0;
            next_state    = ST_RETRY_IDLE;
          end  //check if timeout reached
          else if (retry_timer_r >= RetryTimer) begin
            replay_cnt_c  = replay_cnt_r + 1'b1;
            retry_timer_c = '0;
            if (replay_cnt_r == '1) begin
              //have a fit
              next_state = ST_RETRY_ERR;
            end else begin
              next_state       = ST_REPLAY;
              retry_valid_c[i] = '1;
            end
          end
        end
        ST_REPLAY: begin
          //check if late ack
          if (!retrys_r[i]) begin
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
          if (!retrys_r[i]) begin
            replay_cnt_c  = '0;
            retry_timer_c = '0;
            next_state    = ST_RETRY_IDLE;
          end  //wait for a resend complete from retry fifo
          else begin
            if (retry_complete_i[i]) begin
              next_state = ST_CNT_RETRY;
              retry_timer_c = '0;
            end
          end
        end
        ST_RETRY_ERR: begin
          error_c[i] = '1;
        end
        default: begin
        end
      endcase
    end
  end : gen_retry_counters


  assign retry_err_o       = (error_r != '0);
  assign retry_available_o = (retrys_r != '1);
  assign retry_index_o     = next_retry_index_r;
  assign retry_valid_o     = retry_valid_r;

endmodule
