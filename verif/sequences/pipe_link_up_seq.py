# ==========================================================================
#
#  Morgan State University
#  Open Hardware Acceleration Lab (HAL-O)
#
#!  Project:   Open-Source PCIe Endpoint Controller.
#   File:      pipe_link_up_seq.py
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
from pipe_base_seq import *
from cocotb.triggers import *
from cocotb_coverage import crv
from pipe_agent import pipe_seq_item
from pipe_types import *

class pipe_link_up_seq(pipe_base_seq, crv.Randomized):
    
    def __init__(self, name = "pipe_link_up_seq"):
        super().__init__(name)
        crv.Randomized.__init__(self)
        self.name = name
        self.ts_sent = ts_s()  # type: ts_s  
        self.tses_sent = []  # type: ts_s 
        self.tses_received = []  # type: ts_s  
        self.idle_data_received = []  # type: int
        self.max_gen_supported = 0  # type: gen_t  
        self.link_number = 0x0  # type: bit [7:0] 
        self.n_fts = 0x0  # type: bit [7:0] 
        self.random_start_polling = 0  # type: int  
        self.delay_clocks = 0  # type: int  
        self.dut = cocotb.top
        self.add_rand("max_gen_supported", list(gen_t))
        self.add_rand("link_number", list(range(0, 255)))
        self.add_rand("n_fts", list(range(0, 255)))
        self.add_rand("random_start_polling", list(range(0, 10000)))
        self.add_rand("delay_clocks", list(range(0, 10000)))

        def random_start_polling_c(random_start_polling):
            return 0 <= random_start_polling <= 2
        
        def delay_clock_c(delay_clocks):
            return 10 <= delay_clocks <= 15

        # constraining the space so that x < y
        self.add_constraint(random_start_polling_c)
        self.add_constraint(delay_clock_c)
    
    async def body(self):
        self.sequencer = ConfigDB().get(None, "", "pipe_sequencer")

        assert self.sequencer is not None
            
        await super().body()
        uvm_root().logger.info("pipe_link_up_seq "+ "Started pipe_link_up_seq")
        self.randomize()

        self.ts_sent.n_fts            = self.n_fts
        self.ts_sent.lane_number      = 0
        self.ts_sent.link_number      = self.link_number
        self.ts_sent.use_n_fts        = 0
        self.ts_sent.use_link_number  = 0
        self.ts_sent.use_lane_number  = 0

        self.ts_sent.ts_type          = ts_type_t.TS1

        self.tses_sent = []
        for  i in range(int(self.dut.MAX_NUM_LANES.value)):
            self.tses_sent.append(ts_s())
            self.tses_sent[i].n_fts              = self.n_fts
            self.tses_sent[i].lane_number        = i
            self.tses_sent[i].link_number        = self.link_number
            self.tses_sent[i].use_n_fts          = 0
            self.tses_sent[i].use_link_number    = 0
            self.tses_sent[i].use_lane_number    = 0
            self.tses_sent[i].max_gen_supported  = MAX_GEN_FAR_PARTENER
            self.tses_sent[i].ts_type            = ts_type_t.TS1

        async def poll():
            for i in range(self.delay_clocks):
                await self.pipe_agent_config.detected_posedge_clk_e.wait()
                self.pipe_agent_config.detected_posedge_clk_e.clear()
                await self.polling_state()

        if self.random_start_polling == 2:
            await self.detect_state()
            await self.polling_state()

        else:
            await self.detect_state()
            await self.polling_state()

        await self.config_state()
        self.pipe_agent_config.link_up_finished_e.set
        uvm_root().logger.info("pipe_link_up_seq " + "Finished pipe_link_up_seq")

    async def detect_state(self):
        assert self.pipe_agent_config is not None 
        uvm_root().logger.info(self.name + " waiting for receiver detection")
        await self.pipe_agent_config.receiver_detected_e.wait()
        uvm_root().logger.info(self.name + " Receiver detected")
        self.pipe_agent_config.receiver_detected_e.clear()
        

    async def polling_state(self):
        uvm_root().logger.info(self.name + " Started polling_state")
        await self.polling_active_state()
        await self.polling_configuration_state()
        uvm_root().logger.info(self.name + " Finished polling_state")
    

    async def receiving_8_ts1(self): #Dut sing
        rec_8_ts1 = 0
        await self.pipe_agent_config.DUT_start_polling_e.wait()
        
        while (rec_8_ts1 < 8):
            await self.pipe_agent_config.detected_tses_e.wait()
            if( self.pipe_agent_config.tses_received[0].ts_type == ts_type_t.TS1  and  
                not (self.pipe_agent_config.tses_received[0].use_lane_number)  
                and   not (self.pipe_agent_config.tses_received[0].use_link_number)):
                rec_8_ts1 += 1
                uvm_root().logger.info("pipe_link_up_seq " + "Received TS1s")
            else:
               uvm_root().logger.error(self.name + " training sequences of polling active state received is not correct")
            #    uvm_root().logger.error(self.pipe_agent_config.tses_received[0].ts_type)
            #    uvm_root().logger.error( self.pipe_agent_config.tses_received[0].use_link_number)
            #    uvm_root().logger.error( self.pipe_agent_config.tses_received[0].use_lane_number)
            self.pipe_agent_config.detected_tses_e.clear()
        self.pipe_agent_config.DUT_start_polling_e.clear()
    

    #check variable option compliance or loopback in ts1?
    async def send_1024_ts1(self):
        pipe_seq_item_h = pipe_seq_item("pipe_seq_item")
        for i in range(24):
            await self.start_item (pipe_seq_item_h)
            pipe_seq_item_h.add_constraint(lambda pipe_operation: pipe_operation == pipe_operation_t.SEND_TS)
            pipe_seq_item_h.randomize()
            pipe_seq_item_h.ts_sent.add_constraint(lambda ts_type: ts_type == ts_type_t.TS1)
            pipe_seq_item_h.ts_sent.add_constraint(lambda use_link_number: use_link_number == 0)
            pipe_seq_item_h.ts_sent.add_constraint(lambda use_lane_number: use_lane_number == 0)
            pipe_seq_item_h.ts_sent.randomize()
            pipe_seq_item_h.ts_sent.max_gen_supported = gen_t.GEN3
            await self.finish_item (pipe_seq_item_h)
        

    async  def polling_active_state(self):
        coro1 = cocotb.start_soon(self.send_1024_ts1())
        coro2 = cocotb.start_soon(self.receiving_8_ts1())
        await Combine(coro1 ,coro2)
    

    async  def polling_configuration_state(self):
        pipe_seq_item_h = pipe_seq_item("pipe_seq_item")
        flag = Event()
        uvm_root().logger.info(self.name + " Started polling_configuration_state")
        await self.pipe_agent_config.detected_tses_e.wait()
            
        self.pipe_agent_config.detected_tses_e.clear()
        if self.pipe_agent_config.tses_received[0].ts_type == ts_type_t.TS2:
            await self.start_item(pipe_seq_item_h)
            pipe_seq_item_h.add_constraint(lambda pipe_operation: pipe_operation == pipe_operation_t.SEND_TS)
            pipe_seq_item_h.randomize()
            await self.finish_item (pipe_seq_item_h)
            await self.pipe_agent_config.detected_tses_e.wait()
            self.pipe_agent_config.detected_tses_e.clear()

        async def ts2_recieved():
                rec_8_ts2 = 0
                while(rec_8_ts2 < 1):
                    await self.pipe_agent_config.detected_tses_e.wait()
                    if(self.pipe_agent_config.tses_received[0].ts_type == ts_type_t.TS2 
                        and  not(self.pipe_agent_config.tses_received[0].use_lane_number)  
                        and   not(self.pipe_agent_config.tses_received[0].use_link_number)):
                        rec_8_ts2 += 1
                        uvm_root().logger.info(self.name + " TS2 received")
                    else:       
                        uvm_root().logger.error(self.name + " training sequences ts2 of polling config state received is not correct")
                        uvm_root().logger.error(self.pipe_agent_config.tses_received[0].ts_type)
                        uvm_root().logger.error(self.pipe_agent_config.tses_received[0].use_lane_number)
                        uvm_root().logger.error(self.pipe_agent_config.tses_received[0].use_link_number)
                    self.pipe_agent_config.detected_tses_e.clear()
                flag.set()

        async def ts1_recieved():
                rec_8_ts1 = 0
                while(rec_8_ts1 < 1):
                    await self.pipe_agent_config.detected_tses_e.wait()
                    if(self.pipe_agent_config.tses_received[0].ts_type == ts_type_t.TS1 
                        and  not(self.pipe_agent_config.tses_received[0].use_lane_number)  
                        and   not(self.pipe_agent_config.tses_received[0].use_link_number)):
                        rec_8_ts1 += 1
                        uvm_root().logger.info(self.name + " TS1 received")
                    else:       
                        uvm_root().logger.error(self.name + " training sequences ts1 of polling config state received is not correct")
                        uvm_root().logger.error(self.pipe_agent_config.tses_received[0].ts_type)
                        uvm_root().logger.error(self.pipe_agent_config.tses_received[0].use_lane_number)
                        uvm_root().logger.error(self.pipe_agent_config.tses_received[0].use_link_number)
                    self.pipe_agent_config.detected_tses_e.clear()
                flag.set()

        async def send_ts2():
                while not flag.is_set():
                    await self.start_item (pipe_seq_item_h)
                    pipe_seq_item_h.pipe_operation = pipe_operation_t.SEND_TS
                    pipe_seq_item_h.ts_sent.ts_type = ts_type_t.TS2
                    await self.finish_item (pipe_seq_item_h)
                
        coro1 = cocotb.start_soon(ts2_recieved())
        coro2 = cocotb.start_soon(send_ts2())
        await Combine(coro1 ,coro2)
        flag.clear()
        coro2 = cocotb.start_soon(send_ts2())
        coro3 = cocotb.start_soon(ts1_recieved())
        await Combine(coro3 ,coro2)
        flag.clear()
        uvm_root().logger.info(self.name + " Finished polling_configuration_state")
    

    async  def config_state(self):
        uvm_root().logger.info(self.name + " Started config_state")
        if IS_ENV_UPSTREAM == 0:
            await self.config_linkwidth_start_state_upstream()
            await self.config_linkwidth_accept_state_upstream()
            await self.config_lanenum_wait_state_upstream()
            await self.config_complete_state_upstream()
            await self.config_idle_state()
            await Timer(2000,'ns')
        
        else:
            await self.config_linkwidth_start_state_downstream()
            await self.config_linkwidth_accept_state_downstream()
            await self.config_lanenum_wait_state_downstream()
            await self.config_complete_state_downstream()
            await self.config_idle_state()
            await Timer(2000,'ns')
        
        uvm_root().logger.info(self.name + " Finished config_state")
    

    async def config_linkwidth_start_state_upstream(self):
        pipe_seq_item_h = pipe_seq_item("pipe_seq_item_h")
        num_of_ts1s_with_non_pad_link_number = []
        pipe_seq_item_h.pipe_operation = pipe_operation_t.SEND_TSES
        name = self.name
        uvm_root().logger.info(self.name + " Started config_linkwidth_start_state_upstream")

        pipe_seq_item_h.tses_sent = self.tses_sent

        # Initialize the num_of_ts2_received array with zeros
        for i in range(8):
            num_of_ts1s_with_non_pad_link_number.append(0)

        # Transmit TS1s until 2 consecutive TS2s are receivedIUM)
        two_consecutive_ts1s_with_non_pad_link_number_detected = 0

        async def items(self):
            nonlocal two_consecutive_ts1s_with_non_pad_link_number_detected
            nonlocal pipe_seq_item_h
            while two_consecutive_ts1s_with_non_pad_link_number_detected == 0:
                await self.start_item(pipe_seq_item_h)
                await self.finish_item(pipe_seq_item_h)
                uvm_root().logger.info(name + " TS1 with PAD Link and Lane numbers sent")

        async def update_link_num(self):
            nonlocal two_consecutive_ts1s_with_non_pad_link_number_detected
            nonlocal num_of_ts1s_with_non_pad_link_number
            while two_consecutive_ts1s_with_non_pad_link_number_detected == 0:
                await self.pipe_agent_config.detected_tses_e.wait()
                tses_received = self.pipe_agent_config.tses_received
                self.pipe_agent_config.detected_tses_e.clear()
                for i in range(len(tses_received)):
                    if(tses_received[i].ts_type == ts_type_t.TS1  and  tses_received[i].use_link_number):
                        num_of_ts1s_with_non_pad_link_number[i] += 1
                        uvm_root().logger.info(name + " TS1 with Non-PAD Link number received")
                    else:
                        num_of_ts1s_with_non_pad_link_number[i] = 0

            # Check if any lane detected 2 consecutive ts2s
                for i in range(len(num_of_ts1s_with_non_pad_link_number)):
                    if(num_of_ts1s_with_non_pad_link_number[i] == 2):
                        two_consecutive_ts1s_with_non_pad_link_number_detected = 1
                        uvm_root().logger.info(self.name + "2 Consecutive TS1s with Non-PAD Link number are Detected")


        fork1 = cocotb.start_soon(items(self))
        fork2 = cocotb.start_soon(update_link_num(self))

        await Combine(fork1,fork2)
        uvm_root().logger.info(self.name + " Finished config_linkwidth_start_state_upstream")
    

    async def config_linkwidth_accept_state_upstream(self):
        pipe_seq_item_h = pipe_seq_item("pipe_seq_item_h")
        used_link_num = 0
        ts1_with_non_pad_lane_number_detected = 0
        pipe_seq_item_h.pipe_operation = pipe_operation_t.SEND_TSES
        uvm_root().logger.info(self.name + " Started config_linkwidth_accept_state_upstream")
        # Use the link number of the ts1s on the first lane to be transmitted
        # used_link_num = self.pipe_agent_config.tses_received[0].link_number
        for i in range(len(self.tses_sent)):
            self.tses_sent[i].link_number = used_link_num
            self.tses_sent[i].use_link_number = 1
            self.tses_sent[i].use_lane_number = 0
        
        pipe_seq_item_h.tses_sent = self.tses_sent
        # S ts1s with self link number until some ts1s are received with non PAD lane number
        ts1_with_non_pad_lane_number_detected = 0
        
        async def items():
            nonlocal ts1_with_non_pad_lane_number_detected
            nonlocal pipe_seq_item_h
            while ts1_with_non_pad_lane_number_detected == 0:
                await self.start_item(pipe_seq_item_h)
                await self.finish_item(pipe_seq_item_h)
                # await RisingEdge(self.dut.clk_i)

        async def update_lane_num():
            nonlocal ts1_with_non_pad_lane_number_detected
            while ts1_with_non_pad_lane_number_detected == 0:
                await self.pipe_agent_config.detected_tses_e.wait()
                tses_received = self.pipe_agent_config.tses_received
                self.pipe_agent_config.detected_tses_e.clear()
                # Check if any ts1 received has a non PAD lane number
                for i in range(len(tses_received)):
                    # Make sure the tses received are ts1s
                    if( not tses_received[i].ts_type == ts_type_t.TS1):
                        uvm_root().logger.error(self.name + " Expected TS1s but detected TS2s")
                    # Non PAD lane number
                    if(tses_received[i].use_lane_number):
                        ts1_with_non_pad_lane_number_detected = 1
                    #uvm_root().logger.info(self.name + "TS1 with Non-PAD Lane number received")
                
        fork1 = cocotb.start_soon(items())
        fork2 = cocotb.start_soon(update_lane_num())
        await Combine(fork1,fork2)

        # Get the lane numbers from the received ts1s
        for i in range(len(self.pipe_agent_config.tses_received)):
            assert self.pipe_agent_config.tses_received[i].lane_number == i
                # uvm_root().logger.error(self.name, " the order of lane numbers are incorrect, actual lane num= %h, expected=%d",self.tses_received[i].lane_number , i)
            self.tses_sent[i].lane_number = self.pipe_agent_config.tses_received[i].lane_number
            self.tses_sent[i].use_lane_number = 1
        uvm_root().logger.info(self.name + " Finished config_linkwidth_accept_state_upstream")
    

    async  def config_lanenum_wait_state_upstream(self):
        pipe_seq_item_h = pipe_seq_item("pipe_seq_item_h")
        num_of_ts2_received = [0] * NUM_OF_LANES
        two_consecutive_ts2s_detected = 0
        pipe_seq_item_h.pipe_operation = pipe_operation_t.SEND_TSES
        pipe_seq_item_h.tses_sent = self.tses_sent
        uvm_root().logger.info(self.name + " Started config_lanenum_wait_state_upstream")
        # Initialize the num_of_ts2_received array with zeros
        for i in range(NUM_OF_LANES):
            num_of_ts2_received[i] = 0
        
        # Transmit TS1s until 2 consecutive TS2s are received
        #uvm_root().logger.info(self.name + "config_lanenum_wait_state_upstream1")

        two_consecutive_ts2s_detected = 0

        async def items():
            nonlocal pipe_seq_item_h
            nonlocal two_consecutive_ts2s_detected
            while not two_consecutive_ts2s_detected:
                await self.start_item(pipe_seq_item_h)
                await self.finish_item(pipe_seq_item_h)
                # await RisingEdge(self.dut.clk_i)

        async def update_ts2():
            nonlocal two_consecutive_ts2s_detected
            nonlocal num_of_ts2_received
            while not two_consecutive_ts2s_detected:
                await self.pipe_agent_config.detected_tses_e.wait()
                tses_received = self.pipe_agent_config.tses_received
                self.pipe_agent_config.detected_tses_e.clear()
                for i in range(len(tses_received)):
                    if(tses_received[i].ts_type == ts_type_t.TS2):
                        num_of_ts2_received[i] += 1
                        uvm_root().logger.info(self.name + " TS2 with the same Link number and Lane number received")
                    else:
                        num_of_ts2_received[i] = 0
                    
                # Check if any lane detected 2 consecutive ts2s
                for i in range(len(num_of_ts2_received)):
                    if(num_of_ts2_received[i] == 2):                   
                        two_consecutive_ts2s_detected = 1
                        uvm_root().logger.info(self.name + " 2 Consecutive TS2s with the same Link number and Lane number are Detected")
                
        fork1 = cocotb.start_soon(items())
        fork2 = cocotb.start_soon(update_ts2())
        await Combine(fork1 ,fork2)
        uvm_root().logger.info(self.name + " Finished config_lanenum_wait_state_upstream")
    

    async def config_complete_state_upstream(self):
        pipe_seq_item_h = pipe_seq_item("pipe_seq_item_h")
        num_of_ts2_received = [0] * NUM_OF_LANES
        eight_consecutive_ts2s_detected = 0
        uvm_root().logger.info(self.name + " Started config_complete_state_upstream")
        pipe_seq_item_h.pipe_operation = pipe_operation_t.SEND_TSES

        # Initialize the num_of_ts2_received array with zeros
        # for i in range(len(num_of_ts2_received)):       
        #     num_of_ts2_received[i] = 0
    

        for i in range(len(self.tses_sent)):
            self.tses_sent[i].ts_type = ts_type_t.TS2
    
        pipe_seq_item_h.tses_sent = self.tses_sent

    # Transmit 16 TS2s until 8 consecutive TS2s are received
        # eight_consecutive_ts2s_detected = 0
        async def items():
            nonlocal eight_consecutive_ts2s_detected
            await self.pipe_agent_config.detected_tses_e.wait()
            for i in range(16):
                await self.start_item(pipe_seq_item_h)
                await self.finish_item(pipe_seq_item_h)
            self.pipe_agent_config.detected_tses_e.clear()
            while eight_consecutive_ts2s_detected == 0:
                await self.start_item(pipe_seq_item_h)
                await self.finish_item(pipe_seq_item_h)
        
    
        async def count_ts2():
            nonlocal eight_consecutive_ts2s_detected
            nonlocal num_of_ts2_received
            while eight_consecutive_ts2s_detected == 0:
                await self.pipe_agent_config.detected_tses_e.wait()
                tses_received = self.pipe_agent_config.tses_received
                self.pipe_agent_config.detected_tses_e.clear()
                
                for i in range(len(tses_received)):
                    if(tses_received[i].ts_type == ts_type_t.TS2):
                        num_of_ts2_received[i] += 1
                        uvm_root().logger.info(self.name + " lane " + str(i) + " : TS2 with the correct Link and Lane numbers received")
                    else:
                        num_of_ts2_received[i] = 0
                    
                # Check if any lane detected 8 consecutive ts2s
                for i in range(len(tses_received)):
                    if(num_of_ts2_received[i] == 8):
                        eight_consecutive_ts2s_detected = 1
                        uvm_root().logger.info(self.name + " 8 Consecutive TS2s with the correct Link and Lane numbers are Detected")
                
        
        fork1 = cocotb.start_soon(items())
        fork2 = cocotb.start_soon(count_ts2())
        await Combine(fork1 ,fork2)
        uvm_root().logger.info(self.name + " Finished config_complete_state_upstream")
    


    async def config_linkwidth_start_state_downstream(self):
        pipe_seq_item_h = pipe_seq_item("pipe_seq_item_h")
        pipe_seq_item_h.randomize()
        num_of_detected_ts1s_with_same_link_number = []
        pipe_base_seq
        pipe_seq_item_h.pipe_operation = pipe_operation_t.SEND_TSES
        uvm_root().logger.info(self.name + " Started config_linkwidth_start_state_downstream")
        # assert 1 == 0
        for i in range(len(self.tses_sent)):
            # self.tses_sent[i].link_number = self.link_number
            self.tses_sent[i].use_link_number = 0
            self.tses_sent[i].ts_type            = ts_type_t.TS1
        
        pipe_seq_item_h.tses_sent = self.tses_sent
        # Initialize the num_of_detected_ts1s_with_same_link_number array with zeros
        for i in range(len(self.dut.MAX_NUM_LANES)):
            num_of_detected_ts1s_with_same_link_number.append(0)
        
        # S ts1s with the generated link number until two ts1s are received with the same link number
        two_ts1s_with_same_link_number_detected = Event()

        async def items():
            while not two_ts1s_with_same_link_number_detected.is_set():
                await self.start_item(pipe_seq_item_h)
                await self.finish_item(pipe_seq_item_h)
        
        async def count_ts1():
            # two_ts1s_with_same_link_number_detected = 0
            while not two_ts1s_with_same_link_number_detected.is_set():
                await self.pipe_agent_config.detected_tses_e.wait()
                tses_received = self.pipe_agent_config.tses_received
                self.pipe_agent_config.detected_tses_e.clear()

                for i in range(len(tses_received)):
                    if(tses_received[i].ts_type == ts_type_t.TS1  and  not tses_received[i].use_link_number):
                        num_of_detected_ts1s_with_same_link_number[i] += 1
                        uvm_root().logger.info(self.name + "TS1 with the same Link number received")
                    else:
                        num_of_detected_ts1s_with_same_link_number[i] = 0
                        print(tses_received[i].ts_type)
                        print(tses_received[i].use_link_number)
                        print(tses_received[i].link_number)

                # Check if any lane detected 2 cosecutive ts1s with the same link number
                for i in range(len(num_of_detected_ts1s_with_same_link_number)):
                    if(num_of_detected_ts1s_with_same_link_number[i] == 2):
                        two_ts1s_with_same_link_number_detected.set()
                    #uvm_root().logger.info(self.name + "2 Consecutive TS1s with Link no. that matches transmitted Link number are Detected")
        # assert 1 == 0
        fork1 = cocotb.start_soon(items())
        fork2 = cocotb.start_soon(count_ts1())
        await Combine(fork1 ,fork2)
        uvm_root().logger.info(self.name + " Finished config_linkwidth_start_state_downstream")
        

    async def config_linkwidth_accept_state_downstream(self):
        # assert 1 == 0
        pipe_seq_item_h = pipe_seq_item("pipe_seq_item_h")
        pipe_seq_item_h.randomize()
        num_of_detected_ts1s_with_same_link_number = []
        pipe_base_seq
        pipe_seq_item_h.pipe_operation = pipe_operation_t.SEND_TSES
        uvm_root().logger.info(self.name + " Started config_linkwidth_start_state_downstream")
        # assert 1 == 0
        self.link_number = 0x00
        for i in range(len(self.tses_sent)):
            self.tses_sent[i].link_number = self.link_number
            self.tses_sent[i].use_link_number = 1
            self.tses_sent[i].ts_type            = ts_type_t.TS1
        
        pipe_seq_item_h.tses_sent = self.tses_sent
        # Initialize the num_of_detected_ts1s_with_same_link_number array with zeros
        for i in range(len(self.dut.MAX_NUM_LANES)):
            num_of_detected_ts1s_with_same_link_number.append(0)
        
        # S ts1s with the generated link number until two ts1s are received with the same link number
        self.two_ts1s_with_same_link_number_detected = Event()

        async def send_tses():
            while  not self.two_ts1s_with_same_link_number_detected.is_set():
                await self.start_item(pipe_seq_item_h)
                await self.finish_item(pipe_seq_item_h)
        
        async def count_ts1():
            while  not self.two_ts1s_with_same_link_number_detected.is_set():
                await self.pipe_agent_config.detected_tses_e.wait()
                tses_received = self.pipe_agent_config.tses_received
                self.pipe_agent_config.detected_tses_e.clear()

                for i in range(len(tses_received)):
                    if(tses_received[i].ts_type == ts_type_t.TS1  and tses_received[i].use_link_number and
                    tses_received[i].link_number == self.link_number):
                        num_of_detected_ts1s_with_same_link_number[i] += 1
                    #uvm_root().logger.info(self.name + "TS1 with the same Link number received")
                    else:
                        num_of_detected_ts1s_with_same_link_number[i] = 0
                        print(tses_received[i].ts_type)
                        print(f"self link number : {hex(self.link_number)}")
                        print(tses_received[i].use_link_number)
                        print(hex(tses_received[i].link_number))

                # Check if any lane detected 2 cosecutive ts1s with the same link number
                for i in range(len(num_of_detected_ts1s_with_same_link_number)):
                    if(num_of_detected_ts1s_with_same_link_number[i] == 2):
                        self.two_ts1s_with_same_link_number_detected.set()
                        # assert 1 == 0
                    #uvm_root().logger.info(self.name + "2 Consecutive TS1s with Link no. that matches transmitted Link number are Detected")
                
        fork1 = cocotb.start_soon(send_tses())
        fork2 = cocotb.start_soon(count_ts1())
        await Combine(fork1 ,fork2)
        uvm_root().logger.info(self.name + " Finished config_linkwidth_accept_state_downstream")

    async def config_lanenum_start_state_downstream(self):
        ...
    

    async def config_lanenum_wait_state_downstream(self):
        # assert 0 == 1
        pipe_seq_item_h = pipe_seq_item("pipe_seq_item_h")
        pipe_seq_item_h.randomize()
        num_of_detected_ts1s_with_same_link_number = []
        flag = Event()
        # two_ts1s_with_same_link_number_detected = 0
        pipe_base_seq
        pipe_seq_item_h.pipe_operation = pipe_operation_t.SEND_TSES
        uvm_root().logger.info(self.name + " Started config_lanenum_wait_state_downstream")
        # assert 1 == 0
        for i in range(len(self.tses_sent)):
            self.tses_sent[i].link_number = self.link_number
            self.tses_sent[i].lane_number = i
            self.tses_sent[i].use_link_number = 1
            self.tses_sent[i].use_lane_number = 1
            self.tses_sent[i].ts_type            = ts_type_t.TS1
        
        pipe_seq_item_h.tses_sent = self.tses_sent
        # Initialize the num_of_detected_ts1s_with_same_link_number array with zeros
        for i in range(len(self.dut.MAX_NUM_LANES)):
            num_of_detected_ts1s_with_same_link_number.append(0)
        
        # S ts1s with the generated link number until two ts1s are received with the same link number
        two_ts1s_with_same_link_number_detected = Event()

        async def send_tses():
            # for i in range(1):
            while  not two_ts1s_with_same_link_number_detected.is_set():
                await self.start_item(pipe_seq_item_h)
                await self.finish_item(pipe_seq_item_h)
                # await self.finish_item(pipe_seq_item_h)
                # await self.get_response(pipe_seq_item_h)
        
        async def count_ts1():
            two_ts1s_with_same_link_number_detected.clear()
            while  not two_ts1s_with_same_link_number_detected.is_set():
                await self.pipe_agent_config.detected_tses_e.wait()
                tses_received = self.pipe_agent_config.tses_received
                self.pipe_agent_config.detected_tses_e.clear()

                for i in range(int(self.dut.MAX_NUM_LANES.value)):
                    if(tses_received[i].ts_type == ts_type_t.TS1  and tses_received[i].use_link_number and
                    tses_received[i].link_number == self.link_number and tses_received[i].use_lane_number):
                        num_of_detected_ts1s_with_same_link_number[i] += 1
                    #uvm_root().logger.info(self.name + "TS1 with the same Link number received")
                    else:
                        num_of_detected_ts1s_with_same_link_number[i] = 0
                        print(tses_received[i].ts_type)
                        print(f"self link number : {hex(self.link_number)}")
                        print(tses_received[i].use_link_number)
                        print(tses_received[i].use_lane_number)
                        print(tses_received[i].link_number)

                # Check if any lane detected 2 cosecutive ts1s with the same link number
                for i in range(len(num_of_detected_ts1s_with_same_link_number)):
                    if(num_of_detected_ts1s_with_same_link_number[i] == 2):
                        two_ts1s_with_same_link_number_detected.set()
                    #uvm_root().logger.info(self.name + "2 Consecutive TS1s with Link no. that matches transmitted Link number are Detected")
                
        fork1 = cocotb.start_soon(send_tses())
        fork2 = cocotb.start_soon(count_ts1())
        await Combine(fork1 ,fork2)
        # assert 1 == 0
        two_ts1s_with_same_link_number_detected.clear()
        uvm_root().logger.info(self.name + " Finished config_linkwidth_accept_state_downstream")
    

    async def config_complete_state_downstream(self):
        # assert 1 == 0
        pipe_seq_item_h = pipe_seq_item("pipe_seq_item_h")
        num_of_ts2_received = []
        # eight_consecutive_ts2s_detected = 0
        flag = Event()
        uvm_root().logger.info(self.name + " Started config_complete_state_downstream")
        pipe_seq_item_h.pipe_operation = pipe_operation_t.SEND_TSES

        # Initialize the num_of_ts2_received array with zeros
        for i in range(int(self.dut.MAX_NUM_LANES.value)):
            num_of_ts2_received.append(0)
        
        
        pipe_seq_item_h.tses_sent = self.tses_sent

        # Transmit 16 TS2s until 8 consecutive TS2s are received
        self.eight_consecutive_ts2s_detected = Event()

        # for i in range(int(self.dut.MAX_NUM_LANES.value)):
        #     self.tses_sent[i].ts_type = ts_type_t.TS2


        async def items():
            while (not self.eight_consecutive_ts2s_detected.is_set()):  
                await self.start_item(pipe_seq_item_h)
                await self.finish_item(pipe_seq_item_h)
                if(flag.is_set()):
                    for i in range(int(self.dut.MAX_NUM_LANES.value)):
                        self.tses_sent[i].ts_type = ts_type_t.TS2

            #uvm_root().logger.info(self.name + "TS2 with the correct Link and Lane numbers sent")
            
            #uvm_root().logger.info(self.name + "16 TS2s with the correct Link and Lane numbers are Sent")

            # while (not self.eight_consecutive_ts2s_detected.is_set()):            
            #     await self.start_item(pipe_seq_item_h)
            #     await self.finish_item(pipe_seq_item_h)
        
        async def count_ts2():
            while (not self.eight_consecutive_ts2s_detected.is_set()):            
                await self.pipe_agent_config.detected_tses_e.wait()
                tses_received = self.pipe_agent_config.tses_received
                self.pipe_agent_config.detected_tses_e.clear()
                
                for i in range(int(self.dut.MAX_NUM_LANES.value)):
                    if(tses_received[i].ts_type == ts_type_t.TS2):
                        num_of_ts2_received[i] += 1
                        flag.set()
                        uvm_root().logger.info(self.name + "TS2 with the correct Link and Lane numbers received")
                    else:
                        uvm_root().logger.error(self.name + "TS2 with the incorrect Link and Lane numbers received")           
                        num_of_ts2_received[i] = 0
                    
                # Check if any lane detected 8 consecutive ts2s
                for i in range(int(self.dut.MAX_NUM_LANES.value)):
                    if(num_of_ts2_received[i] >= 4):
                        self.eight_consecutive_ts2s_detected.set()
                    #uvm_root().logger.info(self.name + "8 Consecutive TS2s with the correct Link and Lane numbers are Detected")
        self.eight_consecutive_ts2s_detected.clear()
        fork1 = cocotb.start_soon(items())
        fork2 = cocotb.start_soon(count_ts2())
        await Combine(fork1 ,fork2)
        for i in range(int(self.dut.MAX_NUM_LANES.value)):
            self.tses_sent[i].ts_type = ts_type_t.TS2
        self.eight_consecutive_ts2s_detected.clear()
        fork1 = cocotb.start_soon(items())
        fork2 = cocotb.start_soon(count_ts2()) 
        await Combine(fork1 ,fork2)
        # for i in range(int(self.dut.MAX_NUM_LANES.value)):
        #     self.tses_sent[i].ts_type = ts_type_t.TS1
        uvm_root().logger.info(self.name + "Finished config_complete_state_downstream")
        

    async def config_idle_state(self):
        # assert 1 == 0
        pipe_seq_item_h = pipe_seq_item("pipe_seq_item_h")
        one_idle_data_received = Event()
        uvm_root().logger.info(self.name + " Started config_idle_state")
        pipe_seq_item_h.pipe_operation = pipe_operation_t.IDLE_DATA_TRANSFER
        

        # Initialize the num_of_idle_data_received array with zeros
        num_of_idle_data_received = 0
        one_idle_data_received.clear()

        # Transmit 16 idle data until 8 consecutive idle data are received
        eight_consecutive_idle_data_detected = Event()

        async def idle_recieved():
            nonlocal one_idle_data_received
            await self.pipe_agent_config.idle_data_detected_e.wait()
            one_idle_data_received.set()
            self.pipe_agent_config.idle_data_detected_e.clear()
            uvm_root().logger.info(self.name + " one_idle_data_received = 1")        
            
        async def idle_items():
            ...
            for i in range(1000):
                await self.start_item(pipe_seq_item_h)
                await self.finish_item(pipe_seq_item_h)
            
        async def idle_send():
            ...
            while not eight_consecutive_idle_data_detected.is_set():
                await self.start_item(pipe_seq_item_h)
                await self.finish_item(pipe_seq_item_h)
            # nonlocal one_idle_data_received
            # pipe_seq_item_h = pipe_seq_item("pipe_seq_item_h")
            # await one_idle_data_received.wait()
            # # assert 1 == 0
            # for i in range(16):            
            #     await self.start_item(pipe_seq_item_h)
            #     pipe_seq_item_h.pipe_operation = pipe_operation_t.IDLE_DATA_TRANSFER
            #     await self.finish_item(pipe_seq_item_h)
            #     #uvm_root().logger.info(self.name + "idle data sent")
            # # one_idle_data_received.clear()
            # # assert 1 == 0
            # await self.start_item(pipe_seq_item_h)
            # # assert 1 == 0
            # pipe_seq_item_h.pipe_operation = pipe_operation_t.SEND_DATA
            # await self.finish_item(pipe_seq_item_h)
            # uvm_root().logger.info(self.name + " 16 Idle Data are Sent")
        

        async def idle_count():
            # nonlocal eight_consecutive_idle_data_detected
            nonlocal num_of_idle_data_received
            while not eight_consecutive_idle_data_detected.is_set():         
                await self.pipe_agent_config.idle_data_detected_e.wait()
                num_of_idle_data_received += 1
                uvm_root().logger.info(self.name + " idle data received")
                # self.pipe_agent_config.idle_data_detected_e.clear()

                # Check if 8 consecutive idle data detected
                if(num_of_idle_data_received >= 1):                
                    eight_consecutive_idle_data_detected.set()
                    uvm_root().logger.info(self.name + " 8 Consecutive Idle Data are Detected")
            
        
        # fork1 = cocotb.start_soon(idle_recieved())
        # fork2 = cocotb.start_soon(idle_items())
        fork3 = cocotb.start_soon(idle_send())
        fork4 = cocotb.start_soon(idle_count())
        await Combine(fork3,fork4)
        eight_consecutive_idle_data_detected.clear()
        cocotb.start_soon(idle_send())
        # await Timer(200,'ns')
        uvm_root().logger.info(self.name + " Finished config_idle_state")
