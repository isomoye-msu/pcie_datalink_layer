import cocotb
import random
import itertools
import pyuvm
import cocotb_test.simulator
import sys
from cocotb.queue import Queue
from cocotbext.pcie.core import *
from cocotbext.pcie.core.dllp import *
from cocotbext.pcie.core.tlp import *
from cocotbext.pcie.core.port import *
from cocotb.clock import Clock
from cocotbext.axi import *
from cocotb.triggers import *
from crc import Calculator, Configuration, Crc32
from pyuvm import *
from base_uvm import *
from pathlib import Path
sys.path.append(str(Path("..").resolve()))

class PhySimPort(Port):
    """Port to interconnect simulated PCIe devices"""
    def __init__(self, source, fc_init=[[0]*6]*8, *args, **kwargs):
        super().__init__(*args, fc_init, **kwargs)
        self.fc_idle_timer_steps = get_sim_steps(1, 'us')
        self.fc_update_steps = get_sim_steps(1, 'us')

        self.other = None

        self.port_delay = 5e-9
        self.rx_handler = self.tlp_handler

        self.symbol_period = 3
        self.max_latency_timer_steps = get_sim_steps(1e-1,'us')
        self.link_delay_steps = get_sim_steps(1e-1, 'us')
        self.max_latency_timer_steps = 4
        self.time_scale = 2
        self.seq_num = 0
        self.source = source
        self.config = Configuration(
            width=16,
            polynomial=0x1DB7,
            init_value=0xFFFF,
            final_xor_value=0x00000000,
            reverse_input=False,
            reverse_output=True,
        )
        self.calculator = Calculator(self.config)
        
        self.tlp_config = Configuration(
            width=32,
            polynomial=0x04C11DB7,
            init_value=0xFFFFFFFF,
            final_xor_value=0x00000000,
            reverse_input=False,
            reverse_output=True,
        )
        self.tlp_calculator = Calculator(self.tlp_config)
        # cocotb.start_soon(self._run_transmit())
        # cocotb.start_soon(self._run_receive())
        # cocotb.start_soon(self._run_fc_update_idle_timer())

    def tlp2dllp(self,seq_num, data,tlp_calculator):
        test_data = seq_num.to_bytes(2,'big')
        test_data += data
        test_data += tlp_calculator.checksum(test_data).to_bytes(4,'big')
        # seq_num += 1
        return test_data
    
    def connect(self, other):
        if isinstance(other, AxiStreamSource):
            self.source = other

    def _connect(self, port):
        if self.other is not None:
            raise Exception("Already connected")
        port._connect_int(self)
        self._connect_int(port)
    
    async def tlp_handler(self,tlp):
        print("got tlp: " + str(tlp))
        # while True:
        #     await Timer(90000)

    # def _connect_int(self, port):
    #     if self.other is not None:
    #         raise Exception("Already connected")

    #     self.other = port

    #     if self.max_link_speed:
    #         if port.max_link_speed:
    #             self.cur_link_speed = min(self.max_link_speed, port.max_link_speed)
    #         else:
    #             self.cur_link_speed = self.max_link_speed
    #     else:
    #         self.cur_link_speed = port.max_link_speed

    #     if self.max_link_width:
    #         if port.max_link_width:
    #             self.cur_link_width = min(self.max_link_width, port.max_link_width)
    #         else:
    #             self.cur_link_width = self.max_link_width
    #     else:
    #         self.cur_link_width = port.max_link_width

    #     if self.cur_link_width is not None and self.cur_link_speed is not None:
    #         self.symbol_period = 8 / (PCIE_GEN_RATE[self.cur_link_speed] * self.cur_link_width)
    #         self.max_latency_timer_steps = int(get_max_update_latency(self.max_payload_size, self.cur_link_width, self.cur_link_speed) * 8 / PCIE_GEN_RATE[self.cur_link_speed] * self.time_scale)
    #         self.link_delay_steps = int((self.port_delay + port.port_delay) * self.time_scale)
    #     else:
    #         self.symbol_period = 0
    #         self.max_latency_timer_steps = 0
    #         self.link_delay_steps = 0

    async def handle_tx(self, pkt):
        await Timer(max(int(pkt.get_wire_size() * self.symbol_period * self.time_scale), 1), 'step')
        # cocotb.start_soon(self._transmit(pkt))
        await self._transmit(pkt)

    async def _transmit(self, pkt):
        if self.source is None:
            raise Exception("Port not connected")
        await Timer(max(self.link_delay_steps, 1), 'step')
        if isinstance(pkt,Dllp):
            seq_item = pkt
            seq_item.crc = self.calculator.checksum(
                seq_item.pack()).to_bytes(2, 'big')
            data = seq_item.pack()
            data += self.calculator.checksum(data).to_bytes(2, 'big')
            frame = AxiStreamFrame(data)
            print("port sending dllp")
            print(pkt)
            frame.tuser = 1
            
        elif isinstance(pkt,Tlp):
            # print("sending tlp")
            seq_item = pkt
            seq_item.crc = self.calculator.checksum(
                seq_item.pack()).to_bytes(2, 'big')
            data = seq_item.pack()
            data += self.calculator.checksum(data).to_bytes(2, 'big')
            frame = AxiStreamFrame(self.tlp2dllp(self.seq_num,data,self.tlp_calculator))
            print("port sending tlp \n\n")
            print(pkt)
            frame.tuser = 2
            self.seq_num += 1
            
        await self.source.send(frame)
        await with_timeout(self.source.wait(), 100000, 'ns')
        # wait self.other.ext_recv(pkt)
    

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
        test_data =  bytes(20) #seq_num.to_bytes(2,'big')
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
        length = random.randint(1, 255)
        seq_item = dllp_seq_item("my_sequence_item")
        print("my seq" + str(seq_item))
        await self.start_item(seq_item)
        seq_item.Tlp.fmt_type = TlpType.MEM_WRITE
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
        dllp_data = self.tlp2dllp(9,data,tlp_calculator)
        print(dllp_data)
        seq_item.frame = AxiStreamFrame(dllp_data)
        seq_item.frame.tuser = 0x2
        await self.finish_item(seq_item)
        # assert 1 == 0
        self.result = seq_item.results


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
        for i in range(65):
            tlp = tlp_seq("tlp seq item",i)
            await tlp.start(seqr)
            await Timer(9000000)
            
    async def get_dllp(self):
        ...
        # while self.result_get_port.can_get():
        #     cmd_success, cmd = self.cmd_get_port.try_get()
            
    async def body(self):
        print(ConfigDB())
        seqr = ConfigDB().get(None, "", "phy_sequencer")
        coro1Thread = cocotb.start_soon(self.send_tlp(seqr))
        coro2Thread = await Timer(900000)
        await First(coro1Thread)
        # while True:
        # coro1Thread = cocotb.start_soon(self.send_fc1(seqr))
        # coro2Thread = await Timer(9000000)
        # coro3Thread = cocotb.start_soon(self.get_dllp())
        
        # await First(coro1Thread,coro2Thread)
        # coro1Thread = cocotb.start_soon(self.send_fc2(seqr))
        # await First(coro1Thread,coro2Thread)
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
        self.source.log.setLevel(logging.ERROR)
        self.sink = AxiStreamSink(AxiStreamBus.from_prefix(
            self.dut, "m_axis_phy"), self.dut.clk_i, self.dut.rst_i)
        self.sink.log.setLevel(logging.ERROR)
        self.tlp_sink = AxiStreamSink(AxiStreamBus.from_prefix(
            self.dut, "m_axis_tlp"), self.dut.clk_i, self.dut.rst_i)
        self.tlp_sink.log.setLevel(logging.ERROR)
        self.tlp_source = AxiStreamSource(AxiStreamBus.from_prefix(
            self.dut, "s_axis_tlp"), self.dut.clk_i, self.dut.rst_i)
        self.tlp_source.log.setLevel(logging.ERROR)
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
            await self.port.send(Tlp(seq_item.Tlp))
            seq_item.results = None
            self.datum = None
            self.seq_item_port.item_done()
    
    async def read_tlp(self):
        while True:
            tlp = await self.tlp_sink.recv()
            print("rx saxis tlp")
            print(Tlp(tlp))
            await self.tlp_source.send(tlp)
       
    async def  read_dllp(self):
         while True:
            self.datum = await self.sink.recv()
            rx_tlp = self.datum
            if rx_tlp.tuser == 1:
                pkt = Dllp()
                pkt = pkt.unpack(rx_tlp.tdata)
            elif rx_tlp.tuser == 2:
                pkt = Tlp()
                data = rx_tlp.tdata[2:len(rx_tlp.tdata)-4]
                pkt = pkt.unpack(data)
                pkt.seq = int.from_bytes(rx_tlp.tdata[:1], "big")     
            else:
                pkt = None
            if pkt:
                print("recieved packet")
                print(pkt)
                await self.port.ext_recv(pkt)
        
    async def run_phase(self):
        await self.launch_tb()
        self.port = PhySimPort(self.source,fc_init=[[64, 1024, 64, 64, 64, 1024]]*8)
        self.port.send_fc.set()
        print(self.port.send_fc.is_set())
        self.port.fc_initialized = False
        self.source.set_pause_generator(self.cycle_pause())
        self.sink.set_pause_generator(self.cycle_pause())
        while True:
            coro1Thread = cocotb.start_soon(self.drive_item())
            # await Timer(10000)
            coro2Thread = cocotb.start_soon(self.read_dllp())
            coro3Thread = cocotb.start_soon(self.read_tlp())
            await First(coro1Thread,coro2Thread,coro3Thread)


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
        self.log = logging.getLogger("cocotb.tb")
        self.log.setLevel(logging.DEBUG)
        self.env = phy_env.create("phy_env", self)

    def end_of_elaboration_phase(self):
        self.test_all = flow_control_seq("test fc1")
        
    async def run_phase(self):
        self.raise_objection()
        await with_timeout(self.test_all.start(),900000,'ns')
        self.drop_objection()
