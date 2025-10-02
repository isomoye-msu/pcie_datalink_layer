# ==========================================================================
#
#  Morgan State University
#  Open Hardware Acceleration Lab (HAL-O)
#
#!  Project:   Open-Source PCIe Endpoint Controller.
#   File:      tip_driver_bfm.py
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

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Join, Combine
from pyuvm import *
import itertools
import random
import cocotb
import pyuvm
#import cocotb_test.simulator
# All testbenches use tinyalu_utils, so store it in a central
# place and add its path to the sys path so we can import it
import sys
from cocotb.triggers import FallingEdge, RisingEdge, Timer, Event, with_timeout, First
from cocotbext.axi import AxiStreamFrame, AxiStreamBus, AxiStreamSource, AxiStreamSink, AxiStreamMonitor
from cocotbext.pcie.core import RootComplex, MemoryEndpoint, Device, Switch
from cocotbext.pcie.core.dllp import Dllp, DllpType, FcScale
from cocotbext.pcie.core.tlp import Tlp, TlpType

class tlp_driver_bfm():
    def __init__(self, name = "pipe_driver_bfm", parent=None, pipe_interface = None):
        # super().__init__(name)
        self.name = name
        self.dut = cocotb.top
        self.tlp_sender = AxiStreamSource(AxiStreamBus.from_prefix(
            self.dut, "s_tlp_axis"), self.dut.clk_i, self.dut.rst_i)
        uvm_root().logger.info(name + " initiated") 
        self.tlp_sender.log = uvm_root().logger


    async def send_tlp(self,tlp):
        test_frame = AxiStreamFrame(tlp.pack())
        await self.tlp_sender.send(test_frame)
