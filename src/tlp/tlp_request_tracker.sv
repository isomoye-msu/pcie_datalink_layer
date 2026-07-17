`timescale 1ns/1ps
module tlp_request_tracker
  import tlp_pkg::*;
#(
    parameter int TAG_COUNT = 32,
    parameter int CONTEXT_WIDTH = 16
) (
    input  logic                     clk_i,
    input  logic                     rst_i,
    input  logic                     extended_tag_enable_i,

    input  logic                     allocate_valid_i,
    output logic                     allocate_ready_o,
    input  logic [15:0]              allocate_requester_id_i,
    input  logic [12:0]              allocate_byte_count_i,
    input  logic [CONTEXT_WIDTH-1:0] allocate_context_i,
    input  logic                     allocate_expects_data_i,
    output logic [7:0]               allocate_tag_o,

    input  logic                     completion_valid_i,
    output logic                     completion_ready_o,
    input  tlp_header_t              completion_header_i,
    input  logic [12:0]              completion_payload_bytes_i,

    output logic                     result_valid_o,
    input  logic                     result_ready_i,
    output logic [CONTEXT_WIDTH-1:0] result_context_o,
    output logic [2:0]               result_status_o,
    output logic                     result_last_o,
    output logic                     unexpected_completion_o,
    output logic [$clog2(TAG_COUNT+1)-1:0] outstanding_o
);

  logic [TAG_COUNT-1:0] active_r;
  logic [15:0] requester_id_r [0:TAG_COUNT-1];
  logic [12:0] remaining_r [0:TAG_COUNT-1];
  logic [CONTEXT_WIDTH-1:0] context_r [0:TAG_COUNT-1];
  logic expects_data_r [0:TAG_COUNT-1];
  logic result_valid_r;
  logic [CONTEXT_WIDTH-1:0] result_context_r;
  logic [2:0] result_status_r;
  logic result_last_r;
  logic unexpected_r;
  localparam int TAG_INDEX_WIDTH = TAG_COUNT <= 1 ? 1 : $clog2(TAG_COUNT);
  integer search_index;
  integer reset_index;
  integer active_count;
  logic tag_found;
  logic completion_match;
  logic [TAG_INDEX_WIDTH-1:0] completion_index;

  always_comb begin
    tag_found = 1'b0;
    allocate_tag_o = '0;
    for (search_index = 0; search_index < TAG_COUNT; search_index = search_index + 1) begin
      if (!tag_found && !active_r[search_index] &&
          (extended_tag_enable_i || search_index < 32)) begin
        tag_found = 1'b1;
        allocate_tag_o = search_index[7:0];
      end
    end
    allocate_ready_o = tag_found;

    completion_match = 1'b0;
    completion_index = '0;
    for (search_index = 0; search_index < TAG_COUNT; search_index = search_index + 1) begin
      if (!completion_match && active_r[search_index] &&
          completion_header_i.tag == search_index[7:0] &&
          completion_header_i.requester_id == requester_id_r[search_index]) begin
        completion_match = 1'b1;
        completion_index = search_index[TAG_INDEX_WIDTH-1:0];
      end
    end
    completion_ready_o = !result_valid_r || result_ready_i;

    active_count = 0;
    for (search_index = 0; search_index < TAG_COUNT; search_index = search_index + 1)
      active_count = active_count + active_r[search_index];
    outstanding_o = active_count[$clog2(TAG_COUNT+1)-1:0];
  end

  assign result_valid_o = result_valid_r;
  assign result_context_o = result_context_r;
  assign result_status_o = result_status_r;
  assign result_last_o = result_last_r;
  assign unexpected_completion_o = unexpected_r;

  always_ff @(posedge clk_i) begin
    if (rst_i) begin
      active_r         <= '0;
      result_valid_r   <= 1'b0;
      result_context_r <= '0;
      result_status_r  <= '0;
      result_last_r    <= 1'b0;
      unexpected_r     <= 1'b0;
      for (reset_index = 0; reset_index < TAG_COUNT; reset_index = reset_index + 1) begin
        requester_id_r[reset_index] <= '0;
        remaining_r[reset_index]    <= '0;
        context_r[reset_index]      <= '0;
        expects_data_r[reset_index] <= 1'b0;
      end
    end else begin
      unexpected_r <= 1'b0;
      if (result_valid_r && result_ready_i)
        result_valid_r <= 1'b0;

      if (allocate_valid_i && allocate_ready_o) begin
        active_r[allocate_tag_o[TAG_INDEX_WIDTH-1:0]]       <= 1'b1;
        requester_id_r[allocate_tag_o[TAG_INDEX_WIDTH-1:0]] <= allocate_requester_id_i;
        remaining_r[allocate_tag_o[TAG_INDEX_WIDTH-1:0]]    <= allocate_byte_count_i;
        context_r[allocate_tag_o[TAG_INDEX_WIDTH-1:0]]      <= allocate_context_i;
        expects_data_r[allocate_tag_o[TAG_INDEX_WIDTH-1:0]] <= allocate_expects_data_i;
      end

      if (completion_valid_i && completion_ready_o) begin
        if (!completion_match) begin
          unexpected_r <= 1'b1;
        end else begin
          result_valid_r   <= 1'b1;
          result_context_r <= context_r[completion_index];
          result_status_r  <= completion_header_i.completion_status;
          result_last_r    <= !expects_data_r[completion_index] ||
                              completion_header_i.completion_status != TLP_CPL_SC ||
                              completion_payload_bytes_i >= remaining_r[completion_index];
          if (!expects_data_r[completion_index] ||
              completion_header_i.completion_status != TLP_CPL_SC ||
              completion_payload_bytes_i >= remaining_r[completion_index]) begin
            active_r[completion_index] <= 1'b0;
            remaining_r[completion_index] <= '0;
            expects_data_r[completion_index] <= 1'b0;
          end else begin
            remaining_r[completion_index] <=
                remaining_r[completion_index] - completion_payload_bytes_i;
          end
        end
      end
    end
  end

endmodule
