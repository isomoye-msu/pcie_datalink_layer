import pyuvm
from pyuvm import *
from pipe_agent import pipe_seq_item

class pcie_coverage_monitor(uvm_component):
    def __init__(self, name = "pcie_coverage_monitor", parent=None):
        super().__init__(name, parent)
        self.pipe_seq_item_h = None
        self.pcie_coverage_monitor_cov = None  # type: covergroup  
        self.analysis_export_sent = None
        self.analysis_export_received = None

    def build_phase(self):
        # uvm_info(get_name(), "Enter pcie_coverage_monitor build_phase", UVM_MEDIUM)
        self.analysis_export_sent = uvm_analysis_port("analysis_export_sent",self)
        self.analysis_export_received = uvm_analysis_port("analysis_export_received",self)
        # uvm_info(get_name(), "Exit pcie_coverage_monitor build_phase", UVM_MEDIUM)
        # endfunction:build_phase

    def report_phase(self):
        ...
        # endfunction:report_phase

    def write_received(self, lpif_seq_item_h):
        ...
        # endfunction:write_lpif_received

    def write_sent(self, pipe_seq_item_h) :
        ...
        # endfunction:write_pipe_received
