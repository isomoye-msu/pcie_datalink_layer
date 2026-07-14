`timescale 1ns/1ps

module tb_dllp_handler;

  import pcie_datalink_pkg::*;

  localparam int DATA_WIDTH = 32;
  localparam int STRB_WIDTH = DATA_WIDTH / 8;
  localparam int KEEP_WIDTH = STRB_WIDTH;
  localparam int USER_WIDTH = 4;
  localparam int UserIsDllp = 0;
  localparam int ClkPeriodNs = 8; // 125 MHz PIPE-style clock for PCIe Gen1 testing.
  localparam int Gen1PayloadBytesPerSec = 250_000_000; // 2.5 GT/s after 8b/10b.
  localparam int SustainedBurstDllps = 128;

  logic                  clk_i;
  logic                  rst_i;
  logic                  phy_link_up_i;

  logic [DATA_WIDTH-1:0] s_axis_tdata;
  logic [KEEP_WIDTH-1:0] s_axis_tkeep;
  logic                  s_axis_tvalid;
  logic                  s_axis_tlast;
  logic [USER_WIDTH-1:0] s_axis_tuser;
  logic                  s_axis_tready;

  logic [11:0]           seq_num_o;
  logic                  seq_num_vld_o;
  logic                  seq_num_acknack_o;

  logic                  fc1_values_stored_o;
  logic                  fc2_values_stored_o;

  logic [7:0]            tx_fc_ph_o;
  logic [11:0]           tx_fc_pd_o;
  logic [7:0]            tx_fc_nph_o;
  logic [11:0]           tx_fc_npd_o;
  logic [7:0]            tx_fc_cplh_o;
  logic [11:0]           tx_fc_cpld_o;
  logic                  update_fc_o;
  logic                  first_feature_exchange_dllp_received_o;

  int unsigned tests;
  int unsigned errors;

  logic [31:0] crc_calc_data;
  logic [15:0] crc_calc_out;

  pcie_datalink_crc tb_crc_calc (
    .crcIn (16'hFFFF),
    .data  (crc_calc_data),
    .crcOut(crc_calc_out)
  );

  dllp_handler #(
    .DATA_WIDTH(DATA_WIDTH),
    .STRB_WIDTH(STRB_WIDTH),
    .KEEP_WIDTH(KEEP_WIDTH),
    .USER_WIDTH(USER_WIDTH)
  ) dut (
    .clk_i(clk_i),
    .rst_i(rst_i),
    .phy_link_up_i(phy_link_up_i),

    .s_axis_tdata(s_axis_tdata),
    .s_axis_tkeep(s_axis_tkeep),
    .s_axis_tvalid(s_axis_tvalid),
    .s_axis_tlast(s_axis_tlast),
    .s_axis_tuser(s_axis_tuser),
    .s_axis_tready(s_axis_tready),

    .seq_num_o(seq_num_o),
    .seq_num_vld_o(seq_num_vld_o),
    .seq_num_acknack_o(seq_num_acknack_o),

    .fc1_values_stored_o(fc1_values_stored_o),
    .fc2_values_stored_o(fc2_values_stored_o),

    .tx_fc_ph_o(tx_fc_ph_o),
    .tx_fc_pd_o(tx_fc_pd_o),
    .tx_fc_nph_o(tx_fc_nph_o),
    .tx_fc_npd_o(tx_fc_npd_o),
    .tx_fc_cplh_o(tx_fc_cplh_o),
    .tx_fc_cpld_o(tx_fc_cpld_o),
    .update_fc_o(update_fc_o),
    .first_feature_exchange_dllp_received_o(first_feature_exchange_dllp_received_o)
  );

  initial clk_i = 1'b0;
  always #(ClkPeriodNs / 2) clk_i = ~clk_i;

  `define CHECK_EQ(NAME, GOT, EXP) \
    begin \
      tests++; \
      if ((GOT) !== (EXP)) begin \
        errors++; \
        $error("[%0t] FAIL %-45s got=0x%0h expected=0x%0h", \
               $time, NAME, GOT, EXP); \
      end else begin \
        $display("[%0t] PASS %-45s value=0x%0h", \
                 $time, NAME, GOT); \
      end \
    end

  task automatic init_signals();
    begin
      rst_i         = 1'b1;
      phy_link_up_i = 1'b0;

      s_axis_tdata  = '0;
      s_axis_tkeep  = '1;
      s_axis_tvalid = 1'b0;
      s_axis_tlast  = 1'b0;
      s_axis_tuser  = '0;

      crc_calc_data = '0;

      repeat (5) @(posedge clk_i);
      rst_i = 1'b0;
      repeat (3) @(posedge clk_i);
    end
  endtask

  function automatic logic [31:0] build_ack_nak_payload(
    input dllp_type_e typ,
    input logic [11:0] seq
  );
    logic [31:0] payload;
    begin
      payload = '0;

      payload[7:0]   = typ;
      payload[15:8]  = 8'h00;
      payload[19:16] = seq[11:8];
      payload[23:20] = 4'h0;
      payload[31:24] = seq[7:0];

      return payload;
    end
  endfunction

  function automatic logic [31:0] build_fc_payload(
    input dllp_type_e typ,
    input logic [7:0] hdrfc,
    input logic [11:0] datafc
  );
    logic [31:0] payload;
    begin
      payload = '0;

      payload[7:0]   = typ;
      payload[15:8]  = {2'b00, hdrfc[7:2]};
      payload[23:16] = {hdrfc[1:0], 2'b00, datafc[11:8]};
      payload[31:24] = datafc[7:0];

      return payload;
    end
  endfunction

  function automatic logic [31:0] build_type_only_payload(
    input dllp_type_e typ
  );
    logic [31:0] payload;
    begin
      payload = '0;
      payload[7:0] = typ;
      return payload;
    end
  endfunction

  task automatic calc_crc_word(
    input  logic [31:0] payload,
    output logic [15:0] crc_word
  );
    begin
      crc_calc_data = payload;
      #1;

      // DUT does:
      // crc_in_c = crc_out;
      // crc_reversed = ~crc_in_r;
      // compare crc_reversed against second beat [15:0].
      crc_word = ~crc_calc_out;
    end
  endtask

  task automatic send_axis_word(
    input logic [31:0] data,
    input logic [USER_WIDTH-1:0] user,
    input bit last
  );
    begin
      @(posedge clk_i);

      s_axis_tdata  <= data;
      s_axis_tkeep  <= 4'hF;
      s_axis_tuser  <= user;
      s_axis_tlast  <= last;
      s_axis_tvalid <= 1'b1;

      while (!s_axis_tready) begin
        @(posedge clk_i);
      end

      @(posedge clk_i);

      s_axis_tvalid <= 1'b0;
      s_axis_tlast  <= 1'b0;
      s_axis_tuser  <= '0;
      s_axis_tdata  <= '0;
    end
  endtask

  task automatic send_dllp(
    input logic [31:0] payload,
    input bit good_crc,
    input bit user_marks_dllp
  );
    logic [15:0] crc_word;
    logic [USER_WIDTH-1:0] user;
    begin
      calc_crc_word(payload, crc_word);

      if (!good_crc) begin
        crc_word ^= 16'h0001;
      end

      user = '0;
      user[UserIsDllp] = user_marks_dllp;

      send_axis_word(payload, user, 1'b0);
      send_axis_word({16'h0000, crc_word}, user, 1'b1);
    end
  endtask

  task automatic send_axis_word_no_idle(
    input logic [31:0] data,
    input logic [USER_WIDTH-1:0] user,
    input bit last,
    inout int unsigned accepted_words,
    inout int unsigned stall_cycles,
    inout time first_accept_time,
    inout time last_accept_time
  );
    begin
      s_axis_tdata  <= data;
      s_axis_tkeep  <= 4'hF;
      s_axis_tuser  <= user;
      s_axis_tlast  <= last;
      s_axis_tvalid <= 1'b1;

      do begin
        @(posedge clk_i);

        if (!s_axis_tready) begin
          stall_cycles++;
        end
      end while (!s_axis_tready);

      if (accepted_words == 0) begin
        first_accept_time = $time;
      end

      accepted_words++;
      last_accept_time = $time;
    end
  endtask

  task automatic send_saturated_ack_nak_burst(
    input int unsigned dllp_count,
    output int unsigned accepted_words,
    output int unsigned stall_cycles,
    output time first_accept_time,
    output time last_accept_time
  );
    logic [15:0] crc_word;
    logic [31:0] payload;
    logic [USER_WIDTH-1:0] user;
    dllp_type_e typ;
    begin
      accepted_words    = 0;
      stall_cycles      = 0;
      first_accept_time = 0;
      last_accept_time  = 0;

      user = '0;
      user[UserIsDllp] = 1'b1;

      for (int unsigned i = 0; i < dllp_count; i++) begin
        typ = i[0] ? Ack : Nak;
        payload = build_ack_nak_payload(typ, i[11:0] ^ 12'h3C0);

        calc_crc_word(payload, crc_word);

        send_axis_word_no_idle(payload, user, 1'b0,
                               accepted_words, stall_cycles,
                               first_accept_time, last_accept_time);
        send_axis_word_no_idle({16'h0000, crc_word}, user, 1'b1,
                               accepted_words, stall_cycles,
                               first_accept_time, last_accept_time);
      end

      @(posedge clk_i);
      s_axis_tvalid <= 1'b0;
      s_axis_tlast  <= 1'b0;
      s_axis_tuser  <= '0;
      s_axis_tdata  <= '0;
    end
  endtask

  task automatic expect_saturated_ack_nak_burst(
    input int unsigned dllp_count
  );
    int unsigned received;
    int unsigned accepted_words;
    int unsigned stall_cycles;
    int unsigned timeout_cycles;
    time first_accept_time;
    time last_accept_time;
    bit driver_done;
    bit monitor_done;
    bit timeout;
    begin
      received       = 0;
      timeout_cycles = (dllp_count * 8) + 64;
      driver_done    = 1'b0;
      monitor_done   = 1'b0;
      timeout        = 1'b0;

      fork
        begin : burst_driver
          send_saturated_ack_nak_burst(dllp_count, accepted_words, stall_cycles,
                                       first_accept_time, last_accept_time);
          driver_done = 1'b1;
        end

        begin : burst_monitor
          int unsigned cycles;

          cycles = 0;
          while ((received < dllp_count) && (cycles < timeout_cycles)) begin
            @(negedge clk_i);
            cycles++;

            if (seq_num_vld_o) begin
              logic [11:0] exp_seq;
              bit exp_ack;

              exp_seq = received[11:0] ^ 12'h3C0;
              exp_ack = received[0] ? 1'b1 : 1'b0;

              `CHECK_EQ("saturated Gen1 burst seq_num_o", seq_num_o, exp_seq)
              `CHECK_EQ("saturated Gen1 burst acknack", seq_num_acknack_o, exp_ack)

              received++;
            end
          end

          monitor_done = (received == dllp_count);
          timeout = !monitor_done;
        end
      join

      `CHECK_EQ("saturated Gen1 burst timeout", timeout, 1'b0)
      `CHECK_EQ("saturated Gen1 burst DLLP count", received, dllp_count)
      `CHECK_EQ("saturated Gen1 burst accepted words", accepted_words, dllp_count * 2)

      if ((last_accept_time > first_accept_time) && (accepted_words != 0)) begin
        longint unsigned accepted_bytes_per_sec;
        longint unsigned elapsed_ns;

        elapsed_ns = (last_accept_time - first_accept_time);
        accepted_bytes_per_sec = ((accepted_words * (DATA_WIDTH / 8)) * 1_000_000_000) /
                                 elapsed_ns;

        tests++;
        if (accepted_bytes_per_sec < Gen1PayloadBytesPerSec) begin
          errors++;
          $error("[%0t] FAIL saturated Gen1 AXIS payload rate %0d B/s < %0d B/s",
                 $time, accepted_bytes_per_sec, Gen1PayloadBytesPerSec);
        end else begin
          $display("[%0t] PASS saturated Gen1 AXIS payload rate %0d B/s >= %0d B/s",
                   $time, accepted_bytes_per_sec, Gen1PayloadBytesPerSec);
        end
      end else begin
        errors++;
        $error("[%0t] FAIL saturated Gen1 payload rate could not be measured", $time);
      end

      $display("[%0t] INFO saturated Gen1 burst accepted_words=%0d stall_cycles=%0d",
               $time, accepted_words, stall_cycles);

      expect_no_seq_pulse(8, "after saturated Gen1 burst");
    end
  endtask

  task automatic expect_seq_pulse(
    input logic [11:0] exp_seq,
    input bit exp_ack
  );
    bit seen;
    begin
      seen = 1'b0;

      repeat (16) begin
        @(negedge clk_i);

        if (seq_num_vld_o) begin
          seen = 1'b1;
          `CHECK_EQ("seq_num_o", seq_num_o, exp_seq)
          `CHECK_EQ("seq_num_acknack_o", seq_num_acknack_o, exp_ack)
        end
      end

      tests++;
      if (!seen) begin
        errors++;
        $error("[%0t] FAIL expected seq_num_vld_o pulse was not observed", $time);
      end else begin
        $display("[%0t] PASS seq_num_vld_o pulse observed", $time);
      end
    end
  endtask

  task automatic expect_no_seq_pulse(
    input int cycles,
    input string reason
  );
    begin
      repeat (cycles) begin
        @(negedge clk_i);

        tests++;
        if (seq_num_vld_o !== 1'b0) begin
          errors++;
          $error("[%0t] FAIL unexpected seq pulse during %s: seq=0x%0h ack=%0b",
                 $time, reason, seq_num_o, seq_num_acknack_o);
        end
      end

      $display("[%0t] PASS no seq pulse during %s", $time, reason);
    end
  endtask

  task automatic expect_update_fc_pulse();
    bit seen;
    begin
      seen = 1'b0;

      repeat (16) begin
        @(negedge clk_i);

        if (update_fc_o) begin
          seen = 1'b1;
        end
      end

      tests++;
      if (!seen) begin
        errors++;
        $error("[%0t] FAIL expected update_fc_o pulse was not observed", $time);
      end else begin
        $display("[%0t] PASS update_fc_o pulse observed", $time);
      end
    end
  endtask

  task automatic expect_no_update_fc_pulse(
    input int cycles,
    input string reason
  );
    begin
      repeat (cycles) begin
        @(negedge clk_i);

        tests++;
        if (update_fc_o !== 1'b0) begin
          errors++;
          $error("[%0t] FAIL unexpected update_fc_o pulse during %s", $time, reason);
        end
      end

      $display("[%0t] PASS no update_fc_o pulse during %s", $time, reason);
    end
  endtask

  task automatic check_fc_values(
    input string name,
    input logic [7:0] exp_ph,
    input logic [11:0] exp_pd,
    input logic [7:0] exp_nph,
    input logic [11:0] exp_npd,
    input logic [7:0] exp_cplh,
    input logic [11:0] exp_cpld
  );
    begin
      `CHECK_EQ({name, " tx_fc_ph_o"},   tx_fc_ph_o,   exp_ph)
      `CHECK_EQ({name, " tx_fc_pd_o"},   tx_fc_pd_o,   exp_pd)
      `CHECK_EQ({name, " tx_fc_nph_o"},  tx_fc_nph_o,  exp_nph)
      `CHECK_EQ({name, " tx_fc_npd_o"},  tx_fc_npd_o,  exp_npd)
      `CHECK_EQ({name, " tx_fc_cplh_o"}, tx_fc_cplh_o, exp_cplh)
      `CHECK_EQ({name, " tx_fc_cpld_o"}, tx_fc_cpld_o, exp_cpld)
    end
  endtask

  task automatic wait_cycles(input int n);
    repeat (n) @(posedge clk_i);
  endtask

  initial begin
    tests  = 0;
    errors = 0;

    init_signals();

    // ------------------------------------------------------------
    // Reset behavior.
    // ------------------------------------------------------------
    `CHECK_EQ("reset seq_num_vld_o", seq_num_vld_o, 1'b0)
    `CHECK_EQ("reset seq_num_acknack_o", seq_num_acknack_o, 1'b0)
    `CHECK_EQ("reset fc1_values_stored_o", fc1_values_stored_o, 1'b0)
    `CHECK_EQ("reset fc2_values_stored_o", fc2_values_stored_o, 1'b0)
    `CHECK_EQ("reset first_feature_exchange", first_feature_exchange_dllp_received_o, 1'b0)

    check_fc_values("reset", 8'h00, 12'h000, 8'h00, 12'h000, 8'h00, 12'h000);

    // ------------------------------------------------------------
    // Link-down behavior.
    // A valid packet while phy_link_up_i is low should not process.
    // ------------------------------------------------------------
    phy_link_up_i = 1'b0;

    send_dllp(build_ack_nak_payload(Ack, 12'h123), 1'b1, 1'b1);
    expect_no_seq_pulse(10, "phy_link_up_i low");

    phy_link_up_i = 1'b1;
    wait_cycles(4);

    // ------------------------------------------------------------
    // ACK sequence extraction.
    // Boundary cases: 0, middle value, max sequence.
    // ------------------------------------------------------------
    send_dllp(build_ack_nak_payload(Ack, 12'h000), 1'b1, 1'b1);
    expect_seq_pulse(12'h000, 1'b1);

    send_dllp(build_ack_nak_payload(Ack, 12'h5A5), 1'b1, 1'b1);
    expect_seq_pulse(12'h5A5, 1'b1);

    send_dllp(build_ack_nak_payload(Ack, 12'hFFF), 1'b1, 1'b1);
    expect_seq_pulse(12'hFFF, 1'b1);

    // ------------------------------------------------------------
    // NAK sequence extraction.
    // ------------------------------------------------------------
    send_dllp(build_ack_nak_payload(Nak, 12'h321), 1'b1, 1'b1);
    expect_seq_pulse(12'h321, 1'b0);

    send_dllp(build_ack_nak_payload(Nak, 12'hFFE), 1'b1, 1'b1);
    expect_seq_pulse(12'hFFE, 1'b0);

    // ------------------------------------------------------------
    // CRC rejection.
    // Same valid ACK payload, intentionally corrupted CRC.
    // ------------------------------------------------------------
    send_dllp(build_ack_nak_payload(Ack, 12'h777), 1'b0, 1'b1);
    expect_no_seq_pulse(12, "bad DLLP CRC");

    // ------------------------------------------------------------
    // Non-DLLP filtering.
    // Even with correct CRC, UserIsDllp low means ignore packet.
    // ------------------------------------------------------------
    send_dllp(build_ack_nak_payload(Ack, 12'h888), 1'b1, 1'b0);
    expect_no_seq_pulse(12, "s_axis_tuser[0] low");

    // ------------------------------------------------------------
    // Feature Exchange behavior.
    // Should latch high and remain high.
    // ------------------------------------------------------------
    `CHECK_EQ("feature latch initially low", first_feature_exchange_dllp_received_o, 1'b0)

    send_dllp(build_type_only_payload(Feature_Exchange), 1'b1, 1'b1);
    wait_cycles(6);

    `CHECK_EQ("feature latch after Feature_Exchange",
              first_feature_exchange_dllp_received_o, 1'b1)

    // Unsupported PM packet should not clear the feature latch or cause ACK/NAK.
    send_dllp(build_type_only_payload(PM_Enter_L1), 1'b1, 1'b1);
    expect_no_seq_pulse(8, "unsupported PM_Enter_L1");

    `CHECK_EQ("feature latch remains high",
              first_feature_exchange_dllp_received_o, 1'b1)

    // ------------------------------------------------------------
    // InitFC1 sequence.
    // All three classes must arrive before fc1_values_stored_o goes high.
    // ------------------------------------------------------------
    send_dllp(build_fc_payload(InitFC1_P, 8'h11, 12'h111), 1'b1, 1'b1);
    wait_cycles(6);

    `CHECK_EQ("fc1 incomplete after InitFC1_P", fc1_values_stored_o, 1'b0)
    check_fc_values("after InitFC1_P",
                    8'h11, 12'h111,
                    8'h00, 12'h000,
                    8'h00, 12'h000);

    send_dllp(build_fc_payload(InitFC1_NP, 8'h22, 12'h222), 1'b1, 1'b1);
    wait_cycles(6);

    `CHECK_EQ("fc1 incomplete after InitFC1_P + NP", fc1_values_stored_o, 1'b0)
    check_fc_values("after InitFC1_NP",
                    8'h11, 12'h111,
                    8'h22, 12'h222,
                    8'h00, 12'h000);

    send_dllp(build_fc_payload(InitFC1_Cpl, 8'h33, 12'h333), 1'b1, 1'b1);
    wait_cycles(6);

    `CHECK_EQ("fc1 complete after P + NP + Cpl", fc1_values_stored_o, 1'b1)
    check_fc_values("after InitFC1_Cpl",
                    8'h11, 12'h111,
                    8'h22, 12'h222,
                    8'h33, 12'h333);

    // ------------------------------------------------------------
    // InitFC2 sequence.
    // ------------------------------------------------------------
    send_dllp(build_fc_payload(InitFC2_P, 8'h44, 12'h444), 1'b1, 1'b1);
    wait_cycles(6);

    `CHECK_EQ("fc2 incomplete after InitFC2_P", fc2_values_stored_o, 1'b0)

    send_dllp(build_fc_payload(InitFC2_NP, 8'h55, 12'h555), 1'b1, 1'b1);
    wait_cycles(6);

    `CHECK_EQ("fc2 incomplete after InitFC2_P + NP", fc2_values_stored_o, 1'b0)

    send_dllp(build_fc_payload(InitFC2_Cpl, 8'h66, 12'h666), 1'b1, 1'b1);
    wait_cycles(6);

    `CHECK_EQ("fc2 complete after P + NP + Cpl", fc2_values_stored_o, 1'b1)
    check_fc_values("after InitFC2_Cpl",
                    8'h44, 12'h444,
                    8'h55, 12'h555,
                    8'h66, 12'h666);

    // ------------------------------------------------------------
    // UpdateFC behavior.
    // Must update selected class and pulse update_fc_o.
    // ------------------------------------------------------------
    send_dllp(build_fc_payload(UpdateFC_P, 8'hAA, 12'hAAA), 1'b1, 1'b1);
    expect_update_fc_pulse();

    check_fc_values("after UpdateFC_P",
                    8'hAA, 12'hAAA,
                    8'h55, 12'h555,
                    8'h66, 12'h666);

    send_dllp(build_fc_payload(UpdateFC_NP, 8'hBB, 12'hBBB), 1'b1, 1'b1);
    expect_update_fc_pulse();

    check_fc_values("after UpdateFC_NP",
                    8'hAA, 12'hAAA,
                    8'hBB, 12'hBBB,
                    8'h66, 12'h666);

    send_dllp(build_fc_payload(UpdateFC_Cpl, 8'hCC, 12'hCCC), 1'b1, 1'b1);
    expect_update_fc_pulse();

    check_fc_values("after UpdateFC_Cpl",
                    8'hAA, 12'hAAA,
                    8'hBB, 12'hBBB,
                    8'hCC, 12'hCCC);

    // Bad CRC UpdateFC should not pulse or modify values.
    send_dllp(build_fc_payload(UpdateFC_P, 8'h12, 12'h123), 1'b0, 1'b1);
    expect_no_update_fc_pulse(12, "bad CRC UpdateFC_P");

    check_fc_values("after bad CRC UpdateFC_P",
                    8'hAA, 12'hAAA,
                    8'hBB, 12'hBBB,
                    8'hCC, 12'hCCC);

    // ------------------------------------------------------------
    // Edge FC values.
    // Minimum and maximum credit values.
    // ------------------------------------------------------------
    send_dllp(build_fc_payload(UpdateFC_P, 8'h00, 12'h000), 1'b1, 1'b1);
    expect_update_fc_pulse();

    `CHECK_EQ("UpdateFC_P min hdr", tx_fc_ph_o, 8'h00)
    `CHECK_EQ("UpdateFC_P min data", tx_fc_pd_o, 12'h000)

    send_dllp(build_fc_payload(UpdateFC_P, 8'hFF, 12'hFFF), 1'b1, 1'b1);
    expect_update_fc_pulse();

    `CHECK_EQ("UpdateFC_P max hdr", tx_fc_ph_o, 8'hFF)
    `CHECK_EQ("UpdateFC_P max data", tx_fc_pd_o, 12'hFFF)

    // ------------------------------------------------------------
    // Data overload / sustained traffic.
    // Repeated ACK/NAK packets stress:
    // - skid buffer
    // - FSM return to ST_IDLE
    // - ready deassertion during processing
    // - packet-to-packet correctness
    // ------------------------------------------------------------
    for (int i = 0; i < 64; i++) begin
      logic [11:0] seq;
      dllp_type_e typ;
      bit exp_ack;

      seq = i[11:0] ^ 12'hA5A;

      if (i[0]) begin
        typ     = Ack;
        exp_ack = 1'b1;
      end else begin
        typ     = Nak;
        exp_ack = 1'b0;
      end

      send_dllp(build_ack_nak_payload(typ, seq), 1'b1, 1'b1);
      expect_seq_pulse(seq, exp_ack);
    end

    // ------------------------------------------------------------
    // PCIe Gen1 saturated-rate receive behavior.
    // dllp_handler has no explicit link-rate input; Gen1 is therefore
    // modeled at this boundary as a 125 MHz 32-bit PHY AXIS stream.
    // The source keeps tvalid high and immediately presents the next
    // DLLP beat whenever the DUT accepts the current beat.
    // ------------------------------------------------------------
    expect_saturated_ack_nak_burst(SustainedBurstDllps);

    // ------------------------------------------------------------
    // FC overload.
    // Repeatedly update all FC classes with changing values.
    // ------------------------------------------------------------
    for (int j = 0; j < 16; j++) begin
      logic [7:0] h0;
      logic [7:0] h1;
      logic [7:0] h2;

      logic [11:0] d0;
      logic [11:0] d1;
      logic [11:0] d2;

      h0 = 8'h10 + j[7:0];
      h1 = 8'h40 + j[7:0];
      h2 = 8'h80 + j[7:0];

      d0 = 12'h100 + j[11:0];
      d1 = 12'h500 + j[11:0];
      d2 = 12'h900 + j[11:0];

      send_dllp(build_fc_payload(UpdateFC_P, h0, d0), 1'b1, 1'b1);
      expect_update_fc_pulse();

      `CHECK_EQ("overload UpdateFC_P hdr", tx_fc_ph_o, h0)
      `CHECK_EQ("overload UpdateFC_P data", tx_fc_pd_o, d0)

      send_dllp(build_fc_payload(UpdateFC_NP, h1, d1), 1'b1, 1'b1);
      expect_update_fc_pulse();

      `CHECK_EQ("overload UpdateFC_NP hdr", tx_fc_nph_o, h1)
      `CHECK_EQ("overload UpdateFC_NP data", tx_fc_npd_o, d1)

      send_dllp(build_fc_payload(UpdateFC_Cpl, h2, d2), 1'b1, 1'b1);
      expect_update_fc_pulse();

      `CHECK_EQ("overload UpdateFC_Cpl hdr", tx_fc_cplh_o, h2)
      `CHECK_EQ("overload UpdateFC_Cpl data", tx_fc_cpld_o, d2)
    end

    // ------------------------------------------------------------
    // Reset after activity.
    // Ensures all stored flags and FC values clear.
    // ------------------------------------------------------------
    rst_i <= 1'b1;
    repeat (4) @(posedge clk_i);
    rst_i <= 1'b0;
    repeat (4) @(posedge clk_i);

    `CHECK_EQ("post-reset fc1 clear", fc1_values_stored_o, 1'b0)
    `CHECK_EQ("post-reset fc2 clear", fc2_values_stored_o, 1'b0)
    `CHECK_EQ("post-reset feature clear", first_feature_exchange_dllp_received_o, 1'b0)

    check_fc_values("post-reset",
                    8'h00, 12'h000,
                    8'h00, 12'h000,
                    8'h00, 12'h000);

    $display("============================================================");
    $display("dllp_handler test complete: tests=%0d errors=%0d", tests, errors);
    $display("============================================================");

    if (errors == 0) begin
      $display("RESULT: PASS");
      $finish;
    end else begin
      $display("RESULT: FAIL");
      $fatal(1);
    end
  end

endmodule
