
from .lib import AsyncCallbackSet

from .reg_model.pcie_config_reg import pcie_config_reg_cls
from .sim.pcie_config_reg import pcie_config_reg_simulator_cls

if __name__ == '__main__':

    sim = pcie_config_reg_simulator_cls(address=0)

    # create an instance of the class
    reg_model = pcie_config_reg_cls(callbacks=AsyncCallbackSet(read_callback=sim.read,
                                                                       write_callback=sim.write))