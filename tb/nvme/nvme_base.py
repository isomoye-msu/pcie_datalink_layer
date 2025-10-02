# ==========================================================================
#
#  Morgan State University
#  Open Hardware Acceleration Lab (HAL-O)
#
#!  Project:   Open-Source PCIe Endpoint Controller.
#   File:      nvme_base.py
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

from cocotbext.pcie.core import RootComplex, MemoryEndpoint, Device, Switch
from cocotbext.pcie.core.caps import MsiCapability
from cocotbext.pcie.core.utils import PcieId

class NVMeControllerConfigurationRegister:
    def __init__(self):
        self.raw_data = 0

        # Define individual fields
        self.en = False
        self.css = 0
        self.mps = 0
        self.ams = 0
        self.shn = 0
        self.ie = False
        self.ms = False
        self.rrs = 0
        self.arb = False
        self.ams_ex = 0
        self.to = 0
        self.dstrd = False
        self.nssr = False
        self.cqr = False
        self.mn = 0
        self.mdts = False

    def unpack(self, data):
        # Unpack raw data into individual fields
        self.raw_data = int.from_bytes(data, byteorder='little')
        self.en = bool(self.raw_data & 0x01)
        self.css = (self.raw_data >> 4) & 0x07
        self.mps = (self.raw_data >> 7) & 0x07
        self.ams = (self.raw_data >> 10) & 0x07
        self.shn = (self.raw_data >> 13) & 0x03
        self.ie = bool((self.raw_data >> 15) & 0x01)
        self.ms = bool((self.raw_data >> 16) & 0x01)
        self.rrs = (self.raw_data >> 17) & 0x03
        self.arb = bool((self.raw_data >> 20) & 0x01)
        self.ams_ex = (self.raw_data >> 21) & 0x07
        self.to = (self.raw_data >> 24) & 0x0F
        self.dstrd = bool((self.raw_data >> 28) & 0x01)
        self.nssr = bool((self.raw_data >> 29) & 0x01)
        self.cqr = bool((self.raw_data >> 30) & 0x01)
        self.mn = (self.raw_data >> 31) & 0x01
        self.mdts = bool((self.raw_data >> 35) & 0x01)

    def pack(self):
        # Pack individual fields into raw data
        self.raw_data = 0
        self.raw_data |= int(self.en)
        self.raw_data |= (self.css & 0x07) << 4
        self.raw_data |= (self.mps & 0x07) << 7
        self.raw_data |= (self.ams & 0x07) << 10
        self.raw_data |= (self.shn & 0x03) << 13
        self.raw_data |= int(self.ie) << 15
        self.raw_data |= int(self.ms) << 16
        self.raw_data |= (self.rrs & 0x03) << 17
        self.raw_data |= int(self.arb) << 20
        self.raw_data |= (self.ams_ex & 0x07) << 21
        self.raw_data |= (self.to & 0x0F) << 24
        self.raw_data |= int(self.dstrd) << 28
        self.raw_data |= int(self.nssr) << 29
        self.raw_data |= int(self.cqr) << 30
        self.raw_data |= (self.mn & 0x01) << 31
        self.raw_data |= int(self.mdts) << 35
        return self.raw_data.to_bytes(8, byteorder='little')


class NVMeControllerConfigurationStatusRegister:
    def __init__(self):
        self.raw_data = 0

        # Define individual fields
        self.ready = False
        self.cfs = False
        self.shst = False

    def unpack(self, data):
        # Unpack raw data into individual fields
        self.raw_data = int.from_bytes(data, byteorder='little')
        self.ready = bool(self.raw_data & 0x01)
        self.cfs = bool((self.raw_data >> 1) & 0x01)
        self.shst = bool((self.raw_data >> 2) & 0x01)

    def pack(self):
        # Pack individual fields into raw data
        self.raw_data = 0
        self.raw_data |= int(self.ready)
        self.raw_data |= int(self.cfs) << 1
        self.raw_data |= int(self.shst) << 2
        return self.raw_data.to_bytes(8, byteorder='little')


class NVMeAdminQueueAttributesRegister:
    def __init__(self):
        self.raw_data = 0

        # Define individual fields
        self.aq_depth = 0
        self.aq_stride = 0
        self.aq_size = 0
        self.sq_size = 0
        self.cq_size = 0

    def unpack(self, data):
        # Unpack raw data into individual fields
        self.raw_data = int.from_bytes(data, byteorder='little')
        self.aq_depth = (self.raw_data & 0xFFFF) + 1
        self.aq_stride = ((self.raw_data >> 16) & 0xFF) + 1
        self.aq_size = ((self.raw_data >> 24) & 0xFF) + 1
        self.sq_size = ((self.raw_data >> 32) & 0xFFFF) + 1
        self.cq_size = ((self.raw_data >> 48) & 0xFFFF) + 1

    def pack(self):
        # Pack individual fields into raw data
        self.raw_data = 0
        self.raw_data |= (self.aq_depth - 1) & 0xFFFF
        self.raw_data |= ((self.aq_stride - 1) & 0xFF) << 16
        self.raw_data |= ((self.aq_size - 1) & 0xFF) << 24
        self.raw_data |= ((self.sq_size - 1) & 0xFFFF) << 32
        self.raw_data |= ((self.cq_size - 1) & 0xFFFF) << 48
        return self.raw_data.to_bytes(12, byteorder='little')


class NVMeAdminSubmissionQueueBaseAddressRegister:
    def __init__(self):
        self.raw_data = 0

        # Define individual fields
        self.asq_base_addr = 0

    def unpack(self, data):
        # Unpack raw data into individual fields
        self.raw_data = int.from_bytes(data, byteorder='little')
        self.asq_base_addr = int.from_bytes(data, byteorder='little')

    def pack(self):
        # Pack individual fields into raw data
        return self.asq_base_addr.to_bytes(8, byteorder='little')


class NVMeAdminCompletionQueueBaseAddressRegister:
    def __init__(self):
        self.raw_data = 0

        # Define individual fields
        self.acq_base_addr = 0

    def unpack(self, data):
        # Unpack raw data into individual fields
        self.raw_data = int.from_bytes(data, byteorder='little')
        self.acq_base_addr = int.from_bytes(data, byteorder='little')

    def pack(self):
        # Pack individual fields into raw data
        return self.acq_base_addr.to_bytes(8, byteorder='little')


class NVMeSubmissionQueueTailDoorbellRegister:
    def __init__(self):
        self.raw_data = 0

        # Define individual fields
        self.sqt = 0

    def unpack(self, data):
        # Unpack raw data into individual fields
        self.raw_data = int.from_bytes(data, byteorder='little')
        self.sqt = int.from_bytes(data, byteorder='little')

    def pack(self):
        # Pack individual fields into raw data
        return self.sqt.to_bytes(4, byteorder='little')

class NVMeCompletionQueueHeadDoorbellRegister:
    def __init__(self):
        self.raw_data = 0

        # Define individual fields
        self.cqh = 0

    def unpack(self, data):
        # Unpack raw data into individual fields
        self.raw_data = int.from_bytes(data, byteorder='little')
        self.cqh = int.from_bytes(data, byteorder='little')

    def pack(self):
        # Pack individual fields into raw data
        return self.cqh.to_bytes(4, byteorder='little')



class NVMeControllerCapabilitiesRegister:
    def __init__(self):
        self.raw_data = 0

        # Define individual fields
        self.mqes = 0
        self.arbitration_supported = False
        self.ams_supported = False
        self.mpsmin_supported = False
        self.mpsmax_supported = False
        self.css_supported = False
        self.nssrs = 0
        self.bps_supported = False
        self.to = 0
        self.dstrd_supported = False
        self.nssr = False
        self.css_ex = 0
        self.mn = 0
        self.mdts = False
        self.cqr = False
        self.ams_ex = 0
        self.shn = 0

    def unpack(self, data):
        # Unpack raw data into individual fields
        self.raw_data = int.from_bytes(data, byteorder='little')
        self.mqes = self.raw_data & 0xFFFF
        self.arbitration_supported = bool((self.raw_data >> 16) & 0x01)
        self.ams_supported = bool((self.raw_data >> 17) & 0x01)
        self.mpsmin_supported = bool((self.raw_data >> 18) & 0x01)
        self.mpsmax_supported = bool((self.raw_data >> 19) & 0x01)
        self.css_supported = bool((self.raw_data >> 20) & 0x01)
        self.nssrs = (self.raw_data >> 21) & 0x07
        self.bps_supported = bool((self.raw_data >> 24) & 0x01)
        self.to = (self.raw_data >> 28) & 0x0F
        self.dstrd_supported = bool((self.raw_data >> 32) & 0x01)
        self.nssr = bool((self.raw_data >> 33) & 0x01)
        self.css_ex = (self.raw_data >> 34) & 0x07
        self.mn = (self.raw_data >> 37) & 0x0F
        self.mdts = bool((self.raw_data >> 41) & 0x01)
        self.cqr = bool((self.raw_data >> 16) & 0x01)
        self.ams_ex = (self.raw_data >> 43) & 0x07
        self.shn = (self.raw_data >> 46) & 0x03

    def pack(self):
        # Pack individual fields into raw data
        self.raw_data = 0
        self.raw_data |= self.mqes & 0xFFFF
        self.raw_data |= int(self.arbitration_supported) << 16
        self.raw_data |= int(self.ams_supported) << 17
        self.raw_data |= int(self.mpsmin_supported) << 18
        self.raw_data |= int(self.mpsmax_supported) << 19
        self.raw_data |= int(self.css_supported) << 20
        self.raw_data |= (self.nssrs & 0x07) << 21
        self.raw_data |= int(self.bps_supported) << 24
        self.raw_data |= (self.to & 0x0F) << 28
        self.raw_data |= int(self.dstrd_supported) << 32
        self.raw_data |= int(self.nssr) << 33
        self.raw_data |= (self.css_ex & 0x07) << 34
        self.raw_data |= (self.mn & 0x0F) << 37
        self.raw_data |= int(self.mdts) << 41
        self.raw_data |= int(self.cqr) << 16
        self.raw_data |= (self.ams_ex & 0x07) << 43
        self.raw_data |= (self.shn & 0x03) << 46
        return self.raw_data.to_bytes(8, byteorder='little')




class NVMeEndpoint(MemoryEndpoint):
    __test__ = False

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        self.vendor_id = 0x1234
        self.device_id = 0x5678
        
        
        self.cap = NVMeControllerCapabilitiesRegister()	                 # Controller capabilities.          , address offset:  0x00-0x07	      
        self.version = 0	                     # Version.                          , address offset:  0x08-0x0B	      
        self.INTMS = 0                  # Interrupt mask set.               , address offset:  0x0C-0x0F	      
        self.INTMC  = 0                  # Interrupt mask clear.             , address offset:  0x10-0x13	      
        self.CC	                     # Controller configuration.         , address offset:  0x14-0x17	      
        self.CSTS                    # Controller status.                , address offset:  0x1C-0x1F	      
        self.AQA	                 # Admin queue attributes.           , address offset:  0x24-0x27	      
        self.ASQ	                 # Admin submission queue.           , address offset:  0x28-0x2F	      
        self.ACQ	                 # Admin completion queue.           , address offset:  0x30-0x37	      
        self.SQxTDBL                 # Submission queue X tail doorbell. , address offset:  0x1000+(2X)*Y	
        self.CQxHDBL                 # Completion queue X head doorbell. , address offset:  0x1000+(2X+1)*Y	

        self.msi_cap = MsiCapability()
        self.msi_cap.msi_multiple_message_capable = 5
        self.msi_cap.msi_64bit_address_capable = 1
        self.msi_cap.msi_per_vector_mask_capable = 1
        self.register_capability(self.msi_cap)

        self.add_mem_region(1024*1024)
        self.add_prefetchable_mem_region(1024*1024)
        self.add_io_region(1024)
