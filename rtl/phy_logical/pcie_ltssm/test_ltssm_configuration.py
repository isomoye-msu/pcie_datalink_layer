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

        cocotb.start_soon(Clock(dut.clk, 2, units="ns").start())
        #self.sink = [AxiStreamSink(AxiStreamBus.from_prefix(dut, f"m{k:02d}_axis"), dut.clk, dut.rst) for k in range(ports)]
        self.sink = AxiStreamSink(AxiStreamBus.from_prefix(dut, "m_axis"), dut.clk, dut.rst)

    def set_idle_generator(self, generator=None):
        if generator:
            self.source.set_pause_generator(generator())

    def set_backpressure_generator(self, generator=None):
        if generator:
            self.sink.set_pause_generator(generator())

    async def reset(self):
        self.dut.rst.setimmediatevalue(0)
        await RisingEdge(self.dut.clk)
        await RisingEdge(self.dut.clk)
        self.dut.rst.value = 1
        await RisingEdge(self.dut.clk)
        await RisingEdge(self.dut.clk)
        self.dut.rst.value = 0
        await RisingEdge(self.dut.clk)
        await RisingEdge(self.dut.clk)

def cycle_pause():
    return itertools.cycle([1, 1, 1, 0])


@cocotb.test()
async def run_test(dut):

    tb = TB(dut)
    
    idle_inserter = [None, cycle_pause]
    backpressure_inserter = [None, cycle_pause]

    cur_id = 1
    seq_num = 0x02

    await tb.reset()

    tb.set_idle_generator(None)
    tb.set_backpressure_generator(None)
    
    
    await RisingEdge(dut.clk)
    await RisingEdge(dut.clk)
    await RisingEdge(dut.clk)
    dut.en.value = 1
    dut.link_up.value = 0
    dut.ts1_valid.value = 0xF
    dut.ts2_valid.value = 0x0
    dut.idle_valid.value = 0x0
    dut.link_num.value = 0xf7f7f7f7
    dut.lane_num.value = 0xf7f7f7f7
    dut.rate_id.value =  0xf7f7f7f7
    dut.lane_num_transmitted.value = 0x03020100
    dut.lane_active.value = 0xF
    # dut.tx_fc_nph.lanes_ts2_satisfied = 0x016
    # dut.tx_fc_npd.value = 0xF40
    #dut.retry_available.value = 1
    # dut.ack_nack.value = 1
    # dut.ack_nack_vld.value = 0
    # dut.link_status.value = 0x2
    await RisingEdge(dut.clk)
    
    
    length = random.randint(1, 32)
    for i in range(20):
        await RisingEdge(dut.clk)
         
    for i in range(20):
        await RisingEdge(dut.clk)
    for i in range(200):
        await RisingEdge(dut.clk)
        
    await RisingEdge(dut.clk)
    dut.link_num.value = 0x01010101
    
    for i in range(200):
        await RisingEdge(dut.clk)
    
    dut.lane_num.value = 0x03020100
    
        
    await RisingEdge(dut.error)
    #data_in = await tb.sink.recv()