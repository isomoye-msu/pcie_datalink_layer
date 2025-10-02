# ==========================================================================
#
#  Morgan State University
#  Open Hardware Acceleration Lab (HAL-O)
#
#!  Project:   Open-Source PCIe Endpoint Controller.
#   File:      pipe_agent.py
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
import random
from enum import Enum
from pyuvm import *
from cocotbext.pcie.core import *
from cocotbext.pcie.core.dllp import *
from cocotbext.pcie.core.tlp import *
from cocotb.triggers import *
from pipe_types import *
from cocotb_coverage import *
from cocotb_coverage import crv
from collections import deque


class pipe_seq_item(uvm_sequence_item,crv.Randomized):     
#******************************************************************************************/
#******************************** Class Implementation ************************************/
    # def randomize(self):
        # return super().randomize()
    def __init__(self, name = "pipe_seq_item"):
        super().__init__(name)
        crv.Randomized.__init__(self)
    

        self.tlp = Tlp()  # type: tlp_t  
        self.dllp = Dllp()  # type: dllp_t  
        self.pipe_width = None  # type: pipe_width_t  
        self.pclk_rate = None  # type: pclk_rate_t  
        self.gen = None  # type: gen_t  
        self.ts_sent = ts_s()  # type: ts_s  
        self.tses_sent = 0
        self.tlp_gen_1_2_no_of_bytes = 0  # type: int  
        self.pipe_operation = pipe_operation_t
        self.tlp_size = 0
        
        # print(pipe_operation_t._member_names_)
        self.add_rand("pipe_operation",list(pipe_operation_t))
        self.add_rand("tlp_size",list(range(0,4096)))
        # self.add_rand("dllp",list(Dllp))
        self.add_rand("tlp_gen_1_2_no_of_bytes",list(range(3,1000)))
        self.add_rand("pipe_width",list(range(0, 32)))
        self.add_rand("pclk_rate",list(pclk_rate_t))
        self.add_rand("gen",list(gen_t))
        # self.add_rand("ts_sent",list(ts_s))
        # self.add_rand("tses_sent",list(ts_s))-
        self.lf_usp = 0x0  # type: bit [5:0] 
        self.fs_usp = 0x0  # type: bit [5:0] 
        self.lf_dsp = 0x0  # type: bit [5:0] 
        self.fs_dsp = 0x0  # type: bit [5:0] 
        self.cursor = 0x0  # type: bit [5:0] 
        self.pre_cursor = 0x0  # type: bit [5:0] 
        self.post_cursor = 0x0  # type: bit [5:0] 
        self.rx_presetint = 0x0  # type: bit [2:0] 
        self.tx_preset = 0x0  # type: bit [3:0] 
        self.local_txPreset_coefficients = 0x0  # type: bit [17:0] 
        self.E = None  # type: TLP_MIN_SIZ  
        self.E = None  # type: TLP_MAX_SIZ  
        self.S = None  # type: NUM_OF_LANE  

        def c_1(tlp_gen_1_2_no_of_bytes):
            return 3 <= tlp_gen_1_2_no_of_bytes <= 1000

        def c_2(tlp_size):
            return TLP_MIN_SIZE <= tlp_size <= TLP_MAX_SIZE
        
        def c_3(tlp_gen_1_2_no_of_bytes,tlp_size):
            return tlp_size == 4*tlp_gen_1_2_no_of_bytes - 2
        
        def tses_sent_c(tses_sent):
            return tses_sent == NUM_OF_LANES
        
        self.add_constraint(c_1)
        self.add_constraint(c_2)
        self.add_constraint(c_3)
        # self.add_constraint(tses_sent_c)

    def post_randomize(self):
        self.tlp.length = self.tlp_size
        self.ts_sent.randomize()
        # self.pipe_operation = random.choice(pipe_operation_t())
        # return super().post_randomize()
    
        
    # def randomize(self):
    #     self.pipe_operation              = random.choice(list())
    #     self.tlp                         = random.choice(list(TlpType))
    #     self.dllp                        = random.choice(list(DllpType))
    #     self.tlp_gen_1_2_no_of_bytes     = random.randint(3,1000)
    #     self.pipe_width                  = random.randint(0, 32)
    #     self.pclk_rate                   =  random.choice(list(pclk_rate_t))
    #     self.gen                         = random.choice(list(gen_t))
    #     self.ts_sent                     = random.choice(list(ts_s))
    #     self.tses_sent                   = random.choice(list(ts_s))


class pipe_sequencer(uvm_sequencer):
    def __init__(self, name, parent):
        super().__init__(name, parent)

class pipe_coverage_monitor(uvm_component):
    
    	# `uvm_component_utils(pipe_coverage_monitor)
    #  pipe_seq_item pipe_seq_item
    
    #  uvm_analysis_imp_sent #(pipe_seq_item, pipe_coverage_monitor) analysis_export_sent
    #  uvm_analysis_imp_received #(pipe_seq_item, pipe_coverage_monitor) analysis_export_received
    
    
    #  pipe_seq_item_cov = coverage_section(; 
    #    write coverpoints
    #  ) # Close coverage section
    #  
    def __init__(self,name = "pipe_coverage_monitor", parent=None):
        super().__init__(name, parent)
        # self.pipe_seq_item_cov = covergroup()
        self.pipe_seq_item = None  # type: pipe_seq_item  
        self.t = None  # type: analysis_export_sen  
        self.d = None  # type: analysis_export_receive  
        self.pipe_seq_item_cov = None  # type: covergroup  

    # def write_sent(self, pipe_seq_item):
    #     self.pipe_seq_item = pipe_seq_item
    #     pipe_seq_item_cov.sample()

    # def write_received(self, pipe_seq_item):
    #     self.pipe_seq_item = pipe_seq_item
    #     pipe_seq_item_cov.sample()
       

    def build_phase(self):
        # uvm_info(get_name(), "Enter pipe_coverage_monitor build_phase", UVM_MEDIUM)
        self.analysis_export_sent = uvm_analysis_port("analysis_export_sent", self)
        self.analysis_export_received = uvm_analysis_port("analysis_export_received", self)
        # uvm_info(get_name(), "Exit pipe_coverage_monitor build_phase", UVM_MEDIUM)
     


    def report_phase(self):
        ...
        #write function

    def write_lpif_received(self):
        ...
    
    def write_pipe_received(self):
        ...



class pipe_monitor(uvm_monitor):

    def __init__(self, name = "pipe_monitor", parent=None):
        super().__init__(name, parent)
        self.pipe_monitor_bfm = None  # type: pipe_monitor_bfm_param  
        self.tlp_monitor_bfm = None  # type: pipe_monitor_bfm_param  
        self.pipe_agent_config = None  # type: pipe_agent_config  
        self.name = name
        self.ap_sent = uvm_analysis_port("ap_sent", self)
        self.ap_received = uvm_analysis_port("ap_received", self)
    
    def build_phase(self) :
        #uvm_info(get_name(), "Enter pipe_monitor build_phase", UVM_MEDIUM)
        super().build_phase()
        #uvm_info(get_name(), "Exit pipe_monitor build_phase", UVM_MEDIUM)
    

    def connect_phase(self) :
        super().connect_phase()
        #uvm_info(get_name(), "Enter pipe_monitor connect_phase", UVM_MEDIUM)
        self.pipe_monitor_bfm = self.pipe_agent_config.pipe_monitor_bfm_h
        self.pipe_monitor_bfm.proxy = self
        self.pipe_monitor_bfm.build_connect_finished_e.set()
        self.tlp_monitor_bfm = self.pipe_agent_config.tlp_monitor_bfm_h
        self.tlp_monitor_bfm.proxy = self
        #uvm_info(get_name(), "Exit pipe_monitor connect_phase", UVM_MEDIUM)
    async def run_phase(self):
        cocotb.start_soon(self.pipe_monitor_bfm.start())
        cocotb.start_soon(self.tlp_monitor_bfm.start())
        
    async def detect_posedge_clk(self): 
        self.pipe_agent_config.detected_posedge_clk_e.set()

    async def detect_link_up(self):  # task
        self.pipe_seq_item = pipe_seq_item("pipe_seq_item")
        # self.pipe_seq_item = pipe_seq_item("pipe_seq_item")
        # Wait till the sequence finishes the link up
        await self.pipe_agent_config.link_up_finished_e.wait()
        # await RisingEdge(pipe_agent_config.link_up_finished_e) or 
        # FallingEdge(pipe_agent_config.link_up_finished_e)
        # Determining the detected operation
        self.pipe_seq_item.pipe_operation = "LINK_UP"
        # Sending the sequence item to the analysis components
        self.ap_received.write(self.pipe_seq_item)

    async def  exit_electricle_idle(self):  # task
        ...
        #pipe_monitor_bfm.detected_exit_electricle_idle.set()= pipe_agent_config.detected_exit_electricle_idle_e
        #self.pipe_agent_config.detected_exit_electricle_idle_e
        #self.pipe_monitor_bfm.detected_exit_electricle_idle_e

    async def  power_down_change(self):  # task
        ...
        #pipe_monitor_bfm.detected_power_down_change.set()= pipe_agent_config.power_down_change_e
        #self.pipe_agent_config.power_down_change_e
        #self.pipe_monitor_bfm.detected_power_down_change_e
        ##uvm_info("pipe_monitor_bfm", "Powerdown= P0 detected in monitor ", UVM_LOW)

    def notify_tses_received(self,tses) :
        self.pipe_agent_config.tses_received = tses
        self.pipe_agent_config.detected_tses_e.set()
        
    def notify_eieos_received(self) :
        self.pipe_agent_config.detected_eieos_e.set()
    
    def notify_eieos_gen3_received(self) :
        self.pipe_agent_config.detected_eieos_gen3_e.set()
        
    def notify_eios_received(self) :
        self.pipe_agent_config.detected_eios_e.set()
   
    def notify_eios_gen3_received(self) :
        self.pipe_agent_config.detected_eios_gen3_e.set()
        
    def notify_TxElecIdle_and_RxStandby_asserted(self) :
        self.pipe_agent_config.detected_TxElecIdle_and_RxStandby_asserted_e.set()


    def notify_width_changed(self, new_width) :
        self.pipe_agent_config.new_width = new_width
        self.pipe_agent_config.detected_width_change_e.set()

    def notify_PCLKRate_changed(self, new_PCLKRate) :
    
        self.pipe_agent_config.new_PCLKRate = new_PCLKRate
        self.pipe_agent_config.detected_PCLKRate_change_e.set()
        
    def notify_Rate_changed(self, new_Rate) :
    
        self.pipe_agent_config.new_Rate =new_Rate
        self.pipe_agent_config.detected_Rate_change_e.set()
 
    def notify_TxDeemph_changed(self, new_TxDeemph) :
        
        self.pipe_agent_config.new_TxDeemph = new_TxDeemph
        self.pipe_agent_config.detected_TxDeemph_change_e.set()

    def notify_link_up_sent(self) :
      # Creating the sequnce item
    
      pipe_seq_item = pipe_seq_item("pipe_seq_item")
      # Determining the detected operation
      pipe_seq_item.pipe_operation = "LINK_UP"
      # Sending the sequence item to the analysis components
      self.ap_sent.write(pipe_seq_item)
    

    def notify_link_up_received(self) :
      # Creating the sequnce item
      pipe_seq_item = pipe_seq_item("pipe_seq_item")
      # Determining the detected operation
      pipe_seq_item.pipe_operation = "LINK_UP"
      # Sending the sequence item to the analysis components
      self.ap_received.write(pipe_seq_item)
    

    def notify_tlp_sent(self,tlp) :
    # Creating the sequnce item
        # self.pipe_seq_item pipe_seq_item
        pipe_seq_item = pipe_seq_item("pipe_seq_item")
        # Determining the detected operation
        pipe_seq_item.pipe_operation = "TLP_TRANSFER"
        # Copying the data of the tlp to the sequence item
        pipe_seq_item.tlp = tlp
        # Sending the sequence item to the analysis components
        self.ap_sent.write(pipe_seq_item)
    #uvm_info(get_name(), "notify tlp_sent", UVM_MEDIUM)
    #uvm_info(get_name(), sv.sformatf("tlp_sent_size = %d",len(tlp)), UVM_MEDIUM)

    def notify_tlp_received(self,tlp) :
        # Creating the sequnce item
        self.pipe_agent_config.tlp_received.append(tlp)
        self.pipe_agent_config.tlp_data_detected_e.set()
        #uvm_info(get_name(), "notify tlp_rec", UVM_MEDIUM)
        #uvm_info(get_name(), sv.sformatf("tlp_rec_size = %d",len(tlp)), UVM_MEDIUM)
        

    def notify_dllp_sent(self,dllp) :
        # Creating the sequnce item
        # pipe_seq_item pipe_seq_item
        pipe_seq_item = pipe_seq_item("pipe_seq_item")
        # Determining the detected operation
        pipe_seq_item.pipe_operation = "DLLP_TRANSFER"
        # Copying the data of the tlp to the sequence item
        pipe_seq_item.dllp = dllp
        # Sending the sequence item to the analysis components
        self.ap_sent.write(pipe_seq_item)
        #uvm_info(get_name(), sv.sformatf( "notify dllp_sent: %p", dllp), UVM_MEDIUM)

    def notify_mac_tlp_received(self,tlp):
        self.pipe_agent_config.mac_tlp_received.append(tlp)
        self.pipe_agent_config.mac_tlp_data_detected_e.set()


    def notify_dllp_received(self,dllp) :
        # Creating the sequnce item
        # self.pipe_seq_item pipe_seq_item
        # pipe_seq_item = pipe_seq_item("pipe_seq_item")
        # Determining the detected operation
        # pipe_seq_item.pipe_operation = "DLLP_TRANSFER"
        # Copying the data of the tlp to the sequence item
        # pipe_seq_item.dllp = dllp
        # Sending the sequence item to the analysis components
        # self.ap_received.write(pipe_seq_item)
        #uvm_info(get_name(), "notify dllp_rec", UVM_MEDIUM)
        self.pipe_agent_config.dllp_received.append(dllp)
        self.pipe_agent_config.dllp_data_detected_e.set()
        # await self.pipe_agent_config.dllp_data_read_e.wait()
        # self.pipe_agent_config.dllp_data_read_e.clear()
        
        # assert 1 == 0

    def notify_enter_recovery_sent(self):
        # Creating the sequnce item
        
        pipe_seq_item = pipe_seq_item("pipe_seq_item")
        # Determining the detected operation
        pipe_seq_item.pipe_operation = "ENTER_RECOVERY"
        # Sending the sequence item to the analysis components
        self.ap_sent.write(pipe_seq_item)


    async def notify_enter_recovery_received(self):
        
        pipe_seq_item = pipe_seq_item("pipe_seq_item")
        # Wait till the sequence finishes the link up
        await self.pipe_agent_config.recovery_finished_e.is_set()
        #   @(pipe_agent_config.recovery_finished_e)
        # Determining the detected operation
        pipe_seq_item.pipe_operation = "ENTER_RECOVERY"
        # Sending the sequence item to the analysis components
        self.ap_received.write(pipe_seq_item)
        self.pipe_agent_config.recovery_finished_e.clear()


    def notify_gen_change_sent(self, gen) :
        # Creating the sequnce item
        
        pipe_seq_item = pipe_seq_item("pipe_seq_item")
        # Determining the detected operation
        pipe_seq_item.pipe_operation = "SPEED_CHANGE"
        # Copying the value of the generation to the sequence item
        pipe_seq_item.gen = gen
        # Sending the sequence item to the analysis components
        self.ap_sent.write(pipe_seq_item)
    

    def notify_gen_change_received(self, gen) :
        # Creating the sequnce item
        pipe_seq_item = pipe_seq_item("pipe_seq_item")
        # Determining the detected operation
        pipe_seq_item.pipe_operation = "SPEED_CHANGE"
        # Copying the value of the generation to the sequence item
        pipe_seq_item.gen = gen
        # Sending the sequence item to the analysis components
        self.ap_received.write(pipe_seq_item)

    def notify_reset_detected(self):
        # Creating the sequnce item
        # pipe_seq_item pipe_seq_item
        pipe_seq_item = pipe_seq_item("pipe_seq_item")
        # Determining the detected operation
        pipe_seq_item.pipe_operation = "RESET"
        # Sending the sequence item to the analysis components
        self.ap_received.write(pipe_seq_item)
        self.pipe_agent_config.reset_detected_e.set()
        

    def notify_receiver_detected(self) :
        self.pipe_agent_config.receiver_detected_e.set()

    def notify_pclk_rate_change_sent(self, pclk_rate) :
        # Creating the sequnce item
        # pipe_seq_item pipe_seq_item
        pipe_seq_item = pipe_seq_item("pipe_seq_item")
        # Determining the detected operation
        pipe_seq_item.pipe_operation = "PCLK_RATE_CHANGE"
        # Copying the value of the PCLK rate to the sequence item
        pipe_seq_item.pclk_rate = pclk_rate
        # Sending the sequence item to the analysis components
        self.ap_sent.write(pipe_seq_item)
    

    def notify_pclk_rate_change_received(self, pclk_rate) :
        # Creating the sequnce item
        # pipe_seq_item pipe_seq_item
        pipe_seq_item_h = pipe_seq_item("pipe_seq_item")
        # Determining the detected operation
        pipe_seq_item_h.pipe_operation = "PCLK_RATE_CHANGE"
        # Copying the value of the PCLK rate to the sequence item
        pipe_seq_item_h.pclk_rate = pclk_rate
        # Sending the sequence item to the analysis components
        self.ap_received.write(pipe_seq_item_h)
    

    def DUT_polling_state_start(self) :
        uvm_root().logger.info(self.name + " " + "DUT_polling_state_start is called")
    #`uvm_info (get_type_name (), sv.sformatf ("DUT_polling_state_start is called"), UVM_MEDIUM)
        self.pipe_agent_config.DUT_start_polling_e.set()


    def notify_idle_data_received(self) :
        # Creating the sequnce item
        # pipe_seq_item pipe_seq_item
        pipe_seq_item_h = pipe_seq_item("pipe_seq_item")
        # Determining the detected operation
        pipe_seq_item_h.pipe_operation = "IDLE_DATA_TRANSFER"
        # Sending the sequence item to the analysis components
        self.ap_received.write(pipe_seq_item_h)
        #uvm_info("pipe_monitor", "idle gat_tx", UVM_MEDIUM)
        #`uvm_info (get_type_name (), sv.sformatf ("notify_idle_data_received is called"), UVM_MEDIUM)
        self.pipe_agent_config.idle_data_detected_e.set()
        #`uvm_info (get_type_name (), sv.sformatf ("idle_event_triggered"), UVM_MEDIUM)

    def notify_idle_data_sent(self):
        # Creating the sequnce item
        # pipe_seq_item pipe_seq_item
        pipe_seq_item = pipe_seq_item("pipe_seq_item")
        # Determining the detected operation
        pipe_seq_item.pipe_operation = "IDLE_DATA_TRANSFER"
        # Sending the sequence item to the analysis components
        self.ap_received.write(pipe_seq_item)
        #uvm_info("pipe_monitor", "idle gat", UVM_MEDIUM)

    def notify_fc_initialized(self):
        self.pipe_agent_config.fc_initialized.set()
    




class pipe_driver(uvm_driver): #(pipe_seq_item)
    
        
    def __init__(self, name = "pipe_driver", parent=None):
        self.pipe_driver_bfm = None  # type: pipe_driver_bfm_param  
        self.tlp_driver_bfm  = None
        self.pipe_agent_config = None  # type: pipe_agent_config  
        super().__init__(name, parent)


    def build_phase(self):
        super().build_phase()
        # uvm_info(get_name(), "Enter pipe_driver build_phase", UVM_MEDIUM)
        # uvm_info(get_name(), "Exit pipe_driver build_phase", UVM_MEDIUM)
        

    def connect_phase(self):
        super().connect_phase()
        # uvm_info(get_name(), "Enter pipe_driver connect_phase", UVM_MEDIUM)
        self.pipe_driver_bfm = self.pipe_agent_config.pipe_driver_bfm_h
        self.tlp_driver_bfm = self.pipe_agent_config.tlp_driver_bfm_h
        # uvm_info(get_name(), "Exit pipe_driver connect_phase", UVM_MEDIUM)
    

    async def run_phase(self):  # task
        cocotb.start_soon(self.pipe_driver_bfm.start())
        # assert 1 == 0
        # pipe_seq_item pipe_seq_item
        # pipe_seq_item_h = pipe_seq_item()
        # uvm_info(get_name(), "Enter pipe_driver run_phase", UVM_MEDIUM)
        while True:
            pipe_seq_item_h = await self.seq_item_port.get_next_item()
            # print(pipe_seq_item_h)
            # print(pipe_seq_item_h)
            # print(pipe_seq_item_h.pipe_operation.name)
            # print(repr(pipe_seq_item_h.))
            # assert 1 == 0
            # if isinstance(pipe_seq_item_h,pipe_seq_item):
            #     print("is pipe seq item")
            # assert 1 == 0
            match pipe_seq_item_h.pipe_operation:
                case pipe_operation_t.SEND_TS: 
                    # assert 1 == 0
                    await self.pipe_driver_bfm.send_ts(pipe_seq_item_h.ts_sent)
                    self.seq_item_port.item_done()
                case pipe_operation_t.SEND_TSES: 
                    await self.pipe_driver_bfm.send_tses(pipe_seq_item_h.tses_sent)
                    self.seq_item_port.item_done()
                case pipe_operation_t.SEND_EIOS:
                    await self.pipe_driver_bfm.send_eios()
                    self.seq_item_port.item_done()
                case pipe_operation_t.SEND_EIEOS:
                    await self.pipe_driver_bfm.send_eieos()
                    self.seq_item_port.item_done()
                case pipe_operation_t.SET_GEN:
                    self.pipe_driver_bfm.current_gen=pipe_seq_item_h.gen
                    self.seq_item_port.item_done()
                case pipe_operation_t.SEND_DATA: 
                    # assert 1 == 0
                    await self.pipe_driver_bfm.send_data()
                    self.seq_item_port.item_done()
                case pipe_operation_t.IDLE_DATA_TRANSFER: 
                    await self.pipe_driver_bfm.send_idle_data()
                    self.seq_item_port.item_done()
                case pipe_operation_t.TLP_TRANSFER: 
                    await self.pipe_driver_bfm.send_tlp(pipe_seq_item_h.tlp)
                    self.seq_item_port.item_done()
                case pipe_operation_t.DLLP_TRANSFER: 
                    await self.pipe_driver_bfm.send_dllp(pipe_seq_item_h.dllp)
                    self.seq_item_port.item_done()
                case pipe_operation_t.SEND_SKP: 
                    await self.pipe_driver_bfm.send_skp()
                    self.seq_item_port.item_done()
                case pipe_operation_t.SEND_MAC_TLP: 
                    await self.tlp_driver_bfm.send_tlp(pipe_seq_item_h.tlp)
                    self.seq_item_port.item_done()
                # PCLK_RATE_CHANGE: pipe_driver_bfm.change_pclk_rate(pipe_seq_item.pclk_rate)
                # WIDTH_CHANGE: pipe_driver_bfm.change_width(pipe_seq_item.pipe_width)
                # SPEED_CHANGE: pipe_driver_bfm.change_speed()
                case pipe_operation_t.CHECK_EQ_PRESET_APPLIED: 
                    self.pipe_driver_bfm.equalization_preset_applied()
                    self.seq_item_port.item_done()
                case pipe_operation_t.SET_EQ_PARAM:
                    self.pipe_driver_bfm.set_eq_param(  pipe_seq_item_h.lf_usp,
                                                            pipe_seq_item_h.fs_usp,
                                                            pipe_seq_item_h.lf_dsp,
                                                            pipe_seq_item_h.fs_dsp,
                                                            pipe_seq_item_h.cursor,
                                                            pipe_seq_item_h.pre_cursor,
                                                            pipe_seq_item_h.post_cursor,
                                                            pipe_seq_item_h.tx_preset,
                                                            pipe_seq_item_h.rx_presetint,
                                                            pipe_seq_item_h.local_txPreset_coefficients)
                    self.seq_item_port.item_done()
                #SEND_IDLE_DATA: pipe_driver_bfm.send_idle_data(pipe_seq_item_h.start_lane, pipe_seq_item_h.end_lane)
                case pipe_operation_t.ASSERT_EVAL_FEEDBACK_CHANGED:
                    assert(self.pipe_driver_bfm.eval_feedback_was_asserted == 1)
                    self.seq_item_port.item_done()
                    # "Link eval feedback wasn't asserted"      
            # self.seq_item_port.item_done()
            if pipe_seq_item_h.pipe_operation != pipe_operation_t.IDLE_DATA_TRANSFER:
                uvm_root().logger.info(f"Exit pipe_driver run_phase: {pipe_seq_item_h.pipe_operation}")


class pipe_agent(uvm_agent):

    def __init__(self, name = "pipe_agent", parent=None):
        super().__init__(name, parent)
        # self.driver_t = pipe_driver()  # type: pipe_driver  
        # self.monitor_t = pipe_monitor()  # type: pipe_monitor  
        # self.sequencer_t =  pipe_sequencer()  # type: pipe_sequencer  
        self.pipe_coverage_monitor = None  # type: pipe_coverage_monitor  
        self.pipe_agent_config = None  # type: pipe_agent_config  
        self.t = None  # type: ap_sen  
        self.d = None  # type: ap_receive  
        self.name = name
        self.logger.info(name + " agent initiated")  

    def build_phase(self):
        # uvm_info(get_name(), "Building pipe agent", `COMPONENT_STRUCTURE_VERBOSITY)
        # Get configuration object from UVM database
        # seqr = ConfigDB().get(None, "", "SEQR")
        self.pipe_agent_config = ConfigDB().get(self, "", "pipe_agent_config_h")
        if (not self.pipe_agent_config):
            self.logger.error(self.get_name(), "Can't get PIPE Agent configuration object")
        
        self.ap_sent = uvm_analysis_port("ap_sent", self)
        self.ap_received = uvm_analysis_port("ap_received", self)
        
        # creating standard objects in every agent (Monitor, Analysis Port)
        self.pipe_monitor = pipe_monitor("pipe_monitor", self)
        self.pipe_monitor.pipe_agent_config = self.pipe_agent_config

        # check if the agent is configured to have coverage monitor
        if(self.pipe_agent_config.has_coverage_monitor):
            self.pipe_coverage_monitor = pipe_coverage_monitor("pipe_coverage_monitor", self)
        
        # check if the agent is configured to be active (have a driver)
        if(self.pipe_agent_config.is_active ==  uvm_active_passive_enum.UVM_ACTIVE):
            self.pipe_driver = pipe_driver("pipe_driver", self)
            self.pipe_driver.pipe_agent_config = self.pipe_agent_config
            self.pipe_sequencer = pipe_sequencer("pipe_sequencer", self)
            ConfigDB().set(None, "*", "pipe_sequencer", self.pipe_sequencer)
        
    
    def connect_phase(self):
        super().connect_phase()
        # uvm_info(get_name(), "Pipe agent connect phase", `COMPONENT_STRUCTURE_VERBOSITY)
        # connecting monitor analysis port by the agent analysis port
        self.pipe_monitor.ap_sent.connect(self.ap_sent)
        self.pipe_monitor.ap_received.connect(self.ap_received)


        if(self.pipe_agent_config.has_coverage_monitor): 
            self.pipe_monitor.ap_received.connect(self.pipe_coverage_monitor.analysis_export_received)
            self.pipe_monitor.ap_sent.connect(self.pipe_coverage_monitor.analysis_export_sent)
        
        # check ig agent is active
        if(self.pipe_agent_config.is_active ==  uvm_active_passive_enum.UVM_ACTIVE):
            # connecting driver sequence item port with the driver sequence item export
            self.pipe_driver.seq_item_port.connect(self.pipe_sequencer.seq_item_export)
            self.logger.info(self.name + " Connect phase of pipe agent finished")  