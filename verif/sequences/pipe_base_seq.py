# ==========================================================================
#
#  Morgan State University
#  Open Hardware Acceleration Lab (HAL-O)
#
#!  Project:   Open-Source PCIe Endpoint Controller.
#   File:      pip_base_seq.py
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
from pyuvm import *

class pipe_base_seq(uvm_sequence):
    
    def __init__(self, name="pipe_base_seq"):
        super().__init__(name)
        self.pipe_agent_config = None
        self.tses = []


    async def body(self):
        await super().body()
        # self.pipe_agent_config = ConfigDB().get(None,"pipe_seq", "pipe_agent_config")
        # if not self.pipe_agent_config:
        #     self.log.fatal(self.name,"Cannot get PIPE Agent configuration from uvm_config_db")
