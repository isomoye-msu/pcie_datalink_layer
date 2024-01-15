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
    input  logic                               clk_i,              // Clock signal
    input  logic                               rst_i,              // Reset signal
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
    output logic            [  DATA_WIDTH-1:0] m_phy_axis_tdata,
    output logic            [  KEEP_WIDTH-1:0] m_phy_axis_tkeep,
    output logic                               m_phy_axis_tvalid,
    output logic                               m_phy_axis_tlast,
    output logic            [  USER_WIDTH-1:0] m_phy_axis_tuser,
    input  logic                               m_phy_axis_tready,
    //TLP dllp to tlp layer AXI Master
    output logic            [(DATA_WIDTH)-1:0] m_tlp_axis_tdata,
    output logic            [(KEEP_WIDTH)-1:0] m_tlp_axis_tkeep,
    output logic                               m_tlp_axis_tvalid,
    output logic                               m_tlp_axis_tlast,
    output logic            [(USER_WIDTH)-1:0] m_tlp_axis_tuser,
    input  logic                               m_tlp_axis_tready
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
    ST_IDLE,
    ST_DLL_RX_SEQ_NUM,
    ST_DLL_RX_TLP,
    ST_DLL_EOP,
    ST_DLL_CHECK_CRC,
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

  dll_rx_st_e                   curr_state;
  dll_rx_st_e                   next_state;
  dllp_union_t                  dll_packet;


  //tlp nulled
  logic                         tlp_nullified_c;
  logic                         tlp_nullified_r;
  logic        [          31:0] tlp_in_c;
  logic        [          31:0] tlp_in_r;
  //transmit sequence logic
  logic        [          15:0] next_transmit_seq_c;
  logic        [          15:0] next_transmit_seq_r;
  logic        [          15:0] next_recv_seq_num_c;
  logic        [          15:0] next_recv_seq_num_r;
  logic        [          11:0] ackd_transmit_seq_c;
  logic        [          15:0] ackd_transmit_seq_r;
  //crc helper signals
  logic        [          31:0] crc_in_c;
  logic        [          31:0] crc_in_r;
  logic        [          31:0] crc_calc_c;
  logic        [          31:0] crc_calc_r;
  logic        [          31:0] crc_out16;
  logic        [          31:0] crc_reversed;
  logic        [          31:0] crc_out32;
  logic        [          15:0] dllp_crc_out;
  logic        [          15:0] dllp_crc_reversed;
  logic        [          31:0] dllp_lcrc_c;
  logic        [          31:0] dllp_lcrc_r;
  logic        [          31:0] byte_count_c;
  logic        [          31:0] byte_count_r;
  logic        [           1:0] crc_select;
  //tlp type signals
  logic                         is_cpl_c;
  logic                         is_cpl_r;
  logic                         is_np_c;
  logic                         is_np_r;
  logic                         is_p_c;
  logic                         is_p_r;
  logic                         is_3dw_c;
  logic                         is_3dw_r;
  //fifo helper signals
  logic                         update_fc;
  //skid buffer axis signals
  logic        [DATA_WIDTH-1:0] skid_axis_tdata;
  logic        [KEEP_WIDTH-1:0] skid_axis_tkeep;
  logic                         skid_axis_tvalid;
  logic                         skid_axis_tlast;
  logic        [USER_WIDTH-1:0] skid_axis_tuser;
  logic                         skid_axis_tready;
  // tlp pipeline axis bus
  logic        [DATA_WIDTH-1:0] pipeline_axis_tdata;
  logic        [KEEP_WIDTH-1:0] pipeline_axis_tkeep;
  logic                         pipeline_axis_tvalid;
  logic                         pipeline_axis_tlast;
  logic        [USER_WIDTH-1:0] pipeline_axis_tuser;
  logic                         pipeline_axis_tready;
  //phy response signals
  logic        [DATA_WIDTH-1:0] phy_axis_tdata;
  logic        [KEEP_WIDTH-1:0] phy_axis_tkeep;
  logic                         phy_axis_tvalid;
  logic                         phy_axis_tlast;
  logic        [USER_WIDTH-1:0] phy_axis_tuser;
  logic                         phy_axis_tready;
  //tlp output axis signals
  logic        [DATA_WIDTH-1:0] tlp_axis_tdata;
  logic        [KEEP_WIDTH-1:0] tlp_axis_tkeep;
  logic                         tlp_axis_tvalid;
  logic                         tlp_axis_tlast;
  logic        [USER_WIDTH-1:0] tlp_axis_tuser;
  logic                         tlp_axis_tready;
  //tlp last date
  logic        [DATA_WIDTH-1:0] last_tdata_c;
  logic        [DATA_WIDTH-1:0] last_tdata_r;

  //credits tracking signals
  logic        [           7:0] ph_credits_consumed_c;
  logic        [           7:0] ph_credits_consumed_r;
  logic        [          11:0] pd_credits_consumed_c;
  logic        [          11:0] pd_credits_consumed_r;
  logic        [           7:0] nph_credits_consumed_c;
  logic        [           7:0] nph_credits_consumed_r;
  logic        [          11:0] npd_credits_consumed_c;
  logic        [          11:0] npd_credits_consumed_r;

  //main sequential block
  always_ff @(posedge clk_i) begin : main_seq
    if (rst_i) begin
      curr_state             <= ST_IDLE;
      next_transmit_seq_r    <= '0;
      next_recv_seq_num_r    <= '0;
      //crc signals
      dllp_lcrc_r            <= '1;
      crc_calc_r             <= '1;
      //credits tracking
      ph_credits_consumed_r  <= '0;
      pd_credits_consumed_r  <= '0;
      nph_credits_consumed_r <= '0;
      npd_credits_consumed_r <= '0;
    end else begin
      curr_state             <= next_state;
      next_transmit_seq_r    <= next_transmit_seq_c;
      next_recv_seq_num_r    <= next_recv_seq_num_c;
      //crc signals
      dllp_lcrc_r            <= dllp_lcrc_c;
      crc_calc_r             <= crc_calc_c;
      //credits tracking
      ph_credits_consumed_r  <= ph_credits_consumed_c;
      pd_credits_consumed_r  <= pd_credits_consumed_c;
      nph_credits_consumed_r <= nph_credits_consumed_c;
      npd_credits_consumed_r <= npd_credits_consumed_c;
    end
    //non resetable
    //tlp type
    last_tdata_r    <= last_tdata_c;
    byte_count_r    <= byte_count_c;
    is_cpl_r        <= is_cpl_c;
    is_np_r         <= is_np_c;
    is_p_r          <= is_p_c;
    tlp_nullified_r <= tlp_nullified_c;
    crc_in_r        <= crc_in_c;
    tlp_in_r        <= tlp_in_c;
    is_3dw_r        <= is_3dw_c;
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
    next_state             = curr_state;
    next_transmit_seq_c    = next_transmit_seq_r;
    //crc signals
    dllp_lcrc_c            = dllp_lcrc_r;
    crc_calc_c             = crc_calc_r;
    crc_select             = '0;
    crc_in_c               = crc_in_r;
    byte_count_c           = byte_count_r;
    //seq num
    next_recv_seq_num_c    = next_recv_seq_num_r;
    //tlp type
    tlp_in_c               = tlp_in_r;
    is_cpl_c               = is_cpl_r;
    is_np_c                = is_np_r;
    is_p_c                 = is_p_r;
    is_3dw_c               = is_3dw_r;
    //credits signals
    ph_credits_consumed_c  = ph_credits_consumed_r;
    pd_credits_consumed_c  = pd_credits_consumed_r;
    nph_credits_consumed_c = nph_credits_consumed_r;
    npd_credits_consumed_c = npd_credits_consumed_r;
    //dllp rx to phy
    phy_axis_tdata         = '0;
    phy_axis_tkeep         = '0;
    phy_axis_tvalid        = '0;
    phy_axis_tlast         = '0;
    phy_axis_tuser         = 4'h01;
    //
    //dllp rx to phy
    tlp_axis_tdata         = '0;
    tlp_axis_tkeep         = '0;
    tlp_axis_tvalid        = '0;
    tlp_axis_tlast         = '0;
    tlp_axis_tuser         = '0;
    //
    skid_axis_tready       = '0;
    dll_packet             = '0;
    last_tdata_c           = last_tdata_r;
    tlp_nullified_c        = tlp_nullified_r;
    case (curr_state)
      ST_IDLE: begin
        skid_axis_tready = tlp_axis_tready && (link_status_i == DL_ACTIVE) && pipeline_axis_tvalid;
        if (skid_axis_tvalid && skid_axis_tready && skid_axis_tuser[UserIsTlp]) begin
          //store incoming sequence number
          next_transmit_seq_c = {skid_axis_tdata[7:0], skid_axis_tdata[15:8]};
          tlp_in_c            = skid_axis_tdata;
          crc_select          = 2'b01;
          //tlp type
          is_cpl_c            = '0;
          is_np_c             = '0;
          is_p_c              = '0;
          byte_count_c        = '0;
          is_3dw_c            = '0;
          //state control
          next_state          = ST_DLL_RX_SEQ_NUM;
        end
      end
      ST_DLL_RX_SEQ_NUM: begin
        skid_axis_tready = tlp_axis_tready && pipeline_axis_tvalid;
        crc_select       = 2'b11;
        if (skid_axis_tready && skid_axis_tvalid && skid_axis_tuser[UserIsTlp]) begin
          crc_calc_c      = crc_out16;
          byte_count_c    = byte_count_r + 32'h4;
          tlp_in_c        = skid_axis_tdata;
          //bram store
          tlp_axis_tdata  = {skid_axis_tdata[15:0], tlp_in_r[31:16]};
          tlp_axis_tkeep  = '1;
          tlp_axis_tvalid = '1;

          // bram0_data_in   = {skid_axis_tdata[15:0], tlp_in_r[31:16]};
          // bram0_addr      = RamAddrWidth'(rx_addr_r + byte_count_r + 16'h1);
          // bram0_wr        = '1;
          //check tlp type
          if (tlp_in_r[21]) begin
            is_3dw_c = '1;
          end
          if ((tlp_in_r[23:16] == Cpl) || (tlp_in_r[23:16] == CplD)) begin
            is_cpl_c = '1;
          end else if ((tlp_in_r[23:16]  ==? MW) || (tlp_in_r[23:16]  == CW0) ||
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
        skid_axis_tready = tlp_axis_tready & pipeline_axis_tvalid;
        crc_select       = 2'b11;
        if (skid_axis_tready && skid_axis_tvalid && skid_axis_tuser[UserIsTlp]) begin
          crc_calc_c      = crc_out16;
          //bram store
          tlp_in_c        = skid_axis_tdata;
          tlp_axis_tdata  = {skid_axis_tdata[15:0], tlp_in_r[31:16]};
          tlp_axis_tkeep  = skid_axis_tkeep;
          tlp_axis_tvalid = '1;
          byte_count_c    = byte_count_r + 32'h4;
          // bram0_data_in   = {skid_axis_tdata[15:0], tlp_in_r[31:16]};
          // bram0_addr      = RamAddrWidth'(rx_addr_r + byte_count_r + 16'h1);
          // bram0_wr        = '1;
          if (pipeline_axis_tlast) begin
            // tlp_axis_tkeep = skid_axis_tkeep;
            case (pipeline_axis_tkeep)
              4'b0001: begin
                crc_select = '0;
                byte_count_c    = byte_count_r;
                last_tdata_c = tlp_axis_tdata;
                tlp_axis_tvalid = '0;
                // crc_in_c   = {skid_axis_tdata[7:0], tlp_in_r[31:8]};
                // tlp_axis_tkeep = skid_axis_tkeep;
              end
              4'b0011: begin
                crc_select = 2'b01;
                byte_count_c    = byte_count_r;
                last_tdata_c = tlp_axis_tdata;
                tlp_axis_tvalid = '0;
                // crc_in_c   = {skid_axis_tdata[15:0], tlp_in_r[31:16]};
              end
              // 4'b0111: begin
              //   crc_select = 2'b10;
              //   crc_in_c   = {skid_axis_tdata[23:0], tlp_in_r[31:24]};
              // end
              // 4'b1111: begin
              //   crc_select = '1;
              //   crc_in_c   = skid_axis_tdata;
              // end
              default: begin
              end
            endcase
            // byte_count_c = byte_count_r;
            next_state = ST_DLL_EOP;
          end
        end
      end
      ST_DLL_EOP: begin
        skid_axis_tready = tlp_axis_tready;
        if (skid_axis_tready && skid_axis_tvalid && skid_axis_tuser[UserIsTlp]) begin
          crc_select     = 2'b11;
          crc_calc_c     = crc_out16;
          tlp_axis_tdata = {skid_axis_tdata[15:0], tlp_in_r[31:16]};
          tlp_axis_tlast = '1;
          tlp_axis_tkeep = skid_axis_tkeep;
          next_state     = ST_DLL_CHECK_CRC;
          // byte_count_c = byte_count_r;
          case (skid_axis_tkeep)
            4'b0001: begin
              crc_select = '0;
              crc_in_c   = {skid_axis_tdata[7:0], tlp_in_r[31:8]};
              // tlp_axis_tkeep = skid_axis_tkeep;
            end
            4'b0011: begin
              crc_select = 2'b01;
              crc_in_c   = {skid_axis_tdata[15:0], tlp_in_r[31:16]};
            end
            4'b0111: begin
              crc_select = 2'b10;
              last_tdata_c = tlp_axis_tdata;
              tlp_axis_tvalid = '0;
              tlp_axis_tlast = '1;
              tlp_axis_tkeep = 4'b0001;
              crc_in_c = {skid_axis_tdata[23:0], tlp_in_r[31:24]};
            end
            4'b1111: begin
              crc_select = '1;
              last_tdata_c = tlp_axis_tdata;
              tlp_axis_tvalid = '0;
              tlp_axis_tlast = '1;
              tlp_axis_tkeep = 4'b0011;
              crc_in_c = skid_axis_tdata;
            end
            default: begin
            end
          endcase
        end
      end
      ST_DLL_CHECK_CRC: begin
        tlp_axis_tdata = last_tdata_r;
        tlp_axis_tvalid = '1;
        tlp_axis_tlast = '1;
        // tlp_axis_tuser = '1;
        //default to dllp ack state
        next_state = ST_ACK_DLLP;
        //assign tkeep based on last keep and alignement
        case (skid_axis_tkeep)
          4'b0001: begin
            byte_count_c   = byte_count_r + 32'h3;
            tlp_axis_tkeep = 4'b0111;
          end
          4'b0011: begin
            byte_count_c   = byte_count_r + 32'h2;
            tlp_axis_tkeep = 4'b0011;
          end
          4'b0111: begin
            byte_count_c   = byte_count_r + 32'h1;
            tlp_axis_tkeep = 4'b0001;
          end
          4'b1111: begin
            byte_count_c   = byte_count_r + 32'h2;
            tlp_axis_tkeep = 4'b0011;
          end
          default: begin
            //unknown keep value... null tlp buffer
            tlp_nullified_c = '1;
            tlp_axis_tuser  = '1;
          end
        endcase
        //check crc
        if ((crc_out32 == crc_in_r) && (next_recv_seq_num_r == next_transmit_seq_r)) begin
          //build dllp ack for crc generation timing, not registered to prevent
          //utilization.
          set_ack_nack(dll_packet, Ack, next_transmit_seq_r[11:0]);
          dllp_lcrc_c = dllp_crc_out;
        end else begin
          //send nack... retry
          tlp_axis_tuser  = '1;
          tlp_nullified_c = '1;
        end
      end
      ST_ACK_DLLP: begin
        //build axis master output
        set_ack_nack(phy_axis_tdata, tlp_nullified_r ? Nak : Ack, next_transmit_seq_r[11:0],
                     dllp_lcrc_r[15:0]);
        phy_axis_tkeep  = '1;
        phy_axis_tvalid = '1;
        if (phy_axis_tready) begin
          next_state = ST_ACK_DLLP_CRC;
        end
      end
      ST_ACK_DLLP_CRC: begin
        //build axis master output
        logic [15:0] tlp_header_offset;
        phy_axis_tdata = dllp_crc_reversed;
        phy_axis_tkeep = 8'h03;
        phy_axis_tvalid = '1;
        phy_axis_tlast = '1;
        tlp_header_offset = (is_3dw_r ? 16'd12 : 16'd16);
        if (phy_axis_tready) begin
          if (is_p_r) begin
            ph_credits_consumed_c = ph_credits_consumed_r + 1;
            //to get credits consumed .. subtract word count by header count which is 4.
            //then multiply by 4 to get count in 4dw increment i.e credits
            pd_credits_consumed_c = pd_credits_consumed_r +
              ((byte_count_r - tlp_header_offset) >> 2);
          end else if (is_np_r) begin
            nph_credits_consumed_c = nph_credits_consumed_r + 1;
            //to get credits consumed .. subtract word count by header count which is 4.
            //then multiply by 4 to get count in 4dw increment i.e credits
            npd_credits_consumed_c = npd_credits_consumed_r +
            ((byte_count_r - tlp_header_offset) >> 2);
          end
          tlp_nullified_c = '0;
          next_state      = tlp_nullified_r ? ST_IDLE : ST_SEND_FC_DLLP;
        end
      end
      ST_SEND_FC_DLLP: begin
        //build dllp fc update for crc
        send_fc_init(phy_axis_tdata, is_p_r ? UpdateFC_P : UpdateFC_NP, '0,
                     ph_credits_consumed_r + 1, pd_credits_consumed_r + FcPData);
        dllp_lcrc_c = dllp_crc_out;
        //build axis master output
        // phy_axis_tdata    = dll_packet[31:0];
        phy_axis_tkeep    = '1;
        phy_axis_tvalid   = '1;
        //done with dllp
        if (phy_axis_tready) begin
          next_state = ST_SEND_FC_DLLP_CRC;
        end
      end
      ST_SEND_FC_DLLP_CRC: begin
        //build axis master output
        phy_axis_tdata  = dllp_crc_reversed;
        phy_axis_tkeep  = 8'h03;
        phy_axis_tvalid = '1;
        phy_axis_tlast  = '1;
        //done with dllp
        if (phy_axis_tready) begin
          //increment seq number
          next_recv_seq_num_c = next_recv_seq_num_r + 1;
          next_state          = ST_IDLE;
        end
      end
      default: begin
      end
    endcase
  end


  //dllp2tlp fifo.. allows for processing tlp
  //and storing to confirm proper tlp seq num and crc..
  //before sending to the transaction layer
  axis_fifo #(
      .DEPTH(RX_FIFO_SIZE * 4096),
      .DATA_WIDTH(DATA_WIDTH),
      .KEEP_ENABLE(KEEP_WIDTH > 0),
      .KEEP_WIDTH(KEEP_WIDTH),
      .LAST_ENABLE(1),
      .ID_ENABLE(0),
      .DEST_ENABLE(0),
      .USER_ENABLE('1),
      .USER_WIDTH(USER_WIDTH),
      // .PIPELINE_OUTPUT(2),
      .FRAME_FIFO(1),
      .USER_BAD_FRAME_VALUE('1),
      .USER_BAD_FRAME_MASK('1),
      // .PIPELINE_OUTPUT(),
      .DROP_BAD_FRAME(1),
      .DROP_WHEN_FULL(0)
  ) dllp2tlp_fifo_inst (
      .clk(clk_i),
      .rst(rst_i),
      // AXI input
      .s_axis_tdata(tlp_axis_tdata),
      .s_axis_tkeep(tlp_axis_tkeep),
      .s_axis_tvalid(tlp_axis_tvalid),
      .s_axis_tready(tlp_axis_tready),
      .s_axis_tlast(tlp_axis_tlast),
      .s_axis_tuser(tlp_axis_tuser),
      .s_axis_tid(),
      .s_axis_tdest(),
      // AXI output
      .m_axis_tdata(m_tlp_axis_tdata),
      .m_axis_tkeep(m_tlp_axis_tkeep),
      .m_axis_tvalid(m_tlp_axis_tvalid),
      .m_axis_tready(m_tlp_axis_tready),
      .m_axis_tlast(m_tlp_axis_tlast),
      .m_axis_tuser(m_tlp_axis_tuser),
      .m_axis_tid(),
      .m_axis_tdest(),
      .pause_ack(),
      .pause_req(),
      .status_depth(),
      .status_depth_commit(),
      // Status
      .status_overflow(),
      .status_bad_frame(),
      .status_good_frame()
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
      .USER_WIDTH(USER_WIDTH),
      .REG_TYPE(SkidBuffer)
  ) dllp2phy_axis_register_inst (
      .clk(clk_i),
      .rst(rst_i),
      .s_axis_tdata(phy_axis_tdata),
      .s_axis_tkeep(phy_axis_tkeep),
      .s_axis_tvalid(phy_axis_tvalid),
      .s_axis_tready(phy_axis_tready),
      .s_axis_tlast(phy_axis_tlast),
      .s_axis_tid('0),
      .s_axis_tdest('0),
      .s_axis_tuser(phy_axis_tuser),
      .m_axis_tdata(m_phy_axis_tdata),
      .m_axis_tkeep(m_phy_axis_tkeep),
      .m_axis_tvalid(m_phy_axis_tvalid),
      .m_axis_tready(m_phy_axis_tready),
      .m_axis_tlast(m_phy_axis_tlast),
      .m_axis_tid(),
      .m_axis_tdest(),
      .m_axis_tuser(m_phy_axis_tuser)
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
      .USER_WIDTH(USER_WIDTH),
      .REG_TYPE(SkidBuffer)
  ) axis_register_inst (
      .clk(clk_i),
      .rst(rst_i),
      .s_axis_tdata(pipeline_axis_tdata),
      .s_axis_tkeep(pipeline_axis_tkeep),
      .s_axis_tvalid(pipeline_axis_tvalid),
      .s_axis_tready(pipeline_axis_tready),
      .s_axis_tlast(pipeline_axis_tlast),
      .s_axis_tuser(pipeline_axis_tuser),
      .s_axis_tid('0),
      .s_axis_tdest('0),
      .m_axis_tdata(skid_axis_tdata),
      .m_axis_tkeep(skid_axis_tkeep),
      .m_axis_tvalid(skid_axis_tvalid),
      .m_axis_tready(skid_axis_tready),
      .m_axis_tlast(skid_axis_tlast),
      .m_axis_tid(),
      .m_axis_tdest(),
      .m_axis_tuser(skid_axis_tuser)
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
      .USER_WIDTH(USER_WIDTH),
      .REG_TYPE(SkidBuffer)
  ) axis_register_pipeline_inst (
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
      .m_axis_tdata(pipeline_axis_tdata),
      .m_axis_tkeep(pipeline_axis_tkeep),
      .m_axis_tvalid(pipeline_axis_tvalid),
      .m_axis_tready(pipeline_axis_tready),
      .m_axis_tlast(pipeline_axis_tlast),
      .m_axis_tuser(pipeline_axis_tuser),
      .m_axis_tid(),
      .m_axis_tdest()
  );

  //dll crc instance
  pcie_datalink_crc dllp_crc_inst (
      .crcIn ('1),
      .data  (dll_packet[31:0]),
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
