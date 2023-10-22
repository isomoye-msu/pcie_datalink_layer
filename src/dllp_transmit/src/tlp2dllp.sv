module tlp2dllp
  import pcie_datalink_pkg::*;
#(
    // Width of AXI stream interfaces in bits
    parameter int DATA_WIDTH = 32,
    // tkeep signal width (words per cycle)
    parameter int KEEP_WIDTH = (DATA_WIDTH / 8),
    // tuser signal width
    parameter int USER_WIDTH = 1,
    //
    parameter int S_COUNT = 1,
    parameter int MAX_PAYLOAD_SIZE = 0,
    parameter int RAM_DATA_WIDTH = DATA_WIDTH,  // width of the data
    parameter int RAM_ADDR_WIDTH = $clog2(MaxNumWordsPerTLP),  // number of address bits
    localparam int MaxBytesPerTLP = 8 << (4 + MAX_PAYLOAD_SIZE),
    localparam int MaxNumWordsPerHdr = 128 / DATA_WIDTH,
    localparam int MaxNumWordsPerTLP = (MaxBytesPerTLP / (DATA_WIDTH / 8)) + MaxNumWordsPerHdr + 2
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

  localparam int SkidBuffer = 2;
  //tlp to dllp fsm emum
  typedef enum logic [2:0] {
    ST_IDLE,
    ST_TLP_STREAM,
    ST_TLP_CRC,
    ST_TLP_CRC_ALIGN,
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
  logic s_axis_skid_tvalid;
  logic s_axis_skid_tlast;
  logic [USER_WIDTH-1:0] s_axis_skid_tuser;
  logic s_axis_skid_tready;
  logic s_bypass_tready;



  logic [DATA_WIDTH-1:0] m_axis_tdata_c1, m_axis_tdata_r1;
  logic [KEEP_WIDTH-1:0] m_axis_tkeep_c1, m_axis_tkeep_r1;
  logic m_axis_tvalid_c1, m_axis_tvalid_r1;
  logic m_axis_tlast_c1, m_axis_tlast_r1;
  logic [USER_WIDTH-1:0] m_axis_tuser_c1, m_axis_tuser_r1;
  logic m_axis_tready_c1, m_axis_tready_r1;


  logic [DATA_WIDTH-1:0] m_axis_tdata_c2, m_axis_tdata_r2;
  logic [KEEP_WIDTH-1:0] m_axis_tkeep_c2, m_axis_tkeep_r2;
  logic m_axis_tvalid_c2, m_axis_tvalid_r2;
  logic m_axis_tlast_c2, m_axis_tlast_r2;
  logic [USER_WIDTH-1:0] m_axis_tuser_c2, m_axis_tuser_r2;
  logic m_axis_tready_c2, m_axis_tready_r2;


  logic [DATA_WIDTH-1:0] m_axis_tdata_c3, m_axis_tdata_r3;
  logic [KEEP_WIDTH-1:0] m_axis_tkeep_c3, m_axis_tkeep_r3;
  logic m_axis_tvalid_c3, m_axis_tvalid_r3;
  logic m_axis_tlast_c3, m_axis_tlast_r3;
  logic [USER_WIDTH-1:0] m_axis_tuser_c3, m_axis_tuser_r3;
  logic m_axis_tready_c3, m_axis_tready_r3;


  //crc helper signals
  logic [31:0] word_count_c, word_count_r;
  logic [31:0] crc_in_c, crc_in_r;
  logic [31:0] dllp_lcrc_c, dllp_lcrc_r;
  logic [31:0] crc_out;
  logic [31:0] crc_out16;
  logic [31:0] crc_out32;
  logic [ 1:0] crc_select;
  logic [31:0] crc_reversed;
  logic [15:0] dllp_crc_out;
  logic [15:0] dllp_crc_reversed;


  //tlp nulled
  logic tlp_nullified_c, tlp_nullified_r;
  logic tlp_is_first_c, tlp_is_first_r;
  // logic s_axis_tready_o, tx_tlp_ready_r;
  logic tlp_ack;
  //tlp type signals
  logic [DATA_WIDTH-1:0] tlp_data_c1, tlp_data_r1;
  logic [KEEP_WIDTH-1:0] keep_c, keep_r;
  logic last_c1, last_r1;
  logic last_c2, last_r2;
  logic last_c3, last_r3;
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
      curr_state             <= ST_IDLE;
      next_transmit_seq_r    <= '0;
      //crc signals
      word_count_r           <= '0;
      crc_in_r               <= '1;
      word_offset_r          <= '0;
      //flow control
      max_payload_size_fc_r  <= '0;
      have_p_credit_r        <= '0;
      have_np_credit_r       <= '0;
      //tlp type
      is_cpl_r               <= '0;
      is_np_r                <= '0;
      is_p_r                 <= '0;
      //credits tracking
      ph_credits_consumed_r  <= '0;
      pd_credits_consumed_r  <= '0;
      nph_credits_consumed_r <= '0;
      npd_credits_consumed_r <= '0;
      tlp_is_first_r         <= '1;
      //axis signals
      m_axis_tvalid_r1       <= '0;
      m_axis_tvalid_r2       <= '0;
      m_axis_tvalid_r3       <= '0;
      //last
      last_r1                <= '0;
      last_r2                <= '0;
      last_r3                <= '0;
    end else begin
      curr_state             <= next_state;
      next_transmit_seq_r    <= next_transmit_seq_c;
      //crc signals
      word_count_r           <= word_count_c;
      crc_in_r               <= crc_in_c;
      word_offset_r          <= word_offset_c;
      //flow control
      max_payload_size_fc_r  <= max_payload_size_fc_c;
      have_p_credit_r        <= have_p_credit_c;
      have_np_credit_r       <= have_np_credit_c;
      //tlp type
      tlp_is_first_r         <= tlp_is_first_c;
      is_cpl_r               <= is_cpl_c;
      is_np_r                <= is_np_c;
      is_p_r                 <= is_p_c;
      //credits tracking
      ph_credits_consumed_r  <= ph_credits_consumed_c;
      pd_credits_consumed_r  <= pd_credits_consumed_c;
      nph_credits_consumed_r <= nph_credits_consumed_c;
      npd_credits_consumed_r <= npd_credits_consumed_c;
      //axis signals
      m_axis_tvalid_r1       <= m_axis_tvalid_c1;
      m_axis_tvalid_r2       <= m_axis_tvalid_c2;
      m_axis_tvalid_r3       <= m_axis_tvalid_c3;
      //last
      last_r1                <= last_c1;
      last_r2                <= last_c2;
      last_r3                <= last_c3;
    end
    //non resetable
    tlp_data_r1     <= tlp_data_c1;
    keep_r          <= keep_c;
    //stage 1
    m_axis_tdata_r1 <= m_axis_tdata_c1;
    m_axis_tkeep_r1 <= m_axis_tkeep_c1;
    m_axis_tlast_r1 <= m_axis_tlast_c1;
    m_axis_tuser_r1 <= m_axis_tuser_c1;
    //stage 2
    m_axis_tdata_r2 <= m_axis_tdata_c2;
    m_axis_tkeep_r2 <= m_axis_tkeep_c2;
    m_axis_tlast_r2 <= m_axis_tlast_c2;
    m_axis_tuser_r2 <= m_axis_tuser_c2;
    //stage 3
    m_axis_tdata_r3 <= m_axis_tdata_c3;
    m_axis_tkeep_r3 <= m_axis_tkeep_c3;
    m_axis_tlast_r3 <= m_axis_tlast_c3;
    m_axis_tuser_r3 <= m_axis_tuser_c3;
  end


  always_comb begin : byteswap
    for (int i = 0; i < 8; i++) begin
      crc_out32[i] = crc_in_r[7-i];
      crc_out32[i+8] = crc_in_r[15-i];
      crc_out32[i+16] = crc_in_r[23-i];
      crc_out32[i+24] = crc_in_r[31-i];
      crc_reversed[i]    = crc_out16[7-i];
      crc_reversed[i+8]  = crc_out16[15-i];
      crc_reversed[i+16] = crc_out16[23-i];
      crc_reversed[i+24] = crc_out16[31-i];
    end
  end


  always_comb begin : tlp_transmit_stage1
    m_axis_tdata_c1 = m_axis_tdata_r1;
    m_axis_tkeep_c1 = m_axis_tkeep_r1;
    m_axis_tvalid_c1 = m_axis_tvalid_r1;
    m_axis_tlast_c1 = m_axis_tlast_r1;
    m_axis_tuser_c1 = m_axis_tuser_r1;
    //tlp holder
    tlp_data_c1 = tlp_data_r1;
    crc_select = '0;
    //ready out
    s_axis_skid_tready = retry_available_i & (m_axis_tready_i || ~m_axis_tvalid_r3);
    s_bypass_tready = (m_axis_tready_i & (m_axis_tlast_r1 || m_axis_tlast_r2 || 
    m_axis_tlast_r3));
    //word addr
    word_offset_c = word_offset_r;
    word_count_c = word_count_r;
    //tlp type
    is_cpl_c = is_cpl_r;
    is_np_c = is_np_r;
    is_p_c = is_p_r;
    //
    crc_in_c = crc_in_r;
    last_c1 = last_r1;
    tlp_is_first_c = tlp_is_first_r;
    next_transmit_seq_c = next_transmit_seq_r;
    //TODO: simplify this logic
    if (s_axis_skid_tready || s_bypass_tready) begin
      m_axis_tkeep_c1  = s_axis_skid_tkeep;
      m_axis_tlast_c1  = s_axis_skid_tlast;
      m_axis_tuser_c1  = s_axis_skid_tuser;
      m_axis_tvalid_c1 = s_axis_skid_tvalid;
      if (s_axis_skid_tvalid || m_axis_tlast_r1 || m_axis_tlast_r2) begin
        tlp_data_c1 = s_axis_skid_tdata;
        if (tlp_is_first_r) begin
          is_cpl_c  =  '0;
          is_np_c   =  '0;
          is_p_c    =  '0;
          last_c1 = '0;
          //TODO:change to shift at some point
          word_offset_c = retry_index_i * MaxNumWordsPerTLP;
          word_count_c = 8'h1;
          m_axis_tdata_c1 = {s_axis_skid_tdata[15:0], 4'h0,next_transmit_seq_r[11:0]};
          tlp_is_first_c = '0;
          //check tlp type
          if (((s_axis_skid_tdata[7:0] == Cpl) || (s_axis_skid_tdata[7:0] == CplD))
              && have_p_credit_r)
          begin
            is_cpl_c = '1;
          end
          else if (((s_axis_skid_tdata[7:0]  == MW) || (s_axis_skid_tdata[7:0]  == CW0) ||
                    (s_axis_skid_tdata[7:0] == CW1))  && have_p_credit_r)
          begin
            is_p_c = '1;
          end else if (have_np_credit_r) begin
            is_np_c = '1;
          end
        end else begin
          crc_in_c = crc_out16;
          m_axis_tdata_c1 = {s_axis_skid_tdata[15:0], tlp_data_r1[31:16]};
          m_axis_tvalid_c1 = '1;
          word_count_c = word_count_r + 1;
          if(m_axis_tlast_r3) begin
            tlp_is_first_c = '1;
            s_axis_skid_tready = '0;
          end
          if ((m_axis_tlast_r1 || m_axis_tlast_r2)) begin
            s_axis_skid_tready = '0;
          end
          if (m_axis_tlast_r2) begin
            crc_in_c = '1;
            case (m_axis_tkeep_r2)
              4'b0111: begin
                m_axis_tdata_c1 = {8'h0, crc_reversed[31:24]};
                crc_select = 2'b10;
                last_c1 = '1;
                m_axis_tkeep_c1 = 4'b0001;
                m_axis_tvalid_c1 = '1;
              end
              4'b1111: begin
                m_axis_tdata_c1 = {16'h0, crc_reversed[31:16]};
                crc_select = 2'b10;
                last_c1 = '1;
                m_axis_tkeep_c1 = 4'b0011;
                m_axis_tvalid_c1 = '1;
              end
              default: begin
              end
            endcase
          end
        end
      end
    end

  end


  always_comb begin : tlp_transmit_stage2
    m_axis_tdata_c2 = m_axis_tdata_r2;
    m_axis_tkeep_c2 = m_axis_tkeep_r2;
    m_axis_tvalid_c2 = m_axis_tvalid_r2;
    m_axis_tlast_c2 = m_axis_tlast_r2;
    m_axis_tuser_c2 = m_axis_tuser_r2;
    last_c2 = last_r2;
    if (s_axis_skid_tready || s_bypass_tready) begin
      m_axis_tdata_c2  = m_axis_tdata_r1;
      m_axis_tkeep_c2  = m_axis_tkeep_r1;
      m_axis_tvalid_c2 = m_axis_tvalid_r1;
      m_axis_tlast_c2  = m_axis_tlast_r1;
      m_axis_tuser_c2  = m_axis_tuser_r1;
      if (m_axis_tvalid_r1) begin
        m_axis_tdata_c2 = m_axis_tdata_r1;
        last_c2 = last_r1;
        if (m_axis_tlast_r2) begin
          case (m_axis_tkeep_r2)
            4'b0011: begin
              m_axis_tdata_c2 = crc_reversed;
            end
            4'b0111: begin
              m_axis_tdata_c2 = {crc_reversed[23:0], m_axis_tdata_r1[7:0]};
            end
            4'b1111: begin
              m_axis_tdata_c2 = {crc_reversed[15:0], m_axis_tdata_r1[15:0]};
            end
            default: begin
            end
          endcase
        end
      end
    end
  end



  always_comb begin : tlp_transmit_stage3
    m_axis_tdata_c3  = m_axis_tdata_r3;
    m_axis_tkeep_c3  = m_axis_tkeep_r3;
    m_axis_tvalid_c3 = m_axis_tvalid_r3;
    m_axis_tlast_c3  = m_axis_tlast_r3;
    m_axis_tuser_c3  = m_axis_tuser_r3;
    last_c3          = last_r3;
    dllp_valid_o     = '0;
    bram_wr_o        = '0;
    bram_addr_o      = '0;
    bram_data_out_o  = '0;
    //wait for upside to accept tlp
    if (s_axis_skid_tready || s_bypass_tready) begin
      m_axis_tdata_c3  = m_axis_tdata_r2;
      m_axis_tkeep_c3  = '1;
      m_axis_tvalid_c3 = m_axis_tvalid_r2;
      m_axis_tlast_c3  = '0;
      m_axis_tuser_c3  = m_axis_tuser_r2;

      if(m_axis_tlast_r3) begin
        bram_addr_o        = word_offset_r;
        bram_wr_o          = '1;
        bram_data_out_o    = {15'h0,m_axis_tkeep_r3,word_count_r[15:0]};
      end
      //set last
      if (m_axis_tvalid_r2) begin
        bram_addr_o        = word_count_r + word_offset_r;
        bram_wr_o          = '1;
        bram_data_out_o    = m_axis_tdata_c3;
        if (last_r2) begin
          m_axis_tkeep_c3 = m_axis_tkeep_r2;
          m_axis_tlast_c3 = '1;
          dllp_valid_o = '1;
        end
      end
    end
  end


  always_comb begin : flow_contol

    ph_credits_consumed_c = ph_credits_consumed_r;
    pd_credits_consumed_c = pd_credits_consumed_r;
    nph_credits_consumed_c = nph_credits_consumed_r;
    npd_credits_consumed_c = npd_credits_consumed_r;

    max_payload_size_fc_c = 9'd8 << (MAX_PAYLOAD_SIZE);
    have_p_credit_c  = (tx_fc_ph_i > ph_credits_consumed_r ? (tx_fc_ph_i - ph_credits_consumed_r) > 1: 
    (ph_credits_consumed_r - tx_fc_ph_i) > 1 ) & (tx_fc_pd_i > pd_credits_consumed_r) ? 
    (tx_fc_pd_i - pd_credits_consumed_r) > max_payload_size_fc_c :
    (pd_credits_consumed_r - pd_credits_consumed_r) > 1;
    // ((tx_fc_ph_i - ph_credits_consumed_r)> 8) &&
    //                  ((tx_fc_pd_i - pd_credits_consumed_r)> (max_payload_size_fc_c << 1));
    have_np_credit_c = (tx_fc_nph_i - nph_credits_consumed_r) > 8;

    if (dllp_valid_o) begin
      //header with data
      if (is_p_r) begin
        ph_credits_consumed_c = ph_credits_consumed_r + 4;
        pd_credits_consumed_c = pd_credits_consumed_r + (word_count_r - 5);
      end else if (is_np_r) begin  //no data
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


  pcie_lcrc16 tlp_crc16_inst (
      .data  (m_axis_tdata_r1),
      .crcIn (crc_in_r),
      .select(crc_select),
      .crcOut(crc_out16)
  );


  assign m_axis_tdata_o  = m_axis_tdata_r3;
  assign m_axis_tkeep_o  = m_axis_tkeep_r3;
  assign m_axis_tvalid_o = m_axis_tvalid_r3;
  assign m_axis_tlast_o  = m_axis_tlast_r3;
  assign m_axis_tuser_o  = m_axis_tuser_r3;
  assign seq_num_o       = next_transmit_seq_r;


endmodule
