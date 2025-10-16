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

from pyuvm import *

class pcie_env_config(uvm_component):
    def __init__(self, name = "pcie_env_config"):
        super().__init__(name)
        self.has_scoreboard       =  1  # type: bit  
        self.has_coverage_monitor =  1  # type: bit  
        # self.lpif_agent_config_h  = None  # type: lpif_agent_config  
        self.pipe_agent_config_h  = None  # type: pipe_agent_config  
