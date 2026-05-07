# ==========================================================================
#
#  Morgan State University
#  Open Hardware Acceleration Lab (HAL-O)
#
#!  Project:   Open-Source PCIe Endpoint Controller.
#   File:      test_pcie_core.py
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
# from cocotb_vivado import run
import subprocess
import os
import pathlib
import pyuvm
from pyuvm import *
from cocotb.triggers import *
from pcie_env import *
from pipe_agent_config import *
from pipe_link_up_seq import *
from pipe_speed_change_with_equalization_seq import *
from pcie_flow_control_seq import *
from pcie_enumeration_seq import *


class OnFallingSignal:
    def __init__(self, signal):
        self.signal = signal
        self.timer = Timer(100, "ns")

    def __await__(self):
        return self._async_method().__await__()

    async def _async_method(self):
        prev = self.signal.value
        while True:
            await self.timer
            now = self.signal.value
            if prev.is_resolvable and now.is_resolvable and prev == 1 and now == 0:
                break
            prev = now


class OnRisingSignal:
    def __init__(self, signal):
        self.signal = signal
        self.timer = Timer(100, "ns")

    def __await__(self):
        return self._async_method().__await__()

    async def _async_method(self):
        prev = self.signal.value.binstr
        while True:
            await self.timer
            now = self.signal.value.binstr
            if  prev == "0" and now == "1":
                break
            prev = now


cocotb.triggers.FallingEdge = OnFallingSignal
cocotb.triggers.RisingEdge = OnRisingSignal


@pyuvm.test()
class link_up_test(uvm_test):
    """Test PCIe phy ctrl by going through ltssm sequence"""

    def build_phase(self):
        self.log = logging.getLogger("link_up_test.tb")
        self.logger.setLevel(logging.DEBUG)
        uvm_report_object.set_default_logging_level(DEBUG)
        self.pcie_env_config = pcie_env_config("pcie_env_config")
        self.pipe_agent_config_h = pipe_agent_config("pipe_agent_config_h")
        self.pcie_env_config.pipe_agent_config_h = self.pipe_agent_config_h
        ConfigDB().set(None, "*", "pcie_env_config_h", self.pcie_env_config)
        self.env = pcie_env.create("pcie_env",self)
        
    def end_of_elaboration_phase(self):
        self.test_all = pipe_link_up_seq("test fc1")
        self.test_all.pipe_agent_config = self.pipe_agent_config_h
        self.speed_change = pipe_speed_change_with_equalization_seq("speed_change")
        self.speed_change.pipe_agent_config = self.pipe_agent_config_h
        self.flow_control = pcie_flow_control_seq("flow control")
        self.flow_control.pipe_agent_config = self.pipe_agent_config_h
        self.enumeration = pcie_enumeration_seq("enumeration")
        self.enumeration.pipe_agent_config = self.pipe_agent_config_h

    async def run_phase(self):
        self.raise_objection()
        await with_timeout(self.test_all.start(),25000,'ns')
        # await with_timeout(self.flow_control.start(),15000,'ns')
        await with_timeout(self.enumeration.start(),1000000,'ns')
        # await with_timeout(self.speed_change.start(),15000,'ns')
        self.drop_objection()
