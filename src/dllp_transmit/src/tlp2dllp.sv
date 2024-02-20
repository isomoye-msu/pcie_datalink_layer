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
    input  logic [           7:0] tx_fc_cplh_i,
    input  logic [          11:0] tx_fc_cpld_i,
    input  logic                  update_fc_i

);

  localparam int FcPldSize = MAX_PAYLOAD_SIZE >> 4;
  localparam int FcHeaderFieldSize = 8;
  localparam int FCDataFieldSize = 12;
  localparam int FcHeaderFieldSizeDiv2 = FcHeaderFieldSize / 2;
  localparam int FCDataFieldSizeDiv2 = FCDataFieldSize / 2;
  //tlp to dllp fsm emum
  typedef enum logic [3:0] {
    ST_IDLE,
    ST_CHECK_CREDITS_NPH,
    ST_CHECK_CREDITS_NPH_NPD,
    ST_CHECK_CREDITS_PH,
    ST_CHECK_CREDITS_PH_PD,
    ST_CHECK_CREDITS_CPLH,
    ST_CHECK_CREDITS_CPLH_CPLD,
    ST_TLP_STREAM,
    ST_TLP_CRC,
    ST_TLP_CRC_ALIGN,
    ST_TLP_CRC_TLAST_ALIGN,
    ST_TLP_LAST,
    ST_CHECK_CREDITS
  } dll_tx_st_e;

  //fsm holder signals
  dll_tx_st_e                            curr_state;
  dll_tx_st_e                            next_state;
  //transmit sequence logic
  logic                 [          11:0] next_transmit_seq_c;
  logic                 [          11:0] next_transmit_seq_r;
  //skid buffer axis stage1 signals
  logic                 [DATA_WIDTH-1:0] skid_axis_tdata;
  logic                 [KEEP_WIDTH-1:0] skid_axis_tkeep;
  logic                                  skid_axis_tvalid;
  logic                                  skid_axis_tlast;
  logic                 [USER_WIDTH-1:0] skid_axis_tuser;
  logic                                  skid_axis_tready;
  //flow buffer axis stage1 signals
  logic                 [DATA_WIDTH-1:0] pipeline_axis_tdata;
  logic                 [KEEP_WIDTH-1:0] pipeline_axis_tkeep;
  logic                                  pipeline_axis_tvalid;
  logic                                  pipeline_axis_tlast;
  logic                 [USER_WIDTH-1:0] pipeline_axis_tuser;
  logic                                  pipeline_axis_tready;
  //tlp output buffer axis signals
  logic                 [DATA_WIDTH-1:0] tlp_axis_tdata;
  logic                 [KEEP_WIDTH-1:0] tlp_axis_tkeep;
  logic                                  tlp_axis_tvalid;
  logic                                  tlp_axis_tlast;
  logic                 [USER_WIDTH-1:0] tlp_axis_tuser;
  logic                                  tlp_axis_tready;
  //crc helper signals
  logic                 [          31:0] crc_in_c;
  logic                 [          31:0] dllp_lcrc_c;
  logic                 [          31:0] crc_in_r;
  logic                 [          31:0] dllp_lcrc_r;
  logic                 [          31:0] crc_out;
  logic                 [          31:0] crc_out16;
  logic                 [           1:0] crc_select;
  logic                 [          31:0] crc_reversed;
  logic                 [          15:0] dllp_crc_out;
  logic                 [          15:0] dllp_crc_reversed;
  //tlp nulled
  logic                                  tlp_nullified_c;
  logic                                  tlp_nullified_r;
  //tlp type signals
  pcie_tlp_header_dw0_t                  tlp_dw0;
  //credits consumed
  logic                 [           7:0] ph_credits_consumed_c;
  logic                 [           7:0] ph_credits_consumed_r;
  logic                 [          11:0] pd_credits_consumed_c;
  logic                 [          11:0] pd_credits_consumed_r;
  logic                 [          11:0] npd_credits_consumed_c;
  logic                 [          11:0] npd_credits_consumed_r;
  logic                 [           7:0] nph_credits_consumed_c;
  logic                 [           7:0] nph_credits_consumed_r;
  logic                 [          11:0] cpld_credits_consumed_c;
  logic                 [          11:0] cpld_credits_consumed_r;
  logic                 [           7:0] cplh_credits_consumed_c;
  logic                 [           7:0] cplh_credits_consumed_r;
  //Flow control
  logic                 [           7:0] ph_credit_limit_c;
  logic                 [           7:0] ph_credit_limit_r;
  logic                 [          11:0] pd_credit_limit_c;
  logic                 [          11:0] pd_credit_limit_r;
  logic                 [          11:0] cpld_credit_limit_c;
  logic                 [          11:0] cpld_credit_limit_r;
  logic                 [           7:0] nph_credit_limit_c;
  logic                 [           7:0] nph_credit_limit_r;
  logic                 [          11:0] npd_credit_limit_c;
  logic                 [          11:0] npd_credit_limit_r;
  logic                 [          11:0] cplh_credit_limit_c;
  logic                 [          11:0] cplh_credit_limit_r;




  always @(posedge clk_i) begin
    if (rst_i) begin
      curr_state              <= ST_IDLE;
      next_transmit_seq_r     <= '0;
      crc_in_r                <= '1;
      ph_credits_consumed_r   <= '0;
      pd_credits_consumed_r   <= '0;
      nph_credits_consumed_r  <= '0;
      npd_credits_consumed_r  <= '0;
      cplh_credits_consumed_r <= '0;
      cpld_credits_consumed_r <= '0;
      ph_credit_limit_r       <= '0;
      pd_credit_limit_r       <= '0;
      nph_credit_limit_r      <= '0;
      npd_credit_limit_r      <= '0;
      cpld_credit_limit_r     <= '0;
      cplh_credit_limit_r     <= '0;
    end else begin
      curr_state              <= next_state;
      next_transmit_seq_r     <= next_transmit_seq_c;
      ph_credits_consumed_r   <= ph_credits_consumed_c;
      pd_credits_consumed_r   <= pd_credits_consumed_c;
      nph_credits_consumed_r  <= nph_credits_consumed_c;
      npd_credits_consumed_r  <= npd_credits_consumed_c;
      cplh_credits_consumed_r <= cplh_credits_consumed_c;
      cpld_credits_consumed_r <= cpld_credits_consumed_c;
      ph_credit_limit_r       <= ph_credit_limit_c;
      pd_credit_limit_r       <= pd_credit_limit_c;
      nph_credit_limit_r      <= nph_credit_limit_c;
      npd_credit_limit_r      <= npd_credit_limit_c;
      cpld_credit_limit_r     <= cpld_credit_limit_c;
      cplh_credit_limit_r     <= cplh_credit_limit_c;
    end
    crc_in_r <= crc_in_c;
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
    next_state              = curr_state;
    tlp_axis_tdata          = '0;
    tlp_axis_tkeep          = '0;
    tlp_axis_tvalid         = '0;
    tlp_axis_tlast          = '0;
    tlp_axis_tuser          = 4'h2;
    crc_select              = '1;
    crc_in_c                = crc_in_r;
    dllp_valid_o            = '0;
    tlp_dw0                 = '0;
    ph_credits_consumed_c   = ph_credits_consumed_r;
    pd_credits_consumed_c   = pd_credits_consumed_r;
    nph_credits_consumed_c  = nph_credits_consumed_r;
    npd_credits_consumed_c  = npd_credits_consumed_r;
    cplh_credits_consumed_c = cplh_credits_consumed_r;
    cpld_credits_consumed_c = cpld_credits_consumed_r;
    next_transmit_seq_c     = next_transmit_seq_r;
    case (curr_state)
      //wait until pipeline is full and upstream ready
      //store packet, because we're shifting the data to fit in
      //the seq number, we'll need to save 2 bytes of this packet
      ST_IDLE: begin
        if (tlp_axis_tready && skid_axis_tvalid) begin
          tlp_dw0  = skid_axis_tdata;
          crc_in_c = '1;
          //handle posted request
          if (tlp_dw0.byte0 inside {MRd, MRdLk, IORd, CfgRd0, CfgRd1, TCfgRd}) begin
            next_state = ST_CHECK_CREDITS_NPH;
          end else if (tlp_dw0.byte0 inside {MWr, MsgD}) begin
            next_state = ST_CHECK_CREDITS_PH_PD;
          end else if (tlp_dw0.byte0 inside {Msg}) begin
            next_state = ST_CHECK_CREDITS_PH;
          end else if (tlp_dw0.byte0 inside {IOWr, CfgWr0, CfgWr1,TCfgWr,FetchAdd,
          Swap,CAS}) begin
            next_state = ST_CHECK_CREDITS_NPH_NPD;
          end else if (tlp_dw0.byte0 inside {Cpl, CplLk}) begin
            next_state = ST_CHECK_CREDITS_CPLH;
          end else if (tlp_dw0.byte0 inside {CplD, CplDLk}) begin
            next_state = ST_CHECK_CREDITS_CPLH_CPLD;
          end


          // if (((skid_axis_tdata[7:0] == Cpl) || (skid_axis_tdata[7:0] == CplD))  //check tlp type
          //     && payload_credit_available_r) begin
          //   tlp_is_cpl_c = '1;  //tlp is completion
          // end
          // else if (((skid_axis_tdata[7:0]  ==? MW) || (skid_axis_tdata[7:0]  == CW0) ||
          //           (skid_axis_tdata[7:0] == CW1)))
          // begin
          //   //check if credit is available
          //   if (payload_credit_available_r) begin
          //     tlp_is_payload_c = '1;  //tlp is payload
          //   end
          // end else if (have_np_credit_r) begin
          //   tlp_no_payload_c = '1;  //tlp is a no paylaod
          // end
          // if (tlp_is_cpl_c || tlp_is_payload_c || tlp_no_payload_c) begin
          //   crc_in_c         = crc_out16;
          //   tlp_axis_tvalid  = skid_axis_tvalid;
          //   skid_axis_tready = '1;
          //   next_state       = ST_TLP_STREAM;
          // end
        end
      end
      ST_CHECK_CREDITS_NPH: begin
        static logic has_nph_credit;
        has_nph_credit = '0;
        //assign seq number then first 2 bytes of tlp
        tlp_axis_tdata = {
          skid_axis_tdata[15:0], next_transmit_seq_r[7:0], 4'h0, next_transmit_seq_r[11:8]
        };
        tlp_axis_tkeep = '1;
        //check that nph credit is available
        if (nph_credit_limit_r >= nph_credits_consumed_r) begin
          if ((nph_credit_limit_r - nph_credits_consumed_r) >= 1'b1) begin
            nph_credits_consumed_c = nph_credits_consumed_r + 1'b1;
            has_nph_credit         = '1;
          end
        end  //account for wrap around
        else begin
          if ((nph_credits_consumed_r - nph_credit_limit_r) >= 1'b1) begin
            nph_credits_consumed_c = nph_credits_consumed_r + 1'b1;
            has_nph_credit         = '1;
          end
        end
        if (has_nph_credit) begin
          crc_in_c         = crc_out16;
          tlp_axis_tvalid  = skid_axis_tvalid;
          skid_axis_tready = '1;
          next_state       = ST_TLP_STREAM;
        end
      end
      ST_CHECK_CREDITS_NPH_NPD: begin
        static logic has_nph_credit;
        static logic has_npd_credit;
        static logic [15:0] data_credits_required;
        has_nph_credit = '0;
        has_npd_credit = '0;
        data_credits_required = 1'b1;
        //assign seq number then first 2 bytes of tlp
        tlp_axis_tdata = {
          skid_axis_tdata[15:0], next_transmit_seq_r[7:0], 4'h0, next_transmit_seq_r[11:8]
        };
        tlp_axis_tkeep = '1;
        //check that posted header credit is available
        if (nph_credit_limit_r >= nph_credits_consumed_r) begin
          if ((nph_credit_limit_r - nph_credits_consumed_r) >= 1'b1) begin
            has_nph_credit = '1;
          end
        end  //account for wrap around
        else begin
          if ((nph_credits_consumed_r - nph_credit_limit_r) >= 1'b1) begin
            has_nph_credit = '1;
          end
        end
        //check that posted data credit is available
        if (npd_credit_limit_r >= npd_credits_consumed_r) begin
          if ((npd_credit_limit_r - npd_credits_consumed_r) >= data_credits_required) begin
            has_npd_credit = '1;
          end
        end  //account for wrap around
        else begin
          if ((npd_credits_consumed_r - npd_credit_limit_r) >= data_credits_required) begin
            has_npd_credit = '1;
          end
        end
        //check next_state criteria
        if (has_nph_credit && has_npd_credit) begin
          nph_credits_consumed_c = nph_credits_consumed_r + 1'b1;
          npd_credits_consumed_c = npd_credits_consumed_r + data_credits_required;
          crc_in_c               = crc_out16;
          tlp_axis_tvalid        = skid_axis_tvalid;
          skid_axis_tready       = '1;
          next_state             = ST_TLP_STREAM;
        end
      end
      ST_CHECK_CREDITS_PH: begin
        static logic has_ph_credit;
        //assign seq number then first 2 bytes of tlp
        tlp_axis_tdata = {
          skid_axis_tdata[15:0], next_transmit_seq_r[7:0], 4'h0, next_transmit_seq_r[11:8]
        };
        tlp_axis_tkeep = '1;
        //check that posted header credit is available
        if (ph_credit_limit_r >= ph_credits_consumed_r) begin
          if ((ph_credit_limit_r - ph_credits_consumed_r) >= 1'b1) begin
            ph_credits_consumed_c = ph_credits_consumed_r + 1'b1;
            has_ph_credit         = '1;
          end
        end  //account for wrap around
        else begin
          if ((ph_credits_consumed_r - ph_credit_limit_r) >= 1'b1) begin
            ph_credits_consumed_c = ph_credits_consumed_r + 1'b1;
            has_ph_credit         = '1;
          end
        end
        //check next_state criteria
        if (has_ph_credit) begin
          crc_in_c         = crc_out16;
          tlp_axis_tvalid  = skid_axis_tvalid;
          skid_axis_tready = '1;
          next_state       = ST_TLP_STREAM;
        end
      end
      ST_CHECK_CREDITS_PH_PD: begin
        static logic has_ph_credit;
        static logic has_pd_credit;
        static logic [15:0] data_length;
        static logic [15:0] data_credits_required;
        tlp_dw0 = skid_axis_tdata;
        has_ph_credit = '0;
        has_pd_credit = '0;
        data_length = {tlp_dw0.byte2.Length1, tlp_dw0.byte3.Length0};
        data_credits_required = data_length >> 2 == '0 ? 1'b1 : data_length >> 2;
        //assign seq number then first 2 bytes of tlp
        tlp_axis_tdata = {
          skid_axis_tdata[15:0], next_transmit_seq_r[7:0], 4'h0, next_transmit_seq_r[11:8]
        };
        tlp_axis_tkeep = '1;
        //check that posted header credit is available
        if (ph_credit_limit_r >= ph_credits_consumed_r) begin
          if ((ph_credit_limit_r - ph_credits_consumed_r) >= 1'b1) begin
            has_ph_credit = '1;
          end
        end  //account for wrap around
        else begin
          if ((ph_credits_consumed_r - ph_credit_limit_r) >= 1'b1) begin
            // nph_credits_consumed_c = nph_credits_consumed_r + 1'b1;
            has_ph_credit = '1;
          end
        end
        //check that posted data credit is available
        if (pd_credit_limit_r >= pd_credits_consumed_r) begin
          if ((pd_credit_limit_r - pd_credits_consumed_r) >= data_credits_required) begin
            has_pd_credit = '1;
          end
        end  //account for wrap around
        else begin
          if ((pd_credits_consumed_r - pd_credit_limit_r) >= data_credits_required) begin
            has_pd_credit = '1;
          end
        end
        //check next_state criteria
        if (has_ph_credit && has_pd_credit) begin
          pd_credits_consumed_c = pd_credits_consumed_r + data_credits_required;
          ph_credits_consumed_c = ph_credits_consumed_r + 1'b1;
          crc_in_c              = crc_out16;
          tlp_axis_tvalid       = skid_axis_tvalid;
          skid_axis_tready      = '1;
          next_state            = ST_TLP_STREAM;
        end
      end
      ST_CHECK_CREDITS_CPLH: begin
        static logic has_cplh_credit;
        has_cplh_credit = '0;
        //assign seq number then first 2 bytes of tlp
        tlp_axis_tdata = {
          skid_axis_tdata[15:0], next_transmit_seq_r[7:0], 4'h0, next_transmit_seq_r[11:8]
        };
        tlp_axis_tkeep = '1;
        //check that nph credit is available
        if (cplh_credit_limit_r >= cplh_credits_consumed_r) begin
          if ((cplh_credit_limit_r - cplh_credits_consumed_r) >= 1'b1) begin
            cplh_credits_consumed_c = cplh_credits_consumed_r + 1'b1;
            has_cplh_credit         = '1;
          end
        end  //account for wrap around
        else begin
          if ((cplh_credits_consumed_r - cplh_credit_limit_r) >= 1'b1) begin
            cplh_credits_consumed_c = cplh_credits_consumed_r + 1'b1;
            has_cplh_credit         = '1;
          end
        end
        if (has_cplh_credit) begin
          crc_in_c         = crc_out16;
          tlp_axis_tvalid  = skid_axis_tvalid;
          skid_axis_tready = '1;
          next_state       = ST_TLP_STREAM;
        end
      end
      ST_CHECK_CREDITS_CPLH_CPLD: begin
        static logic has_cplh_credit;
        static logic has_cpld_credit;
        static logic [15:0] data_length;
        static logic [15:0] data_credits_required;
        tlp_dw0 = skid_axis_tdata;
        has_cplh_credit = '0;
        has_cpld_credit = '0;
        data_length = {tlp_dw0.byte2.Length1, tlp_dw0.byte3.Length0};
        data_credits_required = data_length >> 2 == '0 ? 1'b1 : data_length >> 2;
        //assign seq number then first 2 bytes of tlp
        tlp_axis_tdata = {
          skid_axis_tdata[15:0], next_transmit_seq_r[7:0], 4'h0, next_transmit_seq_r[11:8]
        };
        // tlp_axis_tdata        = {skid_axis_tdata[15:0], 4'h0, next_transmit_seq_r[11:0]};
        tlp_axis_tkeep = '1;
        //check that posted header credit is available
        if (cplh_credit_limit_r >= cplh_credits_consumed_r) begin
          if ((cplh_credit_limit_r - cplh_credits_consumed_r) >= 1'b1) begin
            has_cplh_credit = '1;
          end
        end  //account for wrap around
        else begin
          if ((cplh_credits_consumed_r - cplh_credit_limit_r) >= 1'b1) begin
            has_cplh_credit = '1;
          end
        end
        //check that posted data credit is available
        if (cpld_credit_limit_r >= cpld_credits_consumed_r) begin
          if ((cpld_credit_limit_r - cpld_credits_consumed_r) >= data_credits_required) begin
            has_cpld_credit = '1;
          end
        end  //account for wrap around
        else begin
          if ((cpld_credits_consumed_r - cpld_credit_limit_r) >= data_credits_required) begin
            has_cpld_credit = '1;
          end
        end
        //check next_state criteria
        if (has_cplh_credit && has_cpld_credit) begin
          cplh_credits_consumed_c = cplh_credits_consumed_r + 1'b1;
          cpld_credits_consumed_c = cpld_credits_consumed_r + data_credits_required;
          crc_in_c                = crc_out16;
          tlp_axis_tvalid         = skid_axis_tvalid;
          skid_axis_tready        = '1;
          next_state              = ST_TLP_STREAM;
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
            end
            4'b0011: begin
              tlp_axis_tdata  = crc_reversed;
              tlp_axis_tlast  = '1;
              tlp_axis_tvalid = '1;
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
          tlp_axis_tkeep  = '1;
          tlp_axis_tvalid = '1;
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
              dllp_valid_o   = '1;
              next_state     = ST_TLP_LAST;
            end
            4'b1111: begin
              tlp_axis_tdata = {8'h0, crc_reversed[31:16]};
              tlp_axis_tkeep = 4'b0011;
              tlp_axis_tlast = '1;
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
        next_transmit_seq_c = next_transmit_seq_r + 1'b1;
        next_state          = ST_IDLE;
      end
      default: begin
      end
    endcase
  end

  always_comb begin : flow_contol
    ph_credit_limit_c   = ph_credit_limit_r;
    pd_credit_limit_c   = pd_credit_limit_r;
    nph_credit_limit_c  = nph_credit_limit_r;
    npd_credit_limit_c  = npd_credit_limit_r;
    cpld_credit_limit_c = cpld_credit_limit_r;
    cplh_credit_limit_c = cplh_credit_limit_r;


    //check if flow control update
    if (update_fc_i) begin
      //update ph
      ph_credit_limit_c = tx_fc_ph_i == ph_credit_limit_r ? ph_credit_limit_r : tx_fc_ph_i;
      //update nph
      nph_credit_limit_c = tx_fc_nph_i == nph_credit_limit_r ? nph_credit_limit_r : tx_fc_nph_i;
      //update pd
      pd_credit_limit_c = tx_fc_pd_i == pd_credit_limit_r ? pd_credit_limit_r : tx_fc_pd_i;
      //update ph
      npd_credit_limit_c = tx_fc_npd_i == npd_credit_limit_r ? npd_credit_limit_r : tx_fc_npd_i;
      //update cpld
      cpld_credit_limit_c  = tx_fc_cpld_i == cpld_credit_limit_r ? cpld_credit_limit_r : tx_fc_cpld_i;
      //update cplh
      cplh_credit_limit_c = tx_fc_cplh_i == cplh_credit_limit_r ? cplh_credit_limit_r : tx_fc_cplh_i;
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
