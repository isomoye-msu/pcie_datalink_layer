module retry_management
  import pcie_datalink_pkg::*;
#(
    // TLP data width
    parameter int DATA_WIDTH       = 32,                      //AXIS data width
    // TLP strobe width
    parameter int STRB_WIDTH       = DATA_WIDTH / 8,
    parameter int KEEP_WIDTH       = STRB_WIDTH,
    parameter int USER_WIDTH       = 1,
    parameter int S_COUNT          = 1,
    parameter int MAX_PAYLOAD_SIZE = 0,
    parameter int RAM_DATA_WIDTH   = 32,                      // width of the data
    parameter int RAM_ADDR_WIDTH   = $clog2(RAM_DATA_WIDTH),  // number of address bits
    // Width of AXI stream interfaces in bits
    parameter int RETRY_TLP_SIZE   = 3
) (
    input logic clk_i,  // Clock signal
    input logic rst_i,  // Reset signal

    input  logic [              11:0] tx_seq_num_i,
    input  logic                      tx_valid_i,
    //retry signals
    output logic                      retry_available_o,
    output logic [               7:0] retry_index_o,
    output logic                      retry_err_o,
    //dllp tlp sequence ack/nack
    input  logic                      ack_nack_i,
    input  logic                      ack_nack_vld_i,
    input  logic [              11:0] ack_seq_num_i,
    //bram signals
    output logic                      bram_wr_o,          // pulse a 1 to write and 0 reads
    output logic [RAM_ADDR_WIDTH-1:0] bram_addr_o,
    output logic [RAM_DATA_WIDTH-1:0] bram_data_out_o,
    input  logic [RAM_DATA_WIDTH-1:0] bram_data_in_i,
    //RETRY AXIS output
    output logic [  (DATA_WIDTH)-1:0] m_axis_tdata,
    output logic [  (KEEP_WIDTH)-1:0] m_axis_tkeep,
    output logic                      m_axis_tvalid,
    output logic                      m_axis_tlast,
    output logic [    USER_WIDTH-1:0] m_axis_tuser,
    input  logic                      m_axis_tready
);

  //maxbytesper tlp
  localparam int MaxTlpHdrSizeDW = 4;
  localparam int MaxBytesPerTLP = 8 << (4 + MAX_PAYLOAD_SIZE);
  localparam int MaxTlpTotalSizeDW = MaxTlpHdrSizeDW + MaxBytesPerTLP + 1;
  localparam int RetryTimer = 8'hA0;

  //retry mechanism enum
  typedef enum logic [2:0] {
    ST_RETRY_IDLE,
    ST_CNT_RETRY,
    ST_REPLAY,
    ST_WAIT_REPLAY,
    ST_RETRY_ERR
  } retry_st_e;


  //dllp to tlp fsm emum
  typedef enum logic [2:0] {
    ST_TLP_RX_IDLE,
    ST_TLP_GET_COUNT,
    ST_TLP_GET_ADDR,
    ST_TLP_RX_SOP,
    ST_TLP_RX_STREAM,
    ST_TLP_RX_EOP
  } tlp_rx_st_e;

  tlp_rx_st_e                            tlp_curr_state;
  tlp_rx_st_e                            tlp_next_state;
  //internal retry tracking signals
  logic       [RETRY_TLP_SIZE-1:0]       retrys_c;
  logic       [RETRY_TLP_SIZE-1:0]       retrys_r;
  logic       [RETRY_TLP_SIZE-1:0]       retry_index_flag;
  logic       [RETRY_TLP_SIZE-1:0]       mutex_flag;
  logic       [RETRY_TLP_SIZE-1:0]       error_c;
  logic       [RETRY_TLP_SIZE-1:0]       error_r;
  logic       [RETRY_TLP_SIZE-1:0][11:0] ack_seq_mem_c;
  logic       [RETRY_TLP_SIZE-1:0][11:0] ack_seq_mem_r;
  logic       [               7:0]       next_retry_index_c;
  logic       [               7:0]       next_retry_index_r;
  logic       [RETRY_TLP_SIZE-1:0]       retry_valid_c;
  logic       [RETRY_TLP_SIZE-1:0]       retry_valid_r;
  logic       [               7:0]       retry_index_c;
  logic       [               7:0]       retry_index_r;
  logic       [RETRY_TLP_SIZE-1:0]       retry_ack_c;
  logic       [RETRY_TLP_SIZE-1:0]       retry_ack_r;
  logic                                  free_retry_c;
  logic                                  free_retry_r;
  logic       [              11:0]       store_seq_c;
  logic       [              11:0]       store_seq_r;
  logic       [              11:0]       seq_num_out;
  //tx counters
  logic       [              31:0]       tx_word_count_c;
  logic       [              31:0]       tx_word_count_r;
  logic       [              31:0]       tlp_curr_count_c;
  logic       [              31:0]       tlp_curr_count_r;
  logic       [              31:0]       tx_addr_c;
  logic       [              31:0]       tx_addr_r;
  //skid buffer axis signals
  logic       [    DATA_WIDTH-1:0]       s_axis_skid_tdata;
  logic       [    KEEP_WIDTH-1:0]       s_axis_skid_tkeep;
  logic       [       S_COUNT-1:0]       s_axis_skid_tvalid;
  logic       [       S_COUNT-1:0]       s_axis_skid_tlast;
  logic       [    USER_WIDTH-1:0]       s_axis_skid_tuser;
  logic       [       S_COUNT-1:0]       s_axis_skid_tready;



  logic       [    DATA_WIDTH-1:0]       m_axis_tdata_c;
  logic       [    KEEP_WIDTH-1:0]       m_axis_tkeep_c;
  logic       [       S_COUNT-1:0]       m_axis_tvalid_c;
  logic       [       S_COUNT-1:0]       m_axis_tlast_c;
  logic       [    USER_WIDTH-1:0]       m_axis_tuser_c;
  logic       [       S_COUNT-1:0]       m_axis_tready_c;
  //register pair
  logic       [    DATA_WIDTH-1:0]       m_axis_tdata_r;
  logic       [    KEEP_WIDTH-1:0]       m_axis_tkeep_r;
  logic       [       S_COUNT-1:0]       m_axis_tvalid_r;
  logic       [       S_COUNT-1:0]       m_axis_tlast_r;
  logic       [    USER_WIDTH-1:0]       m_axis_tuser_r;
  logic       [       S_COUNT-1:0]       m_axis_tready_r;



  //main  sequential blocksSS
  always_ff @(posedge clk_i) begin : main_sequential_block
    if (rst_i) begin
      retrys_r           <= '0;
      error_r            <= '0;
      next_retry_index_r <= '0;
      retry_valid_r      <= '0;
      retry_ack_r        <= '0;
      retry_index_r      <= '0;
      store_seq_r        <= '0;
      free_retry_r       <= '0;
      //transmit tlp signals
      tx_word_count_r    <= '0;
      tlp_curr_count_r   <= '0;
      tx_addr_r          <= '0;
      tlp_curr_state     <= ST_TLP_RX_IDLE;
      //axis signals
      m_axis_tvalid_r    <= '0;
    end else begin
      retrys_r           <= retrys_c;
      error_r            <= error_c;
      next_retry_index_r <= next_retry_index_c;
      retry_valid_r      <= retry_valid_c;
      retry_ack_r        <= retry_ack_c;
      retry_index_r      <= retry_index_c;
      store_seq_r        <= store_seq_c;
      free_retry_r       <= free_retry_c;
      //transmit tlp signals
      tx_word_count_r    <= tx_word_count_c;
      tlp_curr_count_r   <= tlp_curr_count_c;
      tx_addr_r          <= tx_addr_c;
      tlp_curr_state     <= tlp_next_state;
      //axis signals
      m_axis_tvalid_r    <= m_axis_tvalid_c;
    end

    //non-resetable
    ack_seq_mem_r  <= ack_seq_mem_c;
    //non resetable
    m_axis_tdata_r <= m_axis_tdata_c;
    m_axis_tkeep_r <= m_axis_tkeep_c;
    m_axis_tlast_r <= m_axis_tlast_c;
    m_axis_tuser_r <= m_axis_tuser_c;
  end

  //retry tracking combo block
  always_comb begin : retry_tracking_combo
    retrys_c           = retrys_r;
    next_retry_index_c = next_retry_index_r;
    retry_index_flag   = '0;
    for (int i = 0; i < RETRY_TLP_SIZE; i++) begin
      ack_seq_mem_c[i] = ack_seq_mem_r[i];
    end
    //check if incoming acked seq
    if (free_retry_r) begin
      //free retry
      for (int i = 0; i < RETRY_TLP_SIZE; i++) begin
        if (ack_seq_mem_r[i] == store_seq_r) begin
          retrys_c[i] = '0;
        end
      end
    end else begin
      if (tx_valid_i) begin
        ack_seq_mem_c[next_retry_index_r] = tx_seq_num_i;
        retrys_c[next_retry_index_r]      = '1;
        for (int i = 0; i < RETRY_TLP_SIZE; i++) begin
          if (!retrys_r[i] && (i != next_retry_index_r)) begin
            retry_index_flag[i] = 1'b0;
            for (int j = 1; j < RETRY_TLP_SIZE; j++) begin
              if (!retrys_r[j] && (j != next_retry_index_r) && (j < i)) begin
                retry_index_flag[i] = 1'b1;
              end
            end
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
    always_comb begin : retry_timer
      replay_cnt_c     = replay_cnt_r;
      retry_timer_c    = retry_timer_r;
      next_state       = curr_state;
      retry_valid_c[i] = retry_valid_r[i];
      error_c[i]       = error_r[i];
      case (curr_state)
        ST_RETRY_IDLE: begin
          if (retrys_r[i]) begin
            next_state = ST_CNT_RETRY;
          end
        end
        ST_CNT_RETRY: begin
          retry_timer_c = retry_timer_r + 1'b1;
          if (!retrys_r[i]) begin
            replay_cnt_c  = '0;
            retry_timer_c = '0;
            next_state    = ST_RETRY_IDLE;
          end else if (retry_timer_r >= RetryTimer) begin
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
          if (!retrys_r[i]) begin
            replay_cnt_c     = '0;
            retry_timer_c    = '0;
            retry_valid_c[i] = '0;
            next_state       = ST_RETRY_IDLE;
          end else begin
            if (retry_ack_r[i]) begin
              retry_timer_c    = '0;
              retry_valid_c[i] = '0;
              next_state       = ST_WAIT_REPLAY;
            end
          end
        end
        ST_WAIT_REPLAY: begin
          if (!retrys_r[i]) begin
            replay_cnt_c  = '0;
            retry_timer_c = '0;
            next_state    = ST_RETRY_IDLE;
          end else begin
            if (m_axis_tvalid && m_axis_tready && m_axis_tlast) begin
              next_state = ST_CNT_RETRY;
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


  //transmit tlp from fifo through axi stream
  always_comb begin : transmit_tlp_combo
    tlp_next_state     = tlp_curr_state;
    tx_word_count_c    = tx_word_count_r;
    tlp_curr_count_c   = tlp_curr_count_r;
    tx_addr_c          = tx_addr_r;
    //axis signals
    s_axis_skid_tready = '0;
    m_axis_tdata_c     = m_axis_tdata_r;
    m_axis_tkeep_c     = m_axis_tkeep_r;
    m_axis_tvalid_c    = m_axis_tvalid_r;
    m_axis_tlast_c     = m_axis_tlast_r;
    m_axis_tuser_c     = m_axis_tuser_r;
    //bram write signals
    bram_wr_o          = '0;
    bram_addr_o        = tx_addr_r;
    bram_data_out_o    = '0;
    //retry signals
    retry_ack_c        = retry_ack_r;
    retry_index_c      = retry_index_r;
    mutex_flag         = '0;
    case (tlp_curr_state)
      ST_TLP_RX_IDLE: begin
        //retry mutex block
        if ((retry_valid_r != '0)) begin
          //select lowest index
          for (int i = 0; i < RETRY_TLP_SIZE; i++) begin
            mutex_flag[i] = 1'b0;
            if (retry_valid_r[i]) begin
              for (int j = 1; j < RETRY_TLP_SIZE; j++) begin
                if (retry_valid_r[j] && j < i) begin
                  mutex_flag[i] = 1'b1;
                end
              end
              if (!mutex_flag || i == 0) begin
                retry_ack_c[i] = '1;
                retry_index_c  = i;
              end
            end
          end
          tlp_next_state = ST_TLP_GET_COUNT;
        end
      end
      ST_TLP_GET_COUNT: begin
        tx_addr_c      = retry_index_r * MaxTlpTotalSizeDW;
        bram_addr_o    = tx_addr_c;
        tlp_next_state = ST_TLP_GET_ADDR;
      end
      ST_TLP_GET_ADDR: begin
        tx_word_count_c  = bram_data_in_i[15:0];
        tlp_curr_count_c = '0;
        bram_addr_o      = tx_addr_r + 1;
        tlp_next_state   = ST_TLP_RX_SOP;
      end
      ST_TLP_RX_SOP: begin
        m_axis_tdata_c   = bram_data_in_i;
        m_axis_tkeep_c   = '1;
        m_axis_tvalid_c  = '1;
        m_axis_tuser_c   = '0;
        m_axis_tlast_c   = '0;
        tlp_curr_count_c = tlp_curr_count_r + 1;
        bram_addr_o      = tx_addr_r + tlp_curr_count_r + 2;
        tlp_next_state   = ST_TLP_RX_STREAM;
        if (tlp_curr_count_r >= tx_word_count_r) begin
          m_axis_tlast_c   = '1;
          tx_addr_c        = tx_addr_r + 1;
          tlp_curr_count_c = '0;
          tlp_next_state   = ST_TLP_RX_EOP;
        end
      end
      ST_TLP_RX_STREAM: begin
        if (m_axis_tready) begin
          m_axis_tdata_c   = bram_data_in_i;
          m_axis_tkeep_c   = '1;
          m_axis_tvalid_c  = '1;
          tlp_curr_count_c = tlp_curr_count_r + 1;
          bram_addr_o      = tx_addr_r + tlp_curr_count_r + 2;
          if (tlp_curr_count_r >= tx_word_count_r - 1) begin
            m_axis_tlast_c   = '1;
            tx_addr_c        = tx_addr_r + 1;
            tlp_curr_count_c = '0;
            retry_ack_c      = '0;
            tlp_next_state   = ST_TLP_RX_EOP;
          end
        end
      end
      ST_TLP_RX_EOP: begin
        if (m_axis_tready) begin
          m_axis_tdata_c  = '0;
          m_axis_tkeep_c  = '0;
          m_axis_tvalid_c = '0;
          m_axis_tlast_c  = '0;
          tlp_next_state  = ST_TLP_RX_IDLE;
        end
      end
      default: begin
      end
    endcase
  end


  assign retry_err_o       = (error_r != '0);
  assign retry_available_o = (retrys_r != '1);
  assign retry_index_o     = next_retry_index_r;
  //assign axi stream
  assign m_axis_tdata      = m_axis_tdata_r;
  assign m_axis_tkeep      = m_axis_tkeep_r;
  assign m_axis_tvalid     = m_axis_tvalid_r;
  assign m_axis_tlast      = m_axis_tlast_r;
  assign m_axis_tuser      = m_axis_tuser_r;


endmodule
