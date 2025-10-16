# ==========================================================================
#
#  Morgan State University
#  Open Hardware Acceleration Lab (HAL-O)
#
#!  Project:   Open-Source PCIe Endpoint Controller.
#   File:      phy_agent.py
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
import random
import itertools
import pyuvm
import cocotb_test.simulator
import sys
from cocotbext.pcie.core import *
from cocotbext.pcie.core.dllp import *
from cocotbext.pcie.core.tlp import *
from cocotb.clock import Clock
from cocotbext.axi import *
from cocotb.triggers import *
from crc import Calculator, Configuration, Crc32
from pyuvm import *
from base_uvm import *
from pathlib import Path
sys.path.append(str(Path("..").resolve()))


class dllp_seq_item(uvm_sequence_item):
    def __init__(self, name="dllp_seq_item"):
        super().__init__(name)
        self.Dllp = Dllp()
        self.Tlp = Tlp()
        # self.Dllp.type = random.choice(list(DllpType))
        # self.Dllp.seq = 0
        # self.Dllp.vc = 0
        # self.Dllp.hdr_scale = FcScale(0)
        # self.Dllp.hdr_fc = random.randint(1, 6)
        # self.Dllp.data_scale = FcScale(0)
        # self.Dllp.data_fc = random.randint(1, 256)
        # self.Dllp.feature_support = 0
        # self.Dllp.feature_ack = False
        # self.frame = None
        
        # Add item-specific fields and methods here
        
class tlp_seq_item(base_seq_item):
    def __init__(self, name="tlp_seq_item"):
        super().__init__(name)
        self.Tlp = Tlp()
        
class dllp_seq(uvm_sequence):
    def __init__(self, name, seq_item_t = dllp_seq_item,
                 dllp_type = 0):
        super().__init__(name)
        self.seq_item_t = seq_item_t
        self.dllp_type = dllp_type
        
    async def body(self):
        config = Configuration(
            width=16,
            polynomial=0x1DB7,
            init_value=0xFFFF,
            final_xor_value=0x00000000,
            reverse_input=False,
            reverse_output=True,
        )
        calculator = Calculator(config)
        # Create and send a sequence item
        seq_item = dllp_seq_item("my_sequence_item")
        print("start sequence")
        print(seq_item)
        await self.start_item(seq_item)
        print("post sequence")
        if(self.dllp_type != 0):
            seq_item.Dllp.type = self.dllp_type
        seq_item.crc = calculator.checksum(
        seq_item.Dllp.pack()).to_bytes(2, 'big')
        data =  seq_item.Dllp.pack()
        data += calculator.checksum(data).to_bytes(2, 'big')
        seq_item.frame = AxiStreamFrame(data)
        seq_item.frame.tuser = 1
        await self.finish_item(seq_item)
        self.result = 1
        print("done_sequence")
        # uvm_info("dllp_seq", "Running the sequence", UVM_LOW)

async def test_fc1(seqr, fc1_type, seq_num, hdr_fc, data_fc):
    seq = dllp_seq("seq", seq_num, fc1_type, hdr_fc, data_fc)
    print(seq)
    await seq.start(seqr)
    return seq.result
    
class FcInitSeq(uvm_sequence):
    def __init__(self, name):
        super().__init__(name)
        self.seqr = ConfigDB().get(None, "", "phy_sequencer")

    async def body(self):
        prev_num = 0
        cur_num = 1
        fib_list = [prev_num, cur_num]
        sum = 0
        hdr_fc = random.randint(0, 20)
        data_fc = random.randint(0, 20)
        init_list = [DllpType.INIT_FC1_P,
                     DllpType.INIT_FC1_NP,
                     DllpType.INIT_FC1_CPL,
                     DllpType.INIT_FC2_P,
                     DllpType.INIT_FC2_NP,
                     DllpType.INIT_FC2_CPL]
        tlp_list = [TlpType.MEM_READ,
                    TlpType.MEM_READ_64,
                    TlpType.MEM_READ_LOCKED,
                    TlpType.MEM_READ_LOCKED_64,
                    TlpType.MEM_WRITE,
                    TlpType.MEM_WRITE_64]
        for i in range(6):
            sum = await test_fc1(self.seqr, init_list[i], i,hdr_fc, data_fc)
            fib_list.append(sum)
            prev_num = cur_num
            cur_num = sum
        # for i in range(6):
        #     sum = await send_tlp(self.seqr, tlp_list[i], i)
        #     fib_list.append(sum)
        #     prev_num = cur_num
        #     cur_num = sum
        uvm_root().logger.info("flow control initiation Sequence: " + str(fib_list))
        uvm_root().set_logging_level_hier(CRITICAL)

class flow_control_seq(base_sequence):
    def __init__(self, name, config = None):
        super().__init__(name)
        self.config = config        
        
    async def body(self): 
        print(ConfigDB())
        seqr = ConfigDB().get(None, "", "phy_sequencer")
        init_list = [DllpType.INIT_FC1_P,
                     DllpType.INIT_FC1_NP,
                     DllpType.INIT_FC1_CPL,
                     DllpType.INIT_FC2_P,
                     DllpType.INIT_FC2_NP,
                     DllpType.INIT_FC2_CPL]
        print("starting test")
        fc_seq = dllp_seq("fc seq item",dllp_seq_item)
        print(fc_seq)
        await fc_seq.start(seqr)
        for i in range(6):
            fc_seq = dllp_seq("fc seq item",dllp_seq_item,init_list[i])
            # fc_seq.seq_item.Dllp.type = fc_init
            await fc_seq.start(seqr)
        uvm_root().logger.info("flow control initiation Sequence: " + str(init_list))
        uvm_root().set_logging_level_hier(CRITICAL)
        
        
        

class phy_driver(base_driver):        
    def build_phase(self):
        self.ap = uvm_analysis_port("ap", self)
        self.dut = cocotb.top
        self.source = AxiStreamSource(AxiStreamBus.from_prefix(
            self.dut, "s_axis"), self.dut.clk_i, self.dut.rst_i)
        self.source.log.setLevel(logging.ERROR)
        
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
        
    async def launch_tb(self):
        self.dut.link_status_i.value = 0x2
        self.dut.phy_link_up_i.value = 1
        await self.reset()
        
    async def drive_item(self,seq_item):
        await self.source.send(seq_item.frame)
        await with_timeout(self.source.wait(), 1000, 'ns')
        self.ap.write(seq_item)
        self.seq_item_port.item_done()
    
    async def run_phase(self):
        await self.launch_tb()
        while True:
                    # Wait for a sequence item from the sequencer
            seq_item = await self.seq_item_port.get_next_item()
            print("got item")
            # Drive the sequence item to the DUT
            await self.drive_item(seq_item)
            # Notify the sequencer that the item has been processed
            # self.ap.write(seq_item)
            # self.seq_item_port.item_done()
        # super().run_phase()
        
        # while True:
        #     seq_item = await self.seq_item_port.get_next_item()
        
        
class phy_sequencer(base_sequencer):
    def __init__(self, name="phy_sequencer", parent=None):
        super().__init__(name,parent)
        ConfigDB().set(None, "*", name, self)
        self.name = name
        
        
class phy_agent(base_agent):
    def __init (self, name = "phy_agent",parent=None):
        print("initiating phy agent")
        super().__init__(name,'',phy_driver,'', phy_sequencer,'',"phy")
        
    def build_phase(self):
        # Define components
        self.driver = phy_driver.create("phy_driver", self)
        # self.monitor = .create(self.method_name + "_monitor", self)
        # print(self.sequencer_t.name)
        self.sequencer = phy_sequencer.create("phy_sequencer", self)
        # self.scoreboard = self.scoreboard_t.create(self.method_name + "_scoreboard", self)
        
    def connect_phase(self):
        self.driver.seq_item_port.connect(self.sequencer.seq_item_export)
        
class phy_env(uvm_env):
    def __init__(self, name, parent=None):
        super().__init__(name,parent)
        self.name = name
        
    def build_phase(self):
        self.dut = cocotb.top
        self.log = logging.getLogger("cocotb.tb")
        self.log.setLevel(logging.INFO)
        cocotb.start_soon(Clock(self.dut.clk_i, 2, units="ns").start())
        self.agent = phy_agent.create("phy_agent", self)
        
@pyuvm.test()
class Fc1Test(uvm_test):
    """Test ALU with random and max values"""

    def build_phase(self):
        self.env = phy_env.create("phy_env",self)

    def end_of_elaboration_phase(self):
        self.test_all = flow_control_seq("test fc1")

    async def run_phase(self):
        self.raise_objection()
        await self.test_all.start()
        self.drop_objection()
    
        
        
    