# ==========================================================================
#
#  Morgan State University
#  Open Hardware Acceleration Lab (HAL-O)
#
#!  Project:   Open-Source PCIe Endpoint Controller.
#   File:      descrambler_scrambler.py
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

from typing import Dict, Union, Set
from pipe_types import *
from cocotb.types import Bit,Logic, LogicArray

def SB(var,bit_no,val):
    return var | (val & 1) << bit_no


def GB(var,bit_no):
    return ((var >> bit_no) & 1)

class scrambler_s():
    def __init__(self, initial_state=0xFFFF):
        # PCIe scrambler uses a 16-bit LFSR
        self.state_1_2 = [1] * 16  # Ensure 16-bit state
    
    def _next_bit(self):
        # G(x) = x^5 + x^3 + 1 => feedback = x^4 XOR x^2
        feedback = self.lfsr[4] ^ self.lfsr[2]
        self.state_1_2 = [feedback] + self.lfsr[:-1]
        return self.lfsr[0]

    def get_scrambler_state(self):
        return sum((bit << i) for i, bit in enumerate(self.state_1_2))


    def scramble_byte(self, byte):
        data_in = [(byte >> i) & 1 for i in range(16)]
        result = 0
        lfsr_q = self.state_1_2
        temp = [0] * 16
        data_c = [0] * 16
        temp[0]  = lfsr_q[8]
        temp[1]  = lfsr_q[9]
        temp[2]  = lfsr_q[10]
        temp[3]  = lfsr_q[8] ^ lfsr_q[11]
        temp[4]  = lfsr_q[8] ^ lfsr_q[9] ^ lfsr_q[12]
        temp[5]  = lfsr_q[8] ^ lfsr_q[9] ^ lfsr_q[10] ^ lfsr_q[13]
        temp[6]  = lfsr_q[9] ^ lfsr_q[10] ^ lfsr_q[11] ^ lfsr_q[14]
        temp[7]  = lfsr_q[10] ^ lfsr_q[11] ^ lfsr_q[12] ^ lfsr_q[15]
        temp[8]  = lfsr_q[0] ^ lfsr_q[11] ^ lfsr_q[12] ^ lfsr_q[13]
        temp[9]  = lfsr_q[1] ^ lfsr_q[12] ^ lfsr_q[13] ^ lfsr_q[14]
        temp[10] = lfsr_q[2] ^ lfsr_q[13] ^ lfsr_q[14] ^ lfsr_q[15]
        temp[11] = lfsr_q[3] ^ lfsr_q[14] ^ lfsr_q[15]
        temp[12] = lfsr_q[4] ^ lfsr_q[15]
        temp[13] = lfsr_q[5]
        temp[14] = lfsr_q[6]
        temp[15] = lfsr_q[7]

        data_c[0] = data_in[0] ^ lfsr_q[15];
        data_c[1] = data_in[1] ^ lfsr_q[14];
        data_c[2] = data_in[2] ^ lfsr_q[13];
        data_c[3] = data_in[3] ^ lfsr_q[12];
        data_c[4] = data_in[4] ^ lfsr_q[11];
        data_c[5] = data_in[5] ^ lfsr_q[10];
        data_c[6] = data_in[6] ^ lfsr_q[9];
        data_c[7] = data_in[7] ^ lfsr_q[8];

        self.state_1_2 = temp

        return sum((bit << i) for i, bit in enumerate(data_c))


    def scramble_data(self, data_bytes):
        return bytes([self.scramble_byte(b) for b in data_bytes])

    def reverse_mask(self, x):
        x = ((x & 0x55555555) << 1) | ((x & 0xAAAAAAAA) >> 1)
        x = ((x & 0x33333333) << 2) | ((x & 0xCCCCCCCC) >> 2)
        x = ((x & 0x0F0F0F0F) << 4) | ((x & 0xF0F0F0F0) >> 4)
        x = ((x & 0x00FF00FF) << 8) | ((x & 0xFF00FF00) >> 8)
        x = ((x & 0x0000FFFF) << 16) | ((x & 0xFFFF0000) >> 16)
        return x


    def reset_lfsr (self,current_gen):
        if (current_gen == gen_t.GEN1  or  current_gen == gen_t.GEN2):
            # print(len(scrambler))
            self.state_1_2 = [1] * 16
            # temp_scrambler = scrambler
            # for i in range(len(scrambler)):
            #     temp_scrambler[i].lfsr_1_2 = 0xFFFF
            # for scramble in scrambler:
            #     scramble.lfsr_1_2 = 0xFFFF
                # print(scramble)
                # scramble.lfsr_1_2 = 0xFFFF
            # for  in range(len(scrambler)):
            #     scrambler[i].lfsr_1_2 = 0xFFFF

        elif (current_gen == gen_t.GEN3  or  current_gen == gen_t.GEN4  or  current_gen == gen_t.GEN5):
            for i in range(len(scrambler)):
                j=i
                if (i>7):
                    j=j-8
                match (j):
                    case 0 : 
                        scrambler.lfsr_gen_3[i] =  0x1DBFBC
                    case 1 : 
                        scrambler.lfsr_gen_3[i] =  0x0607BB
                    case 2 : 
                        scrambler.lfsr_gen_3[i] =  0x1EC760
                    case 3 : 
                        scrambler.lfsr_gen_3[i] =  0x18C0DB
                    case 4 : 
                        scrambler.lfsr_gen_3[i] =  0x010F12
                    case 5 : 
                        scrambler.lfsr_gen_3[i] =  0x19CFC9
                    case 6 : 
                        scrambler.lfsr_gen_3[i] =  0x0277CE
                    case 7 : 
                        scrambler.lfsr_gen_3[i] =  0x1BB807
        return 1
        
        
    def scramble(scrambler,in_data, lane_num, current_gen):
        if (current_gen == gen_t.GEN1  or  current_gen == gen_t.GEN2):
            return scramble_gen_1_2 (scrambler, in_data,  lane_num)
        elif (current_gen == gen_t.GEN3  or  current_gen == gen_t.GEN4  or  current_gen == gen_t.GEN5):
            return scramble_gen_3_4_5 (scrambler, in_data, lane_num)

    # def descramble(scrambler, in_data, lane_num, current_gen):
    #     if (current_gen == gen_t.GEN1  or  current_gen == gen_t.GEN2):
    #         return scramble_gen_1_2 (scrambler, in_data,  lane_num)
    #     elif (current_gen == gen_t.GEN3  or  current_gen == gen_t.GEN4  or  current_gen == gen_t.GEN5):
    #         return scramble_gen_3_4_5 (scrambler, in_data, lane_num)

    def scramble_gen_1_2 (scrambler, in_data, lane_num):
        lfsr_new = 0x00
        scrambled_data = 0x00
        print("input data " + str(in_data))
        scrambled_byte = 0
        # print(scrambler)
        # for bit in range(8):
        #     lfsr_bit = (scrambler.lfsr_1_2 >> 14) ^ (scrambler.lfsr_1_2 >> 15) & 1
        #     scrambled_bit = ((in_data >> bit) & 1) ^ lfsr_bit
        #     scrambled_byte |= (scrambled_bit << bit)
            
        #     # Update the LFSR
        #     scrambler.lfsr_1_2 = ((scrambler.lfsr_1_2 << 1) | lfsr_bit) & 0xFFFF
        # print(f" input data: {in_data}, output data " + str(scrambled_byte))

        # return scrambler, scrambled_byte

        # LFSR value after 8 serial clocks
        for i in range(8):
            lfsr_new |= (scrambler.lfsr_1_2 << 15) & 0b1
            lfsr_new |= ((lfsr_new <<  1) & 0b1) | ((scrambler.lfsr_1_2 << 0) & 0b1)
            lfsr_new |= ((lfsr_new <<  2) & 0b1) | ((scrambler.lfsr_1_2 << 1) & 0b1)
            lfsr_new |= ((lfsr_new <<  3) & 0b1) | ((scrambler.lfsr_1_2 << 2) & 0b1) ^ ((scrambler.lfsr_1_2 << 15) & 0b1)
            lfsr_new |= ((lfsr_new <<  4) & 0b1) | ((scrambler.lfsr_1_2 << 3) & 0b1) ^ ((scrambler.lfsr_1_2 << 15) & 0b1)
            lfsr_new |= ((lfsr_new <<  5) & 0b1) | ((scrambler.lfsr_1_2 << 4) & 0b1) ^ ((scrambler.lfsr_1_2 << 15) & 0b1)
            lfsr_new |= ((lfsr_new <<  6) & 0b1) | ((scrambler.lfsr_1_2 << 5) & 0b1)
            lfsr_new |= ((lfsr_new <<  7) & 0b1) | ((scrambler.lfsr_1_2 << 6) & 0b1)
            lfsr_new |= ((lfsr_new <<  8) & 0b1) | ((scrambler.lfsr_1_2 << 7) & 0b1)
            lfsr_new |= ((lfsr_new <<  9) & 0b1) | ((scrambler.lfsr_1_2 << 8) & 0b1)
            lfsr_new |= ((lfsr_new << 10) & 0b1) | ((scrambler.lfsr_1_2 << 9) & 0b1)
            lfsr_new |= ((lfsr_new << 11) & 0b1) | ((scrambler.lfsr_1_2 << 0) & 0b1)
            lfsr_new |= ((lfsr_new << 12) & 0b1) | ((scrambler.lfsr_1_2 << 1) & 0b1)
            lfsr_new |= ((lfsr_new << 13) & 0b1) | ((scrambler.lfsr_1_2 << 2) & 0b1)
            lfsr_new |= ((lfsr_new << 14) & 0b1) | ((scrambler.lfsr_1_2 << 3) & 0b1)
            lfsr_new |= ((lfsr_new << 15) & 0b1) | ((scrambler.lfsr_1_2 << 4) & 0b1)     

            # Generation of Scrambled Data
            # scrambled_data = (scrambled_data << i) | (((scrambler.lfsr_1_2 << 15) & 0b1) ^ ((in_data >> i) & 0b1) )<< i
        scrambled_data = scrambler.lfsr_1_2 ^ in_data
            # print("scrambler")
            # print(hex(in_data))
            # print(hex(scrambled_data))
            # assert 1 == 0
        print(f" input data: {hex(in_data)}, output data {hex(scrambled_data)} old lfsr {scrambler.lfsr_1_2}  lfsr {hex(lfsr_new)}")
        scrambler.lfsr_1_2  = lfsr_new
        assert 1 == 0
        return scrambler,scrambled_data

    def scramble_gen_3_4_5 (scrambler, unscrambled_data, lane_num):
        scrambled_data = scramble_data_gen_3(scrambler.lfsr_gen_3,unscrambled_data)
        scrambler.lfsr_gen_3 = advance_lfsr_gen_3(scrambler.lfsr_gen_3)
        return scrambler,scrambled_data

    # Function to advance the LFSR value by 8 bits, given the current LFSR value
    def advance_lfsr_gen_3(lfsr):
        next_lfsr = 0
        next_lfsr = SB(22, GB(lfsr,14) ^ GB(lfsr,16) ^ GB(lfsr,18) ^ GB(lfsr,20) ^ GB(lfsr,21) ^ GB(lfsr,22))
        next_lfsr = SB(21, GB(lfsr,13) ^ GB(lfsr,15) ^ GB(lfsr,17) ^ GB(lfsr,19) ^ GB(lfsr,20) ^ GB(lfsr,21))
        next_lfsr = SB(20, GB(lfsr,12) ^ GB(lfsr,19) ^ GB(lfsr,21))
        next_lfsr = SB(19, GB(lfsr,11) ^ GB(lfsr,18) ^ GB(lfsr,20) ^ GB(lfsr,22))
        next_lfsr = SB(18, GB(lfsr,10) ^ GB(lfsr,17) ^ GB(lfsr,19) ^ GB(lfsr,21))
        next_lfsr = SB(17, GB(lfsr, 9) ^ GB(lfsr,16) ^ GB(lfsr,18) ^ GB(lfsr,20) ^ GB(lfsr,22))
        next_lfsr = SB(16, GB(lfsr, 8) ^ GB(lfsr,15) ^ GB(lfsr,17) ^ GB(lfsr,19) ^ GB(lfsr,21) ^ GB(lfsr,22))
        next_lfsr = SB(15, GB(lfsr, 7) ^ GB(lfsr,22))
        next_lfsr = SB(14, GB(lfsr, 6) ^ GB(lfsr,21))
        next_lfsr = SB(13, GB(lfsr, 5) ^ GB(lfsr,20) ^ GB(lfsr,22))
        next_lfsr = SB(12, GB(lfsr, 4) ^ GB(lfsr,19) ^ GB(lfsr,21) ^ GB(lfsr,22))
        next_lfsr = SB(11, GB(lfsr, 3) ^ GB(lfsr,18) ^ GB(lfsr,20) ^ GB(lfsr,21) ^ GB(lfsr,22))
        next_lfsr = SB(10, GB(lfsr, 2) ^ GB(lfsr,17) ^ GB(lfsr,19) ^ GB(lfsr,20) ^ GB(lfsr,21) ^ GB(lfsr,22))
        next_lfsr = SB( 9, GB(lfsr, 1) ^ GB(lfsr,16) ^ GB(lfsr,18) ^ GB(lfsr,19) ^ GB(lfsr,20) ^ GB(lfsr,21))
        next_lfsr = SB( 8, GB(lfsr, 0) ^ GB(lfsr,15) ^ GB(lfsr,17) ^ GB(lfsr,18) ^ GB(lfsr,19) ^ GB(lfsr,20))
        next_lfsr = SB( 7, GB(lfsr,17) ^ GB(lfsr,19) ^ GB(lfsr,20) ^ GB(lfsr,21))
        next_lfsr = SB( 6, GB(lfsr,16) ^ GB(lfsr,18) ^ GB(lfsr,19) ^ GB(lfsr,20) ^ GB(lfsr,22))
        next_lfsr = SB( 5, GB(lfsr,15) ^ GB(lfsr,17) ^ GB(lfsr,18) ^ GB(lfsr,19) ^ GB(lfsr,21) ^ GB(lfsr,22))
        next_lfsr = SB( 4, GB(lfsr,17))
        next_lfsr = SB( 3, GB(lfsr,16))
        next_lfsr = SB( 2, GB(lfsr,15) ^ GB(lfsr,22))
        next_lfsr = SB( 1, GB(lfsr,16) ^ GB(lfsr,18) ^ GB(lfsr,20) ^ GB(lfsr,22))
        next_lfsr = SB( 0, GB(lfsr,15) ^ GB(lfsr,17) ^ GB(lfsr,19) ^ GB(lfsr,21) ^ GB(lfsr,22))
        return next_lfsr


    # Function to scramble a byte, given the current LFSR value
    def scramble_data_gen_3(self, lfsr, data_in): 
        data_out = 0x0 #leh static "compilation"
        data_out = SB( 7, GB(data_in,7) ^ GB(lfsr,15) ^ GB(lfsr,17) ^ GB(lfsr,19) ^ GB(lfsr,21) ^ GB(lfsr,22))
        data_out = SB( 6, GB(data_in,6) ^ GB(lfsr,16) ^ GB(lfsr,18) ^ GB(lfsr,20) ^ GB(lfsr,22))
        data_out = SB( 5, GB(data_in,5) ^ GB(lfsr,17) ^ GB(lfsr,19) ^ GB(lfsr,21))
        data_out = SB( 4, GB(data_in,4) ^ GB(lfsr,18) ^ GB(lfsr,20) ^ GB(lfsr,22))
        data_out = SB( 3, GB(data_in,3) ^ GB(lfsr,19) ^ GB(lfsr,21))
        data_out = SB( 2, GB(data_in,2) ^ GB(lfsr,20) ^ GB(lfsr,22))
        data_out = SB( 1, GB(data_in,1) ^ GB(lfsr,21))
        data_out = SB( 0, GB(data_in,0) ^ GB(lfsr,22))
        return data_out


