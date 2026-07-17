`timescale 1ns/1ps
module tb_tlp_request_tracker;
  import tlp_pkg::*;
  logic clk_i = 0;
  logic rst_i;
  logic extended_tag_enable;
  logic allocate_valid;
  logic allocate_ready;
  logic [15:0] allocate_requester_id;
  logic [12:0] allocate_byte_count;
  logic [15:0] allocate_context;
  logic allocate_expects_data;
  logic [7:0] allocate_tag;
  logic completion_valid;
  logic completion_ready;
  logic [15:0] completion_requester_id;
  logic [7:0] completion_tag;
  logic [2:0] completion_status;
  logic [12:0] completion_payload_bytes;
  logic result_valid;
  logic result_ready;
  logic [15:0] result_context;
  logic [2:0] result_status;
  logic result_last;
  logic unexpected_completion;
  logic [5:0] outstanding;
  tlp_header_t completion_header;

  always_comb begin
    completion_header = '0;
    completion_header.requester_id = completion_requester_id;
    completion_header.tag = completion_tag;
    completion_header.completion_status = completion_status;
  end

  tlp_request_tracker #(.TAG_COUNT(32), .CONTEXT_WIDTH(16)) dut (
      .clk_i(clk_i), .rst_i(rst_i), .extended_tag_enable_i(extended_tag_enable),
      .allocate_valid_i(allocate_valid), .allocate_ready_o(allocate_ready),
      .allocate_requester_id_i(allocate_requester_id),
      .allocate_byte_count_i(allocate_byte_count), .allocate_context_i(allocate_context),
      .allocate_expects_data_i(allocate_expects_data), .allocate_tag_o(allocate_tag),
      .completion_valid_i(completion_valid), .completion_ready_o(completion_ready),
      .completion_header_i(completion_header),
      .completion_payload_bytes_i(completion_payload_bytes),
      .result_valid_o(result_valid), .result_ready_i(result_ready),
      .result_context_o(result_context), .result_status_o(result_status),
      .result_last_o(result_last), .unexpected_completion_o(unexpected_completion),
      .outstanding_o(outstanding)
  );
endmodule
