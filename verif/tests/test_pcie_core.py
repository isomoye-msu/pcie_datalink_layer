import cocotb
import pyuvm
from pyuvm import *
from cocotb.triggers import *
from pcie_env import *
from pipe_agent_config import *
from pipe_link_up_seq import *
from pipe_speed_change_with_equalization_seq import *

@pyuvm.test()
class link_up_test(uvm_test):
    """Test PCIe phy ctrl by going through ltssm sequence"""

    def build_phase(self):
        self.log = logging.getLogger("link_up_test.tb")
        self.logger.setLevel(logging.DEBUG)
        self.pcie_env_config = pcie_env_config("pcie_env_config")
        self.pipe_agent_config_h = pipe_agent_config("pipe_agent_config_h")
        self.pcie_env_config.pipe_agent_config_h = self.pipe_agent_config_h
        ConfigDB().set(None, "*", "pcie_env_config_h", self.pcie_env_config)
        self.env = pcie_env.create("pcie_env",self)
        
    def end_of_elaboration_phase(self):
        self.test_all = pipe_link_up_seq("test fc1")
        self.test_all.pipe_agent_config = self.pipe_agent_config_h
        self.speed_change = pipe_speed_change_with_equalization_seq("speed_change")
        self.speed_change.pipe_agent_config = self.pipe_agent_config_h
        
    async def run_phase(self):
        self.raise_objection()
        await with_timeout(self.test_all.start(),15000,'ns')
        await with_timeout(self.speed_change.start(),15000,'ns')
        self.drop_objection()
