################################################################################
# IO constraints
################################################################################
# sys_clk:0.p
set_property LOC AD12 [get_ports {sys_clk_p}]
set_property IOSTANDARD LVDS [get_ports {sys_clk_p}]

# sys_clk:0.n
set_property LOC AD11 [get_ports {sys_clk_n}]
set_property IOSTANDARD LVDS [get_ports {sys_clk_n}]

# pcie_tx:0.p
set_property LOC L4 [get_ports {pci_exp_txp[0]}]

# pcie_tx:0.n
set_property LOC L3 [get_ports {pci_exp_txn[0]}]

# pcie_rx:0.p
set_property LOC M6 [get_ports {pci_exp_rxp[0]}]

# pcie_rx:0.n
set_property LOC M5 [get_ports {pci_exp_rxn[0]}]

# user_led:0
set_property LOC AB8 [get_ports led_0]
set_property IOSTANDARD LVCMOS15 [get_ports led_0]

# user_led:1
set_property LOC AA8 [get_ports led_1]
set_property IOSTANDARD LVCMOS15 [get_ports led_1]

# user_led:2
set_property LOC AC9 [get_ports led_2]
set_property IOSTANDARD LVCMOS15 [get_ports led_2]

# user_led:3
set_property LOC AB9 [get_ports led_3]
set_property IOSTANDARD LVCMOS15 [get_ports led_3]


set_property IOSTANDARD LVCMOS25 [get_ports sys_rst_n]
set_property LOC G25 [get_ports sys_rst_n]
set_property PULLUP true [get_ports sys_rst_n]

################################################################################
# Design constraints
################################################################################


set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 2.5 [current_design]


#set_property SEVERITY {Warning} [get_drc_checks REQP-56]

#set_property DCI_CASCADE {32 34} [get_iobanks 33]

################################################################################
# Clock constraints
################################################################################


create_clock -name sys_clk_p -period 10.0 [get_ports sys_clk_p]


create_clock -name sys_clk -period 10.0 [get_ports sys_clk]


set_property LOC IBUFDS_GTE2_X0Y1 [get_cells refclk_ibuf]
# set_property CLOCK_REGION X1Y3 [get_cells mmcm_adv_inst]

# set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets refclk_ibuf]
# set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets mmcm_adv_inst]

# create_clock -name tx_clk -period 20.0 [get_nets tx_clk]

# create_clock -name rx_clk -period 20.0 [get_nets rx_clk]

################################################################################
# False path constraints
################################################################################
set_property LOC GTXE2_CHANNEL_X0Y7 [get_cells {gt_top_i/pipe_wrapper_i/pipe_lane[0].gt_wrapper_i/gtx_channel.gtxe2_channel_i}]

set_property LOC GTXE2_COMMON_X0Y1 [get_cells  {gt_top_i/pipe_wrapper_i/pipe_lane[0].pipe_quad.gt_common_enabled.gt_common_int.gt_common_i/qpll_wrapper_i/gtx_common.gtpex_common_i}]

# set_property LOC GTPE2_CHANNEL_X0Y7 [get_cells {inst/gt_top_i/pipe_wrapper_i/pipe_lane[0].gt_wrapper_i/gtp_channel.gtpe2_channel_i}]

# set_false_path -quiet -through [get_nets -hierarchical -filter {mr_ff == TRUE}]

# set_false_path -quiet -to [get_pins -filter {REF_PIN_NAME == PRE} -of_objects [get_cells -hierarchical -filter {ars_ff1 == TRUE || ars_ff2 == TRUE}]]

# set_max_delay 2 -quiet -from [get_pins -filter {REF_PIN_NAME == C} -of_objects [get_cells -hierarchical -filter {ars_ff1 == TRUE}]] -to [get_pins -filter {REF_PIN_NAME == D} -of_objects [get_cells -hierarchical -filter {ars_ff2 == TRUE}]]

# set_clock_groups -group [get_clocks -include_generated_clocks -of [get_nets tx_clk]] -group [get_clocks -include_generated_clocks -of [get_nets rx_clk]] -asynchronous

# set_clock_groups -group [get_clocks -include_generated_clocks -of [get_nets sys_clk]] -group [get_clocks -include_generated_clocks -of [get_nets tx_clk]] -asynchronous

# set_clock_groups -group [get_clocks -include_generated_clocks -of [get_nets sys_clk]] -group [get_clocks -include_generated_clocks -of [get_nets rx_clk]] -asynchronous
