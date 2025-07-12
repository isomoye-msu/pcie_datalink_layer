


"""
Unit Tests for the pcie_config_reg register model Python Wrapper

This code was generated from the PeakRDL-python package version 1.2.0
"""


from typing import Union, cast

import sys
import asyncio
import unittest
from unittest.mock import Mock

import random


from ..sim_lib.register import Register,MemoryRegister
from ..sim_lib.field import Field

from ._pcie_config_reg_sim_test_base import pcie_config_reg_SimTestCase, pcie_config_reg_SimTestCase_BlockAccess
from ._pcie_config_reg_sim_test_base import __name__ as base_name
from ._pcie_config_reg_test_base import random_enum_reg_value


from ..lib import SystemRDLEnum


class pcie_config_reg_single_access(pcie_config_reg_SimTestCase): # type: ignore[valid-type,misc]

    async def test_register_read_and_write(self) -> None:
        """
        Walk the register map and check every register can be read and written to correctly
        """
        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_00
        with self.subTest(msg='register: pcie_config_reg.byte_offset_00'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.byte_offset_00')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            register_read_callback = Mock()
            register_write_callback = Mock()

            # register read checks
            # update the value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_00.read(), random_value)
            # up to now the callback should not have been called
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_00.read(), random_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            sim_register.value = random_value
            sim_register.read_callback = None
            sim_register.write_callback = None
            self.assertEqual(await self.dut.byte_offset_00.read(), random_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()

            

            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_04
        with self.subTest(msg='register: pcie_config_reg.byte_offset_04'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.byte_offset_04')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            register_read_callback = Mock()
            register_write_callback = Mock()

            # register read checks
            # update the value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_04.read(), random_value)
            # up to now the callback should not have been called
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_04.read(), random_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            sim_register.value = random_value
            sim_register.read_callback = None
            sim_register.write_callback = None
            self.assertEqual(await self.dut.byte_offset_04.read(), random_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()

            

            # register write checks
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            await self.dut.byte_offset_04.write(random_value)  # type: ignore[union-attr]
            self.assertEqual(sim_register.value, random_value)
            # up to now the callback should not have been called
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            await self.dut.byte_offset_04.write(random_value)  # type: ignore[union-attr]
            self.assertEqual(sim_register.value, random_value)
            register_write_callback.assert_called_once_with(value=random_value)
            register_read_callback.assert_not_called()
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            await self.dut.byte_offset_04.write(random_value)  # type: ignore[union-attr]
            self.assertEqual(sim_register.value, random_value)
            self.assertEqual(await self.dut.byte_offset_04.read(), random_value)
            
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_08
        with self.subTest(msg='register: pcie_config_reg.byte_offset_08'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.byte_offset_08')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            register_read_callback = Mock()
            register_write_callback = Mock()

            # register read checks
            # update the value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_08.read(), random_value)
            # up to now the callback should not have been called
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_08.read(), random_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            sim_register.value = random_value
            sim_register.read_callback = None
            sim_register.write_callback = None
            self.assertEqual(await self.dut.byte_offset_08.read(), random_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()

            

            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_0C
        with self.subTest(msg='register: pcie_config_reg.byte_offset_0C'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.byte_offset_0C')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            register_read_callback = Mock()
            register_write_callback = Mock()

            # register read checks
            # update the value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_0C.read(), random_value)
            # up to now the callback should not have been called
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_0C.read(), random_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            sim_register.value = random_value
            sim_register.read_callback = None
            sim_register.write_callback = None
            self.assertEqual(await self.dut.byte_offset_0C.read(), random_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()

            

            # register write checks
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            await self.dut.byte_offset_0C.write(random_value)  # type: ignore[union-attr]
            self.assertEqual(sim_register.value, random_value)
            # up to now the callback should not have been called
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            await self.dut.byte_offset_0C.write(random_value)  # type: ignore[union-attr]
            self.assertEqual(sim_register.value, random_value)
            register_write_callback.assert_called_once_with(value=random_value)
            register_read_callback.assert_not_called()
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            await self.dut.byte_offset_0C.write(random_value)  # type: ignore[union-attr]
            self.assertEqual(sim_register.value, random_value)
            self.assertEqual(await self.dut.byte_offset_0C.read(), random_value)
            
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.base_address_register_0
        with self.subTest(msg='register: pcie_config_reg.base_address_register_0'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.base_address_register_0')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            register_read_callback = Mock()
            register_write_callback = Mock()

            # register read checks
            # update the value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = random_value
            self.assertEqual(await self.dut.base_address_register_0.read(), random_value)
            # up to now the callback should not have been called
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = random_value
            self.assertEqual(await self.dut.base_address_register_0.read(), random_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            sim_register.value = random_value
            sim_register.read_callback = None
            sim_register.write_callback = None
            self.assertEqual(await self.dut.base_address_register_0.read(), random_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()

            

            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.base_ddress_register_1
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_1'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.base_ddress_register_1')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            register_read_callback = Mock()
            register_write_callback = Mock()

            # register read checks
            # update the value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = random_value
            self.assertEqual(await self.dut.base_ddress_register_1.read(), random_value)
            # up to now the callback should not have been called
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = random_value
            self.assertEqual(await self.dut.base_ddress_register_1.read(), random_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            sim_register.value = random_value
            sim_register.read_callback = None
            sim_register.write_callback = None
            self.assertEqual(await self.dut.base_ddress_register_1.read(), random_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()

            

            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.base_ddress_register_2
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_2'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.base_ddress_register_2')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            register_read_callback = Mock()
            register_write_callback = Mock()

            # register read checks
            # update the value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = random_value
            self.assertEqual(await self.dut.base_ddress_register_2.read(), random_value)
            # up to now the callback should not have been called
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = random_value
            self.assertEqual(await self.dut.base_ddress_register_2.read(), random_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            sim_register.value = random_value
            sim_register.read_callback = None
            sim_register.write_callback = None
            self.assertEqual(await self.dut.base_ddress_register_2.read(), random_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()

            

            # register write checks
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            await self.dut.base_ddress_register_2.write(random_value)  # type: ignore[union-attr]
            self.assertEqual(sim_register.value, random_value)
            # up to now the callback should not have been called
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            await self.dut.base_ddress_register_2.write(random_value)  # type: ignore[union-attr]
            self.assertEqual(sim_register.value, random_value)
            register_write_callback.assert_called_once_with(value=random_value)
            register_read_callback.assert_not_called()
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            await self.dut.base_ddress_register_2.write(random_value)  # type: ignore[union-attr]
            self.assertEqual(sim_register.value, random_value)
            self.assertEqual(await self.dut.base_ddress_register_2.read(), random_value)
            
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.base_ddress_register_3
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_3'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.base_ddress_register_3')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            register_read_callback = Mock()
            register_write_callback = Mock()

            # register read checks
            # update the value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = random_value
            self.assertEqual(await self.dut.base_ddress_register_3.read(), random_value)
            # up to now the callback should not have been called
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = random_value
            self.assertEqual(await self.dut.base_ddress_register_3.read(), random_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            sim_register.value = random_value
            sim_register.read_callback = None
            sim_register.write_callback = None
            self.assertEqual(await self.dut.base_ddress_register_3.read(), random_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()

            

            # register write checks
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            await self.dut.base_ddress_register_3.write(random_value)  # type: ignore[union-attr]
            self.assertEqual(sim_register.value, random_value)
            # up to now the callback should not have been called
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            await self.dut.base_ddress_register_3.write(random_value)  # type: ignore[union-attr]
            self.assertEqual(sim_register.value, random_value)
            register_write_callback.assert_called_once_with(value=random_value)
            register_read_callback.assert_not_called()
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            await self.dut.base_ddress_register_3.write(random_value)  # type: ignore[union-attr]
            self.assertEqual(sim_register.value, random_value)
            self.assertEqual(await self.dut.base_ddress_register_3.read(), random_value)
            
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.base_ddress_register_4
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_4'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.base_ddress_register_4')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            register_read_callback = Mock()
            register_write_callback = Mock()

            # register read checks
            # update the value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = random_value
            self.assertEqual(await self.dut.base_ddress_register_4.read(), random_value)
            # up to now the callback should not have been called
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = random_value
            self.assertEqual(await self.dut.base_ddress_register_4.read(), random_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            sim_register.value = random_value
            sim_register.read_callback = None
            sim_register.write_callback = None
            self.assertEqual(await self.dut.base_ddress_register_4.read(), random_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()

            

            # register write checks
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            await self.dut.base_ddress_register_4.write(random_value)  # type: ignore[union-attr]
            self.assertEqual(sim_register.value, random_value)
            # up to now the callback should not have been called
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            await self.dut.base_ddress_register_4.write(random_value)  # type: ignore[union-attr]
            self.assertEqual(sim_register.value, random_value)
            register_write_callback.assert_called_once_with(value=random_value)
            register_read_callback.assert_not_called()
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            await self.dut.base_ddress_register_4.write(random_value)  # type: ignore[union-attr]
            self.assertEqual(sim_register.value, random_value)
            self.assertEqual(await self.dut.base_ddress_register_4.read(), random_value)
            
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.base_ddress_register_5
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_5'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.base_ddress_register_5')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            register_read_callback = Mock()
            register_write_callback = Mock()

            # register read checks
            # update the value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = random_value
            self.assertEqual(await self.dut.base_ddress_register_5.read(), random_value)
            # up to now the callback should not have been called
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = random_value
            self.assertEqual(await self.dut.base_ddress_register_5.read(), random_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            sim_register.value = random_value
            sim_register.read_callback = None
            sim_register.write_callback = None
            self.assertEqual(await self.dut.base_ddress_register_5.read(), random_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()

            

            # register write checks
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            await self.dut.base_ddress_register_5.write(random_value)  # type: ignore[union-attr]
            self.assertEqual(sim_register.value, random_value)
            # up to now the callback should not have been called
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            await self.dut.base_ddress_register_5.write(random_value)  # type: ignore[union-attr]
            self.assertEqual(sim_register.value, random_value)
            register_write_callback.assert_called_once_with(value=random_value)
            register_read_callback.assert_not_called()
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            await self.dut.base_ddress_register_5.write(random_value)  # type: ignore[union-attr]
            self.assertEqual(sim_register.value, random_value)
            self.assertEqual(await self.dut.base_ddress_register_5.read(), random_value)
            
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.cardbus_cis_pointer
        with self.subTest(msg='register: pcie_config_reg.cardbus_cis_pointer'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.cardbus_cis_pointer')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            register_read_callback = Mock()
            register_write_callback = Mock()

            # register read checks
            # update the value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = random_value
            self.assertEqual(await self.dut.cardbus_cis_pointer.read(), random_value)
            # up to now the callback should not have been called
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = random_value
            self.assertEqual(await self.dut.cardbus_cis_pointer.read(), random_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            sim_register.value = random_value
            sim_register.read_callback = None
            sim_register.write_callback = None
            self.assertEqual(await self.dut.cardbus_cis_pointer.read(), random_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()

            

            # register write checks
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            await self.dut.cardbus_cis_pointer.write(random_value)  # type: ignore[union-attr]
            self.assertEqual(sim_register.value, random_value)
            # up to now the callback should not have been called
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            await self.dut.cardbus_cis_pointer.write(random_value)  # type: ignore[union-attr]
            self.assertEqual(sim_register.value, random_value)
            register_write_callback.assert_called_once_with(value=random_value)
            register_read_callback.assert_not_called()
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            await self.dut.cardbus_cis_pointer.write(random_value)  # type: ignore[union-attr]
            self.assertEqual(sim_register.value, random_value)
            self.assertEqual(await self.dut.cardbus_cis_pointer.read(), random_value)
            
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_2C
        with self.subTest(msg='register: pcie_config_reg.byte_offset_2C'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.byte_offset_2C')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            register_read_callback = Mock()
            register_write_callback = Mock()

            # register read checks
            # update the value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_2C.read(), random_value)
            # up to now the callback should not have been called
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_2C.read(), random_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            sim_register.value = random_value
            sim_register.read_callback = None
            sim_register.write_callback = None
            self.assertEqual(await self.dut.byte_offset_2C.read(), random_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()

            

            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.capabilities_pointer
        with self.subTest(msg='register: pcie_config_reg.capabilities_pointer'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.capabilities_pointer')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            register_read_callback = Mock()
            register_write_callback = Mock()

            # register read checks
            # update the value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = random_value
            self.assertEqual(await self.dut.capabilities_pointer.read(), random_value)
            # up to now the callback should not have been called
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = random_value
            self.assertEqual(await self.dut.capabilities_pointer.read(), random_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            sim_register.value = random_value
            sim_register.read_callback = None
            sim_register.write_callback = None
            self.assertEqual(await self.dut.capabilities_pointer.read(), random_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()

            

            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_3C
        with self.subTest(msg='register: pcie_config_reg.byte_offset_3C'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.byte_offset_3C')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            register_read_callback = Mock()
            register_write_callback = Mock()

            # register read checks
            # update the value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_3C.read(), random_value)
            # up to now the callback should not have been called
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_3C.read(), random_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            sim_register.value = random_value
            sim_register.read_callback = None
            sim_register.write_callback = None
            self.assertEqual(await self.dut.byte_offset_3C.read(), random_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()

            

            # register write checks
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            await self.dut.byte_offset_3C.write(random_value)  # type: ignore[union-attr]
            self.assertEqual(sim_register.value, random_value)
            # up to now the callback should not have been called
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            await self.dut.byte_offset_3C.write(random_value)  # type: ignore[union-attr]
            self.assertEqual(sim_register.value, random_value)
            register_write_callback.assert_called_once_with(value=random_value)
            register_read_callback.assert_not_called()
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            await self.dut.byte_offset_3C.write(random_value)  # type: ignore[union-attr]
            self.assertEqual(sim_register.value, random_value)
            self.assertEqual(await self.dut.byte_offset_3C.read(), random_value)
            
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.capabilities_power_mngt_pointer
        with self.subTest(msg='register: pcie_config_reg.capabilities_power_mngt_pointer'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.capabilities_power_mngt_pointer')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            register_read_callback = Mock()
            register_write_callback = Mock()

            # register read checks
            # update the value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = random_value
            self.assertEqual(await self.dut.capabilities_power_mngt_pointer.read(), random_value)
            # up to now the callback should not have been called
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = random_value
            self.assertEqual(await self.dut.capabilities_power_mngt_pointer.read(), random_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            sim_register.value = random_value
            sim_register.read_callback = None
            sim_register.write_callback = None
            self.assertEqual(await self.dut.capabilities_power_mngt_pointer.read(), random_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()

            

            # register write checks
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            await self.dut.capabilities_power_mngt_pointer.write(random_value)  # type: ignore[union-attr]
            self.assertEqual(sim_register.value, random_value)
            # up to now the callback should not have been called
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            await self.dut.capabilities_power_mngt_pointer.write(random_value)  # type: ignore[union-attr]
            self.assertEqual(sim_register.value, random_value)
            register_write_callback.assert_called_once_with(value=random_value)
            register_read_callback.assert_not_called()
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            await self.dut.capabilities_power_mngt_pointer.write(random_value)  # type: ignore[union-attr]
            self.assertEqual(sim_register.value, random_value)
            self.assertEqual(await self.dut.capabilities_power_mngt_pointer.read(), random_value)
            
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.power_management_pointer
        with self.subTest(msg='register: pcie_config_reg.power_management_pointer'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.power_management_pointer')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            register_read_callback = Mock()
            register_write_callback = Mock()

            # register read checks
            # update the value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = random_value
            self.assertEqual(await self.dut.power_management_pointer.read(), random_value)
            # up to now the callback should not have been called
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = random_value
            self.assertEqual(await self.dut.power_management_pointer.read(), random_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            sim_register.value = random_value
            sim_register.read_callback = None
            sim_register.write_callback = None
            self.assertEqual(await self.dut.power_management_pointer.read(), random_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()

            

            # register write checks
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            await self.dut.power_management_pointer.write(random_value)  # type: ignore[union-attr]
            self.assertEqual(sim_register.value, random_value)
            # up to now the callback should not have been called
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            await self.dut.power_management_pointer.write(random_value)  # type: ignore[union-attr]
            self.assertEqual(sim_register.value, random_value)
            register_write_callback.assert_called_once_with(value=random_value)
            register_read_callback.assert_not_called()
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            await self.dut.power_management_pointer.write(random_value)  # type: ignore[union-attr]
            self.assertEqual(sim_register.value, random_value)
            self.assertEqual(await self.dut.power_management_pointer.read(), random_value)
            
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.capabilities_power_na_pointer
        with self.subTest(msg='register: pcie_config_reg.capabilities_power_na_pointer'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.capabilities_power_na_pointer')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            register_read_callback = Mock()
            register_write_callback = Mock()

            # register read checks
            # update the value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = random_value
            self.assertEqual(await self.dut.capabilities_power_na_pointer.read(), random_value)
            # up to now the callback should not have been called
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = random_value
            self.assertEqual(await self.dut.capabilities_power_na_pointer.read(), random_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            sim_register.value = random_value
            sim_register.read_callback = None
            sim_register.write_callback = None
            self.assertEqual(await self.dut.capabilities_power_na_pointer.read(), random_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()

            

            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.link_control_3_register
        with self.subTest(msg='register: pcie_config_reg.link_control_3_register'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.link_control_3_register')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            register_read_callback = Mock()
            register_write_callback = Mock()

            # register read checks
            # update the value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = random_value
            self.assertEqual(await self.dut.link_control_3_register.read(), random_value)
            # up to now the callback should not have been called
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = random_value
            self.assertEqual(await self.dut.link_control_3_register.read(), random_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            sim_register.value = random_value
            sim_register.read_callback = None
            sim_register.write_callback = None
            self.assertEqual(await self.dut.link_control_3_register.read(), random_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()

            

            # register write checks
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            await self.dut.link_control_3_register.write(random_value)  # type: ignore[union-attr]
            self.assertEqual(sim_register.value, random_value)
            # up to now the callback should not have been called
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            await self.dut.link_control_3_register.write(random_value)  # type: ignore[union-attr]
            self.assertEqual(sim_register.value, random_value)
            register_write_callback.assert_called_once_with(value=random_value)
            register_read_callback.assert_not_called()
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            await self.dut.link_control_3_register.write(random_value)  # type: ignore[union-attr]
            self.assertEqual(sim_register.value, random_value)
            self.assertEqual(await self.dut.link_control_3_register.read(), random_value)
            
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.lane_error_status_register
        with self.subTest(msg='register: pcie_config_reg.lane_error_status_register'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.lane_error_status_register')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            register_read_callback = Mock()
            register_write_callback = Mock()

            # register read checks
            # update the value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = random_value
            self.assertEqual(await self.dut.lane_error_status_register.read(), random_value)
            # up to now the callback should not have been called
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = random_value
            self.assertEqual(await self.dut.lane_error_status_register.read(), random_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            sim_register.value = random_value
            sim_register.read_callback = None
            sim_register.write_callback = None
            self.assertEqual(await self.dut.lane_error_status_register.read(), random_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()

            

            # register write checks
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            await self.dut.lane_error_status_register.write(random_value)  # type: ignore[union-attr]
            self.assertEqual(sim_register.value, random_value)
            # up to now the callback should not have been called
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            await self.dut.lane_error_status_register.write(random_value)  # type: ignore[union-attr]
            self.assertEqual(sim_register.value, random_value)
            register_write_callback.assert_called_once_with(value=random_value)
            register_read_callback.assert_not_called()
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            await self.dut.lane_error_status_register.write(random_value)  # type: ignore[union-attr]
            self.assertEqual(sim_register.value, random_value)
            self.assertEqual(await self.dut.lane_error_status_register.read(), random_value)
            
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.lane_eq_ctrl_register
        with self.subTest(msg='register: pcie_config_reg.lane_eq_ctrl_register'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.lane_eq_ctrl_register')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            register_read_callback = Mock()
            register_write_callback = Mock()

            # register read checks
            # update the value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = random_value
            self.assertEqual(await self.dut.lane_eq_ctrl_register.read(), random_value)
            # up to now the callback should not have been called
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = random_value
            self.assertEqual(await self.dut.lane_eq_ctrl_register.read(), random_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            sim_register.value = random_value
            sim_register.read_callback = None
            sim_register.write_callback = None
            self.assertEqual(await self.dut.lane_eq_ctrl_register.read(), random_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()

            

            # register write checks
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            await self.dut.lane_eq_ctrl_register.write(random_value)  # type: ignore[union-attr]
            self.assertEqual(sim_register.value, random_value)
            # up to now the callback should not have been called
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            await self.dut.lane_eq_ctrl_register.write(random_value)  # type: ignore[union-attr]
            self.assertEqual(sim_register.value, random_value)
            register_write_callback.assert_called_once_with(value=random_value)
            register_read_callback.assert_not_called()
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            await self.dut.lane_eq_ctrl_register.write(random_value)  # type: ignore[union-attr]
            self.assertEqual(sim_register.value, random_value)
            self.assertEqual(await self.dut.lane_eq_ctrl_register.read(), random_value)
            
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.extended_capabilities
        with self.subTest(msg='register: pcie_config_reg.extended_capabilities'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.extended_capabilities')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            register_read_callback = Mock()
            register_write_callback = Mock()

            # register read checks
            # update the value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = random_value
            self.assertEqual(await self.dut.extended_capabilities.read(), random_value)
            # up to now the callback should not have been called
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = random_value
            self.assertEqual(await self.dut.extended_capabilities.read(), random_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            sim_register.value = random_value
            sim_register.read_callback = None
            sim_register.write_callback = None
            self.assertEqual(await self.dut.extended_capabilities.read(), random_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()

            

            

        

    async def test_field_read_and_write(self) -> None:
        """
        Walk the register map and check every field can be read and written to correctly
        """
        random_field_value: Union[int, SystemRDLEnum]
        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_00.Vendor_ID
        with self.subTest(msg='field: pcie_config_reg.byte_offset_00.Vendor_ID'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.byte_offset_00')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.byte_offset_00.Vendor_ID')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFFFF) >> 0
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_00.Vendor_ID.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0xFFFF+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFFF0000) | (random_field_value << 0))
            
            self.assertEqual(await self.dut.byte_offset_00.Vendor_ID.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFFFF) >> 0
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.byte_offset_00.Vendor_ID.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFFFF) >> 0
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_00.Vendor_ID.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_00.Device_ID
        with self.subTest(msg='field: pcie_config_reg.byte_offset_00.Device_ID'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.byte_offset_00')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.byte_offset_00.Device_ID')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFFFF0000) >> 16
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_00.Device_ID.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0xFFFF+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFFF) | (random_field_value << 16))
            
            self.assertEqual(await self.dut.byte_offset_00.Device_ID.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFFFF0000) >> 16
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.byte_offset_00.Device_ID.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFFFF0000) >> 16
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_00.Device_ID.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_04.bus_master_enable
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.bus_master_enable'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.byte_offset_04')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.byte_offset_04.bus_master_enable')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x4) >> 2
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_04.bus_master_enable.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x1+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFFFFFFB) | (random_field_value << 2))
            
            self.assertEqual(await self.dut.byte_offset_04.bus_master_enable.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x4) >> 2
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.byte_offset_04.bus_master_enable.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x4) >> 2
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_04.bus_master_enable.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.bus_master_enable.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFFFB) | (0x4 & (random_field_value << 2)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.bus_master_enable.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFFFB) | (0x4 & (random_field_value << 2)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xFFFFFFFB) | (0x4 & (random_field_value << 2)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.bus_master_enable.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFFFB) | (0x4 & (random_field_value << 2)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_04.special_cycle_enable
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.special_cycle_enable'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.byte_offset_04')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.byte_offset_04.special_cycle_enable')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x8) >> 3
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_04.special_cycle_enable.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x1+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFFFFFF7) | (random_field_value << 3))
            
            self.assertEqual(await self.dut.byte_offset_04.special_cycle_enable.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x8) >> 3
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.byte_offset_04.special_cycle_enable.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x8) >> 3
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_04.special_cycle_enable.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.special_cycle_enable.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFFF7) | (0x8 & (random_field_value << 3)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.special_cycle_enable.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFFF7) | (0x8 & (random_field_value << 3)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xFFFFFFF7) | (0x8 & (random_field_value << 3)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.special_cycle_enable.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFFF7) | (0x8 & (random_field_value << 3)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_04.memory_write_invalidate
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.memory_write_invalidate'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.byte_offset_04')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.byte_offset_04.memory_write_invalidate')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x10) >> 4
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_04.memory_write_invalidate.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x1+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFFFFFEF) | (random_field_value << 4))
            
            self.assertEqual(await self.dut.byte_offset_04.memory_write_invalidate.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x10) >> 4
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.byte_offset_04.memory_write_invalidate.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x10) >> 4
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_04.memory_write_invalidate.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.memory_write_invalidate.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFFEF) | (0x10 & (random_field_value << 4)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.memory_write_invalidate.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFFEF) | (0x10 & (random_field_value << 4)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xFFFFFFEF) | (0x10 & (random_field_value << 4)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.memory_write_invalidate.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFFEF) | (0x10 & (random_field_value << 4)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_04.vga_palette_snoop
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.vga_palette_snoop'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.byte_offset_04')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.byte_offset_04.vga_palette_snoop')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x20) >> 5
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_04.vga_palette_snoop.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x1+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFFFFFDF) | (random_field_value << 5))
            
            self.assertEqual(await self.dut.byte_offset_04.vga_palette_snoop.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x20) >> 5
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.byte_offset_04.vga_palette_snoop.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x20) >> 5
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_04.vga_palette_snoop.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.vga_palette_snoop.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFFDF) | (0x20 & (random_field_value << 5)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.vga_palette_snoop.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFFDF) | (0x20 & (random_field_value << 5)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xFFFFFFDF) | (0x20 & (random_field_value << 5)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.vga_palette_snoop.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFFDF) | (0x20 & (random_field_value << 5)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_04.parity_error_response
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.parity_error_response'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.byte_offset_04')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.byte_offset_04.parity_error_response')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x40) >> 6
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_04.parity_error_response.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x1+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFFFFFBF) | (random_field_value << 6))
            
            self.assertEqual(await self.dut.byte_offset_04.parity_error_response.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x40) >> 6
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.byte_offset_04.parity_error_response.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x40) >> 6
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_04.parity_error_response.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.parity_error_response.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFFBF) | (0x40 & (random_field_value << 6)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.parity_error_response.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFFBF) | (0x40 & (random_field_value << 6)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xFFFFFFBF) | (0x40 & (random_field_value << 6)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.parity_error_response.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFFBF) | (0x40 & (random_field_value << 6)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_04.idsel_step_wait_cycle_control
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.idsel_step_wait_cycle_control'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.byte_offset_04')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.byte_offset_04.idsel_step_wait_cycle_control')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x80) >> 7
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_04.idsel_step_wait_cycle_control.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x1+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFFFFF7F) | (random_field_value << 7))
            
            self.assertEqual(await self.dut.byte_offset_04.idsel_step_wait_cycle_control.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x80) >> 7
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.byte_offset_04.idsel_step_wait_cycle_control.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x80) >> 7
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_04.idsel_step_wait_cycle_control.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.idsel_step_wait_cycle_control.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFF7F) | (0x80 & (random_field_value << 7)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.idsel_step_wait_cycle_control.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFF7F) | (0x80 & (random_field_value << 7)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xFFFFFF7F) | (0x80 & (random_field_value << 7)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.idsel_step_wait_cycle_control.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFF7F) | (0x80 & (random_field_value << 7)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_04.SERR_Enable
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.SERR_Enable'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.byte_offset_04')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.byte_offset_04.SERR_Enable')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x100) >> 8
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_04.SERR_Enable.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x1+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFFFFEFF) | (random_field_value << 8))
            
            self.assertEqual(await self.dut.byte_offset_04.SERR_Enable.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x100) >> 8
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.byte_offset_04.SERR_Enable.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x100) >> 8
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_04.SERR_Enable.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.SERR_Enable.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFEFF) | (0x100 & (random_field_value << 8)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.SERR_Enable.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFEFF) | (0x100 & (random_field_value << 8)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xFFFFFEFF) | (0x100 & (random_field_value << 8)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.SERR_Enable.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFEFF) | (0x100 & (random_field_value << 8)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_04.fast_b2b_transactions_enable
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.fast_b2b_transactions_enable'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.byte_offset_04')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.byte_offset_04.fast_b2b_transactions_enable')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x200) >> 9
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_04.fast_b2b_transactions_enable.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x1+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFFFFDFF) | (random_field_value << 9))
            
            self.assertEqual(await self.dut.byte_offset_04.fast_b2b_transactions_enable.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x200) >> 9
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.byte_offset_04.fast_b2b_transactions_enable.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x200) >> 9
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_04.fast_b2b_transactions_enable.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.fast_b2b_transactions_enable.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFDFF) | (0x200 & (random_field_value << 9)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.fast_b2b_transactions_enable.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFDFF) | (0x200 & (random_field_value << 9)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xFFFFFDFF) | (0x200 & (random_field_value << 9)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.fast_b2b_transactions_enable.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFDFF) | (0x200 & (random_field_value << 9)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_04.interrupt_disable
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.interrupt_disable'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.byte_offset_04')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.byte_offset_04.interrupt_disable')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x400) >> 10
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_04.interrupt_disable.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x1+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFFFFBFF) | (random_field_value << 10))
            
            self.assertEqual(await self.dut.byte_offset_04.interrupt_disable.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x400) >> 10
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.byte_offset_04.interrupt_disable.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x400) >> 10
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_04.interrupt_disable.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.interrupt_disable.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFBFF) | (0x400 & (random_field_value << 10)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.interrupt_disable.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFBFF) | (0x400 & (random_field_value << 10)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xFFFFFBFF) | (0x400 & (random_field_value << 10)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.interrupt_disable.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFBFF) | (0x400 & (random_field_value << 10)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_04.rsvd
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.rsvd'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.byte_offset_04')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.byte_offset_04.rsvd')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x7F800) >> 11
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_04.rsvd.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0xFF+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFF807FF) | (random_field_value << 11))
            
            self.assertEqual(await self.dut.byte_offset_04.rsvd.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x7F800) >> 11
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.byte_offset_04.rsvd.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x7F800) >> 11
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_04.rsvd.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0xFF+1)
            
            await self.dut.byte_offset_04.rsvd.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFF807FF) | (0x7F800 & (random_field_value << 11)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0xFF+1)
            
            await self.dut.byte_offset_04.rsvd.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFF807FF) | (0x7F800 & (random_field_value << 11)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xFFF807FF) | (0x7F800 & (random_field_value << 11)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0xFF+1)
            
            await self.dut.byte_offset_04.rsvd.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFF807FF) | (0x7F800 & (random_field_value << 11)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_04.interrupt_status
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.interrupt_status'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.byte_offset_04')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.byte_offset_04.interrupt_status')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x80000) >> 19
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_04.interrupt_status.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x1+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFF7FFFF) | (random_field_value << 19))
            
            self.assertEqual(await self.dut.byte_offset_04.interrupt_status.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x80000) >> 19
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.byte_offset_04.interrupt_status.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x80000) >> 19
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_04.interrupt_status.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.interrupt_status.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFF7FFFF) | (0x80000 & (random_field_value << 19)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.interrupt_status.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFF7FFFF) | (0x80000 & (random_field_value << 19)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xFFF7FFFF) | (0x80000 & (random_field_value << 19)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.interrupt_status.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFF7FFFF) | (0x80000 & (random_field_value << 19)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_04.capabilities_list
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.capabilities_list'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.byte_offset_04')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.byte_offset_04.capabilities_list')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x100000) >> 20
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_04.capabilities_list.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x1+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFEFFFFF) | (random_field_value << 20))
            
            self.assertEqual(await self.dut.byte_offset_04.capabilities_list.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x100000) >> 20
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.byte_offset_04.capabilities_list.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x100000) >> 20
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_04.capabilities_list.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.capabilities_list.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFEFFFFF) | (0x100000 & (random_field_value << 20)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.capabilities_list.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFEFFFFF) | (0x100000 & (random_field_value << 20)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xFFEFFFFF) | (0x100000 & (random_field_value << 20)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.capabilities_list.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFEFFFFF) | (0x100000 & (random_field_value << 20)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_04.sixtysix_mhz_capable
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.sixtysix_mhz_capable'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.byte_offset_04')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.byte_offset_04.sixtysix_mhz_capable')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x200000) >> 21
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_04.sixtysix_mhz_capable.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x1+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFDFFFFF) | (random_field_value << 21))
            
            self.assertEqual(await self.dut.byte_offset_04.sixtysix_mhz_capable.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x200000) >> 21
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.byte_offset_04.sixtysix_mhz_capable.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x200000) >> 21
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_04.sixtysix_mhz_capable.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.sixtysix_mhz_capable.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFDFFFFF) | (0x200000 & (random_field_value << 21)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.sixtysix_mhz_capable.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFDFFFFF) | (0x200000 & (random_field_value << 21)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xFFDFFFFF) | (0x200000 & (random_field_value << 21)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.sixtysix_mhz_capable.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFDFFFFF) | (0x200000 & (random_field_value << 21)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_04.fast_b2b_transactions_capable
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.fast_b2b_transactions_capable'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.byte_offset_04')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.byte_offset_04.fast_b2b_transactions_capable')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x800000) >> 23
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_04.fast_b2b_transactions_capable.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x1+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFF7FFFFF) | (random_field_value << 23))
            
            self.assertEqual(await self.dut.byte_offset_04.fast_b2b_transactions_capable.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x800000) >> 23
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.byte_offset_04.fast_b2b_transactions_capable.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x800000) >> 23
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_04.fast_b2b_transactions_capable.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.fast_b2b_transactions_capable.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFF7FFFFF) | (0x800000 & (random_field_value << 23)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.fast_b2b_transactions_capable.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFF7FFFFF) | (0x800000 & (random_field_value << 23)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xFF7FFFFF) | (0x800000 & (random_field_value << 23)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.fast_b2b_transactions_capable.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFF7FFFFF) | (0x800000 & (random_field_value << 23)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_04.master_data_parity_error
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.master_data_parity_error'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.byte_offset_04')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.byte_offset_04.master_data_parity_error')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x1000000) >> 24
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_04.master_data_parity_error.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x1+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFEFFFFFF) | (random_field_value << 24))
            
            self.assertEqual(await self.dut.byte_offset_04.master_data_parity_error.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x1000000) >> 24
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.byte_offset_04.master_data_parity_error.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x1000000) >> 24
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_04.master_data_parity_error.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.master_data_parity_error.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFEFFFFFF) | (0x1000000 & (random_field_value << 24)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.master_data_parity_error.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFEFFFFFF) | (0x1000000 & (random_field_value << 24)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xFEFFFFFF) | (0x1000000 & (random_field_value << 24)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.master_data_parity_error.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFEFFFFFF) | (0x1000000 & (random_field_value << 24)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_04.devsel_timing
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.devsel_timing'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.byte_offset_04')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.byte_offset_04.devsel_timing')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x6000000) >> 25
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_04.devsel_timing.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x3+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xF9FFFFFF) | (random_field_value << 25))
            
            self.assertEqual(await self.dut.byte_offset_04.devsel_timing.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x6000000) >> 25
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.byte_offset_04.devsel_timing.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x6000000) >> 25
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_04.devsel_timing.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0x3+1)
            
            await self.dut.byte_offset_04.devsel_timing.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xF9FFFFFF) | (0x6000000 & (random_field_value << 25)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0x3+1)
            
            await self.dut.byte_offset_04.devsel_timing.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xF9FFFFFF) | (0x6000000 & (random_field_value << 25)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xF9FFFFFF) | (0x6000000 & (random_field_value << 25)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0x3+1)
            
            await self.dut.byte_offset_04.devsel_timing.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xF9FFFFFF) | (0x6000000 & (random_field_value << 25)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_04.signaled_target_abort
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.signaled_target_abort'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.byte_offset_04')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.byte_offset_04.signaled_target_abort')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x8000000) >> 27
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_04.signaled_target_abort.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x1+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xF7FFFFFF) | (random_field_value << 27))
            
            self.assertEqual(await self.dut.byte_offset_04.signaled_target_abort.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x8000000) >> 27
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.byte_offset_04.signaled_target_abort.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x8000000) >> 27
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_04.signaled_target_abort.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.signaled_target_abort.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xF7FFFFFF) | (0x8000000 & (random_field_value << 27)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.signaled_target_abort.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xF7FFFFFF) | (0x8000000 & (random_field_value << 27)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xF7FFFFFF) | (0x8000000 & (random_field_value << 27)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.signaled_target_abort.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xF7FFFFFF) | (0x8000000 & (random_field_value << 27)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_04.received_target_abort
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.received_target_abort'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.byte_offset_04')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.byte_offset_04.received_target_abort')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x10000000) >> 28
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_04.received_target_abort.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x1+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xEFFFFFFF) | (random_field_value << 28))
            
            self.assertEqual(await self.dut.byte_offset_04.received_target_abort.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x10000000) >> 28
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.byte_offset_04.received_target_abort.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x10000000) >> 28
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_04.received_target_abort.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.received_target_abort.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xEFFFFFFF) | (0x10000000 & (random_field_value << 28)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.received_target_abort.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xEFFFFFFF) | (0x10000000 & (random_field_value << 28)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xEFFFFFFF) | (0x10000000 & (random_field_value << 28)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.received_target_abort.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xEFFFFFFF) | (0x10000000 & (random_field_value << 28)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_04.received_master_abort
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.received_master_abort'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.byte_offset_04')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.byte_offset_04.received_master_abort')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x20000000) >> 29
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_04.received_master_abort.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x1+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xDFFFFFFF) | (random_field_value << 29))
            
            self.assertEqual(await self.dut.byte_offset_04.received_master_abort.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x20000000) >> 29
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.byte_offset_04.received_master_abort.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x20000000) >> 29
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_04.received_master_abort.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.received_master_abort.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xDFFFFFFF) | (0x20000000 & (random_field_value << 29)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.received_master_abort.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xDFFFFFFF) | (0x20000000 & (random_field_value << 29)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xDFFFFFFF) | (0x20000000 & (random_field_value << 29)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.received_master_abort.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xDFFFFFFF) | (0x20000000 & (random_field_value << 29)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_04.signaled_system_error
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.signaled_system_error'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.byte_offset_04')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.byte_offset_04.signaled_system_error')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x40000000) >> 30
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_04.signaled_system_error.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x1+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xBFFFFFFF) | (random_field_value << 30))
            
            self.assertEqual(await self.dut.byte_offset_04.signaled_system_error.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x40000000) >> 30
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.byte_offset_04.signaled_system_error.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x40000000) >> 30
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_04.signaled_system_error.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.signaled_system_error.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xBFFFFFFF) | (0x40000000 & (random_field_value << 30)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.signaled_system_error.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xBFFFFFFF) | (0x40000000 & (random_field_value << 30)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xBFFFFFFF) | (0x40000000 & (random_field_value << 30)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.signaled_system_error.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xBFFFFFFF) | (0x40000000 & (random_field_value << 30)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_04.detected_parity_error
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.detected_parity_error'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.byte_offset_04')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.byte_offset_04.detected_parity_error')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x80000000) >> 31
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_04.detected_parity_error.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x1+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0x7FFFFFFF) | (random_field_value << 31))
            
            self.assertEqual(await self.dut.byte_offset_04.detected_parity_error.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x80000000) >> 31
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.byte_offset_04.detected_parity_error.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x80000000) >> 31
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_04.detected_parity_error.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.detected_parity_error.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0x7FFFFFFF) | (0x80000000 & (random_field_value << 31)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.detected_parity_error.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0x7FFFFFFF) | (0x80000000 & (random_field_value << 31)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0x7FFFFFFF) | (0x80000000 & (random_field_value << 31)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.byte_offset_04.detected_parity_error.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0x7FFFFFFF) | (0x80000000 & (random_field_value << 31)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_08.Revision_ID
        with self.subTest(msg='field: pcie_config_reg.byte_offset_08.Revision_ID'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.byte_offset_08')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.byte_offset_08.Revision_ID')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFF) >> 0
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_08.Revision_ID.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0xFF+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFFFFF00) | (random_field_value << 0))
            
            self.assertEqual(await self.dut.byte_offset_08.Revision_ID.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFF) >> 0
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.byte_offset_08.Revision_ID.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFF) >> 0
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_08.Revision_ID.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_08.Class_Code
        with self.subTest(msg='field: pcie_config_reg.byte_offset_08.Class_Code'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.byte_offset_08')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.byte_offset_08.Class_Code')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFFFFFF00) >> 8
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_08.Class_Code.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0xFFFFFF+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFF) | (random_field_value << 8))
            
            self.assertEqual(await self.dut.byte_offset_08.Class_Code.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFFFFFF00) >> 8
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.byte_offset_08.Class_Code.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFFFFFF00) >> 8
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_08.Class_Code.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_0C.cache_line_size_register
        with self.subTest(msg='field: pcie_config_reg.byte_offset_0C.cache_line_size_register'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.byte_offset_0C')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.byte_offset_0C.cache_line_size_register')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFF) >> 0
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_0C.cache_line_size_register.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0xFF+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFFFFF00) | (random_field_value << 0))
            
            self.assertEqual(await self.dut.byte_offset_0C.cache_line_size_register.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFF) >> 0
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.byte_offset_0C.cache_line_size_register.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFF) >> 0
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_0C.cache_line_size_register.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0xFF+1)
            
            await self.dut.byte_offset_0C.cache_line_size_register.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFF00) | (0xFF & (random_field_value << 0)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0xFF+1)
            
            await self.dut.byte_offset_0C.cache_line_size_register.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFF00) | (0xFF & (random_field_value << 0)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xFFFFFF00) | (0xFF & (random_field_value << 0)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0xFF+1)
            
            await self.dut.byte_offset_0C.cache_line_size_register.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFF00) | (0xFF & (random_field_value << 0)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_0C.latency_timer_register
        with self.subTest(msg='field: pcie_config_reg.byte_offset_0C.latency_timer_register'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.byte_offset_0C')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.byte_offset_0C.latency_timer_register')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFF00) >> 8
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_0C.latency_timer_register.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0xFF+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFFF00FF) | (random_field_value << 8))
            
            self.assertEqual(await self.dut.byte_offset_0C.latency_timer_register.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFF00) >> 8
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.byte_offset_0C.latency_timer_register.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFF00) >> 8
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_0C.latency_timer_register.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0xFF+1)
            
            await self.dut.byte_offset_0C.latency_timer_register.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFF00FF) | (0xFF00 & (random_field_value << 8)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0xFF+1)
            
            await self.dut.byte_offset_0C.latency_timer_register.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFF00FF) | (0xFF00 & (random_field_value << 8)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xFFFF00FF) | (0xFF00 & (random_field_value << 8)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0xFF+1)
            
            await self.dut.byte_offset_0C.latency_timer_register.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFF00FF) | (0xFF00 & (random_field_value << 8)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_0C.interrupt_line_register
        with self.subTest(msg='field: pcie_config_reg.byte_offset_0C.interrupt_line_register'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.byte_offset_0C')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.byte_offset_0C.interrupt_line_register')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFF0000) >> 16
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_0C.interrupt_line_register.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0xFF+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFF00FFFF) | (random_field_value << 16))
            
            self.assertEqual(await self.dut.byte_offset_0C.interrupt_line_register.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFF0000) >> 16
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.byte_offset_0C.interrupt_line_register.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFF0000) >> 16
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_0C.interrupt_line_register.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0xFF+1)
            
            await self.dut.byte_offset_0C.interrupt_line_register.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFF00FFFF) | (0xFF0000 & (random_field_value << 16)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0xFF+1)
            
            await self.dut.byte_offset_0C.interrupt_line_register.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFF00FFFF) | (0xFF0000 & (random_field_value << 16)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xFF00FFFF) | (0xFF0000 & (random_field_value << 16)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0xFF+1)
            
            await self.dut.byte_offset_0C.interrupt_line_register.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFF00FFFF) | (0xFF0000 & (random_field_value << 16)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_0C.interrupt_pin_register
        with self.subTest(msg='field: pcie_config_reg.byte_offset_0C.interrupt_pin_register'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.byte_offset_0C')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.byte_offset_0C.interrupt_pin_register')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFF000000) >> 24
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_0C.interrupt_pin_register.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0xFF+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFFFFF) | (random_field_value << 24))
            
            self.assertEqual(await self.dut.byte_offset_0C.interrupt_pin_register.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFF000000) >> 24
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.byte_offset_0C.interrupt_pin_register.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFF000000) >> 24
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_0C.interrupt_pin_register.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0xFF+1)
            
            await self.dut.byte_offset_0C.interrupt_pin_register.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFF) | (0xFF000000 & (random_field_value << 24)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0xFF+1)
            
            await self.dut.byte_offset_0C.interrupt_pin_register.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFF) | (0xFF000000 & (random_field_value << 24)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xFFFFFF) | (0xFF000000 & (random_field_value << 24)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0xFF+1)
            
            await self.dut.byte_offset_0C.interrupt_pin_register.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFF) | (0xFF000000 & (random_field_value << 24)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.base_address_register_0.region_type
        with self.subTest(msg='field: pcie_config_reg.base_address_register_0.region_type'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.base_address_register_0')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.base_address_register_0.region_type')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x1) >> 0
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.base_address_register_0.region_type.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x1+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFFFFFFE) | (random_field_value << 0))
            
            self.assertEqual(await self.dut.base_address_register_0.region_type.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x1) >> 0
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.base_address_register_0.region_type.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x1) >> 0
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.base_address_register_0.region_type.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.base_address_register_0.locatable
        with self.subTest(msg='field: pcie_config_reg.base_address_register_0.locatable'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.base_address_register_0')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.base_address_register_0.locatable')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x6) >> 1
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.base_address_register_0.locatable.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x3+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFFFFFF9) | (random_field_value << 1))
            
            self.assertEqual(await self.dut.base_address_register_0.locatable.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x6) >> 1
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.base_address_register_0.locatable.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x6) >> 1
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.base_address_register_0.locatable.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.base_address_register_0.prefetchable
        with self.subTest(msg='field: pcie_config_reg.base_address_register_0.prefetchable'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.base_address_register_0')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.base_address_register_0.prefetchable')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x8) >> 3
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.base_address_register_0.prefetchable.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x1+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFFFFFF7) | (random_field_value << 3))
            
            self.assertEqual(await self.dut.base_address_register_0.prefetchable.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x8) >> 3
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.base_address_register_0.prefetchable.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x8) >> 3
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.base_address_register_0.prefetchable.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.base_address_register_0.base_adress
        with self.subTest(msg='field: pcie_config_reg.base_address_register_0.base_adress'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.base_address_register_0')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.base_address_register_0.base_adress')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFFFFFFF0) >> 4
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.base_address_register_0.base_adress.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0xFFFFFFF+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xF) | (random_field_value << 4))
            
            self.assertEqual(await self.dut.base_address_register_0.base_adress.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFFFFFFF0) >> 4
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.base_address_register_0.base_adress.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFFFFFFF0) >> 4
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.base_address_register_0.base_adress.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.base_ddress_register_1.region_type
        with self.subTest(msg='field: pcie_config_reg.base_ddress_register_1.region_type'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.base_ddress_register_1')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.base_ddress_register_1.region_type')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x1) >> 0
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.base_ddress_register_1.region_type.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x1+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFFFFFFE) | (random_field_value << 0))
            
            self.assertEqual(await self.dut.base_ddress_register_1.region_type.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x1) >> 0
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.base_ddress_register_1.region_type.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x1) >> 0
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.base_ddress_register_1.region_type.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.base_ddress_register_1.locatable
        with self.subTest(msg='field: pcie_config_reg.base_ddress_register_1.locatable'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.base_ddress_register_1')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.base_ddress_register_1.locatable')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x6) >> 1
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.base_ddress_register_1.locatable.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x3+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFFFFFF9) | (random_field_value << 1))
            
            self.assertEqual(await self.dut.base_ddress_register_1.locatable.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x6) >> 1
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.base_ddress_register_1.locatable.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x6) >> 1
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.base_ddress_register_1.locatable.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.base_ddress_register_1.prefetchable
        with self.subTest(msg='field: pcie_config_reg.base_ddress_register_1.prefetchable'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.base_ddress_register_1')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.base_ddress_register_1.prefetchable')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x8) >> 3
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.base_ddress_register_1.prefetchable.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x1+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFFFFFF7) | (random_field_value << 3))
            
            self.assertEqual(await self.dut.base_ddress_register_1.prefetchable.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x8) >> 3
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.base_ddress_register_1.prefetchable.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x8) >> 3
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.base_ddress_register_1.prefetchable.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.base_ddress_register_1.base_adress
        with self.subTest(msg='field: pcie_config_reg.base_ddress_register_1.base_adress'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.base_ddress_register_1')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.base_ddress_register_1.base_adress')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFFFFFFF0) >> 4
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.base_ddress_register_1.base_adress.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0xFFFFFFF+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xF) | (random_field_value << 4))
            
            self.assertEqual(await self.dut.base_ddress_register_1.base_adress.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFFFFFFF0) >> 4
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.base_ddress_register_1.base_adress.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFFFFFFF0) >> 4
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.base_ddress_register_1.base_adress.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.base_ddress_register_2.BAR
        with self.subTest(msg='field: pcie_config_reg.base_ddress_register_2.BAR'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.base_ddress_register_2')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.base_ddress_register_2.BAR')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFFFFFFFF) >> 0
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.base_ddress_register_2.BAR.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0x0) | (random_field_value << 0))
            
            self.assertEqual(await self.dut.base_ddress_register_2.BAR.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFFFFFFFF) >> 0
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.base_ddress_register_2.BAR.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFFFFFFFF) >> 0
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.base_ddress_register_2.BAR.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0xFFFFFFFF+1)
            
            await self.dut.base_ddress_register_2.BAR.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0x0) | (0xFFFFFFFF & (random_field_value << 0)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0xFFFFFFFF+1)
            
            await self.dut.base_ddress_register_2.BAR.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0x0) | (0xFFFFFFFF & (random_field_value << 0)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0x0) | (0xFFFFFFFF & (random_field_value << 0)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0xFFFFFFFF+1)
            
            await self.dut.base_ddress_register_2.BAR.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0x0) | (0xFFFFFFFF & (random_field_value << 0)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.base_ddress_register_3.BAR
        with self.subTest(msg='field: pcie_config_reg.base_ddress_register_3.BAR'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.base_ddress_register_3')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.base_ddress_register_3.BAR')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFFFFFFFF) >> 0
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.base_ddress_register_3.BAR.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0x0) | (random_field_value << 0))
            
            self.assertEqual(await self.dut.base_ddress_register_3.BAR.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFFFFFFFF) >> 0
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.base_ddress_register_3.BAR.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFFFFFFFF) >> 0
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.base_ddress_register_3.BAR.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0xFFFFFFFF+1)
            
            await self.dut.base_ddress_register_3.BAR.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0x0) | (0xFFFFFFFF & (random_field_value << 0)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0xFFFFFFFF+1)
            
            await self.dut.base_ddress_register_3.BAR.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0x0) | (0xFFFFFFFF & (random_field_value << 0)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0x0) | (0xFFFFFFFF & (random_field_value << 0)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0xFFFFFFFF+1)
            
            await self.dut.base_ddress_register_3.BAR.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0x0) | (0xFFFFFFFF & (random_field_value << 0)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.base_ddress_register_4.BAR
        with self.subTest(msg='field: pcie_config_reg.base_ddress_register_4.BAR'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.base_ddress_register_4')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.base_ddress_register_4.BAR')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFFFFFFFF) >> 0
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.base_ddress_register_4.BAR.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0x0) | (random_field_value << 0))
            
            self.assertEqual(await self.dut.base_ddress_register_4.BAR.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFFFFFFFF) >> 0
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.base_ddress_register_4.BAR.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFFFFFFFF) >> 0
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.base_ddress_register_4.BAR.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0xFFFFFFFF+1)
            
            await self.dut.base_ddress_register_4.BAR.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0x0) | (0xFFFFFFFF & (random_field_value << 0)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0xFFFFFFFF+1)
            
            await self.dut.base_ddress_register_4.BAR.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0x0) | (0xFFFFFFFF & (random_field_value << 0)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0x0) | (0xFFFFFFFF & (random_field_value << 0)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0xFFFFFFFF+1)
            
            await self.dut.base_ddress_register_4.BAR.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0x0) | (0xFFFFFFFF & (random_field_value << 0)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.base_ddress_register_5.BAR
        with self.subTest(msg='field: pcie_config_reg.base_ddress_register_5.BAR'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.base_ddress_register_5')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.base_ddress_register_5.BAR')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFFFFFFFF) >> 0
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.base_ddress_register_5.BAR.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0x0) | (random_field_value << 0))
            
            self.assertEqual(await self.dut.base_ddress_register_5.BAR.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFFFFFFFF) >> 0
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.base_ddress_register_5.BAR.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFFFFFFFF) >> 0
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.base_ddress_register_5.BAR.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0xFFFFFFFF+1)
            
            await self.dut.base_ddress_register_5.BAR.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0x0) | (0xFFFFFFFF & (random_field_value << 0)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0xFFFFFFFF+1)
            
            await self.dut.base_ddress_register_5.BAR.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0x0) | (0xFFFFFFFF & (random_field_value << 0)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0x0) | (0xFFFFFFFF & (random_field_value << 0)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0xFFFFFFFF+1)
            
            await self.dut.base_ddress_register_5.BAR.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0x0) | (0xFFFFFFFF & (random_field_value << 0)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.cardbus_cis_pointer.word
        with self.subTest(msg='field: pcie_config_reg.cardbus_cis_pointer.word'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.cardbus_cis_pointer')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.cardbus_cis_pointer.word')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFFFFFFFF) >> 0
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.cardbus_cis_pointer.word.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0x0) | (random_field_value << 0))
            
            self.assertEqual(await self.dut.cardbus_cis_pointer.word.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFFFFFFFF) >> 0
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.cardbus_cis_pointer.word.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFFFFFFFF) >> 0
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.cardbus_cis_pointer.word.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0xFFFFFFFF+1)
            
            await self.dut.cardbus_cis_pointer.word.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0x0) | (0xFFFFFFFF & (random_field_value << 0)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0xFFFFFFFF+1)
            
            await self.dut.cardbus_cis_pointer.word.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0x0) | (0xFFFFFFFF & (random_field_value << 0)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0x0) | (0xFFFFFFFF & (random_field_value << 0)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0xFFFFFFFF+1)
            
            await self.dut.cardbus_cis_pointer.word.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0x0) | (0xFFFFFFFF & (random_field_value << 0)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_2C.Vendor_ID
        with self.subTest(msg='field: pcie_config_reg.byte_offset_2C.Vendor_ID'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.byte_offset_2C')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.byte_offset_2C.Vendor_ID')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFFFF) >> 0
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_2C.Vendor_ID.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0xFFFF+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFFF0000) | (random_field_value << 0))
            
            self.assertEqual(await self.dut.byte_offset_2C.Vendor_ID.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFFFF) >> 0
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.byte_offset_2C.Vendor_ID.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFFFF) >> 0
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_2C.Vendor_ID.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_2C.Device_ID
        with self.subTest(msg='field: pcie_config_reg.byte_offset_2C.Device_ID'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.byte_offset_2C')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.byte_offset_2C.Device_ID')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFFFF0000) >> 16
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_2C.Device_ID.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0xFFFF+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFFF) | (random_field_value << 16))
            
            self.assertEqual(await self.dut.byte_offset_2C.Device_ID.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFFFF0000) >> 16
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.byte_offset_2C.Device_ID.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFFFF0000) >> 16
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_2C.Device_ID.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.capabilities_pointer.capabilities_ptr
        with self.subTest(msg='field: pcie_config_reg.capabilities_pointer.capabilities_ptr'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.capabilities_pointer')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.capabilities_pointer.capabilities_ptr')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFF) >> 0
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.capabilities_pointer.capabilities_ptr.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0xFF+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFFFFF00) | (random_field_value << 0))
            
            self.assertEqual(await self.dut.capabilities_pointer.capabilities_ptr.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFF) >> 0
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.capabilities_pointer.capabilities_ptr.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFF) >> 0
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.capabilities_pointer.capabilities_ptr.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_3C.interrupt_line
        with self.subTest(msg='field: pcie_config_reg.byte_offset_3C.interrupt_line'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.byte_offset_3C')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.byte_offset_3C.interrupt_line')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFF) >> 0
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_3C.interrupt_line.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0xFF+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFFFFF00) | (random_field_value << 0))
            
            self.assertEqual(await self.dut.byte_offset_3C.interrupt_line.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFF) >> 0
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.byte_offset_3C.interrupt_line.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFF) >> 0
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_3C.interrupt_line.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0xFF+1)
            
            await self.dut.byte_offset_3C.interrupt_line.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFF00) | (0xFF & (random_field_value << 0)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0xFF+1)
            
            await self.dut.byte_offset_3C.interrupt_line.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFF00) | (0xFF & (random_field_value << 0)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xFFFFFF00) | (0xFF & (random_field_value << 0)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0xFF+1)
            
            await self.dut.byte_offset_3C.interrupt_line.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFF00) | (0xFF & (random_field_value << 0)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_3C.interrupt_pin
        with self.subTest(msg='field: pcie_config_reg.byte_offset_3C.interrupt_pin'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.byte_offset_3C')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.byte_offset_3C.interrupt_pin')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFF00) >> 8
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_3C.interrupt_pin.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0xFF+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFFF00FF) | (random_field_value << 8))
            
            self.assertEqual(await self.dut.byte_offset_3C.interrupt_pin.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFF00) >> 8
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.byte_offset_3C.interrupt_pin.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFF00) >> 8
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_3C.interrupt_pin.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0xFF+1)
            
            await self.dut.byte_offset_3C.interrupt_pin.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFF00FF) | (0xFF00 & (random_field_value << 8)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0xFF+1)
            
            await self.dut.byte_offset_3C.interrupt_pin.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFF00FF) | (0xFF00 & (random_field_value << 8)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xFFFF00FF) | (0xFF00 & (random_field_value << 8)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0xFF+1)
            
            await self.dut.byte_offset_3C.interrupt_pin.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFF00FF) | (0xFF00 & (random_field_value << 8)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_3C.min_gnt
        with self.subTest(msg='field: pcie_config_reg.byte_offset_3C.min_gnt'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.byte_offset_3C')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.byte_offset_3C.min_gnt')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFF0000) >> 16
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_3C.min_gnt.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0xFF+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFF00FFFF) | (random_field_value << 16))
            
            self.assertEqual(await self.dut.byte_offset_3C.min_gnt.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFF0000) >> 16
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.byte_offset_3C.min_gnt.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFF0000) >> 16
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_3C.min_gnt.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_3C.max_lat
        with self.subTest(msg='field: pcie_config_reg.byte_offset_3C.max_lat'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.byte_offset_3C')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.byte_offset_3C.max_lat')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFF000000) >> 24
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_3C.max_lat.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0xFF+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFFFFF) | (random_field_value << 24))
            
            self.assertEqual(await self.dut.byte_offset_3C.max_lat.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFF000000) >> 24
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.byte_offset_3C.max_lat.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFF000000) >> 24
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.byte_offset_3C.max_lat.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.capabilities_power_mngt_pointer.capabilities_id
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_mngt_pointer.capabilities_id'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.capabilities_power_mngt_pointer')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.capabilities_power_mngt_pointer.capabilities_id')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFF) >> 0
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.capabilities_power_mngt_pointer.capabilities_id.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0xFF+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFFFFF00) | (random_field_value << 0))
            
            self.assertEqual(await self.dut.capabilities_power_mngt_pointer.capabilities_id.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFF) >> 0
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.capabilities_power_mngt_pointer.capabilities_id.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFF) >> 0
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.capabilities_power_mngt_pointer.capabilities_id.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.capabilities_power_mngt_pointer.next_cap_ptr
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_mngt_pointer.next_cap_ptr'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.capabilities_power_mngt_pointer')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.capabilities_power_mngt_pointer.next_cap_ptr')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFF00) >> 8
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.capabilities_power_mngt_pointer.next_cap_ptr.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0xFF+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFFF00FF) | (random_field_value << 8))
            
            self.assertEqual(await self.dut.capabilities_power_mngt_pointer.next_cap_ptr.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFF00) >> 8
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.capabilities_power_mngt_pointer.next_cap_ptr.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFF00) >> 8
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.capabilities_power_mngt_pointer.next_cap_ptr.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.capabilities_power_mngt_pointer.version
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_mngt_pointer.version'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.capabilities_power_mngt_pointer')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.capabilities_power_mngt_pointer.version')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x70000) >> 16
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.capabilities_power_mngt_pointer.version.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x7+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFF8FFFF) | (random_field_value << 16))
            
            self.assertEqual(await self.dut.capabilities_power_mngt_pointer.version.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x70000) >> 16
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.capabilities_power_mngt_pointer.version.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x70000) >> 16
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.capabilities_power_mngt_pointer.version.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0x7+1)
            
            await self.dut.capabilities_power_mngt_pointer.version.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFF8FFFF) | (0x70000 & (random_field_value << 16)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0x7+1)
            
            await self.dut.capabilities_power_mngt_pointer.version.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFF8FFFF) | (0x70000 & (random_field_value << 16)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xFFF8FFFF) | (0x70000 & (random_field_value << 16)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0x7+1)
            
            await self.dut.capabilities_power_mngt_pointer.version.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFF8FFFF) | (0x70000 & (random_field_value << 16)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.capabilities_power_mngt_pointer.pme_clock
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_mngt_pointer.pme_clock'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.capabilities_power_mngt_pointer')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.capabilities_power_mngt_pointer.pme_clock')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x80000) >> 19
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.capabilities_power_mngt_pointer.pme_clock.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x1+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFF7FFFF) | (random_field_value << 19))
            
            self.assertEqual(await self.dut.capabilities_power_mngt_pointer.pme_clock.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x80000) >> 19
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.capabilities_power_mngt_pointer.pme_clock.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x80000) >> 19
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.capabilities_power_mngt_pointer.pme_clock.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.capabilities_power_mngt_pointer.pme_clock.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFF7FFFF) | (0x80000 & (random_field_value << 19)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.capabilities_power_mngt_pointer.pme_clock.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFF7FFFF) | (0x80000 & (random_field_value << 19)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xFFF7FFFF) | (0x80000 & (random_field_value << 19)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.capabilities_power_mngt_pointer.pme_clock.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFF7FFFF) | (0x80000 & (random_field_value << 19)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.capabilities_power_mngt_pointer.dev_spec_init
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_mngt_pointer.dev_spec_init'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.capabilities_power_mngt_pointer')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.capabilities_power_mngt_pointer.dev_spec_init')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x200000) >> 21
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.capabilities_power_mngt_pointer.dev_spec_init.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x1+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFDFFFFF) | (random_field_value << 21))
            
            self.assertEqual(await self.dut.capabilities_power_mngt_pointer.dev_spec_init.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x200000) >> 21
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.capabilities_power_mngt_pointer.dev_spec_init.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x200000) >> 21
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.capabilities_power_mngt_pointer.dev_spec_init.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.capabilities_power_mngt_pointer.dev_spec_init.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFDFFFFF) | (0x200000 & (random_field_value << 21)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.capabilities_power_mngt_pointer.dev_spec_init.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFDFFFFF) | (0x200000 & (random_field_value << 21)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xFFDFFFFF) | (0x200000 & (random_field_value << 21)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.capabilities_power_mngt_pointer.dev_spec_init.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFDFFFFF) | (0x200000 & (random_field_value << 21)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.capabilities_power_mngt_pointer.aux_current
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_mngt_pointer.aux_current'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.capabilities_power_mngt_pointer')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.capabilities_power_mngt_pointer.aux_current')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x1C00000) >> 22
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.capabilities_power_mngt_pointer.aux_current.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x7+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFE3FFFFF) | (random_field_value << 22))
            
            self.assertEqual(await self.dut.capabilities_power_mngt_pointer.aux_current.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x1C00000) >> 22
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.capabilities_power_mngt_pointer.aux_current.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x1C00000) >> 22
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.capabilities_power_mngt_pointer.aux_current.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0x7+1)
            
            await self.dut.capabilities_power_mngt_pointer.aux_current.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFE3FFFFF) | (0x1C00000 & (random_field_value << 22)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0x7+1)
            
            await self.dut.capabilities_power_mngt_pointer.aux_current.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFE3FFFFF) | (0x1C00000 & (random_field_value << 22)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xFE3FFFFF) | (0x1C00000 & (random_field_value << 22)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0x7+1)
            
            await self.dut.capabilities_power_mngt_pointer.aux_current.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFE3FFFFF) | (0x1C00000 & (random_field_value << 22)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.capabilities_power_mngt_pointer.d1_support
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_mngt_pointer.d1_support'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.capabilities_power_mngt_pointer')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.capabilities_power_mngt_pointer.d1_support')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x2000000) >> 25
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.capabilities_power_mngt_pointer.d1_support.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x1+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFDFFFFFF) | (random_field_value << 25))
            
            self.assertEqual(await self.dut.capabilities_power_mngt_pointer.d1_support.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x2000000) >> 25
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.capabilities_power_mngt_pointer.d1_support.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x2000000) >> 25
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.capabilities_power_mngt_pointer.d1_support.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.capabilities_power_mngt_pointer.d1_support.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFDFFFFFF) | (0x2000000 & (random_field_value << 25)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.capabilities_power_mngt_pointer.d1_support.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFDFFFFFF) | (0x2000000 & (random_field_value << 25)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xFDFFFFFF) | (0x2000000 & (random_field_value << 25)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.capabilities_power_mngt_pointer.d1_support.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFDFFFFFF) | (0x2000000 & (random_field_value << 25)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.capabilities_power_mngt_pointer.d2_support
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_mngt_pointer.d2_support'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.capabilities_power_mngt_pointer')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.capabilities_power_mngt_pointer.d2_support')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x4000000) >> 26
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.capabilities_power_mngt_pointer.d2_support.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x1+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFBFFFFFF) | (random_field_value << 26))
            
            self.assertEqual(await self.dut.capabilities_power_mngt_pointer.d2_support.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x4000000) >> 26
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.capabilities_power_mngt_pointer.d2_support.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x4000000) >> 26
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.capabilities_power_mngt_pointer.d2_support.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.capabilities_power_mngt_pointer.d2_support.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFBFFFFFF) | (0x4000000 & (random_field_value << 26)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.capabilities_power_mngt_pointer.d2_support.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFBFFFFFF) | (0x4000000 & (random_field_value << 26)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xFBFFFFFF) | (0x4000000 & (random_field_value << 26)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.capabilities_power_mngt_pointer.d2_support.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFBFFFFFF) | (0x4000000 & (random_field_value << 26)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.capabilities_power_mngt_pointer.pme_support
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_mngt_pointer.pme_support'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.capabilities_power_mngt_pointer')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.capabilities_power_mngt_pointer.pme_support')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xF8000000) >> 27
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.capabilities_power_mngt_pointer.pme_support.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x1F+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0x7FFFFFF) | (random_field_value << 27))
            
            self.assertEqual(await self.dut.capabilities_power_mngt_pointer.pme_support.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xF8000000) >> 27
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.capabilities_power_mngt_pointer.pme_support.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xF8000000) >> 27
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.capabilities_power_mngt_pointer.pme_support.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0x1F+1)
            
            await self.dut.capabilities_power_mngt_pointer.pme_support.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0x7FFFFFF) | (0xF8000000 & (random_field_value << 27)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0x1F+1)
            
            await self.dut.capabilities_power_mngt_pointer.pme_support.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0x7FFFFFF) | (0xF8000000 & (random_field_value << 27)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0x7FFFFFF) | (0xF8000000 & (random_field_value << 27)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0x1F+1)
            
            await self.dut.capabilities_power_mngt_pointer.pme_support.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0x7FFFFFF) | (0xF8000000 & (random_field_value << 27)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.power_management_pointer.power_state
        with self.subTest(msg='field: pcie_config_reg.power_management_pointer.power_state'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.power_management_pointer')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.power_management_pointer.power_state')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x3) >> 0
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.power_management_pointer.power_state.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x3+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFFFFFFC) | (random_field_value << 0))
            
            self.assertEqual(await self.dut.power_management_pointer.power_state.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x3) >> 0
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.power_management_pointer.power_state.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x3) >> 0
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.power_management_pointer.power_state.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0x3+1)
            
            await self.dut.power_management_pointer.power_state.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFFFC) | (0x3 & (random_field_value << 0)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0x3+1)
            
            await self.dut.power_management_pointer.power_state.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFFFC) | (0x3 & (random_field_value << 0)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xFFFFFFFC) | (0x3 & (random_field_value << 0)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0x3+1)
            
            await self.dut.power_management_pointer.power_state.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFFFC) | (0x3 & (random_field_value << 0)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.power_management_pointer.pme_enable
        with self.subTest(msg='field: pcie_config_reg.power_management_pointer.pme_enable'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.power_management_pointer')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.power_management_pointer.pme_enable')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x8) >> 3
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.power_management_pointer.pme_enable.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x1+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFFFFFF7) | (random_field_value << 3))
            
            self.assertEqual(await self.dut.power_management_pointer.pme_enable.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x8) >> 3
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.power_management_pointer.pme_enable.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x8) >> 3
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.power_management_pointer.pme_enable.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.power_management_pointer.pme_enable.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFFF7) | (0x8 & (random_field_value << 3)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.power_management_pointer.pme_enable.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFFF7) | (0x8 & (random_field_value << 3)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xFFFFFFF7) | (0x8 & (random_field_value << 3)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.power_management_pointer.pme_enable.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFFF7) | (0x8 & (random_field_value << 3)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.power_management_pointer.data_select
        with self.subTest(msg='field: pcie_config_reg.power_management_pointer.data_select'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.power_management_pointer')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.power_management_pointer.data_select')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x1E00) >> 9
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.power_management_pointer.data_select.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0xF+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFFFE1FF) | (random_field_value << 9))
            
            self.assertEqual(await self.dut.power_management_pointer.data_select.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x1E00) >> 9
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.power_management_pointer.data_select.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x1E00) >> 9
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.power_management_pointer.data_select.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0xF+1)
            
            await self.dut.power_management_pointer.data_select.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFE1FF) | (0x1E00 & (random_field_value << 9)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0xF+1)
            
            await self.dut.power_management_pointer.data_select.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFE1FF) | (0x1E00 & (random_field_value << 9)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xFFFFE1FF) | (0x1E00 & (random_field_value << 9)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0xF+1)
            
            await self.dut.power_management_pointer.data_select.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFE1FF) | (0x1E00 & (random_field_value << 9)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.power_management_pointer.data_scale
        with self.subTest(msg='field: pcie_config_reg.power_management_pointer.data_scale'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.power_management_pointer')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.power_management_pointer.data_scale')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x6000) >> 13
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.power_management_pointer.data_scale.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x3+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFFF9FFF) | (random_field_value << 13))
            
            self.assertEqual(await self.dut.power_management_pointer.data_scale.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x6000) >> 13
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.power_management_pointer.data_scale.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x6000) >> 13
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.power_management_pointer.data_scale.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0x3+1)
            
            await self.dut.power_management_pointer.data_scale.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFF9FFF) | (0x6000 & (random_field_value << 13)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0x3+1)
            
            await self.dut.power_management_pointer.data_scale.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFF9FFF) | (0x6000 & (random_field_value << 13)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xFFFF9FFF) | (0x6000 & (random_field_value << 13)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0x3+1)
            
            await self.dut.power_management_pointer.data_scale.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFF9FFF) | (0x6000 & (random_field_value << 13)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.power_management_pointer.pme_status
        with self.subTest(msg='field: pcie_config_reg.power_management_pointer.pme_status'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.power_management_pointer')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.power_management_pointer.pme_status')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x8000) >> 15
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.power_management_pointer.pme_status.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x1+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFFF7FFF) | (random_field_value << 15))
            
            self.assertEqual(await self.dut.power_management_pointer.pme_status.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x8000) >> 15
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.power_management_pointer.pme_status.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x8000) >> 15
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.power_management_pointer.pme_status.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.power_management_pointer.pme_status.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFF7FFF) | (0x8000 & (random_field_value << 15)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.power_management_pointer.pme_status.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFF7FFF) | (0x8000 & (random_field_value << 15)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xFFFF7FFF) | (0x8000 & (random_field_value << 15)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.power_management_pointer.pme_status.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFF7FFF) | (0x8000 & (random_field_value << 15)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.power_management_pointer.b2_b3_support
        with self.subTest(msg='field: pcie_config_reg.power_management_pointer.b2_b3_support'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.power_management_pointer')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.power_management_pointer.b2_b3_support')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x400000) >> 22
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.power_management_pointer.b2_b3_support.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x1+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFBFFFFF) | (random_field_value << 22))
            
            self.assertEqual(await self.dut.power_management_pointer.b2_b3_support.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x400000) >> 22
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.power_management_pointer.b2_b3_support.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x400000) >> 22
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.power_management_pointer.b2_b3_support.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.power_management_pointer.b2_b3_support.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFBFFFFF) | (0x400000 & (random_field_value << 22)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.power_management_pointer.b2_b3_support.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFBFFFFF) | (0x400000 & (random_field_value << 22)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xFFBFFFFF) | (0x400000 & (random_field_value << 22)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.power_management_pointer.b2_b3_support.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFBFFFFF) | (0x400000 & (random_field_value << 22)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.power_management_pointer.bus_pwr_clk_ctrl_en
        with self.subTest(msg='field: pcie_config_reg.power_management_pointer.bus_pwr_clk_ctrl_en'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.power_management_pointer')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.power_management_pointer.bus_pwr_clk_ctrl_en')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x800000) >> 23
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.power_management_pointer.bus_pwr_clk_ctrl_en.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x1+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFF7FFFFF) | (random_field_value << 23))
            
            self.assertEqual(await self.dut.power_management_pointer.bus_pwr_clk_ctrl_en.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x800000) >> 23
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.power_management_pointer.bus_pwr_clk_ctrl_en.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x800000) >> 23
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.power_management_pointer.bus_pwr_clk_ctrl_en.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.power_management_pointer.bus_pwr_clk_ctrl_en.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFF7FFFFF) | (0x800000 & (random_field_value << 23)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.power_management_pointer.bus_pwr_clk_ctrl_en.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFF7FFFFF) | (0x800000 & (random_field_value << 23)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xFF7FFFFF) | (0x800000 & (random_field_value << 23)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.power_management_pointer.bus_pwr_clk_ctrl_en.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFF7FFFFF) | (0x800000 & (random_field_value << 23)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.power_management_pointer.data
        with self.subTest(msg='field: pcie_config_reg.power_management_pointer.data'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.power_management_pointer')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.power_management_pointer.data')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFF000000) >> 24
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.power_management_pointer.data.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0xFF+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFFFFF) | (random_field_value << 24))
            
            self.assertEqual(await self.dut.power_management_pointer.data.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFF000000) >> 24
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.power_management_pointer.data.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFF000000) >> 24
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.power_management_pointer.data.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0xFF+1)
            
            await self.dut.power_management_pointer.data.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFF) | (0xFF000000 & (random_field_value << 24)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0xFF+1)
            
            await self.dut.power_management_pointer.data.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFF) | (0xFF000000 & (random_field_value << 24)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xFFFFFF) | (0xFF000000 & (random_field_value << 24)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0xFF+1)
            
            await self.dut.power_management_pointer.data.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFF) | (0xFF000000 & (random_field_value << 24)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.capabilities_power_na_pointer.capabilities_id
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_na_pointer.capabilities_id'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.capabilities_power_na_pointer')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.capabilities_power_na_pointer.capabilities_id')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFF) >> 0
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.capabilities_power_na_pointer.capabilities_id.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0xFF+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFFFFF00) | (random_field_value << 0))
            
            self.assertEqual(await self.dut.capabilities_power_na_pointer.capabilities_id.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFF) >> 0
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.capabilities_power_na_pointer.capabilities_id.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFF) >> 0
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.capabilities_power_na_pointer.capabilities_id.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.capabilities_power_na_pointer.next_cap_ptr
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_na_pointer.next_cap_ptr'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.capabilities_power_na_pointer')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.capabilities_power_na_pointer.next_cap_ptr')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFF00) >> 8
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.capabilities_power_na_pointer.next_cap_ptr.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0xFF+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFFF00FF) | (random_field_value << 8))
            
            self.assertEqual(await self.dut.capabilities_power_na_pointer.next_cap_ptr.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFF00) >> 8
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.capabilities_power_na_pointer.next_cap_ptr.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFF00) >> 8
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.capabilities_power_na_pointer.next_cap_ptr.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.capabilities_power_na_pointer.capability_version
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_na_pointer.capability_version'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.capabilities_power_na_pointer')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.capabilities_power_na_pointer.capability_version')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xF0000) >> 16
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.capabilities_power_na_pointer.capability_version.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0xF+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFF0FFFF) | (random_field_value << 16))
            
            self.assertEqual(await self.dut.capabilities_power_na_pointer.capability_version.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xF0000) >> 16
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.capabilities_power_na_pointer.capability_version.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xF0000) >> 16
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.capabilities_power_na_pointer.capability_version.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.capabilities_power_na_pointer.device_port_type
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_na_pointer.device_port_type'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.capabilities_power_na_pointer')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.capabilities_power_na_pointer.device_port_type')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xF00000) >> 20
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.capabilities_power_na_pointer.device_port_type.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0xF+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFF0FFFFF) | (random_field_value << 20))
            
            self.assertEqual(await self.dut.capabilities_power_na_pointer.device_port_type.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xF00000) >> 20
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.capabilities_power_na_pointer.device_port_type.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xF00000) >> 20
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.capabilities_power_na_pointer.device_port_type.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.capabilities_power_na_pointer.slot_implemented
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_na_pointer.slot_implemented'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.capabilities_power_na_pointer')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.capabilities_power_na_pointer.slot_implemented')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x1000000) >> 24
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.capabilities_power_na_pointer.slot_implemented.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x1+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFEFFFFFF) | (random_field_value << 24))
            
            self.assertEqual(await self.dut.capabilities_power_na_pointer.slot_implemented.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x1000000) >> 24
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.capabilities_power_na_pointer.slot_implemented.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x1000000) >> 24
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.capabilities_power_na_pointer.slot_implemented.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.capabilities_power_na_pointer.interrupt_msg_number
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_na_pointer.interrupt_msg_number'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.capabilities_power_na_pointer')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.capabilities_power_na_pointer.interrupt_msg_number')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x3E000000) >> 25
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.capabilities_power_na_pointer.interrupt_msg_number.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x1F+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xC1FFFFFF) | (random_field_value << 25))
            
            self.assertEqual(await self.dut.capabilities_power_na_pointer.interrupt_msg_number.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x3E000000) >> 25
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.capabilities_power_na_pointer.interrupt_msg_number.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x3E000000) >> 25
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.capabilities_power_na_pointer.interrupt_msg_number.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.capabilities_power_na_pointer.Undefined
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_na_pointer.Undefined'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.capabilities_power_na_pointer')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.capabilities_power_na_pointer.Undefined')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x40000000) >> 30
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.capabilities_power_na_pointer.Undefined.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x1+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xBFFFFFFF) | (random_field_value << 30))
            
            self.assertEqual(await self.dut.capabilities_power_na_pointer.Undefined.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x40000000) >> 30
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.capabilities_power_na_pointer.Undefined.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x40000000) >> 30
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.capabilities_power_na_pointer.Undefined.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.capabilities_power_na_pointer.RsvdP
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_na_pointer.RsvdP'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.capabilities_power_na_pointer')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.capabilities_power_na_pointer.RsvdP')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x80000000) >> 31
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.capabilities_power_na_pointer.RsvdP.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x1+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0x7FFFFFFF) | (random_field_value << 31))
            
            self.assertEqual(await self.dut.capabilities_power_na_pointer.RsvdP.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x80000000) >> 31
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.capabilities_power_na_pointer.RsvdP.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x80000000) >> 31
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.capabilities_power_na_pointer.RsvdP.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.link_control_3_register.perform_equalization
        with self.subTest(msg='field: pcie_config_reg.link_control_3_register.perform_equalization'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.link_control_3_register')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.link_control_3_register.perform_equalization')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x1) >> 0
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.link_control_3_register.perform_equalization.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x1+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFFFFFFE) | (random_field_value << 0))
            
            self.assertEqual(await self.dut.link_control_3_register.perform_equalization.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x1) >> 0
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.link_control_3_register.perform_equalization.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x1) >> 0
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.link_control_3_register.perform_equalization.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.link_control_3_register.perform_equalization.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFFFE) | (0x1 & (random_field_value << 0)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.link_control_3_register.perform_equalization.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFFFE) | (0x1 & (random_field_value << 0)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xFFFFFFFE) | (0x1 & (random_field_value << 0)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.link_control_3_register.perform_equalization.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFFFE) | (0x1 & (random_field_value << 0)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.link_control_3_register.link_eq_req_intr_en
        with self.subTest(msg='field: pcie_config_reg.link_control_3_register.link_eq_req_intr_en'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.link_control_3_register')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.link_control_3_register.link_eq_req_intr_en')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x2) >> 1
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.link_control_3_register.link_eq_req_intr_en.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x1+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFFFFFFD) | (random_field_value << 1))
            
            self.assertEqual(await self.dut.link_control_3_register.link_eq_req_intr_en.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x2) >> 1
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.link_control_3_register.link_eq_req_intr_en.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x2) >> 1
                
            random_field_value = self._reverse_bits(value=random_field_value, number_bits=1)
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.link_control_3_register.link_eq_req_intr_en.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.link_control_3_register.link_eq_req_intr_en.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFFFD) | (0x2 & (random_field_value << 1)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.link_control_3_register.link_eq_req_intr_en.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFFFD) | (0x2 & (random_field_value << 1)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xFFFFFFFD) | (0x2 & (random_field_value << 1)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0x1+1)
            
            await self.dut.link_control_3_register.link_eq_req_intr_en.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFFFD) | (0x2 & (random_field_value << 1)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.lane_error_status_register.lane_error
        with self.subTest(msg='field: pcie_config_reg.lane_error_status_register.lane_error'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.lane_error_status_register')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.lane_error_status_register.lane_error')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x1F) >> 0
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.lane_error_status_register.lane_error.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x1F+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFFFFFE0) | (random_field_value << 0))
            
            self.assertEqual(await self.dut.lane_error_status_register.lane_error.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x1F) >> 0
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.lane_error_status_register.lane_error.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x1F) >> 0
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.lane_error_status_register.lane_error.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0x1F+1)
            
            await self.dut.lane_error_status_register.lane_error.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFFE0) | (0x1F & (random_field_value << 0)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0x1F+1)
            
            await self.dut.lane_error_status_register.lane_error.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFFE0) | (0x1F & (random_field_value << 0)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xFFFFFFE0) | (0x1F & (random_field_value << 0)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0x1F+1)
            
            await self.dut.lane_error_status_register.lane_error.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFFE0) | (0x1F & (random_field_value << 0)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.lane_eq_ctrl_register.downstream_tx_preset
        with self.subTest(msg='field: pcie_config_reg.lane_eq_ctrl_register.downstream_tx_preset'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.lane_eq_ctrl_register')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.lane_eq_ctrl_register.downstream_tx_preset')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xF) >> 0
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.lane_eq_ctrl_register.downstream_tx_preset.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0xF+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFFFFFF0) | (random_field_value << 0))
            
            self.assertEqual(await self.dut.lane_eq_ctrl_register.downstream_tx_preset.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xF) >> 0
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.lane_eq_ctrl_register.downstream_tx_preset.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xF) >> 0
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.lane_eq_ctrl_register.downstream_tx_preset.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0xF+1)
            
            await self.dut.lane_eq_ctrl_register.downstream_tx_preset.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFFF0) | (0xF & (random_field_value << 0)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0xF+1)
            
            await self.dut.lane_eq_ctrl_register.downstream_tx_preset.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFFF0) | (0xF & (random_field_value << 0)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xFFFFFFF0) | (0xF & (random_field_value << 0)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0xF+1)
            
            await self.dut.lane_eq_ctrl_register.downstream_tx_preset.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFFF0) | (0xF & (random_field_value << 0)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.lane_eq_ctrl_register.downstream_rx_preset_hint
        with self.subTest(msg='field: pcie_config_reg.lane_eq_ctrl_register.downstream_rx_preset_hint'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.lane_eq_ctrl_register')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.lane_eq_ctrl_register.downstream_rx_preset_hint')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x70) >> 4
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.lane_eq_ctrl_register.downstream_rx_preset_hint.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x7+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFFFFF8F) | (random_field_value << 4))
            
            self.assertEqual(await self.dut.lane_eq_ctrl_register.downstream_rx_preset_hint.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x70) >> 4
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.lane_eq_ctrl_register.downstream_rx_preset_hint.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x70) >> 4
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.lane_eq_ctrl_register.downstream_rx_preset_hint.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0x7+1)
            
            await self.dut.lane_eq_ctrl_register.downstream_rx_preset_hint.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFF8F) | (0x70 & (random_field_value << 4)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0x7+1)
            
            await self.dut.lane_eq_ctrl_register.downstream_rx_preset_hint.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFF8F) | (0x70 & (random_field_value << 4)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xFFFFFF8F) | (0x70 & (random_field_value << 4)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0x7+1)
            
            await self.dut.lane_eq_ctrl_register.downstream_rx_preset_hint.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFFF8F) | (0x70 & (random_field_value << 4)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.lane_eq_ctrl_register.upstream_tx_preset
        with self.subTest(msg='field: pcie_config_reg.lane_eq_ctrl_register.upstream_tx_preset'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.lane_eq_ctrl_register')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.lane_eq_ctrl_register.upstream_tx_preset')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xF00) >> 8
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.lane_eq_ctrl_register.upstream_tx_preset.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0xF+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFFFF0FF) | (random_field_value << 8))
            
            self.assertEqual(await self.dut.lane_eq_ctrl_register.upstream_tx_preset.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xF00) >> 8
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.lane_eq_ctrl_register.upstream_tx_preset.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xF00) >> 8
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.lane_eq_ctrl_register.upstream_tx_preset.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0xF+1)
            
            await self.dut.lane_eq_ctrl_register.upstream_tx_preset.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFF0FF) | (0xF00 & (random_field_value << 8)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0xF+1)
            
            await self.dut.lane_eq_ctrl_register.upstream_tx_preset.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFF0FF) | (0xF00 & (random_field_value << 8)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xFFFFF0FF) | (0xF00 & (random_field_value << 8)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0xF+1)
            
            await self.dut.lane_eq_ctrl_register.upstream_tx_preset.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFFF0FF) | (0xF00 & (random_field_value << 8)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.lane_eq_ctrl_register.upstream_rx_preset_hint
        with self.subTest(msg='field: pcie_config_reg.lane_eq_ctrl_register.upstream_rx_preset_hint'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.lane_eq_ctrl_register')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.lane_eq_ctrl_register.upstream_rx_preset_hint')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x7000) >> 12
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.lane_eq_ctrl_register.upstream_rx_preset_hint.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0x7+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0xFFFF8FFF) | (random_field_value << 12))
            
            self.assertEqual(await self.dut.lane_eq_ctrl_register.upstream_rx_preset_hint.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x7000) >> 12
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.lane_eq_ctrl_register.upstream_rx_preset_hint.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0x7000) >> 12
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.lane_eq_ctrl_register.upstream_rx_preset_hint.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            # register write checks
            # update the register value via the backdoor in the simulator, then perform a field
            # write and make sure it is updated
            inital_reg_random_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_register.value = inital_reg_random_value
            
            random_field_value = random.randrange(0, 0x7+1)
            
            await self.dut.lane_eq_ctrl_register.upstream_rx_preset_hint.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFF8FFF) | (0x7000 & (random_field_value << 12)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # hook up the call backs
            sim_register.read_callback = None
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = None
            sim_field.write_callback = field_write_callback
            random_field_value = random.randrange(0, 0x7+1)
            
            await self.dut.lane_eq_ctrl_register.upstream_rx_preset_hint.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFF8FFF) | (0x7000 & (random_field_value << 12)))
            register_write_callback.assert_called_once_with(value=(reg_random_value & 0xFFFF8FFF) | (0x7000 & (random_field_value << 12)))
            field_write_callback.assert_called_once_with(value=random_field_value)
            
            register_read_callback.assert_not_called()
            field_read_callback.assert_not_called()
            reg_random_value = sim_register.value
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.write_callback = None
            sim_field.write_callback = None
            random_field_value = random.randrange(0, 0x7+1)
            
            await self.dut.lane_eq_ctrl_register.upstream_rx_preset_hint.write(random_field_value) # type: ignore[arg-type]
            self.assertEqual(sim_register.value, (inital_reg_random_value & 0xFFFF8FFF) | (0x7000 & (random_field_value << 12)))
            
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

        # test access operations (read and/or write) to register:
        # pcie_config_reg.extended_capabilities.ext_cap
        with self.subTest(msg='field: pcie_config_reg.extended_capabilities.ext_cap'):
            sim_register = self.sim.register_by_full_name('pcie_config_reg.extended_capabilities')
            self.assertIsInstance(sim_register, (Register,MemoryRegister))
            sim_field = self.sim.field_by_full_name('pcie_config_reg.extended_capabilities.ext_cap')
            self.assertIsInstance(sim_field, Field)
            register_read_callback = Mock()
            register_write_callback = Mock()
            field_read_callback = Mock()
            field_write_callback = Mock()

            # register read checks
            # update the register value via the backdoor in the simulator
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFFFFFFFF) >> 0
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.extended_capabilities.ext_cap.read(), random_field_value)
            # update the field value via the backdoor in the simulator
            previous_register_value = random_value
            random_field_value = random.randrange(0, 0xFFFFFFFF+1)
            sim_field.value = random_field_value
            self.assertEqual(sim_register.value, (previous_register_value & 0x0) | (random_field_value << 0))
            
            self.assertEqual(await self.dut.extended_capabilities.ext_cap.read(), random_field_value)
            # hook up the call backs to check they work correctly
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFFFFFFFF) >> 0
                
            
            sim_register.value = random_value
            sim_register.read_callback = register_read_callback
            sim_register.write_callback = register_write_callback
            sim_field.read_callback = field_read_callback
            sim_field.write_callback = field_write_callback
            self.assertEqual(await self.dut.extended_capabilities.ext_cap.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_called_once_with(value=random_value)
            field_write_callback.assert_not_called()
            field_read_callback.assert_called_once_with(value=random_field_value)
            
            # revert the callbacks and check again
            register_write_callback.reset_mock()
            register_read_callback.reset_mock()
            field_write_callback.reset_mock()
            field_read_callback.reset_mock()
            sim_register.read_callback = None
            sim_register.write_callback = None
            sim_field.read_callback = None
            sim_field.write_callback = None
            random_value = random.randrange(0, 0xFFFFFFFF+1)
            random_field_value = (random_value & 0xFFFFFFFF) >> 0
                
            
            sim_register.value = random_value
            self.assertEqual(await self.dut.extended_capabilities.ext_cap.read(), random_field_value)
            register_write_callback.assert_not_called()
            register_read_callback.assert_not_called()
            field_write_callback.assert_not_called()
            field_read_callback.assert_not_called()
            

            

        


    



class pcie_config_reg_block_access(pcie_config_reg_SimTestCase_BlockAccess): # type: ignore[valid-type,misc]
    """
    tests for all the block access methods
    """

    

if __name__ == '__main__':

    if sys.version_info < (3, 8):
        asynctest.main()
    else:
        unittest.main()




