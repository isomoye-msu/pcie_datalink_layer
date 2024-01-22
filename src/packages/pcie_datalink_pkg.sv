package pcie_datalink_pkg;

  /* verilator lint_off WIDTHEXPAND */
  parameter byte HdrFc = 8'hFA;
  parameter byte DataFc = 8'hDA;
  parameter byte FcPHdr = 8'h01;
  parameter byte FcNpHdr = 8'h01;
  parameter byte FcCplHdr = 8'h01;
  parameter int FcPData = 32'h040;
  parameter int FcNpData = 32'h010;
  parameter int DllpHdrByteSize = 32'h2;
  parameter int ReplayTimer = 32'd999;
  parameter int ReplayNum = 32'd2;
  parameter int LtssmDetect = 32'd1500;
  parameter int FcClpData = FcPData / FcPHdr;
  parameter int SkidBuffer = 2;



  typedef enum logic [1:0] {
    OKAY = 2'b00,
    EXOKAY = 2'b01,
    SLVERR = 2'b10,
    DECERROR = 2'b11,
    RESP_X = 'X
  } resp;



  typedef enum logic [7:0] {
    MR     = 8'b00?_00000,  // Memory Read Request
    MRL    = 8'b00?_00001,  // Memory Read Request Locked
    MW     = 8'b01?_00000,  // Memory Write Request
    IOR    = 8'b000_00010,  // I / O Read Request
    IOW    = 8'b010_00010,  // I / O Write Request
    CR0    = 8'b000_00100,  // Configuration Read Type 0
    CW0    = 8'b010_00100,  // Configuration Write Type 0
    CR1    = 8'b000_00101,  // Configuration Read Type 1
    CW1    = 8'b010_00101,  // Configuration Write Type 1
    Cpl    = 8'b000_01010,  // Completion without data (0 Bytes)
    CplD   = 8'b010_01010,  // Completion with data (data will be present in TLP)
    CplLk  = 8'b000_01011,  // Completion for Locked Memory read without data
    CplDLk = 8'b010_01011   // Completion for Locked Memory Read
  } pcie_fmt_e;


  typedef enum logic [1:0] {
    DL_DOWN,
    DL_UP,
    DL_ACTIVE
  } pcie_dl_status_e;

  typedef enum logic [3:0] {
    INIT_FCDLE,
    INIT_FC1,
    INIT_FC1_P,
    INIT_FC1_NP,
    INIT_FC1_CPL,
    CHECK_FC1_VALS,
    INIT_FC2,
    INIT_FC2_P,
    INIT_FC2_NP,
    INIT_FC2_CPL,
    CHECK_FC2_VALS,
    INIT_FC_COMPLETE
  } flow_control_state_e;


  typedef enum logic [7:0] {
    Ack               = 8'b00000000,
    Nak               = 8'b00010000,
    PM_Enter_L1       = 8'b00100000,
    PM_Enter_L23      = 8'b00100001,
    PM_Actv_St_Req_L1 = 8'b00100011,
    PM_Request_Ack    = 8'b00100100,
    Vendor_Specific   = 8'b00110000,
    InitFC1_P         = 8'b01000000,
    InitFC1_NP        = 8'b01010000,
    InitFC1_Cpl       = 8'b01100000,
    InitFC2_P         = 8'b11000000,
    InitFC2_NP        = 8'b11010000,
    InitFC2_Cpl       = 8'b11100000,
    UpdateFC_P        = 8'b10000000,
    UpdateFC_NP       = 8'b10010000,
    UpdateFC_Cpl      = 8'b10100000
  } dllp_type_t;

  typedef struct packed {logic [3:0] half_byte;} half_byte_t;
  typedef struct packed {
    logic [2:0] vcd;
    logic reserved;
    logic [3:0] init_seq;
  } dllp_type_hdr_t;


  typedef struct packed {
    logic [3:0] half_byte1;
    logic [3:0] half_byte0;
  } dllp_byte_t;

  typedef union packed {
    dllp_type_t type_byte_;
    dllp_type_hdr_t type_vc;
  } dllp_type_union_t;

  typedef struct packed {
    logic [1:0] rsvd1;
    logic [7:0] HdrFC;
    logic [1:0] rsvd0;
  } dllp_hdr_t;

  typedef struct packed {
    logic [3:0] byte_1;
    logic [7:0] half_byte;
  } ack_nack_t;

  typedef union packed {
    ack_nack_t   acknack_seq_num;
    logic [11:0] data_fc;
  } dllp_seq_datafc_union_t;

  typedef union packed {
    dllp_hdr_t   hdr;
    logic [11:0] rsvd;
  } dllp_hdr_union_t;

  // typedef struct packed {

  // } dllp_byte3_t;

  typedef struct packed {
    logic [3:0] reserved;
    logic [3:0] acknak1;
  } dllp_byte2_acknak_t;

  typedef struct packed {
    logic [1:0] reserved;
    logic [5:0] hdr2;
  } dllp_byte1_hdrfc_t;

  // typedef struct packed {

  // } dllp_byte0_t;

  typedef struct packed {
    logic [15:0] crc;
    dllp_seq_datafc_union_t seq_datafc;
    dllp_hdr_union_t header;
    dllp_type_union_t dllp_type;
  } dll_packet_t;

  typedef struct packed {
    logic [15:0] crc;
    logic [7:0] ack_nack0;
    logic [3:0] rsvd1;
    logic [3:0] ack_nack1;
    logic [7:0] rsvd0;
    dllp_type_union_t ack_nack_;
  } dllp_ack_nack_t;

  typedef struct packed {
    logic [1:0] rsvd0;
    logic [5:0] hdrfc1;
  } dllp_fc_byte1_t;

  typedef struct packed {
    logic [1:0] hdrfc0;
    logic [1:0] rsvd1;
    logic [3:0] datafc1;
  } dllp_fc_byte2_t;

  typedef struct packed {
    logic [15:0]      crc;
    logic [7:0]       datafc0;
    dllp_fc_byte2_t   byte2;
    dllp_fc_byte1_t   byte1;
    dllp_type_union_t fc_type_;
  } dllp_fc_t;


  typedef union packed {
    dllp_fc_t       flow_control;
    dllp_ack_nack_t ack_nack;
    dll_packet_t    generic;
  } dllp_union_t;


  function static logic [11:0] get_ack_nack_seq(input dllp_ack_nack_t ack_nack_in);
    get_ack_nack_seq = {ack_nack_in.ack_nack1, ack_nack_in.ack_nack0};
  endfunction

  function static logic [11:0] get_fc_hdr(input dllp_fc_t flow_control_in);
    get_fc_hdr = {flow_control_in.byte1.hdrfc1, flow_control_in.byte2.hdrfc0};
  endfunction

  function static logic [11:0] get_fc_data(input dllp_fc_t flow_control_in);
    get_fc_data = {flow_control_in.byte2.datafc1, flow_control_in.datafc0};
  endfunction

  function automatic void set_ack_nack(output dllp_ack_nack_t dllp_out, input dllp_type_t dllp_type,
                                       logic [11:0] seq_num, logic [15:0] crc_in = 16'h0);
    dllp_ack_nack_t temp_dllp = '0;
    temp_dllp.ack_nack_ = dllp_type;
    temp_dllp.ack_nack1 = seq_num[11:8];
    temp_dllp.ack_nack0 = seq_num[7:0];
    // {temp_dllp.ack_nack1, temp_dllp.ack_nack0} = {4'h0,seq_num};
    temp_dllp.crc = crc_in;
    dllp_out = temp_dllp;
  endfunction


  function automatic void send_fc_init(output dllp_fc_t dllp_out, input dllp_type_t dllp_type,
                                       input logic [2:0] vcd, input logic [7:0] hdrfc,
                                       input logic [11:0] datafc);
    begin
      dllp_fc_t dll_packet;
      dll_packet = '0;
      {dll_packet.fc_type_.type_byte_} = dllp_type;
      {dll_packet.byte1.hdrfc1, dll_packet.byte2.hdrfc0} = hdrfc;
      {dll_packet.byte2.datafc1, dll_packet.datafc0} = datafc;
      dllp_out = dll_packet;
    end
  endfunction
  /* verilator lint_on WIDTHEXPAND */

endpackage
