import cocotb
from cocotb.triggers import Timer


FMT_3DW_ND = 0
FMT_4DW_ND = 1
FMT_3DW_D = 2
FMT_4DW_D = 3
TYPE_MEM = 0
TYPE_IO = 2
TYPE_CFG0 = 4
TYPE_CFG1 = 5
TYPE_CPL = 10


async def settle():
    await Timer(1, units="ns")


@cocotb.test()
async def package_helpers_exhaustive(dut):
    for fmt, has_data, is_4dw in [
        (FMT_3DW_ND, 0, 0), (FMT_4DW_ND, 0, 1),
        (FMT_3DW_D, 1, 0), (FMT_4DW_D, 1, 1), (4, 0, 0),
    ]:
        dut.fmt.value = fmt
        await settle()
        assert int(dut.has_data.value) == has_data
        assert int(dut.is_4dw.value) == is_4dw

    for length in [1, 2, 3, 4, 255, 256, 511, 1023, 1024]:
        dut.length_dw.value = length
        await settle()
        expected_encoded = 0 if length == 1024 else length
        assert int(dut.encoded_length.value) == expected_encoded
        assert int(dut.decoded_length.value) == length

    for offset in range(4):
        for length in range(1, 18):
            dut.address_low.value = offset
            dut.byte_length.value = length
            await settle()
            first = 0
            for lane in range(4):
                if offset <= lane < offset + length:
                    first |= 1 << lane
            if offset + length <= 4:
                last = 0
            else:
                end = (offset + length) & 3
                last = 0xF if end == 0 else (1 << end) - 1
            assert int(dut.first_be.value) == first
            assert int(dut.last_be.value) == last


@cocotb.test()
async def classifier_all_three_classes(dut):
    cases = [
        (FMT_3DW_D, TYPE_MEM, 0, 0, 0, 1),
        (FMT_3DW_ND, TYPE_MEM, 1, 0, 1, 0),
        (FMT_3DW_ND, TYPE_CFG0, 1, 0, 1, 0),
        (FMT_3DW_D, TYPE_CFG0, 1, 0, 0, 1),
        (FMT_3DW_ND, TYPE_CPL, 2, 1, 0, 0),
        (FMT_3DW_D, TYPE_CPL, 2, 1, 0, 0),
        (FMT_3DW_ND, 31, 3, 0, 0, 0),
    ]
    for fmt, tlp_type, cls, flag, read, write in cases:
        dut.length_dw.value = 0 if (tlp_type == TYPE_CPL and fmt == FMT_3DW_ND) else 1
        dut.fmt.value = fmt
        dut.tlp_type.value = tlp_type
        await settle()
        assert int(dut.class_value.value) == cls
        assert int(dut.read_request.value) == read
        assert int(dut.write_request.value) == write
        if cls == 2:
            assert int(dut.completion.value) == flag
        if cls == 3:
            assert int(dut.unsupported.value) == 1

    # Malformed format/type combinations must not retain any routing flags.
    for fmt, tlp_type, length in [
        (FMT_4DW_ND, TYPE_CFG0, 1),
        (FMT_4DW_D, TYPE_IO, 1),
        (FMT_4DW_D, TYPE_CPL, 1),
        (FMT_3DW_ND, TYPE_CPL, 1),
    ]:
        dut.fmt.value = fmt
        dut.tlp_type.value = tlp_type
        dut.length_dw.value = length
        await settle()
        assert int(dut.class_value.value) == 3
        assert int(dut.unsupported.value) == 1
        assert int(dut.completion.value) == 0
        assert int(dut.read_request.value) == 0
        assert int(dut.write_request.value) == 0


@cocotb.test()
async def bar_and_config_boundaries(dut):
    dut.memory_enable.value = 1
    for address, hit, bar, offset in [
        (0x0FFF, 0, 0, 0),
        (0x1000, 1, 0, 0),
        (0x1FFF, 1, 0, 0xFFF),
        (0x2000, 0, 0, 0),
        (0x1_0000_0000, 1, 1, 0),
        (0x1_0000_0FFF, 1, 1, 0xFFF),
    ]:
        dut.address.value = address
        await settle()
        assert int(dut.bar_hit.value) == hit
        if hit:
            assert int(dut.bar_number.value) == bar
            assert int(dut.bar_offset.value) == offset

    dut.memory_enable.value = 0
    dut.address.value = 0x1000
    await settle()
    assert int(dut.bar_hit.value) == 0

    good_bdf = (0x25 << 24) | (0x12 << 19) | (3 << 16)
    for tlp_type, type_one in [(TYPE_CFG0, 0), (TYPE_CFG1, 1)]:
        dut.tlp_type.value = tlp_type
        dut.address.value = good_bdf | 0x3FC
        await settle()
        assert int(dut.config_hit.value) == 1
        assert int(dut.config_type_one.value) == type_one
        assert int(dut.config_offset.value) == 0x3FC

    for bad in [good_bdf ^ (1 << 24), good_bdf ^ (1 << 19), good_bdf ^ (1 << 16)]:
        dut.address.value = bad
        await settle()
        assert int(dut.config_hit.value) == 0
