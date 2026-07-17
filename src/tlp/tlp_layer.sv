`timescale 1ns/1ps
module tlp_layer
  import tlp_pkg::*;
#(
    parameter int DATA_WIDTH = 32,
    parameter int KEEP_WIDTH = DATA_WIDTH / 8,
    parameter int USER_WIDTH = 3,
    parameter int TAG_COUNT = 32,
    parameter int CONTEXT_WIDTH = 16,
    parameter int BAR_COUNT = 2,
    parameter logic [BAR_COUNT*64-1:0] BAR_BASE = '0,
    parameter logic [BAR_COUNT*64-1:0] BAR_MASK = {{(BAR_COUNT-1){64'd0}}, 64'hffff_ffff_ffff_f000},
    parameter logic [BAR_COUNT-1:0] BAR_ENABLE = {{(BAR_COUNT-1){1'b0}}, 1'b1}
) (
    input  logic                     clk_i,
    input  logic                     rst_i,
    input  logic                     link_up_i,
    input  logic                     transmit_enable_i,
    input  logic [15:0]              requester_id_i,
    input  logic [15:0]              completer_id_i,
    input  logic [7:0]               bus_number_i,
    input  logic [4:0]               device_number_i,
    input  logic [2:0]               function_number_i,
    input  logic                     memory_enable_i,
    input  logic                     extended_tag_enable_i,
    input  logic [12:0]              max_payload_bytes_i,
    input  logic [12:0]              max_read_bytes_i,

    input  logic [DATA_WIDTH-1:0]    s_dllp_axis_tdata,
    input  logic [KEEP_WIDTH-1:0]    s_dllp_axis_tkeep,
    input  logic                     s_dllp_axis_tvalid,
    input  logic                     s_dllp_axis_tlast,
    input  logic [USER_WIDTH-1:0]    s_dllp_axis_tuser,
    output logic                     s_dllp_axis_tready,

    output logic [DATA_WIDTH-1:0]    m_dllp_axis_tdata,
    output logic [KEEP_WIDTH-1:0]    m_dllp_axis_tkeep,
    output logic                     m_dllp_axis_tvalid,
    output logic                     m_dllp_axis_tlast,
    output logic [USER_WIDTH-1:0]    m_dllp_axis_tuser,
    input  logic                     m_dllp_axis_tready,

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
    output logic                     command_error_o,

    output logic                     target_request_valid_o,
    input  logic                     target_request_ready_i,
    output tlp_header_t              target_request_header_o,
    output tlp_class_e               target_request_class_o,
    output logic                     target_memory_o,
    output logic                     target_config_o,
    output logic                     target_config_hit_o,
    output logic                     target_config_type_one_o,
    output logic [11:0]              target_config_offset_o,
    output logic                     target_read_o,
    output logic                     target_write_o,
    output logic                     target_unsupported_o,
    output logic                     target_bar_hit_o,
    output logic [((BAR_COUNT <= 1) ? 1 : $clog2(BAR_COUNT))-1:0] target_bar_o,
    output logic [63:0]              target_offset_o,
    output logic [DATA_WIDTH-1:0]    target_data_o,
    output logic [KEEP_WIDTH-1:0]    target_keep_o,
    output logic                     target_data_valid_o,
    output logic                     target_data_last_o,
    input  logic                     target_data_ready_i,

    input  logic                     completion_request_valid_i,
    output logic                     completion_request_ready_o,
    input  tlp_header_t              completion_request_header_i,
    input  logic [2:0]               completion_request_status_i,
    input  logic [12:0]              completion_request_byte_count_i,
    input  logic [6:0]               completion_request_lower_address_i,
    input  logic                     completion_request_digest_valid_i,
    input  logic [31:0]              completion_request_digest_i,
    input  logic [DATA_WIDTH-1:0]    completion_request_data_i,
    input  logic [KEEP_WIDTH-1:0]    completion_request_keep_i,
    input  logic                     completion_request_data_valid_i,
    input  logic                     completion_request_data_last_i,
    output logic                     completion_request_data_ready_o,

    output logic                     received_completion_valid_o,
    input  logic                     received_completion_ready_i,
    output tlp_header_t              received_completion_header_o,
    output logic [DATA_WIDTH-1:0]    received_completion_data_o,
    output logic [KEEP_WIDTH-1:0]    received_completion_keep_o,
    output logic                     received_completion_data_valid_o,
    output logic                     received_completion_data_last_o,
    input  logic                     received_completion_data_ready_i,

    output logic                     result_valid_o,
    input  logic                     result_ready_i,
    output logic [CONTEXT_WIDTH-1:0] result_context_o,
    output logic [2:0]               result_status_o,
    output logic                     result_last_o,
    output logic                     malformed_o,
    output logic                     unexpected_completion_o,
    output logic [$clog2(TAG_COUNT+1)-1:0] outstanding_o
);

  localparam int BAR_INDEX_WIDTH = BAR_COUNT <= 1 ? 1 : $clog2(BAR_COUNT);
  logic layer_reset;
  tlp_header_t parsed_header;
  logic parsed_header_valid;
  logic parsed_header_ready;
  logic [DATA_WIDTH-1:0] parsed_data;
  logic [KEEP_WIDTH-1:0] parsed_keep;
  logic parsed_data_valid;
  logic parsed_data_last;
  logic parsed_data_ready;
  tlp_class_e parsed_class;
  logic parsed_memory, parsed_config, parsed_completion;
  logic parsed_read, parsed_write, parsed_unsupported;
  logic [BAR_INDEX_WIDTH-1:0] decoded_bar;
  logic route_completion_r;

  tlp_header_t requester_header;
  logic requester_header_valid, requester_header_ready;
  logic [DATA_WIDTH-1:0] requester_data;
  logic [KEEP_WIDTH-1:0] requester_keep;
  logic requester_data_valid, requester_data_last, requester_data_ready;
  logic tag_valid, tag_ready;
  logic tracker_completion_ready;
  logic [12:0] completion_payload_bytes;
  logic [7:0] allocated_tag;
  logic [15:0] tag_requester_id;
  logic [12:0] tag_byte_count;
  logic [CONTEXT_WIDTH-1:0] tag_context;
  logic tag_expects_data;

  tlp_header_t completion_header;
  logic completion_header_valid, completion_header_ready;
  logic [DATA_WIDTH-1:0] completion_data;
  logic [KEEP_WIDTH-1:0] completion_keep;
  logic completion_data_valid, completion_data_last, completion_data_ready;

  tlp_header_t generator_header;
  logic generator_header_valid, generator_header_ready;
  logic [DATA_WIDTH-1:0] generator_data;
  logic [KEEP_WIDTH-1:0] generator_keep;
  logic generator_data_valid, generator_data_last, generator_data_ready;
  logic [DATA_WIDTH-1:0] generated_axis_data;
  logic [KEEP_WIDTH-1:0] generated_axis_keep;
  logic generated_axis_valid, generated_axis_last;
  logic [USER_WIDTH-1:0] generated_axis_user;
  logic generated_axis_ready;

  assign layer_reset = rst_i || !link_up_i;
  assign received_completion_header_o = parsed_header;
  assign received_completion_valid_o = parsed_header_valid && parsed_completion &&
                                         tracker_completion_ready;
  assign target_request_header_o = parsed_header;
  assign target_request_class_o = parsed_class;
  assign target_request_valid_o = parsed_header_valid && !parsed_completion;
  assign target_memory_o = parsed_memory;
  assign target_config_o = parsed_config;
  assign target_read_o = parsed_read;
  assign target_write_o = parsed_write;
  assign target_unsupported_o = parsed_unsupported ||
                                (parsed_memory && !target_bar_hit_o) ||
                                (parsed_config && !target_config_hit_o);

  assign parsed_header_ready = parsed_completion ?
      (received_completion_ready_i && tracker_completion_ready) : target_request_ready_i;

  always_comb begin
    completion_payload_bytes = {parsed_header.length_dw, 2'b00} -
                               {11'd0, parsed_header.lower_address[1:0]};
    if (parsed_header.byte_count < completion_payload_bytes)
      completion_payload_bytes = parsed_header.byte_count;
  end

  assign target_data_o = parsed_data;
  assign target_keep_o = parsed_keep;
  assign target_data_valid_o = parsed_data_valid && !route_completion_r;
  assign target_data_last_o = parsed_data_last;
  assign received_completion_data_o = parsed_data;
  assign received_completion_keep_o = parsed_keep;
  assign received_completion_data_valid_o = parsed_data_valid && route_completion_r;
  assign received_completion_data_last_o = parsed_data_last;
  assign parsed_data_ready = route_completion_r ?
      received_completion_data_ready_i : target_data_ready_i;

  always_ff @(posedge clk_i) begin
    if (layer_reset) begin
      route_completion_r <= 1'b0;
    end else begin
      if (parsed_header_valid && parsed_header_ready)
        route_completion_r <= parsed_completion;
      if (parsed_data_valid && parsed_data_ready && parsed_data_last)
        route_completion_r <= 1'b0;
    end
  end

  assign m_dllp_axis_tdata = generated_axis_data;
  assign m_dllp_axis_tkeep = generated_axis_keep;
  assign m_dllp_axis_tvalid = generated_axis_valid && transmit_enable_i && link_up_i;
  assign m_dllp_axis_tlast = generated_axis_last;
  assign m_dllp_axis_tuser = generated_axis_user;
  assign generated_axis_ready = m_dllp_axis_tready && transmit_enable_i && link_up_i;

  tlp_parser #(
      .DATA_WIDTH(DATA_WIDTH), .KEEP_WIDTH(KEEP_WIDTH), .USER_WIDTH(USER_WIDTH)
  ) parser_inst (
      .clk_i(clk_i), .rst_i(layer_reset),
      .s_axis_tdata(s_dllp_axis_tdata), .s_axis_tkeep(s_dllp_axis_tkeep),
      .s_axis_tvalid(s_dllp_axis_tvalid), .s_axis_tlast(s_dllp_axis_tlast),
      .s_axis_tuser(s_dllp_axis_tuser), .s_axis_tready(s_dllp_axis_tready),
      .header_o(parsed_header), .header_valid_o(parsed_header_valid),
      .header_ready_i(parsed_header_ready),
      .payload_tdata_o(parsed_data), .payload_tkeep_o(parsed_keep),
      .payload_tvalid_o(parsed_data_valid), .payload_tlast_o(parsed_data_last),
      .payload_tready_i(parsed_data_ready), .malformed_o(malformed_o)
  );

  tlp_classifier classifier_inst (
      .header_i(parsed_header), .class_o(parsed_class),
      .memory_request_o(parsed_memory), .config_request_o(parsed_config),
      .completion_o(parsed_completion), .read_request_o(parsed_read),
      .write_request_o(parsed_write), .unsupported_o(parsed_unsupported)
  );

  tlp_bar_decoder #(
      .BAR_COUNT(BAR_COUNT), .BAR_BASE(BAR_BASE), .BAR_MASK(BAR_MASK), .BAR_ENABLE(BAR_ENABLE)
  ) bar_decoder_inst (
      .address_i(parsed_header.address), .memory_enable_i(memory_enable_i),
      .hit_o(target_bar_hit_o), .bar_o(decoded_bar), .offset_o(target_offset_o)
  );
  assign target_bar_o = decoded_bar;

  tlp_config_decoder config_decoder_inst (
      .header_i(parsed_header), .bus_number_i(bus_number_i),
      .device_number_i(device_number_i), .function_number_i(function_number_i),
      .hit_o(target_config_hit_o), .type_one_o(target_config_type_one_o),
      .register_offset_o(target_config_offset_o)
  );

  tlp_requester #(
      .DATA_WIDTH(DATA_WIDTH), .KEEP_WIDTH(KEEP_WIDTH), .CONTEXT_WIDTH(CONTEXT_WIDTH)
  ) requester_inst (
      .clk_i(clk_i), .rst_i(layer_reset), .requester_id_i(requester_id_i),
      .max_payload_bytes_i(max_payload_bytes_i), .max_read_bytes_i(max_read_bytes_i),
      .command_valid_i(command_valid_i), .command_ready_o(command_ready_o),
      .command_i(command_i), .command_address_i(command_address_i),
      .command_byte_count_i(command_byte_count_i), .command_tc_i(command_tc_i),
      .command_attr_i(command_attr_i), .command_context_i(command_context_i),
      .command_prefix_valid_i(command_prefix_valid_i), .command_prefix_i(command_prefix_i),
      .command_digest_valid_i(command_digest_valid_i), .command_digest_i(command_digest_i),
      .command_data_i(command_data_i), .command_keep_i(command_keep_i),
      .command_data_valid_i(command_data_valid_i), .command_data_last_i(command_data_last_i),
      .command_data_ready_o(command_data_ready_o),
      .tag_request_valid_o(tag_valid), .tag_request_ready_i(tag_ready), .tag_i(allocated_tag),
      .tag_requester_id_o(tag_requester_id), .tag_byte_count_o(tag_byte_count),
      .tag_context_o(tag_context), .tag_expects_data_o(tag_expects_data),
      .packet_header_o(requester_header),
      .packet_header_valid_o(requester_header_valid), .packet_header_ready_i(requester_header_ready),
      .packet_data_o(requester_data), .packet_keep_o(requester_keep),
      .packet_data_valid_o(requester_data_valid), .packet_data_last_o(requester_data_last),
      .packet_data_ready_i(requester_data_ready), .command_error_o(command_error_o)
  );

  tlp_request_tracker #(
      .TAG_COUNT(TAG_COUNT), .CONTEXT_WIDTH(CONTEXT_WIDTH)
  ) tracker_inst (
      .clk_i(clk_i), .rst_i(layer_reset), .extended_tag_enable_i(extended_tag_enable_i),
      .allocate_valid_i(tag_valid), .allocate_ready_o(tag_ready),
      .allocate_requester_id_i(tag_requester_id), .allocate_byte_count_i(tag_byte_count),
      .allocate_context_i(tag_context), .allocate_expects_data_i(tag_expects_data),
      .allocate_tag_o(allocated_tag),
      .completion_valid_i(parsed_header_valid && parsed_completion && received_completion_ready_i),
      .completion_ready_o(tracker_completion_ready), .completion_header_i(parsed_header),
      .completion_payload_bytes_i(completion_payload_bytes),
      .result_valid_o(result_valid_o), .result_ready_i(result_ready_i),
      .result_context_o(result_context_o), .result_status_o(result_status_o),
      .result_last_o(result_last_o), .unexpected_completion_o(unexpected_completion_o),
      .outstanding_o(outstanding_o)
  );

  tlp_completion_generator #(
      .DATA_WIDTH(DATA_WIDTH), .KEEP_WIDTH(KEEP_WIDTH)
  ) completion_generator_inst (
      .clk_i(clk_i), .rst_i(layer_reset), .completer_id_i(completer_id_i),
      .request_valid_i(completion_request_valid_i), .request_ready_o(completion_request_ready_o),
      .request_header_i(completion_request_header_i),
      .request_status_i(completion_request_status_i),
      .request_byte_count_i(completion_request_byte_count_i),
      .request_lower_address_i(completion_request_lower_address_i),
      .request_digest_valid_i(completion_request_digest_valid_i),
      .request_digest_i(completion_request_digest_i),
      .request_data_i(completion_request_data_i), .request_keep_i(completion_request_keep_i),
      .request_data_valid_i(completion_request_data_valid_i),
      .request_data_last_i(completion_request_data_last_i),
      .request_data_ready_o(completion_request_data_ready_o),
      .packet_header_o(completion_header), .packet_header_valid_o(completion_header_valid),
      .packet_header_ready_i(completion_header_ready), .packet_data_o(completion_data),
      .packet_keep_o(completion_keep), .packet_data_valid_o(completion_data_valid),
      .packet_data_last_o(completion_data_last), .packet_data_ready_i(completion_data_ready)
  );

  tlp_control #(
      .DATA_WIDTH(DATA_WIDTH), .KEEP_WIDTH(KEEP_WIDTH)
  ) control_inst (
      .clk_i(clk_i), .rst_i(layer_reset),
      .requester_header_i(requester_header), .requester_header_valid_i(requester_header_valid),
      .requester_header_ready_o(requester_header_ready), .requester_data_i(requester_data),
      .requester_keep_i(requester_keep), .requester_data_valid_i(requester_data_valid),
      .requester_data_last_i(requester_data_last), .requester_data_ready_o(requester_data_ready),
      .completion_header_i(completion_header), .completion_header_valid_i(completion_header_valid),
      .completion_header_ready_o(completion_header_ready), .completion_data_i(completion_data),
      .completion_keep_i(completion_keep), .completion_data_valid_i(completion_data_valid),
      .completion_data_last_i(completion_data_last), .completion_data_ready_o(completion_data_ready),
      .generator_header_o(generator_header), .generator_header_valid_o(generator_header_valid),
      .generator_header_ready_i(generator_header_ready), .generator_data_o(generator_data),
      .generator_keep_o(generator_keep), .generator_data_valid_o(generator_data_valid),
      .generator_data_last_o(generator_data_last), .generator_data_ready_i(generator_data_ready)
  );

  tlp_generator #(
      .DATA_WIDTH(DATA_WIDTH), .KEEP_WIDTH(KEEP_WIDTH), .USER_WIDTH(USER_WIDTH)
  ) generator_inst (
      .clk_i(clk_i), .rst_i(layer_reset), .header_i(generator_header),
      .header_valid_i(generator_header_valid), .header_ready_o(generator_header_ready),
      .payload_tdata_i(generator_data), .payload_tkeep_i(generator_keep),
      .payload_tvalid_i(generator_data_valid), .payload_tlast_i(generator_data_last),
      .payload_tready_o(generator_data_ready), .m_axis_tdata(generated_axis_data),
      .m_axis_tkeep(generated_axis_keep), .m_axis_tvalid(generated_axis_valid),
      .m_axis_tlast(generated_axis_last), .m_axis_tuser(generated_axis_user),
      .m_axis_tready(generated_axis_ready)
  );

endmodule
