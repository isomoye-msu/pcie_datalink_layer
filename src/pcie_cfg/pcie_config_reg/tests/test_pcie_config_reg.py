


"""
Unit Tests for the pcie_config_reg register model Python Wrapper

This code was generated from the PeakRDL-python package version 1.2.0
"""
from typing import Union
from array import array as Array

import sys
import asyncio
import unittest
from unittest.mock import patch, call

import random
from itertools import combinations
import math


from ..lib import RegisterWriteVerifyError, UnsupportedWidthError

from ..reg_model.pcie_config_reg import pcie_config_reg_cls




from ..lib import FieldAsyncReadOnly, FieldAsyncWriteOnly, FieldAsyncReadWrite
from ..lib import WritableAsyncRegister, ReadableAsyncRegister
from ..lib import RegAsyncReadWrite, RegAsyncReadOnly, RegAsyncWriteOnly
from ..lib import RegAsyncReadWriteArray, RegAsyncReadOnlyArray, RegAsyncWriteOnlyArray
from ..lib import MemoryAsyncReadOnly, MemoryAsyncWriteOnly, MemoryAsyncReadWrite
from ..lib import MemoryAsyncReadOnlyArray, MemoryAsyncWriteOnlyArray, MemoryAsyncReadWriteArray
from ..lib import AsyncAddressMap, AsyncRegFile
from ..lib import AsyncAddressMapArray, AsyncRegFileArray
from ..lib import AsyncMemory



from ..lib import Field
from ..lib import Reg

from ..lib import SystemRDLEnum, SystemRDLEnumEntry


from ._pcie_config_reg_test_base import pcie_config_reg_TestCase, pcie_config_reg_TestCase_BlockAccess, pcie_config_reg_TestCase_AltBlockAccess
from ._pcie_config_reg_test_base import __name__ as base_name
from ._pcie_config_reg_test_base import random_enum_reg_value



class pcie_config_reg_single_access(pcie_config_reg_TestCase): # type: ignore[valid-type,misc]

    def test_inst_name(self)  -> None:
        """
        Walk the address map and check the inst name has been correctly populated
        """
        with self.subTest(msg='node: pcie_config_reg.byte_offset_00'):
            self.assertEqual(self.dut.byte_offset_00.inst_name, 'byte_offset_00') # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_00.full_inst_name, 'pcie_config_reg.byte_offset_00')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_04'):
            self.assertEqual(self.dut.byte_offset_04.inst_name, 'byte_offset_04') # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_04.full_inst_name, 'pcie_config_reg.byte_offset_04')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_08'):
            self.assertEqual(self.dut.byte_offset_08.inst_name, 'byte_offset_08') # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_08.full_inst_name, 'pcie_config_reg.byte_offset_08')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_0C'):
            self.assertEqual(self.dut.byte_offset_0C.inst_name, 'byte_offset_0C') # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_0C.full_inst_name, 'pcie_config_reg.byte_offset_0C')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.base_address_register_0'):
            self.assertEqual(self.dut.base_address_register_0.inst_name, 'base_address_register_0') # type: ignore[union-attr]
            self.assertEqual(self.dut.base_address_register_0.full_inst_name, 'pcie_config_reg.base_address_register_0')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_1'):
            self.assertEqual(self.dut.base_ddress_register_1.inst_name, 'base_ddress_register_1') # type: ignore[union-attr]
            self.assertEqual(self.dut.base_ddress_register_1.full_inst_name, 'pcie_config_reg.base_ddress_register_1')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_2'):
            self.assertEqual(self.dut.base_ddress_register_2.inst_name, 'base_ddress_register_2') # type: ignore[union-attr]
            self.assertEqual(self.dut.base_ddress_register_2.full_inst_name, 'pcie_config_reg.base_ddress_register_2')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_3'):
            self.assertEqual(self.dut.base_ddress_register_3.inst_name, 'base_ddress_register_3') # type: ignore[union-attr]
            self.assertEqual(self.dut.base_ddress_register_3.full_inst_name, 'pcie_config_reg.base_ddress_register_3')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_4'):
            self.assertEqual(self.dut.base_ddress_register_4.inst_name, 'base_ddress_register_4') # type: ignore[union-attr]
            self.assertEqual(self.dut.base_ddress_register_4.full_inst_name, 'pcie_config_reg.base_ddress_register_4')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_5'):
            self.assertEqual(self.dut.base_ddress_register_5.inst_name, 'base_ddress_register_5') # type: ignore[union-attr]
            self.assertEqual(self.dut.base_ddress_register_5.full_inst_name, 'pcie_config_reg.base_ddress_register_5')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.cardbus_cis_pointer'):
            self.assertEqual(self.dut.cardbus_cis_pointer.inst_name, 'cardbus_cis_pointer') # type: ignore[union-attr]
            self.assertEqual(self.dut.cardbus_cis_pointer.full_inst_name, 'pcie_config_reg.cardbus_cis_pointer')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_2C'):
            self.assertEqual(self.dut.byte_offset_2C.inst_name, 'byte_offset_2C') # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_2C.full_inst_name, 'pcie_config_reg.byte_offset_2C')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.capabilities_pointer'):
            self.assertEqual(self.dut.capabilities_pointer.inst_name, 'capabilities_pointer') # type: ignore[union-attr]
            self.assertEqual(self.dut.capabilities_pointer.full_inst_name, 'pcie_config_reg.capabilities_pointer')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_3C'):
            self.assertEqual(self.dut.byte_offset_3C.inst_name, 'byte_offset_3C') # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_3C.full_inst_name, 'pcie_config_reg.byte_offset_3C')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.capabilities_power_mngt_pointer'):
            self.assertEqual(self.dut.capabilities_power_mngt_pointer.inst_name, 'capabilities_power_mngt_pointer') # type: ignore[union-attr]
            self.assertEqual(self.dut.capabilities_power_mngt_pointer.full_inst_name, 'pcie_config_reg.capabilities_power_mngt_pointer')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.power_management_pointer'):
            self.assertEqual(self.dut.power_management_pointer.inst_name, 'power_management_pointer') # type: ignore[union-attr]
            self.assertEqual(self.dut.power_management_pointer.full_inst_name, 'pcie_config_reg.power_management_pointer')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.capabilities_power_na_pointer'):
            self.assertEqual(self.dut.capabilities_power_na_pointer.inst_name, 'capabilities_power_na_pointer') # type: ignore[union-attr]
            self.assertEqual(self.dut.capabilities_power_na_pointer.full_inst_name, 'pcie_config_reg.capabilities_power_na_pointer')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.link_control_3_register'):
            self.assertEqual(self.dut.link_control_3_register.inst_name, 'link_control_3_register') # type: ignore[union-attr]
            self.assertEqual(self.dut.link_control_3_register.full_inst_name, 'pcie_config_reg.link_control_3_register')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.lane_error_status_register'):
            self.assertEqual(self.dut.lane_error_status_register.inst_name, 'lane_error_status_register') # type: ignore[union-attr]
            self.assertEqual(self.dut.lane_error_status_register.full_inst_name, 'pcie_config_reg.lane_error_status_register')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.lane_eq_ctrl_register'):
            self.assertEqual(self.dut.lane_eq_ctrl_register.inst_name, 'lane_eq_ctrl_register') # type: ignore[union-attr]
            self.assertEqual(self.dut.lane_eq_ctrl_register.full_inst_name, 'pcie_config_reg.lane_eq_ctrl_register')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.extended_capabilities'):
            self.assertEqual(self.dut.extended_capabilities.inst_name, 'extended_capabilities') # type: ignore[union-attr]
            self.assertEqual(self.dut.extended_capabilities.full_inst_name, 'pcie_config_reg.extended_capabilities')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_00.Vendor_ID'):
            self.assertEqual(self.dut.byte_offset_00.Vendor_ID.inst_name, 'Vendor_ID') # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_00.Vendor_ID.full_inst_name, 'pcie_config_reg.byte_offset_00.Vendor_ID')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_00.Device_ID'):
            self.assertEqual(self.dut.byte_offset_00.Device_ID.inst_name, 'Device_ID') # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_00.Device_ID.full_inst_name, 'pcie_config_reg.byte_offset_00.Device_ID')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.bus_master_enable'):
            self.assertEqual(self.dut.byte_offset_04.bus_master_enable.inst_name, 'bus_master_enable') # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_04.bus_master_enable.full_inst_name, 'pcie_config_reg.byte_offset_04.bus_master_enable')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.special_cycle_enable'):
            self.assertEqual(self.dut.byte_offset_04.special_cycle_enable.inst_name, 'special_cycle_enable') # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_04.special_cycle_enable.full_inst_name, 'pcie_config_reg.byte_offset_04.special_cycle_enable')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.memory_write_invalidate'):
            self.assertEqual(self.dut.byte_offset_04.memory_write_invalidate.inst_name, 'memory_write_invalidate') # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_04.memory_write_invalidate.full_inst_name, 'pcie_config_reg.byte_offset_04.memory_write_invalidate')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.vga_palette_snoop'):
            self.assertEqual(self.dut.byte_offset_04.vga_palette_snoop.inst_name, 'vga_palette_snoop') # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_04.vga_palette_snoop.full_inst_name, 'pcie_config_reg.byte_offset_04.vga_palette_snoop')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.parity_error_response'):
            self.assertEqual(self.dut.byte_offset_04.parity_error_response.inst_name, 'parity_error_response') # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_04.parity_error_response.full_inst_name, 'pcie_config_reg.byte_offset_04.parity_error_response')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.idsel_step_wait_cycle_control'):
            self.assertEqual(self.dut.byte_offset_04.idsel_step_wait_cycle_control.inst_name, 'idsel_step_wait_cycle_control') # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_04.idsel_step_wait_cycle_control.full_inst_name, 'pcie_config_reg.byte_offset_04.idsel_step_wait_cycle_control')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.SERR_Enable'):
            self.assertEqual(self.dut.byte_offset_04.SERR_Enable.inst_name, 'SERR_Enable') # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_04.SERR_Enable.full_inst_name, 'pcie_config_reg.byte_offset_04.SERR_Enable')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.fast_b2b_transactions_enable'):
            self.assertEqual(self.dut.byte_offset_04.fast_b2b_transactions_enable.inst_name, 'fast_b2b_transactions_enable') # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_04.fast_b2b_transactions_enable.full_inst_name, 'pcie_config_reg.byte_offset_04.fast_b2b_transactions_enable')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.interrupt_disable'):
            self.assertEqual(self.dut.byte_offset_04.interrupt_disable.inst_name, 'interrupt_disable') # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_04.interrupt_disable.full_inst_name, 'pcie_config_reg.byte_offset_04.interrupt_disable')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.rsvd'):
            self.assertEqual(self.dut.byte_offset_04.rsvd.inst_name, 'rsvd') # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_04.rsvd.full_inst_name, 'pcie_config_reg.byte_offset_04.rsvd')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.interrupt_status'):
            self.assertEqual(self.dut.byte_offset_04.interrupt_status.inst_name, 'interrupt_status') # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_04.interrupt_status.full_inst_name, 'pcie_config_reg.byte_offset_04.interrupt_status')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.capabilities_list'):
            self.assertEqual(self.dut.byte_offset_04.capabilities_list.inst_name, 'capabilities_list') # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_04.capabilities_list.full_inst_name, 'pcie_config_reg.byte_offset_04.capabilities_list')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.sixtysix_mhz_capable'):
            self.assertEqual(self.dut.byte_offset_04.sixtysix_mhz_capable.inst_name, 'sixtysix_mhz_capable') # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_04.sixtysix_mhz_capable.full_inst_name, 'pcie_config_reg.byte_offset_04.sixtysix_mhz_capable')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.fast_b2b_transactions_capable'):
            self.assertEqual(self.dut.byte_offset_04.fast_b2b_transactions_capable.inst_name, 'fast_b2b_transactions_capable') # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_04.fast_b2b_transactions_capable.full_inst_name, 'pcie_config_reg.byte_offset_04.fast_b2b_transactions_capable')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.master_data_parity_error'):
            self.assertEqual(self.dut.byte_offset_04.master_data_parity_error.inst_name, 'master_data_parity_error') # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_04.master_data_parity_error.full_inst_name, 'pcie_config_reg.byte_offset_04.master_data_parity_error')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.devsel_timing'):
            self.assertEqual(self.dut.byte_offset_04.devsel_timing.inst_name, 'devsel_timing') # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_04.devsel_timing.full_inst_name, 'pcie_config_reg.byte_offset_04.devsel_timing')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.signaled_target_abort'):
            self.assertEqual(self.dut.byte_offset_04.signaled_target_abort.inst_name, 'signaled_target_abort') # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_04.signaled_target_abort.full_inst_name, 'pcie_config_reg.byte_offset_04.signaled_target_abort')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.received_target_abort'):
            self.assertEqual(self.dut.byte_offset_04.received_target_abort.inst_name, 'received_target_abort') # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_04.received_target_abort.full_inst_name, 'pcie_config_reg.byte_offset_04.received_target_abort')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.received_master_abort'):
            self.assertEqual(self.dut.byte_offset_04.received_master_abort.inst_name, 'received_master_abort') # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_04.received_master_abort.full_inst_name, 'pcie_config_reg.byte_offset_04.received_master_abort')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.signaled_system_error'):
            self.assertEqual(self.dut.byte_offset_04.signaled_system_error.inst_name, 'signaled_system_error') # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_04.signaled_system_error.full_inst_name, 'pcie_config_reg.byte_offset_04.signaled_system_error')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.detected_parity_error'):
            self.assertEqual(self.dut.byte_offset_04.detected_parity_error.inst_name, 'detected_parity_error') # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_04.detected_parity_error.full_inst_name, 'pcie_config_reg.byte_offset_04.detected_parity_error')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_08.Revision_ID'):
            self.assertEqual(self.dut.byte_offset_08.Revision_ID.inst_name, 'Revision_ID') # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_08.Revision_ID.full_inst_name, 'pcie_config_reg.byte_offset_08.Revision_ID')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_08.Class_Code'):
            self.assertEqual(self.dut.byte_offset_08.Class_Code.inst_name, 'Class_Code') # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_08.Class_Code.full_inst_name, 'pcie_config_reg.byte_offset_08.Class_Code')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_0C.cache_line_size_register'):
            self.assertEqual(self.dut.byte_offset_0C.cache_line_size_register.inst_name, 'cache_line_size_register') # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_0C.cache_line_size_register.full_inst_name, 'pcie_config_reg.byte_offset_0C.cache_line_size_register')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_0C.latency_timer_register'):
            self.assertEqual(self.dut.byte_offset_0C.latency_timer_register.inst_name, 'latency_timer_register') # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_0C.latency_timer_register.full_inst_name, 'pcie_config_reg.byte_offset_0C.latency_timer_register')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_0C.interrupt_line_register'):
            self.assertEqual(self.dut.byte_offset_0C.interrupt_line_register.inst_name, 'interrupt_line_register') # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_0C.interrupt_line_register.full_inst_name, 'pcie_config_reg.byte_offset_0C.interrupt_line_register')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_0C.interrupt_pin_register'):
            self.assertEqual(self.dut.byte_offset_0C.interrupt_pin_register.inst_name, 'interrupt_pin_register') # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_0C.interrupt_pin_register.full_inst_name, 'pcie_config_reg.byte_offset_0C.interrupt_pin_register')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.base_address_register_0.region_type'):
            self.assertEqual(self.dut.base_address_register_0.region_type.inst_name, 'region_type') # type: ignore[union-attr]
            self.assertEqual(self.dut.base_address_register_0.region_type.full_inst_name, 'pcie_config_reg.base_address_register_0.region_type')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.base_address_register_0.locatable'):
            self.assertEqual(self.dut.base_address_register_0.locatable.inst_name, 'locatable') # type: ignore[union-attr]
            self.assertEqual(self.dut.base_address_register_0.locatable.full_inst_name, 'pcie_config_reg.base_address_register_0.locatable')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.base_address_register_0.prefetchable'):
            self.assertEqual(self.dut.base_address_register_0.prefetchable.inst_name, 'prefetchable') # type: ignore[union-attr]
            self.assertEqual(self.dut.base_address_register_0.prefetchable.full_inst_name, 'pcie_config_reg.base_address_register_0.prefetchable')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.base_address_register_0.base_adress'):
            self.assertEqual(self.dut.base_address_register_0.base_adress.inst_name, 'base_adress') # type: ignore[union-attr]
            self.assertEqual(self.dut.base_address_register_0.base_adress.full_inst_name, 'pcie_config_reg.base_address_register_0.base_adress')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_1.region_type'):
            self.assertEqual(self.dut.base_ddress_register_1.region_type.inst_name, 'region_type') # type: ignore[union-attr]
            self.assertEqual(self.dut.base_ddress_register_1.region_type.full_inst_name, 'pcie_config_reg.base_ddress_register_1.region_type')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_1.locatable'):
            self.assertEqual(self.dut.base_ddress_register_1.locatable.inst_name, 'locatable') # type: ignore[union-attr]
            self.assertEqual(self.dut.base_ddress_register_1.locatable.full_inst_name, 'pcie_config_reg.base_ddress_register_1.locatable')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_1.prefetchable'):
            self.assertEqual(self.dut.base_ddress_register_1.prefetchable.inst_name, 'prefetchable') # type: ignore[union-attr]
            self.assertEqual(self.dut.base_ddress_register_1.prefetchable.full_inst_name, 'pcie_config_reg.base_ddress_register_1.prefetchable')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_1.base_adress'):
            self.assertEqual(self.dut.base_ddress_register_1.base_adress.inst_name, 'base_adress') # type: ignore[union-attr]
            self.assertEqual(self.dut.base_ddress_register_1.base_adress.full_inst_name, 'pcie_config_reg.base_ddress_register_1.base_adress')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_2.BAR'):
            self.assertEqual(self.dut.base_ddress_register_2.BAR.inst_name, 'BAR') # type: ignore[union-attr]
            self.assertEqual(self.dut.base_ddress_register_2.BAR.full_inst_name, 'pcie_config_reg.base_ddress_register_2.BAR')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_3.BAR'):
            self.assertEqual(self.dut.base_ddress_register_3.BAR.inst_name, 'BAR') # type: ignore[union-attr]
            self.assertEqual(self.dut.base_ddress_register_3.BAR.full_inst_name, 'pcie_config_reg.base_ddress_register_3.BAR')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_4.BAR'):
            self.assertEqual(self.dut.base_ddress_register_4.BAR.inst_name, 'BAR') # type: ignore[union-attr]
            self.assertEqual(self.dut.base_ddress_register_4.BAR.full_inst_name, 'pcie_config_reg.base_ddress_register_4.BAR')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_5.BAR'):
            self.assertEqual(self.dut.base_ddress_register_5.BAR.inst_name, 'BAR') # type: ignore[union-attr]
            self.assertEqual(self.dut.base_ddress_register_5.BAR.full_inst_name, 'pcie_config_reg.base_ddress_register_5.BAR')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.cardbus_cis_pointer.word'):
            self.assertEqual(self.dut.cardbus_cis_pointer.word.inst_name, 'word') # type: ignore[union-attr]
            self.assertEqual(self.dut.cardbus_cis_pointer.word.full_inst_name, 'pcie_config_reg.cardbus_cis_pointer.word')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_2C.Vendor_ID'):
            self.assertEqual(self.dut.byte_offset_2C.Vendor_ID.inst_name, 'Vendor_ID') # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_2C.Vendor_ID.full_inst_name, 'pcie_config_reg.byte_offset_2C.Vendor_ID')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_2C.Device_ID'):
            self.assertEqual(self.dut.byte_offset_2C.Device_ID.inst_name, 'Device_ID') # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_2C.Device_ID.full_inst_name, 'pcie_config_reg.byte_offset_2C.Device_ID')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.capabilities_pointer.capabilities_ptr'):
            self.assertEqual(self.dut.capabilities_pointer.capabilities_ptr.inst_name, 'capabilities_ptr') # type: ignore[union-attr]
            self.assertEqual(self.dut.capabilities_pointer.capabilities_ptr.full_inst_name, 'pcie_config_reg.capabilities_pointer.capabilities_ptr')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_3C.interrupt_line'):
            self.assertEqual(self.dut.byte_offset_3C.interrupt_line.inst_name, 'interrupt_line') # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_3C.interrupt_line.full_inst_name, 'pcie_config_reg.byte_offset_3C.interrupt_line')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_3C.interrupt_pin'):
            self.assertEqual(self.dut.byte_offset_3C.interrupt_pin.inst_name, 'interrupt_pin') # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_3C.interrupt_pin.full_inst_name, 'pcie_config_reg.byte_offset_3C.interrupt_pin')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_3C.min_gnt'):
            self.assertEqual(self.dut.byte_offset_3C.min_gnt.inst_name, 'min_gnt') # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_3C.min_gnt.full_inst_name, 'pcie_config_reg.byte_offset_3C.min_gnt')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_3C.max_lat'):
            self.assertEqual(self.dut.byte_offset_3C.max_lat.inst_name, 'max_lat') # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_3C.max_lat.full_inst_name, 'pcie_config_reg.byte_offset_3C.max_lat')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.capabilities_power_mngt_pointer.capabilities_id'):
            self.assertEqual(self.dut.capabilities_power_mngt_pointer.capabilities_id.inst_name, 'capabilities_id') # type: ignore[union-attr]
            self.assertEqual(self.dut.capabilities_power_mngt_pointer.capabilities_id.full_inst_name, 'pcie_config_reg.capabilities_power_mngt_pointer.capabilities_id')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.capabilities_power_mngt_pointer.next_cap_ptr'):
            self.assertEqual(self.dut.capabilities_power_mngt_pointer.next_cap_ptr.inst_name, 'next_cap_ptr') # type: ignore[union-attr]
            self.assertEqual(self.dut.capabilities_power_mngt_pointer.next_cap_ptr.full_inst_name, 'pcie_config_reg.capabilities_power_mngt_pointer.next_cap_ptr')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.capabilities_power_mngt_pointer.version'):
            self.assertEqual(self.dut.capabilities_power_mngt_pointer.version.inst_name, 'version') # type: ignore[union-attr]
            self.assertEqual(self.dut.capabilities_power_mngt_pointer.version.full_inst_name, 'pcie_config_reg.capabilities_power_mngt_pointer.version')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.capabilities_power_mngt_pointer.pme_clock'):
            self.assertEqual(self.dut.capabilities_power_mngt_pointer.pme_clock.inst_name, 'pme_clock') # type: ignore[union-attr]
            self.assertEqual(self.dut.capabilities_power_mngt_pointer.pme_clock.full_inst_name, 'pcie_config_reg.capabilities_power_mngt_pointer.pme_clock')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.capabilities_power_mngt_pointer.dev_spec_init'):
            self.assertEqual(self.dut.capabilities_power_mngt_pointer.dev_spec_init.inst_name, 'dev_spec_init') # type: ignore[union-attr]
            self.assertEqual(self.dut.capabilities_power_mngt_pointer.dev_spec_init.full_inst_name, 'pcie_config_reg.capabilities_power_mngt_pointer.dev_spec_init')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.capabilities_power_mngt_pointer.aux_current'):
            self.assertEqual(self.dut.capabilities_power_mngt_pointer.aux_current.inst_name, 'aux_current') # type: ignore[union-attr]
            self.assertEqual(self.dut.capabilities_power_mngt_pointer.aux_current.full_inst_name, 'pcie_config_reg.capabilities_power_mngt_pointer.aux_current')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.capabilities_power_mngt_pointer.d1_support'):
            self.assertEqual(self.dut.capabilities_power_mngt_pointer.d1_support.inst_name, 'd1_support') # type: ignore[union-attr]
            self.assertEqual(self.dut.capabilities_power_mngt_pointer.d1_support.full_inst_name, 'pcie_config_reg.capabilities_power_mngt_pointer.d1_support')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.capabilities_power_mngt_pointer.d2_support'):
            self.assertEqual(self.dut.capabilities_power_mngt_pointer.d2_support.inst_name, 'd2_support') # type: ignore[union-attr]
            self.assertEqual(self.dut.capabilities_power_mngt_pointer.d2_support.full_inst_name, 'pcie_config_reg.capabilities_power_mngt_pointer.d2_support')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.capabilities_power_mngt_pointer.pme_support'):
            self.assertEqual(self.dut.capabilities_power_mngt_pointer.pme_support.inst_name, 'pme_support') # type: ignore[union-attr]
            self.assertEqual(self.dut.capabilities_power_mngt_pointer.pme_support.full_inst_name, 'pcie_config_reg.capabilities_power_mngt_pointer.pme_support')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.power_management_pointer.power_state'):
            self.assertEqual(self.dut.power_management_pointer.power_state.inst_name, 'power_state') # type: ignore[union-attr]
            self.assertEqual(self.dut.power_management_pointer.power_state.full_inst_name, 'pcie_config_reg.power_management_pointer.power_state')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.power_management_pointer.pme_enable'):
            self.assertEqual(self.dut.power_management_pointer.pme_enable.inst_name, 'pme_enable') # type: ignore[union-attr]
            self.assertEqual(self.dut.power_management_pointer.pme_enable.full_inst_name, 'pcie_config_reg.power_management_pointer.pme_enable')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.power_management_pointer.data_select'):
            self.assertEqual(self.dut.power_management_pointer.data_select.inst_name, 'data_select') # type: ignore[union-attr]
            self.assertEqual(self.dut.power_management_pointer.data_select.full_inst_name, 'pcie_config_reg.power_management_pointer.data_select')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.power_management_pointer.data_scale'):
            self.assertEqual(self.dut.power_management_pointer.data_scale.inst_name, 'data_scale') # type: ignore[union-attr]
            self.assertEqual(self.dut.power_management_pointer.data_scale.full_inst_name, 'pcie_config_reg.power_management_pointer.data_scale')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.power_management_pointer.pme_status'):
            self.assertEqual(self.dut.power_management_pointer.pme_status.inst_name, 'pme_status') # type: ignore[union-attr]
            self.assertEqual(self.dut.power_management_pointer.pme_status.full_inst_name, 'pcie_config_reg.power_management_pointer.pme_status')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.power_management_pointer.b2_b3_support'):
            self.assertEqual(self.dut.power_management_pointer.b2_b3_support.inst_name, 'b2_b3_support') # type: ignore[union-attr]
            self.assertEqual(self.dut.power_management_pointer.b2_b3_support.full_inst_name, 'pcie_config_reg.power_management_pointer.b2_b3_support')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.power_management_pointer.bus_pwr_clk_ctrl_en'):
            self.assertEqual(self.dut.power_management_pointer.bus_pwr_clk_ctrl_en.inst_name, 'bus_pwr_clk_ctrl_en') # type: ignore[union-attr]
            self.assertEqual(self.dut.power_management_pointer.bus_pwr_clk_ctrl_en.full_inst_name, 'pcie_config_reg.power_management_pointer.bus_pwr_clk_ctrl_en')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.power_management_pointer.data'):
            self.assertEqual(self.dut.power_management_pointer.data.inst_name, 'data') # type: ignore[union-attr]
            self.assertEqual(self.dut.power_management_pointer.data.full_inst_name, 'pcie_config_reg.power_management_pointer.data')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.capabilities_power_na_pointer.capabilities_id'):
            self.assertEqual(self.dut.capabilities_power_na_pointer.capabilities_id.inst_name, 'capabilities_id') # type: ignore[union-attr]
            self.assertEqual(self.dut.capabilities_power_na_pointer.capabilities_id.full_inst_name, 'pcie_config_reg.capabilities_power_na_pointer.capabilities_id')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.capabilities_power_na_pointer.next_cap_ptr'):
            self.assertEqual(self.dut.capabilities_power_na_pointer.next_cap_ptr.inst_name, 'next_cap_ptr') # type: ignore[union-attr]
            self.assertEqual(self.dut.capabilities_power_na_pointer.next_cap_ptr.full_inst_name, 'pcie_config_reg.capabilities_power_na_pointer.next_cap_ptr')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.capabilities_power_na_pointer.capability_version'):
            self.assertEqual(self.dut.capabilities_power_na_pointer.capability_version.inst_name, 'capability_version') # type: ignore[union-attr]
            self.assertEqual(self.dut.capabilities_power_na_pointer.capability_version.full_inst_name, 'pcie_config_reg.capabilities_power_na_pointer.capability_version')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.capabilities_power_na_pointer.device_port_type'):
            self.assertEqual(self.dut.capabilities_power_na_pointer.device_port_type.inst_name, 'device_port_type') # type: ignore[union-attr]
            self.assertEqual(self.dut.capabilities_power_na_pointer.device_port_type.full_inst_name, 'pcie_config_reg.capabilities_power_na_pointer.device_port_type')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.capabilities_power_na_pointer.slot_implemented'):
            self.assertEqual(self.dut.capabilities_power_na_pointer.slot_implemented.inst_name, 'slot_implemented') # type: ignore[union-attr]
            self.assertEqual(self.dut.capabilities_power_na_pointer.slot_implemented.full_inst_name, 'pcie_config_reg.capabilities_power_na_pointer.slot_implemented')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.capabilities_power_na_pointer.interrupt_msg_number'):
            self.assertEqual(self.dut.capabilities_power_na_pointer.interrupt_msg_number.inst_name, 'interrupt_msg_number') # type: ignore[union-attr]
            self.assertEqual(self.dut.capabilities_power_na_pointer.interrupt_msg_number.full_inst_name, 'pcie_config_reg.capabilities_power_na_pointer.interrupt_msg_number')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.capabilities_power_na_pointer.Undefined'):
            self.assertEqual(self.dut.capabilities_power_na_pointer.Undefined.inst_name, 'Undefined') # type: ignore[union-attr]
            self.assertEqual(self.dut.capabilities_power_na_pointer.Undefined.full_inst_name, 'pcie_config_reg.capabilities_power_na_pointer.Undefined')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.capabilities_power_na_pointer.RsvdP'):
            self.assertEqual(self.dut.capabilities_power_na_pointer.RsvdP.inst_name, 'RsvdP') # type: ignore[union-attr]
            self.assertEqual(self.dut.capabilities_power_na_pointer.RsvdP.full_inst_name, 'pcie_config_reg.capabilities_power_na_pointer.RsvdP')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.link_control_3_register.perform_equalization'):
            self.assertEqual(self.dut.link_control_3_register.perform_equalization.inst_name, 'perform_equalization') # type: ignore[union-attr]
            self.assertEqual(self.dut.link_control_3_register.perform_equalization.full_inst_name, 'pcie_config_reg.link_control_3_register.perform_equalization')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.link_control_3_register.link_eq_req_intr_en'):
            self.assertEqual(self.dut.link_control_3_register.link_eq_req_intr_en.inst_name, 'link_eq_req_intr_en') # type: ignore[union-attr]
            self.assertEqual(self.dut.link_control_3_register.link_eq_req_intr_en.full_inst_name, 'pcie_config_reg.link_control_3_register.link_eq_req_intr_en')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.lane_error_status_register.lane_error'):
            self.assertEqual(self.dut.lane_error_status_register.lane_error.inst_name, 'lane_error') # type: ignore[union-attr]
            self.assertEqual(self.dut.lane_error_status_register.lane_error.full_inst_name, 'pcie_config_reg.lane_error_status_register.lane_error')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.lane_eq_ctrl_register.downstream_tx_preset'):
            self.assertEqual(self.dut.lane_eq_ctrl_register.downstream_tx_preset.inst_name, 'downstream_tx_preset') # type: ignore[union-attr]
            self.assertEqual(self.dut.lane_eq_ctrl_register.downstream_tx_preset.full_inst_name, 'pcie_config_reg.lane_eq_ctrl_register.downstream_tx_preset')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.lane_eq_ctrl_register.downstream_rx_preset_hint'):
            self.assertEqual(self.dut.lane_eq_ctrl_register.downstream_rx_preset_hint.inst_name, 'downstream_rx_preset_hint') # type: ignore[union-attr]
            self.assertEqual(self.dut.lane_eq_ctrl_register.downstream_rx_preset_hint.full_inst_name, 'pcie_config_reg.lane_eq_ctrl_register.downstream_rx_preset_hint')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.lane_eq_ctrl_register.upstream_tx_preset'):
            self.assertEqual(self.dut.lane_eq_ctrl_register.upstream_tx_preset.inst_name, 'upstream_tx_preset') # type: ignore[union-attr]
            self.assertEqual(self.dut.lane_eq_ctrl_register.upstream_tx_preset.full_inst_name, 'pcie_config_reg.lane_eq_ctrl_register.upstream_tx_preset')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.lane_eq_ctrl_register.upstream_rx_preset_hint'):
            self.assertEqual(self.dut.lane_eq_ctrl_register.upstream_rx_preset_hint.inst_name, 'upstream_rx_preset_hint') # type: ignore[union-attr]
            self.assertEqual(self.dut.lane_eq_ctrl_register.upstream_rx_preset_hint.full_inst_name, 'pcie_config_reg.lane_eq_ctrl_register.upstream_rx_preset_hint')  # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.extended_capabilities.ext_cap'):
            self.assertEqual(self.dut.extended_capabilities.ext_cap.inst_name, 'ext_cap') # type: ignore[union-attr]
            self.assertEqual(self.dut.extended_capabilities.ext_cap.full_inst_name, 'pcie_config_reg.extended_capabilities.ext_cap')  # type: ignore[union-attr]
        

    def test_name_property(self)  -> None:
        """
        Walk the address map and check the name property has been correctly populated
        """
        with self.subTest(msg='node: pcie_config_reg.byte_offset_00'):
            
            self.assertEqual(self.dut.byte_offset_00.rdl_name, "Byte Offset 00") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_04'):
            
            self.assertEqual(self.dut.byte_offset_04.rdl_name, "Byte Offset 04") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_08'):
            
            self.assertEqual(self.dut.byte_offset_08.rdl_name, "Byte Offset 08") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_0C'):
            
            self.assertIsNone(self.dut.byte_offset_0C.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.base_address_register_0'):
            
            self.assertEqual(self.dut.base_address_register_0.rdl_name, "Base Address Register 0") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_1'):
            
            self.assertEqual(self.dut.base_ddress_register_1.rdl_name, "Base Address Register 1") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_2'):
            
            self.assertEqual(self.dut.base_ddress_register_2.rdl_name, "Base Address Register 2") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_3'):
            
            self.assertEqual(self.dut.base_ddress_register_3.rdl_name, "Base Address Register 3") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_4'):
            
            self.assertEqual(self.dut.base_ddress_register_4.rdl_name, "Base Address Register 4") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_5'):
            
            self.assertEqual(self.dut.base_ddress_register_5.rdl_name, "Base Address Register 5") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.cardbus_cis_pointer'):
            
            self.assertEqual(self.dut.cardbus_cis_pointer.rdl_name, "Cardbus CIS Pointer") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_2C'):
            
            self.assertEqual(self.dut.byte_offset_2C.rdl_name, "Byte Offset 2C") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.capabilities_pointer'):
            
            self.assertEqual(self.dut.capabilities_pointer.rdl_name, "capabilities_pointer") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_3C'):
            
            self.assertEqual(self.dut.byte_offset_3C.rdl_name, "Byte Offset 3C") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.capabilities_power_mngt_pointer'):
            
            self.assertEqual(self.dut.capabilities_power_mngt_pointer.rdl_name, "capabilities pointer") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.power_management_pointer'):
            
            self.assertEqual(self.dut.power_management_pointer.rdl_name, "power management") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.capabilities_power_na_pointer'):
            
            self.assertEqual(self.dut.capabilities_power_na_pointer.rdl_name, "PCI Express Capabilities Register ") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.link_control_3_register'):
            
            self.assertEqual(self.dut.link_control_3_register.rdl_name, "Link Control 3 Register (Offset 04h) ") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.lane_error_status_register'):
            
            self.assertEqual(self.dut.lane_error_status_register.rdl_name, "Lane Error Status Register (Offset 08h)") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.lane_eq_ctrl_register'):
            
            self.assertEqual(self.dut.lane_eq_ctrl_register.rdl_name, "Lane Equalization Control Register (Offset 0Ch)") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.extended_capabilities'):
            
            self.assertEqual(self.dut.extended_capabilities.rdl_name, "extended capabilities") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_00.Vendor_ID'):
            
            self.assertIsNone(self.dut.byte_offset_00.Vendor_ID.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_00.Device_ID'):
            
            self.assertIsNone(self.dut.byte_offset_00.Device_ID.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.bus_master_enable'):
            
            self.assertIsNone(self.dut.byte_offset_04.bus_master_enable.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.special_cycle_enable'):
            
            self.assertIsNone(self.dut.byte_offset_04.special_cycle_enable.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.memory_write_invalidate'):
            
            self.assertIsNone(self.dut.byte_offset_04.memory_write_invalidate.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.vga_palette_snoop'):
            
            self.assertIsNone(self.dut.byte_offset_04.vga_palette_snoop.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.parity_error_response'):
            
            self.assertIsNone(self.dut.byte_offset_04.parity_error_response.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.idsel_step_wait_cycle_control'):
            
            self.assertIsNone(self.dut.byte_offset_04.idsel_step_wait_cycle_control.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.SERR_Enable'):
            
            self.assertIsNone(self.dut.byte_offset_04.SERR_Enable.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.fast_b2b_transactions_enable'):
            
            self.assertIsNone(self.dut.byte_offset_04.fast_b2b_transactions_enable.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.interrupt_disable'):
            
            self.assertIsNone(self.dut.byte_offset_04.interrupt_disable.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.rsvd'):
            
            self.assertIsNone(self.dut.byte_offset_04.rsvd.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.interrupt_status'):
            
            self.assertIsNone(self.dut.byte_offset_04.interrupt_status.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.capabilities_list'):
            
            self.assertIsNone(self.dut.byte_offset_04.capabilities_list.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.sixtysix_mhz_capable'):
            
            self.assertIsNone(self.dut.byte_offset_04.sixtysix_mhz_capable.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.fast_b2b_transactions_capable'):
            
            self.assertIsNone(self.dut.byte_offset_04.fast_b2b_transactions_capable.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.master_data_parity_error'):
            
            self.assertIsNone(self.dut.byte_offset_04.master_data_parity_error.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.devsel_timing'):
            
            self.assertIsNone(self.dut.byte_offset_04.devsel_timing.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.signaled_target_abort'):
            
            self.assertIsNone(self.dut.byte_offset_04.signaled_target_abort.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.received_target_abort'):
            
            self.assertIsNone(self.dut.byte_offset_04.received_target_abort.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.received_master_abort'):
            
            self.assertIsNone(self.dut.byte_offset_04.received_master_abort.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.signaled_system_error'):
            
            self.assertIsNone(self.dut.byte_offset_04.signaled_system_error.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.detected_parity_error'):
            
            self.assertIsNone(self.dut.byte_offset_04.detected_parity_error.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_08.Revision_ID'):
            
            self.assertIsNone(self.dut.byte_offset_08.Revision_ID.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_08.Class_Code'):
            
            self.assertIsNone(self.dut.byte_offset_08.Class_Code.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_0C.cache_line_size_register'):
            
            self.assertIsNone(self.dut.byte_offset_0C.cache_line_size_register.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_0C.latency_timer_register'):
            
            self.assertIsNone(self.dut.byte_offset_0C.latency_timer_register.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_0C.interrupt_line_register'):
            
            self.assertIsNone(self.dut.byte_offset_0C.interrupt_line_register.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_0C.interrupt_pin_register'):
            
            self.assertIsNone(self.dut.byte_offset_0C.interrupt_pin_register.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.base_address_register_0.region_type'):
            
            self.assertIsNone(self.dut.base_address_register_0.region_type.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.base_address_register_0.locatable'):
            
            self.assertIsNone(self.dut.base_address_register_0.locatable.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.base_address_register_0.prefetchable'):
            
            self.assertIsNone(self.dut.base_address_register_0.prefetchable.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.base_address_register_0.base_adress'):
            
            self.assertIsNone(self.dut.base_address_register_0.base_adress.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_1.region_type'):
            
            self.assertIsNone(self.dut.base_ddress_register_1.region_type.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_1.locatable'):
            
            self.assertIsNone(self.dut.base_ddress_register_1.locatable.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_1.prefetchable'):
            
            self.assertIsNone(self.dut.base_ddress_register_1.prefetchable.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_1.base_adress'):
            
            self.assertIsNone(self.dut.base_ddress_register_1.base_adress.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_2.BAR'):
            
            self.assertIsNone(self.dut.base_ddress_register_2.BAR.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_3.BAR'):
            
            self.assertIsNone(self.dut.base_ddress_register_3.BAR.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_4.BAR'):
            
            self.assertIsNone(self.dut.base_ddress_register_4.BAR.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_5.BAR'):
            
            self.assertIsNone(self.dut.base_ddress_register_5.BAR.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.cardbus_cis_pointer.word'):
            
            self.assertIsNone(self.dut.cardbus_cis_pointer.word.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_2C.Vendor_ID'):
            
            self.assertIsNone(self.dut.byte_offset_2C.Vendor_ID.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_2C.Device_ID'):
            
            self.assertIsNone(self.dut.byte_offset_2C.Device_ID.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.capabilities_pointer.capabilities_ptr'):
            
            self.assertIsNone(self.dut.capabilities_pointer.capabilities_ptr.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_3C.interrupt_line'):
            
            self.assertIsNone(self.dut.byte_offset_3C.interrupt_line.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_3C.interrupt_pin'):
            
            self.assertIsNone(self.dut.byte_offset_3C.interrupt_pin.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_3C.min_gnt'):
            
            self.assertIsNone(self.dut.byte_offset_3C.min_gnt.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_3C.max_lat'):
            
            self.assertIsNone(self.dut.byte_offset_3C.max_lat.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.capabilities_power_mngt_pointer.capabilities_id'):
            
            self.assertIsNone(self.dut.capabilities_power_mngt_pointer.capabilities_id.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.capabilities_power_mngt_pointer.next_cap_ptr'):
            
            self.assertIsNone(self.dut.capabilities_power_mngt_pointer.next_cap_ptr.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.capabilities_power_mngt_pointer.version'):
            
            self.assertIsNone(self.dut.capabilities_power_mngt_pointer.version.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.capabilities_power_mngt_pointer.pme_clock'):
            
            self.assertIsNone(self.dut.capabilities_power_mngt_pointer.pme_clock.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.capabilities_power_mngt_pointer.dev_spec_init'):
            
            self.assertIsNone(self.dut.capabilities_power_mngt_pointer.dev_spec_init.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.capabilities_power_mngt_pointer.aux_current'):
            
            self.assertIsNone(self.dut.capabilities_power_mngt_pointer.aux_current.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.capabilities_power_mngt_pointer.d1_support'):
            
            self.assertIsNone(self.dut.capabilities_power_mngt_pointer.d1_support.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.capabilities_power_mngt_pointer.d2_support'):
            
            self.assertIsNone(self.dut.capabilities_power_mngt_pointer.d2_support.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.capabilities_power_mngt_pointer.pme_support'):
            
            self.assertIsNone(self.dut.capabilities_power_mngt_pointer.pme_support.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.power_management_pointer.power_state'):
            
            self.assertIsNone(self.dut.power_management_pointer.power_state.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.power_management_pointer.pme_enable'):
            
            self.assertIsNone(self.dut.power_management_pointer.pme_enable.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.power_management_pointer.data_select'):
            
            self.assertIsNone(self.dut.power_management_pointer.data_select.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.power_management_pointer.data_scale'):
            
            self.assertIsNone(self.dut.power_management_pointer.data_scale.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.power_management_pointer.pme_status'):
            
            self.assertIsNone(self.dut.power_management_pointer.pme_status.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.power_management_pointer.b2_b3_support'):
            
            self.assertIsNone(self.dut.power_management_pointer.b2_b3_support.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.power_management_pointer.bus_pwr_clk_ctrl_en'):
            
            self.assertIsNone(self.dut.power_management_pointer.bus_pwr_clk_ctrl_en.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.power_management_pointer.data'):
            
            self.assertIsNone(self.dut.power_management_pointer.data.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.capabilities_power_na_pointer.capabilities_id'):
            
            self.assertIsNone(self.dut.capabilities_power_na_pointer.capabilities_id.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.capabilities_power_na_pointer.next_cap_ptr'):
            
            self.assertIsNone(self.dut.capabilities_power_na_pointer.next_cap_ptr.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.capabilities_power_na_pointer.capability_version'):
            
            self.assertIsNone(self.dut.capabilities_power_na_pointer.capability_version.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.capabilities_power_na_pointer.device_port_type'):
            
            self.assertIsNone(self.dut.capabilities_power_na_pointer.device_port_type.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.capabilities_power_na_pointer.slot_implemented'):
            
            self.assertIsNone(self.dut.capabilities_power_na_pointer.slot_implemented.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.capabilities_power_na_pointer.interrupt_msg_number'):
            
            self.assertIsNone(self.dut.capabilities_power_na_pointer.interrupt_msg_number.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.capabilities_power_na_pointer.Undefined'):
            
            self.assertIsNone(self.dut.capabilities_power_na_pointer.Undefined.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.capabilities_power_na_pointer.RsvdP'):
            
            self.assertIsNone(self.dut.capabilities_power_na_pointer.RsvdP.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.link_control_3_register.perform_equalization'):
            
            self.assertIsNone(self.dut.link_control_3_register.perform_equalization.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.link_control_3_register.link_eq_req_intr_en'):
            
            self.assertIsNone(self.dut.link_control_3_register.link_eq_req_intr_en.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.lane_error_status_register.lane_error'):
            
            self.assertIsNone(self.dut.lane_error_status_register.lane_error.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.lane_eq_ctrl_register.downstream_tx_preset'):
            
            self.assertIsNone(self.dut.lane_eq_ctrl_register.downstream_tx_preset.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.lane_eq_ctrl_register.downstream_rx_preset_hint'):
            
            self.assertIsNone(self.dut.lane_eq_ctrl_register.downstream_rx_preset_hint.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.lane_eq_ctrl_register.upstream_tx_preset'):
            
            self.assertIsNone(self.dut.lane_eq_ctrl_register.upstream_tx_preset.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.lane_eq_ctrl_register.upstream_rx_preset_hint'):
            
            self.assertIsNone(self.dut.lane_eq_ctrl_register.upstream_rx_preset_hint.rdl_name)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.extended_capabilities.ext_cap'):
            
            self.assertIsNone(self.dut.extended_capabilities.ext_cap.rdl_name)  # type: ignore[union-attr]
            

        

    def test_desc(self)  -> None:
        """
        Walk the address map and check the desc property has been correctly populated
        """
        with self.subTest(msg='node: pcie_config_reg.byte_offset_00'):
            
            self.assertIsNone(self.dut.byte_offset_00.rdl_desc)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_04'):
            
            self.assertIsNone(self.dut.byte_offset_04.rdl_desc)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_08'):
            
            self.assertIsNone(self.dut.byte_offset_08.rdl_desc)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_0C'):
            
            self.assertIsNone(self.dut.byte_offset_0C.rdl_desc)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.base_address_register_0'):
            
            self.assertIsNone(self.dut.base_address_register_0.rdl_desc)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_1'):
            
            self.assertIsNone(self.dut.base_ddress_register_1.rdl_desc)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_2'):
            
            self.assertIsNone(self.dut.base_ddress_register_2.rdl_desc)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_3'):
            
            self.assertIsNone(self.dut.base_ddress_register_3.rdl_desc)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_4'):
            
            self.assertIsNone(self.dut.base_ddress_register_4.rdl_desc)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_5'):
            
            self.assertIsNone(self.dut.base_ddress_register_5.rdl_desc)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.cardbus_cis_pointer'):
            
            self.assertIsNone(self.dut.cardbus_cis_pointer.rdl_desc)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_2C'):
            
            self.assertIsNone(self.dut.byte_offset_2C.rdl_desc)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.capabilities_pointer'):
            
            self.assertIsNone(self.dut.capabilities_pointer.rdl_desc)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_3C'):
            
            self.assertIsNone(self.dut.byte_offset_3C.rdl_desc)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.capabilities_power_mngt_pointer'):
            
            self.assertIsNone(self.dut.capabilities_power_mngt_pointer.rdl_desc)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.power_management_pointer'):
            
            self.assertIsNone(self.dut.power_management_pointer.rdl_desc)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.capabilities_power_na_pointer'):
            
            self.assertIsNone(self.dut.capabilities_power_na_pointer.rdl_desc)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.link_control_3_register'):
            
            self.assertIsNone(self.dut.link_control_3_register.rdl_desc)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.lane_error_status_register'):
            
            self.assertIsNone(self.dut.lane_error_status_register.rdl_desc)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.lane_eq_ctrl_register'):
            
            self.assertIsNone(self.dut.lane_eq_ctrl_register.rdl_desc)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.extended_capabilities'):
            
            self.assertIsNone(self.dut.extended_capabilities.rdl_desc)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_00.Vendor_ID'):
            
            self.assertEqual(self.dut.byte_offset_00.Vendor_ID.rdl_desc, "Vendor ID") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_00.Device_ID'):
            
            self.assertEqual(self.dut.byte_offset_00.Device_ID.rdl_desc, "Device ID") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.bus_master_enable'):
            
            self.assertEqual(self.dut.byte_offset_04.bus_master_enable.rdl_desc, "bus_master_enable") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.special_cycle_enable'):
            
            self.assertEqual(self.dut.byte_offset_04.special_cycle_enable.rdl_desc, "special_cycle_enable") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.memory_write_invalidate'):
            
            self.assertEqual(self.dut.byte_offset_04.memory_write_invalidate.rdl_desc, "memory_write_invalidate") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.vga_palette_snoop'):
            
            self.assertEqual(self.dut.byte_offset_04.vga_palette_snoop.rdl_desc, "vga_palette_snoop") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.parity_error_response'):
            
            self.assertEqual(self.dut.byte_offset_04.parity_error_response.rdl_desc, "parity_error_response") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.idsel_step_wait_cycle_control'):
            
            self.assertEqual(self.dut.byte_offset_04.idsel_step_wait_cycle_control.rdl_desc, "idsel_step_wait_cycle_control") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.SERR_Enable'):
            
            self.assertEqual(self.dut.byte_offset_04.SERR_Enable.rdl_desc, "SERR_Enable") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.fast_b2b_transactions_enable'):
            
            self.assertEqual(self.dut.byte_offset_04.fast_b2b_transactions_enable.rdl_desc, "fast_b2b_transactions_enable") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.interrupt_disable'):
            
            self.assertEqual(self.dut.byte_offset_04.interrupt_disable.rdl_desc, "interrupt_disable") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.rsvd'):
            
            self.assertEqual(self.dut.byte_offset_04.rsvd.rdl_desc, "unused") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.interrupt_status'):
            
            self.assertEqual(self.dut.byte_offset_04.interrupt_status.rdl_desc, "interrupt_status") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.capabilities_list'):
            
            self.assertEqual(self.dut.byte_offset_04.capabilities_list.rdl_desc, "capabilities_list") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.sixtysix_mhz_capable'):
            
            self.assertEqual(self.dut.byte_offset_04.sixtysix_mhz_capable.rdl_desc, "sixtysix_mhz_capable") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.fast_b2b_transactions_capable'):
            
            self.assertEqual(self.dut.byte_offset_04.fast_b2b_transactions_capable.rdl_desc, "fast_b2b_transactions_capable") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.master_data_parity_error'):
            
            self.assertEqual(self.dut.byte_offset_04.master_data_parity_error.rdl_desc, "master_data_parity_error") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.devsel_timing'):
            
            self.assertEqual(self.dut.byte_offset_04.devsel_timing.rdl_desc, "devsel_timing") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.signaled_target_abort'):
            
            self.assertEqual(self.dut.byte_offset_04.signaled_target_abort.rdl_desc, "signaled_target_abort") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.received_target_abort'):
            
            self.assertEqual(self.dut.byte_offset_04.received_target_abort.rdl_desc, "received_target_abort") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.received_master_abort'):
            
            self.assertEqual(self.dut.byte_offset_04.received_master_abort.rdl_desc, "received_master_abort") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.signaled_system_error'):
            
            self.assertEqual(self.dut.byte_offset_04.signaled_system_error.rdl_desc, "signaled_system_error") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.detected_parity_error'):
            
            self.assertEqual(self.dut.byte_offset_04.detected_parity_error.rdl_desc, "detected_parity_error") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_08.Revision_ID'):
            
            self.assertEqual(self.dut.byte_offset_08.Revision_ID.rdl_desc, "Revision ID") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_08.Class_Code'):
            
            self.assertEqual(self.dut.byte_offset_08.Class_Code.rdl_desc, "Class Code") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_0C.cache_line_size_register'):
            
            self.assertEqual(self.dut.byte_offset_0C.cache_line_size_register.rdl_desc, "Cache Line Size Register (Offset 0Ch)") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_0C.latency_timer_register'):
            
            self.assertEqual(self.dut.byte_offset_0C.latency_timer_register.rdl_desc, "Latency Timer Register   (Offset 0Dh)") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_0C.interrupt_line_register'):
            
            self.assertEqual(self.dut.byte_offset_0C.interrupt_line_register.rdl_desc, "Interrupt Line Register  (Offset 3Ch)") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_0C.interrupt_pin_register'):
            
            self.assertEqual(self.dut.byte_offset_0C.interrupt_pin_register.rdl_desc, "Interrupt Pin Register   (Offset 3Dh)") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.base_address_register_0.region_type'):
            
            self.assertEqual(self.dut.base_address_register_0.region_type.rdl_desc, "Region Type") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.base_address_register_0.locatable'):
            
            self.assertEqual(self.dut.base_address_register_0.locatable.rdl_desc, "Locatable") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.base_address_register_0.prefetchable'):
            
            self.assertEqual(self.dut.base_address_register_0.prefetchable.rdl_desc, "prefetchable") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.base_address_register_0.base_adress'):
            
            self.assertEqual(self.dut.base_address_register_0.base_adress.rdl_desc, "base address") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_1.region_type'):
            
            self.assertEqual(self.dut.base_ddress_register_1.region_type.rdl_desc, "Region Type") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_1.locatable'):
            
            self.assertEqual(self.dut.base_ddress_register_1.locatable.rdl_desc, "Locatable") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_1.prefetchable'):
            
            self.assertEqual(self.dut.base_ddress_register_1.prefetchable.rdl_desc, "prefetchable") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_1.base_adress'):
            
            self.assertEqual(self.dut.base_ddress_register_1.base_adress.rdl_desc, "base address") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_2.BAR'):
            
            self.assertEqual(self.dut.base_ddress_register_2.BAR.rdl_desc, "BAR") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_3.BAR'):
            
            self.assertEqual(self.dut.base_ddress_register_3.BAR.rdl_desc, "BAR") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_4.BAR'):
            
            self.assertEqual(self.dut.base_ddress_register_4.BAR.rdl_desc, "BAR") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_5.BAR'):
            
            self.assertEqual(self.dut.base_ddress_register_5.BAR.rdl_desc, "BAR") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.cardbus_cis_pointer.word'):
            
            self.assertEqual(self.dut.cardbus_cis_pointer.word.rdl_desc, "word") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_2C.Vendor_ID'):
            
            self.assertEqual(self.dut.byte_offset_2C.Vendor_ID.rdl_desc, "Subsystem Vendor ID") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_2C.Device_ID'):
            
            self.assertEqual(self.dut.byte_offset_2C.Device_ID.rdl_desc, "Subsystem ID") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.capabilities_pointer.capabilities_ptr'):
            
            self.assertEqual(self.dut.capabilities_pointer.capabilities_ptr.rdl_desc, "capabilities_pointer") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_3C.interrupt_line'):
            
            self.assertEqual(self.dut.byte_offset_3C.interrupt_line.rdl_desc, "Interrupt Line Register") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_3C.interrupt_pin'):
            
            self.assertEqual(self.dut.byte_offset_3C.interrupt_pin.rdl_desc, "Interrupt Pin Register") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_3C.min_gnt'):
            
            self.assertEqual(self.dut.byte_offset_3C.min_gnt.rdl_desc, "Min Gnt") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.byte_offset_3C.max_lat'):
            
            self.assertEqual(self.dut.byte_offset_3C.max_lat.rdl_desc, "Max Lat") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.capabilities_power_mngt_pointer.capabilities_id'):
            
            self.assertEqual(self.dut.capabilities_power_mngt_pointer.capabilities_id.rdl_desc, "Capabilities id") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.capabilities_power_mngt_pointer.next_cap_ptr'):
            
            self.assertEqual(self.dut.capabilities_power_mngt_pointer.next_cap_ptr.rdl_desc, "next capability pointer") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.capabilities_power_mngt_pointer.version'):
            
            self.assertIsNone(self.dut.capabilities_power_mngt_pointer.version.rdl_desc)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.capabilities_power_mngt_pointer.pme_clock'):
            
            self.assertIsNone(self.dut.capabilities_power_mngt_pointer.pme_clock.rdl_desc)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.capabilities_power_mngt_pointer.dev_spec_init'):
            
            self.assertIsNone(self.dut.capabilities_power_mngt_pointer.dev_spec_init.rdl_desc)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.capabilities_power_mngt_pointer.aux_current'):
            
            self.assertIsNone(self.dut.capabilities_power_mngt_pointer.aux_current.rdl_desc)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.capabilities_power_mngt_pointer.d1_support'):
            
            self.assertIsNone(self.dut.capabilities_power_mngt_pointer.d1_support.rdl_desc)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.capabilities_power_mngt_pointer.d2_support'):
            
            self.assertIsNone(self.dut.capabilities_power_mngt_pointer.d2_support.rdl_desc)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.capabilities_power_mngt_pointer.pme_support'):
            
            self.assertIsNone(self.dut.capabilities_power_mngt_pointer.pme_support.rdl_desc)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.power_management_pointer.power_state'):
            
            self.assertIsNone(self.dut.power_management_pointer.power_state.rdl_desc)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.power_management_pointer.pme_enable'):
            
            self.assertIsNone(self.dut.power_management_pointer.pme_enable.rdl_desc)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.power_management_pointer.data_select'):
            
            self.assertIsNone(self.dut.power_management_pointer.data_select.rdl_desc)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.power_management_pointer.data_scale'):
            
            self.assertIsNone(self.dut.power_management_pointer.data_scale.rdl_desc)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.power_management_pointer.pme_status'):
            
            self.assertIsNone(self.dut.power_management_pointer.pme_status.rdl_desc)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.power_management_pointer.b2_b3_support'):
            
            self.assertIsNone(self.dut.power_management_pointer.b2_b3_support.rdl_desc)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.power_management_pointer.bus_pwr_clk_ctrl_en'):
            
            self.assertIsNone(self.dut.power_management_pointer.bus_pwr_clk_ctrl_en.rdl_desc)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.power_management_pointer.data'):
            
            self.assertIsNone(self.dut.power_management_pointer.data.rdl_desc)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.capabilities_power_na_pointer.capabilities_id'):
            
            self.assertEqual(self.dut.capabilities_power_na_pointer.capabilities_id.rdl_desc, "Capabilities id") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.capabilities_power_na_pointer.next_cap_ptr'):
            
            self.assertEqual(self.dut.capabilities_power_na_pointer.next_cap_ptr.rdl_desc, "next capability pointer") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.capabilities_power_na_pointer.capability_version'):
            
            self.assertIsNone(self.dut.capabilities_power_na_pointer.capability_version.rdl_desc)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.capabilities_power_na_pointer.device_port_type'):
            
            self.assertIsNone(self.dut.capabilities_power_na_pointer.device_port_type.rdl_desc)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.capabilities_power_na_pointer.slot_implemented'):
            
            self.assertIsNone(self.dut.capabilities_power_na_pointer.slot_implemented.rdl_desc)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.capabilities_power_na_pointer.interrupt_msg_number'):
            
            self.assertIsNone(self.dut.capabilities_power_na_pointer.interrupt_msg_number.rdl_desc)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.capabilities_power_na_pointer.Undefined'):
            
            self.assertIsNone(self.dut.capabilities_power_na_pointer.Undefined.rdl_desc)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.capabilities_power_na_pointer.RsvdP'):
            
            self.assertIsNone(self.dut.capabilities_power_na_pointer.RsvdP.rdl_desc)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.link_control_3_register.perform_equalization'):
            
            self.assertEqual(self.dut.link_control_3_register.perform_equalization.rdl_desc, "Perform Equalization") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.link_control_3_register.link_eq_req_intr_en'):
            
            self.assertIsNone(self.dut.link_control_3_register.link_eq_req_intr_en.rdl_desc)  # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.lane_error_status_register.lane_error'):
            
            self.assertEqual(self.dut.lane_error_status_register.lane_error.rdl_desc, "Perform Equalization") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.lane_eq_ctrl_register.downstream_tx_preset'):
            
            self.assertEqual(self.dut.lane_eq_ctrl_register.downstream_tx_preset.rdl_desc, "Downstream Port Transmitter Preset") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.lane_eq_ctrl_register.downstream_rx_preset_hint'):
            
            self.assertEqual(self.dut.lane_eq_ctrl_register.downstream_rx_preset_hint.rdl_desc, "Downstream Port Receiver Preset Hint") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.lane_eq_ctrl_register.upstream_tx_preset'):
            
            self.assertEqual(self.dut.lane_eq_ctrl_register.upstream_tx_preset.rdl_desc, "Upstream Port Transmitter Preset") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.lane_eq_ctrl_register.upstream_rx_preset_hint'):
            
            self.assertEqual(self.dut.lane_eq_ctrl_register.upstream_rx_preset_hint.rdl_desc, "Upstream Port Receiver Preset Hint") # type: ignore[union-attr]
            

        with self.subTest(msg='node: pcie_config_reg.extended_capabilities.ext_cap'):
            
            self.assertEqual(self.dut.extended_capabilities.ext_cap.rdl_desc, "exended capabilities") # type: ignore[union-attr]
            

        

    def test_sizes(self) -> None:
        """
        Check that the sizes all match
        """
        with self.subTest(msg='node: pcie_config_reg.byte_offset_00'):
            self.assertEqual(self.dut.byte_offset_00.size, 4) # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_04'):
            self.assertEqual(self.dut.byte_offset_04.size, 4) # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_08'):
            self.assertEqual(self.dut.byte_offset_08.size, 4) # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_0C'):
            self.assertEqual(self.dut.byte_offset_0C.size, 4) # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.base_address_register_0'):
            self.assertEqual(self.dut.base_address_register_0.size, 4) # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_1'):
            self.assertEqual(self.dut.base_ddress_register_1.size, 4) # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_2'):
            self.assertEqual(self.dut.base_ddress_register_2.size, 4) # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_3'):
            self.assertEqual(self.dut.base_ddress_register_3.size, 4) # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_4'):
            self.assertEqual(self.dut.base_ddress_register_4.size, 4) # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_5'):
            self.assertEqual(self.dut.base_ddress_register_5.size, 4) # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.cardbus_cis_pointer'):
            self.assertEqual(self.dut.cardbus_cis_pointer.size, 4) # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_2C'):
            self.assertEqual(self.dut.byte_offset_2C.size, 4) # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.capabilities_pointer'):
            self.assertEqual(self.dut.capabilities_pointer.size, 4) # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_3C'):
            self.assertEqual(self.dut.byte_offset_3C.size, 4) # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.capabilities_power_mngt_pointer'):
            self.assertEqual(self.dut.capabilities_power_mngt_pointer.size, 4) # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.power_management_pointer'):
            self.assertEqual(self.dut.power_management_pointer.size, 4) # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.capabilities_power_na_pointer'):
            self.assertEqual(self.dut.capabilities_power_na_pointer.size, 4) # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.link_control_3_register'):
            self.assertEqual(self.dut.link_control_3_register.size, 4) # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.lane_error_status_register'):
            self.assertEqual(self.dut.lane_error_status_register.size, 4) # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.lane_eq_ctrl_register'):
            self.assertEqual(self.dut.lane_eq_ctrl_register.size, 4) # type: ignore[union-attr]
        with self.subTest(msg='node: pcie_config_reg.extended_capabilities'):
            self.assertEqual(self.dut.extended_capabilities.size, 4) # type: ignore[union-attr]
        

        # check the size of the address map itself
        
        with self.subTest(msg='node: pcie_config_reg'):
            self.assertEqual(self.dut.size, 260) # type: ignore[union-attr]
        


    def test_register_properties(self)  -> None:
        """
        Walk the address map and check the address, size and accesswidth of every register is
        correct
        """
        with self.subTest(msg='register: pcie_config_reg.byte_offset_00'):
            self.assertEqual(self.dut.byte_offset_00.address, 0) # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_00.width, 32) # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_00.size, 4) # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_00.accesswidth, self.dut.byte_offset_00.accesswidth) # type: ignore[union-attr]
        with self.subTest(msg='register: pcie_config_reg.byte_offset_04'):
            self.assertEqual(self.dut.byte_offset_04.address, 4) # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_04.width, 32) # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_04.size, 4) # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_04.accesswidth, self.dut.byte_offset_04.accesswidth) # type: ignore[union-attr]
        with self.subTest(msg='register: pcie_config_reg.byte_offset_08'):
            self.assertEqual(self.dut.byte_offset_08.address, 8) # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_08.width, 32) # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_08.size, 4) # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_08.accesswidth, self.dut.byte_offset_08.accesswidth) # type: ignore[union-attr]
        with self.subTest(msg='register: pcie_config_reg.byte_offset_0C'):
            self.assertEqual(self.dut.byte_offset_0C.address, 12) # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_0C.width, 32) # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_0C.size, 4) # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_0C.accesswidth, self.dut.byte_offset_0C.accesswidth) # type: ignore[union-attr]
        with self.subTest(msg='register: pcie_config_reg.base_address_register_0'):
            self.assertEqual(self.dut.base_address_register_0.address, 16) # type: ignore[union-attr]
            self.assertEqual(self.dut.base_address_register_0.width, 32) # type: ignore[union-attr]
            self.assertEqual(self.dut.base_address_register_0.size, 4) # type: ignore[union-attr]
            self.assertEqual(self.dut.base_address_register_0.accesswidth, self.dut.base_address_register_0.accesswidth) # type: ignore[union-attr]
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_1'):
            self.assertEqual(self.dut.base_ddress_register_1.address, 20) # type: ignore[union-attr]
            self.assertEqual(self.dut.base_ddress_register_1.width, 32) # type: ignore[union-attr]
            self.assertEqual(self.dut.base_ddress_register_1.size, 4) # type: ignore[union-attr]
            self.assertEqual(self.dut.base_ddress_register_1.accesswidth, self.dut.base_ddress_register_1.accesswidth) # type: ignore[union-attr]
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_2'):
            self.assertEqual(self.dut.base_ddress_register_2.address, 24) # type: ignore[union-attr]
            self.assertEqual(self.dut.base_ddress_register_2.width, 32) # type: ignore[union-attr]
            self.assertEqual(self.dut.base_ddress_register_2.size, 4) # type: ignore[union-attr]
            self.assertEqual(self.dut.base_ddress_register_2.accesswidth, self.dut.base_ddress_register_2.accesswidth) # type: ignore[union-attr]
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_3'):
            self.assertEqual(self.dut.base_ddress_register_3.address, 28) # type: ignore[union-attr]
            self.assertEqual(self.dut.base_ddress_register_3.width, 32) # type: ignore[union-attr]
            self.assertEqual(self.dut.base_ddress_register_3.size, 4) # type: ignore[union-attr]
            self.assertEqual(self.dut.base_ddress_register_3.accesswidth, self.dut.base_ddress_register_3.accesswidth) # type: ignore[union-attr]
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_4'):
            self.assertEqual(self.dut.base_ddress_register_4.address, 32) # type: ignore[union-attr]
            self.assertEqual(self.dut.base_ddress_register_4.width, 32) # type: ignore[union-attr]
            self.assertEqual(self.dut.base_ddress_register_4.size, 4) # type: ignore[union-attr]
            self.assertEqual(self.dut.base_ddress_register_4.accesswidth, self.dut.base_ddress_register_4.accesswidth) # type: ignore[union-attr]
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_5'):
            self.assertEqual(self.dut.base_ddress_register_5.address, 36) # type: ignore[union-attr]
            self.assertEqual(self.dut.base_ddress_register_5.width, 32) # type: ignore[union-attr]
            self.assertEqual(self.dut.base_ddress_register_5.size, 4) # type: ignore[union-attr]
            self.assertEqual(self.dut.base_ddress_register_5.accesswidth, self.dut.base_ddress_register_5.accesswidth) # type: ignore[union-attr]
        with self.subTest(msg='register: pcie_config_reg.cardbus_cis_pointer'):
            self.assertEqual(self.dut.cardbus_cis_pointer.address, 40) # type: ignore[union-attr]
            self.assertEqual(self.dut.cardbus_cis_pointer.width, 32) # type: ignore[union-attr]
            self.assertEqual(self.dut.cardbus_cis_pointer.size, 4) # type: ignore[union-attr]
            self.assertEqual(self.dut.cardbus_cis_pointer.accesswidth, self.dut.cardbus_cis_pointer.accesswidth) # type: ignore[union-attr]
        with self.subTest(msg='register: pcie_config_reg.byte_offset_2C'):
            self.assertEqual(self.dut.byte_offset_2C.address, 44) # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_2C.width, 32) # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_2C.size, 4) # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_2C.accesswidth, self.dut.byte_offset_2C.accesswidth) # type: ignore[union-attr]
        with self.subTest(msg='register: pcie_config_reg.capabilities_pointer'):
            self.assertEqual(self.dut.capabilities_pointer.address, 52) # type: ignore[union-attr]
            self.assertEqual(self.dut.capabilities_pointer.width, 32) # type: ignore[union-attr]
            self.assertEqual(self.dut.capabilities_pointer.size, 4) # type: ignore[union-attr]
            self.assertEqual(self.dut.capabilities_pointer.accesswidth, self.dut.capabilities_pointer.accesswidth) # type: ignore[union-attr]
        with self.subTest(msg='register: pcie_config_reg.byte_offset_3C'):
            self.assertEqual(self.dut.byte_offset_3C.address, 60) # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_3C.width, 32) # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_3C.size, 4) # type: ignore[union-attr]
            self.assertEqual(self.dut.byte_offset_3C.accesswidth, self.dut.byte_offset_3C.accesswidth) # type: ignore[union-attr]
        with self.subTest(msg='register: pcie_config_reg.capabilities_power_mngt_pointer'):
            self.assertEqual(self.dut.capabilities_power_mngt_pointer.address, 64) # type: ignore[union-attr]
            self.assertEqual(self.dut.capabilities_power_mngt_pointer.width, 32) # type: ignore[union-attr]
            self.assertEqual(self.dut.capabilities_power_mngt_pointer.size, 4) # type: ignore[union-attr]
            self.assertEqual(self.dut.capabilities_power_mngt_pointer.accesswidth, self.dut.capabilities_power_mngt_pointer.accesswidth) # type: ignore[union-attr]
        with self.subTest(msg='register: pcie_config_reg.power_management_pointer'):
            self.assertEqual(self.dut.power_management_pointer.address, 68) # type: ignore[union-attr]
            self.assertEqual(self.dut.power_management_pointer.width, 32) # type: ignore[union-attr]
            self.assertEqual(self.dut.power_management_pointer.size, 4) # type: ignore[union-attr]
            self.assertEqual(self.dut.power_management_pointer.accesswidth, self.dut.power_management_pointer.accesswidth) # type: ignore[union-attr]
        with self.subTest(msg='register: pcie_config_reg.capabilities_power_na_pointer'):
            self.assertEqual(self.dut.capabilities_power_na_pointer.address, 72) # type: ignore[union-attr]
            self.assertEqual(self.dut.capabilities_power_na_pointer.width, 32) # type: ignore[union-attr]
            self.assertEqual(self.dut.capabilities_power_na_pointer.size, 4) # type: ignore[union-attr]
            self.assertEqual(self.dut.capabilities_power_na_pointer.accesswidth, self.dut.capabilities_power_na_pointer.accesswidth) # type: ignore[union-attr]
        with self.subTest(msg='register: pcie_config_reg.link_control_3_register'):
            self.assertEqual(self.dut.link_control_3_register.address, 76) # type: ignore[union-attr]
            self.assertEqual(self.dut.link_control_3_register.width, 32) # type: ignore[union-attr]
            self.assertEqual(self.dut.link_control_3_register.size, 4) # type: ignore[union-attr]
            self.assertEqual(self.dut.link_control_3_register.accesswidth, self.dut.link_control_3_register.accesswidth) # type: ignore[union-attr]
        with self.subTest(msg='register: pcie_config_reg.lane_error_status_register'):
            self.assertEqual(self.dut.lane_error_status_register.address, 80) # type: ignore[union-attr]
            self.assertEqual(self.dut.lane_error_status_register.width, 32) # type: ignore[union-attr]
            self.assertEqual(self.dut.lane_error_status_register.size, 4) # type: ignore[union-attr]
            self.assertEqual(self.dut.lane_error_status_register.accesswidth, self.dut.lane_error_status_register.accesswidth) # type: ignore[union-attr]
        with self.subTest(msg='register: pcie_config_reg.lane_eq_ctrl_register'):
            self.assertEqual(self.dut.lane_eq_ctrl_register.address, 84) # type: ignore[union-attr]
            self.assertEqual(self.dut.lane_eq_ctrl_register.width, 32) # type: ignore[union-attr]
            self.assertEqual(self.dut.lane_eq_ctrl_register.size, 4) # type: ignore[union-attr]
            self.assertEqual(self.dut.lane_eq_ctrl_register.accesswidth, self.dut.lane_eq_ctrl_register.accesswidth) # type: ignore[union-attr]
        with self.subTest(msg='register: pcie_config_reg.extended_capabilities'):
            self.assertEqual(self.dut.extended_capabilities.address, 256) # type: ignore[union-attr]
            self.assertEqual(self.dut.extended_capabilities.width, 32) # type: ignore[union-attr]
            self.assertEqual(self.dut.extended_capabilities.size, 4) # type: ignore[union-attr]
            self.assertEqual(self.dut.extended_capabilities.accesswidth, self.dut.extended_capabilities.accesswidth) # type: ignore[union-attr]
        

    def test_memory_properties(self)  -> None:
        """
        Walk the address map and check the address, size and accesswidth of every memory is
        correct
        """
        mut: AsyncMemory
        

    def test_field_properties(self)  -> None:
        """
        walk the address map and check:
        - that the lsb and msb of every field is correct
        - that where default values are provided they are applied correctly
        """
        fut:Field
        with self.subTest(msg='field: pcie_config_reg.byte_offset_00.Vendor_ID'):
            # test properties of field: pcie_config_reg.byte_offset_00.Vendor_ID
            fut = self.dut.byte_offset_00.Vendor_ID # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,0)
            self.assertEqual(fut.msb,15)
            self.assertEqual(fut.low,0)
            self.assertEqual(fut.high,15)
            self.assertEqual(fut.bitmask,0xFFFF)
            self.assertEqual(fut.inverse_bitmask,0xFFFF0000)
            self.assertEqual(fut.max_value,0xFFFF)
                
            self.assertEqual(fut.default,4660)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.byte_offset_00.Device_ID'):
            # test properties of field: pcie_config_reg.byte_offset_00.Device_ID
            fut = self.dut.byte_offset_00.Device_ID # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,16)
            self.assertEqual(fut.msb,31)
            self.assertEqual(fut.low,16)
            self.assertEqual(fut.high,31)
            self.assertEqual(fut.bitmask,0xFFFF0000)
            self.assertEqual(fut.inverse_bitmask,0xFFFF)
            self.assertEqual(fut.max_value,0xFFFF)
                
            self.assertEqual(fut.default,255)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.bus_master_enable'):
            # test properties of field: pcie_config_reg.byte_offset_04.bus_master_enable
            fut = self.dut.byte_offset_04.bus_master_enable # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,2)
            self.assertEqual(fut.msb,2)
            self.assertEqual(fut.low,2)
            self.assertEqual(fut.high,2)
            self.assertEqual(fut.bitmask,0x4)
            self.assertEqual(fut.inverse_bitmask,0xFFFFFFFB)
            self.assertEqual(fut.max_value,0x1)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.special_cycle_enable'):
            # test properties of field: pcie_config_reg.byte_offset_04.special_cycle_enable
            fut = self.dut.byte_offset_04.special_cycle_enable # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,3)
            self.assertEqual(fut.msb,3)
            self.assertEqual(fut.low,3)
            self.assertEqual(fut.high,3)
            self.assertEqual(fut.bitmask,0x8)
            self.assertEqual(fut.inverse_bitmask,0xFFFFFFF7)
            self.assertEqual(fut.max_value,0x1)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.memory_write_invalidate'):
            # test properties of field: pcie_config_reg.byte_offset_04.memory_write_invalidate
            fut = self.dut.byte_offset_04.memory_write_invalidate # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,4)
            self.assertEqual(fut.msb,4)
            self.assertEqual(fut.low,4)
            self.assertEqual(fut.high,4)
            self.assertEqual(fut.bitmask,0x10)
            self.assertEqual(fut.inverse_bitmask,0xFFFFFFEF)
            self.assertEqual(fut.max_value,0x1)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.vga_palette_snoop'):
            # test properties of field: pcie_config_reg.byte_offset_04.vga_palette_snoop
            fut = self.dut.byte_offset_04.vga_palette_snoop # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,5)
            self.assertEqual(fut.msb,5)
            self.assertEqual(fut.low,5)
            self.assertEqual(fut.high,5)
            self.assertEqual(fut.bitmask,0x20)
            self.assertEqual(fut.inverse_bitmask,0xFFFFFFDF)
            self.assertEqual(fut.max_value,0x1)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.parity_error_response'):
            # test properties of field: pcie_config_reg.byte_offset_04.parity_error_response
            fut = self.dut.byte_offset_04.parity_error_response # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,6)
            self.assertEqual(fut.msb,6)
            self.assertEqual(fut.low,6)
            self.assertEqual(fut.high,6)
            self.assertEqual(fut.bitmask,0x40)
            self.assertEqual(fut.inverse_bitmask,0xFFFFFFBF)
            self.assertEqual(fut.max_value,0x1)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.idsel_step_wait_cycle_control'):
            # test properties of field: pcie_config_reg.byte_offset_04.idsel_step_wait_cycle_control
            fut = self.dut.byte_offset_04.idsel_step_wait_cycle_control # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,7)
            self.assertEqual(fut.msb,7)
            self.assertEqual(fut.low,7)
            self.assertEqual(fut.high,7)
            self.assertEqual(fut.bitmask,0x80)
            self.assertEqual(fut.inverse_bitmask,0xFFFFFF7F)
            self.assertEqual(fut.max_value,0x1)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.SERR_Enable'):
            # test properties of field: pcie_config_reg.byte_offset_04.SERR_Enable
            fut = self.dut.byte_offset_04.SERR_Enable # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,8)
            self.assertEqual(fut.msb,8)
            self.assertEqual(fut.low,8)
            self.assertEqual(fut.high,8)
            self.assertEqual(fut.bitmask,0x100)
            self.assertEqual(fut.inverse_bitmask,0xFFFFFEFF)
            self.assertEqual(fut.max_value,0x1)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.fast_b2b_transactions_enable'):
            # test properties of field: pcie_config_reg.byte_offset_04.fast_b2b_transactions_enable
            fut = self.dut.byte_offset_04.fast_b2b_transactions_enable # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,9)
            self.assertEqual(fut.msb,9)
            self.assertEqual(fut.low,9)
            self.assertEqual(fut.high,9)
            self.assertEqual(fut.bitmask,0x200)
            self.assertEqual(fut.inverse_bitmask,0xFFFFFDFF)
            self.assertEqual(fut.max_value,0x1)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.interrupt_disable'):
            # test properties of field: pcie_config_reg.byte_offset_04.interrupt_disable
            fut = self.dut.byte_offset_04.interrupt_disable # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,10)
            self.assertEqual(fut.msb,10)
            self.assertEqual(fut.low,10)
            self.assertEqual(fut.high,10)
            self.assertEqual(fut.bitmask,0x400)
            self.assertEqual(fut.inverse_bitmask,0xFFFFFBFF)
            self.assertEqual(fut.max_value,0x1)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.rsvd'):
            # test properties of field: pcie_config_reg.byte_offset_04.rsvd
            fut = self.dut.byte_offset_04.rsvd # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,11)
            self.assertEqual(fut.msb,18)
            self.assertEqual(fut.low,11)
            self.assertEqual(fut.high,18)
            self.assertEqual(fut.bitmask,0x7F800)
            self.assertEqual(fut.inverse_bitmask,0xFFF807FF)
            self.assertEqual(fut.max_value,0xFF)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.interrupt_status'):
            # test properties of field: pcie_config_reg.byte_offset_04.interrupt_status
            fut = self.dut.byte_offset_04.interrupt_status # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,19)
            self.assertEqual(fut.msb,19)
            self.assertEqual(fut.low,19)
            self.assertEqual(fut.high,19)
            self.assertEqual(fut.bitmask,0x80000)
            self.assertEqual(fut.inverse_bitmask,0xFFF7FFFF)
            self.assertEqual(fut.max_value,0x1)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.capabilities_list'):
            # test properties of field: pcie_config_reg.byte_offset_04.capabilities_list
            fut = self.dut.byte_offset_04.capabilities_list # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,20)
            self.assertEqual(fut.msb,20)
            self.assertEqual(fut.low,20)
            self.assertEqual(fut.high,20)
            self.assertEqual(fut.bitmask,0x100000)
            self.assertEqual(fut.inverse_bitmask,0xFFEFFFFF)
            self.assertEqual(fut.max_value,0x1)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.sixtysix_mhz_capable'):
            # test properties of field: pcie_config_reg.byte_offset_04.sixtysix_mhz_capable
            fut = self.dut.byte_offset_04.sixtysix_mhz_capable # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,21)
            self.assertEqual(fut.msb,21)
            self.assertEqual(fut.low,21)
            self.assertEqual(fut.high,21)
            self.assertEqual(fut.bitmask,0x200000)
            self.assertEqual(fut.inverse_bitmask,0xFFDFFFFF)
            self.assertEqual(fut.max_value,0x1)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.fast_b2b_transactions_capable'):
            # test properties of field: pcie_config_reg.byte_offset_04.fast_b2b_transactions_capable
            fut = self.dut.byte_offset_04.fast_b2b_transactions_capable # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,23)
            self.assertEqual(fut.msb,23)
            self.assertEqual(fut.low,23)
            self.assertEqual(fut.high,23)
            self.assertEqual(fut.bitmask,0x800000)
            self.assertEqual(fut.inverse_bitmask,0xFF7FFFFF)
            self.assertEqual(fut.max_value,0x1)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.master_data_parity_error'):
            # test properties of field: pcie_config_reg.byte_offset_04.master_data_parity_error
            fut = self.dut.byte_offset_04.master_data_parity_error # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,24)
            self.assertEqual(fut.msb,24)
            self.assertEqual(fut.low,24)
            self.assertEqual(fut.high,24)
            self.assertEqual(fut.bitmask,0x1000000)
            self.assertEqual(fut.inverse_bitmask,0xFEFFFFFF)
            self.assertEqual(fut.max_value,0x1)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.devsel_timing'):
            # test properties of field: pcie_config_reg.byte_offset_04.devsel_timing
            fut = self.dut.byte_offset_04.devsel_timing # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,25)
            self.assertEqual(fut.msb,26)
            self.assertEqual(fut.low,25)
            self.assertEqual(fut.high,26)
            self.assertEqual(fut.bitmask,0x6000000)
            self.assertEqual(fut.inverse_bitmask,0xF9FFFFFF)
            self.assertEqual(fut.max_value,0x3)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.signaled_target_abort'):
            # test properties of field: pcie_config_reg.byte_offset_04.signaled_target_abort
            fut = self.dut.byte_offset_04.signaled_target_abort # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,27)
            self.assertEqual(fut.msb,27)
            self.assertEqual(fut.low,27)
            self.assertEqual(fut.high,27)
            self.assertEqual(fut.bitmask,0x8000000)
            self.assertEqual(fut.inverse_bitmask,0xF7FFFFFF)
            self.assertEqual(fut.max_value,0x1)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.received_target_abort'):
            # test properties of field: pcie_config_reg.byte_offset_04.received_target_abort
            fut = self.dut.byte_offset_04.received_target_abort # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,28)
            self.assertEqual(fut.msb,28)
            self.assertEqual(fut.low,28)
            self.assertEqual(fut.high,28)
            self.assertEqual(fut.bitmask,0x10000000)
            self.assertEqual(fut.inverse_bitmask,0xEFFFFFFF)
            self.assertEqual(fut.max_value,0x1)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.received_master_abort'):
            # test properties of field: pcie_config_reg.byte_offset_04.received_master_abort
            fut = self.dut.byte_offset_04.received_master_abort # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,29)
            self.assertEqual(fut.msb,29)
            self.assertEqual(fut.low,29)
            self.assertEqual(fut.high,29)
            self.assertEqual(fut.bitmask,0x20000000)
            self.assertEqual(fut.inverse_bitmask,0xDFFFFFFF)
            self.assertEqual(fut.max_value,0x1)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.signaled_system_error'):
            # test properties of field: pcie_config_reg.byte_offset_04.signaled_system_error
            fut = self.dut.byte_offset_04.signaled_system_error # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,30)
            self.assertEqual(fut.msb,30)
            self.assertEqual(fut.low,30)
            self.assertEqual(fut.high,30)
            self.assertEqual(fut.bitmask,0x40000000)
            self.assertEqual(fut.inverse_bitmask,0xBFFFFFFF)
            self.assertEqual(fut.max_value,0x1)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.detected_parity_error'):
            # test properties of field: pcie_config_reg.byte_offset_04.detected_parity_error
            fut = self.dut.byte_offset_04.detected_parity_error # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,31)
            self.assertEqual(fut.msb,31)
            self.assertEqual(fut.low,31)
            self.assertEqual(fut.high,31)
            self.assertEqual(fut.bitmask,0x80000000)
            self.assertEqual(fut.inverse_bitmask,0x7FFFFFFF)
            self.assertEqual(fut.max_value,0x1)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.byte_offset_08.Revision_ID'):
            # test properties of field: pcie_config_reg.byte_offset_08.Revision_ID
            fut = self.dut.byte_offset_08.Revision_ID # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,0)
            self.assertEqual(fut.msb,7)
            self.assertEqual(fut.low,0)
            self.assertEqual(fut.high,7)
            self.assertEqual(fut.bitmask,0xFF)
            self.assertEqual(fut.inverse_bitmask,0xFFFFFF00)
            self.assertEqual(fut.max_value,0xFF)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.byte_offset_08.Class_Code'):
            # test properties of field: pcie_config_reg.byte_offset_08.Class_Code
            fut = self.dut.byte_offset_08.Class_Code # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,8)
            self.assertEqual(fut.msb,31)
            self.assertEqual(fut.low,8)
            self.assertEqual(fut.high,31)
            self.assertEqual(fut.bitmask,0xFFFFFF00)
            self.assertEqual(fut.inverse_bitmask,0xFF)
            self.assertEqual(fut.max_value,0xFFFFFF)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.byte_offset_0C.cache_line_size_register'):
            # test properties of field: pcie_config_reg.byte_offset_0C.cache_line_size_register
            fut = self.dut.byte_offset_0C.cache_line_size_register # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,0)
            self.assertEqual(fut.msb,7)
            self.assertEqual(fut.low,0)
            self.assertEqual(fut.high,7)
            self.assertEqual(fut.bitmask,0xFF)
            self.assertEqual(fut.inverse_bitmask,0xFFFFFF00)
            self.assertEqual(fut.max_value,0xFF)
                
            self.assertEqual(fut.default,None)
                
            self.assertEqual(fut.is_volatile,True)
        with self.subTest(msg='field: pcie_config_reg.byte_offset_0C.latency_timer_register'):
            # test properties of field: pcie_config_reg.byte_offset_0C.latency_timer_register
            fut = self.dut.byte_offset_0C.latency_timer_register # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,8)
            self.assertEqual(fut.msb,15)
            self.assertEqual(fut.low,8)
            self.assertEqual(fut.high,15)
            self.assertEqual(fut.bitmask,0xFF00)
            self.assertEqual(fut.inverse_bitmask,0xFFFF00FF)
            self.assertEqual(fut.max_value,0xFF)
                
            self.assertEqual(fut.default,None)
                
            self.assertEqual(fut.is_volatile,True)
        with self.subTest(msg='field: pcie_config_reg.byte_offset_0C.interrupt_line_register'):
            # test properties of field: pcie_config_reg.byte_offset_0C.interrupt_line_register
            fut = self.dut.byte_offset_0C.interrupt_line_register # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,16)
            self.assertEqual(fut.msb,23)
            self.assertEqual(fut.low,16)
            self.assertEqual(fut.high,23)
            self.assertEqual(fut.bitmask,0xFF0000)
            self.assertEqual(fut.inverse_bitmask,0xFF00FFFF)
            self.assertEqual(fut.max_value,0xFF)
                
            self.assertEqual(fut.default,None)
                
            self.assertEqual(fut.is_volatile,True)
        with self.subTest(msg='field: pcie_config_reg.byte_offset_0C.interrupt_pin_register'):
            # test properties of field: pcie_config_reg.byte_offset_0C.interrupt_pin_register
            fut = self.dut.byte_offset_0C.interrupt_pin_register # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,24)
            self.assertEqual(fut.msb,31)
            self.assertEqual(fut.low,24)
            self.assertEqual(fut.high,31)
            self.assertEqual(fut.bitmask,0xFF000000)
            self.assertEqual(fut.inverse_bitmask,0xFFFFFF)
            self.assertEqual(fut.max_value,0xFF)
                
            self.assertEqual(fut.default,None)
                
            self.assertEqual(fut.is_volatile,True)
        with self.subTest(msg='field: pcie_config_reg.base_address_register_0.region_type'):
            # test properties of field: pcie_config_reg.base_address_register_0.region_type
            fut = self.dut.base_address_register_0.region_type # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,0)
            self.assertEqual(fut.msb,0)
            self.assertEqual(fut.low,0)
            self.assertEqual(fut.high,0)
            self.assertEqual(fut.bitmask,0x1)
            self.assertEqual(fut.inverse_bitmask,0xFFFFFFFE)
            self.assertEqual(fut.max_value,0x1)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.base_address_register_0.locatable'):
            # test properties of field: pcie_config_reg.base_address_register_0.locatable
            fut = self.dut.base_address_register_0.locatable # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,1)
            self.assertEqual(fut.msb,2)
            self.assertEqual(fut.low,1)
            self.assertEqual(fut.high,2)
            self.assertEqual(fut.bitmask,0x6)
            self.assertEqual(fut.inverse_bitmask,0xFFFFFFF9)
            self.assertEqual(fut.max_value,0x3)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.base_address_register_0.prefetchable'):
            # test properties of field: pcie_config_reg.base_address_register_0.prefetchable
            fut = self.dut.base_address_register_0.prefetchable # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,3)
            self.assertEqual(fut.msb,3)
            self.assertEqual(fut.low,3)
            self.assertEqual(fut.high,3)
            self.assertEqual(fut.bitmask,0x8)
            self.assertEqual(fut.inverse_bitmask,0xFFFFFFF7)
            self.assertEqual(fut.max_value,0x1)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.base_address_register_0.base_adress'):
            # test properties of field: pcie_config_reg.base_address_register_0.base_adress
            fut = self.dut.base_address_register_0.base_adress # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,4)
            self.assertEqual(fut.msb,31)
            self.assertEqual(fut.low,4)
            self.assertEqual(fut.high,31)
            self.assertEqual(fut.bitmask,0xFFFFFFF0)
            self.assertEqual(fut.inverse_bitmask,0xF)
            self.assertEqual(fut.max_value,0xFFFFFFF)
                
            self.assertEqual(fut.default,268369920)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.base_ddress_register_1.region_type'):
            # test properties of field: pcie_config_reg.base_ddress_register_1.region_type
            fut = self.dut.base_ddress_register_1.region_type # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,0)
            self.assertEqual(fut.msb,0)
            self.assertEqual(fut.low,0)
            self.assertEqual(fut.high,0)
            self.assertEqual(fut.bitmask,0x1)
            self.assertEqual(fut.inverse_bitmask,0xFFFFFFFE)
            self.assertEqual(fut.max_value,0x1)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.base_ddress_register_1.locatable'):
            # test properties of field: pcie_config_reg.base_ddress_register_1.locatable
            fut = self.dut.base_ddress_register_1.locatable # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,1)
            self.assertEqual(fut.msb,2)
            self.assertEqual(fut.low,1)
            self.assertEqual(fut.high,2)
            self.assertEqual(fut.bitmask,0x6)
            self.assertEqual(fut.inverse_bitmask,0xFFFFFFF9)
            self.assertEqual(fut.max_value,0x3)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.base_ddress_register_1.prefetchable'):
            # test properties of field: pcie_config_reg.base_ddress_register_1.prefetchable
            fut = self.dut.base_ddress_register_1.prefetchable # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,3)
            self.assertEqual(fut.msb,3)
            self.assertEqual(fut.low,3)
            self.assertEqual(fut.high,3)
            self.assertEqual(fut.bitmask,0x8)
            self.assertEqual(fut.inverse_bitmask,0xFFFFFFF7)
            self.assertEqual(fut.max_value,0x1)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.base_ddress_register_1.base_adress'):
            # test properties of field: pcie_config_reg.base_ddress_register_1.base_adress
            fut = self.dut.base_ddress_register_1.base_adress # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,4)
            self.assertEqual(fut.msb,31)
            self.assertEqual(fut.low,4)
            self.assertEqual(fut.high,31)
            self.assertEqual(fut.bitmask,0xFFFFFFF0)
            self.assertEqual(fut.inverse_bitmask,0xF)
            self.assertEqual(fut.max_value,0xFFFFFFF)
                
            self.assertEqual(fut.default,268369920)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.base_ddress_register_2.BAR'):
            # test properties of field: pcie_config_reg.base_ddress_register_2.BAR
            fut = self.dut.base_ddress_register_2.BAR # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,0)
            self.assertEqual(fut.msb,31)
            self.assertEqual(fut.low,0)
            self.assertEqual(fut.high,31)
            self.assertEqual(fut.bitmask,0xFFFFFFFF)
            self.assertEqual(fut.inverse_bitmask,0x0)
            self.assertEqual(fut.max_value,0xFFFFFFFF)
                
            self.assertEqual(fut.default,33554432)
                
            self.assertEqual(fut.is_volatile,True)
        with self.subTest(msg='field: pcie_config_reg.base_ddress_register_3.BAR'):
            # test properties of field: pcie_config_reg.base_ddress_register_3.BAR
            fut = self.dut.base_ddress_register_3.BAR # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,0)
            self.assertEqual(fut.msb,31)
            self.assertEqual(fut.low,0)
            self.assertEqual(fut.high,31)
            self.assertEqual(fut.bitmask,0xFFFFFFFF)
            self.assertEqual(fut.inverse_bitmask,0x0)
            self.assertEqual(fut.max_value,0xFFFFFFFF)
                
            self.assertEqual(fut.default,34603008)
                
            self.assertEqual(fut.is_volatile,True)
        with self.subTest(msg='field: pcie_config_reg.base_ddress_register_4.BAR'):
            # test properties of field: pcie_config_reg.base_ddress_register_4.BAR
            fut = self.dut.base_ddress_register_4.BAR # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,0)
            self.assertEqual(fut.msb,31)
            self.assertEqual(fut.low,0)
            self.assertEqual(fut.high,31)
            self.assertEqual(fut.bitmask,0xFFFFFFFF)
            self.assertEqual(fut.inverse_bitmask,0x0)
            self.assertEqual(fut.max_value,0xFFFFFFFF)
                
            self.assertEqual(fut.default,50331648)
                
            self.assertEqual(fut.is_volatile,True)
        with self.subTest(msg='field: pcie_config_reg.base_ddress_register_5.BAR'):
            # test properties of field: pcie_config_reg.base_ddress_register_5.BAR
            fut = self.dut.base_ddress_register_5.BAR # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,0)
            self.assertEqual(fut.msb,31)
            self.assertEqual(fut.low,0)
            self.assertEqual(fut.high,31)
            self.assertEqual(fut.bitmask,0xFFFFFFFF)
            self.assertEqual(fut.inverse_bitmask,0x0)
            self.assertEqual(fut.max_value,0xFFFFFFFF)
                
            self.assertEqual(fut.default,83886080)
                
            self.assertEqual(fut.is_volatile,True)
        with self.subTest(msg='field: pcie_config_reg.cardbus_cis_pointer.word'):
            # test properties of field: pcie_config_reg.cardbus_cis_pointer.word
            fut = self.dut.cardbus_cis_pointer.word # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,0)
            self.assertEqual(fut.msb,31)
            self.assertEqual(fut.low,0)
            self.assertEqual(fut.high,31)
            self.assertEqual(fut.bitmask,0xFFFFFFFF)
            self.assertEqual(fut.inverse_bitmask,0x0)
            self.assertEqual(fut.max_value,0xFFFFFFFF)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,True)
        with self.subTest(msg='field: pcie_config_reg.byte_offset_2C.Vendor_ID'):
            # test properties of field: pcie_config_reg.byte_offset_2C.Vendor_ID
            fut = self.dut.byte_offset_2C.Vendor_ID # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,0)
            self.assertEqual(fut.msb,15)
            self.assertEqual(fut.low,0)
            self.assertEqual(fut.high,15)
            self.assertEqual(fut.bitmask,0xFFFF)
            self.assertEqual(fut.inverse_bitmask,0xFFFF0000)
            self.assertEqual(fut.max_value,0xFFFF)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.byte_offset_2C.Device_ID'):
            # test properties of field: pcie_config_reg.byte_offset_2C.Device_ID
            fut = self.dut.byte_offset_2C.Device_ID # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,16)
            self.assertEqual(fut.msb,31)
            self.assertEqual(fut.low,16)
            self.assertEqual(fut.high,31)
            self.assertEqual(fut.bitmask,0xFFFF0000)
            self.assertEqual(fut.inverse_bitmask,0xFFFF)
            self.assertEqual(fut.max_value,0xFFFF)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.capabilities_pointer.capabilities_ptr'):
            # test properties of field: pcie_config_reg.capabilities_pointer.capabilities_ptr
            fut = self.dut.capabilities_pointer.capabilities_ptr # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,0)
            self.assertEqual(fut.msb,7)
            self.assertEqual(fut.low,0)
            self.assertEqual(fut.high,7)
            self.assertEqual(fut.bitmask,0xFF)
            self.assertEqual(fut.inverse_bitmask,0xFFFFFF00)
            self.assertEqual(fut.max_value,0xFF)
                
            self.assertEqual(fut.default,64)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.byte_offset_3C.interrupt_line'):
            # test properties of field: pcie_config_reg.byte_offset_3C.interrupt_line
            fut = self.dut.byte_offset_3C.interrupt_line # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,0)
            self.assertEqual(fut.msb,7)
            self.assertEqual(fut.low,0)
            self.assertEqual(fut.high,7)
            self.assertEqual(fut.bitmask,0xFF)
            self.assertEqual(fut.inverse_bitmask,0xFFFFFF00)
            self.assertEqual(fut.max_value,0xFF)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,True)
        with self.subTest(msg='field: pcie_config_reg.byte_offset_3C.interrupt_pin'):
            # test properties of field: pcie_config_reg.byte_offset_3C.interrupt_pin
            fut = self.dut.byte_offset_3C.interrupt_pin # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,8)
            self.assertEqual(fut.msb,15)
            self.assertEqual(fut.low,8)
            self.assertEqual(fut.high,15)
            self.assertEqual(fut.bitmask,0xFF00)
            self.assertEqual(fut.inverse_bitmask,0xFFFF00FF)
            self.assertEqual(fut.max_value,0xFF)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,True)
        with self.subTest(msg='field: pcie_config_reg.byte_offset_3C.min_gnt'):
            # test properties of field: pcie_config_reg.byte_offset_3C.min_gnt
            fut = self.dut.byte_offset_3C.min_gnt # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,16)
            self.assertEqual(fut.msb,23)
            self.assertEqual(fut.low,16)
            self.assertEqual(fut.high,23)
            self.assertEqual(fut.bitmask,0xFF0000)
            self.assertEqual(fut.inverse_bitmask,0xFF00FFFF)
            self.assertEqual(fut.max_value,0xFF)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.byte_offset_3C.max_lat'):
            # test properties of field: pcie_config_reg.byte_offset_3C.max_lat
            fut = self.dut.byte_offset_3C.max_lat # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,24)
            self.assertEqual(fut.msb,31)
            self.assertEqual(fut.low,24)
            self.assertEqual(fut.high,31)
            self.assertEqual(fut.bitmask,0xFF000000)
            self.assertEqual(fut.inverse_bitmask,0xFFFFFF)
            self.assertEqual(fut.max_value,0xFF)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_mngt_pointer.capabilities_id'):
            # test properties of field: pcie_config_reg.capabilities_power_mngt_pointer.capabilities_id
            fut = self.dut.capabilities_power_mngt_pointer.capabilities_id # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,0)
            self.assertEqual(fut.msb,7)
            self.assertEqual(fut.low,0)
            self.assertEqual(fut.high,7)
            self.assertEqual(fut.bitmask,0xFF)
            self.assertEqual(fut.inverse_bitmask,0xFFFFFF00)
            self.assertEqual(fut.max_value,0xFF)
                
            self.assertEqual(fut.default,1)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_mngt_pointer.next_cap_ptr'):
            # test properties of field: pcie_config_reg.capabilities_power_mngt_pointer.next_cap_ptr
            fut = self.dut.capabilities_power_mngt_pointer.next_cap_ptr # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,8)
            self.assertEqual(fut.msb,15)
            self.assertEqual(fut.low,8)
            self.assertEqual(fut.high,15)
            self.assertEqual(fut.bitmask,0xFF00)
            self.assertEqual(fut.inverse_bitmask,0xFFFF00FF)
            self.assertEqual(fut.max_value,0xFF)
                
            self.assertEqual(fut.default,72)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_mngt_pointer.version'):
            # test properties of field: pcie_config_reg.capabilities_power_mngt_pointer.version
            fut = self.dut.capabilities_power_mngt_pointer.version # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,16)
            self.assertEqual(fut.msb,18)
            self.assertEqual(fut.low,16)
            self.assertEqual(fut.high,18)
            self.assertEqual(fut.bitmask,0x70000)
            self.assertEqual(fut.inverse_bitmask,0xFFF8FFFF)
            self.assertEqual(fut.max_value,0x7)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_mngt_pointer.pme_clock'):
            # test properties of field: pcie_config_reg.capabilities_power_mngt_pointer.pme_clock
            fut = self.dut.capabilities_power_mngt_pointer.pme_clock # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,19)
            self.assertEqual(fut.msb,19)
            self.assertEqual(fut.low,19)
            self.assertEqual(fut.high,19)
            self.assertEqual(fut.bitmask,0x80000)
            self.assertEqual(fut.inverse_bitmask,0xFFF7FFFF)
            self.assertEqual(fut.max_value,0x1)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_mngt_pointer.dev_spec_init'):
            # test properties of field: pcie_config_reg.capabilities_power_mngt_pointer.dev_spec_init
            fut = self.dut.capabilities_power_mngt_pointer.dev_spec_init # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,21)
            self.assertEqual(fut.msb,21)
            self.assertEqual(fut.low,21)
            self.assertEqual(fut.high,21)
            self.assertEqual(fut.bitmask,0x200000)
            self.assertEqual(fut.inverse_bitmask,0xFFDFFFFF)
            self.assertEqual(fut.max_value,0x1)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_mngt_pointer.aux_current'):
            # test properties of field: pcie_config_reg.capabilities_power_mngt_pointer.aux_current
            fut = self.dut.capabilities_power_mngt_pointer.aux_current # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,22)
            self.assertEqual(fut.msb,24)
            self.assertEqual(fut.low,22)
            self.assertEqual(fut.high,24)
            self.assertEqual(fut.bitmask,0x1C00000)
            self.assertEqual(fut.inverse_bitmask,0xFE3FFFFF)
            self.assertEqual(fut.max_value,0x7)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_mngt_pointer.d1_support'):
            # test properties of field: pcie_config_reg.capabilities_power_mngt_pointer.d1_support
            fut = self.dut.capabilities_power_mngt_pointer.d1_support # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,25)
            self.assertEqual(fut.msb,25)
            self.assertEqual(fut.low,25)
            self.assertEqual(fut.high,25)
            self.assertEqual(fut.bitmask,0x2000000)
            self.assertEqual(fut.inverse_bitmask,0xFDFFFFFF)
            self.assertEqual(fut.max_value,0x1)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_mngt_pointer.d2_support'):
            # test properties of field: pcie_config_reg.capabilities_power_mngt_pointer.d2_support
            fut = self.dut.capabilities_power_mngt_pointer.d2_support # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,26)
            self.assertEqual(fut.msb,26)
            self.assertEqual(fut.low,26)
            self.assertEqual(fut.high,26)
            self.assertEqual(fut.bitmask,0x4000000)
            self.assertEqual(fut.inverse_bitmask,0xFBFFFFFF)
            self.assertEqual(fut.max_value,0x1)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_mngt_pointer.pme_support'):
            # test properties of field: pcie_config_reg.capabilities_power_mngt_pointer.pme_support
            fut = self.dut.capabilities_power_mngt_pointer.pme_support # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,27)
            self.assertEqual(fut.msb,31)
            self.assertEqual(fut.low,27)
            self.assertEqual(fut.high,31)
            self.assertEqual(fut.bitmask,0xF8000000)
            self.assertEqual(fut.inverse_bitmask,0x7FFFFFF)
            self.assertEqual(fut.max_value,0x1F)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.power_management_pointer.power_state'):
            # test properties of field: pcie_config_reg.power_management_pointer.power_state
            fut = self.dut.power_management_pointer.power_state # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,0)
            self.assertEqual(fut.msb,1)
            self.assertEqual(fut.low,0)
            self.assertEqual(fut.high,1)
            self.assertEqual(fut.bitmask,0x3)
            self.assertEqual(fut.inverse_bitmask,0xFFFFFFFC)
            self.assertEqual(fut.max_value,0x3)
                
            self.assertEqual(fut.default,None)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.power_management_pointer.pme_enable'):
            # test properties of field: pcie_config_reg.power_management_pointer.pme_enable
            fut = self.dut.power_management_pointer.pme_enable # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,3)
            self.assertEqual(fut.msb,3)
            self.assertEqual(fut.low,3)
            self.assertEqual(fut.high,3)
            self.assertEqual(fut.bitmask,0x8)
            self.assertEqual(fut.inverse_bitmask,0xFFFFFFF7)
            self.assertEqual(fut.max_value,0x1)
                
            self.assertEqual(fut.default,None)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.power_management_pointer.data_select'):
            # test properties of field: pcie_config_reg.power_management_pointer.data_select
            fut = self.dut.power_management_pointer.data_select # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,9)
            self.assertEqual(fut.msb,12)
            self.assertEqual(fut.low,9)
            self.assertEqual(fut.high,12)
            self.assertEqual(fut.bitmask,0x1E00)
            self.assertEqual(fut.inverse_bitmask,0xFFFFE1FF)
            self.assertEqual(fut.max_value,0xF)
                
            self.assertEqual(fut.default,None)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.power_management_pointer.data_scale'):
            # test properties of field: pcie_config_reg.power_management_pointer.data_scale
            fut = self.dut.power_management_pointer.data_scale # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,13)
            self.assertEqual(fut.msb,14)
            self.assertEqual(fut.low,13)
            self.assertEqual(fut.high,14)
            self.assertEqual(fut.bitmask,0x6000)
            self.assertEqual(fut.inverse_bitmask,0xFFFF9FFF)
            self.assertEqual(fut.max_value,0x3)
                
            self.assertEqual(fut.default,None)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.power_management_pointer.pme_status'):
            # test properties of field: pcie_config_reg.power_management_pointer.pme_status
            fut = self.dut.power_management_pointer.pme_status # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,15)
            self.assertEqual(fut.msb,15)
            self.assertEqual(fut.low,15)
            self.assertEqual(fut.high,15)
            self.assertEqual(fut.bitmask,0x8000)
            self.assertEqual(fut.inverse_bitmask,0xFFFF7FFF)
            self.assertEqual(fut.max_value,0x1)
                
            self.assertEqual(fut.default,None)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.power_management_pointer.b2_b3_support'):
            # test properties of field: pcie_config_reg.power_management_pointer.b2_b3_support
            fut = self.dut.power_management_pointer.b2_b3_support # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,22)
            self.assertEqual(fut.msb,22)
            self.assertEqual(fut.low,22)
            self.assertEqual(fut.high,22)
            self.assertEqual(fut.bitmask,0x400000)
            self.assertEqual(fut.inverse_bitmask,0xFFBFFFFF)
            self.assertEqual(fut.max_value,0x1)
                
            self.assertEqual(fut.default,None)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.power_management_pointer.bus_pwr_clk_ctrl_en'):
            # test properties of field: pcie_config_reg.power_management_pointer.bus_pwr_clk_ctrl_en
            fut = self.dut.power_management_pointer.bus_pwr_clk_ctrl_en # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,23)
            self.assertEqual(fut.msb,23)
            self.assertEqual(fut.low,23)
            self.assertEqual(fut.high,23)
            self.assertEqual(fut.bitmask,0x800000)
            self.assertEqual(fut.inverse_bitmask,0xFF7FFFFF)
            self.assertEqual(fut.max_value,0x1)
                
            self.assertEqual(fut.default,None)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.power_management_pointer.data'):
            # test properties of field: pcie_config_reg.power_management_pointer.data
            fut = self.dut.power_management_pointer.data # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,24)
            self.assertEqual(fut.msb,31)
            self.assertEqual(fut.low,24)
            self.assertEqual(fut.high,31)
            self.assertEqual(fut.bitmask,0xFF000000)
            self.assertEqual(fut.inverse_bitmask,0xFFFFFF)
            self.assertEqual(fut.max_value,0xFF)
                
            self.assertEqual(fut.default,None)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_na_pointer.capabilities_id'):
            # test properties of field: pcie_config_reg.capabilities_power_na_pointer.capabilities_id
            fut = self.dut.capabilities_power_na_pointer.capabilities_id # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,0)
            self.assertEqual(fut.msb,7)
            self.assertEqual(fut.low,0)
            self.assertEqual(fut.high,7)
            self.assertEqual(fut.bitmask,0xFF)
            self.assertEqual(fut.inverse_bitmask,0xFFFFFF00)
            self.assertEqual(fut.max_value,0xFF)
                
            self.assertEqual(fut.default,16)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_na_pointer.next_cap_ptr'):
            # test properties of field: pcie_config_reg.capabilities_power_na_pointer.next_cap_ptr
            fut = self.dut.capabilities_power_na_pointer.next_cap_ptr # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,8)
            self.assertEqual(fut.msb,15)
            self.assertEqual(fut.low,8)
            self.assertEqual(fut.high,15)
            self.assertEqual(fut.bitmask,0xFF00)
            self.assertEqual(fut.inverse_bitmask,0xFFFF00FF)
            self.assertEqual(fut.max_value,0xFF)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_na_pointer.capability_version'):
            # test properties of field: pcie_config_reg.capabilities_power_na_pointer.capability_version
            fut = self.dut.capabilities_power_na_pointer.capability_version # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,16)
            self.assertEqual(fut.msb,19)
            self.assertEqual(fut.low,16)
            self.assertEqual(fut.high,19)
            self.assertEqual(fut.bitmask,0xF0000)
            self.assertEqual(fut.inverse_bitmask,0xFFF0FFFF)
            self.assertEqual(fut.max_value,0xF)
                
            self.assertEqual(fut.default,2)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_na_pointer.device_port_type'):
            # test properties of field: pcie_config_reg.capabilities_power_na_pointer.device_port_type
            fut = self.dut.capabilities_power_na_pointer.device_port_type # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,20)
            self.assertEqual(fut.msb,23)
            self.assertEqual(fut.low,20)
            self.assertEqual(fut.high,23)
            self.assertEqual(fut.bitmask,0xF00000)
            self.assertEqual(fut.inverse_bitmask,0xFF0FFFFF)
            self.assertEqual(fut.max_value,0xF)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_na_pointer.slot_implemented'):
            # test properties of field: pcie_config_reg.capabilities_power_na_pointer.slot_implemented
            fut = self.dut.capabilities_power_na_pointer.slot_implemented # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,24)
            self.assertEqual(fut.msb,24)
            self.assertEqual(fut.low,24)
            self.assertEqual(fut.high,24)
            self.assertEqual(fut.bitmask,0x1000000)
            self.assertEqual(fut.inverse_bitmask,0xFEFFFFFF)
            self.assertEqual(fut.max_value,0x1)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_na_pointer.interrupt_msg_number'):
            # test properties of field: pcie_config_reg.capabilities_power_na_pointer.interrupt_msg_number
            fut = self.dut.capabilities_power_na_pointer.interrupt_msg_number # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,25)
            self.assertEqual(fut.msb,29)
            self.assertEqual(fut.low,25)
            self.assertEqual(fut.high,29)
            self.assertEqual(fut.bitmask,0x3E000000)
            self.assertEqual(fut.inverse_bitmask,0xC1FFFFFF)
            self.assertEqual(fut.max_value,0x1F)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_na_pointer.Undefined'):
            # test properties of field: pcie_config_reg.capabilities_power_na_pointer.Undefined
            fut = self.dut.capabilities_power_na_pointer.Undefined # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,30)
            self.assertEqual(fut.msb,30)
            self.assertEqual(fut.low,30)
            self.assertEqual(fut.high,30)
            self.assertEqual(fut.bitmask,0x40000000)
            self.assertEqual(fut.inverse_bitmask,0xBFFFFFFF)
            self.assertEqual(fut.max_value,0x1)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_na_pointer.RsvdP'):
            # test properties of field: pcie_config_reg.capabilities_power_na_pointer.RsvdP
            fut = self.dut.capabilities_power_na_pointer.RsvdP # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,31)
            self.assertEqual(fut.msb,31)
            self.assertEqual(fut.low,31)
            self.assertEqual(fut.high,31)
            self.assertEqual(fut.bitmask,0x80000000)
            self.assertEqual(fut.inverse_bitmask,0x7FFFFFFF)
            self.assertEqual(fut.max_value,0x1)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.link_control_3_register.perform_equalization'):
            # test properties of field: pcie_config_reg.link_control_3_register.perform_equalization
            fut = self.dut.link_control_3_register.perform_equalization # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,0)
            self.assertEqual(fut.msb,0)
            self.assertEqual(fut.low,0)
            self.assertEqual(fut.high,0)
            self.assertEqual(fut.bitmask,0x1)
            self.assertEqual(fut.inverse_bitmask,0xFFFFFFFE)
            self.assertEqual(fut.max_value,0x1)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.link_control_3_register.link_eq_req_intr_en'):
            # test properties of field: pcie_config_reg.link_control_3_register.link_eq_req_intr_en
            fut = self.dut.link_control_3_register.link_eq_req_intr_en # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,1)
            self.assertEqual(fut.msb,1)
            self.assertEqual(fut.low,1)
            self.assertEqual(fut.high,1)
            self.assertEqual(fut.bitmask,0x2)
            self.assertEqual(fut.inverse_bitmask,0xFFFFFFFD)
            self.assertEqual(fut.max_value,0x1)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        with self.subTest(msg='field: pcie_config_reg.lane_error_status_register.lane_error'):
            # test properties of field: pcie_config_reg.lane_error_status_register.lane_error
            fut = self.dut.lane_error_status_register.lane_error # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,0)
            self.assertEqual(fut.msb,4)
            self.assertEqual(fut.low,0)
            self.assertEqual(fut.high,4)
            self.assertEqual(fut.bitmask,0x1F)
            self.assertEqual(fut.inverse_bitmask,0xFFFFFFE0)
            self.assertEqual(fut.max_value,0x1F)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,True)
        with self.subTest(msg='field: pcie_config_reg.lane_eq_ctrl_register.downstream_tx_preset'):
            # test properties of field: pcie_config_reg.lane_eq_ctrl_register.downstream_tx_preset
            fut = self.dut.lane_eq_ctrl_register.downstream_tx_preset # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,0)
            self.assertEqual(fut.msb,3)
            self.assertEqual(fut.low,0)
            self.assertEqual(fut.high,3)
            self.assertEqual(fut.bitmask,0xF)
            self.assertEqual(fut.inverse_bitmask,0xFFFFFFF0)
            self.assertEqual(fut.max_value,0xF)
                
            self.assertEqual(fut.default,15)
                
            self.assertEqual(fut.is_volatile,True)
        with self.subTest(msg='field: pcie_config_reg.lane_eq_ctrl_register.downstream_rx_preset_hint'):
            # test properties of field: pcie_config_reg.lane_eq_ctrl_register.downstream_rx_preset_hint
            fut = self.dut.lane_eq_ctrl_register.downstream_rx_preset_hint # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,4)
            self.assertEqual(fut.msb,6)
            self.assertEqual(fut.low,4)
            self.assertEqual(fut.high,6)
            self.assertEqual(fut.bitmask,0x70)
            self.assertEqual(fut.inverse_bitmask,0xFFFFFF8F)
            self.assertEqual(fut.max_value,0x7)
                
            self.assertEqual(fut.default,7)
                
            self.assertEqual(fut.is_volatile,True)
        with self.subTest(msg='field: pcie_config_reg.lane_eq_ctrl_register.upstream_tx_preset'):
            # test properties of field: pcie_config_reg.lane_eq_ctrl_register.upstream_tx_preset
            fut = self.dut.lane_eq_ctrl_register.upstream_tx_preset # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,8)
            self.assertEqual(fut.msb,11)
            self.assertEqual(fut.low,8)
            self.assertEqual(fut.high,11)
            self.assertEqual(fut.bitmask,0xF00)
            self.assertEqual(fut.inverse_bitmask,0xFFFFF0FF)
            self.assertEqual(fut.max_value,0xF)
                
            self.assertEqual(fut.default,15)
                
            self.assertEqual(fut.is_volatile,True)
        with self.subTest(msg='field: pcie_config_reg.lane_eq_ctrl_register.upstream_rx_preset_hint'):
            # test properties of field: pcie_config_reg.lane_eq_ctrl_register.upstream_rx_preset_hint
            fut = self.dut.lane_eq_ctrl_register.upstream_rx_preset_hint # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,12)
            self.assertEqual(fut.msb,14)
            self.assertEqual(fut.low,12)
            self.assertEqual(fut.high,14)
            self.assertEqual(fut.bitmask,0x7000)
            self.assertEqual(fut.inverse_bitmask,0xFFFF8FFF)
            self.assertEqual(fut.max_value,0x7)
                
            self.assertEqual(fut.default,7)
                
            self.assertEqual(fut.is_volatile,True)
        with self.subTest(msg='field: pcie_config_reg.extended_capabilities.ext_cap'):
            # test properties of field: pcie_config_reg.extended_capabilities.ext_cap
            fut = self.dut.extended_capabilities.ext_cap # type: ignore[union-attr]
            if not isinstance(fut, Field):
                raise TypeError('This test relies on node being of type Field')
            self.assertEqual(fut.lsb,0)
            self.assertEqual(fut.msb,31)
            self.assertEqual(fut.low,0)
            self.assertEqual(fut.high,31)
            self.assertEqual(fut.bitmask,0xFFFFFFFF)
            self.assertEqual(fut.inverse_bitmask,0x0)
            self.assertEqual(fut.max_value,0xFFFFFFFF)
                
            self.assertEqual(fut.default,0)
                
            self.assertEqual(fut.is_volatile,False)
        

    def test_field_encoding_properties(self)  -> None:
        """
        Check that enumeration has the name and desc meta data from the systemRDL
        """
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        

    def test_user_defined_properties(self)  -> None:
        """
        Walk the address map and check user defined properties are correctly pulled up
        """
        with self.subTest(msg='register: pcie_config_reg.byte_offset_00'):
            
            self.assertDictEqual(self.dut.byte_offset_00.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.byte_offset_04'):
            
            self.assertDictEqual(self.dut.byte_offset_04.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.byte_offset_08'):
            
            self.assertDictEqual(self.dut.byte_offset_08.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.byte_offset_0C'):
            
            self.assertDictEqual(self.dut.byte_offset_0C.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.base_address_register_0'):
            
            self.assertDictEqual(self.dut.base_address_register_0.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_1'):
            
            self.assertDictEqual(self.dut.base_ddress_register_1.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_2'):
            
            self.assertDictEqual(self.dut.base_ddress_register_2.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_3'):
            
            self.assertDictEqual(self.dut.base_ddress_register_3.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_4'):
            
            self.assertDictEqual(self.dut.base_ddress_register_4.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_5'):
            
            self.assertDictEqual(self.dut.base_ddress_register_5.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.cardbus_cis_pointer'):
            
            self.assertDictEqual(self.dut.cardbus_cis_pointer.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.byte_offset_2C'):
            
            self.assertDictEqual(self.dut.byte_offset_2C.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.capabilities_pointer'):
            
            self.assertDictEqual(self.dut.capabilities_pointer.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.byte_offset_3C'):
            
            self.assertDictEqual(self.dut.byte_offset_3C.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.capabilities_power_mngt_pointer'):
            
            self.assertDictEqual(self.dut.capabilities_power_mngt_pointer.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.power_management_pointer'):
            
            self.assertDictEqual(self.dut.power_management_pointer.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.capabilities_power_na_pointer'):
            
            self.assertDictEqual(self.dut.capabilities_power_na_pointer.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.link_control_3_register'):
            
            self.assertDictEqual(self.dut.link_control_3_register.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.lane_error_status_register'):
            
            self.assertDictEqual(self.dut.lane_error_status_register.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.lane_eq_ctrl_register'):
            
            self.assertDictEqual(self.dut.lane_eq_ctrl_register.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.extended_capabilities'):
            
            self.assertDictEqual(self.dut.extended_capabilities.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.byte_offset_00.Vendor_ID'):
            
            self.assertDictEqual(self.dut.byte_offset_00.Vendor_ID.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.byte_offset_00.Device_ID'):
            
            self.assertDictEqual(self.dut.byte_offset_00.Device_ID.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.byte_offset_04.bus_master_enable'):
            
            self.assertDictEqual(self.dut.byte_offset_04.bus_master_enable.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.byte_offset_04.special_cycle_enable'):
            
            self.assertDictEqual(self.dut.byte_offset_04.special_cycle_enable.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.byte_offset_04.memory_write_invalidate'):
            
            self.assertDictEqual(self.dut.byte_offset_04.memory_write_invalidate.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.byte_offset_04.vga_palette_snoop'):
            
            self.assertDictEqual(self.dut.byte_offset_04.vga_palette_snoop.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.byte_offset_04.parity_error_response'):
            
            self.assertDictEqual(self.dut.byte_offset_04.parity_error_response.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.byte_offset_04.idsel_step_wait_cycle_control'):
            
            self.assertDictEqual(self.dut.byte_offset_04.idsel_step_wait_cycle_control.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.byte_offset_04.SERR_Enable'):
            
            self.assertDictEqual(self.dut.byte_offset_04.SERR_Enable.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.byte_offset_04.fast_b2b_transactions_enable'):
            
            self.assertDictEqual(self.dut.byte_offset_04.fast_b2b_transactions_enable.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.byte_offset_04.interrupt_disable'):
            
            self.assertDictEqual(self.dut.byte_offset_04.interrupt_disable.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.byte_offset_04.rsvd'):
            
            self.assertDictEqual(self.dut.byte_offset_04.rsvd.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.byte_offset_04.interrupt_status'):
            
            self.assertDictEqual(self.dut.byte_offset_04.interrupt_status.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.byte_offset_04.capabilities_list'):
            
            self.assertDictEqual(self.dut.byte_offset_04.capabilities_list.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.byte_offset_04.sixtysix_mhz_capable'):
            
            self.assertDictEqual(self.dut.byte_offset_04.sixtysix_mhz_capable.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.byte_offset_04.fast_b2b_transactions_capable'):
            
            self.assertDictEqual(self.dut.byte_offset_04.fast_b2b_transactions_capable.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.byte_offset_04.master_data_parity_error'):
            
            self.assertDictEqual(self.dut.byte_offset_04.master_data_parity_error.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.byte_offset_04.devsel_timing'):
            
            self.assertDictEqual(self.dut.byte_offset_04.devsel_timing.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.byte_offset_04.signaled_target_abort'):
            
            self.assertDictEqual(self.dut.byte_offset_04.signaled_target_abort.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.byte_offset_04.received_target_abort'):
            
            self.assertDictEqual(self.dut.byte_offset_04.received_target_abort.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.byte_offset_04.received_master_abort'):
            
            self.assertDictEqual(self.dut.byte_offset_04.received_master_abort.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.byte_offset_04.signaled_system_error'):
            
            self.assertDictEqual(self.dut.byte_offset_04.signaled_system_error.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.byte_offset_04.detected_parity_error'):
            
            self.assertDictEqual(self.dut.byte_offset_04.detected_parity_error.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.byte_offset_08.Revision_ID'):
            
            self.assertDictEqual(self.dut.byte_offset_08.Revision_ID.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.byte_offset_08.Class_Code'):
            
            self.assertDictEqual(self.dut.byte_offset_08.Class_Code.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.byte_offset_0C.cache_line_size_register'):
            
            self.assertDictEqual(self.dut.byte_offset_0C.cache_line_size_register.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.byte_offset_0C.latency_timer_register'):
            
            self.assertDictEqual(self.dut.byte_offset_0C.latency_timer_register.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.byte_offset_0C.interrupt_line_register'):
            
            self.assertDictEqual(self.dut.byte_offset_0C.interrupt_line_register.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.byte_offset_0C.interrupt_pin_register'):
            
            self.assertDictEqual(self.dut.byte_offset_0C.interrupt_pin_register.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.base_address_register_0.region_type'):
            
            self.assertDictEqual(self.dut.base_address_register_0.region_type.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.base_address_register_0.locatable'):
            
            self.assertDictEqual(self.dut.base_address_register_0.locatable.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.base_address_register_0.prefetchable'):
            
            self.assertDictEqual(self.dut.base_address_register_0.prefetchable.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.base_address_register_0.base_adress'):
            
            self.assertDictEqual(self.dut.base_address_register_0.base_adress.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_1.region_type'):
            
            self.assertDictEqual(self.dut.base_ddress_register_1.region_type.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_1.locatable'):
            
            self.assertDictEqual(self.dut.base_ddress_register_1.locatable.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_1.prefetchable'):
            
            self.assertDictEqual(self.dut.base_ddress_register_1.prefetchable.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_1.base_adress'):
            
            self.assertDictEqual(self.dut.base_ddress_register_1.base_adress.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_2.BAR'):
            
            self.assertDictEqual(self.dut.base_ddress_register_2.BAR.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_3.BAR'):
            
            self.assertDictEqual(self.dut.base_ddress_register_3.BAR.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_4.BAR'):
            
            self.assertDictEqual(self.dut.base_ddress_register_4.BAR.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_5.BAR'):
            
            self.assertDictEqual(self.dut.base_ddress_register_5.BAR.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.cardbus_cis_pointer.word'):
            
            self.assertDictEqual(self.dut.cardbus_cis_pointer.word.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.byte_offset_2C.Vendor_ID'):
            
            self.assertDictEqual(self.dut.byte_offset_2C.Vendor_ID.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.byte_offset_2C.Device_ID'):
            
            self.assertDictEqual(self.dut.byte_offset_2C.Device_ID.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.capabilities_pointer.capabilities_ptr'):
            
            self.assertDictEqual(self.dut.capabilities_pointer.capabilities_ptr.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.byte_offset_3C.interrupt_line'):
            
            self.assertDictEqual(self.dut.byte_offset_3C.interrupt_line.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.byte_offset_3C.interrupt_pin'):
            
            self.assertDictEqual(self.dut.byte_offset_3C.interrupt_pin.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.byte_offset_3C.min_gnt'):
            
            self.assertDictEqual(self.dut.byte_offset_3C.min_gnt.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.byte_offset_3C.max_lat'):
            
            self.assertDictEqual(self.dut.byte_offset_3C.max_lat.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.capabilities_power_mngt_pointer.capabilities_id'):
            
            self.assertDictEqual(self.dut.capabilities_power_mngt_pointer.capabilities_id.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.capabilities_power_mngt_pointer.next_cap_ptr'):
            
            self.assertDictEqual(self.dut.capabilities_power_mngt_pointer.next_cap_ptr.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.capabilities_power_mngt_pointer.version'):
            
            self.assertDictEqual(self.dut.capabilities_power_mngt_pointer.version.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.capabilities_power_mngt_pointer.pme_clock'):
            
            self.assertDictEqual(self.dut.capabilities_power_mngt_pointer.pme_clock.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.capabilities_power_mngt_pointer.dev_spec_init'):
            
            self.assertDictEqual(self.dut.capabilities_power_mngt_pointer.dev_spec_init.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.capabilities_power_mngt_pointer.aux_current'):
            
            self.assertDictEqual(self.dut.capabilities_power_mngt_pointer.aux_current.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.capabilities_power_mngt_pointer.d1_support'):
            
            self.assertDictEqual(self.dut.capabilities_power_mngt_pointer.d1_support.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.capabilities_power_mngt_pointer.d2_support'):
            
            self.assertDictEqual(self.dut.capabilities_power_mngt_pointer.d2_support.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.capabilities_power_mngt_pointer.pme_support'):
            
            self.assertDictEqual(self.dut.capabilities_power_mngt_pointer.pme_support.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.power_management_pointer.power_state'):
            
            self.assertDictEqual(self.dut.power_management_pointer.power_state.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.power_management_pointer.pme_enable'):
            
            self.assertDictEqual(self.dut.power_management_pointer.pme_enable.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.power_management_pointer.data_select'):
            
            self.assertDictEqual(self.dut.power_management_pointer.data_select.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.power_management_pointer.data_scale'):
            
            self.assertDictEqual(self.dut.power_management_pointer.data_scale.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.power_management_pointer.pme_status'):
            
            self.assertDictEqual(self.dut.power_management_pointer.pme_status.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.power_management_pointer.b2_b3_support'):
            
            self.assertDictEqual(self.dut.power_management_pointer.b2_b3_support.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.power_management_pointer.bus_pwr_clk_ctrl_en'):
            
            self.assertDictEqual(self.dut.power_management_pointer.bus_pwr_clk_ctrl_en.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.power_management_pointer.data'):
            
            self.assertDictEqual(self.dut.power_management_pointer.data.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.capabilities_power_na_pointer.capabilities_id'):
            
            self.assertDictEqual(self.dut.capabilities_power_na_pointer.capabilities_id.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.capabilities_power_na_pointer.next_cap_ptr'):
            
            self.assertDictEqual(self.dut.capabilities_power_na_pointer.next_cap_ptr.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.capabilities_power_na_pointer.capability_version'):
            
            self.assertDictEqual(self.dut.capabilities_power_na_pointer.capability_version.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.capabilities_power_na_pointer.device_port_type'):
            
            self.assertDictEqual(self.dut.capabilities_power_na_pointer.device_port_type.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.capabilities_power_na_pointer.slot_implemented'):
            
            self.assertDictEqual(self.dut.capabilities_power_na_pointer.slot_implemented.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.capabilities_power_na_pointer.interrupt_msg_number'):
            
            self.assertDictEqual(self.dut.capabilities_power_na_pointer.interrupt_msg_number.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.capabilities_power_na_pointer.Undefined'):
            
            self.assertDictEqual(self.dut.capabilities_power_na_pointer.Undefined.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.capabilities_power_na_pointer.RsvdP'):
            
            self.assertDictEqual(self.dut.capabilities_power_na_pointer.RsvdP.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.link_control_3_register.perform_equalization'):
            
            self.assertDictEqual(self.dut.link_control_3_register.perform_equalization.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.link_control_3_register.link_eq_req_intr_en'):
            
            self.assertDictEqual(self.dut.link_control_3_register.link_eq_req_intr_en.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.lane_error_status_register.lane_error'):
            
            self.assertDictEqual(self.dut.lane_error_status_register.lane_error.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.lane_eq_ctrl_register.downstream_tx_preset'):
            
            self.assertDictEqual(self.dut.lane_eq_ctrl_register.downstream_tx_preset.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.lane_eq_ctrl_register.downstream_rx_preset_hint'):
            
            self.assertDictEqual(self.dut.lane_eq_ctrl_register.downstream_rx_preset_hint.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.lane_eq_ctrl_register.upstream_tx_preset'):
            
            self.assertDictEqual(self.dut.lane_eq_ctrl_register.upstream_tx_preset.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.lane_eq_ctrl_register.upstream_rx_preset_hint'):
            
            self.assertDictEqual(self.dut.lane_eq_ctrl_register.upstream_rx_preset_hint.udp,{})
            
        with self.subTest(msg='register: pcie_config_reg.extended_capabilities.ext_cap'):
            
            self.assertDictEqual(self.dut.extended_capabilities.ext_cap.udp,{})
            
        

    async def test_register_read_and_write(self) -> None:
        """
        Walk the register map and check every register can be read and written to correctly
        """
        rut: Reg
        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_00
        with self.subTest(msg='register: pcie_config_reg.byte_offset_00'):
            rut=self.dut.byte_offset_00 # type: ignore[union-attr,assignment]
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                patch(base_name + '.read_addr_space', return_value=1) as read_callback_mock:

                
                if not isinstance(rut, (RegAsyncReadOnly, RegAsyncReadWrite)):
                    raise TypeError('Register is not a Readable Async Type')
                
                # test reading back 1 (the unpatched version returns 0 so this confirms the patch works)
                self.assertEqual(await rut.read(), 1)
                read_callback_mock.assert_called_once_with(
                                    addr=0,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read check with high value
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFFFFFFFF
                self.assertEqual(await rut.read(), 0xFFFFFFFF)
                read_callback_mock.assert_called_once_with(
                                    addr=0,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read of the low value
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0
                self.assertEqual(await rut.read(), 0x0)
                read_callback_mock.assert_called_once_with(
                                    addr=0,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read of a random value
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = random_value
                self.assertEqual(await rut.read(), random_value)
                read_callback_mock.assert_called_once_with(
                                    addr=0,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                

                
                # test that a non-writable register has no write method and attempting one generates and error
                with self.assertRaises(AttributeError):
                    await rut.write(0) # type: ignore[attr-defined]

                # check the read has not been called in the write test
                read_callback_mock.assert_not_called()
        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_04
        with self.subTest(msg='register: pcie_config_reg.byte_offset_04'):
            rut=self.dut.byte_offset_04 # type: ignore[union-attr,assignment]
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                patch(base_name + '.read_addr_space', return_value=1) as read_callback_mock:

                
                if not isinstance(rut, (RegAsyncReadOnly, RegAsyncReadWrite)):
                    raise TypeError('Register is not a Readable Async Type')
                
                # test reading back 1 (the unpatched version returns 0 so this confirms the patch works)
                self.assertEqual(await rut.read(), 1)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read check with high value
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFFFFFFFF
                self.assertEqual(await rut.read(), 0xFFFFFFFF)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read of the low value
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0
                self.assertEqual(await rut.read(), 0x0)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read of a random value
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = random_value
                self.assertEqual(await rut.read(), random_value)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                

                
                if not isinstance(rut, (RegAsyncWriteOnly, RegAsyncReadWrite)):
                    raise TypeError('Register is not a Writeable Async Type')
                
                # test the write with high value
                await rut.write(0xFFFFFFFF)
                write_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=rut.accesswidth,
                                    data=0xFFFFFFFF)
                write_callback_mock.reset_mock()

                # test the write of a low value
                await rut.write(0)
                write_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=rut.accesswidth,
                                    data=0)
                write_callback_mock.reset_mock()

                # test the write of a random
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                await rut.write(random_value)  # type: ignore[union-attr]
                write_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=rut.accesswidth,
                                    data=random_value)
                write_callback_mock.reset_mock()

                # test writing a value beyond the register range is blocked with an exception being raised
                with self.assertRaises(ValueError):
                    await rut.write(-1)

                with self.assertRaises(ValueError):
                    await rut.write(0xFFFFFFFF+1)

                # check the read has not been called in the write test
                read_callback_mock.assert_not_called()
        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_08
        with self.subTest(msg='register: pcie_config_reg.byte_offset_08'):
            rut=self.dut.byte_offset_08 # type: ignore[union-attr,assignment]
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                patch(base_name + '.read_addr_space', return_value=1) as read_callback_mock:

                
                if not isinstance(rut, (RegAsyncReadOnly, RegAsyncReadWrite)):
                    raise TypeError('Register is not a Readable Async Type')
                
                # test reading back 1 (the unpatched version returns 0 so this confirms the patch works)
                self.assertEqual(await rut.read(), 1)
                read_callback_mock.assert_called_once_with(
                                    addr=8,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read check with high value
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFFFFFFFF
                self.assertEqual(await rut.read(), 0xFFFFFFFF)
                read_callback_mock.assert_called_once_with(
                                    addr=8,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read of the low value
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0
                self.assertEqual(await rut.read(), 0x0)
                read_callback_mock.assert_called_once_with(
                                    addr=8,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read of a random value
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = random_value
                self.assertEqual(await rut.read(), random_value)
                read_callback_mock.assert_called_once_with(
                                    addr=8,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                

                
                # test that a non-writable register has no write method and attempting one generates and error
                with self.assertRaises(AttributeError):
                    await rut.write(0) # type: ignore[attr-defined]

                # check the read has not been called in the write test
                read_callback_mock.assert_not_called()
        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_0C
        with self.subTest(msg='register: pcie_config_reg.byte_offset_0C'):
            rut=self.dut.byte_offset_0C # type: ignore[union-attr,assignment]
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                patch(base_name + '.read_addr_space', return_value=1) as read_callback_mock:

                
                if not isinstance(rut, (RegAsyncReadOnly, RegAsyncReadWrite)):
                    raise TypeError('Register is not a Readable Async Type')
                
                # test reading back 1 (the unpatched version returns 0 so this confirms the patch works)
                self.assertEqual(await rut.read(), 1)
                read_callback_mock.assert_called_once_with(
                                    addr=12,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read check with high value
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFFFFFFFF
                self.assertEqual(await rut.read(), 0xFFFFFFFF)
                read_callback_mock.assert_called_once_with(
                                    addr=12,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read of the low value
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0
                self.assertEqual(await rut.read(), 0x0)
                read_callback_mock.assert_called_once_with(
                                    addr=12,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read of a random value
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = random_value
                self.assertEqual(await rut.read(), random_value)
                read_callback_mock.assert_called_once_with(
                                    addr=12,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                

                
                if not isinstance(rut, (RegAsyncWriteOnly, RegAsyncReadWrite)):
                    raise TypeError('Register is not a Writeable Async Type')
                
                # test the write with high value
                await rut.write(0xFFFFFFFF)
                write_callback_mock.assert_called_once_with(
                                    addr=12,
                                    width=32,
                                    accesswidth=rut.accesswidth,
                                    data=0xFFFFFFFF)
                write_callback_mock.reset_mock()

                # test the write of a low value
                await rut.write(0)
                write_callback_mock.assert_called_once_with(
                                    addr=12,
                                    width=32,
                                    accesswidth=rut.accesswidth,
                                    data=0)
                write_callback_mock.reset_mock()

                # test the write of a random
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                await rut.write(random_value)  # type: ignore[union-attr]
                write_callback_mock.assert_called_once_with(
                                    addr=12,
                                    width=32,
                                    accesswidth=rut.accesswidth,
                                    data=random_value)
                write_callback_mock.reset_mock()

                # test writing a value beyond the register range is blocked with an exception being raised
                with self.assertRaises(ValueError):
                    await rut.write(-1)

                with self.assertRaises(ValueError):
                    await rut.write(0xFFFFFFFF+1)

                # check the read has not been called in the write test
                read_callback_mock.assert_not_called()
        # test access operations (read and/or write) to register:
        # pcie_config_reg.base_address_register_0
        with self.subTest(msg='register: pcie_config_reg.base_address_register_0'):
            rut=self.dut.base_address_register_0 # type: ignore[union-attr,assignment]
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                patch(base_name + '.read_addr_space', return_value=1) as read_callback_mock:

                
                if not isinstance(rut, (RegAsyncReadOnly, RegAsyncReadWrite)):
                    raise TypeError('Register is not a Readable Async Type')
                
                # test reading back 1 (the unpatched version returns 0 so this confirms the patch works)
                self.assertEqual(await rut.read(), 1)
                read_callback_mock.assert_called_once_with(
                                    addr=16,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read check with high value
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFFFFFFFF
                self.assertEqual(await rut.read(), 0xFFFFFFFF)
                read_callback_mock.assert_called_once_with(
                                    addr=16,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read of the low value
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0
                self.assertEqual(await rut.read(), 0x0)
                read_callback_mock.assert_called_once_with(
                                    addr=16,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read of a random value
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = random_value
                self.assertEqual(await rut.read(), random_value)
                read_callback_mock.assert_called_once_with(
                                    addr=16,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                

                
                # test that a non-writable register has no write method and attempting one generates and error
                with self.assertRaises(AttributeError):
                    await rut.write(0) # type: ignore[attr-defined]

                # check the read has not been called in the write test
                read_callback_mock.assert_not_called()
        # test access operations (read and/or write) to register:
        # pcie_config_reg.base_ddress_register_1
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_1'):
            rut=self.dut.base_ddress_register_1 # type: ignore[union-attr,assignment]
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                patch(base_name + '.read_addr_space', return_value=1) as read_callback_mock:

                
                if not isinstance(rut, (RegAsyncReadOnly, RegAsyncReadWrite)):
                    raise TypeError('Register is not a Readable Async Type')
                
                # test reading back 1 (the unpatched version returns 0 so this confirms the patch works)
                self.assertEqual(await rut.read(), 1)
                read_callback_mock.assert_called_once_with(
                                    addr=20,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read check with high value
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFFFFFFFF
                self.assertEqual(await rut.read(), 0xFFFFFFFF)
                read_callback_mock.assert_called_once_with(
                                    addr=20,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read of the low value
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0
                self.assertEqual(await rut.read(), 0x0)
                read_callback_mock.assert_called_once_with(
                                    addr=20,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read of a random value
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = random_value
                self.assertEqual(await rut.read(), random_value)
                read_callback_mock.assert_called_once_with(
                                    addr=20,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                

                
                # test that a non-writable register has no write method and attempting one generates and error
                with self.assertRaises(AttributeError):
                    await rut.write(0) # type: ignore[attr-defined]

                # check the read has not been called in the write test
                read_callback_mock.assert_not_called()
        # test access operations (read and/or write) to register:
        # pcie_config_reg.base_ddress_register_2
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_2'):
            rut=self.dut.base_ddress_register_2 # type: ignore[union-attr,assignment]
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                patch(base_name + '.read_addr_space', return_value=1) as read_callback_mock:

                
                if not isinstance(rut, (RegAsyncReadOnly, RegAsyncReadWrite)):
                    raise TypeError('Register is not a Readable Async Type')
                
                # test reading back 1 (the unpatched version returns 0 so this confirms the patch works)
                self.assertEqual(await rut.read(), 1)
                read_callback_mock.assert_called_once_with(
                                    addr=24,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read check with high value
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFFFFFFFF
                self.assertEqual(await rut.read(), 0xFFFFFFFF)
                read_callback_mock.assert_called_once_with(
                                    addr=24,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read of the low value
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0
                self.assertEqual(await rut.read(), 0x0)
                read_callback_mock.assert_called_once_with(
                                    addr=24,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read of a random value
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = random_value
                self.assertEqual(await rut.read(), random_value)
                read_callback_mock.assert_called_once_with(
                                    addr=24,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                

                
                if not isinstance(rut, (RegAsyncWriteOnly, RegAsyncReadWrite)):
                    raise TypeError('Register is not a Writeable Async Type')
                
                # test the write with high value
                await rut.write(0xFFFFFFFF)
                write_callback_mock.assert_called_once_with(
                                    addr=24,
                                    width=32,
                                    accesswidth=rut.accesswidth,
                                    data=0xFFFFFFFF)
                write_callback_mock.reset_mock()

                # test the write of a low value
                await rut.write(0)
                write_callback_mock.assert_called_once_with(
                                    addr=24,
                                    width=32,
                                    accesswidth=rut.accesswidth,
                                    data=0)
                write_callback_mock.reset_mock()

                # test the write of a random
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                await rut.write(random_value)  # type: ignore[union-attr]
                write_callback_mock.assert_called_once_with(
                                    addr=24,
                                    width=32,
                                    accesswidth=rut.accesswidth,
                                    data=random_value)
                write_callback_mock.reset_mock()

                # test writing a value beyond the register range is blocked with an exception being raised
                with self.assertRaises(ValueError):
                    await rut.write(-1)

                with self.assertRaises(ValueError):
                    await rut.write(0xFFFFFFFF+1)

                # check the read has not been called in the write test
                read_callback_mock.assert_not_called()
        # test access operations (read and/or write) to register:
        # pcie_config_reg.base_ddress_register_3
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_3'):
            rut=self.dut.base_ddress_register_3 # type: ignore[union-attr,assignment]
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                patch(base_name + '.read_addr_space', return_value=1) as read_callback_mock:

                
                if not isinstance(rut, (RegAsyncReadOnly, RegAsyncReadWrite)):
                    raise TypeError('Register is not a Readable Async Type')
                
                # test reading back 1 (the unpatched version returns 0 so this confirms the patch works)
                self.assertEqual(await rut.read(), 1)
                read_callback_mock.assert_called_once_with(
                                    addr=28,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read check with high value
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFFFFFFFF
                self.assertEqual(await rut.read(), 0xFFFFFFFF)
                read_callback_mock.assert_called_once_with(
                                    addr=28,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read of the low value
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0
                self.assertEqual(await rut.read(), 0x0)
                read_callback_mock.assert_called_once_with(
                                    addr=28,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read of a random value
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = random_value
                self.assertEqual(await rut.read(), random_value)
                read_callback_mock.assert_called_once_with(
                                    addr=28,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                

                
                if not isinstance(rut, (RegAsyncWriteOnly, RegAsyncReadWrite)):
                    raise TypeError('Register is not a Writeable Async Type')
                
                # test the write with high value
                await rut.write(0xFFFFFFFF)
                write_callback_mock.assert_called_once_with(
                                    addr=28,
                                    width=32,
                                    accesswidth=rut.accesswidth,
                                    data=0xFFFFFFFF)
                write_callback_mock.reset_mock()

                # test the write of a low value
                await rut.write(0)
                write_callback_mock.assert_called_once_with(
                                    addr=28,
                                    width=32,
                                    accesswidth=rut.accesswidth,
                                    data=0)
                write_callback_mock.reset_mock()

                # test the write of a random
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                await rut.write(random_value)  # type: ignore[union-attr]
                write_callback_mock.assert_called_once_with(
                                    addr=28,
                                    width=32,
                                    accesswidth=rut.accesswidth,
                                    data=random_value)
                write_callback_mock.reset_mock()

                # test writing a value beyond the register range is blocked with an exception being raised
                with self.assertRaises(ValueError):
                    await rut.write(-1)

                with self.assertRaises(ValueError):
                    await rut.write(0xFFFFFFFF+1)

                # check the read has not been called in the write test
                read_callback_mock.assert_not_called()
        # test access operations (read and/or write) to register:
        # pcie_config_reg.base_ddress_register_4
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_4'):
            rut=self.dut.base_ddress_register_4 # type: ignore[union-attr,assignment]
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                patch(base_name + '.read_addr_space', return_value=1) as read_callback_mock:

                
                if not isinstance(rut, (RegAsyncReadOnly, RegAsyncReadWrite)):
                    raise TypeError('Register is not a Readable Async Type')
                
                # test reading back 1 (the unpatched version returns 0 so this confirms the patch works)
                self.assertEqual(await rut.read(), 1)
                read_callback_mock.assert_called_once_with(
                                    addr=32,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read check with high value
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFFFFFFFF
                self.assertEqual(await rut.read(), 0xFFFFFFFF)
                read_callback_mock.assert_called_once_with(
                                    addr=32,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read of the low value
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0
                self.assertEqual(await rut.read(), 0x0)
                read_callback_mock.assert_called_once_with(
                                    addr=32,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read of a random value
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = random_value
                self.assertEqual(await rut.read(), random_value)
                read_callback_mock.assert_called_once_with(
                                    addr=32,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                

                
                if not isinstance(rut, (RegAsyncWriteOnly, RegAsyncReadWrite)):
                    raise TypeError('Register is not a Writeable Async Type')
                
                # test the write with high value
                await rut.write(0xFFFFFFFF)
                write_callback_mock.assert_called_once_with(
                                    addr=32,
                                    width=32,
                                    accesswidth=rut.accesswidth,
                                    data=0xFFFFFFFF)
                write_callback_mock.reset_mock()

                # test the write of a low value
                await rut.write(0)
                write_callback_mock.assert_called_once_with(
                                    addr=32,
                                    width=32,
                                    accesswidth=rut.accesswidth,
                                    data=0)
                write_callback_mock.reset_mock()

                # test the write of a random
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                await rut.write(random_value)  # type: ignore[union-attr]
                write_callback_mock.assert_called_once_with(
                                    addr=32,
                                    width=32,
                                    accesswidth=rut.accesswidth,
                                    data=random_value)
                write_callback_mock.reset_mock()

                # test writing a value beyond the register range is blocked with an exception being raised
                with self.assertRaises(ValueError):
                    await rut.write(-1)

                with self.assertRaises(ValueError):
                    await rut.write(0xFFFFFFFF+1)

                # check the read has not been called in the write test
                read_callback_mock.assert_not_called()
        # test access operations (read and/or write) to register:
        # pcie_config_reg.base_ddress_register_5
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_5'):
            rut=self.dut.base_ddress_register_5 # type: ignore[union-attr,assignment]
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                patch(base_name + '.read_addr_space', return_value=1) as read_callback_mock:

                
                if not isinstance(rut, (RegAsyncReadOnly, RegAsyncReadWrite)):
                    raise TypeError('Register is not a Readable Async Type')
                
                # test reading back 1 (the unpatched version returns 0 so this confirms the patch works)
                self.assertEqual(await rut.read(), 1)
                read_callback_mock.assert_called_once_with(
                                    addr=36,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read check with high value
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFFFFFFFF
                self.assertEqual(await rut.read(), 0xFFFFFFFF)
                read_callback_mock.assert_called_once_with(
                                    addr=36,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read of the low value
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0
                self.assertEqual(await rut.read(), 0x0)
                read_callback_mock.assert_called_once_with(
                                    addr=36,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read of a random value
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = random_value
                self.assertEqual(await rut.read(), random_value)
                read_callback_mock.assert_called_once_with(
                                    addr=36,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                

                
                if not isinstance(rut, (RegAsyncWriteOnly, RegAsyncReadWrite)):
                    raise TypeError('Register is not a Writeable Async Type')
                
                # test the write with high value
                await rut.write(0xFFFFFFFF)
                write_callback_mock.assert_called_once_with(
                                    addr=36,
                                    width=32,
                                    accesswidth=rut.accesswidth,
                                    data=0xFFFFFFFF)
                write_callback_mock.reset_mock()

                # test the write of a low value
                await rut.write(0)
                write_callback_mock.assert_called_once_with(
                                    addr=36,
                                    width=32,
                                    accesswidth=rut.accesswidth,
                                    data=0)
                write_callback_mock.reset_mock()

                # test the write of a random
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                await rut.write(random_value)  # type: ignore[union-attr]
                write_callback_mock.assert_called_once_with(
                                    addr=36,
                                    width=32,
                                    accesswidth=rut.accesswidth,
                                    data=random_value)
                write_callback_mock.reset_mock()

                # test writing a value beyond the register range is blocked with an exception being raised
                with self.assertRaises(ValueError):
                    await rut.write(-1)

                with self.assertRaises(ValueError):
                    await rut.write(0xFFFFFFFF+1)

                # check the read has not been called in the write test
                read_callback_mock.assert_not_called()
        # test access operations (read and/or write) to register:
        # pcie_config_reg.cardbus_cis_pointer
        with self.subTest(msg='register: pcie_config_reg.cardbus_cis_pointer'):
            rut=self.dut.cardbus_cis_pointer # type: ignore[union-attr,assignment]
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                patch(base_name + '.read_addr_space', return_value=1) as read_callback_mock:

                
                if not isinstance(rut, (RegAsyncReadOnly, RegAsyncReadWrite)):
                    raise TypeError('Register is not a Readable Async Type')
                
                # test reading back 1 (the unpatched version returns 0 so this confirms the patch works)
                self.assertEqual(await rut.read(), 1)
                read_callback_mock.assert_called_once_with(
                                    addr=40,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read check with high value
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFFFFFFFF
                self.assertEqual(await rut.read(), 0xFFFFFFFF)
                read_callback_mock.assert_called_once_with(
                                    addr=40,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read of the low value
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0
                self.assertEqual(await rut.read(), 0x0)
                read_callback_mock.assert_called_once_with(
                                    addr=40,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read of a random value
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = random_value
                self.assertEqual(await rut.read(), random_value)
                read_callback_mock.assert_called_once_with(
                                    addr=40,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                

                
                if not isinstance(rut, (RegAsyncWriteOnly, RegAsyncReadWrite)):
                    raise TypeError('Register is not a Writeable Async Type')
                
                # test the write with high value
                await rut.write(0xFFFFFFFF)
                write_callback_mock.assert_called_once_with(
                                    addr=40,
                                    width=32,
                                    accesswidth=rut.accesswidth,
                                    data=0xFFFFFFFF)
                write_callback_mock.reset_mock()

                # test the write of a low value
                await rut.write(0)
                write_callback_mock.assert_called_once_with(
                                    addr=40,
                                    width=32,
                                    accesswidth=rut.accesswidth,
                                    data=0)
                write_callback_mock.reset_mock()

                # test the write of a random
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                await rut.write(random_value)  # type: ignore[union-attr]
                write_callback_mock.assert_called_once_with(
                                    addr=40,
                                    width=32,
                                    accesswidth=rut.accesswidth,
                                    data=random_value)
                write_callback_mock.reset_mock()

                # test writing a value beyond the register range is blocked with an exception being raised
                with self.assertRaises(ValueError):
                    await rut.write(-1)

                with self.assertRaises(ValueError):
                    await rut.write(0xFFFFFFFF+1)

                # check the read has not been called in the write test
                read_callback_mock.assert_not_called()
        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_2C
        with self.subTest(msg='register: pcie_config_reg.byte_offset_2C'):
            rut=self.dut.byte_offset_2C # type: ignore[union-attr,assignment]
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                patch(base_name + '.read_addr_space', return_value=1) as read_callback_mock:

                
                if not isinstance(rut, (RegAsyncReadOnly, RegAsyncReadWrite)):
                    raise TypeError('Register is not a Readable Async Type')
                
                # test reading back 1 (the unpatched version returns 0 so this confirms the patch works)
                self.assertEqual(await rut.read(), 1)
                read_callback_mock.assert_called_once_with(
                                    addr=44,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read check with high value
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFFFFFFFF
                self.assertEqual(await rut.read(), 0xFFFFFFFF)
                read_callback_mock.assert_called_once_with(
                                    addr=44,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read of the low value
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0
                self.assertEqual(await rut.read(), 0x0)
                read_callback_mock.assert_called_once_with(
                                    addr=44,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read of a random value
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = random_value
                self.assertEqual(await rut.read(), random_value)
                read_callback_mock.assert_called_once_with(
                                    addr=44,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                

                
                # test that a non-writable register has no write method and attempting one generates and error
                with self.assertRaises(AttributeError):
                    await rut.write(0) # type: ignore[attr-defined]

                # check the read has not been called in the write test
                read_callback_mock.assert_not_called()
        # test access operations (read and/or write) to register:
        # pcie_config_reg.capabilities_pointer
        with self.subTest(msg='register: pcie_config_reg.capabilities_pointer'):
            rut=self.dut.capabilities_pointer # type: ignore[union-attr,assignment]
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                patch(base_name + '.read_addr_space', return_value=1) as read_callback_mock:

                
                if not isinstance(rut, (RegAsyncReadOnly, RegAsyncReadWrite)):
                    raise TypeError('Register is not a Readable Async Type')
                
                # test reading back 1 (the unpatched version returns 0 so this confirms the patch works)
                self.assertEqual(await rut.read(), 1)
                read_callback_mock.assert_called_once_with(
                                    addr=52,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read check with high value
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFFFFFFFF
                self.assertEqual(await rut.read(), 0xFFFFFFFF)
                read_callback_mock.assert_called_once_with(
                                    addr=52,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read of the low value
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0
                self.assertEqual(await rut.read(), 0x0)
                read_callback_mock.assert_called_once_with(
                                    addr=52,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read of a random value
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = random_value
                self.assertEqual(await rut.read(), random_value)
                read_callback_mock.assert_called_once_with(
                                    addr=52,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                

                
                # test that a non-writable register has no write method and attempting one generates and error
                with self.assertRaises(AttributeError):
                    await rut.write(0) # type: ignore[attr-defined]

                # check the read has not been called in the write test
                read_callback_mock.assert_not_called()
        # test access operations (read and/or write) to register:
        # pcie_config_reg.byte_offset_3C
        with self.subTest(msg='register: pcie_config_reg.byte_offset_3C'):
            rut=self.dut.byte_offset_3C # type: ignore[union-attr,assignment]
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                patch(base_name + '.read_addr_space', return_value=1) as read_callback_mock:

                
                if not isinstance(rut, (RegAsyncReadOnly, RegAsyncReadWrite)):
                    raise TypeError('Register is not a Readable Async Type')
                
                # test reading back 1 (the unpatched version returns 0 so this confirms the patch works)
                self.assertEqual(await rut.read(), 1)
                read_callback_mock.assert_called_once_with(
                                    addr=60,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read check with high value
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFFFFFFFF
                self.assertEqual(await rut.read(), 0xFFFFFFFF)
                read_callback_mock.assert_called_once_with(
                                    addr=60,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read of the low value
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0
                self.assertEqual(await rut.read(), 0x0)
                read_callback_mock.assert_called_once_with(
                                    addr=60,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read of a random value
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = random_value
                self.assertEqual(await rut.read(), random_value)
                read_callback_mock.assert_called_once_with(
                                    addr=60,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                

                
                if not isinstance(rut, (RegAsyncWriteOnly, RegAsyncReadWrite)):
                    raise TypeError('Register is not a Writeable Async Type')
                
                # test the write with high value
                await rut.write(0xFFFFFFFF)
                write_callback_mock.assert_called_once_with(
                                    addr=60,
                                    width=32,
                                    accesswidth=rut.accesswidth,
                                    data=0xFFFFFFFF)
                write_callback_mock.reset_mock()

                # test the write of a low value
                await rut.write(0)
                write_callback_mock.assert_called_once_with(
                                    addr=60,
                                    width=32,
                                    accesswidth=rut.accesswidth,
                                    data=0)
                write_callback_mock.reset_mock()

                # test the write of a random
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                await rut.write(random_value)  # type: ignore[union-attr]
                write_callback_mock.assert_called_once_with(
                                    addr=60,
                                    width=32,
                                    accesswidth=rut.accesswidth,
                                    data=random_value)
                write_callback_mock.reset_mock()

                # test writing a value beyond the register range is blocked with an exception being raised
                with self.assertRaises(ValueError):
                    await rut.write(-1)

                with self.assertRaises(ValueError):
                    await rut.write(0xFFFFFFFF+1)

                # check the read has not been called in the write test
                read_callback_mock.assert_not_called()
        # test access operations (read and/or write) to register:
        # pcie_config_reg.capabilities_power_mngt_pointer
        with self.subTest(msg='register: pcie_config_reg.capabilities_power_mngt_pointer'):
            rut=self.dut.capabilities_power_mngt_pointer # type: ignore[union-attr,assignment]
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                patch(base_name + '.read_addr_space', return_value=1) as read_callback_mock:

                
                if not isinstance(rut, (RegAsyncReadOnly, RegAsyncReadWrite)):
                    raise TypeError('Register is not a Readable Async Type')
                
                # test reading back 1 (the unpatched version returns 0 so this confirms the patch works)
                self.assertEqual(await rut.read(), 1)
                read_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read check with high value
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFFFFFFFF
                self.assertEqual(await rut.read(), 0xFFFFFFFF)
                read_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read of the low value
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0
                self.assertEqual(await rut.read(), 0x0)
                read_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read of a random value
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = random_value
                self.assertEqual(await rut.read(), random_value)
                read_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                

                
                if not isinstance(rut, (RegAsyncWriteOnly, RegAsyncReadWrite)):
                    raise TypeError('Register is not a Writeable Async Type')
                
                # test the write with high value
                await rut.write(0xFFFFFFFF)
                write_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=rut.accesswidth,
                                    data=0xFFFFFFFF)
                write_callback_mock.reset_mock()

                # test the write of a low value
                await rut.write(0)
                write_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=rut.accesswidth,
                                    data=0)
                write_callback_mock.reset_mock()

                # test the write of a random
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                await rut.write(random_value)  # type: ignore[union-attr]
                write_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=rut.accesswidth,
                                    data=random_value)
                write_callback_mock.reset_mock()

                # test writing a value beyond the register range is blocked with an exception being raised
                with self.assertRaises(ValueError):
                    await rut.write(-1)

                with self.assertRaises(ValueError):
                    await rut.write(0xFFFFFFFF+1)

                # check the read has not been called in the write test
                read_callback_mock.assert_not_called()
        # test access operations (read and/or write) to register:
        # pcie_config_reg.power_management_pointer
        with self.subTest(msg='register: pcie_config_reg.power_management_pointer'):
            rut=self.dut.power_management_pointer # type: ignore[union-attr,assignment]
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                patch(base_name + '.read_addr_space', return_value=1) as read_callback_mock:

                
                if not isinstance(rut, (RegAsyncReadOnly, RegAsyncReadWrite)):
                    raise TypeError('Register is not a Readable Async Type')
                
                # test reading back 1 (the unpatched version returns 0 so this confirms the patch works)
                self.assertEqual(await rut.read(), 1)
                read_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read check with high value
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFFFFFFFF
                self.assertEqual(await rut.read(), 0xFFFFFFFF)
                read_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read of the low value
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0
                self.assertEqual(await rut.read(), 0x0)
                read_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read of a random value
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = random_value
                self.assertEqual(await rut.read(), random_value)
                read_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                

                
                if not isinstance(rut, (RegAsyncWriteOnly, RegAsyncReadWrite)):
                    raise TypeError('Register is not a Writeable Async Type')
                
                # test the write with high value
                await rut.write(0xFFFFFFFF)
                write_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=rut.accesswidth,
                                    data=0xFFFFFFFF)
                write_callback_mock.reset_mock()

                # test the write of a low value
                await rut.write(0)
                write_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=rut.accesswidth,
                                    data=0)
                write_callback_mock.reset_mock()

                # test the write of a random
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                await rut.write(random_value)  # type: ignore[union-attr]
                write_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=rut.accesswidth,
                                    data=random_value)
                write_callback_mock.reset_mock()

                # test writing a value beyond the register range is blocked with an exception being raised
                with self.assertRaises(ValueError):
                    await rut.write(-1)

                with self.assertRaises(ValueError):
                    await rut.write(0xFFFFFFFF+1)

                # check the read has not been called in the write test
                read_callback_mock.assert_not_called()
        # test access operations (read and/or write) to register:
        # pcie_config_reg.capabilities_power_na_pointer
        with self.subTest(msg='register: pcie_config_reg.capabilities_power_na_pointer'):
            rut=self.dut.capabilities_power_na_pointer # type: ignore[union-attr,assignment]
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                patch(base_name + '.read_addr_space', return_value=1) as read_callback_mock:

                
                if not isinstance(rut, (RegAsyncReadOnly, RegAsyncReadWrite)):
                    raise TypeError('Register is not a Readable Async Type')
                
                # test reading back 1 (the unpatched version returns 0 so this confirms the patch works)
                self.assertEqual(await rut.read(), 1)
                read_callback_mock.assert_called_once_with(
                                    addr=72,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read check with high value
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFFFFFFFF
                self.assertEqual(await rut.read(), 0xFFFFFFFF)
                read_callback_mock.assert_called_once_with(
                                    addr=72,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read of the low value
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0
                self.assertEqual(await rut.read(), 0x0)
                read_callback_mock.assert_called_once_with(
                                    addr=72,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read of a random value
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = random_value
                self.assertEqual(await rut.read(), random_value)
                read_callback_mock.assert_called_once_with(
                                    addr=72,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                

                
                # test that a non-writable register has no write method and attempting one generates and error
                with self.assertRaises(AttributeError):
                    await rut.write(0) # type: ignore[attr-defined]

                # check the read has not been called in the write test
                read_callback_mock.assert_not_called()
        # test access operations (read and/or write) to register:
        # pcie_config_reg.link_control_3_register
        with self.subTest(msg='register: pcie_config_reg.link_control_3_register'):
            rut=self.dut.link_control_3_register # type: ignore[union-attr,assignment]
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                patch(base_name + '.read_addr_space', return_value=1) as read_callback_mock:

                
                if not isinstance(rut, (RegAsyncReadOnly, RegAsyncReadWrite)):
                    raise TypeError('Register is not a Readable Async Type')
                
                # test reading back 1 (the unpatched version returns 0 so this confirms the patch works)
                self.assertEqual(await rut.read(), 1)
                read_callback_mock.assert_called_once_with(
                                    addr=76,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read check with high value
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFFFFFFFF
                self.assertEqual(await rut.read(), 0xFFFFFFFF)
                read_callback_mock.assert_called_once_with(
                                    addr=76,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read of the low value
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0
                self.assertEqual(await rut.read(), 0x0)
                read_callback_mock.assert_called_once_with(
                                    addr=76,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read of a random value
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = random_value
                self.assertEqual(await rut.read(), random_value)
                read_callback_mock.assert_called_once_with(
                                    addr=76,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                

                
                if not isinstance(rut, (RegAsyncWriteOnly, RegAsyncReadWrite)):
                    raise TypeError('Register is not a Writeable Async Type')
                
                # test the write with high value
                await rut.write(0xFFFFFFFF)
                write_callback_mock.assert_called_once_with(
                                    addr=76,
                                    width=32,
                                    accesswidth=rut.accesswidth,
                                    data=0xFFFFFFFF)
                write_callback_mock.reset_mock()

                # test the write of a low value
                await rut.write(0)
                write_callback_mock.assert_called_once_with(
                                    addr=76,
                                    width=32,
                                    accesswidth=rut.accesswidth,
                                    data=0)
                write_callback_mock.reset_mock()

                # test the write of a random
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                await rut.write(random_value)  # type: ignore[union-attr]
                write_callback_mock.assert_called_once_with(
                                    addr=76,
                                    width=32,
                                    accesswidth=rut.accesswidth,
                                    data=random_value)
                write_callback_mock.reset_mock()

                # test writing a value beyond the register range is blocked with an exception being raised
                with self.assertRaises(ValueError):
                    await rut.write(-1)

                with self.assertRaises(ValueError):
                    await rut.write(0xFFFFFFFF+1)

                # check the read has not been called in the write test
                read_callback_mock.assert_not_called()
        # test access operations (read and/or write) to register:
        # pcie_config_reg.lane_error_status_register
        with self.subTest(msg='register: pcie_config_reg.lane_error_status_register'):
            rut=self.dut.lane_error_status_register # type: ignore[union-attr,assignment]
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                patch(base_name + '.read_addr_space', return_value=1) as read_callback_mock:

                
                if not isinstance(rut, (RegAsyncReadOnly, RegAsyncReadWrite)):
                    raise TypeError('Register is not a Readable Async Type')
                
                # test reading back 1 (the unpatched version returns 0 so this confirms the patch works)
                self.assertEqual(await rut.read(), 1)
                read_callback_mock.assert_called_once_with(
                                    addr=80,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read check with high value
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFFFFFFFF
                self.assertEqual(await rut.read(), 0xFFFFFFFF)
                read_callback_mock.assert_called_once_with(
                                    addr=80,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read of the low value
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0
                self.assertEqual(await rut.read(), 0x0)
                read_callback_mock.assert_called_once_with(
                                    addr=80,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read of a random value
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = random_value
                self.assertEqual(await rut.read(), random_value)
                read_callback_mock.assert_called_once_with(
                                    addr=80,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                

                
                if not isinstance(rut, (RegAsyncWriteOnly, RegAsyncReadWrite)):
                    raise TypeError('Register is not a Writeable Async Type')
                
                # test the write with high value
                await rut.write(0xFFFFFFFF)
                write_callback_mock.assert_called_once_with(
                                    addr=80,
                                    width=32,
                                    accesswidth=rut.accesswidth,
                                    data=0xFFFFFFFF)
                write_callback_mock.reset_mock()

                # test the write of a low value
                await rut.write(0)
                write_callback_mock.assert_called_once_with(
                                    addr=80,
                                    width=32,
                                    accesswidth=rut.accesswidth,
                                    data=0)
                write_callback_mock.reset_mock()

                # test the write of a random
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                await rut.write(random_value)  # type: ignore[union-attr]
                write_callback_mock.assert_called_once_with(
                                    addr=80,
                                    width=32,
                                    accesswidth=rut.accesswidth,
                                    data=random_value)
                write_callback_mock.reset_mock()

                # test writing a value beyond the register range is blocked with an exception being raised
                with self.assertRaises(ValueError):
                    await rut.write(-1)

                with self.assertRaises(ValueError):
                    await rut.write(0xFFFFFFFF+1)

                # check the read has not been called in the write test
                read_callback_mock.assert_not_called()
        # test access operations (read and/or write) to register:
        # pcie_config_reg.lane_eq_ctrl_register
        with self.subTest(msg='register: pcie_config_reg.lane_eq_ctrl_register'):
            rut=self.dut.lane_eq_ctrl_register # type: ignore[union-attr,assignment]
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                patch(base_name + '.read_addr_space', return_value=1) as read_callback_mock:

                
                if not isinstance(rut, (RegAsyncReadOnly, RegAsyncReadWrite)):
                    raise TypeError('Register is not a Readable Async Type')
                
                # test reading back 1 (the unpatched version returns 0 so this confirms the patch works)
                self.assertEqual(await rut.read(), 1)
                read_callback_mock.assert_called_once_with(
                                    addr=84,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read check with high value
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFFFFFFFF
                self.assertEqual(await rut.read(), 0xFFFFFFFF)
                read_callback_mock.assert_called_once_with(
                                    addr=84,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read of the low value
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0
                self.assertEqual(await rut.read(), 0x0)
                read_callback_mock.assert_called_once_with(
                                    addr=84,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read of a random value
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = random_value
                self.assertEqual(await rut.read(), random_value)
                read_callback_mock.assert_called_once_with(
                                    addr=84,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                

                
                if not isinstance(rut, (RegAsyncWriteOnly, RegAsyncReadWrite)):
                    raise TypeError('Register is not a Writeable Async Type')
                
                # test the write with high value
                await rut.write(0xFFFFFFFF)
                write_callback_mock.assert_called_once_with(
                                    addr=84,
                                    width=32,
                                    accesswidth=rut.accesswidth,
                                    data=0xFFFFFFFF)
                write_callback_mock.reset_mock()

                # test the write of a low value
                await rut.write(0)
                write_callback_mock.assert_called_once_with(
                                    addr=84,
                                    width=32,
                                    accesswidth=rut.accesswidth,
                                    data=0)
                write_callback_mock.reset_mock()

                # test the write of a random
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                await rut.write(random_value)  # type: ignore[union-attr]
                write_callback_mock.assert_called_once_with(
                                    addr=84,
                                    width=32,
                                    accesswidth=rut.accesswidth,
                                    data=random_value)
                write_callback_mock.reset_mock()

                # test writing a value beyond the register range is blocked with an exception being raised
                with self.assertRaises(ValueError):
                    await rut.write(-1)

                with self.assertRaises(ValueError):
                    await rut.write(0xFFFFFFFF+1)

                # check the read has not been called in the write test
                read_callback_mock.assert_not_called()
        # test access operations (read and/or write) to register:
        # pcie_config_reg.extended_capabilities
        with self.subTest(msg='register: pcie_config_reg.extended_capabilities'):
            rut=self.dut.extended_capabilities # type: ignore[union-attr,assignment]
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                patch(base_name + '.read_addr_space', return_value=1) as read_callback_mock:

                
                if not isinstance(rut, (RegAsyncReadOnly, RegAsyncReadWrite)):
                    raise TypeError('Register is not a Readable Async Type')
                
                # test reading back 1 (the unpatched version returns 0 so this confirms the patch works)
                self.assertEqual(await rut.read(), 1)
                read_callback_mock.assert_called_once_with(
                                    addr=256,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read check with high value
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFFFFFFFF
                self.assertEqual(await rut.read(), 0xFFFFFFFF)
                read_callback_mock.assert_called_once_with(
                                    addr=256,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read of the low value
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0
                self.assertEqual(await rut.read(), 0x0)
                read_callback_mock.assert_called_once_with(
                                    addr=256,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # test the read of a random value
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = random_value
                self.assertEqual(await rut.read(), random_value)
                read_callback_mock.assert_called_once_with(
                                    addr=256,
                                    width=32,
                                    accesswidth=rut.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                

                
                # test that a non-writable register has no write method and attempting one generates and error
                with self.assertRaises(AttributeError):
                    await rut.write(0) # type: ignore[attr-defined]

                # check the read has not been called in the write test
                read_callback_mock.assert_not_called()
        

    async def test_int_field_read_and_write(self) -> None:
        """
        Check the ability to read and write to integer (non-eumn) fields
        """
        fut:Field
        

        # test access operations (read and/or write) to field:
        # pcie_config_reg.byte_offset_00.Vendor_ID
        with self.subTest(msg='field: pcie_config_reg.byte_offset_00.Vendor_ID'):
            fut = self.dut.byte_offset_00.Vendor_ID # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFFF0000
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=0,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFFFF
                self.assertEqual(await fut.read(),
                                 0xFFFF)
                read_callback_mock.assert_called_once_with(
                                    addr=0,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0xFFFF) >> 0
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=0,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()

        # test access operations (read and/or write) to field:
        # pcie_config_reg.byte_offset_00.Device_ID
        with self.subTest(msg='field: pcie_config_reg.byte_offset_00.Device_ID'):
            fut = self.dut.byte_offset_00.Device_ID # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFFF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=0,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFFFF0000
                self.assertEqual(await fut.read(),
                                 0xFFFF)
                read_callback_mock.assert_called_once_with(
                                    addr=0,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0xFFFF0000) >> 16
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=0,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()

        # test access operations (read and/or write) to field:
        # pcie_config_reg.byte_offset_04.bus_master_enable
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.bus_master_enable'):
            fut = self.dut.byte_offset_04.bus_master_enable # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFFFFFFB
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x4
                self.assertEqual(await fut.read(),
                                 0x1)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x4) >> 2
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0x1 + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0x1, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.byte_offset_04.bus_master_enable.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=self.dut.byte_offset_04.bus_master_enable.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xFFFFFFFB) | \
                                         (0x4 & (field_value << 2)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0x1 + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.byte_offset_04.special_cycle_enable
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.special_cycle_enable'):
            fut = self.dut.byte_offset_04.special_cycle_enable # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFFFFFF7
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x8
                self.assertEqual(await fut.read(),
                                 0x1)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x8) >> 3
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0x1 + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0x1, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.byte_offset_04.special_cycle_enable.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=self.dut.byte_offset_04.special_cycle_enable.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xFFFFFFF7) | \
                                         (0x8 & (field_value << 3)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0x1 + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.byte_offset_04.memory_write_invalidate
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.memory_write_invalidate'):
            fut = self.dut.byte_offset_04.memory_write_invalidate # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFFFFFEF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x10
                self.assertEqual(await fut.read(),
                                 0x1)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x10) >> 4
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0x1 + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0x1, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.byte_offset_04.memory_write_invalidate.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=self.dut.byte_offset_04.memory_write_invalidate.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xFFFFFFEF) | \
                                         (0x10 & (field_value << 4)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0x1 + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.byte_offset_04.vga_palette_snoop
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.vga_palette_snoop'):
            fut = self.dut.byte_offset_04.vga_palette_snoop # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFFFFFDF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x20
                self.assertEqual(await fut.read(),
                                 0x1)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x20) >> 5
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0x1 + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0x1, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.byte_offset_04.vga_palette_snoop.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=self.dut.byte_offset_04.vga_palette_snoop.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xFFFFFFDF) | \
                                         (0x20 & (field_value << 5)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0x1 + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.byte_offset_04.parity_error_response
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.parity_error_response'):
            fut = self.dut.byte_offset_04.parity_error_response # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFFFFFBF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x40
                self.assertEqual(await fut.read(),
                                 0x1)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x40) >> 6
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0x1 + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0x1, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.byte_offset_04.parity_error_response.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=self.dut.byte_offset_04.parity_error_response.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xFFFFFFBF) | \
                                         (0x40 & (field_value << 6)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0x1 + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.byte_offset_04.idsel_step_wait_cycle_control
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.idsel_step_wait_cycle_control'):
            fut = self.dut.byte_offset_04.idsel_step_wait_cycle_control # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFFFFF7F
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x80
                self.assertEqual(await fut.read(),
                                 0x1)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x80) >> 7
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0x1 + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0x1, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.byte_offset_04.idsel_step_wait_cycle_control.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=self.dut.byte_offset_04.idsel_step_wait_cycle_control.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xFFFFFF7F) | \
                                         (0x80 & (field_value << 7)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0x1 + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.byte_offset_04.SERR_Enable
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.SERR_Enable'):
            fut = self.dut.byte_offset_04.SERR_Enable # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFFFFEFF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x100
                self.assertEqual(await fut.read(),
                                 0x1)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x100) >> 8
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0x1 + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0x1, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.byte_offset_04.SERR_Enable.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=self.dut.byte_offset_04.SERR_Enable.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xFFFFFEFF) | \
                                         (0x100 & (field_value << 8)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0x1 + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.byte_offset_04.fast_b2b_transactions_enable
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.fast_b2b_transactions_enable'):
            fut = self.dut.byte_offset_04.fast_b2b_transactions_enable # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFFFFDFF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x200
                self.assertEqual(await fut.read(),
                                 0x1)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x200) >> 9
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0x1 + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0x1, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.byte_offset_04.fast_b2b_transactions_enable.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=self.dut.byte_offset_04.fast_b2b_transactions_enable.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xFFFFFDFF) | \
                                         (0x200 & (field_value << 9)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0x1 + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.byte_offset_04.interrupt_disable
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.interrupt_disable'):
            fut = self.dut.byte_offset_04.interrupt_disable # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFFFFBFF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x400
                self.assertEqual(await fut.read(),
                                 0x1)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x400) >> 10
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0x1 + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0x1, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.byte_offset_04.interrupt_disable.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=self.dut.byte_offset_04.interrupt_disable.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xFFFFFBFF) | \
                                         (0x400 & (field_value << 10)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0x1 + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.byte_offset_04.rsvd
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.rsvd'):
            fut = self.dut.byte_offset_04.rsvd # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFF807FF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x7F800
                self.assertEqual(await fut.read(),
                                 0xFF)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x7F800) >> 11
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0xFF + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0xFF, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.byte_offset_04.rsvd.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=self.dut.byte_offset_04.rsvd.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xFFF807FF) | \
                                         (0x7F800 & (field_value << 11)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0xFF + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.byte_offset_04.interrupt_status
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.interrupt_status'):
            fut = self.dut.byte_offset_04.interrupt_status # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFF7FFFF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x80000
                self.assertEqual(await fut.read(),
                                 0x1)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x80000) >> 19
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0x1 + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0x1, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.byte_offset_04.interrupt_status.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=self.dut.byte_offset_04.interrupt_status.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xFFF7FFFF) | \
                                         (0x80000 & (field_value << 19)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0x1 + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.byte_offset_04.capabilities_list
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.capabilities_list'):
            fut = self.dut.byte_offset_04.capabilities_list # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFEFFFFF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x100000
                self.assertEqual(await fut.read(),
                                 0x1)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x100000) >> 20
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0x1 + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0x1, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.byte_offset_04.capabilities_list.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=self.dut.byte_offset_04.capabilities_list.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xFFEFFFFF) | \
                                         (0x100000 & (field_value << 20)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0x1 + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.byte_offset_04.sixtysix_mhz_capable
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.sixtysix_mhz_capable'):
            fut = self.dut.byte_offset_04.sixtysix_mhz_capable # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFDFFFFF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x200000
                self.assertEqual(await fut.read(),
                                 0x1)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x200000) >> 21
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0x1 + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0x1, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.byte_offset_04.sixtysix_mhz_capable.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=self.dut.byte_offset_04.sixtysix_mhz_capable.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xFFDFFFFF) | \
                                         (0x200000 & (field_value << 21)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0x1 + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.byte_offset_04.fast_b2b_transactions_capable
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.fast_b2b_transactions_capable'):
            fut = self.dut.byte_offset_04.fast_b2b_transactions_capable # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFF7FFFFF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x800000
                self.assertEqual(await fut.read(),
                                 0x1)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x800000) >> 23
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0x1 + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0x1, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.byte_offset_04.fast_b2b_transactions_capable.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=self.dut.byte_offset_04.fast_b2b_transactions_capable.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xFF7FFFFF) | \
                                         (0x800000 & (field_value << 23)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0x1 + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.byte_offset_04.master_data_parity_error
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.master_data_parity_error'):
            fut = self.dut.byte_offset_04.master_data_parity_error # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFEFFFFFF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x1000000
                self.assertEqual(await fut.read(),
                                 0x1)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x1000000) >> 24
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0x1 + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0x1, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.byte_offset_04.master_data_parity_error.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=self.dut.byte_offset_04.master_data_parity_error.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xFEFFFFFF) | \
                                         (0x1000000 & (field_value << 24)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0x1 + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.byte_offset_04.devsel_timing
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.devsel_timing'):
            fut = self.dut.byte_offset_04.devsel_timing # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xF9FFFFFF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x6000000
                self.assertEqual(await fut.read(),
                                 0x3)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x6000000) >> 25
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0x3 + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0x3, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.byte_offset_04.devsel_timing.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=self.dut.byte_offset_04.devsel_timing.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xF9FFFFFF) | \
                                         (0x6000000 & (field_value << 25)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0x3 + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.byte_offset_04.signaled_target_abort
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.signaled_target_abort'):
            fut = self.dut.byte_offset_04.signaled_target_abort # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xF7FFFFFF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x8000000
                self.assertEqual(await fut.read(),
                                 0x1)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x8000000) >> 27
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0x1 + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0x1, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.byte_offset_04.signaled_target_abort.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=self.dut.byte_offset_04.signaled_target_abort.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xF7FFFFFF) | \
                                         (0x8000000 & (field_value << 27)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0x1 + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.byte_offset_04.received_target_abort
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.received_target_abort'):
            fut = self.dut.byte_offset_04.received_target_abort # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xEFFFFFFF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x10000000
                self.assertEqual(await fut.read(),
                                 0x1)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x10000000) >> 28
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0x1 + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0x1, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.byte_offset_04.received_target_abort.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=self.dut.byte_offset_04.received_target_abort.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xEFFFFFFF) | \
                                         (0x10000000 & (field_value << 28)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0x1 + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.byte_offset_04.received_master_abort
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.received_master_abort'):
            fut = self.dut.byte_offset_04.received_master_abort # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xDFFFFFFF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x20000000
                self.assertEqual(await fut.read(),
                                 0x1)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x20000000) >> 29
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0x1 + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0x1, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.byte_offset_04.received_master_abort.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=self.dut.byte_offset_04.received_master_abort.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xDFFFFFFF) | \
                                         (0x20000000 & (field_value << 29)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0x1 + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.byte_offset_04.signaled_system_error
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.signaled_system_error'):
            fut = self.dut.byte_offset_04.signaled_system_error # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xBFFFFFFF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x40000000
                self.assertEqual(await fut.read(),
                                 0x1)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x40000000) >> 30
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0x1 + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0x1, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.byte_offset_04.signaled_system_error.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=self.dut.byte_offset_04.signaled_system_error.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xBFFFFFFF) | \
                                         (0x40000000 & (field_value << 30)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0x1 + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.byte_offset_04.detected_parity_error
        with self.subTest(msg='field: pcie_config_reg.byte_offset_04.detected_parity_error'):
            fut = self.dut.byte_offset_04.detected_parity_error # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0x7FFFFFFF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x80000000
                self.assertEqual(await fut.read(),
                                 0x1)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x80000000) >> 31
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0x1 + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0x1, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.byte_offset_04.detected_parity_error.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=4,
                                    width=32,
                                    accesswidth=self.dut.byte_offset_04.detected_parity_error.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0x7FFFFFFF) | \
                                         (0x80000000 & (field_value << 31)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0x1 + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.byte_offset_08.Revision_ID
        with self.subTest(msg='field: pcie_config_reg.byte_offset_08.Revision_ID'):
            fut = self.dut.byte_offset_08.Revision_ID # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFFFFF00
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=8,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFF
                self.assertEqual(await fut.read(),
                                 0xFF)
                read_callback_mock.assert_called_once_with(
                                    addr=8,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0xFF) >> 0
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=8,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()

        # test access operations (read and/or write) to field:
        # pcie_config_reg.byte_offset_08.Class_Code
        with self.subTest(msg='field: pcie_config_reg.byte_offset_08.Class_Code'):
            fut = self.dut.byte_offset_08.Class_Code # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=8,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFFFFFF00
                self.assertEqual(await fut.read(),
                                 0xFFFFFF)
                read_callback_mock.assert_called_once_with(
                                    addr=8,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0xFFFFFF00) >> 8
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=8,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()

        # test access operations (read and/or write) to field:
        # pcie_config_reg.byte_offset_0C.cache_line_size_register
        with self.subTest(msg='field: pcie_config_reg.byte_offset_0C.cache_line_size_register'):
            fut = self.dut.byte_offset_0C.cache_line_size_register # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFFFFF00
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=12,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFF
                self.assertEqual(await fut.read(),
                                 0xFF)
                read_callback_mock.assert_called_once_with(
                                    addr=12,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0xFF) >> 0
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=12,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0xFF + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0xFF, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.byte_offset_0C.cache_line_size_register.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=12,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=12,
                                    width=32,
                                    accesswidth=self.dut.byte_offset_0C.cache_line_size_register.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xFFFFFF00) | \
                                         (0xFF & (field_value << 0)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0xFF + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.byte_offset_0C.latency_timer_register
        with self.subTest(msg='field: pcie_config_reg.byte_offset_0C.latency_timer_register'):
            fut = self.dut.byte_offset_0C.latency_timer_register # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFFF00FF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=12,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFF00
                self.assertEqual(await fut.read(),
                                 0xFF)
                read_callback_mock.assert_called_once_with(
                                    addr=12,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0xFF00) >> 8
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=12,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0xFF + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0xFF, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.byte_offset_0C.latency_timer_register.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=12,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=12,
                                    width=32,
                                    accesswidth=self.dut.byte_offset_0C.latency_timer_register.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xFFFF00FF) | \
                                         (0xFF00 & (field_value << 8)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0xFF + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.byte_offset_0C.interrupt_line_register
        with self.subTest(msg='field: pcie_config_reg.byte_offset_0C.interrupt_line_register'):
            fut = self.dut.byte_offset_0C.interrupt_line_register # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFF00FFFF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=12,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFF0000
                self.assertEqual(await fut.read(),
                                 0xFF)
                read_callback_mock.assert_called_once_with(
                                    addr=12,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0xFF0000) >> 16
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=12,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0xFF + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0xFF, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.byte_offset_0C.interrupt_line_register.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=12,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=12,
                                    width=32,
                                    accesswidth=self.dut.byte_offset_0C.interrupt_line_register.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xFF00FFFF) | \
                                         (0xFF0000 & (field_value << 16)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0xFF + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.byte_offset_0C.interrupt_pin_register
        with self.subTest(msg='field: pcie_config_reg.byte_offset_0C.interrupt_pin_register'):
            fut = self.dut.byte_offset_0C.interrupt_pin_register # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFFFFF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=12,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFF000000
                self.assertEqual(await fut.read(),
                                 0xFF)
                read_callback_mock.assert_called_once_with(
                                    addr=12,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0xFF000000) >> 24
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=12,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0xFF + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0xFF, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.byte_offset_0C.interrupt_pin_register.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=12,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=12,
                                    width=32,
                                    accesswidth=self.dut.byte_offset_0C.interrupt_pin_register.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xFFFFFF) | \
                                         (0xFF000000 & (field_value << 24)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0xFF + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.base_address_register_0.region_type
        with self.subTest(msg='field: pcie_config_reg.base_address_register_0.region_type'):
            fut = self.dut.base_address_register_0.region_type # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFFFFFFE
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=16,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x1
                self.assertEqual(await fut.read(),
                                 0x1)
                read_callback_mock.assert_called_once_with(
                                    addr=16,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x1) >> 0
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=16,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()

        # test access operations (read and/or write) to field:
        # pcie_config_reg.base_address_register_0.locatable
        with self.subTest(msg='field: pcie_config_reg.base_address_register_0.locatable'):
            fut = self.dut.base_address_register_0.locatable # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFFFFFF9
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=16,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x6
                self.assertEqual(await fut.read(),
                                 0x3)
                read_callback_mock.assert_called_once_with(
                                    addr=16,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x6) >> 1
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=16,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()

        # test access operations (read and/or write) to field:
        # pcie_config_reg.base_address_register_0.prefetchable
        with self.subTest(msg='field: pcie_config_reg.base_address_register_0.prefetchable'):
            fut = self.dut.base_address_register_0.prefetchable # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFFFFFF7
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=16,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x8
                self.assertEqual(await fut.read(),
                                 0x1)
                read_callback_mock.assert_called_once_with(
                                    addr=16,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x8) >> 3
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=16,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()

        # test access operations (read and/or write) to field:
        # pcie_config_reg.base_address_register_0.base_adress
        with self.subTest(msg='field: pcie_config_reg.base_address_register_0.base_adress'):
            fut = self.dut.base_address_register_0.base_adress # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=16,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFFFFFFF0
                self.assertEqual(await fut.read(),
                                 0xFFFFFFF)
                read_callback_mock.assert_called_once_with(
                                    addr=16,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0xFFFFFFF0) >> 4
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=16,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()

        # test access operations (read and/or write) to field:
        # pcie_config_reg.base_ddress_register_1.region_type
        with self.subTest(msg='field: pcie_config_reg.base_ddress_register_1.region_type'):
            fut = self.dut.base_ddress_register_1.region_type # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFFFFFFE
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=20,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x1
                self.assertEqual(await fut.read(),
                                 0x1)
                read_callback_mock.assert_called_once_with(
                                    addr=20,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x1) >> 0
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=20,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()

        # test access operations (read and/or write) to field:
        # pcie_config_reg.base_ddress_register_1.locatable
        with self.subTest(msg='field: pcie_config_reg.base_ddress_register_1.locatable'):
            fut = self.dut.base_ddress_register_1.locatable # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFFFFFF9
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=20,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x6
                self.assertEqual(await fut.read(),
                                 0x3)
                read_callback_mock.assert_called_once_with(
                                    addr=20,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x6) >> 1
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=20,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()

        # test access operations (read and/or write) to field:
        # pcie_config_reg.base_ddress_register_1.prefetchable
        with self.subTest(msg='field: pcie_config_reg.base_ddress_register_1.prefetchable'):
            fut = self.dut.base_ddress_register_1.prefetchable # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFFFFFF7
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=20,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x8
                self.assertEqual(await fut.read(),
                                 0x1)
                read_callback_mock.assert_called_once_with(
                                    addr=20,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x8) >> 3
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=20,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()

        # test access operations (read and/or write) to field:
        # pcie_config_reg.base_ddress_register_1.base_adress
        with self.subTest(msg='field: pcie_config_reg.base_ddress_register_1.base_adress'):
            fut = self.dut.base_ddress_register_1.base_adress # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=20,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFFFFFFF0
                self.assertEqual(await fut.read(),
                                 0xFFFFFFF)
                read_callback_mock.assert_called_once_with(
                                    addr=20,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0xFFFFFFF0) >> 4
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=20,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()

        # test access operations (read and/or write) to field:
        # pcie_config_reg.base_ddress_register_2.BAR
        with self.subTest(msg='field: pcie_config_reg.base_ddress_register_2.BAR'):
            fut = self.dut.base_ddress_register_2.BAR # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0x0
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=24,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFFFFFFFF
                self.assertEqual(await fut.read(),
                                 0xFFFFFFFF)
                read_callback_mock.assert_called_once_with(
                                    addr=24,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0xFFFFFFFF) >> 0
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=24,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0xFFFFFFFF + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0xFFFFFFFF, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.base_ddress_register_2.BAR.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_not_called()
                        write_callback_mock.assert_called_once_with(
                                    addr=24,
                                    width=32,
                                    accesswidth=self.dut.base_ddress_register_2.BAR.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0x0) | \
                                         (0xFFFFFFFF & (field_value << 0)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0xFFFFFFFF + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.base_ddress_register_3.BAR
        with self.subTest(msg='field: pcie_config_reg.base_ddress_register_3.BAR'):
            fut = self.dut.base_ddress_register_3.BAR # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0x0
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=28,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFFFFFFFF
                self.assertEqual(await fut.read(),
                                 0xFFFFFFFF)
                read_callback_mock.assert_called_once_with(
                                    addr=28,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0xFFFFFFFF) >> 0
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=28,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0xFFFFFFFF + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0xFFFFFFFF, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.base_ddress_register_3.BAR.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_not_called()
                        write_callback_mock.assert_called_once_with(
                                    addr=28,
                                    width=32,
                                    accesswidth=self.dut.base_ddress_register_3.BAR.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0x0) | \
                                         (0xFFFFFFFF & (field_value << 0)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0xFFFFFFFF + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.base_ddress_register_4.BAR
        with self.subTest(msg='field: pcie_config_reg.base_ddress_register_4.BAR'):
            fut = self.dut.base_ddress_register_4.BAR # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0x0
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=32,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFFFFFFFF
                self.assertEqual(await fut.read(),
                                 0xFFFFFFFF)
                read_callback_mock.assert_called_once_with(
                                    addr=32,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0xFFFFFFFF) >> 0
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=32,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0xFFFFFFFF + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0xFFFFFFFF, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.base_ddress_register_4.BAR.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_not_called()
                        write_callback_mock.assert_called_once_with(
                                    addr=32,
                                    width=32,
                                    accesswidth=self.dut.base_ddress_register_4.BAR.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0x0) | \
                                         (0xFFFFFFFF & (field_value << 0)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0xFFFFFFFF + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.base_ddress_register_5.BAR
        with self.subTest(msg='field: pcie_config_reg.base_ddress_register_5.BAR'):
            fut = self.dut.base_ddress_register_5.BAR # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0x0
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=36,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFFFFFFFF
                self.assertEqual(await fut.read(),
                                 0xFFFFFFFF)
                read_callback_mock.assert_called_once_with(
                                    addr=36,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0xFFFFFFFF) >> 0
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=36,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0xFFFFFFFF + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0xFFFFFFFF, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.base_ddress_register_5.BAR.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_not_called()
                        write_callback_mock.assert_called_once_with(
                                    addr=36,
                                    width=32,
                                    accesswidth=self.dut.base_ddress_register_5.BAR.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0x0) | \
                                         (0xFFFFFFFF & (field_value << 0)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0xFFFFFFFF + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.cardbus_cis_pointer.word
        with self.subTest(msg='field: pcie_config_reg.cardbus_cis_pointer.word'):
            fut = self.dut.cardbus_cis_pointer.word # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0x0
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=40,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFFFFFFFF
                self.assertEqual(await fut.read(),
                                 0xFFFFFFFF)
                read_callback_mock.assert_called_once_with(
                                    addr=40,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0xFFFFFFFF) >> 0
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=40,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0xFFFFFFFF + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0xFFFFFFFF, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.cardbus_cis_pointer.word.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_not_called()
                        write_callback_mock.assert_called_once_with(
                                    addr=40,
                                    width=32,
                                    accesswidth=self.dut.cardbus_cis_pointer.word.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0x0) | \
                                         (0xFFFFFFFF & (field_value << 0)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0xFFFFFFFF + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.byte_offset_2C.Vendor_ID
        with self.subTest(msg='field: pcie_config_reg.byte_offset_2C.Vendor_ID'):
            fut = self.dut.byte_offset_2C.Vendor_ID # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFFF0000
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=44,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFFFF
                self.assertEqual(await fut.read(),
                                 0xFFFF)
                read_callback_mock.assert_called_once_with(
                                    addr=44,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0xFFFF) >> 0
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=44,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()

        # test access operations (read and/or write) to field:
        # pcie_config_reg.byte_offset_2C.Device_ID
        with self.subTest(msg='field: pcie_config_reg.byte_offset_2C.Device_ID'):
            fut = self.dut.byte_offset_2C.Device_ID # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFFF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=44,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFFFF0000
                self.assertEqual(await fut.read(),
                                 0xFFFF)
                read_callback_mock.assert_called_once_with(
                                    addr=44,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0xFFFF0000) >> 16
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=44,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()

        # test access operations (read and/or write) to field:
        # pcie_config_reg.capabilities_pointer.capabilities_ptr
        with self.subTest(msg='field: pcie_config_reg.capabilities_pointer.capabilities_ptr'):
            fut = self.dut.capabilities_pointer.capabilities_ptr # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFFFFF00
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=52,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFF
                self.assertEqual(await fut.read(),
                                 0xFF)
                read_callback_mock.assert_called_once_with(
                                    addr=52,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0xFF) >> 0
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=52,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()

        # test access operations (read and/or write) to field:
        # pcie_config_reg.byte_offset_3C.interrupt_line
        with self.subTest(msg='field: pcie_config_reg.byte_offset_3C.interrupt_line'):
            fut = self.dut.byte_offset_3C.interrupt_line # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFFFFF00
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=60,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFF
                self.assertEqual(await fut.read(),
                                 0xFF)
                read_callback_mock.assert_called_once_with(
                                    addr=60,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0xFF) >> 0
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=60,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0xFF + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0xFF, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.byte_offset_3C.interrupt_line.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=60,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=60,
                                    width=32,
                                    accesswidth=self.dut.byte_offset_3C.interrupt_line.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xFFFFFF00) | \
                                         (0xFF & (field_value << 0)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0xFF + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.byte_offset_3C.interrupt_pin
        with self.subTest(msg='field: pcie_config_reg.byte_offset_3C.interrupt_pin'):
            fut = self.dut.byte_offset_3C.interrupt_pin # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFFF00FF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=60,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFF00
                self.assertEqual(await fut.read(),
                                 0xFF)
                read_callback_mock.assert_called_once_with(
                                    addr=60,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0xFF00) >> 8
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=60,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0xFF + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0xFF, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.byte_offset_3C.interrupt_pin.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=60,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=60,
                                    width=32,
                                    accesswidth=self.dut.byte_offset_3C.interrupt_pin.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xFFFF00FF) | \
                                         (0xFF00 & (field_value << 8)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0xFF + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.byte_offset_3C.min_gnt
        with self.subTest(msg='field: pcie_config_reg.byte_offset_3C.min_gnt'):
            fut = self.dut.byte_offset_3C.min_gnt # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFF00FFFF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=60,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFF0000
                self.assertEqual(await fut.read(),
                                 0xFF)
                read_callback_mock.assert_called_once_with(
                                    addr=60,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0xFF0000) >> 16
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=60,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()

        # test access operations (read and/or write) to field:
        # pcie_config_reg.byte_offset_3C.max_lat
        with self.subTest(msg='field: pcie_config_reg.byte_offset_3C.max_lat'):
            fut = self.dut.byte_offset_3C.max_lat # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFFFFF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=60,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFF000000
                self.assertEqual(await fut.read(),
                                 0xFF)
                read_callback_mock.assert_called_once_with(
                                    addr=60,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0xFF000000) >> 24
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=60,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()

        # test access operations (read and/or write) to field:
        # pcie_config_reg.capabilities_power_mngt_pointer.capabilities_id
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_mngt_pointer.capabilities_id'):
            fut = self.dut.capabilities_power_mngt_pointer.capabilities_id # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFFFFF00
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFF
                self.assertEqual(await fut.read(),
                                 0xFF)
                read_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0xFF) >> 0
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()

        # test access operations (read and/or write) to field:
        # pcie_config_reg.capabilities_power_mngt_pointer.next_cap_ptr
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_mngt_pointer.next_cap_ptr'):
            fut = self.dut.capabilities_power_mngt_pointer.next_cap_ptr # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFFF00FF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFF00
                self.assertEqual(await fut.read(),
                                 0xFF)
                read_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0xFF00) >> 8
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()

        # test access operations (read and/or write) to field:
        # pcie_config_reg.capabilities_power_mngt_pointer.version
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_mngt_pointer.version'):
            fut = self.dut.capabilities_power_mngt_pointer.version # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFF8FFFF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x70000
                self.assertEqual(await fut.read(),
                                 0x7)
                read_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x70000) >> 16
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0x7 + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0x7, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.capabilities_power_mngt_pointer.version.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=self.dut.capabilities_power_mngt_pointer.version.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xFFF8FFFF) | \
                                         (0x70000 & (field_value << 16)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0x7 + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.capabilities_power_mngt_pointer.pme_clock
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_mngt_pointer.pme_clock'):
            fut = self.dut.capabilities_power_mngt_pointer.pme_clock # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFF7FFFF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x80000
                self.assertEqual(await fut.read(),
                                 0x1)
                read_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x80000) >> 19
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0x1 + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0x1, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.capabilities_power_mngt_pointer.pme_clock.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=self.dut.capabilities_power_mngt_pointer.pme_clock.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xFFF7FFFF) | \
                                         (0x80000 & (field_value << 19)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0x1 + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.capabilities_power_mngt_pointer.dev_spec_init
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_mngt_pointer.dev_spec_init'):
            fut = self.dut.capabilities_power_mngt_pointer.dev_spec_init # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFDFFFFF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x200000
                self.assertEqual(await fut.read(),
                                 0x1)
                read_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x200000) >> 21
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0x1 + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0x1, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.capabilities_power_mngt_pointer.dev_spec_init.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=self.dut.capabilities_power_mngt_pointer.dev_spec_init.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xFFDFFFFF) | \
                                         (0x200000 & (field_value << 21)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0x1 + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.capabilities_power_mngt_pointer.aux_current
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_mngt_pointer.aux_current'):
            fut = self.dut.capabilities_power_mngt_pointer.aux_current # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFE3FFFFF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x1C00000
                self.assertEqual(await fut.read(),
                                 0x7)
                read_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x1C00000) >> 22
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0x7 + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0x7, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.capabilities_power_mngt_pointer.aux_current.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=self.dut.capabilities_power_mngt_pointer.aux_current.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xFE3FFFFF) | \
                                         (0x1C00000 & (field_value << 22)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0x7 + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.capabilities_power_mngt_pointer.d1_support
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_mngt_pointer.d1_support'):
            fut = self.dut.capabilities_power_mngt_pointer.d1_support # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFDFFFFFF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x2000000
                self.assertEqual(await fut.read(),
                                 0x1)
                read_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x2000000) >> 25
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0x1 + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0x1, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.capabilities_power_mngt_pointer.d1_support.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=self.dut.capabilities_power_mngt_pointer.d1_support.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xFDFFFFFF) | \
                                         (0x2000000 & (field_value << 25)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0x1 + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.capabilities_power_mngt_pointer.d2_support
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_mngt_pointer.d2_support'):
            fut = self.dut.capabilities_power_mngt_pointer.d2_support # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFBFFFFFF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x4000000
                self.assertEqual(await fut.read(),
                                 0x1)
                read_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x4000000) >> 26
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0x1 + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0x1, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.capabilities_power_mngt_pointer.d2_support.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=self.dut.capabilities_power_mngt_pointer.d2_support.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xFBFFFFFF) | \
                                         (0x4000000 & (field_value << 26)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0x1 + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.capabilities_power_mngt_pointer.pme_support
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_mngt_pointer.pme_support'):
            fut = self.dut.capabilities_power_mngt_pointer.pme_support # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0x7FFFFFF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xF8000000
                self.assertEqual(await fut.read(),
                                 0x1F)
                read_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0xF8000000) >> 27
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0x1F + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0x1F, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.capabilities_power_mngt_pointer.pme_support.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=64,
                                    width=32,
                                    accesswidth=self.dut.capabilities_power_mngt_pointer.pme_support.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0x7FFFFFF) | \
                                         (0xF8000000 & (field_value << 27)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0x1F + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.power_management_pointer.power_state
        with self.subTest(msg='field: pcie_config_reg.power_management_pointer.power_state'):
            fut = self.dut.power_management_pointer.power_state # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFFFFFFC
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x3
                self.assertEqual(await fut.read(),
                                 0x3)
                read_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x3) >> 0
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0x3 + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0x3, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.power_management_pointer.power_state.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=self.dut.power_management_pointer.power_state.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xFFFFFFFC) | \
                                         (0x3 & (field_value << 0)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0x3 + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.power_management_pointer.pme_enable
        with self.subTest(msg='field: pcie_config_reg.power_management_pointer.pme_enable'):
            fut = self.dut.power_management_pointer.pme_enable # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFFFFFF7
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x8
                self.assertEqual(await fut.read(),
                                 0x1)
                read_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x8) >> 3
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0x1 + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0x1, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.power_management_pointer.pme_enable.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=self.dut.power_management_pointer.pme_enable.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xFFFFFFF7) | \
                                         (0x8 & (field_value << 3)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0x1 + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.power_management_pointer.data_select
        with self.subTest(msg='field: pcie_config_reg.power_management_pointer.data_select'):
            fut = self.dut.power_management_pointer.data_select # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFFFE1FF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x1E00
                self.assertEqual(await fut.read(),
                                 0xF)
                read_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x1E00) >> 9
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0xF + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0xF, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.power_management_pointer.data_select.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=self.dut.power_management_pointer.data_select.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xFFFFE1FF) | \
                                         (0x1E00 & (field_value << 9)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0xF + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.power_management_pointer.data_scale
        with self.subTest(msg='field: pcie_config_reg.power_management_pointer.data_scale'):
            fut = self.dut.power_management_pointer.data_scale # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFFF9FFF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x6000
                self.assertEqual(await fut.read(),
                                 0x3)
                read_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x6000) >> 13
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0x3 + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0x3, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.power_management_pointer.data_scale.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=self.dut.power_management_pointer.data_scale.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xFFFF9FFF) | \
                                         (0x6000 & (field_value << 13)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0x3 + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.power_management_pointer.pme_status
        with self.subTest(msg='field: pcie_config_reg.power_management_pointer.pme_status'):
            fut = self.dut.power_management_pointer.pme_status # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFFF7FFF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x8000
                self.assertEqual(await fut.read(),
                                 0x1)
                read_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x8000) >> 15
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0x1 + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0x1, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.power_management_pointer.pme_status.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=self.dut.power_management_pointer.pme_status.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xFFFF7FFF) | \
                                         (0x8000 & (field_value << 15)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0x1 + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.power_management_pointer.b2_b3_support
        with self.subTest(msg='field: pcie_config_reg.power_management_pointer.b2_b3_support'):
            fut = self.dut.power_management_pointer.b2_b3_support # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFBFFFFF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x400000
                self.assertEqual(await fut.read(),
                                 0x1)
                read_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x400000) >> 22
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0x1 + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0x1, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.power_management_pointer.b2_b3_support.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=self.dut.power_management_pointer.b2_b3_support.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xFFBFFFFF) | \
                                         (0x400000 & (field_value << 22)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0x1 + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.power_management_pointer.bus_pwr_clk_ctrl_en
        with self.subTest(msg='field: pcie_config_reg.power_management_pointer.bus_pwr_clk_ctrl_en'):
            fut = self.dut.power_management_pointer.bus_pwr_clk_ctrl_en # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFF7FFFFF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x800000
                self.assertEqual(await fut.read(),
                                 0x1)
                read_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x800000) >> 23
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0x1 + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0x1, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.power_management_pointer.bus_pwr_clk_ctrl_en.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=self.dut.power_management_pointer.bus_pwr_clk_ctrl_en.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xFF7FFFFF) | \
                                         (0x800000 & (field_value << 23)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0x1 + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.power_management_pointer.data
        with self.subTest(msg='field: pcie_config_reg.power_management_pointer.data'):
            fut = self.dut.power_management_pointer.data # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFFFFF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFF000000
                self.assertEqual(await fut.read(),
                                 0xFF)
                read_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0xFF000000) >> 24
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0xFF + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0xFF, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.power_management_pointer.data.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=68,
                                    width=32,
                                    accesswidth=self.dut.power_management_pointer.data.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xFFFFFF) | \
                                         (0xFF000000 & (field_value << 24)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0xFF + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.capabilities_power_na_pointer.capabilities_id
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_na_pointer.capabilities_id'):
            fut = self.dut.capabilities_power_na_pointer.capabilities_id # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFFFFF00
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=72,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFF
                self.assertEqual(await fut.read(),
                                 0xFF)
                read_callback_mock.assert_called_once_with(
                                    addr=72,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0xFF) >> 0
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=72,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()

        # test access operations (read and/or write) to field:
        # pcie_config_reg.capabilities_power_na_pointer.next_cap_ptr
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_na_pointer.next_cap_ptr'):
            fut = self.dut.capabilities_power_na_pointer.next_cap_ptr # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFFF00FF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=72,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFF00
                self.assertEqual(await fut.read(),
                                 0xFF)
                read_callback_mock.assert_called_once_with(
                                    addr=72,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0xFF00) >> 8
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=72,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()

        # test access operations (read and/or write) to field:
        # pcie_config_reg.capabilities_power_na_pointer.capability_version
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_na_pointer.capability_version'):
            fut = self.dut.capabilities_power_na_pointer.capability_version # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFF0FFFF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=72,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xF0000
                self.assertEqual(await fut.read(),
                                 0xF)
                read_callback_mock.assert_called_once_with(
                                    addr=72,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0xF0000) >> 16
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=72,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()

        # test access operations (read and/or write) to field:
        # pcie_config_reg.capabilities_power_na_pointer.device_port_type
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_na_pointer.device_port_type'):
            fut = self.dut.capabilities_power_na_pointer.device_port_type # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFF0FFFFF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=72,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xF00000
                self.assertEqual(await fut.read(),
                                 0xF)
                read_callback_mock.assert_called_once_with(
                                    addr=72,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0xF00000) >> 20
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=72,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()

        # test access operations (read and/or write) to field:
        # pcie_config_reg.capabilities_power_na_pointer.slot_implemented
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_na_pointer.slot_implemented'):
            fut = self.dut.capabilities_power_na_pointer.slot_implemented # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFEFFFFFF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=72,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x1000000
                self.assertEqual(await fut.read(),
                                 0x1)
                read_callback_mock.assert_called_once_with(
                                    addr=72,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x1000000) >> 24
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=72,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()

        # test access operations (read and/or write) to field:
        # pcie_config_reg.capabilities_power_na_pointer.interrupt_msg_number
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_na_pointer.interrupt_msg_number'):
            fut = self.dut.capabilities_power_na_pointer.interrupt_msg_number # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xC1FFFFFF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=72,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x3E000000
                self.assertEqual(await fut.read(),
                                 0x1F)
                read_callback_mock.assert_called_once_with(
                                    addr=72,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x3E000000) >> 25
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=72,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()

        # test access operations (read and/or write) to field:
        # pcie_config_reg.capabilities_power_na_pointer.Undefined
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_na_pointer.Undefined'):
            fut = self.dut.capabilities_power_na_pointer.Undefined # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xBFFFFFFF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=72,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x40000000
                self.assertEqual(await fut.read(),
                                 0x1)
                read_callback_mock.assert_called_once_with(
                                    addr=72,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x40000000) >> 30
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=72,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()

        # test access operations (read and/or write) to field:
        # pcie_config_reg.capabilities_power_na_pointer.RsvdP
        with self.subTest(msg='field: pcie_config_reg.capabilities_power_na_pointer.RsvdP'):
            fut = self.dut.capabilities_power_na_pointer.RsvdP # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0x7FFFFFFF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=72,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x80000000
                self.assertEqual(await fut.read(),
                                 0x1)
                read_callback_mock.assert_called_once_with(
                                    addr=72,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x80000000) >> 31
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=72,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()

        # test access operations (read and/or write) to field:
        # pcie_config_reg.link_control_3_register.perform_equalization
        with self.subTest(msg='field: pcie_config_reg.link_control_3_register.perform_equalization'):
            fut = self.dut.link_control_3_register.perform_equalization # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFFFFFFE
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=76,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x1
                self.assertEqual(await fut.read(),
                                 0x1)
                read_callback_mock.assert_called_once_with(
                                    addr=76,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x1) >> 0
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=76,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0x1 + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0x1, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.link_control_3_register.perform_equalization.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=76,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=76,
                                    width=32,
                                    accesswidth=self.dut.link_control_3_register.perform_equalization.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xFFFFFFFE) | \
                                         (0x1 & (field_value << 0)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0x1 + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.link_control_3_register.link_eq_req_intr_en
        with self.subTest(msg='field: pcie_config_reg.link_control_3_register.link_eq_req_intr_en'):
            fut = self.dut.link_control_3_register.link_eq_req_intr_en # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFFFFFFD
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=76,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x2
                self.assertEqual(await fut.read(),
                                 0x1)
                read_callback_mock.assert_called_once_with(
                                    addr=76,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x2) >> 1
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=76,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0x1 + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0x1, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.link_control_3_register.link_eq_req_intr_en.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=76,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=76,
                                    width=32,
                                    accesswidth=self.dut.link_control_3_register.link_eq_req_intr_en.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xFFFFFFFD) | \
                                         (0x2 & (field_value << 1)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0x1 + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.lane_error_status_register.lane_error
        with self.subTest(msg='field: pcie_config_reg.lane_error_status_register.lane_error'):
            fut = self.dut.lane_error_status_register.lane_error # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFFFFFE0
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=80,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x1F
                self.assertEqual(await fut.read(),
                                 0x1F)
                read_callback_mock.assert_called_once_with(
                                    addr=80,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x1F) >> 0
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=80,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0x1F + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0x1F, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.lane_error_status_register.lane_error.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=80,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=80,
                                    width=32,
                                    accesswidth=self.dut.lane_error_status_register.lane_error.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xFFFFFFE0) | \
                                         (0x1F & (field_value << 0)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0x1F + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.lane_eq_ctrl_register.downstream_tx_preset
        with self.subTest(msg='field: pcie_config_reg.lane_eq_ctrl_register.downstream_tx_preset'):
            fut = self.dut.lane_eq_ctrl_register.downstream_tx_preset # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFFFFFF0
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=84,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xF
                self.assertEqual(await fut.read(),
                                 0xF)
                read_callback_mock.assert_called_once_with(
                                    addr=84,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0xF) >> 0
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=84,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0xF + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0xF, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.lane_eq_ctrl_register.downstream_tx_preset.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=84,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=84,
                                    width=32,
                                    accesswidth=self.dut.lane_eq_ctrl_register.downstream_tx_preset.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xFFFFFFF0) | \
                                         (0xF & (field_value << 0)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0xF + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.lane_eq_ctrl_register.downstream_rx_preset_hint
        with self.subTest(msg='field: pcie_config_reg.lane_eq_ctrl_register.downstream_rx_preset_hint'):
            fut = self.dut.lane_eq_ctrl_register.downstream_rx_preset_hint # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFFFFF8F
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=84,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x70
                self.assertEqual(await fut.read(),
                                 0x7)
                read_callback_mock.assert_called_once_with(
                                    addr=84,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x70) >> 4
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=84,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0x7 + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0x7, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.lane_eq_ctrl_register.downstream_rx_preset_hint.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=84,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=84,
                                    width=32,
                                    accesswidth=self.dut.lane_eq_ctrl_register.downstream_rx_preset_hint.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xFFFFFF8F) | \
                                         (0x70 & (field_value << 4)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0x7 + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.lane_eq_ctrl_register.upstream_tx_preset
        with self.subTest(msg='field: pcie_config_reg.lane_eq_ctrl_register.upstream_tx_preset'):
            fut = self.dut.lane_eq_ctrl_register.upstream_tx_preset # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFFFF0FF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=84,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xF00
                self.assertEqual(await fut.read(),
                                 0xF)
                read_callback_mock.assert_called_once_with(
                                    addr=84,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0xF00) >> 8
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=84,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0xF + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0xF, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.lane_eq_ctrl_register.upstream_tx_preset.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=84,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=84,
                                    width=32,
                                    accesswidth=self.dut.lane_eq_ctrl_register.upstream_tx_preset.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xFFFFF0FF) | \
                                         (0xF00 & (field_value << 8)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0xF + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.lane_eq_ctrl_register.upstream_rx_preset_hint
        with self.subTest(msg='field: pcie_config_reg.lane_eq_ctrl_register.upstream_rx_preset_hint'):
            fut = self.dut.lane_eq_ctrl_register.upstream_rx_preset_hint # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0xFFFF8FFF
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=84,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0x7000
                self.assertEqual(await fut.read(),
                                 0x7)
                read_callback_mock.assert_called_once_with(
                                    addr=84,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0x7000) >> 12
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=84,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()
                # check the write
                
                if not isinstance(fut, (FieldAsyncWriteOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a writable async field')
                

                random_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                random_field_value = random.randrange(0, 0x7 + 1)
                for reg_base_value in [0, 0xFFFFFFFF, random_reg_value]:
                    for field_value in [0, 0x7, random_field_value]:
                        read_callback_mock.reset_mock()
                        write_callback_mock.reset_mock()
                        read_callback_mock.return_value = reg_base_value

                        await self.dut.lane_eq_ctrl_register.upstream_rx_preset_hint.write(field_value) # type: ignore[union-attr]

                        
                        read_callback_mock.assert_called_once_with(
                                    addr=84,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)
                        
                        write_callback_mock.assert_called_once_with(
                                    addr=84,
                                    width=32,
                                    accesswidth=self.dut.lane_eq_ctrl_register.upstream_rx_preset_hint.parent_register.accesswidth, # type: ignore[union-attr]
                                    data=(reg_base_value & 0xFFFF8FFF) | \
                                         (0x7000 & (field_value << 12)))
                        

                # check invalid write values bounce
                with self.assertRaises(ValueError):
                    await fut.write(0x7 + 1)

                with self.assertRaises(ValueError):
                    await fut.write(-1)

        # test access operations (read and/or write) to field:
        # pcie_config_reg.extended_capabilities.ext_cap
        with self.subTest(msg='field: pcie_config_reg.extended_capabilities.ext_cap'):
            fut = self.dut.extended_capabilities.ext_cap # type: ignore[union-attr]
            with patch(base_name + '.write_addr_space') as write_callback_mock,\
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:

                
                
                if not isinstance(fut, (FieldAsyncReadOnly, FieldAsyncReadWrite)):
                    raise TypeError('Test can not proceed as the fut is not a readable async field')
                

                # read back - zero, this is achieved by setting the register to inverse bitmask
                read_callback_mock.return_value = 0x0
                self.assertEqual(await fut.read(),
                                 0)
                read_callback_mock.assert_called_once_with(
                                    addr=256,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - max_value, this is achieved by setting the register to bitmask
                read_callback_mock.reset_mock()
                read_callback_mock.return_value = 0xFFFFFFFF
                self.assertEqual(await fut.read(),
                                 0xFFFFFFFF)
                read_callback_mock.assert_called_once_with(
                                    addr=256,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # read back - random value
                read_callback_mock.reset_mock()
                random_value = random.randrange(0, 0xFFFFFFFF+1)
                read_callback_mock.return_value = random_value
                random_field_value = (random_value & 0xFFFFFFFF) >> 0
                self.assertEqual(await fut.read(),
                                 random_field_value)
                read_callback_mock.assert_called_once_with(
                                    addr=256,
                                    width=32,
                                    accesswidth=fut.parent_register.accesswidth)

                # at the end of the read tests the write should not have been called
                read_callback_mock.reset_mock()
                write_callback_mock.assert_not_called()

    

    async def test_register_read_fields(self) -> None:
        """
        Walk the register map and check every register read_fields method
        """
        reference_read_fields: dict[str, Union[bool, SystemRDLEnum, int]]
        
        with self.subTest(msg='register: pcie_config_reg.byte_offset_00'):
            # test read_fields to register:
            # pcie_config_reg.byte_offset_00
            # build up the register value with a random base value, overlaid with
            # a random value for each field
            rand_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                
                    
                        
            rand_field_value = random.randrange(0, 0xFFFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFF0000) | (rand_field_value << 0)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0xFFFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFF) | (rand_field_value << 16)
                        
                    
                
            
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                 patch(base_name + '.read_addr_space', return_value=rand_reg_value) as read_callback_mock:
                # the read_fields method gets a dictionary back
                # from the object with all the read back field
                # values
                reference_read_fields = { 
                                          'Vendor_ID' : await self.dut.byte_offset_00.Vendor_ID.read(),
                                          'Device_ID' : await self.dut.byte_offset_00.Device_ID.read()
                                        }

                read_callback_mock.reset_mock()

                self.assertDictEqual(await self.dut.byte_offset_00.read_fields(),
                                     reference_read_fields)
                read_callback_mock.assert_called_once()
                write_callback_mock.assert_not_called()
        with self.subTest(msg='register: pcie_config_reg.byte_offset_04'):
            # test read_fields to register:
            # pcie_config_reg.byte_offset_04
            # build up the register value with a random base value, overlaid with
            # a random value for each field
            rand_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFFFB) | (rand_field_value << 2)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFFF7) | (rand_field_value << 3)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFFEF) | (rand_field_value << 4)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFFDF) | (rand_field_value << 5)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFFBF) | (rand_field_value << 6)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFF7F) | (rand_field_value << 7)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFEFF) | (rand_field_value << 8)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFDFF) | (rand_field_value << 9)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFBFF) | (rand_field_value << 10)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0xFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFF807FF) | (rand_field_value << 11)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFF7FFFF) | (rand_field_value << 19)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFEFFFFF) | (rand_field_value << 20)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFDFFFFF) | (rand_field_value << 21)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFF7FFFFF) | (rand_field_value << 23)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFEFFFFFF) | (rand_field_value << 24)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x3 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xF9FFFFFF) | (rand_field_value << 25)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xF7FFFFFF) | (rand_field_value << 27)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xEFFFFFFF) | (rand_field_value << 28)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xDFFFFFFF) | (rand_field_value << 29)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xBFFFFFFF) | (rand_field_value << 30)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0x7FFFFFFF) | (rand_field_value << 31)
                        
                    
                
            
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                 patch(base_name + '.read_addr_space', return_value=rand_reg_value) as read_callback_mock:
                # the read_fields method gets a dictionary back
                # from the object with all the read back field
                # values
                reference_read_fields = { 
                                          'bus_master_enable' : await self.dut.byte_offset_04.bus_master_enable.read(),
                                          'special_cycle_enable' : await self.dut.byte_offset_04.special_cycle_enable.read(),
                                          'memory_write_invalidate' : await self.dut.byte_offset_04.memory_write_invalidate.read(),
                                          'vga_palette_snoop' : await self.dut.byte_offset_04.vga_palette_snoop.read(),
                                          'parity_error_response' : await self.dut.byte_offset_04.parity_error_response.read(),
                                          'idsel_step_wait_cycle_control' : await self.dut.byte_offset_04.idsel_step_wait_cycle_control.read(),
                                          'SERR_Enable' : await self.dut.byte_offset_04.SERR_Enable.read(),
                                          'fast_b2b_transactions_enable' : await self.dut.byte_offset_04.fast_b2b_transactions_enable.read(),
                                          'interrupt_disable' : await self.dut.byte_offset_04.interrupt_disable.read(),
                                          'rsvd' : await self.dut.byte_offset_04.rsvd.read(),
                                          'interrupt_status' : await self.dut.byte_offset_04.interrupt_status.read(),
                                          'capabilities_list' : await self.dut.byte_offset_04.capabilities_list.read(),
                                          'sixtysix_mhz_capable' : await self.dut.byte_offset_04.sixtysix_mhz_capable.read(),
                                          'fast_b2b_transactions_capable' : await self.dut.byte_offset_04.fast_b2b_transactions_capable.read(),
                                          'master_data_parity_error' : await self.dut.byte_offset_04.master_data_parity_error.read(),
                                          'devsel_timing' : await self.dut.byte_offset_04.devsel_timing.read(),
                                          'signaled_target_abort' : await self.dut.byte_offset_04.signaled_target_abort.read(),
                                          'received_target_abort' : await self.dut.byte_offset_04.received_target_abort.read(),
                                          'received_master_abort' : await self.dut.byte_offset_04.received_master_abort.read(),
                                          'signaled_system_error' : await self.dut.byte_offset_04.signaled_system_error.read(),
                                          'detected_parity_error' : await self.dut.byte_offset_04.detected_parity_error.read()
                                        }

                read_callback_mock.reset_mock()

                self.assertDictEqual(await self.dut.byte_offset_04.read_fields(),
                                     reference_read_fields)
                read_callback_mock.assert_called_once()
                write_callback_mock.assert_not_called()
        with self.subTest(msg='register: pcie_config_reg.byte_offset_08'):
            # test read_fields to register:
            # pcie_config_reg.byte_offset_08
            # build up the register value with a random base value, overlaid with
            # a random value for each field
            rand_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                
                    
                        
            rand_field_value = random.randrange(0, 0xFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFF00) | (rand_field_value << 0)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0xFFFFFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFF) | (rand_field_value << 8)
                        
                    
                
            
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                 patch(base_name + '.read_addr_space', return_value=rand_reg_value) as read_callback_mock:
                # the read_fields method gets a dictionary back
                # from the object with all the read back field
                # values
                reference_read_fields = { 
                                          'Revision_ID' : await self.dut.byte_offset_08.Revision_ID.read(),
                                          'Class_Code' : await self.dut.byte_offset_08.Class_Code.read()
                                        }

                read_callback_mock.reset_mock()

                self.assertDictEqual(await self.dut.byte_offset_08.read_fields(),
                                     reference_read_fields)
                read_callback_mock.assert_called_once()
                write_callback_mock.assert_not_called()
        with self.subTest(msg='register: pcie_config_reg.byte_offset_0C'):
            # test read_fields to register:
            # pcie_config_reg.byte_offset_0C
            # build up the register value with a random base value, overlaid with
            # a random value for each field
            rand_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                
                    
                        
            rand_field_value = random.randrange(0, 0xFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFF00) | (rand_field_value << 0)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0xFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFF00FF) | (rand_field_value << 8)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0xFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFF00FFFF) | (rand_field_value << 16)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0xFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFF) | (rand_field_value << 24)
                        
                    
                
            
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                 patch(base_name + '.read_addr_space', return_value=rand_reg_value) as read_callback_mock:
                # the read_fields method gets a dictionary back
                # from the object with all the read back field
                # values
                reference_read_fields = { 
                                          'cache_line_size_register' : await self.dut.byte_offset_0C.cache_line_size_register.read(),
                                          'latency_timer_register' : await self.dut.byte_offset_0C.latency_timer_register.read(),
                                          'interrupt_line_register' : await self.dut.byte_offset_0C.interrupt_line_register.read(),
                                          'interrupt_pin_register' : await self.dut.byte_offset_0C.interrupt_pin_register.read()
                                        }

                read_callback_mock.reset_mock()

                self.assertDictEqual(await self.dut.byte_offset_0C.read_fields(),
                                     reference_read_fields)
                read_callback_mock.assert_called_once()
                write_callback_mock.assert_not_called()
        with self.subTest(msg='register: pcie_config_reg.base_address_register_0'):
            # test read_fields to register:
            # pcie_config_reg.base_address_register_0
            # build up the register value with a random base value, overlaid with
            # a random value for each field
            rand_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFFFE) | (rand_field_value << 0)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x3 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFFF9) | (rand_field_value << 1)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFFF7) | (rand_field_value << 3)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0xFFFFFFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xF) | (rand_field_value << 4)
                        
                    
                
            
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                 patch(base_name + '.read_addr_space', return_value=rand_reg_value) as read_callback_mock:
                # the read_fields method gets a dictionary back
                # from the object with all the read back field
                # values
                reference_read_fields = { 
                                          'region_type' : await self.dut.base_address_register_0.region_type.read(),
                                          'locatable' : await self.dut.base_address_register_0.locatable.read(),
                                          'prefetchable' : await self.dut.base_address_register_0.prefetchable.read(),
                                          'base_adress' : await self.dut.base_address_register_0.base_adress.read()
                                        }

                read_callback_mock.reset_mock()

                self.assertDictEqual(await self.dut.base_address_register_0.read_fields(),
                                     reference_read_fields)
                read_callback_mock.assert_called_once()
                write_callback_mock.assert_not_called()
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_1'):
            # test read_fields to register:
            # pcie_config_reg.base_ddress_register_1
            # build up the register value with a random base value, overlaid with
            # a random value for each field
            rand_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFFFE) | (rand_field_value << 0)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x3 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFFF9) | (rand_field_value << 1)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFFF7) | (rand_field_value << 3)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0xFFFFFFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xF) | (rand_field_value << 4)
                        
                    
                
            
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                 patch(base_name + '.read_addr_space', return_value=rand_reg_value) as read_callback_mock:
                # the read_fields method gets a dictionary back
                # from the object with all the read back field
                # values
                reference_read_fields = { 
                                          'region_type' : await self.dut.base_ddress_register_1.region_type.read(),
                                          'locatable' : await self.dut.base_ddress_register_1.locatable.read(),
                                          'prefetchable' : await self.dut.base_ddress_register_1.prefetchable.read(),
                                          'base_adress' : await self.dut.base_ddress_register_1.base_adress.read()
                                        }

                read_callback_mock.reset_mock()

                self.assertDictEqual(await self.dut.base_ddress_register_1.read_fields(),
                                     reference_read_fields)
                read_callback_mock.assert_called_once()
                write_callback_mock.assert_not_called()
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_2'):
            # test read_fields to register:
            # pcie_config_reg.base_ddress_register_2
            # build up the register value with a random base value, overlaid with
            # a random value for each field
            rand_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                
                    
                        
            rand_field_value = random.randrange(0, 0xFFFFFFFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0x0) | (rand_field_value << 0)
                        
                    
                
            
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                 patch(base_name + '.read_addr_space', return_value=rand_reg_value) as read_callback_mock:
                # the read_fields method gets a dictionary back
                # from the object with all the read back field
                # values
                reference_read_fields = { 
                                          'BAR' : await self.dut.base_ddress_register_2.BAR.read()
                                        }

                read_callback_mock.reset_mock()

                self.assertDictEqual(await self.dut.base_ddress_register_2.read_fields(),
                                     reference_read_fields)
                read_callback_mock.assert_called_once()
                write_callback_mock.assert_not_called()
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_3'):
            # test read_fields to register:
            # pcie_config_reg.base_ddress_register_3
            # build up the register value with a random base value, overlaid with
            # a random value for each field
            rand_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                
                    
                        
            rand_field_value = random.randrange(0, 0xFFFFFFFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0x0) | (rand_field_value << 0)
                        
                    
                
            
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                 patch(base_name + '.read_addr_space', return_value=rand_reg_value) as read_callback_mock:
                # the read_fields method gets a dictionary back
                # from the object with all the read back field
                # values
                reference_read_fields = { 
                                          'BAR' : await self.dut.base_ddress_register_3.BAR.read()
                                        }

                read_callback_mock.reset_mock()

                self.assertDictEqual(await self.dut.base_ddress_register_3.read_fields(),
                                     reference_read_fields)
                read_callback_mock.assert_called_once()
                write_callback_mock.assert_not_called()
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_4'):
            # test read_fields to register:
            # pcie_config_reg.base_ddress_register_4
            # build up the register value with a random base value, overlaid with
            # a random value for each field
            rand_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                
                    
                        
            rand_field_value = random.randrange(0, 0xFFFFFFFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0x0) | (rand_field_value << 0)
                        
                    
                
            
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                 patch(base_name + '.read_addr_space', return_value=rand_reg_value) as read_callback_mock:
                # the read_fields method gets a dictionary back
                # from the object with all the read back field
                # values
                reference_read_fields = { 
                                          'BAR' : await self.dut.base_ddress_register_4.BAR.read()
                                        }

                read_callback_mock.reset_mock()

                self.assertDictEqual(await self.dut.base_ddress_register_4.read_fields(),
                                     reference_read_fields)
                read_callback_mock.assert_called_once()
                write_callback_mock.assert_not_called()
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_5'):
            # test read_fields to register:
            # pcie_config_reg.base_ddress_register_5
            # build up the register value with a random base value, overlaid with
            # a random value for each field
            rand_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                
                    
                        
            rand_field_value = random.randrange(0, 0xFFFFFFFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0x0) | (rand_field_value << 0)
                        
                    
                
            
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                 patch(base_name + '.read_addr_space', return_value=rand_reg_value) as read_callback_mock:
                # the read_fields method gets a dictionary back
                # from the object with all the read back field
                # values
                reference_read_fields = { 
                                          'BAR' : await self.dut.base_ddress_register_5.BAR.read()
                                        }

                read_callback_mock.reset_mock()

                self.assertDictEqual(await self.dut.base_ddress_register_5.read_fields(),
                                     reference_read_fields)
                read_callback_mock.assert_called_once()
                write_callback_mock.assert_not_called()
        with self.subTest(msg='register: pcie_config_reg.cardbus_cis_pointer'):
            # test read_fields to register:
            # pcie_config_reg.cardbus_cis_pointer
            # build up the register value with a random base value, overlaid with
            # a random value for each field
            rand_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                
                    
                        
            rand_field_value = random.randrange(0, 0xFFFFFFFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0x0) | (rand_field_value << 0)
                        
                    
                
            
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                 patch(base_name + '.read_addr_space', return_value=rand_reg_value) as read_callback_mock:
                # the read_fields method gets a dictionary back
                # from the object with all the read back field
                # values
                reference_read_fields = { 
                                          'word' : await self.dut.cardbus_cis_pointer.word.read()
                                        }

                read_callback_mock.reset_mock()

                self.assertDictEqual(await self.dut.cardbus_cis_pointer.read_fields(),
                                     reference_read_fields)
                read_callback_mock.assert_called_once()
                write_callback_mock.assert_not_called()
        with self.subTest(msg='register: pcie_config_reg.byte_offset_2C'):
            # test read_fields to register:
            # pcie_config_reg.byte_offset_2C
            # build up the register value with a random base value, overlaid with
            # a random value for each field
            rand_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                
                    
                        
            rand_field_value = random.randrange(0, 0xFFFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFF0000) | (rand_field_value << 0)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0xFFFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFF) | (rand_field_value << 16)
                        
                    
                
            
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                 patch(base_name + '.read_addr_space', return_value=rand_reg_value) as read_callback_mock:
                # the read_fields method gets a dictionary back
                # from the object with all the read back field
                # values
                reference_read_fields = { 
                                          'Vendor_ID' : await self.dut.byte_offset_2C.Vendor_ID.read(),
                                          'Device_ID' : await self.dut.byte_offset_2C.Device_ID.read()
                                        }

                read_callback_mock.reset_mock()

                self.assertDictEqual(await self.dut.byte_offset_2C.read_fields(),
                                     reference_read_fields)
                read_callback_mock.assert_called_once()
                write_callback_mock.assert_not_called()
        with self.subTest(msg='register: pcie_config_reg.capabilities_pointer'):
            # test read_fields to register:
            # pcie_config_reg.capabilities_pointer
            # build up the register value with a random base value, overlaid with
            # a random value for each field
            rand_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                
                    
                        
            rand_field_value = random.randrange(0, 0xFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFF00) | (rand_field_value << 0)
                        
                    
                
            
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                 patch(base_name + '.read_addr_space', return_value=rand_reg_value) as read_callback_mock:
                # the read_fields method gets a dictionary back
                # from the object with all the read back field
                # values
                reference_read_fields = { 
                                          'capabilities_ptr' : await self.dut.capabilities_pointer.capabilities_ptr.read()
                                        }

                read_callback_mock.reset_mock()

                self.assertDictEqual(await self.dut.capabilities_pointer.read_fields(),
                                     reference_read_fields)
                read_callback_mock.assert_called_once()
                write_callback_mock.assert_not_called()
        with self.subTest(msg='register: pcie_config_reg.byte_offset_3C'):
            # test read_fields to register:
            # pcie_config_reg.byte_offset_3C
            # build up the register value with a random base value, overlaid with
            # a random value for each field
            rand_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                
                    
                        
            rand_field_value = random.randrange(0, 0xFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFF00) | (rand_field_value << 0)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0xFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFF00FF) | (rand_field_value << 8)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0xFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFF00FFFF) | (rand_field_value << 16)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0xFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFF) | (rand_field_value << 24)
                        
                    
                
            
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                 patch(base_name + '.read_addr_space', return_value=rand_reg_value) as read_callback_mock:
                # the read_fields method gets a dictionary back
                # from the object with all the read back field
                # values
                reference_read_fields = { 
                                          'interrupt_line' : await self.dut.byte_offset_3C.interrupt_line.read(),
                                          'interrupt_pin' : await self.dut.byte_offset_3C.interrupt_pin.read(),
                                          'min_gnt' : await self.dut.byte_offset_3C.min_gnt.read(),
                                          'max_lat' : await self.dut.byte_offset_3C.max_lat.read()
                                        }

                read_callback_mock.reset_mock()

                self.assertDictEqual(await self.dut.byte_offset_3C.read_fields(),
                                     reference_read_fields)
                read_callback_mock.assert_called_once()
                write_callback_mock.assert_not_called()
        with self.subTest(msg='register: pcie_config_reg.capabilities_power_mngt_pointer'):
            # test read_fields to register:
            # pcie_config_reg.capabilities_power_mngt_pointer
            # build up the register value with a random base value, overlaid with
            # a random value for each field
            rand_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                
                    
                        
            rand_field_value = random.randrange(0, 0xFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFF00) | (rand_field_value << 0)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0xFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFF00FF) | (rand_field_value << 8)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x7 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFF8FFFF) | (rand_field_value << 16)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFF7FFFF) | (rand_field_value << 19)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFDFFFFF) | (rand_field_value << 21)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x7 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFE3FFFFF) | (rand_field_value << 22)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFDFFFFFF) | (rand_field_value << 25)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFBFFFFFF) | (rand_field_value << 26)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1F + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0x7FFFFFF) | (rand_field_value << 27)
                        
                    
                
            
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                 patch(base_name + '.read_addr_space', return_value=rand_reg_value) as read_callback_mock:
                # the read_fields method gets a dictionary back
                # from the object with all the read back field
                # values
                reference_read_fields = { 
                                          'capabilities_id' : await self.dut.capabilities_power_mngt_pointer.capabilities_id.read(),
                                          'next_cap_ptr' : await self.dut.capabilities_power_mngt_pointer.next_cap_ptr.read(),
                                          'version' : await self.dut.capabilities_power_mngt_pointer.version.read(),
                                          'pme_clock' : await self.dut.capabilities_power_mngt_pointer.pme_clock.read(),
                                          'dev_spec_init' : await self.dut.capabilities_power_mngt_pointer.dev_spec_init.read(),
                                          'aux_current' : await self.dut.capabilities_power_mngt_pointer.aux_current.read(),
                                          'd1_support' : await self.dut.capabilities_power_mngt_pointer.d1_support.read(),
                                          'd2_support' : await self.dut.capabilities_power_mngt_pointer.d2_support.read(),
                                          'pme_support' : await self.dut.capabilities_power_mngt_pointer.pme_support.read()
                                        }

                read_callback_mock.reset_mock()

                self.assertDictEqual(await self.dut.capabilities_power_mngt_pointer.read_fields(),
                                     reference_read_fields)
                read_callback_mock.assert_called_once()
                write_callback_mock.assert_not_called()
        with self.subTest(msg='register: pcie_config_reg.power_management_pointer'):
            # test read_fields to register:
            # pcie_config_reg.power_management_pointer
            # build up the register value with a random base value, overlaid with
            # a random value for each field
            rand_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                
                    
                        
            rand_field_value = random.randrange(0, 0x3 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFFFC) | (rand_field_value << 0)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFFF7) | (rand_field_value << 3)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0xF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFE1FF) | (rand_field_value << 9)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x3 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFF9FFF) | (rand_field_value << 13)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFF7FFF) | (rand_field_value << 15)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFBFFFFF) | (rand_field_value << 22)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFF7FFFFF) | (rand_field_value << 23)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0xFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFF) | (rand_field_value << 24)
                        
                    
                
            
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                 patch(base_name + '.read_addr_space', return_value=rand_reg_value) as read_callback_mock:
                # the read_fields method gets a dictionary back
                # from the object with all the read back field
                # values
                reference_read_fields = { 
                                          'power_state' : await self.dut.power_management_pointer.power_state.read(),
                                          'pme_enable' : await self.dut.power_management_pointer.pme_enable.read(),
                                          'data_select' : await self.dut.power_management_pointer.data_select.read(),
                                          'data_scale' : await self.dut.power_management_pointer.data_scale.read(),
                                          'pme_status' : await self.dut.power_management_pointer.pme_status.read(),
                                          'b2_b3_support' : await self.dut.power_management_pointer.b2_b3_support.read(),
                                          'bus_pwr_clk_ctrl_en' : await self.dut.power_management_pointer.bus_pwr_clk_ctrl_en.read(),
                                          'data' : await self.dut.power_management_pointer.data.read()
                                        }

                read_callback_mock.reset_mock()

                self.assertDictEqual(await self.dut.power_management_pointer.read_fields(),
                                     reference_read_fields)
                read_callback_mock.assert_called_once()
                write_callback_mock.assert_not_called()
        with self.subTest(msg='register: pcie_config_reg.capabilities_power_na_pointer'):
            # test read_fields to register:
            # pcie_config_reg.capabilities_power_na_pointer
            # build up the register value with a random base value, overlaid with
            # a random value for each field
            rand_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                
                    
                        
            rand_field_value = random.randrange(0, 0xFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFF00) | (rand_field_value << 0)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0xFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFF00FF) | (rand_field_value << 8)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0xF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFF0FFFF) | (rand_field_value << 16)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0xF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFF0FFFFF) | (rand_field_value << 20)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFEFFFFFF) | (rand_field_value << 24)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1F + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xC1FFFFFF) | (rand_field_value << 25)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xBFFFFFFF) | (rand_field_value << 30)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0x7FFFFFFF) | (rand_field_value << 31)
                        
                    
                
            
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                 patch(base_name + '.read_addr_space', return_value=rand_reg_value) as read_callback_mock:
                # the read_fields method gets a dictionary back
                # from the object with all the read back field
                # values
                reference_read_fields = { 
                                          'capabilities_id' : await self.dut.capabilities_power_na_pointer.capabilities_id.read(),
                                          'next_cap_ptr' : await self.dut.capabilities_power_na_pointer.next_cap_ptr.read(),
                                          'capability_version' : await self.dut.capabilities_power_na_pointer.capability_version.read(),
                                          'device_port_type' : await self.dut.capabilities_power_na_pointer.device_port_type.read(),
                                          'slot_implemented' : await self.dut.capabilities_power_na_pointer.slot_implemented.read(),
                                          'interrupt_msg_number' : await self.dut.capabilities_power_na_pointer.interrupt_msg_number.read(),
                                          'Undefined' : await self.dut.capabilities_power_na_pointer.Undefined.read(),
                                          'RsvdP' : await self.dut.capabilities_power_na_pointer.RsvdP.read()
                                        }

                read_callback_mock.reset_mock()

                self.assertDictEqual(await self.dut.capabilities_power_na_pointer.read_fields(),
                                     reference_read_fields)
                read_callback_mock.assert_called_once()
                write_callback_mock.assert_not_called()
        with self.subTest(msg='register: pcie_config_reg.link_control_3_register'):
            # test read_fields to register:
            # pcie_config_reg.link_control_3_register
            # build up the register value with a random base value, overlaid with
            # a random value for each field
            rand_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFFFE) | (rand_field_value << 0)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFFFD) | (rand_field_value << 1)
                        
                    
                
            
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                 patch(base_name + '.read_addr_space', return_value=rand_reg_value) as read_callback_mock:
                # the read_fields method gets a dictionary back
                # from the object with all the read back field
                # values
                reference_read_fields = { 
                                          'perform_equalization' : await self.dut.link_control_3_register.perform_equalization.read(),
                                          'link_eq_req_intr_en' : await self.dut.link_control_3_register.link_eq_req_intr_en.read()
                                        }

                read_callback_mock.reset_mock()

                self.assertDictEqual(await self.dut.link_control_3_register.read_fields(),
                                     reference_read_fields)
                read_callback_mock.assert_called_once()
                write_callback_mock.assert_not_called()
        with self.subTest(msg='register: pcie_config_reg.lane_error_status_register'):
            # test read_fields to register:
            # pcie_config_reg.lane_error_status_register
            # build up the register value with a random base value, overlaid with
            # a random value for each field
            rand_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                
                    
                        
            rand_field_value = random.randrange(0, 0x1F + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFFE0) | (rand_field_value << 0)
                        
                    
                
            
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                 patch(base_name + '.read_addr_space', return_value=rand_reg_value) as read_callback_mock:
                # the read_fields method gets a dictionary back
                # from the object with all the read back field
                # values
                reference_read_fields = { 
                                          'lane_error' : await self.dut.lane_error_status_register.lane_error.read()
                                        }

                read_callback_mock.reset_mock()

                self.assertDictEqual(await self.dut.lane_error_status_register.read_fields(),
                                     reference_read_fields)
                read_callback_mock.assert_called_once()
                write_callback_mock.assert_not_called()
        with self.subTest(msg='register: pcie_config_reg.lane_eq_ctrl_register'):
            # test read_fields to register:
            # pcie_config_reg.lane_eq_ctrl_register
            # build up the register value with a random base value, overlaid with
            # a random value for each field
            rand_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                
                    
                        
            rand_field_value = random.randrange(0, 0xF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFFF0) | (rand_field_value << 0)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x7 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFF8F) | (rand_field_value << 4)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0xF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFF0FF) | (rand_field_value << 8)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x7 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFF8FFF) | (rand_field_value << 12)
                        
                    
                
            
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                 patch(base_name + '.read_addr_space', return_value=rand_reg_value) as read_callback_mock:
                # the read_fields method gets a dictionary back
                # from the object with all the read back field
                # values
                reference_read_fields = { 
                                          'downstream_tx_preset' : await self.dut.lane_eq_ctrl_register.downstream_tx_preset.read(),
                                          'downstream_rx_preset_hint' : await self.dut.lane_eq_ctrl_register.downstream_rx_preset_hint.read(),
                                          'upstream_tx_preset' : await self.dut.lane_eq_ctrl_register.upstream_tx_preset.read(),
                                          'upstream_rx_preset_hint' : await self.dut.lane_eq_ctrl_register.upstream_rx_preset_hint.read()
                                        }

                read_callback_mock.reset_mock()

                self.assertDictEqual(await self.dut.lane_eq_ctrl_register.read_fields(),
                                     reference_read_fields)
                read_callback_mock.assert_called_once()
                write_callback_mock.assert_not_called()
        with self.subTest(msg='register: pcie_config_reg.extended_capabilities'):
            # test read_fields to register:
            # pcie_config_reg.extended_capabilities
            # build up the register value with a random base value, overlaid with
            # a random value for each field
            rand_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                
                    
                        
            rand_field_value = random.randrange(0, 0xFFFFFFFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0x0) | (rand_field_value << 0)
                        
                    
                
            
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                 patch(base_name + '.read_addr_space', return_value=rand_reg_value) as read_callback_mock:
                # the read_fields method gets a dictionary back
                # from the object with all the read back field
                # values
                reference_read_fields = { 
                                          'ext_cap' : await self.dut.extended_capabilities.ext_cap.read()
                                        }

                read_callback_mock.reset_mock()

                self.assertDictEqual(await self.dut.extended_capabilities.read_fields(),
                                     reference_read_fields)
                read_callback_mock.assert_called_once()
                write_callback_mock.assert_not_called()

    async def test_register_read_context_manager(self) -> None:
        """
        Walk the register map and check every register read_fields method
        """
        reference_read_fields: dict[str, Union[bool, SystemRDLEnum, int]]
        
        # test context manager to register:
        # pcie_config_reg.byte_offset_00
        # build up the register value with a random base value, overlaid with
        # a random value for each field
        with self.subTest(msg='register: pcie_config_reg.byte_offset_00'):
            rand_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                
                    
                        
            rand_field_value = random.randrange(0, 0xFFFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFF0000) | (rand_field_value << 0)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0xFFFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFF) | (rand_field_value << 16)
                        
                    
                
            
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                 patch(base_name + '.read_addr_space', return_value=rand_reg_value) as read_callback_mock:

                # first read the fields using the "normal" method, then compare the result to reading
                # via the context manager
                reference_read_fields = { 
                                          'Vendor_ID' : await self.dut.byte_offset_00.Vendor_ID.read(),  # type: ignore[union-attr]
                                          'Device_ID' : await self.dut.byte_offset_00.Device_ID.read()  # type: ignore[union-attr]
                                        }
                read_callback_mock.reset_mock()

                
                async with self.dut.byte_offset_00.single_read() as reg_context: # type: ignore[union-attr]
                    self.assertEqual(reference_read_fields['Vendor_ID'],
                                      await reg_context.get_child_by_system_rdl_name('Vendor_ID').read()
                                     )
                    self.assertEqual(reference_read_fields['Device_ID'],
                                      await reg_context.get_child_by_system_rdl_name('Device_ID').read()
                                     )
                    pass

                read_callback_mock.assert_called_once()
                write_callback_mock.assert_not_called()
        # test context manager to register:
        # pcie_config_reg.byte_offset_04
        # build up the register value with a random base value, overlaid with
        # a random value for each field
        with self.subTest(msg='register: pcie_config_reg.byte_offset_04'):
            rand_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFFFB) | (rand_field_value << 2)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFFF7) | (rand_field_value << 3)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFFEF) | (rand_field_value << 4)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFFDF) | (rand_field_value << 5)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFFBF) | (rand_field_value << 6)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFF7F) | (rand_field_value << 7)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFEFF) | (rand_field_value << 8)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFDFF) | (rand_field_value << 9)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFBFF) | (rand_field_value << 10)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0xFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFF807FF) | (rand_field_value << 11)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFF7FFFF) | (rand_field_value << 19)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFEFFFFF) | (rand_field_value << 20)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFDFFFFF) | (rand_field_value << 21)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFF7FFFFF) | (rand_field_value << 23)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFEFFFFFF) | (rand_field_value << 24)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x3 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xF9FFFFFF) | (rand_field_value << 25)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xF7FFFFFF) | (rand_field_value << 27)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xEFFFFFFF) | (rand_field_value << 28)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xDFFFFFFF) | (rand_field_value << 29)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xBFFFFFFF) | (rand_field_value << 30)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0x7FFFFFFF) | (rand_field_value << 31)
                        
                    
                
            
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                 patch(base_name + '.read_addr_space', return_value=rand_reg_value) as read_callback_mock:

                # first read the fields using the "normal" method, then compare the result to reading
                # via the context manager
                reference_read_fields = { 
                                          'bus_master_enable' : await self.dut.byte_offset_04.bus_master_enable.read(),  # type: ignore[union-attr]
                                          'special_cycle_enable' : await self.dut.byte_offset_04.special_cycle_enable.read(),  # type: ignore[union-attr]
                                          'memory_write_invalidate' : await self.dut.byte_offset_04.memory_write_invalidate.read(),  # type: ignore[union-attr]
                                          'vga_palette_snoop' : await self.dut.byte_offset_04.vga_palette_snoop.read(),  # type: ignore[union-attr]
                                          'parity_error_response' : await self.dut.byte_offset_04.parity_error_response.read(),  # type: ignore[union-attr]
                                          'idsel_step_wait_cycle_control' : await self.dut.byte_offset_04.idsel_step_wait_cycle_control.read(),  # type: ignore[union-attr]
                                          'SERR_Enable' : await self.dut.byte_offset_04.SERR_Enable.read(),  # type: ignore[union-attr]
                                          'fast_b2b_transactions_enable' : await self.dut.byte_offset_04.fast_b2b_transactions_enable.read(),  # type: ignore[union-attr]
                                          'interrupt_disable' : await self.dut.byte_offset_04.interrupt_disable.read(),  # type: ignore[union-attr]
                                          'rsvd' : await self.dut.byte_offset_04.rsvd.read(),  # type: ignore[union-attr]
                                          'interrupt_status' : await self.dut.byte_offset_04.interrupt_status.read(),  # type: ignore[union-attr]
                                          'capabilities_list' : await self.dut.byte_offset_04.capabilities_list.read(),  # type: ignore[union-attr]
                                          'sixtysix_mhz_capable' : await self.dut.byte_offset_04.sixtysix_mhz_capable.read(),  # type: ignore[union-attr]
                                          'fast_b2b_transactions_capable' : await self.dut.byte_offset_04.fast_b2b_transactions_capable.read(),  # type: ignore[union-attr]
                                          'master_data_parity_error' : await self.dut.byte_offset_04.master_data_parity_error.read(),  # type: ignore[union-attr]
                                          'devsel_timing' : await self.dut.byte_offset_04.devsel_timing.read(),  # type: ignore[union-attr]
                                          'signaled_target_abort' : await self.dut.byte_offset_04.signaled_target_abort.read(),  # type: ignore[union-attr]
                                          'received_target_abort' : await self.dut.byte_offset_04.received_target_abort.read(),  # type: ignore[union-attr]
                                          'received_master_abort' : await self.dut.byte_offset_04.received_master_abort.read(),  # type: ignore[union-attr]
                                          'signaled_system_error' : await self.dut.byte_offset_04.signaled_system_error.read(),  # type: ignore[union-attr]
                                          'detected_parity_error' : await self.dut.byte_offset_04.detected_parity_error.read()  # type: ignore[union-attr]
                                        }
                read_callback_mock.reset_mock()

                
                async with self.dut.byte_offset_04.single_read_modify_write(skip_write=True) as reg_context: # type: ignore[union-attr]
                
                    self.assertEqual(reference_read_fields['bus_master_enable'],
                                      await reg_context.get_child_by_system_rdl_name('bus_master_enable').read()
                                     )
                    self.assertEqual(reference_read_fields['special_cycle_enable'],
                                      await reg_context.get_child_by_system_rdl_name('special_cycle_enable').read()
                                     )
                    self.assertEqual(reference_read_fields['memory_write_invalidate'],
                                      await reg_context.get_child_by_system_rdl_name('memory_write_invalidate').read()
                                     )
                    self.assertEqual(reference_read_fields['vga_palette_snoop'],
                                      await reg_context.get_child_by_system_rdl_name('vga_palette_snoop').read()
                                     )
                    self.assertEqual(reference_read_fields['parity_error_response'],
                                      await reg_context.get_child_by_system_rdl_name('parity_error_response').read()
                                     )
                    self.assertEqual(reference_read_fields['idsel_step_wait_cycle_control'],
                                      await reg_context.get_child_by_system_rdl_name('idsel_step_wait_cycle_control').read()
                                     )
                    self.assertEqual(reference_read_fields['SERR_Enable'],
                                      await reg_context.get_child_by_system_rdl_name('SERR_Enable').read()
                                     )
                    self.assertEqual(reference_read_fields['fast_b2b_transactions_enable'],
                                      await reg_context.get_child_by_system_rdl_name('fast_b2b_transactions_enable').read()
                                     )
                    self.assertEqual(reference_read_fields['interrupt_disable'],
                                      await reg_context.get_child_by_system_rdl_name('interrupt_disable').read()
                                     )
                    self.assertEqual(reference_read_fields['rsvd'],
                                      await reg_context.get_child_by_system_rdl_name('rsvd').read()
                                     )
                    self.assertEqual(reference_read_fields['interrupt_status'],
                                      await reg_context.get_child_by_system_rdl_name('interrupt_status').read()
                                     )
                    self.assertEqual(reference_read_fields['capabilities_list'],
                                      await reg_context.get_child_by_system_rdl_name('capabilities_list').read()
                                     )
                    self.assertEqual(reference_read_fields['sixtysix_mhz_capable'],
                                      await reg_context.get_child_by_system_rdl_name('sixtysix_mhz_capable').read()
                                     )
                    self.assertEqual(reference_read_fields['fast_b2b_transactions_capable'],
                                      await reg_context.get_child_by_system_rdl_name('fast_b2b_transactions_capable').read()
                                     )
                    self.assertEqual(reference_read_fields['master_data_parity_error'],
                                      await reg_context.get_child_by_system_rdl_name('master_data_parity_error').read()
                                     )
                    self.assertEqual(reference_read_fields['devsel_timing'],
                                      await reg_context.get_child_by_system_rdl_name('devsel_timing').read()
                                     )
                    self.assertEqual(reference_read_fields['signaled_target_abort'],
                                      await reg_context.get_child_by_system_rdl_name('signaled_target_abort').read()
                                     )
                    self.assertEqual(reference_read_fields['received_target_abort'],
                                      await reg_context.get_child_by_system_rdl_name('received_target_abort').read()
                                     )
                    self.assertEqual(reference_read_fields['received_master_abort'],
                                      await reg_context.get_child_by_system_rdl_name('received_master_abort').read()
                                     )
                    self.assertEqual(reference_read_fields['signaled_system_error'],
                                      await reg_context.get_child_by_system_rdl_name('signaled_system_error').read()
                                     )
                    self.assertEqual(reference_read_fields['detected_parity_error'],
                                      await reg_context.get_child_by_system_rdl_name('detected_parity_error').read()
                                     )
                    pass

                read_callback_mock.assert_called_once()
                write_callback_mock.assert_not_called()
        # test context manager to register:
        # pcie_config_reg.byte_offset_08
        # build up the register value with a random base value, overlaid with
        # a random value for each field
        with self.subTest(msg='register: pcie_config_reg.byte_offset_08'):
            rand_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                
                    
                        
            rand_field_value = random.randrange(0, 0xFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFF00) | (rand_field_value << 0)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0xFFFFFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFF) | (rand_field_value << 8)
                        
                    
                
            
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                 patch(base_name + '.read_addr_space', return_value=rand_reg_value) as read_callback_mock:

                # first read the fields using the "normal" method, then compare the result to reading
                # via the context manager
                reference_read_fields = { 
                                          'Revision_ID' : await self.dut.byte_offset_08.Revision_ID.read(),  # type: ignore[union-attr]
                                          'Class_Code' : await self.dut.byte_offset_08.Class_Code.read()  # type: ignore[union-attr]
                                        }
                read_callback_mock.reset_mock()

                
                async with self.dut.byte_offset_08.single_read() as reg_context: # type: ignore[union-attr]
                    self.assertEqual(reference_read_fields['Revision_ID'],
                                      await reg_context.get_child_by_system_rdl_name('Revision_ID').read()
                                     )
                    self.assertEqual(reference_read_fields['Class_Code'],
                                      await reg_context.get_child_by_system_rdl_name('Class_Code').read()
                                     )
                    pass

                read_callback_mock.assert_called_once()
                write_callback_mock.assert_not_called()
        # test context manager to register:
        # pcie_config_reg.byte_offset_0C
        # build up the register value with a random base value, overlaid with
        # a random value for each field
        with self.subTest(msg='register: pcie_config_reg.byte_offset_0C'):
            rand_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                
                    
                        
            rand_field_value = random.randrange(0, 0xFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFF00) | (rand_field_value << 0)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0xFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFF00FF) | (rand_field_value << 8)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0xFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFF00FFFF) | (rand_field_value << 16)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0xFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFF) | (rand_field_value << 24)
                        
                    
                
            
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                 patch(base_name + '.read_addr_space', return_value=rand_reg_value) as read_callback_mock:

                # first read the fields using the "normal" method, then compare the result to reading
                # via the context manager
                reference_read_fields = { 
                                          'cache_line_size_register' : await self.dut.byte_offset_0C.cache_line_size_register.read(),  # type: ignore[union-attr]
                                          'latency_timer_register' : await self.dut.byte_offset_0C.latency_timer_register.read(),  # type: ignore[union-attr]
                                          'interrupt_line_register' : await self.dut.byte_offset_0C.interrupt_line_register.read(),  # type: ignore[union-attr]
                                          'interrupt_pin_register' : await self.dut.byte_offset_0C.interrupt_pin_register.read()  # type: ignore[union-attr]
                                        }
                read_callback_mock.reset_mock()

                
                async with self.dut.byte_offset_0C.single_read_modify_write(skip_write=True) as reg_context: # type: ignore[union-attr]
                
                    self.assertEqual(reference_read_fields['cache_line_size_register'],
                                      await reg_context.get_child_by_system_rdl_name('cache_line_size_register').read()
                                     )
                    self.assertEqual(reference_read_fields['latency_timer_register'],
                                      await reg_context.get_child_by_system_rdl_name('latency_timer_register').read()
                                     )
                    self.assertEqual(reference_read_fields['interrupt_line_register'],
                                      await reg_context.get_child_by_system_rdl_name('interrupt_line_register').read()
                                     )
                    self.assertEqual(reference_read_fields['interrupt_pin_register'],
                                      await reg_context.get_child_by_system_rdl_name('interrupt_pin_register').read()
                                     )
                    pass

                read_callback_mock.assert_called_once()
                write_callback_mock.assert_not_called()
        # test context manager to register:
        # pcie_config_reg.base_address_register_0
        # build up the register value with a random base value, overlaid with
        # a random value for each field
        with self.subTest(msg='register: pcie_config_reg.base_address_register_0'):
            rand_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFFFE) | (rand_field_value << 0)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x3 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFFF9) | (rand_field_value << 1)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFFF7) | (rand_field_value << 3)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0xFFFFFFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xF) | (rand_field_value << 4)
                        
                    
                
            
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                 patch(base_name + '.read_addr_space', return_value=rand_reg_value) as read_callback_mock:

                # first read the fields using the "normal" method, then compare the result to reading
                # via the context manager
                reference_read_fields = { 
                                          'region_type' : await self.dut.base_address_register_0.region_type.read(),  # type: ignore[union-attr]
                                          'locatable' : await self.dut.base_address_register_0.locatable.read(),  # type: ignore[union-attr]
                                          'prefetchable' : await self.dut.base_address_register_0.prefetchable.read(),  # type: ignore[union-attr]
                                          'base_adress' : await self.dut.base_address_register_0.base_adress.read()  # type: ignore[union-attr]
                                        }
                read_callback_mock.reset_mock()

                
                async with self.dut.base_address_register_0.single_read() as reg_context: # type: ignore[union-attr]
                    self.assertEqual(reference_read_fields['region_type'],
                                      await reg_context.get_child_by_system_rdl_name('region_type').read()
                                     )
                    self.assertEqual(reference_read_fields['locatable'],
                                      await reg_context.get_child_by_system_rdl_name('locatable').read()
                                     )
                    self.assertEqual(reference_read_fields['prefetchable'],
                                      await reg_context.get_child_by_system_rdl_name('prefetchable').read()
                                     )
                    self.assertEqual(reference_read_fields['base_adress'],
                                      await reg_context.get_child_by_system_rdl_name('base_adress').read()
                                     )
                    pass

                read_callback_mock.assert_called_once()
                write_callback_mock.assert_not_called()
        # test context manager to register:
        # pcie_config_reg.base_ddress_register_1
        # build up the register value with a random base value, overlaid with
        # a random value for each field
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_1'):
            rand_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFFFE) | (rand_field_value << 0)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x3 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFFF9) | (rand_field_value << 1)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFFF7) | (rand_field_value << 3)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0xFFFFFFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xF) | (rand_field_value << 4)
                        
                    
                
            
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                 patch(base_name + '.read_addr_space', return_value=rand_reg_value) as read_callback_mock:

                # first read the fields using the "normal" method, then compare the result to reading
                # via the context manager
                reference_read_fields = { 
                                          'region_type' : await self.dut.base_ddress_register_1.region_type.read(),  # type: ignore[union-attr]
                                          'locatable' : await self.dut.base_ddress_register_1.locatable.read(),  # type: ignore[union-attr]
                                          'prefetchable' : await self.dut.base_ddress_register_1.prefetchable.read(),  # type: ignore[union-attr]
                                          'base_adress' : await self.dut.base_ddress_register_1.base_adress.read()  # type: ignore[union-attr]
                                        }
                read_callback_mock.reset_mock()

                
                async with self.dut.base_ddress_register_1.single_read() as reg_context: # type: ignore[union-attr]
                    self.assertEqual(reference_read_fields['region_type'],
                                      await reg_context.get_child_by_system_rdl_name('region_type').read()
                                     )
                    self.assertEqual(reference_read_fields['locatable'],
                                      await reg_context.get_child_by_system_rdl_name('locatable').read()
                                     )
                    self.assertEqual(reference_read_fields['prefetchable'],
                                      await reg_context.get_child_by_system_rdl_name('prefetchable').read()
                                     )
                    self.assertEqual(reference_read_fields['base_adress'],
                                      await reg_context.get_child_by_system_rdl_name('base_adress').read()
                                     )
                    pass

                read_callback_mock.assert_called_once()
                write_callback_mock.assert_not_called()
        # test context manager to register:
        # pcie_config_reg.base_ddress_register_2
        # build up the register value with a random base value, overlaid with
        # a random value for each field
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_2'):
            rand_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                
                    
                        
            rand_field_value = random.randrange(0, 0xFFFFFFFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0x0) | (rand_field_value << 0)
                        
                    
                
            
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                 patch(base_name + '.read_addr_space', return_value=rand_reg_value) as read_callback_mock:

                # first read the fields using the "normal" method, then compare the result to reading
                # via the context manager
                reference_read_fields = { 
                                          'BAR' : await self.dut.base_ddress_register_2.BAR.read()  # type: ignore[union-attr]
                                        }
                read_callback_mock.reset_mock()

                
                async with self.dut.base_ddress_register_2.single_read_modify_write(skip_write=True) as reg_context: # type: ignore[union-attr]
                
                    self.assertEqual(reference_read_fields['BAR'],
                                      await reg_context.get_child_by_system_rdl_name('BAR').read()
                                     )
                    pass

                read_callback_mock.assert_called_once()
                write_callback_mock.assert_not_called()
        # test context manager to register:
        # pcie_config_reg.base_ddress_register_3
        # build up the register value with a random base value, overlaid with
        # a random value for each field
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_3'):
            rand_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                
                    
                        
            rand_field_value = random.randrange(0, 0xFFFFFFFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0x0) | (rand_field_value << 0)
                        
                    
                
            
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                 patch(base_name + '.read_addr_space', return_value=rand_reg_value) as read_callback_mock:

                # first read the fields using the "normal" method, then compare the result to reading
                # via the context manager
                reference_read_fields = { 
                                          'BAR' : await self.dut.base_ddress_register_3.BAR.read()  # type: ignore[union-attr]
                                        }
                read_callback_mock.reset_mock()

                
                async with self.dut.base_ddress_register_3.single_read_modify_write(skip_write=True) as reg_context: # type: ignore[union-attr]
                
                    self.assertEqual(reference_read_fields['BAR'],
                                      await reg_context.get_child_by_system_rdl_name('BAR').read()
                                     )
                    pass

                read_callback_mock.assert_called_once()
                write_callback_mock.assert_not_called()
        # test context manager to register:
        # pcie_config_reg.base_ddress_register_4
        # build up the register value with a random base value, overlaid with
        # a random value for each field
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_4'):
            rand_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                
                    
                        
            rand_field_value = random.randrange(0, 0xFFFFFFFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0x0) | (rand_field_value << 0)
                        
                    
                
            
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                 patch(base_name + '.read_addr_space', return_value=rand_reg_value) as read_callback_mock:

                # first read the fields using the "normal" method, then compare the result to reading
                # via the context manager
                reference_read_fields = { 
                                          'BAR' : await self.dut.base_ddress_register_4.BAR.read()  # type: ignore[union-attr]
                                        }
                read_callback_mock.reset_mock()

                
                async with self.dut.base_ddress_register_4.single_read_modify_write(skip_write=True) as reg_context: # type: ignore[union-attr]
                
                    self.assertEqual(reference_read_fields['BAR'],
                                      await reg_context.get_child_by_system_rdl_name('BAR').read()
                                     )
                    pass

                read_callback_mock.assert_called_once()
                write_callback_mock.assert_not_called()
        # test context manager to register:
        # pcie_config_reg.base_ddress_register_5
        # build up the register value with a random base value, overlaid with
        # a random value for each field
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_5'):
            rand_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                
                    
                        
            rand_field_value = random.randrange(0, 0xFFFFFFFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0x0) | (rand_field_value << 0)
                        
                    
                
            
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                 patch(base_name + '.read_addr_space', return_value=rand_reg_value) as read_callback_mock:

                # first read the fields using the "normal" method, then compare the result to reading
                # via the context manager
                reference_read_fields = { 
                                          'BAR' : await self.dut.base_ddress_register_5.BAR.read()  # type: ignore[union-attr]
                                        }
                read_callback_mock.reset_mock()

                
                async with self.dut.base_ddress_register_5.single_read_modify_write(skip_write=True) as reg_context: # type: ignore[union-attr]
                
                    self.assertEqual(reference_read_fields['BAR'],
                                      await reg_context.get_child_by_system_rdl_name('BAR').read()
                                     )
                    pass

                read_callback_mock.assert_called_once()
                write_callback_mock.assert_not_called()
        # test context manager to register:
        # pcie_config_reg.cardbus_cis_pointer
        # build up the register value with a random base value, overlaid with
        # a random value for each field
        with self.subTest(msg='register: pcie_config_reg.cardbus_cis_pointer'):
            rand_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                
                    
                        
            rand_field_value = random.randrange(0, 0xFFFFFFFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0x0) | (rand_field_value << 0)
                        
                    
                
            
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                 patch(base_name + '.read_addr_space', return_value=rand_reg_value) as read_callback_mock:

                # first read the fields using the "normal" method, then compare the result to reading
                # via the context manager
                reference_read_fields = { 
                                          'word' : await self.dut.cardbus_cis_pointer.word.read()  # type: ignore[union-attr]
                                        }
                read_callback_mock.reset_mock()

                
                async with self.dut.cardbus_cis_pointer.single_read_modify_write(skip_write=True) as reg_context: # type: ignore[union-attr]
                
                    self.assertEqual(reference_read_fields['word'],
                                      await reg_context.get_child_by_system_rdl_name('word').read()
                                     )
                    pass

                read_callback_mock.assert_called_once()
                write_callback_mock.assert_not_called()
        # test context manager to register:
        # pcie_config_reg.byte_offset_2C
        # build up the register value with a random base value, overlaid with
        # a random value for each field
        with self.subTest(msg='register: pcie_config_reg.byte_offset_2C'):
            rand_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                
                    
                        
            rand_field_value = random.randrange(0, 0xFFFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFF0000) | (rand_field_value << 0)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0xFFFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFF) | (rand_field_value << 16)
                        
                    
                
            
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                 patch(base_name + '.read_addr_space', return_value=rand_reg_value) as read_callback_mock:

                # first read the fields using the "normal" method, then compare the result to reading
                # via the context manager
                reference_read_fields = { 
                                          'Vendor_ID' : await self.dut.byte_offset_2C.Vendor_ID.read(),  # type: ignore[union-attr]
                                          'Device_ID' : await self.dut.byte_offset_2C.Device_ID.read()  # type: ignore[union-attr]
                                        }
                read_callback_mock.reset_mock()

                
                async with self.dut.byte_offset_2C.single_read() as reg_context: # type: ignore[union-attr]
                    self.assertEqual(reference_read_fields['Vendor_ID'],
                                      await reg_context.get_child_by_system_rdl_name('Vendor_ID').read()
                                     )
                    self.assertEqual(reference_read_fields['Device_ID'],
                                      await reg_context.get_child_by_system_rdl_name('Device_ID').read()
                                     )
                    pass

                read_callback_mock.assert_called_once()
                write_callback_mock.assert_not_called()
        # test context manager to register:
        # pcie_config_reg.capabilities_pointer
        # build up the register value with a random base value, overlaid with
        # a random value for each field
        with self.subTest(msg='register: pcie_config_reg.capabilities_pointer'):
            rand_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                
                    
                        
            rand_field_value = random.randrange(0, 0xFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFF00) | (rand_field_value << 0)
                        
                    
                
            
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                 patch(base_name + '.read_addr_space', return_value=rand_reg_value) as read_callback_mock:

                # first read the fields using the "normal" method, then compare the result to reading
                # via the context manager
                reference_read_fields = { 
                                          'capabilities_ptr' : await self.dut.capabilities_pointer.capabilities_ptr.read()  # type: ignore[union-attr]
                                        }
                read_callback_mock.reset_mock()

                
                async with self.dut.capabilities_pointer.single_read() as reg_context: # type: ignore[union-attr]
                    self.assertEqual(reference_read_fields['capabilities_ptr'],
                                      await reg_context.get_child_by_system_rdl_name('capabilities_ptr').read()
                                     )
                    pass

                read_callback_mock.assert_called_once()
                write_callback_mock.assert_not_called()
        # test context manager to register:
        # pcie_config_reg.byte_offset_3C
        # build up the register value with a random base value, overlaid with
        # a random value for each field
        with self.subTest(msg='register: pcie_config_reg.byte_offset_3C'):
            rand_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                
                    
                        
            rand_field_value = random.randrange(0, 0xFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFF00) | (rand_field_value << 0)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0xFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFF00FF) | (rand_field_value << 8)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0xFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFF00FFFF) | (rand_field_value << 16)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0xFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFF) | (rand_field_value << 24)
                        
                    
                
            
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                 patch(base_name + '.read_addr_space', return_value=rand_reg_value) as read_callback_mock:

                # first read the fields using the "normal" method, then compare the result to reading
                # via the context manager
                reference_read_fields = { 
                                          'interrupt_line' : await self.dut.byte_offset_3C.interrupt_line.read(),  # type: ignore[union-attr]
                                          'interrupt_pin' : await self.dut.byte_offset_3C.interrupt_pin.read(),  # type: ignore[union-attr]
                                          'min_gnt' : await self.dut.byte_offset_3C.min_gnt.read(),  # type: ignore[union-attr]
                                          'max_lat' : await self.dut.byte_offset_3C.max_lat.read()  # type: ignore[union-attr]
                                        }
                read_callback_mock.reset_mock()

                
                async with self.dut.byte_offset_3C.single_read_modify_write(skip_write=True) as reg_context: # type: ignore[union-attr]
                
                    self.assertEqual(reference_read_fields['interrupt_line'],
                                      await reg_context.get_child_by_system_rdl_name('interrupt_line').read()
                                     )
                    self.assertEqual(reference_read_fields['interrupt_pin'],
                                      await reg_context.get_child_by_system_rdl_name('interrupt_pin').read()
                                     )
                    self.assertEqual(reference_read_fields['min_gnt'],
                                      await reg_context.get_child_by_system_rdl_name('min_gnt').read()
                                     )
                    self.assertEqual(reference_read_fields['max_lat'],
                                      await reg_context.get_child_by_system_rdl_name('max_lat').read()
                                     )
                    pass

                read_callback_mock.assert_called_once()
                write_callback_mock.assert_not_called()
        # test context manager to register:
        # pcie_config_reg.capabilities_power_mngt_pointer
        # build up the register value with a random base value, overlaid with
        # a random value for each field
        with self.subTest(msg='register: pcie_config_reg.capabilities_power_mngt_pointer'):
            rand_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                
                    
                        
            rand_field_value = random.randrange(0, 0xFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFF00) | (rand_field_value << 0)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0xFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFF00FF) | (rand_field_value << 8)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x7 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFF8FFFF) | (rand_field_value << 16)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFF7FFFF) | (rand_field_value << 19)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFDFFFFF) | (rand_field_value << 21)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x7 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFE3FFFFF) | (rand_field_value << 22)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFDFFFFFF) | (rand_field_value << 25)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFBFFFFFF) | (rand_field_value << 26)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1F + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0x7FFFFFF) | (rand_field_value << 27)
                        
                    
                
            
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                 patch(base_name + '.read_addr_space', return_value=rand_reg_value) as read_callback_mock:

                # first read the fields using the "normal" method, then compare the result to reading
                # via the context manager
                reference_read_fields = { 
                                          'capabilities_id' : await self.dut.capabilities_power_mngt_pointer.capabilities_id.read(),  # type: ignore[union-attr]
                                          'next_cap_ptr' : await self.dut.capabilities_power_mngt_pointer.next_cap_ptr.read(),  # type: ignore[union-attr]
                                          'version' : await self.dut.capabilities_power_mngt_pointer.version.read(),  # type: ignore[union-attr]
                                          'pme_clock' : await self.dut.capabilities_power_mngt_pointer.pme_clock.read(),  # type: ignore[union-attr]
                                          'dev_spec_init' : await self.dut.capabilities_power_mngt_pointer.dev_spec_init.read(),  # type: ignore[union-attr]
                                          'aux_current' : await self.dut.capabilities_power_mngt_pointer.aux_current.read(),  # type: ignore[union-attr]
                                          'd1_support' : await self.dut.capabilities_power_mngt_pointer.d1_support.read(),  # type: ignore[union-attr]
                                          'd2_support' : await self.dut.capabilities_power_mngt_pointer.d2_support.read(),  # type: ignore[union-attr]
                                          'pme_support' : await self.dut.capabilities_power_mngt_pointer.pme_support.read()  # type: ignore[union-attr]
                                        }
                read_callback_mock.reset_mock()

                
                async with self.dut.capabilities_power_mngt_pointer.single_read_modify_write(skip_write=True) as reg_context: # type: ignore[union-attr]
                
                    self.assertEqual(reference_read_fields['capabilities_id'],
                                      await reg_context.get_child_by_system_rdl_name('capabilities_id').read()
                                     )
                    self.assertEqual(reference_read_fields['next_cap_ptr'],
                                      await reg_context.get_child_by_system_rdl_name('next_cap_ptr').read()
                                     )
                    self.assertEqual(reference_read_fields['version'],
                                      await reg_context.get_child_by_system_rdl_name('version').read()
                                     )
                    self.assertEqual(reference_read_fields['pme_clock'],
                                      await reg_context.get_child_by_system_rdl_name('pme_clock').read()
                                     )
                    self.assertEqual(reference_read_fields['dev_spec_init'],
                                      await reg_context.get_child_by_system_rdl_name('dev_spec_init').read()
                                     )
                    self.assertEqual(reference_read_fields['aux_current'],
                                      await reg_context.get_child_by_system_rdl_name('aux_current').read()
                                     )
                    self.assertEqual(reference_read_fields['d1_support'],
                                      await reg_context.get_child_by_system_rdl_name('d1_support').read()
                                     )
                    self.assertEqual(reference_read_fields['d2_support'],
                                      await reg_context.get_child_by_system_rdl_name('d2_support').read()
                                     )
                    self.assertEqual(reference_read_fields['pme_support'],
                                      await reg_context.get_child_by_system_rdl_name('pme_support').read()
                                     )
                    pass

                read_callback_mock.assert_called_once()
                write_callback_mock.assert_not_called()
        # test context manager to register:
        # pcie_config_reg.power_management_pointer
        # build up the register value with a random base value, overlaid with
        # a random value for each field
        with self.subTest(msg='register: pcie_config_reg.power_management_pointer'):
            rand_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                
                    
                        
            rand_field_value = random.randrange(0, 0x3 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFFFC) | (rand_field_value << 0)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFFF7) | (rand_field_value << 3)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0xF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFE1FF) | (rand_field_value << 9)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x3 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFF9FFF) | (rand_field_value << 13)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFF7FFF) | (rand_field_value << 15)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFBFFFFF) | (rand_field_value << 22)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFF7FFFFF) | (rand_field_value << 23)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0xFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFF) | (rand_field_value << 24)
                        
                    
                
            
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                 patch(base_name + '.read_addr_space', return_value=rand_reg_value) as read_callback_mock:

                # first read the fields using the "normal" method, then compare the result to reading
                # via the context manager
                reference_read_fields = { 
                                          'power_state' : await self.dut.power_management_pointer.power_state.read(),  # type: ignore[union-attr]
                                          'pme_enable' : await self.dut.power_management_pointer.pme_enable.read(),  # type: ignore[union-attr]
                                          'data_select' : await self.dut.power_management_pointer.data_select.read(),  # type: ignore[union-attr]
                                          'data_scale' : await self.dut.power_management_pointer.data_scale.read(),  # type: ignore[union-attr]
                                          'pme_status' : await self.dut.power_management_pointer.pme_status.read(),  # type: ignore[union-attr]
                                          'b2_b3_support' : await self.dut.power_management_pointer.b2_b3_support.read(),  # type: ignore[union-attr]
                                          'bus_pwr_clk_ctrl_en' : await self.dut.power_management_pointer.bus_pwr_clk_ctrl_en.read(),  # type: ignore[union-attr]
                                          'data' : await self.dut.power_management_pointer.data.read()  # type: ignore[union-attr]
                                        }
                read_callback_mock.reset_mock()

                
                async with self.dut.power_management_pointer.single_read_modify_write(skip_write=True) as reg_context: # type: ignore[union-attr]
                
                    self.assertEqual(reference_read_fields['power_state'],
                                      await reg_context.get_child_by_system_rdl_name('power_state').read()
                                     )
                    self.assertEqual(reference_read_fields['pme_enable'],
                                      await reg_context.get_child_by_system_rdl_name('pme_enable').read()
                                     )
                    self.assertEqual(reference_read_fields['data_select'],
                                      await reg_context.get_child_by_system_rdl_name('data_select').read()
                                     )
                    self.assertEqual(reference_read_fields['data_scale'],
                                      await reg_context.get_child_by_system_rdl_name('data_scale').read()
                                     )
                    self.assertEqual(reference_read_fields['pme_status'],
                                      await reg_context.get_child_by_system_rdl_name('pme_status').read()
                                     )
                    self.assertEqual(reference_read_fields['b2_b3_support'],
                                      await reg_context.get_child_by_system_rdl_name('b2_b3_support').read()
                                     )
                    self.assertEqual(reference_read_fields['bus_pwr_clk_ctrl_en'],
                                      await reg_context.get_child_by_system_rdl_name('bus_pwr_clk_ctrl_en').read()
                                     )
                    self.assertEqual(reference_read_fields['data'],
                                      await reg_context.get_child_by_system_rdl_name('data').read()
                                     )
                    pass

                read_callback_mock.assert_called_once()
                write_callback_mock.assert_not_called()
        # test context manager to register:
        # pcie_config_reg.capabilities_power_na_pointer
        # build up the register value with a random base value, overlaid with
        # a random value for each field
        with self.subTest(msg='register: pcie_config_reg.capabilities_power_na_pointer'):
            rand_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                
                    
                        
            rand_field_value = random.randrange(0, 0xFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFF00) | (rand_field_value << 0)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0xFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFF00FF) | (rand_field_value << 8)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0xF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFF0FFFF) | (rand_field_value << 16)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0xF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFF0FFFFF) | (rand_field_value << 20)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFEFFFFFF) | (rand_field_value << 24)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1F + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xC1FFFFFF) | (rand_field_value << 25)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xBFFFFFFF) | (rand_field_value << 30)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0x7FFFFFFF) | (rand_field_value << 31)
                        
                    
                
            
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                 patch(base_name + '.read_addr_space', return_value=rand_reg_value) as read_callback_mock:

                # first read the fields using the "normal" method, then compare the result to reading
                # via the context manager
                reference_read_fields = { 
                                          'capabilities_id' : await self.dut.capabilities_power_na_pointer.capabilities_id.read(),  # type: ignore[union-attr]
                                          'next_cap_ptr' : await self.dut.capabilities_power_na_pointer.next_cap_ptr.read(),  # type: ignore[union-attr]
                                          'capability_version' : await self.dut.capabilities_power_na_pointer.capability_version.read(),  # type: ignore[union-attr]
                                          'device_port_type' : await self.dut.capabilities_power_na_pointer.device_port_type.read(),  # type: ignore[union-attr]
                                          'slot_implemented' : await self.dut.capabilities_power_na_pointer.slot_implemented.read(),  # type: ignore[union-attr]
                                          'interrupt_msg_number' : await self.dut.capabilities_power_na_pointer.interrupt_msg_number.read(),  # type: ignore[union-attr]
                                          'Undefined' : await self.dut.capabilities_power_na_pointer.Undefined.read(),  # type: ignore[union-attr]
                                          'RsvdP' : await self.dut.capabilities_power_na_pointer.RsvdP.read()  # type: ignore[union-attr]
                                        }
                read_callback_mock.reset_mock()

                
                async with self.dut.capabilities_power_na_pointer.single_read() as reg_context: # type: ignore[union-attr]
                    self.assertEqual(reference_read_fields['capabilities_id'],
                                      await reg_context.get_child_by_system_rdl_name('capabilities_id').read()
                                     )
                    self.assertEqual(reference_read_fields['next_cap_ptr'],
                                      await reg_context.get_child_by_system_rdl_name('next_cap_ptr').read()
                                     )
                    self.assertEqual(reference_read_fields['capability_version'],
                                      await reg_context.get_child_by_system_rdl_name('capability_version').read()
                                     )
                    self.assertEqual(reference_read_fields['device_port_type'],
                                      await reg_context.get_child_by_system_rdl_name('device_port_type').read()
                                     )
                    self.assertEqual(reference_read_fields['slot_implemented'],
                                      await reg_context.get_child_by_system_rdl_name('slot_implemented').read()
                                     )
                    self.assertEqual(reference_read_fields['interrupt_msg_number'],
                                      await reg_context.get_child_by_system_rdl_name('interrupt_msg_number').read()
                                     )
                    self.assertEqual(reference_read_fields['Undefined'],
                                      await reg_context.get_child_by_system_rdl_name('Undefined').read()
                                     )
                    self.assertEqual(reference_read_fields['RsvdP'],
                                      await reg_context.get_child_by_system_rdl_name('RsvdP').read()
                                     )
                    pass

                read_callback_mock.assert_called_once()
                write_callback_mock.assert_not_called()
        # test context manager to register:
        # pcie_config_reg.link_control_3_register
        # build up the register value with a random base value, overlaid with
        # a random value for each field
        with self.subTest(msg='register: pcie_config_reg.link_control_3_register'):
            rand_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFFFE) | (rand_field_value << 0)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x1 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFFFD) | (rand_field_value << 1)
                        
                    
                
            
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                 patch(base_name + '.read_addr_space', return_value=rand_reg_value) as read_callback_mock:

                # first read the fields using the "normal" method, then compare the result to reading
                # via the context manager
                reference_read_fields = { 
                                          'perform_equalization' : await self.dut.link_control_3_register.perform_equalization.read(),  # type: ignore[union-attr]
                                          'link_eq_req_intr_en' : await self.dut.link_control_3_register.link_eq_req_intr_en.read()  # type: ignore[union-attr]
                                        }
                read_callback_mock.reset_mock()

                
                async with self.dut.link_control_3_register.single_read_modify_write(skip_write=True) as reg_context: # type: ignore[union-attr]
                
                    self.assertEqual(reference_read_fields['perform_equalization'],
                                      await reg_context.get_child_by_system_rdl_name('perform_equalization').read()
                                     )
                    self.assertEqual(reference_read_fields['link_eq_req_intr_en'],
                                      await reg_context.get_child_by_system_rdl_name('link_eq_req_intr_en').read()
                                     )
                    pass

                read_callback_mock.assert_called_once()
                write_callback_mock.assert_not_called()
        # test context manager to register:
        # pcie_config_reg.lane_error_status_register
        # build up the register value with a random base value, overlaid with
        # a random value for each field
        with self.subTest(msg='register: pcie_config_reg.lane_error_status_register'):
            rand_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                
                    
                        
            rand_field_value = random.randrange(0, 0x1F + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFFE0) | (rand_field_value << 0)
                        
                    
                
            
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                 patch(base_name + '.read_addr_space', return_value=rand_reg_value) as read_callback_mock:

                # first read the fields using the "normal" method, then compare the result to reading
                # via the context manager
                reference_read_fields = { 
                                          'lane_error' : await self.dut.lane_error_status_register.lane_error.read()  # type: ignore[union-attr]
                                        }
                read_callback_mock.reset_mock()

                
                async with self.dut.lane_error_status_register.single_read_modify_write(skip_write=True) as reg_context: # type: ignore[union-attr]
                
                    self.assertEqual(reference_read_fields['lane_error'],
                                      await reg_context.get_child_by_system_rdl_name('lane_error').read()
                                     )
                    pass

                read_callback_mock.assert_called_once()
                write_callback_mock.assert_not_called()
        # test context manager to register:
        # pcie_config_reg.lane_eq_ctrl_register
        # build up the register value with a random base value, overlaid with
        # a random value for each field
        with self.subTest(msg='register: pcie_config_reg.lane_eq_ctrl_register'):
            rand_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                
                    
                        
            rand_field_value = random.randrange(0, 0xF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFFF0) | (rand_field_value << 0)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x7 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFFF8F) | (rand_field_value << 4)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0xF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFFF0FF) | (rand_field_value << 8)
                        
                    
                
            
                
                    
                        
            rand_field_value = random.randrange(0, 0x7 + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0xFFFF8FFF) | (rand_field_value << 12)
                        
                    
                
            
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                 patch(base_name + '.read_addr_space', return_value=rand_reg_value) as read_callback_mock:

                # first read the fields using the "normal" method, then compare the result to reading
                # via the context manager
                reference_read_fields = { 
                                          'downstream_tx_preset' : await self.dut.lane_eq_ctrl_register.downstream_tx_preset.read(),  # type: ignore[union-attr]
                                          'downstream_rx_preset_hint' : await self.dut.lane_eq_ctrl_register.downstream_rx_preset_hint.read(),  # type: ignore[union-attr]
                                          'upstream_tx_preset' : await self.dut.lane_eq_ctrl_register.upstream_tx_preset.read(),  # type: ignore[union-attr]
                                          'upstream_rx_preset_hint' : await self.dut.lane_eq_ctrl_register.upstream_rx_preset_hint.read()  # type: ignore[union-attr]
                                        }
                read_callback_mock.reset_mock()

                
                async with self.dut.lane_eq_ctrl_register.single_read_modify_write(skip_write=True) as reg_context: # type: ignore[union-attr]
                
                    self.assertEqual(reference_read_fields['downstream_tx_preset'],
                                      await reg_context.get_child_by_system_rdl_name('downstream_tx_preset').read()
                                     )
                    self.assertEqual(reference_read_fields['downstream_rx_preset_hint'],
                                      await reg_context.get_child_by_system_rdl_name('downstream_rx_preset_hint').read()
                                     )
                    self.assertEqual(reference_read_fields['upstream_tx_preset'],
                                      await reg_context.get_child_by_system_rdl_name('upstream_tx_preset').read()
                                     )
                    self.assertEqual(reference_read_fields['upstream_rx_preset_hint'],
                                      await reg_context.get_child_by_system_rdl_name('upstream_rx_preset_hint').read()
                                     )
                    pass

                read_callback_mock.assert_called_once()
                write_callback_mock.assert_not_called()
        # test context manager to register:
        # pcie_config_reg.extended_capabilities
        # build up the register value with a random base value, overlaid with
        # a random value for each field
        with self.subTest(msg='register: pcie_config_reg.extended_capabilities'):
            rand_reg_value = random.randrange(0, 0xFFFFFFFF + 1)
                
                    
                        
            rand_field_value = random.randrange(0, 0xFFFFFFFF + 1)
                        
                        
            rand_reg_value = (rand_reg_value & 0x0) | (rand_field_value << 0)
                        
                    
                
            
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                 patch(base_name + '.read_addr_space', return_value=rand_reg_value) as read_callback_mock:

                # first read the fields using the "normal" method, then compare the result to reading
                # via the context manager
                reference_read_fields = { 
                                          'ext_cap' : await self.dut.extended_capabilities.ext_cap.read()  # type: ignore[union-attr]
                                        }
                read_callback_mock.reset_mock()

                
                async with self.dut.extended_capabilities.single_read() as reg_context: # type: ignore[union-attr]
                    self.assertEqual(reference_read_fields['ext_cap'],
                                      await reg_context.get_child_by_system_rdl_name('ext_cap').read()
                                     )
                    pass

                read_callback_mock.assert_called_once()
                write_callback_mock.assert_not_called()

    async def test_register_write_context_manager(self) -> None:
        """
        Test the read modify write context manager
        """
        rut:RegAsyncReadWrite
        async def write_field_cominbinations(reg: RegAsyncReadWrite, writable_fields:list[str]) -> None:
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:
                for num_parm in range(1, len(writable_fields) + 1):
                    for fields_to_write in combinations(writable_fields, num_parm):
                        field_values: dict[str, Union[bool, SystemRDLEnum, int]] = {}
                        expected_value = 0
                        for field_str in fields_to_write:
                            field = getattr(reg, field_str)
                            if hasattr(field, 'enum_cls'):
                                rand_enum_value = random_enum_reg_value(field.enum_cls)
                                rand_field_value = rand_enum_value.value
                                field_values[field_str] = rand_enum_value
                            else:
                                rand_field_value = random.randrange(0, field.max_value + 1)
                                field_values[field_str] = rand_field_value

                            if field.msb == field.high:
                                expected_value = ( expected_value & field.inverse_bitmask ) | (rand_field_value << field.low)
                            elif field.msb == field.low:
                                expected_value = ( expected_value & field.inverse_bitmask ) | (self._reverse_bits(value=rand_field_value, number_bits=field.width) << field.low)
                            else:
                                raise RuntimeError('invalid msb/lsb high/low combination')

                        # read/write without verify
                        read_callback_mock.return_value = 0
                        async with reg.single_read_modify_write(verify=False) as reg_session:
                            for field_name, field_value in field_values.items():
                                field = getattr(reg_session, field_name)
                                await field.write(field_value)

                        write_callback_mock.assert_called_once_with(
                                addr=reg.address,
                                width=reg.width,
                                accesswidth=reg.accesswidth,
                                data=expected_value)
                        read_callback_mock.assert_called_once()
                        write_callback_mock.reset_mock()
                        read_callback_mock.reset_mock()

                        # read/write/verify pass
                        async with reg.single_read_modify_write(verify=True) as reg_session:
                            for field_name, field_value in field_values.items():
                                field = getattr(reg_session, field_name)
                                await field.write(field_value)
                            read_callback_mock.return_value = expected_value

                        write_callback_mock.assert_called_once_with(
                                addr=reg.address,
                                width=reg.width,
                                accesswidth=reg.accesswidth,
                                data=expected_value)
                        self.assertEqual(read_callback_mock.call_count, 2)
                        write_callback_mock.reset_mock()
                        read_callback_mock.reset_mock()

                        # read/write/verify pass
                        with self.assertRaises(RegisterWriteVerifyError) as context:
                            async with reg.single_read_modify_write(verify=True) as reg_session:
                                for field_name, field_value in field_values.items():
                                    field = getattr(reg_session, field_name)
                                    await field.write(field_value)
                                read_callback_mock.return_value = expected_value ^ reg_session.max_value

                        write_callback_mock.reset_mock()
                        read_callback_mock.reset_mock()

        
        with self.subTest(msg='register: pcie_config_reg.byte_offset_04'):
            rut = self.dut.byte_offset_04 # type: ignore[union-attr,assignment]
            if not isinstance(rut, RegAsyncReadWrite):
                raise TypeError('Failed to find read/write register')
            await write_field_cominbinations(reg=rut,
                               writable_fields = [ 'bus_master_enable',
                                                   'special_cycle_enable',
                                                   'memory_write_invalidate',
                                                   'vga_palette_snoop',
                                                   'parity_error_response',
                                                   'idsel_step_wait_cycle_control',
                                                   'SERR_Enable',
                                                   'fast_b2b_transactions_enable',
                                                   'interrupt_disable',
                                                   'rsvd',
                                                   'interrupt_status',
                                                   'capabilities_list',
                                                   'sixtysix_mhz_capable',
                                                   'fast_b2b_transactions_capable',
                                                   'master_data_parity_error',
                                                   'devsel_timing',
                                                   'signaled_target_abort',
                                                   'received_target_abort',
                                                   'received_master_abort',
                                                   'signaled_system_error',
                                                   'detected_parity_error'
                                                   ])
        with self.subTest(msg='register: pcie_config_reg.byte_offset_0C'):
            rut = self.dut.byte_offset_0C # type: ignore[union-attr,assignment]
            if not isinstance(rut, RegAsyncReadWrite):
                raise TypeError('Failed to find read/write register')
            await write_field_cominbinations(reg=rut,
                               writable_fields = [ 'cache_line_size_register',
                                                   'latency_timer_register',
                                                   'interrupt_line_register',
                                                   'interrupt_pin_register'
                                                   ])
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_2'):
            rut = self.dut.base_ddress_register_2 # type: ignore[union-attr,assignment]
            if not isinstance(rut, RegAsyncReadWrite):
                raise TypeError('Failed to find read/write register')
            await write_field_cominbinations(reg=rut,
                               writable_fields = [ 'BAR'
                                                   ])
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_3'):
            rut = self.dut.base_ddress_register_3 # type: ignore[union-attr,assignment]
            if not isinstance(rut, RegAsyncReadWrite):
                raise TypeError('Failed to find read/write register')
            await write_field_cominbinations(reg=rut,
                               writable_fields = [ 'BAR'
                                                   ])
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_4'):
            rut = self.dut.base_ddress_register_4 # type: ignore[union-attr,assignment]
            if not isinstance(rut, RegAsyncReadWrite):
                raise TypeError('Failed to find read/write register')
            await write_field_cominbinations(reg=rut,
                               writable_fields = [ 'BAR'
                                                   ])
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_5'):
            rut = self.dut.base_ddress_register_5 # type: ignore[union-attr,assignment]
            if not isinstance(rut, RegAsyncReadWrite):
                raise TypeError('Failed to find read/write register')
            await write_field_cominbinations(reg=rut,
                               writable_fields = [ 'BAR'
                                                   ])
        with self.subTest(msg='register: pcie_config_reg.cardbus_cis_pointer'):
            rut = self.dut.cardbus_cis_pointer # type: ignore[union-attr,assignment]
            if not isinstance(rut, RegAsyncReadWrite):
                raise TypeError('Failed to find read/write register')
            await write_field_cominbinations(reg=rut,
                               writable_fields = [ 'word'
                                                   ])
        with self.subTest(msg='register: pcie_config_reg.byte_offset_3C'):
            rut = self.dut.byte_offset_3C # type: ignore[union-attr,assignment]
            if not isinstance(rut, RegAsyncReadWrite):
                raise TypeError('Failed to find read/write register')
            await write_field_cominbinations(reg=rut,
                               writable_fields = [ 'interrupt_line',
                                                   'interrupt_pin'
                                                   ])
        with self.subTest(msg='register: pcie_config_reg.capabilities_power_mngt_pointer'):
            rut = self.dut.capabilities_power_mngt_pointer # type: ignore[union-attr,assignment]
            if not isinstance(rut, RegAsyncReadWrite):
                raise TypeError('Failed to find read/write register')
            await write_field_cominbinations(reg=rut,
                               writable_fields = [ 'version',
                                                   'pme_clock',
                                                   'dev_spec_init',
                                                   'aux_current',
                                                   'd1_support',
                                                   'd2_support',
                                                   'pme_support'
                                                   ])
        with self.subTest(msg='register: pcie_config_reg.power_management_pointer'):
            rut = self.dut.power_management_pointer # type: ignore[union-attr,assignment]
            if not isinstance(rut, RegAsyncReadWrite):
                raise TypeError('Failed to find read/write register')
            await write_field_cominbinations(reg=rut,
                               writable_fields = [ 'power_state',
                                                   'pme_enable',
                                                   'data_select',
                                                   'data_scale',
                                                   'pme_status',
                                                   'b2_b3_support',
                                                   'bus_pwr_clk_ctrl_en',
                                                   'data'
                                                   ])
        with self.subTest(msg='register: pcie_config_reg.link_control_3_register'):
            rut = self.dut.link_control_3_register # type: ignore[union-attr,assignment]
            if not isinstance(rut, RegAsyncReadWrite):
                raise TypeError('Failed to find read/write register')
            await write_field_cominbinations(reg=rut,
                               writable_fields = [ 'perform_equalization',
                                                   'link_eq_req_intr_en'
                                                   ])
        with self.subTest(msg='register: pcie_config_reg.lane_error_status_register'):
            rut = self.dut.lane_error_status_register # type: ignore[union-attr,assignment]
            if not isinstance(rut, RegAsyncReadWrite):
                raise TypeError('Failed to find read/write register')
            await write_field_cominbinations(reg=rut,
                               writable_fields = [ 'lane_error'
                                                   ])
        with self.subTest(msg='register: pcie_config_reg.lane_eq_ctrl_register'):
            rut = self.dut.lane_eq_ctrl_register # type: ignore[union-attr,assignment]
            if not isinstance(rut, RegAsyncReadWrite):
                raise TypeError('Failed to find read/write register')
            await write_field_cominbinations(reg=rut,
                               writable_fields = [ 'downstream_tx_preset',
                                                   'downstream_rx_preset_hint',
                                                   'upstream_tx_preset',
                                                   'upstream_rx_preset_hint'
                                                   ])

    async def test_register_write_fields(self) -> None:
        """
        Walk the register map and check every register write_fields method
        """
        rut:RegAsyncReadWrite
        rand_enum_value:SystemRDLEnum
        async def write_field_cominbinations(reg: RegAsyncReadWrite, writable_fields:list[str]) -> None:
            with patch(base_name + '.write_addr_space') as write_callback_mock, \
                patch(base_name + '.read_addr_space', return_value=0) as read_callback_mock:
                for num_parm in range(1, len(writable_fields) + 1):
                    for fields_to_write in combinations(writable_fields, num_parm):
                        kwargs: dict[str, Union[bool, SystemRDLEnum, int]] = {}
                        expected_value = 0
                        for field_str in fields_to_write:
                            field = getattr(reg, field_str)
                            if hasattr(field, 'enum_cls'):
                                rand_enum_value = random_enum_reg_value(field.enum_cls)
                                rand_field_value = rand_enum_value.value
                                kwargs[field_str] = rand_enum_value
                            else:
                                rand_field_value = random.randrange(0, field.max_value + 1)
                                kwargs[field_str] = rand_field_value

                            if field.msb == field.high:
                                expected_value = ( expected_value & field.inverse_bitmask ) | (rand_field_value << field.low)
                            elif field.msb == field.low:
                                expected_value = ( expected_value & field.inverse_bitmask ) | (self._reverse_bits(value=rand_field_value, number_bits=field.width) << field.low)
                            else:
                                raise RuntimeError('invalid msb/lsb high/low combination')

                        await reg.write_fields(**kwargs)
                        write_callback_mock.assert_called_once_with(
                                addr=reg.address,
                                width=reg.width,
                                accesswidth=reg.accesswidth,
                                data=expected_value)
                        read_callback_mock.assert_called_once()
                        write_callback_mock.reset_mock()
                        read_callback_mock.reset_mock()


        
        with self.subTest(msg='register: pcie_config_reg.byte_offset_04'):
            # test read_fields to register:
            # pcie_config_reg.byte_offset_04


            
            rut = self.dut.byte_offset_04 # type: ignore[union-attr,assignment]
            if not isinstance(rut, RegAsyncReadWrite):
                raise TypeError('Failed to find read/write register')
            await write_field_cominbinations(reg=rut,
                                       writable_fields = [ 'bus_master_enable',
                                                           'special_cycle_enable',
                                                           'memory_write_invalidate',
                                                           'vga_palette_snoop',
                                                           'parity_error_response',
                                                           'idsel_step_wait_cycle_control',
                                                           'SERR_Enable',
                                                           'fast_b2b_transactions_enable',
                                                           'interrupt_disable',
                                                           'rsvd',
                                                           'interrupt_status',
                                                           'capabilities_list',
                                                           'sixtysix_mhz_capable',
                                                           'fast_b2b_transactions_capable',
                                                           'master_data_parity_error',
                                                           'devsel_timing',
                                                           'signaled_target_abort',
                                                           'received_target_abort',
                                                           'received_master_abort',
                                                           'signaled_system_error',
                                                           'detected_parity_error'
                                                           ])
            
        with self.subTest(msg='register: pcie_config_reg.byte_offset_0C'):
            # test read_fields to register:
            # pcie_config_reg.byte_offset_0C


            
            rut = self.dut.byte_offset_0C # type: ignore[union-attr,assignment]
            if not isinstance(rut, RegAsyncReadWrite):
                raise TypeError('Failed to find read/write register')
            await write_field_cominbinations(reg=rut,
                                       writable_fields = [ 'cache_line_size_register',
                                                           'latency_timer_register',
                                                           'interrupt_line_register',
                                                           'interrupt_pin_register'
                                                           ])
            
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_2'):
            # test read_fields to register:
            # pcie_config_reg.base_ddress_register_2


            
            rut = self.dut.base_ddress_register_2 # type: ignore[union-attr,assignment]
            if not isinstance(rut, RegAsyncReadWrite):
                raise TypeError('Failed to find read/write register')
            await write_field_cominbinations(reg=rut,
                                       writable_fields = [ 'BAR'
                                                           ])
            
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_3'):
            # test read_fields to register:
            # pcie_config_reg.base_ddress_register_3


            
            rut = self.dut.base_ddress_register_3 # type: ignore[union-attr,assignment]
            if not isinstance(rut, RegAsyncReadWrite):
                raise TypeError('Failed to find read/write register')
            await write_field_cominbinations(reg=rut,
                                       writable_fields = [ 'BAR'
                                                           ])
            
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_4'):
            # test read_fields to register:
            # pcie_config_reg.base_ddress_register_4


            
            rut = self.dut.base_ddress_register_4 # type: ignore[union-attr,assignment]
            if not isinstance(rut, RegAsyncReadWrite):
                raise TypeError('Failed to find read/write register')
            await write_field_cominbinations(reg=rut,
                                       writable_fields = [ 'BAR'
                                                           ])
            
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_5'):
            # test read_fields to register:
            # pcie_config_reg.base_ddress_register_5


            
            rut = self.dut.base_ddress_register_5 # type: ignore[union-attr,assignment]
            if not isinstance(rut, RegAsyncReadWrite):
                raise TypeError('Failed to find read/write register')
            await write_field_cominbinations(reg=rut,
                                       writable_fields = [ 'BAR'
                                                           ])
            
        with self.subTest(msg='register: pcie_config_reg.cardbus_cis_pointer'):
            # test read_fields to register:
            # pcie_config_reg.cardbus_cis_pointer


            
            rut = self.dut.cardbus_cis_pointer # type: ignore[union-attr,assignment]
            if not isinstance(rut, RegAsyncReadWrite):
                raise TypeError('Failed to find read/write register')
            await write_field_cominbinations(reg=rut,
                                       writable_fields = [ 'word'
                                                           ])
            
        with self.subTest(msg='register: pcie_config_reg.byte_offset_3C'):
            # test read_fields to register:
            # pcie_config_reg.byte_offset_3C


            
            rut = self.dut.byte_offset_3C # type: ignore[union-attr,assignment]
            if not isinstance(rut, RegAsyncReadWrite):
                raise TypeError('Failed to find read/write register')
            await write_field_cominbinations(reg=rut,
                                       writable_fields = [ 'interrupt_line',
                                                           'interrupt_pin'
                                                           ])
            
        with self.subTest(msg='register: pcie_config_reg.capabilities_power_mngt_pointer'):
            # test read_fields to register:
            # pcie_config_reg.capabilities_power_mngt_pointer


            
            rut = self.dut.capabilities_power_mngt_pointer # type: ignore[union-attr,assignment]
            if not isinstance(rut, RegAsyncReadWrite):
                raise TypeError('Failed to find read/write register')
            await write_field_cominbinations(reg=rut,
                                       writable_fields = [ 'version',
                                                           'pme_clock',
                                                           'dev_spec_init',
                                                           'aux_current',
                                                           'd1_support',
                                                           'd2_support',
                                                           'pme_support'
                                                           ])
            
        with self.subTest(msg='register: pcie_config_reg.power_management_pointer'):
            # test read_fields to register:
            # pcie_config_reg.power_management_pointer


            
            rut = self.dut.power_management_pointer # type: ignore[union-attr,assignment]
            if not isinstance(rut, RegAsyncReadWrite):
                raise TypeError('Failed to find read/write register')
            await write_field_cominbinations(reg=rut,
                                       writable_fields = [ 'power_state',
                                                           'pme_enable',
                                                           'data_select',
                                                           'data_scale',
                                                           'pme_status',
                                                           'b2_b3_support',
                                                           'bus_pwr_clk_ctrl_en',
                                                           'data'
                                                           ])
            
        with self.subTest(msg='register: pcie_config_reg.link_control_3_register'):
            # test read_fields to register:
            # pcie_config_reg.link_control_3_register


            
            rut = self.dut.link_control_3_register # type: ignore[union-attr,assignment]
            if not isinstance(rut, RegAsyncReadWrite):
                raise TypeError('Failed to find read/write register')
            await write_field_cominbinations(reg=rut,
                                       writable_fields = [ 'perform_equalization',
                                                           'link_eq_req_intr_en'
                                                           ])
            
        with self.subTest(msg='register: pcie_config_reg.lane_error_status_register'):
            # test read_fields to register:
            # pcie_config_reg.lane_error_status_register


            
            rut = self.dut.lane_error_status_register # type: ignore[union-attr,assignment]
            if not isinstance(rut, RegAsyncReadWrite):
                raise TypeError('Failed to find read/write register')
            await write_field_cominbinations(reg=rut,
                                       writable_fields = [ 'lane_error'
                                                           ])
            
        with self.subTest(msg='register: pcie_config_reg.lane_eq_ctrl_register'):
            # test read_fields to register:
            # pcie_config_reg.lane_eq_ctrl_register


            
            rut = self.dut.lane_eq_ctrl_register # type: ignore[union-attr,assignment]
            if not isinstance(rut, RegAsyncReadWrite):
                raise TypeError('Failed to find read/write register')
            await write_field_cominbinations(reg=rut,
                                       writable_fields = [ 'downstream_tx_preset',
                                                           'downstream_rx_preset_hint',
                                                           'upstream_tx_preset',
                                                           'upstream_rx_preset_hint'
                                                           ])
            

    

    def test_adding_attributes(self) -> None:
        """
        Walk the address map and attempt to set a new value on each node

        The attribute name: cppkbrgmgeloagvfgjjeiiushygirh was randomly generated to be unlikely to
        every be a attribute name

        """
        with self.subTest(msg='node: pcie_config_reg.byte_offset_00'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.byte_offset_00.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_04'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.byte_offset_04.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_08'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.byte_offset_08.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_0C'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.byte_offset_0C.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.base_address_register_0'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.base_address_register_0.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_1'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.base_ddress_register_1.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_2'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.base_ddress_register_2.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_3'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.base_ddress_register_3.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_4'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.base_ddress_register_4.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_5'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.base_ddress_register_5.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.cardbus_cis_pointer'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.cardbus_cis_pointer.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_2C'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.byte_offset_2C.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.capabilities_pointer'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.capabilities_pointer.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_3C'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.byte_offset_3C.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.capabilities_power_mngt_pointer'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.capabilities_power_mngt_pointer.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.power_management_pointer'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.power_management_pointer.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.capabilities_power_na_pointer'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.capabilities_power_na_pointer.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.link_control_3_register'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.link_control_3_register.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.lane_error_status_register'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.lane_error_status_register.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.lane_eq_ctrl_register'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.lane_eq_ctrl_register.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.extended_capabilities'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.extended_capabilities.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_00.Vendor_ID'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.byte_offset_00.Vendor_ID.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_00.Device_ID'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.byte_offset_00.Device_ID.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.bus_master_enable'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.byte_offset_04.bus_master_enable.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.special_cycle_enable'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.byte_offset_04.special_cycle_enable.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.memory_write_invalidate'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.byte_offset_04.memory_write_invalidate.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.vga_palette_snoop'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.byte_offset_04.vga_palette_snoop.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.parity_error_response'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.byte_offset_04.parity_error_response.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.idsel_step_wait_cycle_control'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.byte_offset_04.idsel_step_wait_cycle_control.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.SERR_Enable'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.byte_offset_04.SERR_Enable.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.fast_b2b_transactions_enable'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.byte_offset_04.fast_b2b_transactions_enable.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.interrupt_disable'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.byte_offset_04.interrupt_disable.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.rsvd'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.byte_offset_04.rsvd.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.interrupt_status'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.byte_offset_04.interrupt_status.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.capabilities_list'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.byte_offset_04.capabilities_list.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.sixtysix_mhz_capable'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.byte_offset_04.sixtysix_mhz_capable.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.fast_b2b_transactions_capable'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.byte_offset_04.fast_b2b_transactions_capable.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.master_data_parity_error'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.byte_offset_04.master_data_parity_error.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.devsel_timing'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.byte_offset_04.devsel_timing.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.signaled_target_abort'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.byte_offset_04.signaled_target_abort.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.received_target_abort'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.byte_offset_04.received_target_abort.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.received_master_abort'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.byte_offset_04.received_master_abort.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.signaled_system_error'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.byte_offset_04.signaled_system_error.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_04.detected_parity_error'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.byte_offset_04.detected_parity_error.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_08.Revision_ID'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.byte_offset_08.Revision_ID.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_08.Class_Code'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.byte_offset_08.Class_Code.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_0C.cache_line_size_register'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.byte_offset_0C.cache_line_size_register.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_0C.latency_timer_register'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.byte_offset_0C.latency_timer_register.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_0C.interrupt_line_register'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.byte_offset_0C.interrupt_line_register.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_0C.interrupt_pin_register'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.byte_offset_0C.interrupt_pin_register.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.base_address_register_0.region_type'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.base_address_register_0.region_type.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.base_address_register_0.locatable'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.base_address_register_0.locatable.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.base_address_register_0.prefetchable'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.base_address_register_0.prefetchable.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.base_address_register_0.base_adress'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.base_address_register_0.base_adress.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_1.region_type'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.base_ddress_register_1.region_type.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_1.locatable'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.base_ddress_register_1.locatable.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_1.prefetchable'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.base_ddress_register_1.prefetchable.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_1.base_adress'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.base_ddress_register_1.base_adress.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_2.BAR'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.base_ddress_register_2.BAR.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_3.BAR'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.base_ddress_register_3.BAR.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_4.BAR'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.base_ddress_register_4.BAR.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.base_ddress_register_5.BAR'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.base_ddress_register_5.BAR.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.cardbus_cis_pointer.word'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.cardbus_cis_pointer.word.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_2C.Vendor_ID'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.byte_offset_2C.Vendor_ID.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_2C.Device_ID'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.byte_offset_2C.Device_ID.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.capabilities_pointer.capabilities_ptr'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.capabilities_pointer.capabilities_ptr.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_3C.interrupt_line'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.byte_offset_3C.interrupt_line.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_3C.interrupt_pin'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.byte_offset_3C.interrupt_pin.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_3C.min_gnt'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.byte_offset_3C.min_gnt.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.byte_offset_3C.max_lat'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.byte_offset_3C.max_lat.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.capabilities_power_mngt_pointer.capabilities_id'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.capabilities_power_mngt_pointer.capabilities_id.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.capabilities_power_mngt_pointer.next_cap_ptr'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.capabilities_power_mngt_pointer.next_cap_ptr.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.capabilities_power_mngt_pointer.version'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.capabilities_power_mngt_pointer.version.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.capabilities_power_mngt_pointer.pme_clock'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.capabilities_power_mngt_pointer.pme_clock.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.capabilities_power_mngt_pointer.dev_spec_init'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.capabilities_power_mngt_pointer.dev_spec_init.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.capabilities_power_mngt_pointer.aux_current'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.capabilities_power_mngt_pointer.aux_current.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.capabilities_power_mngt_pointer.d1_support'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.capabilities_power_mngt_pointer.d1_support.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.capabilities_power_mngt_pointer.d2_support'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.capabilities_power_mngt_pointer.d2_support.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.capabilities_power_mngt_pointer.pme_support'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.capabilities_power_mngt_pointer.pme_support.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.power_management_pointer.power_state'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.power_management_pointer.power_state.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.power_management_pointer.pme_enable'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.power_management_pointer.pme_enable.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.power_management_pointer.data_select'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.power_management_pointer.data_select.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.power_management_pointer.data_scale'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.power_management_pointer.data_scale.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.power_management_pointer.pme_status'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.power_management_pointer.pme_status.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.power_management_pointer.b2_b3_support'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.power_management_pointer.b2_b3_support.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.power_management_pointer.bus_pwr_clk_ctrl_en'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.power_management_pointer.bus_pwr_clk_ctrl_en.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.power_management_pointer.data'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.power_management_pointer.data.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.capabilities_power_na_pointer.capabilities_id'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.capabilities_power_na_pointer.capabilities_id.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.capabilities_power_na_pointer.next_cap_ptr'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.capabilities_power_na_pointer.next_cap_ptr.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.capabilities_power_na_pointer.capability_version'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.capabilities_power_na_pointer.capability_version.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.capabilities_power_na_pointer.device_port_type'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.capabilities_power_na_pointer.device_port_type.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.capabilities_power_na_pointer.slot_implemented'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.capabilities_power_na_pointer.slot_implemented.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.capabilities_power_na_pointer.interrupt_msg_number'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.capabilities_power_na_pointer.interrupt_msg_number.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.capabilities_power_na_pointer.Undefined'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.capabilities_power_na_pointer.Undefined.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.capabilities_power_na_pointer.RsvdP'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.capabilities_power_na_pointer.RsvdP.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.link_control_3_register.perform_equalization'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.link_control_3_register.perform_equalization.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.link_control_3_register.link_eq_req_intr_en'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.link_control_3_register.link_eq_req_intr_en.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.lane_error_status_register.lane_error'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.lane_error_status_register.lane_error.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.lane_eq_ctrl_register.downstream_tx_preset'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.lane_eq_ctrl_register.downstream_tx_preset.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.lane_eq_ctrl_register.downstream_rx_preset_hint'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.lane_eq_ctrl_register.downstream_rx_preset_hint.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.lane_eq_ctrl_register.upstream_tx_preset'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.lane_eq_ctrl_register.upstream_tx_preset.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.lane_eq_ctrl_register.upstream_rx_preset_hint'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.lane_eq_ctrl_register.upstream_rx_preset_hint.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        with self.subTest(msg='node: pcie_config_reg.extended_capabilities.ext_cap'):
            with self.assertRaises(AttributeError):
                # this line is trying to set an illegal value so by definition should fail the type
                # checks
                self.dut.extended_capabilities.ext_cap.cppkbrgmgeloagvfgjjeiiushygirh = 1 # type: ignore[attr-defined,union-attr]
        

    
    def test_top_traversal_iterators(self) -> None:
        
        expected_writable_regs: list[WritableAsyncRegister]
        expected_readable_regs: list[ReadableAsyncRegister]
        expected_memories:list[Union[MemoryAsyncReadOnly, MemoryAsyncWriteOnly, MemoryAsyncReadWrite]]

        
        expected_sections : list[Union[AsyncAddressMap, AsyncRegFile]]

        # check the readable registers
        expected_readable_regs = [self.dut.byte_offset_00, # type: ignore[union-attr,list-item] 
                                        
                                    self.dut.byte_offset_04, # type: ignore[union-attr,list-item] 
                                        
                                    self.dut.byte_offset_08, # type: ignore[union-attr,list-item] 
                                        
                                    self.dut.byte_offset_0C, # type: ignore[union-attr,list-item] 
                                        
                                    self.dut.base_address_register_0, # type: ignore[union-attr,list-item] 
                                        
                                    self.dut.base_ddress_register_1, # type: ignore[union-attr,list-item] 
                                        
                                    self.dut.base_ddress_register_2, # type: ignore[union-attr,list-item] 
                                        
                                    self.dut.base_ddress_register_3, # type: ignore[union-attr,list-item] 
                                        
                                    self.dut.base_ddress_register_4, # type: ignore[union-attr,list-item] 
                                        
                                    self.dut.base_ddress_register_5, # type: ignore[union-attr,list-item] 
                                        
                                    self.dut.cardbus_cis_pointer, # type: ignore[union-attr,list-item] 
                                        
                                    self.dut.byte_offset_2C, # type: ignore[union-attr,list-item] 
                                        
                                    self.dut.capabilities_pointer, # type: ignore[union-attr,list-item] 
                                        
                                    self.dut.byte_offset_3C, # type: ignore[union-attr,list-item] 
                                        
                                    self.dut.capabilities_power_mngt_pointer, # type: ignore[union-attr,list-item] 
                                        
                                    self.dut.power_management_pointer, # type: ignore[union-attr,list-item] 
                                        
                                    self.dut.capabilities_power_na_pointer, # type: ignore[union-attr,list-item] 
                                        
                                    self.dut.link_control_3_register, # type: ignore[union-attr,list-item] 
                                        
                                    self.dut.lane_error_status_register, # type: ignore[union-attr,list-item] 
                                        
                                    self.dut.lane_eq_ctrl_register, # type: ignore[union-attr,list-item] 
                                        
                                    self.dut.extended_capabilities, # type: ignore[union-attr,list-item] 
                                        
                                     ]
        readable_regs = []
        for readable_reg in self.dut.get_readable_registers(unroll=True):  # type: ignore[union-attr]
            self.assertIsInstance(readable_reg, (RegAsyncReadWrite, RegAsyncReadOnly))
            readable_regs.append(readable_reg)
        self.assertCountEqual(expected_readable_regs, readable_regs)
        
        expected_readable_regs = [self.dut.byte_offset_00, # type: ignore[union-attr,list-item] 
                                       
                                   self.dut.byte_offset_04, # type: ignore[union-attr,list-item] 
                                       
                                   self.dut.byte_offset_08, # type: ignore[union-attr,list-item] 
                                       
                                   self.dut.byte_offset_0C, # type: ignore[union-attr,list-item] 
                                       
                                   self.dut.base_address_register_0, # type: ignore[union-attr,list-item] 
                                       
                                   self.dut.base_ddress_register_1, # type: ignore[union-attr,list-item] 
                                       
                                   self.dut.base_ddress_register_2, # type: ignore[union-attr,list-item] 
                                       
                                   self.dut.base_ddress_register_3, # type: ignore[union-attr,list-item] 
                                       
                                   self.dut.base_ddress_register_4, # type: ignore[union-attr,list-item] 
                                       
                                   self.dut.base_ddress_register_5, # type: ignore[union-attr,list-item] 
                                       
                                   self.dut.cardbus_cis_pointer, # type: ignore[union-attr,list-item] 
                                       
                                   self.dut.byte_offset_2C, # type: ignore[union-attr,list-item] 
                                       
                                   self.dut.capabilities_pointer, # type: ignore[union-attr,list-item] 
                                       
                                   self.dut.byte_offset_3C, # type: ignore[union-attr,list-item] 
                                       
                                   self.dut.capabilities_power_mngt_pointer, # type: ignore[union-attr,list-item] 
                                       
                                   self.dut.power_management_pointer, # type: ignore[union-attr,list-item] 
                                       
                                   self.dut.capabilities_power_na_pointer, # type: ignore[union-attr,list-item] 
                                       
                                   self.dut.link_control_3_register, # type: ignore[union-attr,list-item] 
                                       
                                   self.dut.lane_error_status_register, # type: ignore[union-attr,list-item] 
                                       
                                   self.dut.lane_eq_ctrl_register, # type: ignore[union-attr,list-item] 
                                       
                                   self.dut.extended_capabilities, # type: ignore[union-attr,list-item] 
                                       
                                    ]
        readable_regs = []
        for readable_reg in self.dut.get_readable_registers(unroll=False):  # type: ignore[union-attr]
            readable_regs.append(readable_reg)
        self.assertCountEqual(expected_readable_regs, readable_regs)

        # check the writable registers
        expected_writable_regs = [
                                       
                                   self.dut.byte_offset_04, # type: ignore[union-attr,list-item] 
                                       
                                   
                                       
                                   self.dut.byte_offset_0C, # type: ignore[union-attr,list-item] 
                                       
                                   
                                       
                                   
                                       
                                   self.dut.base_ddress_register_2, # type: ignore[union-attr,list-item] 
                                       
                                   self.dut.base_ddress_register_3, # type: ignore[union-attr,list-item] 
                                       
                                   self.dut.base_ddress_register_4, # type: ignore[union-attr,list-item] 
                                       
                                   self.dut.base_ddress_register_5, # type: ignore[union-attr,list-item] 
                                       
                                   self.dut.cardbus_cis_pointer, # type: ignore[union-attr,list-item] 
                                       
                                   
                                       
                                   
                                       
                                   self.dut.byte_offset_3C, # type: ignore[union-attr,list-item] 
                                       
                                   self.dut.capabilities_power_mngt_pointer, # type: ignore[union-attr,list-item] 
                                       
                                   self.dut.power_management_pointer, # type: ignore[union-attr,list-item] 
                                       
                                   
                                       
                                   self.dut.link_control_3_register, # type: ignore[union-attr,list-item] 
                                       
                                   self.dut.lane_error_status_register, # type: ignore[union-attr,list-item] 
                                       
                                   self.dut.lane_eq_ctrl_register, # type: ignore[union-attr,list-item] 
                                       
                                   
                                       
                                    ]
        writable_regs = []
        for writable_reg in self.dut.get_writable_registers(unroll=True):  # type: ignore[union-attr]
            self.assertIsInstance(writable_reg, (RegAsyncReadWrite, RegAsyncWriteOnly))
            writable_regs.append(writable_reg)
        self.assertCountEqual(expected_writable_regs, writable_regs)
        
        expected_writable_regs = [
                                       
                                   self.dut.byte_offset_04, # type: ignore[union-attr,list-item] 
                                       
                                   
                                       
                                   self.dut.byte_offset_0C, # type: ignore[union-attr,list-item] 
                                       
                                   
                                       
                                   
                                       
                                   self.dut.base_ddress_register_2, # type: ignore[union-attr,list-item] 
                                       
                                   self.dut.base_ddress_register_3, # type: ignore[union-attr,list-item] 
                                       
                                   self.dut.base_ddress_register_4, # type: ignore[union-attr,list-item] 
                                       
                                   self.dut.base_ddress_register_5, # type: ignore[union-attr,list-item] 
                                       
                                   self.dut.cardbus_cis_pointer, # type: ignore[union-attr,list-item] 
                                       
                                   
                                       
                                   
                                       
                                   self.dut.byte_offset_3C, # type: ignore[union-attr,list-item] 
                                       
                                   self.dut.capabilities_power_mngt_pointer, # type: ignore[union-attr,list-item] 
                                       
                                   self.dut.power_management_pointer, # type: ignore[union-attr,list-item] 
                                       
                                   
                                       
                                   self.dut.link_control_3_register, # type: ignore[union-attr,list-item] 
                                       
                                   self.dut.lane_error_status_register, # type: ignore[union-attr,list-item] 
                                       
                                   self.dut.lane_eq_ctrl_register, # type: ignore[union-attr,list-item] 
                                       
                                   
                                       
                                    ]
        writable_regs = []
        for writable_reg in self.dut.get_writable_registers(unroll=False):  # type: ignore[union-attr]
            writable_regs.append(writable_reg)
        self.assertCountEqual(expected_writable_regs, writable_regs)

        # check the sections
        expected_sections = [
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                               ]
        sections = []
        for section in self.dut.get_sections(unroll=True):  # type: ignore[union-attr]
            self.assertIsInstance(section, (AsyncAddressMap, AsyncRegFile))
            sections.append(section)
        self.assertCountEqual(expected_sections, sections)
        
        expected_sections = [
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                               ]
        sections = []
        for section in self.dut.get_sections(unroll=False):  # type: ignore[union-attr]
            sections.append(section)
        self.assertCountEqual(expected_sections, sections)

        # check the memories
        expected_memories = [
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                               ]
        memories = []
        for memory in self.dut.get_memories(unroll=True):  # type: ignore[union-attr]
            self.assertIsInstance(memory, (MemoryAsyncReadOnly, MemoryAsyncWriteOnly, MemoryAsyncReadWrite))
            memories.append(memory)
        self.assertCountEqual(expected_memories, memories)
        
        expected_memories = [
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                              
                                  
                               ]
        memories = []
        for memory in self.dut.get_memories(unroll=False):  # type: ignore[union-attr]
            self.assertIsInstance(memory, (MemoryAsyncReadOnly, MemoryAsyncWriteOnly, MemoryAsyncReadWrite, MemoryAsyncReadOnlyArray, MemoryAsyncWriteOnlyArray, MemoryAsyncReadWriteArray))
            memories.append(memory)
        self.assertCountEqual(expected_memories, memories)

    

    

    

    

    

    def test_traversal_iterators(self) -> None:
        """
        Walk the address map and check that the iterators for each node as as expected
        """
        
        expected_writable_fields: list[Union[FieldAsyncWriteOnly, FieldAsyncReadWrite]]
        expected_readable_fields: list[Union[FieldAsyncReadOnly, FieldAsyncReadWrite]]
        expected_fields: list[Union[FieldAsyncWriteOnly, FieldAsyncReadOnly, FieldAsyncReadWrite]]
        expected_writable_regs: list[WritableAsyncRegister]
        expected_readable_regs: list[ReadableAsyncRegister]
        expected_memories:list[Union[MemoryAsyncReadOnly, MemoryAsyncWriteOnly, MemoryAsyncReadWrite]]

        
        expected_sections : list[Union[AsyncAddressMap, AsyncRegFile]]

        # test all the registers
        with self.subTest(msg='register: pcie_config_reg.byte_offset_00'):
                
            expected_fields = [self.dut.byte_offset_00.Vendor_ID, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.byte_offset_00.Device_ID, # type: ignore[union-attr,list-item]
                                        
                                    
                                 
                                         ]
            fields = []
            for field in self.dut.byte_offset_00.fields:  # type: ignore[union-attr]
                fields.append(field)
            self.assertCountEqual(expected_fields, fields)
                
            # register should not have writable_fields attribute
            self.assertFalse(hasattr(self.dut.byte_offset_00, 'writable_fields')) # type: ignore[union-attr]
                    
                    
            expected_readable_fields = [self.dut.byte_offset_00.Vendor_ID, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_00.Device_ID, # type: ignore[union-attr,list-item] 
                                            
                                         
                                         ]
            readable_fields = []
            for readable_field in self.dut.byte_offset_00.readable_fields: # type: ignore[union-attr]
                readable_fields.append(readable_field)
            self.assertCountEqual(expected_readable_fields, readable_fields)
                    
        with self.subTest(msg='register: pcie_config_reg.byte_offset_04'):
                
            expected_fields = [self.dut.byte_offset_04.bus_master_enable, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.byte_offset_04.special_cycle_enable, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.byte_offset_04.memory_write_invalidate, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.byte_offset_04.vga_palette_snoop, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.byte_offset_04.parity_error_response, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.byte_offset_04.idsel_step_wait_cycle_control, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.byte_offset_04.SERR_Enable, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.byte_offset_04.fast_b2b_transactions_enable, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.byte_offset_04.interrupt_disable, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.byte_offset_04.rsvd, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.byte_offset_04.interrupt_status, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.byte_offset_04.capabilities_list, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.byte_offset_04.sixtysix_mhz_capable, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.byte_offset_04.fast_b2b_transactions_capable, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.byte_offset_04.master_data_parity_error, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.byte_offset_04.devsel_timing, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.byte_offset_04.signaled_target_abort, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.byte_offset_04.received_target_abort, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.byte_offset_04.received_master_abort, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.byte_offset_04.signaled_system_error, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.byte_offset_04.detected_parity_error, # type: ignore[union-attr,list-item]
                                        
                                    
                                 
                                         ]
            fields = []
            for field in self.dut.byte_offset_04.fields:  # type: ignore[union-attr]
                fields.append(field)
            self.assertCountEqual(expected_fields, fields)
                
            expected_writable_fields = [self.dut.byte_offset_04.bus_master_enable, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_04.special_cycle_enable, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_04.memory_write_invalidate, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_04.vga_palette_snoop, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_04.parity_error_response, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_04.idsel_step_wait_cycle_control, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_04.SERR_Enable, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_04.fast_b2b_transactions_enable, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_04.interrupt_disable, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_04.rsvd, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_04.interrupt_status, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_04.capabilities_list, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_04.sixtysix_mhz_capable, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_04.fast_b2b_transactions_capable, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_04.master_data_parity_error, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_04.devsel_timing, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_04.signaled_target_abort, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_04.received_target_abort, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_04.received_master_abort, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_04.signaled_system_error, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_04.detected_parity_error, # type: ignore[union-attr,list-item] 
                                            
                                         
                                         ]
            writable_fields = []
            for writable_field in self.dut.byte_offset_04.writable_fields:  # type: ignore[union-attr]
                writable_fields.append(writable_field)
            self.assertCountEqual(expected_writable_fields, writable_fields)
                    
                    
            expected_readable_fields = [self.dut.byte_offset_04.bus_master_enable, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_04.special_cycle_enable, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_04.memory_write_invalidate, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_04.vga_palette_snoop, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_04.parity_error_response, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_04.idsel_step_wait_cycle_control, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_04.SERR_Enable, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_04.fast_b2b_transactions_enable, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_04.interrupt_disable, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_04.rsvd, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_04.interrupt_status, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_04.capabilities_list, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_04.sixtysix_mhz_capable, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_04.fast_b2b_transactions_capable, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_04.master_data_parity_error, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_04.devsel_timing, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_04.signaled_target_abort, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_04.received_target_abort, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_04.received_master_abort, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_04.signaled_system_error, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_04.detected_parity_error, # type: ignore[union-attr,list-item] 
                                            
                                         
                                         ]
            readable_fields = []
            for readable_field in self.dut.byte_offset_04.readable_fields: # type: ignore[union-attr]
                readable_fields.append(readable_field)
            self.assertCountEqual(expected_readable_fields, readable_fields)
                    
        with self.subTest(msg='register: pcie_config_reg.byte_offset_08'):
                
            expected_fields = [self.dut.byte_offset_08.Revision_ID, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.byte_offset_08.Class_Code, # type: ignore[union-attr,list-item]
                                        
                                    
                                 
                                         ]
            fields = []
            for field in self.dut.byte_offset_08.fields:  # type: ignore[union-attr]
                fields.append(field)
            self.assertCountEqual(expected_fields, fields)
                
            # register should not have writable_fields attribute
            self.assertFalse(hasattr(self.dut.byte_offset_08, 'writable_fields')) # type: ignore[union-attr]
                    
                    
            expected_readable_fields = [self.dut.byte_offset_08.Revision_ID, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_08.Class_Code, # type: ignore[union-attr,list-item] 
                                            
                                         
                                         ]
            readable_fields = []
            for readable_field in self.dut.byte_offset_08.readable_fields: # type: ignore[union-attr]
                readable_fields.append(readable_field)
            self.assertCountEqual(expected_readable_fields, readable_fields)
                    
        with self.subTest(msg='register: pcie_config_reg.byte_offset_0C'):
                
            expected_fields = [self.dut.byte_offset_0C.cache_line_size_register, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.byte_offset_0C.latency_timer_register, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.byte_offset_0C.interrupt_line_register, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.byte_offset_0C.interrupt_pin_register, # type: ignore[union-attr,list-item]
                                        
                                    
                                 
                                         ]
            fields = []
            for field in self.dut.byte_offset_0C.fields:  # type: ignore[union-attr]
                fields.append(field)
            self.assertCountEqual(expected_fields, fields)
                
            expected_writable_fields = [self.dut.byte_offset_0C.cache_line_size_register, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_0C.latency_timer_register, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_0C.interrupt_line_register, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_0C.interrupt_pin_register, # type: ignore[union-attr,list-item] 
                                            
                                         
                                         ]
            writable_fields = []
            for writable_field in self.dut.byte_offset_0C.writable_fields:  # type: ignore[union-attr]
                writable_fields.append(writable_field)
            self.assertCountEqual(expected_writable_fields, writable_fields)
                    
                    
            expected_readable_fields = [self.dut.byte_offset_0C.cache_line_size_register, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_0C.latency_timer_register, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_0C.interrupt_line_register, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_0C.interrupt_pin_register, # type: ignore[union-attr,list-item] 
                                            
                                         
                                         ]
            readable_fields = []
            for readable_field in self.dut.byte_offset_0C.readable_fields: # type: ignore[union-attr]
                readable_fields.append(readable_field)
            self.assertCountEqual(expected_readable_fields, readable_fields)
                    
        with self.subTest(msg='register: pcie_config_reg.base_address_register_0'):
                
            expected_fields = [self.dut.base_address_register_0.region_type, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.base_address_register_0.locatable, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.base_address_register_0.prefetchable, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.base_address_register_0.base_adress, # type: ignore[union-attr,list-item]
                                        
                                    
                                 
                                         ]
            fields = []
            for field in self.dut.base_address_register_0.fields:  # type: ignore[union-attr]
                fields.append(field)
            self.assertCountEqual(expected_fields, fields)
                
            # register should not have writable_fields attribute
            self.assertFalse(hasattr(self.dut.base_address_register_0, 'writable_fields')) # type: ignore[union-attr]
                    
                    
            expected_readable_fields = [self.dut.base_address_register_0.region_type, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.base_address_register_0.locatable, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.base_address_register_0.prefetchable, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.base_address_register_0.base_adress, # type: ignore[union-attr,list-item] 
                                            
                                         
                                         ]
            readable_fields = []
            for readable_field in self.dut.base_address_register_0.readable_fields: # type: ignore[union-attr]
                readable_fields.append(readable_field)
            self.assertCountEqual(expected_readable_fields, readable_fields)
                    
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_1'):
                
            expected_fields = [self.dut.base_ddress_register_1.region_type, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.base_ddress_register_1.locatable, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.base_ddress_register_1.prefetchable, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.base_ddress_register_1.base_adress, # type: ignore[union-attr,list-item]
                                        
                                    
                                 
                                         ]
            fields = []
            for field in self.dut.base_ddress_register_1.fields:  # type: ignore[union-attr]
                fields.append(field)
            self.assertCountEqual(expected_fields, fields)
                
            # register should not have writable_fields attribute
            self.assertFalse(hasattr(self.dut.base_ddress_register_1, 'writable_fields')) # type: ignore[union-attr]
                    
                    
            expected_readable_fields = [self.dut.base_ddress_register_1.region_type, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.base_ddress_register_1.locatable, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.base_ddress_register_1.prefetchable, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.base_ddress_register_1.base_adress, # type: ignore[union-attr,list-item] 
                                            
                                         
                                         ]
            readable_fields = []
            for readable_field in self.dut.base_ddress_register_1.readable_fields: # type: ignore[union-attr]
                readable_fields.append(readable_field)
            self.assertCountEqual(expected_readable_fields, readable_fields)
                    
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_2'):
                
            expected_fields = [self.dut.base_ddress_register_2.BAR, # type: ignore[union-attr,list-item]
                                        
                                    
                                 
                                         ]
            fields = []
            for field in self.dut.base_ddress_register_2.fields:  # type: ignore[union-attr]
                fields.append(field)
            self.assertCountEqual(expected_fields, fields)
                
            expected_writable_fields = [self.dut.base_ddress_register_2.BAR, # type: ignore[union-attr,list-item] 
                                            
                                         
                                         ]
            writable_fields = []
            for writable_field in self.dut.base_ddress_register_2.writable_fields:  # type: ignore[union-attr]
                writable_fields.append(writable_field)
            self.assertCountEqual(expected_writable_fields, writable_fields)
                    
                    
            expected_readable_fields = [self.dut.base_ddress_register_2.BAR, # type: ignore[union-attr,list-item] 
                                            
                                         
                                         ]
            readable_fields = []
            for readable_field in self.dut.base_ddress_register_2.readable_fields: # type: ignore[union-attr]
                readable_fields.append(readable_field)
            self.assertCountEqual(expected_readable_fields, readable_fields)
                    
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_3'):
                
            expected_fields = [self.dut.base_ddress_register_3.BAR, # type: ignore[union-attr,list-item]
                                        
                                    
                                 
                                         ]
            fields = []
            for field in self.dut.base_ddress_register_3.fields:  # type: ignore[union-attr]
                fields.append(field)
            self.assertCountEqual(expected_fields, fields)
                
            expected_writable_fields = [self.dut.base_ddress_register_3.BAR, # type: ignore[union-attr,list-item] 
                                            
                                         
                                         ]
            writable_fields = []
            for writable_field in self.dut.base_ddress_register_3.writable_fields:  # type: ignore[union-attr]
                writable_fields.append(writable_field)
            self.assertCountEqual(expected_writable_fields, writable_fields)
                    
                    
            expected_readable_fields = [self.dut.base_ddress_register_3.BAR, # type: ignore[union-attr,list-item] 
                                            
                                         
                                         ]
            readable_fields = []
            for readable_field in self.dut.base_ddress_register_3.readable_fields: # type: ignore[union-attr]
                readable_fields.append(readable_field)
            self.assertCountEqual(expected_readable_fields, readable_fields)
                    
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_4'):
                
            expected_fields = [self.dut.base_ddress_register_4.BAR, # type: ignore[union-attr,list-item]
                                        
                                    
                                 
                                         ]
            fields = []
            for field in self.dut.base_ddress_register_4.fields:  # type: ignore[union-attr]
                fields.append(field)
            self.assertCountEqual(expected_fields, fields)
                
            expected_writable_fields = [self.dut.base_ddress_register_4.BAR, # type: ignore[union-attr,list-item] 
                                            
                                         
                                         ]
            writable_fields = []
            for writable_field in self.dut.base_ddress_register_4.writable_fields:  # type: ignore[union-attr]
                writable_fields.append(writable_field)
            self.assertCountEqual(expected_writable_fields, writable_fields)
                    
                    
            expected_readable_fields = [self.dut.base_ddress_register_4.BAR, # type: ignore[union-attr,list-item] 
                                            
                                         
                                         ]
            readable_fields = []
            for readable_field in self.dut.base_ddress_register_4.readable_fields: # type: ignore[union-attr]
                readable_fields.append(readable_field)
            self.assertCountEqual(expected_readable_fields, readable_fields)
                    
        with self.subTest(msg='register: pcie_config_reg.base_ddress_register_5'):
                
            expected_fields = [self.dut.base_ddress_register_5.BAR, # type: ignore[union-attr,list-item]
                                        
                                    
                                 
                                         ]
            fields = []
            for field in self.dut.base_ddress_register_5.fields:  # type: ignore[union-attr]
                fields.append(field)
            self.assertCountEqual(expected_fields, fields)
                
            expected_writable_fields = [self.dut.base_ddress_register_5.BAR, # type: ignore[union-attr,list-item] 
                                            
                                         
                                         ]
            writable_fields = []
            for writable_field in self.dut.base_ddress_register_5.writable_fields:  # type: ignore[union-attr]
                writable_fields.append(writable_field)
            self.assertCountEqual(expected_writable_fields, writable_fields)
                    
                    
            expected_readable_fields = [self.dut.base_ddress_register_5.BAR, # type: ignore[union-attr,list-item] 
                                            
                                         
                                         ]
            readable_fields = []
            for readable_field in self.dut.base_ddress_register_5.readable_fields: # type: ignore[union-attr]
                readable_fields.append(readable_field)
            self.assertCountEqual(expected_readable_fields, readable_fields)
                    
        with self.subTest(msg='register: pcie_config_reg.cardbus_cis_pointer'):
                
            expected_fields = [self.dut.cardbus_cis_pointer.word, # type: ignore[union-attr,list-item]
                                        
                                    
                                 
                                         ]
            fields = []
            for field in self.dut.cardbus_cis_pointer.fields:  # type: ignore[union-attr]
                fields.append(field)
            self.assertCountEqual(expected_fields, fields)
                
            expected_writable_fields = [self.dut.cardbus_cis_pointer.word, # type: ignore[union-attr,list-item] 
                                            
                                         
                                         ]
            writable_fields = []
            for writable_field in self.dut.cardbus_cis_pointer.writable_fields:  # type: ignore[union-attr]
                writable_fields.append(writable_field)
            self.assertCountEqual(expected_writable_fields, writable_fields)
                    
                    
            expected_readable_fields = [self.dut.cardbus_cis_pointer.word, # type: ignore[union-attr,list-item] 
                                            
                                         
                                         ]
            readable_fields = []
            for readable_field in self.dut.cardbus_cis_pointer.readable_fields: # type: ignore[union-attr]
                readable_fields.append(readable_field)
            self.assertCountEqual(expected_readable_fields, readable_fields)
                    
        with self.subTest(msg='register: pcie_config_reg.byte_offset_2C'):
                
            expected_fields = [self.dut.byte_offset_2C.Vendor_ID, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.byte_offset_2C.Device_ID, # type: ignore[union-attr,list-item]
                                        
                                    
                                 
                                         ]
            fields = []
            for field in self.dut.byte_offset_2C.fields:  # type: ignore[union-attr]
                fields.append(field)
            self.assertCountEqual(expected_fields, fields)
                
            # register should not have writable_fields attribute
            self.assertFalse(hasattr(self.dut.byte_offset_2C, 'writable_fields')) # type: ignore[union-attr]
                    
                    
            expected_readable_fields = [self.dut.byte_offset_2C.Vendor_ID, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_2C.Device_ID, # type: ignore[union-attr,list-item] 
                                            
                                         
                                         ]
            readable_fields = []
            for readable_field in self.dut.byte_offset_2C.readable_fields: # type: ignore[union-attr]
                readable_fields.append(readable_field)
            self.assertCountEqual(expected_readable_fields, readable_fields)
                    
        with self.subTest(msg='register: pcie_config_reg.capabilities_pointer'):
                
            expected_fields = [self.dut.capabilities_pointer.capabilities_ptr, # type: ignore[union-attr,list-item]
                                        
                                    
                                 
                                         ]
            fields = []
            for field in self.dut.capabilities_pointer.fields:  # type: ignore[union-attr]
                fields.append(field)
            self.assertCountEqual(expected_fields, fields)
                
            # register should not have writable_fields attribute
            self.assertFalse(hasattr(self.dut.capabilities_pointer, 'writable_fields')) # type: ignore[union-attr]
                    
                    
            expected_readable_fields = [self.dut.capabilities_pointer.capabilities_ptr, # type: ignore[union-attr,list-item] 
                                            
                                         
                                         ]
            readable_fields = []
            for readable_field in self.dut.capabilities_pointer.readable_fields: # type: ignore[union-attr]
                readable_fields.append(readable_field)
            self.assertCountEqual(expected_readable_fields, readable_fields)
                    
        with self.subTest(msg='register: pcie_config_reg.byte_offset_3C'):
                
            expected_fields = [self.dut.byte_offset_3C.interrupt_line, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.byte_offset_3C.interrupt_pin, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.byte_offset_3C.min_gnt, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.byte_offset_3C.max_lat, # type: ignore[union-attr,list-item]
                                        
                                    
                                 
                                         ]
            fields = []
            for field in self.dut.byte_offset_3C.fields:  # type: ignore[union-attr]
                fields.append(field)
            self.assertCountEqual(expected_fields, fields)
                
            expected_writable_fields = [self.dut.byte_offset_3C.interrupt_line, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_3C.interrupt_pin, # type: ignore[union-attr,list-item] 
                                            
                                         
                                            
                                         
                                            
                                         
                                         ]
            writable_fields = []
            for writable_field in self.dut.byte_offset_3C.writable_fields:  # type: ignore[union-attr]
                writable_fields.append(writable_field)
            self.assertCountEqual(expected_writable_fields, writable_fields)
                    
                    
            expected_readable_fields = [self.dut.byte_offset_3C.interrupt_line, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_3C.interrupt_pin, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_3C.min_gnt, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.byte_offset_3C.max_lat, # type: ignore[union-attr,list-item] 
                                            
                                         
                                         ]
            readable_fields = []
            for readable_field in self.dut.byte_offset_3C.readable_fields: # type: ignore[union-attr]
                readable_fields.append(readable_field)
            self.assertCountEqual(expected_readable_fields, readable_fields)
                    
        with self.subTest(msg='register: pcie_config_reg.capabilities_power_mngt_pointer'):
                
            expected_fields = [self.dut.capabilities_power_mngt_pointer.capabilities_id, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.capabilities_power_mngt_pointer.next_cap_ptr, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.capabilities_power_mngt_pointer.version, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.capabilities_power_mngt_pointer.pme_clock, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.capabilities_power_mngt_pointer.dev_spec_init, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.capabilities_power_mngt_pointer.aux_current, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.capabilities_power_mngt_pointer.d1_support, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.capabilities_power_mngt_pointer.d2_support, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.capabilities_power_mngt_pointer.pme_support, # type: ignore[union-attr,list-item]
                                        
                                    
                                 
                                         ]
            fields = []
            for field in self.dut.capabilities_power_mngt_pointer.fields:  # type: ignore[union-attr]
                fields.append(field)
            self.assertCountEqual(expected_fields, fields)
                
            expected_writable_fields = [
                                            
                                         
                                            
                                         self.dut.capabilities_power_mngt_pointer.version, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.capabilities_power_mngt_pointer.pme_clock, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.capabilities_power_mngt_pointer.dev_spec_init, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.capabilities_power_mngt_pointer.aux_current, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.capabilities_power_mngt_pointer.d1_support, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.capabilities_power_mngt_pointer.d2_support, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.capabilities_power_mngt_pointer.pme_support, # type: ignore[union-attr,list-item] 
                                            
                                         
                                         ]
            writable_fields = []
            for writable_field in self.dut.capabilities_power_mngt_pointer.writable_fields:  # type: ignore[union-attr]
                writable_fields.append(writable_field)
            self.assertCountEqual(expected_writable_fields, writable_fields)
                    
                    
            expected_readable_fields = [self.dut.capabilities_power_mngt_pointer.capabilities_id, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.capabilities_power_mngt_pointer.next_cap_ptr, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.capabilities_power_mngt_pointer.version, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.capabilities_power_mngt_pointer.pme_clock, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.capabilities_power_mngt_pointer.dev_spec_init, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.capabilities_power_mngt_pointer.aux_current, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.capabilities_power_mngt_pointer.d1_support, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.capabilities_power_mngt_pointer.d2_support, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.capabilities_power_mngt_pointer.pme_support, # type: ignore[union-attr,list-item] 
                                            
                                         
                                         ]
            readable_fields = []
            for readable_field in self.dut.capabilities_power_mngt_pointer.readable_fields: # type: ignore[union-attr]
                readable_fields.append(readable_field)
            self.assertCountEqual(expected_readable_fields, readable_fields)
                    
        with self.subTest(msg='register: pcie_config_reg.power_management_pointer'):
                
            expected_fields = [self.dut.power_management_pointer.power_state, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.power_management_pointer.pme_enable, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.power_management_pointer.data_select, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.power_management_pointer.data_scale, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.power_management_pointer.pme_status, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.power_management_pointer.b2_b3_support, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.power_management_pointer.bus_pwr_clk_ctrl_en, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.power_management_pointer.data, # type: ignore[union-attr,list-item]
                                        
                                    
                                 
                                         ]
            fields = []
            for field in self.dut.power_management_pointer.fields:  # type: ignore[union-attr]
                fields.append(field)
            self.assertCountEqual(expected_fields, fields)
                
            expected_writable_fields = [self.dut.power_management_pointer.power_state, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.power_management_pointer.pme_enable, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.power_management_pointer.data_select, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.power_management_pointer.data_scale, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.power_management_pointer.pme_status, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.power_management_pointer.b2_b3_support, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.power_management_pointer.bus_pwr_clk_ctrl_en, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.power_management_pointer.data, # type: ignore[union-attr,list-item] 
                                            
                                         
                                         ]
            writable_fields = []
            for writable_field in self.dut.power_management_pointer.writable_fields:  # type: ignore[union-attr]
                writable_fields.append(writable_field)
            self.assertCountEqual(expected_writable_fields, writable_fields)
                    
                    
            expected_readable_fields = [self.dut.power_management_pointer.power_state, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.power_management_pointer.pme_enable, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.power_management_pointer.data_select, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.power_management_pointer.data_scale, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.power_management_pointer.pme_status, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.power_management_pointer.b2_b3_support, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.power_management_pointer.bus_pwr_clk_ctrl_en, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.power_management_pointer.data, # type: ignore[union-attr,list-item] 
                                            
                                         
                                         ]
            readable_fields = []
            for readable_field in self.dut.power_management_pointer.readable_fields: # type: ignore[union-attr]
                readable_fields.append(readable_field)
            self.assertCountEqual(expected_readable_fields, readable_fields)
                    
        with self.subTest(msg='register: pcie_config_reg.capabilities_power_na_pointer'):
                
            expected_fields = [self.dut.capabilities_power_na_pointer.capabilities_id, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.capabilities_power_na_pointer.next_cap_ptr, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.capabilities_power_na_pointer.capability_version, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.capabilities_power_na_pointer.device_port_type, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.capabilities_power_na_pointer.slot_implemented, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.capabilities_power_na_pointer.interrupt_msg_number, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.capabilities_power_na_pointer.Undefined, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.capabilities_power_na_pointer.RsvdP, # type: ignore[union-attr,list-item]
                                        
                                    
                                 
                                         ]
            fields = []
            for field in self.dut.capabilities_power_na_pointer.fields:  # type: ignore[union-attr]
                fields.append(field)
            self.assertCountEqual(expected_fields, fields)
                
            # register should not have writable_fields attribute
            self.assertFalse(hasattr(self.dut.capabilities_power_na_pointer, 'writable_fields')) # type: ignore[union-attr]
                    
                    
            expected_readable_fields = [self.dut.capabilities_power_na_pointer.capabilities_id, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.capabilities_power_na_pointer.next_cap_ptr, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.capabilities_power_na_pointer.capability_version, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.capabilities_power_na_pointer.device_port_type, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.capabilities_power_na_pointer.slot_implemented, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.capabilities_power_na_pointer.interrupt_msg_number, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.capabilities_power_na_pointer.Undefined, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.capabilities_power_na_pointer.RsvdP, # type: ignore[union-attr,list-item] 
                                            
                                         
                                         ]
            readable_fields = []
            for readable_field in self.dut.capabilities_power_na_pointer.readable_fields: # type: ignore[union-attr]
                readable_fields.append(readable_field)
            self.assertCountEqual(expected_readable_fields, readable_fields)
                    
        with self.subTest(msg='register: pcie_config_reg.link_control_3_register'):
                
            expected_fields = [self.dut.link_control_3_register.perform_equalization, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.link_control_3_register.link_eq_req_intr_en, # type: ignore[union-attr,list-item]
                                        
                                    
                                 
                                         ]
            fields = []
            for field in self.dut.link_control_3_register.fields:  # type: ignore[union-attr]
                fields.append(field)
            self.assertCountEqual(expected_fields, fields)
                
            expected_writable_fields = [self.dut.link_control_3_register.perform_equalization, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.link_control_3_register.link_eq_req_intr_en, # type: ignore[union-attr,list-item] 
                                            
                                         
                                         ]
            writable_fields = []
            for writable_field in self.dut.link_control_3_register.writable_fields:  # type: ignore[union-attr]
                writable_fields.append(writable_field)
            self.assertCountEqual(expected_writable_fields, writable_fields)
                    
                    
            expected_readable_fields = [self.dut.link_control_3_register.perform_equalization, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.link_control_3_register.link_eq_req_intr_en, # type: ignore[union-attr,list-item] 
                                            
                                         
                                         ]
            readable_fields = []
            for readable_field in self.dut.link_control_3_register.readable_fields: # type: ignore[union-attr]
                readable_fields.append(readable_field)
            self.assertCountEqual(expected_readable_fields, readable_fields)
                    
        with self.subTest(msg='register: pcie_config_reg.lane_error_status_register'):
                
            expected_fields = [self.dut.lane_error_status_register.lane_error, # type: ignore[union-attr,list-item]
                                        
                                    
                                 
                                         ]
            fields = []
            for field in self.dut.lane_error_status_register.fields:  # type: ignore[union-attr]
                fields.append(field)
            self.assertCountEqual(expected_fields, fields)
                
            expected_writable_fields = [self.dut.lane_error_status_register.lane_error, # type: ignore[union-attr,list-item] 
                                            
                                         
                                         ]
            writable_fields = []
            for writable_field in self.dut.lane_error_status_register.writable_fields:  # type: ignore[union-attr]
                writable_fields.append(writable_field)
            self.assertCountEqual(expected_writable_fields, writable_fields)
                    
                    
            expected_readable_fields = [self.dut.lane_error_status_register.lane_error, # type: ignore[union-attr,list-item] 
                                            
                                         
                                         ]
            readable_fields = []
            for readable_field in self.dut.lane_error_status_register.readable_fields: # type: ignore[union-attr]
                readable_fields.append(readable_field)
            self.assertCountEqual(expected_readable_fields, readable_fields)
                    
        with self.subTest(msg='register: pcie_config_reg.lane_eq_ctrl_register'):
                
            expected_fields = [self.dut.lane_eq_ctrl_register.downstream_tx_preset, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.lane_eq_ctrl_register.downstream_rx_preset_hint, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.lane_eq_ctrl_register.upstream_tx_preset, # type: ignore[union-attr,list-item]
                                        
                                    
                                 self.dut.lane_eq_ctrl_register.upstream_rx_preset_hint, # type: ignore[union-attr,list-item]
                                        
                                    
                                 
                                         ]
            fields = []
            for field in self.dut.lane_eq_ctrl_register.fields:  # type: ignore[union-attr]
                fields.append(field)
            self.assertCountEqual(expected_fields, fields)
                
            expected_writable_fields = [self.dut.lane_eq_ctrl_register.downstream_tx_preset, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.lane_eq_ctrl_register.downstream_rx_preset_hint, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.lane_eq_ctrl_register.upstream_tx_preset, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.lane_eq_ctrl_register.upstream_rx_preset_hint, # type: ignore[union-attr,list-item] 
                                            
                                         
                                         ]
            writable_fields = []
            for writable_field in self.dut.lane_eq_ctrl_register.writable_fields:  # type: ignore[union-attr]
                writable_fields.append(writable_field)
            self.assertCountEqual(expected_writable_fields, writable_fields)
                    
                    
            expected_readable_fields = [self.dut.lane_eq_ctrl_register.downstream_tx_preset, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.lane_eq_ctrl_register.downstream_rx_preset_hint, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.lane_eq_ctrl_register.upstream_tx_preset, # type: ignore[union-attr,list-item] 
                                            
                                         self.dut.lane_eq_ctrl_register.upstream_rx_preset_hint, # type: ignore[union-attr,list-item] 
                                            
                                         
                                         ]
            readable_fields = []
            for readable_field in self.dut.lane_eq_ctrl_register.readable_fields: # type: ignore[union-attr]
                readable_fields.append(readable_field)
            self.assertCountEqual(expected_readable_fields, readable_fields)
                    
        with self.subTest(msg='register: pcie_config_reg.extended_capabilities'):
                
            expected_fields = [self.dut.extended_capabilities.ext_cap, # type: ignore[union-attr,list-item]
                                        
                                    
                                 
                                         ]
            fields = []
            for field in self.dut.extended_capabilities.fields:  # type: ignore[union-attr]
                fields.append(field)
            self.assertCountEqual(expected_fields, fields)
                
            # register should not have writable_fields attribute
            self.assertFalse(hasattr(self.dut.extended_capabilities, 'writable_fields')) # type: ignore[union-attr]
                    
                    
            expected_readable_fields = [self.dut.extended_capabilities.ext_cap, # type: ignore[union-attr,list-item] 
                                            
                                         
                                         ]
            readable_fields = []
            for readable_field in self.dut.extended_capabilities.readable_fields: # type: ignore[union-attr]
                readable_fields.append(readable_field)
            self.assertCountEqual(expected_readable_fields, readable_fields)
                    
        
        # test all the memories
        
        # test all the address maps
        
        # test all the register files
        

    def test_name_map(self) -> None:
        """
        Check that the function for getting a node by its original systemRDL name works
        """
        
        
        self.assertEqual(self.dut.byte_offset_00.get_child_by_system_rdl_name('Vendor_ID').inst_name, 'Vendor_ID')
        
        
        
        
        self.assertEqual(self.dut.byte_offset_00.get_child_by_system_rdl_name('Device_ID').inst_name, 'Device_ID')
        
        
        
        
        
        self.assertEqual(self.dut.byte_offset_04.get_child_by_system_rdl_name('bus_master_enable').inst_name, 'bus_master_enable')
        
        
        
        
        self.assertEqual(self.dut.byte_offset_04.get_child_by_system_rdl_name('special_cycle_enable').inst_name, 'special_cycle_enable')
        
        
        
        
        self.assertEqual(self.dut.byte_offset_04.get_child_by_system_rdl_name('memory_write_invalidate').inst_name, 'memory_write_invalidate')
        
        
        
        
        self.assertEqual(self.dut.byte_offset_04.get_child_by_system_rdl_name('vga_palette_snoop').inst_name, 'vga_palette_snoop')
        
        
        
        
        self.assertEqual(self.dut.byte_offset_04.get_child_by_system_rdl_name('parity_error_response').inst_name, 'parity_error_response')
        
        
        
        
        self.assertEqual(self.dut.byte_offset_04.get_child_by_system_rdl_name('idsel_step_wait_cycle_control').inst_name, 'idsel_step_wait_cycle_control')
        
        
        
        
        self.assertEqual(self.dut.byte_offset_04.get_child_by_system_rdl_name('SERR_Enable').inst_name, 'SERR_Enable')
        
        
        
        
        self.assertEqual(self.dut.byte_offset_04.get_child_by_system_rdl_name('fast_b2b_transactions_enable').inst_name, 'fast_b2b_transactions_enable')
        
        
        
        
        self.assertEqual(self.dut.byte_offset_04.get_child_by_system_rdl_name('interrupt_disable').inst_name, 'interrupt_disable')
        
        
        
        
        self.assertEqual(self.dut.byte_offset_04.get_child_by_system_rdl_name('rsvd').inst_name, 'rsvd')
        
        
        
        
        self.assertEqual(self.dut.byte_offset_04.get_child_by_system_rdl_name('interrupt_status').inst_name, 'interrupt_status')
        
        
        
        
        self.assertEqual(self.dut.byte_offset_04.get_child_by_system_rdl_name('capabilities_list').inst_name, 'capabilities_list')
        
        
        
        
        self.assertEqual(self.dut.byte_offset_04.get_child_by_system_rdl_name('sixtysix_mhz_capable').inst_name, 'sixtysix_mhz_capable')
        
        
        
        
        self.assertEqual(self.dut.byte_offset_04.get_child_by_system_rdl_name('fast_b2b_transactions_capable').inst_name, 'fast_b2b_transactions_capable')
        
        
        
        
        self.assertEqual(self.dut.byte_offset_04.get_child_by_system_rdl_name('master_data_parity_error').inst_name, 'master_data_parity_error')
        
        
        
        
        self.assertEqual(self.dut.byte_offset_04.get_child_by_system_rdl_name('devsel_timing').inst_name, 'devsel_timing')
        
        
        
        
        self.assertEqual(self.dut.byte_offset_04.get_child_by_system_rdl_name('signaled_target_abort').inst_name, 'signaled_target_abort')
        
        
        
        
        self.assertEqual(self.dut.byte_offset_04.get_child_by_system_rdl_name('received_target_abort').inst_name, 'received_target_abort')
        
        
        
        
        self.assertEqual(self.dut.byte_offset_04.get_child_by_system_rdl_name('received_master_abort').inst_name, 'received_master_abort')
        
        
        
        
        self.assertEqual(self.dut.byte_offset_04.get_child_by_system_rdl_name('signaled_system_error').inst_name, 'signaled_system_error')
        
        
        
        
        self.assertEqual(self.dut.byte_offset_04.get_child_by_system_rdl_name('detected_parity_error').inst_name, 'detected_parity_error')
        
        
        
        
        
        self.assertEqual(self.dut.byte_offset_08.get_child_by_system_rdl_name('Revision_ID').inst_name, 'Revision_ID')
        
        
        
        
        self.assertEqual(self.dut.byte_offset_08.get_child_by_system_rdl_name('Class_Code').inst_name, 'Class_Code')
        
        
        
        
        
        self.assertEqual(self.dut.byte_offset_0C.get_child_by_system_rdl_name('cache_line_size_register').inst_name, 'cache_line_size_register')
        
        
        
        
        self.assertEqual(self.dut.byte_offset_0C.get_child_by_system_rdl_name('latency_timer_register').inst_name, 'latency_timer_register')
        
        
        
        
        self.assertEqual(self.dut.byte_offset_0C.get_child_by_system_rdl_name('interrupt_line_register').inst_name, 'interrupt_line_register')
        
        
        
        
        self.assertEqual(self.dut.byte_offset_0C.get_child_by_system_rdl_name('interrupt_pin_register').inst_name, 'interrupt_pin_register')
        
        
        
        
        
        self.assertEqual(self.dut.base_address_register_0.get_child_by_system_rdl_name('region_type').inst_name, 'region_type')
        
        
        
        
        self.assertEqual(self.dut.base_address_register_0.get_child_by_system_rdl_name('locatable').inst_name, 'locatable')
        
        
        
        
        self.assertEqual(self.dut.base_address_register_0.get_child_by_system_rdl_name('prefetchable').inst_name, 'prefetchable')
        
        
        
        
        self.assertEqual(self.dut.base_address_register_0.get_child_by_system_rdl_name('base_adress').inst_name, 'base_adress')
        
        
        
        
        
        self.assertEqual(self.dut.base_ddress_register_1.get_child_by_system_rdl_name('region_type').inst_name, 'region_type')
        
        
        
        
        self.assertEqual(self.dut.base_ddress_register_1.get_child_by_system_rdl_name('locatable').inst_name, 'locatable')
        
        
        
        
        self.assertEqual(self.dut.base_ddress_register_1.get_child_by_system_rdl_name('prefetchable').inst_name, 'prefetchable')
        
        
        
        
        self.assertEqual(self.dut.base_ddress_register_1.get_child_by_system_rdl_name('base_adress').inst_name, 'base_adress')
        
        
        
        
        
        self.assertEqual(self.dut.base_ddress_register_2.get_child_by_system_rdl_name('BAR').inst_name, 'BAR')
        
        
        
        
        
        self.assertEqual(self.dut.base_ddress_register_3.get_child_by_system_rdl_name('BAR').inst_name, 'BAR')
        
        
        
        
        
        self.assertEqual(self.dut.base_ddress_register_4.get_child_by_system_rdl_name('BAR').inst_name, 'BAR')
        
        
        
        
        
        self.assertEqual(self.dut.base_ddress_register_5.get_child_by_system_rdl_name('BAR').inst_name, 'BAR')
        
        
        
        
        
        self.assertEqual(self.dut.cardbus_cis_pointer.get_child_by_system_rdl_name('word').inst_name, 'word')
        
        
        
        
        
        self.assertEqual(self.dut.byte_offset_2C.get_child_by_system_rdl_name('Vendor_ID').inst_name, 'Vendor_ID')
        
        
        
        
        self.assertEqual(self.dut.byte_offset_2C.get_child_by_system_rdl_name('Device_ID').inst_name, 'Device_ID')
        
        
        
        
        
        self.assertEqual(self.dut.capabilities_pointer.get_child_by_system_rdl_name('capabilities_ptr').inst_name, 'capabilities_ptr')
        
        
        
        
        
        self.assertEqual(self.dut.byte_offset_3C.get_child_by_system_rdl_name('interrupt_line').inst_name, 'interrupt_line')
        
        
        
        
        self.assertEqual(self.dut.byte_offset_3C.get_child_by_system_rdl_name('interrupt_pin').inst_name, 'interrupt_pin')
        
        
        
        
        self.assertEqual(self.dut.byte_offset_3C.get_child_by_system_rdl_name('min_gnt').inst_name, 'min_gnt')
        
        
        
        
        self.assertEqual(self.dut.byte_offset_3C.get_child_by_system_rdl_name('max_lat').inst_name, 'max_lat')
        
        
        
        
        
        self.assertEqual(self.dut.capabilities_power_mngt_pointer.get_child_by_system_rdl_name('capabilities_id').inst_name, 'capabilities_id')
        
        
        
        
        self.assertEqual(self.dut.capabilities_power_mngt_pointer.get_child_by_system_rdl_name('next_cap_ptr').inst_name, 'next_cap_ptr')
        
        
        
        
        self.assertEqual(self.dut.capabilities_power_mngt_pointer.get_child_by_system_rdl_name('version').inst_name, 'version')
        
        
        
        
        self.assertEqual(self.dut.capabilities_power_mngt_pointer.get_child_by_system_rdl_name('pme_clock').inst_name, 'pme_clock')
        
        
        
        
        self.assertEqual(self.dut.capabilities_power_mngt_pointer.get_child_by_system_rdl_name('dev_spec_init').inst_name, 'dev_spec_init')
        
        
        
        
        self.assertEqual(self.dut.capabilities_power_mngt_pointer.get_child_by_system_rdl_name('aux_current').inst_name, 'aux_current')
        
        
        
        
        self.assertEqual(self.dut.capabilities_power_mngt_pointer.get_child_by_system_rdl_name('d1_support').inst_name, 'd1_support')
        
        
        
        
        self.assertEqual(self.dut.capabilities_power_mngt_pointer.get_child_by_system_rdl_name('d2_support').inst_name, 'd2_support')
        
        
        
        
        self.assertEqual(self.dut.capabilities_power_mngt_pointer.get_child_by_system_rdl_name('pme_support').inst_name, 'pme_support')
        
        
        
        
        
        self.assertEqual(self.dut.power_management_pointer.get_child_by_system_rdl_name('power_state').inst_name, 'power_state')
        
        
        
        
        self.assertEqual(self.dut.power_management_pointer.get_child_by_system_rdl_name('pme_enable').inst_name, 'pme_enable')
        
        
        
        
        self.assertEqual(self.dut.power_management_pointer.get_child_by_system_rdl_name('data_select').inst_name, 'data_select')
        
        
        
        
        self.assertEqual(self.dut.power_management_pointer.get_child_by_system_rdl_name('data_scale').inst_name, 'data_scale')
        
        
        
        
        self.assertEqual(self.dut.power_management_pointer.get_child_by_system_rdl_name('pme_status').inst_name, 'pme_status')
        
        
        
        
        self.assertEqual(self.dut.power_management_pointer.get_child_by_system_rdl_name('b2_b3_support').inst_name, 'b2_b3_support')
        
        
        
        
        self.assertEqual(self.dut.power_management_pointer.get_child_by_system_rdl_name('bus_pwr_clk_ctrl_en').inst_name, 'bus_pwr_clk_ctrl_en')
        
        
        
        
        self.assertEqual(self.dut.power_management_pointer.get_child_by_system_rdl_name('data').inst_name, 'data')
        
        
        
        
        
        self.assertEqual(self.dut.capabilities_power_na_pointer.get_child_by_system_rdl_name('capabilities_id').inst_name, 'capabilities_id')
        
        
        
        
        self.assertEqual(self.dut.capabilities_power_na_pointer.get_child_by_system_rdl_name('next_cap_ptr').inst_name, 'next_cap_ptr')
        
        
        
        
        self.assertEqual(self.dut.capabilities_power_na_pointer.get_child_by_system_rdl_name('capability_version').inst_name, 'capability_version')
        
        
        
        
        self.assertEqual(self.dut.capabilities_power_na_pointer.get_child_by_system_rdl_name('device_port_type').inst_name, 'device_port_type')
        
        
        
        
        self.assertEqual(self.dut.capabilities_power_na_pointer.get_child_by_system_rdl_name('slot_implemented').inst_name, 'slot_implemented')
        
        
        
        
        self.assertEqual(self.dut.capabilities_power_na_pointer.get_child_by_system_rdl_name('interrupt_msg_number').inst_name, 'interrupt_msg_number')
        
        
        
        
        self.assertEqual(self.dut.capabilities_power_na_pointer.get_child_by_system_rdl_name('Undefined').inst_name, 'Undefined')
        
        
        
        
        self.assertEqual(self.dut.capabilities_power_na_pointer.get_child_by_system_rdl_name('RsvdP').inst_name, 'RsvdP')
        
        
        
        
        
        self.assertEqual(self.dut.link_control_3_register.get_child_by_system_rdl_name('perform_equalization').inst_name, 'perform_equalization')
        
        
        
        
        self.assertEqual(self.dut.link_control_3_register.get_child_by_system_rdl_name('link_eq_req_intr_en').inst_name, 'link_eq_req_intr_en')
        
        
        
        
        
        self.assertEqual(self.dut.lane_error_status_register.get_child_by_system_rdl_name('lane_error').inst_name, 'lane_error')
        
        
        
        
        
        self.assertEqual(self.dut.lane_eq_ctrl_register.get_child_by_system_rdl_name('downstream_tx_preset').inst_name, 'downstream_tx_preset')
        
        
        
        
        self.assertEqual(self.dut.lane_eq_ctrl_register.get_child_by_system_rdl_name('downstream_rx_preset_hint').inst_name, 'downstream_rx_preset_hint')
        
        
        
        
        self.assertEqual(self.dut.lane_eq_ctrl_register.get_child_by_system_rdl_name('upstream_tx_preset').inst_name, 'upstream_tx_preset')
        
        
        
        
        self.assertEqual(self.dut.lane_eq_ctrl_register.get_child_by_system_rdl_name('upstream_rx_preset_hint').inst_name, 'upstream_rx_preset_hint')
        
        
        
        
        
        self.assertEqual(self.dut.extended_capabilities.get_child_by_system_rdl_name('ext_cap').inst_name, 'ext_cap')
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        

    



class pcie_config_reg_block_access(pcie_config_reg_TestCase_BlockAccess): # type: ignore[valid-type,misc]
    """
    tests for all the block access methods
    """

    

    async def test_register_array_context_manager(self) -> None:
        """
        Walk the register map and check that register map context managers work correctly
        """
        

class pcie_config_reg_alt_block_access(pcie_config_reg_TestCase_AltBlockAccess): # type: ignore[valid-type,misc]
    """
    tests for all the block access methods with the alternative callbacks, this is a simpler
    version of the tests above
    """
    

    async def test_register_array_context_manager(self) -> None:
        """
        Walk the register map and check that register map context managers work correctly
        """
        


if __name__ == '__main__':

    if sys.version_info < (3, 8):
        asynctest.main()
    else:
        unittest.main()




