//! @title dllp2tlp
//! @author Idris Somoye
//! Module coverts axis tlp packets to pcie avalon type tlp packets.
module axis_to_pcie_converter
  import pcie_datalink_pkg::*;
  import pcie_tlp_pkg::*;
#(
    // TLP data width
    parameter int DATA_WIDTH = 32,
    // TLP strobe width
    parameter int STRB_WIDTH = DATA_WIDTH / 8,
    parameter int KEEP_WIDTH = STRB_WIDTH,
    parameter int USER_WIDTH = 1,
    parameter int MAX_PAYLOAD_SIZE = 256,
    parameter int RX_FIFO_SIZE = 2,
    parameter int TLP_SEG_COUNT = 1,
    parameter int TLP_DATA_WIDTH = 128,
    parameter int TLP_STRB_WIDTH = 5,
    parameter int TLP_HDR_WIDTH = 128

) (
    //clocks and resets
    input  logic                  clk_i,          // Clock signal
    input  logic                  rst_i,          // Reset signal
    //TLP AXIS inputs
    input  logic [DATA_WIDTH-1:0] s_axis_tdata,
    input  logic [KEEP_WIDTH-1:0] s_axis_tkeep,
    input  logic                  s_axis_tvalid,
    input  logic                  s_axis_tlast,
    input  logic [USER_WIDTH-1:0] s_axis_tuser,
    output logic                  s_axis_tready,


    /*
     * TLP output (completion to DMA)
     */
    output wire [             TLP_DATA_WIDTH-1:0] rx_tlp_data,
    output wire [             TLP_STRB_WIDTH-1:0] rx_tlp_strb,
    output wire [TLP_SEG_COUNT*TLP_HDR_WIDTH-1:0] rx_tlp_hdr,
    output wire [            TLP_SEG_COUNT*4-1:0] rx_tlp_error,
    output wire [              TLP_SEG_COUNT-1:0] rx_tlp_valid,
    output wire [              TLP_SEG_COUNT-1:0] rx_tlp_sop,
    output wire [              TLP_SEG_COUNT-1:0] rx_tlp_eop,
    input  wire                                   rx_tlp_ready
);
  /* verilator lint_off WIDTHEXPAND */
  /* verilator lint_off WIDTHTRUNC */
  localparam int PdMinCredits = (MAX_PAYLOAD_SIZE >> 4);
  localparam int FcWaitPeriod = 8'hA0;
  localparam int TlpAxis = 0;
  localparam int UserIsTlp = 1;
  localparam int MaxTlpHdrSizeDW = 4;
  localparam int MaxTlpTotalSizeDW = MaxTlpHdrSizeDW + (MAX_PAYLOAD_SIZE >> 2) + 1;
  localparam int MinRxBufferSize = MaxTlpTotalSizeDW * (RX_FIFO_SIZE);
  localparam int RamDataWidth = DATA_WIDTH;
  localparam int RamAddrWidth = $clog2(MinRxBufferSize);

  //dllp to tlp fsm emum
  typedef enum logic [4:0] {
    ST_IDLE,
    ST_TLP_HEADER_WORD_0,
    ST_TLP_HEADER_WORD_1,
    ST_TLP_HEADER_WORD_2,
    ST_TLP_HEADER_WORD_3,
    ST_TLP_STREAM,
    ST_TLP_SEND
  } axis_pcie_conv_t;


  axis_pcie_conv_t                            curr_state;
  axis_pcie_conv_t                            next_state;


  tlp_hdr_union_t                             tlp_hdr_c;
  tlp_hdr_union_t                             tlp_hdr_r;
  logic                 [               31:0] word_count_c;
  logic                 [               31:0] word_count_r;
  //tlp type signals
  pcie_tlp_header_dw0_t                       tlp_dw0;
  logic                                       tlp_is_3dw_c;
  logic                                       tlp_is_3dw_r;
  logic                                       tlp_is_sop_c;
  logic                                       tlp_is_sop_r;
  logic                                       tlp_is_pd_c;
  logic                                       tlp_is_pd_r;
  logic                                       tlp_is_eop_c;
  logic                                       tlp_is_eop_r;

  logic                 [ TLP_DATA_WIDTH-1:0] tlp_data_c;
  logic                 [ TLP_DATA_WIDTH-1:0] tlp_data_r;
  //skid buffer axis signals
  logic                 [     DATA_WIDTH-1:0] skid_axis_tdata;
  logic                 [     KEEP_WIDTH-1:0] skid_axis_tkeep;
  logic                                       skid_axis_tvalid;
  logic                                       skid_axis_tlast;
  logic                 [     USER_WIDTH-1:0] skid_axis_tuser;
  logic                                       skid_axis_tready;
  logic                 [               31:0] tlp_byte_swapped;
  //tlp output axis signals
  logic                 [     DATA_WIDTH-1:0] tlp_tdata;
  logic                 [     KEEP_WIDTH-1:0] tlp_strb;
  logic                                       tlp_valid;
  logic                                       tlp_eop;
  logic                 [     USER_WIDTH-1:0] tlp_sop;
  logic                 [TLP_SEG_COUNT*4-1:0] tlp_error;
  logic                                       tlp_ready;

  //main sequential block
  always_ff @(posedge clk_i) begin : main_seq
    if (rst_i) begin
      curr_state <= ST_IDLE;
    end else begin
      curr_state <= next_state;
    end
    //non resetable
    word_count_r <= word_count_c;
    tlp_is_3dw_r <= tlp_is_3dw_c;
    tlp_is_eop_r <= tlp_is_eop_c;
    tlp_is_sop_r <= tlp_is_sop_c;
    tlp_is_pd_r  <= tlp_is_pd_c;
    tlp_data_r   <= tlp_data_c;
    tlp_hdr_r    <= tlp_hdr_c;
  end


  always_comb begin : byte_swap_tlp
    for (int i = 0; i < 4; i++) begin
      tlp_byte_swapped[(8*i)+:8] = skid_axis_tdata[8*(3-i)+:8];
    end
  end


  always_comb begin : main_combo
    next_state       = curr_state;
    tlp_is_3dw_c     = tlp_is_3dw_r;
    tlp_is_eop_c     = tlp_is_eop_r;
    tlp_is_sop_c     = tlp_is_sop_r;
    tlp_is_pd_c      = tlp_is_pd_r;
    tlp_hdr_c        = tlp_hdr_r;
    tlp_data_c       = tlp_data_r;
    //skid data
    skid_axis_tready = '0;
    tlp_dw0          = '0;
    //tlp signals
    tlp_tdata        = '0;
    tlp_strb         = '0;
    tlp_valid        = '0;
    tlp_eop          = '0;
    tlp_sop          = '0;
    tlp_error        = '0;

    case (curr_state)
      ST_IDLE: begin
        skid_axis_tready = '1;
        tlp_hdr_c.whole_ = '0;
        if (skid_axis_tvalid && !skid_axis_tlast) begin
          tlp_is_pd_c              = '0;
          tlp_is_3dw_c             = '0;
          tlp_data_c               = '0;
          tlp_is_sop_c             = '1;
          tlp_dw0                  = skid_axis_tdata;
          //pcie tlp core is expecting word swapped
          tlp_hdr_c.struct_.word_0 = tlp_byte_swapped;
          //handle posted request
          if (tlp_dw0.byte0.Fmt inside {TLP_3DW_ND, TLP_3DW_WD}) begin
            tlp_is_3dw_c = '1;
          end
          if (tlp_dw0.byte0.Fmt inside {TLP_3DW_WD, TLP_4DW_WD}) begin
            tlp_is_pd_c = '1;
          end
          //state control
          next_state = ST_TLP_HEADER_WORD_1;
        end
      end
      ST_TLP_HEADER_WORD_1: begin
        skid_axis_tready = '1;
        if (s_axis_tvalid) begin
          //pcie tlp core is expecting word swapped
          tlp_hdr_c.struct_.word_1 = tlp_byte_swapped;
          //next state
          next_state = ST_TLP_HEADER_WORD_2;
        end
      end
      ST_TLP_HEADER_WORD_2: begin
        skid_axis_tready = '1;
        if (s_axis_tvalid) begin
          //pcie tlp core is expecting word and byte swapped
          tlp_hdr_c.struct_.word_2 = tlp_byte_swapped;
          tlp_is_3dw_c = '0;
          //next state
          if (tlp_is_3dw_r) begin
            if (tlp_is_pd_r) begin
              next_state = ST_TLP_STREAM;
            end else begin
              tlp_is_eop_c = '1;
              next_state   = ST_TLP_SEND;
            end
          end else begin
            next_state = ST_TLP_HEADER_WORD_2;
          end
        end

      end
      ST_TLP_HEADER_WORD_3: begin
        skid_axis_tready = '1;
        if (s_axis_tvalid) begin
          //pcie tlp core is expecting word swapped
          tlp_hdr_c.struct_.word_3 = tlp_byte_swapped;
          //next state
          if (tlp_is_pd_r) begin
            next_state = ST_TLP_STREAM;
          end else begin
            tlp_is_eop_c = '1;
            next_state   = ST_TLP_SEND;
          end
        end
      end
      ST_TLP_STREAM: begin
        skid_axis_tready = '1;
        if (s_axis_tvalid) begin
          tlp_data_c[(3-word_count_r)*32+:32] = tlp_byte_swapped;
          word_count_c = word_count_r + 1'b1;
          if (word_count_r >= 8'd3) begin
            next_state = ST_TLP_SEND;
          end
          if (s_axis_tlast) begin
            tlp_is_eop_c = '1;
            next_state   = ST_TLP_SEND;
          end
        end
      end
      ST_TLP_SEND: begin
        tlp_valid = '1;
        if (tlp_ready) begin
          tlp_tdata    = '0;
          tlp_strb     = '0;
          tlp_is_sop_c = '0;
          tlp_is_eop_c = '0;
          tlp_eop      = tlp_is_eop_r;
          tlp_sop      = tlp_is_sop_r;
          next_state   = ST_TLP_STREAM;
          if (tlp_is_eop_r) begin
            next_state = ST_IDLE;
          end else begin
            next_state = ST_IDLE;
          end
          // end
        end
      end
      default: begin
      end
    endcase
  end

  pcie_tlp_fifo #(
      .DEPTH            (1),
      .TLP_DATA_WIDTH   (TLP_DATA_WIDTH),
      .TLP_STRB_WIDTH   (TLP_STRB_WIDTH),
      .TLP_HDR_WIDTH    (TLP_HDR_WIDTH),
      .SEQ_NUM_WIDTH    (8),
      .IN_TLP_SEG_COUNT (1),
      .OUT_TLP_SEG_COUNT(1),
      .WATERMARK        ('0)
  ) pcie_tlp_fifo_inst (
      .clk            (clk_i),
      .rst            (rst_i),
      //tlp in
      .in_tlp_data    (tlp_tdata),
      .in_tlp_strb    (tlp_strb),
      .in_tlp_hdr     (tlp_hdr_r),
      .in_tlp_seq     ('0),
      .in_tlp_bar_id  ('0),
      .in_tlp_func_num('0),
      .in_tlp_error   (tlp_error),
      .in_tlp_valid   (tlp_valid),
      .in_tlp_sop     (tlp_sop),
      .in_tlp_eop     (tlp_eop),
      .in_tlp_ready   (tlp_ready),

      //tlp out
      .out_tlp_data    (rx_tlp_data),
      .out_tlp_strb    (rx_tlp_strb),
      .out_tlp_hdr     (rx_tlp_hdr),
      .out_tlp_seq     (),
      .out_tlp_bar_id  (),
      .out_tlp_func_num(),
      .out_tlp_error   (rx_tlp_error),
      .out_tlp_valid   (rx_tlp_valid),
      .out_tlp_sop     (rx_tlp_sop),
      .out_tlp_eop     (rx_tlp_eop),
      .out_tlp_ready   (rx_tlp_ready),
      .half_full       (),
      .watermark       ()
  );


  //axis input skid buffer
  axis_register #(
      .DATA_WIDTH (DATA_WIDTH),
      .KEEP_ENABLE('1),
      .KEEP_WIDTH (KEEP_WIDTH),
      .LAST_ENABLE('1),
      .ID_ENABLE  ('0),
      .ID_WIDTH   (1),
      .DEST_ENABLE('0),
      .DEST_WIDTH (1),
      .USER_ENABLE('1),
      .USER_WIDTH (USER_WIDTH),
      .REG_TYPE   (SkidBuffer)
  ) axis_register_pipeline_inst (
      .clk          (clk_i),
      .rst          (rst_i),
      .s_axis_tdata (s_axis_tdata),
      .s_axis_tkeep (s_axis_tkeep),
      .s_axis_tvalid(s_axis_tvalid),
      .s_axis_tready(s_axis_tready),
      .s_axis_tlast (s_axis_tlast),
      .s_axis_tuser (s_axis_tuser),
      .s_axis_tid   ('0),
      .s_axis_tdest ('0),
      .m_axis_tdata (skid_axis_tdata),
      .m_axis_tkeep (skid_axis_tkeep),
      .m_axis_tvalid(skid_axis_tvalid),
      .m_axis_tready(skid_axis_tready),
      .m_axis_tlast (skid_axis_tlast),
      .m_axis_tuser (skid_axis_tuser),
      .m_axis_tid   (),
      .m_axis_tdest ()
  );

  /* verilator lint_on WIDTHEXPAND */
  /* verilator lint_on WIDTHTRUNC */
endmodule
