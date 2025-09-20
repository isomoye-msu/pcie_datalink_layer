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
from cocotb.log import SimLog

class tlp_driver_bfm():
    def __init__(self, name = "pipe_driver_bfm", parent=None, pipe_interface = None):
        # super().__init__(name)
        self.name = name
        self.dut = cocotb.top
        self.tlp_sender = AxiStreamSource(AxiStreamBus.from_prefix(
            self.dut, "s_tlp_axis"), self.dut.clk_i, self.dut.rst_i)
        uvm_root().logger.info(name + " initiated") 
        self.tlp_sender.log = SimLog("cocotb.tb")


    async def send_tlp(self,tlp):
        test_frame = AxiStreamFrame(tlp.pack())
        await self.tlp_sender.send(test_frame)
