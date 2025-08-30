<!---
Markdown description for SystemRDL register map.

Don't override. Generated from: pcie_config_reg
  - src/pcie_cfg/pcie_config.rdl
-->

## pcie_config_reg address map

- Absolute Address: 0x0
- Base Offset: 0x0
- Size: 0x104

|Offset|           Identifier          |                      Name                     |
|------|-------------------------------|-----------------------------------------------|
| 0x000|         byte_offset_00        |                 Byte Offset 00                |
| 0x004|         byte_offset_04        |                 Byte Offset 04                |
| 0x008|         byte_offset_08        |                 Byte Offset 08                |
| 0x00C|         byte_offset_0C        |                       —                       |
| 0x010|    base_address_register_0    |            Base Address Register 0            |
| 0x014|     base_ddress_register_1    |            Base Address Register 1            |
| 0x018|     base_ddress_register_2    |            Base Address Register 2            |
| 0x01C|     base_ddress_register_3    |            Base Address Register 3            |
| 0x020|     base_ddress_register_4    |            Base Address Register 4            |
| 0x024|     base_ddress_register_5    |            Base Address Register 5            |
| 0x028|      cardbus_cis_pointer      |              Cardbus CIS Pointer              |
| 0x02C|         byte_offset_2C        |                 Byte Offset 2C                |
| 0x034|      capabilities_pointer     |              capabilities_pointer             |
| 0x03C|         byte_offset_3C        |                 Byte Offset 3C                |
| 0x040|capabilities_power_mngt_pointer|              capabilities pointer             |
| 0x044|    power_management_pointer   |                power management               |
| 0x048| capabilities_power_na_pointer |       PCI Express Capabilities Register       |
| 0x04C|    link_control_3_register    |      Link Control 3 Register (Offset 04h)     |
| 0x050|   lane_error_status_register  |    Lane Error Status Register (Offset 08h)    |
| 0x054|     lane_eq_ctrl_register     |Lane Equalization Control Register (Offset 0Ch)|
| 0x100|     extended_capabilities     |             extended capabilities             |

### byte_offset_00 register

- Absolute Address: 0x0
- Base Offset: 0x0
- Size: 0x4

| Bits|Identifier|Access| Reset|Name|
|-----|----------|------|------|----|
| 15:0| Vendor_ID|   r  |0x1234|  — |
|31:16| Device_ID|   r  | 0xFF |  — |

#### Vendor_ID field

<p>Vendor ID</p>

#### Device_ID field

<p>Device ID</p>

### byte_offset_04 register

- Absolute Address: 0x4
- Base Offset: 0x4
- Size: 0x4

| Bits|          Identifier         |Access|Reset|Name|
|-----|-----------------------------|------|-----|----|
|  2  |      bus_master_enable      |  rw  | 0x0 |  — |
|  3  |     special_cycle_enable    |  rw  | 0x0 |  — |
|  4  |   memory_write_invalidate   |  rw  | 0x0 |  — |
|  5  |      vga_palette_snoop      |  rw  | 0x0 |  — |
|  6  |    parity_error_response    |  rw  | 0x0 |  — |
|  7  |idsel_step_wait_cycle_control|  rw  | 0x0 |  — |
|  8  |         SERR_Enable         |  rw  | 0x0 |  — |
|  9  | fast_b2b_transactions_enable|  rw  | 0x0 |  — |
|  10 |      interrupt_disable      |  rw  | 0x0 |  — |
|18:11|             rsvd            |  rw  | 0x0 |  — |
|  19 |       interrupt_status      |  rw  | 0x0 |  — |
|  20 |      capabilities_list      |  rw  | 0x0 |  — |
|  21 |     sixtysix_mhz_capable    |  rw  | 0x0 |  — |
|  23 |fast_b2b_transactions_capable|  rw  | 0x0 |  — |
|  24 |   master_data_parity_error  |  rw  | 0x0 |  — |
|26:25|        devsel_timing        |  rw  | 0x0 |  — |
|  27 |    signaled_target_abort    |  rw  | 0x0 |  — |
|  28 |    received_target_abort    |  rw  | 0x0 |  — |
|  29 |    received_master_abort    |  rw  | 0x0 |  — |
|  30 |    signaled_system_error    |  rw  | 0x0 |  — |
|  31 |    detected_parity_error    |  rw  | 0x0 |  — |

#### bus_master_enable field

<p>bus_master_enable</p>

#### special_cycle_enable field

<p>special_cycle_enable</p>

#### memory_write_invalidate field

<p>memory_write_invalidate</p>

#### vga_palette_snoop field

<p>vga_palette_snoop</p>

#### parity_error_response field

<p>parity_error_response</p>

#### idsel_step_wait_cycle_control field

<p>idsel_step_wait_cycle_control</p>

#### SERR_Enable field

<p>SERR_Enable</p>

#### fast_b2b_transactions_enable field

<p>fast_b2b_transactions_enable</p>

#### interrupt_disable field

<p>interrupt_disable</p>

#### rsvd field

<p>unused</p>

#### interrupt_status field

<p>interrupt_status</p>

#### capabilities_list field

<p>capabilities_list</p>

#### sixtysix_mhz_capable field

<p>sixtysix_mhz_capable</p>

#### fast_b2b_transactions_capable field

<p>fast_b2b_transactions_capable</p>

#### master_data_parity_error field

<p>master_data_parity_error</p>

#### devsel_timing field

<p>devsel_timing</p>

#### signaled_target_abort field

<p>signaled_target_abort</p>

#### received_target_abort field

<p>received_target_abort</p>

#### received_master_abort field

<p>received_master_abort</p>

#### signaled_system_error field

<p>signaled_system_error</p>

#### detected_parity_error field

<p>detected_parity_error</p>

### byte_offset_08 register

- Absolute Address: 0x8
- Base Offset: 0x8
- Size: 0x4

|Bits| Identifier|Access|Reset|Name|
|----|-----------|------|-----|----|
| 7:0|Revision_ID|   r  | 0x0 |  — |
|31:8| Class_Code|   r  | 0x0 |  — |

#### Revision_ID field

<p>Revision ID</p>

#### Class_Code field

<p>Class Code</p>

### byte_offset_0C register

- Absolute Address: 0xC
- Base Offset: 0xC
- Size: 0x4

| Bits|       Identifier       |Access|Reset|Name|
|-----|------------------------|------|-----|----|
| 7:0 |cache_line_size_register|  rw  |  —  |  — |
| 15:8| latency_timer_register |  rw  |  —  |  — |
|23:16| interrupt_line_register|  rw  |  —  |  — |
|31:24| interrupt_pin_register |  rw  |  —  |  — |

#### cache_line_size_register field

<p>Cache Line Size Register (Offset 0Ch)</p>

#### latency_timer_register field

<p>Latency Timer Register   (Offset 0Dh)</p>

#### interrupt_line_register field

<p>Interrupt Line Register  (Offset 3Ch)</p>

#### interrupt_pin_register field

<p>Interrupt Pin Register   (Offset 3Dh)</p>

### base_address_register_0 register

- Absolute Address: 0x10
- Base Offset: 0x10
- Size: 0x4

|Bits| Identifier |Access|  Reset  |Name|
|----|------------|------|---------|----|
|  0 | region_type|   r  |   0x0   |  — |
| 2:1|  locatable |   r  |   0x0   |  — |
|  3 |prefetchable|   r  |   0x0   |  — |
|31:4| base_adress|   r  |0xFFF0000|  — |

#### region_type field

<p>Region Type</p>

#### locatable field

<p>Locatable</p>

#### prefetchable field

<p>prefetchable</p>

#### base_adress field

<p>base address</p>

### base_ddress_register_1 register

- Absolute Address: 0x14
- Base Offset: 0x14
- Size: 0x4

|Bits| Identifier |Access|  Reset  |Name|
|----|------------|------|---------|----|
|  0 | region_type|   r  |   0x0   |  — |
| 2:1|  locatable |   r  |   0x0   |  — |
|  3 |prefetchable|   r  |   0x0   |  — |
|31:4| base_adress|   r  |0xFFF0000|  — |

#### region_type field

<p>Region Type</p>

#### locatable field

<p>Locatable</p>

#### prefetchable field

<p>prefetchable</p>

#### base_adress field

<p>base address</p>

### base_ddress_register_2 register

- Absolute Address: 0x18
- Base Offset: 0x18
- Size: 0x4

|Bits|Identifier|Access|   Reset  |Name|
|----|----------|------|----------|----|
|31:0|    BAR   |  rw  |0x20000000|  — |

#### BAR field

<p>BAR</p>

### base_ddress_register_3 register

- Absolute Address: 0x1C
- Base Offset: 0x1C
- Size: 0x4

|Bits|Identifier|Access|   Reset  |Name|
|----|----------|------|----------|----|
|31:0|    BAR   |  rw  |0x21000000|  — |

#### BAR field

<p>BAR</p>

### base_ddress_register_4 register

- Absolute Address: 0x20
- Base Offset: 0x20
- Size: 0x4

|Bits|Identifier|Access|   Reset  |Name|
|----|----------|------|----------|----|
|31:0|    BAR   |  rw  |0x30000000|  — |

#### BAR field

<p>BAR</p>

### base_ddress_register_5 register

- Absolute Address: 0x24
- Base Offset: 0x24
- Size: 0x4

|Bits|Identifier|Access|   Reset  |Name|
|----|----------|------|----------|----|
|31:0|    BAR   |  rw  |0x30000000|  — |

#### BAR field

<p>BAR</p>

### cardbus_cis_pointer register

- Absolute Address: 0x28
- Base Offset: 0x28
- Size: 0x4

|Bits|Identifier|Access|Reset|Name|
|----|----------|------|-----|----|
|31:0|   word   |  rw  | 0x0 |  — |

#### word field

<p>word</p>

### byte_offset_2C register

- Absolute Address: 0x2C
- Base Offset: 0x2C
- Size: 0x4

| Bits|Identifier|Access|Reset|Name|
|-----|----------|------|-----|----|
| 15:0| Vendor_ID|   r  | 0x0 |  — |
|31:16| Device_ID|   r  | 0x0 |  — |

#### Vendor_ID field

<p>Subsystem Vendor ID</p>

#### Device_ID field

<p>Subsystem ID</p>

### capabilities_pointer register

- Absolute Address: 0x34
- Base Offset: 0x34
- Size: 0x4

|Bits|   Identifier   |Access|Reset|Name|
|----|----------------|------|-----|----|
| 7:0|capabilities_ptr|   r  | 0x40|  — |

#### capabilities_ptr field

<p>capabilities_pointer</p>

### byte_offset_3C register

- Absolute Address: 0x3C
- Base Offset: 0x3C
- Size: 0x4

| Bits|  Identifier  |Access|Reset|Name|
|-----|--------------|------|-----|----|
| 7:0 |interrupt_line|  rw  | 0x0 |  — |
| 15:8| interrupt_pin|  rw  | 0x0 |  — |
|23:16|    min_gnt   |   r  | 0x0 |  — |
|31:24|    max_lat   |   r  | 0x0 |  — |

#### interrupt_line field

<p>Interrupt Line Register</p>

#### interrupt_pin field

<p>Interrupt Pin Register</p>

#### min_gnt field

<p>Min Gnt</p>

#### max_lat field

<p>Max Lat</p>

### capabilities_power_mngt_pointer register

- Absolute Address: 0x40
- Base Offset: 0x40
- Size: 0x4

| Bits|   Identifier  |Access|Reset|Name|
|-----|---------------|------|-----|----|
| 7:0 |capabilities_id|   r  | 0x1 |  — |
| 15:8|  next_cap_ptr |   r  | 0x48|  — |
|18:16|    version    |  rw  | 0x0 |  — |
|  19 |   pme_clock   |  rw  | 0x0 |  — |
|  21 | dev_spec_init |  rw  | 0x0 |  — |
|24:22|  aux_current  |  rw  | 0x0 |  — |
|  25 |   d1_support  |  rw  | 0x0 |  — |
|  26 |   d2_support  |  rw  | 0x0 |  — |
|31:27|  pme_support  |  rw  | 0x0 |  — |

#### capabilities_id field

<p>Capabilities id</p>

#### next_cap_ptr field

<p>next capability pointer</p>

### power_management_pointer register

- Absolute Address: 0x44
- Base Offset: 0x44
- Size: 0x4

| Bits|     Identifier    |Access|Reset|Name|
|-----|-------------------|------|-----|----|
| 1:0 |    power_state    |  rw  |  —  |  — |
|  3  |     pme_enable    |  rw  |  —  |  — |
| 12:9|    data_select    |  rw  |  —  |  — |
|14:13|     data_scale    |  rw  |  —  |  — |
|  15 |     pme_status    |  rw  |  —  |  — |
|  22 |   b2_b3_support   |  rw  |  —  |  — |
|  23 |bus_pwr_clk_ctrl_en|  rw  |  —  |  — |
|31:24|        data       |  rw  |  —  |  — |

### capabilities_power_na_pointer register

- Absolute Address: 0x48
- Base Offset: 0x48
- Size: 0x4

| Bits|     Identifier     |Access|Reset|Name|
|-----|--------------------|------|-----|----|
| 7:0 |   capabilities_id  |   r  | 0x10|  — |
| 15:8|    next_cap_ptr    |   r  | 0x0 |  — |
|19:16| capability_version |   r  | 0x2 |  — |
|23:20|  device_port_type  |   r  | 0x0 |  — |
|  24 |  slot_implemented  |   r  | 0x0 |  — |
|29:25|interrupt_msg_number|   r  | 0x0 |  — |
|  30 |      Undefined     |   r  | 0x0 |  — |
|  31 |        RsvdP       |   r  | 0x0 |  — |

#### capabilities_id field

<p>Capabilities id</p>

#### next_cap_ptr field

<p>next capability pointer</p>

### link_control_3_register register

- Absolute Address: 0x4C
- Base Offset: 0x4C
- Size: 0x4

|Bits|     Identifier     |Access|Reset|Name|
|----|--------------------|------|-----|----|
|  0 |perform_equalization|  rw  | 0x0 |  — |
|  1 | link_eq_req_intr_en|  rw  | 0x0 |  — |

#### perform_equalization field

<p>Perform Equalization</p>

### lane_error_status_register register

- Absolute Address: 0x50
- Base Offset: 0x50
- Size: 0x4

|Bits|Identifier|Access|Reset|Name|
|----|----------|------|-----|----|
| 4:0|lane_error|  rw  | 0x0 |  — |

#### lane_error field

<p>Perform Equalization</p>

### lane_eq_ctrl_register register

- Absolute Address: 0x54
- Base Offset: 0x54
- Size: 0x4

| Bits|        Identifier       |Access|Reset|Name|
|-----|-------------------------|------|-----|----|
| 3:0 |   downstream_tx_preset  |  rw  | 0xF |  — |
| 6:4 |downstream_rx_preset_hint|  rw  | 0x7 |  — |
| 11:8|    upstream_tx_preset   |  rw  | 0xF |  — |
|14:12| upstream_rx_preset_hint |  rw  | 0x7 |  — |

#### downstream_tx_preset field

<p>Downstream Port Transmitter Preset</p>

#### downstream_rx_preset_hint field

<p>Downstream Port Receiver Preset Hint</p>

#### upstream_tx_preset field

<p>Upstream Port Transmitter Preset</p>

#### upstream_rx_preset_hint field

<p>Upstream Port Receiver Preset Hint</p>

### extended_capabilities register

- Absolute Address: 0x100
- Base Offset: 0x100
- Size: 0x4

|Bits|Identifier|Access|Reset|Name|
|----|----------|------|-----|----|
|31:0|  ext_cap |   r  | 0x0 |  — |

#### ext_cap field

<p>exended capabilities</p>
