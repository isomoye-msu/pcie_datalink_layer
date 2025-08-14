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

def reverse_bits_in_byte(byte):
    bit_array = bitstring.BitArray(int=byte, length=9)
    bit_array.reverse()
    return bit_array.uint

class pcie_enumeration_seq(pcie_flow_control_seq, crv.Randomized):
    def __init__(self, name):
        super().__init__(name)
        # self.config = config
        self.log = logging.getLogger("pcie enumeration seq")
        self.log.setLevel(logging.ERROR)
        # self.msix = msix
        self.tlp_queue = Queue()
        self.dllp_queue = Queue()
        # self.port = None
        # self.other_port = None
        
            
    async def body(self):
        self.sequencer = ConfigDB().get(None, "", "pipe_sequencer")
        assert self.sequencer is not None
        await super().body()


        self.rc = RootComplex()
        # print(self.rc)
        self.dev = Device()
        # configure port
        # self.dev.upstream_port.max_link_speed = 3
        # self.dev.upstream_port.max_link_width = 2
        # # self.dev.upstream_port.max_payload_size = 128
        # self.dev.upstream_port.port_delay = 8e-9
        # self.dev.device_num = 0
        # self.dev.function_num = 0


        
        self.rx_queue = Queue()
        
        port = self.rc.make_port()
        # print(repr(port))
        port.connect(self.dev)


        # for i in range(len(self.dev.upstream_port.fc_state)):
        # await self.dev.upstream_port.fc_state[0].initialized.wait()
        # assert 1 == 0
        # self.rc.add_endpoint(self.dev)
        # self.rc._run_routing(self.dev)
        # self.rc.upstream_bridge.set_upstream_port = self.port
        


        # self.hold_downstream_tx_handler = self.rc.upstream_bridge.downstream_tx_handler
        # upstream_tx_handler
        # self.rc.upstream_bridge.downstream_tx_handler = self.send_pkt
        # self.port.rx_handler = self.rc.downstream_recv
        # self.rc.handle_tlp = self.handle_tlp
        # self.rc.perform_nonposted_operation = self.perform_nonposted_operation
        # self.rc.upstream_bridge.set_upstream_port(self.port)
        # self.port.rx_handler = self.rc.upstream_bridge.downstream_recv
        # self.downstream_port = self.port
        # self.rc.upstream_bridge.downstream_tx_handler = self.port.send
        # self.rc.upstream_bridge.downstream_recv = self.upstream_recv

        self.dev.upstream_port.ext_recv = self.handle_tx_port
        # self.port.ext_recv = self.dev.upstream_port.other.ext_recv
        # self.dev.set_port(self.port)
        # self.dev.upstream_port.handle_tx = self.waste
        # self.dev.upstream_recv = self.handle_tx
        # self.port.handle_tx = self.waste

        # self.dev.upstream_port.fc_initialized = True
        # # self.dev.upstream_port.fc_state[0].reset()
        # self.dev.upstream_port.log.setLevel(logging.DEBUG)

        # self.port.rx_handler = self.rc.upstream_bridge.upstream_tx_handler
        # self.dev.upstream_port.ext_recv = self.handle_tx
        # self.dev.upstream_recv = self.upstream_recv
        # self.upstream_port.send(tlp) 
        # self.dev.upstream_send = self.send_tlp

        self.dev.log.setLevel(logging.INFO)
        self.rc.log.setLevel(logging.INFO)
        
    
        # self.dev.handle_tx = self.handle_tx

        # user logic
        # self.tx_source = tx_source()
        # self.rx_sink = rx_sink()
        # self.tx_source = PTilePcieSource(PTileTxBus.from_prefix(dut, "tx_st"), dut.coreclkout_hip)
        # self.tx_source.ready_latency = 3
        # self.rx_sink = PTilePcieSink(PTileRxBus.from_prefix(dut, "rx_st"), dut.coreclkout_hip)
        # self.rx_sink.ready_latency = 27

        self.regions = [None]*6
        self.regions[0] = mmap.mmap(-1, 1024*1024)
        self.regions[1] = mmap.mmap(-1, 1024*1024)
        self.regions[3] = mmap.mmap(-1, 1024)
        self.regions[4] = mmap.mmap(-1, 1024*64)

        # self.current_tag = 0
        # self.tag_count = 256
        # self.tag_active = [False]*256
        # self.tag_release = Event()

        # self.rx_cpl_queues = [Queue() for k in range(256)]
        # self.rx_cpl_sync = [Event() for k in range(256)]

        # self.rc.recv_cpl = self.recv_cpl

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
        # self.dev.make_function()
        
        # self.dev.functions[0].log.setLevel(logging.DEBUG)
        # self.dev.functions[0].upstream_tx_handler = self.send_tlp
        # for f in self.dev.functions:
        #     f.upstream_tx_handler = self.send_tlp
        
        # await self.rc.enumerate()
        

        # dev = self.rc.find_device(self.dev.functions[0].pcie_id)
        # await dev.enable_device()
        await with_timeout(self.rc.enumerate(),100000,'ns')
        # await self.rc.enumerate()
    # async def send_skp(self):
    #     pipe_seq_item_h.pipe_operation = pipe_operation_t.SEND_SKP
    #     # pipe_seq_item_h.tlp = tlp_pkt
    #     await self.start_item (pipe_seq_item_h)
    #     await self.finish_item (pipe_seq_item_h)

    async def handle_tx_port(self,pkt):
        # print(f"handle tx: {repr(pkt)}")
        if self.dev.upstream_port.fc_initialized == False:
            if isinstance(pkt, Dllp):
                # DLLP
                self.dev.upstream_port.log.debug("Receive DLLP %s", pkt)
                self.dev.upstream_port.handle_dllp(pkt)
            else:
                # TLP
                self.dev.upstream_port.log.debug("Receive TLP %s", pkt)
                if pkt.seq == self.dev.upstream_port.next_recv_seq:
                    # expected seq
                    self.dev.upstream_port.next_recv_seq = (self.dev.upstream_port.next_recv_seq + 1) & 0xfff
                    self.dev.upstream_port.nak_scheduled = False
                    self.dev.upstream_port.start_ack_latency_timer()
                    pkt = Tlp(pkt)
                    self.dev.upstream_port.fc_state[self.dev.upstream_port.classify_tlp_vc(pkt)].rx_process_tlp_fc(pkt)
                    self.dev.upstream_port.rx_queue.put_nowait(pkt)
                elif (self.dev.upstream_port.next_recv_seq - pkt.seq) & 0xfff < 2048:
                    self.dev.upstream_port.log.warning("Received duplicate TLP, discarding (seq %d, expecting %d)", pkt.seq, self.dev.upstream_port.next_recv_seq)
                    self.dev.upstream_port.stop_ack_latency_timer()
                    self.dev.upstream_port.send_ack.set()
                else:
                    self.dev.upstream_port.log.warning("Received out-of-sequence TLP, sending NAK (seq %d, expecting %d)", pkt.seq, self.dev.upstream_port.next_recv_seq)
                    if not self.dev.upstream_port.nak_scheduled:
                        self.dev.upstream_port.nak_scheduled = True
                        self.dev.upstream_port.stop_ack_latency_timer()
                        self.dev.upstream_port.send_ack.set()
        else:
            pipe_seq_item_h = pipe_seq_item("pipe_seq_item")
            print(f"handle tx override: {repr(pkt)}")
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
            # await Timer(500,'ns')
            # assert 1 == 0


    async def send_rolling_idle(self):
        ...

    async def waste(self,req):
        if self.dev.upstream_port.fc_initialized == False:
            await self.dev.upstream_port.other.ext_recv(req)
        else:
            print(f"wasting {repr(req)}")
            # Timer(1000, 'ns')

        # assert 1 == 0



    async def recieve_dllp(self):
        count = 0
        while (1):
            # await self.pipe_agent_config.dllp_data_detected_e.wait()
            if self.pipe_agent_config.dllp_received:
                pkt = Dllp()
                dllp_in = self.pipe_agent_config.dllp_received.pop(0)
                dllp_int =  b'\x00\x00\x40\x10\x5a\x16'
                # print(f" dllp_in data: {[hex(q) for q in dllp_in]}")
                # print(f" dllp_int data: {[hex(q) for q in dllp_int]}")
                # assert 1 == 0
                # dllp_int = int.from_bytes(dllp_in, byteorder='little', signed=False)
                pkt = pkt.unpack_crc(bytes(dllp_in))
                # print(f"dllp packet in {repr(pkt)}")
                # print(f"unpacking : {bytes(dllp_in[0:4])}")
                await self.port.ext_recv(pkt)
                dw , = struct.unpack_from('>L', bytes(dllp_in[0:4]))
                # print(f"unpacking : {hex(dw)}")
                # print(f"dllp type: {hex((dw >> 24) & 0xff)}")
                self.pipe_agent_config.dllp_data_detected_e.clear()
                self.pipe_agent_config.dllp_data_read_e.set()
                count += 1
                if self.port.fc_initialized:
                    break
            else:
                await self.pipe_agent_config.dllp_data_detected_e.wait()
                # assert 1 == 0


        # pipe_seq_item_h = pipe_seq_item("pipe_seq_item_h")
        # pipe_seq_item_h.pipe_operation = pipe_operation_t.IDLE_DATA_TRANSFER
        # while(1):
        #     await self.start_item(pipe_seq_item_h)
        #     await self.finish_item(pipe_seq_item_h)
            # assert 1 == 0


    async def send_tlp(self,tlp):
        pipe_seq_item_h = pipe_seq_item("pipe_seq_item")
        pipe_seq_item_h.pipe_operation = DLLP_TRANSFER



        seq_item =  pcie_seq_item("pcie_sequence_item")
        await self.start_item(seq_item)
        seq_item.is_tlp = True
        seq_item.frame = AxiStreamFrame(tlp.pack())
        await self.finish_item(seq_item)
        self.result = seq_item.results
    
    async def send_pkt(self,pkt):
        print(f"compltere id: {pkt.completer_id}")
        print(f"requester id: {pkt.requester_id}")
        print(f"requester id: {pkt.dest_id}")
        print(f"requester id type: {type(pkt.dest_id)}")

        if pkt.dest_id == PcieId(0,1,0):
            await self.port.send(pkt)
        else:
            # await self.port.ext_recv(None)
            await self.hold_downstream_tx_handler(pkt)

        # await self.hold_downstream_tx_handler(pkt)
    # async def handle_tx(self, pkt):
    #     pipe_seq_item_h = pipe_seq_item("pipe_seq_item")
    #     if isinstance(pkt,Dllp):
    #         print(repr(pkt))
    #         # assert 1 == 0
    #         pipe_seq_item_h.pipe_operation = pipe_operation_t.DLLP_TRANSFER
    #         pipe_seq_item_h.dllp = pkt
    #         await self.start_item (pipe_seq_item_h)
    #         await self.finish_item (pipe_seq_item_h)
            
    #     elif isinstance(pkt,Tlp):
    #         ...
    #         # seq_item = pkt
    #         # seq_item.crc = self.calculator.checksum(
    #         #     seq_item.pack()).to_bytes(2, 'big')
    #         # data = seq_item.pack()
    #         # frame = AxiStreamFrame(self.tlp2dllp(self.seq_num,data,self.tlp_calculator))
    #         # frame.tuser = 2
    #         # self.seq_num += 1
    #         # frame.normalize()
    #     # await self.dllp_queue.put(frame)
    #     # seq_item =  pcie_seq_item("pcie_sequence_item")
    #     # await self.start_item(seq_item)
    #     # seq_item.is_dllp = True
    #     # seq_item.frame = frame
    #     # await self.finish_item(seq_item)
    #     # self.result = seq_item.results
    #     # await self.send_dllp(frame)
    # # async def response_tlp(self):
    # #         while True:
    # #             seq_item = await self.seqr.response_fifo.get()
    # #             self.log.debug("response tlp: %s",repr(seq_item.pkt))
    # #             # print("response tlp: %s",repr(seq_item.pkt))
    # #             if seq_item.is_pkt and seq_item.pkt:
    # #                 # print(type(seq_item.pkt))
    # #                 # await self.dev.upstream_port.handle_tx(seq_item.pkt)
    # #                 await self.dev.upstream_port._transmit((seq_item.pkt))
    # #                 # await self.dev.upstream_port.send(seq_item.pkt)
    # #                 # await self.dev.upstream_port.other.ext_recv(seq_item.pkt)
    # #             elif seq_item.pkt:
    # #                 # self.dev.upstream_port.rx_queue.put_nowait(Tlp(seq_item.pkt))
    # #                 await self.upstream_recv(seq_item.pkt)
                
        
    def tlp2dllp(self,seq_num, data,tlp_calculator):
        test_data = seq_num.to_bytes(2,'big')
        test_data += data
        test_data += tlp_calculator.checksum(test_data).to_bytes(4,'big')
        # seq_num += 1
        return test_data
    
    async def send_rc_cpl(self,pkt):
        if pkt.fmt_type == TlpType.CPL or pkt.fmt_type == TlpType.CPL_DATA :
            await   self.handle_tx(pkt)
        else:
            await self.rc.downstream_send(pkt)
            # await self.rc.downstream_send(pkt)
           
    async def send_tlp(self,tlp):
            # await Timer(20, 'ns')
            # self.log.info("send tlp: %s",tlp)
            seq_item =  pcie_seq_item("pcie_sequence_item")
            await self.start_item(seq_item)
            seq_item.is_tlp = True
            seq_item.frame = AxiStreamFrame(tlp.pack())
            await self.finish_item(seq_item)
            self.result = seq_item.results
    

    async def handle_tlp(self, tlp):
        print(f"handle tlp {repr(tlp)}")
        # print([hex(word) for word in tlp.data])
        await self.dev.upstream_port.other.ext_recv(tlp)

    async def response_tlp(self,tlp):
        while True:
            seq_item = await self.seqr.response_fifo.get()
            self.log.debug("response tlp: %s",repr(seq_item.pkt))
            # print("response tlp: %s",repr(seq_item.pkt))
            if seq_item.is_pkt and seq_item.pkt:
                # print(type(seq_item.pkt))
                # await self.dev.upstream_port.handle_tx(seq_item.pkt)
                await self.dev.upstream_port._transmit((seq_item.pkt))
                # await self.dev.upstream_port.send(seq_item.pkt)
                # await self.dev.upstream_port.other.ext_recv(seq_item.pkt)
            elif seq_item.pkt:
                # self.dev.upstream_port.rx_queue.put_nowait(Tlp(seq_item.pkt))
                await self.upstream_recv(seq_item.pkt)


