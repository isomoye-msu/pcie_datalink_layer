from pyuvm import *

class pcie_scoreboard(uvm_component):

    def __init__(self, name = "pcie_scoreboard", parent=None):
        super().__init__(name, parent)
        self.t = None  # type: lpif_export_sen  
        self.d = None  # type: lpif_export_receive  
        self.t = None  # type: pipe_export_sen  
        self.d = None  # type: pipe_export_receive  
        self.o = None  # type: lpif_fif  
        self.o = None  # type: pipe_fif  
    # endfunction

    def build_phase(self) :
        # self.lpif_export_sent = uvm_analysis_export("lpif_export_sent", self)
        # lpif_export_received = new("lpif_export_received", self)
        self.pipe_export_sent = uvm_analysis_port("pipe_export_sent", self);  
        self.pipe_export_received = uvm_analysis_port("pipe_export_received", self)
        # lpif_fifo = new("lpif_fifo", self)
        self.pipe_fifo = uvm_tlm_analysis_fifo("pipe_fifo", self)

    def connect_phase(self) :
        # self.lpif_export_sent.connect(self.lpif_fifo.analysis_export)
        self.pipe_export_sent.connect(self.pipe_fifo.analysis_export)

    def check_phase(self) :
        ...

    def write_lpif_received(self, lpif_seq_item_h) :
        ...

    def write_pipe_received(self, pipe_seq_item_h) :
        ...
