import pyuvm
import cocotb
from cocotb.triggers import *
from cocotb.queue import QueueEmpty, Queue
import enum
import logging
from descrambler_scrambler import *
from queue import Queue

from pyuvm import utility_classes

logging.basicConfig(level=logging.NOTSET)
logger = logging.getLogger()
logger.setLevel(logging.DEBUG)
# from common_pkg import *
# from pipe_agent_pkg import *

class pipe_driver_bfm(uvm_component):
    def __init__(self, name = "pipe_agent_h", parent=None):
        super().__init__(name, parent)
        self.current_gen = gen_t(GEN1)
        self.driver_scrambler = scrambler_s()
        self.vif              = pipe_interface
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
        
    async def body(self):
        super().body()
        cocotb.start_soon(self.reset_signals())
        cocotb.start_soon(self.detect())
        cocotb.start_soon(self.detect())
        cocotb.start_soon(self.detect())
        
#  #***************************** RESET# (Phystatus de-assertion) *******************************/
#  initial :
    async def reset_signals(self):
        await FallingEdge(self.vif.reset)
        self.vif.phy_rxdata      = 0
        self.vif.phy_rxdata_valid = 0
        self.vif.phy_rxdatak     = 0
        self.vif.phy_rxstart_block= 0
        self.vif.phy_rxsync_header= 0
        self.vif.phy_rxvalid     = 0
        self.vif.phy_rxstatus    = 0
        self.vif.phy_rxstandby   = 0
        self.vif.phy_rxelecidle  = 0
        await RisingEdge(self.vif.clk)
        while(self.vif.reset == 0x1):
            await RisingEdge(self.vif.reset)
        for i in range(len(self.vif.phy_phystatus)):
            self.vif.phy_phystatus[i] = 0x0
        await RisingEdge(self.vif.clk)
        
        self.driver_scrambler = reset_lfsr(self.driver_scrambler,current_gen)
        
        # self.vif.reset_n.value = 0
        # self.vif.A.value = 0
        # self.vif.B.value = 0
        # self.vif.op.value = 0
        await FallingEdge(self.vif.clk)
        self.vif.reset_n.value = 1
        await FallingEdge(self.vif.clk)
        

    async def detect(self):
        while(1):
            while(1):
                await RisingEdge(self.vif.clk)
                for i in range(len(self.vif.phy_txdetectrx)):
                    if(self.vif.phy_txdetectrx[i] == 0x1):
                        break
                        
            await RisingEdge(self.vif.clk)
            for i in range(len(self.vif.phy_phystatus)):
                self.vif.phy_phystatus.value[i] = 0x1
            for i in range(self.dut.MAX_NUM_LANES):
                self.vif.phy_rxstatus.value[i*3:(i*3)+3] = 0b011
            
            await RisingEdge(self.vif.clk)
            
            for i in range(len(self.vif.phy_phystatus)):
                self.vif.phy_phystatus.value[i] = 0x0
            for i in range(self.dut.MAX_NUM_LANES):
                self.vif.phy_rxstatus.value[i*3:(i*3)+3] = 0b000
            await RisingEdge(self.vif.clk)
            
    async def polling(self):
        while(1):
            flag = 0
            previous_PowerDown = 0
            while(1):
                await RisingEdge(self.vif.clk)
                if(self.vif.phy_powerdown == 0x0):
                    break
            
            await RisingEdge(self.vif.clk)
            for i in range(self.dut.MAX_NUM_LANES):
                self.vif.phy_phystatus.value[i] = 0x1
            
            await RisingEdge(self.vif.clk)
            for i in range(self.dut.MAX_NUM_LANES):
                self.vif.phy_phystatus.value[i] = 0x1
            
            while(1):
                for i in range(self.dut.MAX_NUM_LANES):
                    if(self.vif.phy_txelecidle[i].value == 0):
                        break
                    
 #------------------------------------------
 # Methods
 #------------------------------------------
    def ts_symbols_maker(self, ts, RxData_Q, RxDataK_Q):
        if (current_gen == GEN2):
            # Symbol 0
            RxData_Q.put( 0b10111100)
            RxDataK_Q.put(0b1) 

            #Symbol 1
            if (ts.use_link_number):
                RxData_Q.put(  ts.link_number)
                RxDataK_Q.put(0b0)
            else:
                RxData_Q.put( 0b11110111 ) #PAD character
                RxDataK_Q.put(0b1)
                
            #Symbol 2
            if (ts.use_lane_number):
                RxData_Q.put( ts.lane_number)
                RxDataK_Q.put(0b0)
            else:
                RxData_Q.put( 0b11110111 ) #PAD character
                RxDataK_Q.put(0b1)

            #Symbol 3
            if (ts.use_n_fts):
                RxData_Q.put( ts.n_fts)
                RxDataK_Q.put(0b0)
            else :
                RxData_Q.put( 0x00)
                RxDataK_Q.put(0b0)
            
            #Symbol 4
            RxDataK_Q.put(0b0)

            temp = 0xFF
            temp[0] = 0
            if (ts.max_gen_supported == GEN1):
                temp[5:2] = 0
            elif (ts.max_gen_supported == GEN2):
                temp[5:3] = 0
            elif (ts.max_gen_supported == GEN3):
                temp[5:4] = 0
            elif (ts.max_gen_supported == GEN4):
                temp[5] = 0

            temp[6]   = ts.auto_speed_change
            temp[7]   = ts.speed_change

            RxData_Q.put( temp)

            #Symbol 5
            RxData_Q.put( 0x00)
            RxDataK_Q.put(0b0)

            #Symbol 6
            if (ts.equalization_command):
                temp = 0xFF
                temp[2:0] = ts.rx_preset_hint
                temp[6:3] = ts.tx_preset
            if (ts.ts_type == TS2):
                temp[7] = ts.equalization_command
            else :
                if (ts.ts_type == TS1):
                    temp = 0x4A
                else:
                    temp = 0x45
            
            RxData_Q.put(temp)
            RxDataK_Q.put(0b0)

            #Symbol 7~15
            if (ts.ts_type == TS1):
                for x in range(9):
                    RxData_Q.put( 0x4A)
                    RxDataK_Q.put(0b0)
            else :
                for x in range(9):
                    RxData_Q.put(0x45)
                    RxDataK_Q.put(0b0)
        else :
            # Symbol 0
            if (ts.ts_type == TS1):
                RxData_Q.put( 0x1E)
            else:
                RxData_Q.put( 0x2D)

            #Symbol 1
            if (ts.use_link_number):
                RxData_Q.put(ts.link_number)
            else:
                RxData_Q.put(0b11110111 ) #PAD character

            #Symbol 2
            if (ts.use_lane_number):
                RxData_Q.put(ts.lane_number)
            else:
                RxData_Q.put(0b11110111)  #PAD character

            #Symbol 3
            if (ts.use_n_fts):
                RxData_Q.put( ts.n_fts)
            else:
                RxData_Q.put( 0x00)

            #Symbol 4
            temp = 0xFF
            temp[0] = 0
            if (ts.max_gen_supported == GEN1):
                temp[5:2] = 0
            elif (ts.max_gen_supported == GEN2):
                temp[5:3] = 0
            elif (ts.max_gen_supported == GEN3):
                temp[5:4] = 0
            elif (ts.max_gen_supported == GEN4):
                temp[5] = 0

            temp[6] = ts.auto_speed_change
            temp[7] = ts.speed_change
            RxData_Q.put(temp)

            #Symbol 5
            RxData_Q.put(0x00)


            #Symbol 6
            temp = 0x00
            if(True): #need flag
                if (ts.ts_type == TS1):
                    if (True):  #need flag
                        temp[1:0] = ts.ec

                    if (True):  #need flag
                        temp[6:3] = ts.tx_preset

                    temp[7] = ts.use_preset
                elif (ts.ts_type == TS2):
                    ...
                    #not supported yet
                else:
                    temp = 0x4A

            RxData_Q.put(temp)

            #Symbol 7
            temp = 0x00
            if (ts.ts_type == TS1):
                if (ts.ec == 0b01):
                    temp[5:0] = ts.fs_value
                else:
                    temp[5:0] = ts.pre_cursor
            else:
                temp = 0x45
            RxData_Q.put(temp)


            #Symbol 8
            temp = 0x00
            if (ts.ts_type == TS1):
                if (ts.ec == 0b01):
                    temp[5:0] = ts.lf_value
                else:
                    temp[5:0] = ts.cursor
            else:
                temp = 0x45
            RxData_Q.put( temp)

            #Symbol 9
            temp = 0x00
            if (ts.ts_type == TS1):
                temp[5:0] = ts.post_cursor
                if (True):  #need flag
                    temp[6] = ts.rcv

                temp[7] = 0x1 ^ ((temp[6:0]<<3) | (RxData_Q[6]<<2) |  (RxData_Q[7] <<1) | RxData_Q[8])
            else:
                temp = 0x45
            RxData_Q.put( temp)

            #Symbol 10~15
            if (ts.ts_type == TS1):
                for x in range(9):
                    RxData_Q.put( 0x4A)
            else:
                for x in range(9):
                    RxData_Q.put( 0x45)
            return RxData_Q,RxDataK_Q
        


    async def send_ts(self,ts, start_lane = 0, _lane = self.dut.MAX_NUM_LANES):  # task
        width = get_width()
        RxData_Q = Queue()  #the actual symbols will be here (each symbol is a byte)
        # bit RxDataValid_Q[$]
        RxDataK_Q = Queue()
        Data = bin(0)
        Character = bin(0)
        
        #bit RxStartBlock_Q[$]
        #bit [1:0] RxSyncHeader_Q[$]
        # bit RxValid_Q[$]
        #RxStatus_Q[$]
        #bit RxElecIdle_Q[$]

        for i in range(start_lane,_lane):
            RxDataValid[i] = 1
            RxValid[i] = 1
        
        self.driver_scrambler = reset_lfsr(self.driver_scrambler, current_gen)

        RxData_Q,RxDataK_Q = ts_symbols_maker(ts, RxData_Q, RxDataK_Q)


        if (current_gen == GEN2):
            while (len(RxData_Q)):

                # Stuffing the Data and characters deping on the number of Bytes sent per clock on each lane
                for i in range(int(width/8)):
                    Data[j*8: (j*8) +8] = RxData_Q.get()
                    Character[j] = RxDataK_Q.get()
                    #RxData_Q = RxData_Q[1:$]
                    #RxDataK_Q = RxDataK_Q[1:$];  
                
                for i in range(start_lane,_lane):
                    #duplicating the Data and Characters to each lane in the driver
                    self.vif.phy_rxdata[i*pipe_max_width :(i*pipe_max_width)+pipe_max_width] = Data
                    self.vif.phy_rxdatak[i*pipe_max_width/8 : (i*pipe_max_width/8) + pipe_max_width/8] = Character

                await RisingEdge(self.vif.clk)
            
        if (current_gen > GEN2):

            while (len(RxData_Q)):
                for i in range(start_lane,_lane):
                    # Stuffing the Data and characters deping on the number of Bytes sent per clock on each lane
                    for i in range(int(width/8)):
                        Data[j*8: (j*8)+ 8] = RxData_Q[0]
                        RxData_Q = RxData_Q[1:]
                    

                    #duplicating the Data and Characters to each lane in the driver
                    RxData[i*pipe_max_width : (i*pipe_max_width) + pipe_max_width] = Data
                
                await RisingEdge(self.vif.clk)
            
        
        for i in range(start_lane,_lane):
            RxDataValid[i] = 0
            RxValid[i] = 0


async def send_tses(self, ts, start_lane = 0,  _lane = pipe_num_of_lanes):  # task
    width = get_width()

    RxData_Q = []
    RxDataK_Q = []



    RxData_Q  = []
    RxDataK_Q = []
    Data      = bin(0)
    Character = bin(0)
    
    for i in range(len(ts)):
        RxData_Q[i],RxDataK_Q[i] = ts_symbols_maker(ts[i], RxData_Q[i], RxDataK_Q[i])

    self.driver_scrambler = reset_lfsr(self.driver_scrambler, current_gen)
   #uvm_info("pipe_driver_bfm", sv.sformatf("%d", width), UVM_NONE)

    if (current_gen == GEN2):
        while (RxData_Q[0].size()):
            for i in range(start_lane, _lane):
                self.dut.vif.phy_rxdata_valid[i] = 1
                self.dut.vif.phy_rxvalid[i] = 1
        
            for i in range(start_lane, _lane):
            # Stuffing the Data and characters deping on the number of Bytes sent per clock on each lane
                for j in range(int(width/8)):
                    Data[j*8 :(j*8)+8] = RxData_Q[i].get()
                    Character[j] = RxDataK_Q[i].get()
            ##uvm_info("pipe_driver_bfm", sv.sformatf("%p", RxData_Q[i]), UVM_NONE)
            

            #duplicating the Data and Characters to each lane in the driver
            self.vif.phy_rxdata[i*pipe_max_width :(i*pipe_max_width) + pipe_max_width] = Data
            self.vif.phy_rxdatak[i*pipe_max_width/8 : (i*pipe_max_width/8) + pipe_max_width/8] = Character
       
        await RisingEdge(self.vif.clk)
   
        for i in range(start_lane, _lane):
            self.dut.vif.phy_rxdata_valid[i] = 0
            self.dut.vif.phy_rxvalid[i] = 0

async def send_eios(self):  # task
    width = get_width()
    com = 0b10111100
    idl = 0b01111100
    eios_gen3_ident = 0x66

    if (current_gen == GEN2):
        RxData_Q.put(com)
        RxData_Q.put(idl)
        RxData_Q.put(idl)
        RxData_Q.put(idl)
        RxDataK_Q.put(0b1)
        RxDataK_Q.put(0b1)
        RxDataK_Q.put(0b1)
        RxDataK_Q.put(0b1)
        
        while (len(RxData_Q)):
            await RisingEdge(self.vif.clk)

            # Stuffing the Data and characters deping on the number of Bytes sent per clock on each lane
            for i in range(int(width/8)):
                Data[j*8 :(j*8)+8] = RxData_Q.get()
                Character[j] = RxDataK_Q.get()
            

            #duplicating the Data and Characters to each lane in the driver
            for i in range(pipe_num_of_lanes):
                self.vif.phy_rxdata[i*pipe_max_width : (i*pipe_max_width)+pipe_max_width] = Data
                self.vif.phy_rxdatak[i*pipe_max_width/8 : (i*pipe_max_width/8)+pipe_max_width/8] = Character
            
        await RisingEdge(self.vif.clk)
        for i in range(pipe_num_of_lanes):
            self.vif.phy_rxdata_valid[i] = 1
            self.vif.phy_rxvalid[i] = 1
            
        self.vif.phy_rxelecidle = 1
    else:  #gen3 and higher:
        for z in range(int((16*8)/width)):
            await RisingEdge(self.vif.clk)
            
        #stuff data deping on lane width
            for j in range(int(width/8)):
                Data[j*8: (j*8)+8] = eios_gen3_ident
        

        #driving signals of each lane
        for i in range(pipe_num_of_lanes):
            if (z == 0):
                self.vif.phy_rxstart_block[i] = 0b1
                self.vif.phy_rxsync_header[i*2: (i*2)+2] = 0b01
            else :
                self.vif.phy_rxstart_block[i] = 0b0
            
            #driving data on lanes
            self.vif.phy_rxdata[i*pipe_max_width : (i*pipe_max_width)+pipe_max_width] = Data
        await RisingEdge(self.vif.clk)

    async def send_eieos(self):  # task
        width = get_width()


        RxData_Q = Queue()
        RxDataK_Q = Queue()

        com = 0b10111100
        eie = 0b11111100
        ts1_ident = 0b01001010
        RxData_Q.put((
            com, eie, eie, eie, eie, eie, eie, eie, eie, eie, eie, eie, eie, eie, eie, ts1_ident
        ))
        RxDataK_Q.put((1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0))

        if (current_gen == GEN2):
            while (len(RxData_Q)):
                await RisingEdge(self.vif.clk)

                # for(int i = start_lane; i < _lane; i += 1):
                #   RxDataValid[i] = 1
                #   RxValid[i] = 1
                # 


                # Stuffing the Data and characters deping on the number of Bytes sent per clock on each lane
                for i in range(int(width/8)):
                    Data[j*8: (j*8)+8] = RxData_Q.get()
                    Character[j] = RxDataK_Q.get()
                

                #duplicating the Data and Characters to each lane in the driver
                for i in range(pipe_num_of_lanes):
                    RxData[i*pipe_max_width : (i*pipe_max_width)+pipe_max_width] = Data
                    RxDataK[i*pipe_max_width/8 : (i*pipe_max_width/8)+pipe_max_width/8] = Character
                
                
                await RisingEdge(self.vif.clk)
                self.vif.phy_rxelecidle = 0
        else :
            ...
                

            
            # for(int i = start_lane; i < _lane; i += 1):
            #   RxDataValid[i] = 0
            #   RxValid[i] = 0
            # 


 #***************************** Normal Data Operation *******************************/

#  bit [0:10] tlp_length_field
#  byte tlp_gen3_symbol_0
#  byte tlp_gen3_symbol_1
#  data[$]
#  bit k_data[$]

    def get_width(self):
        lane_width = 0
        match Width:
            case 0b00: lane_width = 8
            case 0b01: lane_width = 16
            case 0b11: lane_width = 32
        return lane_width

#  temp
#  temp_data

    def send_tlp(self,tlp):
    #uvm_info("pipe_driver_bfm",sv.sformatf("sing tlp, size= %d",len(tlp)),UVM_MEDIUM)
        if (current_gen == GEN1  or  current_gen == GEN2):
            data.put(STP_gen_1_2)
            k_data.put(K)


            for i in range(len(tlp)):
                data.put(tlp[i])
                k_data.put(D)


            data.put(END_gen_1_2)
            k_data.put(K)

        elif (current_gen == GEN3  or  current_gen == GEN4  or  current_gen == GEN5):
            tlp_length_field  = len(tlp) + 2
            tlp_gen3_symbol_0 = STP_gen_3 + tlp_length_field[0:3]
            tlp_gen3_symbol_1 = tlp_length_field[4:10] + 0b0

            data.put(tlp_gen3_symbol_0)
            k_data.put(K);  #nosaha K w nosaha D ???
            data.put(tlp_gen3_symbol_1)
            k_data.put(D)
            #check if i need k_data queue in gen3 or not??
            #check on lenth constraint of TLP , is it different than earlier gens??? 
            for i in range(len(tlp)):
                data.put(tlp[i])
                k_data.put(D)

    def send_dllp(self, dllp):
    #uvm_info("pipe_driver_bfm","sing dllp",UVM_MEDIUM)
        if (current_gen == GEN1  or  current_gen == GEN2):
                data.put(SDP_gen_1_2)
                k_data.put(K)
                data.put(dllp[0])
                k_data.put(D)
                data.put(dllp[1])
                k_data.put(D)
                data.put(dllp[2])
                k_data.put(D)
                data.put(dllp[3])
                k_data.put(D)
                data.put(dllp[4])
                k_data.put(D)
                data.put(dllp[5])
                k_data.put(D)
                data.put(END_gen_1_2)
                k_data.put(K)
        elif (current_gen == GEN3  or  current_gen == GEN4  or  current_gen == GEN5):
            #check if i need k_data queue in gen3 or not??
                data.put(SDP_gen_3_symbol_0)
                data.put(SDP_gen_3_symbol_1)
                data.put(dllp[0])
                data.put(dllp[1])
                data.put(dllp[2])
                data.put(dllp[3])
                data.put(dllp[4])
                data.put(dllp[5])
   
   #uvm_info("pipe_driver_bfm",sv.sformatf("queue_data = %p",data),UVM_MEDIUM)
   #uvm_info("pipe_driver_bfm",sv.sformatf("k_queue_data = %p",k_data),UVM_MEDIUM)

    def send_idle_data(self):
        for i in range(pipe_num_of_lanes):
            data.put(0b00000000)
            k_data.put(D);  #control but scrambled
    
    #uvm_info("pipe_driver_bfm",sv.sformatf("queue_data = %p",data),UVM_MEDIUM)

    async def send_data(self):
    #uvm_info("pipe_driver_bfm","entered s data",UVM_MEDIUM)
    #uvm_info("pipe_driver_bfm",sv.sformatf("current_gen = %s",current_gen.name()),UVM_MEDIUM)
        while(self.vif.phy_powerdown != 0b00):
            await RisingEdge(self.vif.clk)
                
    #else uvm_error("pipe_driver_bfm", "Unexpected PowerDown value at Normal Data Operation")
        self.vif.phy_rxelecidle = 0
        for i in range(pipe_num_of_lanes):
            self.vif.phy_rx_data_valid[i] = 1
    
        if (current_gen == GEN1  or  current_gen == GEN2):
            s_data_gen_1_2()
        elif (current_gen == GEN3  or  current_gen == GEN4  or  current_gen == GEN5):
            s_data_gen_3_4_5()
        for i in range(pipe_num_of_lanes):
            self.vif.phy_rx_data_valid[i] = 0

    async def send_data_gen_1_2(self):  # task
        data_scrambled = Queue()
        pipe_width = get_width()
        bus_data_width = (pipe_num_of_lanes * pipe_width)
        for i in range(len(data)):
            lanenum = i
            lanenum = lanenum - pipe_num_of_lanes
        for i in range(len(data)):
            lanenum = i
            lanenum = lanenum - pipe_num_of_lanes * ((lanenum / pipe_num_of_lanes))
            if (k_data[i] == D):
                temp = data.get()
                self.driver_scrambler,data_scrambled[i] = scramble(self.driver_scrambler, temp, lanenum, current_gen)
            elif (k_data[i] == K):
                data_scrambled[i] = data.get()
        
        for k in range(0, len(data_scrambled) + k, (bus_data_width) / 8):
            for j in range((bus_data_width) / (pipe_num_of_lanes * 8)):
                for i in range(j,(bus_data_width_param + 1) / 8, (bus_data_width_param + 1) / (pipe_num_of_lanes * 8)) :
                    self.vif.phy_rxdata[(8*i): (8*i)+8] = data_scrambled.get()
                    self.vif.phy_rxdatak[i] = k_data.get()
    #uvm_info("pipe_driver_bfm",sv.sformatf("data_scrambled = %p",data_scrambled),UVM_MEDIUM)
    #uvm_info("pipe_driver_bfm",sv.sformatf("k_queue_data = %p",k_data),UVM_MEDIUM)
            #uvm_info("pipe_driver_bfm",sv.sformatf("rxdata = %h",RxData),UVM_MEDIUM)
        
        await RisingEdge(self.vif.clk)
        ##uvm_info("pipe_driver_bfm",sv.sformatf("rxdata2 = %h",RxData),UVM_MEDIUM)
        if (not (lanenum == pipe_num_of_lanes)):
            for j in range((bus_data_width) / 8):
                self.vif.phy_rxdata[(8*i): (8*i)+8] = 0b11110111
                self.vif.phy_rxdatak[j] = 0b1

    async def send_data_gen_3_4_5(self):  # task
        data_block_size: int = (128 * pipe_num_of_lanes) / 8
        num_of_idle_data = data_block_size - (len(data) % data_block_size)
        num_of_data_blocks = len(data) / data_block_size
        lane_width = get_width()
        num_of_clks = 128 / lane_width
        num_of_bytes_in_lane = lane_width / 8
        if (len(data) % data_block_size != 0):
            for i in range(num_of_idle_data):
                data.put(0b00000000)
                k_data.put(0)
        
        for i in range(num_of_data_blocks):
            for j in range(num_of_clks):
                for k in range(num_of_bytes_in_lane):
                    for l in range(pipe_num_of_lanes):
                        if (j == 0):
                            self.vif.phy_rxstart_block[i] = 0b1
                            self.vif.phy_rxsync_header[i*2: (i*2)+2] = 0b10
                        else :
                            self.vif.phy_rxstart_block[i] = 0b0
            temp_data = data.get()
            self.driver_scrambler,self.vif.phy_rxdata[((l*pipe_max_width)+(k*8)) :  (l*pipe_max_width)+(k*8) +8] =  scramble(self.driver_scrambler, temp_data, l, current_gen)
        await RisingEdge(self.vif.clk)


 #***************************** Equalization *******************************/
    async def equalization(self):
        flag_tx_preset_applied = 0
        while True:
            while(1):
                await RisingEdge(self.vif.clk)
                if((LocalPresetIndex == my_tx_preset)  and  (GetLocalPresetCoeffcients == 1)):
                    break  
            # wait ((LocalPresetIndex == my_tx_preset)  and  (GetLocalPresetCoeffcients == 1))
            await RisingEdge(self.vif.clk)
            self.vif.phy_txeq_coeff  = 1
            self.vif.phy_txeq_preset = my_local_txPreset_coefficients

            await RisingEdge(self.vif.clk)
            self.vif.phy_txeq_coeff = 0
            while(1):
                await RisingEdge(self.vif.clk)
                if(TxDeemph == my_local_txPreset_coefficients):
                    break
                self.vif.phy_txeq_ctrl = 1
   
 

    async def equalization_preset_applied(self):
    #uvm_info("pipe_monitor_bfm", "waiting for flag_tx_preset_applied ", UVM_NONE)
        while(1):
            await RisingEdge(self.vif.clk)
            if(flag_tx_preset_applied == 1):
                break


    def set_eq_param (self, lf_usp_i, fs_usp_i, lf_dsp_i, fs_dsp_i,
        cursor_i, pre_cursor_i, post_cursor_i,  my_tx_preset_i,
        my_rx_preset_hint_i,  my_local_txPreset_coefficients_i):
        self.lf_usp                         = lf_usp_i
        self.fs_usp                         = fs_usp_i
        self.lf_dsp                         = lf_dsp_i
        self.fs_dsp                         = fs_dsp_i
        self.cursor                         = cursor_i
        self.pre_cursor                     = pre_cursor_i
        self.post_cursor                    = post_cursor_i
        self.my_tx_preset                   = my_tx_preset_i
        self.my_rx_preset_hint              = my_rx_preset_hint_i
        self.my_local_txPreset_coefficients = my_local_txPreset_coefficients_i



    async def eq_eval(self):
        while True:
            while(RxEqEval == 0):
                await RisingEdge(self.vif.clk)
                
        # assert ((FS == {pipe_num_of_lanes{fs_dsp}})  and  (LF == {pipe_num_of_lanes{lf_dsp}}))
        # else uvm_error("pipe_driver_bfm", "FS and LF not assigned")
        await RisingEdge(self.vif.clk)
        LinkEvaluationFeedbackDirectionChange = 0b000000
        eval_feedback_was_asserted = 1