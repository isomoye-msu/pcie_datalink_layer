# Retry integration log

Repository: `/home/djovel/research/recovery_pcie/pcie_datalink_layer`
Branch: `PCIe-5GTs`
Scope: incremental integration of `spec_updates/retry_management.sv` into the Gen1 datalink path.

## Status

- [x] Slice 1: repair the allocation strobe and retry gating at the TLP framing boundary.
- [x] Slice 2: replace `src/dllp/retry_management.sv` with the new single-timer design (Gen1 timeout wired; PHY/LTSSM handshakes remain stubs).
- [x] Slice 3: source original-TLP completion/busy before the arbiter and connect LTSSM Recovery/retrain/error handshakes; PHY symbol-level done remains an AXIS-level approximation.
- [ ] Slice 4: parameterize the Replay Timer by negotiated speed/width for Gen2 rollout.

`src/dllp/retry_management.sv` was not rewritten in slice 1. It was replaced in slice 2 after slice 1 was verified.

## Slice 1 changes (2026-11-19)

### `src/dllp/tlp2dllp.sv`

1. `ST_IDLE` now requires `retry_available_i` before consuming a TLP from the input skid buffer (`tlp2dllp.sv:251`). Previously `retry_available_i` was declared but unused, so TLPs could be framed even with no free retry slot. This block the new module needs so that `retry_available_o` can also stop new TLP starts during replay, Recovery, and retraining.
2. `dllp_valid_o` is now pulsed exactly once per TLP, when the final framed beat is accepted by the downstream output register in `ST_TLP_CRC_TLAST_ALIGN` (`tlp2dllp.sv:565`). Previously the signal was declared and defaulted to zero but never asserted, so `retry_management.tx_valid_i` was permanently low and the retry buffer was never populated.

Rationale for pulsing at final-beat acceptance rather than at TLP start:

- `seq_num_o` is `next_transmit_seq_r`, which still holds the current TLP's sequence number on that cycle; it increments only in `ST_TLP_LAST` (`tlp2dllp.sv:573-576`).
- `retry_index_o` changes only after the allocation is registered, so keeping the strobe at the end of the frame keeps the retry slot index stable for every beat written into `retry_transmit` / `axis_retry_fifo`.
- The strobe is qualified by the downstream handshake (`tlp_axis_tready`), so it cannot claim allocation for a beat that was not accepted.

No behavior of `retry_management.sv`, `retry_transmit.sv`, or `axis_retry_fifo.sv` was changed in slice 1.

## Slice 2 changes (2026-11-19)

### `src/dllp/retry_management.sv`

- Replaced the old per-slot `gen_retry_counters` FSM with the refactored module from `spec_updates/retry_management.sv`: one link-level `replay_timer_r`, one 2-bit `REPLAY_NUM`, cumulative ACK/NAK sequence tracking with modulo-4096 ordering, and full-buffer replay.
- Fixed the draft's REPLAY_NUM reset rule: only an ACK with forward progress (`ack_progress && ack_nack_i`) clears `REPLAY_NUM`. A NAK that acknowledges a newer sequence now increments `REPLAY_NUM` instead of resetting it, so four replay events correctly cause `11b -> 00b` rollover and `retrain_request_o`.
- Kept `REPLAY_TIMEOUT_CYCLES == 0` fatal inside the module; the configured value is supplied by its parent.

### `src/dllp/dllp_transmit.sv`

- Added `REPLAY_TIMEOUT_CYCLES` parameter with default `600` cycles. This is the midpoint of the PCIe Base 2.0 Table 3-4 100 MHz range (500-999 cycles) for Gen1 x1 / 256 B MPS.
- Added `link_status_i` and drives `dl_inactive_i = (link_status_i != DL_ACTIVE)` so the retry buffer and timer reset when the Data Link Layer leaves DL_ACTIVE.
- Connected the new module's ports: `tx_tlp_done_i` is currently derived from the arbiter output last-beat handshake (`m_axis_tvalid && m_axis_tready && m_axis_tlast`); `retry_complete_i` remains from `retry_transmit`.
- Slice 3 stubs, left intentionally conservative: `tx_tlp_busy_i = 0`, `link_retraining_i = 0`, `retrain_done_i = 0`, and `retrain_request_o` / `replay_timeout_error_o` / `dllp_protocol_error_o` are captured internally but not routed to LTSSM or error-status ports. These stubs were replaced in slice 3.

### `src/dllp/pcie_datalink_layer.sv`

- Added `REPLAY_TIMEOUT_CYCLES` parameter with default `600` and passed it to `dllp_transmit`.
- Connected internal `link_status` to the new `dllp_transmit.link_status_i`.

## Slice 3 changes (2026-11-19)

### `src/dllp/dllp_transmit.sv`

- Replaced the post-arbiter `tx_tlp_done_i` stub with `original_tlp_done`, derived from the pre-arbiter original TLP stream (`m_axis_tlp2dllp_tvalid && m_axis_tlp2dllp_tready && m_axis_tlp2dllp_tlast`). Replay traffic is excluded, so a retransmitted TLP no longer looks like completion of a new TLP.
- Replaced `tx_tlp_busy_i = 0` with a sticky `original_tlp_busy` that sets on the first accepted original-stream beat and clears on the final accepted beat. `RP_DRAIN` now waits for the original TLP to drain instead of starting replay mid-frame.
- Added inputs `link_retraining_i` and `retrain_done_i`; connected them to `retry_management` instead of constant zero.
- Added outputs `retry_err_o`, `retrain_request_o`, `replay_timeout_error_o`, and `dllp_protocol_error_o`; these now expose the retry manager status instead of capturing it internally.

### `src/dllp/pcie_datalink_layer.sv`

- Threaded `link_retraining_i`, `retrain_done_i`, `retry_err_o`, `retrain_request_o`, `replay_timeout_error_o`, and `dllp_protocol_error_o` through to `dllp_transmit`.

### `src/pcie_phy_core/pcie_phy_top.sv`

- Added top-level outputs `retry_err_o`, `retrain_request_o`, `replay_timeout_error_o`, and `dllp_protocol_error_o`.
- Decoded `ltssm_debug_state[4:0]` into `ltssm_retraining_rx`: Configuration (`5'h03`) and Recovery (`5'h04`) hold the retry timer and replay state machine. The level is crossed to `clk_i` through `async_fifo`.
- Detected entry to L0 (`20'h005`) in `pipe_rx_usr_clk_i` and converted it to a `retrain_done` pulse in `clk_i` using a toggle plus `async_fifo`.
- Converted `retrain_request_o` from `clk_i` into a one-cycle `directed_speed_change_i` pulse in `pipe_rx_usr_clk_i`, also using a toggle plus `async_fifo`.
- Limitation: no new PHY last-symbol/busy port was added in `phy_transmit.sv`; completion remains the original AXIS stream last-beat handshake, which is the closest available source without changing the PHY transmit datapath.

## Verification

- Lint: passed with pre-existing warnings only. Command: `verilator --lint-only -Wall -Wno-WIDTH -Wno-PINCONNECTEMPTY -Isrc/packages -Isrc/interfaces -Isrc/dllp -Isrc/verilog-axis/rtl src/packages/pcie_datalink_pkg.sv src/verilog-axis/rtl/axis_register.v src/crc/pcie_lcrc16.sv src/crc/pcie_lcrc32.sv src/dllp/tlp2dllp.sv`.
- Simulation: passed. Added `tb/dllp/tb_tlp2dllp_alloc.sv`, a self-checking Verilator bench that holds `retry_available_i` low, verifies no allocation starts, then sends two 1-DW Memory Write TLPs and checks exactly one strobe per TLP with sequences `12'h000` and `12'h001`.
- Simulation command: `verilator --binary --timing --top tb_tlp2dllp_alloc -Wno-fatal -Wno-WIDTH -Wno-PINCONNECTEMPTY -Isrc/packages -Isrc/verilog-axis/rtl src/packages/pcie_datalink_pkg.sv src/verilog-axis/rtl/axis_register.v src/crc/pcie_lcrc16.sv src/crc/pcie_lcrc32.sv src/dllp/tlp2dllp.sv tb/dllp/tb_tlp2dllp_alloc.sv && obj_dir/Vtb_tlp2dllp_alloc`.
- Observed output: `ALLOC count=0 seq=000 index=5a`, `ALLOC count=1 seq=001 index=5a`, `PASS: slice-1 allocation gating and strobe behavior`.
- Transmit-path lint: passed with pre-existing warnings only after slice 2. Command: `verilator --lint-only --top dllp_transmit -Wno-fatal -Wno-WIDTH -Wno-PINCONNECTEMPTY -Wno-UNUSEDSIGNAL -Wno-UNUSEDPARAM -Wno-TIMESCALEMOD -Wno-GENUNNAMED -Wno-MULTITOP -Wno-LATCH -Wno-MULTIDRIVEN -Isrc/packages -Isrc/verilog-axis/rtl -Isrc/dllp src/packages/pcie_datalink_pkg.sv src/crc/pcie_lcrc16.sv src/crc/pcie_lcrc32.sv src/bram/bram_dp.sv src/bram/bram_sp.sv src/verilog-axis/rtl/axis_register.v src/verilog-axis/rtl/axis_arb_mux.v src/dllp/axis_retry_fifo.sv src/dllp/retry_management.sv src/dllp/retry_transmit.sv src/dllp/tlp2dllp.sv src/dllp/dllp_transmit.sv`.
- Retry-manager simulation: passed. Added `tb/dllp/tb_retry_management_gen1.sv`, which checks slot allocation, duplicate-Nak replay, new-sequence Nak without REPLAY_NUM reset, ACK reset and slot release, and `11b -> 00b` rollover to `retrain_request_o`.
- Retry-manager simulation command: `verilator --binary --timing --top tb_retry_management_gen1 -Wno-fatal -Wno-WIDTH -Wno-UNUSEDSIGNAL -Isrc/packages src/packages/pcie_datalink_pkg.sv src/dllp/retry_management.sv tb/dllp/tb_retry_management_gen1.sv && obj_dir/Vtb_retry_management_gen1`.
- Observed output after slice 3: `PASS: Gen1 retry manager allocation, Nak/Ack, rollover, and retrain handshake`.
- Slice-1 allocation test was re-run after slice 2 and still passes.
- Slice-3 simulation: passed. Added `tb/dllp/tb_dllp_transmit_slice3.sv`, which checks the pre-arbiter original-stream busy/done behavior, verifies replay traffic does not assert original busy, and checks that `replay_timeout_error_o` reaches the `dllp_transmit` output.
- Slice-3 simulation command: `verilator --binary --timing --public-flat-rw --top tb_dllp_transmit_slice3 -Wno-fatal -Wno-WIDTH -Wno-PINCONNECTEMPTY -Wno-UNUSEDSIGNAL -Wno-UNUSEDPARAM -Wno-LATCH -Wno-TIMESCALEMOD -Wno-INITIALDLY -Isrc/packages -Isrc/verilog-axis/rtl src/packages/pcie_datalink_pkg.sv src/packages/pcie_phy_pkg.sv src/packages/pcie_tlp_pkg.sv src/crc/pcie_lcrc16.sv src/crc/pcie_lcrc32.sv src/verilog-axis/rtl/arbiter.v src/verilog-axis/rtl/axis_arb_mux.v src/verilog-axis/rtl/axis_register.v src/dllp/axis_retry_fifo.sv src/dllp/retry_management.sv src/dllp/retry_transmit.sv src/dllp/tlp2dllp.sv src/dllp/dllp_transmit.sv tb/dllp/tb_dllp_transmit_slice3.sv && obj_dir/Vtb_dllp_transmit_slice3`.
- Observed output: `PASS: slice-3 original TLP completion and retry error wiring`.
- Retry-manager simulation was extended in slice 3 to hold `link_retraining_i`, pulse `retrain_done_i`, and check that `retrain_request_o` remains asserted during retraining and clears on return.
- Transmit-path lint was re-run after slice 3 and passed with pre-existing `tlp2dllp.sv` latch warnings only.
- Targeted `pcie_phy_top` parse lint reported only unresolved submodule errors from the reduced file list; no syntax or connection errors in the new slice-3 logic.
- Full `pcie_datalink_layer` lint is still blocked by pre-existing unrelated missing module `pcie_dllp_crc8` in `src/crc/pcie_datalink_crc.sv`.
- Bench observations at the transmitting Port: pending; required before any Gen2 compliance claim.

## Gen1 reference points used for review

- PCI Express Base 2.0 §3.5.2.1/3.5.2.2: single `REPLAY_TIMER` and 2-bit `REPLAY_NUM`; timer started at the last symbol of a TLP transmission/retransmission and restarted only on Ack/Nak that acknowledges a TLP; `REPLAY_NUM` increments on Nak or timeout, resets on Ack, and requests retrain on `11b` to `00b` rollover; invalid Ack/Nak sequence is discarded with a DLLP error reported.
- Table 3-4 (2.5 GT/s, unadjusted): x1 / 256 B MPS is 1248 symbol times = 4.992 us, tolerance -0%/+100%. At 100 MHz this is 500-999 cycles; at 250 MHz it is 1248-2496 cycles. The module default of 0 remains fatal; slice 2 supplies `600` for the 10.0 ns clock in `src/dllp/dllp.xdc`.

## Open items after slice 3

- [x] Confirmed in `tb_tlp2dllp_alloc.sv` that the strobe at `tlp2dllp.sv:565` carries the current sequence number and increments once per TLP.
- [x] Confirmed in `tb_retry_management_gen1.sv` that `REPLAY_NUM` resets on ACK, not on new-sequence NAK.
- [x] Source original-TLP completion/busy before the arbiter instead of the post-arbiter handshake / constant-zero stubs.
- [x] Route `link_retraining_i` and `retrain_done_i` from LTSSM Recovery/Configuration, and connect `retrain_request_o` to the LTSSM retrain request.
- [x] Route `replay_timeout_error_o` and `dllp_protocol_error_o` to top-level output ports; integration into error-status registers remains outside this slice.
- Export a true PHY last-symbol/busy signal from `phy_transmit.sv` if symbol-accurate replay timing is required.
- Confirm `retry_index_i` stays constant for all beats of a multi-beat TLP written into `retry_transmit` in a full transmit-path bench.
- Decide how `dllp_valid_o` should behave if the retry manager deasserts `retry_available_o` mid-frame; the current framing path only checks at `ST_IDLE`.
- Add a focused regression for sequence continuity across `4095 -> 0` and backpressure when no retry slot is free.
