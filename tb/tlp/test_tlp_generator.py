import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, Timer


async def reset(dut):
    dut.rst_i.value = 1
    dut.header_valid.value = 0
    dut.payload_tvalid.value = 0
    dut.m_axis_tready.value = 0
    for handle in dut:
        if handle._name.startswith("in_"):
            handle.value = 0
    for _ in range(3):
        await RisingEdge(dut.clk_i)
    dut.rst_i.value = 0
    await RisingEdge(dut.clk_i)


async def send_header(dut, **fields):
    for name, value in fields.items():
        getattr(dut, f"in_{name}").value = value
    dut.header_valid.value = 1
    while not int(dut.header_ready.value):
        await RisingEdge(dut.clk_i)
    await RisingEdge(dut.clk_i)
    dut.header_valid.value = 0


async def send_payload(dut, words):
    for index, (data, keep) in enumerate(words):
        dut.payload_tdata.value = data
        dut.payload_tkeep.value = keep
        dut.payload_tlast.value = index == len(words) - 1
        dut.payload_tvalid.value = 1
        await Timer(1, units="ps")
        while not int(dut.payload_tready.value):
            await RisingEdge(dut.clk_i)
            await Timer(1, units="ps")
        await RisingEdge(dut.clk_i)
        await Timer(1, units="ps")
        dut.payload_tvalid.value = 0


async def collect(dut, count, stalls=(1,)):
    result = []
    cycle = 0
    while len(result) < count:
        dut.m_axis_tready.value = stalls[cycle % len(stalls)]
        await Timer(1, units="ps")
        fire = int(dut.m_axis_tvalid.value) and int(dut.m_axis_tready.value)
        value = (int(dut.m_axis_tdata.value), int(dut.m_axis_tkeep.value),
                 int(dut.m_axis_tlast.value))
        await RisingEdge(dut.clk_i)
        await Timer(1, units="ps")
        if fire:
            result.append(value)
        cycle += 1
        assert cycle < 200
    return result


def expected_dw0(fmt, tlp_type, length, tc=0, attr=0, digest=0):
    enc = 0 if length == 1024 else length
    return ((fmt << 5) | tlp_type | ((attr & 1) << 10) | (tc << 12)
            | (((enc >> 8) & 3) << 16) | (((attr >> 1) & 3) << 20)
            | (digest << 23) | ((enc & 0xFF) << 24))


@cocotb.test()
async def request_headers_prefix_payload_digest_and_stalls(dut):
    cocotb.start_soon(Clock(dut.clk_i, 10, units="ns").start())
    await reset(dut)
    collector = cocotb.start_soon(collect(dut, 7, stalls=(0, 0, 1, 0, 1)))
    await send_header(dut, fmt=2, type=0, tc=3, attr=5, length_dw=2,
                      requester_id=0x1234, tag=0x56, first_be=0xE, last_be=0xF,
                      address=0x1001, prefix_present=1, prefix=0xAABBCC80,
                      digest_present=1, digest=0xDEADBEEF)
    await send_payload(dut, [(0x44332211, 0xF), (0x00776655, 0x7)])
    result = await collector
    assert result[0] == (0xAABBCC80, 0xF, 0)
    assert result[1] == (expected_dw0(2, 0, 2, 3, 5, 1), 0xF, 0)
    assert result[2] == ((0x1234 << 16) | (0x56 << 8) | 0xFE, 0xF, 0)
    assert result[3] == (0x1000, 0xF, 0)
    # Address offset one inserts an invalid leading payload byte.
    assert result[4] == (0x33221100, 0xE, 0)
    assert result[5] == (0x77665544, 0xF, 0)
    assert result[6] == (0xDEADBEEF, 0xF, 1)


@cocotb.test()
async def nonposted_and_completion_no_data(dut):
    cocotb.start_soon(Clock(dut.clk_i, 10, units="ns").start())
    await reset(dut)
    collector = cocotb.start_soon(collect(dut, 4))
    await send_header(dut, fmt=1, type=0, length_dw=4, requester_id=0x1111,
                      tag=3, first_be=0xF, last_be=0xF,
                      address=0x0000000123456000)
    request = await collector
    assert request[-1] == (0x23456000, 0xF, 1)

    collector = cocotb.start_soon(collect(dut, 3, stalls=(0, 1)))
    await send_header(dut, fmt=0, type=10, length_dw=0,
                      requester_id=0x2222, completer_id=0x3333, tag=0x44,
                      status=1, byte_count=0, lower_address=0)
    completion = await collector
    assert completion[0][0] == expected_dw0(0, 10, 0)
    assert completion[1][0] == ((0x3333 << 16) | (1 << 13))
    assert completion[2] == ((0x2222 << 16) | (0x44 << 8), 0xF, 1)


@cocotb.test()
async def output_stability_and_reset(dut):
    cocotb.start_soon(Clock(dut.clk_i, 10, units="ns").start())
    await reset(dut)
    await send_header(dut, fmt=0, type=0, length_dw=1,
                      requester_id=1, tag=1, first_be=0xF, address=0x1000)
    dut.m_axis_tready.value = 0
    while not int(dut.m_axis_tvalid.value):
        await RisingEdge(dut.clk_i)
    snapshot = (int(dut.m_axis_tdata.value), int(dut.m_axis_tkeep.value),
                int(dut.m_axis_tlast.value))
    for _ in range(5):
        await RisingEdge(dut.clk_i)
        assert snapshot == (int(dut.m_axis_tdata.value), int(dut.m_axis_tkeep.value),
                            int(dut.m_axis_tlast.value))
    dut.rst_i.value = 1
    await RisingEdge(dut.clk_i)
    dut.rst_i.value = 0
    await RisingEdge(dut.clk_i)
    assert int(dut.m_axis_tvalid.value) == 0
    assert int(dut.header_ready.value) == 1
