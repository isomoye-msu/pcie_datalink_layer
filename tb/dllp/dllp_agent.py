# ==========================================================================
#
#  Morgan State University
#  Open Hardware Acceleration Lab (HAL-O)
#
#!  Project:   Open-Source PCIe Endpoint Controller.
#   File:      dllp_agent.py
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
from cocotb.clock import Clock
from cocotb.triggers import Join, Combine
from pyuvm import *
import itertools
import random
import cocotb
import pyuvm
#import cocotb_test.simulator
# All testbenches use tinyalu_utils, so store it in a central
# place and add its path to the sys path so we can import it
import sys
from cocotb.triggers import FallingEdge, RisingEdge, Timer, Event, with_timeout, First
from cocotbext.axi import AxiStreamFrame, AxiStreamBus, AxiStreamSource, AxiStreamSink, AxiStreamMonitor
from cocotbext.pcie.core import RootComplex, MemoryEndpoint, Device, Switch
from cocotbext.pcie.core.dllp import Dllp, DllpType, FcScale
from cocotbext.pcie.core.tlp import Tlp, TlpType
from crc import Calculator, Configuration, Crc32
from pathlib import Path
sys.path.append(str(Path("..").resolve()))
# from tinyalu_utils import TinyAluBfm, Ops, alu_prediction  # noqa: E402

# Sequence classes


class DllpSeqItem(uvm_sequence_item):

    def __init__(self, name):
        super().__init__(name)
        self.Dllp = Dllp()
        self.Tlp = Tlp()
        self.seq_num = 0
        self.crc = 0
        self.is_tlp = 0

class DllpSeq(uvm_sequence):
    def __init__(self, name, seq_num, type,hdr_fc,data_fc):
        super().__init__(name)
        self.type = type
        self.seq = seq_num
        self.hdr_fc = hdr_fc
        self.data_fc = data_fc
        self.data = 0
        self.config = Configuration(
            width=16,
            polynomial=0x1DB7,
            init_value=0xFFFF,
            final_xor_value=0x00000000,
            reverse_input=False,
            reverse_output=True,
        )
        self.calculator = Calculator(self.config)

    async def body(self):
        seq_item = DllpSeqItem("seq_item")
        await self.start_item(seq_item)
        seq_item.Dllp.type = self.type
        seq_item.Dllp.seq = self.seq
        seq_item.Dllp.vc = 0
        seq_item.is_tlp = 0
        seq_item.Dllp.hdr_fc = self.hdr_fc
        seq_item.Dllp.data_fc = self.data_fc
        seq_item.Dllp.feature_ack = False
        seq_item.crc = self.calculator.checksum(
            seq_item.Dllp.pack()).to_bytes(2, 'big')
        await self.finish_item(seq_item)
        self.result = 1


class TlpSeq(uvm_sequence):
    def __init__(self, name, seq_num, type):
        super().__init__(name)
        self.Tlp = []
        self.seq = seq_num
        self.tlp_type = type
        self.data = 0

    async def body(self):
        length = random.randint(1, 32)
        seq_item = DllpSeqItem("seq_item")
        await self.start_item(seq_item)
        seq_item.is_tlp = 1
        seq_item.seq_num = self.seq
        if seq_item.Tlp.fmt_type == TlpType.MEM_WRITE:
            test_data = bytearray(itertools.islice(
                itertools.cycle(range(255)), length))
            seq_item.Tlp.set_addr_be_data(1*4, test_data)
            seq_item.Tlp.tag = 1
            seq_item.Tlp.requester_id = 1
        elif seq_item.Tlp.fmt_type == TlpType.MEM_READ:
            seq_item.Tlp.set_addr_be(1*4, length)
            seq_item.Tlp.tag = 1
            seq_item.Tlp.requester_id = 1
        await self.finish_item(seq_item)
        self.result = 1


async def test_fc1(seqr, fc1_type, seq_num, hdr_fc, data_fc):
    seq = DllpSeq("seq", seq_num, fc1_type, hdr_fc, data_fc)
    print(seq)
    await seq.start(seqr)
    return seq.result


async def send_tlp(seqr, tlp_type, seq_num):
    seq = TlpSeq("seq", seq_num, tlp_type)
    print(f"tlp: {seq}")
    await seq.start(seqr)
    return seq.result


class FcInitSeq(uvm_sequence):
    def __init__(self, name):
        super().__init__(name)
        self.seqr = ConfigDB().get(None, "", "SEQR")

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
        for i in range(6):
            sum = await send_tlp(self.seqr, tlp_list[i], i)
            fib_list.append(sum)
            prev_num = cur_num
            cur_num = sum
        uvm_root().logger.info("flow control initiation Sequence: " + str(fib_list))
        uvm_root().set_logging_level_hier(CRITICAL)


class DllpDriver(uvm_driver):
    def build_phase(self):
        self.ap = uvm_analysis_port("ap", self)
        self.dut = cocotb.top
        self.source = AxiStreamSource(AxiStreamBus.from_prefix(
            self.dut, "s_axis"), self.dut.clk_i, self.dut.rst_i)

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

    async def run_phase(self):
        self.tlp_config = Configuration(
            width=32,
            polynomial=0x04C11DB7,
            init_value=0xFFFFFFFF,
            final_xor_value=0x00000000,
            reverse_input=False,
            reverse_output=True,
        )
        tlp_calculator = Calculator(self.tlp_config)
        
        await self.launch_tb()
        while True:
            test_dllp = await self.seq_item_port.get_next_item()
            if (test_dllp.is_tlp == 0):
                data = test_dllp.Dllp.pack()
                data += test_dllp.crc
                test_frame = AxiStreamFrame(data)
                test_frame.tuser = 1
            else:
                data = test_dllp.seq_num.to_bytes(2, 'big')
                data += test_dllp.Tlp.pack()
                data += tlp_calculator.checksum(data).to_bytes(4, 'big')
                test_frame = AxiStreamFrame(data)
                test_frame.tuser = 2
            await self.source.send(test_frame)
            await with_timeout(self.source.wait(), 1000, 'ns')
            self.ap.write(test_dllp)
            self.seq_item_port.item_done()


class DllpCoverage(uvm_subscriber):

    def end_of_elaboration_phase(self):
        self.cvg = set()

    def write(self, cmd):
        (_, _, op) = cmd
        self.cvg.add(op)

    def report_phase(self):
        try:
            disable_errors = ConfigDB().get(
                self, "", "DISABLE_COVERAGE_ERRORS")
        except UVMConfigItemNotFound:
            disable_errors = False
        if not disable_errors:
            if len(set(DllpType) - self.cvg) > 0:
                self.logger.error(
                    f"Functional coverage error. Missed: {set(DllpType)-self.cvg}")
                assert False
            else:
                self.logger.info("Covered all operations")
                assert True


class DllpMonitor(uvm_component):
    def __init__(self, name, parent, method_name):
        super().__init__(name, parent)
        self.method_name = method_name

    def build_phase(self):
        self.dut = cocotb.top
        self.source_ap = uvm_analysis_port("source_ap", self)
        self.ap = uvm_analysis_port("ap", self)
        self.monitor = AxiStreamMonitor(AxiStreamBus.from_prefix(
            self.dut, "s_axis"), self.dut.clk_i, self.dut.rst_i)
        self.sinktlp = AxiStreamSink(AxiStreamBus.from_prefix(
            self.dut, "m_axis_dllp2tlp"), self.dut.clk_i, self.dut.rst_i)
        self.sinkdllp = AxiStreamSink(AxiStreamBus.from_prefix(
            self.dut, "m_axis_dllp2phy"), self.dut.clk_i, self.dut.rst_i)
        # self.get_method = getattr(self.bfm, self.method_name)
    
    async def mon_phy(self):
        while True:
            datum = await self.monitor.recv()
            print(f"\n\n\n\n\nMONITORED {datum}")
            self.source_ap.write(datum)
    
    async def mon_tlp(self):
        while True:
            datum = await self.sinktlp.recv()
            print(f"\n\n\n\n\nMONITORED {datum}")
            self.ap.write(datum)

    async def run_phase(self):
        while True:
            coro1Thread = cocotb.start_soon(self.mon_phy())
            coro2Thread = cocotb.start_soon(self.mon_tlp())
            await First(coro1Thread,coro2Thread)
            # if(datum != 0):
            #     print(f"\n\n\n\n\nMONITORED {datum}")
            #     self.logger.debug(f"\n\n\n\n\nMONITORED {datum}")
            #     self.ap.write(datum)

class DllpScoreboard(uvm_component):

    def build_phase(self):
        self.dllp_fifo = uvm_tlm_analysis_fifo("dllp_fifo", self)
        self.tlp_fifo = uvm_tlm_analysis_fifo("tlp_fifo", self)
        self.result_fifo = uvm_tlm_analysis_fifo("result_fifo", self)
        self.cmd_get_port = uvm_get_port("cmd_get_port", self)
        self.result_get_port = uvm_get_port("result_get_port", self)
        self.cmd_export = self.dllp_fifo.analysis_export
        self.result_export = self.result_fifo.analysis_export

    def connect_phase(self):
        self.cmd_get_port.connect(self.dllp_fifo.get_export)
        self.result_get_port.connect(self.result_fifo.get_export)

    def check_phase(self):
        passed = True
        try:
            self.errors = ConfigDB().get(self, "", "CREATE_ERRORS")
        except UVMConfigItemNotFound:
            self.errors = False
        while self.result_get_port.can_get():
            _, actual_result = self.result_get_port.try_get()
            cmd_success, cmd = self.cmd_get_port.try_get()
            if not cmd_success:
                self.logger.critical(f"result {actual_result} had no command")
            else:
                (A, B, op_numb) = cmd
                op = Ops(op_numb)
                predicted_result = alu_prediction(A, B, op, self.errors)
                if predicted_result == actual_result:
                    self.logger.info(f"PASSED: 0x{A:02x} {op.name} 0x{B:02x} ="
                                     f" 0x{actual_result:04x}")
                else:
                    self.logger.error(f"FAILED: 0x{A:02x} {op.name} 0x{B:02x} "
                                      f"= 0x{actual_result:04x} "
                                      f"expected 0x{predicted_result:04x}")
                    passed = False
        assert passed


class DllpEnv(uvm_env):
    def build_phase(self):
        ports = 2
        self.dut = cocotb.top
        self.log = logging.getLogger("cocotb.tb")
        self.log.setLevel(logging.DEBUG)
        cocotb.start_soon(Clock(self.dut.clk_i, 2, units="ns").start())
        self.seqr = uvm_sequencer("seqr", self)
        ConfigDB().set(None, "*", "SEQR", self.seqr)
        self.driver = DllpDriver.create("driver", self)
        self.monitor = DllpMonitor("monitor", self, "get_cmd")
        # self.coverage = DllpCoverage("coverage", self)
        self.scoreboard = DllpScoreboard("scoreboard", self)

    def connect_phase(self):
        self.driver.seq_item_port.connect(self.seqr.seq_item_export)
        # self.monitor.seq_item_port.connect(self.seqr.seq_item_export)
        self.monitor.source_ap.connect(self.scoreboard.cmd_export)
        # self.cmd_mon.ap.connect(self.coverage.analysis_export)
        # self.driver.ap.connect(self.scoreboard.result_export)


@pyuvm.test()
class Fc1Test(uvm_test):
    """Test ALU with random and max values"""

    def build_phase(self):
        self.env = DllpEnv("env", self)

    def end_of_elaboration_phase(self):
        self.test_all = FcInitSeq("test fc1")

    async def run_phase(self):
        self.raise_objection()
        await self.test_all.start()
        self.drop_objection()


# @pyuvm.test()
# class ParallelTest(AluTest):
#     """Test ALU random and max forked"""

#     def build_phase(self):
#         uvm_factory().set_type_override_by_type(TestAllSeq, TestAllForkSeq)
#         super().build_phase()


# @pyuvm.test()
# class FibonacciTest(AluTest):
#     """Run Fibonacci program"""

#     def build_phase(self):
#         ConfigDB().set(None, "*", "DISABLE_COVERAGE_ERRORS", True)
#         uvm_factory().set_type_override_by_type(TestAllSeq, FibonacciSeq)
#         return super().build_phase()


# @pyuvm.test(expect_fail=True)
# class AluTestErrors(AluTest):
#     """Test ALU with errors on all operations"""

#     def start_of_simulation_phase(self):
#         ConfigDB().set(None, "*", "CREATE_ERRORS", True)
