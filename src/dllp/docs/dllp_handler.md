# `dllp_handler`

- **Source:** `src/dllp/dllp_handler.sv`
- **Package:** `pcie_datalink_pkg`
- **Author:** Idris Somoye

## Purpose

`dllp_handler` validates and decodes DLLPs received from the physical-layer AXI-Stream path. It reports received ACK/NAK sequence numbers, stores the remote transmitter's flow-control credit limits, tracks completion of InitFC1 and InitFC2 reception, and latches reception of a Feature Exchange DLLP.

The module does not generate an AXI-Stream reply. In the current data-link integration, `axis_user_demux` routes DLLP frames to this module, ACK/NAK outputs drive `dllp_transmit` retry management, and the flow-control outputs drive transmit credit checking and data-link initialization.

## Parameters

| Parameter | Type | Default | Description |
| --- | --- | ---: | --- |
| `DATA_WIDTH` | `int` | `32` | AXI-Stream data width in bits. The packet extraction and CRC datapath are currently organized around a 32-bit DLLP payload. |
| `STRB_WIDTH` | `int` | `DATA_WIDTH / 8` | Strobe width used to derive the default keep width. |
| `KEEP_WIDTH` | `int` | `STRB_WIDTH` | AXI-Stream `tkeep` width. |
| `USER_WIDTH` | `int` | `4` | AXI-Stream `tuser` width. Bit 0 identifies a DLLP. |

## Ports

| Port | Direction | Width/type | Description |
| --- | --- | --- | --- |
| `clk_i` | input | `logic` | Clock. |
| `rst_i` | input | `logic` | Active-high synchronous reset for the handler state and stored results. |
| `phy_link_up_i` | input | `logic` | Enables the handler to begin consuming a DLLP while in `ST_IDLE`. |
| `s_axis_tdata` | input | `DATA_WIDTH` | DLLP AXI-Stream data. |
| `s_axis_tkeep` | input | `KEEP_WIDTH` | Byte-valid mask. |
| `s_axis_tvalid` | input | `logic` | Input beat is valid. |
| `s_axis_tlast` | input | `logic` | Marks the CRC beat and end of the DLLP frame. |
| `s_axis_tuser` | input | `USER_WIDTH` | Packet classification; `s_axis_tuser[0]` must be high on accepted DLLP beats. |
| `s_axis_tready` | output | `logic` | Input ready from the internal AXI skid buffer. |
| `seq_num_o` | output | `12` | Sequence number decoded from a valid ACK or NAK. |
| `seq_num_vld_o` | output | `logic` | One-cycle indication that `seq_num_o` and `seq_num_acknack_o` are valid. |
| `seq_num_acknack_o` | output | `logic` | ACK/NAK discriminator: `1` for ACK and `0` for NAK. |
| `fc1_values_stored_o` | output | `logic` | High after valid InitFC1 P, NP, and Cpl DLLPs have all been received. Remains high until reset. |
| `fc2_values_stored_o` | output | `logic` | High after valid InitFC2 P, NP, and Cpl DLLPs have all been received. Remains high until reset. |
| `tx_fc_ph_o` | output | `8` | Most recently stored posted-header credit value. |
| `tx_fc_pd_o` | output | `12` | Most recently stored posted-data credit value. |
| `tx_fc_nph_o` | output | `8` | Most recently stored non-posted-header credit value. |
| `tx_fc_npd_o` | output | `12` | Most recently stored non-posted-data credit value. |
| `tx_fc_cplh_o` | output | `8` | Most recently stored completion-header credit value. |
| `tx_fc_cpld_o` | output | `12` | Most recently stored completion-data credit value. |
| `update_fc_o` | output | `logic` | One-cycle pulse after a valid UpdateFC P, NP, or Cpl DLLP updates its selected credit pair. |
| `first_feature_exchange_dllp_received_o` | output | `logic` | Latches high after a valid Feature Exchange DLLP and remains high until reset. |

## Input framing

With the default 32-bit interface, a DLLP is accepted as two AXI-Stream beats:

| Beat | `tdata` | `tkeep` | `tlast` | `tuser[0]` |
| --- | --- | --- | --- | --- |
| Payload | Four-byte DLLP payload | `4'b1111` | `0` | `1` |
| CRC | Received 16-bit CRC in `tdata[15:0]` | `4'b0011` | `1` | `1` |

The first beat is rejected as a DLLP payload if it is partial or already has `tlast` asserted. The second beat must contain exactly two valid low bytes and must terminate the frame. The handler uses an `axis_register` skid buffer, so external `s_axis_tready` reflects buffer capacity; the state machine does not begin consuming a new payload until `phy_link_up_i` is high.

## Validation

The payload is processed only when all applicable checks pass:

1. Both beats are classified as DLLP traffic through `tuser[0]`.
2. The two-beat `tkeep`/`tlast` framing is correct.
3. The received CRC equals the complemented output of `pcie_datalink_crc` for the 32-bit payload with an initial value of `16'hFFFF`.
4. ACK/NAK reserved fields are zero before a sequence indication is emitted.
5. InitFC and UpdateFC reserved fields are zero before credit values or stored flags are changed.

A bad CRC, malformed frame, invalid reserved field, unknown type, or unimplemented type produces no ACK/NAK indication and does not update flow-control state. Classified malformed or bad-CRC frames return the state machine to idle, and there is no error output. If a beat presented while checking the CRC is not marked as a DLLP, that beat is consumed but the state machine remains in `ST_CHECK_CRC` until a DLLP-classified beat is received.

## Decoded DLLP behavior

| DLLP type | Result |
| --- | --- |
| `Ack` | Pulses `seq_num_vld_o`, reports the 12-bit sequence number, and sets `seq_num_acknack_o`. |
| `Nak` | Pulses `seq_num_vld_o`, reports the 12-bit sequence number, and clears `seq_num_acknack_o`. |
| `Feature_Exchange` | Sets `first_feature_exchange_dllp_received_o`. In `pcie_flow_ctrl_init`, this can allow flow-control initialization to proceed before all peer InitFC1 values have arrived. |
| `InitFC1_P`, `InitFC1_NP`, `InitFC1_Cpl` | Stores the corresponding P, NP, or completion credit pair and sets that class's InitFC1 received flag. |
| `InitFC2_P`, `InitFC2_NP`, `InitFC2_Cpl` | Stores the corresponding credit pair and sets that class's InitFC2 received flag. |
| `UpdateFC_P`, `UpdateFC_NP`, `UpdateFC_Cpl` | Replaces the corresponding stored credit pair and causes `update_fc_o` to pulse. Forward/wrap-aware credit-limit filtering is performed later by `tlp2dllp`, not by this handler. |
| `PM_Enter_L1`, `PM_Enter_L23`, `PM_Actv_St_Req_L1`, `PM_Request_Ack`, `Vendor_Specific` | Recognized but currently ignored. |
| Other values | Ignored. |

The P, NP, and Cpl credit registers are shared by InitFC1, InitFC2, and UpdateFC packets. Therefore, each accepted packet immediately updates its selected pair; the `fc1_values_stored_o` and `fc2_values_stored_o` outputs separately record whether all three classes for that initialization phase have been observed.

## State machine

Only three states are used by the current receive path:

```text
ST_IDLE
  |  link up + full payload beat + DLLP classification
  v
ST_CHECK_CRC
  |  valid two-byte terminal beat + matching CRC
  v
ST_PROCESS_DLLP
  |  decode once, pulse/update outputs as applicable
  +--------------------------------------------------> ST_IDLE

ST_CHECK_CRC -- malformed terminal beat or bad CRC ---> ST_IDLE
```

`ST_DLL_RX_DATA` and `ST_TLP_EOP` remain declared in the enum but are not reached by the current logic.

## Reset behavior

On `rst_i`, the handler returns to `ST_IDLE`; clears all six stored credit values, all InitFC1/InitFC2 class flags, `update_fc_o`, and the Feature Exchange latch. ACK/NAK outputs are combinationally inactive unless the state machine is processing a valid ACK or NAK.

## Instantiations

| Instance | Module | Purpose |
| --- | --- | --- |
| `pcie_datalink_crc_inst` | `pcie_datalink_crc` | Computes the DLLP CRC over the four-byte payload. |
| `axis_register_inst` | `axis_register` | Provides a skid-buffered AXI-Stream input. |
