# ==========================================================================
#
#  Morgan State University
#  Open Hardware Acceleration Lab (HAL-O)
#
#!  Project:   Open-Source PCIe Endpoint Controller.
#   File:      test_ltssm_configuration.py
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
from cocotb.binary import BinaryValue
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

        cocotb.start_soon(Clock(dut.clk_i, 5, units="ns").start())
        #self.sink = [AxiStreamSink(AxiStreamBus.from_prefix(dut, f"m{k:02d}_axis"), dut.clk_i, dut.rst_i) for k in range(ports)]
        # self.sink = AxiStreamSink(AxiStreamBus.from_prefix(dut, "m_axis"), dut.clk_i, dut.rst_i)
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


# @cocotb.test()
# async def run_test_error(dut):
#     tb = TB(dut)
#     seq_num = 0x02

#     await tb.reset()

    
#     await RisingEdge(dut.clk_i)
#     await RisingEdge(dut.clk_i)
#     await RisingEdge(dut.clk_i)
#     dut.en_i.value = 1
#     dut.link_up_i.value = 0
#     dut.num_active_lanes_i.value = 0x8
#     dut.ts1_valid_i.value = 0xF
#     dut.ts2_valid_i.value = 0x0
#     dut.idle_valid_i.value = 0x0
#     dut.idle_valid_i.value = 0x0
#     dut.link_num_i.value = 0xf7f7f7f7
#     dut.lane_num_i.value = 0xf7f7f7f7
#     dut.rate_id_i.value =  0xf7f7f7f7
#     # dut.curr_data_rate_i.value = 0x7
#     dut.lane_num_transmitted_i.value = 0x03020100
#     dut.lane_active_i.value = 0xF
#     await RisingEdge(dut.clk_i)
#     length = random.randint(1, 32)
    
#     dut.lane_status_i.value = 0x3
#     dut.idle_valid_i.value = 0x1
#     for i in range(20000):
#         await RisingEdge(dut.clk_i)
#     dut.idle_valid_i.value = 0x0
#     for i in range(20):
#         await RisingEdge(dut.clk_i)
#     for i in range(20):
#         await RisingEdge(dut.clk_i)
#     for i in range(200):
#         await RisingEdge(dut.clk_i)
#     await RisingEdge(dut.clk_i)
#     dut.link_num_i.value = 0x00000000
#     for i in range(200):
#         await RisingEdge(dut.clk_i)
#     dut.lane_num_i.value = 0x03020100
#     dut.ts2_valid_i.value = 0xF
#     for i in range(2000):
#         await RisingEdge(dut.clk_i)
#     flag = 0
#     while(dut.error_o.value == 0 and flag < 5000):
#         await RisingEdge(dut.clk_i)
#         flag += 1

async def loopback(dut):
    while(1):
        dut.phy_rxdata.value        = dut.phy_txdata.value
        dut.phy_rxdata_valid.value  = dut.phy_txdata_valid.value
        dut.phy_rxdatak.value       = dut.phy_txdatak.value
        dut.phy_rxsync_header.value = dut.phy_txsync_header.value
        await RisingEdge(dut.clk_i)
        
    # dut.ts1_valid_i.value = 0x0
    # dut.ts2_valid_i.value = 0x0
    # dut.idle_valid_i.value = 0x0
    # dut.lane_status_i.value = 0x0
    # dut.curr_data_rate_i = 0x2
    

@cocotb.test()
async def run_test_loopback(dut):
    tb = TB(dut)
    cur_id = 1
    seq_num = 0x02
    # dut.curr_data_rate_i = 0x2
    # tb.sink.log.setLevel(logging.ERROR)

    await tb.reset()
    cocotb.start_soon(loopback(dut))
    # tb.sink.set_pause_generator(cycle_pause())
    
    await RisingEdge(dut.clk_i)
    await RisingEdge(dut.clk_i)
    await RisingEdge(dut.clk_i)
    dut.en_i.value = 1
    dut.num_active_lanes_i.value = 8
    phy_status = BinaryValue(0)
    rxstatus = BinaryValue(0)
    
    
    for i in range(8):
        phy_status = (phy_status << 1) | 0x1
        rxstatus = (rxstatus << 3) | 0b011 
        
    
    dut.phy_phystatus.value = phy_status
    dut.phy_rxstatus.value = rxstatus 
    print(phy_status)
    print(rxstatus)
    
    # assert 1 == 0
        
    # dut.phy_phystatus.value = 
    dut.lane_active_i.value = 0xFF
    dut.lane_status_i.value = 0xFF
    dut.phy_rxelecidle.value = 0xFF
    
    # dut.directed_speed_change_i.value =
    
    await Timer(500,'us')
    # dut.link_up_i.value = 0
    # dut.ts1_valid_i.value = 0x0
    # dut.ts2_valid_i.value = 0x0
    # dut.idle_valid_i.value = 0x0
    # dut.lane_status_i.value = 0x0
    # dut.curr_data_rate_i = 0x2
    # dut.link_num_i.value = 0xf7f7f7f7f7f7f7f7
    # dut.lane_num_i.value = 0xf7f7f7f7f7f7f7f7
    # dut.rate_id_i.value =  0x0e0e0e0e0e0e0e
    # dut.num_active_lanes_i.value = 8
    # dut.lane_num_transmitted_i.value = 0x0706050403020100
    # dut.lane_active_i.value = 0xFF
    
    
    # dut.lane_status_i.value = 0xFF
    # dut.idle_valid_i.value = 0x1
    # for i in range(50):
        # await RisingEdge(dut.clk_i)
    # dut.idle_valid_i.value = 0x0
    # 
    # for k in range(3000):
    #   await RisingEdge(dut.clk_i)
    # 
    # ts1_cnt = 0
    # dut.ts1_valid_i.value = 0xFF


# @cocotb.test()
async def run_test_complete(dut):
    tb = TB(dut)
    cur_id = 1
    seq_num = 0x02
    # dut.curr_data_rate_i = 0x2
    tb.sink.log.setLevel(logging.ERROR)

    await tb.reset()
    tb.sink.set_pause_generator(cycle_pause())
    
    await RisingEdge(dut.clk_i)
    await RisingEdge(dut.clk_i)
    await RisingEdge(dut.clk_i)
    dut.en_i.value = 1
    dut.link_up_i.value = 0
    dut.ts1_valid_i.value = 0x0
    dut.ts2_valid_i.value = 0x0
    dut.idle_valid_i.value = 0x0
    dut.lane_status_i.value = 0x0
    # dut.curr_data_rate_i = 0x2
    dut.link_num_i.value = 0xf7f7f7f7f7f7f7f7
    dut.lane_num_i.value = 0xf7f7f7f7f7f7f7f7
    dut.rate_id_i.value =  0x0e0e0e0e0e0e0e
    dut.num_active_lanes_i.value = 8
    dut.lane_num_transmitted_i.value = 0x0706050403020100
    dut.lane_active_i.value = 0xFF
    
    
    dut.lane_status_i.value = 0xFF
    dut.idle_valid_i.value = 0x1
    for i in range(50):
        await RisingEdge(dut.clk_i)
    dut.idle_valid_i.value = 0x0
    
    for k in range(3000):
      await RisingEdge(dut.clk_i)
    
    ts1_cnt = 0
    dut.ts1_valid_i.value = 0xFF
     # send ts1 linkwidth accept
#     for k in range(50):
#         await RisingEdge(dut.clk_i)
#         # dut.ts1_valid_i.value = 0x0
#         # dut.link_num_i.value = 0x0
#         for i in range(1):
#             await RisingEdge(dut.clk_i)
#         data = await with_timeout(tb.sink.recv(),100000,'ns')
#         data_bytes = bytes(data)
#         # print(int.from_bytes(data_bytes[6:7],"big"))
#         if(int.from_bytes(data_bytes[1:2],"big") == 45):
#             ts1_cnt += 1
#         if(ts1_cnt >= 16):
#             ts1_cnt = 0
#             break
#         # dut.ts1_valid_i.value = 0xF
        
#     await RisingEdge(dut.clk_i)
#     ts1_cnt = 0
#     dut.link_num_i.value = 0x0
#     # send ts1 linkwidth accept
#     for k in range(20):
#         await RisingEdge(dut.clk_i)
#         # dut.ts1_valid_i.value = 0x0
#         for i in range(1):
#             await RisingEdge(dut.clk_i)
#         data = await with_timeout(tb.sink.recv(),100000,'ns')
#         data_bytes = bytes(data)
#         # print(int.from_bytes(data_bytes[6:7],"big"))
#         if(int.from_bytes(data_bytes[1:2],"big") == 45):
#             ts1_cnt += 1
#         if(ts1_cnt >= 16):
#             ts1_cnt = 0
#             break
#         # dut.ts1_valid_i.value = 0xF
        
#     dut.ts1_valid_i.value = 0xFF
#     # dut.ts2_valid_i.value = 0xFF
# #   send ts1 lanewidth accept
#     for k in range(10):
#         await RisingEdge(dut.clk_i)
#         # dut.ts1_valid_i.value = 0x0
#         dut.lane_num_i.value = 0x0706050403020100
#         for i in range(1):
#             await RisingEdge(dut.clk_i)
#         data = await with_timeout(tb.sink.recv(),100000,'ns')
#         data_bytes = bytes(data)
#         # print(int.from_bytes(data_bytes[7:8],"big"))
#         if(int.from_bytes(data_bytes[7:8],"big") == 69):
#             ts1_cnt += 1
#         if(ts1_cnt >= 16):
#             ts1_cnt = 0
#             break
        
#     dut.ts1_valid_i.value = 0x00
#     dut.ts2_valid_i.value = 0xFF
# #   send ts1 lanewidth accept
#     for k in range(20):
#         await RisingEdge(dut.clk_i)
#         # dut.ts1_valid_i.value = 0x0
#         dut.lane_num_i.value = 0x0706050403020100
#         for i in range(1):
#             await RisingEdge(dut.clk_i)
#         data = await with_timeout(tb.sink.recv(),100000,'ns')
#         data_bytes = bytes(data)
#         # print(int.from_bytes(data_bytes[7:8],"big"))
#         if(int.from_bytes(data_bytes[7:8],"big") == 69):
#             ts1_cnt += 1
#         if(ts1_cnt >= 16):
#             ts1_cnt = 0
#             break
#         # dut.ts1_valid_i.value = 0xF
#     dut.ts1_valid_i.value = 0x00
#     dut.ts2_valid_i.value = 0x00
#     dut.idle_valid_i.value = 0xFF
#     # send ts2 config accept
#     for k in range(200):
#         await RisingEdge(dut.clk_i)
        # dut.rate_id_i.value = 0b00000111
        # dut.lane_num_i.value = 0x03020100
        # for i in range(1):
        #     await RisingEdge(dut.clk_i)
        # data = await with_timeout(tb.sink.recv(),100000,'ns')
        # data_bytes = bytes(data)
        # # print(int.from_bytes(data_bytes[7:8],"big"))
        # if(int.from_bytes(data_bytes[7:8],"big") == 69):
        #     ts1_cnt += 1
        # if(ts1_cnt >= 9):
        #     ts1_cnt = 0
        #     break
        # dut.ts2_valid_i.value = 0xF
        
        
#     # # send ts2 config accept
#     # for k in range(100):
#     #     await RisingEdge(dut.clk_i)
#     #     dut.ts2_valid_i.value = 0xFF
#     #     dut.rate_id_i.value = 0b00000111
#     #     dut.idle_valid_i.value = 0x0
#     #     dut.lane_num_i.value = 0x03020100
#     #     for i in range(1):
#     #         await RisingEdge(dut.clk_i)
#     #     data = await with_timeout(tb.sink.recv(),100000,'ns')
#     #     data_bytes = bytes(data)
#     #     print(int.from_bytes(data_bytes[7:8],"big"))
#     #     if(int.from_bytes(data_bytes[7:8],"big") == 124):
#     #         ts1_cnt += 1
#     #     if(ts1_cnt >= 16):
#     #         ts1_cnt = 0
#     #         break
#     #     # dut.idle_valid_i.value = 0xF
        
#     # dut.en_i.value = 0
    await Timer(500,'us')
    # for i in range(10000000):
    #     await RisingEdge(dut.clk_i)
        
        
        