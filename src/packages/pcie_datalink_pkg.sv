package pcie_datalink_pkg;


  localparam byte HdrFc = 8'hFA;
  localparam byte DataFc = 8'hDA;

  localparam byte FcPHdr = 8'h01;
  localparam byte FcNpHdr = 8'h01;
  localparam byte FcCplHdr = 8'h01;


  localparam int FcPData = 16'h040;
  localparam int FcNpData = 16'h010;
  localparam int FcClpData = FcPData / FcPHdr;

  localparam int DllpHdrByteSize = 8'h2;
  localparam int ReplayTimer = 32'd999;
  localparam int ReplayNum = 32'd2;

  localparam int LtssmDetect = 32'd1500;

  typedef enum bit [7:0] {
    // TS1 Ordered Sets
    TS1_DATA_K28_5 = 8'h1C,   // TS1 Data: K28.5 (Start of TS1 Ordered Set)
    TS1_DATA_K28_7 = 8'h3C,   // TS1 Data: K28.7 (End of TS1 Ordered Set)

    // TS2 Ordered Sets
    TS2_DATA_K28_5 = 8'h5C,   // TS2 Data: K28.5 (Start of TS2 Ordered Set)
    TS2_DATA_K28_7 = 8'h7C,   // TS2 Data: K28.7 (End of TS2 Ordered Set)

    // TLP Prefix Ordered Set
    TLP_PREFIX = 8'hBC,        // TLP Prefix

    // TLP Header Ordered Set
    TLP_HEADER = 8'hFC         // TLP Header
  } pcie_ordered_set_e;


  typedef enum logic [1:0] {
    OKAY = 2'b00,
    EXOKAY = 2'b01,
    SLVERR = 2'b10,
    DECERROR = 2'b11,
    RESP_X = 'X
  } resp;

  typedef enum logic [7:0] {
    PAT_GEN_HOME         = 8'h00,
    PAT_GEN_GEN12_SKP_1  = 8'h01,
    PAT_GEN_GEN12_SKP_2  = 8'h02,
    PAT_GEN_GEN12_PAT    = 8'h03,
    PAT_GEN_GEN3_EIEOS_1 = 8'h10,
    PAT_GEN_GEN3_EIEOS_2 = 8'h11,
    PAT_GEN_GEN3_EIEOS_3 = 8'h12,
    PAT_GEN_GEN3_EIEOS_4 = 8'h13,
    PAT_GEN_GEN3_PAT_ST  = 8'h14,
    PAT_GEN_GEN3_PAT_Z0  = 8'h15,
    PAT_GEN_GEN3_PAT_Z1  = 8'h16,
    PAT_GEN_GEN3_PAT_Z2  = 8'h17,
    PAT_GEN_GEN3_PAT_Z3  = 8'h18,
    PAT_GEN_GEN3_PAT_ST1 = 8'h19,
    PAT_GEN_GEN3_PAT_Z01 = 8'h1A,
    PAT_GEN_GEN3_PAT_Z11 = 8'h1B,
    PAT_GEN_GEN3_PAT_Z21 = 8'h1C,
    PAT_GEN_GEN3_PAT_Z4  = 8'h1D,
    PAT_GEN_GEN4_EIEOS_1 = 8'h20,
    PAT_GEN_GEN4_EIEOS_2 = 8'h21,
    PAT_GEN_GEN4_EIEOS_3 = 8'h22,
    PAT_GEN_GEN4_EIEOS_4 = 8'h23,
    PAT_GEN_GEN4_PAT_ST  = 8'h24,
    PAT_GEN_GEN4_PAT_Z0  = 8'h25,
    PAT_GEN_GEN4_PAT_Z1  = 8'h26,
    PAT_GEN_GEN4_SKP_0   = 8'h27,
    PAT_GEN_GEN4_SKP_1   = 8'h28,
    PAT_GEN_GEN4_SKP_2   = 8'h29,
    PAT_GEN_GEN4_SKP_3   = 8'h2A,
    PAT_GEN_GEN4_DAT_ST  = 8'h2B,
    PAT_GEN_GEN4_DAT_Z0  = 8'h2C,
    PAT_GEN_GEN4_DAT_Z1  = 8'h2D,
    PAT_GEN_GEN4_DAT_ED0 = 8'h2E,
    PAT_GEN_GEN4_DAT_ED1 = 8'h2F,
    PAT_GEN_GEN3_EIOS_1  = 8'h30,
    PAT_GEN_GEN3_EIOS_2  = 8'h31,
    PAT_GEN_GEN3_EIOS_3  = 8'h32,
    PAT_GEN_GEN3_EIOS_4  = 8'h33,
    PAT_GEN_GEN3_EIOS_5  = 8'h34

  } patterns_e;


  typedef enum logic [7:0] {
    MR     = 8'b00?_00000,  // Memory Read Request
    MRL    = 8'b00?_00001,  // Memory Read Request Locked
    MW     = 8'b010_00000,  // Memory Write Request
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
    dllp_type_t type_byte;
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
    logic [7:0]  ack_nack0;
    logic [3:0]  rsvd1;
    logic [3:0]  ack_nack1;
    logic [7:0]  rsvd0;
    dllp_type_t  ack_nak;
  } dllp_ack_nak_t;

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
    logic [15:0]    crc;
    logic [7:0]     datafc0;
    dllp_fc_byte2_t byte2;
    dllp_fc_byte1_t byte1;
    dllp_type_t     fc_type;
  } dllp_fc_t;


  typedef union packed {
    dllp_fc_t      flow_control;
    dllp_ack_nak_t ack_nack;
    dll_packet_t   generic;
  } dllp_union_t;


  function static logic [11:0] get_ack_nack_seq(input dllp_ack_nak_t ack_nack_in);
    get_ack_nack_seq = {ack_nack_in.ack_nack1, ack_nack_in.ack_nack0};
  endfunction

  function static logic [11:0] get_fc_hdr(input dllp_fc_t flow_control_in);
    get_fc_hdr = {flow_control_in.byte1.hdrfc1, flow_control_in.byte2.hdrfc0};
  endfunction

  function static logic [11:0] get_fc_data(input dllp_fc_t flow_control_in);
    get_fc_data = {flow_control_in.byte2.datafc1, flow_control_in.datafc0};
  endfunction

  function static dllp_ack_nak_t set_ack_nack(input dllp_type_t dllp_type,
  logic [11:0] seq_num, logic [15:0] crc_in = 16'h0);
    dllp_ack_nak_t temp_dllp = '0;
    temp_dllp.ack_nak.type_byte = dllp_type;
    temp_dllp.ack_nack1 = seq_num[11:8];
    temp_dllp.ack_nack0 = seq_num[7:0];
    // {temp_dllp.ack_nack1, temp_dllp.ack_nack0} = {4'h0,seq_num};
    temp_dllp.crc = crc_in;
    set_ack_nack = temp_dllp;
  endfunction


  function automatic dllp_fc_t send_fc_init(input dllp_fc_t dllp_type,
  input logic [2:0] vcd, input logic [7:0] hdrfc, input logic [11:0] datafc);
    begin
      dllp_fc_t dll_packet;
      dll_packet = '0;
      dll_packet.fc_type.type_byte = dllp_type & 8'b1111_0000;
      {dll_packet.byte1.hdrfc1, dll_packet.byte2.hdrfc0} = hdrfc;
      {dll_packet.byte2.datafc1, dll_packet.datafc0} = datafc;
      send_fc_init = dll_packet;
    end
  endfunction


//   reg [9:0] pcie_8b10b_encoding_table [0:255] = {
//     // Data Values 8'h00 - 8'h0F
//     10'b0001100000, 10'b1001110000, 10'b0101110000, 10'b1101100000,
//     10'b0011110000, 10'b1011100000, 10'b0111100000, 10'b1111010000,
//     10'b0001111000, 10'b1001101000, 10'b0101101000, 10'b1101111000,
//     10'b0011101000, 10'b1011111000, 10'b0111111000, 10'b1111001000,

//     // Data Values 8'h10 - 8'h1F
//     10'b0001101100, 10'b1001111100, 10'b0101111100, 10'b1101101100,
//     10'b0011111100, 10'b1011101100, 10'b0111101100, 10'b1111011100,
//     10'b0001110100, 10'b1001100100, 10'b0101100100, 10'b1101110100,
//     10'b0011100100, 10'b1011110100, 10'b0111110100, 10'b1111001100,

//     // Continue mapping for other data values
//     // ...

//     // Data Values 8'hF0 - 8'hFF
//     10'b0000100001, 10'b1000100001, 10'b0100100001, 10'b1100100001,
//     10'b0010100001, 10'b1010100001, 10'b0110100001, 10'b1110100001,
//     10'b0000100101, 10'b1000100101, 10'b0100100101, 10'b1100100101,
//     10'b0010100101, 10'b1010100101, 10'b0110100101, 10'b1110100101
// };


endpackage
