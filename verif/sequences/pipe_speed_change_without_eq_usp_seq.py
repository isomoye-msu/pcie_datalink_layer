# ==========================================================================
#
#  Morgan State University
#  Open Hardware Acceleration Lab (HAL-O)
#
#!  Project:   Open-Source PCIe Endpoint Controller.
#   File:      pipe_speed_change_without_equalization_seq.py
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

from cocotb.triggers import *
from pipe_base_seq import *
from cocotb_coverage import crv
from pipe_agent import pipe_seq_item
from pipe_types import *



MAX_GEN_DUT = gen_t.GEN3
MAX_GEN_FAR_PARTENER = gen_t.GEN3


class pipe_speed_change_without_eq_usp_seq(pipe_base_seq, crv.Randomized):


    def __init__(self, name="pipe_speed_change_with_equalization_seq"):
        super().__init__(name)
        self.max_supported_gen_by_dsp = MAX_GEN_FAR_PARTENER  # type: int
        self.max_supported_gen_by_usp = MAX_GEN_DUT  # type: int
        self.negotiated_rate = 0  # type: int
        self.control_reg = None  # type: logic [7:0] [NUM_OF_LANES]
        self.my_rx_preset_hint = 0x0  # type: bit [2:0]
        self.my_tx_preset = 0x0  # type: bit [3:0]
        self.my_local_txPreset_coefficients = 0x0  # type: bit [17:0]
        self.lf_usp = 0x0  # type: bit [5:0]
        self.fs_usp = 0x0  # type: bit [5:0]
        self.lf_dsp = 0x0  # type: bit [5:0]
        self.fs_dsp = 0x0  # type: bit [5:0]
        self.pre_cursor = 0x0  # type: bit [5:0]
        self.cursor = 0x0  # type: bit [5:0]
        self.post_cursor = 0x0  # type: bit [5:0]
        self.enter_phase_2_3 = 0x0  # type: bit
        self.name = name
        
    async def body(self) :  # task
        self.sequencer = ConfigDB().get(None, "", "pipe_sequencer")

        assert self.sequencer is not None

        await super().body()
        uvm_root().logger.info(self.name + " Started speed change sequence")

        tses_send = [ts_s()] * NUM_OF_LANES
        tses_recv = [ts_s()] * NUM_OF_LANES
        flag = Event()
        ts2_recived_count = 0
        ts2_sent_count = 0
        ts_recived_count = 0
        ts_sent_count = 0
        
        # setting generation in driver bfm to GEN1
        pipe_seq_item_h = pipe_seq_item("pipe_seq_item")
        pipe_seq_item_h.gen = gen_t.GEN1
        pipe_seq_item_h.pipe_operation = pipe_operation_t.SET_GEN
        await self.start_item(pipe_seq_item_h)
        await self.finish_item(pipe_seq_item_h)
        

        #*************************************step 1&2 (gen 1): send  TS1 with speed_change bit asserted untill receive TS1 with speed_change bit asserted*************#
        uvm_root().logger.info(self.name(), "print 1")
        async def send_ts1s(self):
            nonlocal flag
            nonlocal tses_send
            while True:
                # tses_send = tses
                for i in range(len(tses_send)):
                    tses_send[i].speed_change = 1
                    tses_send[i].max_gen_supported = self.max_supported_gen_by_dsp
                    tses_send[i].ts_type = ts_type_t.TS1
                    tses_send[i].link_number=1
                    tses_send[i].lane_number=15-i
                    tses_send[i].use_link_number=1
                    tses_send[i].use_lane_number=1
                await self.send_seq_item(tses_send)
                if flag.is_set():
                    flag.clear()
                    break

        async def recieve_8_ts1s(self):
            nonlocal flag
            nonlocal ts_recived_count
            while True:
                tses_recv = await self.get_tses_recived()
                if tses_recv[0].ts_type == ts_type_t.TS1:
                    break
                
                for i in range(len(tses_recv)):
                     assert((tses_recv[i].ts_type == ts_type_t.TS1)  and  (tses_recv[i].speed_change==1)), uvm_root().logger.info("pipe_speed_change_without_eq_dsp_seq", "received tses not as expecting step 1")
                flag.set()

        fork1 = cocotb.start_soon(send_ts1s(self))
        fork2 = cocotb.start_soon(recieve_8_ts1s(self))
        await First(fork1, fork2)



        #*******************************************************************************************************************#
        
        # ***************************************step 3&4(gen 1): send and receive TS2 until 8 or more TS2 are sent and 8 or more TS2 are recived****************************/
        ts2_recived_count=1
        ts2_sent_count=0
        flag.clear()
        async def send_ts2s(self):
            nonlocal flag
            nonlocal tses_send
            nonlocal ts2_sent_count
            while True:
                # tses_send = tses
                for i in range(len(tses_send)):
                    tses_send[i].speed_change = 1
                    tses_send[i].max_gen_supported = self.max_supported_gen_by_dsp
                    tses_send[i].auto_speed_change = 1
                    tses_send[i].ts_type = ts_type_t.TS2
                    tses_send[i].link_number=1
                    tses_send[i].lane_number=15-i
                    tses_send[i].use_link_number=1
                    tses_send[i].use_lane_number=1
                    
                await self.send_seq_item(tses_send)
                ts2_sent_count += 1

        async def recieve_8_ts2s(self):
            nonlocal flag
            nonlocal ts2_sent_count
            nonlocal ts2_recived_count
            while((ts2_sent_count < 8)  or  (ts2_recived_count < 8)):
                tses_recv = await self.get_tses_recived()
                for i in range(len(tses_recv)):
                    if((tses_recv[i].speed_change==1)  and (tses_recv[i].ts_type == ts_type_t.TS2)):
                        ts2_recived_count += 1
            print(ts2_recived_count,tses_recv[0].ts_type)

        fork1 = cocotb.start_soon(send_ts2s(self))
        fork2 = cocotb.start_soon(recieve_8_ts2s(self))
        await with_timeout(First(fork1, fork2), 10000, "ns")



        #*******************************************************************************************************************#
        ##***************************************************step 5 (gen1 --> gen 2,3,4,5):snding and reciving EIOS and EIEOS and asserting PCLKRate, Rate, width *****************************************************/ 
        # receive and send EIOS before enter rec.speed
        # send EIOS until receive EIOS
        async def send_eios(self):
            nonlocal flag
            while not flag.is_set():
                pipe_seq_item_h.pipe_operation = pipe_operation_t.SEND_EIOS
                await self.start_item(pipe_seq_item_h)
                await self.finish_item(pipe_seq_item_h)

        # Wait to receive EIOS
        async def wait_eios(self):
            nonlocal flag
            await self.pipe_agent_config.detected_eios_e.wait()
            flag.set()
            self.pipe_agent_config.detected_eios_e.clear()

        fork1 = cocotb.start_soon(wait_eios(self))
        fork2 = cocotb.start_soon(send_eios(self))
        await with_timeout(First(fork1, fork2), 4000, "ns")


        # figuring out what is the negotiated gen
        if self.max_supported_gen_by_dsp > self.max_supported_gen_by_usp:
            self.negotiated_rate = self.max_supported_gen_by_usp
        else:
            self.negotiated_rate = self.max_supported_gen_by_dsp

        # setting generation in driver bfm to the negotiated GEN
        pipe_seq_item_h.gen = self.negotiated_rate
        pipe_seq_item_h.pipe_operation = pipe_operation_t.SET_GEN
        await self.start_item(pipe_seq_item_h)
        await self.finish_item(pipe_seq_item_h)


        
        # receive and send EIEOS after changing speed to exit electic idle 
 # send EIEOS until receive EIEOS
        async def send_eieos(self):
            nonlocal flag
            while not flag:
                pipe_seq_item_h.pipe_operation = pipe_operation_t.SEND_EIEOS
                await self.start_item(pipe_seq_item_h)
                await self.finish_item(pipe_seq_item_h)

        # Wait to receive EIEOS
        async def wait_eieos(self):
            nonlocal flag
            if self.negotiated_rate <= 2:
                await self.pipe_agent_config.detected_eieos_e.wait
                flag = 1
            else:
                await self.pipe_agent_config.detected_eieos_gen3_e.wait
                flag = 1

        fork1 = cocotb.start_soon(wait_eieos())
        fork2 = cocotb.start_soon(send_eieos())
        await Combine(fork1, fork2)

        # assert width
        match self.negotiated_rate:
            case 1:
                assert (
                    self.pipe_agent_config.new_width == pipe_operation_t.GEN1_PIPEWIDTH
                )
            case 2:
                assert (
                    self.pipe_agent_config.new_width == pipe_operation_t.GEN2_PIPEWIDTH
                )
            case 3:
                assert (
                    self.pipe_agent_config.new_width == pipe_operation_t.GEN3_PIPEWIDTH
                )
            case 4:
                assert (
                    self.pipe_agent_config.new_width == pipe_operation_t.GEN4_PIPEWIDTH
                )
            case 5:
                assert (
                    self.pipe_agent_config.new_width == pipe_operation_t.GEN5_PIPEWIDTH
                )
            case _:
                uvm_root().logger.info(self.name + " " + "negotiated_rate not right")

        # assert Rate
        assert (
            self.pipe_agent_config.new_Rate == self.negotiated_rate
        ), "Rate signal not right"
        # assert PCLKRate
        assert self.negotiated_rate == self.calc_gen(
            self.pipe_agent_config.new_width, self.pipe_agent_config.new_PCLKRate
        ), uvm_root().logger.info(self.name, "PCLKRate signal not right")
        # ************************************************************************************************************************************************************************/

        #****************************************step 6&7&8 (gen 2,3,4,5):send TS1 with speed_change bit=0 until TS1 that  have the Speed Change bit=0  is recived from DSP************************************************/
        # start sending TS1 and wait for TS1
        flag.clear()
        async def send_ts1(self):
            nonlocal flag
            while True:
                for i in range(len(tses_send)):
                    tses_send[i].speed_change = 0
                    tses_send[i].max_gen_supported = self.max_supported_gen_by_dsp
                    tses_send[i].ts_type = ts_type_t.TS1
                await self.send_seq_item(tses_send)
                if flag.is_set():
                    break
        
        async def recv_ts1(self):
            nonlocal flag
            while True:
                tses_recv = await self.get_tses_recived()
                if(tses_recv[0].ts_type == ts_type_t.TS1):
                    break
            for i in range(len(tses_recv)):
                assert((tses_recv[i].speed_change==0)  and  (tses_recv[i].ts_type == ts_type_t.TS1)) ,   uvm_root().logger.fatal("pipe_speed_change_without_eq_usp_seq", "received tses not as expecting step 7&8")
            flag.set()
        
        fork1 = cocotb.start_soon(send_ts1())
        fork2 = cocotb.start_soon(recv_ts1())
        await First(fork1, fork2)


        #*************************************************************************************************************************************************************************/
        # ***************************************step 9(gen 2,3,4,5): send and receive TS2 until 8 or more TS2 are sent and 8 or more TS2 are recived****************************/
        ts2_sent_count = 0
        ts2_recived_count = 0
        
            # send TS2 until 8 or more TS2 are sent and 8 or more TS2 are recived
        flag.clear()
        async def send_ts2(self):
            nonlocal ts2_sent_count
            nonlocal ts2_recived_count
            for i in range(len(tses_send)):
                tses_send[i].speed_change = 0
                tses_send[i].max_gen_supported = self.max_supported_gen_by_dsp
                tses_send[i].ts_type = ts_type_t.TS2
            while((ts2_sent_count < 8)  and  (ts2_recived_count < 8)):
                self.send_seq_item(tses_send)
                ts2_sent_count += 1

            # receive TS2 until 8 or more TS2 are sent and 8 or more TS2 are recived
        async def receive_ts2(self):
            nonlocal ts2_sent_count
            nonlocal ts2_recived_count
            while((ts2_sent_count < 8)  and  (ts2_recived_count < 8)):
                tses_recv = self.get_tses_recived()
                for i in range(len(tses_recv)):
                    assert((tses_recv[i].speed_change==0)  and  tses_recv[i].ts_type == ts_type_t.TS2) ,  uvm_root().logger.fatal("pipe_speed_change_without_eq_usp_seq", "received tses not as expecting step 9")
                ts2_recived_count += 1

        fork1 = cocotb.start_soon(send_ts2())
        fork2 = cocotb.start_soon(receive_ts2())
        await First(fork1, fork2)
        #*************************************************************************************************************************************************************************/  
        #*****************************************************step 10&11 (gen 2,3,4,5):sending idle data******************************************************************************/
        
        flag.clear()
        async def send_idle_data(self):
            nonlocal ts2_sent_count
            nonlocal ts2_recived_count
            nonlocal pipe_seq_item_h
            while True:
                pipe_seq_item_h.pipe_operation= ts_type_t.IDLE_DATA_TRANSFER
                await self.start_item (pipe_seq_item_h)
                await self.finish_item (pipe_seq_item_h)
                pipe_seq_item_h.pipe_operation= ts_type_t.SEND_DATA
                await self.start_item (pipe_seq_item_h)
                await self.finish_item (pipe_seq_item_h)
                if flag.is_set():
                    break
        
            for i in range(16):
                pipe_seq_item_h.pipe_operation= ts_type_t.IDLE_DATA_TRANSFER
                await self.start_item (pipe_seq_item_h)
                await self.finish_item (pipe_seq_item_h)
                pipe_seq_item_h.pipe_operation= ts_type_t.SEND_DATA
                await self.start_item (pipe_seq_item_h)
                await self.finish_item (pipe_seq_item_h)

            # receive TS2 until 8 or more TS2 are sent and 8 or more TS2 are recived
        async def receive_idle_data(self):
            nonlocal ts2_sent_count
            nonlocal ts2_recived_count
            await self.pipe_agent_config_h.idle_data_detected_e.wait()
            for i in range(7):
                await self.pipe_agent_config_h.idle_data_detected_e.wait()


        fork1 = cocotb.start_soon(send_idle_data())
        fork2 = cocotb.start_soon(receive_idle_data())
        await First(fork1, fork2)        



    async def send_seq_item(self,tses):  # task
       pipe_seq_item_h = pipe_seq_item("pipe_seq_item")
       pipe_seq_item_h.tses_sent = tses
       pipe_seq_item_h.pipe_operation = ts_type_t.SEND_TSES
       await self.start_item (pipe_seq_item_h)
       await self.finish_item (pipe_seq_item_h)
    

    async  def get_tses_recived(self,tses):  # task
       await self.pipe_agent_config_h.detected_tses_e.wait()
       tses = self.pipe_agent_config_h.tses_received
       return tses
     
    def calc_gen(self, width, PCLKRate ):
        PCLKRate_value = 0
        width_value = 0
        freq = 0
        gen = 0

        match PCLKRate:    
            case 0b000: PCLKRate_value = 0.0625
            case 0b001: PCLKRate_value = 0.125
            case 0b010: PCLKRate_value = 0.25
            case 0b011: PCLKRate_value = 0.5
            case 0b100: PCLKRate_value = 1
       
        match width:
           case 0b00: width_value =8
           case 0b01: width_value =16
           case 0b10: width_value =32
       
        freq= PCLKRate_value * width_value
     
        match (freq):
           case  2: gen=1
           case  4: gen=2
           case  8: gen=3
           case 16: gen=4
           case 32: gen=5
           case _ : gen=0
            
        return gen
     # speed_change_bit            