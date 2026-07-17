import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, Timer


def dw0(fmt, tlp_type, length=1, td=0, tc=0, attr=0):
    encoded = 0 if length == 1024 else length
    return (
        (fmt << 5) | tlp_type | ((attr & 1) << 10) | (tc << 12)
        | (((encoded >> 8) & 3) << 16) | (((attr >> 1) & 3) << 20)
        | (td << 23) | ((encoded & 0xFF) << 24)
    )


async def reset(dut):
    dut.rst_i.value = 1
    dut.s_axis_tvalid.value = 0
    dut.s_axis_tdata.value = 0
    dut.s_axis_tkeep.value = 0xF
    dut.s_axis_tlast.value = 0
    dut.s_axis_tuser.value = 0
    dut.header_ready.value = 0
    dut.payload_tready.value = 0
    for _ in range(3):
        await RisingEdge(dut.clk_i)
    dut.rst_i.value = 0
    await RisingEdge(dut.clk_i)


async def send_beat(dut, data, last=False, keep=0xF, gaps=0):
    for _ in range(gaps):
        dut.s_axis_tvalid.value = 0
        await RisingEdge(dut.clk_i)
    dut.s_axis_tdata.value = data
    dut.s_axis_tkeep.value = keep
    dut.s_axis_tlast.value = last
    dut.s_axis_tvalid.value = 1
    for _ in range(30):
        await RisingEdge(dut.clk_i)
        if int(dut.s_axis_tready.value):
            await Timer(1, units="ps")
            dut.s_axis_tvalid.value = 0
            return
    raise AssertionError("parser input handshake timeout")


async def accept_header(dut):
    for _ in range(30):
        await RisingEdge(dut.clk_i)
        if int(dut.header_valid.value):
            snapshot = {
                "fmt": int(dut.header_fmt.value), "type": int(dut.header_type.value),
                "length": int(dut.header_length_dw.value), "requester": int(dut.header_requester_id.value),
                "completer": int(dut.header_completer_id.value), "tag": int(dut.header_tag.value),
                "address": int(dut.header_address.value), "status": int(dut.header_status.value),
                "count": int(dut.header_byte_count.value), "lower": int(dut.header_lower_address.value),
                "prefix": int(dut.header_prefix_present.value),
            }
            dut.header_ready.value = 1
            await RisingEdge(dut.clk_i)
            dut.header_ready.value = 0
            return snapshot
    raise AssertionError("parser header timeout")


@cocotb.test()
async def all_three_packet_classes_and_timing(dut):
    cocotb.start_soon(Clock(dut.clk_i, 10, units="ns").start())
    await reset(dut)

    # Posted MWr32 with valid gaps and payload backpressure.
    await send_beat(dut, dw0(2, 0, 2), gaps=2)
    await send_beat(dut, (0x1234 << 16) | (0x5A << 8) | 0xFF, gaps=1)
    await send_beat(dut, 0x1000)
    header = await accept_header(dut)
    assert header == {**header, "fmt": 2, "type": 0, "length": 2, "requester": 0x1234,
                      "tag": 0x5A, "address": 0x1000}
    await send_beat(dut, 0x44332211)
    # Hold payload stalled and ensure data is stable.
    for _ in range(3):
        await RisingEdge(dut.clk_i)
        assert int(dut.payload_tvalid.value) == 1
        assert int(dut.payload_tdata.value) == 0x44332211
    dut.payload_tready.value = 1
    observed = []
    await RisingEdge(dut.clk_i)
    assert int(dut.payload_tvalid.value) == 1
    observed.append((int(dut.payload_tdata.value), int(dut.payload_tlast.value)))
    await send_beat(dut, 0x88776655, last=True)
    for _ in range(4):
        await RisingEdge(dut.clk_i)
        if int(dut.payload_tvalid.value):
            observed.append((int(dut.payload_tdata.value), int(dut.payload_tlast.value)))
            break
    assert observed == [(0x44332211, 0), (0x88776655, 1)]
    dut.payload_tready.value = 0

    # Non-posted MRd64, no payload.
    await send_beat(dut, dw0(1, 0, 4))
    await send_beat(dut, (0xBEEF << 16) | (0x22 << 8) | 0xFF)
    await send_beat(dut, 0x00000001)
    await send_beat(dut, 0x23456000, last=True)
    header = await accept_header(dut)
    assert header["fmt"] == 1 and header["length"] == 4
    assert header["address"] == 0x0000000123456000

    # CplD with one payload DW.
    await send_beat(dut, dw0(2, 10, 1))
    await send_beat(dut, (0xCAFE << 16) | 4)
    await send_beat(dut, (0xBEEF << 16) | (0x22 << 8) | 0x40)
    header = await accept_header(dut)
    assert header["completer"] == 0xCAFE and header["requester"] == 0xBEEF
    assert header["count"] == 4 and header["lower"] == 0x40
    dut.payload_tready.value = 1
    await send_beat(dut, 0xDEADBEEF, last=True)
    for _ in range(4):
        await RisingEdge(dut.clk_i)
        if int(dut.payload_tvalid.value):
            assert int(dut.payload_tdata.value) == 0xDEADBEEF
            assert int(dut.payload_tlast.value) == 1
            break
    else:
        raise AssertionError("completion payload missing")


@cocotb.test()
async def malformed_frames_and_recovery(dut):
    cocotb.start_soon(Clock(dut.clk_i, 10, units="ns").start())
    await reset(dut)

    # Header with partial keep must be rejected and flagged.
    await send_beat(dut, dw0(0, 0, 1), last=True, keep=0x7)
    assert int(dut.malformed.value) == 1
    await RisingEdge(dut.clk_i)

    # Prefix without a following header.
    await send_beat(dut, 0x00000080, last=True)
    assert int(dut.malformed.value) == 1
    await RisingEdge(dut.clk_i)

    # Truncated 3DW header.
    await send_beat(dut, dw0(0, 0, 1))
    await send_beat(dut, (1 << 16) | 0xF, last=True)
    assert int(dut.malformed.value) == 1
    await RisingEdge(dut.clk_i)

    # Payload ends earlier than the advertised length.
    await send_beat(dut, dw0(2, 0, 2))
    await send_beat(dut, (1 << 16) | 0xFF)
    await send_beat(dut, 0x2000)
    await accept_header(dut)
    dut.payload_tready.value = 1
    await send_beat(dut, 0xA5A5A5A5, last=True)
    assert int(dut.malformed.value) == 1
    for _ in range(3):
        await RisingEdge(dut.clk_i)

    # Recovery: a legal no-data completion is accepted after all malformed cases.
    await send_beat(dut, dw0(0, 10, 0))
    await send_beat(dut, (0x1111 << 16))
    await send_beat(dut, (0x2222 << 16) | (3 << 8), last=True)
    header = await accept_header(dut)
    assert header["type"] == 10 and header["length"] == 0


@cocotb.test()
async def prefix_digest_and_reset_mid_packet(dut):
    cocotb.start_soon(Clock(dut.clk_i, 10, units="ns").start())
    await reset(dut)
    await send_beat(dut, 0xAABBCC80)
    await send_beat(dut, dw0(2, 0, 1, td=1))
    await send_beat(dut, (1 << 16) | 0xF)
    await send_beat(dut, 0x3000)
    header = await accept_header(dut)
    assert header["prefix"] == 1
    dut.payload_tready.value = 1
    await send_beat(dut, 0x01020304)
    await send_beat(dut, 0x89ABCDEF, last=True)
    for _ in range(5):
        await RisingEdge(dut.clk_i)
    assert int(dut.header_digest.value) == 0x89ABCDEF

    # Reset while a second header is incomplete, then confirm idle recovery.
    await send_beat(dut, dw0(3, 0, 1))
    dut.rst_i.value = 1
    await RisingEdge(dut.clk_i)
    dut.rst_i.value = 0
    await RisingEdge(dut.clk_i)
    assert int(dut.header_valid.value) == 0
    assert int(dut.payload_tvalid.value) == 0
