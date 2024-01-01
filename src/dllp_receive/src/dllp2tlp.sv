//! @title dllp2tlp
//! @author Idris Somoye
//! Module handles transaction layer packets recieved from the physical layer.
//! Packets intended for the tlp layer are decoded and sent through the tlp
//! master axis bus.
module dllp2tlp
  import pcie_datalink_pkg::*;
#(
    // TLP data width
    parameter int DATA_WIDTH = 32,
    // TLP strobe width
    parameter int STRB_WIDTH = DATA_WIDTH / 8,
    parameter int KEEP_WIDTH = STRB_WIDTH,
    parameter int USER_WIDTH = 1,
    parameter int MAX_PAYLOAD_SIZE = 0,
    parameter int RX_FIFO_SIZE = 2
) (
    //clocks and resets
    input  logic                               clk_i,                   // Clock signal
    input  logic                               rst_i,                   // Reset signal
    //link status
    input  pcie_dl_status_e                    link_status_i,
    //TLP AXIS inputs
    input  logic            [  DATA_WIDTH-1:0] s_axis_tdata,
    input  logic            [  KEEP_WIDTH-1:0] s_axis_tkeep,
    input  logic                               s_axis_tvalid,
    input  logic                               s_axis_tlast,
    input  logic            [  USER_WIDTH-1:0] s_axis_tuser,
    output logic                               s_axis_tready,
    //TLP dllp to phy AXIS Master
    output logic            [  DATA_WIDTH-1:0] m_axis_dllp2phy_tdata,
    output logic            [  KEEP_WIDTH-1:0] m_axis_dllp2phy_tkeep,
    output logic                               m_axis_dllp2phy_tvalid,
    output logic                               m_axis_dllp2phy_tlast,
    output logic            [  USER_WIDTH-1:0] m_axis_dllp2phy_tuser,
    input  logic                               m_axis_dllp2phy_tready,
    //TLP dllp to tlp layer AXI Master
    output logic            [(DATA_WIDTH)-1:0] m_axis_dllp2tlp_tdata,
    output logic            [(KEEP_WIDTH)-1:0] m_axis_dllp2tlp_tkeep,
    output logic                               m_axis_dllp2tlp_tvalid,
    output logic                               m_axis_dllp2tlp_tlast,
    output logic            [(USER_WIDTH)-1:0] m_axis_dllp2tlp_tuser,
    input  logic                               m_axis_dllp2tlp_tready
);
  /* verilator lint_off WIDTHEXPAND */
  /* verilator lint_off WIDTHTRUNC */
  localparam int SkidBuffer = 2;
  localparam int TlpAxis = 0;
  localparam int UserIsTlp = 1;
  localparam int MaxTlpHdrSizeDW = 4;
  localparam int MaxTlpTotalSizeDW = MaxTlpHdrSizeDW + (8 << (4 + MAX_PAYLOAD_SIZE)) + 1;
  localparam int MinRxBufferSize = MaxTlpTotalSizeDW * (RX_FIFO_SIZE);
  localparam int RamDataWidth = DATA_WIDTH;
  localparam int RamAddrWidth = $clog2(MinRxBufferSize);

  //dllp to tlp fsm emum
  typedef enum logic [4:0] {
    ST_DLL_RX_IDLE,
    ST_DLL_RX_SEQ_NUM,
    ST_DLL_RX_TLP,
    ST_DLL_EOP,
    ST_ACK_DLLP,
    ST_ACK_DLLP_CRC,
    ST_BUILD_FC_DLLP,
    ST_SEND_FC_DLLP,
    ST_SEND_FC_DLLP_CRC
  } dll_rx_st_e;



  //dllp to tlp fsm emum
  typedef enum logic [2:0] {
    ST_TLP_RX_IDLE,
    ST_TLP_GET_WD_CNT,
    ST_TLP_RX_STREAM,
    ST_TLP_RX_EOP
  } tlp_rx_st_e;

  dll_rx_st_e                             curr_state;
  dll_rx_st_e                             next_state;
  tlp_rx_st_e                             tlp_curr_state;
  tlp_rx_st_e                             tlp_next_state;
  dllp_union_t                            dll_packet;


  //tlp nulled
  logic                                   tlp_nullified_c;
  logic                                   tlp_nullified_r;
  logic                                   tx_tlp_ready_c;
  logic                                   tx_tlp_ready_r;
  logic        [                    31:0] tlp_in_c;
  logic        [                    31:0] tlp_in_r;
  //transmit sequence logic
  logic        [                    15:0] next_transmit_seq_c;
  logic        [                    15:0] next_transmit_seq_r;
  logic        [                    15:0] next_recv_seq_num_c;
  logic        [                    15:0] next_recv_seq_num_r;
  logic        [                    15:0] tkeep_c;
  logic        [                    15:0] tkeep_r;
  logic        [                    11:0] ackd_transmit_seq_c;
  logic        [                    15:0] ackd_transmit_seq_r;
  //fifo signals
  logic        [($clog2(RX_FIFO_SIZE)):0] fifo_tail_c;
  logic        [($clog2(RX_FIFO_SIZE)):0] fifo_tail_r;
  logic        [($clog2(RX_FIFO_SIZE)):0] fifo_head_c;
  logic        [($clog2(RX_FIFO_SIZE)):0] fifo_head_r;
  //crc helper signals
  logic        [                    31:0] crc_in_c;
  logic        [                    31:0] crc_in_r;
  logic        [                    31:0] crc_calc_c;
  logic        [                    31:0] crc_calc_r;
  logic        [                    31:0] crc_out16;
  logic        [                    31:0] crc_reversed;
  logic        [                    31:0] crc_out32;
  logic        [                    15:0] dllp_crc_out;
  logic        [                    15:0] dllp_crc_reversed;
  logic        [                    31:0] dllp_lcrc_c;
  logic        [                    31:0] dllp_lcrc_r;
  logic        [                     1:0] crc_select;
  //bram write signals
  logic                                   bram0_wr;
  logic        [        RamAddrWidth-1:0] bram0_addr;
  logic        [        RamDataWidth-1:0] bram0_data_in;
  logic        [        RamDataWidth-1:0] bram0_data_out;
  //bram read signals
  logic                                   bram1_wr;
  logic        [        RamAddrWidth-1:0] bram1_addr;
  logic        [        RamDataWidth-1:0] bram1_data_in;
  logic        [        RamDataWidth-1:0] bram1_data_out;
  //tlp type signals
  logic                                   is_cpl_c;
  logic                                   is_cpl_r;
  logic                                   is_np_c;
  logic                                   is_np_r;
  logic                                   is_p_c;
  logic                                   is_p_r;
  //fifo helper signals
  logic                                   update_fc;
  logic                                   fifo_full;
  logic                                   fifo_empty;
  //skid buffer axis signals
  logic        [          DATA_WIDTH-1:0] skid_s_axis_tdata;
  logic        [          KEEP_WIDTH-1:0] skid_s_axis_tkeep;
  logic                                   skid_s_axis_tvalid;
  logic                                   skid_s_axis_tlast;
  logic        [          USER_WIDTH-1:0] skid_s_axis_tuser;
  logic                                   skid_s_axis_tready;
  //tlp signals
  //registered axis master signsals
  //axis signals
  logic        [          DATA_WIDTH-1:0] skid_axis_dllp2phy_tdata;
  logic        [          KEEP_WIDTH-1:0] skid_axis_dllp2phy_tkeep;
  logic                                   skid_axis_dllp2phy_tvalid;
  logic                                   skid_axis_dllp2phy_tlast;
  logic        [          USER_WIDTH-1:0] skid_axis_dllp2phy_tuser;
  logic                                   skid_axis_dllp2phy_tready;

  //axis signals
  logic        [          DATA_WIDTH-1:0] skid_axis_dllp2tlp_tdata;
  logic        [          KEEP_WIDTH-1:0] skid_axis_dllp2tlp_tkeep;
  logic                                   skid_axis_dllp2tlp_tvalid;
  logic                                   skid_axis_dllp2tlp_tlast;
  logic        [          USER_WIDTH-1:0] skid_axis_dllp2tlp_tuser;
  logic                                   skid_axis_dllp2tlp_tready;

  //credits tracking signals
  logic        [                     7:0] ph_credits_consumed_c;
  logic        [                     7:0] ph_credits_consumed_r;
  logic        [                    11:0] pd_credits_consumed_c;
  logic        [                    11:0] pd_credits_consumed_r;
  logic        [                     7:0] nph_credits_consumed_c;
  logic        [                     7:0] nph_credits_consumed_r;
  logic        [                    11:0] npd_credits_consumed_c;
  logic        [                    11:0] npd_credits_consumed_r;
  //word count signals
  logic        [                    31:0] word_count_c;
  logic        [                    31:0] word_count_r;
  logic        [                    31:0] tlp_word_count_c;
  logic        [                    31:0] tlp_word_count_r;
  logic        [                    31:0] tlp_curr_count_c;
  logic        [                    31:0] tlp_curr_count_r;
  //tx/rx word count
  logic        [                    15:0] tx_tkeep_c;
  logic        [                    15:0] tx_tkeep_r;
  logic        [                    31:0] tx_word_count_c;
  logic        [                    31:0] tx_word_count_r;
  logic        [        RamAddrWidth-1:0] rx_addr_c;
  logic        [        RamAddrWidth-1:0] rx_addr_r;
  logic        [                    31:0] tx_addr_c;
  logic        [                    31:0] tx_addr_r;

  //fifo state signals
  assign fifo_full = fifo_tail_r > fifo_head_r ?
  (fifo_tail_r - fifo_head_r) == RX_FIFO_SIZE:
  (fifo_head_r - fifo_tail_r) == RX_FIFO_SIZE;
  assign fifo_empty = fifo_tail_r == fifo_head_r;


  always_ff @(posedge clk_i) begin : main_seq
    if (rst_i) begin
      curr_state             <= ST_DLL_RX_IDLE;
      next_transmit_seq_r    <= '0;
      next_recv_seq_num_r    <= '0;
      //crc signals
      dllp_lcrc_r            <= '1;
      crc_calc_r             <= '1;
      //recieve word count
      word_count_r           <= '0;
      //credits tracking
      ph_credits_consumed_r  <= '0;
      pd_credits_consumed_r  <= '0;
      nph_credits_consumed_r <= '0;
      npd_credits_consumed_r <= '0;
      //
      tlp_word_count_r       <= '0;
      rx_addr_r              <= '0;
      //fifo tracking
      fifo_tail_r            <= '0;
      fifo_head_r            <= '0;
      //transmit tlp signals
      tx_word_count_r        <= '0;
      tlp_curr_count_r       <= '0;
      tx_addr_r              <= '0;
      tlp_curr_state         <= ST_TLP_RX_IDLE;
    end else begin
      curr_state             <= next_state;
      next_transmit_seq_r    <= next_transmit_seq_c;
      next_recv_seq_num_r    <= next_recv_seq_num_c;
      //crc signals
      dllp_lcrc_r            <= dllp_lcrc_c;
      crc_calc_r             <= crc_calc_c;
      //recieve word count
      word_count_r           <= word_count_c;
      //credits tracking
      ph_credits_consumed_r  <= ph_credits_consumed_c;
      pd_credits_consumed_r  <= pd_credits_consumed_c;
      nph_credits_consumed_r <= nph_credits_consumed_c;
      npd_credits_consumed_r <= npd_credits_consumed_c;
      //
      tlp_word_count_r       <= tlp_word_count_c;
      rx_addr_r              <= rx_addr_c;
      //fifo tracking
      fifo_tail_r            <= fifo_tail_c;
      fifo_head_r            <= fifo_head_c;
      //transmit tlp signals
      tx_word_count_r        <= tx_word_count_c;
      tlp_curr_count_r       <= tlp_curr_count_c;
      tx_addr_r              <= tx_addr_c;
      tlp_curr_state         <= tlp_next_state;
    end
    //non resetable
    //tlp type
    is_cpl_r   <= is_cpl_c;
    is_np_r    <= is_np_c;
    is_p_r     <= is_p_c;
    tx_tkeep_r <= tx_tkeep_c;
    tkeep_r    <= tkeep_c;
    crc_in_r   <= crc_in_c;
    tlp_in_r   <= tlp_in_c;
  end


  always_comb begin : byteswap
    for (int i = 0; i < 8; i++) begin
      crc_out32[i]           = crc_calc_r[7-i];
      crc_out32[i+8]         = crc_calc_r[15-i];
      crc_out32[i+16]        = crc_calc_r[23-i];
      crc_out32[i+24]        = crc_calc_r[31-i];
      crc_reversed[i]        = crc_out16[7-i];
      crc_reversed[i+8]      = crc_out16[15-i];
      crc_reversed[i+16]     = crc_out16[23-i];
      crc_reversed[i+24]     = crc_out16[31-i];

      dllp_crc_reversed[i]   = dllp_lcrc_r[7-i];
      dllp_crc_reversed[i+8] = dllp_lcrc_r[15-i];
    end
  end


  always_comb begin : main_combo
    next_state                = curr_state;
    next_transmit_seq_c       = next_transmit_seq_r;
    //crc signals
    dllp_lcrc_c               = dllp_lcrc_r;
    crc_calc_c                = crc_calc_r;
    crc_select                = '0;
    crc_in_c                  = crc_in_r;
    //bram write signals
    bram0_wr                  = '0;
    bram0_addr                = rx_addr_r;
    bram0_data_in             = '0;
    //seq num
    next_recv_seq_num_c       = next_recv_seq_num_r;
    //rx word count
    word_count_c              = word_count_r;
    //tlp type
    tkeep_c                   = tkeep_r;
    tlp_in_c                  = tlp_in_r;
    is_cpl_c                  = is_cpl_r;
    is_np_c                   = is_np_r;
    is_p_c                    = is_p_r;
    //credits signals
    ph_credits_consumed_c     = ph_credits_consumed_r;
    pd_credits_consumed_c     = pd_credits_consumed_r;
    nph_credits_consumed_c    = nph_credits_consumed_r;
    npd_credits_consumed_c    = npd_credits_consumed_r;
    //
    tlp_word_count_c          = tlp_word_count_r;
    rx_addr_c                 = rx_addr_r;
    //dllp rx to phy
    skid_axis_dllp2phy_tdata  = '0;
    skid_axis_dllp2phy_tkeep  = '0;
    skid_axis_dllp2phy_tvalid = '0;
    skid_axis_dllp2phy_tlast  = '0;
    skid_axis_dllp2phy_tuser  = '0;
    //
    skid_s_axis_tready        = '0;
    dll_packet                = '0;
    //
    tx_tlp_ready_c            = '0;
    //fifo tail
    fifo_tail_c               = fifo_tail_r;
    case (curr_state)
      ST_DLL_RX_IDLE: begin
        skid_s_axis_tready = (!fifo_full && (link_status_i == DL_ACTIVE));
        if (skid_s_axis_tvalid && skid_s_axis_tready && skid_s_axis_tuser[UserIsTlp]) begin
          //store incoming sequence number
          next_transmit_seq_c = {skid_s_axis_tdata[7:0], skid_s_axis_tdata[15:8]};
          tlp_in_c            = skid_s_axis_tdata;
          crc_select          = 2'b01;
          //tlp type
          is_cpl_c            = '0;
          is_np_c             = '0;
          is_p_c              = '0;
          word_count_c        = '0;
          //state control
          next_state          = ST_DLL_RX_SEQ_NUM;
        end
      end
      ST_DLL_RX_SEQ_NUM: begin
        skid_s_axis_tready = '1;
        crc_select         = 2'b11;
        if (skid_s_axis_tvalid && skid_s_axis_tuser[UserIsTlp]) begin
          crc_calc_c    = crc_out16;
          word_count_c  = word_count_r + 1;
          tlp_in_c      = skid_s_axis_tdata;
          //bram store
          bram0_data_in = {skid_s_axis_tdata[15:0], tlp_in_r[31:16]};
          bram0_addr    = RamAddrWidth'(rx_addr_r + word_count_r + 16'h1);
          bram0_wr      = '1;
          //check tlp type
          if ((tlp_in_r[23:16] == Cpl) || (tlp_in_r[23:16] == CplD)) begin
            is_cpl_c = '1;
          end else if ((tlp_in_r[23:16]  == MW) || (tlp_in_r[23:16]  == CW0) ||
            (tlp_in_r[23:16] == CW1)) begin
            is_p_c = '1;
          end else begin
            is_np_c = '1;
          end
          //next state
          next_state = ST_DLL_RX_TLP;
        end
      end
      ST_DLL_RX_TLP: begin
        skid_s_axis_tready = '1;
        crc_select         = 2'b11;
        if (skid_s_axis_tvalid && skid_s_axis_tuser[UserIsTlp]) begin
          crc_calc_c    = crc_out16;
          word_count_c  = word_count_r + 1;
          //bram store
          tlp_in_c      = skid_s_axis_tdata;
          bram0_data_in = {skid_s_axis_tdata[15:0], tlp_in_r[31:16]};
          bram0_addr    = RamAddrWidth'(rx_addr_r + word_count_r + 16'h1);
          bram0_wr      = '1;
          if (skid_s_axis_tlast) begin
            word_count_c = word_count_r;
            case (skid_s_axis_tkeep)
              4'b0001: begin
                crc_select = 2'b00;
                tkeep_c    = 16'h0007;
                crc_in_c   = {skid_s_axis_tdata[7:0], tlp_in_r[31:8]};
              end
              4'b0011: begin
                crc_select = 2'b01;
                tkeep_c    = 16'h000F;
                crc_in_c   = {skid_s_axis_tdata[15:0], tlp_in_r[31:16]};
              end
              4'b0111: begin
                crc_select = 2'b10;
                tkeep_c    = 16'h0001;
                crc_in_c   = {skid_s_axis_tdata[23:0], tlp_in_r[31:24]};
              end
              4'b1111: begin
                crc_select = 2'b11;
                tkeep_c    = 16'h0003;
                crc_in_c   = skid_s_axis_tdata;
              end
              default: begin
              end
            endcase
            word_count_c = word_count_r;
            next_state   = ST_DLL_EOP;
          end
        end
      end
      ST_DLL_EOP: begin
        skid_s_axis_tready = '0;
        //check crc
        if (crc_out32 == crc_in_r) begin
          //update bram addr zero with word count
          bram0_addr     = rx_addr_r;
          bram0_data_in  = {tkeep_r[15:0], word_count_r[15:0]};
          bram0_wr       = '1;
          //tell tlp axis tx to start
          tx_tlp_ready_c = '1;
          //build dllp ack for crc
          dll_packet     = set_ack_nack(Ack, next_transmit_seq_r[11:0]);
          dllp_lcrc_c    = dllp_crc_out;
          //go to nextstate
          next_state     = ST_ACK_DLLP;
          //confirm data in buffer to be sent to tlp layer
          if (next_recv_seq_num_r == next_transmit_seq_r) begin
            //expected sequence valid
            next_state = ST_ACK_DLLP;
          end
        end else begin
          //send nack
          next_state = ST_DLL_RX_IDLE;
        end
      end
      ST_ACK_DLLP: begin
        dll_packet = set_ack_nack(Ack,next_transmit_seq_r[11:0],dllp_lcrc_r[15:0]);
        //build axis master output
        skid_axis_dllp2phy_tdata    = dll_packet;
        skid_axis_dllp2phy_tkeep    = '1;
        skid_axis_dllp2phy_tvalid   = '1;
        if (m_axis_dllp2phy_tready) begin
          next_state = ST_ACK_DLLP_CRC;
        end
      end
      ST_ACK_DLLP_CRC: begin
        //build axis master output
        skid_axis_dllp2phy_tdata  = dllp_crc_reversed;
        skid_axis_dllp2phy_tkeep  = 8'h03;
        skid_axis_dllp2phy_tvalid = '1;
        skid_axis_dllp2phy_tlast  = '1;
        if (m_axis_dllp2phy_tready) begin
          if (is_p_r) begin
            ph_credits_consumed_c = ph_credits_consumed_r + 1;
            //to get credits consumed .. subtract word count by header count which is 4.
            //then multiply by 4 to get count in 4dw increment i.e credits
            pd_credits_consumed_c = pd_credits_consumed_r + ((word_count_r - 4) >> 2);
          end else if (is_np_r) begin
            nph_credits_consumed_c = nph_credits_consumed_r + 1;
            //to get credits consumed .. subtract word count by header count which is 4.
            //then multiply by 4 to get count in 4dw increment i.e credits
            npd_credits_consumed_c = npd_credits_consumed_r + ((word_count_r - 4) >> 2);
          end
          next_state = ST_SEND_FC_DLLP;
        end
      end
      ST_SEND_FC_DLLP: begin
        //build dllp fc update for crc
        if (is_p_r) begin
          //increment header by 1 and data by max size
          dll_packet = send_fc_init(UpdateFC_P, '0, ph_credits_consumed_r + 1,
                                    pd_credits_consumed_r + FcPData);
        end else if (is_np_r) begin
          //increment header by 1 and data by max size
          dll_packet = send_fc_init(UpdateFC_NP, '0, nph_credits_consumed_r + 1,
                                    npd_credits_consumed_r + FcPData);
        end
        dllp_lcrc_c = dllp_crc_out;
        //build axis master output
        skid_axis_dllp2phy_tdata    = dll_packet[31:0];
        skid_axis_dllp2phy_tkeep    = '1;
        skid_axis_dllp2phy_tvalid   = '1;
        //done with dllp
        if (m_axis_dllp2phy_tready) begin
          next_state = ST_SEND_FC_DLLP_CRC;
        end
      end
      ST_SEND_FC_DLLP_CRC: begin
        //build axis master output
        skid_axis_dllp2phy_tdata  = dllp_crc_reversed;
        skid_axis_dllp2phy_tkeep  = 8'h03;
        skid_axis_dllp2phy_tvalid = '1;
        skid_axis_dllp2phy_tlast  = '1;
        //done with dllp
        if (m_axis_dllp2phy_tready) begin
          word_count_c = '0;
          crc_calc_c = '1;
          //increment seq number, fifo tail, rx_buffer index
          next_recv_seq_num_c = next_recv_seq_num_r + 1;
          fifo_tail_c = (fifo_tail_r == RX_FIFO_SIZE) ? '0 : fifo_tail_r + 1;
          rx_addr_c = (fifo_tail_r == RX_FIFO_SIZE) ? '0 : rx_addr_r + MaxTlpTotalSizeDW;
          next_state = ST_DLL_RX_IDLE;
        end
      end
      default: begin
      end
    endcase
  end

  //transmit tlp from fifo through axi stream
  //TODO: pull this into its own module
  always_comb begin : transmit_tlp_combo
    tlp_next_state            = tlp_curr_state;
    tx_word_count_c           = tx_word_count_r;
    tlp_curr_count_c          = tlp_curr_count_r;
    tx_addr_c                 = tx_addr_r;
    tx_tkeep_c                = tx_tkeep_r;
    //fifo head
    fifo_head_c               = fifo_head_r;
    //axis signals
    skid_axis_dllp2tlp_tdata  = m_axis_dllp2tlp_tdata;
    skid_axis_dllp2tlp_tkeep  = m_axis_dllp2tlp_tkeep;
    skid_axis_dllp2tlp_tvalid = m_axis_dllp2tlp_tvalid;
    skid_axis_dllp2tlp_tlast  = m_axis_dllp2tlp_tlast;
    skid_axis_dllp2tlp_tuser  = m_axis_dllp2tlp_tuser;
    //bram write signals
    bram1_wr                  = '0;
    bram1_addr                = tx_addr_r;
    bram1_data_in             = '0;
    case (tlp_curr_state)
      ST_TLP_RX_IDLE: begin
        //check if fifo has tlp
        if (!fifo_empty) begin
          //get word count
          tx_word_count_c = bram1_data_out[15:0];
          tx_tkeep_c = bram1_data_out[31:16];
          tlp_curr_count_c = 16'h0001;
          bram1_addr = tx_addr_r + 1;
          tlp_next_state = ST_TLP_GET_WD_CNT;
        end
      end
      ST_TLP_GET_WD_CNT: begin
        //we have word count.. store first tlp word from ram
        skid_axis_dllp2tlp_tdata = bram1_data_out;
        skid_axis_dllp2tlp_tkeep = '1;
        skid_axis_dllp2tlp_tvalid = '1;
        //not expecting tlps shorter that 3 words minimum
        skid_axis_dllp2tlp_tlast = '0;
        //user not used
        skid_axis_dllp2tlp_tuser = '0;
        bram1_addr = tx_addr_r + tlp_curr_count_r + 1;
        //increment address
        tlp_curr_count_c = tlp_curr_count_r + 1;
        tlp_next_state = ST_TLP_RX_STREAM;
      end
      ST_TLP_RX_STREAM: begin
        bram1_addr = tx_addr_r + tlp_curr_count_r + 1;
        if (m_axis_dllp2tlp_tready) begin
          skid_axis_dllp2tlp_tdata = bram1_data_out;
          skid_axis_dllp2tlp_tkeep = '1;
          skid_axis_dllp2tlp_tvalid = '1;
          //not expecting tlps shorter that 3 words minimum
          skid_axis_dllp2tlp_tlast = '0;
          //user not used
          skid_axis_dllp2tlp_tuser = '0;
          //increment address
          tlp_curr_count_c = tlp_curr_count_r + 1;
          if (tlp_curr_count_r == tx_word_count_r) begin
            skid_axis_dllp2tlp_tlast = '1;
            skid_axis_dllp2tlp_tkeep = tx_tkeep_r;
            tlp_next_state = ST_TLP_RX_EOP;
          end
        end
      end
      ST_TLP_RX_EOP: begin
        if (skid_axis_dllp2tlp_tready) begin
          skid_axis_dllp2tlp_tvalid = '0;
          //not expecting tlps shorter that 3 words minimum
          skid_axis_dllp2tlp_tlast = '0;
          tlp_curr_count_c = '0;
          fifo_head_c = (fifo_head_r == RX_FIFO_SIZE) ? '0 : fifo_head_r + 1;
          tx_addr_c = (fifo_head_r == RX_FIFO_SIZE) ? '0 : tx_addr_r + MaxTlpTotalSizeDW;
          tlp_next_state = ST_TLP_RX_IDLE;
        end
      end
      default: begin
      end
    endcase
  end


  //dllp2tlp axis skid buffer
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
  ) dllp2tlp_axis_register_inst (
      .clk(clk_i),
      .rst(rst_i),
      .s_axis_tdata(skid_axis_dllp2tlp_tdata),
      .s_axis_tkeep(skid_axis_dllp2tlp_tkeep),
      .s_axis_tvalid(skid_axis_dllp2tlp_tvalid),
      .s_axis_tready(skid_axis_dllp2tlp_tready),
      .s_axis_tlast(skid_axis_dllp2tlp_tlast),
      .s_axis_tid('0),
      .s_axis_tdest('0),
      .s_axis_tuser(skid_axis_dllp2tlp_tuser),
      .m_axis_tdata(m_axis_dllp2tlp_tdata),
      .m_axis_tkeep(m_axis_dllp2tlp_tkeep),
      .m_axis_tvalid(m_axis_dllp2tlp_tvalid),
      .m_axis_tready(m_axis_dllp2tlp_tready),
      .m_axis_tlast(m_axis_dllp2tlp_tlast),
      .m_axis_tid(),
      .m_axis_tdest(),
      .m_axis_tuser(m_axis_dllp2tlp_tuser)
  );


  //dllp2phy axis skid buffer
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
  ) dllp2phy_axis_register_inst (
      .clk(clk_i),
      .rst(rst_i),
      .s_axis_tdata(skid_axis_dllp2phy_tdata),
      .s_axis_tkeep(skid_axis_dllp2phy_tkeep),
      .s_axis_tvalid(skid_axis_dllp2phy_tvalid),
      .s_axis_tready(skid_axis_dllp2phy_tready),
      .s_axis_tlast(skid_axis_dllp2phy_tlast),
      .s_axis_tid('0),
      .s_axis_tdest('0),
      .s_axis_tuser(skid_axis_dllp2phy_tuser),
      .m_axis_tdata(m_axis_dllp2phy_tdata),
      .m_axis_tkeep(m_axis_dllp2phy_tkeep),
      .m_axis_tvalid(m_axis_dllp2phy_tvalid),
      .m_axis_tready(m_axis_dllp2phy_tready),
      .m_axis_tlast(m_axis_dllp2phy_tlast),
      .m_axis_tid(),
      .m_axis_tdest(),
      .m_axis_tuser(m_axis_dllp2phy_tuser)
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
  ) axis_register_inst (
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
      .m_axis_tdata(skid_s_axis_tdata),
      .m_axis_tkeep(skid_s_axis_tkeep),
      .m_axis_tvalid(skid_s_axis_tvalid),
      .m_axis_tready(skid_s_axis_tready),
      .m_axis_tlast(skid_s_axis_tlast),
      .m_axis_tid(),
      .m_axis_tdest(),
      .m_axis_tuser(skid_s_axis_tuser)
  );



  //recieve buffer block ram
  bram_dp #(
      .RAM_DATA_WIDTH(RamDataWidth),
      .RAM_ADDR_WIDTH(RamAddrWidth)
  ) recieve_buffer_inst (
      .rst(rst_i),
      .a_clk(clk_i),
      .a_wr(bram0_wr),
      .a_addr(bram0_addr),
      .a_data_in(bram0_data_in),
      .a_data_out(bram0_data_out),
      .b_clk(clk_i),
      .b_wr('0),
      .b_addr(bram1_addr),
      .b_data_in('0),
      .b_data_out(bram1_data_out)
  );

  //dll crc instance
  pcie_datalink_crc dllp_crc_inst (
      .crcIn ('1),
      .data  (dll_packet),
      .crcOut(dllp_crc_out)
  );

  //tlp crc instance
  pcie_lcrc16 tlp_crc16_inst (
      .data  (tlp_in_r),
      .crcIn (crc_calc_r),
      .select(crc_select),
      .crcOut(crc_out16)
  );
  /* verilator lint_on WIDTHEXPAND */
  /* verilator lint_on WIDTHTRUNC */
endmodule
