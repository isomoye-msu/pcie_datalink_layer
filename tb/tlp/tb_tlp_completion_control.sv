`timescale 1ns/1ps
module tb_tlp_completion_control;
  import tlp_pkg::*;
  logic clk_i = 0;
  logic rst_i;
  logic [15:0] completer_id;
  logic completion_request_valid;
  logic completion_request_ready;
  logic [15:0] request_requester_id;
  logic [7:0] request_tag;
  logic [2:0] request_tc;
  logic [2:0] request_attr;
  logic [2:0] completion_request_status;
  logic [12:0] completion_request_byte_count;
  logic [6:0] completion_request_lower_address;
  logic completion_request_digest_valid;
  logic [31:0] completion_request_digest;
  logic [31:0] completion_request_data;
  logic [3:0] completion_request_keep;
  logic completion_request_data_valid;
  logic completion_request_data_last;
  logic completion_request_data_ready;
  tlp_header_t request_header;
  tlp_header_t completion_header;
  logic completion_header_valid, completion_header_ready;
  logic [31:0] completion_data;
  logic [3:0] completion_keep;
  logic completion_data_valid, completion_data_last, completion_data_ready;

  logic requester_header_valid, requester_header_ready;
  logic requester_has_data;
  logic [31:0] requester_data;
  logic [3:0] requester_keep;
  logic requester_data_valid, requester_data_last, requester_data_ready;
  tlp_header_t requester_header;

  tlp_header_t generator_header;
  logic generator_header_valid, generator_header_ready;
  logic [31:0] generator_data;
  logic [3:0] generator_keep;
  logic generator_data_valid, generator_data_last, generator_data_ready;
  logic [2:0] generator_fmt;
  logic [4:0] generator_type;
  logic [15:0] generator_requester_id;
  logic [15:0] generator_completer_id;
  logic [7:0] generator_tag;
  logic [2:0] generator_status;
  logic [12:0] generator_byte_count;
  logic [6:0] generator_lower_address;

  always_comb begin
    request_header = '0;
    request_header.requester_id = request_requester_id;
    request_header.tag = request_tag;
    request_header.traffic_class = request_tc;
    request_header.attributes = request_attr;
    requester_header = '0;
    requester_header.fmt = requester_has_data ? TLP_FMT_3DW_DATA : TLP_FMT_3DW_NO_DATA;
    requester_header.tlp_type = TLP_TYPE_MEM;
    generator_fmt = generator_header.fmt;
    generator_type = generator_header.tlp_type;
    generator_requester_id = generator_header.requester_id;
    generator_completer_id = generator_header.completer_id;
    generator_tag = generator_header.tag;
    generator_status = generator_header.completion_status;
    generator_byte_count = generator_header.byte_count;
    generator_lower_address = generator_header.lower_address;
  end

  tlp_completion_generator completion_dut (
      .clk_i(clk_i), .rst_i(rst_i), .completer_id_i(completer_id),
      .request_valid_i(completion_request_valid), .request_ready_o(completion_request_ready),
      .request_header_i(request_header), .request_status_i(completion_request_status),
      .request_byte_count_i(completion_request_byte_count),
      .request_lower_address_i(completion_request_lower_address),
      .request_digest_valid_i(completion_request_digest_valid),
      .request_digest_i(completion_request_digest), .request_data_i(completion_request_data),
      .request_keep_i(completion_request_keep),
      .request_data_valid_i(completion_request_data_valid),
      .request_data_last_i(completion_request_data_last),
      .request_data_ready_o(completion_request_data_ready),
      .packet_header_o(completion_header), .packet_header_valid_o(completion_header_valid),
      .packet_header_ready_i(completion_header_ready), .packet_data_o(completion_data),
      .packet_keep_o(completion_keep), .packet_data_valid_o(completion_data_valid),
      .packet_data_last_o(completion_data_last), .packet_data_ready_i(completion_data_ready)
  );

  tlp_control control_dut (
      .clk_i(clk_i), .rst_i(rst_i), .requester_header_i(requester_header),
      .requester_header_valid_i(requester_header_valid),
      .requester_header_ready_o(requester_header_ready), .requester_data_i(requester_data),
      .requester_keep_i(requester_keep), .requester_data_valid_i(requester_data_valid),
      .requester_data_last_i(requester_data_last), .requester_data_ready_o(requester_data_ready),
      .completion_header_i(completion_header),
      .completion_header_valid_i(completion_header_valid),
      .completion_header_ready_o(completion_header_ready), .completion_data_i(completion_data),
      .completion_keep_i(completion_keep), .completion_data_valid_i(completion_data_valid),
      .completion_data_last_i(completion_data_last), .completion_data_ready_o(completion_data_ready),
      .generator_header_o(generator_header), .generator_header_valid_o(generator_header_valid),
      .generator_header_ready_i(generator_header_ready), .generator_data_o(generator_data),
      .generator_keep_o(generator_keep), .generator_data_valid_o(generator_data_valid),
      .generator_data_last_o(generator_data_last), .generator_data_ready_i(generator_data_ready)
  );
endmodule
