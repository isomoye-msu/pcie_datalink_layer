# ==========================================================================
#
#  Morgan State University
#  Open Hardware Acceleration Lab (HAL-O)
#
#!  Project:   Open-Source PCIe Endpoint Controller.
#   File:      axis_retry_fifo.v
#   Author:    HALO
#   Created:   <Date>
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
from pyuvm import *
# from phy_logical.verif.agents.pipe_agent import *
from pipe_agent import *
from cocotb.clock import Clock
from pcie_coverage_monitor import *
from pcie_scoreboard import *

class pcie_env_config(uvm_component):
    def __init__(self, name = "pcie_env_config",parent =None):
        super().__init__(name,parent)
        self.has_scoreboard       =  1  # type: bit  
        self.has_coverage_monitor =  1  # type: bit  
        # self.lpif_agent_config_h  = None  # type: lpif_agent_config  
        self.pipe_agent_config_h  = None  # type: pipe_agent_config  


class pcie_env(uvm_env):

    def __init__(self, name = "pcie_env", parent=None):
        super().__init__(name, parent)
        self.dut = cocotb.top
        self.pipe_agent_h = None  # type: pipe_agent  
        self.tlp_agent_h = None
        self.pcie_env_config_h = None  # type: pcie_env_config  
        self.pcie_scoreboard_h = None  # type: pcie_scoreboard  
        self.pcie_coverage_monitor_h = None  # type: pcie_coverage_monitor  
        self.logger.info(name + "env initiated") 
 
    def build_phase(self) :
        self.dut = cocotb.top
        # self.logger.info("indsie build phase")
        self.pcie_env_config_h = ConfigDB().get(self,"","pcie_env_config_h")
        if self.pcie_env_config_h is None:
            self.logger.fatal("CONFIG_LOAD", "Cannot get() configuration pcie_env_config from uvm_config_db. Have you set() it?")
        ConfigDB().set(None, "*", "pipe_agent_config_h", self.pcie_env_config_h.pipe_agent_config_h)
        self.pipe_agent_h = pipe_agent.create("pipe_agent_h", self)

        if(self.pcie_env_config_h.has_scoreboard):
            self.pcie_scoreboard_h = pcie_scoreboard("pcie_scoreboard_h",self)

        if(self.pcie_env_config_h.has_coverage_monitor):
            self.pcie_coverage_monitor_h = pcie_coverage_monitor("pcie_coverage_monitor_h", self)


    def connect_phase(self) :
        # super().connect_phase()
        # uvm_info(get_name(), "Enter pcie_env connect_phase", UVM_MEDIUM)
        if(self.pcie_env_config_h.has_scoreboard):
            self.pipe_agent_h.ap_sent.connect(self.pcie_scoreboard_h.pipe_export_sent)
            self.pipe_agent_h.ap_received.connect(self.pcie_scoreboard_h.pipe_export_received)

        if(self.pcie_env_config_h.has_coverage_monitor):
            self.pipe_agent_h.ap_sent.connect(self.pcie_coverage_monitor_h.analysis_export_sent)
            self.pipe_agent_h.ap_received.connect(self.pcie_coverage_monitor_h.analysis_export_received)