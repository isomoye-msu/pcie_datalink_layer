import pyuvm
from pyuvm import *
from pipe_agent import pipe_sequencer,pipe_seq_item # type: ignore
from pipe_agent_config import * # type: ignore
from pipe_types import * # type: ignore
from cocotb.triggers import *

class base_vseq(uvm_sequence):

    def __init__(self, name):
        super().__init__(name)
        self.pipe_sequencer = None
