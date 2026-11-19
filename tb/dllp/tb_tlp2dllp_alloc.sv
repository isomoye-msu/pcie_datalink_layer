`timescale 1ns / 1ps

module tb_tlp2dllp_alloc;

  import pcie_datalink_pkg::*;

  logic clk_i = 0;
  logic rst_i = 1;

  logic [31:0] s_axis_tdata;
  logic [3:0] s_axis_tkeep;
  logic s_axis_tvalid;
  logic s_axis_tlast;
  logic [0:0] s_axis_tuser;
  logic s_axis_tready;

  logic [31:0] m_axis_tdata;
  logic [3:0] m_axis_tkeep;
  logic m_axis_tvalid;
  logic m_axis_tlast;
  logic [0:0] m_axis_tuser;
  logic m_axis_tready = 1;

  logic [15:0] seq_num_o;
  logic dllp_valid_o;
  logic retry_available_i = 0;
  logic [7:0] retry_index_i = 8'h5A;

  logic [7:0] tx_fc_ph_i = 8'hFF;
  logic [11:0] tx_fc_pd_i = 12'hFFF;
  logic [7:0] tx_fc_nph_i = 8'hFF;
  logic [11:0] tx_fc_npd_i = 12'hFFF;
  logic [7:0] tx_fc_cplh_i = 8'hFF;
  logic [11:0] tx_fc_cpld_i = 12'hFFF;
  logic update_fc_i = 1;

  logic [31:0] tlp_data [0:7];
  integer beat_idx = 0;
  integer alloc_count = 0;
  integer timeout = 0;

  always #5 clk_i = ~clk_i;

  tlp2dllp #(
    .USER_WIDTH(1),
    .DATA_WIDTH(32),
    .MAX_PAYLOAD_SIZE(256)
  ) dut (
    .clk_i(clk_i),
    .rst_i(rst_i),
    .s_axis_tdata(s_axis_tdata),
    .s_axis_tkeep(s_axis_tkeep),
    .s_axis_tvalid(s_axis_tvalid),
    .s_axis_tlast(s_axis_tlast),
    .s_axis_tuser(s_axis_tuser),
    .s_axis_tready(s_axis_tready),
    .m_axis_tdata(m_axis_tdata),
    .m_axis_tkeep(m_axis_tkeep),
    .m_axis_tvalid(m_axis_tvalid),
    .m_axis_tlast(m_axis_tlast),
    .m_axis_tuser(m_axis_tuser),
    .m_axis_tready(m_axis_tready),
    .seq_num_o(seq_num_o),
    .dllp_valid_o(dllp_valid_o),
    .retry_available_i(retry_available_i),
    .retry_index_i(retry_index_i),
    .tx_fc_ph_i(tx_fc_ph_i),
    .tx_fc_pd_i(tx_fc_pd_i),
    .tx_fc_nph_i(tx_fc_nph_i),
    .tx_fc_npd_i(tx_fc_npd_i),
    .tx_fc_cplh_i(tx_fc_cplh_i),
    .tx_fc_cpld_i(tx_fc_cpld_i),
    .update_fc_i(update_fc_i)
  );

  assign s_axis_tvalid = beat_idx < 8;
  assign s_axis_tdata = beat_idx < 8 ? tlp_data[beat_idx] : 32'h0;
  assign s_axis_tkeep = 4'hF;
  assign s_axis_tlast = beat_idx < 8 ? (beat_idx[1:0] == 2'b11) : 1'b0;
  assign s_axis_tuser = 1'b0;

  always_ff @(posedge clk_i) begin
    if (rst_i)
      beat_idx <= 0;
    else if (s_axis_tvalid && s_axis_tready)
      beat_idx <= beat_idx + 1;
  end

  always_ff @(posedge clk_i) begin
    if (!rst_i && dllp_valid_o) begin
      $display("ALLOC count=%0d seq=%h index=%h t=%0t", alloc_count, seq_num_o[11:0], retry_index_i, $time);
      if (alloc_count == 0 && seq_num_o[11:0] != 12'h000)
        $fatal(1, "first allocation used wrong sequence");
      if (alloc_count == 1 && seq_num_o[11:0] != 12'h001)
        $fatal(1, "second allocation used wrong sequence");
      if (retry_index_i != 8'h5A)
        $fatal(1, "retry index changed at allocation");
      alloc_count <= alloc_count + 1;
    end
  end

  initial begin
    tlp_data[0] = 32'h01000040;
    tlp_data[1] = 32'h00000000;
    tlp_data[2] = 32'h00000000;
    tlp_data[3] = 32'hDEADBEEF;
    tlp_data[4] = 32'h01000040;
    tlp_data[5] = 32'h00000000;
    tlp_data[6] = 32'h00000000;
    tlp_data[7] = 32'hCAFEBABE;
  end

  initial begin
    repeat (5) @(posedge clk_i);
    rst_i <= 0;

    repeat (40) @(posedge clk_i);
    if (alloc_count != 0)
      $fatal(1, "TLP started while retry_available_i was low");

    retry_available_i <= 1;
    timeout = 0;
    while (alloc_count < 1 && timeout < 200) begin
      @(posedge clk_i);
      timeout = timeout + 1;
    end
    if (alloc_count != 1)
      $fatal(1, "first TLP did not allocate a retry slot");

    timeout = 0;
    while (alloc_count < 2 && timeout < 200) begin
      @(posedge clk_i);
      timeout = timeout + 1;
    end
    if (alloc_count != 2)
      $fatal(1, "second TLP did not allocate a retry slot");

    repeat (20) @(posedge clk_i);
    if (alloc_count != 2)
      $fatal(1, "extra allocation strobe observed");
    if (beat_idx != 8)
      $fatal(1, "not all source beats were accepted");

    $display("PASS: slice-1 allocation gating and strobe behavior");
    $finish;
  end

endmodule
