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
        self.results = None
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
    def __init__(self, name, seq_item_t=dllp_seq_item,
                 dllp_type=0):
        super().__init__(name)
        self.seq_item_t = seq_item_t
        self.dllp_type = dllp_type
        self.result = None

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
        if (self.dllp_type != 0):
            seq_item.Dllp.type = self.dllp_type
        seq_item.crc = calculator.checksum(
            seq_item.Dllp.pack()).to_bytes(2, 'big')
        data = seq_item.Dllp.pack()
        data += calculator.checksum(data).to_bytes(2, 'big')
        seq_item.frame = AxiStreamFrame(data)
        seq_item.frame.tuser = 1
        await self.finish_item(seq_item)
        self.result = seq_item.results
        
class tlp_seq(uvm_sequence):
    def __init__(self, name, seq_num):
        super().__init__(name)
        self.seq_num = seq_num
        self.result = None
    
    def tlp2dllp(self,seq_num, data,tlp_calculator):
        test_data = seq_num.to_bytes(2,'big')
        test_data += data
        test_data += tlp_calculator.checksum(test_data).to_bytes(4,'big')
        # seq_num += 1
        return test_data
    
    async def body(self):
        tlp_config = Configuration(
            width=32,
            polynomial=0x04C11DB7,
            init_value=0xFFFFFFFF,
            final_xor_value=0x00000000,
            reverse_input=False,
            reverse_output=True,
        )
        tlp_calculator = Calculator(tlp_config)
        # Create and send a sequence item
        length = random.randint(1, 32)
        seq_item = dllp_seq_item("my_sequence_item")
        await self.start_item(seq_item)
        seq_item.Tlp.fmt_type = random.choice([TlpType.MEM_WRITE])
        if seq_item.Tlp.fmt_type == TlpType.MEM_WRITE:
            test_data = bytearray(itertools.islice(itertools.cycle(range(255)), length))
            seq_item.Tlp.set_addr_be_data(1*4, test_data)
            seq_item.Tlp.tag = 1
            seq_item.Tlp.requester_id = 1
        elif seq_item.Tlp.fmt_type == TlpType.MEM_READ:
            seq_item.Tlp.set_addr_be(1*4, length)
            seq_item.Tlp.tag = 1
            seq_item.Tlp.requester_id = 1
        data = seq_item.Tlp.pack()
        print(seq_item.Tlp)
        seq_item.frame = AxiStreamFrame(self.tlp2dllp(self.seq_num,data,tlp_calculator))
        seq_item.frame.tuser = 0x2
        await self.finish_item(seq_item)
        # assert 1 == 0
        self.result = seq_item.results

async def test_fc1(seqr, fc1_type, seq_num, hdr_fc, data_fc):
    seq = dllp_seq("seq", seq_num, fc1_type, hdr_fc, data_fc)
    print(seq)
    await seq.start(seqr)
    return seq.result

# async def send_tlps(seqr):
#     seq = tlp_seq("seq")
#     await seq.start(seqr)
#     return seq.result

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
            sum = await test_fc1(self.seqr, init_list[i], i, hdr_fc, data_fc)
            fib_list.append(sum)
            prev_num = cur_num
            cur_num = sum
        # for i in range(6):
        #     sum = await send_tlp(self.seqr, tlp_list[i], i)
        #     fib_list.append(sum)
        #     prev_num = cur_num
        #     cur_num = sum
        # uvm_root().logger.info("flow control initiation Sequence: " + str(fib_list))
        # uvm_root().set_logging_level_hier(CRITICAL)


class flow_control_seq(base_sequence):
    def __init__(self, name, config=None):
        super().__init__(name)
        self.config = config
        
    async def send_fc1(self,seqr):
        fc1_list = [DllpType.INIT_FC1_P,
                     DllpType.INIT_FC1_NP,
                     DllpType.INIT_FC1_CPL]
        fc_received = []
        while True:
            for packet in fc1_list:
                fc_seq = dllp_seq("fc seq item", dllp_seq_item, packet)
                await fc_seq.start(seqr)
                if(fc_seq.result):
                    dllp = Dllp()
                    dllp = dllp.unpack(fc_seq.result.tdata)
                    if(not(dllp.type in fc_received)):
                        fc_received.append(dllp.type)
                await Timer(900)
            if fc_received == fc1_list:
                break
            
    async def send_fc2(self,seqr):
        fc1_list = [DllpType.INIT_FC2_P,
                     DllpType.INIT_FC2_NP,
                     DllpType.INIT_FC2_CPL]
        fc_received = []
        while True:
            for packet in fc1_list:
                fc_seq = dllp_seq("fc seq item", dllp_seq_item, packet)
                await fc_seq.start(seqr)
                if(fc_seq.result):
                    dllp = Dllp()
                    dllp = dllp.unpack(fc_seq.result.tdata)
                    if(not(dllp.type in fc_received)):
                        fc_received.append(dllp.type)
                await Timer(900)
            if fc_received == fc1_list:
                break
            
    async def send_tlp(self,seqr):
        for i in range(100):
            tlp = tlp_seq("tlp seq item",i)
            await tlp.start(seqr)
            
    async def get_dllp(self):
        ...
        # while self.result_get_port.can_get():
        #     cmd_success, cmd = self.cmd_get_port.try_get()
            
    async def body(self):
        # print(ConfigDB())
        seqr = ConfigDB().get(None, "", "phy_sequencer")
        # while True:
        coro1Thread = cocotb.start_soon(self.send_fc1(seqr))
        coro2Thread = await Timer(9000000)
        coro3Thread = cocotb.start_soon(self.get_dllp())
        
        await First(coro1Thread,coro2Thread)
        coro1Thread = cocotb.start_soon(self.send_fc2(seqr))
        await First(coro1Thread,coro2Thread)
        
        coro1Thread = cocotb.start_soon(self.send_tlp(seqr))
        await First(coro1Thread,coro2Thread)
        # uvm_root().logger.info("flow control initiation Sequence: ")
        # uvm_root().set_logging_level_hier(CRITICAL)


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
        self.dut = cocotb.top
        self.source = AxiStreamSource(AxiStreamBus.from_prefix(
            self.dut, "s_axis_phy"), self.dut.clk_i, self.dut.rst_i)
        self.sink = AxiStreamSink(AxiStreamBus.from_prefix(
            self.dut, "m_axis_dllp2phy"), self.dut.clk_i, self.dut.rst_i)
        self.datum = None

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
        return itertools.cycle([1, 1, 1, 0])

    async def launch_tb(self):
        self.dut.phy_link_up_i.value = 0
        await self.reset()
        self.dut.phy_link_up_i.value = 1

    async def drive_item(self):
         while True:
            # Wait for a sequence item from the sequencer
            seq_item = await self.seq_item_port.get_next_item()
            print("got item")
            await self.source.send(seq_item.frame)
            await with_timeout(self.source.wait(), 10000, 'ns')
            seq_item.results = self.datum
            self.datum = None
            self.ap.write(seq_item)
            self.seq_item_port.item_done()
            
    async def  read_dllp(self):
         while True:
            self.datum = await self.sink.recv()
            # self.datum = self.datuma.tdata
            print(f"\n\n\n\n\nMONITORED {self.datum}")
            # self.source_ap.write(datum)

    async def run_phase(self):
        await self.launch_tb()
        for i in range(20):
            await RisingEdge(self.dut.clk_i)
        self.source.set_pause_generator(self.cycle_pause())
        self.sink.set_pause_generator(self.cycle_pause())
        while True:
            coro1Thread = cocotb.start_soon(self.drive_item())
            await Timer(10000)
            coro2Thread = cocotb.start_soon(self.read_dllp())
            await First(coro1Thread,coro2Thread)
            # Wait for a sequence item from the sequencer
            # seq_item = await self.seq_item_port.get_next_item()
            # print("got item")
            # # Drive the sequence item to the DUT
            # await self.drive_item(seq_item)
            # Notify the sequencer that the item has been processed
            # self.ap.write(seq_item)
            # self.seq_item_port.item_done()
        # super().run_phase()

        # while True:
        #     seq_item = await self.seq_item_port.get_next_item()


class phy_sequencer(base_sequencer):
    def __init__(self, name="phy_sequencer", parent=None):
        super().__init__(name, parent)
        ConfigDB().set(None, "*", name, self)
        self.name = name


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
        # self.monitor.seq_item_port.connect(self.sequencer.seq_item_export)

class phy_env(uvm_env):
    def __init__(self, name, parent=None):
        super().__init__(name, parent)
        self.name = name

    def build_phase(self):
        self.dut = cocotb.top
        self.log = logging.getLogger("cocotb.tb")
        self.log.setLevel(logging.DEBUG)
        cocotb.start_soon(Clock(self.dut.clk_i, 2, units="ns").start())
        self.agent = phy_agent.create("phy_agent", self)
    


@pyuvm.test()
class Fc1Test(uvm_test):
    """Test Dllp layer by going through flow control init sequence"""

    def build_phase(self):
        self.env = phy_env.create("phy_env", self)

    def end_of_elaboration_phase(self):
        self.test_all = flow_control_seq("test fc1")
        print(self.env.agent.monitor.source_ap)
        # self.env.agent.monitor.source_ap.connect(self.test_all.cmd_export)
        # self.test_all.mon_ap.connect(self.env.agent.monitor.source_ap)
    
    def connect_phase(self):
        ...
        # self.env.agent.monitor.source_ap.connect(self.test_all.cmd_export)
        # self.test_all.cmd_export.connect(self.env.agent.monitor.source_ap)

    async def run_phase(self):
        self.raise_objection()
        await self.test_all.start()
        self.drop_objection()
