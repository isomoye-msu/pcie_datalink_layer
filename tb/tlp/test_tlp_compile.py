import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, Timer


async def init_top(dut):
    cocotb.start_soon(Clock(dut.clk_i, 10, units="ns").start())
    for handle in dut:
        if handle._name.endswith("_i") and handle._name not in {"clk_i", "rst_i"}:
            try:
                handle.value = 0
            except (AttributeError, ValueError):
                pass
    dut.rst_i.value = 1
    dut.link_up_i.value = 0
    for _ in range(4):
        await RisingEdge(dut.clk_i)
    dut.rst_i.value = 0
    dut.link_up_i.value = 1
    dut.transmit_enable_i.value = 1
    dut.requester_id_i.value = 0x1234
    dut.completer_id_i.value = 0x5678
    dut.memory_enable_i.value = 1
    dut.max_payload_bytes_i.value = 128
    dut.max_read_bytes_i.value = 128
    for _ in range(2):
        await RisingEdge(dut.clk_i)


async def send_rx(dut, data, last=False, keep=0xF):
    dut.s_dllp_axis_tdata.value = data
    dut.s_dllp_axis_tkeep.value = keep
    dut.s_dllp_axis_tlast.value = last
    dut.s_dllp_axis_tvalid.value = 1
    await Timer(1, units="ps")
    while not int(dut.s_dllp_axis_tready.value):
        await RisingEdge(dut.clk_i)
        await Timer(1, units="ps")
    await RisingEdge(dut.clk_i)
    await Timer(1, units="ps")
    dut.s_dllp_axis_tvalid.value = 0


@cocotb.test()
async def compile_and_reset(dut):
    """All TLP sources elaborate together and the top survives reset/link entry."""
    cocotb.start_soon(Clock(dut.clk_i, 10, units="ns").start())

    # Initialize every top-level input before releasing reset.
    for handle in dut:
        if handle._name.endswith("_i") and handle._name not in {"clk_i", "rst_i"}:
            try:
                handle.value = 0
            except (AttributeError, ValueError):
                pass

    dut.rst_i.value = 1
    dut.link_up_i.value = 0
    for _ in range(4):
        await RisingEdge(dut.clk_i)

    dut.rst_i.value = 0
    dut.link_up_i.value = 1
    for _ in range(4):
        await RisingEdge(dut.clk_i)

    assert int(dut.outstanding_o.value) == 0
    assert int(dut.m_dllp_axis_tvalid.value) == 0


@cocotb.test()
async def layer_routes_requests_and_flags_malformed_timing(dut):
    await init_top(dut)
    dut.target_request_ready_i.value = 0
    dut.target_data_ready_i.value = 0

    # Posted MWr32 reaches the BAR target and remains stable under header backpressure.
    await send_rx(dut, (2 << 5) | (1 << 24))
    await send_rx(dut, (0xABCD << 16) | (7 << 8) | 0xF)
    await send_rx(dut, 0x0000)
    for _ in range(3):
        await RisingEdge(dut.clk_i)
        assert int(dut.target_request_valid_o.value) == 1
        assert int(dut.target_memory_o.value) == 1
        assert int(dut.target_write_o.value) == 1
        assert int(dut.target_bar_hit_o.value) == 1
    dut.target_request_ready_i.value = 1
    await RisingEdge(dut.clk_i)
    dut.target_request_ready_i.value = 0
    dut.target_data_ready_i.value = 0
    await send_rx(dut, 0xDEADBEEF, last=True)
    for _ in range(3):
        await RisingEdge(dut.clk_i)
        if int(dut.target_data_valid_o.value):
            assert int(dut.target_data_o.value) == 0xDEADBEEF
            dut.target_data_ready_i.value = 1
            await RisingEdge(dut.clk_i)
            break
    else:
        raise AssertionError("BAR payload was not routed")

    # Partial header keep is malformed; the following legal MRd must still recover.
    await send_rx(dut, (1 << 24), last=True, keep=0x7)
    assert int(dut.malformed_o.value) == 1
    await RisingEdge(dut.clk_i)
    await send_rx(dut, (1 << 24))
    await send_rx(dut, (0xABCD << 16) | (8 << 8) | 0xF)
    await send_rx(dut, 0x0004, last=True)
    dut.target_request_ready_i.value = 1
    for _ in range(10):
        await RisingEdge(dut.clk_i)
        if int(dut.target_request_valid_o.value):
            assert int(dut.target_read_o.value) == 1
            break
    else:
        raise AssertionError("layer did not recover after malformed frame")


@cocotb.test()
async def local_nonposted_command_reaches_dllp_axis(dut):
    await init_top(dut)
    dut.m_dllp_axis_tready.value = 1
    dut.command_i.value = 0
    dut.command_address_i.value = 0x2000
    dut.command_byte_count_i.value = 4
    dut.command_tc_i.value = 0
    dut.command_attr_i.value = 0
    dut.command_context_i.value = 0x55
    dut.command_valid_i.value = 1
    while not int(dut.command_ready_o.value):
        await RisingEdge(dut.clk_i)
    await RisingEdge(dut.clk_i)
    dut.command_valid_i.value = 0

    words = []
    for _ in range(80):
        await RisingEdge(dut.clk_i)
        if int(dut.m_dllp_axis_tvalid.value) and int(dut.m_dllp_axis_tready.value):
            words.append((int(dut.m_dllp_axis_tdata.value), int(dut.m_dllp_axis_tlast.value)))
            if words[-1][1]:
                break
    assert len(words) == 3
    assert words[0][0] & 0xFF == 0
    assert words[2] == (0x2000, 1)
    assert int(dut.outstanding_o.value) == 1
