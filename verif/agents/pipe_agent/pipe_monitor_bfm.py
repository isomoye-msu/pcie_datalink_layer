# ==========================================================================
#
#  Morgan State University
#  Open Hardware Acceleration Lab (HAL-O)
#
#!  Project:   Open-Source PCIe Endpoint Controller.
#   File:      pipe_monitor_bfm.py
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
from cocotb.triggers import *
from base_uvm import *
from pipe_types import *
from descrambler_scrambler import *
from pyuvm import *
from cocotb.types import Bit,Logic, LogicArray
from pipe_agent import pipe_monitor
from cocotb.types.range import Range

class pipe_monitor_bfm():
    def __init__(self, name = "pipe_agent_h", parent=None):
        # super().__init__(name, parent)
        self.current_gen = gen_t.GEN1
        self.driver_scrambler = [scrambler_s()] * NUM_OF_LANES
        self.name = name
        # self.vif              = pipe_interface
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
        self.my_local_txPreset_coefficients = None
        self.eval_feedback_was_asserted     = 0
        self.data = 0
        self.build_connect_finished_e  = Event()
        self.detected_exit_electricle_idle_e = Event()
        self.detected_power_down_change_e = Event()
        self.monitor_rx_scrambler = [scrambler_s()] * NUM_OF_LANES
        self.monitor_tx_scrambler = [scrambler_s()] * NUM_OF_LANES
        self.proxy = pipe_monitor
        self.pipe_max_width = 32
        self.bus_data_kontrol_param = int(self.pipe_max_width / 8) * int(self.dut.MAX_NUM_LANES) - 1
        self.bus_data_width_param = int(self.dut.MAX_NUM_LANES) * int(self.pipe_max_width)
        pipe_width = self.get_width()
        self.bus_data_width = int(self.dut.MAX_NUM_LANES) * pipe_width
        self.linkup = 0
        self.tlp_done = 2
        self.dllp_done = 0
        self.start_tlp = 0
        self.start_dllp = 0
        self.tlp_q = []
        self.dllp_q = []
        self.data_descrambled = LogicArray(0,Range(self.bus_data_width_param,'downto', 0))



    def get_width(self):
            lane_width = 0
            # # print("pipewitdth: " + str(LogicArray(self.dut.pipe_width_o.value)[1:0].to_BinaryValue()))
            match LogicArray(self.dut.pipe_width_o.value)[1:0].to_BinaryValue():
                case 0b00: lane_width = 8
                case 0b01: lane_width = 16
                case 0b11: lane_width = 32
            return lane_width
    
    async def start(self):
        # super().body()

        for _ in range(10):
            await RisingEdge(self.dut.clk_i)
        
        cocotb.start_soon(self.test())
        # cocotb.start_soon(self.receive_tses_gen3())
        # cocotb.start_soon(self.receive_eios())




        cocotb.start_soon(self.detect())
        # cocotb.start_soon(self.clock_wait())
        cocotb.start_soon(self.width_changed())
        cocotb.start_soon(self.rate_changed())

        
        
        cocotb.start_soon(self.rx_eios())
        cocotb.start_soon(self.receive_eios_gen3())
        cocotb.start_soon(self.phy_txelecidle_and_RxStandby_asserted())
        cocotb.start_soon(self.rx_eieos())
        cocotb.start_soon(self.rx_eieos_gen3())
        

        cocotb.start_soon(self.rx_detection_scenario())
        cocotb.start_soon(self.clk_i_rate_changed())
        cocotb.start_soon(self.polling_state_start())
        cocotb.start_soon(self.recieve_data())
        cocotb.start_soon(self.tx_elec_idle_and_rx_standby())
        cocotb.start_soon(self.flow_control_initialized())
        # cocotb.start_soon(self.receive_ts())

        for i in range(int(self.dut.MAX_NUM_LANES)):
            self.driver_scrambler[i].reset_lfsr(self.current_gen)



        
    async def test(self):
        while True:
            await self.receive_tses()
            # await self.receive_eios()

    async def rx_eios(self):
        while True:
            await self.receive_eios()

    async def rx_eios_gen3(self):
        while True:
            await self.receive_eios_gen3()

    async def rx_eieos(self):
        while True:
            await self.receive_eieos()

    async def rx_eieos_gen3(self):
        while True:
            await self.receive_eieos_gen3()




    async def detect(self):
        while not self.build_connect_finished_e.is_set():
            ...
        while True:
            await RisingEdge(self.dut.clk_i)
            await self.proxy.detect_link_up()

    async def clock_wait(self):
        while True:
            await RisingEdge(self.dut.clk_i)
            self.proxy.detect_posedge_clk_i.set()


    async def width_changed(self):
        await self.build_connect_finished_e.wait()
        self.build_connect_finished_e.clear()
        while True:
            await Edge(self.dut.pipe_width_o)
            new_width=self.dut.pipe_width_o.value
            # print(int((int(new_width)/8)-1))
            # assert 1 == 0
            self.proxy.notify_width_changed(int((int(new_width)/8)-1))
            await RisingEdge(self.dut.clk_i)
# 
    async def clk_i_rate_changed(self):
        await self.build_connect_finished_e.wait()
        self.build_connect_finished_e.clear()
        # while True:
            # await Edge(self.dut.CLK_RATE)
            # new_PCLKRate = self.dut.CLK_RATE.value
            # new_PCLKRate = 0.25
            # match (new_PCLKRate):
                # case 0b000:new_PCLKRate=0.0625
                # case 0b001:new_PCLKRate=0.125
                # case 0b010:new_PCLKRate=0.25
                # case 0b011:new_PCLKRate=0.5
                # case 0b100:new_PCLKRate=1
                # case 100: new_PCLKRate = 0.25
            # self.proxy.notify_PCLKRate_changed(new_PCLKRate)
    async def flow_control_initialized(self):
        while(True):
            await RisingEdge(self.dut.clk_i)
            if self.dut.fc_initialized_o == 1:
                self.proxy.notify_fc_initialized()
                break

    async def rate_changed(self):
        await self.build_connect_finished_e.wait()
        self.build_connect_finished_e.clear
        while True:
            await Edge(self.dut.phy_rate)
            new_Rate = self.dut.phy_rate.value
            if(new_Rate >> 2) & 0x1:
                new_Rate = 3
            elif (new_Rate >> 1) & 0x1:
                new_Rate = 2
            elif (new_Rate >> 0) & 0x1:
                new_Rate = 1
            # print(new_Rate)
            # assert 1 == 0
            self.proxy.notify_Rate_changed(int(new_Rate))
            await RisingEdge(self.dut.clk_i)

# # -----------------------------------------------------------
# # TxDeemph changed
# # -----------------------------------------------------------
#initial 
#  logic [17:0] new_TxDeemph 
#  await Edge(build_connect_finished_e)
#  while True:
#    await Edge(TxDeemph)
#    new_TxDeemph=TxDeemph[17:0]
#    proxy.notify_TxDeemph_changed(new_TxDeemph)
#  end
#end
# # -----------------------------------------------------------
# # phy_txelecidle and RxStandby asserted
# # -----------------------------------------------------------
    async def phy_txelecidle_and_RxStandby_asserted(self):
        await self.build_connect_finished_e.wait()
        while True:
            while not all( LogicArray(self.dut.phy_txelecidle.value)[i] ==0b1 for i in range(int(self.dut.MAX_NUM_LANES))):
                await RisingEdge(self.dut.clk_i)
            self.proxy.notify_phy_txelecidle_and_RxStandby_asserted.set()
            while not all( LogicArray(self.dut.phy_txelecidle.value)[i]==0b0 for i in range(int(self.dut.MAX_NUM_LANES))):
                ...
            #     for i in range(self.dut.pipe_num_of_lanes):
            #         flag = self.dut.phy_txelecidle[i]==0b1
            #         self.proxy.notify_phy_txelecidle_and_RxStandby_asserted.set()
            # flag = 0
            # while(flag == 0):
            #     for i in range(self.dut.pipe_num_of_lanes):
            #         flag = self.dut.phy_txelecidle[i]==0b0 and RxStandby[i]==0b0



    async def reset_scrambler(self):
        while True:
            for i in range (NUM_OF_LANES):
                await LogicArray(self.dut.phy_txdata.value)[(i*8): (i*8)+8]==0b1011_1100
            reset_lfsr(self.monitor_rx_scrambler,self.current_gen)


    async def receive_ts(self, ts, start_lane = 0 , end_lane = 0):
        if self.dut.pipe_width_o== 16:
            await LogicArray(self.dut.phy_txdata.value)[(start_lane*32+0): (start_lane*32+0)+8] == 0b101_11100
            for i in range(int(self.dut.MAX_NUM_LANES)):
                self.monitor_tx_scrambler[i].reset_lfsr(self.current_gen)

            ts.link_number = LogicArray(self.dut.phy_txdata.value)[(start_lane*32+8):(start_lane*32+8)+8]
            for symbol_count in range(2,16,2):
                await RisingEdge(self.dut.clk_i)
                if symbol_count == 2:
                    ts.lane_number = LogicArray(self.dut.phy_txdata.value)[(start_lane*32+0) : (start_lane*32+0)+8]
                    ts.n_fts       = LogicArray(self.dut.phy_txdata.value)[(start_lane*32+8):(start_lane*32+8)+8]

                if symbol_count == 4:
                    if(LogicArray(self.dut.phy_txdata.value)[start_lane*32+5]==0b1):
                        ts.max_gen_supported= gen_t.GEN5
                    elif(LogicArray(self.dut.phy_txdata.value)[start_lane*32+4]==0b1):
                        ts.max_gen_supported= gen_t.GEN4
                    elif(LogicArray(self.dut.phy_txdata.value)[start_lane*32+3]==0b1):
                        ts.max_gen_supported= gen_t.GEN3
                    elif(LogicArray(self.dut.phy_txdata.value)[start_lane*32+2]==0b1):
                        ts.max_gen_supported= gen_t.GEN2
                    else:
                        ts.max_gen_supported= gen_t.GEN1	

                if symbol_count == 10:
                    if(LogicArray(self.dut.phy_txdata.value)[(start_lane*32+0):(start_lane*32+0)+8]==0b010_01010):
                        ts.ts_type = ts_type_t.TS1
                    elif(LogicArray(self.dut.phy_txdata.value)[(start_lane*32+0):(start_lane*32+0)+8]==0b010_00101):
                        ts.ts_type = ts_type_t.TS2

        elif self.dut.pipe_width_o== 32:
            await LogicArray(self.dut.phy_txdata.value)[(start_lane*32+0): (start_lane*32+0)+8] == 0b101_11100
            for i in range(int(self.dut.MAX_NUM_LANES)):
                self.monitor_tx_scrambler[i].reset_lfsr(self.current_gen)
            ts.link_number=LogicArray(self.dut.phy_txdata.value)[(start_lane*32+8):(start_lane*32+8)+8]  #link number
            ts.lane_number=LogicArray(self.dut.phy_txdata.value)[(start_lane*32+0):(start_lane*32+0)+8]  # lane number
            ts.n_fts=LogicArray(self.dut.phy_txdata.value)[(start_lane*32+24):(start_lane*32+24)+8]  # number of fast training sequnces

            for symbol_count in range(4,16,4):
                await RisingEdge(self.dut.clk_i)
                if symbol_count == 4:
                    if(LogicArray(self.dut.phy_txdata.value)[start_lane*32+5]==0b1):
                         ts.max_gen_supported= gen_t.GEN5
                    elif(LogicArray(self.dut.phy_txdata.value)[start_lane*32+4]==0b1):
                         ts.max_gen_supported= gen_t.GEN4
                    elif(LogicArray(self.dut.phy_txdata.value)[start_lane*32+3]==0b1):
                         ts.max_gen_supported= gen_t.GEN3
                    elif(LogicArray(self.dut.phy_txdata.value)[start_lane*32+2]==0b1):
                         ts.max_gen_supported= gen_t.GEN2
                    else:
                        ts.max_gen_supported=GEN1

                if symbol_count == 8:
                    if(LogicArray(self.dut.phy_txdata.value)[(start_lane*32+16):(start_lane*32+16)+8]==0b010_01010):
                        ts.ts_type = ts_type_t.TS1
                    elif(LogicArray(self.dut.phy_txdata.value)[(start_lane*32+16): (start_lane*32+16)+8]==0b010_00101):
                        ts.ts_type = ts_type_t.TS2
        else:
            # 8 bit pipe paralel interface
            await LogicArray(self.dut.phy_txdata.value)[(start_lane*32+0): (start_lane*32+0)+8] == 0b101_11100
            for i in range(int(self.dut.MAX_NUM_LANES)):
                self.monitor_tx_scrambler[i].reset_lfsr(self.current_gen)
            for symbol_count in range(1,16):
                await RisingEdge(self.dut.clk_i)
                if symbol_count == 1:
                    ts.link_number=LogicArray(self.dut.phy_txdata.value)[(start_lane*32+0): (start_lane*32+0)+8]   #link number
                if symbol_count == 2:
                    ts.lane_number=LogicArray(self.dut.phy_txdata.value)[(start_lane*32+0): (start_lane*32+0)+8]   # lane number
                if symbol_count == 3:
                    ts.n_fts=LogicArray(self.dut.phy_txdata.value)[(start_lane*32+0): (start_lane*32+0)+8]   # number of fast training sequnces
                if symbol_count == 4:
                        if(LogicArray(self.dut.phy_txdata.value)[start_lane*32+5]==0b1):
                             ts.max_gen_supported= gen_t.GEN5 
                        elif(LogicArray(self.dut.phy_txdata.value)[start_lane*32+4]==0b1):
                             ts.max_gen_supported= gen_t.GEN4 
                        elif(LogicArray(self.dut.phy_txdata.value)[start_lane*32+3]==0b1):
                             ts.max_gen_supported= gen_t.GEN3 
                        elif(LogicArray(self.dut.phy_txdata.value)[start_lane*32+2]==0b1):
                             ts.max_gen_supported= gen_t.GEN2 
                        else:
                             ts.max_gen_supported= gen_t.GEN1	
                if symbol_count == 10:# ts1 or ts2 determine
                        if(LogicArray(self.dut.phy_txdata.value)[(start_lane*32+0): (start_lane*32+0)+8]==0b010_01010):
                             ts.ts_type = ts_type_t.TS1 
                        elif(LogicArray(self.dut.phy_txdata.value)[(start_lane*32+0): (start_lane*32+0)+8]==0b010_00101):
                             ts.ts_type = ts_type_t.TS2 
        return ts


    async def reset_scenario(self):
        while True:
            await FallingEdge(self.dut.rst_i)
            await RisingEdge(self.dut.clk_i)

            for i in range(int(self.dut.MAX_NUM_LANES)):
                self.monitor_tx_scrambler[i].reset_lfsr(self.current_gen)
            
            await RisingEdge(self.dut.rst_i)
            await RisingEdge(self.dut.clk_i)

            flag = 0
            while all(self.dut.pipe_phy_status_i[i] == 1 for i in range(len(self.dut.pipe_phy_status_i))):
                await RisingEdge(self.dut.rst_i)

            self.proxy.notify_reset_detected()

    async def rx_detection_scenario(self):
        while True:
            # while not all(self.dut.phy_txdetectrx[i] == 0 for i in range(len(self.dut.phy_txdetectrx))):
                # await RisingEdge(self.dut.rst_i)
            # flag = 0
            # while flag == 0:

            # for i in range(len(self.dut.phy_txdetectrx)):
            #     flag = self.dut.phy_txdetectrx[i] == 1
            await RisingEdge(self.dut.clk_i)
            # await FallingEdge(self.dut.rst_i)
            # await RisingEdge(self.dut.clk_i)

            # while(self.dut.phy_txdetectrx.value == 0):
            #     await RisingEdge(self.dut.clk_i)
            # assert 1 == 0

            flag = 0
            while flag == 0:
                flag = 1
                await RisingEdge(self.dut.clk_i)
                for i in range(int(self.dut.MAX_NUM_LANES)):
                    if LogicArray(self.dut.phy_phystatus.value)[i] != Logic(1):
                        flag = 0 


            # while not all( LogicArray(self.dut.phy_phystatus.value)[i] == Logic(1) for i in range(int(self.dut.MAX_NUM_LANES))):
            #     await RisingEdge(self.dut.clk_i)
                # # print(LogicArray(self.dut.phy_phystatus.value))
                # # print(LogicArray(self.dut.phy_phystatus.value)[0])
                # if(LogicArray(self.dut.phy_phystatus.value)[0] == Logic(0)):
                #     assert 1 == 0
            # assert 1 == 0

            phy_rxstatus = 0x0
            for i in range(int(self.dut.MAX_NUM_LANES)):
                phy_rxstatus |=  (0b011 << (i*3))

            assert self.dut.phy_rxstatus.value == phy_rxstatus
            # for i in range(int(self.dut.MAX_NUM_LANES)):
            #     assert self.dut.phy_rxstatus.value[(i*3):(i*3)+3]==0b011

            await RisingEdge(self.dut.clk_i)

            while all( not self.dut.phy_phystatus.value[i] == 0b0 for i in range(int(self.dut.MAX_NUM_LANES))):
                await RisingEdge(self.dut.clk_i)

            assert  self.dut.phy_rxstatus == 0
            # for i in range(NUM_OF_LANES):
            #         assert self.dut.phy_rxstatus[(i*3) : (i*3)+3]==0b000

            while not self.dut.phy_txdetectrx == 0b0:
                await RisingEdge(self.dut.clk_i)

            await RisingEdge(self.dut.clk_i)
            self.proxy.notify_receiver_detected()



    async def receive_tses(self, start_lane = 0 , end_lane = int(cocotb.top.MAX_NUM_LANES)):
        ts = []
        ts_bytearray = []
        ts_karray = []
        # assert 1 == 0
        if end_lane is None:
            end_lane = self.dut.active_lanes
        for i in range(start_lane,end_lane):
            ts.append(ts_s())
            ts_bytearray.append([])
            ts_karray.append([])
        # # print(self.dut.pipe_width)
        # assert 1 == 0
        while self.dut.pipe_width_o== 0:
            await RisingEdge(self.dut.clk_i)

        if self.dut.pipe_width_o== 16:
            # assert 1 == 0
            data = self.dut.phy_txdata.value
            datak = self.dut.phy_txdatak.value
            dataValid = self.dut.phy_txdata_valid.value
            comma_idx = 0
            # # print(bytes(data))
            # # print(data)
            # # print(data)
            #  [bytes_obj[i:i+1] for i in range(len(bytes_obj))]
            comma_detected = 0
            while(comma_detected == 0):
                data = self.dut.phy_txdata.value
                datak = self.dut.phy_txdatak.value
                dataValid = self.dut.phy_txdata_valid.value
                for lane in (range(int(end_lane-start_lane))):
                    for byte_ in range(int((int(self.dut.pipe_width_o)/8))):
                        if((LogicArray(data)[(32*lane)+(((byte_*8) +8)-1): (32*lane)+((byte_*8))].to_BinaryValue() == 0xbc) 
                        and LogicArray(datak)[(4*lane)+byte_] ):
                            comma_detected = 1
                            comma_idx = lane * byte_
                await RisingEdge(self.dut.clk_i)

            
            if(comma_idx == 0):
                for lane in (range(int(end_lane-start_lane))):
                    ts_bytearray[lane].append(LogicArray(data)[(32*lane)+7:  (32*lane)+0].to_BinaryValue())
                    ts_bytearray[lane].append(LogicArray(data)[(32*lane)+15: (32*lane)+8].to_BinaryValue())
                    ts_karray[lane].append(LogicArray(datak)[(4*lane)+0])
                    ts_karray[lane].append(LogicArray(datak)[(4*lane)+1])
                # await RisingEdge(self.dut.clk_i)
                # assert 1 == 0
            else:
                ts_bytearray.append(LogicArray(data)[(32*i)+15: (32*i)+8].to_BinaryValue())
                # await RisingEdge(self.dut.clk_i)

            
            data = self.dut.phy_txdata.value
            datak = self.dut.phy_txdatak.value
            dataValid = self.dut.phy_txdata_valid.value 

            # assert 1 == 0 
            while comma_idx < 16:
                for lane in (range(int(end_lane-start_lane))):
                    ts_bytearray[lane].append(LogicArray(data)[(32*lane)+7: (32*lane)+0].to_BinaryValue())
                    ts_bytearray[lane].append(LogicArray(data)[(32*lane)+15: (32*lane)+8].to_BinaryValue())
                    ts_karray[lane].append(LogicArray(datak)[(4*lane)+0])
                    ts_karray[lane].append(LogicArray(datak)[(4*lane)+1])
                await RisingEdge(self.dut.clk_i)
                data = self.dut.phy_txdata.value
                # print(comma_idx)
                comma_idx += (end_lane-start_lane) * 2           


            for i in range(start_lane,end_lane):
                assert LogicArray(self.dut.phy_rxstatus.value)[(i*3)+2 : 
                (i*3)]._value== LogicArray(0b000,range = (2,'downto',0))._value

            for i in range(int(self.dut.MAX_NUM_LANES)):
                self.monitor_tx_scrambler[i].reset_lfsr(self.current_gen)
            # print(ts_bytearray[0])
            # for b in ts_bytearray[0]:
            #     print(hex(b))
            # print(ts_bytearray[0])
            # assert 1 == 0

            for i in range(start_lane,end_lane):
                # print(hex(LogicArray(self.dut.phy_txdata.value).to_BinaryValue()))
                ts[i].link_number = ts_bytearray[i][1]
                # print(hex(ts[i].link_number))
                # print(int(ts_karray[i][1]))
                if ((ts[i].link_number==0xf7 ) and int(ts_karray[i][1]) == 1):
                    ts[i].use_link_number = 0
                else:
                    ts[i].use_link_number = 1

                ts[i].lane_number = ts_bytearray[i][2]
                # print(hex(ts[i].lane_number))
                # print(int(ts_karray[i][0]))
                if ((ts[i].lane_number == 0xf7) and int(ts_karray[i][0]) == 1):
                    ts[i].use_lane_number = 0
                else:
                    ts[i].use_lane_number = 1
                
                ts[i].n_fts =   ts_bytearray[i][3]


                byte_4 = LogicArray(ts_bytearray[i][4])
                if(byte_4[5]._valid):
                    ts[i].max_gen_supported= gen_t.GEN5
                elif(byte_4[4]._valid):
                    ts[i].max_gen_supported= gen_t.GEN4
                elif(byte_4[3]._valid):
                    ts[i].max_gen_supported= gen_t.GEN3
                elif(byte_4[2]._valid):
                    ts[i].max_gen_supported= gen_t.GEN2
                else:
                    ts[i].max_gen_supported= gen_t.GEN1
                
                if byte_4[6] == 0b1:
                    ts[i].auto_speed_change = 1
                if byte_4[7] == 0b1:
                    ts[i].speed_change = 1

                byte_5 = LogicArray(ts_bytearray[i][5])


                if byte_5[7] == 0b1:
                            ts[i].rx_preset_hint = byte_5[2:0].to_BinaryValue()   
                            ts[i].tx_preset      = byte_5[3+3:3].to_BinaryValue() 
                            ts[i].equalization_command  =1 

                byte_6 = ts_bytearray[i][6]
                if byte_6 == 0b010_01010:
                    ts[i].ts_type = ts_type_t.TS1
                elif(byte_6 ==0b010_00101):
                    ts[i].ts_type = ts_type_t.TS2
                else:
                    # print(hex(byte_6))
                    ...
                    # assert 1 == 0
                    return

        elif self.dut.pipe_width_o== 32:
            # data = bytearray(self.dut.phy_txdata)
            #  [bytes_obj[i:i+1] for i in range(len(bytes_obj))]
            # while not all(LogicArray(self.dut.phy_txdata.value)[(32*i)+7:(32*i)].to_BinaryValue() == 0b101_11100 for i in range(int(self.dut.MAX_NUM_LANES)-1)):
            #     await RisingEdge(self.dut.clk_i)
            while not all((LogicArray(self.dut.phy_txdata.value)[(32*i)+7: (32*i)].to_BinaryValue() == 0b101_11100 and LogicArray(self.dut.phy_txdatak.value)[4*i] and LogicArray(self.dut.phy_txdata_valid.value)[i]) for i in range(start_lane,end_lane)):
            # while not all(data[4*i] == 0b101_11100 for i in range(start_lane, end_lane)):
                await RisingEdge(self.dut.clk_i)
                # data = bytearray(self.dut.phy_txdata)

            self.monitor_tx_scrambler = reset_lfsr(self.monitor_tx_scrambler, self.current_gen)


            for i in range(start_lane, end_lane):
                ts[i].link_number = LogicArray(self.dut.phy_txdata.value)[(32*i)+8+7: (32*i)+8].to_BinaryValue()
                if ts[i].link_number == 0b11110111 and LogicArray(self.dut.phy_txdatak.value)[(4*i) +1] :
                    ts[i].use_link_number = 0
                else: 
                    ts[i].use_link_number = 1

            for i in range(start_lane, end_lane):
                ts[i].lane_number = LogicArray(self.dut.phy_txdata.value)[(32*i)+16+7: (32*i)+16].to_BinaryValue()
                if ts[i].lane_number == 0b11110111 and LogicArray(self.dut.phy_txdatak.value)[(4*i) +1] :
                    ts[i].use_lane_number = 0
                else: 
                    ts[i].use_lane_number = 1

            for i in range(start_lane, end_lane):
                ts[i].nfts = LogicArray(self.dut.phy_txdata.value)[(32*i)+24+7: (32*i)+24].to_BinaryValue()

            await RisingEdge(self.dut.clk_i)

            for symbol_count in range(4,16,4):
                await RisingEdge(self.dut.clk_i)
                if symbol_count == 4:
                    for i in range(start_lane, end_lane):
                        if(LogicArray(self.dut.phy_txdata.value)[start_lane*32+5]):
                            ts[i].max_gen_supported= gen_t.GEN5
                        elif(LogicArray(self.dut.phy_txdata.value)[start_lane*32+4]):
                            ts[i].max_gen_supported= gen_t.GEN4
                        elif(LogicArray(self.dut.phy_txdata.value)[start_lane*32+3]):
                            ts[i].max_gen_supported= gen_t.GEN3
                        elif(LogicArray(self.dut.phy_txdata.value)[start_lane*32+2]):
                            ts[i].max_gen_supported= gen_t.GEN2
                        else:
                            ts[i].max_gen_supported=gen_t.GEN1

                        if(LogicArray(self.dut.phy_txdata.value)[i*32+16+7]):
                            ts[i].rx_preset_hint       = LogicArray(self.dut.phy_txdata.value)[(i*32+16+0) : (i*32+16+0)+3]   
                            ts[i].tx_preset            = LogicArray(self.dut.phy_txdata.value)[(i*32+16+3) : (i*32+16+3)+4]
                            ts[i].equalization_command = 1

                if symbol_count == 8:
                    for i in range(start_lane, end_lane):
                        if(LogicArray(self.dut.phy_txdata.value)[(start_lane*32+16): (start_lane*32+16)+8]==0b010_01010):
                            ts[i].ts_type = ts_type_t.TS1
                        elif(LogicArray(self.dut.phy_txdata.value)[(start_lane*32+16): (start_lane*32+16)+8]==0b010_00101):
                            ts[i].ts_type = ts_type_t.TS2
                        else:
                            return
        else:
            # if self.dut.pipe_width_o!= 8:
            #     return
            # # print(hex(self.dut.pipe_width.value))
            # data = self.dut.phy_txdata.value
            # uvm_root().logger.info(self.name + " " + "pipe width 8")
            #  [bytes_obj[i:i+1] for i in range(len(bytes_obj))]
            while not all(LogicArray(self.dut.phy_txdata.value)[(32*i)+7:(32*i)].to_BinaryValue() == 0b101_11100 for i in range(int(self.dut.MAX_NUM_LANES)-1)):
                await RisingEdge(self.dut.clk_i)
                # # print(LogicArray(self.dut.phy_txdata.value)[(32*0)+7:(32*0)].to_BinaryValue())
            
            # uvm_root().logger.info(self.name + " " + "pipe width still 8")

            self.monitor_tx_scrambler = reset_lfsr(self.monitor_tx_scrambler, self.current_gen)
            # await RisingEdge(self.dut.clk_i)

            for symbol_count in range(1,15):
                await RisingEdge(self.dut.clk_i)
                # data = bytearray(self.dut.phy_txdata.value)
                # # print(hex(self.dut.phy_txdata.value))
                if symbol_count == 1:
                    for i in range(start_lane, end_lane):
                        ts[i].link_number = LogicArray(self.dut.phy_txdata.value)[(32*i)+8:(32*i)].to_BinaryValue()  #link number
                        # # print("link_number: " + hex(ts[i].link_number))
                        # # print("special k :" + str(LogicArray(self.dut.phy_txdatak.value)[0]))
                        # if hex(ts[i].link_number) == hex(0xf7):
                        #     assert 1 == 0
                        if hex(ts[i].link_number) == hex(0xf7) and LogicArray(self.dut.phy_txdatak.value)[0]._valid:
                            # # print("special k set t0 0 :")
                            ts[i].use_link_number = 0
                        else: 
                            ts[i].use_link_number = 1
                    
                if symbol_count == 2:
                    for i in range(start_lane, end_lane):
                        ts[i].lane_number =  LogicArray(self.dut.phy_txdata.value)[(32*i)+8:(32*i)].to_BinaryValue()
                        # # print("lane number: " + hex(ts[i].lane_number))
                        # # print("special k :" + str(LogicArray(self.dut.phy_txdatak.value)[0]))
                        if hex(ts[i].lane_number) == hex(0xf7) and LogicArray(self.dut.phy_txdatak.value)[0]._valid :
                            # # print("use lane et t0 0 :")
                            ts[i].use_lane_number = 0
                        else: 
                            ts[i].use_lane_number = 1
                if symbol_count == 3:
                    for i in range(start_lane, end_lane):
                        ts[i].n_fts =  LogicArray(self.dut.phy_txdata.value)[(32*i)+8:(32*i)].to_BinaryValue()   # number of fast training sequnces
                        # # print("nfts: " + hex(ts[i].link_number))
                if symbol_count == 4:
                    # print(hex(self.dut.phy_txdata.value[0*32:(0*32)+31]))
                    # print(self.dut.phy_txdata.value[(0*32)+5])
                    # print(self.dut.phy_txdata.value[(0*32)+6])
                    # print(LogicArray(self.dut.phy_txdata.value)[(0*32)+7])
                    # print(self.dut.phy_txdata.value[(0*32)+8])
                    for i in range(start_lane, end_lane):
                        # print(i)
                        # print(hex(self.dut.phy_txdata.value[i*32:(i*32)+31]))
                        if(LogicArray(self.dut.phy_txdata.value)[i*32+5]==0b1):
                            ts[i].max_gen_supported= gen_t.GEN5 
                        elif(LogicArray(self.dut.phy_txdata.value)[i*32+4]==0b1):
                            ts[i].max_gen_supported= gen_t.GEN4 
                        elif(LogicArray(self.dut.phy_txdata.value)[i*32+3]==0b1):
                            ts[i].max_gen_supported= gen_t.GEN3 
                        elif(LogicArray(self.dut.phy_txdata.value)[i*32+2]==0b1):
                            ts[i].max_gen_supported= gen_t.GEN2 
                        else:
                            ts[i].max_gen_supported= gen_t.GEN1

                        if LogicArray(self.dut.phy_txdata.value)[(i*32)+6] == 0b1:
                            ts[i].auto_speed_change = 1
                        if LogicArray(self.dut.phy_txdata.value)[(i*32)+7]:
                            # assert 1 == 0
                            ts[i].speed_change = 1
                            assert(ts[i].speed_change == 1)
                    # # print("max gen: " + str(ts[i].max_gen_supported))
                if symbol_count == 10:# ts1 or ts2 determine
                    for i in range(start_lane, end_lane):
                        if(LogicArray(self.dut.phy_txdata.value)[(start_lane*32+0+8): (start_lane*32+0)].to_BinaryValue() ==0b010_01010):
                            ts[i].ts_type = ts_type_t.TS1 
                        elif(LogicArray(self.dut.phy_txdata.value)[(start_lane*32+0+8): (start_lane*32+0)].to_BinaryValue() ==0b010_00101):
                            ts[i].ts_type = ts_type_t.TS2 
                        else:
                            # # print(LogicArray(self.dut.phy_txdata.value)[(start_lane*32+0+8): (start_lane*32+0)].to_BinaryValue())
                            # # print("FAIL!!")
                            return
        # # print(ts[0].ts_type)
        # assert 1 == 0
        for i in range(start_lane, end_lane):
            ts[i].TS_gen = 0
            # print(repr(ts[i]))
        # print(ts)
        self.proxy.notify_tses_received(ts)


 #*******************************************EIOS********************************/
    async def receive_eios(self,start_lane = 0, end_lane = int(cocotb.top.MAX_NUM_LANES)):
        if self.dut.pipe_width_o== 16: # 16 bit pipe parallel interface

            #`uvm_info("pipe_monitor_bfm", "Waiting for COM character", UVM_NONE)
            ##com 
            while not all (( LogicArray(self.dut.phy_txdatak.value)[i] == 1 and  LogicArray(self.dut.phy_txdata.value)[(32 * i):(32 * i) + 8] == 0b101_11100)  for i in range(start_lane,end_lane)):
                data = self.dut.phy_txdata.value
                datak = self.dut.phy_txdatak.value
                dataValid = self.dut.phy_txdata_valid.value
                await RisingEdge(self.dut.clk_i)
            
            for i in range(start_lane,end_lane): #symbol 1 idl sumbol
                if(LogicArray(self.dut.phy_txdata.value)[(i*32+8) : (i*32+8) + 8]!= 0b011_11100) or (LogicArray(self.dut.phy_txdatak.value)[4*i+1]!=1):
                    assert 1 == 0
                    return
            await RisingEdge(self.dut.clk_i)
            await RisingEdge(self.dut.clk_i)    
            for i in range(start_lane,end_lane): #symbol 2,3 idl symbols
                if (LogicArray(self.dut.phy_txdata.value)[(i*32+0): (i*32+0)+8]!= 0b011_11100) or (LogicArray(self.dut.phy_txdatak.value)[4*i+0]!=1):
                    return       
                if (LogicArray(self.dut.phy_txdata.value)[(i*32+8):(i*32+8)+8]!= 0b011_11100) or (LogicArray(self.dut.phy_txdatak.value)[4*i+1]!=1):
                    return

        elif self.dut.pipe_width_o== 32: # 32 bit pipe parallel interface
            #`uvm_info("pipe_monitor_bfm", "Waiting for COM character", UVM_NONE)
            #com   
            while not all ((LogicArray(self.dut.phy_txdata.value)[(i*32+0):(i*32+0)+8] == 0b101_11100) and (LogicArray(self.dut.phy_txdatak.value)[4*i+0]==1) and (LogicArray(self.dut.phy_txdata_valid)[i]==0b1) for i in range(start_lane,end_lane)): #wait to see a COM charecter
                await RisingEdge(self.dut.clk_i)
            for i in range(start_lane,end_lane): #sumbol 1 ,2,3 idl symbols
                if(LogicArray(self.dut.phy_txdata.value)[(i*32+8):(i*32+8)+8]!= 0b011_11100) or (LogicArray(self.dut.phy_txdatak.value)[4*i+1]!=1):
                    return 
                if(LogicArray(self.dut.phy_txdata.value)[(i*32+16): (i*32+16)+8]!=0b011_11100) or (LogicArray(self.dut.phy_txdatak.value)[4*i+2]!=1):
                    return 
                if(LogicArray(self.dut.phy_txdata.value)[(i*32+24): (i*32+24)+8]!=0b011_11100) or (LogicArray(self.dut.phy_txdatak.value)[4*i+3]!=1):
                    return
        else: #8 bit width

            #`uvm_info("pipe_monitor_bfm", "Waiting for COM character", UVM_NONE)            
            #com 
            while not all(LogicArray(self.dut.phy_txdata.value)[(32*i)+7:(32*i)].to_BinaryValue() == 0b101_11100 and (LogicArray(self.dut.phy_txdatak.value)[4*i+0]) and (LogicArray(self.dut.phy_txdata_valid.value)[i]) for i in range(int(self.dut.MAX_NUM_LANES)-1)):
                # await RisingEdge(self.dut.clk_i)

            # while not all ((LogicArray(self.dut.phy_txdata.value)[(i*32+0+7): (i*32+0)] == 0b101_11100) and (LogicArray(self.dut.phy_txdatak.value)[4*i+0]==1) and (LogicArray(self.dut.phy_txdata_valid.value)[i]==1) for i in range(start_lane,end_lane)): #wait to see a COM charecter
                # for i in range(start_lane,end_lane):
                #     print(str(i) + " " + str(LogicArray(self.dut.phy_txdata.value)[(i*32+0+7): (i*32+0)]))
                #     print(LogicArray(self.dut.phy_txdatak.value)[4*i+0])
                #     print(LogicArray(self.dut.phy_txdata_valid.value)[i])
                await RisingEdge(self.dut.clk_i)    
            # assert 1 == 0
            await RisingEdge(self.dut.clk_i) 
            for symbol_count in range (1,4):
                await RisingEdge(self.dut.clk_i)
                for i in range (start_lane,end_lane):
                    if((LogicArray(self.dut.phy_txdata.value)[(i*32+0)+7:(i*32+0)].to_BinaryValue() != 0b011_11100) or not (LogicArray(self.dut.phy_txdatak.value)[4*i+0])): #idle symbols
                        # print(str(i) + " " + str(LogicArray(self.dut.phy_txdata.value)[(i*32+0+7): (i*32+0)]))
                        # print(LogicArray(self.dut.phy_txdatak.value)[4*i+0])
                        # assert 1 == 0
                        return
        # assert 1 == 0
        self.proxy.notify_eios_received()

    
    async def receive_eios_gen3(self, start_lane=0, end_lane=int(cocotb.top.MAX_NUM_LANES)):
        if self.dut.pipe_width_o== 16:  # 16 bit pipe parallel interface
            for i in range(start_lane, end_lane):
                while not (
                    LogicArray(self.dut.phy_txstart_block.value)[i] == 1 and
                    LogicArray(self.dut.phy_txsync_header.value)[(i * 2):(i * 2 + 2)] == 0b01 and
                    LogicArray(self.dut.phy_txdata.value)[(i * 32):(i * 32 + 8)] == 0x66 and
                    LogicArray(self.dut.phy_txdata_valid.value)[i] == 1
                ):
                    await RisingEdge(self.dut.clk_i)

            for i in range(start_lane, end_lane):  # symbol 1
                if LogicArray(self.dut.phy_txdata.value)[(i * 32 + 8):(i * 32 + 16)] != 0x66:
                    return

            await RisingEdge(self.dut.clk_i)

            for symbol_count in range(2, 15, 2):  # symbols 2 -> 15
                await RisingEdge(self.dut.clk_i)
                for i in range(start_lane, end_lane ):
                    if LogicArray(self.dut.phy_txdata.value)[(i * 32):(i * 32 + 8)] != 0x66 or \
                    LogicArray(self.dut.phy_txdata.value)[(i * 32 + 8):(i * 32 + 16)] != 0x66:
                        return

        elif self.dut.pipe_width_o== 32:  # 32 bit pipe parallel interface
            for i in range(start_lane, end_lane ):
                while not (
                    LogicArray(self.dut.phy_txstart_block.value)[i] == 1 and
                    LogicArray(self.dut.phy_txsync_header.value)[(i * 2):(i * 2 + 2)] == 0b01 and
                    LogicArray(self.dut.phy_txdata.value)[(i * 32):(i * 32 + 8)] == 0x66 and
                    LogicArray(self.dut.phy_txdata_valid.value)[i] == 1
                ):
                    await RisingEdge(self.dut.clk_i)

            for i in range(start_lane, end_lane ):  # symbol 1, 2, 3
                if LogicArray(self.dut.phy_txdata.value)[(i * 32 + 8):(i * 32 + 16)] != 0x66 or \
                LogicArray(self.dut.phy_txdata.value)[(i * 32 + 16):(i * 32 + 24)] != 0x66 or \
                LogicArray(self.dut.phy_txdata.value)[(i * 32 + 24):(i * 32 + 32)] != 0x66:
                    return

            await RisingEdge(self.dut.clk_i)

            for symbol_count in range(4, 15, 4):  # symbols 4 -> 15
                await RisingEdge(self.dut.clk_i)
                for i in range(start_lane, end_lane ):
                    if LogicArray(self.dut.phy_txdata.value)[(i * 32):(i * 32 + 8)] != 0x66 or \
                    LogicArray(self.dut.phy_txdata.value)[(i * 32 + 8):(i * 32 + 16)] != 0x66 or \
                    LogicArray(self.dut.phy_txdata.value)[(i * 32 + 16):(i * 32 + 24)] != 0x66 or \
                    LogicArray(self.dut.phy_txdata.value)[(i * 32 + 24):(i * 32 + 32)] != 0x66:
                        return
        else:  # 8 bit width
            for i in range(start_lane, end_lane ):
                while not (
                    LogicArray(self.dut.phy_txstart_block.value)[i] == 1 and
                    LogicArray(self.dut.phy_txsync_header.value)[(i * 2):(i * 2 + 2)] == 0b01 and
                    LogicArray(self.dut.phy_txdata.value)[(i * 32):(i * 32 + 8)] == 0x66 and
                    LogicArray(self.dut.phy_txdata_valid.value)[i] == 1
                ):
                    await RisingEdge(self.dut.clk_i)

            await RisingEdge(self.dut.clk_i)

            for symbol_count in range(1, 16):
                await RisingEdge(self.dut.clk_i)
                for i in range(start_lane, end_lane ):
                    if LogicArray(self.dut.phy_txdata.value)[(i * 32):(i * 32 + 8)] != 0x66:
                        return

        self.proxy.notify_eios_gen3_received()




    #*******************************************EIOS********************************/
    async def receive_eieos(self,start_lane = 0, end_lane = int(cocotb.top.MAX_NUM_LANES)):
        if self.dut.pipe_width_o== 16: # 16 bit pipe parallel interface

            #`uvm_info("pipe_monitor_bfm", "Waiting for COM character", UVM_NONE)
            ##com 
            while not all (( LogicArray(self.dut.phy_txdatak.value)[i] == 1 and  LogicArray(self.dut.phy_txdata.value)[(32 * i):(32 * i) + 8] == 0b101_11100)  for i in range(start_lane,end_lane)):
                data = self.dut.phy_txdata.value
                datak = self.dut.phy_txdatak.value
                dataValid = self.dut.phy_txdata_valid.value
                await RisingEdge(self.dut.clk_i)
            
            for i in range(start_lane,end_lane): #symbol 1 idl sumbol
                if(LogicArray(self.dut.phy_txdata.value)[(i*32+8) : (i*32+8) + 8]!= 0b111_11100) or (LogicArray(self.dut.phy_txdatak.value)[4*i+1]!=1):
                    assert 1 == 0
                    return
            await RisingEdge(self.dut.clk_i)
            # await RisingEdge(self.dut.clk_i)    
            for symbol in range(2,15,2):
                if symbol == 14:
                    for i in range(start_lane,end_lane): #symbol 2,3 idl symbols
                        if (LogicArray(self.dut.phy_txdata.value)[(i*32+0): (i*32+0)+8]!= 0b111_11100) or (LogicArray(self.dut.phy_txdatak.value)[4*i+0]!=1):
                            return       
                        if (LogicArray(self.dut.phy_txdata.value)[(i*32+8):(i*32+8)+8]!= 0b010_01010) or (LogicArray(self.dut.phy_txdatak.value)[4*i+1]!=1):
                            return
                else:
                    for i in range(start_lane,end_lane): #symbol 2,3 idl symbols
                        if (LogicArray(self.dut.phy_txdata.value)[(i*32+0): (i*32+0)+8]!= 0b111_11100) or (LogicArray(self.dut.phy_txdatak.value)[4*i+0]!=1):
                            return       
                        if (LogicArray(self.dut.phy_txdata.value)[(i*32+8):(i*32+8)+8]!= 0b111_11100) or (LogicArray(self.dut.phy_txdatak.value)[4*i+1]!=1):
                            return

        elif self.dut.pipe_width_o== 32: # 32 bit pipe parallel interface
            #`uvm_info("pipe_monitor_bfm", "Waiting for COM character", UVM_NONE)
            #com   
            while not all ((LogicArray(self.dut.phy_txdata.value)[(i*32+0):(i*32+0)+8] == 0b101_11100) and (LogicArray(self.dut.phy_txdatak.value)[4*i+0]==1) and (LogicArray(self.dut.phy_txdata_valid)[i]==0b1) for i in range(start_lane,end_lane)): #wait to see a COM charecter
                await RisingEdge(self.dut.clk_i)
            
            for i in range(start_lane,end_lane): #sumbol 1 ,2,3 idl symbols
                await RisingEdge(self.dut.clk_i)
                if(LogicArray(self.dut.phy_txdata.value)[(i*32+8):(i*32+8)+8]!= 0b111_11100) or not (LogicArray(self.dut.phy_txdatak.value)[4*i+1]):
                    return 
                if(LogicArray(self.dut.phy_txdata.value)[(i*32+16): (i*32+16)+8]!=0b111_11100) or not (LogicArray(self.dut.phy_txdatak.value)[4*i+2]):
                    return 
                if(LogicArray(self.dut.phy_txdata.value)[(i*32+24): (i*32+24)+8]!=0b111_11100) or not (LogicArray(self.dut.phy_txdatak.value)[4*i+3]):
                    return
                
            await RisingEdge(self.dut.clk_i)

            for symbol in range(4,15,4):
                await RisingEdge(self.dut.clk_i)
                if symbol == 14:
                    for i in range(start_lane,end_lane): #symbol 2,3 idl symbols
                        if (LogicArray(self.dut.phy_txdata.value)[(i*32+0): (i*32+0)+8]!= 0b111_11100) or (LogicArray(self.dut.phy_txdatak.value)[4*i+0]!=1):
                            return       
                        if (LogicArray(self.dut.phy_txdata.value)[(i*32+8):(i*32+8)+8]!= 0b111_11100) or (LogicArray(self.dut.phy_txdatak.value)[4*i+1]!=1):
                            return
                        if (LogicArray(self.dut.phy_txdata.value)[(i*32+16):(i*32+16)+8]!= 0b111_11100) or (LogicArray(self.dut.phy_txdatak.value)[4*i+1]!=1):
                            return
                        if (LogicArray(self.dut.phy_txdata.value)[(i*32+24):(i*32+24)+8]!= 0b010_01010) or (LogicArray(self.dut.phy_txdatak.value)[4*i+1]!=1):
                            return
                else:
                    for i in range(start_lane,end_lane): #symbol 2,3 idl symbols
                        if (LogicArray(self.dut.phy_txdata.value)[(i*32+0): (i*32+0)+8]!= 0b111_11100) or (LogicArray(self.dut.phy_txdatak.value)[4*i+0]!=1):
                            return       
                        if (LogicArray(self.dut.phy_txdata.value)[(i*32+8):(i*32+8)+8]!= 0b111_11100) or (LogicArray(self.dut.phy_txdatak.value)[4*i+1]!=1):
                            return
                        if (LogicArray(self.dut.phy_txdata.value)[(i*32+16):(i*32+16)+8]!= 0b111_11100) or (LogicArray(self.dut.phy_txdatak.value)[4*i+1]!=1):
                            return
                        if (LogicArray(self.dut.phy_txdata.value)[(i*32+24):(i*32+24)+8]!= 0b111_11100) or (LogicArray(self.dut.phy_txdatak.value)[4*i+1]!=1):
                            return
        else: #8 bit width
            # uvm_root().logger.info(self.name + " " + "EIEOS Waiting for COM character")
            #`uvm_info("pipe_monitor_bfm", "Waiting for COM character", UVM_NONE)            
            #com 
            while not all(LogicArray(self.dut.phy_txdata.value)[(32*i)+7:(32*i)].to_BinaryValue() == 0b101_11100 and (LogicArray(self.dut.phy_txdatak.value)[4*i+0]) and (LogicArray(self.dut.phy_txdata_valid.value)[i]) for i in range(int(self.dut.MAX_NUM_LANES)-1)):
                await RisingEdge(self.dut.clk_i)    
            # assert 1 == 0
            await RisingEdge(self.dut.clk_i) 
            for symbol_count in range (1,15):
                await RisingEdge(self.dut.clk_i)
                for i in range (start_lane,end_lane):
                    if((LogicArray(self.dut.phy_txdata.value)[(i*32+0)+7:(i*32+0)].to_BinaryValue() != 0b111_11100) or not (LogicArray(self.dut.phy_txdatak.value)[4*i+0])): #idle symbols
                        # print(str(i) + " " + str(LogicArray(self.dut.phy_txdata.value)[(i*32+0+7): (i*32+0)]))
                        # print(LogicArray(self.dut.phy_txdatak.value)[4*i+0])
                        # assert 1 == 0
                        return
            assert 1 == 0
            await RisingEdge(self.dut.clk_i)  
            for i in range (start_lane,end_lane):
                    if((LogicArray(self.dut.phy_txdata.value)[(i*32+0)+7:(i*32+0)].to_BinaryValue() != 0b010_01010) or not (LogicArray(self.dut.phy_txdatak.value)[4*i+0])): #idle symbols
                        # print(str(i) + " " + str(LogicArray(self.dut.phy_txdata.value)[(i*32+0+7): (i*32+0)]))
                        # print(LogicArray(self.dut.phy_txdatak.value)[4*i+0])
                        assert 1 == 0
                        return
        assert 1 == 0
        self.proxy.notify_eieos_received()


    async def receive_eieos_gen3(self,start_lane=0, end_lane=int(cocotb.top.MAX_NUM_LANES)):
        if self.dut.pipe_width_o== 16:  # 16-bit pipe parallel interface
            for i in range(start_lane, end_lane ):
                while not (
                    LogicArray(self.dut.phy_txstart_block.value)[i] == 1 and
                    LogicArray(self.dut.phy_txsync_header.value)[(i * 2):(i * 2 + 2)] == 0b01 and
                    LogicArray(self.dut.phy_txdata.value)[(i * 32):(i * 32 + 8)] == 0x00 and
                    LogicArray(self.dut.phy_txdata_valid.value)[i] == 1
                ):
                    await RisingEdge(self.dut.clk_i)

            for i in range(start_lane, end_lane ):  # symbol 1
                if LogicArray(self.dut.phy_txdata.value)[(i * 32 + 8):(i * 32 + 16)] != 0xFF:
                    return

            await RisingEdge(self.dut.clk_i)

            for symbol_count in range(2, 15, 2):  # symbols 2 -> 15
                await RisingEdge(self.dut.clk_i)
                for i in range(start_lane, end_lane ):
                    if LogicArray(self.dut.phy_txdata.value)[(i * 32):(i * 32 + 8)] != 0x00 or \
                    LogicArray(self.dut.phy_txdata.value)[(i * 32 + 8):(i * 32 + 16)] != 0xFF:
                        return

        elif self.dut.pipe_width_o== 32:  # 32-bit pipe parallel interface
            while not all ((
                    LogicArray(self.dut.phy_txstart_block.value)[i] and
                    LogicArray(self.dut.phy_txsync_header.value)[(i * 2)+1:(i * 2)].to_BinaryValue() == 0b10 and
                    LogicArray(self.dut.phy_txdata.value)[(i * 32)+7:(i * 32 )].to_BinaryValue() == 0xFF and
                    LogicArray(self.dut.phy_txdata_valid.value)[i]
                ) for i in range(start_lane, end_lane )):
                    # for i in range(start_lane, end_lane ):
                        # print(LogicArray(self.dut.phy_txstart_block.value)[i])
                        # print(LogicArray(self.dut.phy_txsync_header.value)[(i * 2)+1:(i * 2)].to_BinaryValue())
                        # print(LogicArray(self.dut.phy_txdata.value)[(i * 32)+7:(i * 32 )].to_BinaryValue())
                        # print(LogicArray(self.dut.phy_txdata_valid.value)[i])
                        # print("")
                await RisingEdge(self.dut.clk_i)
            # assert 1 == 0
            for i in range(start_lane, end_lane ):  # symbol 1, 2, 3
                if  LogicArray(self.dut.phy_txdata.value)[(i * 32 + 15):(i * 32 + 8)].to_BinaryValue() != 0x00 or \
                    LogicArray(self.dut.phy_txdata.value)[(i * 32 + 23):(i * 32 + 16)].to_BinaryValue() != 0xFF or \
                    LogicArray(self.dut.phy_txdata.value)[(i * 32 + 31):(i * 32 + 24)].to_BinaryValue() != 0x00:
                    print(LogicArray(self.dut.phy_txdata.value)[(i * 32 + 15):(i * 32 + 8)].to_BinaryValue())
                    print(LogicArray(self.dut.phy_txdata.value)[(i * 32 + 23):(i * 32 + 16)].to_BinaryValue())
                    print(LogicArray(self.dut.phy_txdata.value)[(i * 32 + 31):(i * 32 + 24)].to_BinaryValue())
                    print("")
                    # assert 1 == 0
                    return

            await RisingEdge(self.dut.clk_i)
            # assert 1 == 0

        else:
            await RisingEdge(self.dut.clk_i)
            return
        # assert 1 == 0
        self.proxy.notify_eieos_gen3_received()



    async def receive_tses_gen3(self, start_lane = 0 , end_lane = None):
        ts = []
        if end_lane is None:
            end_lane = int(self.dut.active_lanes.value)
        for i in range(start_lane,end_lane):
            ts.append(ts_s())
        
        if self.dut.pipe_width_o== 16:
            assert 1 == 0
            data = bytearray(self.dut.phy_txdata)
            #  [bytes_obj[i:i+1] for i in range(len(bytes_obj))]
            while not all(((data[4*i] == 0x4A or data[4*i] == 0x45) and  LogicArray(self.dut.phy_txsync_header.value)[4*i+0]==0b1 and  LogicArray(self.dut.phy_txdata_valid)[i]==0b1) for i in range(start_lane,end_lane)):
                await RisingEdge(self.dut.clk_i)
                data = bytearray(self.dut.phy_txdata)

            for i in range(start_lane,end_lane):
                assert self.dut.phy_rxstatus[(i*3) : (i*3)+3]==0b000

            for i in range(int(self.dut.MAX_NUM_LANES)):
                self.monitor_tx_scrambler[i].reset_lfsr(self.current_gen)

            for i in range(start_lane,end_lane):
                # print(LogicArray(self.dut.phy_txdata.value))
                ts[i].link_number = LogicArray(self.dut.phy_txdata.value)[(i*32+8):(i*32+8)+8]
                if ((ts[i].link_number==0b11110111 ) and (LogicArray(self.dut.phy_txdatak.value)[4*i+1]==1)):
                      ts[i].use_link_number = 0
                else:
                    ts[i].use_link_number = 1

            await RisingEdge(self.dut.clk_i)

            for symbol_count in range(2,16,2):
                await RisingEdge(self.dut.clk_i)
                if symbol_count == 2:
                    for i in range(start_lane,end_lane):
                        ts[i].lane_number = LogicArray(self.dut.phy_txdata)[(i*32+0):(i*32+0)+8]
                        if ts[i].lane_number == 0b11110111 and LogicArray(self.dut.phy_txdata.value)[4*i+0] == 0b1:
                            ts[i].use_lane_number = 0
                        else:
                            ts[i].use_lane_number = 1
                    for i in range(start_lane,end_lane):
                        ts[i].n_fts = LogicArray(self.dut.phy_txdata)[(i*32+8):(i*32+8)+8]

                if symbol_count == 4:
                    for i in range(start_lane,end_lane):
                        if(LogicArray(self.dut.phy_txdata.value)[start_lane*32+5]==0b1):
                            ts[i].max_gen_supported= gen_t.GEN5
                        elif(LogicArray(self.dut.phy_txdata.value)[start_lane*32+4]==0b1):
                            ts[i].max_gen_supported= gen_t.GEN4
                        elif(LogicArray(self.dut.phy_txdata.value)[start_lane*32+3]==0b1):
                            ts[i].max_gen_supported= gen_t.GEN3
                        elif(LogicArray(self.dut.phy_txdata.value)[start_lane*32+2]==0b1):
                            ts[i].max_gen_supported= gen_t.GEN2
                        else:
                            ts[i].max_gen_supported= gen_t.GEN1	

                        if LogicArray(self.dut.phy_txdata.value)[(start_lane*32)+6] == 0b1:
                            ts[i].auto_speed_change = 1
                        if LogicArray(self.dut.phy_txdata.value)[(start_lane*32)+7] == 0b1:
                            ts[i].speed_change = 1
                if symbol_count == 6:
                    for i in range(start_lane,end_lane):
                        if LogicArray(self.dut.phy_txdata.value)[(i*32)+7] == 0b1:
                            ts[i].rx_preset_hint=LogicArray(self.dut.phy_txdata.value)[(i*32+0):(i*32+0)+3]   
                            ts[i].tx_preset=LogicArray(self.dut.phy_txdata.value)[(i*32+3):(i*32+3)+4] 
                            ts[i].equalization_command=1  

                if symbol_count == 10:
                    for i in range(start_lane,end_lane):
                        if LogicArray(self.dut.phy_txdata.value)[(i*32+0):(i*32+0)+8]== 0b010_01010:
                             ts[i].ts_type = ts_type_t.TS1
                        elif(LogicArray(self.dut.phy_txdata.value)[(i*32+0):(i*32+0)+8]==0b010_00101):
                             ts[i].ts_type = ts_type_t.TS2
                        else:
                            return

        elif self.dut.pipe_width_o== 32:
            data = bytearray(self.dut.phy_txdata)
            #  [bytes_obj[i:i+1] for i in range(len(bytes_obj))]
            while not all(data[4*i] == 0b101_11100 for i in range(start_lane, end_lane)):
                await RisingEdge(self.dut.clk_i)
                data = bytearray(self.dut.phy_txdata)

            self.monitor_tx_scrambler = reset_lfsr(self.monitor_tx_scrambler, self.current_gen)

            for i in range(start_lane, end_lane):
                ts[i].link_number = data[i*4]
                if ts[i].link_number == 0b11110111 and LogicArray(self.dut.phy_txdatak.value)[(4*i) +1] == 0b1 :
                    ts[i].use_link_number = 0
                else: 
                    ts[i].use_link_number = 1

            for i in range(start_lane, end_lane):
                ts[i].nfts = data[(i*4) + 3]

            await RisingEdge(self.dut.clk_i)

            for symbol_count in range(4,16,4):
                await RisingEdge(self.dut.clk_i)
                if symbol_count == 4:
                    for i in range(start_lane, end_lane):
                        if(LogicArray(self.dut.phy_txdata.value)[start_lane*32+5]==0b1):
                            ts[i].max_gen_supported= gen_t.GEN5
                        elif(LogicArray(self.dut.phy_txdata.value)[start_lane*32+4]==0b1):
                            ts[i].max_gen_supported= gen_t.GEN4
                        elif(LogicArray(self.dut.phy_txdata.value)[start_lane*32+3]==0b1):
                            ts[i].max_gen_supported= gen_t.GEN3
                        elif(LogicArray(self.dut.phy_txdata.value)[start_lane*32+2]==0b1):
                            ts[i].max_gen_supported= gen_t.GEN2
                        else:
                             ts[i].max_gen_supported=GEN1

                        if(LogicArray(self.dut.phy_txdata.value)[i*32+16+7]== 0b1):
                            ts[i].rx_preset_hint       = LogicArray(self.dut.phy_txdata.value)[(i*32+16+0) : (i*32+16+0)+3]   
                            ts[i].tx_preset            = LogicArray(self.dut.phy_txdata.value)[(i*32+16+3) : (i*32+16+3)+4]
                            ts[i].equalization_command = 1

                if symbol_count == 8:
                    for i in range(start_lane, end_lane):
                        if(LogicArray(self.dut.phy_txdata.value)[(start_lane*32+16): (start_lane*32+16)+8]==0b010_01010):
                            ts[i].ts_type = ts_type_t.TS1
                        elif(LogicArray(self.dut.phy_txdata.value)[(start_lane*32+16): (start_lane*32+16)+8]==0b010_00101):
                            ts[i].ts_type = ts_type_t.TS2
        else:
            data = bytearray(self.dut.phy_txdata)
            #  [bytes_obj[i:i+1] for i in range(len(bytes_obj))]
            while not all(data[4*i] == 0b101_11100 for i in range(len(data))):
               await RisingEdge(self.dut.clk_i)

            self.monitor_tx_scrambler = reset_lfsr(self.monitor_tx_scrambler, self.current_gen)
            await RisingEdge(self.dut.clk_i)

            for symbol_count in range(1,16):
                await RisingEdge(self.dut.clk_i)
                data = bytearray(self.dut.phy_txdata)
                if symbol_count == 1:
                    for i in range(start_lane, end_lane):
                        ts[i].link_number= data[symbol_count*4]  #link number
                        if ts[i].link_number == 0b11110111 and LogicArray(self.dut.phy_txdatak.value)[(4*i) +0] == 0b1 :
                            ts[i].use_link_number = 0
                        else: 
                            ts[i].use_link_number = 1
                    
                if symbol_count == 2:
                    for i in range(start_lane, end_lane):
                        ts[i].lane_number = data[symbol_count*4]   # lane number
                        if ts[i].lane_number == 0b11110111 and LogicArray(self.dut.phy_txdatak.value)[(4*i) +0] == 0b1 :
                            ts[i].use_lane_number = 0
                        else: 
                            ts[i].use_lane_number = 1
                if symbol_count == 3:
                    for i in range(start_lane, end_lane):
                        ts[i].n_fts =  data[symbol_count*4]   # number of fast training sequnces
                if symbol_count == 4:
                    for i in range(start_lane, end_lane):
                        if(LogicArray(self.dut.phy_txdata.value)[start_lane*32+5]==0b1):
                             ts[i].max_gen_supported= gen_t.GEN5 
                        elif(LogicArray(self.dut.phy_txdata.value)[start_lane*32+4]==0b1):
                             ts[i].max_gen_supported= gen_t.GEN4 
                        elif(LogicArray(self.dut.phy_txdata.value)[start_lane*32+3]==0b1):
                             ts[i].max_gen_supported= gen_t.GEN3 
                        elif(LogicArray(self.dut.phy_txdata.value)[start_lane*32+2]==0b1):
                             ts[i].max_gen_supported= gen_t.GEN2 
                        else:
                             ts[i].max_gen_supported= gen_t.GEN1	
                if symbol_count == 10:# ts1 or ts2 determine
                    for i in range(start_lane, end_lane):
                        if(LogicArray(self.dut.phy_txdata.value)[(start_lane*32+0): (start_lane*32+0)+8]==0b010_01010):
                             ts[i].ts_type = ts_type_t.TS1 
                        elif(LogicArray(self.dut.phy_txdata.value)[(start_lane*32+0): (start_lane*32+0)+8]==0b010_00101):
                             ts[i].ts_type = ts_type_t.TS2 
                        else:
                            return
        for i in range(start_lane, end_lane):
            ts[i].TS_gen = 0
            # print(repr(ts[i]))
        self.proxy.notify_tses_received(ts)

    async def tx_elec_idle_and_rx_standby(self):
        await self.build_connect_finished_e.wait()

        while True:
            while not all( LogicArray(self.dut.phy_txelecidle.value)[i] for i in range(self.dut.phy_txelecidle.value)):
                await RisingEdge(self.dut.clk_i)
                # uvm_root().logger.info(self.name + " " + "waiting3")
            self.proxy.notify_TxElecIdle_and_RxStandby_asserted()
            while not all( not LogicArray(self.dut.phy_txelecidle.value)[i] for i in range(self.dut.phy_txelecidle.value)):
                await RisingEdge(self.dut.clk_i)
            await RisingEdge(self.dut.clk_i)




    async def polling_state_start(self):
        uvm_root().logger.info(self.name + " " + "waiting")
        flag = 0
        while flag == 0:
            flag = 1
            for i in range(len(self.dut.phy_phystatus.value)):
                if LogicArray(self.dut.phy_phystatus.value)[i] ==0:
                    flag = 0
                    print(f"phystatus: {LogicArray(self.dut.phy_phystatus.value)[i]}")
            uvm_root().logger.info(self.name + " " + "waiting1")


        # while not all( LogicArray(self.dut.phy_phystatus.value)[i] ==1 for i in range(len(self.dut.phy_phystatus.value))):
        #     await RisingEdge(self.dut.clk_i)
        #     uvm_root().logger.info(self.name + " " + "waiting1")
            # print(LogicArray(self.dut.phy_phystatus.value))
            # print(LogicArray(self.dut.phy_phystatus.value)[0])

        await RisingEdge(self.dut.clk_i)
        while self.dut.phy_phystatus.value != 0:
            print(f"phystatus: {self.dut.phy_phystatus.value}")
            await RisingEdge(self.dut.clk_i)
            uvm_root().logger.info(self.name + " " + "waiting2")

        while self.dut.phy_txelecidle.value != 0:
            await RisingEdge(self.dut.clk_i)
            uvm_root().logger.info(self.name + " " + "waiting3")

        self.proxy.DUT_polling_state_start()

    async def recieve_data(self, start_lane = 0 , end_lane = 1):
        uvm_root().logger.info(self.name + " " + "Starting Data Recieve")
        width = 8
        dllp_found = 0
        tlp_found = 0
        # flag = 0
        bytes_stored = []
        datak_stored = []
        while True:
            data = self.dut.phy_txdata.value
            datak = self.dut.phy_txdatak.value
            dataValid = self.dut.phy_txdata_valid.value
            comma_idx = 0
            reset_next_byte = 0
            # # print(bytes(data))
            # # print(data)
            # # print(data)
            #  [bytes_obj[i:i+1] for i in range(len(bytes_obj))]
            data = self.dut.phy_txdata.value
            # datak = self.dut.phy_txdatak.value
            # dataValid = self.dut.phy_txdata_valid.value
            if(dataValid == 1):
                for lane in (range(int(end_lane-start_lane))):
                    for byte_ in range(int((int(self.dut.pipe_width_o)/8))):
                        temp_byte = LogicArray(data)[(8*byte_)+7 : 8*byte_].to_BinaryValue()
                        if(reset_next_byte):
                            if not ((int(LogicArray(datak)[(4*lane)+byte_]) == 1) and temp_byte == 0x1c):
                                temp_scramble = self.driver_scrambler[0].scramble_byte(0x0)
                        else:
                            if not ((int(LogicArray(datak)[(4*lane)+byte_]) == 1) and temp_byte == 0x1c):
                                temp_scramble = self.driver_scrambler[0].scramble_byte(temp_byte)
                                datak_stored.append(int(LogicArray(datak)[(4*lane)+byte_]))                            
                            if dllp_found == 1:

                                if(int(LogicArray(datak)[(4*lane)+byte_]) == 1):
                                    if(temp_byte == 0xFD):
                                        dllp_found = 0
                                        tlp_found = 0
                                        # print(f"dllp data {[hex(q) for q in self.dllp_q]}")
                                        self.dllp_received = self.dllp_q
                                        self.proxy.notify_dllp_received(self.dllp_received)
                                        self.dllp_q = []
                                        self.dllp_received = []
                                else:
                                    self.dllp_q.append(temp_scramble)
                            elif tlp_found == 1:
                                if(int(LogicArray(datak)[(4*lane)+byte_]) == 1):
                                    if(temp_byte == 0xFD):
                                        tlp_found = 0
                                        dllp_found = 0
                                        # print(f"dllp data {[hex(q) for q in self.dllp_q]}")
                                        self.tlp_received = self.tlp_q
                                        self.proxy.notify_tlp_received(self.tlp_received)
                                        self.tlp_q = []
                                        self.tlp_received = []
                                else:
                                    self.tlp_q.append(temp_scramble)


                            if not ((int(LogicArray(datak)[(4*lane)+byte_]) == 1) and temp_byte == 0x1c):
                                if(int(LogicArray(datak)[(4*lane)+byte_]) == 1):
                                    if(temp_byte == 0x5C):
                                        dllp_found = 1
                                    elif(temp_byte == 0xFB):
                                        tlp_found = 1
                                    bytes_stored.append(int(temp_byte))
                                else:
                                    bytes_stored.append(temp_scramble)
                        if((LogicArray(data)[(32*lane)+(((byte_*8) +8)-1): (32*lane)+((byte_*8))].to_BinaryValue() == 0xbc) 
                        and LogicArray(datak)[(4*lane)+byte_] ):
                            reset_next_byte = 1
                            self.driver_scrambler[0].reset_lfsr(self.current_gen)

            await RisingEdge(self.dut.clk_i)
            if(len(bytes_stored)) >= 4:
                await self.process_tx_data_gen_1_2(bytes_stored,datak_stored)
                datak_stored = []
                bytes_stored = []

    async def process_tx_data_gen_1_2(self,data,data_k):
        num_idle_data = 0
        for i in range(len(data)):
            if self.start_dllp == 1:
                break
            if  data_k[i] == 1:
                ...
                # print(i)
                # print(f"data k data : {hex(data[i])}")
                # if (data[i] == 0x5c):
                #     # assert 1 == 0
                #     self.start_dllp = 1
                #     for j in range(i+1, len(data)):
                #         self.dllp_q.append(data[j])
                #     await self.receive_dllp_gen_1_2()

                #     # print("is DLLP")
                #     # break
                # elif ((data[i] == STP_gen_1_2) and self.tlp_done == 0):
                #     assert 1 == 0
                #     self.start_tlp = i
                #     # print("is TLP")
                #     await self.receive_tlp_gen_1_2()
            else:
                if data[i] == 0x00:
                    num_idle_data += 1

                    # assert 1 == 0
                if (num_idle_data >= 4):
                    self.proxy.notify_idle_data_received()
                    # assert 1 == 0
                    num_idle_data = 0

    def pipe_num_of_lanes(self):
        return self.dut.num_active_lanes_i.value
    
    async def process_rx_data_gen_1_2(self):
        if  LogicArray(self.dut.phy_rxdata_valid.value)[0]:
            num_idle_data = 0
            idle_descrambled = [0] * (self.bus_data_kontrol_param + 1)
            for i in range(self.bus_data_kontrol_param + 1):
                if (( LogicArray(self.dut.phy_rxdatak.value)[i] and  LogicArray(self.dut.phy_rxdata.value)[(8 * i):(8 * i) + 8] == STP_gen_1_2) or self.tlp_done == 0):
                    self.start_tlp = i
                    self.send_tlp_gen_1_2()
                elif (( LogicArray(self.dut.phy_rxdatak.value)[i] and  LogicArray(self.dut.phy_rxdata.value)[(8 * i):(8 * i) + 8] == SDP_gen_1_2) or self.dllp_done == 0):
                    self.start_dllp = i
                    self.send_dllp_gen_1_2()
                elif  LogicArray(self.dut.phy_rxdatak.value)[i] is False:
                    lanenum = int(i / (self.pipe_max_width / 8.0))
                    temp_value =  LogicArray(self.dut.phy_rxdata.value)[(8 * i):(8 * i) + 8].to_BinaryValue()
                    if ((i - (self.get_width / 8) - 1) % 4) == 0:
                        idle_descrambled[i] = self.descramble(self.monitor_rx_scrambler, temp_value, lanenum, self.current_gen)
                    else:
                        idle_descrambled[i] = 0b11111111
                    if idle_descrambled[i] == 0b00000000:
                        num_idle_data += 1
                    if num_idle_data == (self.pipe_num_of_lanes * self.get_width()) // 8:
                        self.proxy.notify_idle_data_sent()
                        num_idle_data = 0


    async def receive_tlp_gen_1_2(self):
        end_tlp = (self.bus_data_width_param + 1) // 8
        for i in range(self.start_tlp, self.bus_data_kontrol_param + 1):
            j = i - self.start_tlp
            if not ( LogicArray(self.dut.phy_txdatak.value)[i] == 1 and  LogicArray(self.dut.phy_txdata.value)[(8 * i):(8 * i) + 8] == 'END_gen_1_2'):
                lanenum = int(i // (self.pipe_max_width / 8.0))
                if  LogicArray(self.dut.phy_txdatak.value)[i] == 0 and ((i - (self.get_width / 8) - 1) % 4) == 0:
                    temp_value =  LogicArray(self.dut.phy_txdata.value)[(8 * i):(8 * i) + 8]
                    self.data_descrambled[(8 * j):(8 * j) + 8] = self.descramble(self.monitor_tx_scrambler, temp_value, lanenum, self.current_gen)
                elif  LogicArray(self.dut.phy_txdatak.value)[i] == 1:
                    self.data_descrambled[(8 * j):(8 * j) + 8] =  LogicArray(self.dut.phy_txdata.value)[(8 * i):(8 * i) + 8]
                self.tlp_done = 0
            else:
                self.data_descrambled[(8 * j):(8 * j) + 8] =  LogicArray(self.dut.phy_txdata.value)[(8 * i):(8 * i) + 8]
                self.tlp_done = 1
                end_tlp = j
                break

        for j in range(0, int(int(self.bus_data_width) / (int(self.dut.MAX_NUM_LANES) * 8))):
            for i in range(j, int(int((self.bus_data_width_param + 1) / 8)), int((self.bus_data_width_param + 1) / int(NUM_OF_LANES * 8))):
                if i > end_tlp:
                    break
                self.tlp_q.append(self.data_descrambled[(8 * i)+8:(8 * i)])

        if self.tlp_done:
            self.tlp_received = self.tlp_q[:]
            self.tlp_q.clear()
            self.proxy.notify_tlp_received(self.tlp_received)

    async def receive_dllp_gen_1_2(self, start_lane = 0 , end_lane = 1):
        # await RisingEdge(self.dut.clk_i)
        while self.dllp_done == 0:
            data = self.dut.phy_txdata.value
            datak = self.dut.phy_txdatak.value
            dataValid = self.dut.phy_txdata_valid.value
            comma_idx = 0
            reset_next_byte = 0
            # # print(bytes(data))
            # # print(data)
            # # print(data)
            #  [bytes_obj[i:i+1] for i in range(len(bytes_obj))]
            data = self.dut.phy_txdata.value
            # datak = self.dut.phy_txdatak.value
            # dataValid = self.dut.phy_txdata_valid.value
            if(dataValid):
                for lane in (range(int(end_lane-start_lane))):
                    for byte_ in range(int((int(self.dut.pipe_width_o)/8))):
                        if(reset_next_byte):
                            ...
                            temp_scramble = self.driver_scrambler[0].scramble_byte(0x0)
                            # self.driver_scrambler[lane].reset_lfsr(self.current_gen)
                        else:
                            temp_byte = LogicArray(data)[(32*lane)+(((byte_*8) +8)-1): (32*lane)+((byte_*8))].to_BinaryValue()
                            temp_scramble = self.driver_scrambler[0].scramble_byte(temp_byte)
                            print(f"dllp rx monitor pure byte: {hex(temp_byte)} ")
                            print(f"dllp rx monitor descrambled byte: {hex(temp_scramble)} ")
                            # datak_stored.append(int(LogicArray(datak)[(4*lane)+byte_]))
                            print(f"dllp rx data k value: {int(LogicArray(datak)[(4*lane)+byte_])}")
                            print(f"dllp rx data k type: {type(int(LogicArray(datak)[(4*lane)+byte_]))}")
                            if self.dllp_done == 0:
                                if(int(LogicArray(datak)[(4*lane)+byte_]) == 1):
                                    # self.dllp_q.append(temp_byte)
                                    if temp_byte == 0xFD:
                                        self.dllp_done = 1
                                else:
                                    self.dllp_q.append(temp_scramble)
                            # if(LogicArray(data).to_BinaryValue() == 0xBE8D):
                            #     assert 1 == 0
                        if((LogicArray(data)[(32*lane)+(((byte_*8) +8)-1): (32*lane)+((byte_*8))].to_BinaryValue() == 0xbc) 
                        and LogicArray(datak)[(4*lane)+byte_] ):
                            reset_next_byte = 1
                            self.driver_scrambler[0].reset_lfsr(self.current_gen)
                            # bytes_stored = []
                            # datak_stored = []
            await RisingEdge(self.dut.clk_i)
        # print(f"dllp data first {[hex(q) for q in self.dllp_q]}")
        if self.dllp_done:
            self.start_dllp = 0
            self.dllp_done = 0
            # print(f"dllp data {[hex(q) for q in self.dllp_q]}")
            # assert 1 == 0
            self.dllp_received = self.dllp_q
            await self.proxy.notify_dllp_received(self.dllp_received)
            self.dllp_q = []
            self.dllp_received = []
            # await RisingEdge(self.dut.clk_i)