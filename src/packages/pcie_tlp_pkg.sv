package pcie_tlp_pkg;

  typedef struct packed {
    logic [7:5] Fmt;
    logic [4:0] Type;
  } tlp_hdr_byte_0_t;

  typedef struct packed {
    logic [7:7] R_2;
    logic [6:4] TC;
    logic [3:3] R_1;
    logic [2:2] Attr;
    logic [1:1] R_0;
    logic [0:0] TH;
  } tlp_hdr_byte_1_t;

  typedef struct packed {
    logic [7:7] TD;
    logic [6:6] EP;
    logic [5:4] Attr;
    logic [3:2] AT;
    logic [1:0] Length;
  } tlp_hdr_byte_2_t;

  typedef struct packed {logic [7:0] Length;} tlp_hdr_byte_3_t;

  typedef struct packed {
    tlp_hdr_byte_0_t byte_0;
    tlp_hdr_byte_1_t byte_1;
    tlp_hdr_byte_2_t byte_2;
    tlp_hdr_byte_3_t byte_3;
  } common_tlp_hdr_t;


  typedef struct packed {logic [31:0] word_1;} word_2_tlp_hdr_t;



  typedef struct packed {logic [7:0] Bus_Number;} word_3_tlp_byte_0_t;

  typedef struct packed {
    logic [7:3] Device_Number;
    logic [2:0] Function_Number_With_ARI;
  } word_3_tlp_byte_1_t;


  typedef struct packed {logic [7:0] byte_2;} word_3_tlp_byte_2_t;

  typedef struct packed {logic [7:0] byte_3;} word_3_tlp_byte_3_t;

  typedef struct packed {logic [31:0] word_1;} tlp_hdr_word_1_t;


  typedef struct packed {
    word_3_tlp_byte_3_t byte_3;
    word_3_tlp_byte_2_t byte_2;
    word_3_tlp_byte_1_t byte_1;
    word_3_tlp_byte_0_t byte_0;
  } tlp_hdr_word_2_t;


  typedef struct packed {logic [31:0] word_3;} tlp_hdr_word_3_t;


  typedef struct packed {
    common_tlp_hdr_t word_0;
    tlp_hdr_word_1_t word_1;
    tlp_hdr_word_2_t word_2;
    tlp_hdr_word_3_t word_3;
  } tlp_hdr_t;

  typedef union packed {
    tlp_hdr_t struct_;
    logic [127:0] whole_;
  } tlp_hdr_union_t;

endpackage
