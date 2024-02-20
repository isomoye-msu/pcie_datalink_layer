import cocotb
import random
import itertools
import pyuvm
import mmap
import sys
import math
from cocotb.queue import Queue
from cocotbext.pcie.core import *
from cocotbext.pcie.core.dllp import *
from cocotbext.pcie.core.tlp import *
from cocotbext.pcie.core.port import *
from cocotb.clock import Clock
from cocotbext.axi import *
from cocotb.triggers import *
from crc import Calculator, Configuration
from cocotbext.pcie.core import RootComplex, MemoryEndpoint, Device
from cocotbext.pcie.core.caps import MsiCapability
from cocotbext.pcie.core.utils import PcieId
from pyuvm import *
from base_uvm import *
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
        
class DllpPort(Port):
    def __init__(self,tlp_source):
        self.tlp_source = tlp_source
        self.rx_handler = None
        self.other = []
        
    async def send(self, tlp):
        print('got_tlp', tlp)
        # tlp = Tlp()
        # frame = AxiStreamFrame(tlp.pack)
        # print(frame)
        # print(tlp.pack)
        # data = tlp.pack()
        # print(data)
        await self.tlp_source.send(tlp.pack())
        
    
    
    
class PhySimPort():
    """Port to interconnect simulated PCIe devices"""
    def __init__(self, source):
        self.fc_idle_timer_steps = get_sim_steps(1, 'us')
        self.fc_update_steps = get_sim_steps(3, 'us')

        # self.other = None

        self.port_delay = 5e-9
        # self.rx_handler = self.tlp_handler

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
    
    # def connect(self, other):
    #     if isinstance(other, AxiStreamSource):
    #         self.source = other

    # def _connect(self, port):
    #     if self.other is not None:
    #         raise Exception("Already connected")
    #     port._connect_int(self)
    #     self._connect_int(port)
    
    # async def tlp_handler(self,tlp):
    #     tlp.release_fc()
        # ...
        # print("tlp type " + str(tlp.get_fc_type) + "\n\n")
        #  self.fc_state[0].ph.rx_credits_allocated = 50
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
        # await Timer(max(int(pkt.get_wire_size() * self.symbol_period * self.time_scale), 1), 'step')
        # cocotb.start_soon(self._transmit(pkt))
        await self._transmit(pkt)

    async def _transmit(self, pkt):
        if self.source is None:
            raise Exception("Port not connected")
        # await Timer(max(self.link_delay_steps, 10000), 'step')
        # await Timer(2000)
        if isinstance(pkt,Dllp):
            seq_item = pkt
            seq_item.crc = self.calculator.checksum(
                seq_item.pack()).to_bytes(2, 'big')
            data = seq_item.pack()
            data += self.calculator.checksum(data).to_bytes(2, 'big')
            frame = AxiStreamFrame(data)
            # print("port sending dllp")
            # print(repr(pkt))
            frame.tuser = 1
            
        elif isinstance(pkt,Tlp):
            # print("port sending tlp")
            # print(pkt)
            seq_item = pkt
            seq_item.crc = self.calculator.checksum(
                seq_item.pack()).to_bytes(2, 'big')
            data = seq_item.pack()
            # print(seq_item.fmt_type)
            # data += self.calculator.checksum(data).to_bytes(2, 'big')
            frame = AxiStreamFrame(self.tlp2dllp(self.seq_num,data,self.tlp_calculator))
            # print(frame.tdata)
            # print("port sending tlp \n\n")
            # print(pkt)
            frame.tuser = 2
            self.seq_num += 1
            # frame.normalize()
            # print(frame)
            
        await self.source.send(frame)
    #     await with_timeout(self.source.wait(), 100000, 'ns')
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
        # print("start sequence")
        # print(seq_item)
        await self.start_item(seq_item)
        # print("post sequence")
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
        length = random.randint(15, 256)
        seq_item = dllp_seq_item("my_sequence_item")
        # print("my seq" + str(seq_item))
        await self.start_item(seq_item)
        seq_item.Tlp.fmt_type = random.choice([TlpType.MEM_WRITE,TlpType.MEM_READ,TlpType.IO_READ,
                                               TlpType.IO_WRITE])
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
        # print(seq_item.Tlp)
        dllp_data = self.tlp2dllp(9,data,tlp_calculator)
        # print(dllp_data)
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
        for i in range(100):
            tlp = tlp_seq("tlp seq item",i)
            await tlp.start(seqr)
            # await Timer(90000000)
            
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
        self.log = logging.getLogger("cocotb.tb")
        # self.regions = [None]*6
        self.dev_max_payload = 256
        self.dev_bus_num = 0
        self.dev_device_num = 0
        self.dev_max_payload = 0
        self.dev_max_read_req = 0
        self.dev_msi_enable = 0
        self.dev_msi_multi_msg_enable = 0
        self.dev_msi_address = 0
        self.dev_msi_data = 0
        self.dev_msi_mask = 0
        self.rx_cpl_queues = [Queue() for k in range(256)]
        self.rx_cpl_sync = [Event() for k in range(256)]
        self.current_tag = 0
        self.tag_count = 256
        self.tag_active = [False]*256
        self.tag_release = Event()
        # self.dev.msix_enable = 0
        # self.dev.msix_function_mask = 0

        # self.dllpport = DllpPort(self.tlp_source)
        self.regions = [None]*6
        self.regions[0] = mmap.mmap(-1, 1024*1024)
        self.regions[1] = mmap.mmap(-1, 1024*1024)
        self.regions[3] = mmap.mmap(-1, 1024)
        self.regions[4] = mmap.mmap(-1, 1024*64)

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
            # print("got item")
            # await self.port.send(Tlp(seq_item.Tlp))
            seq_item.results = None
            self.datum = None
            self.seq_item_port.item_done()
    
    async def upstream_recv(self, tlp):
        self.dev.log.debug("Got downstream TLP: %r", tlp)

        self.log.debug("RX TLP: %s", repr(tlp))

        if tlp.fmt_type in {TlpType.CPL, TlpType.CPL_DATA, TlpType.CPL_LOCKED, TlpType.CPL_LOCKED_DATA}:
            self.log.info("Completion")

            self.rx_cpl_queues[tlp.tag].put_nowait(tlp)
            self.rx_cpl_sync[tlp.tag].set()
        elif tlp.fmt_type in {TlpType.MEM_WRITE, TlpType.MEM_WRITE_64}:
            self.log.info("Memory write")

            # perform operation
            region = 0 #frame.bar_range
            addr = tlp.address % len(self.regions[region])
            offset = 0
            start_offset = None
            mask = tlp.first_be
            length = tlp.length

            # perform write
            data = tlp.get_data()

            # first dword
            for k in range(4):
                if mask & (1 << k):
                    if start_offset is None:
                        start_offset = offset
                else:
                    if start_offset is not None and offset != start_offset:
                        self.regions[region][addr+start_offset:addr+offset] = data[start_offset:offset]
                    start_offset = None

                offset += 1

            if length > 2:
                # middle dwords
                if start_offset is None:
                    start_offset = offset
                offset += (length-2)*4

            if length > 1:
                # last dword
                mask = tlp.last_be

                for k in range(4):
                    if mask & (1 << k):
                        if start_offset is None:
                            start_offset = offset
                    else:
                        if start_offset is not None and offset != start_offset:
                            self.regions[region][addr+start_offset:addr+offset] = data[start_offset:offset]
                        start_offset = None

                    offset += 1

            if start_offset is not None and offset != start_offset:
                self.regions[region][addr+start_offset:addr+offset] = data[start_offset:offset]
            self.log.info("Done Memory write")
        elif tlp.fmt_type in {TlpType.MEM_READ, TlpType.MEM_READ_64}:
                    self.log.info("Memory read")

                    # perform operation
                    region = 0 #frame.bar_range
                    addr = tlp.address % len(self.regions[region])
                    offset = 0
                    length = tlp.length

                    # perform read
                    data = self.regions[region][addr:addr+length*4]

                    # prepare completion TLP(s)
                    m = 0
                    n = 0
                    addr = tlp.address+tlp.get_first_be_offset()
                    dw_length = tlp.length
                    byte_length = tlp.get_be_byte_count()

                    while m < dw_length:
                        cpl = Tlp.create_completion_data_for_tlp(tlp, PcieId(0, 0, 0))

                        cpl_dw_length = dw_length - m
                        cpl_byte_length = byte_length - n
                        cpl.byte_count = cpl_byte_length
                        if cpl_dw_length > 32 << self.dev_max_payload:
                            # max payload size
                            cpl_dw_length = 32 << self.dev_max_payload
                            # RCB align
                            cpl_dw_length -= (addr & 0x7c) >> 2

                        cpl.lower_address = addr & 0x7f

                        cpl.set_data(data[m*4:(m+cpl_dw_length)*4])

                        self.log.debug("Completion: %s", repr(cpl))
                        await self.dev.upstream_send(cpl)
                        # await self.tx_source.send(PTilePcieFrame.from_tlp(cpl))

                        m += cpl_dw_length
                        n += cpl_dw_length*4 - (addr & 3)
                        addr += cpl_dw_length*4 - (addr & 3)
        elif tlp.fmt_type == TlpType.IO_READ:
            self.log.info("IO read")

            cpl = Tlp.create_completion_data_for_tlp(tlp, PcieId(self.dev_bus_num, 0, 0))

            # region = tlp.bar_id
            region = 3
            addr = tlp.address % len(self.regions[region])
            offset = 0
            start_offset = None
            mask = tlp.first_be

            # perform operation
            data = bytearray(4)

            for k in range(4):
                if mask & (1 << k):
                    if start_offset is None:
                        start_offset = offset
                else:
                    if start_offset is not None and offset != start_offset:
                        data[start_offset:offset] = self.regions[region][addr+start_offset:addr+offset]
                    start_offset = None

                offset += 1

            if start_offset is not None and offset != start_offset:
                data[start_offset:offset] = self.regions[region][addr+start_offset:addr+offset]

            cpl.set_data(data)
            cpl.byte_count = 4
            cpl.length = 1

            self.log.debug("Completion: %s", repr(cpl))
            await self.dev.upstream_send(cpl)
            # await self.tx_source.send(PTilePcieFrame.from_tlp(cpl))

        elif tlp.fmt_type == TlpType.IO_WRITE:
            self.log.info("IO write")

            cpl = Tlp.create_completion_for_tlp(tlp, PcieId(self.dev_bus_num, 0, 0))

            # region = tlp.bar_id
            region = 0
            addr = tlp.address % len(self.regions[region])
            offset = 0
            start_offset = None
            mask = tlp.first_be

            # perform operation
            data = tlp.get_data()

            for k in range(4):
                if mask & (1 << k):
                    if start_offset is None:
                        start_offset = offset
                else:
                    if start_offset is not None and offset != start_offset:
                        self.regions[region][addr+start_offset:addr+offset] = data[start_offset:offset]
                    start_offset = None

                offset += 1

            if start_offset is not None and offset != start_offset:
                self.regions[region][addr+start_offset:addr+offset] = data[start_offset:offset]

            self.log.debug("Completion: %s", repr(cpl))
            await self.dev.upstream_send(cpl)
            # await self.tx_source.send(PTilePcieFrame.from_tlp(cpl))
        else:
            await self.dev.upstream_recv(tlp)

    async def read_tlp(self):
        while True:
            tlp = await self.tlp_sink.recv()
            tlp = Tlp.unpack(tlp.tdata)
            # print(repr(tlp))
            self.log.info(repr(tlp))
            await self.upstream_recv(tlp)
            
       
    async def  read_dllp(self):
         while True:
            self.datum = await self.sink.recv()
            rx_tlp = self.datum
            # print(pkt)
            if rx_tlp.tuser == 1:
                pkt = Dllp()
                pkt = pkt.unpack(rx_tlp.tdata)
                await self.dev.upstream_port._transmit(Dllp(pkt))
                # print(pkt)
            elif rx_tlp.tuser == 2:
                pkt = Tlp()
                self.log.info(repr(pkt))
                data = rx_tlp.tdata[2:len(rx_tlp.tdata)-4]
                pkt = pkt.unpack(data)
                seq = int.from_bytes(rx_tlp.tdata[:2],'big')
                print(hex(seq))
                print(bytes(rx_tlp.tdata))
                pkt.seq = int(hex(seq),0)
                print(pkt.seq)
                
                await self.dev.upstream_port._transmit(Tlp(pkt))
            else:
                print(None)
                pkt = None
    
    async def recv_cpl(self, tag, timeout=0, timeout_unit='ns'):
        queue = self.rx_cpl_queues[tag]
        sync =  self.rx_cpl_sync[tag]

        if not queue.empty():
            return queue.get_nowait()

        sync.clear()
        if timeout:
            await First(sync.wait(), Timer(timeout, timeout_unit))
        else:
            await sync.wait()

        if not queue.empty():
            return queue.get_nowait()

        return None
    
    async def perform_nonposted_operation(self, req, timeout=0, timeout_unit='ns'):
        completions = []

        req.tag = await self.dev.functions[0].alloc_tag()
        self.log.info("sending mem read")
        self.log.info(repr(req))
        await self.tlp_source.send(req.pack())

        while True:
            cpl = await self.recv_cpl(req.tag, timeout, timeout_unit)

            if not cpl:
                break

            completions.append(cpl)

            if cpl.status != CplStatus.SC:
                # bad status
                break
            elif req.fmt_type in {TlpType.MEM_READ, TlpType.MEM_READ_64}:
                # completion for memory read request

                # request completed
                if cpl.byte_count <= cpl.length*4 - (cpl.lower_address & 0x3):
                    break

                # completion for read request has SC status but no data
                if cpl.fmt_type in {TlpType.CPL, TlpType.CPL_LOCKED}:
                    break

            else:
                # completion for other request
                break

        self.release_tag(req.tag)

        return completions
    
    def release_tag(self, tag):
        assert self.dev.functions[0].tag_active[tag]
        self.dev.functions[0].tag_active[tag] = False
        self.dev.functions[0].tag_release.set()
    
    async def dma_mem_write(self, addr, data, timeout=0, timeout_unit='ns'):
        n = 0

        zero_len = len(data) == 0
        if zero_len:
            data = b'\x00'

        while n < len(data):
            req = Tlp()
            if addr > 0xffffffff:
                req.fmt_type = TlpType.MEM_WRITE_64
            else:
                req.fmt_type = TlpType.MEM_WRITE
            req.requester_id = PcieId(self.dev_bus_num, self.dev_device_num, 0)

            first_pad = addr % 4
            byte_length = len(data)-n
            # max payload size
            byte_length = min(byte_length, (128 << self.dev_max_payload)-first_pad)
            # 4k address align
            byte_length = min(byte_length, 0x1000 - (addr & 0xfff))
            req.set_addr_be_data(addr, data[n:n+byte_length])

            if zero_len:
                req.first_be = 0

            await self.perform_posted_operation(req)

            n += byte_length
            addr += byte_length

    async def perform_posted_operation(self, req):
        await self.tlp_source.send(req.pack())
        # await self.tx_source.send(PTilePcieFrame.from_tlp(req))
        
    async def dma_mem_read(self, addr, length, timeout=0, timeout_unit='ns'):
        data = bytearray()
        n = 0

        zero_len = length <= 0
        if zero_len:
            length = 1

        op_list = []

        while n < length:
            req = Tlp()
            if addr > 0xffffffff:
                req.fmt_type = TlpType.MEM_READ_64
            else:
                req.fmt_type = TlpType.MEM_READ
            req.requester_id = PcieId(self.dev_bus_num, self.dev_device_num, 0)

            first_pad = addr % 4
            # remaining length
            byte_length = length-n
            # limit to max read request size
            if byte_length > (128 << self.dev_max_read_req) - first_pad:
                # split on 128-byte read completion boundary
                byte_length = min(byte_length, (128 << self.dev_max_read_req) - (addr & 0x7f))
            # 4k align
            byte_length = min(byte_length, 0x1000 - (addr & 0xfff))
            req.set_addr_be(addr, byte_length)

            if zero_len:
                req.first_be = 0

            op_list.append((byte_length, cocotb.start_soon(self.perform_nonposted_operation(req, timeout, timeout_unit))))

            n += byte_length
            addr += byte_length

        for byte_length, op in op_list:
            cpl_list = await op.join()

            m = 0

            while m < byte_length:
                if not cpl_list:
                    raise Exception("Timeout")

                cpl = cpl_list.pop(0)

                if cpl.status != CplStatus.SC:
                    raise Exception("Unsuccessful completion")

                assert cpl.byte_count+3+(cpl.lower_address & 3) >= cpl.length*4
                assert cpl.byte_count == max(byte_length - m, 1)

                d = cpl.get_data()

                offset = cpl.lower_address & 3
                data.extend(d[offset:offset+cpl.byte_count])

                m += len(d)-offset

        if zero_len:
            return b''

        return bytes(data[:length])
        
    async def alloc_tag(self):
            tag_count = min(256 if self.dev.functions[0].pcie_cap.extended_tag_field_enable else 32, self.tag_count)

            while True:
                tag = self.dev.functions[0].current_tag
                for k in range(tag_count):
                    tag = (tag + 1) % tag_count
                    if not self.dev.functions[0].tag_active[tag]:
                        self.dev.functions[0].tag_active[tag] = True
                        self.dev.functions[0].current_tag = tag
                        return tag

                self.dev.functions[0].tag_release.clear()
                await self.dev.functions[0].tag_release.wait()
    
    async def waste_(self,pkt):
        # print(pkt)
        # await Timer(5000)
        if(isinstance(pkt,Tlp)):
            await self.tlp_source.send(pkt.pack())
            
    async def send_rc_cpl(self,pkt):
        if pkt.fmt_type == TlpType.CPL or pkt.fmt_type == TlpType.CPL_DATA :
         await   self.port.handle_tx(pkt)
        else:
           await self.rc.downstream_send(pkt)
            
            
    async def run_phase(self):
        await self.launch_tb()
        self.rc = RootComplex()
        self.dev = Device()
        self.port = PhySimPort(self.source)
        # self.dev.set_port(self.dllpport)
        self.rc.make_port().connect(self.dev)
        self.dev.upstream_port.ext_recv = self.port.handle_tx
        # self.dev.upstream_port.handle_tx = self.waste_
        self.dev.upstream_send = self.waste_
        # self.rc.downstream_send = self.waste_
        # self.rc.downstream_send = self.waste_
        # self.dev.set_port(self.port)
        self.rc.send = self.send_rc_cpl
        # self.rc.set_upstream_port(self.port)
        # self.dev.upstream_recv = self.upstream_recv
        coro2Thread = cocotb.start_soon(self.read_dllp())
        coro3Thread = cocotb.start_soon(self.read_tlp())
        # self.port.log.setLevel(logging.DEBUG)
        self.dev.log.setLevel(logging.DEBUG)
        self.rc.log.setLevel(logging.DEBUG)
        self.dev.make_function()
        self.dev.functions[0].configure_bar(0, len(self.regions[0]))
        self.dev.functions[0].configure_bar(1, len(self.regions[1]), True, True)
        self.dev.functions[0].configure_bar(3, len(self.regions[3]), False, False, True)
        self.dev.functions[0].configure_bar(4, len(self.regions[4]))
        # self.dev.make_function()
        # self.dev.make_function()
        # self.dev.make_function()
        # self.source.log.setLevel(logging.DEBUG)
        self.dev.functions[0].log.setLevel(logging.DEBUG)
        self.dev.upstream_port.log.setLevel(logging.DEBUG)
        self.dev.upstream_port.fc_initialized = True
        # self.port.send_fc.set()
        # print(self.port.send_fc.is_set())
        # self.port.fc_initialized = False
        self.source.set_pause_generator(self.cycle_pause())
        self.sink.set_pause_generator(self.cycle_pause())
        
        # await Timer(10000, 'ns')
        # assert 1 == 0
        
        mem = self.rc.mem_pool.alloc_region(16*1024*1024)
        mem_base = mem.get_absolute_address(0)

        io = self.rc.io_pool.alloc_region(1024)
        io_base = io.get_absolute_address(0)
        count = 0
        while self.dut.fc_initialized_o == 0:
            await RisingEdge(self.dut.clk_i)

        await self.rc.enumerate()
        print(self.dev.functions[0].pcie_id)
        # print(self.rc.devices)
        dev = self.rc.find_device(self.dev.functions[0].pcie_id)
        # dev.log.setLevel(logging.DEBUG)
        # while dev is None:
        #     dev = self.rc.find_device(self.dev.functions[0].pcie_id)
        # print(dev)
        # dev = self.rc.find_device("01:00.1")
        print(dev)
        await dev.enable_device()
        await dev.set_master()
        
        dev_bar0 = dev.bar_window[0]
        dev_bar1 = dev.bar_window[1]
        dev_bar3 = dev.bar_window[3]
        # print(dev_bar0)
        # assert 1 == 0
    

        for length in list(range(0, 32))+[1024]:
                for offset in list(range(8))+list(range(4096-8, 4096)):
                    self.log.info("Memory operation (32-bit BAR) length: %d offset: %d", length, offset)
                    test_data = bytearray([x % 256 for x in range(length)])

                    dev_bar0.write(offset, test_data, timeout=100)
                    self.log.info("Really done Mem write")
                    await Timer(100)
                    # wait for write to complete
                    await dev_bar0.read(offset, 0, timeout=100)
                    # assert self.regions[0][offset:offset+length] == test_data

                    # assert await dev_bar0.read(offset, length, timeout=5000) == test_data
            
        for length in list(range(0, 32))+[1024]:
            for offset in list(range(8))+list(range(4096-8, 4096)):
                self.log.info("Memory operation (DMA) length: %d offset: %d", length, offset)
                addr = mem_base+offset
                test_data = bytearray([x % 256 for x in range(length)])

                await self.dma_mem_write(addr, test_data, 50000, 'ns')
                # await Timer(9000)
                # wait for write to complete
                await self.dma_mem_read(addr, 0, 50000, 'ns')
                assert mem[offset:offset+length] == test_data
        
        while True:
            coro1Thread = cocotb.start_soon(self.drive_item())
            # await Timer(10000)
            # coro2Thread = cocotb.start_soon(self.read_dllp())
            # coro3Thread = cocotb.start_soon(self.read_tlp())
            await First(coro1Thread)


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
        cocotb.start_soon(Clock(self.dut.clk_i, .02, units="ns").start())
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
        await with_timeout(self.test_all.start(),3000,'ns')
        self.drop_objection()
