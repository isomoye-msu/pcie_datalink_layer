# OpenPCIe: `retry_management.sv` refactor

This replacement changes the old `gen_retry_counters` design into a **single link-level Replay Timer, REPLAY_NUM and replay FSM** while preserving the retry-buffer indexed request/accept/complete interface. It also repairs the cumulative ACK/NAK logic, retry-slot allocation, modulo-4096 sequence ordering, Replay Number rollover, and Recovery/Configuration timer hold.

**Status: implementation draft, not integrated or formally/simulation verified.** It is not safe to claim PCIe Gen2 compliance until timing and PHY/TLP handshake observations are verified at the transmitting Port.

## Source and reference

- `retry_management.sv` (full replacement)
- PCI Express Base Specification Revision 2.0, **§3.5.2.1**, **§3.5.2.2**, **Table 3-4** (Gen1), **Table 3-5** (Gen2)
- PCI-SIG FAQ re: Replay Timer expiration: https://pcisig.com/section-3521-if-you-can-receive-tlps-and-flow-control-dllps-normally-do-not-receive-any-ack-or-nak

## Required parent-module connections

| Port | Meaning and required source |
|---|---|
| `tx_valid_i`, `tx_seq_num_i` | Exactly one *accepted* TLP/slot allocation event and its assigned sequence number. Gate on `retry_available_o`. Not AXI `tvalid` for each beat. |
| `tx_tlp_done_i` | One-cycle pulse when the **final PHY symbol of an original TLP** has been transmitted. Do not confuse with last AXIS beat enqueued. |
| `tx_tlp_busy_i` | High until a previously started **original** TLP is fully transmitted, used to drain before replay. In particular, this must correctly cover a TLP whose allocation was accepted on the replay-trigger edge. |
| `retry_valid_o[i]` | Request for slot `i` to be retransmitted; stays asserted while awaiting `retry_ack_i[i]`. |
| `retry_ack_i[i]` | Acceptance of a replay request for slot `i`. |
| `retry_complete_i[i]` | Pulse only when the last **PHY/Port symbol** of that replayed TLP completes, not when the FIFO read finishes. |
| `ack_nack_i` | `1=ACK`, `0=NAK`; confirm against existing DLLP decoder. |
| `ack_nack_vld_i`, `ack_seq_num_i` | CRC-validated decoded Ack/Nak DLLP strobe and its 12-bit sequence. |
| `link_retraining_i` | Asserted for **Recovery OR Configuration**; synchronous to `clk_i`. |
| `retrain_request_o` | Level request to LTSSM to retrain after REPLAY_NUM rolls 3→0. |
| `retrain_done_i` | Single-cycle completion pulse after successful retrain; hold retry buffer during retrain. |
| `dl_inactive_i` | Assert when Data Link Layer enters DL_Inactive; reset Data Link Layer state and retry buffer. |
| `retry_err_o` | Sticky OR of Replay Timer Timeout, invalid ACK/NAK (or sequence mismatch), and REPLAY_NUM rollover; cleared by reset/DL_Inactive. |
| `replay_timeout_error_o` | Sticky timeout status for error reporting. |
| `dllp_protocol_error_o` | Sticky invalid ACK/NAK or out-of-order locally assigned TLP sequence. |

## Mandatory parameter configuration

`REPLAY_TIMEOUT_CYCLES` defaults to **0** and triggers a simulation fatal error until configured. Do not use the old `16'hAA0` threshold blindly.

For illustration only, **Gen2 x1**, 256-byte Maximum Payload Size, **125 MHz** controller clock, no L0s adjustment: Table 3-5 nominal limit is **1,401 symbol times**, or **2.802 µs**. A preliminary target of **400 cycles (3.2 µs)** is within the unadjusted +0%/+100% spec timer interval *at that clock*, but its external-Port behavior still depends on scheduling, pipeline latency, in-progress packets, and L0s. This example **does not establish compliance** for other speeds, widths, clock domains or latencies.

```systemverilog
retry_management #(
    .RETRY_TLP_SIZE(3),
    .REPLAY_TIMEOUT_CYCLES(400) // EXAMPLE ONLY: Gen2 x1 / 125 MHz / MPS 256
) retry_management_inst ( /* connect every new signal above */ );
```

For link speed changes (Gen1 ↔ Gen2), this module currently has a *static* timeout parameter: it **must be configured appropriately for the operating mode**, or extended with a live timeout input from the negotiated link-speed/width controller. In particular, using a Gen2 threshold while operating in Gen1 is not automatically compliant.

## Integration constraints

- `retry_available_o` now deasserts during replay, Recovery/Configuration, and retraining, even if a free buffer slot exists; the transmit path must obey it before starting new TLPs.
- This file controls **retry bookkeeping and replay requests**, not the actual FIFO memory. Confirm the underlying FIFO contents are retained for the selected TLP until `retry_complete_i`, including ACK arrival while a replay request or replayed TLP is in flight.
- If the link uses separate clock domains, synchronize event pulses with proper CDC handshakes or pulse stretchers; this module does not include CDC.
- Sequence comparisons assume all outstanding TLP sequence numbers lie within the PCIe permitted modulo-4096 window (<2048).
- This design handles simultaneous ACK arrival and replay selection by excluding same-cycle cumulatively retired slots. It retains any already-requested or in-progress replay entry until complete.
- The `REPLAY_NUM` rollover path is **retrain and continue**, not a permanent error halt.
- Existing unused parameters are retained to reduce integration churn; they do not size the Replay Timer.

## Next integration files to review

1. `dllp/retry_transmit.sv`: confirm replay request, acceptance and completion semantics.
2. `dllp/pcie_datalink_layer.sv`: connect TX completion, retransmission blocking and DL_Inactive; update instantiated port list.
3. LTSSM/PHY: expose Recovery/Configuration, link retrain request, retrain completion and Port-level last-symbol indications.
4. Clock/link configuration: provide correct timeout(s) for Gen1 and Gen2 operating modes.

Compile/simulation has **not been run** in this environment because no SystemVerilog compiler is installed. The source requires project `pcie_datalink_pkg` and module integration to build.
