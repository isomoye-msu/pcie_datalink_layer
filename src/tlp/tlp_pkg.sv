`timescale 1ns/1ps
package tlp_pkg;

  parameter int TLP_DATA_WIDTH = 32;
  parameter int TLP_KEEP_WIDTH = TLP_DATA_WIDTH / 8;
  parameter int TLP_MAX_PAYLOAD_BYTES = 4096;

  typedef enum logic [2:0] {
    TLP_FMT_3DW_NO_DATA = 3'b000,
    TLP_FMT_4DW_NO_DATA = 3'b001,
    TLP_FMT_3DW_DATA    = 3'b010,
    TLP_FMT_4DW_DATA    = 3'b011,
    TLP_FMT_PREFIX      = 3'b100
  } tlp_fmt_e;

  typedef enum logic [4:0] {
    TLP_TYPE_MEM       = 5'b00000,
    TLP_TYPE_MEM_LOCK  = 5'b00001,
    TLP_TYPE_IO        = 5'b00010,
    TLP_TYPE_CFG0      = 5'b00100,
    TLP_TYPE_CFG1      = 5'b00101,
    TLP_TYPE_CPL       = 5'b01010,
    TLP_TYPE_CPL_LOCK  = 5'b01011,
    TLP_TYPE_FETCH_ADD = 5'b01100,
    TLP_TYPE_SWAP      = 5'b01101,
    TLP_TYPE_CAS       = 5'b01110
  } tlp_type_e;

  typedef enum logic [1:0] {
    TLP_CLASS_POSTED,
    TLP_CLASS_NON_POSTED,
    TLP_CLASS_COMPLETION,
    TLP_CLASS_UNSUPPORTED
  } tlp_class_e;

  typedef enum logic [2:0] {
    TLP_CPL_SC  = 3'b000,
    TLP_CPL_UR  = 3'b001,
    TLP_CPL_CRS = 3'b010,
    TLP_CPL_CA  = 3'b100
  } tlp_cpl_status_e;

  typedef enum logic [2:0] {
    TLP_CMD_MEM_READ,
    TLP_CMD_MEM_WRITE,
    TLP_CMD_CFG_READ0,
    TLP_CMD_CFG_WRITE0,
    TLP_CMD_IO_READ,
    TLP_CMD_IO_WRITE
  } tlp_cmd_e;

  typedef struct packed {
    logic [2:0]  fmt;
    logic [4:0]  tlp_type;
    logic [2:0]  traffic_class;
    logic [2:0]  attributes;
    logic        digest_present;
    logic        poisoned;
    logic        th;
    logic [1:0]  address_type;
    logic [10:0] length_dw;
    logic [15:0] requester_id;
    logic [15:0] completer_id;
    logic [7:0]  tag;
    logic [3:0]  first_be;
    logic [3:0]  last_be;
    logic [63:0] address;
    logic [2:0]  completion_status;
    logic        byte_count_modified;
    logic [12:0] byte_count;
    logic [6:0]  lower_address;
    logic        prefix_present;
    logic [31:0] prefix;
    logic [31:0] digest;
  } tlp_header_t;

  function automatic logic tlp_has_data(input logic [2:0] fmt);
    return fmt == TLP_FMT_3DW_DATA || fmt == TLP_FMT_4DW_DATA;
  endfunction

  function automatic logic tlp_is_4dw(input logic [2:0] fmt);
    return fmt == TLP_FMT_4DW_NO_DATA || fmt == TLP_FMT_4DW_DATA;
  endfunction

  function automatic logic [9:0] tlp_encode_length(input logic [10:0] length_dw);
    return length_dw == 11'd1024 ? 10'd0 : length_dw[9:0];
  endfunction

  function automatic logic [10:0] tlp_decode_length(input logic [9:0] encoded);
    return encoded == 10'd0 ? 11'd1024 : {1'b0, encoded};
  endfunction

  function automatic logic [3:0] tlp_first_be(
      input logic [1:0] address_low,
      input logic [12:0] byte_length
  );
    logic [3:0] mask;
    integer lane;
    mask = '0;
    for (lane = 0; lane < 4; lane = lane + 1)
      if (lane >= {30'd0, address_low} &&
          lane < {19'd0, address_low} + byte_length)
        mask[lane] = 1'b1;
    return mask;
  endfunction

  function automatic logic [3:0] tlp_last_be(
      input logic [1:0] address_low,
      input logic [12:0] byte_length
  );
    logic [2:0] end_offset;
    if (({11'd0, address_low} + byte_length) <= 13'd4)
      return 4'b0000;
    end_offset = ({11'd0, address_low} + byte_length) & 13'd3;
    return end_offset == 0 ? 4'b1111 : (4'b1111 >> (4-end_offset));
  endfunction

endpackage
