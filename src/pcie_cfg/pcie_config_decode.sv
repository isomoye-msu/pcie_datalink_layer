//! @title dllp2tlp
//! @author Idris Somoye
//! Module coverts axis tlp packets to pcie avalon type tlp packets.
module pcie_config_decode
  import pcie_datalink_pkg::*;
  import pcie_tlp_pkg::*;
#(
    // TLP data width
    parameter int DATA_WIDTH = 32,
    // TLP strobe width
    parameter int STRB_WIDTH = DATA_WIDTH / 8,
    parameter int KEEP_WIDTH = STRB_WIDTH,
    parameter int USER_WIDTH = 1,
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
  // localparam int PdMinCredits = (MAX_PAYLOAD_SIZE >> 4);
  // localparam int FcWaitPeriod = 8'hA0;
  // localparam int TlpAxis = 0;
  // localparam int UserIsTlp = 1;
  // localparam int MaxTlpHdrSizeDW = 4;
  // localparam int MaxTlpTotalSizeDW = MaxTlpHdrSizeDW + (MAX_PAYLOAD_SIZE >> 2) + 1;
  // localparam int MinRxBufferSize = MaxTlpTotalSizeDW * (RX_FIFO_SIZE);
  // localparam int RamDataWidth = DATA_WIDTH;
  // localparam int RamAddrWidth = $clog2(MinRxBufferSize);

  //dllp to tlp fsm emum
  typedef enum logic [4:0] {
    ST_IDLE,
    ST_TLP_HEADER_WORD_0,
    ST_TLP_HEADER_WORD_1,
    ST_TLP_HEADER_WORD_2,
    ST_TLP_HEADER_WORD_3,
    ST_TLP_STREAM,
    ST_TLP_SEND
  } cfg_decode_state_t;


  //   axis_pcie_conv_t                            Q.state;
  //   axis_pcie_conv_t                            D.state;

  typedef struct packed {
    cfg_decode_state_t         state;
    tlp_hdr_union_t            tlp_hdr;
    logic [31:0]               word_count;
    logic                      tlp_is_3dw;
    logic                      tlp_is_pd;
    logic                      tlp_is_sop;
    logic                      tlp_is_eop;
    logic [TLP_DATA_WIDTH-1:0] tlp_data;
  } cfg_decode_t;

  cfg_decode_t D, Q;


  //   tlp_hdr_union_t                             D.tlp_hdr;
  //   tlp_hdr_union_t                             Q.tlp_hdr;
  //   logic                 [               31:0] D.word_count;
  //   logic                 [               31:0] Q.word_count;
  //tlp type signals
  pcie_tlp_header_dw0_t                       tlp_dw0;
  //   logic                                       tlp_is_3dw;
  //   logic                                       tlp_is_3dw_r;
  //   logic                                       D.tlp_is_sop;
  //   logic                                       Q.tlp_is_sop;
  //   logic                                       D.tlp_is_pd;
  //   logic                                       tlp_is_pd_r;
  //   logic                                       D.tlp_is_eop;
  //   logic                                       Q.tlp_is_eop;

  //   logic                 [ TLP_DATA_WIDTH-1:0] D.tlp_data;
  //   logic                 [ TLP_DATA_WIDTH-1:0] tlp_data_r;
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
      Q <= '{state: ST_IDLE, default: 'd0};
    end else begin
      Q <= D;
    end
  end


  always_comb begin : byte_swap_tlp
    for (int i = 0; i < 4; i++) begin
      tlp_byte_swapped[(8*i)+:8] = skid_axis_tdata[8*(3-i)+:8];
    end
  end


  always_comb begin : main_combo
    // D.state       = Q.state;
    D                = Q;
    //skid data
    skid_axis_tready = '0;
    //tlp signals
    tlp_tdata        = '0;
    tlp_strb         = '0;
    tlp_valid        = '0;
    tlp_eop          = '0;
    tlp_sop          = '0;
    tlp_error        = '0;

    case (Q.state)
      ST_IDLE: begin
        skid_axis_tready = '1;
        D.tlp_hdr.whole_ = '0;
        if (skid_axis_tvalid && !skid_axis_tlast) begin
          D.tlp_is_3dw             = '0;
          D.tlp_data               = '0;
          D.tlp_is_sop             = '1;
          tlp_dw0                  = skid_axis_tdata;
          //pcie tlp core is expecting word swapped
          D.tlp_hdr.struct_.word_0 = tlp_byte_swapped;
          //handle posted request
          if (tlp_dw0.byte0.Fmt inside {TLP_3DW_WD, TLP_3DW_ND}) begin
            D.tlp_is_3dw = '1;
          end
          if (tlp_dw0.byte0.Fmt inside {TLP_4DW_ND, TLP_4DW_WD}) begin
            D.tlp_is_pd = '1;
          end
          //state control
          D.state = ST_TLP_HEADER_WORD_1;
        end
      end
      ST_TLP_HEADER_WORD_1: begin
        skid_axis_tready = '1;
        if (skid_axis_tvalid) begin
          //pcie tlp core is expecting word swapped
          D.tlp_hdr.struct_.word_1 = tlp_byte_swapped;
          //next state
          D.state = ST_TLP_HEADER_WORD_2;
        end
      end
      ST_TLP_HEADER_WORD_2: begin
        skid_axis_tready = '1;
        if (skid_axis_tvalid) begin
          //pcie tlp core is expecting word and byte swapped
          D.tlp_hdr.struct_.word_2 = tlp_byte_swapped;
          D.tlp_is_3dw = '0;
          //next state
          if (Q.tlp_is_3dw) begin
            if (Q.tlp_is_pd) begin
              D.state = ST_TLP_STREAM;
            end else begin
              D.tlp_is_eop = '1;
              D.state = ST_TLP_SEND;
            end
          end else begin
            D.state = ST_TLP_HEADER_WORD_3;
          end
        end

      end
      ST_TLP_HEADER_WORD_3: begin
        skid_axis_tready = '1;
        if (skid_axis_tvalid) begin
          //pcie tlp core is expecting word swapped
          D.tlp_hdr.struct_.word_3 = tlp_byte_swapped;
          //next state
          if (Q.tlp_is_pd) begin
            D.state = ST_TLP_STREAM;
          end else begin
            D.tlp_is_eop = '1;
            D.state = ST_TLP_SEND;
          end
        end
      end
      ST_TLP_STREAM: begin
        skid_axis_tready = '1;
        if (s_axis_tvalid) begin
          D.tlp_data[(3-Q.word_count)*32+:32] = tlp_byte_swapped;
          D.word_count = Q.word_count + 1'b1;
          if (Q.word_count >= 8'd3) begin
            D.state = ST_TLP_SEND;
          end
          if (s_axis_tlast) begin
            D.tlp_is_eop = '1;
            D.state = ST_TLP_SEND;
          end
        end
      end
      ST_TLP_SEND: begin
        tlp_valid = '1;
        if (tlp_ready) begin
          tlp_tdata    = '0;
          tlp_strb     = '0;
          D.tlp_is_sop = '0;
          D.tlp_is_eop = '0;
          tlp_eop      = Q.tlp_is_eop;
          tlp_sop      = Q.tlp_is_sop;
          D.state      = ST_TLP_STREAM;
          if (Q.tlp_is_eop) begin
            D.tlp_is_eop = '0;
            D.state = ST_IDLE;
          end
          // end
        end
      end
      default: begin
      end
    endcase
  end


  assign rx_tlp_data  = tlp_tdata;
  assign rx_tlp_strb  = tlp_strb;
  assign rx_tlp_hdr   = Q.tlp_hdr;
  assign rx_tlp_error = tlp_error;
  assign rx_tlp_valid = tlp_valid;
  assign rx_tlp_sop   = tlp_sop;
  assign rx_tlp_eop   = tlp_eop;
  assign tlp_ready    = rx_tlp_ready;

  // pcie_tlp_fifo #(
  //     .DEPTH            (2048),
  //     .TLP_DATA_WIDTH   (TLP_DATA_WIDTH),
  //     .TLP_STRB_WIDTH   (TLP_STRB_WIDTH),
  //     .TLP_HDR_WIDTH    (TLP_HDR_WIDTH),
  //     .SEQ_NUM_WIDTH    (6),
  //     .IN_TLP_SEG_COUNT (1),
  //     .OUT_TLP_SEG_COUNT(1),
  //     .WATERMARK        ('0)
  // ) pcie_tlp_fifo_inst (
  //     .clk            (clk_i),
  //     .rst            (rst_i),
  //     //tlp in
  //     .in_tlp_data    (tlp_tdata),
  //     .in_tlp_strb    (tlp_strb),
  //     .in_tlp_hdr     (Q.tlp_hdr),
  //     .in_tlp_seq     ('0),
  //     .in_tlp_bar_id  ('0),
  //     .in_tlp_func_num('0),
  //     .in_tlp_error   (tlp_error),
  //     .in_tlp_valid   (tlp_valid),
  //     .in_tlp_sop     (tlp_sop),
  //     .in_tlp_eop     (tlp_eop),
  //     .in_tlp_ready   (tlp_ready),

  //     //tlp out
  //     .out_tlp_data    (rx_tlp_data),
  //     .out_tlp_strb    (rx_tlp_strb),
  //     .out_tlp_hdr     (rx_tlp_hdr),
  //     .out_tlp_seq     (),
  //     .out_tlp_bar_id  (),
  //     .out_tlp_func_num(),
  //     .out_tlp_error   (rx_tlp_error),
  //     .out_tlp_valid   (rx_tlp_valid),
  //     .out_tlp_sop     (rx_tlp_sop),
  //     .out_tlp_eop     (rx_tlp_eop),
  //     .out_tlp_ready   (rx_tlp_ready),
  //     .half_full       (),
  //     .watermark       ()
  // );


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
