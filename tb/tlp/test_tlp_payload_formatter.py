import random
import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, Timer


async def reset(dut):
    dut.rst_i.value = 1
    dut.start_valid.value = 0
    dut.s_axis_tvalid.value = 0
    dut.m_axis_tready.value = 0
    for _ in range(3):
        await RisingEdge(dut.clk_i)
    dut.rst_i.value = 0
    await RisingEdge(dut.clk_i)


async def run_case(dut, offset, payload, stall_pattern):
    dut.start_offset.value = offset
    dut.start_valid.value = 1
    await Timer(1, units="ps")
    while not int(dut.start_ready.value):
        await RisingEdge(dut.clk_i)
        await Timer(1, units="ps")
    await RisingEdge(dut.clk_i)
    await Timer(1, units="ps")
    dut.start_valid.value = 0

    source = bytearray(payload)
    source_pos = 0
    outputs = []
    cycle = 0
    dut.s_axis_tvalid.value = 0
    while source_pos < len(source) or not outputs or not outputs[-1][2]:
        dut.m_axis_tready.value = stall_pattern[cycle % len(stall_pattern)]
        if not int(dut.s_axis_tvalid.value) and source_pos < len(source):
            chunk = source[source_pos:source_pos + 4]
            data = sum(byte << (8 * i) for i, byte in enumerate(chunk))
            dut.s_axis_tdata.value = data
            dut.s_axis_tkeep.value = (1 << len(chunk)) - 1
            dut.s_axis_tlast.value = source_pos + len(chunk) == len(source)
            dut.s_axis_tvalid.value = 1

        await Timer(1, units="ps")
        input_fire = int(dut.s_axis_tvalid.value) and int(dut.s_axis_tready.value)
        output_fire = int(dut.m_axis_tvalid.value) and int(dut.m_axis_tready.value)
        output_value = (int(dut.m_axis_tdata.value), int(dut.m_axis_tkeep.value),
                        int(dut.m_axis_tlast.value))
        await RisingEdge(dut.clk_i)
        await Timer(1, units="ps")
        if input_fire:
            source_pos += int(dut.s_axis_tkeep.value).bit_count()
            dut.s_axis_tvalid.value = 0
        if output_fire:
            outputs.append(output_value)
        cycle += 1
        assert cycle < 500, f"payload formatter deadlock offset={offset} len={len(payload)}"

    expected_bytes = [None] * offset + list(payload)
    expected = []
    for pos in range(0, len(expected_bytes), 4):
        chunk = expected_bytes[pos:pos + 4]
        data = 0
        keep = 0
        for lane, value in enumerate(chunk):
            if value is not None:
                data |= value << (lane * 8)
                keep |= 1 << lane
        expected.append((data, keep, pos + 4 >= len(expected_bytes)))
    assert outputs == expected


@cocotb.test()
async def alignment_lengths_and_backpressure(dut):
    cocotb.start_soon(Clock(dut.clk_i, 10, units="ns").start())
    await reset(dut)
    rng = random.Random(0x544C50)
    for offset in range(4):
        for length in [1, 2, 3, 4, 5, 7, 8, 15, 16, 17, 63]:
            payload = bytes(rng.randrange(256) for _ in range(length))
            await run_case(dut, offset, payload, [0, 0, 1, 0, 1, 1])


@cocotb.test()
async def reset_discards_buffered_payload(dut):
    cocotb.start_soon(Clock(dut.clk_i, 10, units="ns").start())
    await reset(dut)
    dut.start_offset.value = 3
    dut.start_valid.value = 1
    await RisingEdge(dut.clk_i)
    dut.start_valid.value = 0
    dut.s_axis_tdata.value = 0x04030201
    dut.s_axis_tkeep.value = 0xF
    dut.s_axis_tlast.value = 1
    dut.s_axis_tvalid.value = 1
    await RisingEdge(dut.clk_i)
    dut.s_axis_tvalid.value = 0
    dut.rst_i.value = 1
    await RisingEdge(dut.clk_i)
    dut.rst_i.value = 0
    await RisingEdge(dut.clk_i)
    assert int(dut.m_axis_tvalid.value) == 0
    assert int(dut.start_ready.value) == 1
