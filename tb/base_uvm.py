# ==========================================================================
#
#  Morgan State University
#  Open Hardware Acceleration Lab (HAL-O)
#
#!  Project:   Open-Source PCIe Endpoint Controller.
#   File:      base_uvm.py
#   Author:    HAL-O
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

from pyuvm import *


# Create a sequence item class
class base_seq_item (uvm_sequence_item):
    def __init__(self, name="base_seq_item"):
        super().__init__(name)
        # Add item-specific fields and methods here
        
        
# Create a sequence class
class base_sequence (uvm_sequence):
     def __init__(self, name="base_sequence", seq_item_t = base_seq_item):
        super().__init__(name)
        self.seq_item_t = seq_item_t
        # Add item-specific fields and methods here
        
     async def body(self):
        # Create and send a sequence item
        seq_item = self.seq_item_t("my_sequence_item")
        await self.start_item(seq_item)
        await self.finish_item(seq_item)
        self.log.info("base_sequence Running the sequence")
        
        
# Create a sequencer class
class base_sequencer (uvm_sequencer):
    def __init__(self, name="base_sequencer", parent=None, base_seq_t = base_sequence):
        super().__init__(name, parent)
        self.default_sequence = base_seq_t
        self.name = name
        # print(name)
        ConfigDB().set(None, "*", name, self)
            
            
# Create a driver class
class base_driver(uvm_driver):
    def __init__(self, name="base_driver", parent=None):
        super().__init__(name, parent)
        # self.ap = uvm_analysis_port("ap", self)
        
    async def drive_item(self,seq_item):
        ...

    async def run_phase(self):
        while True:
            # Wait for a sequence item from the sequencer
            seq_item = await self.seq_item_port.get_next_item()
            # Drive the sequence item to the DUT
            await self.drive_item(seq_item)
            # Notify the sequencer that the item has been processed
            await self.ap.write(seq_item)
            self.seq_item_port.item_done()

# Create a monitor class
class base_monitor (uvm_monitor):
    def __init__(self, name="base_monitor", parent=None):
        super().__init__(name, parent)
        # self.ap = uvm_analysis_port("ap", self)
        
    def run_phase(self):
        self.ap = uvm_analysis_port("ap", self)
        # Monitor-specific code goes here
        uvm_info("base_monitor", "Running the monitor", UVM_LOW)
        while True:
            # Monitor the DUT and capture relevant information
            # This is a simplified example; actual monitoring logic depends on the DUT interface
            pass
        
# Create a scoreboard class
class base_scoreboard (uvm_scoreboard):
    def __init__(self, name="base_scoreboard", parent=None):
        super().__init__(name, parent)

    def write(self, seq_item):
        # Scoreboard-specific comparison logic goes here
        expected_data = 42  # Assume expected data is 42 for simplicity
        actual_data = seq_item.data

        if expected_data != actual_data:
            uvm_fatal("Scoreboard", f"Mismatch: Expected {expected_data}, Actual {actual_data}")

# Create an agent class
class base_agent(uvm_agent):
    def __init__(self, name, parent=None, driver_t = base_driver,
                 monitor_t = base_monitor, sequencer_t = base_sequencer,
                 scoreboard_t = base_scoreboard,  method_name = "base"):
        super().__init__(name,parent)
        self.driver_t = driver_t
        self.monitor_t = monitor_t
        self.sequencer_t = sequencer_t
        self.name = name
        self.scoreboard_t = scoreboard_t
        self.method_name = name

        # print(method_name)
        # print(self.scoreboard_t)
        # print(self.driver_t)
        
        # Define the build_phase function for your agent. This function is called when the agent is being constructed, and is where you can define the agent's components and set up the necessary connections. For example:
        # Copy code
        
    def build_phase(self):
        print(self.method_name)
        # Define components
        self.driver = self.driver_t.create(self.method_name + "_driver", self)
        self.monitor = self.monitor_t.create(self.method_name + "_monitor", self)
        # print(self.sequencer_t.name)
        self.sequencer = self.sequencer_t.create(self.method_name + "_sequencer", self)
        self.scoreboard = self.scoreboard_t.create(self.method_name + "_scoreboard", self)
        
    def connect_phase(self):
        # Set up connections
        self.driver.seq_item_port.connect(self.sequencer.seq_item_export)
        self.monitor.seq_item_port.connect(self.sequencer.seq_item_export)
    # Define the run_phase function for your agent. This function is called when the agent is ready to start processing transactions. You can put your main test logic in this function. For example:
    # Copy code
    # def run_phase(self):
    #     ...
        # self.sequencer.start() # Start the sequencer
        # while not self.sequencer.done():
        #     # Wait for the sequencer to finish
        #     phase.wait_for_event()
        #     self.sequencer.join() # Wait for all sequences to complete


# Create an environment class
# class base_env (uvm_env):
#     def __init__(self, name, parent=None, agent_t = 
#                  base_agent, 
#                  method_name = "base"):
#         super().__init__(name, parent)
#         self.agent_t = agent_t
#         self.method_name = method_name
#         print(agent_t)
        
#     def build_phase(self):
#         # Create and configure the agent
#         self.agent = self.agent_t(self.method_name + "_agent", self)
#         # print(self.agent)

# Create a test class
class base_test (uvm_test):

    def __init__(self, name, parent=None, env_t = None):
        # super().__init__(name, parent)
        self.env_t = env_t
        
    def build_phase(self,phase):
        # Create and configure the environment
        self.env = self.env_t.create("env", self)

    # def run_phase(self):
    #     # Trigger a sequence in the environment
    #     my_sequence = MySequence("my_sequence")
    #     self.env.agent.driver.seq_item = my_sequence
    #     my_sequence.start(self.env.agent.driver)