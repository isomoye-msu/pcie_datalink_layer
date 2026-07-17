import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, Timer


async def reset(dut):
    dut.rst_i.value = 1
    for name in [
        "completion_request_valid", "request_requester_id", "request_tag",
        "request_tc", "request_attr", "completion_request_status",
        "completion_request_byte_count", "completion_request_lower_address",
        "completion_request_digest_valid", "completion_request_digest",
        "completion_request_data", "completion_request_keep",
        "completion_request_data_valid", "completion_request_data_last",
        "requester_header_valid", "requester_has_data", "requester_data",
        "requester_keep", "requester_data_valid", "requester_data_last",
        "generator_header_ready", "generator_data_ready",
    ]:
        getattr(dut, name).value = 0
    dut.completer_id.value = 0xCAFE
    for _ in range(3):
        await RisingEdge(dut.clk_i)
    dut.rst_i.value = 0
    await RisingEdge(dut.clk_i)


async def submit_completion(dut, count, status=0):
    dut.request_requester_id.value = 0x1234
    dut.request_tag.value = 0x56
    dut.request_tc.value = 3
    dut.request_attr.value = 5
    dut.completion_request_status.value = status
    dut.completion_request_byte_count.value = count
    dut.completion_request_lower_address.value = 3
    dut.completion_request_valid.value = 1
    while not int(dut.completion_request_ready.value):
        await RisingEdge(dut.clk_i)
    await RisingEdge(dut.clk_i)
    dut.completion_request_valid.value = 0


@cocotb.test()
async def completion_priority_fields_and_packet_lock(dut):
    cocotb.start_soon(Clock(dut.clk_i, 10, units="ns").start())
    await reset(dut)
    dut.requester_has_data.value = 1
    dut.requester_header_valid.value = 1
    await submit_completion(dut, 5, status=0)

    # Completion has priority when both headers are pending.
    dut.generator_header_ready.value = 1
    await Timer(1, units="ps")
    assert int(dut.generator_header_valid.value) == 1
    assert int(dut.generator_type.value) == 10
    assert int(dut.generator_fmt.value) == 2
    assert int(dut.generator_requester_id.value) == 0x1234
    assert int(dut.generator_completer_id.value) == 0xCAFE
    assert int(dut.generator_tag.value) == 0x56
    assert int(dut.generator_byte_count.value) == 5
    assert int(dut.generator_lower_address.value) == 3
    await RisingEdge(dut.clk_i)
    dut.generator_header_ready.value = 0

    # While completion payload is locked, requester cannot interleave.
    dut.completion_request_data.value = 0x44332211
    dut.completion_request_keep.value = 0xF
    dut.completion_request_data_last.value = 0
    dut.completion_request_data_valid.value = 1
    dut.generator_data_ready.value = 0
    for _ in range(4):
        await RisingEdge(dut.clk_i)
        assert int(dut.requester_header_ready.value) == 0
        assert int(dut.generator_data.value) == 0x44332211
    dut.generator_data_ready.value = 1
    await RisingEdge(dut.clk_i)
    dut.completion_request_data.value = 0x55
    dut.completion_request_keep.value = 1
    dut.completion_request_data_last.value = 1
    await RisingEdge(dut.clk_i)
    dut.completion_request_data_valid.value = 0

    # The requester header is selected only after completion EOP.
    dut.generator_header_ready.value = 1
    await Timer(1, units="ps")
    assert int(dut.generator_type.value) == 0
    await RisingEdge(dut.clk_i)
    await no_data_error_completion_and_reset_lock(dut)


async def no_data_error_completion_and_reset_lock(dut):
    await reset(dut)
    await submit_completion(dut, 0, status=1)
    dut.generator_header_ready.value = 0
    for _ in range(3):
        await RisingEdge(dut.clk_i)
        assert int(dut.generator_header_valid.value) == 1
        assert int(dut.generator_fmt.value) == 0
        assert int(dut.generator_status.value) == 1
    dut.generator_header_ready.value = 1
    await RisingEdge(dut.clk_i)

    dut.requester_has_data.value = 1
    dut.requester_header_valid.value = 1
    await RisingEdge(dut.clk_i)
    dut.requester_header_valid.value = 0
    dut.rst_i.value = 1
    await RisingEdge(dut.clk_i)
    dut.rst_i.value = 0
    await RisingEdge(dut.clk_i)
    assert int(dut.generator_data_valid.value) == 0
