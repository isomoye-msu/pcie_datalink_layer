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
from cocotb.triggers import *
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
        self.log.setLevel(logging.ERROR)

        cocotb.start_soon(Clock(dut.clk_i, 2, units="ns").start())
        #self.sink = [AxiStreamSink(AxiStreamBus.from_prefix(dut, f"m{k:02d}_axis"), dut.clk_i, dut.rst_i) for k in range(ports)]
        self.sink = AxiStreamSink(AxiStreamBus.from_prefix(dut, "m_axis"), dut.clk_i, dut.rst_i)
        # self.sink.set_pause_generator(self.cycle_pause())
        
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


@cocotb.test()
async def run_test_error(dut):
    tb = TB(dut)
    seq_num = 0x02

    await tb.reset()

    
    await RisingEdge(dut.clk_i)
    await RisingEdge(dut.clk_i)
    await RisingEdge(dut.clk_i)
    dut.en_i.value = 1
    dut.link_up_i.value = 0
    dut.ts1_valid_i.value = 0xF
    dut.ts2_valid_i.value = 0x0
    dut.idle_valid_i.value = 0x0
    dut.link_num_i.value = 0xf7f7f7f7
    dut.lane_num_i.value = 0xf7f7f7f7
    dut.rate_id_i.value =  0xf7f7f7f7
    dut.lane_num_transmitted_i.value = 0x03020100
    dut.lane_active_i.value = 0xF
    await RisingEdge(dut.clk_i)
    length = random.randint(1, 32)
    for i in range(20):
        await RisingEdge(dut.clk_i)
    for i in range(20):
        await RisingEdge(dut.clk_i)
    for i in range(200):
        await RisingEdge(dut.clk_i)
    await RisingEdge(dut.clk_i)
    dut.link_num_i.value = 0x01010101
    for i in range(200):
        await RisingEdge(dut.clk_i)
    dut.lane_num_i.value = 0x03020100
    for i in range(2000):
        await RisingEdge(dut.clk_i)
    flag = 0
    while(dut.error_o.value == 0 and flag < 5000):
        await RisingEdge(dut.clk_i)
        flag += 1
        
@cocotb.test()
async def run_test_complete(dut):
    tb = TB(dut)
    cur_id = 1
    seq_num = 0x02

    await tb.reset()
    tb.sink.set_pause_generator(cycle_pause())
    
    await RisingEdge(dut.clk_i)
    await RisingEdge(dut.clk_i)
    await RisingEdge(dut.clk_i)
    dut.en_i.value = 1
    dut.link_up_i.value = 0
    dut.ts1_valid_i.value = 0xF
    dut.ts2_valid_i.value = 0x0
    dut.idle_valid_i.value = 0x0
    dut.link_num_i.value = 0xf7f7f7f7
    dut.lane_num_i.value = 0xf7f7f7f7
    dut.rate_id_i.value =  0xf7f7f7f7
    dut.lane_num_transmitted_i.value = 0x03020100
    dut.lane_active_i.value = 0xF
    
    await RisingEdge(dut.clk_i)
    ts1_cnt = 0
    # send ts1 linkwidth accept
    for k in range(100):
        await RisingEdge(dut.clk_i)
        dut.ts1_valid_i.value = 0x0
        dut.link_num_i.value = 0x0
        for i in range(1):
            await RisingEdge(dut.clk_i)
        data = await with_timeout(tb.sink.recv(),100000,'ns')
        data_bytes = bytes(data)
        # print(int.from_bytes(data_bytes[6:7],"big"))
        if(int.from_bytes(data_bytes[1:2],"big") == 45):
            ts1_cnt += 1
        if(ts1_cnt >= 16):
            ts1_cnt = 0
            break
        dut.ts1_valid_i.value = 0xF
        

  # send ts1 lanewidth accept
    for k in range(100):
        await RisingEdge(dut.clk_i)
        dut.ts1_valid_i.value = 0x0
        dut.lane_num_i.value = 0x03020100
        for i in range(1):
            await RisingEdge(dut.clk_i)
        data = await with_timeout(tb.sink.recv(),100000,'ns')
        data_bytes = bytes(data)
        print(int.from_bytes(data_bytes[7:8],"big"))
        if(int.from_bytes(data_bytes[7:8],"big") == 69):
            ts1_cnt += 1
        if(ts1_cnt >= 16):
            ts1_cnt = 0
            break
        dut.ts1_valid_i.value = 0xF
        

    # send ts2 config accept
    for k in range(100):
        await RisingEdge(dut.clk_i)
        dut.ts2_valid_i.value = 0x0
        dut.rate_id_i.value = 0b00000111
        dut.lane_num_i.value = 0x03020100
        for i in range(1):
            await RisingEdge(dut.clk_i)
        data = await with_timeout(tb.sink.recv(),100000,'ns')
        data_bytes = bytes(data)
        # print(int.from_bytes(data_bytes[7:8],"big"))
        if(int.from_bytes(data_bytes[7:8],"big") == 69):
            ts1_cnt += 1
        if(ts1_cnt >= 9):
            ts1_cnt = 0
            break
        dut.ts2_valid_i.value = 0xF
        
        
    # send ts2 config accept
    for k in range(100):
        await RisingEdge(dut.clk_i)
        dut.ts2_valid_i.value = 0x0
        dut.rate_id_i.value = 0b00000111
        dut.idle_valid_i.value = 0x0
        dut.lane_num_i.value = 0x03020100
        for i in range(1):
            await RisingEdge(dut.clk_i)
        data = await with_timeout(tb.sink.recv(),100000,'ns')
        data_bytes = bytes(data)
        print(int.from_bytes(data_bytes[7:8],"big"))
        if(int.from_bytes(data_bytes[7:8],"big") == 124):
            ts1_cnt += 1
        if(ts1_cnt >= 16):
            ts1_cnt = 0
            break
        dut.idle_valid_i.value = 0xF
        
    dut.en_i.value = 0
    for i in range(100):
        await RisingEdge(dut.clk_i)
        
        
        