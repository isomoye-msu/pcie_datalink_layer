import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, Timer


async def reset(dut):
    dut.rst_i.value = 1
    for name in ["allocate_valid", "completion_valid", "result_ready", "extended_tag_enable"]:
        getattr(dut, name).value = 0
    for _ in range(3):
        await RisingEdge(dut.clk_i)
    dut.rst_i.value = 0
    await RisingEdge(dut.clk_i)


async def allocate(dut, requester, count, context, expects_data=True):
    dut.allocate_requester_id.value = requester
    dut.allocate_byte_count.value = count
    dut.allocate_context.value = context
    dut.allocate_expects_data.value = expects_data
    dut.allocate_valid.value = 1
    await Timer(1, units="ps")
    while not int(dut.allocate_ready.value):
        await RisingEdge(dut.clk_i)
        await Timer(1, units="ps")
    tag = int(dut.allocate_tag.value)
    await RisingEdge(dut.clk_i)
    await Timer(1, units="ps")
    dut.allocate_valid.value = 0
    return tag


async def complete(dut, requester, tag, payload_bytes, status=0):
    dut.completion_requester_id.value = requester
    dut.completion_tag.value = tag
    dut.completion_status.value = status
    dut.completion_payload_bytes.value = payload_bytes
    dut.completion_valid.value = 1
    await Timer(1, units="ps")
    while not int(dut.completion_ready.value):
        await RisingEdge(dut.clk_i)
        await Timer(1, units="ps")
    await RisingEdge(dut.clk_i)
    await Timer(1, units="ps")
    dut.completion_valid.value = 0


@cocotb.test()
async def exhaustion_split_completion_and_reuse(dut):
    cocotb.start_soon(Clock(dut.clk_i, 10, units="ns").start())
    await reset(dut)
    tags = [await allocate(dut, 0x1234, 64, i, True) for i in range(32)]
    assert tags == list(range(32))
    assert int(dut.outstanding.value) == 32
    dut.allocate_valid.value = 1
    await RisingEdge(dut.clk_i)
    assert int(dut.allocate_ready.value) == 0
    dut.allocate_valid.value = 0

    dut.result_ready.value = 1
    await complete(dut, 0x1234, 0, 16)
    await Timer(1, units="ps")
    assert int(dut.result_valid.value) == 1
    assert int(dut.result_last.value) == 0
    assert int(dut.outstanding.value) == 32
    await RisingEdge(dut.clk_i)
    await complete(dut, 0x1234, 0, 48)
    await Timer(1, units="ps")
    assert int(dut.result_last.value) == 1
    assert int(dut.outstanding.value) == 31
    await RisingEdge(dut.clk_i)
    assert await allocate(dut, 0x1234, 4, 0xAA, False) == 0

    # A successful completion without data retires a non-posted write.
    await complete(dut, 0x1234, 0, 0)
    await Timer(1, units="ps")
    assert int(dut.result_last.value) == 1


@cocotb.test()
async def malformed_completion_and_result_backpressure(dut):
    cocotb.start_soon(Clock(dut.clk_i, 10, units="ns").start())
    await reset(dut)
    tag = await allocate(dut, 0xABCD, 32, 0x55AA, True)

    # Wrong requester ID must be rejected without releasing the tag.
    await complete(dut, 0xABCE, tag, 32)
    await Timer(1, units="ps")
    assert int(dut.unexpected_completion.value) == 1
    assert int(dut.outstanding.value) == 1

    # Hold result backpressure; completion_ready and result fields must remain stable.
    dut.result_ready.value = 0
    await complete(dut, 0xABCD, tag, 8)
    await Timer(1, units="ps")
    assert int(dut.result_valid.value) == 1
    snapshot = (int(dut.result_context.value), int(dut.result_status.value), int(dut.result_last.value))
    for _ in range(4):
        await RisingEdge(dut.clk_i)
        assert int(dut.completion_ready.value) == 0
        assert snapshot == (int(dut.result_context.value), int(dut.result_status.value),
                            int(dut.result_last.value))
    dut.result_ready.value = 1
    await RisingEdge(dut.clk_i)

    # An error completion terminates the remaining request.
    await complete(dut, 0xABCD, tag, 0, status=1)
    await Timer(1, units="ps")
    assert int(dut.result_status.value) == 1
    assert int(dut.result_last.value) == 1
    assert int(dut.outstanding.value) == 0

    dut.rst_i.value = 1
    await RisingEdge(dut.clk_i)
    assert int(dut.outstanding.value) == 0
