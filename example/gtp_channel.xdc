################################################################################
# IO constraints
################################################################################
# SYSCLK
set_property PACKAGE_PIN R4 [get_ports sys_clk_p]
set_property PACKAGE_PIN T4 [get_ports sys_clk_n]
set_property IOSTANDARD LVDS_25 [get_ports sys_clk_p]
set_property IOSTANDARD LVDS_25 [get_ports sys_clk_n]

set_property PACKAGE_PIN F10 [get_ports pcie_refclk_p]
set_property PACKAGE_PIN E10 [get_ports pcie_refclk_n]
create_clock -period 10.000 -name pcie_refclk [get_ports pcie_refclk_p]

# pcie_tx:0.p

# pcie_tx:0.n

# pcie_rx:0.p

# pcie_rx:0.n
set_property PACKAGE_PIN C9 [get_ports {pci_exp_rxn[0]}]
set_property PACKAGE_PIN D9 [get_ports {pci_exp_rxp[0]}]
set_property PACKAGE_PIN C7 [get_ports {pci_exp_txn[0]}]
set_property PACKAGE_PIN D7 [get_ports {pci_exp_txp[0]}]

# led_s
# set_property PACKAGE_PIN M26 [get_ports led_0]
# set_property IOSTANDARD LVCMOS33 [get_ports led_0]

# set_property PACKAGE_PIN T24 [get_ports led_1]
# set_property IOSTANDARD LVCMOS33 [get_ports led_1]

# set_property PACKAGE_PIN T25 [get_ports led_2]
# set_property IOSTANDARD LVCMOS33 [get_ports led_2]

# # led_:3
# set_property LOC AB9 [get_ports {led_3}]
# set_property IOSTANDARD LVCMOS15 [get_ports {led_3}]


set_property IOSTANDARD LVCMOS33 [get_ports sys_rst_n]
set_property PACKAGE_PIN L16 [get_ports sys_rst_n]
set_property PULLTYPE PULLUP [get_ports sys_rst_n]

################################################################################
# Design constraints
################################################################################


# set_property CFGBVS VCCO [current_design]
# set_property CONFIG_VOLTAGE 2.5 [current_design]


#set_property SEVERITY {Warning} [get_drc_checks REQP-56]

#set_property DCI_CASCADE {32 34} [get_iobanks 33]

set_property BITSTREAM.GENERAL.COMPRESS False [current_design]

set_property BITSTREAM.CONFIG.CONFIGRATE 22 [current_design]

set_property CONFIG_VOLTAGE 3.3 [current_design]

set_property CFGBVS VCCO [current_design]

set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]

set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES [current_design]

################################################################################
# Clock constraints
################################################################################


create_clock -period 10.000 -name sys_clk_p [get_ports sys_clk_p]

# create_clock -name tx_clk -period 20.0 [get_nets tx_clk]

# create_clock -name rx_clk -period 20.0 [get_nets rx_clk]

################################################################################
# False path constraints
################################################################################


# set_false_path -quiet -through [get_nets -hierarchical -filter {mr_ff == TRUE}]

# set_false_path -quiet -to [get_pins -filter {REF_PIN_NAME == PRE} -of_objects [get_cells -hierarchical -filter {ars_ff1 == TRUE || ars_ff2 == TRUE}]]

# set_max_delay 2 -quiet -from [get_pins -filter {REF_PIN_NAME == C} -of_objects [get_cells -hierarchical -filter {ars_ff1 == TRUE}]] -to [get_pins -filter {REF_PIN_NAME == D} -of_objects [get_cells -hierarchical -filter {ars_ff2 == TRUE}]]

# set_clock_groups -group [get_clocks -include_generated_clocks -of [get_nets tx_clk]] -group [get_clocks -include_generated_clocks -of [get_nets rx_clk]] -asynchronous

# set_clock_groups -group [get_clocks -include_generated_clocks -of [get_nets sys_clk]] -group [get_clocks -include_generated_clocks -of [get_nets tx_clk]] -asynchronous

# set_clock_groups -group [get_clocks -include_generated_clocks -of [get_nets sys_clk]] -group [get_clocks -include_generated_clocks -of [get_nets rx_clk]] -asynchronous