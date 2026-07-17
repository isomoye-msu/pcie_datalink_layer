`timescale 1ns/1ps
module tb_tlp_generator;
  import tlp_pkg::*;
  logic clk_i = 0;
  logic rst_i;
  logic [2:0] in_fmt;
  logic [4:0] in_type;
  logic [2:0] in_tc;
  logic [2:0] in_attr;
  logic [10:0] in_length_dw;
  logic [15:0] in_requester_id;
  logic [15:0] in_completer_id;
  logic [7:0] in_tag;
  logic [3:0] in_first_be;
  logic [3:0] in_last_be;
  logic [63:0] in_address;
  logic [2:0] in_status;
  logic [12:0] in_byte_count;
  logic [6:0] in_lower_address;
  logic in_prefix_present;
  logic [31:0] in_prefix;
  logic in_digest_present;
  logic [31:0] in_digest;
  logic header_valid;
  logic header_ready;
  logic [31:0] payload_tdata;
  logic [3:0] payload_tkeep;
  logic payload_tvalid;
  logic payload_tlast;
  logic payload_tready;
  logic [31:0] m_axis_tdata;
  logic [3:0] m_axis_tkeep;
  logic m_axis_tvalid;
  logic m_axis_tlast;
  logic [2:0] m_axis_tuser;
  logic m_axis_tready;
  tlp_header_t header;

  always_comb begin
    header = '0;
    header.fmt = in_fmt;
    header.tlp_type = in_type;
    header.traffic_class = in_tc;
    header.attributes = in_attr;
    header.length_dw = in_length_dw;
    header.requester_id = in_requester_id;
    header.completer_id = in_completer_id;
    header.tag = in_tag;
    header.first_be = in_first_be;
    header.last_be = in_last_be;
    header.address = in_address;
    header.completion_status = in_status;
    header.byte_count = in_byte_count;
    header.lower_address = in_lower_address;
    header.prefix_present = in_prefix_present;
    header.prefix = in_prefix;
    header.digest_present = in_digest_present;
    header.digest = in_digest;
  end

  tlp_generator dut (
      .clk_i(clk_i), .rst_i(rst_i), .header_i(header),
      .header_valid_i(header_valid), .header_ready_o(header_ready),
      .payload_tdata_i(payload_tdata), .payload_tkeep_i(payload_tkeep),
      .payload_tvalid_i(payload_tvalid), .payload_tlast_i(payload_tlast),
      .payload_tready_o(payload_tready),
      .m_axis_tdata(m_axis_tdata), .m_axis_tkeep(m_axis_tkeep),
      .m_axis_tvalid(m_axis_tvalid), .m_axis_tlast(m_axis_tlast),
      .m_axis_tuser(m_axis_tuser), .m_axis_tready(m_axis_tready)
  );
endmodule
