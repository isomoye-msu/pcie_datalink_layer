from typing import Dict, Union, Set

def SB(var,bit_no,val):
    return var | (val & 1) << bit_no


def GB(var,bit_no):
    return ((var >> bit_no) & 1)

class scrambler_s():
    lfsr_1_2 = None
    lfsr_gen_3 = None
# typedef struct
# {
#  bit [15:0] lfsr_1_2 [`NUM_OF_LANES]
#  bit [22:0] lfsr_gen_3 [`NUM_OF_LANES]
# } scrambler_s


def reset_lfsr (scrambler, current_gen):
    if (current_gen == GEN1  or  current_gen == GEN2):
        for i in range(len(scrambler.lfsr_1_2)):
            scrambler.lfsr_1_2[i] = 0xFFFF

    elif (current_gen == GEN3  or  current_gen == GEN4  or  current_gen == GEN5):
        for i in range(len(scrambler.lfsr_gen_3)):
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
    return scrambler
    
       
def scramble(scrambler,in_data, lane_num, current_gen):
	if (current_gen == GEN1  or  current_gen == GEN2):
		return scramble_gen_1_2 (scrambler, in_data,  lane_num)
	elif (current_gen == GEN3  or  current_gen == GEN4  or  current_gen == GEN5):
		return scramble_gen_3_4_5 (scrambler, in_data, lane_num)

def descramble(scrambler, in_data, lane_num, current_gen):
    if (current_gen == GEN1  or  current_gen == GEN2):
        return scramble_gen_1_2 (scrambler, in_data,  lane_num)
    elif (current_gen == GEN3  or  current_gen == GEN4  or  current_gen == GEN5):
        return scramble_gen_3_4_5 (scrambler, in_data, lane_num)

def scramble_gen_1_2 (scrambler, in_data, lane_num):
 lfsr_new = 0x00
 scrambled_data = 0x00

 # LFSR value after 8 serial clocks
 for i in range(8):
   lfsr_new[ 0] = scrambler.lfsr_1_2 [lane_num] [15]
   lfsr_new[ 1] = scrambler.lfsr_1_2 [lane_num] [ 0]
   lfsr_new[ 2] = scrambler.lfsr_1_2 [lane_num] [ 1]
   lfsr_new[ 3] = scrambler.lfsr_1_2 [lane_num] [ 2] ^ scrambler.lfsr_1_2 [lane_num] [15]
   lfsr_new[ 4] = scrambler.lfsr_1_2 [lane_num] [ 3] ^ scrambler.lfsr_1_2 [lane_num] [15]
   lfsr_new[ 5] = scrambler.lfsr_1_2 [lane_num] [ 4] ^ scrambler.lfsr_1_2 [lane_num] [15]
   lfsr_new[ 6] = scrambler.lfsr_1_2 [lane_num] [ 5]
   lfsr_new[ 7] = scrambler.lfsr_1_2 [lane_num] [ 6]
   lfsr_new[ 8] = scrambler.lfsr_1_2 [lane_num] [ 7]
   lfsr_new[ 9] = scrambler.lfsr_1_2 [lane_num] [ 8]
   lfsr_new[10] = scrambler.lfsr_1_2 [lane_num] [ 9]
   lfsr_new[11] = scrambler.lfsr_1_2 [lane_num] [10]
   lfsr_new[12] = scrambler.lfsr_1_2 [lane_num] [11]
   lfsr_new[13] = scrambler.lfsr_1_2 [lane_num] [12]
   lfsr_new[14] = scrambler.lfsr_1_2 [lane_num] [13]
   lfsr_new[15] = scrambler.lfsr_1_2 [lane_num] [14];       

   # Generation of Scrambled Data
   scrambled_data [i] = scrambler.lfsr_1_2 [lane_num] [15] ^ in_data [i]
   
   scrambler.lfsr_1_2 [lane_num] = lfsr_new
 return scrambler,scrambled_data

def scramble_gen_3_4_5 (scrambler, unscrambled_data, lane_num):
    scrambled_data = scramble_data_gen_3(scrambler.lfsr_gen_3[lane_num],unscrambled_data)
    scrambler.lfsr_gen_3[lane_num] = advance_lfsr_gen_3(scrambler.lfsr_gen_3[lane_num])
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
    data_out = 0x0; #leh static "compilation"
    data_out = SB( 7, GB(data_in,7) ^ GB(lfsr,15) ^ GB(lfsr,17) ^ GB(lfsr,19) ^ GB(lfsr,21) ^ GB(lfsr,22))
    data_out = SB( 6, GB(data_in,6) ^ GB(lfsr,16) ^ GB(lfsr,18) ^ GB(lfsr,20) ^ GB(lfsr,22))
    data_out = SB( 5, GB(data_in,5) ^ GB(lfsr,17) ^ GB(lfsr,19) ^ GB(lfsr,21))
    data_out = SB( 4, GB(data_in,4) ^ GB(lfsr,18) ^ GB(lfsr,20) ^ GB(lfsr,22))
    data_out = SB( 3, GB(data_in,3) ^ GB(lfsr,19) ^ GB(lfsr,21))
    data_out = SB( 2, GB(data_in,2) ^ GB(lfsr,20) ^ GB(lfsr,22))
    data_out = SB( 1, GB(data_in,1) ^ GB(lfsr,21))
    data_out = SB( 0, GB(data_in,0) ^ GB(lfsr,22))
    return data_out


