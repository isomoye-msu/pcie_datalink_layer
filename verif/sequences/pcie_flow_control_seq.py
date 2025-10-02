# ==========================================================================
#
#  Morgan State University
#  Open Hardware Acceleration Lab (HAL-O)
#
#!  Project:   Open-Source PCIe Endpoint Controller.
#   File:      pcie_flow_control_seq.py
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
        self.other_port.handle_tx = self.waste_tx
        cocotb.start_soon(self.send_rolling_idle())
        cocotb.start_soon(self.recieve_dllp())
        cocotb.start_soon(self.recieve_tlp())
        await super().body()
        await with_timeout(self.pipe_agent_config.fc_initialized.wait(),5000,'ns')

    async def send_skp(self):
        pipe_seq_item_h = pipe_seq_item("pipe_seq_item_h")
        pipe_seq_item_h.pipe_operation = pipe_operation_t.SEND_SKP
        await self.start_item (pipe_seq_item_h)
        await self.finish_item (pipe_seq_item_h)


    async def send_rolling_idle(self):
        pipe_seq_item_h = pipe_seq_item("pipe_seq_item_h")
        pipe_seq_item_h.pipe_operation = pipe_operation_t.IDLE_DATA_TRANSFER
        while(1):
            await self.start_item(pipe_seq_item_h)
            await self.finish_item(pipe_seq_item_h)


    async def recieve_dllp(self):
        count = 0
        while (1):
            if self.pipe_agent_config.dllp_received:
                pkt = Dllp()
                dllp_in = self.pipe_agent_config.dllp_received.pop(0)
                dllp_int =  b'\x00\x00\x40\x10\x5a\x16'
                pkt = pkt.unpack_crc(bytes(dllp_int))
                await self.port.ext_recv(pkt)
                dw , = struct.unpack_from('>L', bytes(dllp_in[0:4]))
                self.pipe_agent_config.dllp_data_detected_e.clear()
                self.pipe_agent_config.dllp_data_read_e.set()
                count += 1
            else:
                await self.pipe_agent_config.dllp_data_detected_e.wait()


    async def waste_tx(self,pkt):
        pipe_seq_item_h = pipe_seq_item("pipe_seq_item_h")
        pipe_seq_item_h.pipe_operation = pipe_operation_t.IDLE_DATA_TRANSFER
        await self.start_item(pipe_seq_item_h)
        await self.finish_item(pipe_seq_item_h)

    async def recieve_tlp(self):
        count = 0
        while (1):
            if self.pipe_agent_config.tlp_received:
                pkt = Tlp()
                tlp_in = self.pipe_agent_config.tlp_received.pop(0)
                data = tlp_in[2:len(tlp_in)-4]
                pkt = pkt.unpack(bytes(data))
                seq = int.from_bytes(tlp_in[:2],'big')
                pkt.seq = int(hex(seq),0)
                await self.handle_tlp(pkt)
                self.pipe_agent_config.tlp_data_read_e.set()
                count += 1
            else:
                await First(self.pipe_agent_config.tlp_data_detected_e.wait(),Timer(1000, 'ns'))
                self.pipe_agent_config.tlp_data_detected_e.clear()

    
    
    async def handle_tx(self, pkt):
        pipe_seq_item_h = pipe_seq_item("pipe_seq_item")
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