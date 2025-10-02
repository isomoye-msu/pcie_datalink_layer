# ==========================================================================
#
#  Morgan State University
#  Open Hardware Acceleration Lab (HAL-O)
#
#!  Project:   Open-Source PCIe Endpoint Controller.
#   File:      pipe_if.py
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
from cocotb.triggers import *
from cocotb_bus.bus import Bus

class sv_if(Bus):

    def __init__(self, entity, name, signals,
            optional_signals=[], bus_separator="_", array_idx=None):
        Bus.__init__(self, entity, name, signals, optional_signals,
                bus_separator, array_idx)


class pipe_if(sv_if):
    """
    Class: PIPE Interface

    Definition: Contains functions tasks and methods of this agent's virtual interface.
    """

    def __init__(self, dut, bus_map=None, name="pipe"):
        """
        Function: new

        Definition: pcie pipe interface

        Args:
          dut: The dut it connects to. Passed in by cocotb top.
          bus_map: Naming of the bus signals.
        """
        if bus_map is None:
            #  If NONE then create this as default.
            bus_map = {
                "clk": "clk",
                "reset": "reset" ,
                "phy_txdata"            :  "phy_txdata"        ,  
                "phy_txdata_valid"      :  "phy_txdata_valid"  , 
                "phy_txdatak"           :  "phy_txdatak"       , 
                "phy_txstart_block"     :  "phy_txstart_block" , 
                "phy_txsync_header"     :  "phy_txsync_header" , 
                "phy_rxdata"            :  "phy_rxdata"        , 
                "phy_rxdata_valid"      :  "phy_rxdata_valid"  , 
                "phy_rxdatak"           :  "phy_rxdatak"       , 
                "phy_rxstart_block"     :  "phy_rxstart_block" , 
                "phy_rxsync_header"     :  "phy_rxsync_header" ,       
                "phy_txdetectrx"        :  "phy_txdetectrx"      ,
                "phy_txelecidle"        :  "phy_txelecidle"      ,
                "phy_txcompliance"      :  "phy_txcompliance"    ,
                "phy_rxpolarity"        :  "phy_rxpolarity"      ,
                "phy_powerdown"         :  "phy_powerdown"       ,
                "phy_rate"              :  "phy_rate"            ,
                "phy_rxvalid"           :  "phy_rxvalid"         ,
                "phy_phystatus"         :  "phy_phystatus"       ,
                "phy_phystatus_rst"     :  "phy_phystatus_rst"   ,   
                "phy_rxelecidle"        :  "phy_rxelecidle"      ,   
                "phy_rxstatus"          :  "phy_rxstatus"        ,   
                "phy_txmargin"          :  "phy_txmargin"        ,   
                "phy_txswing"           :  "phy_txswing"         ,   
                "phy_txdeemph"          :  "phy_txdeemph"        ,   
                "phy_txeq_ctrl"         :  "phy_txeq_ctrl"       ,   
                "phy_txeq_preset"       :  "phy_txeq_preset"     ,   
                "phy_txeq_coeff"        :  "phy_txeq_coeff"      ,   
                "phy_txeq_fs"           :  "phy_txeq_fs"         ,   
                "phy_txeq_lf"           :  "phy_txeq_lf"         ,   
                "phy_txeq_new_coeff"    :  "phy_txeq_new_coeff"  ,
                "phy_txeq_done"         :  "phy_txeq_done"       ,
                "phy_rxeq_ctrl"         :  "phy_rxeq_ctrl"       ,
                "phy_rxeq_txpreset"     :  "phy_rxeq_txpreset"   ,
                "phy_rxeq_preset_sel"   :  "phy_rxeq_preset_sel" ,
                "phy_rxeq_new_txcoeff"  :  "phy_rxeq_new_txcoeff",
                "phy_rxeq_adapt_done"   :  "phy_rxeq_adapt_done" ,
                "phy_rxeq_done"         :  "phy_rxeq_done"       ,
                "as_mac_in_detect"      :  "as_mac_in_detect"    ,
                "as_cdr_hold_req"       :  "as_cdr_hold_req"     ,
                "tx_elec_idle"          :  "tx_elec_idle"        ,
                "phy_ready_en"          :  "phy_ready_en"              
            }
        super().__init__(dut, name, bus_map)
        self.rst = dut.rst
        # super().__init__(dut "" bus_map)

    async def start(self):
        await Timer(0)