# ==========================================================================
#
#  Morgan State University
#  Open Hardware Acceleration Lab (HAL-O)
#
#!  Project:   Open-Source PCIe Endpoint Controller.
#   File:      test_dllp_receive.py
#   Author:    HAL-O
#   Created:   10/1/25
#
#!  Description:
#!   Module implements a retry management FIFO. Stores TLPs as axis frames.
#!   Module resets read and write pointer after every frame allowing for retransmission
#!   as long as data is not overwritten.
#
#
#   Project:
#     This file is part of the PCIe Gen1/Gen2 Endpoint Controller project.
#     Developed as an open-source, synthesizable Verilog RTL IP core, this
#     project provides FPGA designers and researchers with an educational
#     and extensible platform for high-speed interconnect design.
#
#   Institutional Acknowledgement:
#    - Project oversight and research guidance provided by the CEAMLS
#      (Center for Equitable AI & Machine Learning Systems) Director.
#
#   Notes:
#     - Compliant with PCIe Base Specification (Gen1: 2.5 GT/s,
#       Gen2: 5.0 GT/s).
# 
#   License: MIT License
# 
# ==========================================================================

import itertools
import logging
import os
import random
import subprocess
import sys

import cocotb_test.simulator
import pytest
import zlib, binascii, struct
from crc import Calculator, Configuration,Crc32

import cocotb
from cocotb.clock import Clock
from cocotb.regression import TestFactory
from cocotb.triggers import FallingEdge, RisingEdge, Timer
from cocotbext.axi import AxiStreamFrame, AxiStreamBus, AxiStreamSource, AxiStreamSink, AxiStreamMonitor
from cocotbext.pcie.core import RootComplex, MemoryEndpoint, Device, Switch
from cocotbext.pcie.core.caps import MsiCapability
from cocotbext.pcie.core.utils import PcieId
from cocotbext.pcie.core.tlp import Tlp, TlpType
from cocotbext.pcie.core.dllp import Dllp, DllpType,FcScale


class TB:
    def __init__(self, dut):
        self.dut = dut

        ports = 2
 
        self.log = logging.getLogger("cocotb.tb")
        self.log.setLevel(logging.DEBUG)

        cocotb.start_soon(Clock(dut.clk_i, 2, units="ns").start())
        self.sourcetllp = AxiStreamSource(AxiStreamBus.from_prefix(dut, "s_axis_phy2tlp"), dut.clk_i, dut.rst_i)
        self.sourcedllp = AxiStreamSource(AxiStreamBus.from_prefix(dut, "s_axis_phy2dllp"), dut.clk_i, dut.rst_i)
        #self.sink = [AxiStreamSink(AxiStreamBus.from_prefix(dut, f"m{k:02d}_axis"), dut.clk_i, dut.rst_i) for k in range(ports)]
        self.sinktlp = AxiStreamSink(AxiStreamBus.from_prefix(dut, "m_axis_dllp2tlp"), dut.clk_i, dut.rst_i)
        self.sinkdllp = AxiStreamSink(AxiStreamBus.from_prefix(dut, "m_axis_dllp2phy"), dut.clk_i, dut.rst_i)
        #self.monitor = AxiStreamMonitor(AxiStreamBus.from_prefix(dut, "axis"), dut.clk_i, dut.rst_i)

    def set_idle_generator(self, generator=None):
        if generator:
            self.source.set_pause_generator(generator())

    def set_backpressure_generator(self, generator=None):
        if generator:
            self.sink.set_pause_generator(generator())

    async def reset(self):
        self.dut.rst_i.setimmediatevalue(0)
        await RisingEdge(self.dut.clk_i)
        await RisingEdge(self.dut.clk_i)
        self.dut.rst_i.value = 1
        await RisingEdge(self.dut.clk_i)
        await RisingEdge(self.dut.clk_i)
        self.dut.rst_i.value = 0
        await RisingEdge(self.dut.clk_i)
        await RisingEdge(self.dut.clk_i)

def cycle_pause():
    return itertools.cycle([1, 1, 1, 0])

def crc16(data, crc=0xFFFF, poly=0xD008):
    for d in data:
        crc = crc ^ d
        for bit in range(0, 8):
            if crc & 1:
                crc = (crc >> 1) ^ poly
            else:
                crc = crc >> 1
    return crc ^ 0xffff

# def crc32(data, crc=0xFFFFFFFF, poly=0x04C11DB7):
#     for d in data:
#         crc = crc ^ d
#         for bit in range(0, 8):
#             if crc & 1:
#                 crc = (crc >> 1) ^ poly
#             else:
#                 crc = crc >> 1
#     return crc
def crc(crcIn, data):
    class bitwrapper:
        def __init__(self, x):
            self.x = x
        def __getitem__(self, i):
            return (self.x >> i) & 1
        def __setitem__(self, i, x):
            self.x = (self.x | (1 << i)) if x else (self.x & ~(1 << i))
    crcIn = bitwrapper(crcIn)
    data = bitwrapper(data)
    ret = bitwrapper(0)
    ret[0] = crcIn[2] ^ crcIn[4] ^ crcIn[7] ^ crcIn[11] ^ crcIn[12] ^ crcIn[13] ^ crcIn[15] ^ data[0] ^ data[4] ^ data[5] ^ data[6] ^ data[9] ^ data[10] ^ data[11] ^ data[12] ^ data[13] ^ data[14] ^ data[18] ^ data[20] ^ data[23] ^ data[27] ^ data[28] ^ data[29] ^ data[31]
    ret[1] = crcIn[2] ^ crcIn[3] ^ crcIn[4] ^ crcIn[5] ^ crcIn[7] ^ crcIn[8] ^ crcIn[11] ^ crcIn[14] ^ crcIn[15] ^ data[0] ^ data[1] ^ data[4] ^ data[7] ^ data[9] ^ data[15] ^ data[18] ^ data[19] ^ data[20] ^ data[21] ^ data[23] ^ data[24] ^ data[27] ^ data[30] ^ data[31]
    ret[2] = crcIn[0] ^ crcIn[2] ^ crcIn[3] ^ crcIn[5] ^ crcIn[6] ^ crcIn[7] ^ crcIn[8] ^ crcIn[9] ^ crcIn[11] ^ crcIn[13] ^ data[0] ^ data[1] ^ data[2] ^ data[4] ^ data[6] ^ data[8] ^ data[9] ^ data[11] ^ data[12] ^ data[13] ^ data[14] ^ data[16] ^ data[18] ^ data[19] ^ data[21] ^ data[22] ^ data[23] ^ data[24] ^ data[25] ^ data[27] ^ data[29]
    ret[3] = crcIn[1] ^ crcIn[3] ^ crcIn[4] ^ crcIn[6] ^ crcIn[7] ^ crcIn[8] ^ crcIn[9] ^ crcIn[10] ^ crcIn[12] ^ crcIn[14] ^ data[1] ^ data[2] ^ data[3] ^ data[5] ^ data[7] ^ data[9] ^ data[10] ^ data[12] ^ data[13] ^ data[14] ^ data[15] ^ data[17] ^ data[19] ^ data[20] ^ data[22] ^ data[23] ^ data[24] ^ data[25] ^ data[26] ^ data[28] ^ data[30]
    ret[4] = crcIn[0] ^ crcIn[5] ^ crcIn[8] ^ crcIn[9] ^ crcIn[10] ^ crcIn[12] ^ data[0] ^ data[2] ^ data[3] ^ data[5] ^ data[8] ^ data[9] ^ data[12] ^ data[15] ^ data[16] ^ data[21] ^ data[24] ^ data[25] ^ data[26] ^ data[28]
    ret[5] = crcIn[0] ^ crcIn[1] ^ crcIn[2] ^ crcIn[4] ^ crcIn[6] ^ crcIn[7] ^ crcIn[9] ^ crcIn[10] ^ crcIn[12] ^ crcIn[15] ^ data[0] ^ data[1] ^ data[3] ^ data[5] ^ data[11] ^ data[12] ^ data[14] ^ data[16] ^ data[17] ^ data[18] ^ data[20] ^ data[22] ^ data[23] ^ data[25] ^ data[26] ^ data[28] ^ data[31]
    ret[6] = crcIn[1] ^ crcIn[2] ^ crcIn[3] ^ crcIn[5] ^ crcIn[7] ^ crcIn[8] ^ crcIn[10] ^ crcIn[11] ^ crcIn[13] ^ data[1] ^ data[2] ^ data[4] ^ data[6] ^ data[12] ^ data[13] ^ data[15] ^ data[17] ^ data[18] ^ data[19] ^ data[21] ^ data[23] ^ data[24] ^ data[26] ^ data[27] ^ data[29]
    ret[7] = crcIn[0] ^ crcIn[3] ^ crcIn[6] ^ crcIn[7] ^ crcIn[8] ^ crcIn[9] ^ crcIn[13] ^ crcIn[14] ^ crcIn[15] ^ data[0] ^ data[2] ^ data[3] ^ data[4] ^ data[6] ^ data[7] ^ data[9] ^ data[10] ^ data[11] ^ data[12] ^ data[16] ^ data[19] ^ data[22] ^ data[23] ^ data[24] ^ data[25] ^ data[29] ^ data[30] ^ data[31]
    ret[8] = crcIn[1] ^ crcIn[2] ^ crcIn[8] ^ crcIn[9] ^ crcIn[10] ^ crcIn[11] ^ crcIn[12] ^ crcIn[13] ^ crcIn[14] ^ data[0] ^ data[1] ^ data[3] ^ data[6] ^ data[7] ^ data[8] ^ data[9] ^ data[14] ^ data[17] ^ data[18] ^ data[24] ^ data[25] ^ data[26] ^ data[27] ^ data[28] ^ data[29] ^ data[30]
    ret[9] = crcIn[2] ^ crcIn[3] ^ crcIn[9] ^ crcIn[10] ^ crcIn[11] ^ crcIn[12] ^ crcIn[13] ^ crcIn[14] ^ crcIn[15] ^ data[1] ^ data[2] ^ data[4] ^ data[7] ^ data[8] ^ data[9] ^ data[10] ^ data[15] ^ data[18] ^ data[19] ^ data[25] ^ data[26] ^ data[27] ^ data[28] ^ data[29] ^ data[30] ^ data[31]
    ret[10] = crcIn[0] ^ crcIn[2] ^ crcIn[3] ^ crcIn[7] ^ crcIn[10] ^ crcIn[14] ^ data[0] ^ data[2] ^ data[3] ^ data[4] ^ data[6] ^ data[8] ^ data[12] ^ data[13] ^ data[14] ^ data[16] ^ data[18] ^ data[19] ^ data[23] ^ data[26] ^ data[30]
    ret[11] = crcIn[1] ^ crcIn[2] ^ crcIn[3] ^ crcIn[7] ^ crcIn[8] ^ crcIn[12] ^ crcIn[13] ^ data[0] ^ data[1] ^ data[3] ^ data[6] ^ data[7] ^ data[10] ^ data[11] ^ data[12] ^ data[15] ^ data[17] ^ data[18] ^ data[19] ^ data[23] ^ data[24] ^ data[28] ^ data[29]
    ret[12] = crcIn[0] ^ crcIn[3] ^ crcIn[7] ^ crcIn[8] ^ crcIn[9] ^ crcIn[11] ^ crcIn[12] ^ crcIn[14] ^ crcIn[15] ^ data[0] ^ data[1] ^ data[2] ^ data[5] ^ data[6] ^ data[7] ^ data[8] ^ data[9] ^ data[10] ^ data[14] ^ data[16] ^ data[19] ^ data[23] ^ data[24] ^ data[25] ^ data[27] ^ data[28] ^ data[30] ^ data[31]
    ret[13] = crcIn[1] ^ crcIn[4] ^ crcIn[8] ^ crcIn[9] ^ crcIn[10] ^ crcIn[12] ^ crcIn[13] ^ crcIn[15] ^ data[1] ^ data[2] ^ data[3] ^ data[6] ^ data[7] ^ data[8] ^ data[9] ^ data[10] ^ data[11] ^ data[15] ^ data[17] ^ data[20] ^ data[24] ^ data[25] ^ data[26] ^ data[28] ^ data[29] ^ data[31]
    ret[14] = crcIn[0] ^ crcIn[2] ^ crcIn[5] ^ crcIn[9] ^ crcIn[10] ^ crcIn[11] ^ crcIn[13] ^ crcIn[14] ^ data[2] ^ data[3] ^ data[4] ^ data[7] ^ data[8] ^ data[9] ^ data[10] ^ data[11] ^ data[12] ^ data[16] ^ data[18] ^ data[21] ^ data[25] ^ data[26] ^ data[27] ^ data[29] ^ data[30]
    ret[15] = crcIn[1] ^ crcIn[3] ^ crcIn[6] ^ crcIn[10] ^ crcIn[11] ^ crcIn[12] ^ crcIn[14] ^ crcIn[15] ^ data[3] ^ data[4] ^ data[5] ^ data[8] ^ data[9] ^ data[10] ^ data[11] ^ data[12] ^ data[13] ^ data[17] ^ data[19] ^ data[22] ^ data[26] ^ data[27] ^ data[28] ^ data[30] ^ data[31]
    return ret.x

def crc32(msg, poly=0x04C11DB7):
    crc = 0xffffffff
    for b in msg:
        crc ^= b
        for _ in range(8):
            crc = (crc >> 1) ^ poly if crc & 1 else crc >> 1
    return crc ^ 0xffffffff

@cocotb.test()
async def run_test(dut):

    tb = TB(dut)

    #id_count = 2**len(tb.source.bus.tid)
    idle_inserter = [None, cycle_pause]
    backpressure_inserter = [None, cycle_pause]

    cur_id = 1
    seq_num = 0x02

    await tb.reset()

    tb.set_idle_generator(None)
    tb.set_backpressure_generator(None)
    
    
    await RisingEdge(dut.clk_i)
    await RisingEdge(dut.clk_i)
    await RisingEdge(dut.clk_i)
    # dut.tx_fc_ph.value = 0x16
    # dut.tx_fc_pd.value = 0xF40
    # dut.tx_fc_nph.value = 0x016
    # dut.tx_fc_npd.value = 0xF40
    #dut.retry_available.value = 1
    # dut.ack_nack.value = 1
    # dut.ack_nack_vld.value = 0
    dut.link_status_i.value = 0x2
    await RisingEdge(dut.clk_i)
    
    
    length = random.randint(1, 32)
    test_dllp = Dllp()
    test_dllp.type = DllpType.INIT_FC1_P
    test_dllp.seq = 0
    test_dllp.vc = 0
    test_dllp.hdr_scale = FcScale(0)
    test_dllp.hdr_fc = 1
    test_dllp.data_scale = FcScale(0)
    test_dllp.data_fc = 256
    test_dllp.feature_support = 0
    test_dllp.feature_ack = False
    #test_dllp.create_ack(2)
    #test_dllp.pack_crc()
    
    tlp_config = Configuration(
        width=32,
        polynomial=0x04C11DB7,
        init_value=0xFFFFFFFF,
        final_xor_value=0x00000000,
        reverse_input=False,
        reverse_output=True,
    )

    
    config = Configuration(
        width=16,
        polynomial=0x1DB7,
        init_value=0xFFFF,
        final_xor_value=0x00000000,
        reverse_input=False,
        reverse_output=True,
    )
    tlp_calculator = Calculator(tlp_config)
    calculator = Calculator(config)
    
    data = test_dllp.pack()
    data += calculator.checksum(data).to_bytes(2, 'big')
    test_frame = AxiStreamFrame(data)
    print(data)
    
    
    await tb.sourcedllp.send(test_frame)
    for i in range(20):
         await RisingEdge(dut.clk_i)
         
    test_dllp = Dllp()
    test_dllp.type = DllpType.INIT_FC1_NP
    test_dllp.seq = 0
    test_dllp.vc = 0
    test_dllp.hdr_scale = FcScale(0)
    test_dllp.hdr_fc = 1
    test_dllp.data_scale = FcScale(0)
    test_dllp.data_fc = 256
    test_dllp.feature_support = 0
    test_dllp.feature_ack = False
    data = test_dllp.pack()
    data += calculator.checksum(data).to_bytes(2, 'big')
    test_frame = AxiStreamFrame(data)
    await tb.sourcedllp.send(test_frame)
    
    for i in range(20):
         await RisingEdge(dut.clk_i)
         
         
    test_dllp = Dllp()
    test_dllp.type = DllpType.INIT_FC1_CPL
    test_dllp.seq = 0
    test_dllp.vc = 0
    test_dllp.hdr_scale = FcScale(0)
    test_dllp.hdr_fc = 1
    test_dllp.data_scale = FcScale(0)
    test_dllp.data_fc = 256
    test_dllp.feature_support = 0
    test_dllp.feature_ack = False
    data = test_dllp.pack()
    data += calculator.checksum(data).to_bytes(2, 'big')
    test_frame = AxiStreamFrame(data)
    await tb.sourcedllp.send(test_frame)
    
    for i in range(20):
         await RisingEdge(dut.clk_i)
         
         
    test_dllp = Dllp()
    test_dllp.type = DllpType.INIT_FC2_P
    test_dllp.seq = 0
    test_dllp.vc = 0
    test_dllp.hdr_scale = FcScale(0)
    test_dllp.hdr_fc = 1
    test_dllp.data_scale = FcScale(0)
    test_dllp.data_fc = 256
    test_dllp.feature_support = 0
    test_dllp.feature_ack = False
    data = test_dllp.pack()
    data += calculator.checksum(data).to_bytes(2, 'big')
    test_frame = AxiStreamFrame(data)
    await tb.sourcedllp.send(test_frame)
    
    for i in range(20):
         await RisingEdge(dut.clk_i)
        
    await RisingEdge(dut.clk_i)    
    
    test_dllp = Dllp()
    test_dllp.type = DllpType.INIT_FC2_NP
    test_dllp.seq = 0
    test_dllp.vc = 0
    test_dllp.hdr_scale = FcScale(0)
    test_dllp.hdr_fc = 1
    test_dllp.data_scale = FcScale(0)
    test_dllp.data_fc = 256
    test_dllp.feature_support = 0
    test_dllp.feature_ack = False
    data = test_dllp.pack()
    data += calculator.checksum(data).to_bytes(2, 'big')
    test_frame = AxiStreamFrame(data)
    await tb.sourcedllp.send(test_frame)
    
    for i in range(20):
         await RisingEdge(dut.clk_i)
         
    test_dllp = Dllp()
    test_dllp.type = DllpType.INIT_FC2_CPL
    test_dllp.seq = 0
    test_dllp.vc = 0
    test_dllp.hdr_scale = FcScale(0)
    test_dllp.hdr_fc = 1
    test_dllp.data_scale = FcScale(0)
    test_dllp.data_fc = 256
    test_dllp.feature_support = 0
    test_dllp.feature_ack = False
    data = test_dllp.pack()
    data += calculator.checksum(data).to_bytes(2, 'big')
    test_frame = AxiStreamFrame(data)
    await tb.sourcedllp.send(test_frame)
    
    for i in range(20):
         await RisingEdge(dut.clk_i)
         
    test_dllp = Dllp()
    test_dllp = test_dllp.create_ack(0x002)
    data = test_dllp.pack()
    data += calculator.checksum(data).to_bytes(2, 'big')
    test_frame = AxiStreamFrame(data)
    await tb.sourcedllp.send(test_frame)
    
    for i in range(20):
         await RisingEdge(dut.clk_i)
         
    length = random.randint(1, 32)
    test_tlp = Tlp()
    test_tlp.fmt_type = random.choice([TlpType.MEM_WRITE])
    if test_tlp.fmt_type == TlpType.MEM_WRITE:
        test_data = bytearray(itertools.islice(itertools.cycle(range(255)), length))
        test_tlp.set_addr_be_data(1*4, test_data)
        test_tlp.tag = 1
        test_tlp.requester_id = 1
    elif test_tlp.fmt_type == TlpType.MEM_READ:
        test_tlp.set_addr_be(1*4, length)
        test_tlp.tag = 1
        test_tlp.requester_id = 1

    data = 0x0100
    test_data =  0x0100
    data = data.to_bytes(2,'big')
    test_data = test_data.to_bytes(2,'big')
    test_data += test_tlp.pack()
    data += test_tlp.pack()
    data += tlp_calculator.checksum(data).to_bytes(4,'big')
    test_frame = AxiStreamFrame(data)
    await tb.sourcetllp.send(test_frame)
    for i in range(20):
         await RisingEdge(dut.clk_i)
         
    for i in range(20):
         await RisingEdge(dut.clk_i)
         
         
    length = random.randint(32, 64)
    test_tlp = Tlp()
    test_tlp.fmt_type = random.choice([TlpType.MEM_WRITE])
    if test_tlp.fmt_type == TlpType.MEM_WRITE:
        test_data = bytearray(itertools.islice(itertools.cycle(range(255)), length))
        test_tlp.set_addr_be_data(1*4, test_data)
        test_tlp.tag = 1
        test_tlp.requester_id = 1
    elif test_tlp.fmt_type == TlpType.MEM_READ:
        test_tlp.set_addr_be(1*4, length)
        test_tlp.tag = 1
        test_tlp.requester_id = 1

    data = 0x0100
    test_data =  0x0100
    data = data.to_bytes(2,'big')
    test_data = test_data.to_bytes(2,'big')
    test_data += test_tlp.pack()
    data += test_tlp.pack()
    data += tlp_calculator.checksum(data).to_bytes(4,'big')
    test_frame = AxiStreamFrame(data)
    await tb.sourcetllp.send(test_frame)
    for i in range(20):
        await RisingEdge(dut.clk_i)
         
    for i in range(20):
        await RisingEdge(dut.clk_i)
    for i in range(20):
        await RisingEdge(dut.clk_i)
    # dut.ack_seq_num.value = 0x30
    # dut.ack_nack_vld.value = 1
    # await RisingEdge(dut.clk_i)
    # dut.ack_nack_vld.value = 0
    # for i in range(20):
    #     await RisingEdge(dut.clk_i)
    # data_in = await tb.sink.recv()