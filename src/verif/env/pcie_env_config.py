from pyuvm import *

class pcie_env_config(uvm_component):
    def __init__(self, name = "pcie_env_config"):
        super().__init__(name)
        self.has_scoreboard       =  1  # type: bit  
        self.has_coverage_monitor =  1  # type: bit  
        # self.lpif_agent_config_h  = None  # type: lpif_agent_config  
        self.pipe_agent_config_h  = None  # type: pipe_agent_config  
