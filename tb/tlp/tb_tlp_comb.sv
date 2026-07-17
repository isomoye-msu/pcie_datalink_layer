`timescale 1ns/1ps
module tb_tlp_comb;
  import tlp_pkg::*;

  logic [2:0] fmt;
  logic [4:0] tlp_type;
  logic [10:0] length_dw;
  logic [63:0] address;
  logic memory_enable;
  logic [1:0] address_low;
  logic [12:0] byte_length;

  logic has_data;
  logic is_4dw;
  logic [9:0] encoded_length;
  logic [10:0] decoded_length;
  logic [3:0] first_be;
  logic [3:0] last_be;

  logic [1:0] class_value;
  logic memory_request;
  logic config_request;
  logic completion;
  logic read_request;
  logic write_request;
  logic unsupported;

  logic bar_hit;
  logic bar_number;
  logic [63:0] bar_offset;
  logic config_hit;
  logic config_type_one;
  logic [11:0] config_offset;
  tlp_header_t header;

  always_comb begin
    header = '0;
    header.fmt = fmt;
    header.tlp_type = tlp_type;
    header.length_dw = length_dw;
    header.address = address;
    has_data = tlp_has_data(fmt);
    is_4dw = tlp_is_4dw(fmt);
    encoded_length = tlp_encode_length(length_dw);
    decoded_length = tlp_decode_length(encoded_length);
    first_be = tlp_first_be(address_low, byte_length);
    last_be = tlp_last_be(address_low, byte_length);
  end

  tlp_classifier classifier_inst (
      .header_i(header), .class_o(class_value),
      .memory_request_o(memory_request), .config_request_o(config_request),
      .completion_o(completion), .read_request_o(read_request),
      .write_request_o(write_request), .unsupported_o(unsupported)
  );

  tlp_bar_decoder #(
      .BAR_COUNT(2),
      .BAR_BASE({64'h0000_0001_0000_0000, 64'h0000_0000_0000_1000}),
      .BAR_MASK({64'hffff_ffff_ffff_f000, 64'hffff_ffff_ffff_f000}),
      .BAR_ENABLE(2'b11)
  ) bar_inst (
      .address_i(address), .memory_enable_i(memory_enable),
      .hit_o(bar_hit), .bar_o(bar_number), .offset_o(bar_offset)
  );

  tlp_config_decoder config_inst (
      .header_i(header), .bus_number_i(8'h25),
      .device_number_i(5'h12), .function_number_i(3'h3),
      .hit_o(config_hit), .type_one_o(config_type_one),
      .register_offset_o(config_offset)
  );
endmodule
