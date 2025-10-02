# ==========================================================================
#
#  Morgan State University
#  Open Hardware Acceleration Lab (HAL-O)
#
#!  Project:   Open-Source PCIe Endpoint Controller.
#   File:      pipe_agent_config.py
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
from pyuvm import *
from cocotb.triggers import *
from pipe_driver_bfm import *
from pipe_monitor_bfm import *
from tlp_driver_bfm import *
from tlp_monitor_bfm import *

class pipe_agent_config(uvm_component):
     
    def __init__(self,name = "", parent = None):
        super().__init__(name,parent)
        self.pipe_driver_bfm_h = pipe_driver_bfm("pipe_driver_bfm")  # type: pipe_driver_bfm_param  
        self.pipe_monitor_bfm_h = pipe_monitor_bfm("pipe_monitor_bfm")  # type: pipe_monitor_bfm_param
        self.tlp_driver_bfm_h = tlp_driver_bfm("tlp_driver_bfm")  
        self.tlp_monitor_bfm_h = tlp_monitor_bfm("tlp_monitor_bfm")  
        self.is_active =  uvm_active_passive_enum.UVM_ACTIVE  # type: uvm_active_passive_enum  
        self.has_coverage_monitor =  1  # type: bit  
        self.tses_received = [] 
        self.dllp_received = []
        self.tlp_received = []
        self.mac_tlp_received = []
        self.fc_initialized = Event()
        self.name = name
        self.new_width = None  # type: logic [1:0] 
        self.new_PCLKRate = 0.25  # type: logic [4:0] 
        self.new_Rate = None  # type: logic [3:0] 
        self.new_TxDeemph = None  # type: logic [17:0] 
        self.detected_tses_e = Event('detected_tses_e')  # type: event  
        self.detected_eieos_e = Event('detected_eieos_e')  # type: event  
        self.detected_eieos_gen3_e = Event('detected_eieos_gen3_e')  # type: event  
        self.detected_eios_e = Event('detected_eios_e')  # type: event  
        self.detected_eios_gen3_e = Event('detected_eios_gen3_e')  # type: event  
        self.detected_TxElecIdle_and_RxStandby_asserted_e = Event('detected_TxElecIdle_and_RxStandby_asserted_e')  # type: event  
        self.detected_width_change_e = Event('detected_width_change_e')  # type: event  
        self.detected_PCLKRate_change_e = Event('detected_PCLKRate_change_e')  # type: event  
        self.detected_Rate_change_e = Event('detected_Rate_change_e')  # type: event  
        self.detected_TxDeemph_change_e = Event('detected_TxDeemph_change_e')  # type: event  
        self.reset_detected_e = Event('reset_detected_e')  # type: event  
        self.receiver_detected_e = Event('receiver_detected_e')  # type: event  
        self.link_up_finished_e = Event('link_up_finished_e')  # type: event  
        self.recovery_finished_e = Event('recovery_finished_e')  # type: event  
        self.DUT_start_polling_e = Event('DUT_start_polling_e')  # type: event  
        self.reset_finished_e = Event('reset_finished_e')  # type: event  
        self.idle_data_detected_e = Event('idle_data_detected_e')  # type: event
        self.dllp_data_detected_e = Event('dllp_data_detected_e')  # type: event  
        self.dllp_data_read_e = Event('dllp_data_read_e')  # type: event   
        self.tlp_data_detected_e = Event('tlp_data_detected_e')  # type: event  
        self.tlp_data_read_e = Event('tlp_data_read_e')  # type: event   
        self.mac_tlp_data_detected_e = Event('mac_tlp_data_read_e')  # type: event   
        self.detected_posedge_clk_e = Event('detected_posedge_clk_e')  # type: event  
        self.detected_exit_electricle_idle_e = Event('detected_exit_electricle_idle_e')  # type: event  
        self.power_down_change_e = Event('power_down_change_e')  # type: event  