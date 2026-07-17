`timescale 1ns/1ps
module tb_tlp_payload_formatter;
  logic clk_i = 0;
  logic rst_i;
  logic start_valid;
  logic start_ready;
  logic [1:0] start_offset;
  logic [31:0] s_axis_tdata;
  logic [3:0] s_axis_tkeep;
  logic s_axis_tvalid;
  logic s_axis_tlast;
  logic s_axis_tready;
  logic [31:0] m_axis_tdata;
  logic [3:0] m_axis_tkeep;
  logic m_axis_tvalid;
  logic m_axis_tlast;
  logic m_axis_tready;

  tlp_payload_formatter dut (
      .clk_i(clk_i), .rst_i(rst_i),
      .start_valid_i(start_valid), .start_ready_o(start_ready), .start_offset_i(start_offset),
      .s_axis_tdata(s_axis_tdata), .s_axis_tkeep(s_axis_tkeep),
      .s_axis_tvalid(s_axis_tvalid), .s_axis_tlast(s_axis_tlast), .s_axis_tready(s_axis_tready),
      .m_axis_tdata(m_axis_tdata), .m_axis_tkeep(m_axis_tkeep),
      .m_axis_tvalid(m_axis_tvalid), .m_axis_tlast(m_axis_tlast), .m_axis_tready(m_axis_tready)
  );
endmodule
