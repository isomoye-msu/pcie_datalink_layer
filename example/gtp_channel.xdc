################################################################################
# IO constraints
################################################################################
# SYSCLK
set_property PACKAGE_PIN R3 [get_ports sys_clk_p]
set_property PACKAGE_PIN P3 [get_ports sys_clk_n]
set_property IOSTANDARD LVDS_25 [get_ports sys_clk_p]
set_property IOSTANDARD LVDS_25 [get_ports sys_clk_n]

set_property PACKAGE_PIN F11 [get_ports pcie_refclk_p]
set_property PACKAGE_PIN E11 [get_ports pcie_refclk_n]
create_clock -name pcie_refclk -period 10.0 [get_ports pcie_refclk_p]

# pcie_tx:0.p
set_property PACKAGE_PIN D10 [get_ports {pci_exp_txp[0]}]

# pcie_tx:0.n
set_property PACKAGE_PIN C10 [get_ports {pci_exp_txn[0]}]

# pcie_rx:0.p
set_property PACKAGE_PIN D12 [get_ports {pci_exp_rxp[0]}]

# pcie_rx:0.n
set_property PACKAGE_PIN C12 [get_ports {pci_exp_rxn[0]}]

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
set_property PACKAGE_PIN M20 [get_ports sys_rst_n]
set_property PULLUP true [get_ports sys_rst_n]

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

################################################################################
# Debug constraints
################################################################################

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 4096 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list PIPE_PCLK_IN]]

# probe0: LTSSM state (7 bits surviving synthesis: bits 0,1,2,5,6,7,8)
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 7 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {pcie_phy_top_inst/ltssm_debug_state[0]} {pcie_phy_top_inst/ltssm_debug_state[1]} {pcie_phy_top_inst/ltssm_debug_state[2]} {pcie_phy_top_inst/ltssm_debug_state[5]} {pcie_phy_top_inst/ltssm_debug_state[6]} {pcie_phy_top_inst/ltssm_debug_state[7]} {pcie_phy_top_inst/ltssm_debug_state[8]}]]

# probe1: TX datak (4 bits)
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 4 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {dbg_txdatak[0]} {dbg_txdatak[1]} {dbg_txdatak[2]} {dbg_txdatak[3]}]]

# probe2: RX datak (4 bits)
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 4 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {dbg_rxdatak[0]} {dbg_rxdatak[1]} {dbg_rxdatak[2]} {dbg_rxdatak[3]}]]

# probe3: powerdown (2 bits)
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 2 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {dbg_powerdown[0]} {dbg_powerdown[1]}]]

# probe4: TX data (32 bits)
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 32 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {dbg_txdata[0]} {dbg_txdata[1]} {dbg_txdata[2]} {dbg_txdata[3]} {dbg_txdata[4]} {dbg_txdata[5]} {dbg_txdata[6]} {dbg_txdata[7]} {dbg_txdata[8]} {dbg_txdata[9]} {dbg_txdata[10]} {dbg_txdata[11]} {dbg_txdata[12]} {dbg_txdata[13]} {dbg_txdata[14]} {dbg_txdata[15]} {dbg_txdata[16]} {dbg_txdata[17]} {dbg_txdata[18]} {dbg_txdata[19]} {dbg_txdata[20]} {dbg_txdata[21]} {dbg_txdata[22]} {dbg_txdata[23]} {dbg_txdata[24]} {dbg_txdata[25]} {dbg_txdata[26]} {dbg_txdata[27]} {dbg_txdata[28]} {dbg_txdata[29]} {dbg_txdata[30]} {dbg_txdata[31]}]]

# probe5: RX status (3 bits)
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 3 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {dbg_rxstatus[0]} {dbg_rxstatus[1]} {dbg_rxstatus[2]}]]

# probe6: RX data (32 bits)
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 32 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {dbg_rxdata[0]} {dbg_rxdata[1]} {dbg_rxdata[2]} {dbg_rxdata[3]} {dbg_rxdata[4]} {dbg_rxdata[5]} {dbg_rxdata[6]} {dbg_rxdata[7]} {dbg_rxdata[8]} {dbg_rxdata[9]} {dbg_rxdata[10]} {dbg_rxdata[11]} {dbg_rxdata[12]} {dbg_rxdata[13]} {dbg_rxdata[14]} {dbg_rxdata[15]} {dbg_rxdata[16]} {dbg_rxdata[17]} {dbg_rxdata[18]} {dbg_rxdata[19]} {dbg_rxdata[20]} {dbg_rxdata[21]} {dbg_rxdata[22]} {dbg_rxdata[23]} {dbg_rxdata[24]} {dbg_rxdata[25]} {dbg_rxdata[26]} {dbg_rxdata[27]} {dbg_rxdata[28]} {dbg_rxdata[29]} {dbg_rxdata[30]} {dbg_rxdata[31]}]]

# probe7: phystatus (1 bit)
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list dbg_phystatus]]

# probe8: rxelecidle (1 bit)
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list dbg_rxelecidle]]

# probe9: rxvalid (1 bit)
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list dbg_rxvalid]]

# probe10: txdetectrx (1 bit)
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list dbg_txdetectrx]]

# probe11: txelecidle (1 bit)
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list dbg_txelecidle]]

# probe12: fc_initialized (1 bit)
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list fc_initialized_o]]

# probe13: link_up (1 bit)
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 1 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list link_up]]

# probe14: phy_ready_en (1 bit)
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 1 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list phy_ready_en]]

# probe15: tx_elec_idle (1 bit)
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 1 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list tx_elec_idle]]

# probe16: raw GT_RXVALID (1 bit) - before pipe_wrapper filter
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 1 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list pipe_wrapper_i/gt_rxvalid]]

# probe17: rst_idle_reg (1 bit) - pipe_wrapper FSM idle state
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 1 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list pipe_wrapper_i/rst_idle_reg]]

# probe18: rxvalid_cnt[4] (1 bit) - gt_rxvalid held 16 cycles
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 1 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list {pipe_wrapper_i/rxvalid_cnt[4]}]]

# Debug hub
set_property C_CLK_INPUT_FREQ_HZ 100000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets PIPE_PCLK_IN]
