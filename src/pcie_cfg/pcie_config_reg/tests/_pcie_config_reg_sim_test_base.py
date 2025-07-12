


"""
Unit Tests for the pcie_config_reg register model Python Wrapper

This code was generated from the PeakRDL-python package version 1.2.0
"""


import sys
import asyncio
if sys.version_info < (3, 8):
    import asynctest  # type: ignore[import]
else:
    import unittest



from ..lib import RegisterWriteVerifyError

from ..lib import AsyncCallbackSet


from ._pcie_config_reg_test_base import pcie_config_reg_TestCase, pcie_config_reg_TestCase_BlockAccess

from ..reg_model.pcie_config_reg import pcie_config_reg_cls
from ..sim.pcie_config_reg import pcie_config_reg_simulator_cls

class pcie_config_reg_SimTestCase(pcie_config_reg_TestCase): # type: ignore[valid-type,misc]

    def setUp(self) -> None:
        self.sim = pcie_config_reg_simulator_cls(address=0)
        self.dut = pcie_config_reg_cls(callbacks=AsyncCallbackSet(read_callback=self.sim.read,
                                                          write_callback=self.sim.write))

class pcie_config_reg_SimTestCase_BlockAccess(pcie_config_reg_TestCase_BlockAccess): # type: ignore[valid-type,misc]

    def setUp(self) -> None:
        self.sim = pcie_config_reg_simulator_cls(address=0)
        self.dut = pcie_config_reg_cls(callbacks=AsyncCallbackSet(read_callback=self.sim.read,
                                                          write_callback=self.sim.write,
                                                          read_block_callback=self.sim.read_block,
                                                          write_block_callback=self.sim.write_block))




if __name__ == '__main__':
    pass