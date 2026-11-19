`timescale 1ns / 1ps

module tb_dllp_transmit_slice3;

  import pcie_datalink_pkg::*;

  logic clk_i = 0;
  logic rst_i = 1;

  logic [31:0] s_axis_tdata;
  logic [3:0]  s_axis_tkeep;
  logic        s_axis_tvalid;
  logic        s_axis_tlast;
  logic [2:0]  s_axis_tuser;
  logic        s_axis_tready;

  logic [31:0] m_axis_tdata;
  logic [3:0]  m_axis_tkeep;
  logic        m_axis_tvalid;
  logic        m_axis_tlast;
  logic [2:0]  m_axis_tuser;
  logic        m_axis_tready = 1;

  logic        ack_nack_i = 0;
  logic        ack_nack_vld_i = 0;
  logic [11:0] ack_seq_num_i = 0;
  pcie_dl_status_e link_status_i = DL_ACTIVE;
  logic        link_retraining_i = 0;
  logic        retrain_done_i = 0;

  logic [7:0]  tx_fc_ph_i = 8'hFF;
  logic [11:0] tx_fc_pd_i = 12'hFFF;
  logic [7:0]  tx_fc_nph_i = 8'hFF;
  logic [11:0] tx_fc_npd_i = 12'hFFF;
  logic [7:0]  tx_fc_cplh_i = 8'hFF;
  logic [11:0] tx_fc_cpld_i = 12'hFFF;
  logic        update_fc_i = 1;

  logic        retry_err_o;
  logic        retrain_request_o;
  logic        replay_timeout_error_o;
  logic        dllp_protocol_error_o;

  logic [31:0] tlp_data [0:3];
  int          beat_idx = 0;
  int          done_count = 0;
  int          timeout;

  always #5 clk_i = ~clk_i;

  dllp_transmit #(
    .DATA_WIDTH(32),
    .USER_WIDTH(3),
    .MAX_PAYLOAD_SIZE(256),
    .RETRY_TLP_SIZE(3),
    .REPLAY_TIMEOUT_CYCLES(20)
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
    .ack_nack_i(ack_nack_i),
    .ack_nack_vld_i(ack_nack_vld_i),
    .ack_seq_num_i(ack_seq_num_i),
    .link_status_i(link_status_i),
    .link_retraining_i(link_retraining_i),
    .retrain_done_i(retrain_done_i),
    .tx_fc_ph_i(tx_fc_ph_i),
    .tx_fc_pd_i(tx_fc_pd_i),
    .tx_fc_nph_i(tx_fc_nph_i),
    .tx_fc_npd_i(tx_fc_npd_i),
    .tx_fc_cplh_i(tx_fc_cplh_i),
    .tx_fc_cpld_i(tx_fc_cpld_i),
    .update_fc_i(update_fc_i),
    .retry_err_o(retry_err_o),
    .retrain_request_o(retrain_request_o),
    .replay_timeout_error_o(replay_timeout_error_o),
    .dllp_protocol_error_o(dllp_protocol_error_o)
  );

  assign s_axis_tvalid = beat_idx < 4;
  assign s_axis_tdata  = beat_idx < 4 ? tlp_data[beat_idx] : 32'h0;
  assign s_axis_tkeep  = 4'hF;
  assign s_axis_tlast  = beat_idx < 4 ? (beat_idx == 3) : 1'b0;
  assign s_axis_tuser  = 3'b0;

  always_ff @(posedge clk_i) begin
    if (rst_i)
      beat_idx <= 0;
    else if (s_axis_tvalid && s_axis_tready)
      beat_idx <= beat_idx + 1;
  end

  always_ff @(posedge clk_i) begin
    if (!rst_i && dut.original_tlp_done)
      done_count <= done_count + 1;
  end

  initial begin
    tlp_data[0] = 32'h01000040;
    tlp_data[1] = 32'h00000000;
    tlp_data[2] = 32'h00000000;
    tlp_data[3] = 32'hDEADBEEF;
  end

  initial begin
    repeat (5) @(posedge clk_i);
    rst_i <= 0;

    timeout = 0;
    while (!(dut.m_axis_tlp2dllp_tvalid && dut.m_axis_tlp2dllp_tready &&
             !dut.m_axis_tlp2dllp_tlast) && timeout < 200) begin
      @(posedge clk_i);
      timeout++;
    end
    @(posedge clk_i);
    if (!dut.original_tlp_busy)
      $fatal(1, "original TLP busy not asserted after first accepted beat");

    timeout = 0;
    while (done_count == 0 && timeout < 200) begin
      @(posedge clk_i);
      timeout++;
    end
    if (dut.original_tlp_busy)
      $fatal(1, "original TLP busy not cleared after final accepted beat");
    if (done_count != 1)
      $fatal(1, "original TLP done pulse count incorrect");

    timeout = 0;
    while (!replay_timeout_error_o && timeout < 100) begin
      @(posedge clk_i);
      timeout++;
    end
    if (!replay_timeout_error_o)
      $fatal(1, "replay timeout error output did not assert");

    repeat (10) @(posedge clk_i);
    if (dut.original_tlp_busy)
      $fatal(1, "replay traffic incorrectly set original TLP busy");
    if (retrain_request_o)
      $fatal(1, "first replay timeout incorrectly requested retrain");

    $display("PASS: slice-3 original TLP completion and retry error wiring");
    $finish;
  end

endmodule
