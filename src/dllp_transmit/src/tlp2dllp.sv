module tlp2dllp
  import pcie_datalink_pkg::*;
#(
    // Width of AXI stream interfaces in bits
    parameter int DATA_WIDTH = 32,
    // tkeep signal width (words per cycle)
    parameter int KEEP_WIDTH = (DATA_WIDTH / 8),
    parameter int USER_WIDTH = 1,
    parameter int S_COUNT = 1,
    parameter int MAX_PAYLOAD_SIZE = 0,
    parameter int RAM_DATA_WIDTH = DATA_WIDTH,  // width of the data
    parameter int RAM_ADDR_WIDTH = $clog2(MaxNumWordsPerTLP),  // number of address bits
    parameter int MaxBytesPerTLP = 8 << (4 + MAX_PAYLOAD_SIZE),
    parameter int MaxNumWordsPerHdr = 128 / DATA_WIDTH,
    parameter int MaxNumWordsPerTLP = (MaxBytesPerTLP / (DATA_WIDTH / 8)) + MaxNumWordsPerHdr + 2
) (
    input  logic                      clk_i,              // Clock signal
    input  logic                      rst_i,              // Reset signal
    /*
      * TLP AXIS inputs
      */
    input  logic [    DATA_WIDTH-1:0] s_axis_tdata,
    input  logic [    KEEP_WIDTH-1:0] s_axis_tkeep,
    input  logic [       S_COUNT-1:0] s_axis_tvalid,
    input  logic [       S_COUNT-1:0] s_axis_tlast,
    input  logic [    USER_WIDTH-1:0] s_axis_tuser,
    output logic [       S_COUNT-1:0] s_axis_tready,
    /*
      * TLP AXI output
      */
    output logic [    DATA_WIDTH-1:0] m_axis_tdata,
    output logic [    KEEP_WIDTH-1:0] m_axis_tkeep,
    output logic                      m_axis_tvalid,
    output logic                      m_axis_tlast,
    output logic [    USER_WIDTH-1:0] m_axis_tuser,
    input  logic                      m_axis_tready,
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
    // Flow control
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

  dll_tx_st_e                  curr_state;
  dll_tx_st_e                  next_state;


  //replay signals
  logic       [          31:0] word_offset_c;
  logic       [          31:0] word_offset_r;
  //transmit sequence logic
  logic       [          11:0] next_transmit_seq_c;
  logic       [          11:0] next_transmit_seq_r;
  logic       [          11:0] ackd_transmit_seq_c;
  logic       [          11:0] ackd_transmit_seq_r;
  //skid buffer axis stage1 signals
  logic       [DATA_WIDTH-1:0] skid_axis_tdata;
  logic       [KEEP_WIDTH-1:0] skid_axis_tkeep;
  logic                        skid_axis_tvalid;
  logic                        skid_axis_tlast;
  logic       [USER_WIDTH-1:0] skid_axis_tuser;
  logic                        skid_axis_tready;
  //skid buffer axis signals
  logic       [DATA_WIDTH-1:0] tlp_axis_tdata;
  logic       [KEEP_WIDTH-1:0] tlp_axis_tkeep;
  logic                        tlp_axis_tvalid;
  logic                        tlp_axis_tlast;
  logic       [USER_WIDTH-1:0] tlp_axis_tuser;
  logic                        tlp_axis_tready;
  //crc helper signals
  logic       [          31:0] word_count_c;
  logic       [          31:0] crc_in_c;
  logic       [          31:0] dllp_lcrc_c;
  logic       [          31:0] word_count_r;
  logic       [          31:0] crc_in_r;
  logic       [          31:0] dllp_lcrc_r;
  logic       [          31:0] crc_out;
  logic       [          31:0] crc_out16;
  logic       [          31:0] crc_out32;
  logic       [           1:0] crc_select;
  logic       [          31:0] crc_reversed;
  logic       [          15:0] dllp_crc_out;
  logic       [          15:0] dllp_crc_reversed;
  //tlp nulled
  logic       [KEEP_WIDTH-1:0] keep_c;
  logic       [KEEP_WIDTH-1:0] keep_r;
  logic                        tlp_nullified_c;
  logic                        tlp_nullified_r;
  logic                        tlp_is_first_c;
  logic                        tlp_is_first_r;
  // logic s_axis_tready_o, tx_tlp_ready_r;
  logic                        tlp_ack;
  //packet shift data
  logic       [DATA_WIDTH-1:0] tlp_data_c1;
  logic       [DATA_WIDTH-1:0] tlp_data_r1;
  //tlp type signals
  logic                        is_cpl_c;
  logic                        is_cpl_r;
  logic                        is_np_c;
  logic                        is_np_r;
  logic                        is_p_c;
  logic                        is_p_r;
  //flow control
  logic       [           8:0] max_payload_size_fc_c;
  logic       [           8:0] max_payload_size_fc_r;
  logic                        have_p_credit_c;
  logic                        have_p_credit_r;
  logic                        have_np_credit_c;
  logic                        have_np_credit_r;
  //credits consumed
  logic       [           7:0] ph_credits_consumed_c;
  logic       [          11:0] pd_credits_consumed_c;
  logic       [           7:0] nph_credits_consumed_c;
  logic       [          11:0] npd_credits_consumed_c;
  logic       [           7:0] ph_credits_consumed_r;
  logic       [          11:0] pd_credits_consumed_r;
  logic       [           7:0] nph_credits_consumed_r;
  logic       [          11:0] npd_credits_consumed_r;


  always @(posedge clk_i) begin
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
      keep_r                 <= '0;
      //tlp type
      is_cpl_r               <= '0;
      is_np_r                <= '0;
      is_p_r                 <= '0;
      //credits tracking
      ph_credits_consumed_r  <= '0;
      pd_credits_consumed_r  <= '0;
      nph_credits_consumed_r <= '0;
      npd_credits_consumed_r <= '0;
    end else begin
      curr_state             <= next_state;
      next_transmit_seq_r    <= next_transmit_seq_c;
      //crc signals
      word_count_r           <= word_count_c;
      crc_in_r               <= crc_in_c;
      word_offset_r          <= word_offset_c;
      keep_r                 <= keep_c;
      //flow control
      max_payload_size_fc_r  <= max_payload_size_fc_c;
      have_p_credit_r        <= have_p_credit_c;
      have_np_credit_r       <= have_np_credit_c;
      //tlp type
      is_cpl_r               <= is_cpl_c;
      is_np_r                <= is_np_c;
      is_p_r                 <= is_p_c;
      //credits tracking
      ph_credits_consumed_r  <= ph_credits_consumed_c;
      pd_credits_consumed_r  <= pd_credits_consumed_c;
      nph_credits_consumed_r <= nph_credits_consumed_c;
      npd_credits_consumed_r <= npd_credits_consumed_c;
    end
    //non resetable
    tlp_data_r1 <= tlp_data_c1;
  end


  always_comb begin : byteswap
    for (int i = 0; i < 8; i++) begin
      crc_out32[i]       = crc_in_r[7-i];
      crc_out32[i+8]     = crc_in_r[15-i];
      crc_out32[i+16]    = crc_in_r[23-i];
      crc_out32[i+24]    = crc_in_r[31-i];
      crc_reversed[i]    = crc_out16[7-i];
      crc_reversed[i+8]  = crc_out16[15-i];
      crc_reversed[i+16] = crc_out16[23-i];
      crc_reversed[i+24] = crc_out16[31-i];
    end
  end


  always_comb begin : main_seq
    tlp_axis_tdata      = '0;
    tlp_axis_tkeep      = '0;
    tlp_axis_tvalid     = '0;
    tlp_axis_tlast      = '0;
    tlp_axis_tuser      = 4'h2;
    next_state          = curr_state;
    //tlp holder
    tlp_data_c1         = tlp_data_r1;
    crc_select          = '1;
    keep_c              = keep_r;
    //word addr
    word_offset_c       = word_offset_r;
    //tlp type
    is_cpl_c            = is_cpl_r;
    is_np_c             = is_np_r;
    is_p_c              = is_p_r;
    crc_in_c            = crc_in_r;
    //retry handshake signals
    dllp_valid_o        = '0;
    bram_wr_o           = '0;
    bram_addr_o         = '0;
    bram_data_out_o     = '0;
    next_transmit_seq_c = next_transmit_seq_r;
    case (curr_state)
      ST_IDLE: begin
        crc_in_c         = '1;
        skid_axis_tready = tlp_axis_tready;
        //wait until pipeline is full and upstream ready
        if (tlp_axis_tready && skid_axis_tvalid) begin
          //store packet, because we're shifting the data to fit in
          //the seq number, we'll need to save 2 bytes of this packet
          tlp_data_c1    = skid_axis_tdata;
          word_offset_c  = retry_index_i * MaxNumWordsPerTLP;
          //assign seq number then first 2 bytes of tlp
          tlp_axis_tdata = {skid_axis_tdata[15:0], 4'h0, next_transmit_seq_r[11:0]};
          tlp_axis_tkeep = '1;
          //check tlp type
          if (((skid_axis_tdata[7:0] == Cpl) || (skid_axis_tdata[7:0] == CplD))
              && have_p_credit_r)
          begin
            //tlp is completion
            is_cpl_c = '1;
          end
          else if (((skid_axis_tdata[7:0]  ==? MW) || (skid_axis_tdata[7:0]  == CW0) ||
                    (skid_axis_tdata[7:0] == CW1))  && have_p_credit_r)
          begin
            //tlp is payload
            is_p_c = '1;
          end else if (have_np_credit_r) begin
            //tlp is a no paylaod
            is_np_c = '1;
          end
          if (is_cpl_c || is_p_c || is_np_c) begin
            bram_addr_o     = word_count_r + word_offset_r + 1;
            bram_wr_o       = '1;
            bram_data_out_o = tlp_axis_tdata;
            word_count_c    = word_count_r + 1;
            crc_in_c        = crc_out16;
            tlp_axis_tvalid = skid_axis_tvalid;
            next_state      = ST_TLP_STREAM;
          end
        end
      end
      ST_TLP_STREAM: begin
        skid_axis_tready = tlp_axis_tready;
        //wait until pipeline is full and upstream ready
        //bypass if current packet is last
        if (tlp_axis_tready && skid_axis_tvalid) begin
          crc_in_c        = crc_out16;
          tlp_data_c1     = skid_axis_tdata;
          tlp_axis_tdata  = {skid_axis_tdata[15:0], tlp_data_r1[31:16]};
          tlp_axis_tkeep  = '1;
          tlp_axis_tvalid = skid_axis_tvalid;
          //update handshake
          bram_addr_o     = word_count_r + word_offset_r + 1;
          bram_wr_o       = '1;
          bram_data_out_o = tlp_axis_tdata;
          word_count_c    = word_count_r + 1;
          //check if packet is last
          if (skid_axis_tlast) begin
            keep_c = skid_axis_tkeep;
            //handle shift crc placement
            case (skid_axis_tkeep)
              4'b0001: begin
                tlp_axis_tdata = {crc_reversed[7:0], skid_axis_tdata[7:0], tlp_data_r1[31:16]};
                crc_select     = 2'b10;
              end
              default: begin
              end
            endcase
            next_state = ST_TLP_CRC;
          end
        end
      end
      ST_TLP_CRC: begin
        skid_axis_tready = '0;
        //wait until pipeline is full and upstream ready
        //bypass if current packet is last
        if (tlp_axis_tready) begin
          crc_in_c = crc_out16;
          tlp_axis_tkeep  = '1;
          //handle shift crc placement
          case (keep_r)
            //complete the rest of crc placement
            4'b0001: begin
              tlp_axis_tdata  = {8'h0, crc_out32[23:0]};
              tlp_axis_tkeep  = 4'b0111;
              tlp_axis_tlast  = '1;
              //update handshake
              bram_addr_o     = word_count_r + word_offset_r + 1;
              bram_wr_o       = '1;
              bram_data_out_o = tlp_axis_tdata;
              word_count_c    = word_count_r + 1;
              dllp_valid_o    = '1;
              next_state      = ST_TLP_LAST;
            end
            4'b0011: begin
              tlp_axis_tdata  = crc_out32;
              tlp_axis_tlast  = '1;
              tlp_axis_tvalid = '1;
              //update handshake
              bram_addr_o     = word_count_r + word_offset_r + 1;
              bram_wr_o       = '1;
              bram_data_out_o = tlp_axis_tdata;
              word_count_c    = word_count_r + 1;
              dllp_valid_o    = '1;
              next_state      = ST_TLP_LAST;
            end
            4'b0111: begin
              tlp_axis_tdata = {crc_reversed[23:0], tlp_data_r1[31:24]};
              crc_select     = 2'b00;
              next_state     = ST_TLP_CRC_ALIGN;
            end
            4'b1111: begin
              tlp_axis_tdata = {crc_reversed[15:0], tlp_data_r1[31:16]};
              crc_select     = 2'b01;
              next_state     = ST_TLP_CRC_ALIGN;
            end
            default: begin
            end
          endcase
        end
      end
      ST_TLP_CRC_ALIGN: begin
        skid_axis_tready = '0;
        //wait until pipeline is full and upstream ready
        //bypass if current packet is last
        if (tlp_axis_tready) begin
          crc_in_c = crc_out16;
          //handle shift crc placement
          case (keep_r)
            //final crc alignment if necessary
            4'b0111: begin
              tlp_axis_tdata  = {8'h0, crc_out32[31:24]};
              tlp_axis_tkeep  = 4'b0001;
              //update handshake
              bram_addr_o     = word_count_r + word_offset_r + 1;
              bram_wr_o       = '1;
              bram_data_out_o = tlp_axis_tdata;
              word_count_c    = word_count_r + 1;
              dllp_valid_o    = '1;
              next_state      = ST_TLP_LAST;
            end
            4'b1111: begin
              tlp_axis_tdata  = {8'h0, crc_out32[31:16]};
              tlp_axis_tkeep  = 4'b0011;
              //update handshake
              bram_addr_o     = word_count_r + word_offset_r + 1;
              bram_wr_o       = '1;
              bram_data_out_o = tlp_axis_tdata;
              word_count_c    = word_count_r + 1;
              dllp_valid_o    = '1;
              next_state      = ST_TLP_LAST;
            end
            default: begin
            end
          endcase
        end
      end
      ST_TLP_LAST: begin
        bram_addr_o         = word_offset_r;
        bram_wr_o           = '1;
        crc_in_c = '1;
        bram_data_out_o     = {15'h0, m_axis_tkeep, word_count_r[15:0]};
        word_count_c        = '0;
        is_cpl_c            = '0;
        is_np_c             = '0;
        is_p_c              = '0;
        next_transmit_seq_c = next_transmit_seq_r + 1'b1;
        next_state          = ST_IDLE;
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
    max_payload_size_fc_c = 9'd8 << (MAX_PAYLOAD_SIZE);
    have_p_credit_c         = (tx_fc_ph_i > ph_credits_consumed_r ?
  (tx_fc_ph_i - ph_credits_consumed_r) > 1: (ph_credits_consumed_r - tx_fc_ph_i) > 1 ) & (tx_fc_pd_i > pd_credits_consumed_r) ?
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
  ) axis_stage2_sregister_inst (
      .clk(clk_i),
      .rst(rst_i),
      .s_axis_tdata(s_axis_tdata),
      .s_axis_tkeep(s_axis_tkeep),
      .s_axis_tvalid(s_axis_tvalid),
      .s_axis_tready(s_axis_tready),
      .s_axis_tlast(s_axis_tlast),
      .s_axis_tid('0),
      .s_axis_tdest('0),
      .s_axis_tuser(s_axis_tuser),
      .m_axis_tdata(skid_axis_tdata),
      .m_axis_tkeep(skid_axis_tkeep),
      .m_axis_tvalid(skid_axis_tvalid),
      .m_axis_tready(skid_axis_tready),
      .m_axis_tlast(skid_axis_tlast),
      .m_axis_tid(),
      .m_axis_tdest(),
      .m_axis_tuser(skid_axis_tuser)
  );


  // axis skid buffer
  // axis_register #(
  // .DATA_WIDTH(DATA_WIDTH),
  // .KEEP_ENABLE('1),
  // .KEEP_WIDTH(KEEP_WIDTH),
  // .LAST_ENABLE('1),
  // .ID_ENABLE('0),
  // .ID_WIDTH(1),
  // .DEST_ENABLE('0),
  // .DEST_WIDTH(1),
  // .USER_ENABLE('1),
  // .USER_WIDTH(3),
  // .REG_TYPE(SkidBuffer)
  // ) axis_stage2_register_inst (
  // .clk(clk_i),
  // .rst(rst_i),
  // .s_axis_tdata( skid_axis_tdata),
  // .s_axis_tkeep( skid_axis_tkeep),
  // .s_axis_tvalid(skid_axis_tvalid),
  // .s_axis_tready(skid_axis_tready),
  // .s_axis_tlast( skid_axis_tlast),
  // .s_axis_tid('0),
  // .s_axis_tdest('0),
  // .s_axis_tuser( skid_axis_tuser),
  // .m_axis_tdata( tlp_axis_tdata),
  // .m_axis_tkeep( tlp_axis_tkeep),
  // .m_axis_tvalid(tlp_axis_tvalid),
  // .m_axis_tready(tlp_axis_tready),
  // .m_axis_tlast( tlp_axis_tlast),
  // .m_axis_tid(),
  // .m_axis_tdest(),
  // .m_axis_tuser(tlp_axis_tuser)
  // );


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
  ) axis_output_register_inst (
      .clk(clk_i),
      .rst(rst_i),
      .s_axis_tdata(tlp_axis_tdata),
      .s_axis_tkeep(tlp_axis_tkeep),
      .s_axis_tvalid(tlp_axis_tvalid),
      .s_axis_tready(tlp_axis_tready),
      .s_axis_tlast(tlp_axis_tlast),
      .s_axis_tid('0),
      .s_axis_tdest('0),
      .s_axis_tuser(tlp_axis_tuser),
      .m_axis_tdata(m_axis_tdata),
      .m_axis_tkeep(m_axis_tkeep),
      .m_axis_tvalid(m_axis_tvalid),
      .m_axis_tready(m_axis_tready),
      .m_axis_tlast(m_axis_tlast),
      .m_axis_tid(),
      .m_axis_tdest(),
      .m_axis_tuser(m_axis_tuser)
  );


  pcie_lcrc16 tlp_crc16_inst (
      .data  (tlp_axis_tdata),
      .crcIn (crc_in_r),
      .select(crc_select),
      .crcOut(crc_out16)
  );


  // assign m_axis_tdata  = m_axis_tdata_r3;
  // assign m_axis_tkeep  = m_axis_tkeep_r3;
  // assign m_axis_tvalid = m_axis_tvalid_r3;
  // assign m_axis_tlast  = m_axis_tlast_r3;
  // assign m_axis_tuser  = m_axis_tuser_r3;
  assign seq_num_o = next_transmit_seq_r;


endmodule
