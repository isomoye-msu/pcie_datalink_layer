# ==========================================================================
#
#  Morgan State University
#  Open Hardware Acceleration Lab (HAL-O)
#
#!  Project:   Open-Source PCIe Endpoint Controller.
#   File:      pipe_driver_bfm.py
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

import pyuvm
import cocotb
# import sys
import queue
from cocotb.triggers import *
from cocotb.clock import Clock
from collections import deque
from cocotb.queue import QueueEmpty, Queue
import enum
import logging
from descrambler_scrambler import *
from queue import Queue
from pipe_types import *
from pyuvm import *
from cocotb.types import Bit,Logic, LogicArray
from cocotb.types.range import Range
from cocotb.binary import BinaryRepresentation, BinaryValue
from descrambler_scrambler import *
from cocotbext.pcie.core.dllp import crc16
from crc import Calculator, Configuration,Crc32
# sys.path.put(str(Path("..").resolve()))
# logging.basicConfig(level=logging.NOTSET)
# logger = logging.getLogger()
# logger.setLevel(logging.DEBUG)
# from common_pkg import *
# from pipe_agent_pkg import *

class pipe_driver_bfm():
    def __init__(self, name = "pipe_driver_bfm", parent=None, pipe_interface = None):
        # super().__init__(name)
        self.name = name
        self.current_gen = gen_t.GEN1
        self.driver_scrambler =  [scrambler_s()] * NUM_OF_LANES
        # self.dut              = pipe_interface
        self.dut = cocotb.top
        self.lf_usp                         = None
        self.fs_usp                         = None
        self.lf_dsp                         = None
        self.fs_dsp                         = None
        self.cursor                         = None
        self.pre_cursor                     = None
        self.post_cursor                    = None
        self.my_rx_preset_hint              = None
        self.my_tx_preset                   = None
        self.my_local_txPrst_i_coefficients = None
        self.eval_feedback_was_asserted     = 0
        self.data = []
        self.k_data = []
        self.data_sent = Event()
        self.data_empty = Event()
        tlp_config_16 = Configuration(
        width=32,
        polynomial=0x04C11DB7,
        init_value=0xFFFFFFFF,
        final_xor_value=0x00000000,
        reverse_input=True,
        reverse_output=False,
        )
        tlp_config = Configuration(
        width=32,
        polynomial=0x04C11DB7,
        init_value=0xFFFFFFFF,
        final_xor_value=0x00000000,
        reverse_input=False,
        reverse_output=False,
        )
        self.tlp_calculator_16 = Calculator(tlp_config_16)
        self.tlp_calculator = Calculator(tlp_config)
        # uvm_root().logger.info("pipe_link_up_seq"+ "Started pipe_link_up_seq")
        uvm_root().logger.info(name + " initiated") 
        
    async def start(self):
        cocotb.start_soon(Clock(self.dut.clk_i, 5, units="ns").start())
        cocotb.start_soon(Clock(self.dut.pipe_rx_usr_clk_i, 5, units="ns").start())
        cocotb.start_soon(Clock(self.dut.pipe_tx_usr_clk_i, 5, units="ns").start())
        # super().body()
        uvm_root().logger.info(self.name + " body initiated") 
        
        fork1 = cocotb.start_soon(self.reset())
        fork2 = cocotb.start_soon(self.rst_i_signals())
        fork3 = cocotb.start_soon(self.detect())
        fork4 = cocotb.start_soon(self.polling())
        fork5 = cocotb.start_soon(self.send_data())
        await Combine(fork1,fork2,fork3,fork4,fork5)
            # self.driver_scrambler[i].lfsr_1_2 = 0x0000

        # cocotb.start_soon(self.detect())

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
        self.dut.en_i.value = 0b1
        
#  #***************************** RESET# (Phystatus de-assertion) *******************************/
#  initial :
    async def rst_i_signals(self):
        await FallingEdge(self.dut.rst_i)
        # assert 1 == 0
        self.dut.phy_rxdata.value      = 0
        self.dut.phy_rxdata_valid.value = 0
        self.dut.phy_rxdatak.value     = 0
        self.dut.phy_rxstart_block.value = 0
        self.dut.phy_rxsync_header.value = 0
        self.dut.phy_rxvalid.value     = 0
        self.dut.phy_rxstatus.value    = 0
        self.dut.phy_phystatus_rst.value = 0
        # self.dut.phy_rxstandby   = 0
        self.dut.phy_rxelecidle.value  = 0
        await RisingEdge(self.dut.clk_i)
        while(self.dut.rst_i == 0x1):
            await RisingEdge(self.dut.rst_i)
        # for i in range(int(self.dut.MAX_NUM_LANES)):
        self.dut.phy_phystatus.value = 0x0
        await RisingEdge(self.dut.clk_i)
        

        for i in range(NUM_OF_LANES):
            self.driver_scrambler[i].reset_lfsr(self.current_gen)
        
        # self.dut.rst_i_n.value = 0
        # self.dut.A.value = 0
        # self.dut.B.value = 0
        # self.dut.op.value = 0
        # await FallingEdge(self.dut.clk_i)
        # self.dut.rst_i_n.value = 1
        # await FallingEdge(self.dut.clk_i)
        

    async def detect(self):
        while True:
            while not self.dut.phy_txdetectrx == 0x1:
                await RisingEdge(self.dut.clk_i)
                # for i in range(len(self.dut.phy_txdetectrx)):
                    # if(self.dut.phy_txdetectrx[i] == 0x1):
                        # break
            # assert 1 == 0
            await RisingEdge(self.dut.clk_i)
            
            phy_status = 0x0
            phy_rxstatus = 0x0
            # self.dut.phy_phystatus.value[i] = 0b1 for i in range(len(self.dut.phy_phystatus))
            # # print("number of lanes: " + str(self.dut.MAX_NUM_LANES))
            for i in range(len(self.dut.phy_phystatus)):
                # # print("cuurent value of status: " + str(self.dut.phy_phystatus.value[i]))
                # # print("setting phy status " + str(i) + " to one")
                # phy_status[0] = 1
                phy_status |= 0x1 << i
            self.dut.phy_phystatus.value = phy_status
                # await RisingEdge(self.dut.clk_i)
                # phy_status[i] = 0b1
            
            # self.dut.phy_phystatus.value = phy_status
                # # print("post cuurent value of status: " + str(self.dut.phy_phystatus.value[i]))
            for i in range(int(self.dut.MAX_NUM_LANES)):
                phy_rxstatus |= (0b011 << (i*3))
            # # print(bin(phy_rxstatus))
            self.dut.phy_rxstatus.value = phy_rxstatus
            # self.dut.phy_rxstatus.value = phy_rxstatus
            
            await RisingEdge(self.dut.clk_i)
            self.dut.phy_phystatus.value = 0
            self.dut.phy_rxstatus.value = 0

            # for i in range(int(self.dut.MAX_NUM_LANES)):
            #     self.dut.phy_phystatus.value[i] = 0x0
            # for i in range(int(self.dut.MAX_NUM_LANES)-1):
            #     self.dut.phy_rxstatus.value[i*3:(i*3)+3] = 0
            await RisingEdge(self.dut.clk_i)
            cocotb.start_soon(self.rolling_idle_data())
            
    async def polling(self):
        while True:
            while not self.dut.phy_powerdown == 0x0:
                await RisingEdge(self.dut.clk_i)

            # assert 1 == 0
            # flag = 0
            # previous_PowerDown = 0
            # while(1):
                # await RisingEdge(self.dut.clk_i)
                # if(self.dut.phy_powerdown == 0x0):
                    # break
            
            await RisingEdge(self.dut.clk_i)
            for i in range(int(self.dut.MAX_NUM_LANES)):
                self.dut.phy_phystatus.value[i] = 0x1
            
            await RisingEdge(self.dut.clk_i)
            for i in range(int(self.dut.MAX_NUM_LANES)):
                self.dut.phy_phystatus.value[i] = 0x1
            
            while not all(self.dut.phy_txelecidle.value[i] == 0 for i in range(len(self.dut.phy_txelecidle))):
                await RisingEdge(self.dut.clk_i)
                    
 #------------------------------------------
 # Methods
 #------------------------------------------
    def ts_symbols_maker(self, ts):
        RxData_Q = queue.Queue()
        RxDataK_Q = queue.Queue()
        def set_bit(value, bit):
            return value | (1<<bit)

        def clear_bit(value, bit):
            return value & ~(1<<bit)
        
        if (self.current_gen.value <= gen_t.GEN2.value):
            # Symbol 0
            RxData_Q.put(0b10111100)
            RxDataK_Q.put(0b1)

            #Symbol 1
            if (ts.use_link_number):
                RxData_Q.put((ts.link_number & 0xFF))
                # RxData_Q.put((0x00 & 0xFF))
                RxDataK_Q.put(0b0 )
            else:
                RxData_Q.put((0b11110111 & 0xFF)) #PAD character
                RxDataK_Q.put(0b1 )
                
            #Symbol 2
            if (ts.use_lane_number):
                RxData_Q.put((ts.lane_number & 0xFF))
                # RxData_Q.put((0x00 & 0xFF))
                RxDataK_Q.put(0b0 )
            else:
                RxData_Q.put(0b11110111   )  #PAD character
                RxDataK_Q.put(0b1 )

            #Symbol 3
            if (ts.use_n_fts):
                RxData_Q.put( ( 0xFF ) )
                RxDataK_Q.put(0b0 )
            else :
                RxData_Q.put( 0x00  ) 
                RxDataK_Q.put(0b0 )
            
            #Symbol 4
            RxDataK_Q.put(0x0  ) 

            # temp =  0xFF
            temp = 0x02
            # if (ts.max_gen_supported == gen_t.GEN1):
            #     temp = 0b11000010
            # elif (ts.max_gen_supported == gen_t.GEN2):
            #     temp = 0b11000110
            # elif (ts.max_gen_supported == gen_t.GEN3):
            #     temp = 0b11001110
            #     # assert 1 == 0
            # elif (ts.max_gen_supported == gen_t.GEN4):
            #     temp = 0b11011110

            # if ts.auto_speed_change:
            #     temp = set_bit(temp,6)
            # else:
            #     temp = clear_bit(temp,6)

            # if ts.speed_change:
            #     temp = set_bit(temp,7)
            # else:
            #     temp = clear_bit(temp,7)

            # temp   = (ts.auto_speed_change & 0x1) << 6
            # temp   = (ts.speed_change &  0x1) << 7

            RxData_Q.put( temp  ) 

            #Symbol 5
            RxData_Q.put( 0x00  )
            RxDataK_Q.put(0b0 )

            temp = 0x00
            #Symbol 6
            # if (ts.equalization_command):
            #     # temp = 0xFF
            #     temp |= ts.rx_preset_hint & 0b11
            #     temp |= (ts.tx_preset & 0b111) << 3
            # if (ts.ts_type == ts_type_t.TS2 and  ts.equalization_command):
            #     temp |= set_bit(temp, 7)
            # else :
            if (ts.ts_type == ts_type_t.TS1):
                temp = 0x4A
            else:
                temp = 0x45
            
            RxData_Q.put(temp  ) 
            RxDataK_Q.put(0b0 )

            #Symbol 7~15
            if (ts.ts_type == ts_type_t.TS1):
                for x in range(9):
                    RxData_Q.put( 0x4A  ) 
                    RxDataK_Q.put(0b0)
            else :
                for x in range(9):
                    RxData_Q.put(0x45  ) 
                    RxDataK_Q.put(0b0 )
        else :
            # Symbol 0
            if (ts.ts_type == ts_type_t.TS1):
                RxData_Q.put( 0x1E ) 
            else:
                RxData_Q.put(0x2D) 

            #Symbol 1
            if (ts.use_link_number):
                RxData_Q.put(ts.link_number  ) 
            else:
                RxData_Q.put(0b11110111   )  #PAD character

            #Symbol 2
            if (ts.use_lane_number):
                RxData_Q.put(ts.lane_number  ) 
            else:
                RxData_Q.put(0b11110111   )  #PAD character

            #Symbol 3
            if (ts.use_n_fts):
                RxData_Q.put( ts.n_fts  ) 
            else:
                RxData_Q.put( 0x00  ) 

            #Symbol 4
            temp = 0xFF
            temp &= 0b11111110 << 0
            if (ts.max_gen_supported == gen_t.GEN1):
                temp &= 0b0000 << 2
            elif (ts.max_gen_supported == gen_t.GEN2):
                temp &= 0b000 << 3
            elif (ts.max_gen_supported == gen_t.GEN3):
                temp &= 0b00 << 4
            elif (ts.max_gen_supported == gen_t.GEN4):
                temp &= 0b0 << 5

            temp |= ts.auto_speed_change << 6
            temp |= ts.speed_change << 7
            RxData_Q.put(temp  ) 

            #Symbol 5
            RxData_Q.put(0x00  ) 


            #Symbol 6
            temp = 0xFF
            # if(True): #need flag
            #     if (ts.ts_type == ts_type_t.TS1):
            #         temp = 0x4A
            #         # if (True):  #need flag
            #         #     temp |= ts.ec & 0b11

            #         # if (True):  #need flag
            #         #     temp |= (ts.tx_preset & 0b111 )<< 3

            #         # temp |= (ts.use_preset & 0b1) << 7
            #     elif (ts.ts_type == ts_type_t.TS2):
            #         temp = 0x45
            #         ...
            #         #not supported yet
            #     else:
            #         temp = 0x4A

            RxData_Q.put(0x00  ) 

            #Symbol 7
            temp = 0x00
            if (ts.ts_type == ts_type_t.TS1):
                temp = 0x4A
                # if (ts.ec == 0b01):
                #     temp |= ts.fs_value & 0b11111
                # else:
                #     temp |= ts.pre_cursor & 0x1F
            else:
                temp = 0x45
            RxData_Q.put(0x00  ) 


            #Symbol 8
            temp = 0x00
            if (ts.ts_type == ts_type_t.TS1):
                if (ts.ec == 0b01):
                    temp = ts.lf_value
                else:
                    temp = ts.cursor
            else:
                temp = 0x45
            RxData_Q.put( 0x00  ) 

            #Symbol 9
            temp = 0x00
            if (ts.ts_type == ts_type_t.TS1):
                temp = ts.post_cursor
                if (True):  #need flag
                    temp = (ts.rcv & 0b1) << 6

                temp |= (temp & 0b00111111) ^ ((RxDataK_Q >> 6) & 0b1) ^ ((RxDataK_Q >> 7) & 0b1) ^ ((RxDataK_Q >> 8) & 0b1)
            else:
                temp = 0x45
            RxData_Q.put( 0x00  ) 

            #Symbol 10~15
            if (ts.ts_type == ts_type_t.TS1):
                for x in range(6):
                    RxData_Q.put( 0x4A  ) 
            else:
                for x in range(6):
                    RxData_Q.put( 0x45  ) 
        return RxData_Q,RxDataK_Q
        


    async def send_ts(self,ts, start_lane = 0,_lane=int(cocotb.top.MAX_NUM_LANES), replace_lane = 0):  # task
        width = 16
        # RxData_Q = deque()  #the actual symbols will be here (each symbol is a byte)
        # bit RxDataValid_Q[$]
        # RxDataK_Q = []
        Data = 0x0
        Character = 0x0
        pipe_max_width = 32
        uvm_root().logger.info(self.name + " " + "sending ts")
        phy_rxdata_valid = 0x0
        for i in range(start_lane,_lane):
            phy_rxdata_valid |= 0x1 << i
        self.dut.phy_rxdata_valid.value = phy_rxdata_valid
        
        self.driver_scrambler[0].reset_lfsr(self.current_gen)

        RxData_Q,RxDataK_Q = self.ts_symbols_maker(ts)
        if (self.current_gen.value <= gen_t.GEN2.value):
            while not RxData_Q.empty():
                self.dut.phy_rxdata.value = 0
                self.dut.phy_rxdatak.value = 0
                Data = 0x0
                Character = 0x0
                # print("\n")  
                # Stuffing the Data and characters deping on the number of Bytes sent per clock on each lane
                for i in range(int(width/8)):
                    temp_byte = RxData_Q.get()
                    # print(hex(temp_byte))
                    Data = (Data ) | ((temp_byte& 0xFF) << (8*i))
                    Character = (Character) | ((RxDataK_Q.get() & 0x1)  << i)
                    #RxData_Q = RxData_Q[1:$]
                    #RxDataK_Q = RxDataK_Q[1:$];
                # print("\n")  
                # print(hex(Data))
                # print(Character)
                temp_data = 0x0
                temp_char = 0x0
                for i in range(start_lane,_lane):
                    #duplicating the Data and Characters to each lane in the driver
                    # i*pipe_max_width : ((i*pipe_max_width)+pipe_max_width)
                    temp_data |= (Data << (pipe_max_width*i))
                    temp_char |=  Character << (int(pipe_max_width/8) *i)
                    # # print(hex(temp_data))
                    # temp_data = (self.dut.phy_rxdata.value)
                    # # print("current_value " + hex(temp_data))
                    # temp_data = temp_data | (Data << (pipe_max_width*i))
                    # # print(hex(temp_data))
                    # # print("\n")
                    # # print(i*pipe_max_width)
                    # self.dut.phy_rxdata.value = self.dut.phy_rxdata.value | ( 0xfffff << int(pipe_max_width*i))
                    # self.dut.phy_rxdatak.value = (self.dut.phy_rxdatak.value << int(pipe_max_width/8)) | Character
                    # data_handle[8:0] = 0xFF
                    # self.dut.phy_rxdatak.value |= (RxDataK_Q << int(i*pipe_max_width/8))
                    # [i*pipe_max_width/8 : (i*pipe_max_width/8) + pipe_max_width/8] = RxDataK_Q
                    # RxData_Q = RxData_Q >> (8*i)
                    # RxDataK_Q = RxDataK_Q >> i
                
                # print(hex(temp_data))
                # assert 1 == 0
                self.dut.phy_rxdata.value = temp_data
                self.dut.phy_rxdatak.value = temp_char

                await RisingEdge(self.dut.clk_i)
            
        if (self.current_gen.value > gen_t.GEN2.value):
        # if current_gen > GEN2:
            while not RxData_Q.empty():
                for i in range(start_lane, _lane):
                    # Stuffing the Data and characters depending on the number of Bytes sent per clock on each lane
                    for j in range(width // 8):
                        Data = (Data << 8) | (RxData_Q.get())

                    # Duplicating the Data and Characters to each lane in the driver
                    for j in range(start_lane,_lane):
                        #duplicating the Data and Characters to each lane in the driver
                        temp_data |= (Data << (pipe_max_width*j))
                        # temp_char |=  Character << (int(pipe_max_width/8) *j)
                    self.dut.phy_rxdata.value = temp_data
                    # RxData[i*pipe_max_width:i*pipe_max_width+pipe_max_width] = Data

                await RisingEdge(self.dut.clk_i)
            
        
        self.dut.phy_rxdata.value = 0
        self.dut.phy_rxdatak.value = 0
        self.dut.phy_rxdata_valid.value = 0
        # for i in range(start_lane,_lane):
        #     RxDataValid[i] = 0
        #     RxValid[i] = 0


    async def send_tses(self, ts, start_lane = 0,  _lane = int(cocotb.top.MAX_NUM_LANES)):  # task
        width = self.get_width()
        RxData_Q = [0] * len(ts)
        RxDataK_Q = [0] * len(ts)
        pipe_max_width = 32
        # assert 1 == 0
        # for thing in ts:
        #     print(thing.ts_type)
        phy_rxdata_valid = 0x0
        for i in range(start_lane,_lane):
            phy_rxdata_valid |= 0x1 << i
            # RxValid[i] = 1
        self.dut.phy_rxdata_valid.value = phy_rxdata_valid
        
        for i in range(self.dut.MAX_NUM_LANES.value):
            self.driver_scrambler[i].reset_lfsr(self.current_gen)

        uvm_root().logger.info(self.name + " " + "sending tses")
        if (self.current_gen.value <= gen_t.GEN2.value):
            for i in range(start_lane,_lane):
                RxData_Q[i],RxDataK_Q[i] = self.ts_symbols_maker(ts[i])
            self.driver_scrambler[0].reset_lfsr(self.current_gen)
            byte = 0
            # for i in range(12):
            #     temp_scramble = self.driver_scrambler[0].scramble_byte(0x00)
            first = 1
            while not RxData_Q[0].empty():
                self.dut.phy_rxdata.value = 0
                self.dut.phy_rxdatak.value = 0
                Data = [0x0] * int(_lane - start_lane)
                Character = [0x0] * int(_lane - start_lane)
                # Stuffing the Data and characters deping on the number of Bytes sent per clock on each lane
                for lane in range(start_lane,_lane):
                    for i in range(int(width/8)):
                        temp_byte = RxData_Q[lane].get()
                        Data[lane] = (Data[lane] ) | (temp_byte << (8*i))
                        Character[lane] = (Character[lane]) | ((RxDataK_Q[lane].get() & 0x1) << i)
                        #reset scrambler means that the first output is FF so skip on sending COMMA
                        # temp_scramble = self.driver_scrambler[lane].scramble_byte(temp_byte)
                        if first ==1:
                            first = 0
                        else:
                            temp_scramble = self.driver_scrambler[0].scramble_byte(temp_byte)
                temp_data = 0x0
                temp_char = 0x0
                for i in range(start_lane,_lane):
                    # print(hex(Data[i]))
                    # print(width)
                    temp_data |= (Data[i] << (pipe_max_width*i))
                    temp_char |=  Character[i] << (int(pipe_max_width/8) *i)

                # # print(hex(temp_data))
                self.dut.phy_rxdata.value = temp_data
                self.dut.phy_rxdatak.value = temp_char

                await RisingEdge(self.dut.clk_i)
            # assert 1 == 0

            self.dut.phy_rxdata.value = 0
            self.dut.phy_rxdatak.value = 0
            self.dut.phy_rxdata_valid.value = 0

    async def send_eios(self, start_lane = 0,  _lane = int(cocotb.top.MAX_NUM_LANES)):  # task
        width = self.get_width()
        com = 0b10111100
        idl = 0b01111100
        eios_gen3_ident = 0x66
        RxData_Q = queue.Queue()
        RxDataK_Q = queue.Queue()
        pipe_max_width = self.get_width()

        uvm_root().logger.info(self.name + " " + "sending eios")

        phy_rxdata_valid = 0x0
        for i in range(start_lane,_lane):
            phy_rxdata_valid |= 0x1 << i
            # RxValid[i] = 1
        self.dut.phy_rxdata_valid.value = phy_rxdata_valid
        Data = [0x0] * int(_lane - start_lane)
        Character = [0x0] * int(_lane - start_lane)

        if (self.current_gen.value <= gen_t.GEN2.value):
            RxData_Q.put(com)
            RxData_Q.put(idl)
            RxData_Q.put(idl)
            RxData_Q.put(idl)
            RxDataK_Q.put(0b1)
            RxDataK_Q.put(0b1)
            RxDataK_Q.put(0b1)
            RxDataK_Q.put(0b1)

            # assert 1 == 0
            
            # while not RxData_Q[0].empty():
            self.dut.phy_rxdata.value = 0
            self.dut.phy_rxdatak.value = 0
            Data = [0x0] * int(_lane - start_lane)
            Character = [0x0] * int(_lane - start_lane)

            # assert 1 == 0
            # Stuffing the Data and characters deping on the number of Bytes sent per clock on each lane
            for i in range(int(pipe_max_width/width)):
                Data[i] = (Data[i] << 8) | (RxData_Q.get())
                Character[i] = (Character[i] << 1) | (RxDataK_Q.get() & 0x1)
                # print(i)
            temp_data = 0x0
            temp_char = 0x0

            # assert 1 == 0
            for i in range(start_lane,_lane):
                # # print(Data[i])
                temp_data |= (Data[i] << (pipe_max_width*i))
                temp_char |=  Character[i] << (int(pipe_max_width/8) *i)
        # # print(hex(temp_data))
            self.dut.phy_rxdata.value = temp_data
            self.dut.phy_rxdatak.value = temp_char

            await RisingEdge(self.dut.clk_i)

            self.dut.phy_rxdata.value = 0
            self.dut.phy_rxdatak.value = 0
            self.dut.phy_rxdata_valid.value = 0
            elec_idle = 0x00
            for i in range(start_lane,_lane):
                elec_idle |= 1 << i
            self.dut.phy_rxelecidle.value = elec_idle

            # assert 1 == 0
        else:  #gen3 and higher:
            for z in range(int((16*8)/width)):
                await RisingEdge(self.dut.clk_i)
                
            #stuff data deping on lane width
                for j in range(int(width/8)):
                    Data[j*8: (j*8)+8] = eios_gen3_ident
            

            #driving signals of each lane
            for i in range(start_lane,_lane):
                if (z == 0):
                    self.dut.phy_rxstart_block[i] = 0b1
                    self.dut.phy_rxsync_header[i*2: (i*2)+2] = 0b01
                else :
                    self.dut.phy_rxstart_block[i] = 0b0
            temp_data = 0x0
            temp_char = 0x0
            for i in range(start_lane,_lane):
                # # print(Data[i])
                temp_data |= (Data[i] << (pipe_max_width*i))
                temp_char |=  Character[i] << (int(pipe_max_width/8) *i)
            
                #driving data on lanes
            self.dut.phy_rxdata.value = temp_data
            self.dut.phy_rxdatak.value = temp_char

            await RisingEdge(self.dut.clk_i)

            self.dut.phy_rxdata.value = 0
            self.dut.phy_rxdatak.value = 0
            self.dut.phy_rxdata_valid.value = 0

    async def send_eieos(self, start_lane = 0,  _lane = int(cocotb.top.MAX_NUM_LANES)):  # task
            width = self.get_width()


            uvm_root().logger.info(self.name + " " + "sending eieos")
            RxData_Q = Queue()
            RxDataK_Q = Queue()


            pipe_max_width = 32
            com = 0b10111100
            eie = 0b11111100
            ts1_ident = 0b01001010
            RxData_Q.put( [com, eie, eie, eie, eie, eie, eie, eie, eie, eie, eie, eie, eie, eie, eie, ts1_ident])
            RxDataK_Q.put( 0b1111111111111110)

            if (self.current_gen.value <= gen_t.GEN2.value):
                self.dut.phy_rxdata.value = 0
                self.dut.phy_rxdatak.value = 0
                Data = [0x0] * int(_lane - start_lane)
                Character = [0x0] * int(_lane - start_lane)

                # assert 1 == 0
                # Stuffing the Data and characters deping on the number of Bytes sent per clock on each lane
                for i in range(int(pipe_max_width/width)):
                    Data[i] = (Data[i] << 8) | (RxData_Q.get())
                    Character[i] = (Character[i] << 1) | (RxDataK_Q.get() & 0x1)
                    # print(i)
                temp_data = 0x0
                temp_char = 0x0

                # assert 1 == 0
                for i in range(start_lane,_lane):
                    # # print(Data[i])
                    temp_data |= (Data[i] << (pipe_max_width*i))
                    temp_char |=  Character[i] << (int(pipe_max_width/8) *i)
                # print(hex(temp_data))
                self.dut.phy_rxdata.value = temp_data
                self.dut.phy_rxdatak.value = temp_char

                await RisingEdge(self.dut.clk_i)

                self.dut.phy_rxdata.value = 0
                self.dut.phy_rxdatak.value = 0
                self.dut.phy_rxdata_valid.value = 0
                elec_idle = 0x00
                self.dut.phy_rxelecidle.value = 0

                    # for(int i = start_lane; i < _lane; i.put( 1):
                    #   RxDataValid[i] = 1
                    #   RxValid[i] = 1
                    # 


                    # Stuffing the Data and characters deping on the number of Bytes sent per clock on each lane
                    # for j in range(int(width/8)):
                        # Data[j*8: (j*8)+8] = RxData_Q
                        # Character[j] = RxDataK_Q.get()
                    

                    #duplicating the Data and Characters to each lane in the driver
            else :
                await RisingEdge(self.dut.clk_i)
                    

                
                # for(int i = start_lane; i < _lane; i.put( 1):
                #   RxDataValid[i] = 0
                #   RxValid[i] = 0
                # 


    #***************************** Normal Data Operation *******************************/

    #  bit [0:10] tlp_length_field
    #  byte tlp_gen3_symbol_0
    #  byte tlp_gen3_symbol_1
    #  data[$]
    #  bit k_data[$]

    def get_width(self):
        lane_width = 16
        match self.dut.pipe_width_o.value:
            case 0b00: lane_width = 8
            case 0b01: lane_width = 16
            case 0x10: lane_width = 16
            case 0b11: lane_width = 32
        return int(self.dut.pipe_width_o.value)

#  temp
#  temp_data

    async def send_tlp(self,tlp):
        if self.data:
            while not self.data_empty.is_set():
                await RisingEdge(self.dut.clk_i)
            self.data_empty.clear()
        self.data_sent.set()
    #uvm_info("pipe_driver_bfm",sv.sformatf("sing tlp, size= %d",len(tlp)),UVM_MEDIUM)
        if (self.current_gen == gen_t.GEN1  or  self.current_gen == gen_t.GEN2):
            # print(repr(tlp))
            pkt = tlp.seq.to_bytes(2,'big')
            crc_pkt = tlp.seq.to_bytes(2,'big')
            zeros = int(0).to_bytes(6,'big')
            # print(f"sequence number: {crc_pkt}\n\n\n")
            # dllp_int =  b'\x10\x00\x00\x00\x10\x00\xA0\x01\x0F\x0F\xA0\x01\x01\x00\x00\x44\x00\x00'
            pkt += tlp.pack()
            crc_pkt += tlp.pack()
            # print(f"bytes  {[hex(crc_b) for crc_b in bytes(dllp_int[::-1])]}")
            crc = self.tlp_calculator_16.checksum(crc_pkt).to_bytes(4,'big')
            # crc_zeros = self.tlp_calculator_16.checksum(crc_pkt).to_bytes(4,'little')
            reversed_byte_list = []
            for byte_val in crc:
                # Convert byte to integer (0-255)
                # Reverse bits of the integer
                reversed_int = 0
                for i in range(8):  # Assuming 8-bit bytes
                    if (byte_val >> i) & 1:  # Check if the i-th bit is set
                        reversed_int |= (1 << (7 - i)) # Set the corresponding bit in the reversed position
                reversed_byte_list.append(reversed_int)

            negated_bytes_list = []
            for byte_value in reversed_byte_list:
                # Perform bitwise NOT and mask with 0xFF to keep it in the 0-255 range
                negated_byte = (~byte_value) & 0xFF
                negated_bytes_list.append(negated_byte)
            pkt += bytes(negated_bytes_list)
            self.data.append( STP_gen_1_2)
            self.k_data.append( D_K_character.K)
            for byte_ in pkt:
                # print(hex(byte_))
                self.data.append( byte_)
                self.k_data.append(D_K_character.D)
            self.data.append( END_gen_1_2)
            self.k_data.append(D_K_character.K)
        elif (self.current_gen == gen_t.GEN3  or  self.current_gen == gen_t.GEN4  or  self.current_gen == gen_t.GEN5):
            tlp_length_field  = len(tlp) + 2
            tlp_gen3_symbol_0 = STP_gen_3 + tlp_length_field[0:3]
            tlp_gen3_symbol_1 = tlp_length_field[4:10] + 0b0

            self.data.append( tlp_gen3_symbol_0)
            self.k_data.append( D_K_character.K  )
            self.data.append( tlp_gen3_symbol_1)
            self.k_data.append(D_K_character.D)
            #check if i need k_data queue in gen3 or not??
            #check on lenth constraint of TLP , is it different than earlier gens??? 
            for i in range(len(tlp)):
                self.data.append( tlp[i])
                self.k_data.append(D_K_character.D)
        await self.send_data()
        self.data_sent.clear()


    async def send_dllp(self, dllp):
    #uvm_info("pipe_driver_bfm","sing dllp",UVM_MEDIUM)
        if self.data:
            while not self.data_empty.is_set():
                await RisingEdge(self.dut.clk_i)
            self.data_empty.clear()
            
        self.data_sent.set()
        if (self.current_gen == gen_t.GEN1  or  self.current_gen == gen_t.GEN2):
                self.data.append(SDP_gen_1_2)
                self.k_data.append(D_K_character.K)
                dllp_data = dllp.pack_crc()
                for byte_ in dllp_data:
                    # print(f"current byte {byte_}")
                    self.data.append( byte_)
                    self.k_data.append(D_K_character.D)
                # self.k_data.append()
                self.data.append(END_gen_1_2)
                self.k_data.append(D_K_character.K)
        elif (self.current_gen == gen_t.GEN3  or  self.current_gen == gen_t.GEN4  or  self.current_gen == gen_t.GEN5):
            #check if i need k_data queue in gen3 or not??
                self.data.append(SDP_gen_3_symbol_0)
                self.data.append(SDP_gen_3_symbol_1)
                for i in range(5):
                    self.data.append( dllp[i])
        await self.send_data()
        self.data_sent.clear()


    async def rolling_idle_data(self):
        ...
        # assert 1 == 0
        # while (1):
        #     await self.data_empty.wait()
        #     for i in range(int(self.dut.MAX_NUM_LANES.value)):
        #         for j in range(4):
        #             self.data.append( 0x00)
        #             self.k_data.append(D_K_character.D)
        #     self.data_empty.clear()
        #     await self.send_data()
            # else:
            #     ...
            #     # print(self.data)
            # await RisingEdge(self.dut.clk_i)
        
    async def send_skp(self):
        if self.data:
            while not self.data_empty.is_set():
                await RisingEdge(self.dut.clk_i)
            self.data_empty.clear()
        self.data.append( 0x00)
        self.k_data.append(D_K_character.D)
        self.data.append( 0xbc)
        self.k_data.append(D_K_character.K)
        for i in range(3):
            self.data.append( 0x1c)
            self.k_data.append(D_K_character.K)
        self.data.append( 0x00)
        self.k_data.append(D_K_character.D)
        self.data.append( 0x00)
        self.k_data.append(D_K_character.D)
        self.data.append( 0x00)
        self.k_data.append(D_K_character.D)
        await self.send_data()
        # self.data = []
        # self.k_data = []

    async def send_idle_data(self):
        # assert 1 == 0
        if self.data:
            return
            while not self.data_empty.is_set():
                await RisingEdge(self.dut.clk_i)
            self.data_empty.clear()

        # while len(self.data) != 0:
        #     print(f"data len: {self.data}")
        #     print(f"data len: {len(self.data)}")
        #     await self.send_data()

        for i in range(int(self.dut.MAX_NUM_LANES.value)):
            for j in range(4):
                self.data.append( 0x00)
                self.k_data.append(D_K_character.D)
        await self.send_data()
        # self.data = []
        # self.k_data = []
                # while not  self.data_sent.is_set()
                # self.data_sent.clear()
            # await self.send_data()


    async def send_data(self):
        while not self.data:
            await RisingEdge(self.dut.clk_i)

    #else uvm_error("pipe_driver_bfm", "Unexpected PowerDown value at Normal Data Operation")
        self.dut.phy_rxelecidle.value = 0
        phy_rxdata_valid = 0x0
        for i in range(int(self.dut.MAX_NUM_LANES.value)):
            phy_rxdata_valid |= 0x1 << i
            # RxValid[i] = 1
        self.dut.phy_rxdata_valid.value = phy_rxdata_valid
    
        if (self.current_gen == gen_t.GEN1  or  self.current_gen == gen_t.GEN2):
            await self.send_data_gen_1_2()
        elif (self.current_gen == gen_t.GEN3  or  self.current_gen == gen_t.GEN4  or  self.current_gen == gen_t.GEN5):
            self.s_data_gen_3_4_5()
        # for i in range(NUM_OF_LANES):
        # self.dut.phy_rxdata_valid.value = 0

    async def send_data_gen_1_2(self, start_lane = 0,  _lane = int(cocotb.top.MAX_NUM_LANES)):  # task
        # assert 1 == 0
        data_scrambled = []
        data_k = []
        pipe_width = self.get_width()
        pipe_max_width = 32
        bus_data_width = (int(self.dut.MAX_NUM_LANES.value) * pipe_width)
        # for i in range(len(self.data)):
        #     lanenum = i
        #     lanenum = lanenum - NUM_OF_LANES
        # self.driver_scrambler[0].reset_lfsr(self.current_gen)
        # input_data =  bytes([0x00, 0x00, 0x00, 0x00])
        # out_data = self.driver_scrambler[0].scramble_data(input_data)
        # print(f"output data : {out_data}")
        # temp_scramble = self.driver_scrambler[0].scramble_data(self.data)
        # for b in temp_scramble:
        #     print(hex(b))
        while self.data:
            lanenum = 0
            # data_k.append(self.k_data[i])
            # lanenum = int(lanenum - int(self.dut.MAX_NUM_LANES.value) * ((lanenum / int(self.dut.MAX_NUM_LANES.value))))
            check_k = self.k_data.pop(0)
            if (check_k == D_K_character.D):
                temp = self.data.pop(0)
                data_k.append(0)
                # print(f"scrambler state: {hex(self.driver_scrambler[lanenum].get_scrambler_state())}")
                temp_scramble = self.driver_scrambler[lanenum].scramble_byte(temp)
                data_scrambled.append(temp_scramble)
                # print(hex(temp_scramble))
                # print(self.driver_scrambler[lanenum].lfsr_1_2)
                # print(self.current_gen)
            elif (check_k == D_K_character.K):
                temp = self.data.pop(0)
                data_scrambled.append(temp)
                data_k.append(1)
                if(temp == 0xbc ):
                    reset_next_byte = 1
                    self.driver_scrambler[0].reset_lfsr(self.current_gen)
                    temp_scramble = self.driver_scrambler[lanenum].scramble_byte(temp)
                elif(temp == 0x1c ): ##skip
                    self.driver_scrambler[0].reset_lfsr(self.current_gen)
                    # temp_scramble = self.driver_scrambler[lanenum].scramble_byte(temp)
                    # data_scrambled.append(temp)
                else:
                    temp_scramble = self.driver_scrambler[lanenum].scramble_byte(temp)
        self.data_empty.set()
        # assert 1 == 0
        num_lanes = int(self.dut.num_active_lanes_i)
        
        bytes_read = 0
        while bytes_read < len(data_scrambled):
            # self.dut.phy_rxdata.value = 0
            # self.dut.phy_rxdatak.value = 0
            Data = [0x0] 
            Character = [0x0]
            temp_data = 0x0
            temp_char = 0x0

            for lane in range(start_lane,_lane):
                for i in range(int(pipe_width/8)):
                    temp_byte = data_scrambled[bytes_read]
                    temp_k = data_k[bytes_read]
                    Data[lane] = (Data[lane] ) | (temp_byte << (8*i))
                    Character[lane] = Character[lane] | (temp_k << i)
                    bytes_read += 1
        
            temp_data = 0x0
            temp_char = 0x0
            for i in range(start_lane,_lane):
                # print(hex(Data[i]))
                # print(width)
                temp_data |= (Data[i] << (pipe_max_width*i))
                temp_char |=  Character[i] << (int(pipe_max_width/8) *i)
            # print(hex(temp_data))
            # assert 1 == 0
            self.dut.phy_rxdata.value = temp_data
            self.dut.phy_rxdatak.value = temp_char

            await RisingEdge(self.dut.clk_i)
        # await self.data_sent.set()
        # self.data = []

        # temp_data = 0x0
        # temp_char = 0x0
        # if (not (lanenum == int(self.dut.MAX_NUM_LANES.value))):
        #     for j in range(int((bus_data_width) / 8)):
        #         temp_data |= (temp_data << 8 ) | 0b11110111
        #         temp_char |=  (temp_char  << 1) |  0b1
        # self.dut.phy_rxdata.value = temp_data
        # self.dut.phy_rxdatak.value = temp_char

    async def send_data_gen_3_4_5(self):  # task
        data_block_size: int = (128 * pipe_num_of_lanes) / 8
        num_of_idle_data = data_block_size - (len(data) % data_block_size)
        num_of_data_blocks = len(data) / data_block_size
        lane_width = get_width()
        num_of_clk_is = 128 / lane_width
        num_of_bytes_in_lane = lane_width / 8
        if (len(self.data) % data_block_size != 0):
            for i in range(num_of_idle_data):
                self.data.append(0b00000000)
                self.k_data.put(0)
        
        for i in range(num_of_data_blocks):
            for j in range(num_of_clk_is):
                for k in range(num_of_bytes_in_lane):
                    for l in range(pipe_num_of_lanes):
                        if (j == 0):
                            self.dut.phy_rxstart_block[i] = 0b1
                            self.dut.phy_rxsync_header[i*2: (i*2)+2] = 0b10
                        else :
                            self.dut.phy_rxstart_block[i] = 0b0
            temp_data = data.get()
            self.driver_scrambler,self.dut.phy_rxdata[((l*pipe_max_width)+(k*8)) :  (l*pipe_max_width)+(k*8) +8] =  scramble(self.driver_scrambler, temp_data, l, self.current_gen)
        await RisingEdge(self.dut.clk_i)


 #***************************** Equalization *******************************/
    async def equalization(self):
        flag_tx_preset_applied = 0
        while True:
            while(1):
                await RisingEdge(self.dut.clk_i)
                if((LocalPrst_iIndex == my_tx_preset)  and  (GetLocalPrst_iCoeffcients == 1)):
                    break  
            # wait ((LocalPrst_iIndex == my_tx_preset)  and  (GetLocalPrst_iCoeffcients == 1))
            await RisingEdge(self.dut.clk_i)
            self.dut.phy_txeq_coeff  = 1
            self.dut.phy_txeq_preset = my_local_txPrst_i_coefficients

            await RisingEdge(self.dut.clk_i)
            self.dut.phy_txeq_coeff = 0
            while(1):
                await RisingEdge(self.dut.clk_i)
                if(TxDeemph == my_local_txPrst_i_coefficients):
                    break
                self.dut.phy_txeq_ctrl = 1
   
 

    async def equalization_preset_applied(self):
    #uvm_info("pipe_monitor_bfm", "waiting for flag_tx_preset_applied ", UVM_NONE)
        while True:
            await RisingEdge(self.dut.clk_i)
            if(self.flag_tx_preset_applied == 1):
                break


    def set_eq_param (self, lf_usp_i, fs_usp_i, lf_dsp_i, fs_dsp_i,
        cursor_i, pre_cursor_i, post_cursor_i,  my_tx_preset_i,
        my_rx_preset_hint_i,  my_local_txPrst_i_coefficients_i):
        self.lf_usp                         = lf_usp_i
        self.fs_usp                         = fs_usp_i
        self.lf_dsp                         = lf_dsp_i
        self.fs_dsp                         = fs_dsp_i
        self.cursor                         = cursor_i
        self.pre_cursor                     = pre_cursor_i
        self.post_cursor                    = post_cursor_i
        self.my_tx_preset                   = my_tx_preset_i
        self.my_rx_preset_hint              = my_rx_preset_hint_i
        self.my_local_txPrst_i_coefficients = my_local_txPrst_i_coefficients_i



    async def eq_eval(self):
        while True:
            while(RxEqEval == 0):
                await RisingEdge(self.dut.clk_i)
                
        # assert ((FS == {pipe_num_of_lanes{fs_dsp}})  and  (LF == {pipe_num_of_lanes{lf_dsp}}))
        # else uvm_error("pipe_driver_bfm", "FS and LF not assigned")
        await RisingEdge(self.dut.clk_i)
        LinkEvaluationFeedbackDirectionChange = 0b000000
        eval_feedback_was_asserted = 1