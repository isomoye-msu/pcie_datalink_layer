# ==========================================================================
#
#  Morgan State University
#  Open Hardware Acceleration Lab (HAL-O)
#
#!  Project:   Open-Source PCIe Endpoint Controller.
#   File:      pcie_enumeration_seq.py
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
import itertools
import pyuvm
import sys
from cocotbext.pcie.core import *
from cocotbext.pcie.core.dllp import *
from cocotbext.pcie.core.tlp import *
from cocotbext.pcie.core.port import *
from cocotbext.pcie.core import RootComplex, MemoryEndpoint, Device, Switch
from cocotbext.pcie.core.caps import MsiCapability
from cocotbext.pcie.core.utils import PcieId
from pyuvm import *
from cocotb_coverage import crv
from cocotb.triggers import *
from pathlib import Path
from pipe_base_seq import *
from pipe_agent import pipe_seq_item
from pcie_flow_control_seq import pcie_flow_control_seq
import bitstring
from pipe_types import *
from crc import Calculator, Configuration
sys.path.append(str(Path("..").resolve()))
import mmap


class TestEndpoint(MemoryEndpoint):
    __test__ = False

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        self.vendor_id = 0x1234
        self.device_id = 0x5678

        self.msi_cap = MsiCapability()
        self.msi_cap.msi_multiple_message_capable = 5
        self.msi_cap.msi_64bit_address_capable = 1
        self.msi_cap.msi_per_vector_mask_capable = 1
        self.register_capability(self.msi_cap)

        self.add_mem_region(1024*1024)
        self.add_prefetchable_mem_region(1024*1024)
        self.add_io_region(1024)

def reverse_bits_in_byte(byte):
    bit_array = bitstring.BitArray(int=byte, length=9)
    bit_array.reverse()
    return bit_array.uint

class pcie_enumeration_seq(pipe_base_seq, crv.Randomized):
    def __init__(self, name):
        super().__init__(name)
        self.log = logging.getLogger("pcie enumeration seq")
        self.log.setLevel(logging.ERROR)
        self.tlp_queue = Queue()
        self.dllp_queue = Queue()
        
            
    async def body(self):
        self.sequencer = ConfigDB().get(None, "", "pipe_sequencer")
        assert self.sequencer is not None
        await super().body()
        cocotb.start_soon(self.send_rolling_idle())
        cocotb.start_soon(self.recieve_dllp())
        cocotb.start_soon(self.recieve_tlp())
        cocotb.start_soon(self.receive_tlp_mac())
        await self.send_skp()


        #declare root complex and memory endpoint model
        self.rc = RootComplex()
        ep = TestEndpoint()
        self.dev = Device(ep)
        
        #connect endpoint and rootcomplex
        port = self.rc.make_port()
        port.connect(self.dev)


        #disconnect rc port from dev simport and connect to RTL pcie port
        self.dev.upstream_port.other.handle_tx = self.handle_tx_port
        self.dev.upstream_port.handle_tx = self.waste
        self.dev.upstream_port.fc_initialized = True

        self.dev.send = self.send_tlp_mac

        self.dev.log.setLevel(logging.INFO)
        self.rc.log.setLevel(logging.INFO)
        

        self.regions = [None]*6
        self.regions[0] = mmap.mmap(-1, 1024*1024*1024)
        self.regions[1] = mmap.mmap(-1, 1024*1024)
        self.regions[3] = mmap.mmap(-1, 1024)
        self.regions[4] = mmap.mmap(-1, 1024*64)


        self.dev_bus_num = 0
        self.dev_device_num = 0
        self.dev_max_payload = 0
        self.dev_max_read_req = 0
        self.dev_msi_enable = 0
        self.dev_msi_multi_msg_enable = 0
        self.dev_msi_address = 0
        self.dev_msi_data = 0
        self.dev_msi_mask = 0
        self.dev.msix_enable = 0
        self.dev.msix_function_mask = 0

        self.dev.make_function()
        self.dev.functions[0].configure_bar(0, len(self.regions[0]))
        self.dev.functions[0].configure_bar(1, len(self.regions[1]), True, True)
        self.dev.functions[0].configure_bar(3, len(self.regions[3]), False, False, True)
        self.dev.functions[0].configure_bar(4, len(self.regions[4]))

        self.dev.functions[0].upstream_tx_handler = self.send_tlp_mac
        
        
        self.dev.functions[0].pcie_id = PcieId(1,0,0)
        self.dev.functions[0].configure_bar(0, len(self.regions[0]))
        await with_timeout(self.pipe_agent_config.fc_initialized.wait(),5000,'ns')
        await with_timeout(self.rc.enumerate(),100000,'ns')
        dev = self.rc.find_device(self.dev.functions[0].pcie_id)
        await dev.enable_device()

        self.dev.functions[0].bar[0] = 0xc0000000
        mask = 2**((len(self.regions[0])-1).bit_length())-1
        self.dev.functions[0].bar_mask[0] = 0xfffffff0 & ~mask

        dev_bar0 = dev.bar_window[0]
        dev_bar1 = dev.bar_window[1]
        dev_bar3 = dev.bar_window[3]

        for length in list(range(0, 32))+[1024]:
            for offset in list(range(8))+list(range(4096-8, 4096)):
                uvm_root().logger.info("Memory operation (32-bit BAR) length: %d offset: %d", length, offset)
                test_data = bytearray([x % 256 for x in range(length)])
                await dev_bar0.write(offset, test_data, timeout=10000, timeout_unit='ns')
                # wait for write to complete
                await dev_bar0.read(offset, 0, timeout=10000, timeout_unit='ns')
                assert await ep.read_region(0, offset, length) == test_data
                assert await dev_bar0.read(offset, length, timeout=10000, timeout_unit='ns') == test_data


    async def send_tlp_mac(self,tlp):
        pipe_seq_item_h = pipe_seq_item("pipe_seq_item")
        pipe_seq_item_h.pipe_operation = pipe_operation_t.SEND_MAC_TLP
        pipe_seq_item_h.tlp = tlp
        await self.start_item (pipe_seq_item_h)
        await self.finish_item (pipe_seq_item_h)

    async def receive_tlp_mac(self):
        while (1):
            if self.pipe_agent_config.mac_tlp_received:
                pkt = Tlp()
                tlp_data = self.pipe_agent_config.mac_tlp_received.pop(0)
                pkt = pkt.unpack(bytes(tlp_data))
                await self.dev.upstream_recv(pkt)
            else:
                await self.pipe_agent_config.mac_tlp_data_detected_e.wait()
                self.pipe_agent_config.mac_tlp_data_detected_e.clear()


    async def send_skp(self):
        pipe_seq_item_h = pipe_seq_item("pipe_seq_item")
        pipe_seq_item_h.pipe_operation = pipe_operation_t.SEND_SKP
        await self.start_item (pipe_seq_item_h)
        await self.finish_item (pipe_seq_item_h)

    async def handle_tx_port(self,pkt):
        pipe_seq_item_h = pipe_seq_item("pipe_seq_item")
        if isinstance(pkt,Dllp):
            pipe_seq_item_h.pipe_operation = pipe_operation_t.DLLP_TRANSFER
            pipe_seq_item_h.dllp = pkt
            await self.start_item (pipe_seq_item_h)
            await self.finish_item (pipe_seq_item_h)
            
        elif isinstance(pkt,Tlp):
            tlp_pkt = pkt
            pipe_seq_item_h.pipe_operation = pipe_operation_t.TLP_TRANSFER
            pipe_seq_item_h.tlp = tlp_pkt
            await self.start_item (pipe_seq_item_h)
            await self.finish_item (pipe_seq_item_h)


    async def send_rolling_idle(self):
        pipe_seq_item_h = pipe_seq_item("pipe_seq_item_h")
        pipe_seq_item_h.pipe_operation = pipe_operation_t.IDLE_DATA_TRANSFER
        while(1):
            await self.start_item(pipe_seq_item_h)
            await self.finish_item(pipe_seq_item_h)

    async def waste(self,req):
        if self.dev.upstream_port.fc_initialized == False:
            await self.dev.upstream_port.other.ext_recv(req)
        else:
            ...



    async def recieve_dllp(self):
        count = 0
        while (1):
            if self.pipe_agent_config.dllp_received:
                pkt = Dllp()
                dllp_in = self.pipe_agent_config.dllp_received.pop(0)
                pkt = pkt.unpack_crc(bytes(dllp_in))
                await self.dev.upstream_port.other.ext_recv(pkt)
                dw , = struct.unpack_from('>L', bytes(dllp_in[0:4]))
                self.pipe_agent_config.dllp_data_detected_e.clear()
                self.pipe_agent_config.dllp_data_read_e.set()
                count += 1
            else:
                await self.pipe_agent_config.dllp_data_detected_e.wait()


    async def recieve_tlp(self):
        count = 0
        while (1):
            if self.pipe_agent_config.tlp_received:
                pkt = Tlp()
                tlp_in = self.pipe_agent_config.tlp_received.pop(0)
                data = tlp_in[2:len(tlp_in)-4]
                pkt = pkt.unpack(bytes(data))
                seq = int.from_bytes(tlp_in[:2],'big')
                pkt.seq = int(hex(seq),0)
                await self.handle_tlp(pkt)
                self.pipe_agent_config.tlp_data_read_e.set()
                count += 1
            else:
                await First(self.pipe_agent_config.tlp_data_detected_e.wait(),Timer(1000, 'ns'))
                self.pipe_agent_config.tlp_data_detected_e.clear()
    

    async def handle_tlp(self, tlp):
        await self.dev.upstream_port.other.ext_recv(tlp)



