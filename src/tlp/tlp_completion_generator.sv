`timescale 1ns/1ps
module tlp_completion_generator
  import tlp_pkg::*;
#(
    parameter int DATA_WIDTH = 32,
    parameter int KEEP_WIDTH = DATA_WIDTH / 8
) (
    input  logic                  clk_i,
    input  logic                  rst_i,
    input  logic [15:0]           completer_id_i,

    input  logic                  request_valid_i,
    output logic                  request_ready_o,
    input  tlp_header_t           request_header_i,
    input  logic [2:0]            request_status_i,
    input  logic [12:0]           request_byte_count_i,
    input  logic [6:0]            request_lower_address_i,
    input  logic                  request_digest_valid_i,
    input  logic [31:0]           request_digest_i,

    input  logic [DATA_WIDTH-1:0] request_data_i,
    input  logic [KEEP_WIDTH-1:0] request_keep_i,
    input  logic                  request_data_valid_i,
    input  logic                  request_data_last_i,
    output logic                  request_data_ready_o,

    output tlp_header_t           packet_header_o,
    output logic                  packet_header_valid_o,
    input  logic                  packet_header_ready_i,
    output logic [DATA_WIDTH-1:0] packet_data_o,
    output logic [KEEP_WIDTH-1:0] packet_keep_o,
    output logic                  packet_data_valid_o,
    output logic                  packet_data_last_o,
    input  logic                  packet_data_ready_i
);

  typedef enum logic [1:0] {CPL_IDLE, CPL_HEADER, CPL_DATA} cpl_state_e;
  cpl_state_e state_r;
  tlp_header_t header_r;

  assign request_ready_o = state_r == CPL_IDLE;
  assign packet_header_o = header_r;
  assign packet_header_valid_o = state_r == CPL_HEADER;
  assign packet_data_o = request_data_i;
  assign packet_keep_o = request_keep_i;
  assign packet_data_valid_o = state_r == CPL_DATA && request_data_valid_i;
  assign packet_data_last_o = request_data_last_i;
  assign request_data_ready_o = state_r == CPL_DATA && packet_data_ready_i;

  always_ff @(posedge clk_i) begin
    if (rst_i) begin
      state_r  <= CPL_IDLE;
      header_r <= '0;
    end else begin
      unique case (state_r)
        CPL_IDLE: if (request_valid_i && request_ready_o) begin
          header_r <= '0;
          header_r.fmt <= request_byte_count_i == 0 ? TLP_FMT_3DW_NO_DATA : TLP_FMT_3DW_DATA;
          header_r.tlp_type <= TLP_TYPE_CPL;
          header_r.traffic_class <= request_header_i.traffic_class;
          header_r.attributes <= request_header_i.attributes;
          header_r.length_dw <= 11'((request_byte_count_i +
              {11'd0, request_lower_address_i[1:0]} + 13'd3) >> 2);
          header_r.requester_id <= request_header_i.requester_id;
          header_r.completer_id <= completer_id_i;
          header_r.tag <= request_header_i.tag;
          header_r.completion_status <= request_status_i;
          header_r.byte_count <= request_byte_count_i;
          header_r.lower_address <= request_lower_address_i;
          header_r.digest_present <= request_digest_valid_i;
          header_r.digest <= request_digest_i;
          state_r <= CPL_HEADER;
        end

        CPL_HEADER: if (packet_header_ready_i) begin
          if (header_r.length_dw == 0)
            state_r <= CPL_IDLE;
          else
            state_r <= CPL_DATA;
        end

        CPL_DATA: if (request_data_valid_i && request_data_ready_o && request_data_last_i)
          state_r <= CPL_IDLE;

        default: state_r <= CPL_IDLE;
      endcase
    end
  end

endmodule
