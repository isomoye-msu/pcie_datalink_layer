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
        cocotb.start_soon(self.send_rolling_idle())
        cocotb.start_soon(self.recieve_dllp())
        await super().body()
        self.port = SimPort()
        self.other_port = SimPort()
        self.port.other =  self.other_port
        self.other_port.other = self.port
        self.port.handle_tx = self.handle_tx
        await Timer(200,'ns')

        # assert 1 == 0

    async def send_rolling_idle(self):
        pipe_seq_item_h = pipe_seq_item("pipe_seq_item_h")
        pipe_seq_item_h.pipe_operation = pipe_operation_t.IDLE_DATA_TRANSFER
        while(1):
            await self.start_item(pipe_seq_item_h)
            await self.finish_item(pipe_seq_item_h)
            # assert 1 == 0


    async def recieve_dllp(self):
        while (1):
            await self.pipe_agent_config.dllp_data_detected_e.wait()
            if self.pipe_agent_config.dllp_data_detected_e.is_set():
                pkt = Dllp()
                dllp_in = self.pipe_agent_config.dllp_received
                dllp_int =  b'\x40\x00\x40\x10\xe3\x29'
                print(f" dllp_in data: {[hex(q) for q in dllp_in]}")
                print(f" dllp_int data: {[hex(q) for q in dllp_int]}")
                dllp_int = int.from_bytes(dllp_in, byteorder='little', signed=False)
                pkt.unpack_crc(bytes(dllp_in))
                await self.port.ext_recv(pkt)
                self.pipe_agent_config.dllp_data_detected_e.clear()
                self.pipe_agent_config.dllp_data_read_e.set()


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
    
    
    async def handle_tx(self, pkt):
        # if self.source is None:
            # raise Exception("Port not connected")
        # await Timer(max(self.link_delay_steps, 10000), 'step')
        # await Timer(2000)
        # self.log.info("dllp transmit %s", repr(pkt))
        pipe_seq_item_h = pipe_seq_item("pipe_seq_item")
        if isinstance(pkt,Dllp):
            print(repr(pkt))
            # assert 1 == 0
            pipe_seq_item_h.pipe_operation = pipe_operation_t.DLLP_TRANSFER
            pipe_seq_item_h.dllp = pkt
            await self.start_item (pipe_seq_item_h)
            await self.finish_item (pipe_seq_item_h)
            # seq_item = pkt
            # seq_item.crc = self.calculator.checksum(
            #     seq_item.pack()).to_bytes(2, 'big')
            # crc_array = bytearray(seq_item.crc)
            # # print(crc_array)
            # crc_reverse = 0
            # for byte in crc_array:
            #     # print(hex(byte))
            #     # print(hex((reverse_bits_in_byte(byte)>>1) & 0xff))
            #     crc_reverse = (crc_reverse <<8) | ((reverse_bits_in_byte(byte)>>1) & 0xff)
            # # assert 1 == 0
            # data = seq_item.pack()
            
            # # print(bin(hex(crc_reverse)))
            # # assert 1 == 0
            # # print(crc_reverse.to_bytes(2, 'big'))
            # data += crc_reverse.to_bytes(2, 'big')
            # # print([hex(x) for x in data])
            # print([hex(x) for x in pkt.pack_crc()])
            # assert 1 == 0
            # seq_item = pkt
            # seq_item.crc = self.calculator.checksum(
            #     seq_item.pack()).to_bytes(2, 'big')
            # crc_array = bytearray(seq_item.crc)
            # # print(crc_array)
            # crc_reverse = 0
            # for byte in crc_array:
            #     # print(hex(byte))
            #     # print(hex((reverse_bits_in_byte(byte)>>1) & 0xff))
            #     crc_reverse = (crc_reverse <<8) | ((reverse_bits_in_byte(byte)>>1) & 0xff)
            # # assert 1 == 0
            # data = seq_item.pack()
            
            # # print(bin(hex(crc_reverse)))
            # # assert 1 == 0
            # # print(crc_reverse.to_bytes(2, 'big'))
            # data += crc_reverse.to_bytes(2, 'big')
            # # print(data)
            # # self.calculator.checksum(data).to_bytes(2, 'big')
            # frame = AxiStreamFrame(data)
            # frame.tuser = 1
            
        elif isinstance(pkt,Tlp):
            ...
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