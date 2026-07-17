`timescale 1ns/1ps
module tb_tlp_requester;
  import tlp_pkg::*;
  logic clk_i = 0;
  logic rst_i;
  logic [15:0] requester_id;
  logic [12:0] max_payload_bytes;
  logic [12:0] max_read_bytes;
  logic command_valid;
  logic command_ready;
  logic [2:0] command;
  logic [63:0] command_address;
  logic [12:0] command_byte_count;
  logic [2:0] command_tc;
  logic [2:0] command_attr;
  logic [15:0] command_context;
  logic command_prefix_valid;
  logic [31:0] command_prefix;
  logic command_digest_valid;
  logic [31:0] command_digest;
  logic [31:0] command_data;
  logic [3:0] command_keep;
  logic command_data_valid;
  logic command_data_last;
  logic command_data_ready;
  logic tag_request_valid;
  logic tag_request_ready;
  logic [7:0] tag;
  logic [15:0] tag_requester_id;
  logic [12:0] tag_byte_count;
  logic [15:0] tag_context;
  logic tag_expects_data;
  tlp_header_t packet_header;
  logic packet_header_valid;
  logic packet_header_ready;
  logic [31:0] packet_data;
  logic [3:0] packet_keep;
  logic packet_data_valid;
  logic packet_data_last;
  logic packet_data_ready;
  logic command_error;

  logic [2:0] packet_fmt;
  logic [4:0] packet_type;
  logic [10:0] packet_length_dw;
  logic [15:0] packet_requester_id;
  logic [7:0] packet_tag;
  logic [3:0] packet_first_be;
  logic [3:0] packet_last_be;
  logic [63:0] packet_address;

  assign packet_fmt = packet_header.fmt;
  assign packet_type = packet_header.tlp_type;
  assign packet_length_dw = packet_header.length_dw;
  assign packet_requester_id = packet_header.requester_id;
  assign packet_tag = packet_header.tag;
  assign packet_first_be = packet_header.first_be;
  assign packet_last_be = packet_header.last_be;
  assign packet_address = packet_header.address;

  tlp_requester dut (
      .clk_i(clk_i), .rst_i(rst_i), .requester_id_i(requester_id),
      .max_payload_bytes_i(max_payload_bytes), .max_read_bytes_i(max_read_bytes),
      .command_valid_i(command_valid), .command_ready_o(command_ready), .command_i(command),
      .command_address_i(command_address), .command_byte_count_i(command_byte_count),
      .command_tc_i(command_tc), .command_attr_i(command_attr),
      .command_context_i(command_context), .command_prefix_valid_i(command_prefix_valid),
      .command_prefix_i(command_prefix), .command_digest_valid_i(command_digest_valid),
      .command_digest_i(command_digest), .command_data_i(command_data),
      .command_keep_i(command_keep), .command_data_valid_i(command_data_valid),
      .command_data_last_i(command_data_last), .command_data_ready_o(command_data_ready),
      .tag_request_valid_o(tag_request_valid), .tag_request_ready_i(tag_request_ready),
      .tag_i(tag), .tag_requester_id_o(tag_requester_id),
      .tag_byte_count_o(tag_byte_count), .tag_context_o(tag_context),
      .tag_expects_data_o(tag_expects_data), .packet_header_o(packet_header),
      .packet_header_valid_o(packet_header_valid), .packet_header_ready_i(packet_header_ready),
      .packet_data_o(packet_data), .packet_keep_o(packet_keep),
      .packet_data_valid_o(packet_data_valid), .packet_data_last_o(packet_data_last),
      .packet_data_ready_i(packet_data_ready), .command_error_o(command_error)
  );
endmodule
