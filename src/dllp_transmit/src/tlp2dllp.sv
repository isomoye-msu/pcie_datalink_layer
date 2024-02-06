//!module: tlp2dllp
//! Author: Idris Somoye
//! Module accepts TLPs from the transaction layer and converts them into
//! DLLPs to be sent to the phy.
module tlp2dllp
  import pcie_datalink_pkg::*;
#(
    parameter int USER_WIDTH        = 1,
    parameter int S_COUNT           = 1,
    parameter int DATA_WIDTH        = 32,                  // Width of AXI stream interfaces in bits
    parameter int MAX_PAYLOAD_SIZE  = 0,
    parameter int MaxNumWordsPerHdr = (128 / DATA_WIDTH),
    parameter int KEEP_WIDTH        = ((DATA_WIDTH) / 8),  // tkeep signal width (words per cycle)
    parameter int RAM_DATA_WIDTH    = DATA_WIDTH,          // width of the data

    parameter int MaxBytesPerTLP = MAX_PAYLOAD_SIZE,
    parameter int RAM_ADDR_WIDTH = $clog2(MaxNumWordsPerTLP),  // number of address bits
    parameter int MaxNumWordsPerTLP = (MaxBytesPerTLP / (DATA_WIDTH / 8)) + MaxNumWordsPerHdr + 2
) (
    input  logic                  clk_i,              // Clock signal
    input  logic                  rst_i,              // Reset signal
    //TLP AXIS inputs
    input  logic [DATA_WIDTH-1:0] s_axis_tdata,
    input  logic [KEEP_WIDTH-1:0] s_axis_tkeep,
    input  logic                  s_axis_tvalid,
    input  logic                  s_axis_tlast,
    input  logic [USER_WIDTH-1:0] s_axis_tuser,
    output logic                  s_axis_tready,
    //TLP AXI output
    output logic [DATA_WIDTH-1:0] m_axis_tdata,
    output logic [KEEP_WIDTH-1:0] m_axis_tkeep,
    output logic                  m_axis_tvalid,
    output logic                  m_axis_tlast,
    output logic [USER_WIDTH-1:0] m_axis_tuser,
    input  logic                  m_axis_tready,
    //seq number.. handshake with phy layer
    output logic [          15:0] seq_num_o,
    output logic                  dllp_valid_o,
    //retry management
    input  logic                  retry_available_i,
    input  logic [           7:0] retry_index_i,
    // Flow control
    input  logic [           7:0] tx_fc_ph_i,
    input  logic [          11:0] tx_fc_pd_i,
    input  logic [           7:0] tx_fc_nph_i,
    input  logic [          11:0] tx_fc_npd_i,
    input  logic                  update_fc_i

);

  parameter int FcPldSize = MAX_PAYLOAD_SIZE >> 4;

  //tlp to dllp fsm emum
  typedef enum logic [2:0] {
    ST_IDLE,
    ST_TLP_STREAM,
    ST_TLP_CRC,
    ST_TLP_CRC_ALIGN,
    ST_TLP_CRC_TLAST_ALIGN,
    ST_TLP_LAST,
    ST_CHECK_CREDITS
  } dll_tx_st_e;

  //fsm holder signals
  dll_tx_st_e                  curr_state;
  dll_tx_st_e                  next_state;
  //replay signals
  logic       [          31:0] word_count_c;
  logic       [          31:0] word_count_r;
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
  //flow buffer axis stage1 signals
  logic       [DATA_WIDTH-1:0] pipeline_axis_tdata;
  logic       [KEEP_WIDTH-1:0] pipeline_axis_tkeep;
  logic                        pipeline_axis_tvalid;
  logic                        pipeline_axis_tlast;
  logic       [USER_WIDTH-1:0] pipeline_axis_tuser;
  logic                        pipeline_axis_tready;
  //tlp output buffer axis signals
  logic       [DATA_WIDTH-1:0] tlp_axis_tdata;
  logic       [KEEP_WIDTH-1:0] tlp_axis_tkeep;
  logic                        tlp_axis_tvalid;
  logic                        tlp_axis_tlast;
  logic       [USER_WIDTH-1:0] tlp_axis_tuser;
  logic                        tlp_axis_tready;
  //crc helper signals
  logic       [          31:0] crc_in_c;
  logic       [          31:0] dllp_lcrc_c;
  logic       [          31:0] crc_in_r;
  logic       [          31:0] dllp_lcrc_r;
  logic       [          31:0] crc_out;
  logic       [          31:0] crc_out16;
  logic       [           1:0] crc_select;
  logic       [          31:0] crc_reversed;
  logic       [          15:0] dllp_crc_out;
  logic       [          15:0] dllp_crc_reversed;
  //tlp nulled
  logic                        tlp_nullified_c;
  logic                        tlp_nullified_r;
  logic                        tlp_ack;
  //tlp type signals
  logic                        tlp_is_cpl_c;
  logic                        tlp_is_cpl_r;
  logic                        tlp_no_payload_c;
  logic                        tlp_no_payload_r;
  logic                        tlp_is_payload_c;
  logic                        tlp_is_payload_r;
  //flow control
  logic                        payload_credit_available_c;
  logic                        payload_credit_available_r;
  logic                        have_np_credit_c;
  logic                        have_np_credit_r;
  //credits consumed
  logic       [           7:0] payload_header_credits_consumed_c;
  logic       [           7:0] payload_header_credits_consumed_r;
  logic       [          11:0] pd_credits_consumed_c;
  logic       [          11:0] pd_credits_consumed_r;
  logic       [          11:0] npd_credits_consumed_c;
  logic       [          11:0] npd_credits_consumed_r;
  logic       [           7:0] no_payload_header_credits_consumed_c;
  logic       [           7:0] no_payload_header_credits_consumed_r;


  //Flow control
  logic       [           7:0] ph_credit_limit_c;
  logic       [           7:0] ph_credit_limit_r;
  logic       [          11:0] pd_credit_limit_c;
  logic       [          11:0] pd_credit_limit_r;
  logic       [           7:0] nph_credit_limit_c;
  logic       [           7:0] nph_credit_limit_r;
  logic       [          11:0] npd_credit_limit_c;
  logic       [          11:0] npd_credit_limit_r;




  always @(posedge clk_i) begin
    if (rst_i) begin
      curr_state                           <= ST_IDLE;
      next_transmit_seq_r                  <= '0;
      crc_in_r                             <= '1;
      payload_credit_available_r           <= '0;
      have_np_credit_r                     <= '0;
      tlp_is_cpl_r                         <= '0;
      tlp_no_payload_r                     <= '0;
      tlp_is_payload_r                     <= '0;
      payload_header_credits_consumed_r    <= '0;
      pd_credits_consumed_r                <= '0;
      no_payload_header_credits_consumed_r <= '0;
      npd_credits_consumed_r               <= '0;
      ph_credit_limit_r                    <= '0;
      pd_credit_limit_r                    <= '0;
      nph_credit_limit_r                   <= '0;
      npd_credit_limit_r                   <= '0;
    end else begin
      curr_state                           <= next_state;
      next_transmit_seq_r                  <= next_transmit_seq_c;
      word_count_r                         <= word_count_c;
      crc_in_r                             <= crc_in_c;
      payload_credit_available_r           <= payload_credit_available_c;
      have_np_credit_r                     <= have_np_credit_c;
      tlp_is_cpl_r                         <= tlp_is_cpl_c;
      tlp_no_payload_r                     <= tlp_no_payload_c;
      tlp_is_payload_r                     <= tlp_is_payload_c;
      payload_header_credits_consumed_r    <= payload_header_credits_consumed_c;
      pd_credits_consumed_r                <= pd_credits_consumed_c;
      no_payload_header_credits_consumed_r <= no_payload_header_credits_consumed_c;
      npd_credits_consumed_r               <= npd_credits_consumed_c;
      ph_credit_limit_r                    <= ph_credit_limit_c;
      pd_credit_limit_r                    <= pd_credit_limit_c;
      nph_credit_limit_r                   <= nph_credit_limit_c;
      npd_credit_limit_r                   <= npd_credit_limit_c;
    end
  end

  //combinatarial block to byteswap the crc.
  always_comb begin : byteswap
    for (int i = 0; i < 8; i++) begin
      crc_reversed[i]    = crc_in_r[7-i];
      crc_reversed[i+8]  = crc_in_r[15-i];
      crc_reversed[i+16] = crc_in_r[23-i];
      crc_reversed[i+24] = crc_in_r[31-i];
    end
  end


  always_comb begin : main_seq
    next_state          = curr_state;
    tlp_axis_tdata      = '0;
    tlp_axis_tkeep      = '0;
    tlp_axis_tvalid     = '0;
    tlp_axis_tlast      = '0;
    tlp_axis_tuser      = 4'h2;
    crc_select          = '1;
    tlp_is_cpl_c        = tlp_is_cpl_r;
    tlp_no_payload_c    = tlp_no_payload_r;
    tlp_is_payload_c    = tlp_is_payload_r;
    crc_in_c            = crc_in_r;
    dllp_valid_o        = '0;
    next_transmit_seq_c = next_transmit_seq_r;
    case (curr_state)
      //wait until pipeline is full and upstream ready
      //store packet, because we're shifting the data to fit in
      //the seq number, we'll need to save 2 bytes of this packet
      ST_IDLE: begin
        crc_in_c = '1;
        if (tlp_axis_tready && skid_axis_tvalid) begin
          //assign seq number then first 2 bytes of tlp
          tlp_axis_tdata = {skid_axis_tdata[15:0], 4'h0, next_transmit_seq_r[11:0]};
          tlp_axis_tkeep = '1;
          if (((skid_axis_tdata[7:0] == Cpl) || (skid_axis_tdata[7:0] == CplD))  //check tlp type
              && payload_credit_available_r) begin
            tlp_is_cpl_c = '1;  //tlp is completion
          end
          else if (((skid_axis_tdata[7:0]  ==? MW) || (skid_axis_tdata[7:0]  == CW0) ||
                    (skid_axis_tdata[7:0] == CW1)))
          begin
            //check if credit is available
            if (payload_credit_available_r) begin
              tlp_is_payload_c = '1;  //tlp is payload
            end
          end else if (have_np_credit_r) begin
            tlp_no_payload_c = '1;  //tlp is a no paylaod
          end
          if (tlp_is_cpl_c || tlp_is_payload_c || tlp_no_payload_c) begin
            word_count_c     = word_count_r + 1;
            crc_in_c         = crc_out16;
            tlp_axis_tvalid  = skid_axis_tvalid;
            skid_axis_tready = '1;
            next_state       = ST_TLP_STREAM;
          end
        end
      end
      //wait until pipeline is full and upstream ready
      //bypass if current packet is last
      ST_TLP_STREAM: begin
        skid_axis_tready = tlp_axis_tready;
        if (tlp_axis_tready && skid_axis_tvalid) begin
          crc_in_c        = crc_out16;
          tlp_axis_tdata  = {skid_axis_tdata[15:0], pipeline_axis_tdata[31:16]};
          tlp_axis_tkeep  = '1;
          tlp_axis_tvalid = skid_axis_tvalid;
          word_count_c    = word_count_r + 1;
          if (skid_axis_tlast) begin  //check if packet is last
            case (skid_axis_tkeep)  //handle shift crc placement
              4'b0001: begin
                tlp_axis_tvalid = '0;
                tlp_axis_tdata  = {8'h0, skid_axis_tdata[7:0], pipeline_axis_tdata[31:16]};
                crc_select      = 2'b10;
              end
              default: begin
              end
            endcase
            next_state = ST_TLP_CRC;
          end
        end
      end
      //wait until pipeline is full and upstream ready
      //bypass if current packet is last
      ST_TLP_CRC: begin
        skid_axis_tready = '0;
        if (tlp_axis_tready) begin
          crc_in_c       = crc_out16;
          tlp_axis_tkeep = '1;
          next_state     = ST_TLP_CRC_ALIGN;
          //handle shift crc placement
          //complete the rest of crc placement
          case (pipeline_axis_tkeep)
            4'b0001: begin
              crc_in_c        = crc_in_r;
              tlp_axis_tdata  = {crc_reversed[7:0], pipeline_axis_tdata[23:0]};
              tlp_axis_tvalid = '1;
              word_count_c    = word_count_r + 1;
            end
            4'b0011: begin
              tlp_axis_tdata  = crc_reversed;
              tlp_axis_tlast  = '1;
              tlp_axis_tvalid = '1;
              word_count_c    = word_count_r + 1;
              dllp_valid_o    = '1;
              next_state      = ST_TLP_LAST;
            end
            4'b0111: begin
              tlp_axis_tdata = {24'h0, pipeline_axis_tdata[31:24]};
              crc_select     = 2'b00;
            end
            4'b1111: begin
              tlp_axis_tdata = {16'h0, pipeline_axis_tdata[31:16]};
              crc_select     = 2'b01;
            end
            default: begin
            end
          endcase
        end
      end
      ST_TLP_CRC_ALIGN: begin
        skid_axis_tready = '0;
        //wait for upstream ready
        if (tlp_axis_tready) begin
          tlp_axis_tkeep = '1;
          tlp_axis_tvalid = '1;
          word_count_c = word_count_r + 1;
          case (pipeline_axis_tkeep)  //handle shift crc placement
            4'b0001: begin
              tlp_axis_tdata = {8'h0, crc_reversed[31:8]};
              tlp_axis_tkeep = 4'b0111;
              tlp_axis_tlast = '1;
              dllp_valid_o   = '1;
              next_state     = ST_TLP_LAST;
            end
            4'b0111: begin
              tlp_axis_tdata = {crc_reversed[23:0], pipeline_axis_tdata[31:24]};
              crc_select     = 2'b00;
              next_state     = ST_TLP_CRC_TLAST_ALIGN;
            end
            4'b1111: begin
              tlp_axis_tdata = {crc_reversed[15:0], pipeline_axis_tdata[31:16]};
              crc_select     = 2'b01;
              next_state     = ST_TLP_CRC_TLAST_ALIGN;
            end
            default: begin
            end
          endcase
        end
      end
      ST_TLP_CRC_TLAST_ALIGN: begin
        skid_axis_tready = '0;
        if (tlp_axis_tready) begin  //wait for upstream ready
          tlp_axis_tkeep  = '1;
          tlp_axis_tvalid = '1;
          //handle shift crc placement
          //final crc alignment if necessary
          case (pipeline_axis_tkeep)
            4'b0111: begin
              tlp_axis_tdata = {8'h0, crc_reversed[31:24]};
              tlp_axis_tkeep = 4'b0001;
              tlp_axis_tlast = '1;
              word_count_c   = word_count_r + 1;
              dllp_valid_o   = '1;
              next_state     = ST_TLP_LAST;
            end
            4'b1111: begin
              tlp_axis_tdata = {8'h0, crc_reversed[31:16]};
              tlp_axis_tkeep = 4'b0011;
              tlp_axis_tlast = '1;
              word_count_c   = word_count_r + 1;
              dllp_valid_o   = '1;
              next_state     = ST_TLP_LAST;
            end
            default: begin
            end
          endcase
        end
      end
      ST_TLP_LAST: begin
        crc_in_c            = '1;
        word_count_c        = '0;
        tlp_is_cpl_c        = '0;
        tlp_no_payload_c    = '0;
        tlp_is_payload_c    = '0;
        next_transmit_seq_c = next_transmit_seq_r + 1'b1;
        next_state          = ST_IDLE;
      end
      default: begin
      end
    endcase
  end

  always_comb begin : flow_contol
    payload_header_credits_consumed_c    = payload_header_credits_consumed_r;
    pd_credits_consumed_c                = pd_credits_consumed_r;
    no_payload_header_credits_consumed_c = no_payload_header_credits_consumed_r;
    npd_credits_consumed_c               = npd_credits_consumed_r;
    ph_credit_limit_c                    = ph_credit_limit_r;
    pd_credit_limit_c                    = pd_credit_limit_r;
    nph_credit_limit_c                   = nph_credit_limit_r;
    npd_credit_limit_c                   = npd_credit_limit_r;

    //check if flow control update
    if (update_fc_i) begin
      //update ph
      ph_credit_limit_c  = tx_fc_ph_i == ph_credit_limit_r ? ph_credit_limit_r : tx_fc_ph_i;
      //update nph
      nph_credit_limit_c = tx_fc_nph_i == nph_credit_limit_r ? nph_credit_limit_r : tx_fc_nph_i;
      //update pd
      pd_credit_limit_c  = tx_fc_pd_i == pd_credit_limit_r ? pd_credit_limit_r : tx_fc_pd_i;
      //update ph
      npd_credit_limit_c = tx_fc_npd_i == npd_credit_limit_r ? npd_credit_limit_r : tx_fc_npd_i;

    end
    //check credit availability
    have_np_credit_c = (tx_fc_nph_i - no_payload_header_credits_consumed_r) > 8;
    if (tx_fc_ph_i > payload_header_credits_consumed_r) begin
      payload_credit_available_c = (tx_fc_ph_i - payload_header_credits_consumed_r) > 1;
    end else begin
      if (((no_payload_header_credits_consumed_r - tx_fc_ph_i) > 1)
      && (tx_fc_pd_i > pd_credits_consumed_r)) begin
        payload_credit_available_c = (tx_fc_pd_i - pd_credits_consumed_r) > FcPldSize;
      end else begin
        payload_credit_available_c = (pd_credits_consumed_r - pd_credits_consumed_r) > 1;
      end
    end
    if (dllp_valid_o) begin
      //header with data
      if (tlp_is_payload_r) begin
        payload_header_credits_consumed_c = payload_header_credits_consumed_r + 1;
        pd_credits_consumed_c = pd_credits_consumed_r + (word_count_r - 5);
      end else if (tlp_no_payload_r) begin  //no data
        no_payload_header_credits_consumed_c = no_payload_header_credits_consumed_r + 1;
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
  ) axis_input_skid_inst (
      .clk(clk_i),
      .rst(rst_i),
      .s_axis_tdata(s_axis_tdata),
      .s_axis_tkeep(s_axis_tkeep),
      .s_axis_tvalid(s_axis_tvalid),
      .s_axis_tready(s_axis_tready),
      .s_axis_tlast(s_axis_tlast),
      .s_axis_tuser(s_axis_tuser),
      .s_axis_tid('0),
      .s_axis_tdest('0),
      .m_axis_tdata(skid_axis_tdata),
      .m_axis_tkeep(skid_axis_tkeep),
      .m_axis_tvalid(skid_axis_tvalid),
      .m_axis_tready(skid_axis_tready),
      .m_axis_tlast(skid_axis_tlast),
      .m_axis_tuser(skid_axis_tuser),
      .m_axis_tid(),
      .m_axis_tdest()
  );



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
  ) axis_input_flow_inst (
      .clk(clk_i),
      .rst(rst_i),
      .s_axis_tdata(skid_axis_tdata),
      .s_axis_tkeep(skid_axis_tkeep),
      .s_axis_tvalid(skid_axis_tvalid),
      .s_axis_tready(),
      .s_axis_tlast(skid_axis_tlast),
      .s_axis_tuser(skid_axis_tuser),
      .s_axis_tid('0),
      .s_axis_tdest('0),
      .m_axis_tdata(pipeline_axis_tdata),
      .m_axis_tkeep(pipeline_axis_tkeep),
      .m_axis_tvalid(pipeline_axis_tvalid),
      .m_axis_tready(skid_axis_tready),
      .m_axis_tlast(pipeline_axis_tlast),
      .m_axis_tuser(pipeline_axis_tuser),
      .m_axis_tid(),
      .m_axis_tdest()
  );



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

  assign seq_num_o = next_transmit_seq_r;


endmodule
