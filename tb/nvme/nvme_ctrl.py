# ==========================================================================
#
#  Morgan State University
#  Open Hardware Acceleration Lab (HAL-O)
#
#!  Project:   Open-Source PCIe Endpoint Controller.
#   File:      nvme_ctrl.py
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

import queue
import utils
from utils import *


class nvme_dev():
    def __init__(self) -> None:
        self.node = []
        self.nvme_queue = []
        self.dbs = None
        self.pcie_dev = None
        self.prp_page_pool    = []
        self.prp_small_pool   = []
        self.instance
        self.queue_count
        self.db_stride
        self.ctrl_config
        self.entry
        self.bar  = nvme_bar()
        self.namespaces = []
        self.serial  = []
        self.model  = []
        self.firmware_rev = []
        

#
 # An NVM Express namespace is equivalent to a SCSI LUN
 #/
class nvme_ns():
    def __init__(self) -> None:
        self.list = []
        
        self.dev = nvme_dev()
        self.queue = []
        self.disk = None

        self.ns_id
        self.lba_shift
        
        
# An NVM Express queue.  Each device has at least two (one for admin
# commands and one for I/O commands).
#
class nvme_queue():
    def __init__(self) -> None:
        self.dmadev = None
        self.dev =  nvme_dev()
        self.q_lock = False
        self.sq_cmds = [nvme_command for i in range(1)]
        self.cqes = [nvme_completion for i in range(1)]
        self. sq_dma_addr
        self. cq_dma_addr
        self. sq_full
        self. sq_cong_wait
        self.sq_cong
        self.q_db
        self.q_depth
        self.cq_vector
        self.sq_head
        self.sq_tail
        self.cq_head
        self.cq_phase
        self.cmdid_data = []
        
class nvme_completion_fn():
    def __init__(self) -> None:
        pass
        
class nvme_cmd_info():
    def __init__(self):
        self.fn = nvme_completion_fn


class NVMeController:
    def __init__(self):
        pass

    def initialize(self):
        pass

    def get_info(self):
        pass

    def list_namespaces(self):
        pass

    def select_namespace(self, ns_id):
        pass

    def read_data(self, lba, count):
        pass

    def write_data(self, lba, data):
        pass

    def format_namespace(self):
        pass

    # Other functions for admin commands, monitoring, etc.

class NVMeLibrary:
    def __init__(self):
        pass

    def connect_controller(self):
        pass

    def disconnect_controller(self):
        pass

    # Other utility functions, error handling, etc.