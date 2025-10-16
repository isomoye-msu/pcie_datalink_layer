# ==========================================================================
#
#  Morgan State University
#  Open Hardware Acceleration Lab (HAL-O)
#
#!  Project:   Open-Source PCIe Endpoint Controller.
#   File:      pipe_types.py
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

from enum import Enum
from cocotbext.pcie.core import *
from cocotbext.pcie.core.dllp import *
from cocotbext.pcie.core.tlp import *
from cocotb_coverage import crv

class ts_type_t(Enum):
    TS1 = 0
    TS2 = 1

class D_K_character(Enum):
    D=0,
    K=1
class gen_t(Enum):
    GEN1=1,
    GEN2=2,
    GEN3=3,
    GEN4=4,
    GEN5=5

class ts_s(crv.Randomized):
    def __init__(self):
        crv.Randomized.__init__(self)
        self.n_fts                   = 0
        self.use_n_fts               = 0
        self.link_number             = 0
        self.use_link_number         = 0
        self.lane_number             = 0
        self.use_lane_number         = 0
        self.max_gen_supported       = gen_t
        self.ts_type                 = ts_type_t
        self.speed_change            = 0                     # need to be added in the send/recv tasks
        self.auto_speed_change       = 0                # need to be added in the send/recv tasks
        self.rx_preset_hint          = 0                   # need to be added in the send/recv tasks
        self.tx_preset               = 0                        # need to be added in the send/recv tasks
        self.ec                      = 0                
        self.use_preset              = 0                
        self.lf_value                = 0                
        self.fs_value                = 0                
        self.pre_cursor              = 0                 
        self.cursor                  = 0                
        self.post_cursor             = 0                
        self.rcv                     = 0                
        self.equalization_command    = 0 
        self.TS_gen                  = 0              # equals zero in gen1,2 and one in gen3,4,5         

       
        self.add_rand("n_fts"                   ,list(range(0, 1000)))
        self.add_rand("use_n_fts"               ,list(range(0, 1000)))
        self.add_rand("link_number"             ,list(range(0, 1000)))
        self.add_rand("use_link_number"         ,list(range(0, 1000)))
        self.add_rand("lane_number"             ,list(range(0, 1000)))
        self.add_rand("use_lane_number"         ,list(range(0, 1000)))
        self.add_rand("max_gen_supported"       ,list(gen_t))
        self.add_rand("ts_type"                 ,list(ts_type_t))            
        self.add_rand("speed_change"            ,list(range(0, 1000)))                
        self.add_rand("auto_speed_change"       ,list(range(0, 1000)))
        self.add_rand("rx_preset_hint"          ,list(range(0, 1000)))
        self.add_rand("tx_preset"               ,list(range(0, 1000)))
        self.add_rand("ec"                      ,list(range(0, 1000)))
        self.add_rand("use_preset"              ,list(range(0, 1000)))
        self.add_rand("lf_value"                ,list(range(0, 1000)))
        self.add_rand("fs_value"                ,list(range(0, 1000)))
        self.add_rand("pre_cursor"              ,list(range(0, 1000)))
        self.add_rand("cursor"                  ,list(range(0, 1000)))
        self.add_rand("post_cursor"             ,list(range(0, 1000)))
        self.add_rand("rcv"                     ,list(range(0, 1000)))
        self.add_rand("equalization_command"    ,list(range(0, 1000)))
        self.add_rand("TS_gen"                  ,list(range(0, 1000)))






class  pipe_operation_t (Enum):
    TLP_TRANSFER  = 0 
    DLLP_TRANSFER  = 1
    IDLE_DATA_TRANSFER  =    2  
    LINK_UP     =   3
    ENTER_RECOVERY     = 4  
    SPEED_CHANGE     =    5       # speed change is used to direct the driver to change the speed using pipe signals
    RESET     =   6
    PCLK_RATE_CHANGE     = 7 
    WIDTH_CHANGE     =  8
    SEND_TS     =  9
    SEND_TSES     = 10 
    SEND_EIOS     =  11
    SEND_EIEOS     =  12
    SET_GEN     =  13
    SEND_DATA     =  14
    CHECK_EQ_PRESET_APPLIED     = 15 
    SET_EQ_PARAM     =  16
    ASSERT_EVAL_FEEDBACK_CHANGED  = 17
    SEND_SKP = 18
    SEND_MAC_TLP = 19


class pclk_rate_t(Enum):
    PCLK_62     = 0,
    PCLK_125    = 1,
    PCLK_250    = 2,
    PCLK_500    = 3,
    PCLK_1000   = 4,
    PCLK_2000   = 5,
    PCLK_4000   = 6

class  pipe_width_t (Enum):
    PIPE_WIDTH_8_BIT  = 0,
    PIPE_WIDTH_16_BIT = 1,
    PIPE_WIDTH_32_BIT = 2

class pipe_seq_item_s():
    def __init__(self) -> None:
        self.pipe_operation = pipe_operation_t()
        self.tlp            = Tlp()
        self.dllp           = Dllp()
        self.pipe_width     = pipe_width_t()
        self.pclk_rate      = pclk_rate_t()


STP_gen_1_2                = 0b1111_1011
SDP_gen_1_2                = 0b0101_1100
END_gen_1_2                = 0b1111_1101
EDB_gen_1_2                = 0b1111_0111
COM                        = 0b1011_1100

STP_gen_3                  = 0b1111

SDP_gen_3_symbol_0         = 0b0000_1111
SDP_gen_3_symbol_1         = 0b0011_0101

END_gen_3_symbol_0         = 0b1111_1000
END_gen_3_symbol_1         = 0b0000_0001
END_gen_3_symbol_2         = 0b0000_1001
END_gen_3_symbol_3         = 0b0000_0000

EDB_gen_3                  = 0b0000_0011 

NUM_OF_LANES = 16
MAX_GEN_FAR_PARTENER = 3

IS_ENV_UPSTREAM = 1

TLP_MIN_SIZE = 64
TLP_MAX_SIZE = 256


