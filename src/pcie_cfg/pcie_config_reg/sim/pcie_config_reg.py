


"""
Python Wrapper for the pcie_config_reg register model

This code was generated from the PeakRDL-python package version 1.2.0

"""

from typing import Union

from ..sim_lib.register import Register, MemoryRegister
from ..sim_lib.memory import Memory
from ..sim_lib.simulator import MemoryEntry
from ..sim_lib.field import FieldDefinition
from ..sim_lib.simulator import AsyncSimulator as Simulator


class pcie_config_reg_simulator_cls(Simulator):

    def _build_registers(self) -> dict[int, Union[MemoryRegister, Register]]:
        return {
            0 : Register(width=32, full_inst_name='pcie_config_reg.byte_offset_00', readable=True, writable=False,
                                         fields=[FieldDefinition(high=15, low=0, msb=15, lsb=0, inst_name='Vendor_ID'),FieldDefinition(high=31, low=16, msb=31, lsb=16, inst_name='Device_ID'),
                                                ]),
            4 : Register(width=32, full_inst_name='pcie_config_reg.byte_offset_04', readable=True, writable=True,
                                         fields=[FieldDefinition(high=2, low=2, msb=2, lsb=2, inst_name='bus_master_enable'),FieldDefinition(high=3, low=3, msb=3, lsb=3, inst_name='special_cycle_enable'),FieldDefinition(high=4, low=4, msb=4, lsb=4, inst_name='memory_write_invalidate'),FieldDefinition(high=5, low=5, msb=5, lsb=5, inst_name='vga_palette_snoop'),FieldDefinition(high=6, low=6, msb=6, lsb=6, inst_name='parity_error_response'),FieldDefinition(high=7, low=7, msb=7, lsb=7, inst_name='idsel_step_wait_cycle_control'),FieldDefinition(high=8, low=8, msb=8, lsb=8, inst_name='SERR_Enable'),FieldDefinition(high=9, low=9, msb=9, lsb=9, inst_name='fast_b2b_transactions_enable'),FieldDefinition(high=10, low=10, msb=10, lsb=10, inst_name='interrupt_disable'),FieldDefinition(high=18, low=11, msb=18, lsb=11, inst_name='rsvd'),FieldDefinition(high=19, low=19, msb=19, lsb=19, inst_name='interrupt_status'),FieldDefinition(high=20, low=20, msb=20, lsb=20, inst_name='capabilities_list'),FieldDefinition(high=21, low=21, msb=21, lsb=21, inst_name='sixtysix_mhz_capable'),FieldDefinition(high=23, low=23, msb=23, lsb=23, inst_name='fast_b2b_transactions_capable'),FieldDefinition(high=24, low=24, msb=24, lsb=24, inst_name='master_data_parity_error'),FieldDefinition(high=26, low=25, msb=26, lsb=25, inst_name='devsel_timing'),FieldDefinition(high=27, low=27, msb=27, lsb=27, inst_name='signaled_target_abort'),FieldDefinition(high=28, low=28, msb=28, lsb=28, inst_name='received_target_abort'),FieldDefinition(high=29, low=29, msb=29, lsb=29, inst_name='received_master_abort'),FieldDefinition(high=30, low=30, msb=30, lsb=30, inst_name='signaled_system_error'),FieldDefinition(high=31, low=31, msb=31, lsb=31, inst_name='detected_parity_error'),
                                                ]),
            8 : Register(width=32, full_inst_name='pcie_config_reg.byte_offset_08', readable=True, writable=False,
                                         fields=[FieldDefinition(high=7, low=0, msb=7, lsb=0, inst_name='Revision_ID'),FieldDefinition(high=31, low=8, msb=31, lsb=8, inst_name='Class_Code'),
                                                ]),
            12 : Register(width=32, full_inst_name='pcie_config_reg.byte_offset_0C', readable=True, writable=True,
                                         fields=[FieldDefinition(high=7, low=0, msb=7, lsb=0, inst_name='cache_line_size_register'),FieldDefinition(high=15, low=8, msb=15, lsb=8, inst_name='latency_timer_register'),FieldDefinition(high=23, low=16, msb=23, lsb=16, inst_name='interrupt_line_register'),FieldDefinition(high=31, low=24, msb=31, lsb=24, inst_name='interrupt_pin_register'),
                                                ]),
            16 : Register(width=32, full_inst_name='pcie_config_reg.base_address_register_0', readable=True, writable=False,
                                         fields=[FieldDefinition(high=0, low=0, msb=0, lsb=0, inst_name='region_type'),FieldDefinition(high=2, low=1, msb=2, lsb=1, inst_name='locatable'),FieldDefinition(high=3, low=3, msb=3, lsb=3, inst_name='prefetchable'),FieldDefinition(high=31, low=4, msb=31, lsb=4, inst_name='base_adress'),
                                                ]),
            20 : Register(width=32, full_inst_name='pcie_config_reg.base_ddress_register_1', readable=True, writable=False,
                                         fields=[FieldDefinition(high=0, low=0, msb=0, lsb=0, inst_name='region_type'),FieldDefinition(high=2, low=1, msb=2, lsb=1, inst_name='locatable'),FieldDefinition(high=3, low=3, msb=3, lsb=3, inst_name='prefetchable'),FieldDefinition(high=31, low=4, msb=31, lsb=4, inst_name='base_adress'),
                                                ]),
            24 : Register(width=32, full_inst_name='pcie_config_reg.base_ddress_register_2', readable=True, writable=True,
                                         fields=[FieldDefinition(high=31, low=0, msb=31, lsb=0, inst_name='BAR'),
                                                ]),
            28 : Register(width=32, full_inst_name='pcie_config_reg.base_ddress_register_3', readable=True, writable=True,
                                         fields=[FieldDefinition(high=31, low=0, msb=31, lsb=0, inst_name='BAR'),
                                                ]),
            32 : Register(width=32, full_inst_name='pcie_config_reg.base_ddress_register_4', readable=True, writable=True,
                                         fields=[FieldDefinition(high=31, low=0, msb=31, lsb=0, inst_name='BAR'),
                                                ]),
            36 : Register(width=32, full_inst_name='pcie_config_reg.base_ddress_register_5', readable=True, writable=True,
                                         fields=[FieldDefinition(high=31, low=0, msb=31, lsb=0, inst_name='BAR'),
                                                ]),
            40 : Register(width=32, full_inst_name='pcie_config_reg.cardbus_cis_pointer', readable=True, writable=True,
                                         fields=[FieldDefinition(high=31, low=0, msb=31, lsb=0, inst_name='word'),
                                                ]),
            44 : Register(width=32, full_inst_name='pcie_config_reg.byte_offset_2C', readable=True, writable=False,
                                         fields=[FieldDefinition(high=15, low=0, msb=15, lsb=0, inst_name='Vendor_ID'),FieldDefinition(high=31, low=16, msb=31, lsb=16, inst_name='Device_ID'),
                                                ]),
            52 : Register(width=32, full_inst_name='pcie_config_reg.capabilities_pointer', readable=True, writable=False,
                                         fields=[FieldDefinition(high=7, low=0, msb=7, lsb=0, inst_name='capabilities_ptr'),
                                                ]),
            60 : Register(width=32, full_inst_name='pcie_config_reg.byte_offset_3C', readable=True, writable=True,
                                         fields=[FieldDefinition(high=7, low=0, msb=7, lsb=0, inst_name='interrupt_line'),FieldDefinition(high=15, low=8, msb=15, lsb=8, inst_name='interrupt_pin'),FieldDefinition(high=23, low=16, msb=23, lsb=16, inst_name='min_gnt'),FieldDefinition(high=31, low=24, msb=31, lsb=24, inst_name='max_lat'),
                                                ]),
            64 : Register(width=32, full_inst_name='pcie_config_reg.capabilities_power_mngt_pointer', readable=True, writable=True,
                                         fields=[FieldDefinition(high=7, low=0, msb=7, lsb=0, inst_name='capabilities_id'),FieldDefinition(high=15, low=8, msb=15, lsb=8, inst_name='next_cap_ptr'),FieldDefinition(high=18, low=16, msb=18, lsb=16, inst_name='version'),FieldDefinition(high=19, low=19, msb=19, lsb=19, inst_name='pme_clock'),FieldDefinition(high=21, low=21, msb=21, lsb=21, inst_name='dev_spec_init'),FieldDefinition(high=24, low=22, msb=24, lsb=22, inst_name='aux_current'),FieldDefinition(high=25, low=25, msb=25, lsb=25, inst_name='d1_support'),FieldDefinition(high=26, low=26, msb=26, lsb=26, inst_name='d2_support'),FieldDefinition(high=31, low=27, msb=31, lsb=27, inst_name='pme_support'),
                                                ]),
            68 : Register(width=32, full_inst_name='pcie_config_reg.power_management_pointer', readable=True, writable=True,
                                         fields=[FieldDefinition(high=1, low=0, msb=1, lsb=0, inst_name='power_state'),FieldDefinition(high=3, low=3, msb=3, lsb=3, inst_name='pme_enable'),FieldDefinition(high=12, low=9, msb=12, lsb=9, inst_name='data_select'),FieldDefinition(high=14, low=13, msb=14, lsb=13, inst_name='data_scale'),FieldDefinition(high=15, low=15, msb=15, lsb=15, inst_name='pme_status'),FieldDefinition(high=22, low=22, msb=22, lsb=22, inst_name='b2_b3_support'),FieldDefinition(high=23, low=23, msb=23, lsb=23, inst_name='bus_pwr_clk_ctrl_en'),FieldDefinition(high=31, low=24, msb=31, lsb=24, inst_name='data'),
                                                ]),
            72 : Register(width=32, full_inst_name='pcie_config_reg.capabilities_power_na_pointer', readable=True, writable=False,
                                         fields=[FieldDefinition(high=7, low=0, msb=7, lsb=0, inst_name='capabilities_id'),FieldDefinition(high=15, low=8, msb=15, lsb=8, inst_name='next_cap_ptr'),FieldDefinition(high=19, low=16, msb=19, lsb=16, inst_name='capability_version'),FieldDefinition(high=23, low=20, msb=23, lsb=20, inst_name='device_port_type'),FieldDefinition(high=24, low=24, msb=24, lsb=24, inst_name='slot_implemented'),FieldDefinition(high=29, low=25, msb=29, lsb=25, inst_name='interrupt_msg_number'),FieldDefinition(high=30, low=30, msb=30, lsb=30, inst_name='Undefined'),FieldDefinition(high=31, low=31, msb=31, lsb=31, inst_name='RsvdP'),
                                                ]),
            76 : Register(width=32, full_inst_name='pcie_config_reg.link_control_3_register', readable=True, writable=True,
                                         fields=[FieldDefinition(high=0, low=0, msb=0, lsb=0, inst_name='perform_equalization'),FieldDefinition(high=1, low=1, msb=1, lsb=1, inst_name='link_eq_req_intr_en'),
                                                ]),
            80 : Register(width=32, full_inst_name='pcie_config_reg.lane_error_status_register', readable=True, writable=True,
                                         fields=[FieldDefinition(high=4, low=0, msb=4, lsb=0, inst_name='lane_error'),
                                                ]),
            84 : Register(width=32, full_inst_name='pcie_config_reg.lane_eq_ctrl_register', readable=True, writable=True,
                                         fields=[FieldDefinition(high=3, low=0, msb=3, lsb=0, inst_name='downstream_tx_preset'),FieldDefinition(high=6, low=4, msb=6, lsb=4, inst_name='downstream_rx_preset_hint'),FieldDefinition(high=11, low=8, msb=11, lsb=8, inst_name='upstream_tx_preset'),FieldDefinition(high=14, low=12, msb=14, lsb=12, inst_name='upstream_rx_preset_hint'),
                                                ]),
            256 : Register(width=32, full_inst_name='pcie_config_reg.extended_capabilities', readable=True, writable=False,
                                         fields=[FieldDefinition(high=31, low=0, msb=31, lsb=0, inst_name='ext_cap'),
                                                ]),
        }

    def _build_memories(self) -> list[MemoryEntry]:
        return [
        ]

if __name__ == '__main__':
    pass
