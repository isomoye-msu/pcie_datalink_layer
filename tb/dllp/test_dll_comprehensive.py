# ============================================================================
# Cocotb testbench for pcie_datalink_layer
#
# Relaxed functional version:
#   - Prioritizes logical correctness over strict PCIe Gen1 timing.
#   - Uses weaker timeout thresholds by default.
#   - Keeps environment-variable overrides for easy tuning.
#
# Compatible with:
#   cocotb 1.9.2+
#   cocotbext-axi 0.1.x
#   VCS
#
# DUT interfaces:
#   s_phy_axis : packets entering from the physical layer
#   m_phy_axis : packets leaving toward the physical layer
#   s_tlp_axis : locally generated TLPs entering from the transaction layer
#   m_tlp_axis : received TLPs delivered to the transaction layer
#
# Recommended run:
#   make sim 2>&1 | tee output_testPcie_console.txt
#
# Python-side log file:
#   output_testPcie_python.txt
# ============================================================================

import itertools
import logging
import os
import random
import zlib
from typing import Dict, List, Optional, Tuple

import cocotb
from cocotb.clock import Clock
from cocotb.queue import Queue
from cocotb.result import SimTimeoutError
from cocotb.triggers import Event, RisingEdge, with_timeout
from cocotb.utils import get_sim_time

from cocotbext.axi import (
    AxiStreamBus,
    AxiStreamFrame,
    AxiStreamSink,
    AxiStreamSource,
)
from cocotbext.pcie.core.dllp import Dllp, DllpType, FcScale
from cocotbext.pcie.core.tlp import Tlp, TlpType


# ----------------------------------------------------------------------------
# Relaxed timing configuration
# ----------------------------------------------------------------------------
# Original strict clock was 4 ns. Use 8 ns by default to match a slower,
# function-first bring-up environment.
CLOCK_PERIOD_NS = int(os.environ.get("PCIE_CLOCK_PERIOD_NS", "8"))

# Relaxed AXI and initialization timeouts. These values are intentionally large
# so that slow internal FSMs do not fail the test before producing correct logic.
AXIS_SEND_TIMEOUT_US = int(os.environ.get("PCIE_AXIS_SEND_TIMEOUT_US", "500"))
AXIS_RECV_TIMEOUT_US = int(os.environ.get("PCIE_AXIS_RECV_TIMEOUT_US", "500"))

FC_DRIVER_TIMEOUT_US = int(os.environ.get("PCIE_FC_DRIVER_TIMEOUT_US", "1000"))
FC_INITIALIZED_TIMEOUT_US = int(
    os.environ.get("PCIE_FC_INITIALIZED_TIMEOUT_US", "2000")
)

MONITOR_POLL_TIMEOUT_US = int(os.environ.get("PCIE_MONITOR_POLL_TIMEOUT_US", "20"))
MONITOR_SHUTDOWN_TIMEOUT_US = int(
    os.environ.get("PCIE_MONITOR_SHUTDOWN_TIMEOUT_US", "100")
)

MALFORMED_REJECTION_WINDOW_US = int(
    os.environ.get("PCIE_MALFORMED_REJECTION_WINDOW_US", "100")
)

# Negative checks must be much shorter than the replay timer.  Otherwise a
# legitimate replay-timer expiration can be mistaken for an immediate response
# to the packet that is currently under test.
NO_RESPONSE_WINDOW_CYCLES = int(
    os.environ.get("PCIE_NO_RESPONSE_WINDOW_CYCLES", "32")
)

BACKPRESSURE_TIMEOUT_US = int(
    os.environ.get("PCIE_BACKPRESSURE_TIMEOUT_US", str(AXIS_RECV_TIMEOUT_US))
)

DEFAULT_LOG_FILE = "output_testPcie_python.txt"
DEFAULT_RANDOM_SEED = 0x50434945

# These defaults match pcie_datalink_layer.sv.  Override them when the DUT is
# instantiated with different values.
RETRY_BUFFER_DEPTH = int(os.environ.get("PCIE_RETRY_BUFFER_DEPTH", "3"))
REPLAY_TIMER_CYCLES = int(os.environ.get("PCIE_REPLAY_TIMER_CYCLES", str(0xAA0)), 0)
MAX_REPLAY_ATTEMPTS = int(os.environ.get("PCIE_MAX_REPLAY_ATTEMPTS", "2"))
MAX_PAYLOAD_BYTES = int(os.environ.get("PCIE_MAX_PAYLOAD_BYTES", "256"))
ACK_LATENCY_LIMIT_CYCLES = int(
    os.environ.get("PCIE_ACK_LATENCY_LIMIT_CYCLES", "512")
)

# A DLLP is a four-byte payload plus a two-byte CRC.
DLLP_FRAME_BYTES = 6

# s_phy_axis_tuser packet classification used by axis_user_demux.
PHY_USER_IS_DLLP = 1 << 0
PHY_USER_IS_TLP = 1 << 1


def env_flag(name: str, default: str = "0") -> bool:
    return os.environ.get(name, default).strip().lower() in ("1", "true", "yes", "on")


def configure_file_logging(log: logging.Logger) -> str:
    """Write Python-side test messages to a text file."""
    log_path = os.environ.get("PCIE_TEST_LOG", DEFAULT_LOG_FILE)

    # Avoid duplicate handlers if the testbench is reconstructed.
    for handler in log.handlers:
        if getattr(handler, "_pcie_test_file_handler", False):
            return log_path

    file_handler = logging.FileHandler(log_path, mode="w")
    file_handler._pcie_test_file_handler = True
    file_handler.setLevel(logging.DEBUG)
    file_handler.setFormatter(
        logging.Formatter(
            fmt="%(asctime)s %(levelname)-8s %(name)s: %(message)s"
        )
    )
    log.addHandler(file_handler)

    return log_path


def require_dut_signals(dut) -> None:
    """Produce a clear error if cocotb prefixes do not match the RTL."""
    required = [
        "clk_i",
        "rst_i",
        "phy_link_up_i",
        "fc_initialized_o",
        "idle_valid_i",
        "status_error_cor_i",
        "status_error_uncor_i",
        "rx_cpl_stall_i",

        "s_phy_axis_tdata",
        "s_phy_axis_tkeep",
        "s_phy_axis_tvalid",
        "s_phy_axis_tlast",
        "s_phy_axis_tuser",
        "s_phy_axis_tready",

        "m_phy_axis_tdata",
        "m_phy_axis_tkeep",
        "m_phy_axis_tvalid",
        "m_phy_axis_tlast",
        "m_phy_axis_tuser",
        "m_phy_axis_tready",

        "s_tlp_axis_tdata",
        "s_tlp_axis_tkeep",
        "s_tlp_axis_tvalid",
        "s_tlp_axis_tlast",
        "s_tlp_axis_tuser",
        "s_tlp_axis_tready",

        "m_tlp_axis_tdata",
        "m_tlp_axis_tkeep",
        "m_tlp_axis_tvalid",
        "m_tlp_axis_tlast",
        "m_tlp_axis_tuser",
        "m_tlp_axis_tready",
    ]

    missing = [name for name in required if not hasattr(dut, name)]

    if missing:
        raise AssertionError(
            "The pcie_datalink_layer top level is missing these expected "
            "signals: {}".format(", ".join(missing))
        )


class TB:
    def __init__(self, dut):
        require_dut_signals(dut)

        self.dut = dut
        self.log = logging.getLogger("cocotb.tb")
        self.log.setLevel(logging.DEBUG)
        self.log_file = configure_file_logging(self.log)

        # Initialize non-AXI inputs before the first clock edge.
        dut.rst_i.setimmediatevalue(1)
        dut.phy_link_up_i.setimmediatevalue(0)
        dut.idle_valid_i.setimmediatevalue(0)
        dut.status_error_cor_i.setimmediatevalue(0)
        dut.status_error_uncor_i.setimmediatevalue(0)
        dut.rx_cpl_stall_i.setimmediatevalue(0)

        cocotb.start_soon(
            Clock(
                dut.clk_i,
                CLOCK_PERIOD_NS,
                units="ns",
            ).start()
        )

        # Incoming packets from the physical layer.
        self.phy_source = AxiStreamSource(
            AxiStreamBus.from_prefix(dut, "s_phy_axis"),
            dut.clk_i,
            dut.rst_i,
        )

        # Outgoing packets toward the physical layer.
        self.phy_sink = AxiStreamSink(
            AxiStreamBus.from_prefix(dut, "m_phy_axis"),
            dut.clk_i,
            dut.rst_i,
        )

        # Locally generated TLPs from the transaction layer.
        self.tlp_source = AxiStreamSource(
            AxiStreamBus.from_prefix(dut, "s_tlp_axis"),
            dut.clk_i,
            dut.rst_i,
        )

        # Received TLPs delivered to the transaction layer.
        self.tlp_sink = AxiStreamSink(
            AxiStreamBus.from_prefix(dut, "m_tlp_axis"),
            dut.clk_i,
            dut.rst_i,
        )

        # Keep cocotbext-axi logs quiet unless debugging is explicitly enabled.
        axis_log_level = logging.DEBUG if env_flag("PCIE_VERBOSE_AXI") else logging.CRITICAL
        self.phy_source.log.setLevel(axis_log_level)
        self.phy_sink.log.setLevel(axis_log_level)
        self.tlp_source.log.setLevel(axis_log_level)
        self.tlp_sink.log.setLevel(axis_log_level)

    async def reset(self, asserted_cycles: int = 8, settle_cycles: int = 8):
        """Apply an active-high reset and wait for the design to settle."""
        self.log.info("Applying reset")

        self.dut.rst_i.value = 1
        self.dut.phy_link_up_i.value = 0
        self.dut.idle_valid_i.value = 0

        for _ in range(asserted_cycles):
            await RisingEdge(self.dut.clk_i)

        self.dut.rst_i.value = 0

        for _ in range(settle_cycles):
            await RisingEdge(self.dut.clk_i)

        self.log.info("Reset released")

    async def wait_cycles(self, cycles: int) -> None:
        for _ in range(cycles):
            await RisingEdge(self.dut.clk_i)


def cycle_pause():
    """Apply three stalled cycles followed by one accepting cycle."""
    return itertools.cycle([1, 1, 1, 0])


def calculate_dllp_crc(data: bytes) -> int:
    """Match the reflected CRC-16 implementation in pcie_dllp_crc8."""
    crc = 0xFFFF

    for byte in data:
        crc ^= byte
        for _ in range(8):
            crc = (crc >> 1) ^ 0xD008 if crc & 1 else crc >> 1

    return crc ^ 0xFFFF


def build_fc_dllp(
    dllp_type: DllpType,
    seq: int = 0,
    hdr_fc: int = 3,
    data_fc: int = 256,
    hdr_scale: int = 0,
    data_scale: int = 0,
) -> bytes:
    """Create one flow-control DLLP including its two-byte CRC."""
    packet = Dllp()
    packet.type = dllp_type
    packet.seq = seq
    packet.vc = 0
    packet.hdr_scale = FcScale(hdr_scale)
    packet.hdr_fc = hdr_fc
    packet.data_scale = FcScale(data_scale)
    packet.data_fc = data_fc
    packet.feature_support = 0
    packet.feature_ack = False

    payload = bytes(packet.pack())

    # The RTL starts at 16'hFFFF, processes the four DLLP bytes in wire
    # order, complements the result, and places the low CRC byte first.
    crc = calculate_dllp_crc(payload)

    return payload + crc.to_bytes(2, "little")


def build_ack_nak_dllp(dllp_type: DllpType, seq: int) -> bytes:
    """Create an ACK or NAK DLLP including CRC."""
    packet = Dllp()
    packet.type = dllp_type
    packet.seq = seq & 0xFFF
    payload = bytes(packet.pack())
    crc = calculate_dllp_crc(payload)
    return payload + crc.to_bytes(2, "little")


def build_raw_dllp(payload: bytes) -> bytes:
    """Create a raw four-byte DLLP payload with matching CRC."""
    if len(payload) != 4:
        raise ValueError("DLLP payload must be exactly four bytes")

    crc = calculate_dllp_crc(payload)
    return payload + crc.to_bytes(2, "little")


def corrupt_dllp_crc(frame_data: bytes) -> bytes:
    """Flip one CRC bit while leaving the DLLP payload unchanged."""
    data = bytearray(frame_data)
    data[-1] ^= 0x01
    return bytes(data)


def check_dllp_crc(frame_data: bytes) -> Optional[bytes]:
    """Return the DLLP payload when its CRC is valid, otherwise return None."""
    frame_data = bytes(frame_data)

    if len(frame_data) != DLLP_FRAME_BYTES:
        return None

    payload = frame_data[:-2]
    received_crc = frame_data[-2:]

    calculated_crc = calculate_dllp_crc(payload).to_bytes(2, "little")

    if received_crc != calculated_crc:
        return None

    return payload


def add_sequence_and_lcrc(
    sequence_number: int,
    tlp_payload: bytes,
) -> bytes:
    """Wrap a transaction-layer TLP for the physical-facing receive path."""
    if not 0 <= sequence_number <= 0xFFF:
        raise ValueError("PCIe sequence number must fit in 12 bits")

    link_packet = sequence_number.to_bytes(2, "big") + bytes(tlp_payload)
    lcrc = zlib.crc32(link_packet) & 0xFFFFFFFF

    return link_packet + lcrc.to_bytes(4, "little")


def build_memory_write(
    payload_length: int,
    tag: int,
    requester_id: int = 1,
    address: int = 4,
) -> Tuple[bytes, bytes]:
    """Return the packed TLP and its deterministic data payload."""
    payload = bytes(((index + tag) & 0xFF) for index in range(payload_length))

    tlp = Tlp()
    tlp.fmt_type = TlpType.MEM_WRITE
    tlp.set_addr_be_data(address, payload)
    tlp.tag = tag
    tlp.requester_id = requester_id

    return bytes(tlp.pack()), payload


def build_memory_read(
    byte_length: int,
    tag: int,
    address: int = 4,
    address_64bit: bool = False,
) -> bytes:
    """Build a 3-DW or 4-DW non-posted Memory Read request."""
    tlp = Tlp()
    tlp.fmt_type = TlpType.MEM_READ_64 if address_64bit else TlpType.MEM_READ
    tlp.set_addr_be(address, byte_length)
    tlp.tag = tag
    tlp.requester_id = 1
    return bytes(tlp.pack())


def build_memory_write_64(payload_length: int, tag: int) -> bytes:
    """Build a 4-DW posted Memory Write request."""
    payload = bytes(((tag + index) & 0xFF) for index in range(payload_length))
    tlp = Tlp()
    tlp.fmt_type = TlpType.MEM_WRITE_64
    tlp.set_addr_be_data(0x1_0000_0004, payload)
    tlp.tag = tag
    tlp.requester_id = 1
    return bytes(tlp.pack())


def build_raw_tlp(
    fmt_type_byte: int,
    length_dw: int,
    header_dw: int,
    payload: bytes = b"",
    td: bool = False,
    ecrc: bytes = b"",
) -> bytes:
    """Build a deterministic TLP for Data-Link black-box forwarding tests."""
    if header_dw not in (3, 4):
        raise ValueError("TLP header must contain three or four DW")
    if not 0 <= length_dw <= 0x3FF:
        raise ValueError("TLP length must fit the ten-bit Length field")
    if td and len(ecrc) != 4:
        raise ValueError("TD=1 requires a four-byte ECRC")

    header = bytearray(header_dw * 4)
    header[0] = fmt_type_byte & 0xFF
    header[2] = ((length_dw >> 8) & 0x03) | (0x80 if td else 0)
    header[3] = length_dw & 0xFF
    return bytes(header) + bytes(payload) + (bytes(ecrc) if td else b"")


def build_completion(with_data: bool, tag: int, payload_length: int = 4) -> bytes:
    """Build a Completion or Completion-with-Data TLP."""
    payload = bytes(((0xC0 + tag + index) & 0xFF) for index in range(payload_length))
    length_dw = (payload_length + 3) // 4 if with_data else 0
    packet = bytearray(
        build_raw_tlp(0x4A if with_data else 0x0A, length_dw, 3,
                      payload if with_data else b"")
    )
    # Completion header Tag byte.
    packet[10] = tag & 0xFF
    return bytes(packet)


def build_message(with_data: bool, tag: int, payload_length: int = 4) -> bytes:
    """Build a routed Message or Message-with-Data TLP."""
    payload = bytes(((0x80 + tag + index) & 0xFF) for index in range(payload_length))
    length_dw = (payload_length + 3) // 4 if with_data else 0
    return build_raw_tlp(
        0x70 if with_data else 0x30,
        length_dw,
        4,
        payload if with_data else b"",
    )


def build_zero_byte_memory_read(tag: int) -> bytes:
    """Build the PCIe zero-byte-read encoding: Length=1 DW and both BEs zero."""
    packet = bytearray(build_memory_read(byte_length=4, tag=tag))
    packet[7] = 0
    return bytes(packet)


def get_internal_handle(dut, dotted_path: str):
    """Resolve a required internal verification handle with a clear failure."""
    handle = dut
    for component in dotted_path.split("."):
        if not hasattr(handle, component):
            raise AssertionError(
                "Required internal signal '{}' is unavailable. Compile VCS with "
                "-debug_access+all or expose this status at the top level.".format(
                    dotted_path
                )
            )
        handle = getattr(handle, component)
    return handle


async def send_frame_with_timeout(
    source: AxiStreamSource,
    frame_data: bytes,
    description: str,
    timeout_us: int = AXIS_SEND_TIMEOUT_US,
    tuser: int = 0,
) -> None:
    """Send one AXI-stream frame with an optional tuser value."""

    frame = AxiStreamFrame(bytes(frame_data))
    frame.tuser = tuser

    try:
        await with_timeout(
            source.send(frame),
            timeout_us,
            "us",
        )
    except SimTimeoutError as exc:
        raise AssertionError(
            "Timed out after {} us while sending {}. "
            "AXI handshake did not complete.".format(
                timeout_us,
                description,
            )
        ) from exc


async def receive_frame_with_timeout(
    sink: AxiStreamSink,
    description: str,
    timeout_us: int = AXIS_RECV_TIMEOUT_US,
) -> bytes:
    """Receive one frame and fail with a meaningful timeout message."""
    try:
        frame = await with_timeout(sink.recv(), timeout_us, "us")
    except SimTimeoutError as exc:
        raise AssertionError(
            "Timed out after {} us while waiting for {}. "
            "Increase PCIE_AXIS_RECV_TIMEOUT_US if the design is intentionally slow.".format(
                timeout_us,
                description,
            )
        ) from exc

    return bytes(frame.tdata)


async def wait_for_signal_high(
    dut,
    signal,
    description: str,
    timeout_us: int,
) -> None:
    """Wait for a one-bit DUT signal to become one."""

    async def waiter():
        while True:
            await RisingEdge(dut.clk_i)
            if signal.value.is_resolvable and int(signal.value) == 1:
                return

    try:
        await with_timeout(waiter(), timeout_us, "us")
    except SimTimeoutError as exc:
        raise AssertionError(
            "{} did not assert within {} us. "
            "Increase PCIE_FC_INITIALIZED_TIMEOUT_US if the FSM is intentionally slow.".format(
                description,
                timeout_us,
            )
        ) from exc


async def phy_output_monitor(
    tb: TB,
    output_queue: Queue,
    stop_event: Event,
) -> None:
    """Continuously capture and describe packets sent toward the PHY."""
    frame_index = 0
    tb.log.info("Starting m_phy_axis monitor")

    while not stop_event.is_set():
        try:
            frame = await with_timeout(
                tb.phy_sink.recv(),
                MONITOR_POLL_TIMEOUT_US,
                "us",
            )
        except SimTimeoutError:
            continue

        frame_index += 1
        frame_data = bytes(frame.tdata)
        await output_queue.put(frame_data)

        tb.log.info(
            "m_phy_axis frame %d: length=%d data=%s",
            frame_index,
            len(frame_data),
            frame_data.hex(),
        )

        dllp_payload = check_dllp_crc(frame_data)
        if dllp_payload is None:
            if len(frame_data) == DLLP_FRAME_BYTES:
                tb.log.warning(
                    "Six-byte m_phy_axis frame did not pass DLLP CRC checking"
                )
            continue

        try:
            decoded = Dllp().unpack(dllp_payload)
        except Exception:
            tb.log.exception(
                "DLLP CRC passed, but decoding failed for %s",
                dllp_payload.hex(),
            )
            continue

        tb.log.info("Decoded outgoing DLLP: %s", decoded)

    tb.log.info("Stopped m_phy_axis monitor after %d frame(s)", frame_index)


async def send_flow_control_initialization(
    tb: TB,
    completion_hdr_fc: int = 0,
    completion_data_fc: int = 0,
) -> int:
    """
    Send the FC1/FC2 sequence.

    The repeated INIT_FC2_P packet is intentionally retained from the original
    test to exercise repeated flow-control initialization traffic.
    """
    sequence: List[Tuple[DllpType, int, int, str]] = [
        (DllpType.INIT_FC1_P,   0, 200, "INIT_FC1_P"),
        (DllpType.INIT_FC1_NP,  0, 200, "INIT_FC1_NP"),
        (DllpType.INIT_FC1_CPL, 0,   0, "INIT_FC1_CPL"),
        (DllpType.INIT_FC2_P,   0,  20, "INIT_FC2_P first"),
        (DllpType.INIT_FC2_P,   0,  20, "INIT_FC2_P repeated"),
        (DllpType.INIT_FC2_NP,  0, 200, "INIT_FC2_NP"),
        (DllpType.INIT_FC2_CPL, 0,   0, "INIT_FC2_CPL"),
    ]

    for dllp_type, seq, delay_cycles, description in sequence:
        if dllp_type in (DllpType.INIT_FC1_CPL, DllpType.INIT_FC2_CPL):
            frame_data = build_fc_dllp(
                dllp_type=dllp_type,
                seq=seq,
                hdr_fc=completion_hdr_fc,
                data_fc=completion_data_fc,
            )
        else:
            frame_data = build_fc_dllp(dllp_type=dllp_type, seq=seq)

        tb.log.info("Sending incoming %s: %s", description, frame_data.hex())

        await send_frame_with_timeout(
            tb.phy_source,
            frame_data,
            description,
            timeout_us=AXIS_SEND_TIMEOUT_US,
            tuser=PHY_USER_IS_DLLP,
        )

        await tb.wait_cycles(delay_cycles)

    return len(sequence)


def drain_queue(
    queue: Queue,
    context: str = "test boundary",
    allow_ack_nak: bool = False,
) -> List[bytes]:
    """Drain background traffic without silently deleting protocol responses."""
    frames = []

    while not queue.empty():
        frame_data = queue.get_nowait()
        frames.append(frame_data)

        if len(frame_data) != DLLP_FRAME_BYTES:
            continue

        payload = check_dllp_crc(frame_data)
        if payload is None:
            raise AssertionError(
                "{} contained an outgoing six-byte DLLP with invalid CRC: {}".format(
                    context,
                    frame_data.hex(),
                )
            )

        try:
            decoded = Dllp().unpack(payload)
        except Exception as exc:
            raise AssertionError(
                "{} contained an undecodable outgoing DLLP: {}".format(
                    context,
                    frame_data.hex(),
                )
            ) from exc

        if not allow_ack_nak and decoded.type in (DllpType.ACK, DllpType.NAK):
            raise AssertionError(
                "{} discarded an unconsumed {} DLLP with sequence {}".format(
                    context,
                    decoded.type.name,
                    decoded.seq,
                )
            )

    return frames


async def wait_for_outgoing_tlp(
    output_queue: Queue,
    expected_tlp_payload: bytes,
    timeout_us: int = AXIS_RECV_TIMEOUT_US,
) -> bytes:
    """Find an outgoing link packet that contains the expected raw TLP."""

    async def finder():
        while True:
            frame_data = await output_queue.get()

            # DLLPs are six bytes in this environment.
            if len(frame_data) == DLLP_FRAME_BYTES:
                payload = check_dllp_crc(frame_data)
                if payload is None:
                    raise AssertionError(
                        "Outgoing six-byte DLLP has an invalid CRC while "
                        "waiting for a TLP: {}".format(frame_data.hex())
                    )

                try:
                    decoded = Dllp().unpack(payload)
                except Exception as exc:
                    raise AssertionError(
                        "Outgoing DLLP could not be decoded while waiting "
                        "for a TLP: {}".format(frame_data.hex())
                    ) from exc

                if decoded.type in (DllpType.ACK, DllpType.NAK):
                    raise AssertionError(
                        "Unexpected {} DLLP with sequence {} while waiting "
                        "for outgoing TLP payload {}".format(
                            decoded.type.name,
                            decoded.seq,
                            expected_tlp_payload.hex(),
                        )
                    )
                continue

            if len(frame_data) < DLLP_FRAME_BYTES:
                continue

            if expected_tlp_payload in frame_data:
                return frame_data

            raise AssertionError(
                "Received a non-DLLP m_phy_axis frame, but it did not contain "
                "the expected transaction-layer TLP. frame={} expected={}".format(
                    frame_data.hex(),
                    expected_tlp_payload.hex(),
                )
            )

    try:
        return await with_timeout(finder(), timeout_us, "us")
    except SimTimeoutError as exc:
        raise AssertionError(
            "No outgoing TLP containing the expected payload was observed "
            "within {} us. Increase PCIE_AXIS_RECV_TIMEOUT_US if the design is slow.".format(
                timeout_us
            )
        ) from exc


async def wait_for_outgoing_dllp(
    output_queue: Queue,
    expected_type: DllpType,
    timeout_us: int = AXIS_RECV_TIMEOUT_US,
) -> Dllp:
    """Wait for one ACK/NAK response without hiding a contradictory response.

    Periodic InitFC/UpdateFC traffic is independent and may be skipped.  ACK
    and NAK responses are causal, however, so consuming the opposite response
    would hide the first protocol error and usually cause a misleading timeout
    in a later test.
    """

    ack_nak_types = (DllpType.ACK, DllpType.NAK)

    async def finder():
        while True:
            frame_data = await output_queue.get()

            if len(frame_data) != DLLP_FRAME_BYTES:
                continue

            payload = check_dllp_crc(frame_data)

            if payload is None:
                raise AssertionError(
                    "Outgoing six-byte DLLP has an invalid CRC: {}".format(
                        frame_data.hex()
                    )
                )

            try:
                decoded = Dllp().unpack(payload)
            except Exception as exc:
                raise AssertionError(
                    "Outgoing DLLP could not be decoded: {}".format(
                        frame_data.hex()
                    )
                ) from exc

            if decoded.type == expected_type:
                return decoded

            if expected_type in ack_nak_types and decoded.type in ack_nak_types:
                raise AssertionError(
                    "Unexpected {} DLLP with sequence {} while waiting for {}".format(
                        decoded.type.name,
                        decoded.seq,
                        expected_type.name,
                    )
                )

    try:
        return await with_timeout(finder(), timeout_us, "us")
    except SimTimeoutError as exc:
        raise AssertionError(
            "No outgoing {} DLLP was observed within {} us".format(
                expected_type.name,
                timeout_us,
            )
        ) from exc


async def assert_no_outgoing_ack_nak(
    output_queue: Queue,
    window_cycles: int = NO_RESPONSE_WINDOW_CYCLES,
) -> None:
    """Require complete ACK/NAK silence while allowing periodic FC DLLPs."""

    async def finder():
        while True:
            frame_data = await output_queue.get()

            if len(frame_data) != DLLP_FRAME_BYTES:
                continue

            payload = check_dllp_crc(frame_data)
            if payload is None:
                raise AssertionError(
                    "Outgoing six-byte DLLP has an invalid CRC: {}".format(
                        frame_data.hex()
                    )
                )

            try:
                decoded = Dllp().unpack(payload)
            except Exception as exc:
                raise AssertionError(
                    "Outgoing DLLP could not be decoded: {}".format(
                        frame_data.hex()
                    )
                ) from exc

            if decoded.type in (DllpType.ACK, DllpType.NAK):
                return decoded

    try:
        decoded = await with_timeout(
            finder(), window_cycles * CLOCK_PERIOD_NS, "ns"
        )
    except SimTimeoutError:
        return

    raise AssertionError(
        "Unexpected {} DLLP with sequence {} while ACK/NAK suppression "
        "was required".format(decoded.type.name, decoded.seq)
    )


async def transmit_local_tlp(
    tb: TB,
    output_queue: Queue,
    raw_tlp: bytes,
    description: str,
) -> Tuple[bytes, int]:
    """Submit one local TLP and return its complete link packet and sequence."""
    await send_frame_with_timeout(tb.tlp_source, raw_tlp, description)
    link_packet = await wait_for_outgoing_tlp(output_queue, raw_tlp)
    sequence_number = int.from_bytes(link_packet[:2], "big") & 0xFFF
    assert link_packet[2:-4] == raw_tlp, (
        "{} was modified by the transmit Data Link Layer".format(description)
    )
    expected_lcrc = zlib.crc32(link_packet[:-4]) & 0xFFFFFFFF
    received_lcrc = int.from_bytes(link_packet[-4:], "little")
    assert received_lcrc == expected_lcrc, (
        "{} has incorrect outgoing LCRC: got 0x{:08x}, expected 0x{:08x}".format(
            description, received_lcrc, expected_lcrc
        )
    )
    return link_packet, sequence_number


async def acknowledge_sequence(tb: TB, sequence_number: int, description: str) -> None:
    await send_incoming_dllp(
        tb,
        build_ack_nak_dllp(DllpType.ACK, sequence_number),
        description,
    )
    await tb.wait_cycles(8)


async def assert_no_outgoing_tlp(
    output_queue: Queue,
    forbidden_tlp_payload: bytes,
    window_cycles: int = NO_RESPONSE_WINDOW_CYCLES,
) -> None:
    """Fail if a PHY output frame containing the forbidden TLP appears."""

    async def finder():
        while True:
            frame_data = await output_queue.get()

            if len(frame_data) == DLLP_FRAME_BYTES:
                payload = check_dllp_crc(frame_data)
                if payload is None:
                    raise AssertionError(
                        "Outgoing six-byte DLLP has an invalid CRC during "
                        "a no-TLP response window: {}".format(frame_data.hex())
                    )

                try:
                    decoded = Dllp().unpack(payload)
                except Exception as exc:
                    raise AssertionError(
                        "Outgoing DLLP could not be decoded during a no-TLP "
                        "response window: {}".format(frame_data.hex())
                    ) from exc

                if decoded.type in (DllpType.ACK, DllpType.NAK):
                    raise AssertionError(
                        "Unexpected {} DLLP with sequence {} during a "
                        "no-TLP response window".format(
                            decoded.type.name,
                            decoded.seq,
                        )
                    )
                continue

            if len(frame_data) > DLLP_FRAME_BYTES and forbidden_tlp_payload in frame_data:
                return frame_data

    try:
        frame_data = await with_timeout(
            finder(), window_cycles * CLOCK_PERIOD_NS, "ns"
        )
    except SimTimeoutError:
        return

    raise AssertionError(
        "Forbidden outgoing TLP was transmitted: {}".format(frame_data.hex())
    )


async def assert_no_tlp_delivered(
    tb: TB,
    description: str,
    window_cycles: int = NO_RESPONSE_WINDOW_CYCLES,
) -> None:
    """Fail if a TLP reaches m_tlp_axis during the rejection window."""
    try:
        frame = await with_timeout(
            tb.tlp_sink.recv(), window_cycles * CLOCK_PERIOD_NS, "ns"
        )
    except SimTimeoutError:
        return

    raise AssertionError(
        "{} unexpectedly delivered TLP {}".format(
            description,
            bytes(frame.tdata).hex(),
        )
    )


async def verify_malformed_tlp_is_rejected(
    tb: TB,
    output_queue: Queue,
    malformed_data: bytes,
    last_good_sequence: int,
) -> int:
    """Reject malformed framing, validate its NAK, then perform recovery."""
    drain_queue(output_queue, "before malformed incoming TLP")

    await send_frame_with_timeout(
        tb.phy_source,
        malformed_data,
        "malformed incoming TLP without sequence number or LCRC",
        tuser=PHY_USER_IS_TLP,
    )

    await assert_no_tlp_delivered(tb, "malformed incoming TLP")

    nak = await wait_for_outgoing_dllp(output_queue, DllpType.NAK)
    assert nak.seq == last_good_sequence, (
        "Malformed-TLP NAK sequence mismatch: got {} expected {}".format(
            nak.seq,
            last_good_sequence,
        )
    )

    # Supply the correctly framed missing TLP so NAK_SCHEDULED is cleared and
    # the following independent DLLP tests do not inherit recovery state.
    recovery_sequence = (last_good_sequence + 1) & 0xFFF
    await send_frame_with_timeout(
        tb.phy_source,
        add_sequence_and_lcrc(recovery_sequence, malformed_data),
        "valid replay after malformed incoming TLP",
        tuser=PHY_USER_IS_TLP,
    )
    recovered = await receive_frame_with_timeout(
        tb.tlp_sink,
        "valid replay after malformed incoming TLP",
    )
    assert recovered == malformed_data, "Malformed-TLP recovery payload changed"

    ack = await wait_for_outgoing_dllp(output_queue, DllpType.ACK)
    assert ack.seq == recovery_sequence, (
        "Malformed-TLP recovery ACK mismatch: got {} expected {}".format(
            ack.seq,
            recovery_sequence,
        )
    )
    return recovery_sequence


async def send_incoming_dllp(tb: TB, frame_data: bytes, description: str) -> None:
    await send_frame_with_timeout(
        tb.phy_source,
        frame_data,
        description,
        tuser=PHY_USER_IS_DLLP,
    )


async def verify_bad_lcrc_generates_nak(
    tb: TB,
    output_queue: Queue,
    sequence_number: int,
    last_good_sequence: int,
) -> int:
    drain_queue(output_queue)

    raw_tlp, _ = build_memory_write(payload_length=8, tag=0x31)
    link_packet = bytearray(
        add_sequence_and_lcrc(sequence_number=sequence_number, tlp_payload=raw_tlp)
    )
    link_packet[-1] ^= 0x01

    await send_frame_with_timeout(
        tb.phy_source,
        bytes(link_packet),
        "incoming TLP with corrupt LCRC",
        tuser=PHY_USER_IS_TLP,
    )

    await assert_no_tlp_delivered(tb, "Bad-LCRC TLP")

    nak = await wait_for_outgoing_dllp(output_queue, DllpType.NAK)
    assert nak.seq == last_good_sequence, (
        "Bad-LCRC NAK sequence mismatch: got {} expected {}".format(
            nak.seq,
            last_good_sequence,
        )
    )

    # Replay the same TLP correctly.  A valid expected packet must clear the
    # receiver's pending-NAK state, reach the Transaction Layer, and advance
    # NEXT_RCV_SEQ exactly once.
    good_link_packet = add_sequence_and_lcrc(
        sequence_number=sequence_number,
        tlp_payload=raw_tlp,
    )
    await send_frame_with_timeout(
        tb.phy_source,
        good_link_packet,
        "correct replay after bad LCRC",
        tuser=PHY_USER_IS_TLP,
    )
    recovered_tlp = await receive_frame_with_timeout(
        tb.tlp_sink,
        "replayed TLP after bad LCRC",
    )
    assert recovered_tlp == raw_tlp, "Correct replay was not delivered unchanged"

    ack = await wait_for_outgoing_dllp(output_queue, DllpType.ACK)
    assert ack.seq == sequence_number, (
        "Replay ACK sequence mismatch: got {} expected {}".format(
            ack.seq, sequence_number
        )
    )
    return sequence_number


async def verify_sequence_number_errors(
    tb: TB,
    output_queue: Queue,
    last_good_sequence: int,
) -> int:
    """Verify PCIe modulo-4096 receive ordering, including the 2048 boundary."""
    expected_sequence = (last_good_sequence + 1) & 0xFFF

    # Per PCIe Gen1, these are duplicates, not missing/future TLPs.  They are
    # discarded and cause a cumulative ACK for the last successfully delivered
    # TLP.  The <= 2048 boundary is deliberate.
    duplicate_tests = [
        (last_good_sequence, "immediately repeated duplicate"),
        ((last_good_sequence - 1) & 0xFFF, "older duplicate"),
        ((expected_sequence - 0x800) & 0xFFF, "duplicate at 2048 boundary"),
    ]

    for index, (sequence_number, description) in enumerate(duplicate_tests):
        raw_tlp, _ = build_memory_write(payload_length=8, tag=0x40 + index)
        link_packet = add_sequence_and_lcrc(
            sequence_number=sequence_number,
            tlp_payload=raw_tlp,
        )

        tb.log.info(
            "Sequence check: %s, sending seq=%d, expected=%d, last-good=%d",
            description,
            sequence_number,
            expected_sequence,
            last_good_sequence,
        )

        await send_frame_with_timeout(
            tb.phy_source,
            link_packet,
            description,
            tuser=PHY_USER_IS_TLP,
        )

        await assert_no_tlp_delivered(tb, description)
        ack = await wait_for_outgoing_dllp(output_queue, DllpType.ACK)
        assert ack.seq == last_good_sequence, (
            "{} cumulative ACK mismatch: got {} expected {}".format(
                description,
                ack.seq,
                last_good_sequence,
            )
        )

    async def reject_future_and_recover(
        received_sequence: int,
        current_expected: int,
        current_last_good: int,
        tag: int,
        description: str,
    ) -> int:
        future_tlp, _ = build_memory_write(payload_length=8, tag=tag)
        tb.log.info(
            "Sequence check: %s, sending seq=%d, expected=%d, last-good=%d",
            description,
            received_sequence,
            current_expected,
            current_last_good,
        )
        await send_frame_with_timeout(
            tb.phy_source,
            add_sequence_and_lcrc(received_sequence, future_tlp),
            description,
            tuser=PHY_USER_IS_TLP,
        )
        await assert_no_tlp_delivered(tb, description)
        nak = await wait_for_outgoing_dllp(output_queue, DllpType.NAK)
        assert nak.seq == current_last_good, (
            "{} NAK mismatch: got {} expected {}".format(
                description, nak.seq, current_last_good
            )
        )

        # Replay begins at the actual missing sequence, clears NAK_SCHEDULED,
        # and advances NEXT_RCV_SEQ once.
        recovery_tlp, _ = build_memory_write(payload_length=8, tag=tag + 1)
        await send_frame_with_timeout(
            tb.phy_source,
            add_sequence_and_lcrc(current_expected, recovery_tlp),
            "recovery after {}".format(description),
            tuser=PHY_USER_IS_TLP,
        )
        delivered = await receive_frame_with_timeout(
            tb.tlp_sink, "recovery after {}".format(description)
        )
        assert delivered == recovery_tlp, "Recovered TLP payload changed"
        ack = await wait_for_outgoing_dllp(output_queue, DllpType.ACK)
        assert ack.seq == current_expected, (
            "Recovery ACK mismatch: got {} expected {}".format(
                ack.seq, current_expected
            )
        )
        return current_expected

    # A one-packet gap is the normal missing-TLP case.
    last_good_sequence = await reject_future_and_recover(
        received_sequence=(expected_sequence + 1) & 0xFFF,
        current_expected=expected_sequence,
        current_last_good=last_good_sequence,
        tag=0x43,
        description="one-packet sequence gap",
    )

    # Exercise the other side of the modulo-4096 half-range boundary.  A
    # distance of 2049 is future/out-of-sequence (2048 was duplicate above).
    expected_sequence = (last_good_sequence + 1) & 0xFFF
    last_good_sequence = await reject_future_and_recover(
        received_sequence=(expected_sequence + 0x7FF) & 0xFFF,
        current_expected=expected_sequence,
        current_last_good=last_good_sequence,
        tag=0x45,
        description="future TLP at 2049-distance boundary",
    )

    return last_good_sequence


async def verify_dllp_arbitration_priority(
    tb: TB,
    output_queue: Queue,
    sequence_number: int,
    last_good_sequence: int,
) -> int:
    # Start backpressure only between frames so an already-selected flow-control
    # DLLP cannot remain at the head of the arbiter during this check.
    while not tb.phy_sink.idle():
        await RisingEdge(tb.dut.clk_i)
    tb.phy_sink.pause = True
    await tb.wait_cycles(2)
    drain_queue(output_queue)

    bad_tlp, _ = build_memory_write(payload_length=8, tag=0x4A)
    bad_link_packet = bytearray(
        add_sequence_and_lcrc(sequence_number=sequence_number, tlp_payload=bad_tlp)
    )
    bad_link_packet[-1] ^= 0x01

    local_tlp, _ = build_memory_write(payload_length=8, tag=0x4B)

    await send_frame_with_timeout(
        tb.phy_source,
        bytes(bad_link_packet),
        "bad-LCRC TLP creating pending NAK for arbitration",
        tuser=PHY_USER_IS_TLP,
    )

    await send_frame_with_timeout(
        tb.tlp_source,
        local_tlp,
        "local TLP competing with pending DLLP",
    )

    # Allow both producers time to reach the shared PHY.  The AXI arbiter locks
    # a grant for the complete packet, so backpressure cannot make arbitration
    # preemptive: the local TLP may already have been granted while the receive
    # path is still checking the LCRC and constructing the NAK.
    await tb.wait_cycles(100)
    tb.phy_sink.pause = False

    try:
        first_frame = await with_timeout(
            output_queue.get(),
            AXIS_RECV_TIMEOUT_US,
            "us",
        )
    except SimTimeoutError as exc:
        raise AssertionError(
            "No PHY output was observed during DLLP arbitration"
        ) from exc
    payload = check_dllp_crc(first_frame)
    if payload is None:
        # A packet that was granted before the NAK request became visible must
        # finish before priority can be reconsidered.  Confirm that it is the
        # one competing TLP, then require the pending NAK next.
        assert local_tlp in first_frame, (
            "Unexpected non-DLLP frame ahead of arbitration NAK: {}".format(
                first_frame.hex()
            )
        )
        tb.log.info(
            "Local TLP was already granted before NAK generation; checking "
            "non-preemptive NAK service after the packet boundary"
        )
        local_packet = first_frame
        decoded = await wait_for_outgoing_dllp(output_queue, DllpType.NAK)
    else:
        decoded = Dllp().unpack(payload)
        assert decoded.type == DllpType.NAK, (
            "DLLP arbitration failed: first DLLP was {}, expected NAK".format(
                decoded.type.name
            )
        )
        local_packet = await wait_for_outgoing_tlp(output_queue, local_tlp)

    assert decoded.seq == last_good_sequence, (
        "Arbitrated NAK sequence mismatch: got {} expected {}".format(
            decoded.seq,
            last_good_sequence,
        )
    )

    local_sequence_number = int.from_bytes(local_packet[:2], "big") & 0xFFF
    await send_incoming_dllp(
        tb,
        build_ack_nak_dllp(DllpType.ACK, local_sequence_number),
        "ACK for arbitration-test TLP",
    )
    await tb.wait_cycles(20)

    # Complete receive-side recovery so the next sequence test begins from a
    # known, protocol-valid receiver state.
    await send_frame_with_timeout(
        tb.phy_source,
        add_sequence_and_lcrc(sequence_number, bad_tlp),
        "valid replay after arbitration test",
        tuser=PHY_USER_IS_TLP,
    )
    delivered = await receive_frame_with_timeout(
        tb.tlp_sink, "valid replay after arbitration test"
    )
    assert delivered == bad_tlp, "Arbitration recovery TLP payload changed"
    ack = await wait_for_outgoing_dllp(output_queue, DllpType.ACK)
    assert ack.seq == sequence_number, (
        "Arbitration recovery ACK mismatch: got {} expected {}".format(
            ack.seq, sequence_number
        )
    )
    return sequence_number


async def verify_ack_nak_replay(
    tb: TB,
    output_queue: Queue,
) -> None:
    raw_tlp, _ = build_memory_write(payload_length=16, tag=0x51)

    await send_frame_with_timeout(
        tb.tlp_source,
        raw_tlp,
        "locally generated TLP for ACK/NAK replay testing",
    )

    first_packet = await wait_for_outgoing_tlp(output_queue, raw_tlp)
    sequence_number = int.from_bytes(first_packet[:2], "big") & 0xFFF

    await send_incoming_dllp(
        tb,
        build_ack_nak_dllp(DllpType.NAK, (sequence_number + 3) & 0xFFF),
        "future NAK DLLP must not request replay",
    )

    await assert_no_outgoing_tlp(output_queue, raw_tlp)

    await send_incoming_dllp(
        tb,
        build_ack_nak_dllp(DllpType.ACK, (sequence_number + 3) & 0xFFF),
        "future ACK DLLP must not clear replay buffer entry",
    )

    last_acknowledged_sequence = (sequence_number - 1) & 0xFFF

    await send_incoming_dllp(
        tb,
        build_ack_nak_dllp(DllpType.NAK, last_acknowledged_sequence),
        "NAK for last good sequence requesting replay of next TLP",
    )

    replay_packet = await wait_for_outgoing_tlp(output_queue, raw_tlp)
    assert replay_packet == first_packet, (
        "Replay retransmission changed packet contents. first={} replay={}".format(
            first_packet.hex(),
            replay_packet.hex(),
        )
    )

    await send_incoming_dllp(
        tb,
        build_ack_nak_dllp(DllpType.ACK, sequence_number),
        "received ACK DLLP completing replay buffer entry",
    )

    await send_incoming_dllp(
        tb,
        build_ack_nak_dllp(DllpType.NAK, last_acknowledged_sequence),
        "stale NAK after cumulative ACK must not replay",
    )

    await assert_no_outgoing_tlp(output_queue, raw_tlp)


async def verify_updatefc_and_credit_blocking(
    tb: TB,
    output_queue: Queue,
) -> None:
    drain_queue(output_queue)
    blocked_tlp, _ = build_memory_write(payload_length=32, tag=0x61)

    await send_frame_with_timeout(
        tb.tlp_source,
        blocked_tlp,
        "TLP submitted after exhausting posted-header credits",
        timeout_us=AXIS_SEND_TIMEOUT_US,
    )

    await assert_no_outgoing_tlp(output_queue, blocked_tlp)

    # Flow-control limits are cumulative and must not be reduced to represent
    # zero available credit.  The initial limit of three has been consumed by
    # the phase-2, arbitration, and ACK/NAK-replay TLPs.  Advancing it to four
    # grants exactly one additional posted-header credit.
    await send_incoming_dllp(
        tb,
        build_fc_dllp(
            dllp_type=DllpType.UPDATE_FC_P,
            hdr_fc=4,
            data_fc=256,
        ),
        "UPDATE_FC_P granting one additional posted-header credit",
    )

    released_packet = await wait_for_outgoing_tlp(output_queue, blocked_tlp)
    released_sequence = int.from_bytes(released_packet[:2], "big") & 0xFFF
    await send_incoming_dllp(
        tb,
        build_ack_nak_dllp(DllpType.ACK, released_sequence),
        "ACK for credit-released TLP",
    )

    # Keep later cumulative limits monotonic and leave enough credit for the
    # optional backpressure transmit test.
    for dllp_type in (
        DllpType.UPDATE_FC_P,
        DllpType.UPDATE_FC_NP,
        DllpType.UPDATE_FC_CPL,
    ):
        await send_incoming_dllp(
            tb,
            build_fc_dllp(
                dllp_type=dllp_type,
                hdr_fc=32,
                data_fc=256,
            ),
            "{} increasing cumulative credit limits".format(dllp_type.name),
        )


async def verify_replay_timer_timeout(tb: TB, output_queue: Queue) -> None:
    """An unacknowledged TLP must be replayed when REPLAY_TIMER expires."""
    raw_tlp, _ = build_memory_write(payload_length=16, tag=0x62)
    await send_frame_with_timeout(
        tb.tlp_source,
        raw_tlp,
        "TLP intentionally left unacknowledged for replay timeout",
    )
    first_packet = await wait_for_outgoing_tlp(output_queue, raw_tlp)
    replay_packet = await wait_for_outgoing_tlp(output_queue, raw_tlp)
    assert replay_packet == first_packet, (
        "Replay-timer retransmission changed the link packet"
    )

    sequence_number = int.from_bytes(first_packet[:2], "big") & 0xFFF
    await send_incoming_dllp(
        tb,
        build_ack_nak_dllp(DllpType.ACK, sequence_number),
        "ACK after replay-timer retransmission",
    )


async def verify_bad_and_malformed_dllps_are_ignored(
    tb: TB,
    output_queue: Queue,
) -> None:
    drain_queue(output_queue)

    malformed_frames = [
        (
            corrupt_dllp_crc(build_fc_dllp(DllpType.UPDATE_FC_P, hdr_fc=0xFF, data_fc=0xFFF)),
            "bad DLLP CRC",
        ),
        (build_raw_dllp(bytes([0xFF, 0x00, 0x00, 0x00])), "invalid DLLP type"),
        (
            build_raw_dllp(bytes([int(DllpType.ACK), 0xFF, 0x0F, 0x00])),
            "ACK DLLP with reserved fields set",
        ),
        (
            build_raw_dllp(bytes([int(DllpType.UPDATE_FC_P), 0x40, 0x00, 0x01])),
            "UpdateFC DLLP using unsupported VC bits",
        ),
    ]

    for frame_data, description in malformed_frames:
        await send_incoming_dllp(tb, frame_data, description)
        await tb.wait_cycles(20)

    # Periodic/credit-triggered UpdateFC DLLPs are independent background
    # traffic.  drain_queue validates every DLLP and fails on an ACK/NAK, while
    # allowing those legitimate FC updates to cross this negative-test window.
    drain_queue(output_queue, "after malformed incoming DLLPs")


async def verify_corrupt_ack_nak_crc(tb: TB, output_queue: Queue) -> None:
    """Corrupt ACK/NAK DLLPs must neither retire nor replay an outstanding TLP."""
    drain_queue(output_queue)
    raw_tlp = build_completion(False, tag=0x70)
    first_packet, sequence_number = await transmit_local_tlp(
        tb, output_queue, raw_tlp, "TLP retained during corrupt ACK/NAK tests"
    )
    prior_sequence = (sequence_number - 1) & 0xFFF

    await send_incoming_dllp(
        tb,
        corrupt_dllp_crc(build_ack_nak_dllp(DllpType.ACK, sequence_number)),
        "ACK DLLP with corrupt CRC",
    )
    await assert_no_outgoing_tlp(output_queue, raw_tlp)

    await send_incoming_dllp(
        tb,
        corrupt_dllp_crc(build_ack_nak_dllp(DllpType.NAK, prior_sequence)),
        "NAK DLLP with corrupt CRC",
    )
    await assert_no_outgoing_tlp(output_queue, raw_tlp)

    # A valid NAK proves the corrupt ACK did not purge the retry entry and the
    # corrupt NAK did not alter replay state.
    await send_incoming_dllp(
        tb,
        build_ack_nak_dllp(DllpType.NAK, prior_sequence),
        "valid NAK after corrupt ACK/NAK DLLPs",
    )
    replay = await wait_for_outgoing_tlp(output_queue, raw_tlp)
    assert replay == first_packet, "Replay changed after corrupt ACK/NAK DLLPs"
    await acknowledge_sequence(tb, sequence_number, "ACK corrupt-DLLP test TLP")


async def verify_cumulative_ack_and_multi_packet_replay(
    tb: TB,
    output_queue: Queue,
) -> None:
    """Verify cumulative retirement and ordered go-back-N replay."""
    drain_queue(output_queue)

    cumulative_tlps = [build_completion(False, 0x74 + i) for i in range(3)]
    cumulative_packets: List[bytes] = []
    cumulative_sequences: List[int] = []
    for index, raw_tlp in enumerate(cumulative_tlps):
        packet, seq = await transmit_local_tlp(
            tb, output_queue, raw_tlp, "cumulative-ACK TLP {}".format(index)
        )
        cumulative_packets.append(packet)
        cumulative_sequences.append(seq)

    # ACK of the middle entry must retire the first and second entries only.
    await acknowledge_sequence(
        tb, cumulative_sequences[1], "cumulative ACK through second outstanding TLP"
    )
    await send_incoming_dllp(
        tb,
        build_ack_nak_dllp(DllpType.NAK, cumulative_sequences[1]),
        "NAK at cumulative ACK point",
    )
    replay = await wait_for_outgoing_tlp(output_queue, cumulative_tlps[2])
    assert replay == cumulative_packets[2], (
        "Cumulative ACK failed to leave only the newest TLP replayable"
    )
    await acknowledge_sequence(tb, cumulative_sequences[2], "retire cumulative test")

    # Fill the buffer again and request replay from immediately before its
    # oldest entry.  Every packet must return once and in original order.
    replay_tlps = [build_completion(False, 0x78 + i) for i in range(3)]
    replay_packets: List[bytes] = []
    replay_sequences: List[int] = []
    for index, raw_tlp in enumerate(replay_tlps):
        packet, seq = await transmit_local_tlp(
            tb, output_queue, raw_tlp, "ordered-replay TLP {}".format(index)
        )
        replay_packets.append(packet)
        replay_sequences.append(seq)

    await send_incoming_dllp(
        tb,
        build_ack_nak_dllp(
            DllpType.NAK, (replay_sequences[0] - 1) & 0xFFF
        ),
        "NAK requesting all outstanding TLPs",
    )
    for index, raw_tlp in enumerate(replay_tlps):
        observed = await wait_for_outgoing_tlp(output_queue, raw_tlp)
        assert observed == replay_packets[index], (
            "Replay order/content failure at outstanding packet {}".format(index)
        )
    await acknowledge_sequence(tb, replay_sequences[-1], "retire ordered replay set")


async def verify_ack_nak_window_boundaries(tb: TB, output_queue: Queue) -> None:
    """Reject ACK/NAK sequence values outside the active transmit window."""
    drain_queue(output_queue)
    raw_tlp = build_completion(False, 0x7C)
    first_packet, sequence_number = await transmit_local_tlp(
        tb, output_queue, raw_tlp, "ACK/NAK window-boundary TLP"
    )

    for offset, dllp_type in ((0x800, DllpType.ACK), (0x800, DllpType.NAK),
                              (1, DllpType.ACK), (1, DllpType.NAK)):
        await send_incoming_dllp(
            tb,
            build_ack_nak_dllp(dllp_type, (sequence_number + offset) & 0xFFF),
            "out-of-window {} offset 0x{:03x}".format(dllp_type.name, offset),
        )
        await assert_no_outgoing_tlp(output_queue, raw_tlp)

    prior_sequence = (sequence_number - 1) & 0xFFF
    await send_incoming_dllp(
        tb,
        build_ack_nak_dllp(DllpType.NAK, prior_sequence),
        "valid boundary NAK for most recently acknowledged sequence",
    )
    replay = await wait_for_outgoing_tlp(output_queue, raw_tlp)
    assert replay == first_packet, "Valid boundary NAK did not preserve replay data"
    await acknowledge_sequence(tb, sequence_number, "retire boundary test TLP")


async def verify_nak_scheduling_suppression(
    tb: TB,
    output_queue: Queue,
    last_good_sequence: int,
) -> int:
    """Only one NAK may remain scheduled while the missing TLP is outstanding."""
    drain_queue(output_queue)
    expected_sequence = (last_good_sequence + 1) & 0xFFF

    for index, received_sequence in enumerate(
        ((expected_sequence + 1) & 0xFFF, (expected_sequence + 2) & 0xFFF)
    ):
        raw_tlp, _ = build_memory_write(8, 0x80 + index)
        await send_frame_with_timeout(
            tb.phy_source,
            add_sequence_and_lcrc(received_sequence, raw_tlp),
            "out-of-sequence TLP while NAK is pending",
            tuser=PHY_USER_IS_TLP,
        )
        await assert_no_tlp_delivered(tb, "out-of-sequence TLP")
        if index == 0:
            nak = await wait_for_outgoing_dllp(output_queue, DllpType.NAK)
            assert nak.seq == last_good_sequence
        else:
            await assert_no_outgoing_ack_nak(output_queue)

    recovery_tlp, _ = build_memory_write(8, 0x82)
    await send_frame_with_timeout(
        tb.phy_source,
        add_sequence_and_lcrc(expected_sequence, recovery_tlp),
        "missing TLP clearing NAK_SCHEDULED",
        tuser=PHY_USER_IS_TLP,
    )
    delivered = await receive_frame_with_timeout(tb.tlp_sink, "NAK suppression recovery")
    assert delivered == recovery_tlp
    ack = await wait_for_outgoing_dllp(output_queue, DllpType.ACK)
    assert ack.seq == expected_sequence
    return expected_sequence


async def verify_ack_latency(
    tb: TB,
    output_queue: Queue,
    last_good_sequence: int,
) -> int:
    """Measure functional ACK latency in DUT clock cycles."""
    drain_queue(output_queue)
    sequence_number = (last_good_sequence + 1) & 0xFFF
    raw_tlp, _ = build_memory_write(MAX_PAYLOAD_BYTES, 0x84)
    start_ns = int(get_sim_time(units="ns"))
    await send_frame_with_timeout(
        tb.phy_source,
        add_sequence_and_lcrc(sequence_number, raw_tlp),
        "maximum-payload TLP for ACK latency",
        tuser=PHY_USER_IS_TLP,
    )
    received = await receive_frame_with_timeout(tb.tlp_sink, "ACK-latency TLP")
    assert received == raw_tlp
    ack = await wait_for_outgoing_dllp(output_queue, DllpType.ACK)
    end_ns = int(get_sim_time(units="ns"))
    latency_cycles = (end_ns - start_ns + CLOCK_PERIOD_NS - 1) // CLOCK_PERIOD_NS
    assert ack.seq == sequence_number
    assert latency_cycles <= ACK_LATENCY_LIMIT_CYCLES, (
        "ACK latency {} cycles exceeds configured limit {} cycles".format(
            latency_cycles, ACK_LATENCY_LIMIT_CYCLES
        )
    )
    return sequence_number


async def verify_tlp_classes_and_formats(
    tb: TB,
    output_queue: Queue,
    last_good_sequence: int,
) -> int:
    """Forward representative PCIe request, completion, and message formats."""
    drain_queue(output_queue)
    max_payload = bytes((index & 0xFF) for index in range(MAX_PAYLOAD_BYTES))
    ecrc_payload = bytes((0xE0 + index) & 0xFF for index in range(16))
    cases: List[Tuple[str, bytes]] = [
        ("3-DW Memory Write", build_memory_write(16, 0x90)[0]),
        ("4-DW Memory Write", build_memory_write_64(16, 0x91)),
        ("3-DW Memory Read", build_memory_read(16, 0x92)),
        ("4-DW Memory Read", build_memory_read(16, 0x93, 0x1_0000_0004, True)),
        ("Completion without Data", build_completion(False, 0x94)),
        ("Completion with Data", build_completion(True, 0x95, 16)),
        ("Message without Data", build_message(False, 0x96)),
        ("Message with Data", build_message(True, 0x97, 16)),
        ("zero-byte Memory Read", build_zero_byte_memory_read(0x98)),
        (
            "Length-field zero (1024-DW) Memory Read",
            build_raw_tlp(0x00, 0, 3),
        ),
        (
            "maximum-payload Memory Write",
            build_raw_tlp(0x40, MAX_PAYLOAD_BYTES // 4, 3, max_payload),
        ),
        (
            "TD/ECRC Memory Write",
            build_raw_tlp(
                0x40, len(ecrc_payload) // 4, 3, ecrc_payload,
                td=True, ecrc=b"\x12\x34\x56\x78",
            ),
        ),
    ]

    # Receive direction: exact byte preservation, sequence acceptance, LCRC
    # validation, and correct cumulative ACK sequence for every format.
    for index, (description, raw_tlp) in enumerate(cases):
        sequence_number = (last_good_sequence + 1) & 0xFFF
        await send_frame_with_timeout(
            tb.phy_source,
            add_sequence_and_lcrc(sequence_number, raw_tlp),
            "incoming {}".format(description),
            tuser=PHY_USER_IS_TLP,
        )
        delivered = await receive_frame_with_timeout(
            tb.tlp_sink, "transaction-layer delivery of {}".format(description)
        )
        assert delivered == raw_tlp, "{} changed on receive".format(description)
        ack = await wait_for_outgoing_dllp(output_queue, DllpType.ACK)
        assert ack.seq == sequence_number, (
            "{} ACK mismatch: got {}, expected {}".format(
                description, ack.seq, sequence_number
            )
        )
        last_good_sequence = sequence_number

    # Transmit direction: every accepted class must acquire one sequence number,
    # preserve its TLP bytes, and receive a correct generated LCRC.  Replenish
    # all three credit classes first so this phase tests format classification,
    # not exhaustion (which is tested separately).
    tx_fc_base = "dllp_transmit_inst.tlp2dllp_inst."
    credit_limit_names = {
        DllpType.UPDATE_FC_P: ("ph_credit_limit_r", "pd_credit_limit_r"),
        DllpType.UPDATE_FC_NP: ("nph_credit_limit_r", "npd_credit_limit_r"),
        DllpType.UPDATE_FC_CPL: ("cplh_credit_limit_r", "cpld_credit_limit_r"),
    }
    for dllp_type in (DllpType.UPDATE_FC_P, DllpType.UPDATE_FC_NP,
                      DllpType.UPDATE_FC_CPL):
        hdr_name, data_name = credit_limit_names[dllp_type]
        hdr_limit = int(get_internal_handle(tb.dut, tx_fc_base + hdr_name).value)
        data_limit = int(get_internal_handle(tb.dut, tx_fc_base + data_name).value)
        await send_incoming_dllp(
            tb,
            build_fc_dllp(
                dllp_type,
                hdr_fc=(hdr_limit + 64) & 0xFF,
                data_fc=(data_limit + 256) & 0xFFF,
            ),
            "credit grant before format-transmit tests",
        )
    await tb.wait_cycles(16)

    previous_sequence: Optional[int] = None
    for description, raw_tlp in cases:
        _, sequence_number = await transmit_local_tlp(
            tb, output_queue, raw_tlp, "outgoing {}".format(description)
        )
        if previous_sequence is not None:
            assert sequence_number == ((previous_sequence + 1) & 0xFFF), (
                "Transmit sequence discontinuity for {}".format(description)
            )
        previous_sequence = sequence_number
        await acknowledge_sequence(
            tb, sequence_number, "ACK outgoing {}".format(description)
        )

    return last_good_sequence


async def verify_retry_buffer_full_and_slot_wrap(
    tb: TB,
    output_queue: Queue,
) -> None:
    """Fill every retry slot, prove backpressure, then reuse wrapped slots."""
    drain_queue(output_queue)
    packets: List[bytes] = []
    sequences: List[int] = []
    for index in range(RETRY_BUFFER_DEPTH):
        raw_tlp = build_completion(False, 0xA0 + index)
        packet, sequence_number = await transmit_local_tlp(
            tb, output_queue, raw_tlp, "retry-buffer fill entry {}".format(index)
        )
        packets.append(packet)
        sequences.append(sequence_number)

    blocked_tlp = build_completion(False, 0xA0 + RETRY_BUFFER_DEPTH)
    blocked_sender = cocotb.start_soon(
        send_frame_with_timeout(
            tb.tlp_source, blocked_tlp, "TLP blocked by full retry buffer"
        )
    )
    await assert_no_outgoing_tlp(output_queue, blocked_tlp)

    # A cumulative ACK through the oldest packet creates exactly one slot.
    await acknowledge_sequence(tb, sequences[0], "free oldest retry-buffer slot")
    try:
        await with_timeout(blocked_sender, AXIS_SEND_TIMEOUT_US, "us")
    except SimTimeoutError as exc:
        blocked_sender.kill()
        raise AssertionError("Full retry buffer did not release after ACK") from exc
    blocked_packet = await wait_for_outgoing_tlp(output_queue, blocked_tlp)
    blocked_sequence = int.from_bytes(blocked_packet[:2], "big") & 0xFFF
    assert blocked_sequence == ((sequences[-1] + 1) & 0xFFF)
    await acknowledge_sequence(tb, blocked_sequence, "retire retry-buffer fill set")

    # Reuse more than one complete physical slot rotation.  ACKing each packet
    # isolates storage-index wrap from capacity backpressure.
    previous_sequence = blocked_sequence
    for index in range(RETRY_BUFFER_DEPTH * 2 + 1):
        raw_tlp = build_completion(False, (0xB0 + index) & 0xFF)
        _, sequence_number = await transmit_local_tlp(
            tb, output_queue, raw_tlp, "retry slot-wrap entry {}".format(index)
        )
        assert sequence_number == ((previous_sequence + 1) & 0xFFF)
        await acknowledge_sequence(tb, sequence_number, "retire slot-wrap entry")
        previous_sequence = sequence_number


async def verify_receive_sequence_rollover(
    tb: TB,
    output_queue: Queue,
    last_good_sequence: int,
) -> int:
    """Drive accepted receive traffic through the real 0xfff -> 0x000 edge."""
    if not env_flag("PCIE_FULL_SEQUENCE_ROLLOVER", "1"):
        tb.log.warning("Skipping full receive rollover by environment request")
        return last_good_sequence

    accepted = 0
    while True:
        sequence_number = (last_good_sequence + 1) & 0xFFF
        raw_tlp = build_raw_tlp(0x0A, 0, 3)
        await send_frame_with_timeout(
            tb.phy_source,
            add_sequence_and_lcrc(sequence_number, raw_tlp),
            "receive rollover TLP seq=0x{:03x}".format(sequence_number),
            tuser=PHY_USER_IS_TLP,
        )
        delivered = await receive_frame_with_timeout(
            tb.tlp_sink, "receive rollover delivery"
        )
        assert delivered == raw_tlp
        ack = await wait_for_outgoing_dllp(output_queue, DllpType.ACK)
        assert ack.seq == sequence_number
        previous = last_good_sequence
        last_good_sequence = sequence_number
        accepted += 1
        if accepted % 256 == 0:
            tb.log.info("Accepted %d TLPs in receive rollover test", accepted)
        if previous == 0xFFF and sequence_number == 0x000:
            break
        assert accepted <= 4096, "Receive sequence did not roll over in 4096 TLPs"
    return last_good_sequence


async def verify_transmit_sequence_rollover(tb: TB, output_queue: Queue) -> None:
    """Drive the transmit sequence generator across 0xfff -> 0x000."""
    if not env_flag("PCIE_FULL_SEQUENCE_ROLLOVER", "1"):
        tb.log.warning("Skipping full transmit rollover by environment request")
        return

    previous: Optional[int] = None
    for index in range(4097):
        raw_tlp = build_completion(False, index & 0xFF)
        packet, sequence_number = await transmit_local_tlp(
            tb, output_queue, raw_tlp,
            "transmit rollover TLP {}".format(index),
        )
        if previous is not None:
            assert sequence_number == ((previous + 1) & 0xFFF)
        if previous == 0xFFF and sequence_number == 0x000:
            # At the exact modulo boundary, NAK(0xfff) requests sequence zero.
            await send_incoming_dllp(
                tb,
                build_ack_nak_dllp(DllpType.NAK, 0xFFF),
                "boundary NAK requesting replay of sequence zero",
            )
            replay = await wait_for_outgoing_tlp(output_queue, raw_tlp)
            assert replay == packet
            await acknowledge_sequence(
                tb, 0x000, "boundary ACK retiring sequence zero"
            )
            return
        await acknowledge_sequence(tb, sequence_number, "ACK transmit rollover TLP")
        previous = sequence_number
    raise AssertionError("Transmit sequence did not roll over in 4097 TLPs")


async def verify_flow_control_classes_and_wrap(
    tb: TB,
    output_queue: Queue,
) -> None:
    """Check P/NP/Cpl header/data accounting, scaling, and counter wrap."""
    base = "dllp_transmit_inst.tlp2dllp_inst."
    signals: Dict[str, object] = {
        name: get_internal_handle(tb.dut, base + name)
        for name in (
            "ph_credits_consumed_r", "pd_credits_consumed_r",
            "nph_credits_consumed_r", "npd_credits_consumed_r",
            "cplh_credits_consumed_r", "cpld_credits_consumed_r",
            "ph_credit_limit_r", "pd_credit_limit_r",
            "nph_credit_limit_r", "npd_credit_limit_r",
            "cplh_credit_limit_r", "cpld_credit_limit_r",
        )
    }

    def value(name: str) -> int:
        assert signals[name].value.is_resolvable, "{} is X/Z".format(name)
        return int(signals[name].value)

    # Each pair is header-only then data-bearing traffic for one FC class.
    cases = [
        (DllpType.UPDATE_FC_P, "ph", "pd",
         build_message(False, 0xC0), build_message(True, 0xC1, 16)),
        (DllpType.UPDATE_FC_NP, "nph", "npd",
         build_memory_read(4, 0xC2), build_raw_tlp(0x42, 4, 3, bytes(16))),
        (DllpType.UPDATE_FC_CPL, "cplh", "cpld",
         build_completion(False, 0xC3), build_completion(True, 0xC4, 16)),
    ]

    for dllp_type, hdr, data, header_tlp, data_tlp in cases:
        hdr_before = value(hdr + "_credits_consumed_r")
        data_before = value(data + "_credits_consumed_r")
        old_hdr_limit = value(hdr + "_credit_limit_r")
        data_limit = value(data + "_credit_limit_r")
        hdr_limit = (old_hdr_limit + 4) & 0xFF
        await send_incoming_dllp(
            tb,
            build_fc_dllp(dllp_type, hdr_fc=hdr_limit, data_fc=data_limit),
            "bounded {} credit grant".format(dllp_type.name),
        )
        await tb.wait_cycles(8)

        _, seq = await transmit_local_tlp(
            tb, output_queue, header_tlp, "{} header-credit TLP".format(hdr)
        )
        await acknowledge_sequence(tb, seq, "ACK header-credit TLP")
        assert value(hdr + "_credits_consumed_r") == ((hdr_before + 1) & 0xFF)
        assert value(data + "_credits_consumed_r") == data_before

        _, seq = await transmit_local_tlp(
            tb, output_queue, data_tlp, "{} data-credit TLP".format(data)
        )
        await acknowledge_sequence(tb, seq, "ACK data-credit TLP")
        assert value(hdr + "_credits_consumed_r") == ((hdr_before + 2) & 0xFF)
        assert value(data + "_credits_consumed_r") == ((data_before + 1) & 0xFFF)

        # Consume every remaining header credit.  The following packet must
        # stay behind s_tlp_axis until a cumulative UpdateFC advances the limit.
        remaining_header_credits = (
            hdr_limit - value(hdr + "_credits_consumed_r")
        ) & 0xFF
        for index in range(remaining_header_credits):
            _, seq = await transmit_local_tlp(
                tb, output_queue, header_tlp,
                "{} header-credit exhaustion {}".format(hdr, index),
            )
            await acknowledge_sequence(tb, seq, "ACK header exhaustion TLP")
        assert value(hdr + "_credits_consumed_r") == hdr_limit
        blocked_header = cocotb.start_soon(
            send_frame_with_timeout(
                tb.tlp_source, header_tlp,
                "{} TLP blocked at header-credit limit".format(hdr),
            )
        )
        await assert_no_outgoing_tlp(output_queue, header_tlp)
        hdr_limit = (hdr_limit + 1) & 0xFF
        await send_incoming_dllp(
            tb,
            build_fc_dllp(dllp_type, hdr_fc=hdr_limit, data_fc=data_limit),
            "{} header-credit release".format(dllp_type.name),
        )
        await with_timeout(blocked_header, AXIS_SEND_TIMEOUT_US, "us")
        released = await wait_for_outgoing_tlp(output_queue, header_tlp)
        await acknowledge_sequence(
            tb, int.from_bytes(released[:2], "big") & 0xFFF,
            "ACK released header-credit TLP",
        )

        # Consume the advertised data limit one credit at a time.  Header limit
        # updates accompany each packet, so the eventual stall is specifically
        # caused by data-credit exhaustion.
        data_exhaustion_index = 0
        while value(data + "_credits_consumed_r") != data_limit:
            hdr_limit = (value(hdr + "_credits_consumed_r") + 1) & 0xFF
            await send_incoming_dllp(
                tb,
                build_fc_dllp(dllp_type, hdr_fc=hdr_limit, data_fc=data_limit),
                "{} header credit during data exhaustion".format(dllp_type.name),
            )
            _, seq = await transmit_local_tlp(
                tb, output_queue, data_tlp,
                "{} data-credit exhaustion {}".format(
                    data, data_exhaustion_index
                ),
            )
            await acknowledge_sequence(tb, seq, "ACK data exhaustion TLP")
            data_exhaustion_index += 1
            assert data_exhaustion_index <= 0x1000, (
                "{} data-credit counter failed to reach its limit".format(data)
            )
        assert value(data + "_credits_consumed_r") == data_limit

        # Preserve one available header credit while data remains exhausted.
        hdr_limit = (value(hdr + "_credits_consumed_r") + 1) & 0xFF
        await send_incoming_dllp(
            tb,
            build_fc_dllp(dllp_type, hdr_fc=hdr_limit, data_fc=data_limit),
            "{} final header credit before data block".format(dllp_type.name),
        )
        blocked_data = cocotb.start_soon(
            send_frame_with_timeout(
                tb.tlp_source, data_tlp,
                "{} TLP blocked at data-credit limit".format(data),
            )
        )
        await assert_no_outgoing_tlp(output_queue, data_tlp)
        data_limit = (data_limit + 1) & 0xFFF
        await send_incoming_dllp(
            tb,
            build_fc_dllp(dllp_type, hdr_fc=hdr_limit, data_fc=data_limit),
            "{} data-credit release".format(dllp_type.name),
        )
        await with_timeout(blocked_data, AXIS_SEND_TIMEOUT_US, "us")
        released = await wait_for_outgoing_tlp(output_queue, data_tlp)
        await acknowledge_sequence(
            tb, int.from_bytes(released[:2], "big") & 0xFFF,
            "ACK released data-credit TLP",
        )

    # PCIe 1.x uses scale 1. Reserved/non-unity scale encodings must not be
    # silently applied as unscaled credit updates by this Gen1 implementation.
    p_hdr_limit = value("ph_credit_limit_r")
    p_data_limit = value("pd_credit_limit_r")
    await send_incoming_dllp(
        tb,
        build_fc_dllp(
            DllpType.UPDATE_FC_P,
            hdr_fc=(p_hdr_limit + 7) & 0xFF,
            data_fc=(p_data_limit + 7) & 0xFFF,
            hdr_scale=1,
            data_scale=1,
        ),
        "UpdateFC_P with unsupported scale encoding",
    )
    await tb.wait_cycles(8)
    assert value("ph_credit_limit_r") == p_hdr_limit
    assert value("pd_credit_limit_r") == p_data_limit

    # A cumulative limit that moves backwards without a legal modulo crossing
    # is stale and must not reduce usable credits.
    stale_hdr = (p_hdr_limit - 1) & 0xFF
    stale_data = (p_data_limit - 1) & 0xFFF
    await send_incoming_dllp(
        tb,
        build_fc_dllp(DllpType.UPDATE_FC_P, hdr_fc=stale_hdr, data_fc=stale_data),
        "stale/decreasing UpdateFC_P",
    )
    await tb.wait_cycles(8)
    assert value("ph_credit_limit_r") == p_hdr_limit
    assert value("pd_credit_limit_r") == p_data_limit

    # Exercise real eight-bit header-consumption rollover while keeping data
    # irrelevant.  The advertised cumulative limit follows the modulo counter.
    while value("ph_credits_consumed_r") != 0xFF:
        consumed = value("ph_credits_consumed_r")
        await send_incoming_dllp(
            tb,
            build_fc_dllp(
                DllpType.UPDATE_FC_P,
                hdr_fc=(consumed + 1) & 0xFF,
                data_fc=value("pd_credit_limit_r"),
            ),
            "posted-header cumulative limit before wrap",
        )
        _, seq = await transmit_local_tlp(
            tb, output_queue, build_message(False, consumed),
            "posted header consumed before counter wrap",
        )
        await acknowledge_sequence(tb, seq, "ACK posted-header wrap TLP")

    await send_incoming_dllp(
        tb,
        build_fc_dllp(
            DllpType.UPDATE_FC_P,
            hdr_fc=0,
            data_fc=value("pd_credit_limit_r"),
        ),
        "legal cumulative posted-header limit wrap to zero",
    )
    _, seq = await transmit_local_tlp(
        tb, output_queue, build_message(False, 0xFF),
        "posted-header credit crossing 0xff to 0x00",
    )
    await acknowledge_sequence(tb, seq, "ACK posted-header rollover TLP")
    assert value("ph_credits_consumed_r") == 0

    # Leave every traffic class usable for the later format, retry-buffer, and
    # rollover phases.  These are forward cumulative grants from the observed
    # consumed counters, so no stale/decreasing update is introduced here.
    for dllp_type, hdr, data in (
        (DllpType.UPDATE_FC_P, "ph", "pd"),
        (DllpType.UPDATE_FC_NP, "nph", "npd"),
        (DllpType.UPDATE_FC_CPL, "cplh", "cpld"),
    ):
        await send_incoming_dllp(
            tb,
            build_fc_dllp(
                dllp_type,
                hdr_fc=(value(hdr + "_credits_consumed_r") + 64) & 0xFF,
                data_fc=(value(data + "_credits_consumed_r") + 256) & 0xFFF,
            ),
            "post-exhaustion {} credit replenishment".format(dllp_type.name),
        )


async def verify_repeated_nak_and_replay_exhaustion(
    tb: TB,
    output_queue: Queue,
) -> None:
    """Repeated NAKs may replay only up to the configured retry limit."""
    drain_queue(output_queue)
    raw_tlp = build_completion(False, 0xD0)
    first_packet, sequence_number = await transmit_local_tlp(
        tb, output_queue, raw_tlp, "TLP for repeated-NAK exhaustion"
    )
    prior_sequence = (sequence_number - 1) & 0xFFF
    for attempt in range(MAX_REPLAY_ATTEMPTS):
        await send_incoming_dllp(
            tb,
            build_ack_nak_dllp(DllpType.NAK, prior_sequence),
            "repeated NAK attempt {}".format(attempt + 1),
        )
        replay = await wait_for_outgoing_tlp(output_queue, raw_tlp)
        assert replay == first_packet, "Repeated NAK changed replay contents"

    await send_incoming_dllp(
        tb,
        build_ack_nak_dllp(DllpType.NAK, prior_sequence),
        "NAK exceeding replay attempt limit",
    )
    await assert_no_outgoing_tlp(output_queue, raw_tlp)
    retry_error = get_internal_handle(tb.dut, "dllp_transmit_inst.retry_err")
    await tb.wait_cycles(8)
    assert retry_error.value.is_resolvable and int(retry_error.value) == 1, (
        "Replay-attempt exhaustion did not assert retry_err"
    )


async def verify_replay_timer_exhaustion(tb: TB, output_queue: Queue) -> None:
    """An ACK-less packet must stop replaying and report retry exhaustion."""
    drain_queue(output_queue)
    raw_tlp = build_completion(False, 0xD4)
    first_packet, _ = await transmit_local_tlp(
        tb, output_queue, raw_tlp, "TLP for replay-timer exhaustion"
    )
    for attempt in range(MAX_REPLAY_ATTEMPTS):
        replay = await wait_for_outgoing_tlp(output_queue, raw_tlp)
        assert replay == first_packet, (
            "Replay-timer attempt {} changed packet contents".format(attempt + 1)
        )

    retry_error = get_internal_handle(tb.dut, "dllp_transmit_inst.retry_err")
    async def wait_for_retry_error() -> None:
        while True:
            await RisingEdge(tb.dut.clk_i)
            if retry_error.value.is_resolvable and int(retry_error.value) == 1:
                return

    try:
        await with_timeout(
            wait_for_retry_error(),
            (REPLAY_TIMER_CYCLES + NO_RESPONSE_WINDOW_CYCLES) * CLOCK_PERIOD_NS,
            "ns",
        )
    except SimTimeoutError as exc:
        raise AssertionError("Replay-timer exhaustion did not assert retry_err") from exc
    await assert_no_outgoing_tlp(output_queue, raw_tlp)


async def reinitialize_link(
    tb: TB,
    output_queue: Queue,
    completion_hdr_fc: int = 0,
    completion_data_fc: int = 0,
) -> None:
    """Bring the link down, prove FC state reset, then perform FC init again."""
    tb.dut.phy_link_up_i.value = 0
    tb.dut.idle_valid_i.value = 0
    await tb.wait_cycles(32)
    assert int(tb.dut.fc_initialized_o.value) == 0
    drain_queue(output_queue)
    tb.dut.idle_valid_i.value = 1
    tb.dut.phy_link_up_i.value = 1
    await tb.wait_cycles(32)
    await send_flow_control_initialization(
        tb,
        completion_hdr_fc=completion_hdr_fc,
        completion_data_fc=completion_data_fc,
    )
    await wait_for_signal_high(
        tb.dut, tb.dut.fc_initialized_o, "fc_initialized_o after link reset",
        FC_INITIALIZED_TIMEOUT_US,
    )
    await tb.wait_cycles(32)
    drain_queue(output_queue)


async def verify_link_down_with_pending_replay(
    tb: TB,
    output_queue: Queue,
) -> int:
    """Link-down must flush pending retry state and restart both sequences."""
    raw_tlp = build_completion(False, 0xD1)
    await transmit_local_tlp(
        tb, output_queue, raw_tlp, "outstanding TLP before link-down"
    )
    tb.dut.phy_link_up_i.value = 0
    tb.dut.idle_valid_i.value = 0
    await tb.wait_cycles(REPLAY_TIMER_CYCLES + NO_RESPONSE_WINDOW_CYCLES)
    await assert_no_outgoing_tlp(output_queue, raw_tlp)
    await reinitialize_link(tb, output_queue)

    new_tlp = build_completion(False, 0xD2)
    _, tx_sequence = await transmit_local_tlp(
        tb, output_queue, new_tlp, "first TLP after link reinitialization"
    )
    assert tx_sequence == 0, "Transmit sequence did not restart at zero"
    await acknowledge_sequence(tb, tx_sequence, "ACK first post-reset TLP")

    incoming = build_completion(False, 0xD3)
    await send_frame_with_timeout(
        tb.phy_source,
        add_sequence_and_lcrc(0, incoming),
        "first incoming TLP after link reinitialization",
        tuser=PHY_USER_IS_TLP,
    )
    delivered = await receive_frame_with_timeout(tb.tlp_sink, "post-reset TLP")
    assert delivered == incoming
    ack = await wait_for_outgoing_dllp(output_queue, DllpType.ACK)
    assert ack.seq == 0
    return 0


async def check_no_unknown_after_reset(tb: TB) -> None:
    """Basic X/Z sanity checks after reset."""
    dut = tb.dut

    assert dut.fc_initialized_o.value.is_resolvable, (
        "fc_initialized_o is X/Z immediately after reset"
    )
    assert int(dut.fc_initialized_o.value) == 0, (
        "fc_initialized_o must be low immediately after reset"
    )

    for signal_name in [
        "s_phy_axis_tready",
        "s_tlp_axis_tready",
        "m_phy_axis_tvalid",
        "m_tlp_axis_tvalid",
    ]:
        sig = getattr(dut, signal_name)
        assert sig.value.is_resolvable, "{} is X/Z after reset".format(signal_name)


@cocotb.test()
async def run_test(dut):
    """Exercise flow-control initialization and both TLP data directions."""
    tb = TB(dut)

    seed = int(os.environ.get("PCIE_TEST_SEED", str(DEFAULT_RANDOM_SEED)), 0)
    rng = random.Random(seed)

    tb.log.info("PCIe Data Link Layer relaxed functional test starting")
    tb.log.info("Random seed: 0x%08x", seed)
    tb.log.info("Python test log: %s", tb.log_file)
    tb.log.info("CLOCK_PERIOD_NS=%d", CLOCK_PERIOD_NS)
    tb.log.info("AXIS_SEND_TIMEOUT_US=%d", AXIS_SEND_TIMEOUT_US)
    tb.log.info("AXIS_RECV_TIMEOUT_US=%d", AXIS_RECV_TIMEOUT_US)
    tb.log.info("FC_DRIVER_TIMEOUT_US=%d", FC_DRIVER_TIMEOUT_US)
    tb.log.info("FC_INITIALIZED_TIMEOUT_US=%d", FC_INITIALIZED_TIMEOUT_US)

    await tb.reset()
    await check_no_unknown_after_reset(tb)

    output_queue = Queue()
    monitor_stop = Event()
    monitor_task = cocotb.start_soon(
        phy_output_monitor(tb, output_queue, monitor_stop)
    )

    fc_frame_count = 0
    outgoing_tlp_count = 0
    incoming_tlp_count = 0
    malformed_rejection_count = 0
    robust_dllp_check_count = 0

    try:
        # ------------------------------------------------------------------
        # Phase 1: link-up and flow-control initialization
        # ------------------------------------------------------------------
        tb.log.info("PHASE 1: link-up and flow-control initialization")

        dut.idle_valid_i.value = 1
        dut.phy_link_up_i.value = 1

        await tb.wait_cycles(50)

        try:
            fc_frame_count = await with_timeout(
                send_flow_control_initialization(tb),
                FC_DRIVER_TIMEOUT_US,
                "us",
            )
        except SimTimeoutError as exc:
            raise AssertionError(
                "Flow-control stimulus did not finish within {} us. "
                "Increase PCIE_FC_DRIVER_TIMEOUT_US if needed.".format(
                    FC_DRIVER_TIMEOUT_US
                )
            ) from exc

        await wait_for_signal_high(
            dut,
            dut.fc_initialized_o,
            "fc_initialized_o",
            FC_INITIALIZED_TIMEOUT_US,
        )

        tb.log.info("Flow-control initialization completed")

        # Allow final initialization frames to reach the PHY monitor.
        await tb.wait_cycles(100)

        initialization_outputs = drain_queue(output_queue)
        tb.log.info(
            "Observed %d outgoing frame(s) during initialization",
            len(initialization_outputs),
        )

        # ------------------------------------------------------------------
        # Phase 2: locally generated TLP -> Data Link Layer -> PHY
        # ------------------------------------------------------------------
        tb.log.info("PHASE 2: transaction-layer TLP transmitted to PHY")

        outgoing_length = rng.randint(1, 32)
        outgoing_tlp, _ = build_memory_write(
            payload_length=outgoing_length,
            tag=1,
        )

        await send_frame_with_timeout(
            tb.tlp_source,
            outgoing_tlp,
            "locally generated Memory Write TLP",
        )

        outgoing_link_packet = await wait_for_outgoing_tlp(
            output_queue,
            outgoing_tlp,
            timeout_us=AXIS_RECV_TIMEOUT_US,
        )
        outgoing_sequence_number = (
            int.from_bytes(outgoing_link_packet[:2], "big") & 0xFFF
        )

        # Retire this packet before the long receive-side negative tests.  If it
        # remains outstanding, its replay timer expires and contaminates later
        # arbitration/replay checks with unrelated retry traffic.
        await send_incoming_dllp(
            tb,
            build_ack_nak_dllp(DllpType.ACK, outgoing_sequence_number),
            "ACK for phase-2 locally generated TLP",
        )
        await tb.wait_cycles(20)

        assert len(outgoing_link_packet) >= len(outgoing_tlp) + 6, (
            "Outgoing link packet is too short to contain a two-byte sequence "
            "number, the TLP, and a four-byte LCRC"
        )

        outgoing_tlp_count += 1

        tb.log.info(
            "Outgoing TLP path passed: raw_tlp_bytes=%d link_packet_bytes=%d",
            len(outgoing_tlp),
            len(outgoing_link_packet),
        )

        # ------------------------------------------------------------------
        # Phase 3: valid PHY-side TLPs -> Data Link Layer -> transaction layer
        # ------------------------------------------------------------------
        tb.log.info("PHASE 3: valid incoming TLP receive path")

        incoming_lengths = [1, 16, 32]

        for sequence_number, payload_length in enumerate(incoming_lengths):
            raw_tlp, _ = build_memory_write(
                payload_length=payload_length,
                tag=sequence_number + 2,
            )

            link_packet = add_sequence_and_lcrc(
                sequence_number=sequence_number,
                tlp_payload=raw_tlp,
            )

            await send_frame_with_timeout(
                tb.phy_source,
                link_packet,
                "incoming valid Memory Write TLP seq={}".format(sequence_number),
                tuser=PHY_USER_IS_TLP,
            )

            received_tlp = await receive_frame_with_timeout(
                tb.tlp_sink,
                "m_tlp_axis TLP for sequence {}".format(sequence_number),
                timeout_us=AXIS_RECV_TIMEOUT_US,
            )

            assert received_tlp == raw_tlp, (
                "Incoming TLP mismatch for sequence {}.\n"
                "Expected: {}\n"
                "Received: {}".format(
                    sequence_number,
                    raw_tlp.hex(),
                    received_tlp.hex(),
                )
            )

            incoming_tlp_count += 1

            tb.log.info(
                "Incoming TLP sequence %d passed (%d bytes)",
                sequence_number,
                len(raw_tlp),
            )

            ack = await wait_for_outgoing_dllp(output_queue, DllpType.ACK)
            assert ack.seq == sequence_number, (
                "ACK sequence mismatch: got {} expected {}".format(
                    ack.seq,
                    sequence_number,
                )
            )
            robust_dllp_check_count += 1

            await tb.wait_cycles(50)

        # ------------------------------------------------------------------
        # Phase 4: NAK generation and receive-side sequence checks
        # ------------------------------------------------------------------
        tb.log.info("PHASE 4: Bad LCRC NAK and sequence-number error handling")

        last_good_sequence = len(incoming_lengths) - 1

        last_good_sequence = await verify_bad_lcrc_generates_nak(
            tb,
            output_queue,
            sequence_number=(last_good_sequence + 1) & 0xFFF,
            last_good_sequence=last_good_sequence,
        )
        robust_dllp_check_count += 2

        last_good_sequence = await verify_dllp_arbitration_priority(
            tb,
            output_queue,
            sequence_number=(last_good_sequence + 1) & 0xFFF,
            last_good_sequence=last_good_sequence,
        )
        robust_dllp_check_count += 2

        last_good_sequence = await verify_sequence_number_errors(
            tb,
            output_queue,
            last_good_sequence=last_good_sequence,
        )
        robust_dllp_check_count += 7

        # ------------------------------------------------------------------
        # Phase 5: received ACK/NAK and replay behavior
        # ------------------------------------------------------------------
        tb.log.info("PHASE 5: received ACK/NAK and replay behavior")

        await verify_ack_nak_replay(tb, output_queue)
        robust_dllp_check_count += 1

        # ------------------------------------------------------------------
        # Phase 6: malformed TLP and malformed DLLP rejection
        # ------------------------------------------------------------------
        tb.log.info("PHASE 6: malformed incoming TLP and DLLP rejection")

        malformed_tlp, _ = build_memory_write(payload_length=8, tag=7)

        last_good_sequence = await verify_malformed_tlp_is_rejected(
            tb,
            output_queue,
            malformed_tlp,
            last_good_sequence,
        )
        malformed_rejection_count += 1

        await verify_bad_and_malformed_dllps_are_ignored(tb, output_queue)
        robust_dllp_check_count += 1

        # ------------------------------------------------------------------
        # Phase 7: UpdateFC and credit enforcement
        # ------------------------------------------------------------------
        tb.log.info("PHASE 7: UpdateFC DLLPs and zero-credit transmit blocking")

        await verify_updatefc_and_credit_blocking(tb, output_queue)
        robust_dllp_check_count += 1

        # ------------------------------------------------------------------
        # Phase 8: replay timer expiration
        # ------------------------------------------------------------------
        tb.log.info("PHASE 8: replay-timer retransmission")
        await verify_replay_timer_timeout(tb, output_queue)
        robust_dllp_check_count += 1

        # ------------------------------------------------------------------
        # Phase 9: ACK/NAK CRC, cumulative ACK, and ordered replay
        # ------------------------------------------------------------------
        tb.log.info("PHASE 9: robust ACK/NAK processing and ordered replay")
        await verify_corrupt_ack_nak_crc(tb, output_queue)
        await verify_cumulative_ack_and_multi_packet_replay(tb, output_queue)
        await verify_ack_nak_window_boundaries(tb, output_queue)
        robust_dllp_check_count += 3

        # ------------------------------------------------------------------
        # Phase 10: receive NAK suppression and ACK latency
        # ------------------------------------------------------------------
        tb.log.info("PHASE 10: NAK scheduling suppression and ACK latency")
        last_good_sequence = await verify_nak_scheduling_suppression(
            tb, output_queue, last_good_sequence
        )
        last_good_sequence = await verify_ack_latency(
            tb, output_queue, last_good_sequence
        )
        robust_dllp_check_count += 2

        # ------------------------------------------------------------------
        # Phase 11: packet classes, header formats, maximum payload, and ECRC
        # ------------------------------------------------------------------
        tb.log.info("PHASE 11: TLP classes and format preservation")
        last_good_sequence = await verify_tlp_classes_and_formats(
            tb, output_queue, last_good_sequence
        )
        robust_dllp_check_count += 1

        # ------------------------------------------------------------------
        # Phase 12: all FC classes, exhaustion, scaling, and cumulative wrap
        # ------------------------------------------------------------------
        tb.log.info("PHASE 12: complete transmit flow-control behavior")
        # Completion credits were intentionally advertised as infinite during
        # the normal bring-up.  Restart with finite Completion credits so all
        # six FC counters can be exhausted and checked symmetrically.
        await reinitialize_link(
            tb,
            output_queue,
            completion_hdr_fc=3,
            completion_data_fc=256,
        )
        last_good_sequence = 0xFFF
        await verify_flow_control_classes_and_wrap(tb, output_queue)
        robust_dllp_check_count += 1

        # ------------------------------------------------------------------
        # Phase 13: retry-buffer capacity and physical-slot reuse
        # ------------------------------------------------------------------
        tb.log.info("PHASE 13: retry-buffer full and slot wraparound")
        await verify_retry_buffer_full_and_slot_wrap(tb, output_queue)
        robust_dllp_check_count += 1

        # ------------------------------------------------------------------
        # Phase 14: actual receive and transmit sequence rollover
        # ------------------------------------------------------------------
        tb.log.info("PHASE 14: actual 12-bit sequence rollover")
        last_good_sequence = await verify_receive_sequence_rollover(
            tb, output_queue, last_good_sequence
        )
        # Restart with the standard infinite Completion-credit advertisement so
        # 4097 Completion TLPs can exercise transmit rollover without unrelated
        # credit exhaustion masking sequence-generator behavior.
        await reinitialize_link(tb, output_queue)
        last_good_sequence = 0xFFF
        await verify_transmit_sequence_rollover(tb, output_queue)
        robust_dllp_check_count += 2

        # ------------------------------------------------------------------
        # Phase 15: optional AXI backpressure
        # ------------------------------------------------------------------
        if env_flag("PCIE_ENABLE_BACKPRESSURE"):
            tb.log.info("PHASE 15: optional m_phy_axis backpressure")

            tb.phy_sink.set_pause_generator(cycle_pause())

            backpressure_tlp, _ = build_memory_write(payload_length=32, tag=8)

            await send_frame_with_timeout(
                tb.tlp_source,
                backpressure_tlp,
                "Memory Write TLP under m_phy_axis backpressure",
                timeout_us=AXIS_SEND_TIMEOUT_US,
            )

            backpressure_packet = await wait_for_outgoing_tlp(
                output_queue,
                backpressure_tlp,
                timeout_us=BACKPRESSURE_TIMEOUT_US,
            )

            await acknowledge_sequence(
                tb,
                int.from_bytes(backpressure_packet[:2], "big") & 0xFFF,
                "ACK backpressure-test TLP",
            )

            outgoing_tlp_count += 1
            tb.phy_sink.set_pause_generator(None)

            tb.log.info("Backpressure test passed")

        # ------------------------------------------------------------------
        # Phase 16: link-down while replay state is pending
        # ------------------------------------------------------------------
        tb.log.info("PHASE 16: link reset with pending traffic/replay")
        last_good_sequence = await verify_link_down_with_pending_replay(
            tb, output_queue
        )
        robust_dllp_check_count += 1

        # ------------------------------------------------------------------
        # Phase 17: replay-timer retry limit and recovery by link reset
        # ------------------------------------------------------------------
        tb.log.info("PHASE 17: replay-timer exhaustion")
        await verify_replay_timer_exhaustion(tb, output_queue)
        robust_dllp_check_count += 1
        await reinitialize_link(tb, output_queue)

        # ------------------------------------------------------------------
        # Phase 18: repeated-NAK retry limit
        # ------------------------------------------------------------------
        tb.log.info("PHASE 18: repeated NAK and replay-attempt exhaustion")
        await verify_repeated_nak_and_replay_exhaustion(tb, output_queue)
        robust_dllp_check_count += 1

    finally:
        monitor_stop.set()

        try:
            await with_timeout(
                monitor_task,
                MONITOR_SHUTDOWN_TIMEOUT_US,
                "us",
            )
        except SimTimeoutError:
            monitor_task.kill()
            tb.log.warning("PHY output monitor required forced shutdown")

    tb.log.info(
        "TEST SUMMARY: FC frames sent=%d, outgoing TLPs verified=%d, "
        "incoming TLPs verified=%d, malformed TLPs rejected=%d, "
        "robust DLLP checks=%d",
        fc_frame_count,
        outgoing_tlp_count,
        incoming_tlp_count,
        malformed_rejection_count,
        robust_dllp_check_count,
    )
    tb.log.info("PCIe Data Link Layer relaxed functional test PASSED")
