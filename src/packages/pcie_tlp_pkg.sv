package pcie_tlp_pkg;

  import pcie_datalink_pkg::*;

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

  //--------------------------------------------------------------------
  // completion tlp data word 1
  typedef struct packed {logic [7:0] completer_id;} cpl_tlp_dw1_byte_0_t;
  typedef struct packed {logic [7:0] completer_id;} cpl_tlp_dw1_byte_1_t;
  typedef struct packed {
    logic [7:5] status;
    logic [4:4] b;
    logic [3:0] byte_count;
  } cpl_tlp_dw1_byte_2_t;
  typedef struct packed {logic [7:0] byte_count;} cpl_tlp_dw1_byte_3_t;
  //--------------------------------------------------------------------


  //--------------------------------------------------------------------
  // completion tlp data word 2
  typedef struct packed {logic [7:0] requester_id;} cpl_tlp_dw2_byte_0_t;
  typedef struct packed {logic [7:0] requester_id;} cpl_tlp_dw2_byte_1_t;
  typedef struct packed {logic [7:0] tag;} cpl_tlp_dw2_byte_2_t;
  typedef struct packed {
    logic [7:7] reserved;
    logic [6:0] lower_address;
  } cpl_tlp_dw2_byte_3_t;
  //--------------------------------------------------------------------



  typedef struct packed {logic [7:0] Length;} tlp_hdr_byte_3_t;

  typedef struct packed {
    tlp_hdr_byte_0_t byte0;
    tlp_hdr_byte_1_t byte1;
    tlp_hdr_byte_2_t byte2;
    tlp_hdr_byte_3_t byte3;
  } common_tlp_hdr_t;


  typedef struct packed {logic [31:0] word_1;} word_2_tlp_hdr_t;


  typedef struct packed {
    // logic [31:16] completer_id;
    // logic [15:13] status;
    // logic [12:12] bmc0;
    // logic [11:0]  byte_count;
    cpl_tlp_dw1_byte_3_t byte3;
    cpl_tlp_dw1_byte_2_t byte2;
    cpl_tlp_dw1_byte_1_t byte1;
    cpl_tlp_dw1_byte_0_t byte0;
  } cpl_tlp_dw1_t;


  typedef struct packed {
    // logic [31:16] requester_id;
    // logic [15:8]  tag;
    // logic [7:7]   reserved;
    // logic [6:0]   lower_address;
    cpl_tlp_dw2_byte_3_t byte3;
    cpl_tlp_dw2_byte_2_t byte2;
    cpl_tlp_dw2_byte_1_t byte1;
    cpl_tlp_dw2_byte_0_t byte0;
  } cpl_tlp_dw2_t;


  typedef struct packed {
    logic [31:16] requester_id;
    logic [15:8]  tag;
    logic [7:4]   last_byte_enable;
    logic [3:0]   first_byte_enable;
  } read_req_dw_1_t;


  typedef struct packed {logic [31:0] reserved;} cpl_tlp_dw3_t;


  typedef struct packed {
    logic [31:0]          data;
    // logic [31:0]          dw_3;
    cpl_tlp_dw2_t         dw_2;
    cpl_tlp_dw1_t         dw_1;
    pcie_tlp_header_dw0_t dw_0;
  } cpl_tlp_hdr_t;



  typedef struct packed {logic [7:0] Bus_Number;} word_3_tlp_byte_0_t;

  typedef struct packed {
    logic [7:3] Device_Number;
    logic [2:0] Function_Number_With_ARI;
  } word_3_tlp_byte_1_t;


  typedef struct packed {logic [7:0] byte_2;} word_3_tlp_byte_2_t;

  typedef struct packed {logic [7:0] byte_3;} word_3_tlp_byte_3_t;

  typedef struct packed {logic [31:0] word_1;} tlp_hdr_word_1_t;


  typedef struct packed {
    word_3_tlp_byte_0_t byte_0;
    word_3_tlp_byte_1_t byte_1;
    word_3_tlp_byte_2_t byte_2;
    word_3_tlp_byte_3_t byte_3;
  } tlp_hdr_word_2_t;


  typedef struct packed {logic [31:0] word_3;} tlp_hdr_word_3_t;


  typedef struct packed {
    tlp_hdr_word_3_t word_3;
    tlp_hdr_word_2_t word_2;
    read_req_dw_1_t  word_1;
    common_tlp_hdr_t word_0;
  } tlp_hdr_t;

  typedef union packed {
    tlp_hdr_t struct_;
    logic [127:0] whole_;
  } tlp_hdr_union_t;




  typedef struct packed {
    logic [15:11] unused;
    logic [10:10] interrupt_disable;
    logic [9:9]   fast_b2b_transactions_enable;
    logic [8:8]   SERR_Enable;
    logic [7:7]   idsel_step_wait_cycle_control;
    logic [6:6]   parity_error_response;
    logic [5:5]   vga_palette_snoop;
    logic [4:4]   memory_write_invalidate;
    logic [3:3]   special_cycle_enable;
    logic [2:2]   bus_master_enable;
    logic [1:0]   reserved;
  } command_register_t;


  typedef struct packed {
    logic [15:15] detected_parity_error;
    logic [14:14] signaled_system_error;
    logic [13:13] received_master_abort;
    logic [12:12] received_target_abort;
    logic [11:11] signaled_target_abort;
    logic [10:9]  devsel_timing;
    logic [8:8]   master_data_parity_error;
    logic [7:7]   fast_b2b_transactions_capable;
    logic [6:6]   unused;
    logic [5:5]   sixtysix_mhz_capable;
    logic [4:4]   capabilities_list;
    logic [3:3]   interrupt_status;
    logic [2:0]   reserved;
  } status_register_t;


  typedef struct packed {
    status_register_t  status;
    command_register_t command;
  } cfg_reg_ids_t;



  function static cpl_tlp_hdr_t gen_cpld(input tlp_hdr_t tlp_hdr_in, logic [31:0] data_in);
    begin
      cpl_tlp_hdr_t temp_cpl;
      //set all to zeros
      temp_cpl = '0;
      //set data word
      temp_cpl.data = data_in;
      //build tlp
      temp_cpl.dw_0.byte0 = CplD;
      {temp_cpl.dw_0.byte2.Length1, temp_cpl.dw_0.byte3.Length0} = 10'h01;
      {temp_cpl.dw_1.byte2.byte_count, temp_cpl.dw_1.byte3.byte_count} = 12'h004;
      {temp_cpl.dw_1.byte0.completer_id, temp_cpl.dw_1.byte1.completer_id} =
      {tlp_hdr_in.word_2.byte_0,tlp_hdr_in.word_2.byte_2};
      temp_cpl.dw_2.byte3.lower_address = tlp_hdr_in.word_1[6:0];
      temp_cpl.dw_2.byte2.tag = tlp_hdr_in.word_1.tag;
      {temp_cpl.dw_2.byte0.requester_id,temp_cpl.dw_2.byte1.requester_id} =
      tlp_hdr_in.word_1.requester_id;
      return temp_cpl;
    end
  endfunction


  function static cpl_tlp_hdr_t gen_cpl(input tlp_hdr_t tlp_hdr_in, logic [31:0] data_in);
    begin
      cpl_tlp_hdr_t temp_cpl;
      //set all to zeros
      temp_cpl = '0;
      //set data word
      temp_cpl.data = data_in;
      //build tlp
      temp_cpl.dw_0.byte0 = Cpl;
      {temp_cpl.dw_0.byte2.Length1, temp_cpl.dw_0.byte3.Length0} = 10'h00;
      {temp_cpl.dw_1.byte2.byte_count, temp_cpl.dw_1.byte3.byte_count} = 12'h000;
      {temp_cpl.dw_1.byte0.completer_id, temp_cpl.dw_1.byte1.completer_id} = 
      {tlp_hdr_in.word_2.byte_0,tlp_hdr_in.word_2.byte_2};
      temp_cpl.dw_2.byte3.lower_address = tlp_hdr_in.word_1[6:0];
      temp_cpl.dw_2.byte2.tag = tlp_hdr_in.word_1.tag;
      {temp_cpl.dw_2.byte0.requester_id,temp_cpl.dw_2.byte1.requester_id} =
      tlp_hdr_in.word_1.requester_id;
      return temp_cpl;
    end
  endfunction

endpackage
