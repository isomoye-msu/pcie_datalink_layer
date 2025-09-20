import pyuvm
from cocotb.triggers import *
from base_uvm import *
from pipe_types import *
from descrambler_scrambler import *
from pyuvm import *
from cocotb.types import Bit,Logic, LogicArray
from pipe_agent import pipe_monitor
from cocotb.types.range import Range
from cocotb.triggers import FallingEdge, RisingEdge, Timer, Event, with_timeout, First
from cocotbext.axi import AxiStreamFrame, AxiStreamBus, AxiStreamSource, AxiStreamSink, AxiStreamMonitor
from cocotbext.pcie.core import RootComplex, MemoryEndpoint, Device, Switch
from cocotbext.pcie.core.dllp import Dllp, DllpType, FcScale
from cocotbext.pcie.core.tlp import Tlp, TlpType
from cocotb.log import SimLog



class tlp_monitor_bfm():
    def __init__(self, name = "pipe_agent_h", parent= None):
        self.dut = cocotb.top
        self.sink_tlp = AxiStreamSink(AxiStreamBus.from_prefix(
            self.dut, "m_tlp_axis"), self.dut.clk_i, self.dut.rst_i)
        self.sink_tlp.log = SimLog("cocotb.tb")

    async def start(self):
        while True:
            datum = await self.sink_tlp.recv()
            # print(f"\n\n\n\n\nMONITORED {[hex(b) for b in datum.tdata]}")
            self.proxy.notify_mac_tlp_received(datum.tdata)
            # assert 1 == 0

