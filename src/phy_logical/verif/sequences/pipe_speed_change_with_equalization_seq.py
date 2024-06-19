from cocotb.triggers import *
from pipe_base_seq import *
from pipe_agent import pipe_seq_item
class pipe_speed_change_with_equalization_seq(pipe_base_seq):
    #
    #	`uvm_object_utils(pipe_speed_change_with_equalization_seq)
    #
    #  int max_supported_gen_by_dsp=`MAX_GEN_FAR_PARTENER
    #  int max_supported_gen_by_usp=`MAX_GEN_DUT
    #  int negotaited_rate
    #  logic [7:0] control_reg [`NUM_OF_LANES]
    #  rand bit [2:0] my_rx_preset_hint
    #  rand bit [3:0] my_tx_preset;	
    #  rand bit [17:0] my_local_txPreset_coefficients
    #  rand bit [5:0] lf_usp
    #  rand bit [5:0] fs_usp
    #  rand bit [5:0] lf_dsp
    #  rand bit [5:0] fs_dsp
    #  rand bit [5:0] pre_cursor
    #  rand bit [5:0] cursor
    #  rand bit [5:0] post_cursor
    #  rand bit enter_phase_2_3
    #
    #
    #
    #  # Standard UVM Methods:
    #  extern def __init__(self, name = "pipe_speed_change_with_equalization_seq")
    #  extern def automatic int calc_gen(self,input logic[1:0] width, input logic[4:0] PCLKRate ):
    #async
    #  extern task body
    #
    #async
    #  extern def send_seq_item(self,ts_s tses [`NUM_OF_LANES])
    #async
    #  extern def get_tses_recived(self,output ts_s tses [`NUM_OF_LANES] )
    #
    #endclass:pipe_speed_change_with_equalization_seq
    #    self.max_supported_gen_by_dsp = `MAX_GEN_FAR_PARTENER  # type: int  
    #    self.max_supported_gen_by_usp = `MAX_GEN_DUT  # type: int  
    #    self.negotaited_rate = 0  # type: int  
    #    self.control_reg = None  # type: logic [7:0] [`NUM_OF_LANES]
    #    self.my_rx_preset_hint = 0x0  # type: bit [2:0] 
    #    self.my_tx_preset = 0x0  # type: bit [3:0] 
    #    self.my_local_txPreset_coefficients = 0x0  # type: bit [17:0] 
    #    self.lf_usp = 0x0  # type: bit [5:0] 
    #    self.fs_usp = 0x0  # type: bit [5:0] 
    #    self.lf_dsp = 0x0  # type: bit [5:0] 
    #    self.fs_dsp = 0x0  # type: bit [5:0] 
    #    self.pre_cursor = 0x0  # type: bit [5:0] 
    #    self.cursor = 0x0  # type: bit [5:0] 
    #    self.post_cursor = 0x0  # type: bit [5:0] 
    #    self.enter_phase_2_3 = 0x0  # type: bit  
#
    def __init__(self, name = "pipe_speed_change_with_equalization_seq"):
        super().__init__(name)

    async def body(self):  # task

        pipe_seq_item_h = pipe_seq_item("pipe_seq_item")
        tses_send = [ts_s()] * NUM_OF_LANES
        tses_recv =  [ts_s()] * NUM_OF_LANES
        flag = bool 
        ts_recived_count = int
        ts_sent_count = int


        # setting generation in driver bfm to GEN1
        pipe_seq_item_h.gen = gen_t.GEN1
        pipe_seq_item_h.pipe_operation= pipe_operation_t.SET_GEN
        await self.start_item(pipe_seq_item_h)
        await self.finish_item(pipe_seq_item_h)

        # inform the BFM what values Equalization parameters
        pipe_seq_item_h.lf_usp=self.lf_usp
        pipe_seq_item_h.fs_usp=self.fs_usp
        pipe_seq_item_h.lf_dsp=self.lf_dsp
        pipe_seq_item_h.fs_dsp=self.fs_dsp
        pipe_seq_item_h.cursor=self.cursor
        pipe_seq_item_h.pre_cursor=self.pre_cursor
        pipe_seq_item_h.post_cursor=self.post_cursor
        pipe_seq_item_h.tx_preset=self.my_tx_preset
        pipe_seq_item_h.rx_preset_hint=self.my_rx_preset_hint
        pipe_seq_item_h.local_txPreset_coefficients=self.my_local_txPreset_coefficients
        pipe_seq_item_h.pipe_operation= pipe_operation_t.SET_EQ_PARAM
        await self.start_item (pipe_seq_item_h)
        await self.finish_item (pipe_seq_item_h)

        #***********************************step 1 (gen 1): each device transmits TS1 Ordered Sets with speed change bit set. For both the devices, next state is Recovery.RcvrCfg after receiving 8 TS1 OS.*/
        flag=0
        ts_recived_count = 0
        ts_sent_count=0
        def send_ts1s(self):
            nonlocal flag
            nonlocal tses_send
            while True:
                # tses_send = tses
                for i in range(len(tses_send)):
                    tses_send[i].speed_change = 1
                    # sv.cast(tses_send[i].max_gen_supported , self.max_supported_gen_by_dsp)
                    tses_send[i].ts_type = pipe_operation_t.TS1
                self.send_seq_item(tses_send)
                if(flag):
                    break
        def recieve_8_ts1s(self):
            nonlocal flag
            while True:
                self.get_tses_recived(tses_recv)
                assert(tses_recv[0].ts_type == TS1  and  tses_recv[0].speed_change) else 
                # uvm_fatal("pipe_speed_change_without_eq_dsp_seq", "received tses not as expecting step 1")
                ts_recived_count += 1
                if(ts_recived_count >= 8):
                    flag = 1
                    break
        
        fork1 = cocotb.start_soon(send_ts1s())
        fork2 = cocotb.start_soon(recieve_8_ts1s())
        await Combine(fork1,fork2)
            
        # ************************************step 2 (gen 1): send EQ TS2s with Transmitter Preset and Receiver Preset hint fields until 8 normal  TS2s are recived from the UPS*******************************/
        flag = 0
        ts_recived_count = 0
        ts_sent_count=0; 
        fork
            # send TS2s
            begin
                tses_send = super().tses
                for i in range(len(tses_send))::
            tses_send[i].speed_change = 1'b1
            sv.cast(tses_send[i].max_gen_supported , self.max_supported_gen_by_dsp)
            tses_send[i].ts_type = TS2
            tses_send[i].rx_preset_hint = my_rx_preset_hint; 	# as if it is taken  from control register
            tses_send[i].tx_preset = my_tx_preset;				# as if it is taken from control register
            tses_send[i].equalization_command = 1
                end
                while(1):
                self.send_seq_item(tses_send)
                if(flag) break
                end
            end
            # recv TS2
            begin
                while(1):
            self.get_tses_recived(tses_recv)
            assert(tses_recv[0].ts_type == TS2) else 
                uvm_fatal("pipe_speed_change_without_eq_dsp_seq", "received tses not as expecting step 2")
            ts_recived_count += 1
            if(ts_recived_count >= 8):
                flag = 1
                break
            end
            end
            end
        join
        #******************************************************************************************************************************************#

        #**************************************************step 3 (gen1 --> gen 2,3,4,5):sending and reciving EIOS and EIEOS and asserting PCLKRate, Rate, width *****************************************************/ 
        # receive and send EIOS before enter rec.speed
        flag = 0
        fork
        #send EIOS until receive EIOS
        while(!flag):
            pipe_seq_item_h.pipe_operation=SEND_EIOS
            start_item (pipe_seq_item_h)
            finish_item (pipe_seq_item_h)
        end
        # Wait to receive EIOS
        begin
            await Edge(pipe_agent_config_h.detected_eios_e)
            flag=1
        end
        join
        # wait for TxElecIdle and RxStandby to be asserted
        await Edge(pipe_agent_config_h.detected_TxElecIdle_and_RxStandby_asserted_e)

        # figuring out what is the negotiated gen
        if(max_supported_gen_by_dsp>max_supported_gen_by_usp)
        negotaited_rate=max_supported_gen_by_usp
        else
        negotaited_rate=max_supported_gen_by_dsp

        # setting generation in driver bfm to the negotaited GEN
        sv.cast(pipe_seq_item_h.gen , negotaited_rate)
        pipe_seq_item_h.pipe_operation=SET_GEN
        start_item (pipe_seq_item_h)
        finish_item (pipe_seq_item_h)

        # receive and send EIEOS after changing speed to exit electic idle 
        flag = 0
        fork
        #send EIEOS until receive EIEOS
        while(!flag):
            pipe_seq_item_h.pipe_operation=SEND_EIEOS
            start_item (pipe_seq_item_h)
            finish_item (pipe_seq_item_h)
        end
        # Wait to receive EIEOS
        begin
            if(negotaited_rate<=2)begin
            await Edge(pipe_agent_config_h.detected_eieos_e)
            flag=1
            end
            else begin
            await Edge(pipe_agent_config_h.detected_eieos_gen3_e)
            flag=1
            end
        end
        join

        #assert width
        case (negotaited_rate)
        1:begin assert(pipe_agent_config_h.new_width==`GEN1_PIPEWIDTH)else uvm_error(get_name(), "width not right");end
        2:begin assert(pipe_agent_config_h.new_width==`GEN2_PIPEWIDTH)else uvm_error(get_name(), "width not right");end
        3:begin assert(pipe_agent_config_h.new_width==`GEN3_PIPEWIDTH)else uvm_error(get_name(), "width not right");end
        4:begin assert(pipe_agent_config_h.new_width==`GEN4_PIPEWIDTH)else uvm_error(get_name(), "width not right");end
        5:begin assert(pipe_agent_config_h.new_width==`GEN5_PIPEWIDTH)else uvm_error(get_name(), "width not right");end 
        default: uvm_error(get_name(), "negotaited_rate not right")
        endcase
        #assert Rate
        assert(pipe_agent_config_h.new_Rate==negotaited_rate)elseuvm_error(get_name(), "Rate signal not right")
        #assert PCLKRate
        assert(negotaited_rate==calc_gen(pipe_agent_config_h.new_width,pipe_agent_config_h.new_PCLKRate))elseuvm_error(get_name(), "PCLKRate signal not right"); 
        #************************************************************************************************************************************************************************/
        

        #check that they applied the requested Tx preset  
        pipe_seq_item_h = pipe_seq_item.type_id.create("pipe_seq_item")
        start_item (pipe_seq_item_h)
        if (not pipe_seq_item_h.randomize() with {pipe_operation == CHECK_EQ_PRESET_APPLIED;}):
            uvm_error(get_name(), "")
        end
        finish_item (pipe_seq_item_h)
        #****************************************step 4 a&b (gen 2,3,4,5):phase 0,1:usp sends with EC = 00b and Tx_preset  it received in EQ TS2 ,  DSP will be in Phase one ending TS1 with EC = 01b  and its FS and LF values  and his post cursor coefficient and his Tx presets until usp sends TS1 with ec=1************************************/
        flag = 0
        fork
                # send TS1s with ec = 1 , dsp_LF, dsp_FS and my own Tx preset hint and post cursor 
            begin
                while(1):
                    tses_send = super().tses
                    for i in range(len(tses_send))::
                tses_send[i].ts_type = TS1
                tses_send[i].ec = 1; 													
                tses_send[i].lf_value = lf_dsp;										
                tses_send[i].fs_value = fs_dsp;										
                tses_send[i].post_cursor = 0;									    #  dummy numbers NOTE: bt3ty ana al mara dy(mlhomsh lazma fe el flow)
                tses_send[i].tx_preset = 0;										#  dummy numbers NOTE: bt3ty ana al mara dy(mlhomsh lazma fe el flow)
                end
                self.send_seq_item(tses_send)
                if(flag) break
            end
            end
            begin
                # recv TS1s until a TS1 with ec = 1, then the previous TSs should be with ec = 0
                while(1):
                    self.get_tses_recived(tses_recv)
                    if(tses_recv[0].ts_type == TS1  and 	tses_recv[0].ec == 1 )begin
                        assert(	(tses_recv[0].ts_type == TS1)   and  (tses_recv[0].lf_value==lf_usp)  and  (tses_recv[0].fs_value==fs_usp) ) else uvm_error(get_name(), "received tses not as expecting step 4.1")
                        flag=1
                        break
                    end 
                    assert(	(tses_recv[0].ts_type == TS1)   and  (tses_recv[0].tx_preset == my_tx_preset)  and  (tses_recv[0].ec == 0) ) else uvm_error(get_name(), "received tses not as expecting step 4.2")
                end
            end
        join
        #************************************************************************************************************************************************************************/
        #****************************************step 4.c.(1&2) (gen 2,3,4,5):phase 2:dsp sends with EC = 2 to indicate that phase 2 and 3 are needed till it receives TS1 with ec=2************************************/

        flag = 0
        if (not self.enter_phase_2_3):
            fork
                # send TS1s with ec = 2 to indicate that phase2/3 are needed
                begin
                    while(1):
                        tses_send = super().tses
                        for i in range(len(tses_send))::
                        tses_send[i].ts_type = TS1
                        tses_send[i].ec = 2; 
                    end
                    self.send_seq_item(tses_send)
                    if(flag) break
                    end
                end
                # recv TS1s with ec = 2
                begin
                    while(1):
                        self.get_tses_recived(tses_recv)
                        assert(tses_recv[0].ts_type == TS1) else uvm_fatal("pipe_speed_change_without_eq_dsp_seq", "received tses not as expecting step 4.3")
                        if (tses_recv[0].ec == 2)  begin
                            flag = 1
                            break
                        end
                end
                end
            join
        #************************************************************************************************************************************************************************/
        #****************************************step 4.c.(3&4) (gen 2,3,4,5):phase 2:usp sends TS1 requsting some cofftions , dsp returns same cofftions and apply it ,usp asks phy if this is good the pyh responds yes so usp sends ec=3************************************/
            # the recived TS1 will contain values to be applied in the DSP
            flag=0
            ts_recived_count = 0
            ts_sent_count=0

            fork
                # send TS1s with wich echo what you received
                begin
                    # send untill USP is satisfied and echo back with ec=3
                    while(1):
                        tses_send = tses_recv
                        for i in range(len(tses_send))::
                        tses_send[i].rcv = 0; 
                    end
                    self.send_seq_item(tses_send)
                    if(flag) break
                    end
                end
                # recv 2 TS1s with ec = 3 back to back
                begin
                    while(1):
                    self.get_tses_recived(tses_recv)
                    assert(tses_recv[0].ts_type == TS1) else uvm_fatal("pipe_speed_change_with_equalization_seq", "received tses not as expecting step 4.4")
                    if (tses_recv[0].ec == 3) ts_recived_count += 1
                    else ts_recived_count = 0
                    if(ts_recived_count == 2):
                        flag = 1
                        break
                    end
                end
                end
            join
            #asserts that the DUT actually asked the phy for evaluation
            pipe_seq_item_h = pipe_seq_item.type_id.create("pipe_seq_item")
            start_item (pipe_seq_item_h)
                if (not pipe_seq_item_h.randomize() with {pipe_operation == ASSERT_EVAL_FEEDBACK_CHANGED;}):
                uvm_error(get_name(), "DUT didnot ask for evalution")
                end
            finish_item (pipe_seq_item_h)
        #************************************************************************************************************************************************************************/
        #***********************************************step 4.d (gen 2,3,4,5):phase 3: dsp sends cofftions and use preset=0 and ec=3, usp echo the tses and should apply those cofftions on TxDeemph signa****************************/  
            flag=0
            ts_recived_count = 0
            ts_sent_count=0
            # change the cofftions to make sure TxDeemph will be changed
            self.cursor=1
            self.pre_cursor=2
            self.post_cursor=3

            fork
                # send TS1s with required coftions(which are just 1 2 3) and ec = 3 till uou recive two back to back tses
                begin
                    while(1):
                        tses_send = super().tses
                        for i in range(len(tses_send))::
                            tses_send[i].ts_type = TS1
                            tses_send[i].use_preset = 0
                            tses_send[i].cursor = self.cursor
                            tses_send[i].pre_cursor = self.pre_cursor
                            tses_send[i].post_cursor = self.post_cursor
                            tses_send[i].ec = 3; 
                        end
                        self.send_seq_item(tses_send)
                        if(flag) break
                    end
                end
                # recv 2 TS1s with ec = 3 that echo the sent cofftions and assert that TxDeemph has changed
                begin
                    while(1):
                    self.get_tses_recived(tses_recv)
                    assert(	(tses_recv[0].ts_type == TS1) and (tses_recv[0].rcv==0)  and  (tses_recv[0].cursor == self.cursor)  and  (tses_recv[0].pre_cursor == self.pre_cursor)  and  (tses_recv[0].post_cursor == self.post_cursor)  and  (tses_recv[0].ec == 3) ) else uvm_fatal("pipe_speed_change_without_eq_dsp_seq", "")
                    assert(pipe_agent_config_h.new_TxDeemph == {self.pre_cursor, self.cursor, self.post_cursor}) elseuvm_fatal("pipe_speed_change_with_equalization_seq", "TxDeemph have wrong values ")
                    ts_recived_count += 1
                    if(ts_recived_count == 2):
                        flag = 1
                        break
                    end
                end
                end
            join
        end
        #************************************************************************************************************************************************************************/
        #*******************************************************step 4.e(gen 2,3,4,5):dsp starts to send TS1 with EC=0 to indicate the end of Equalization till it receives two back to back TS1 with EC =0**************************************************/	 
            flag=0
            ts_recived_count = 0
            ts_sent_count=0
            fork
                # send TS1s with ec = 0 to indicate that equalization is ended
                begin
                    while(1):
                    tses_send = super().tses
                    for i in range(len(tses_send))::
                    tses_send[i].ts_type = TS1
                    tses_send[i].ec = 0; 
                end
                self.send_seq_item(tses_send)
                if(flag) break
                end
                end
                # recv two TS1s with ec = 0
                begin
                    while(1):
                        self.get_tses_recived(tses_recv)
                        assert(tses_recv[0].ts_type == TS1) else uvm_fatal("pipe_speed_change_with_equalization_seq", "received tses not as expecting step 4.3")
                        if (tses_recv[0].ec == 0) ts_recived_count += 1
                        else ts_recived_count = 0
                        if(ts_recived_count == 2):
                            flag = 1
                        break
                    end
                end
            end
        join
        #************************************************************************************************************************************************************************/
        #*****************************************************step 5(step 7&8 in speed change without eq)(gen 2,3,4,5):send TS1 with speed_change bit=0 until TS2 that  have the Speed Change bit=0  is recived from USP*********************/ 
        # start sending TS1 and wait for TS2
        flag = 0
        fork

        while(1):
            tses_send  = super().tses
            for i in range(len(tses_send))::
            tses_send[i].speed_change = 1'b0
            sv.cast(tses_send[i].max_gen_supported , self.max_supported_gen_by_dsp)
            tses_send[i].ts_type = TS1
            end
            self.send_seq_item(tses_send)
            if(flag) break
        end

        begin
            while(1):
                self.get_tses_recived(tses_recv)
                if(tses_recv[0].ts_type == TS2):
                    for i in range(len(tses_recv))::
                        assert(!tses_recv[i].speed_change  and  tses_recv[i].ts_type == TS2) else uvm_fatal("pipe_speed_change_without_eq_dsp_seq", "received tses not as expecting step 5.1")
                    end
                    flag = 1
                    break
                end
            end
        end
        join
        #************************************************************************************************************************************************************************/
        #*********************************************step 5 (step 9 in speed change without EQ)(gen 2,3,4,5):send and receive TS2 until 8 or more TS2 are sent and 8 or more TS2 are recived****************************/	 
        flag = 0
        ts_sent_count = 0
        ts_recived_count = 0
        fork
        # send TS2 until 8 or more TS2 are sent and 8 or more TS2 are recived
        while((ts_sent_count < 8)  and  (ts_recived_count < 8)):
            tses_send  = super().tses
            for i in range(len(tses_send))::
            tses_send[i].speed_change = 1'b0
            sv.cast(tses_send[i].max_gen_supported , self.max_supported_gen_by_dsp)
            tses_send[i].ts_type = TS2
            end
            self.send_seq_item(tses_send)
            ts_sent_count += 1
        end
        # receive TS2 until 8 or more TS2 are sent and 8 or more TS2 are recived
        begin
            while((ts_sent_count < 8)  and  (ts_recived_count < 8)):
            self.get_tses_recived(tses_recv)
            for i in range(len(tses_recv))::
                assert(!tses_recv[i].speed_change  and  tses_recv[i].ts_type == TS2) else 
                uvm_fatal("pipe_speed_change_without_eq_dsp_seq", "received tses not as expecting step 5.2")
            end
            ts_recived_count += 1
            end
        end
        join
        #************************************************************************************************************************************************************************/
        #****************************************************step 5( step 10&11 in speed change without EQ) (gen 2,3,4,5):sending idle data******************************************************************************/

        flag=0
        fork
        begin
            int i
            while(1):
            pipe_seq_item_h.pipe_operation=IDLE_DATA_TRANSFER
            start_item (pipe_seq_item_h)
            finish_item (pipe_seq_item_h)
            pipe_seq_item_h.pipe_operation=pipe_agent_pkg::SEND_DATA
            start_item (pipe_seq_item_h)
            finish_item (pipe_seq_item_h)
            if(flag) break
            end
            for ( i = 0;i<16 ;i=i+1 ):
            pipe_seq_item_h.pipe_operation=IDLE_DATA_TRANSFER
            start_item (pipe_seq_item_h)
            finish_item (pipe_seq_item_h)
            pipe_seq_item_h.pipe_operation=pipe_agent_pkg::SEND_DATA
            start_item (pipe_seq_item_h)
            finish_item (pipe_seq_item_h)
            end
        end
        begin
            int i
            await Edge(pipe_agent_config_h.idle_data_detected_e)
            flag=1
            for (i =0 ;i<7;i=i+1):
            await Edge(pipe_agent_config_h.idle_data_detected_e)
            end
        end
        
        join

    async def send_seq_item(self,tses):  # task
        pipe_seq_item_h = pipe_seq_item("pipe_seq_item")
        pipe_seq_item_h.tses_sent = tses
        pipe_seq_item_h.pipe_operation = pipe_operation_t.SEND_TSES
        await self.start_item (pipe_seq_item_h)
        await self.finish_item (pipe_seq_item_h)
#  
#async
#def get_tses_recived(self,output ts_s tses [`NUM_OF_LANES]):  # task
#	await Edge(pipe_agent_config_h.detected_tses_e)
#	tses = pipe_agent_config_h.tses_received
#  endtask
#  
#def calc_gen(self,input logic[1:0] width, input logic[4:0] PCLKRate ) -> automatic int:
#	  
#  
#	real PCLKRate_value
#  real width_value
#  real freq
#  int gen
#	case(PCLKRate)
#		3'b000:PCLKRate_value=0.0625
#		3'b001:PCLKRate_value=0.125
#		3'b010:PCLKRate_value=0.25
#		3'b011:PCLKRate_value=0.5
#		3'b100:PCLKRate_value=1
#	endcase
#  
#
#	case(width)
#		2'b00:width_value=8
#		2'b01:width_value=16
#		2'b10:width_value=32
#	endcase
#
#	freq=PCLKRate_value*width_value
#
#	case(freq)
#		2:gen=1
#		4:gen=2
#		8:gen=3
#		16:gen=4
#		32:gen=5
#		default:gen=0
#	endcase
#	return gen
#  endfunction
#  # speed_change_bit            
#
#
#
