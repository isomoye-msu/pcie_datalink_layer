# ==========================================================================
#
#  Morgan State University
#  Open Hardware Acceleration Lab (HAL-O)
#
#!  Project:   Open-Source PCIe Endpoint Controller.
#   File:      test_pcie_datalink_layer.py
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
from cocotb.triggers import FallingEdge, RisingEdge, Timer, First
from cocotbext.axi import AxiStreamFrame, AxiStreamBus, AxiStreamSource, AxiStreamSink, AxiStreamMonitor
from cocotbext.pcie.core import RootComplex, MemoryEndpoint, Device, Switch
from cocotbext.pcie.core.caps import MsiCapability
from cocotbext.pcie.core.utils import PcieId
from cocotbext.pcie.core.tlp import Tlp, TlpType
from cocotbext.pcie.core.dllp import Dllp, DllpType,FcScale
from cocotb.queue import Queue, QueueFull


class TB:
    def __init__(self, dut):
        self.dut = dut

        ports = 2
 
        self.log = logging.getLogger("cocotb.tb")
        self.log.setLevel(logging.DEBUG)

        cocotb.start_soon(Clock(dut.clk_i, 4, units="ns").start())

        self.source = AxiStreamSource(AxiStreamBus.from_prefix(dut, "s_axis_phy"), dut.clk_i, dut.rst_i)
        # self.source = AxiStreamSource(AxiStreamBus.from_prefix(dut, "s_axis_phy"), dut.clk_i, dut.rst_i)
        # self.source = AxiStreamSource(AxiStreamBus.from_prefix(dut, "s_axis_tlpin"), dut.clk_i, dut.rst_i)
        #self.sink = [AxiStreamSink(AxiStreamBus.from_prefix(dut, f"m{k:02d}_axis"), dut.clk_i, dut.rst_i) for k in range(ports)]
        self.sinkdllp2phy = AxiStreamSink(AxiStreamBus.from_prefix(dut, "m_axis_dllp2phy"), dut.clk_i, dut.rst_i)
        # self.sinktlp = AxiStreamSink(AxiStreamBus.from_prefix(dut, "m_axis_tlpout"), dut.clk_i, dut.rst_i)
        
        self.source.log.setLevel(logging.CRITICAL)
        # self.source.log.setLevel(logging.CRITICAL)
        # self.source.log.setLevel(logging.CRITICAL)
        self.sinkdllp2phy.log.setLevel(logging.CRITICAL)
        # self.sinktlp.log.setLevel(logging.CRITICAL)
        #self.sinktlp2phy = AxiStreamSink(AxiStreamBus.from_prefix(dut, "m_axis_tlp2phy"), dut.clk_i, dut.rst_i)
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


def crc32(msg, poly=0x04C11DB7):
    crc = 0xffffffff
    for b in msg:
        crc ^= b
        for _ in range(8):
            crc = (crc >> 1) ^ poly if crc & 1 else crc >> 1
    return crc ^ 0xffffffff

def reverse_bytes(byte_obj):
    reversed_bytes = byte_obj[::-1]
    return reversed_bytes

def tlp2dllp(seq_num, data,tlp_calculator):
    test_data = seq_num.to_bytes(2,'big')
    test_data += data
    test_data += tlp_calculator.checksum(test_data).to_bytes(4,'big')
    seq_num += 1
    return test_data


def check_dllp(packet, packet_out):
    
    dllp_crc_config = Configuration(
        width=16,
        polynomial=0x1DB7,
        init_value=0xFFFF,
        final_xor_value=0x00000000,
        reverse_input=False,
        reverse_output=False,
    )
    
    crc_calculator = Calculator(dllp_crc_config)
    #find size of the frame
    size = len(packet)
    
    #remove crc from packet
    crc_in = packet[size-2:size]
    dllp = packet[0:size-2]
    
    calc_crc = crc_calculator.checksum(dllp).to_bytes(2, 'little')
    
    if crc_in == calc_crc:
        #print("crc_in : " + str(crc_in))
        packet_out = dllp
        return 1
    else:
        print("CRC check fail. crc_in:" + str(crc_in) + "calculated crc: " + str(calc_crc))
        return 0
    

async def init_fc_driver(dut,tb, queue):
    
    seq = 0
    #configure Dllp 
    dllp_crc_config = Configuration(
        width=16,
        polynomial=0x1DB7,
        init_value=0xFFFF,
        final_xor_value=0x00000000,
        reverse_input=False,
        reverse_output=True,
    )
    
    crc_calculator = Calculator(dllp_crc_config)
    

    test_dllp = Dllp()
    test_dllp.type = DllpType.INIT_FC1_P
    test_dllp.seq = seq
    test_dllp.vc = 0
    test_dllp.hdr_scale = FcScale(0)
    test_dllp.hdr_fc = 1
    test_dllp.data_scale = FcScale(0)
    test_dllp.data_fc = 256
    test_dllp.feature_support = 0
    test_dllp.feature_ack = False
    data = test_dllp.pack()
    data += crc_calculator.checksum(data).to_bytes(2, 'big')
    test_frame = AxiStreamFrame(data)
    await queue.put(test_frame)
    await tb.source.send(test_frame)
    
    for i in range(200):
        await RisingEdge(dut.clk_i)
    
    seq+=1
    
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
    data += crc_calculator.checksum(data).to_bytes(2, 'big')
    test_frame = AxiStreamFrame(data)
    await queue.put(test_frame)
    await tb.source.send(test_frame)
    
    for i in range(200):
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
    data += crc_calculator.checksum(data).to_bytes(2, 'big')
    test_frame = AxiStreamFrame(data)
    await queue.put(test_frame)
    await tb.source.send(test_frame)


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
    data += crc_calculator.checksum(data).to_bytes(2, 'big')
    test_frame = AxiStreamFrame(data)
    await queue.put(test_frame)
    await tb.source.send(test_frame)
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
    data += crc_calculator.checksum(data).to_bytes(2, 'big')
    test_frame = AxiStreamFrame(data)
    await queue.put(test_frame)
    await tb.source.send(test_frame)
    
    for i in range(20):
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
    data += crc_calculator.checksum(data).to_bytes(2, 'big')
    test_frame = AxiStreamFrame(data)
    await queue.put(test_frame)
    await tb.source.send(test_frame)
    
    
    for i in range(200):
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
    data += crc_calculator.checksum(data).to_bytes(2, 'big')
    test_frame = AxiStreamFrame(data)
    await queue.put(test_frame)
    await tb.source.send(test_frame)


async def init_fc_monitor(dut,tb, queue):
    while 1:
        packet = await tb.sinkdllp2phy.recv()
        #print(packet)
        data_in = packet.tdata
        data_in = data_in
        print(data_in)
        #data_in = reverse_bytes(data_in)
        #print(str(data_in))
        extracted_packet = packet.tdata
        # dllppacket = Dllp()
        # dllppacket = dllppacket.unpack(data_in)
        # print(dllppacket)
        if check_dllp(data_in, extracted_packet) == 1:
            dllp =  Dllp()
            #print(extracted_packet)
            dllp = dllp.unpack(extracted_packet)
            #print(dllp)
            print("FC MONITOR: " + str(dllp))
    print("\n\n\n\n")
            
            
            
        
        


@cocotb.test()
async def run_test(dut):

    tb = TB(dut)

    #id_count = 2**len(tb.source.bus.tid)
    idle_inserter = [None, cycle_pause]
    backpressure_inserter = [None, cycle_pause]

    cur_id = 1
    seq_num = 0x00

    await tb.reset()

    tb.set_idle_generator(None)
    tb.set_backpressure_generator(None)
    
    dllp_queue = Queue()
    
    tlp_config = Configuration(
        width=32,
        polynomial=0x04C11DB7,
        init_value=0xFFFFFFFF,
        final_xor_value=0x00000000,
        reverse_input=False,
        reverse_output=True,
    )
    tlp_calculator = Calculator(tlp_config)
    
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
    dut.phy_link_up_i.value = 1
    await RisingEdge(dut.clk_i)
    
    
    for i in range(20):
        await RisingEdge(dut.clk_i)
         
         
    coro2Thread = cocotb.start_soon(init_fc_monitor(dut,tb,dllp_queue))
    coro1Thread = cocotb.start_soon(init_fc_driver(dut,tb,dllp_queue))
    await First(coro1Thread)
    
    
    for i in range(2000):
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
    data = test_tlp.pack()
    test_frame = AxiStreamFrame(tlp2dllp(seq_num,data,tlp_calculator))
    await tb.source.send(test_frame)
    seq_num +=1
    for i in range(20):
         await RisingEdge(dut.clk_i)
         
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
    data = test_tlp.pack()
    # data += tlp_calculator.checksum(data).to_bytes(4,'big')
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
    data = test_tlp.pack()
    test_frame = AxiStreamFrame(tlp2dllp(seq_num,data,tlp_calculator))
    await tb.source.send(test_frame)
    seq_num +=1
    
    for i in range(200):
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
    data = test_tlp.pack()
    test_frame = AxiStreamFrame(tlp2dllp(seq_num,data,tlp_calculator))
    await tb.source.send(test_frame)
    seq_num +=1
    
    
    for i in range(2000):
        await RisingEdge(dut.clk_i)