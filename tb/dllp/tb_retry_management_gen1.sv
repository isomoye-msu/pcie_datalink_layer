`timescale 1ns / 1ps

module tb_retry_management_gen1;

  logic clk_i = 0;
  logic rst_i = 1;

  logic [11:0] tx_seq_num_i = 12'h0;
  logic tx_valid_i = 0;
  logic tx_tlp_done_i = 0;
  logic tx_tlp_busy_i = 0;
  logic retry_available_o;
  logic [7:0] retry_index_o;
  logic retry_err_o;
  logic [2:0] retry_valid_o;
  logic [2:0] retry_ack_i = 3'b0;
  logic [2:0] retry_complete_i = 3'b0;
  logic ack_nack_i = 1;
  logic ack_nack_vld_i = 0;
  logic [11:0] ack_seq_num_i = 12'h0;
  logic link_retraining_i = 0;
  logic retrain_done_i = 0;
  logic dl_inactive_i = 0;
  logic retrain_request_o;
  logic replay_timeout_error_o;
  logic dllp_protocol_error_o;

  always #5 clk_i = ~clk_i;

  retry_management #(
    .RETRY_TLP_SIZE(3),
    .REPLAY_TIMEOUT_CYCLES(1000)
  ) dut (
    .clk_i(clk_i),
    .rst_i(rst_i),
    .tx_seq_num_i(tx_seq_num_i),
    .tx_valid_i(tx_valid_i),
    .tx_tlp_done_i(tx_tlp_done_i),
    .tx_tlp_busy_i(tx_tlp_busy_i),
    .retry_available_o(retry_available_o),
    .retry_index_o(retry_index_o),
    .retry_err_o(retry_err_o),
    .retry_valid_o(retry_valid_o),
    .retry_ack_i(retry_ack_i),
    .retry_complete_i(retry_complete_i),
    .ack_nack_i(ack_nack_i),
    .ack_nack_vld_i(ack_nack_vld_i),
    .ack_seq_num_i(ack_seq_num_i),
    .link_retraining_i(link_retraining_i),
    .retrain_done_i(retrain_done_i),
    .dl_inactive_i(dl_inactive_i),
    .retrain_request_o(retrain_request_o),
    .replay_timeout_error_o(replay_timeout_error_o),
    .dllp_protocol_error_o(dllp_protocol_error_o)
  );

  task automatic alloc_tlp(input logic [11:0] seq, input logic [7:0] expected_index);
    if (!retry_available_o)
      $fatal(1, "retry_available_o low before allocation");
    if (retry_index_o != expected_index)
      $fatal(1, "unexpected retry slot index");
    @(posedge clk_i);
    tx_seq_num_i <= seq;
    tx_valid_i   <= 1;
    @(posedge clk_i);
    tx_valid_i   <= 0;
  endtask

  task automatic send_acknak(input logic is_ack, input logic [11:0] seq);
    @(posedge clk_i);
    ack_nack_i    <= is_ack;
    ack_seq_num_i <= seq;
    ack_nack_vld_i <= 1;
    @(posedge clk_i);
    ack_nack_vld_i <= 0;
  endtask

  task automatic drain_replays;
    int timeout;
    int completed;
    logic [2:0] idx;
    completed = 0;
    while (completed < 3) begin
      timeout = 0;
      while (|retry_valid_o == 0 && timeout < 40) begin
        @(posedge clk_i);
        timeout++;
      end
      if (|retry_valid_o == 0)
        break;
      idx = retry_valid_o;
      @(posedge clk_i);
      retry_ack_i <= idx;
      @(posedge clk_i);
      retry_ack_i <= 3'b0;
      @(posedge clk_i);
      retry_complete_i <= idx;
      @(posedge clk_i);
      retry_complete_i <= 3'b0;
      repeat (2) @(posedge clk_i);
      completed++;
    end
  endtask

  initial begin
    repeat (5) @(posedge clk_i);
    rst_i <= 0;
    repeat (2) @(posedge clk_i);

    if (!retry_available_o)
      $fatal(1, "no retry slot available after reset");

    alloc_tlp(12'h000, 8'h00);
    alloc_tlp(12'h001, 8'h01);
    @(posedge clk_i);
    tx_tlp_done_i <= 1;
    @(posedge clk_i);
    tx_tlp_done_i <= 0;

    send_acknak(1'b0, 12'hfff);
    repeat (2) @(posedge clk_i);
    if (dut.replay_num_r != 2'd1)
      $fatal(1, "first Nak did not increment REPLAY_NUM");
    drain_replays();
    if (dut.replay_num_r != 2'd1)
      $fatal(1, "REPLAY_NUM changed during replay");

    send_acknak(1'b0, 12'h000);
    repeat (2) @(posedge clk_i);
    if (dut.replay_num_r != 2'd2)
      $fatal(1, "new-sequence Nak incorrectly reset REPLAY_NUM");
    drain_replays();

    send_acknak(1'b1, 12'h001);
    repeat (2) @(posedge clk_i);
    if (dut.replay_num_r != 2'd0)
      $fatal(1, "Ack did not reset REPLAY_NUM");
    if (!retry_available_o)
      $fatal(1, "Ack did not release retry slots");

    alloc_tlp(12'h002, 8'h00);
    for (int i = 0; i < 4; i++) begin
      send_acknak(1'b0, 12'h001);
      repeat (2) @(posedge clk_i);
      if (i < 3) begin
        if (dut.replay_num_r != 2'(i + 1))
          $fatal(1, "REPLAY_NUM sequence incorrect");
        drain_replays();
      end
    end
    if (!retrain_request_o)
      $fatal(1, "REPLAY_NUM rollover did not request retrain");

    link_retraining_i <= 1;
    repeat (3) @(posedge clk_i);
    if (!retrain_request_o)
      $fatal(1, "retrain request dropped while link is retraining");
    retrain_done_i <= 1;
    @(posedge clk_i);
    retrain_done_i <= 0;
    repeat (2) @(posedge clk_i);
    if (retrain_request_o)
      $fatal(1, "retrain request not cleared by retrain done");
    link_retraining_i <= 0;

    $display("PASS: Gen1 retry manager allocation, Nak/Ack, rollover, and retrain handshake");
    $finish;
  end

endmodule
