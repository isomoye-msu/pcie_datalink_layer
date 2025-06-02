package pcie_datalink_pkg;

  /* verilator lint_off WIDTHEXPAND */
  parameter byte HdrFc = 8'hFA  * 8;
  parameter byte DataFc = 8'hDA * 8;
  parameter byte FcPHdr = 8'h01 * 8;
  parameter byte FcNpHdr = 8'h01 * 8;
  parameter byte FcCplHdr = 8'h01 * 8;
  parameter int FcPData = 32'h040 * 8;
  parameter int FcNpData = 32'h010 * 8;
  parameter int DllpHdrByteSize = 32'h2;
  parameter int ReplayTimer = 32'd999;
  parameter int ReplayNum = 32'd2;
  parameter int LtssmDetect = 32'd1500;
  parameter int FcClpData = FcPData / FcPHdr;
  parameter int SkidBuffer = 2;
  parameter int HdrMinCredits = 8'h1;



  typedef enum logic [1:0] {
    OKAY = 2'b00,
    EXOKAY = 2'b01,
    SLVERR = 2'b10,
    DECERROR = 2'b11,
    RESP_X = 'X
  } resp_e;


  // typedef enum logic [7:0] {
  //   MR     = 8'b00?_00000,  // Memory Read Request
  //   MRL    = 8'b00?_00001,  // Memory Read Request Locked
  //   MW     = 8'b01?_00000,  // Memory Write Request
  //   IOR    = 8'b000_00010,  // I / O Read Request
  //   IOW    = 8'b010_00010,  // I / O Write Request
  //   CR0    = 8'b000_00100,  // Configuration Read Type 0
  //   CW0    = 8'b010_00100,  // Configuration Write Type 0
  //   CR1    = 8'b000_00101,  // Configuration Read Type 1
  //   CW1    = 8'b010_00101,  // Configuration Write Type 1
  //   Cpl    = 8'b000_01010,  // Completion without data (0 Bytes)
  //   CplD   = 8'b010_01010,  // Completion with data (data will be present in TLP)
  //   CplLk  = 8'b000_01011,  // Completion for Locked Memory read without data
  //   CplDLk = 8'b010_01011   // Completion for Locked Memory Read
  // } pcie_fmt_e;


  typedef enum logic [1:0] {
    DL_DOWN,
    DL_UP,
    DL_ACTIVE
  } pcie_dl_status_e;


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
  } dllp_type_e;

  typedef enum logic [2:0] {
    TLP_3DW_ND = 3'b000,
    TLP_4DW_ND = 3'b001,
    TLP_3DW_WD = 3'b010,
    TLP_4DW_WD = 3'b011,
    TLP_PREFIX = 3'b100
  } pcie_tlp_fmt_e;

  typedef enum logic [7:0] {
    MRd      = 8'b00?0_0000,  //Memory Read Request
    MRdLk    = 8'b00?0_0001,  //Memory Read Request-Locked
    MWr      = 8'b01?0_0000,  //Memory Write Request
    IORd     = 8'b0000_0010,  //I/O Read Request
    IOWr     = 8'b0100_0010,  //I/O Write Request
    CfgRd0   = 8'b0000_0100,  //Configuration Read Type 0
    CfgWr0   = 8'b0100_0100,  //Configuration Write Type 0
    CfgRd1   = 8'b0000_0101,  //Configuration Read Type 1
    CfgWr1   = 8'b0100_0101,  //Configuration Write Type 1
    TCfgRd   = 8'b0001_1011,  //Deprecated TLP Type 3
    TCfgWr   = 8'b0101_1011,  //Deprecated TLP Type 3
    Msg      = 8'b0011_0???,  //Message Request
    MsgD     = 8'b0111_0???,  //Message Request with data payload
    Cpl      = 8'b0000_1010,  //Completion without Data
    CplD     = 8'b0100_1010,  //Completion with Data
    CplLk    = 8'b0000_1011,  //Completion for Locked Memory Read without Data
    CplDLk   = 8'b0100_1011,  //Completion for Locked Memory Read
    FetchAdd = 8'b01?0_1100,  //Fetch and Add AtomicOp Request
    Swap     = 8'b01?0_1101,  //Unconditional Swap AtomicOp Request
    CAS      = 8'b01?0_1110,  //Compare and Swap AtomicOp Request
    LPrx     = 8'b1000_????,  //Local TLP Prefix
    EPrfx    = 8'b1001_????   //End-End TLP Prefix
  } pcie_tlp_type_e;

  typedef struct packed {logic [3:0] half_byte;} half_byte_t;

  typedef struct packed {
    logic [2:0] Fmt;
    logic [4:0] Type;
  } pcie_tlp_byte0_t;

  typedef struct packed {
    logic       RSVD2;
    logic [2:0] TC;
    logic       RSVD1;
    logic       Attr;
    logic       RSVD0;
    logic       TH;
  } pcie_tlp_byte1_t;


  typedef struct packed {
    logic       TD;
    logic       EP;
    logic [1:0] Attr;
    logic [1:0] AT;
    logic [1:0] Length1;
  } pcie_tlp_byte2_t;


  typedef struct packed {logic [7:0] Length0;} pcie_tlp_byte3_t;


  typedef struct packed {
    pcie_tlp_byte3_t byte3;
    pcie_tlp_byte2_t byte2;
    pcie_tlp_byte1_t byte1;
    pcie_tlp_byte0_t byte0;
  } pcie_tlp_header_dw0_t;

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
    dllp_type_e type_byte_;
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

  function static void get_fc_values(output logic [7:0] hdr_fc_out, output logic [11:0] data_fc_out,
                                     input dllp_fc_t flow_control_in);
    hdr_fc_out  = {flow_control_in.byte1.hdrfc1, flow_control_in.byte2.hdrfc0};
    data_fc_out = {flow_control_in.byte2.datafc1, flow_control_in.datafc0};
  endfunction

  function automatic dllp_ack_nack_t set_ack_nack(input dllp_type_e dllp_type,
                                       logic [11:0] seq_num, logic [15:0] crc_in = 16'h0);
    dllp_ack_nack_t temp_dllp = '0;
    temp_dllp.ack_nack_ = dllp_type;
    temp_dllp.ack_nack1 = seq_num[11:8];
    temp_dllp.ack_nack0 = seq_num[7:0];
    // {temp_dllp.ack_nack1, temp_dllp.ack_nack0} = {4'h0,seq_num};
    temp_dllp.crc = crc_in;
    return temp_dllp;
  endfunction


  function automatic dllp_fc_t send_fc_init(input dllp_type_e dllp_type,
                                       input logic [2:0] vcd, input logic [7:0] hdrfc,
                                       input logic [11:0] datafc);
    begin
      dllp_fc_t dll_packet;
      dll_packet = '0;
      {dll_packet.fc_type_.type_byte_} = dllp_type;
      {dll_packet.byte1.hdrfc1, dll_packet.byte2.hdrfc0} = hdrfc;
      {dll_packet.byte2.datafc1, dll_packet.datafc0} = datafc;
      return dll_packet;
    end
  endfunction
  /* verilator lint_on WIDTHEXPAND */

endpackage
