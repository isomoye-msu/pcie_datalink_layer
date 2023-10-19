module tlp2dllp
  import pcie_datalink_pkg::*;
#(
    // Width of AXI stream interfaces in bits
    parameter int DATA_WIDTH     = 32,
    // tkeep signal width (words per cycle)
    parameter int KEEP_WIDTH     = (DATA_WIDTH / 8),
    // tuser signal width
    parameter int USER_WIDTH     = 1,
    //
    parameter int S_COUNT        = 1,
    parameter int RAM_DATA_WIDTH = 8,                 // width of the data
    parameter int RAM_ADDR_WIDTH = 4                  // number of address bits
) (
    input  logic                      clk_i,              // Clock signal
    input  logic                      rst_i,              // Reset signal
    /*
     * TLP AXIS inputs
     */
    input  logic [    DATA_WIDTH-1:0] s_axis_tdata_i,
    input  logic [    KEEP_WIDTH-1:0] s_axis_tkeep_i,
    input  logic [       S_COUNT-1:0] s_axis_tvalid_i,
    input  logic [       S_COUNT-1:0] s_axis_tlast_i,
    input  logic [    USER_WIDTH-1:0] s_axis_tuser_i,
    output logic [       S_COUNT-1:0] s_axis_tready_o,
    /*
     * TLP AXI output
     */
    output logic [    DATA_WIDTH-1:0] m_axis_tdata_o,
    output logic [    KEEP_WIDTH-1:0] m_axis_tkeep_o,
    output logic                      m_axis_tvalid_o,
    output logic                      m_axis_tlast_o,
    output logic [    USER_WIDTH-1:0] m_axis_tuser_o,
    input  logic                      m_axis_tready_i,
    //bram signals
    output logic                      bram_wr_o,          // pulse a 1 to write and 0 reads
    output logic [RAM_ADDR_WIDTH-1:0] bram_addr_o,
    output logic [RAM_DATA_WIDTH-1:0] bram_data_out_o,
    input  logic [RAM_DATA_WIDTH-1:0] bram_data_in_i,
    //seq number.. handshake with phy layer
    output logic [              15:0] seq_num_o,
    output logic                      dllp_valid_o,
    //retry management
    input  logic                      retry_available_i,
    input  logic [               7:0] retry_index_i,
    /*
     * Flow control
     */
    input  logic [               7:0] tx_fc_ph_i,
    input  logic [              11:0] tx_fc_pd_i,
    input  logic [               7:0] tx_fc_nph_i,
    input  logic [              11:0] tx_fc_npd_i

);

  localparam int MaxBytesPerTLP = 1024;
  localparam int MaxNumWordsPerHdr = 128 / DATA_WIDTH;
  localparam int MaxNumWordsPerTLP = (MaxBytesPerTLP / (DATA_WIDTH / 8)) + MaxNumWordsPerHdr + 2;
  localparam int SkidBuffer = 2;
  //tlp to dllp fsm emum
  typedef enum logic [2:0] {
    ST_IDLE,
    ST_TLP_STREAM,
    ST_TLP_LAST,
    ST_CHECK_CREDITS
  } dll_tx_st_e;

  //datalink state
  dll_tx_st_e curr_state, next_state;

  //replay signals
  logic [31:0] word_offset_c, word_offset_r;

  //transmit sequence logic
  logic [11:0] next_transmit_seq_c, next_transmit_seq_r;
  logic [11:0] ackd_transmit_seq_c, ackd_transmit_seq_r;

  //skid buffer axis signals
  logic [DATA_WIDTH-1:0] s_axis_skid_tdata;
  logic [KEEP_WIDTH-1:0] s_axis_skid_tkeep;
  logic [   S_COUNT-1:0] s_axis_skid_tvalid;
  logic [   S_COUNT-1:0] s_axis_skid_tlast;
  logic [USER_WIDTH-1:0] s_axis_skid_tuser;
  logic [   S_COUNT-1:0] s_axis_skid_tready;



  logic [DATA_WIDTH-1:0] m_axis_tdata_c, m_axis_tdata_r;
  logic [KEEP_WIDTH-1:0] m_axis_tkeep_c, m_axis_tkeep_r;
  logic [S_COUNT-1:0] m_axis_tvalid_c, m_axis_tvalid_r;
  logic [S_COUNT-1:0] m_axis_tlast_c, m_axis_tlast_r;
  logic [USER_WIDTH-1:0] m_axis_tuser_c, m_axis_tuser_r;
  logic [S_COUNT-1:0] m_axis_tready_c, m_axis_tready_r;

  //crc helper signals
  logic [31:0] word_count_c, word_count_r;
  logic [31:0] crc_in_c, crc_in_r;
  logic [31:0] dllp_lcrc_c, dllp_lcrc_r;
  logic [31:0] crc_out;
  logic [31:0] crc_out16;
  logic [31:0] crc_out32;


  //tlp nulled
  logic tlp_nullified_c, tlp_nullified_r;
  // logic s_axis_tready_o, tx_tlp_ready_r;
  logic tlp_ack;
    //tlp type signals
  logic is_cpl_c, is_cpl_r;
  logic is_np_c, is_np_r;
  logic is_p_c, is_p_r;

  //flow control
  logic [8:0] max_payload_size_fc_c, max_payload_size_fc_r;
  logic have_p_credit_c, have_p_credit_r;
  logic have_np_credit_c, have_np_credit_r;

  //credits consumed
  logic [7:0] ph_credits_consumed_c, ph_credits_consumed_r;
  logic [11:0] pd_credits_consumed_c, pd_credits_consumed_r;
  logic [7:0] nph_credits_consumed_c, nph_credits_consumed_r;
  logic [11:0] npd_credits_consumed_c, npd_credits_consumed_r;

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      curr_state <= ST_IDLE;
      next_transmit_seq_r <= '0;
      //crc signals
      word_count_r <= '0;
      crc_in_r <= '0;
      word_offset_r <= '0;
      //flow control
      max_payload_size_fc_r <= '0;
      have_p_credit_r <= '0;
      have_np_credit_r <= '0;
      //tlp type
      is_cpl_r  <=  '0;
      is_np_r   <=  '0;
      is_p_r    <=  '0;
      //credits tracking
      ph_credits_consumed_r    <= '0;
      pd_credits_consumed_r    <= '0;
      nph_credits_consumed_r   <= '0;
      npd_credits_consumed_r   <= '0;
      //axis signals
      m_axis_tvalid_r <= '0;
    end else begin
      curr_state <= next_state;
      next_transmit_seq_r <= next_transmit_seq_c;
      //crc signals
      word_count_r <= word_count_c;
      crc_in_r <= crc_in_c;
      word_offset_r <= word_offset_c;
      //flow control
      max_payload_size_fc_r <= max_payload_size_fc_c;
      have_p_credit_r <= have_p_credit_c;
      have_np_credit_r <= have_np_credit_c;
      //tlp type
      is_cpl_r  <=  is_cpl_c;
      is_np_r   <=  is_np_c;
      is_p_r    <=  is_p_c;
      //credits tracking
      ph_credits_consumed_r    <= ph_credits_consumed_c;
      pd_credits_consumed_r    <= pd_credits_consumed_c;
      nph_credits_consumed_r   <= nph_credits_consumed_c;
      npd_credits_consumed_r   <= npd_credits_consumed_c;
      //axis signals
      m_axis_tvalid_r <= m_axis_tvalid_c;
    end
    //non resetable
    m_axis_tdata_r <= m_axis_tdata_c;
    m_axis_tkeep_r <= m_axis_tkeep_c;
    m_axis_tlast_r <= m_axis_tlast_c;
    m_axis_tuser_r <= m_axis_tuser_c;
  end


  always_comb begin : tlp_transmit
    next_state = curr_state;
    next_transmit_seq_c = next_transmit_seq_r;
    bram_wr_o = '0;
    bram_addr_o = '0;
    bram_data_out_o = '0;
    dllp_valid_o = '0;
    crc_in_c = crc_in_r;
    word_offset_c = word_offset_r;
    //axis signals
    //@hint: axis signals not registered...look here for easy timing improvements
    s_axis_skid_tready = '0;
    m_axis_tdata_c = m_axis_tdata_r;
    m_axis_tkeep_c = m_axis_tkeep_r;
    m_axis_tvalid_c = m_axis_tvalid_r;
    m_axis_tlast_c = m_axis_tlast_r;
    m_axis_tuser_c = m_axis_tuser_r;
    //tlp type
    is_cpl_c  =  is_cpl_r;
    is_np_c   =  is_np_r;
    is_p_c    =  is_p_r;
    case (curr_state)
      ST_IDLE: begin
        s_axis_skid_tready = '0;
        if (retry_available_i && s_axis_skid_tvalid) begin
          // s_axis_skid_tready = '1;
          //calculate sequence number crc
          crc_in_c = crc_out16;
          //store seq
          bram_data_out_o = next_transmit_seq_r;
          word_offset_c = retry_index_i * MaxNumWordsPerTLP;
          bram_addr_o = word_offset_c + 1;
          word_count_c = 8'h2;
          s_axis_skid_tready = '0;

          m_axis_tdata_c = next_transmit_seq_r;
          m_axis_tkeep_c = '1;
          m_axis_tlast_c = '0;
          m_axis_tuser_c = '0;
          //check tlp type
          if (((s_axis_skid_tdata[7:0] == Cpl) || (s_axis_skid_tdata[7:0] == CplD))
          && have_p_credit_r) begin
            is_cpl_c = '1;
            bram_wr_o = '1;
            m_axis_tvalid_c = '1;
            //goto stream state
            next_state = ST_TLP_STREAM;
          end else if (((s_axis_skid_tdata[7:0]  == MW) || (s_axis_skid_tdata[7:0]  == CW0) ||
            (s_axis_skid_tdata[7:0] == CW1))  && have_p_credit_r) begin
            is_p_c = '1;
            bram_wr_o = '1;
            m_axis_tvalid_c = '1;
            //goto stream state
            next_state = ST_TLP_STREAM;
          end else if( have_np_credit_r)begin
            is_np_c = '1;
            bram_wr_o = '1;
            m_axis_tvalid_c = '1;
            //goto stream state
            next_state = ST_TLP_STREAM;
          end
        end
      end
      ST_TLP_STREAM: begin
        s_axis_skid_tready = m_axis_tready_i;

        if (m_axis_tready_i) begin
          crc_in_c = crc_out32;

          m_axis_tdata_c = s_axis_skid_tdata;
          m_axis_tkeep_c = '1;
          m_axis_tvalid_c = s_axis_skid_tvalid;
          if (s_axis_skid_tvalid) begin
            //store tlp data
            bram_data_out_o = s_axis_skid_tdata;
            bram_wr_o = '1;
            bram_addr_o = word_offset_r + word_count_r;
            word_count_c = word_count_r + 1'b1;
            if (s_axis_skid_tlast) begin
              next_state = ST_TLP_LAST;
            end
          end
        end
      end
      //retry buffer of 1 to start
      ST_TLP_LAST: begin
        if (m_axis_tready_i) begin
          bram_data_out_o = crc_in_r;
          bram_wr_o = '1;
          bram_addr_o = word_offset_r + word_count_r;
          //axis data
          m_axis_tdata_c = crc_in_r;
          m_axis_tkeep_c = '1;
          m_axis_tvalid_c = '1;
          m_axis_tlast_c = '1;
          word_count_c = word_count_r + 1'b1;
          next_state = ST_CHECK_CREDITS;
        end
      end
      ST_CHECK_CREDITS: begin
        if (m_axis_tready_i) begin
          bram_data_out_o = word_count_r;
          bram_wr_o = '1;
          bram_addr_o = word_offset_r;
          dllp_valid_o = '1;
          word_count_c = '0;
          word_offset_c = '0;
          next_transmit_seq_c = next_transmit_seq_r + 1'b1;
          m_axis_tvalid_c = '0;
          next_state = ST_IDLE;
        end
      end
      default: begin

      end
    endcase
  end

  always_comb begin : flow_contol

    ph_credits_consumed_c = ph_credits_consumed_r;
    pd_credits_consumed_c = pd_credits_consumed_r;
    nph_credits_consumed_c = nph_credits_consumed_r;
    npd_credits_consumed_c = npd_credits_consumed_r;

    max_payload_size_fc_c = 9'd8 << 5;
    have_p_credit_c  = ((tx_fc_ph_i - ph_credits_consumed_r)> 8) &&
    ((tx_fc_pd_i - pd_credits_consumed_r)> (max_payload_size_fc_c << 1));
    have_np_credit_c = (tx_fc_nph_i - nph_credits_consumed_r) > 8;

    if (dllp_valid_o) begin
      //header with data
      if (word_count_r > 5) begin
        ph_credits_consumed_c = ph_credits_consumed_r + 4;
        pd_credits_consumed_c = pd_credits_consumed_r + (word_count_r - 5);
      end else begin  //no data
        nph_credits_consumed_c = nph_credits_consumed_r + 4;
        npd_credits_consumed_c = npd_credits_consumed_r + (word_count_r - 5);
      end

    end
  end : flow_contol

  //axis skid buffer
  axis_register #(
      .DATA_WIDTH(DATA_WIDTH),
      .KEEP_ENABLE('1),
      .KEEP_WIDTH(KEEP_WIDTH),
      .LAST_ENABLE('1),
      .ID_ENABLE('0),
      .ID_WIDTH(1),
      .DEST_ENABLE('0),
      .DEST_WIDTH(1),
      .USER_ENABLE('1),
      .USER_WIDTH(3),
      .REG_TYPE(SkidBuffer)
  ) axis_register_inst (
      .clk(clk_i),
      .rst(rst_i),
      .s_axis_tdata(s_axis_tdata_i),
      .s_axis_tkeep(s_axis_tkeep_i),
      .s_axis_tvalid(s_axis_tvalid_i),
      .s_axis_tready(s_axis_tready_o),
      .s_axis_tlast(s_axis_tlast_i),
      .s_axis_tid('0),
      .s_axis_tdest('0),
      .s_axis_tuser(s_axis_tuser_i),
      .m_axis_tdata(s_axis_skid_tdata),
      .m_axis_tkeep(s_axis_skid_tkeep),
      .m_axis_tvalid(s_axis_skid_tvalid),
      .m_axis_tready(s_axis_skid_tready),
      .m_axis_tlast(s_axis_skid_tlast),
      .m_axis_tid(),
      .m_axis_tdest(),
      .m_axis_tuser(s_axis_skid_tuser)
  );


  pcie_lcrc32 tlp_crc32_inst (
      .crcIn (crc_in_r),
      .data  (s_axis_tdata_i),
      .crcOut(crc_out32)
  );

  pcie_lcrc16 tlp_crc16_inst (
      .crcIn (32'hFFFFFFFF),
      .data  (next_transmit_seq_r),
      .crcOut(crc_out16)
  );


  assign m_axis_tdata_o  = m_axis_tdata_r;
  assign m_axis_tkeep_o  = m_axis_tkeep_r;
  assign m_axis_tvalid_o = m_axis_tvalid_r;
  assign m_axis_tlast_o  = m_axis_tlast_r;
  assign m_axis_tuser_o  = m_axis_tuser_r;
  assign seq_num_o       = next_transmit_seq_r;


  // Dump waves
  // initial begin
  //   $dumpfile("tlp2dllp.vcd");
  //   $dumpvars(1, tlp2dllp);
  // end


endmodule
