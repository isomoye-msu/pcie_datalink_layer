# ==========================================================================
#
#  Morgan State University
#  Open Hardware Acceleration Lab (HAL-O)
#
#!  Project:   Open-Source PCIe Endpoint Controller.
#   File:      test_pcie_dllp_core.py
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
from cocotb.clock import Clock
from cocotbext.axi import *
from cocotb.triggers import *
from cocotbext.pcie.core import MemoryEndpoint
from cocotbext.pcie.core.caps import MsiCapability
from pyuvm import *
from base_uvm import *
from pcie_base import *
from pcie_sequences import *
from pathlib import Path
sys.path.append(str(Path("..").resolve()))



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
        

class config_read_seq(pcie_seq):
    def __init__(self, name,msix, config=None):
        super().__init__(name,msix,config)
        self.tx_source = self
        self.rx_sink = self
        self.log.setLevel(logging.INFO)
        self.dut = cocotb.top
        
        
    async def body(self):
        self.seqr = ConfigDB().get(None, "", "phy_sequencer")
        self.sequencer = self.seqr
        await super().body()
        
        mem = self.rc.mem_pool.alloc_region(16*1024*1024)
        mem_base = mem.get_absolute_address(0)
        io = self.rc.io_pool.alloc_region(1024)
        io_base = io.get_absolute_address(0)
    
        while self.dut.fc_initialized_o == 0:
            await RisingEdge(self.dut.clk_i)
            
        await self.rc.enumerate()
        

        dev = self.rc.find_device(self.dev.functions[0].pcie_id)
        cfg =  await self.rc.config_read(self.dev.functions[0].pcie_id, 0x000, 256, timeout=1000, timeout_unit='ns')    
        # self.log.info(cfg)
        for i in range(0, len(cfg), 4):
            chunk = cfg[i:i+4]
            self.log.info(chunk)

class flow_control_seq(pcie_seq):
    def __init__(self, name,msix, config=None):
        super().__init__(name,msix,config)
        self.tx_source = self
        self.rx_sink = self
        self.log.setLevel(logging.INFO)
        self.dut = cocotb.top
        
            
    async def body(self):
        self.seqr = ConfigDB().get(None, "", "phy_sequencer")
        self.sequencer = self.seqr
        await super().body()
        # assert 1 == 0
        
        mem = self.rc.mem_pool.alloc_region(16*1024*1024)
        mem_base = mem.get_absolute_address(0)
        io = self.rc.io_pool.alloc_region(1024)
        io_base = io.get_absolute_address(0)
    
        while self.dut.fc_initialized_o == 0:
            await RisingEdge(self.dut.clk_i)
        # assert 1 == 0
        await self.rc.enumerate()
        # assert 1 == 0
        
        print(self.dev.functions[0].pcie_id)
        dev = self.rc.find_device(self.dev.functions[0].pcie_id)
        print(dev)
        await dev.enable_device()
        await dev.set_master()
        
        dev_bar0 = dev.bar_window[0]
        dev_bar1 = dev.bar_window[1]
        dev_bar3 = dev.bar_window[3]
        # print(dev_bar0)
        # assert 1 == 0

        for length in list(range(0, 8)):
            for offset in list(range(8)):
                self.log.info("IO operation length: %d offset: %d", length, offset)
                test_data = bytearray([x % 256 for x in range(length)])

                await dev_bar0.write(offset, test_data, timeout=5000)
                assert self.regions[3][offset:offset+length] == test_data

                assert await dev_bar0.read(offset, length, timeout=5000) == test_data

        for length in list(range(0, 32))+[1024]:
            for offset in list(range(8))+list(range(4096-8, 4096)):
                self.log.info("Memory operation (32-bit BAR) length: %d offset: %d", length, offset)
                test_data = bytearray([x % 256 for x in range(length)])

                await dev_bar0.write(offset, test_data, timeout=100)
                # wait for write to complete
                await dev_bar0.read(offset, 0, timeout=50000)
                assert self.regions[0][offset:offset+length] == test_data

                assert await dev_bar0.read(offset, length, timeout=50000) == test_data
        

        for length in list(range(0, 32))+[1024]:
            for offset in list(range(8))+list(range(4096-8, 4096)):
                self.log.info("Memory operation (DMA) length: %d offset: %d", length, offset)
                addr = mem_base+offset
                test_data = bytearray([x % 256 for x in range(length)])

                await self.dma_mem_write(addr, test_data, 5000, 'ns')
                # wait for write to complete
                await self.dma_mem_read(addr, 0, 5000, 'ns')
                assert mem[offset:offset+length] == test_data

                assert await self.dma_mem_read(addr, length, 5000, 'ns') == test_data
            

class phy_monitor(base_monitor):

    def build_phase(self):
        self.dut = cocotb.top
        self.ap = uvm_analysis_port("ap", self)
        self.source_ap = uvm_analysis_port("source_ap", self)
        # self.sinkdllp = AxiStreamSink(AxiStreamBus.from_prefix(
        #     self.dut, "m_axis_dllp2phy"), self.dut.clk_i, self.dut.rst_i)

    async def mon_tlp(self):
        ...
        # while True:
        #     datum = await self.sinkdllp.recv()
        #     print(f"\n\n\n\n\nMONITORED {datum}")
        #     self.source_ap.write(datum)


    async def run_phase(self):
        ...
        # Monitor-specific code goes here
        # uvm_info("phy_monitor", "Running the monitor", UVM_LOW)
        # while True:
        #     coro1Thread = cocotb.start_soon(self.mon_tlp())
        #     await First(coro1Thread)
            # Monitor the DUT and capture relevant information
            # This is a simplified example; actual monitoring logic depends on the DUT interface
            # pass


class phy_driver(base_driver):
    def build_phase(self):
        self.ap = uvm_analysis_port("ap", self)
        self.rp = uvm_analysis_port("rp", self)
        self.dut = cocotb.top
        self.source = AxiStreamSource(AxiStreamBus.from_prefix(
            self.dut, "s_phy_axis"), self.dut.clk_i, self.dut.rst_i)
        self.source.log.setLevel(logging.ERROR)
        self.sink = AxiStreamSink(AxiStreamBus.from_prefix(
            self.dut, "m_phy_axis"), self.dut.clk_i, self.dut.rst_i)
        self.sink.log.setLevel(logging.ERROR)
        self.tlp_sink = AxiStreamSink(AxiStreamBus.from_prefix(
            self.dut, "m_tlp_axis"), self.dut.clk_i, self.dut.rst_i)
        self.tlp_sink.log.setLevel(logging.ERROR)
        self.tlp_source = AxiStreamSource(AxiStreamBus.from_prefix(
            self.dut, "s_tlp_axis"), self.dut.clk_i, self.dut.rst_i)
        self.tlp_source.log.setLevel(logging.ERROR)
        self.datum = None
        self.log = logging.getLogger("cocotb.tb")
        
    async def reset(self):
        self.dut.rst_i.setimmediatevalue(0)
        await RisingEdge(self.dut.clk_i)
        await RisingEdge(self.dut.clk_i)
        self.dut.rst_i.value = 1
        await RisingEdge(self.dut.clk_i)
        await RisingEdge(self.dut.clk_i)
        self.dut.rst_i.value = 0
        await RisingEdge(self.dut.clk_i)
        await RisingEdge(self.dut.clk_i)
    
    def cycle_pause(self):
        return itertools.cycle([1, 1, 0, 0])

    async def launch_tb(self):
        self.dut.phy_link_up_i.value = 0
        await self.reset()
        self.dut.phy_link_up_i.value = 1

    async def drive_item(self):
        while True:
            # Wait for a sequence item from the sequencer
            seq_item = await self.seq_item_port.get_next_item()
            # print("got item")
            # print(repr(seq_item))
            if seq_item.is_tlp:
                await self.tlp_source.send(seq_item.frame)
            elif seq_item.is_dllp:
                await self.source.send(seq_item.frame)
            seq_item.results = None
            self.datum = None
            self.seq_item_port.item_done()
    
    async def read_tlp(self):
        while True:
            tlp = await self.tlp_sink.recv()
            seq_item =  pcie_seq_item("tlp read from axis item")
            # assert 1 == 0
            tlp = Tlp.unpack(tlp.tdata)
            seq_item.pkt = tlp
            # print(tlp)
            self.rp.write(seq_item)
            
            # print(repr(tlp))
            # self.log.info(repr(tlp))
            #send to tlp
            # await self.upstream_recv(tlp)
            
       
    async def  read_dllp(self):
         while True:
            self.datum = await self.sink.recv()
            seq_item =  pcie_seq_item("pcie_sequence_item")
            seq_item.is_pkt = True
            rx_tlp = self.datum
            # print(pkt)
            if rx_tlp.tuser == 1:
                pkt = Dllp()
                pkt = pkt.unpack(rx_tlp.tdata)
                
                # await self.dev.upstream_port._transmit(Dllp(pkt))
                # print(pkt)
            elif rx_tlp.tuser == 2:
                pkt = Tlp()
                # self.log.info(repr(pkt))
                data = rx_tlp.tdata[2:len(rx_tlp.tdata)-4]
                # print(data)
                pkt = pkt.unpack(data)
                seq = int.from_bytes(rx_tlp.tdata[:2],'big')
                # self.log.info("rx_tlp: %s",repr(pkt))
                # assert 1 == 0
                # print(hex(seq))
                # print(bytes(rx_tlp.tdata))
                pkt.seq = int(hex(seq),0)
                # print(pkt.seq)
                
                # await self.dev.upstream_port._transmit(Tlp(pkt))
            else:
                print(None)
                assert 1 == 0
                pkt = None
            seq_item.pkt = pkt
            # self.log.info("dllp packet: %s",seq_item.pkt)
            
            self.rp.write(seq_item)
                
            
    async def run_phase(self):
        await self.launch_tb()
        while True:
            coro1Thread = cocotb.start_soon(self.drive_item())
            # await Timer(10000)
            coro2Thread = cocotb.start_soon(self.read_dllp())
            coro3Thread = cocotb.start_soon(self.read_tlp())
            await First(coro1Thread,coro2Thread,coro3Thread)
            await Timer(100,'ns')


class phy_sequencer(base_sequencer):
    def __init__(self, name="phy_sequencer", parent=None):
        super().__init__(name, parent)
        ConfigDB().set(None, "*", name, self)
        self.name = name
        self.response_fifo = uvm_tlm_analysis_fifo("response_fifo", self)


class phy_agent(base_agent):
    def __init(self, name="phy_agent", parent=None):
        print("initiating phy agent")
        super().__init__(name, '', phy_driver, phy_monitor, phy_sequencer, '', "phy")

    def build_phase(self):
        # Define components
        self.driver = phy_driver.create("phy_driver", self)
        self.monitor = phy_monitor.create("phy_monitor", self)
        # print(self.sequencer_t.name)
        self.sequencer = phy_sequencer.create("phy_sequencer", self)
        # self.scoreboard = self.scoreboard_t.create(self.method_name + "_scoreboard", self)

    def connect_phase(self):
        self.driver.seq_item_port.connect(self.sequencer.seq_item_export)
        self.driver.rp.connect(self.sequencer.response_fifo.analysis_export)
        # self.monitor.seq_item_port.connect(self.sequencer.seq_item_export)

class phy_env(uvm_env):
    def __init__(self, name, parent=None):
        super().__init__(name, parent)
        self.name = name

    def build_phase(self):
        self.dut = cocotb.top
        self.log = logging.getLogger("phy_env")
        self.log.setLevel(logging.DEBUG)
        cocotb.start_soon(Clock(self.dut.clk_i, 2.5, units="ns").start())
        self.agent = phy_agent.create("phy_agent", self)
    


@pyuvm.test()
class Fc1Test(uvm_test):
    """Test Dllp layer by going through flow control init sequence"""

    def build_phase(self):
        self.log = logging.getLogger("Fc1Test.tb")
        self.log.setLevel(logging.DEBUG)
        self.env = phy_env.create("phy_env", self)

    def end_of_elaboration_phase(self):
        self.test_all = config_read_seq("test fc1",1)
        
    async def run_phase(self):
        self.raise_objection()
        await with_timeout(self.test_all.start(),50000,'ns')
        self.drop_objection()


# @pyuvm.test()
# class CfgTest(uvm_test):
#     """Test Dllp layer by going through flow control init sequence"""

#     def build_phase(self):
#         self.log = logging.getLogger("Fc1Test.tb")
#         self.log.setLevel(logging.DEBUG)
#         self.env = phy_env.create("phy_env", self)

#     def end_of_elaboration_phase(self):
#         self.test_all = config_read_seq("test fc1",1)
        
#     async def run_phase(self):
#         self.raise_objection()
#         await with_timeout(self.test_all.start(),5,'ns')
#         self.drop_objection()
