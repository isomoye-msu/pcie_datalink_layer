import itertools
import logging
import os
import random
import subprocess
import sys

import cocotb_test.simulator
import pytest

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

        self.log = logging.getLogger("cocotb.tb")
        self.log.setLevel(logging.DEBUG)

        cocotb.start_soon(Clock(dut.clk, 2, units="ns").start())

        self.source = AxiStreamSource(AxiStreamBus.from_prefix(dut, "s_axis_tlp"), dut.clk, dut.rst)
        self.sink = AxiStreamSink(AxiStreamBus.from_prefix(dut, "m_axis_dllp"), dut.clk, dut.rst)
        #self.monitor = AxiStreamMonitor(AxiStreamBus.from_prefix(dut, "axis"), dut.clk, dut.rst)

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

    #id_count = 2**len(tb.source.bus.tid)
    idle_inserter = [None, cycle_pause]
    backpressure_inserter = [None, cycle_pause]

    cur_id = 1

    await tb.reset()

    tb.set_idle_generator(None)
    tb.set_backpressure_generator(None)
    
    
    await RisingEdge(dut.clk)
    await RisingEdge(dut.clk)
    await RisingEdge(dut.clk)
    dut.tx_fc_ph.value = 0x16
    dut.tx_fc_pd.value = 0xF40
    dut.tx_fc_nph.value = 0x016
    dut.tx_fc_npd.value = 0xF40
    #dut.retry_available.value = 1
    # dut.ack_nack.value = 1
    # dut.ack_nack_vld.value = 0
    # dut.ack_seq_num.value = 0x03
    await RisingEdge(dut.clk)
    
    
    length = random.randint(35, 45)
    test_data = bytearray(itertools.islice(itertools.cycle(range(255)), length))
    test_tlp = Tlp()
    test_tlp.fmt_type = random.choice([TlpType.MEM_WRITE])
    if test_tlp.fmt_type == TlpType.MEM_WRITE:
        test_tlp.set_addr_be_data(1*4, test_data)
        test_tlp.tag = 1
        test_tlp.requester_id = 1
    elif test_tlp.fmt_type == TlpType.MEM_READ:
        test_tlp.set_addr_be(1*4, length)
        test_tlp.tag = 1
        test_tlp.requester_id = 1
    data = test_tlp.pack()
        
    test_frame = AxiStreamFrame(data)
    await tb.source.send(test_frame)
    #
    # data_in = await tb.sink.recv()
    #await axis_source.wait()
        
    # await axis_source.send(test_data)
    # await axis_source.wait()
    # data_in = await axis_sink.recv()
    # await axis_source.send(test_data)
    # await axis_source.wait()
    #
            
    for i in range(300):
         await RisingEdge(dut.clk)
        
    await RisingEdge(dut.clk)    
    
    dut.ack_seq_num.value = 0x00
    dut.ack_nack_vld.value = 1
    dut.ack_nack.value = 1
    
    for i in range(30):
        await RisingEdge(dut.clk)
    # await RisingEdge(dut.clk)
    # dut.ack_nack_vld.value = 0
    # for i in range(20):
    #     await RisingEdge(dut.clk)
    # data_in = await tb.sink.recv()

    

# async def generate_clock(dut):
    # """Generate clock pulses."""
# 
    # for cycle in range(10):
        # dut.clk.value = 0
        # await Timer(1, units="ns")
        # dut.clk.value = 1
        # await Timer(1, units="ns")
# 
# 
# @cocotb.test()
# async def my_second_test(dut):
    # """Try accessing the design."""
    # PERIOD = 10
    # 
    # log = logging.getLogger("cocotb.tb")
    # log.setLevel(logging.DEBUG)
# 
    # await cocotb.start(generate_clock(dut))  # run the clock "in the background"
# 
    # await Timer(5, units="ns")  # wait a bit
    # await FallingEdge(dut.clk)  # wait for falling edge/"negedge"
# 
    # await RisingEdge(dut.clk)  # wait for falling edge/"negedge"
    # dut.rst.value = 1
    # await RisingEdge(dut.clk)  # wait for falling edge/"negedge"
    # await RisingEdge(dut.clk)  # wait for falling edge/"negedge"
    # await RisingEdge(dut.clk)  # wait for falling edge/"negedge"
    # dut.rst.value = 0
# 
# 
    # 
# 
    #dut._log.info("ready out is %s", dut.m_axis_tvalid.value)
    #assert dut.s_axis_tready.value == 0, "s_axis_tready is not 0!"
# 
    # axis_source = AxiStreamSource(AxiStreamBus.from_prefix(dut, "s_axis"), dut.clk, dut.rst)
    #axis_sink = AxiStreamSink(AxiStreamBus.from_prefix(dut, "m_axis"), dut.clk, dut.rst)
    # 
    # dut.retry_available.value = 1
    # dut.retry_index.value = 0
    # dut.tx_fc_ph.value = 0x01
    # dut.tx_fc_pd.value = 0x040
    # dut.tx_fc_nph.value = 0x01
    # dut.tx_fc_npd.value = 0x040
    # dut.m_axis_tready.value = 1
    # data = [0x09,0x00, 0x00, 0x00, 0x01,0x01,0x55,0xaa,0x12,0x34] 
    # await axis_source.send(data)
    # await axis_source.wait()
    # data_in = await axis_sink.recv()
    # 
    
    # data = [0x05,0x00, 0x00, 0x00, 0x01,0x01] 
    # await axis_source.send(data)
    # await axis_source.wait()
    # data = await axis_sink.recv()
    # data = [0x05,0x00, 0x00, 0x00, 0x01,0x01] 
    # 
    # length = random.randint(35, 45)
    # test_data = bytearray(itertools.islice(itertools.cycle(range(255)), length))
    # test_tlp = Tlp()
    # test_tlp.fmt_type = random.choice([TlpType.MEM_WRITE])
    # if test_tlp.fmt_type == TlpType.MEM_WRITE:
        # test_tlp.set_addr_be_data(1*4, test_data)
        # test_tlp.tag = 1
        # test_tlp.requester_id = 1
    # elif test_tlp.fmt_type == TlpType.MEM_READ:
        # test_tlp.set_addr_be(1*4, length)
        # test_tlp.tag = 1
        # test_tlp.requester_id = 1
    # data = test_tlp.get_data()
    # 
    # test_frame = AxiStreamFrame(data)
    # await axis_source.send(data)
    
    #data_in = await axis_sink.recv()
    # await axis_source.wait()
    
    # await axis_source.send(test_data)
    # await axis_source.wait()
    # data_in = await axis_sink.recv()
 
    # await axis_source.send(test_data)
    # await axis_source.wait()
    # data_in = await axis_sink.recv()
            
    # await Timer(20*PERIOD, units='ns')