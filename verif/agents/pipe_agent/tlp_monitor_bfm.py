# ==========================================================================
#
#  Morgan State University
#  Open Hardware Acceleration Lab (HAL-O)
#
#!  Project:   Open-Source PCIe Endpoint Controller.
#   File:      tip_monitor_bfm.py
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

import pyuvm
from cocotb.triggers import *
from base_uvm import *
from pipe_types import *
from descrambler_scrambler import *
from pyuvm import *
from cocotb.types import Bit,Logic, LogicArray
from pipe_agent import pipe_monitor
from cocotb.types.range import Range
from cocotb.triggers import FallingEdge, RisingEdge, Timer, Event, with_timeout, First
from cocotbext.axi import AxiStreamFrame, AxiStreamBus, AxiStreamSource, AxiStreamSink, AxiStreamMonitor
from cocotbext.pcie.core import RootComplex, MemoryEndpoint, Device, Switch
from cocotbext.pcie.core.dllp import Dllp, DllpType, FcScale
from cocotbext.pcie.core.tlp import Tlp, TlpType
from cocotb.log import SimLog



class tlp_monitor_bfm():
    def __init__(self, name = "pipe_agent_h", parent= None):
        self.dut = cocotb.top
        self.sink_tlp = AxiStreamSink(AxiStreamBus.from_prefix(
            self.dut, "m_tlp_axis"), self.dut.clk_i, self.dut.rst_i)
        self.sink_tlp.log = SimLog("cocotb.tb")

    async def start(self):
        while True:
            datum = await self.sink_tlp.recv()
            # print(f"\n\n\n\n\nMONITORED {[hex(b) for b in datum.tdata]}")
            self.proxy.notify_mac_tlp_received(datum.tdata)
            # assert 1 == 0

