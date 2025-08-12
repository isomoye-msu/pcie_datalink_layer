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


dll_rx_st_e                            curr_state;
dll_rx_st_e                            next_state;
dllp_union_t                           dll_packet;
//tlp nulled
logic                                  fc_start_c;
logic                                  fc_start_r;
logic                                  tlp_nullified_c;
logic                                  tlp_nullified_r;
//transmit sequence logic
logic                 [          15:0] next_transmit_seq_c;
logic                 [          15:0] next_transmit_seq_r;
logic                 [          15:0] next_expected_seq_num_c;
logic                 [          15:0] next_expected_seq_num_r;
logic                 [          11:0] ackd_transmit_seq_c;
logic                 [          15:0] ackd_transmit_seq_r;
//crc helper signals
logic                 [          31:0] crc_from_tlp_c;
logic                 [          31:0] crc_from_tlp_r;
logic                 [          31:0] crc_calculated_c;
logic                 [          31:0] crc_calculated_r;
logic                 [          31:0] crc_output;
logic                 [          31:0] crc_reversed;
logic                 [          15:0] dllp_crc_out;
logic                 [          15:0] dllp_crc_reversed;
logic                 [          31:0] dllp_lcrc_c;
logic                 [          31:0] dllp_lcrc_r;
logic                 [          31:0] word_count_c;
logic                 [          31:0] word_count_r;
logic                 [           1:0] crc_byte_select;
//tlp type signals
pcie_tlp_header_dw0_t                  tlp_dw0;
logic                                  tlp_is_cplh_c;
logic                                  tlp_is_cplh_r;
logic                                  tlp_is_nph_c;
logic                                  tlp_is_nph_r;
logic                                  tlp_is_ph_c;
logic                                  tlp_is_ph_r;
logic                                  tlp_is_npd_c;
logic                                  tlp_is_npd_r;
logic                                  tlp_is_pd_c;
logic                                  tlp_is_pd_r;
logic                                  tlp_is_cpld_c;
logic                                  tlp_is_cpld_r;
//skid buffer axis signals
logic                 [DATA_WIDTH-1:0] skid_axis_tdata;
logic                 [KEEP_WIDTH-1:0] skid_axis_tkeep;
logic                                  skid_axis_tvalid;
logic                                  skid_axis_tlast;
logic                 [USER_WIDTH-1:0] skid_axis_tuser;
logic                                  skid_axis_tready;
// tlp pipeline axis bus
logic                 [DATA_WIDTH-1:0] pipeline_axis_tdata;
logic                 [KEEP_WIDTH-1:0] pipeline_axis_tkeep;
logic                                  pipeline_axis_tvalid;
logic                                  pipeline_axis_tlast;
logic                 [USER_WIDTH-1:0] pipeline_axis_tuser;
logic                                  pipeline_axis_tready;
// tlp second stage pipeline axis bus
logic                 [DATA_WIDTH-1:0] pipeline_stg2_axis_tdata;
logic                 [KEEP_WIDTH-1:0] pipeline_stg2_axis_tkeep;
logic                                  pipeline_stg2_axis_tvalid;
logic                                  pipeline_stg2_axis_tlast;
logic                 [USER_WIDTH-1:0] pipeline_stg2_axis_tuser;
logic                                  pipeline_stg2_axis_tready;
//phy response signals
// logic                 [DATA_WIDTH-1:0] phy_axis_tdata;
// logic                 [KEEP_WIDTH-1:0] phy_axis_tkeep;
// logic                                  phy_axis_tvalid;
// logic                                  phy_axis_tlast;
// logic                 [USER_WIDTH-1:0] phy_axis_tuser;
// logic                                  phy_axis_tready;
//tlp output axis signals
logic                 [DATA_WIDTH-1:0] tlp_axis_tdata;
logic                 [KEEP_WIDTH-1:0] tlp_axis_tkeep;
logic                                  tlp_axis_tvalid;
logic                                  tlp_axis_tlast;
logic                 [USER_WIDTH-1:0] tlp_axis_tuser;
logic                                  tlp_axis_tready;
//credits tracking signals
logic                 [          15:0] tlp_header_offset;
logic                 [           7:0] ph_credits_consumed_c;
logic                 [           7:0] ph_credits_consumed_r;
logic                 [          11:0] pd_credits_consumed_c;
logic                 [          11:0] pd_credits_consumed_r;
logic                 [           7:0] nph_credits_consumed_c;
logic                 [           7:0] nph_credits_consumed_r;
logic                 [          11:0] npd_credits_consumed_c;
logic                 [          11:0] npd_credits_consumed_r;
logic                 [           7:0] cplh_credits_consumed_c;
logic                 [           7:0] cplh_credits_consumed_r;
logic                 [          11:0] cpld_credits_consumed_c;
logic                 [          11:0] cpld_credits_consumed_r;

//main sequential block
always_ff @(posedge clk_i) begin : main_seq
  if (rst_i) begin
    curr_state              <= ST_IDLE;
    next_transmit_seq_r     <= '0;
    next_expected_seq_num_r <= '0;
    dllp_lcrc_r             <= '1;
    crc_calculated_r        <= '1;
    ph_credits_consumed_r   <= HdrMinCredits;
    pd_credits_consumed_r   <= PdMinCredits;
    nph_credits_consumed_r  <= HdrMinCredits;
    npd_credits_consumed_r  <= PdMinCredits;
    cplh_credits_consumed_r <= HdrMinCredits;
    cpld_credits_consumed_r <= PdMinCredits;
    tlp_nullified_r         <= '0;
    fc_start_r              <= '0;
  end else begin
    curr_state              <= next_state;
    next_transmit_seq_r     <= next_transmit_seq_c;
    next_expected_seq_num_r <= next_expected_seq_num_c;
    dllp_lcrc_r             <= dllp_lcrc_c;
    crc_calculated_r        <= crc_calculated_c;
    ph_credits_consumed_r   <= ph_credits_consumed_c;
    pd_credits_consumed_r   <= pd_credits_consumed_c;
    nph_credits_consumed_r  <= nph_credits_consumed_c;
    npd_credits_consumed_r  <= npd_credits_consumed_c;
    cplh_credits_consumed_r <= cplh_credits_consumed_c;
    cpld_credits_consumed_r <= cpld_credits_consumed_c;
    tlp_nullified_r         <= tlp_nullified_c;
    fc_start_r              <= fc_start_c;
  end
  //non resetable
  word_count_r   <= word_count_c;
  tlp_is_cplh_r  <= tlp_is_cplh_c;
  tlp_is_nph_r   <= tlp_is_nph_c;
  tlp_is_ph_r    <= tlp_is_ph_c;
  tlp_is_cpld_r  <= tlp_is_cpld_c;
  tlp_is_npd_r   <= tlp_is_npd_c;
  tlp_is_pd_r    <= tlp_is_pd_c;
  crc_from_tlp_r <= crc_from_tlp_c;
end


always_comb begin : byteswap
  for (int i = 0; i < 8; i++) begin
    crc_reversed[i]        = crc_calculated_r[7-i];
    crc_reversed[i+8]      = crc_calculated_r[15-i];
    crc_reversed[i+16]     = crc_calculated_r[23-i];
    crc_reversed[i+24]     = crc_calculated_r[31-i];
    dllp_crc_reversed[i]   = dllp_lcrc_r[7-i];
    dllp_crc_reversed[i+8] = dllp_lcrc_r[15-i];
  end
end


always_comb begin : main_combo
  next_state              = curr_state;
  dllp_lcrc_c             = dllp_lcrc_r;
  crc_calculated_c        = crc_calculated_r;
  crc_byte_select         = '0;
  crc_from_tlp_c          = crc_from_tlp_r;
  word_count_c            = word_count_r;
  tlp_is_cplh_c           = tlp_is_cplh_r;
  tlp_is_nph_c            = tlp_is_nph_r;
  tlp_is_ph_c             = tlp_is_ph_r;
  tlp_is_cpld_c           = tlp_is_cpld_r;
  tlp_is_npd_c            = tlp_is_npd_r;
  tlp_is_pd_c             = tlp_is_pd_r;
  skid_axis_tready        = '0;
  tlp_dw0                 = '0;
  dll_packet              = '0;
  tlp_header_offset       = '0;
  tlp_nullified_c         = tlp_nullified_r;
  fc_start_c              = '0;
  //tlp axis signals
  tlp_axis_tdata          = '0;
  tlp_axis_tkeep          = '0;
  tlp_axis_tvalid         = '0;
  tlp_axis_tlast          = '0;
  tlp_axis_tuser          = '0;
  ph_credits_consumed_c   = ph_credits_consumed_r;
  pd_credits_consumed_c   = pd_credits_consumed_r;
  nph_credits_consumed_c  = nph_credits_consumed_r;
  npd_credits_consumed_c  = npd_credits_consumed_r;
  cplh_credits_consumed_c = cplh_credits_consumed_r;
  cpld_credits_consumed_c = cpld_credits_consumed_r;
  next_transmit_seq_c     = next_transmit_seq_r;
  next_expected_seq_num_c = next_expected_seq_num_r;
  case (curr_state)
    ST_IDLE: begin
      skid_axis_tready = tlp_axis_tready && (link_status_i == DL_ACTIVE) && s_axis_tvalid;
      if (skid_axis_tready && skid_axis_tvalid && !skid_axis_tlast) begin
        //store incoming sequence number
        next_transmit_seq_c = {skid_axis_tdata[7:0], skid_axis_tdata[15:8]};
        crc_byte_select     = 2'b11;
        //tlp type
        tlp_is_nph_c        = '0;
        tlp_is_pd_c         = '0;
        tlp_is_ph_c         = '0;
        tlp_is_npd_c        = '0;
        tlp_is_cplh_c       = '0;
        tlp_is_cpld_c       = '0;
        crc_calculated_c    = '1;
        word_count_c        = '0;
        //state control
        next_state          = ST_CHECK_TLP_TYPE;
      end
    end
    ST_CHECK_TLP_TYPE: begin
      skid_axis_tready = tlp_axis_tready && s_axis_tvalid;
      crc_byte_select  = 2'b11;
      if (skid_axis_tready) begin
        crc_calculated_c = crc_output;
        //shift data_in to account for seq_num offset
        tlp_axis_tdata   = {skid_axis_tdata[15:0], pipeline_axis_tdata[31:16]};
        tlp_axis_tkeep   = '1;
        tlp_axis_tvalid  = '1;
        tlp_dw0          = tlp_axis_tdata;
        word_count_c     = {tlp_dw0.byte2.Length1, tlp_dw0.byte3.Length0};
        //handle posted request
        if (tlp_dw0.byte0 inside {MRd, MRdLk, IORd, CfgRd0, CfgRd1, TCfgRd}) begin
          tlp_is_nph_c = '1;
        end else if (tlp_dw0.byte0 inside {MWr, MsgD}) begin
          tlp_is_pd_c = '1;
        end else if (tlp_dw0.byte0 inside {Msg}) begin
          tlp_is_ph_c = '1;
        end else if (tlp_dw0.byte0 inside {IOWr, CfgWr0, CfgWr1,TCfgWr,FetchAdd,
        Swap,CAS}) begin
          tlp_is_npd_c = '1;
        end else if (tlp_dw0.byte0 inside {Cpl, CplLk}) begin
          tlp_is_cplh_c = '1;
        end else if (tlp_dw0.byte0 inside {CplD, CplDLk}) begin
          tlp_is_cpld_c = '1;
        end
        //next state
        next_state = ST_TLP_STREAM;
      end
    end
    ST_TLP_STREAM: begin
      skid_axis_tready = tlp_axis_tready && s_axis_tvalid;
      crc_byte_select  = 2'b11;
      if (tlp_axis_tready && s_axis_tvalid) begin
        crc_calculated_c = crc_output;
        tlp_axis_tdata   = {skid_axis_tdata[15:0], pipeline_axis_tdata[31:16]};
        tlp_axis_tkeep   = skid_axis_tkeep;
        tlp_axis_tvalid  = '1;
        if (s_axis_tlast) begin
          word_count_c    = word_count_r;
          tlp_axis_tvalid = '0;
          next_state      = ST_TLP_LAST;
          //if last packet of tlp, store crc from phy
          case (s_axis_tkeep)
            4'b0001: begin
              crc_byte_select = '1;
              tlp_axis_tvalid = '1;
              crc_from_tlp_c  = {s_axis_tdata[7:0], skid_axis_tdata[31:8]};
            end
            4'b0011: begin
              crc_byte_select = 2'b11;
              crc_from_tlp_c  = {s_axis_tdata[15:0], skid_axis_tdata[31:16]};
            end
            4'b0111: begin
              crc_byte_select = 2'b11;
              crc_from_tlp_c  = {s_axis_tdata[23:0], skid_axis_tdata[31:24]};
            end
            4'b1111: begin
              crc_byte_select = '1;
              crc_from_tlp_c  = s_axis_tdata;
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
        crc_calculated_c = crc_output;
        next_state = ST_CHECK_CRC;
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
      tlp_axis_tdata   = {pipeline_axis_tdata[15:0], pipeline_stg2_axis_tdata[31:16]};
      tlp_axis_tvalid  = '1;
      tlp_axis_tlast   = '1;
      crc_calculated_c = '1;
      //default to dllp ack state
      next_state       = ST_SEND_ACK;
      fc_start_c       = '1;
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
          tlp_nullified_c = '1;
          tlp_axis_tuser  = '1;
        end
      endcase
      //check crc
      if ((crc_reversed == crc_from_tlp_r) && (next_expected_seq_num_r == next_transmit_seq_r)) begin
        if (tlp_is_nph_r) begin
          nph_credits_consumed_c = nph_credits_consumed_r + 8'h1;
        end else if (tlp_is_npd_r) begin
          nph_credits_consumed_c = nph_credits_consumed_r + 8'h1;
          npd_credits_consumed_c = npd_credits_consumed_r +
          (word_count_r >> 2 == '0 ? 1'b1 : word_count_r >> 2);
        end else if (tlp_is_ph_r) begin
          ph_credits_consumed_c = ph_credits_consumed_r + 8'h1;
        end else if (tlp_is_pd_r) begin
          ph_credits_consumed_c = ph_credits_consumed_r + 8'h1;
          pd_credits_consumed_c = pd_credits_consumed_r +
          (word_count_r >> 2 == '0 ? 1'b1 : word_count_r >> 2);
        end else if (tlp_is_cplh_r) begin
          cplh_credits_consumed_c = cplh_credits_consumed_r + 8'h1;
        end else if (tlp_is_cpld_r) begin
          cplh_credits_consumed_c = cplh_credits_consumed_r + 8'h1;
          cpld_credits_consumed_c = cpld_credits_consumed_r +
          (word_count_r >> 2 == '0 ? 1'b1 : word_count_r >> 2);
        end
      end else begin
        //send nack... retry
        tlp_axis_tuser  = '1;
        tlp_nullified_c = '1;
      end
    end
    ST_SEND_ACK: begin
      fc_start_c = '1;
      if (start_flow_control_ack_i) begin
        if (!tlp_nullified_r) begin
          next_expected_seq_num_c = next_expected_seq_num_r + 32'h1;
        end
        tlp_is_nph_c     = '0;
        tlp_is_pd_c      = '0;
        tlp_is_ph_c      = '0;
        tlp_is_npd_c     = '0;
        tlp_is_cplh_c    = '0;
        tlp_is_cpld_c    = '0;
        crc_calculated_c = '1;
        next_state       = ST_IDLE;
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
) axis_register_inst (
    .clk          (clk_i),
    .rst          (rst_i),
    .s_axis_tdata (skid_axis_tdata),
    .s_axis_tkeep (skid_axis_tkeep),
    .s_axis_tvalid(skid_axis_tvalid),
    .s_axis_tready(),
    .s_axis_tlast (skid_axis_tlast),
    .s_axis_tuser (skid_axis_tuser),
    .s_axis_tid   ('0),
    .s_axis_tdest ('0),
    .m_axis_tdata (pipeline_axis_tdata),
    .m_axis_tkeep (pipeline_axis_tkeep),
    .m_axis_tvalid(pipeline_axis_tvalid),
    .m_axis_tready(skid_axis_tready),
    .m_axis_tlast (pipeline_axis_tlast),
    .m_axis_tid   (),
    .m_axis_tdest (),
    .m_axis_tuser (pipeline_axis_tuser)
);


//axis pipeline skid buffer
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
) axis_register_pipeline_stage_2_inst (
    .clk          (clk_i),
    .rst          (rst_i),
    .s_axis_tdata (pipeline_axis_tdata),
    .s_axis_tkeep (pipeline_axis_tkeep),
    .s_axis_tvalid(pipeline_axis_tvalid),
    .s_axis_tready(),
    .s_axis_tlast (pipeline_axis_tlast),
    .s_axis_tuser (pipeline_axis_tuser),
    .s_axis_tid   ('0),
    .s_axis_tdest ('0),
    .m_axis_tdata (pipeline_stg2_axis_tdata),
    .m_axis_tkeep (pipeline_stg2_axis_tkeep),
    .m_axis_tvalid(pipeline_stg2_axis_tvalid),
    .m_axis_tready(skid_axis_tready),
    .m_axis_tlast (pipeline_stg2_axis_tlast),
    .m_axis_tid   (),
    .m_axis_tdest (),
    .m_axis_tuser (pipeline_stg2_axis_tuser)
);

//tlp crc instance
pcie_lcrc16 tlp_crc16_inst (
    .data  (pipeline_axis_tdata),
    .crcIn (crc_calculated_r),
    .select(crc_byte_select),
    .crcOut(crc_output)
);

//output assignments
assign next_transmit_seq_o    = next_transmit_seq_r;
assign tlp_nullified_o        = tlp_nullified_r;
assign ph_credits_consumed_o  = ph_credits_consumed_r;
assign pd_credits_consumed_o  = pd_credits_consumed_r;
assign nph_credits_consumed_o = nph_credits_consumed_r;
assign npd_credits_consumed_o = npd_credits_consumed_r;
assign start_flow_control_o   = fc_start_r;

/* verilator lint_on WIDTHEXPAND */
/* verilator lint_on WIDTHTRUNC */
endmodule
