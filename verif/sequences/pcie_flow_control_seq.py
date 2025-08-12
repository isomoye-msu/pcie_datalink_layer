import cocotb
import itertools
import pyuvm
import sys
from cocotbext.pcie.core import RootComplex, MemoryEndpoint, Device
from cocotbext.pcie.core.utils import PcieId
from cocotbext.pcie.core import *
from cocotbext.pcie.core.dllp import *
from cocotbext.pcie.core.tlp import *
from cocotbext.pcie.core.port import *
from cocotb.triggers import *
from pyuvm import *
from cocotb_coverage import crv
from pathlib import Path
from pipe_base_seq import *
from pipe_agent import pipe_seq_item
import bitstring
from pipe_types import *
from crc import Calculator, Configuration
sys.path.append(str(Path("..").resolve()))


def reverse_bits_in_byte(byte):
    bit_array = bitstring.BitArray(int=byte, length=9)
    bit_array.reverse()
    return bit_array.uint


class pcie_flow_control_seq(pipe_base_seq, crv.Randomized):
    def __init__(self, name):
        super().__init__(name)
        self.port = None
        self.other_port = None
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
        
            
    async def body(self):
        self.sequencer = ConfigDB().get(None, "", "pipe_sequencer")
        assert self.sequencer is not None
        self.port = SimPort(fc_init=[[64, 1024, 64, 64, 64, 1024]]*8)
        self.other_port = SimPort()
        self.port.other =  self.other_port
        self.other_port.other = self.port
        self.port.handle_tx = self.handle_tx
        cocotb.start_soon(self.send_rolling_idle())
        cocotb.start_soon(self.recieve_dllp())
        cocotb.start_soon(self.recieve_tlp())
        await super().body()
        # while not self.port.fc_initialized:
        #     await NullTrigger()
        # await self.send_skp()
        await with_timeout(self.pipe_agent_config.fc_initialized.wait(),1000,'ns')
        # await self.pipe_agent_config.fc_initialized.wait()

        # assert 1 == 0
    async def send_skp(self):
        pipe_seq_item_h = pipe_seq_item("pipe_seq_item_h")
        pipe_seq_item_h.pipe_operation = pipe_operation_t.SEND_SKP
        # pipe_seq_item_h.tlp = tlp_pkt
        await self.start_item (pipe_seq_item_h)
        await self.finish_item (pipe_seq_item_h)


    async def send_rolling_idle(self):
        pipe_seq_item_h = pipe_seq_item("pipe_seq_item_h")
        pipe_seq_item_h.pipe_operation = pipe_operation_t.IDLE_DATA_TRANSFER
        while(1):
            await self.start_item(pipe_seq_item_h)
            await self.finish_item(pipe_seq_item_h)
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
                pkt = pkt.unpack_crc(bytes(dllp_int))
                # print(f"dllp packet in {repr(pkt)}")
                # print(f"unpacking : {bytes(dllp_in[0:4])}")
                await self.port.ext_recv(pkt)
                dw , = struct.unpack_from('>L', bytes(dllp_in[0:4]))
                # print(f"unpacking : {hex(dw)}")
                # print(f"dllp type: {hex((dw >> 24) & 0xff)}")
                self.pipe_agent_config.dllp_data_detected_e.clear()
                self.pipe_agent_config.dllp_data_read_e.set()
                count += 1
                # if self.port.fc_initialized:
                #     break
            else:
                await self.pipe_agent_config.dllp_data_detected_e.wait()
                # assert 1 == 0

    async def recieve_tlp(self):
        count = 0
        while (1):
            # await self.pipe_agent_config.dllp_data_detected_e.wait()
            if self.pipe_agent_config.tlp_received:
                pkt = Tlp()
                tlp_in = self.pipe_agent_config.tlp_received.pop(0)
                # print([hex(j) for j in tlp_in])
                data = tlp_in[2:len(tlp_in)-4]
                # print([hex(j) for j in data])
                pkt = pkt.unpack(bytes(data))
                seq = int.from_bytes(tlp_in[:2],'big')
                pkt.seq = int(hex(seq),0)
                # print(repr(pkt))
                await self.handle_tlp(pkt)
                self.pipe_agent_config.tlp_data_read_e.set()
                count += 1
            else:
                await self.pipe_agent_config.tlp_data_detected_e.wait()
                self.pipe_agent_config.tlp_data_detected_e.clear()
        # pipe_seq_item_h = pipe_seq_item("pipe_seq_item_h")
        # pipe_seq_item_h.pipe_operation = pipe_operation_t.IDLE_DATA_TRANSFER
        # while(1):
        #     await self.start_item(pipe_seq_item_h)
        #     await self.finish_item(pipe_seq_item_h)
            # assert 1 == 0


    async def send_pkt(self,pkt):
        print(f"compltere id: {pkt.completer_id}")
        print(f"requester id: {pkt.requester_id}")
        print(f"requester id: {pkt.dest_id}")
        print(f"requester id type: {type(pkt.dest_id)}")
        
        await self.port.send(pkt)
        # if pkt.dest_id == 


        # dest_id=PcieId(0, 0, 0)dest_id=PcieId(0, 0, 0)
        # pipe_seq_item_h = pipe_seq_item("pipe_seq_item")
        # pipe_seq_item_h.pipe_operation = DLLP_TRANSFER



        # seq_item =  pcie_seq_item("pcie_sequence_item")
        # await self.start_item(seq_item)
        # seq_item.is_tlp = True
        # seq_item.frame = AxiStreamFrame(tlp.pack())
        # await self.finish_item(seq_item)
        # self.result = seq_item.results
    
    
    async def handle_tx(self, pkt):
        # if self.source is None:
            # raise Exception("Port not connected")
        # await Timer(max(self.link_delay_steps, 10000), 'step')
        # await Timer(2000)
        # self.log.info("dllp transmit %s", repr(pkt))
        pipe_seq_item_h = pipe_seq_item("pipe_seq_item")
        if isinstance(pkt,Dllp):
            # print(f"handle tx: {repr(pkt)}")
            pipe_seq_item_h.pipe_operation = pipe_operation_t.DLLP_TRANSFER
            pipe_seq_item_h.dllp = pkt
            await self.start_item (pipe_seq_item_h)
            await self.finish_item (pipe_seq_item_h)
            
        elif isinstance(pkt,Tlp):
            # pkt = self.tx_queue.get_nowait()
            tlp_pkt = pkt
            # tlp_pkt.seq = self.port.next_transmit_seq
            # self.port.log.debug("Send TLP %s", tlp_pkt)
            # self.port.next_transmit_seq = (self.port.next_transmit_seq + 1) & 0xfff
            # self.port.retry_buffer.put_nowait(tlp_pkt)
            pipe_seq_item_h.pipe_operation = pipe_operation_t.TLP_TRANSFER
            pipe_seq_item_h.tlp = tlp_pkt
            await self.start_item (pipe_seq_item_h)
            await self.finish_item (pipe_seq_item_h)
            # seq_item = pkt
            # seq_item.crc = self.calculator.checksum(
            #     seq_item.pack()).to_bytes(2, 'big')
            # data = seq_item.pack()
            # frame = AxiStreamFrame(self.tlp2dllp(self.seq_num,data,self.tlp_calculator))
            # frame.tuser = 2
            # self.seq_num += 1
            # frame.normalize()
        # await self.dllp_queue.put(frame)
        # seq_item =  pcie_seq_item("pcie_sequence_item")
        # await self.start_item(seq_item)
        # seq_item.is_dllp = True
        # seq_item.frame = frame
        # await self.finish_item(seq_item)
        # self.result = seq_item.results
        # await self.send_dllp(frame)