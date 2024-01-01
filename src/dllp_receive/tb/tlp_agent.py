from pyuvm import *



class TlpScoreboard(uvm_component):

    def build_phase(self):
        self.cmd_fifo = uvm_tlm_analysis_fifo("cmd_fifo", self)
        self.result_fifo = uvm_tlm_analysis_fifo("result_fifo", self)
        self.cmd_get_port = uvm_get_port("cmd_get_port", self)
        self.result_get_port = uvm_get_port("result_get_port", self)
        self.cmd_export = self.cmd_fifo.analysis_export
        self.result_export = self.result_fifo.analysis_export

    def connect_phase(self):
        self.cmd_get_port.connect(self.cmd_fifo.get_export)
        self.result_get_port.connect(self.result_fifo.get_export)

    def check_phase(self):
        passed = True
        try:
            self.errors = ConfigDB().get(self, "", "CREATE_ERRORS")
        except UVMConfigItemNotFound:
            self.errors = False
        while self.result_get_port.can_get():
            _, actual_result = self.result_get_port.try_get()
            cmd_success, cmd = self.cmd_get_port.try_get()
            if not cmd_success:
                self.logger.critical(f"result {actual_result} had no command")
            else:
                (A, B, op_numb) = cmd
                op = Ops(op_numb)
                predicted_result = alu_prediction(A, B, op, self.errors)
                if predicted_result == actual_result:
                    self.logger.info(f"PASSED: 0x{A:02x} {op.name} 0x{B:02x} ="
                                     f" 0x{actual_result:04x}")
                else:
                    self.logger.error(f"FAILED: 0x{A:02x} {op.name} 0x{B:02x} "
                                      f"= 0x{actual_result:04x} "
                                      f"expected 0x{predicted_result:04x}")
                    passed = False
        assert passed


class TlpMonitor(uvm_component):
    def __init__(self, name, parent, method_name):
        super().__init__(name, parent)
        self.method_name = method_name

    def build_phase(self):
        self.ap = uvm_analysis_port("ap", self)
        self.bfm = TinyAluBfm()
        self.get_method = getattr(self.bfm, self.method_name)

    async def run_phase(self):
        while True:
            datum = await self.get_method()
            self.logger.debug(f"MONITORED {datum}")
            self.ap.write(datum)


class TlpDriver(uvm_driver):
    def build_phase(self):
        self.ap = uvm_analysis_port("ap", self)

    def start_of_simulation_phase(self):
        self.sourcetllp = AxiStreamSource(AxiStreamBus.from_prefix(
            dut, "s_axis_phy2tlp"), dut.clk_i, dut.rst_i)
        self.sourcedllp = AxiStreamSource(AxiStreamBus.from_prefix(
            dut, "s_axis_phy2dllp"), dut.clk_i, dut.rst_i)

    async def launch_tb(self):
        await self.bfm.reset()
        self.bfm.start_bfm()

    async def run_phase(self):
        await self.launch_tb()
        while True:
            data = await self.seq_item_port.get_next_item()
            test_frame = AxiStreamFrame(data)
            await self.sourcetllp.send(test_frame)
            # await self.bfm.send_op(cmd.A, cmd.B, cmd.op)
            # result = await self.bfm.get_result()
            # self.ap.write(result)
            # cmd.result = result
            self.seq_item_port.item_done()


class TlpSequencer(uvm_sequencer):
    def __init__(self, name, parent, method_name):
        super().__init__(name, parent)
        self.method_name = method_name


class TlpSeqItem(uvm_sequence_item):

    def __init__(self, name, dllp, aa, bb, op):
        super().__init__(name)
        self.Dllp = dllp

    def randomize_dllp(self):
        self.Dllp.type = random.randint(0, 255)
        self.Dllp.seq = random.randint(0, 255)
        self.Dllp.vc = random.randint(0, 255)
        self.Dllp.hdr_scale = random.randint(0, 255)
        self.Dllp.hdr_fc = random.randint(0, 255)
        self.Dllp.data_scale = random.randint(0, 255)
        self.Dllp.data_fc = random.randint(0, 255)
        self.Dllp.feature_support = random.randint(0, 255)
        self.Dllp.feature_ack = random.randint(0, 255)

    def randomize(self):
        self.randomize_dllp()
        self.DLLP.type = random.choice(list(DllpType))

    def __str__(self):
        return f"{self.get_name()} : DLLP: 0x{self.DLLP:02x}"


class TlpSeq(uvm_sequence):
    def __init__(self, name, Dllp, Type):
        super().__init__(name)
        self.Dllp = Dllp
        self.Dllp.type = DllpType(Type)

    async def body(self):
        seq_item = DllpSeqItem("seq_item", self.DllpType)
        await self.start_item(seq_item)
        await self.finish_item(seq_item)
        self.result = seq_item.result


async def send_fc1(seqr, Dllp):
    seq = DllpSeq("seq", Dllp, DllpType.INIT_FC1_P)
    await seq.start(seqr)
    return seq.result


class TlpCoverage(uvm_subscriber):

    def end_of_elaboration_phase(self):
        self.cvg = set()

    def write(self, cmd):
        (_, _, op) = cmd
        self.cvg.add(op)

    def report_phase(self):
        try:
            disable_errors = ConfigDB().get(
                self, "", "DISABLE_COVERAGE_ERRORS")
        except UVMConfigItemNotFound:
            disable_errors = False
        if not disable_errors:
            if len(set(Ops) - self.cvg) > 0:
                self.logger.error(
                    f"Functional coverage error. Missed: {set(Ops)-self.cvg}")
                assert False
            else:
                self.logger.info("Covered all operations")
                assert True

class TlpAgent(uvm_component):
    def __init__(self, name, parent=None):
        super().__init__(name, parent)
    # Define the build_phase function for your agent. This function is called when the agent is being constructed, and is where you can define the agent's components and set up the necessary connections. For example:
    # Copy code

    def build_phase(self, phase):
        # Define components
        self.driver = TlpDriver("driver", self)
        self.monitor = TlpMonitor("monitor", self)
        self.sequencer = TlpSequencer("sequencer", self)
        self.scoreboard = TlpScoreboard("scoreboard", self)

    # Set up connections
        self.driver.seq_item_port.connect(self.sequencer.seq_item_export)
        self.monitor.seq_item_port.connect(self.sequencer.seq_item_export)
    # Define the run_phase function for your agent. This function is called when the agent is ready to start processing transactions. You can put your main test logic in this function. For example:
    # Copy code

    def run_phase(self, phase):
        self.sequencer.start()  # Start the sequencer
        while not self.sequencer.done():
            # Wait for the sequencer to finish
            phase.wait_for_event()
            self.sequencer.join()  # Wait for all sequences to complete
    # Create an instance of your agent and start it by calling the start function:
    # Copy code
    my_agent = MyAgent("my_agent")
    my_agent.start()