# ==========================================================================
#
#  Morgan State University
#  Open Hardware Acceleration Lab (HAL-O)
#
#!  Project:   Open-Source PCIe Endpoint Controller.
#   File:      pcie_coverate_monior.py
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
from pipe_agent import pipe_seq_item

class pcie_coverage_monitor(uvm_component):
    def __init__(self, name = "pcie_coverage_monitor", parent=None):
        super().__init__(name, parent)
        self.pipe_seq_item_h = None
        self.pcie_coverage_monitor_cov = None  # type: covergroup  
        self.analysis_export_sent = None
        self.analysis_export_received = None

    def build_phase(self):
        # uvm_info(get_name(), "Enter pcie_coverage_monitor build_phase", UVM_MEDIUM)
        self.analysis_export_sent = uvm_analysis_port("analysis_export_sent",self)
        self.analysis_export_received = uvm_analysis_port("analysis_export_received",self)
        # uvm_info(get_name(), "Exit pcie_coverage_monitor build_phase", UVM_MEDIUM)
        # endfunction:build_phase

    def report_phase(self):
        ...
        # endfunction:report_phase

    def write_received(self, lpif_seq_item_h):
        ...
        # endfunction:write_lpif_received

    def write_sent(self, pipe_seq_item_h) :
        ...
        # endfunction:write_pipe_received
