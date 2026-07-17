`timescale 1ns/1ps
module tlp_requester
  import tlp_pkg::*;
#(
    parameter int DATA_WIDTH = 32,
    parameter int KEEP_WIDTH = DATA_WIDTH / 8,
    parameter int CONTEXT_WIDTH = 16
) (
    input  logic                     clk_i,
    input  logic                     rst_i,
    input  logic [15:0]              requester_id_i,
    input  logic [12:0]              max_payload_bytes_i,
    input  logic [12:0]              max_read_bytes_i,

    input  logic                     command_valid_i,
    output logic                     command_ready_o,
    input  tlp_cmd_e                 command_i,
    input  logic [63:0]              command_address_i,
    input  logic [12:0]              command_byte_count_i,
    input  logic [2:0]               command_tc_i,
    input  logic [2:0]               command_attr_i,
    input  logic [CONTEXT_WIDTH-1:0] command_context_i,
    input  logic                     command_prefix_valid_i,
    input  logic [31:0]              command_prefix_i,
    input  logic                     command_digest_valid_i,
    input  logic [31:0]              command_digest_i,

    input  logic [DATA_WIDTH-1:0]    command_data_i,
    input  logic [KEEP_WIDTH-1:0]    command_keep_i,
    input  logic                     command_data_valid_i,
    input  logic                     command_data_last_i,
    output logic                     command_data_ready_o,

    output logic                     tag_request_valid_o,
    input  logic                     tag_request_ready_i,
    input  logic [7:0]               tag_i,
    output logic [15:0]              tag_requester_id_o,
    output logic [12:0]              tag_byte_count_o,
    output logic [CONTEXT_WIDTH-1:0] tag_context_o,
    output logic                     tag_expects_data_o,

    output tlp_header_t              packet_header_o,
    output logic                     packet_header_valid_o,
    input  logic                     packet_header_ready_i,
    output logic [DATA_WIDTH-1:0]    packet_data_o,
    output logic [KEEP_WIDTH-1:0]    packet_keep_o,
    output logic                     packet_data_valid_o,
    output logic                     packet_data_last_o,
    input  logic                     packet_data_ready_i,
    output logic                     command_error_o
);

  typedef enum logic [2:0] {REQ_IDLE, REQ_TAG, REQ_HEADER, REQ_DATA} req_state_e;
  req_state_e state_r;
  tlp_cmd_e command_r;
  logic [63:0] address_r;
  logic [12:0] remaining_r;
  logic [12:0] segment_bytes_r;
  logic [12:0] segment_sent_r;
  logic [2:0] tc_r;
  logic [2:0] attr_r;
  logic [CONTEXT_WIDTH-1:0] context_r;
  logic [7:0] tag_r;
  logic prefix_valid_r;
  logic [31:0] prefix_r;
  logic digest_valid_r;
  logic [31:0] digest_r;
  tlp_header_t header_c;
  logic command_has_data;
  logic command_non_posted;
  logic [12:0] accepted_bytes;
  logic expected_data_last;
  integer lane;

  function automatic logic [12:0] command_limit(input tlp_cmd_e command);
    if (command == TLP_CMD_CFG_READ0 || command == TLP_CMD_CFG_WRITE0 ||
        command == TLP_CMD_IO_READ || command == TLP_CMD_IO_WRITE)
      return 13'd4;
    if (command == TLP_CMD_MEM_READ)
      return max_read_bytes_i == 0 ? 13'd128 : max_read_bytes_i;
    return max_payload_bytes_i == 0 ? 13'd128 : max_payload_bytes_i;
  endfunction

  function automatic logic [12:0] calculate_segment(
      input logic [63:0] address,
      input logic [12:0] remaining,
      input logic [12:0] limit
  );
    logic [12:0] value;
    logic [12:0] boundary;
    logic [12:0] aligned_limit;
    boundary = 13'd4096 - {1'b0, address[11:0]};
    aligned_limit = limit > {11'd0, address[1:0]} ?
                    limit - {11'd0, address[1:0]} : 13'd1;
    value = remaining;
    if (value > aligned_limit)
      value = aligned_limit;
    if (value > boundary)
      value = boundary;
    return value;
  endfunction

  always_comb begin
    command_has_data   = command_r == TLP_CMD_MEM_WRITE ||
                         command_r == TLP_CMD_CFG_WRITE0 || command_r == TLP_CMD_IO_WRITE;
    command_non_posted = command_r != TLP_CMD_MEM_WRITE;
    accepted_bytes = '0;
    for (lane = 0; lane < KEEP_WIDTH; lane = lane + 1)
      accepted_bytes = accepted_bytes + command_keep_i[lane];

    header_c = '0;
    header_c.fmt = command_has_data ?
        (address_r[63:32] == 0 ? TLP_FMT_3DW_DATA : TLP_FMT_4DW_DATA) :
        (address_r[63:32] == 0 ? TLP_FMT_3DW_NO_DATA : TLP_FMT_4DW_NO_DATA);
    header_c.tlp_type = TLP_TYPE_MEM;
    if (command_r == TLP_CMD_CFG_READ0 || command_r == TLP_CMD_CFG_WRITE0) begin
      header_c.tlp_type = TLP_TYPE_CFG0;
      header_c.fmt = command_has_data ? TLP_FMT_3DW_DATA : TLP_FMT_3DW_NO_DATA;
    end else if (command_r == TLP_CMD_IO_READ || command_r == TLP_CMD_IO_WRITE) begin
      header_c.tlp_type = TLP_TYPE_IO;
      header_c.fmt = command_has_data ? TLP_FMT_3DW_DATA : TLP_FMT_3DW_NO_DATA;
    end
    header_c.traffic_class = tc_r;
    header_c.attributes    = attr_r;
    header_c.length_dw     = 11'((segment_bytes_r + {11'd0, address_r[1:0]} + 13'd3) >> 2);
    header_c.requester_id  = requester_id_i;
    header_c.tag           = tag_r;
    header_c.first_be      = tlp_first_be(address_r[1:0], segment_bytes_r);
    header_c.last_be       = tlp_last_be(address_r[1:0], segment_bytes_r);
    header_c.address       = address_r;
    header_c.prefix_present = prefix_valid_r;
    header_c.prefix         = prefix_r;
    header_c.digest_present = digest_valid_r;
    header_c.digest         = digest_r;
  end

  assign command_ready_o = state_r == REQ_IDLE;
  assign tag_request_valid_o = state_r == REQ_TAG;
  assign tag_requester_id_o = requester_id_i;
  assign tag_byte_count_o = segment_bytes_r;
  assign tag_context_o = context_r;
  assign tag_expects_data_o = command_r == TLP_CMD_MEM_READ ||
                              command_r == TLP_CMD_CFG_READ0 || command_r == TLP_CMD_IO_READ;
  assign packet_header_o = header_c;
  assign packet_header_valid_o = state_r == REQ_HEADER;
  assign packet_data_o = command_data_i;
  assign packet_keep_o = command_keep_i;
  assign packet_data_valid_o = state_r == REQ_DATA && command_data_valid_i;
  assign expected_data_last = segment_sent_r + accepted_bytes >= segment_bytes_r;
  // Always close the transmitted packet if the local producer terminates early;
  // command_error_o identifies that its length disagreed with the command.
  assign packet_data_last_o = expected_data_last || command_data_last_i;
  assign command_data_ready_o = state_r == REQ_DATA && packet_data_ready_i;

  always_ff @(posedge clk_i) begin
    if (rst_i) begin
      state_r         <= REQ_IDLE;
      command_r       <= TLP_CMD_MEM_READ;
      address_r       <= '0;
      remaining_r     <= '0;
      segment_bytes_r <= '0;
      segment_sent_r  <= '0;
      tc_r            <= '0;
      attr_r          <= '0;
      context_r       <= '0;
      tag_r           <= '0;
      prefix_valid_r  <= 1'b0;
      prefix_r        <= '0;
      digest_valid_r  <= 1'b0;
      digest_r        <= '0;
      command_error_o <= 1'b0;
    end else begin
      command_error_o <= 1'b0;
      unique case (state_r)
        REQ_IDLE: if (command_valid_i && command_ready_o) begin
          command_r   <= command_i;
          address_r   <= command_address_i;
          remaining_r <= command_byte_count_i;
          tc_r        <= command_tc_i;
          attr_r      <= command_attr_i;
          context_r   <= command_context_i;
          prefix_valid_r <= command_prefix_valid_i;
          prefix_r       <= command_prefix_i;
          digest_valid_r <= command_digest_valid_i;
          digest_r       <= command_digest_i;
          segment_bytes_r <= calculate_segment(command_address_i, command_byte_count_i,
                                               command_limit(command_i));
          segment_sent_r <= '0;
          state_r <= command_i == TLP_CMD_MEM_WRITE ? REQ_HEADER : REQ_TAG;
        end

        REQ_TAG: if (tag_request_ready_i) begin
          tag_r <= tag_i;
          state_r <= REQ_HEADER;
        end

        REQ_HEADER: if (packet_header_ready_i) begin
          if (command_has_data) begin
            state_r <= REQ_DATA;
          end else if (remaining_r > segment_bytes_r) begin
            address_r <= address_r + {51'd0, segment_bytes_r};
            remaining_r <= remaining_r - segment_bytes_r;
            segment_bytes_r <= calculate_segment(address_r + {51'd0, segment_bytes_r},
                remaining_r - segment_bytes_r, command_limit(command_r));
            state_r <= REQ_TAG;
          end else begin
            state_r <= REQ_IDLE;
          end
        end

        REQ_DATA: if (command_data_valid_i && command_data_ready_o) begin
          segment_sent_r <= segment_sent_r + accepted_bytes;
          if (command_data_last_i != expected_data_last)
            command_error_o <= 1'b1;
          if (command_data_last_i && !expected_data_last) begin
            // The source ended before the byte count promised by the command.
            // Abort this command after forwarding a terminating beat so that
            // both interfaces can recover for the next command.
            state_r <= REQ_IDLE;
          end else if (expected_data_last) begin
            if (remaining_r > segment_bytes_r) begin
              address_r <= address_r + {51'd0, segment_bytes_r};
              remaining_r <= remaining_r - segment_bytes_r;
              segment_bytes_r <= calculate_segment(address_r + {51'd0, segment_bytes_r},
                  remaining_r - segment_bytes_r, command_limit(command_r));
              segment_sent_r <= '0;
              state_r <= command_non_posted ? REQ_TAG : REQ_HEADER;
            end else begin
              state_r <= REQ_IDLE;
            end
          end
        end

        default: state_r <= REQ_IDLE;
      endcase
    end
  end

endmodule
