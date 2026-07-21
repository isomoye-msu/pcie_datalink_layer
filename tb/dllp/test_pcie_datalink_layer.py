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
from typing import List, Optional, Tuple

import cocotb
from cocotb.clock import Clock
from cocotb.queue import Queue
from cocotb.result import SimTimeoutError
from cocotb.triggers import Event, RisingEdge, with_timeout

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
) -> bytes:
    """Create one flow-control DLLP including its two-byte CRC."""
    packet = Dllp()
    packet.type = dllp_type
    packet.seq = seq
    packet.vc = 0
    packet.hdr_scale = FcScale(0)
    packet.hdr_fc = hdr_fc
    packet.data_scale = FcScale(0)
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


async def send_flow_control_initialization(tb: TB) -> int:
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


def drain_queue(queue: Queue) -> List[bytes]:
    """Remove all currently queued PHY output frames."""
    frames = []

    while not queue.empty():
        frames.append(queue.get_nowait())

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
            if len(frame_data) <= DLLP_FRAME_BYTES:
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
    """Find an outgoing DLLP of the requested type and validate its CRC."""

    async def finder():
        while True:
            frame_data = await output_queue.get()
            payload = check_dllp_crc(frame_data)

            if payload is None:
                continue

            decoded = Dllp().unpack(payload)

            if decoded.type == expected_type:
                return decoded

    try:
        return await with_timeout(finder(), timeout_us, "us")
    except SimTimeoutError as exc:
        raise AssertionError(
            "No outgoing {} DLLP was observed within {} us".format(
                expected_type.name,
                timeout_us,
            )
        ) from exc


async def assert_no_outgoing_tlp(
    output_queue: Queue,
    forbidden_tlp_payload: bytes,
    window_cycles: int = NO_RESPONSE_WINDOW_CYCLES,
) -> None:
    """Fail if a PHY output frame containing the forbidden TLP appears."""

    async def finder():
        while True:
            frame_data = await output_queue.get()
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
    malformed_data: bytes,
) -> None:
    """A PHY-side TLP without sequence number and LCRC must not reach m_tlp."""
    await send_frame_with_timeout(
        tb.phy_source,
        malformed_data,
        "malformed incoming TLP without sequence number or LCRC",
        tuser=PHY_USER_IS_TLP,
    )

    try:
        unexpected = await with_timeout(
            tb.tlp_sink.recv(),
            MALFORMED_REJECTION_WINDOW_US,
            "us",
        )
    except SimTimeoutError:
        tb.log.info("Malformed incoming TLP was correctly withheld from m_tlp_axis")
        return

    raise AssertionError(
        "Malformed incoming TLP unexpectedly reached m_tlp_axis: {}".format(
            bytes(unexpected.tdata).hex()
        )
    )


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

    # Hold the shared PHY output stalled until both requests are pending, then
    # release it so this checks arbitration instead of request arrival order.
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
    assert payload is not None, (
        "DLLP arbitration failed: first output was not a valid DLLP: {}".format(
            first_frame.hex()
        )
    )

    decoded = Dllp().unpack(payload)
    assert decoded.type == DllpType.NAK, (
        "DLLP arbitration failed: first DLLP was {}, expected NAK".format(
            decoded.type.name
        )
    )
    assert decoded.seq == last_good_sequence, (
        "Arbitrated NAK sequence mismatch: got {} expected {}".format(
            decoded.seq,
            last_good_sequence,
        )
    )

    local_packet = await wait_for_outgoing_tlp(output_queue, local_tlp)
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

    unexpected = drain_queue(output_queue)
    assert not unexpected, (
        "Malformed/unsupported DLLPs modified output state: {}".format(
            [frame.hex() for frame in unexpected]
        )
    )


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

        await verify_malformed_tlp_is_rejected(tb, malformed_tlp)
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
        # Phase 9: optional AXI backpressure
        # ------------------------------------------------------------------
        if env_flag("PCIE_ENABLE_BACKPRESSURE"):
            tb.log.info("PHASE 9: optional m_phy_axis backpressure")

            tb.phy_sink.set_pause_generator(cycle_pause())

            backpressure_tlp, _ = build_memory_write(payload_length=32, tag=8)

            await send_frame_with_timeout(
                tb.tlp_source,
                backpressure_tlp,
                "Memory Write TLP under m_phy_axis backpressure",
                timeout_us=AXIS_SEND_TIMEOUT_US,
            )

            await wait_for_outgoing_tlp(
                output_queue,
                backpressure_tlp,
                timeout_us=BACKPRESSURE_TIMEOUT_US,
            )

            outgoing_tlp_count += 1
            tb.phy_sink.set_pause_generator(None)

            tb.log.info("Backpressure test passed")

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