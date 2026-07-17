`timescale 1ns/1ps
module tlp_control
  import tlp_pkg::*;
#(
    parameter int DATA_WIDTH = 32,
    parameter int KEEP_WIDTH = DATA_WIDTH / 8
) (
    input  logic                  clk_i,
    input  logic                  rst_i,

    input  tlp_header_t           requester_header_i,
    input  logic                  requester_header_valid_i,
    output logic                  requester_header_ready_o,
    input  logic [DATA_WIDTH-1:0] requester_data_i,
    input  logic [KEEP_WIDTH-1:0] requester_keep_i,
    input  logic                  requester_data_valid_i,
    input  logic                  requester_data_last_i,
    output logic                  requester_data_ready_o,

    input  tlp_header_t           completion_header_i,
    input  logic                  completion_header_valid_i,
    output logic                  completion_header_ready_o,
    input  logic [DATA_WIDTH-1:0] completion_data_i,
    input  logic [KEEP_WIDTH-1:0] completion_keep_i,
    input  logic                  completion_data_valid_i,
    input  logic                  completion_data_last_i,
    output logic                  completion_data_ready_o,

    output tlp_header_t           generator_header_o,
    output logic                  generator_header_valid_o,
    input  logic                  generator_header_ready_i,
    output logic [DATA_WIDTH-1:0] generator_data_o,
    output logic [KEEP_WIDTH-1:0] generator_keep_o,
    output logic                  generator_data_valid_o,
    output logic                  generator_data_last_o,
    input  logic                  generator_data_ready_i
);

  logic locked_r;
  logic select_completion_r;
  logic selected_completion;

  always_comb begin
    selected_completion = locked_r ? select_completion_r : completion_header_valid_i;
    generator_header_o = selected_completion ? completion_header_i : requester_header_i;
    generator_header_valid_o = !locked_r &&
        (selected_completion ? completion_header_valid_i : requester_header_valid_i);
    completion_header_ready_o = !locked_r && selected_completion && generator_header_ready_i;
    requester_header_ready_o = !locked_r && !selected_completion && generator_header_ready_i;

    generator_data_o = selected_completion ? completion_data_i : requester_data_i;
    generator_keep_o = selected_completion ? completion_keep_i : requester_keep_i;
    generator_data_valid_o = locked_r &&
        (selected_completion ? completion_data_valid_i : requester_data_valid_i);
    generator_data_last_o = selected_completion ? completion_data_last_i : requester_data_last_i;
    completion_data_ready_o = locked_r && selected_completion && generator_data_ready_i;
    requester_data_ready_o = locked_r && !selected_completion && generator_data_ready_i;
  end

  always_ff @(posedge clk_i) begin
    if (rst_i) begin
      locked_r <= 1'b0;
      select_completion_r <= 1'b0;
    end else begin
      if (!locked_r && generator_header_valid_o && generator_header_ready_i &&
          tlp_has_data(generator_header_o.fmt)) begin
        locked_r <= 1'b1;
        select_completion_r <= selected_completion;
      end
      if (locked_r && generator_data_valid_o && generator_data_ready_i && generator_data_last_o)
        locked_r <= 1'b0;
    end
  end

endmodule
