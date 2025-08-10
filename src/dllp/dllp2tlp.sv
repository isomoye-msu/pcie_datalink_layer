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
    parameter int MAX_PAYLOAD_SIZE = 256,
    parameter int RX_FIFO_SIZE = 2
) (
    //clocks and resets
    input  logic                               clk_i,                     // Clock signal
    input  logic                               rst_i,                     // Reset signal
    //link status
    input  pcie_dl_status_e                    link_status_i,
    //TLP AXIS inputs
    input  logic            [  DATA_WIDTH-1:0] s_axis_tdata,
    input  logic            [  KEEP_WIDTH-1:0] s_axis_tkeep,
    input  logic                               s_axis_tvalid,
    input  logic                               s_axis_tlast,
    input  logic            [  USER_WIDTH-1:0] s_axis_tuser,
    output logic                               s_axis_tready,
    //flow control signals
    output logic                               start_flow_control_o,
    input  logic                               start_flow_control_ack_i,
    output logic            [            15:0] next_transmit_seq_o,
    output logic                               tlp_nullified_o,
    output logic            [             7:0] ph_credits_consumed_o,
    output logic            [            11:0] pd_credits_consumed_o,
    output logic            [             7:0] nph_credits_consumed_o,
    output logic            [            11:0] npd_credits_consumed_o,
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
  localparam int PdMinCredits = (MAX_PAYLOAD_SIZE >> 4);
  localparam int FcWaitPeriod = 8'hA0;
  localparam int TlpAxis = 0;
  localparam int UserIsTlp = 1;
  localparam int MaxTlpHdrSizeDW = 4;
  localparam int MaxTlpTotalSizeDW = MaxTlpHdrSizeDW + (MAX_PAYLOAD_SIZE >> 2) + 1;
  localparam int MinRxBufferSize = MaxTlpTotalSizeDW * (RX_FIFO_SIZE);
  localparam int RamDataWidth = DATA_WIDTH;
  localparam int RamAddrWidth = $clog2(MinRxBufferSize);
  localparam int NumPipelines = 3;

  //dllp to tlp fsm emum
  typedef enum logic [4:0] {
    ST_IDLE,
    ST_CHECK_TLP_TYPE,
    ST_TLP_STREAM,
    ST_TLP_LAST,
    ST_CHECK_CRC,
    ST_SEND_ACK,
    ST_SEND_ACK_CRC,
    ST_BUILD_FC_DLLP,
    ST_SEND_FC_DLLP,
    ST_SEND_FC_DLLP_CRC
  } dll_rx_st_e;


  logic [          31:0] crc_output;
  logic [          31:0] crc_reversed;
  logic [          15:0] dllp_crc_out;
  logic [          15:0] dllp_crc_reversed;


  //axis signals
  logic [DATA_WIDTH-1:0] tlp_axis_tdata;
  logic [KEEP_WIDTH-1:0] tlp_axis_tkeep;
  logic                  tlp_axis_tvalid;
  logic                  tlp_axis_tlast;
  logic [USER_WIDTH-1:0] tlp_axis_tuser;
  logic                  tlp_axis_tready;


  logic [DATA_WIDTH-1:0] skid_axis_tdata;
  logic [KEEP_WIDTH-1:0] skid_axis_tkeep;
  logic                  skid_axis_tvalid;
  logic                  skid_axis_tlast;
  logic [USER_WIDTH-1:0] skid_axis_tuser;
  logic                  skid_axis_tready;

  typedef struct {
    //tlp nulled
    logic        fc_start;
    logic        tlp_nullified;
    //transmit sequence logic
    logic [15:0] next_transmit_seq;
    logic [15:0] next_expected_seq_num;
    logic [11:0] ackd_transmit_seq;
    //crc helper signals
    logic [31:0] crc_from_tlp;
    logic [31:0] crc_calculated;
    logic [31:0] dllp_lcrc;
    logic [31:0] word_count;

    //tlp type signals
    logic                                    tlp_is_cplh;
    logic                                    tlp_is_nph;
    logic                                    tlp_is_ph;
    logic                                    tlp_is_npd;
    logic                                    tlp_is_pd;
    logic                                    tlp_is_cpld;
    //axis signals
    logic [NumPipelines-1:0][DATA_WIDTH-1:0] axis_tdata;
    logic [NumPipelines-1:0][KEEP_WIDTH-1:0] axis_tkeep;
    logic [NumPipelines-1:0]                 axis_tvalid;
    logic [NumPipelines-1:0]                 axis_tlast;
    logic [NumPipelines-1:0][USER_WIDTH-1:0] axis_tuser;
    logic [NumPipelines-1:0]                 axis_tready;
    //credits tracking signals
    logic [7:0]                              ph_credits_consumed;
    logic [11:0]                             pd_credits_consumed;
    logic [7:0]                              nph_credits_consumed;
    logic [11:0]                             npd_credits_consumed;
    logic [7:0]                              cplh_credits_consumed;
    logic [11:0]                             cpld_credits_consumed;


    dll_rx_st_e state;

  } dllp2tlp_t;


  dllp_union_t                 dll_packet;
  pcie_tlp_header_dw0_t        tlp_dw0;
  logic                 [15:0] tlp_header_offset;
  logic                 [ 1:0] crc_byte_select;

  dllp2tlp_t                   D;
  dllp2tlp_t                   Q;

  //main sequential block
  always_ff @(posedge clk_i) begin : main_seq
    if (rst_i) begin
      Q <= '{
          state : ST_IDLE,
          dllp_lcrc             : '1,
          crc_calculated        : '1,
          ph_credits_consumed : HdrMinCredits,
          pd_credits_consumed : PdMinCredits,
          nph_credits_consumed : HdrMinCredits,
          npd_credits_consumed : PdMinCredits,
          cplh_credits_consumed : HdrMinCredits,
          cpld_credits_consumed : PdMinCredits,
          default: 'd0
      };
    end else begin
      Q <= D;
    end
  end


  always_comb begin : byteswap
    for (int i = 0; i < 8; i++) begin
      crc_reversed[i]        = Q.crc_calculated[7-i];
      crc_reversed[i+8]      = Q.crc_calculated[15-i];
      crc_reversed[i+16]     = Q.crc_calculated[23-i];
      crc_reversed[i+24]     = Q.crc_calculated[31-i];
      dllp_crc_reversed[i]   = Q.dllp_lcrc[7-i];
      dllp_crc_reversed[i+8] = Q.dllp_lcrc[15-i];
    end
  end


  always_comb begin : main_combo
    D                 = Q;
    crc_byte_select   = '0;
    skid_axis_tready  = '0;
    tlp_dw0           = '0;
    dll_packet        = '0;
    tlp_header_offset = '0;
    D.fc_start        = '0;
    //tlp axis signals
    tlp_axis_tdata    = '0;
    tlp_axis_tkeep    = '0;
    tlp_axis_tvalid   = '0;
    tlp_axis_tlast    = '0;
    tlp_axis_tuser    = '0;

    if (skid_axis_tvalid && skid_axis_tready) begin

      for (int pipeline_idx = 0; pipeline_idx < NumPipelines; pipeline_idx++) begin
        if (pipeline_idx == 0) begin
          D.axis_tdata[pipeline_idx]  = skid_axis_tdata;
          D.axis_tkeep[pipeline_idx]  = skid_axis_tkeep;
          D.axis_tvalid[pipeline_idx] = skid_axis_tvalid;
          D.axis_tlast[pipeline_idx]  = skid_axis_tlast;
          D.axis_tuser[pipeline_idx]  = skid_axis_tuser;
          D.axis_tready[pipeline_idx] = skid_axis_tready;
        end else begin
          D.axis_tdata[pipeline_idx]  = Q.axis_tdata[pipeline_idx-1];
          D.axis_tkeep[pipeline_idx]  = Q.axis_tkeep[pipeline_idx-1];
          D.axis_tvalid[pipeline_idx] = Q.axis_tvalid[pipeline_idx-1];
          D.axis_tlast[pipeline_idx]  = Q.axis_tlast[pipeline_idx-1];
          D.axis_tuser[pipeline_idx]  = Q.axis_tuser[pipeline_idx-1];
          D.axis_tready[pipeline_idx] = Q.axis_tready[pipeline_idx-1];
        end
      end





    end
    case (Q.state)
      ST_IDLE: begin
        skid_axis_tready = tlp_axis_tready && (link_status_i == DL_ACTIVE);
        if (skid_axis_tready && skid_axis_tvalid && !skid_axis_tlast) begin
          //store incoming sequence number
          D.next_transmit_seq = {skid_axis_tdata[7:0], skid_axis_tdata[15:8]};
          crc_byte_select     = 2'b11;
          //tlp type
          D.tlp_is_nph        = '0;
          D.tlp_is_pd         = '0;
          D.tlp_is_ph         = '0;
          D.tlp_is_npd        = '0;
          D.tlp_is_cplh       = '0;
          D.tlp_is_cpld       = '0;
          D.crc_calculated    = '1;
          D.word_count        = '0;
          //state control
          D.state             = ST_CHECK_TLP_TYPE;
        end
      end
      ST_CHECK_TLP_TYPE: begin
        skid_axis_tready = tlp_axis_tready && skid_axis_tvalid;
        crc_byte_select  = 2'b11;
        if (skid_axis_tready) begin
          D.crc_calculated = crc_output;
          //shift data_in to account for seq_num offset
          tlp_axis_tdata   = {skid_axis_tdata[15:0], Q.axis_tdata[0][31:16]};
          tlp_axis_tkeep   = '1;
          tlp_axis_tvalid  = '1;
          tlp_dw0          = tlp_axis_tdata;
          D.word_count     = {tlp_dw0.byte2.Length1, tlp_dw0.byte3.Length0};
          //handle posted request
          if (tlp_dw0.byte0 inside {MRd, MRdLk, IORd, CfgRd0, CfgRd1, TCfgRd}) begin
            D.tlp_is_nph = '1;
          end else if (tlp_dw0.byte0 inside {MWr, MsgD}) begin
            D.tlp_is_pd = '1;
          end else if (tlp_dw0.byte0 inside {Msg}) begin
            D.tlp_is_ph = '1;
          end else if (tlp_dw0.byte0 inside {IOWr, CfgWr0, CfgWr1,TCfgWr,FetchAdd,
          Swap,CAS}) begin
            D.tlp_is_npd = '1;
          end else if (tlp_dw0.byte0 inside {Cpl, CplLk}) begin
            D.tlp_is_cplh = '1;
          end else if (tlp_dw0.byte0 inside {CplD, CplDLk}) begin
            D.tlp_is_cpld = '1;
          end
          //next state
          D.state = ST_TLP_STREAM;
        end
      end
      ST_TLP_STREAM: begin
        skid_axis_tready = tlp_axis_tready && skid_axis_tvalid;
        crc_byte_select  = 2'b11;
        if (skid_axis_tready) begin
          D.crc_calculated = crc_output;
          tlp_axis_tdata   = {skid_axis_tdata[15:0], Q.axis_tdata[0][31:16]};
          tlp_axis_tkeep   = skid_axis_tkeep;
          tlp_axis_tvalid  = '1;
          if (skid_axis_tlast) begin
            D.word_count    = Q.word_count;
            tlp_axis_tvalid = '0;
            D.state         = ST_TLP_LAST;
            //if last packet of tlp, store crc from phy
            case (skid_axis_tkeep)
              4'b0001: begin
                crc_byte_select = '1;
                tlp_axis_tvalid = '1;
                D.crc_from_tlp  = {s_axis_tdata[7:0], skid_axis_tdata[31:8]};
              end
              4'b0011: begin
                crc_byte_select = 2'b11;
                D.crc_from_tlp  = {s_axis_tdata[15:0], skid_axis_tdata[31:16]};
              end
              4'b0111: begin
                crc_byte_select = 2'b11;
                D.crc_from_tlp  = {s_axis_tdata[23:0], skid_axis_tdata[31:24]};
              end
              4'b1111: begin
                crc_byte_select = '1;
                D.crc_from_tlp  = s_axis_tdata;
              end
              default: begin
              end
            endcase
          end
        end
      end
      ST_TLP_LAST: begin
        crc_byte_select = 2'b11;
        if (tlp_axis_tready) begin
          D.crc_calculated = crc_output;
          D.state = ST_CHECK_CRC;
          //if last packet of tlp, store crc from phy
          case (skid_axis_tkeep)
            4'b0001: begin
              crc_byte_select = '0;
            end
            4'b0011: begin
              crc_byte_select = 2'b01;
            end
            4'b0111: begin
              crc_byte_select = 2'b10;
            end
            4'b1111: begin
              crc_byte_select = '1;
            end
            default: begin
            end
          endcase
          // end
        end
      end
      ST_CHECK_CRC: begin
        tlp_axis_tdata   = {Q.axis_tdata[0][15:0], Q.axis_tdata[1][31:16]};
        tlp_axis_tvalid  = '1;
        tlp_axis_tlast   = '1;
        D.crc_calculated = '1;
        //default to dllp ack state
        D.state          = ST_SEND_ACK;
        D.fc_start       = '1;
        //assign tkeep based on last keep and alignement
        case (skid_axis_tkeep)
          4'b0001: begin
            tlp_axis_tkeep = 4'b0111;
          end
          4'b0011: begin
            tlp_axis_tkeep = 4'b1111;
          end
          4'b0111: begin
            tlp_axis_tkeep = 4'b0001;
          end
          4'b1111: begin
            tlp_axis_tkeep = 4'b0011;
          end
          default: begin
            //unknown keep value... null tlp buffer
            D.tlp_nullified = '1;
            tlp_axis_tuser  = '1;
          end
        endcase
        //check crc
        if ((crc_reversed == Q.crc_from_tlp) && (Q.next_transmit_seq == Q.next_transmit_seq)) begin
          if (Q.tlp_is_nph) begin
            D.nph_credits_consumed = Q.nph_credits_consumed + 8'h1;
          end else if (Q.tlp_is_npd) begin
            D.nph_credits_consumed = Q.nph_credits_consumed + 8'h1;
            D.npd_credits_consumed = Q.npd_credits_consumed +
            (Q.word_count >> 2 == '0 ? 1'b1 : Q.word_count >> 2);
          end else if (Q.tlp_is_ph) begin
            D.npd_credits_consumed = Q.ph_credits_consumed + 8'h1;
          end else if (Q.tlp_is_pd) begin
            D.npd_credits_consumed = Q.ph_credits_consumed + 8'h1;
            D.pd_credits_consumed = Q.pd_credits_consumed +
            (Q.word_count >> 2 == '0 ? 1'b1 : Q.word_count >> 2);
          end else if (Q.tlp_is_cplh) begin
            D.cplh_credits_consumed = Q.cplh_credits_consumed + 8'h1;
          end else if (Q.tlp_is_cpld) begin
            D.cplh_credits_consumed = Q.cplh_credits_consumed + 8'h1;
            D.cpld_credits_consumed = Q.cpld_credits_consumed +
            (Q.word_count >> 2 == '0 ? 1'b1 : Q.word_count >> 2);
          end
        end else begin
          //send nack... retry
          tlp_axis_tuser  = '1;
          D.tlp_nullified = '1;
        end
      end
      ST_SEND_ACK: begin
        D.fc_start = '1;
        if (start_flow_control_ack_i) begin
          if (!Q.tlp_nullified) begin
            D.next_expected_seq_num = Q.next_transmit_seq + 32'h1;
          end
          D.tlp_is_nph     = '0;
          D.tlp_is_pd      = '0;
          D.tlp_is_ph      = '0;
          D.tlp_is_npd     = '0;
          D.tlp_is_cplh    = '0;
          D.tlp_is_cpld    = '0;
          D.crc_calculated = '1;
          D.state          = ST_IDLE;
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
      .DEPTH               (RX_FIFO_SIZE * MAX_PAYLOAD_SIZE),
      .DATA_WIDTH          (DATA_WIDTH),
      .KEEP_ENABLE         (KEEP_WIDTH > 0),
      .KEEP_WIDTH          (KEEP_WIDTH),
      .LAST_ENABLE         (1),
      .ID_ENABLE           (0),
      .DEST_ENABLE         (0),
      .USER_ENABLE         ('1),
      .USER_WIDTH          (USER_WIDTH),
      // .PIPELINE_OUTPUT(2),
      .FRAME_FIFO          (1),
      .USER_BAD_FRAME_VALUE('1),
      .USER_BAD_FRAME_MASK ('1),
      // .PIPELINE_OUTPUT(),
      .DROP_BAD_FRAME      (1),
      .DROP_WHEN_FULL      (0)
  ) dllp2tlp_fifo_inst (
      .clk                (clk_i),
      .rst                (rst_i),
      // AXI input
      .s_axis_tdata       (tlp_axis_tdata),
      .s_axis_tkeep       (tlp_axis_tkeep),
      .s_axis_tvalid      (tlp_axis_tvalid),
      .s_axis_tready      (tlp_axis_tready),
      .s_axis_tlast       (tlp_axis_tlast),
      .s_axis_tuser       (tlp_axis_tuser),
      .s_axis_tid         (),
      .s_axis_tdest       (),
      // AXI output
      .m_axis_tdata       (m_tlp_axis_tdata),
      .m_axis_tkeep       (m_tlp_axis_tkeep),
      .m_axis_tvalid      (m_tlp_axis_tvalid),
      .m_axis_tready      (m_tlp_axis_tready),
      .m_axis_tlast       (m_tlp_axis_tlast),
      .m_axis_tuser       (m_tlp_axis_tuser),
      .m_axis_tid         (),
      .m_axis_tdest       (),
      .pause_ack          (),
      .pause_req          (),
      .status_depth       (),
      .status_depth_commit(),
      // Status
      .status_overflow    (),
      .status_bad_frame   (),
      .status_good_frame  ()
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

  //axis pipeline skid buffer
  // axis_register #(
  //     .DATA_WIDTH (DATA_WIDTH),
  //     .KEEP_ENABLE('1),
  //     .KEEP_WIDTH (KEEP_WIDTH),
  //     .LAST_ENABLE('1),
  //     .ID_ENABLE  ('0),
  //     .ID_WIDTH   (1),
  //     .DEST_ENABLE('0),
  //     .DEST_WIDTH (1),
  //     .USER_ENABLE('1),
  //     .USER_WIDTH (USER_WIDTH),
  //     .REG_TYPE   (SkidBuffer)
  // ) axis_register_inst (
  //     .clk          (clk_i),
  //     .rst          (rst_i),
  //     .s_axis_tdata (skid_axis_tdata),
  //     .s_axis_tkeep (skid_axis_tkeep),
  //     .s_axis_tvalid(skid_axis_tvalid),
  //     .s_axis_tready(),
  //     .s_axis_tlast (skid_axis_tlast),
  //     .s_axis_tuser (skid_axis_tuser),
  //     .s_axis_tid   ('0),
  //     .s_axis_tdest ('0),
  //     .m_axis_tdata (Q.axis_tdata[0]),
  //     .m_axis_tkeep (pipeline_axis_tkeep),
  //     .m_axis_tvalid(pipeline_axis_tvalid),
  //     .m_axis_tready(skid_axis_tready),
  //     .m_axis_tlast (pipeline_axis_tlast),
  //     .m_axis_tid   (),
  //     .m_axis_tdest (),
  //     .m_axis_tuser (pipeline_axis_tuser)
  // );


  //axis pipeline skid buffer
  // axis_register #(
  //     .DATA_WIDTH (DATA_WIDTH),
  //     .KEEP_ENABLE('1),
  //     .KEEP_WIDTH (KEEP_WIDTH),
  //     .LAST_ENABLE('1),
  //     .ID_ENABLE  ('0),
  //     .ID_WIDTH   (1),
  //     .DEST_ENABLE('0),
  //     .DEST_WIDTH (1),
  //     .USER_ENABLE('1),
  //     .USER_WIDTH (USER_WIDTH),
  //     .REG_TYPE   (SkidBuffer)
  // ) axis_register_pipeline_stage_2_inst (
  //     .clk          (clk_i),
  //     .rst          (rst_i),
  //     .s_axis_tdata (Q.axis_tdata[0]),
  //     .s_axis_tkeep (pipeline_axis_tkeep),
  //     .s_axis_tvalid(pipeline_axis_tvalid),
  //     .s_axis_tready(),
  //     .s_axis_tlast (pipeline_axis_tlast),
  //     .s_axis_tuser (pipeline_axis_tuser),
  //     .s_axis_tid   ('0),
  //     .s_axis_tdest ('0),
  //     .m_axis_tdata (pipeline_stg2_axis_tdata),
  //     .m_axis_tkeep (pipeline_stg2_axis_tkeep),
  //     .m_axis_tvalid(pipeline_stg2_axis_tvalid),
  //     .m_axis_tready(skid_axis_tready),
  //     .m_axis_tlast (pipeline_stg2_axis_tlast),
  //     .m_axis_tid   (),
  //     .m_axis_tdest (),
  //     .m_axis_tuser (pipeline_stg2_axis_tuser)
  // );

  //tlp crc instance
  pcie_lcrc16 tlp_crc16_inst (
      .data  (Q.axis_tdata[0]),
      .crcIn (Q.crc_calculated),
      .select(crc_byte_select),
      .crcOut(crc_output)
  );

  //output assignments
  assign next_transmit_seq_o    = Q.next_transmit_seq;
  assign tlp_nullified_o        = Q.tlp_nullified;
  assign ph_credits_consumed_o  = Q.ph_credits_consumed;
  assign pd_credits_consumed_o  = Q.pd_credits_consumed;
  assign nph_credits_consumed_o = Q.nph_credits_consumed;
  assign npd_credits_consumed_o = Q.npd_credits_consumed;
  assign start_flow_control_o   = Q.fc_start;

  /* verilator lint_on WIDTHEXPAND */
  /* verilator lint_on WIDTHTRUNC */
endmodule
