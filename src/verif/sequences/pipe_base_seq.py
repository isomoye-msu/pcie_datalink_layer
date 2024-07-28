import pyuvm
from pyuvm import *

class pipe_base_seq(uvm_sequence):
    
    def __init__(self, name="pipe_base_seq"):
        super().__init__(name)
        self.pipe_agent_config = None
        self.tses = []


    async def body(self):
        await super().body()
        # self.pipe_agent_config = ConfigDB().get(None,"pipe_seq", "pipe_agent_config")
        # if not self.pipe_agent_config:
        #     self.log.fatal(self.name,"Cannot get PIPE Agent configuration from uvm_config_db")
