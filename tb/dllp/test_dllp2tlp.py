# ==========================================================================
#
#  Morgan State University
#  Open Hardware Acceleration Lab (HAL-O)
#
#!  Project:   Open-Source PCIe Endpoint Controller.
#   File:      test_dllp2tip.py
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



class TB:
    def __init__(self, dut):
        self.dut = dut

        ports = 2
 
        self.log = logging.getLogger("cocotb.tb")
        self.log.setLevel(logging.DEBUG)

        cocotb.start_soon(Clock(dut.clk_i, 2, units="ns").start())

        self.source = AxiStreamSource(AxiStreamBus.from_prefix(dut, "s_axis"), dut.clk_i, dut.rst)
        #self.sink = [AxiStreamSink(AxiStreamBus.from_prefix(dut, f"m{k:02d}_axis"), dut.clk_i, dut.rst) for k in range(ports)]
        self.sink = AxiStreamSink(AxiStreamBus.from_prefix(dut, "m_axis_tlp"), dut.clk_i, dut.rst)
        self.sinkdllp = AxiStreamSink(AxiStreamBus.from_prefix(dut, "m_axis_dllp"), dut.clk_i, dut.rst)
        #self.monitor = AxiStreamMonitor(AxiStreamBus.from_prefix(dut, "axis"), dut.clk_i, dut.rst)

    def set_idle_generator(self, generator=None):
        if generator:
            self.source.set_pause_generator(generator())

    def set_backpressure_generator(self, generator=None):
        if generator:
            self.sink.set_pause_generator(generator())

    async def reset(self):
        self.dut.rst.setimmediatevalue(0)
        await RisingEdge(self.dut.clk_i)
        await RisingEdge(self.dut.clk_i)
        self.dut.rst.value = 1
        await RisingEdge(self.dut.clk_i)
        await RisingEdge(self.dut.clk_i)
        self.dut.rst.value = 0
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
    return crc

# def crc32(data, crc=0xFFFFFFFF, poly=0x04C11DB7):
#     for d in data:
#         crc = crc ^ d
#         for bit in range(0, 8):
#             if crc & 1:
#                 crc = (crc >> 1) ^ poly
#             else:
#                 crc = crc >> 1
#     return crc

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


    dut.link_status.value = 0x0002
    await RisingEdge(dut.clk_i)
    
    config = Configuration(
        width=32,
        polynomial=0x04C11DB7,
        init_value=0xFFFFFFFF,
        final_xor_value=0x00000000,
        reverse_input=False,
        reverse_output=True,
    )

    calculator = Calculator(config)
    
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

    data = 0x0200
    test_data =  0x0002
    data = data.to_bytes(2,'big')
    test_data = test_data.to_bytes(2,'big')
    test_data += test_tlp.pack()
    data += test_tlp.pack()
    data += calculator.checksum(data).to_bytes(4,'big')
    test_frame = AxiStreamFrame(data)
    await tb.source.send(test_frame)
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

    data = 0x0200
    test_data =  0x0002
    data = data.to_bytes(2,'big')
    test_data = test_data.to_bytes(2,'big')
    test_data += test_tlp.pack()
    data += test_tlp.pack()
    data += calculator.checksum(data).to_bytes(4,'big')
    test_frame = AxiStreamFrame(data)
    await tb.source.send(test_frame)
    for i in range(20):
         await RisingEdge(dut.clk_i)
    #
    # data_in = await tb.sink.recv()
    #await axis_source.wait()
        
    # await axis_source.send(test_data)
    # await axis_source.wait()
    # data_in = await axis_sink.recv()
    # await axis_source.send(test_data)
    # await axis_source.wait()
    #
            
    for i in range(20):
         await RisingEdge(dut.clk_i)
        
    await RisingEdge(dut.clk_i)    
    # dut.ack_seq_num.value = 0x30
    # dut.ack_nack_vld.value = 1
    # await RisingEdge(dut.clk_i)
    # dut.ack_nack_vld.value = 0
    # for i in range(20):
    #     await RisingEdge(dut.clk_i)
    # data_in = await tb.sink.recv()
