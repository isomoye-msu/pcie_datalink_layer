import pyuvm
import cocotb
from enum import Enum
from cocotb.triggers import *


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

class ts_s():
    n_fts            = None
    use_n_fts        = None
    link_number      = None
    use_link_number  = None
    lane_number      = None
    use_lane_number  = None
    max_gen_supported = gen_t()
    ts_type           = ts_type_t()
    speed_change            = None                     # need to be added in the send/recv tasks
    auto_speed_change       = None                # need to be added in the send/recv tasks
    rx_preset_hint          = None                   # need to be added in the send/recv tasks
    tx_preset               = None                        # need to be added in the send/recv tasks
    ec                      = None                
    use_preset              = None                
    lf_value                = None                
    fs_value                = None                
    pre_cursor              = None                 
    cursor                  = None                
    post_cursor             = None                
    rcv                     = None                
    equalization_command    = None 
    TS_gen                  = None              # equals zero in gen1,2 and one in gen3,4,5         


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
    self.pipe_operation = pipe_operation_t()
    self.tlp = tlp_t()
    self.dllp =  dllp_t()
    self.pipe_width = pipe_width_t()
    self.pclk_rate = pclk_rate_t()


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

class pipe_seq_item(UVMSequenceItem):     
#******************************************************************************************/

#******************************** Class Implementation ************************************/
    def __init__(self, name = "pipe_seq_item"):
        super().__init__(name)
        self.pipe_operation = None  # type: pipe_operation_t  
        self.tlp = None  # type: tlp_t  
        self.dllp = None  # type: dllp_t  
        self.pipe_width = None  # type: pipe_width_t  
        self.pclk_rate = None  # type: pclk_rate_t  
        self.gen = None  # type: gen_t  
        self.ts_sent = None  # type: ts_s  
        self.tses_sent = []  # type: ts_s  []
        self.tlp_gen_1_2_no_of_bytes = 0  # type: int  
        self.lf_usp = 0x0  # type: bit [5:0] 
        self.fs_usp = 0x0  # type: bit [5:0] 
        self.lf_dsp = 0x0  # type: bit [5:0] 
        self.fs_dsp = 0x0  # type: bit [5:0] 
        self.cursor = 0x0  # type: bit [5:0] 
        self.pre_cursor = 0x0  # type: bit [5:0] 
        self.post_cursor = 0x0  # type: bit [5:0] 
        self.rx_preset_hint = 0x0  # type: bit [2:0] 
        self.tx_preset = 0x0  # type: bit [3:0] 
        self.local_txPreset_coefficients = 0x0  # type: bit [17:0] 
        self.E = None  # type: TLP_MIN_SIZ  
        self.E = None  # type: TLP_MAX_SIZ  
        self.S = None  # type: NUM_OF_LANE  
        
    def randomize(self):
        self.pipe_operation              = random.choice(list())
        self.tlp                         = random.choice(list(TlpType))
        self.dllp                        = random.choice(list(DllpType))
        self.tlp_gen_1_2_no_of_bytes     = random.randint(3,1000)
        self.pipe_width                  = random.randint(0, 32)
        self.pclk_rate                   =  random.choice(list(pclk_rate_t))
        self.gen                         = random.choice(list(gen_t))
        self.ts_sent                     = random.choice(list(ts_s))
        self.tses_sent                   = random.choice(list(ts_s))

    # def do_copy(self,UVMObject rhs):

    #     super().do_copy(rhs)
    #     self.pipe_operation = rhs_.pipe_operation
    #     self.tlp            = rhs_.tlp
    #     self.dllp           = rhs_.dllp
    #     self.pipe_width     = rhs_.pipe_width
    #     self.pclk_rate      = rhs_.pclk_rate
    #     self.ts_sent        = rhs_.ts_sent
    #     self.tses_sent      = rhs_.tses_sent

    # def do_compare(self,UVMObject rhs, uvm_comparer comparer) -> bit:
    #     pipe_seq_item rhs_

    #     if (not sv.cast(rhs_, rhs)):
    #     uvm_error("do_copy", "cast of rhs object failed")
    #     return 0
    #     end
        
    #     return ((super().do_compare(rhs, comparer))  and  
    #             (self.tlp == rhs_.tlp)  and 
    #             (self.dllp == rhs_.dllp)  and 
    #             (self.pipe_width == rhs_.pipe_width)  and 
    #             (self.pclk_rate == rhs_.pclk_rate)  and 
    #             (self.ts_sent == rhs_.ts_sent)  and 
    #             (self.tses_sent == rhs_.tses_sent))

    # def convert2string(self) -> string:
    # return sv.sformatf("PIPE Sequence Item:\n\toperation:%s, width:%s, rate:%s,\n\ttlp[size=%0d]\n\tdllp[size=%0d]:%p\n",
    #             self.pipe_operation.name(),
    #             self.pipe_width.name(),
    #             self.pclk_rate.name(),
    #             len(self.tlp),
    #             $size(self.dllp),
    #             self.dllp)
    # endfunction: convert2string

    # def do_print(self,uvm_printer printer):
    #     printer.m_string = self.convert2string()
    #     # endfunction: do_print

    # def to_struct(self):
        # pipe_seq_item_s s_h
        # s_h.pipe_operation  = self.pipe_operation
        # s_h.tlp             = self.tlp
        # s_h.dllp            = self.dllp
        # s_h.pipe_width      = self.pipe_width
        # s_h.pclk_rate       = self.pclk_rate
        # return s_h
        # endfunction: to_struct
# 
    # def from_struct(self,pipe_seq_item_s src):
        # self.pipe_operation = src.pipe_operation
        # self.tlp            = src.tlp
        # self.dllp           = src.dllp
        # self.pipe_width     = src.pipe_width
        # self.pclk_rate      = src.pclk_rate
        # endfunction: from_struct
    # #******************************************************************************************/
    

class pipe_coverage_monitor(uvm_component):
    
    	# `uvm_component_utils(pipe_coverage_monitor)
    #  pipe_seq_item pipe_seq_item_h
    
    #  uvm_analysis_imp_sent #(pipe_seq_item, pipe_coverage_monitor) analysis_export_sent
    #  uvm_analysis_imp_received #(pipe_seq_item, pipe_coverage_monitor) analysis_export_received
    
    
    #  pipe_seq_item_cov = coverage_section(; 
    #    write coverpoints
    #  ) # Close coverage section
    #  
    def __init__(self,name = "pipe_coverage_monitor", parent=None):
        super().__init__(name, parent)
        self.pipe_seq_item_cov = covergroup()
        self.pipe_seq_item_h = None  # type: pipe_seq_item  
        self.t = None  # type: analysis_export_sen  
        self.d = None  # type: analysis_export_receive  
        self.pipe_seq_item_cov = None  # type: covergroup  

    def write_sent(self, pipe_seq_item_h):
        self.pipe_seq_item_h = pipe_seq_item_h
        pipe_seq_item_cov.sample()

    def write_received(self, pipe_seq_item_h):
        self.pipe_seq_item_h = pipe_seq_item_h
        pipe_seq_item_cov.sample()
       

    def build_phase(self):
        uvm_info(get_name(), "Enter pipe_coverage_monitor build_phase", UVM_MEDIUM)
        analysis_export_sent = new("analysis_export_sent", self)
        analysis_export_received = new("analysis_export_received", self)
        uvm_info(get_name(), "Exit pipe_coverage_monitor build_phase", UVM_MEDIUM)
     


    def report_phase(self):
        ...
        #write function




class pipe_monitor(UVMMonitor):

    def __init__(self, name = "pipe_monitor", parent=None):
        super().__init__(name, parent)
        self.pipe_monitor_bfm_h = None  # type: pipe_monitor_bfm_param  
        self.pipe_agent_config_h = None  # type: pipe_agent_config  
        self.t = None  # type: ap_sen  
        self.d = None  # type: ap_receive  
    
    def build_phase(self, phase) :
        #uvm_info(get_name(), "Enter pipe_monitor build_phase", UVM_MEDIUM)
        super().build_phase(phase)
        self.ap_sent = new("ap_sent", self)
        self.ap_received = new("ap_received", self)
        #uvm_info(get_name(), "Exit pipe_monitor build_phase", UVM_MEDIUM)
    

    def connect_phase(self, phase) :
        super().connect_phase(phase)
        #uvm_info(get_name(), "Enter pipe_monitor connect_phase", UVM_MEDIUM)
        self.pipe_monitor_bfm_h = pipe_agent_config_h.pipe_monitor_bfm_h
        self.pipe_monitor_bfm_h.proxy = self
        self.pipe_monitor_bfm_h.build_connect_finished_e.set()
        #uvm_info(get_name(), "Exit pipe_monitor connect_phase", UVM_MEDIUM)

    async def detect_posedge_clk(self): 
        pipe_agent_config_h.detected_posedge_clk_e.set()

    async def detect_link_up(self):  # task
        self.pipe_seq_item_h = pipe_seq_item("pipe_seq_item_h")
        # self.pipe_seq_item_h = pipe_seq_item.type_id.create("pipe_seq_item_h")
        # Wait till the sequence finishes the link up
        await self.pipe_agent_config_h.link_up_finished_e.wait()
        # await RisingEdge(pipe_agent_config_h.link_up_finished_e) or 
        # FallingEdge(pipe_agent_config_h.link_up_finished_e)
        # Determining the detected operation
        self.pipe_seq_item_h.pipe_operation = LINK_UP
        # Sending the sequence item to the analysis components
        self.ap_received.write(self.pipe_seq_item_h)

    async def  exit_electricle_idle(self):  # task
        ...
        #pipe_monitor_bfm_h.detected_exit_electricle_idle.set()= pipe_agent_config_h.detected_exit_electricle_idle_e
        #self.pipe_agent_config_h.detected_exit_electricle_idle_e
        #self.pipe_monitor_bfm_h.detected_exit_electricle_idle_e

    async def  power_down_change(self):  # task
        ...
        #pipe_monitor_bfm_h.detected_power_down_change.set()= pipe_agent_config_h.power_down_change_e
        #self.pipe_agent_config_h.power_down_change_e
        #self.pipe_monitor_bfm_h.detected_power_down_change_e
        ##uvm_info("pipe_monitor_bfm", "Powerdown= P0 detected in monitor ", UVM_LOW)

    def notify_tses_received(self,tses) :
        self.pipe_agent_config_h.tses_received = tses
        self.pipe_agent_config_h.detected_tses_e.set()
        
    def notify_eieos_received(self) :
        self.pipe_agent_config_h.detected_eieos_e.set()
    
    def notify_eieos_gen3_received(self) :
        self.pipe_agent_config_h.detected_eieos_gen3_e.set()
        
    def notify_eios_received(self) :
        self.pipe_agent_config_h.detected_eios_e.set()
   
    def notify_eios_gen3_received(self) :
        self.pipe_agent_config_h.detected_eios_gen3_e.set()
        
    def notify_TxElecIdle_and_RxStandby_asserted(self) :
        self.pipe_agent_config_h.detected_TxElecIdle_and_RxStandby_asserted_e.set()


    def notify_width_changed(self, new_width) :
        self.pipe_agent_config_h.new_width = new_width
        self.pipe_agent_config_h.detected_width_change_e.set()

    def notify_PCLKRate_changed(self, new_PCLKRate) :
    #sv.display("flag",new_PCLKRate)
        self.pipe_agent_config_h.new_PCLKRate = new_PCLKRate
        self.pipe_agent_config_h.detected_PCLKRate_change_e.set()
        
    def notify_Rate_changed(self, new_Rate) :
    #sv.display("flag",new_PCLKRate)
        self.pipe_agent_config_h.new_Rate =new_Rate
        self.pipe_agent_config_h.detected_Rate_change_e.set()
 
    def notify_TxDeemph_changed(self, new_TxDeemph) :
        #sv.display("flag",new_PCLKRate)
        self.pipe_agent_config_h.new_TxDeemph = new_TxDeemph
        self.pipe_agent_config_h.detected_TxDeemph_change_e.set()

    # def notify_link_up_sent(self) :
    #   # Creating the sequnce item
    #   pipe_seq_item pipe_seq_item_h
    #   pipe_seq_item_h = pipe_seq_item.type_id.create("pipe_seq_item_h")
    #   # Determining the detected operation
    #   pipe_seq_item_h.pipe_operation = LINK_UP
    #   # Sending the sequence item to the analysis components
    #   ap_sent.write(pipe_seq_item_h)
    # endfunction

    # def notify_link_up_received(self) :
    #   # Creating the sequnce item
    #   pipe_seq_item pipe_seq_item_h
    #   pipe_seq_item_h = pipe_seq_item.type_id.create("pipe_seq_item_h")
    #   # Determining the detected operation
    #   pipe_seq_item_h.pipe_operation = LINK_UP
    #   # Sending the sequence item to the analysis components
    #   ap_received.write(pipe_seq_item_h)
    # endfunction

    def notify_tlp_sent(self,tlp) :
    # Creating the sequnce item
        # self.pipe_seq_item pipe_seq_item_h
        pipe_seq_item_h = pipe_seq_item("pipe_seq_item_h")
        # Determining the detected operation
        pipe_seq_item_h.pipe_operation = TLP_TRANSFER
        # Copying the data of the tlp to the sequence item
        pipe_seq_item_h.tlp = tlp
        # Sending the sequence item to the analysis components
        self.ap_sent.write(pipe_seq_item_h)
    #uvm_info(get_name(), "notify tlp_sent", UVM_MEDIUM)
    #uvm_info(get_name(), sv.sformatf("tlp_sent_size = %d",len(tlp)), UVM_MEDIUM)

    def notify_tlp_received(self,tlp) :
        # Creating the sequnce item
        # pipe_seq_item pipe_seq_item_h
        pipe_seq_item_h = pipe_seq_item("pipe_seq_item_h")
        # Determining the detected operation
        pipe_seq_item_h.pipe_operation = TLP_TRANSFER
        # Copying the data of the tlp to the sequence item
        pipe_seq_item_h.tlp = tlp
        # Sending the sequence item to the analysis components
        self.ap_received.write(pipe_seq_item_h)
        #uvm_info(get_name(), "notify tlp_rec", UVM_MEDIUM)
        #uvm_info(get_name(), sv.sformatf("tlp_rec_size = %d",len(tlp)), UVM_MEDIUM)
        

    def notify_dllp_sent(self,dllp) :
        # Creating the sequnce item
        # pipe_seq_item pipe_seq_item_h
        pipe_seq_item_h = pipe_seq_item("pipe_seq_item_h")
        # Determining the detected operation
        pipe_seq_item_h.pipe_operation = DLLP_TRANSFER
        # Copying the data of the tlp to the sequence item
        pipe_seq_item_h.dllp = dllp
        # Sending the sequence item to the analysis components
        self.ap_sent.write(pipe_seq_item_h)
        #uvm_info(get_name(), sv.sformatf( "notify dllp_sent: %p", dllp), UVM_MEDIUM)

    def notify_dllp_received(self,dllp) :
        # Creating the sequnce item
        # self.pipe_seq_item pipe_seq_item_h
        pipe_seq_item_h = pipe_seq_item("pipe_seq_item_h")
        # Determining the detected operation
        pipe_seq_item_h.pipe_operation = DLLP_TRANSFER
        # Copying the data of the tlp to the sequence item
        pipe_seq_item_h.dllp = dllp
        # Sending the sequence item to the analysis components
        self.ap_received.write(pipe_seq_item_h)
        #uvm_info(get_name(), "notify dllp_rec", UVM_MEDIUM)

    # def notify_enter_recovery_sent(self):
    #   # Creating the sequnce item
    #   pipe_seq_item pipe_seq_item_h
    #   pipe_seq_item_h = pipe_seq_item.type_id.create("pipe_seq_item_h")
    #   # Determining the detected operation
    #   pipe_seq_item_h.pipe_operation = ENTER_RECOVERY
    #   # Sending the sequence item to the analysis components
    #   ap_sent.write(pipe_seq_item_h)
    # endfunction

    # def notify_enter_recovery_received(self)
    #   pipe_seq_item pipe_seq_item_h
    #   pipe_seq_item_h = pipe_seq_item.type_id.create("pipe_seq_item_h")
    #   # Wait till the sequence finishes the link up
    #   @(pipe_agent_config_h.recovery_finished_e)
    #   # Determining the detected operation
    #   pipe_seq_item_h.pipe_operation = ENTER_RECOVERY
    #   # Sending the sequence item to the analysis components
    #   ap_received.write(pipe_seq_item_h)
    # endfunction

    # def notify_gen_change_sent(self,gen_t gen) :
    #   # Creating the sequnce item
    #   pipe_seq_item pipe_seq_item_h
    #   pipe_seq_item_h = pipe_seq_item.type_id.create("pipe_seq_item_h")
    #   # Determining the detected operation
    #   pipe_seq_item_h.pipe_operation = SPEED_CHANGE
    #   # Copying the value of the generation to the sequence item
    #   pipe_seq_item_h.gen = gen
    #   # Sending the sequence item to the analysis components
    #   ap_sent.write(pipe_seq_item_h)
    # endfunction

    # def notify_gen_change_received(self,gen_t gen) :
    #   # Creating the sequnce item
    #   pipe_seq_item pipe_seq_item_h
    #   pipe_seq_item_h = pipe_seq_item.type_id.create("pipe_seq_item_h")
    #   # Determining the detected operation
    #   pipe_seq_item_h.pipe_operation = SPEED_CHANGE
    #   # Copying the value of the generation to the sequence item
    #   pipe_seq_item_h.gen = gen
    #   # Sending the sequence item to the analysis components
    #   ap_received.write(pipe_seq_item_h)
    # endfunction

    def notify_reset_detected(self):
        # Creating the sequnce item
        # pipe_seq_item pipe_seq_item_h
        pipe_seq_item_h = pipe_seq_item("pipe_seq_item_h")
        # Determining the detected operation
        pipe_seq_item_h.pipe_operation = RESET
        # Sending the sequence item to the analysis components
        self.ap_received.write(pipe_seq_item_h)
        self.pipe_agent_config_h.reset_detected_e.set()
        

    def notify_receiver_detected(self) :
        self.pipe_agent_config_h.receiver_detected_e.set()

    # def notify_pclk_rate_change_sent(self,pclk_rate_t  pclk_rate) :
    #   # Creating the sequnce item
    #   pipe_seq_item pipe_seq_item_h
    #   pipe_seq_item_h = pipe_seq_item.type_id.create("pipe_seq_item_h")
    #   # Determining the detected operation
    #   pipe_seq_item_h.pipe_operation = PCLK_RATE_CHANGE
    #   # Copying the value of the PCLK rate to the sequence item
    #   pipe_seq_item_h.pclk_rate = pclk_rate
    #   # Sending the sequence item to the analysis components
    #   ap_sent.write(pipe_seq_item_h)
    # endfunction

    # def notify_pclk_rate_change_received(self,pclk_rate_t  pclk_rate) :
    #   # Creating the sequnce item
    #   pipe_seq_item pipe_seq_item_h
    #   pipe_seq_item_h = pipe_seq_item.type_id.create("pipe_seq_item_h")
    #   # Determining the detected operation
    #   pipe_seq_item_h.pipe_operation = PCLK_RATE_CHANGE
    #   # Copying the value of the PCLK rate to the sequence item
    #   pipe_seq_item_h.pclk_rate = pclk_rate
    #   # Sending the sequence item to the analysis components
    #   ap_received.write(pipe_seq_item_h)
    # endfunction

    def DUT_polling_state_start(self) :
    #`uvm_info (get_type_name (), sv.sformatf ("DUT_polling_state_start is called"), UVM_MEDIUM)
        self.pipe_agent_config_h.DUT_start_polling_e.set()


    def notify_idle_data_received(self) :
        # Creating the sequnce item
        # pipe_seq_item pipe_seq_item_h
        pipe_seq_item_h = pipe_seq_item("pipe_seq_item_h")
        # Determining the detected operation
        pipe_seq_item_h.pipe_operation = IDLE_DATA_TRANSFER
        # Sending the sequence item to the analysis components
        self.ap_received.write(pipe_seq_item_h)
        #uvm_info("pipe_monitor", "idle gat_tx", UVM_MEDIUM)
        #`uvm_info (get_type_name (), sv.sformatf ("notify_idle_data_received is called"), UVM_MEDIUM)
        self.pipe_agent_config_h.idle_data_detected_e.set()
        #`uvm_info (get_type_name (), sv.sformatf ("idle_event_triggered"), UVM_MEDIUM)

    def notify_idle_data_sent(self):
        # Creating the sequnce item
        # pipe_seq_item pipe_seq_item_h
        pipe_seq_item_h = pipe_seq_item("pipe_seq_item_h")
        # Determining the detected operation
        pipe_seq_item_h.pipe_operation = IDLE_DATA_TRANSFER
        # Sending the sequence item to the analysis components
        self.ap_received.write(pipe_seq_item_h)
        #uvm_info("pipe_monitor", "idle gat", UVM_MEDIUM)





class pipe_driver(uvm_driver): #(pipe_seq_item)
    
        
    def __init__(self, name = "pipe_driver", parent=None):
        self.pipe_driver_bfm_h = None  # type: pipe_driver_bfm_param  
        self.pipe_agent_config_h = None  # type: pipe_agent_config  
        super().__init__(name, parent)


    def build_phase(self):
        super().build_phase()
        uvm_info(get_name(), "Enter pipe_driver build_phase", UVM_MEDIUM)
        uvm_info(get_name(), "Exit pipe_driver build_phase", UVM_MEDIUM)
        

    def connect_phase(self):
        super().connect_phase(phase)
        uvm_info(get_name(), "Enter pipe_driver connect_phase", UVM_MEDIUM)
        pipe_driver_bfm_h = pipe_agent_config_h.pipe_driver_bfm_h
        uvm_info(get_name(), "Exit pipe_driver connect_phase", UVM_MEDIUM)
    

    async def run_phase(self):  # task
        # pipe_seq_item pipe_seq_item_h
        uvm_info(get_name(), "Enter pipe_driver run_phase", UVM_MEDIUM)
        while(1):
            pipe_seq_item_h = seq_item_port.get_next_item()
            match pipe_seq_item_h.pipe_operation:
                case SEND_TS: 
                    pipe_driver_bfm_h.send_ts(pipe_seq_item_h.ts_sent)
                case SEND_TSES: 
                    pipe_driver_bfm_h.send_tses(pipe_seq_item_h.tses_sent)
                case SEND_EIOS:
                    pipe_driver_bfm_h.send_eios()
                case SEND_EIEOS:
                    pipe_driver_bfm_h.send_eieos()
                case SET_GEN:
                    pipe_driver_bfm_h.current_gen=pipe_seq_item_h.gen
                case SEND_DATA: 
                    pipe_driver_bfm_h.send_data ()
                case IDLE_DATA_TRANSFER: 
                    pipe_driver_bfm_h.send_idle_data()
                case TLP_TRANSFER: 
                    pipe_driver_bfm_h.send_tlp(pipe_seq_item_h.tlp)
                case DLLP_TRANSFER: 
                    pipe_driver_bfm_h.send_dllp(pipe_seq_item_h.dllp)
                # PCLK_RATE_CHANGE: pipe_driver_bfm_h.change_pclk_rate(pipe_seq_item_h.pclk_rate)
                # WIDTH_CHANGE: pipe_driver_bfm_h.change_width(pipe_seq_item_h.pipe_width)
                # SPEED_CHANGE: pipe_driver_bfm_h.change_speed()
                case CHECK_EQ_PRESET_APPLIED: 
                    pipe_driver_bfm_h.eqialization_preset_applied()
                case SET_EQ_PARAM:
                    pipe_driver_bfm_h.set_eq_param(  pipe_seq_item_h.lf_usp,
                                                            pipe_seq_item_h.fs_usp,
                                                            pipe_seq_item_h.lf_dsp,
                                                            pipe_seq_item_h.fs_dsp,
                                                            pipe_seq_item_h.cursor,
                                                            pipe_seq_item_h.pre_cursor,
                                                            pipe_seq_item_h.post_cursor,
                                                            pipe_seq_item_h.tx_preset,
                                                            pipe_seq_item_h.rx_preset_hint,
                                                            pipe_seq_item_h.local_txPreset_coefficients)

                #SEND_IDLE_DATA: pipe_driver_bfm_h.send_idle_data(pipe_seq_item_h.start_lane, pipe_seq_item_h.end_lane)
                case ASSERT_EVAL_FEEDBACK_CHANGED:
                    assert(pipe_driver_bfm_h.eval_feedback_was_asserted == 1)
                    # "Link eval feedback wasn't asserted"      
            seq_item_port.item_done()
            uvm_info(get_name(), "Exit pipe_driver run_phase", UVM_MEDIUM)




class pipe_agent(uvm_agent):
    
    #  pipe_driver                       pipe_driver_h
    #  pipe_monitor                      pipe_monitor_h
    #  pipe_sequencer                    pipe_sequencer_h
    #  pipe_coverage_monitor             pipe_coverage_monitor_h
    #  pipe_agent_config                 pipe_agent_config_h
    
    #  uvm_analysis_port #(pipe_seq_item) ap_sent
    #  uvm_analysis_port #(pipe_seq_item) ap_received

    def __init__(self, name = "pipe_agent_h", parent=None):
        super().__init__(name, parent)
        self.pipe_driver_h = None  # type: pipe_driver  
        self.pipe_monitor_h = None  # type: pipe_monitor  
        self.pipe_sequencer_h = None  # type: pipe_sequencer  
        self.pipe_coverage_monitor_h = None  # type: pipe_coverage_monitor  
        self.pipe_agent_config_h = None  # type: pipe_agent_config  
        self.t = None  # type: ap_sen  
        self.d = None  # type: ap_receive  


    def build_phase(self):
        # uvm_info(get_name(), "Building pipe agent", `COMPONENT_STRUCTURE_VERBOSITY)
        # Get configuration object from UVM database
        if (not UVMConfigDb.get(self, "", "pipe_agent_config_h", pipe_agent_config_h)):
            uvm_fatal(self.get_name(), "Can't get PIPE Agent configuration object")
        
        self.ap_sent = new("ap_sent", self)
        self.ap_received = new("ap_received", self)
        
        # creating standard objects in every agent (Monitor, Analysis Port)
        self.pipe_monitor_h = pipe_monitor.type_id.create("pipe_monitor_h", self)
        self.pipe_monitor_h.pipe_agent_config_h = self.pipe_agent_config_h

        # check if the agent is configured to have coverage monitor
        if(pipe_agent_config_h.has_coverage_monitor):
            self.pipe_coverage_monitor_h = pipe_coverage_monitor.type_id.create("pipe_coverage_monitor_h", self)
        
        # check if the agent is configured to be active (have a driver)
        if(pipe_agent_config_h.active == UVM_ACTIVE):
            self.pipe_driver_h = pipe_driver.type_id.create("pipe_driver", self)
            self.pipe_driver_h.pipe_agent_config_h = self.pipe_agent_config_h
            self.pipe_sequencer_h = pipe_sequencer.type_id.create("pipe_sequencer_h", self)
        
    
    def connect_phase(self):
        super().connect_phase()
        # uvm_info(get_name(), "Pipe agent connect phase", `COMPONENT_STRUCTURE_VERBOSITY)
        # connecting monitor analysis port by the agent analysis port
        pipe_monitor_h.ap_sent.connect(self.ap_sent)
        pipe_monitor_h.ap_received.connect(self.ap_received)


        if(self.pipe_agent_config_h.has_coverage_monitor): 
            self.pipe_monitor_h.ap_received.connect(self.pipe_coverage_monitor_h.analysis_export_received)
            self.pipe_monitor_h.ap_sent.connect(self.pipe_coverage_monitor_h.analysis_export_sent)
        
        # check ig agent is active
        if(pipe_agent_config_h.active == UVM_ACTIVE):
            # connecting driver sequence item port with the driver sequence item export
            pipe_driver_h.seq_item_port.connect(pipe_sequencer_h.seq_item_export)
        # uvm_info(get_name(), "Connect phase of pipe agent finished", `COMPONENT_STRUCTURE_VERBOSITY)  