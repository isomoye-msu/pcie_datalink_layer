# ==========================================================================
#
#  Morgan State University
#  Open Hardware Acceleration Lab (HAL-O)
#
#!  Project:   Open-Source PCIe Endpoint Controller.
#   File:      pipe_speed_change_with_equalization_seq.py
#   Author:    HALO
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

from cocotb.triggers import *
from pipe_base_seq import *
from cocotb_coverage import crv
from pipe_agent import pipe_seq_item
from pipe_types import *

MAX_GEN_DUT = gen_t.GEN3
MAX_GEN_FAR_PARTENER = gen_t.GEN3


class pipe_speed_change_with_equalization_seq(pipe_base_seq, crv.Randomized):

    def __init__(self, name="pipe_speed_change_with_equalization_seq"):
        super().__init__(name)
        self.max_supported_gen_by_dsp = MAX_GEN_FAR_PARTENER  # type: int
        self.max_supported_gen_by_usp = MAX_GEN_DUT  # type: int
        self.negotiated_rate = 0  # type: int
        self.control_reg = None  # type: logic [7:0] [NUM_OF_LANES]
        self.my_rx_preset_hint = 0x0  # type: bit [2:0]
        self.my_tx_preset = 0x0  # type: bit [3:0]
        self.my_local_txPreset_coefficients = 0x0  # type: bit [17:0]
        self.lf_usp = 0x0  # type: bit [5:0]
        self.fs_usp = 0x0  # type: bit [5:0]
        self.lf_dsp = 0x0  # type: bit [5:0]
        self.fs_dsp = 0x0  # type: bit [5:0]
        self.pre_cursor = 0x0  # type: bit [5:0]
        self.cursor = 0x0  # type: bit [5:0]
        self.post_cursor = 0x0  # type: bit [5:0]
        self.enter_phase_2_3 = 0x0  # type: bit
        self.name = name

    async def body(self):  # task
        self.sequencer = ConfigDB().get(None, "", "pipe_sequencer")

        assert self.sequencer is not None

        await super().body()
        uvm_root().logger.info(self.name + " Started speed change sequence")
        # self.randomize()

        pipe_seq_item_h = pipe_seq_item("pipe_seq_item")
        tses_send = [ts_s()] * NUM_OF_LANES
        tses_recv = [ts_s()] * NUM_OF_LANES
        flag = bool
        ts_recived_count = int
        ts_sent_count = int

        # setting generation in driver bfm to GEN1
        pipe_seq_item_h.gen = gen_t.GEN1
        pipe_seq_item_h.pipe_operation = pipe_operation_t.SET_GEN
        await self.start_item(pipe_seq_item_h)
        await self.finish_item(pipe_seq_item_h)

        # inform the BFM what values Equalization parameters
        pipe_seq_item_h.lf_usp = self.lf_usp
        pipe_seq_item_h.fs_usp = self.fs_usp
        pipe_seq_item_h.lf_dsp = self.lf_dsp
        pipe_seq_item_h.fs_dsp = self.fs_dsp
        pipe_seq_item_h.cursor = self.cursor
        pipe_seq_item_h.pre_cursor = self.pre_cursor
        pipe_seq_item_h.post_cursor = self.post_cursor
        pipe_seq_item_h.tx_preset = self.my_tx_preset
        pipe_seq_item_h.rx_preset_hint = self.my_rx_preset_hint
        pipe_seq_item_h.local_txPreset_coefficients = (
            self.my_local_txPreset_coefficients
        )
        pipe_seq_item_h.pipe_operation = pipe_operation_t.SET_EQ_PARAM
        self.pipe_agent_config.detected_tses_e.clear()
        await self.start_item(pipe_seq_item_h)
        await self.finish_item(pipe_seq_item_h)

        # ***********************************step 1 (gen 1): each device transmits TS1 Ordered Sets with speed change bit set. For both the devices, next state is Recovery.RcvrCfg after receiving 8 TS1 OS.*/
        flag = 0
        ts_recived_count = 0
        ts_sent_count = 0

        async def send_ts1s(self):
            nonlocal flag
            nonlocal tses_send
            while True:
                # tses_send = tses
                for i in range(len(tses_send)):
                    tses_send[i].speed_change = 1
                    tses_send[i].max_gen_supported = self.max_supported_gen_by_dsp
                    tses_send[i].ts_type = ts_type_t.TS1
                await self.send_seq_item(tses_send)
                if flag:
                    break

        async def recieve_8_ts1s(self):
            nonlocal flag
            nonlocal ts_recived_count
            while True:
                tses_recv = await self.get_tses_recieved()
                # print(repr(tses_recv[0].ts_type))
                # print(repr(tses_recv[0].speed_change))
                assert tses_recv[0].ts_type == ts_type_t.TS1
                assert tses_recv[0].speed_change
                # uvm_root().logger.info("pipe_speed_change_without_eq_dsp_seq", "received tses not as expecting step 1")
                ts_recived_count += 1
                if ts_recived_count >= 8:
                    flag = 1
                    break

        fork1 = cocotb.start_soon(send_ts1s(self))
        fork2 = cocotb.start_soon(recieve_8_ts1s(self))
        await Combine(fork1, fork2)

        # ************************************step 2 (gen 1): send EQ TS2s with Transmitter Preset and Receiver Preset hint fields until 8 normal  TS2s are recived from the UPS*******************************/
        flag = 0
        ts_received_count = 0
        ts_sent_count = 0

        async def send_ts2s(self):
            nonlocal flag
            nonlocal tses_send
            while True:
                # tses_send = tses
                for i in range(len(tses_send)):
                    tses_send[i].speed_change = 1
                    tses_send[i].max_gen_supported = self.max_supported_gen_by_dsp
                    # sv.cast(tses_send[i].max_gen_supported , self.max_supported_gen_by_dsp)
                    tses_send[i].ts_type = ts_type_t.TS2
                    tses_send[i].rx_preset_hint = self.my_rx_preset_hint
                    # as if it is taken  from control register
                    tses_send[i].tx_preset = self.my_tx_preset
                    # as if it is taken from control register
                    tses_send[i].equalization_command = 1
                await self.send_seq_item(tses_send)
                if flag:
                    break

        async def recieve_8_ts2s(self):
            nonlocal flag
            nonlocal ts_received_count
            while True:
                tses_recv = await self.get_tses_recieved()
                if tses_recv[0].ts_type == ts_type_t.TS2 and tses_recv[0].speed_change:

                    # assert(tses_recv[0].ts_type ==  ts_type_t.TS2 and  tses_recv[0].speed_change)
                    # uvm_root().logger.info("pipe_speed_change_without_eq_dsp_seq", "received tses not as expecting step 1")
                    ts_received_count += 1
                    if ts_received_count >= 8:
                        flag = 1
                        break

        fork1 = cocotb.start_soon(send_ts2s(self))
        fork2 = cocotb.start_soon(recieve_8_ts2s(self))
        await with_timeout(Combine(fork1, fork2), 10000, "ns")
        # ******************************************************************************************************************************************#

        # **************************************************step 3 (gen1 --> gen 2,3,4,5):sending and reciving EIOS and EIEOS and asserting PCLKRate, Rate, width *****************************************************/
        # receive and send EIOS before enter rec.speed
        flag = 0

        # send EIOS until receive EIOS
        async def send_eios(self):
            nonlocal flag
            while not flag:
                pipe_seq_item_h.pipe_operation = pipe_operation_t.SEND_EIOS
                await self.start_item(pipe_seq_item_h)
                await self.finish_item(pipe_seq_item_h)

        # Wait to receive EIOS
        async def wait_eios(self):
            nonlocal flag
            await self.pipe_agent_config.detected_eios_e.wait()
            flag = 1
            self.pipe_agent_config.detected_eios_e.clear()

        fork1 = cocotb.start_soon(wait_eios(self))
        fork2 = cocotb.start_soon(send_eios(self))
        await with_timeout(Combine(fork1, fork2), 4000, "ns")
        # wait for TxElecIdle and RxStandby to be asserted
        await self.pipe_agent_config.detected_TxElecIdle_and_RxStandby_asserted_e.wait()

        # figuring out what is the negotiated gen
        if self.max_supported_gen_by_dsp.value > self.max_supported_gen_by_usp.value:
            self.negotiated_rate = self.max_supported_gen_by_usp
        else:
            self.negotiated_rate = self.max_supported_gen_by_dsp

        # setting generation in driver bfm to the negotiated GEN
        pipe_seq_item_h.gen = self.negotiated_rate
        pipe_seq_item_h.pipe_operation = pipe_operation_t.SET_GEN
        await self.start_item(pipe_seq_item_h)
        await self.finish_item(pipe_seq_item_h)

        # receive and send EIEOS after changing speed to exit electic idle
        flag = 0

        # send EIEOS until receive EIEOS
        async def send_eieos(self):
            nonlocal flag
            while flag == 0:
                pipe_seq_item_h.pipe_operation = pipe_operation_t.SEND_EIEOS
                await self.start_item(pipe_seq_item_h)
                await self.finish_item(pipe_seq_item_h)

        # Wait to receive EIEOS
        async def wait_eieos(self):
            nonlocal flag
            print((self.negotiated_rate.value[0]))
            if int(self.negotiated_rate.value[0]) <= 2:
                await self.pipe_agent_config.detected_eieos_e.wait()
                flag = 1
                return
            else:
                await self.pipe_agent_config.detected_eieos_gen3_e.wait()
                self.pipe_agent_config.detected_eieos_gen3_e.clear()
                flag = 1
                return

        fork1 = cocotb.start_soon(wait_eieos(self))
        fork2 = cocotb.start_soon(send_eieos(self))
        await with_timeout(Combine(fork1, fork2), 4000, "ns")
        # assert 1 == 0

        print(self.pipe_agent_config.new_width)
        # assert width
        match self.negotiated_rate.value[0]:
            case 1:
                assert (
                    self.pipe_agent_config.new_width == gen_t.GEN1.value[0]
                )
            case 2:
                assert (
                    self.pipe_agent_config.new_width == gen_t.GEN2.value[0]
                )
            case 3:
                assert (
                    self.pipe_agent_config.new_width == gen_t.GEN3.value[0]
                )
            case 4:
                assert (
                    self.pipe_agent_config.new_width == gen_t.GEN4.value[0]
                )
            case 5:
                assert (
                    self.pipe_agent_config.new_width == gen_t.GEN5.value[0]
                )
            case _:
                uvm_root().logger.info(self.name + " " + "negotiated_rate not right")

        # assert Rate
        assert (
            self.pipe_agent_config.new_Rate == self.negotiated_rate.value[0]
        ), "Rate signal not right"
        # assert PCLKRate
        assert self.negotiated_rate.value[0] == self.calc_gen(
            self.pipe_agent_config.new_width, self.pipe_agent_config.new_PCLKRate
        ), uvm_root().logger.info(self.name, "PCLKRate signal not right")
        # ************************************************************************************************************************************************************************/

        # check that they applied the requested Tx preset
        pipe_seq_item_h = pipe_seq_item("pipe_seq_item")
        await self.start_item(pipe_seq_item_h)
        pipe_seq_item_h.randomize()
        # if (not pipe_seq_item_h.randomize() with {pipe_operation == CHECK_EQ_PRESET_APPLIED;}):
        #     uvm_root().logger.info(self.name + " ")
        await self.finish_item(pipe_seq_item_h)
        # ****************************************step 4 a&b (gen 2,3,4,5):phase 0,1:usp sends with EC = 00b and Tx_preset  it received in EQ TS2 ,  DSP will be in Phase oneing TS1 with EC = 01b  and its FS and LF values  and his post cursor coefficient and his Tx presets until usp sends TS1 with ec=1************************************/
        flag = 0
        tses_send = [ts_s()] * NUM_OF_LANES

        async def send_ts1(self):
            # send TS1s with ec = 1 , dsp_LF, dsp_FS and my own Tx preset hint and post cursor
            while True:
                nonlocal flag
                nonlocal tses_send
                for i in range(len(tses_send)):
                    tses_send[i].ts_type = ts_type_t.TS1
                    tses_send[i].ec = 1
                    tses_send[i].lf_value = self.lf_dsp
                    tses_send[i].fs_value = self.fs_dsp
                    tses_send[i].post_cursor = 0
                    #  dummy numbers NOTE: bt3ty ana al mara dy(mlhomsh lazma fe el flow)
                    tses_send[i].tx_preset = 0
                    #  dummy numbers NOTE: bt3ty ana al mara dy(mlhomsh lazma fe el flow)
                await self.send_seq_item(tses_send)
                if flag:
                    break

        async def recv_ts1(self):
            nonlocal flag
            # recv TS1s until a TS1 with ec = 1, then the previous TSs should be with ec = 0
            while True:
                tses_recv = await self.get_tses_recieved()
                if tses_recv[0].ts_type == ts_type_t.TS1 and tses_recv[0].ec == 1:
                    assert (
                        (tses_recv[0].ts_type == ts_type_t.TS1)
                        and (tses_recv[0].lf_value == self.lf_usp)
                        and (tses_recv[0].fs_value == self.fs_usp)
                    ), uvm_root().logger.info(
                        self.name + " " + "received tses not as expecting step 4.1"
                    )
                    flag = 1
                    break
                assert (
                    (tses_recv[0].ts_type == ts_type_t.TS1)
                    and (tses_recv[0].tx_preset == self.my_tx_preset)
                    and (tses_recv[0].ec == 0)
                ), uvm_root().logger.info(
                    self.name + "received tses not as expecting step 4.2"
                )

        fork1 = cocotb.start_soon(send_ts1(self))
        fork2 = cocotb.start_soon(recv_ts1(self))
        await Combine(fork1, fork2)
        # ************************************************************************************************************************************************************************/
        # ****************************************step 4.c.(1&2) (gen 2,3,4,5):phase 2:dsp sends with EC = 2 to indicate that phase 2 and 3 are needed till it receives TS1 with ec=2************************************/

        flag = 0
        if not self.enter_phase_2_3:

            async def send_ts1_ec(self):
                nonlocal flag
                # send TS1s with ec = 2 to indicate that phase2/3 are needed
                while True:
                    tses_send = super().tses
                    for i in range(len(tses_send)):
                        tses_send[i].ts_type = ts_type_t.TS1
                        tses_send[i].ec = 2
                    self.send_seq_item(tses_send)
                    if flag:
                        break

            async def recv_ts1s_ec_2(self):
                # recv TS1s with ec = 2
                while True:
                    self.get_tses_recieved(tses_recv)
                    assert (
                        tses_recv[0].ts_type == ts_type_t.TS1
                    ), uvm_root().logger.info(
                        "pipe_speed_change_without_eq_dsp_seq",
                        "received tses not as expecting step 4.3",
                    )
                    if tses_recv[0].ec == 2:
                        flag = 1
                        break

            fork1 = cocotb.start_soon(send_ts1_ec())
            fork2 = cocotb.start_soon(recv_ts1s_ec_2())
            await Combine(fork1, fork2)

        # ************************************************************************************************************************************************************************/
        # ****************************************step 4.c.(3&4) (gen 2,3,4,5):phase 2:usp sends TS1 requsting some cofftions , dsp returns same cofftions and apply it ,usp asks phy if this is good the pyh responds yes so usp sends ec=3************************************/
        # the recived TS1 will contain values to be applied in the DSP
        flag = 0
        ts_recived_count = 0
        ts_sent_count = 0

        async def send_ts1s_echo(self):
            # send TS1s with wich echo what you received
            nonlocal flag
            # send untill USP is satisfied and echo back with ec=3
            while True:
                tses_send = tses_recv
                for i in range(len(tses_send)):
                    tses_send[i].rcv = 0

                self.send_seq_item(tses_send)
                if flag:
                    break

            # recv 2 TS1s with ec = 3 back to back

        async def recv_ts1s_echo(self):
            nonlocal flag
            ts_recived_count = 0
            while True:
                self.get_tses_recieved(tses_recv)
                assert tses_recv[0].ts_type == ts_type_t.TS1, uvm_root().logger.info(
                    "pipe_speed_change_with_equalization_seq",
                    "received tses not as expecting step 4.4",
                )
                if tses_recv[0].ec == 3:
                    ts_recived_count += 1
                else:
                    ts_recived_count = 0
                if ts_recived_count == 2:
                    flag = 1
                    break

        fork1 = cocotb.start_soon(send_ts1s_echo())
        fork2 = cocotb.start_soon(recv_ts1s_echo())
        await Combine(fork1, fork2)
        # asserts that the DUT actually asked the phy for evaluation
        pipe_seq_item_h = pipe_seq_item("pipe_seq_item")
        await self.start_item(pipe_seq_item_h)
        pipe_seq_item_h.randomize_with(pipe_operation == pipe_operation_t.ASSERT_EVAL_FEEDBACK_CHANGED)
        # if (not pipe_seq_item_h.randomize() with {pipe_operation == ASSERT_EVAL_FEEDBACK_CHANGED;}):
        # uvm_error(get_name(), "DUT didnot ask for evalution")

        await self.finish_item(pipe_seq_item_h)
        # ************************************************************************************************************************************************************************/
        # ***********************************************step 4.d (gen 2,3,4,5):phase 3: dsp sends cofftions and use preset=0 and ec=3, usp echo the tses and should apply those cofftions on TxDeemph signa****************************/
        flag = 0
        ts_recived_count = 0
        ts_sent_count = 0
        # change the cofftions to make sure TxDeemph will be changed
        self.cursor = 1
        self.pre_cursor = 2
        self.post_cursor = 3

        async def send_ts1s_options(self):
            # send TS1s with required coftions(which are just 1 2 3) and ec = 3 till uou recive two back to back tses

            while True:
                tses_send = super().tses
                for i in range(len(tses_send)):
                    tses_send[i].ts_type = ts_type_t.TS1
                    tses_send[i].use_preset = 0
                    tses_send[i].cursor = self.cursor
                    tses_send[i].pre_cursor = self.pre_cursor
                    tses_send[i].post_cursor = self.post_cursor
                    tses_send[i].ec = 3

                self.send_seq_item(tses_send)
                if flag:
                    break

        async def recv_ts1s_options(self):
            # recv 2 TS1s with ec = 3 that echo the sent cofftions and assert that TxDeemph has changed
            nonlocal flag
            while True:
                ts_recived_count = 0
                self.get_tses_recieved(tses_recv)
                assert (
                    (tses_recv[0].ts_type == ts_type_t.TS1)
                    and (tses_recv[0].rcv == 0)
                    and (tses_recv[0].cursor == self.cursor)
                    and (tses_recv[0].pre_cursor == self.pre_cursor)
                    and (tses_recv[0].post_cursor == self.post_cursor)
                    and (tses_recv[0].ec == 3)
                ), uvm_root().logger.info("pipe_speed_change_without_eq_dsp_seq", "")
                assert pipe_agent_config_h.new_TxDeemph == {
                    self.pre_cursor,
                    self.cursor,
                    self.post_cursor,
                }, uvm_root().logger.info(
                    "pipe_speed_change_with_equalization_seq",
                    "TxDeemph have wrong values ",
                )
                ts_recived_count += 1
                if ts_recived_count == 2:
                    flag = 1
                    break

        fork1 = cocotb.start_soon(send_ts1s_options())
        fork2 = cocotb.start_soon(recv_ts1s_options())
        await Combine(fork1, fork2)

        # ************************************************************************************************************************************************************************/
        # *******************************************************step 4.e(gen 2,3,4,5):dsp starts to send TS1 with EC=0 to indicate the of Equalization till it receives two back to back TS1 with EC =0**************************************************/
        flag = 0
        ts_recived_count = 0
        ts_sent_count = 0

        async def send_ts1s_ec_0(self):
            # send TS1s with ec = 0 to indicate that equalization ised
            nonlocal flag
            while True:
                tses_send = super().tses
                for i in range(len(tses_send)):
                    tses_send[i].ts_type = ts_type_t.TS1
                    tses_send[i].ec = 0

                self.send_seq_item(tses_send)
                if flag:
                    break

        async def recv_ts1s_ec_0(self):
            nonlocal flag
            ts_recived_count = 0
            # recv two TS1s with ec = 0
            while True:
                self.get_tses_recieved(tses_recv)
                assert tses_recv[0].ts_type == ts_type_t.TS1, uvm_root().logger.info(
                    "pipe_speed_change_with_equalization_seq",
                    "received tses not as expecting step 4.3",
                )
                if tses_recv[0].ec == 0:
                    ts_recived_count += 1
                else:
                    ts_recived_count = 0
                if ts_recived_count == 2:
                    flag = 1
                    break

        fork1 = cocotb.start_soon(send_ts1_ec())
        fork2 = cocotb.start_soon(recv_ts1s_ec_2())
        await Combine(fork1, fork2)
        # ************************************************************************************************************************************************************************/
        # *****************************************************step 5(step 7&8 in speed change without eq)(gen 2,3,4,5):send TS1 with speed_change bit=0 until TS2 that  have the Speed Change bit=0  is recived from USP*********************/
        # start sending TS1 and wait for TS2
        flag = 0

        # fork
        async def send_ts1s_0(self):
            nonlocal flag
            while True:
                tses_send = super().tses
                for i in range(len(tses_send)):
                    tses_send[i].speed_change = 0b0
                    # sv.cast(tses_send[i].max_gen_supported , self.max_supported_gen_by_dsp)
                    tses_send[i].ts_type = ts_type_t.TS1
                self.send_seq_item(tses_send)
                if flag:
                    break

        async def recv_ts2s_0(self):
            nonlocal flag
            while True:
                self.get_tses_recieved(tses_recv)
                if tses_recv[0].ts_type == ts_type_t.TS2:
                    for i in range(len(tses_recv)):
                        assert (
                            not tses_recv[i].speed_change
                            and tses_recv[i].ts_type == ts_type_t.TS2
                        ), uvm_root().logger.info(
                            "pipe_speed_change_without_eq_dsp_seq",
                            "received tses not as expecting step 5.1",
                        )
                    flag = 1
                    break

        fork1 = cocotb.start_soon(send_ts1s_0())
        fork2 = cocotb.start_soon(recv_ts2s_0())
        await Combine(fork1, fork2)
        # ************************************************************************************************************************************************************************/
        # *********************************************step 5 (step 9 in speed change without EQ)(gen 2,3,4,5):send and receive TS2 until 8 or more TS2 are sent and 8 or more TS2 are recived****************************/
        flag = 0
        ts_sent_count = 0
        ts_recived_count = 0

        async def send_ts2(self):
            # send TS2 until 8 or more TS2 are sent and 8 or more TS2 are recived
            while (ts_sent_count < 8) and (ts_recived_count < 8):
                ts_sent_count = 0
                tses_send = super().tses
                for i in range(len(tses_send)):
                    tses_send[i].speed_change = 0b0
                    # sv.cast(tses_send[i].max_gen_supported , self.max_supported_gen_by_dsp)
                    tses_send[i].ts_type = ts_type_t.TS2

                self.send_seq_item(tses_send)
                ts_sent_count += 1

        # receive TS2 until 8 or more TS2 are sent and 8 or more TS2 are recived
        async def recv_ts2(self):
            nonlocal ts_recived_count
            ts_recived_count = 0
            while (ts_sent_count < 8) and (ts_recived_count < 8):
                self.get_tses_recieved(tses_recv)
                for i in range(len(tses_recv)):
                    assert (
                        not tses_recv[i].speed_change
                        and tses_recv[i].ts_type == ts_type_t.TS2
                    ), uvm_root().logger.info(
                        "pipe_speed_change_without_eq_dsp_seq",
                        "received tses not as expecting step 5.2",
                    )
                ts_recived_count += 1

        fork1 = cocotb.start_soon(send_ts2())
        fork2 = cocotb.start_soon(recv_ts2())
        await Combine(fork1, fork2)

        # ************************************************************************************************************************************************************************/
        # ****************************************************step 5( step 10&11 in speed change without EQ) (gen 2,3,4,5):sending idle data******************************************************************************/
        async def send_idle_0(self):
            while True:
                pipe_seq_item_h = pipe_seq_item()
                pipe_seq_item_h.pipe_operation = pipe_operation_t.IDLE_DATA_TRANSFER
                await self.start_item(pipe_seq_item_h)
                await self.finish_item(pipe_seq_item_h)
                pipe_seq_item_h.pipe_operation = pipe_operation_t.SEND_DATA
                await self.start_item(pipe_seq_item_h)
                await self.finish_item(pipe_seq_item_h)
                if flag:
                    break

            for i in range(16):
                pipe_seq_item_h.pipe_operation = pipe_operation_t.IDLE_DATA_TRANSFER
                await self.start_item(pipe_seq_item_h)
                await self.finish_item(pipe_seq_item_h)
                pipe_seq_item_h.pipe_operation = pipe_operation_t.SEND_DATA
                await self.start_item(pipe_seq_item_h)
                await self.finish_item(pipe_seq_item_h)

            await pipe_agent_config_h.idle_data_detected_e.wait()
            flag = 1
            for i in range(7):
                await pipe_agent_config_h.idle_data_detected_e.wait()

        fork1 = cocotb.start_soon(send_ts1_ec())
        fork2 = cocotb.start_soon(recv_ts1s_ec_2())
        await Combine(fork1, fork2)

    async def send_seq_item(self, tses):  # task
        pipe_seq_item_h = pipe_seq_item("pipe_seq_item")
        pipe_seq_item_h.tses_sent = tses
        pipe_seq_item_h.pipe_operation = pipe_operation_t.SEND_TSES
        await self.start_item(pipe_seq_item_h)
        await self.finish_item(pipe_seq_item_h)

    async def get_tses_recieved(self):  # task
        await self.pipe_agent_config.detected_tses_e.wait()
        self.pipe_agent_config.detected_tses_e.clear()
        return self.pipe_agent_config.tses_received


# task
#
    def calc_gen(self,width, PCLKRate ) -> int:
        PCLKRate_value = 0.0
        width_value = 0.0
        freq = 0.0
        gen  = int()
        PCLKRate_value = PCLKRate
        width_value = width
        print(PCLKRate)
        print(width)
        # match (PCLKRate):
            # case 0b000:PCLKRate_value=0.0625
            # case 0b001:PCLKRate_value=0.125
            # case 0b010:PCLKRate_value=0.25
            # case 0b011:PCLKRate_value=0.5
            # case 0b100:PCLKRate_value=1


        match (width):
            case 1:width_value=8
            case 2:width_value=16
            case 3:width_value=32

        freq=PCLKRate_value*width_value

        match (freq):
            case 2:gen=1
            case 4:gen=2
            case 8:gen=3
            case 16:gen=4
            case 32:gen=5
            case _ :gen=0
        return gen
        # speed_change_bit
    #
    #
    #
