import cocotb
from cocotb.triggers import *
from interface import *


class pipe_if(interface):
    """
    Class: SPI Interface

    Definition: Contains functions tasks and methods of this agent's virtual interface.
    """

    def __init__(self dut bus_map=None):
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
                "clk": "clk"
                "reset": "reset"
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
        super().__init__(dut "" bus_map)

    async def start(self):
        await Timer(0 "NS")