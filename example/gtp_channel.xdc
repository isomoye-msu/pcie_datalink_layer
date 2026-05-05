################################################################################
# IO constraints
################################################################################
# SYSCLK
set_property PACKAGE_PIN R4 [get_ports sys_clk_p]
set_property PACKAGE_PIN T4 [get_ports sys_clk_n]

set_property -dict {PACKAGE_PIN R4 IOSTANDARD DIFF_SSTL15} [get_ports {sys_clk_p}]; #
set_property -dict {PACKAGE_PIN T4 IOSTANDARD DIFF_SSTL15} [get_ports {sys_clk_n}]; #

set_property PACKAGE_PIN F10 [get_ports pcie_refclk_p]
set_property PACKAGE_PIN E10 [get_ports pcie_refclk_n]
set_property -dict {PACKAGE_PIN F10 IOSTANDARD DIFF_SSTL15} [get_ports {pcie_refclk_p}]; #
set_property -dict {PACKAGE_PIN E10 IOSTANDARD DIFF_SSTL15} [get_ports {pcie_refclk_n}]; #
create_clock -name pcie_refclk -period 10.0 [get_ports pcie_refclk_p]

# set_property IOSTANDARD LVDS_25 [get_ports sys_clk_p]
# set_property IOSTANDARD LVDS_25 [get_ports sys_clk_n]

set_property LOC IBUFDS_GTE2_X0Y0 [get_cells refclk_ibuf]

# set_property LOC GTPE2_CHANNEL_X0Y7 [get_cells {pipe_wrapper_i/gtpe2_channell_i}]
# pcie_tx:0.p
# set_property LOC D10 [get_ports {pci_exp_txp[0]}]

# # pcie_tx:0.n
# set_property LOC C10 [get_ports {pci_exp_txn[0]}]

# # pcie_rx:0.p
# set_property LOC D12 [get_ports {pci_exp_rxp[0]}]

# # pcie_rx:0.n
# set_property LOC C12 [get_ports {pci_exp_rxn[0]}]

# led_s
# set_property PACKAGE_PIN J22 [get_ports {led_0}]
# set_property IOSTANDARD LVCMOS33 [get_ports led_0]

# set_property PACKAGE_PIN K22 [get_ports {led_1}]
# set_property IOSTANDARD LVCMOS33 [get_ports led_1]

# set_property PACKAGE_PIN AB6 [get_ports {led_2}]
# set_property IOSTANDARD LVCMOS33 [get_ports led_2]


set_property PACKAGE_PIN C9 [get_ports pci_exp_rxn[0]]
set_property PACKAGE_PIN D9 [get_ports pci_exp_rxp[0]]
set_property PACKAGE_PIN C7 [get_ports pci_exp_txn[0]]
set_property PACKAGE_PIN D7 [get_ports pci_exp_txp[0]]
# set_property CFGBVS VCCO [current_design]
# set_property CONFIG_VOLTAGE 3.3 [current_design]
# set_property BITSTREAM.GENERAL.COMPRESS true [current_design]
# set_property BITSTREAM.CONFIG.UNUSEDPIN pullup [current_design]
# set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 2 [current_design]
# set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]

# # led_:3
# set_property LOC AB9 [get_ports {led_3}]
# set_property IOSTANDARD LVCMOS15 [get_ports {led_3}]

set_property -dict {PACKAGE_PIN L16 IOSTANDARD LVCMOS33 PULLUP true} [get_ports {sys_rst_n}]; #
set_false_path -from [get_ports sys_rst_n]; #
# set_property IOSTANDARD LVCMOS33 [get_ports sys_rst_n]
# set_property LOC L16 [get_ports sys_rst_n]
# set_property PULLUP true [get_ports sys_rst_n]

################################################################################
# Design constraints
################################################################################


# set_property CFGBVS VCCO [current_design]
# set_property CONFIG_VOLTAGE 2.5 [current_design]


#set_property SEVERITY {Warning} [get_drc_checks REQP-56]

#set_property DCI_CASCADE {32 34} [get_iobanks 33]

################################################################################
# Clock constraints
################################################################################


create_clock -name sys_clk_p -period 10.0 [get_ports sys_clk_p]
create_clock -add -name pcie_100mhz_txout -period 10 [get_nets PIPE_TXOUTCLK_OUT]
create_clock -add -name pcie_125mhz_d_rxusr_oob_p -period 8 [get_nets in_module_mmcm.pipe_clock_i/clk_125mhz]
create_clock -add -name pcie_250mhz_gen2 -period 4 [get_nets in_module_mmcm.pipe_clock_i/clk_250mhz]
create_clock -add -name pcie_62d5mhz_user1_user2 -period 16 [get_nets in_module_mmcm.pipe_clock_i/userclk1]
# create_clock -name tx_clk -period 20.0 [get_nets tx_clk]
set_false_path -from [get_clocks -of_objects [get_pins in_module_mmcm.pipe_clock_i/mmcm_i/CLKOUT0]] -to [get_clocks sys_clk_p]
set_false_path -from [get_clocks sys_clk_p] -to [get_clocks -of_objects [get_pins in_module_mmcm.pipe_clock_i/mmcm_i/CLKOUT1]]
set_false_path -from [get_clocks sys_clk_p] -to [get_clocks -of_objects [get_pins in_module_mmcm.pipe_clock_i/mmcm_i/CLKOUT0]]
set_false_path -from [get_pins {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r_reg[*]/C}] -to [get_pins {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[*].ts2_cnt_reg[*]/CE}]
set_false_path -reset_path -from [get_pins {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r_reg[3]/C}] -to [get_pins {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts2_cnt_reg[0]/CE}]

#the ltssm timer is incremented and can be read at any time, so we need to set a false path from the timer register to the ltssm state machine
set_false_path -from [get_pins -hierarchical -regexp .*/pcie_ltssm_downstream_inst/timer_r_reg.*] -to [get_pins -hierarchical -regexp .*pcie_phy_top_inst/pcie_ltssm_downstream_inst/.*]
# set_false_path -from [get_pins {pipe_wrapper_i/pipe_rxusrclk_in_beats/out_reg[0]_replica/C}] -to [get_pins pcie_phy_top_inst/phy_transmit_inst/ordered_set_axis_async_fifo_inst/s_rst_sync1_reg_reg/PRE]
# set_false_path -from [get_pins {pipe_wrapper_i/pipe_rxusrclk_in_beats/out_reg[0]_replica/C}] -to [get_pins pcie_phy_top_inst/phy_transmit_inst/dllp_tx_axis_async_fifo_inst/m_rst_sync1_reg_reg/PRE]
#ordereed_set_sent_cnt_r_reg is incremented in the ltssm state machine and can be read at any time, so we need to set a false path from the ordered_set_sent_cnt_r_reg register to the ltssm state machine
set_false_path -from [get_pins -hierarchical -regexp .*pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r_reg.*] -to [get_pins -hierarchical -regexp .*pcie_phy_top_inst/pcie_ltssm_downstream_inst/.*]
#link up is a static signal that can be read at any time, so we need to set a false path from the link_up signal to the ltssm state machine
set_false_path -from [get_pins -hierarchical -regexp .*pcie_phy_top_inst/pcie_ltssm_downstream_inst/FSM_sequential_curr_state_reg.*] -to [get_pins -hierarchical -regexp .*pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/.*]
#These are the same clocks, so we need to set a false path between them
#async reset paths from the phy to the ltssm state machine
set_false_path -from [get_pins -hierarchical -regexp .*pipe_wrapper_i/pipe_rxusrclk_in_beats/out_reg.*] -to [get_pins -hierarchical -regexp .*pcie_phy_top_inst/phy_transmit_inst/dllp_tx_axis_async_fifo_inst/.*]
set_false_path -from [get_clocks -of_objects [get_pins in_module_mmcm.pipe_clock_i/mmcm_i/CLKOUT0]] -to [get_clocks -of_objects [get_pins in_module_mmcm.pipe_clock_i/mmcm_i/CLKOUT1]]

# create_clock -name rx_clk -period 20.0 [get_nets rx_clk]

################################################################################
# False path constraints
################################################################################

# set_false_path -from [get_pins -hierarchical -filter { NAME =~  "*pcie_phy_top_inst/pcie_datalink_layer_inst/pcie_flow_ctrl_init_inst/idle_count_r_reg*"  }] -to [get_pins -hierarchical -filter { NAME =~  "*pcie_phy_top_inst/pcie_datalink_layer_inst/pcie_flow_ctrl_init_inst/FSM_sequential_curr_state_reg*" && DIRECTION == "IN" }]
# set_multicycle_path -reset_path -from [get_pins -hierarchical -filter { NAME =~  "*pcie_phy_top_inst/pcie_datalink_layer_inst/pcie_datalink_init_inst/soft_reset_r_reg*" && DIRECTION == "IN" }] -to [get_pins -hierarchical -filter { NAME =~  "*pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/pcie_cfg_wrapper_inst/pcie_config_decode_inst/*" && DIRECTION == "IN" }] 1
set_false_path -reset_path -from [get_pins -hierarchical -filter { NAME =~  "*pcie_phy_top_inst/pcie_datalink_layer_inst/pcie_flow_ctrl_init_inst/idle_count_r_reg*"  }] -to [get_pins -hierarchical -filter { NAME =~  "*pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst*"  }]

# o=2create_generated_clock -name pll_clk -source [get_pins ref_clk_pin] -multiply_by 3 [get_pins pll_out_pin]
# create_generated_clock -name clk_250mhz -source [get_ports sys_clk_p]  -multiply_by 5 -divide_by 2  [get_nets { in_module_mmcm.pipe_clock_i/clk_250mhz }]
# create_clock -name clk_250mhz -period 4.0 [get_pins { in_module_mmcm.pipe_clock_i/clk_250mhz }]

# set_false_path -quiet -through [get_nets -hierarchical -filter {mr_ff == TRUE}]

# set_false_path -quiet -to [get_pins -filter {REF_PIN_NAME == PRE} -of_objects [get_cells -hierarchical -filter {ars_ff1 == TRUE || ars_ff2 == TRUE}]]

# set_max_delay 2 -quiet -from [get_pins -filter {REF_PIN_NAME == C} -of_objects [get_cells -hierarchical -filter {ars_ff1 == TRUE}]] -to [get_pins -filter {REF_PIN_NAME == D} -of_objects [get_cells -hierarchical -filter {ars_ff2 == TRUE}]]

# set_clock_groups -group [get_clocks -include_generated_clocks -of [get_nets tx_clk]] -group [get_clocks -include_generated_clocks -of [get_nets rx_clk]] -asynchronous

# set_clock_groups -group [get_clocks -include_generated_clocks -of [get_nets sys_clk]] -group [get_clocks -include_generated_clocks -of [get_nets tx_clk]] -asynchronous

# set_clock_groups -group [get_clocks -include_generated_clocks -of [get_nets sys_clk]] -group [get_clocks -include_generated_clocks -of [get_nets rx_clk]] -asynchronous
