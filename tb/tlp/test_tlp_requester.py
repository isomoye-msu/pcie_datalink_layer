import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, Timer


async def reset(dut):
    dut.rst_i.value = 1
    for name in ["command_valid", "command_data_valid", "tag_request_ready",
                 "packet_header_ready", "packet_data_ready"]:
        getattr(dut, name).value = 0
    dut.requester_id.value = 0x1234
    dut.max_payload_bytes.value = 128
    dut.max_read_bytes.value = 128
    dut.command_tc.value = 0
    dut.command_attr.value = 0
    dut.command_context.value = 0x55AA
    dut.command_prefix_valid.value = 0
    dut.command_prefix.value = 0
    dut.command_digest_valid.value = 0
    dut.command_digest.value = 0
    dut.command_data_last.value = 0
    for _ in range(3):
        await RisingEdge(dut.clk_i)
    dut.rst_i.value = 0
    await RisingEdge(dut.clk_i)


async def issue(dut, command, address, count):
    dut.command.value = command
    dut.command_address.value = address
    dut.command_byte_count.value = count
    dut.command_valid.value = 1
    while not int(dut.command_ready.value):
        await RisingEdge(dut.clk_i)
    await RisingEdge(dut.clk_i)
    dut.command_valid.value = 0


async def accept_tag_and_header(dut, tag):
    while not int(dut.tag_request_valid.value):
        await RisingEdge(dut.clk_i)
    dut.tag.value = tag
    dut.tag_request_ready.value = 1
    await RisingEdge(dut.clk_i)
    dut.tag_request_ready.value = 0
    while not int(dut.packet_header_valid.value):
        await RisingEdge(dut.clk_i)
    snapshot = (int(dut.packet_fmt.value), int(dut.packet_length_dw.value),
                int(dut.packet_tag.value), int(dut.packet_first_be.value),
                int(dut.packet_last_be.value), int(dut.packet_address.value),
                int(dut.tag_byte_count.value))
    dut.packet_header_ready.value = 1
    await RisingEdge(dut.clk_i)
    dut.packet_header_ready.value = 0
    return snapshot


@cocotb.test()
async def nonposted_segmentation_tag_timing_and_4k_boundary(dut):
    cocotb.start_soon(Clock(dut.clk_i, 10, units="ns").start())
    await reset(dut)
    await issue(dut, 0, 0x1003, 300)  # MEM_READ

    # Withhold tags and ensure no header escapes.
    for _ in range(5):
        await RisingEdge(dut.clk_i)
        assert int(dut.tag_request_valid.value) == 1
        assert int(dut.packet_header_valid.value) == 0

    headers = [await accept_tag_and_header(dut, tag) for tag in [7, 8, 9]]
    assert headers[0] == (0, 32, 7, 0x8, 0xF, 0x1003, 125)
    assert headers[1] == (0, 32, 8, 0xF, 0xF, 0x1080, 128)
    assert headers[2] == (0, 12, 9, 0xF, 0x7, 0x1100, 47)
    await RisingEdge(dut.clk_i)
    assert int(dut.command_ready.value) == 1

    # 4-KiB split: one byte before boundary, then a second request.
    await issue(dut, 0, 0x1FFF, 5)
    first = await accept_tag_and_header(dut, 10)
    second = await accept_tag_and_header(dut, 11)
    assert first[5:] == (0x1FFF, 1)
    assert second[5:] == (0x2000, 4)


@cocotb.test()
async def posted_write_backpressure_and_reset(dut):
    cocotb.start_soon(Clock(dut.clk_i, 10, units="ns").start())
    await reset(dut)
    await issue(dut, 1, 0x4001, 7)  # MEM_WRITE
    assert int(dut.tag_request_valid.value) == 0
    while not int(dut.packet_header_valid.value):
        await RisingEdge(dut.clk_i)
    snapshot = (int(dut.packet_fmt.value), int(dut.packet_length_dw.value),
                int(dut.packet_first_be.value), int(dut.packet_last_be.value))
    for _ in range(4):
        await RisingEdge(dut.clk_i)
        assert snapshot == (int(dut.packet_fmt.value), int(dut.packet_length_dw.value),
                            int(dut.packet_first_be.value), int(dut.packet_last_be.value))
    assert snapshot == (2, 2, 0xE, 0xF)
    dut.packet_header_ready.value = 1
    await RisingEdge(dut.clk_i)
    dut.packet_header_ready.value = 0

    dut.command_data.value = 0x44332211
    dut.command_keep.value = 0xF
    dut.command_data_valid.value = 1
    dut.packet_data_ready.value = 0
    for _ in range(3):
        await RisingEdge(dut.clk_i)
        assert int(dut.command_data_ready.value) == 0
        assert int(dut.packet_data.value) == 0x44332211
    dut.packet_data_ready.value = 1
    await RisingEdge(dut.clk_i)
    dut.command_data_valid.value = 0
    dut.command_data.value = 0x00776655
    dut.command_keep.value = 0x7
    dut.command_data_last.value = 1
    dut.command_data_valid.value = 1
    await RisingEdge(dut.clk_i)
    assert int(dut.packet_data_last.value) == 1
    dut.command_data_valid.value = 0
    dut.command_data_last.value = 0
    await RisingEdge(dut.clk_i)
    assert int(dut.command_ready.value) == 1

    # An early local EOP used to leave the requester stuck in REQ_DATA.
    await issue(dut, 1, 0x9000, 8)
    while not int(dut.packet_header_valid.value):
        await RisingEdge(dut.clk_i)
    dut.packet_header_ready.value = 1
    await RisingEdge(dut.clk_i)
    dut.packet_header_ready.value = 0
    dut.packet_data_ready.value = 1
    dut.command_data.value = 0xDEADBEEF
    dut.command_keep.value = 0xF
    dut.command_data_last.value = 1
    dut.command_data_valid.value = 1
    await RisingEdge(dut.clk_i)
    assert int(dut.packet_data_last.value) == 1
    dut.command_data_valid.value = 0
    dut.command_data_last.value = 0
    await RisingEdge(dut.clk_i)
    assert int(dut.command_error.value) == 1
    assert int(dut.command_ready.value) == 1

    # Missing local EOP on the byte-count boundary is also reported, while the
    # generated packet is closed using the authoritative command byte count.
    await issue(dut, 1, 0xA000, 4)
    while not int(dut.packet_header_valid.value):
        await RisingEdge(dut.clk_i)
    dut.packet_header_ready.value = 1
    await RisingEdge(dut.clk_i)
    dut.packet_header_ready.value = 0
    dut.command_data.value = 0x12345678
    dut.command_keep.value = 0xF
    dut.command_data_last.value = 0
    dut.command_data_valid.value = 1
    await RisingEdge(dut.clk_i)
    assert int(dut.packet_data_last.value) == 1
    dut.command_data_valid.value = 0
    await RisingEdge(dut.clk_i)
    assert int(dut.command_error.value) == 1
    assert int(dut.command_ready.value) == 1

    await issue(dut, 0, 0x8000, 64)
    dut.rst_i.value = 1
    await RisingEdge(dut.clk_i)
    dut.rst_i.value = 0
    await RisingEdge(dut.clk_i)
    assert int(dut.tag_request_valid.value) == 0
    assert int(dut.command_ready.value) == 1
