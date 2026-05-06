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

################################################################################
# Debug constraints
################################################################################


create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 2 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 2048 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list sys_clk_BUFG]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 5 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_fc_update_inst/curr_state[0]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_fc_update_inst/curr_state[1]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_fc_update_inst/curr_state[2]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_fc_update_inst/curr_state[3]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_fc_update_inst/curr_state[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 3 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/curr_state[0]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/curr_state[1]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/curr_state[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 16 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/next_transmit_seq_r[0]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/next_transmit_seq_r[1]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/next_transmit_seq_r[2]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/next_transmit_seq_r[3]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/next_transmit_seq_r[4]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/next_transmit_seq_r[5]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/next_transmit_seq_r[6]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/next_transmit_seq_r[7]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/next_transmit_seq_r[8]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/next_transmit_seq_r[9]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/next_transmit_seq_r[10]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/next_transmit_seq_r[11]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/next_transmit_seq_r[12]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/next_transmit_seq_r[13]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/next_transmit_seq_r[14]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/next_transmit_seq_r[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 16 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/next_expected_seq_num_r[0]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/next_expected_seq_num_r[1]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/next_expected_seq_num_r[2]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/next_expected_seq_num_r[3]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/next_expected_seq_num_r[4]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/next_expected_seq_num_r[5]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/next_expected_seq_num_r[6]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/next_expected_seq_num_r[7]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/next_expected_seq_num_r[8]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/next_expected_seq_num_r[9]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/next_expected_seq_num_r[10]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/next_expected_seq_num_r[11]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/next_expected_seq_num_r[12]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/next_expected_seq_num_r[13]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/next_expected_seq_num_r[14]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/next_expected_seq_num_r[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 32 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/dllp_lcrc_r[0]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/dllp_lcrc_r[1]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/dllp_lcrc_r[2]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/dllp_lcrc_r[3]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/dllp_lcrc_r[4]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/dllp_lcrc_r[5]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/dllp_lcrc_r[6]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/dllp_lcrc_r[7]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/dllp_lcrc_r[8]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/dllp_lcrc_r[9]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/dllp_lcrc_r[10]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/dllp_lcrc_r[11]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/dllp_lcrc_r[12]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/dllp_lcrc_r[13]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/dllp_lcrc_r[14]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/dllp_lcrc_r[15]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/dllp_lcrc_r[16]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/dllp_lcrc_r[17]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/dllp_lcrc_r[18]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/dllp_lcrc_r[19]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/dllp_lcrc_r[20]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/dllp_lcrc_r[21]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/dllp_lcrc_r[22]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/dllp_lcrc_r[23]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/dllp_lcrc_r[24]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/dllp_lcrc_r[25]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/dllp_lcrc_r[26]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/dllp_lcrc_r[27]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/dllp_lcrc_r[28]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/dllp_lcrc_r[29]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/dllp_lcrc_r[30]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/dllp_lcrc_r[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 5 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/curr_state[0]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/curr_state[1]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/curr_state[2]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/curr_state[3]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/curr_state[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 32 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/crc_calculated_r[0]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/crc_calculated_r[1]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/crc_calculated_r[2]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/crc_calculated_r[3]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/crc_calculated_r[4]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/crc_calculated_r[5]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/crc_calculated_r[6]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/crc_calculated_r[7]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/crc_calculated_r[8]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/crc_calculated_r[9]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/crc_calculated_r[10]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/crc_calculated_r[11]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/crc_calculated_r[12]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/crc_calculated_r[13]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/crc_calculated_r[14]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/crc_calculated_r[15]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/crc_calculated_r[16]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/crc_calculated_r[17]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/crc_calculated_r[18]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/crc_calculated_r[19]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/crc_calculated_r[20]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/crc_calculated_r[21]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/crc_calculated_r[22]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/crc_calculated_r[23]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/crc_calculated_r[24]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/crc_calculated_r[25]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/crc_calculated_r[26]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/crc_calculated_r[27]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/crc_calculated_r[28]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/crc_calculated_r[29]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/crc_calculated_r[30]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/crc_calculated_r[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 5 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/skid_axis_tuser[0]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/skid_axis_tuser[1]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/skid_axis_tuser[2]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/skid_axis_tuser[3]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/skid_axis_tuser[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 32 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/skid_axis_tdata[0]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/skid_axis_tdata[1]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/skid_axis_tdata[2]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/skid_axis_tdata[3]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/skid_axis_tdata[4]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/skid_axis_tdata[5]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/skid_axis_tdata[6]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/skid_axis_tdata[7]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/skid_axis_tdata[8]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/skid_axis_tdata[9]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/skid_axis_tdata[10]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/skid_axis_tdata[11]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/skid_axis_tdata[12]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/skid_axis_tdata[13]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/skid_axis_tdata[14]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/skid_axis_tdata[15]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/skid_axis_tdata[16]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/skid_axis_tdata[17]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/skid_axis_tdata[18]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/skid_axis_tdata[19]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/skid_axis_tdata[20]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/skid_axis_tdata[21]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/skid_axis_tdata[22]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/skid_axis_tdata[23]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/skid_axis_tdata[24]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/skid_axis_tdata[25]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/skid_axis_tdata[26]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/skid_axis_tdata[27]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/skid_axis_tdata[28]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/skid_axis_tdata[29]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/skid_axis_tdata[30]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/skid_axis_tdata[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/skid_axis_tlast]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/skid_axis_tvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/tlp_is_cpld_r]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/tlp_is_cplh_r]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 1 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/tlp_is_npd_r]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 1 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/tlp_is_nph_r]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 1 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/tlp_is_pd_r]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 1 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp2tlp_inst/tlp_is_ph_r]]
create_debug_core u_ila_1 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_1]
set_property ALL_PROBE_SAME_MU_CNT 2 [get_debug_cores u_ila_1]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_1]
set_property C_DATA_DEPTH 2048 [get_debug_cores u_ila_1]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_1]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_1]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_1]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_1]
set_property port_width 1 [get_debug_ports u_ila_1/clk]
connect_debug_port u_ila_1/clk [get_nets [list in_module_mmcm.pipe_clock_i/CLK]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe0]
set_property port_width 3 [get_debug_ports u_ila_1/probe0]
connect_debug_port u_ila_1/probe0 [get_nets [list {pcie_phy_top_inst/phy_rxstatus[0]} {pcie_phy_top_inst/phy_rxstatus[1]} {pcie_phy_top_inst/phy_rxstatus[2]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe1]
set_property port_width 3 [get_debug_ports u_ila_1/probe1]
connect_debug_port u_ila_1/probe1 [get_nets [list {phy_rxstatus[0]} {phy_rxstatus[1]} {phy_rxstatus[2]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe2]
set_property port_width 5 [get_debug_ports u_ila_1/probe2]
connect_debug_port u_ila_1/probe2 [get_nets [list {pcie_phy_top_inst/gen_os_ctrl[rate_id][rate][0]} {pcie_phy_top_inst/gen_os_ctrl[rate_id][rate][1]} {pcie_phy_top_inst/gen_os_ctrl[rate_id][rate][2]} {pcie_phy_top_inst/gen_os_ctrl[rate_id][rate][3]} {pcie_phy_top_inst/gen_os_ctrl[rate_id][rate][4]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe3]
set_property port_width 8 [get_debug_ports u_ila_1/probe3]
connect_debug_port u_ila_1/probe3 [get_nets [list {pcie_phy_top_inst/gen_os_ctrl[link_number][0]} {pcie_phy_top_inst/gen_os_ctrl[link_number][1]} {pcie_phy_top_inst/gen_os_ctrl[link_number][2]} {pcie_phy_top_inst/gen_os_ctrl[link_number][3]} {pcie_phy_top_inst/gen_os_ctrl[link_number][4]} {pcie_phy_top_inst/gen_os_ctrl[link_number][5]} {pcie_phy_top_inst/gen_os_ctrl[link_number][6]} {pcie_phy_top_inst/gen_os_ctrl[link_number][7]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe4]
set_property port_width 6 [get_debug_ports u_ila_1/probe4]
connect_debug_port u_ila_1/probe4 [get_nets [list {pcie_phy_top_inst/gen_os_ctrl[ts6_sym][rsvd][0]} {pcie_phy_top_inst/gen_os_ctrl[ts6_sym][rsvd][1]} {pcie_phy_top_inst/gen_os_ctrl[ts6_sym][rsvd][2]} {pcie_phy_top_inst/gen_os_ctrl[ts6_sym][rsvd][3]} {pcie_phy_top_inst/gen_os_ctrl[ts6_sym][rsvd][4]} {pcie_phy_top_inst/gen_os_ctrl[ts6_sym][rsvd][5]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe5]
set_property port_width 4 [get_debug_ports u_ila_1/probe5]
connect_debug_port u_ila_1/probe5 [get_nets [list {dbg_rxdatak[0]} {dbg_rxdatak[1]} {dbg_rxdatak[2]} {dbg_rxdatak[3]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe6]
set_property port_width 4 [get_debug_ports u_ila_1/probe6]
connect_debug_port u_ila_1/probe6 [get_nets [list {dbg_txdatak[0]} {dbg_txdatak[1]} {dbg_txdatak[2]} {dbg_txdatak[3]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe7]
set_property port_width 21 [get_debug_ports u_ila_1/probe7]
connect_debug_port u_ila_1/probe7 [get_nets [list {debug_state[0]} {debug_state[1]} {debug_state[2]} {debug_state[3]} {debug_state[4]} {debug_state[5]} {debug_state[6]} {debug_state[7]} {debug_state[8]} {debug_state[9]} {debug_state[10]} {debug_state[11]} {debug_state[12]} {debug_state[13]} {debug_state[14]} {debug_state[15]} {debug_state[16]} {debug_state[17]} {debug_state[18]} {debug_state[19]} {debug_state[20]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe8]
set_property port_width 32 [get_debug_ports u_ila_1/probe8]
connect_debug_port u_ila_1/probe8 [get_nets [list {dbg_rxdata[0]} {dbg_rxdata[1]} {dbg_rxdata[2]} {dbg_rxdata[3]} {dbg_rxdata[4]} {dbg_rxdata[5]} {dbg_rxdata[6]} {dbg_rxdata[7]} {dbg_rxdata[8]} {dbg_rxdata[9]} {dbg_rxdata[10]} {dbg_rxdata[11]} {dbg_rxdata[12]} {dbg_rxdata[13]} {dbg_rxdata[14]} {dbg_rxdata[15]} {dbg_rxdata[16]} {dbg_rxdata[17]} {dbg_rxdata[18]} {dbg_rxdata[19]} {dbg_rxdata[20]} {dbg_rxdata[21]} {dbg_rxdata[22]} {dbg_rxdata[23]} {dbg_rxdata[24]} {dbg_rxdata[25]} {dbg_rxdata[26]} {dbg_rxdata[27]} {dbg_rxdata[28]} {dbg_rxdata[29]} {dbg_rxdata[30]} {dbg_rxdata[31]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe9]
set_property port_width 3 [get_debug_ports u_ila_1/probe9]
connect_debug_port u_ila_1/probe9 [get_nets [list {dbg_rxstatus[0]} {dbg_rxstatus[1]} {dbg_rxstatus[2]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe10]
set_property port_width 32 [get_debug_ports u_ila_1/probe10]
connect_debug_port u_ila_1/probe10 [get_nets [list {dbg_txdata[0]} {dbg_txdata[1]} {dbg_txdata[2]} {dbg_txdata[3]} {dbg_txdata[4]} {dbg_txdata[5]} {dbg_txdata[6]} {dbg_txdata[7]} {dbg_txdata[8]} {dbg_txdata[9]} {dbg_txdata[10]} {dbg_txdata[11]} {dbg_txdata[12]} {dbg_txdata[13]} {dbg_txdata[14]} {dbg_txdata[15]} {dbg_txdata[16]} {dbg_txdata[17]} {dbg_txdata[18]} {dbg_txdata[19]} {dbg_txdata[20]} {dbg_txdata[21]} {dbg_txdata[22]} {dbg_txdata[23]} {dbg_txdata[24]} {dbg_txdata[25]} {dbg_txdata[26]} {dbg_txdata[27]} {dbg_txdata[28]} {dbg_txdata[29]} {dbg_txdata[30]} {dbg_txdata[31]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe11]
set_property port_width 5 [get_debug_ports u_ila_1/probe11]
connect_debug_port u_ila_1/probe11 [get_nets [list {pipe_wrapper_i/rxvalid_cnt[0]} {pipe_wrapper_i/rxvalid_cnt[1]} {pipe_wrapper_i/rxvalid_cnt[2]} {pipe_wrapper_i/rxvalid_cnt[3]} {pipe_wrapper_i/rxvalid_cnt[4]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe12]
set_property port_width 32 [get_debug_ports u_ila_1/probe12]
connect_debug_port u_ila_1/probe12 [get_nets [list {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[0]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[1]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[2]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[3]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[4]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[5]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[6]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[7]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[8]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[9]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[10]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[11]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[12]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[13]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[14]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[15]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[16]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[17]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[18]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[19]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[20]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[21]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[22]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[23]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[24]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[25]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[26]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[27]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[28]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[29]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[30]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[31]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe13]
set_property port_width 16 [get_debug_ports u_ila_1/probe13]
connect_debug_port u_ila_1/probe13 [get_nets [list {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/dbg_lower_skid_data_dllp[0]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/dbg_lower_skid_data_dllp[1]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/dbg_lower_skid_data_dllp[2]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/dbg_lower_skid_data_dllp[3]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/dbg_lower_skid_data_dllp[4]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/dbg_lower_skid_data_dllp[5]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/dbg_lower_skid_data_dllp[6]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/dbg_lower_skid_data_dllp[7]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/dbg_lower_skid_data_dllp[8]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/dbg_lower_skid_data_dllp[9]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/dbg_lower_skid_data_dllp[10]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/dbg_lower_skid_data_dllp[11]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/dbg_lower_skid_data_dllp[12]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/dbg_lower_skid_data_dllp[13]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/dbg_lower_skid_data_dllp[14]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/dbg_lower_skid_data_dllp[15]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe14]
set_property port_width 16 [get_debug_ports u_ila_1/probe14]
connect_debug_port u_ila_1/probe14 [get_nets [list {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_reversed[0]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_reversed[1]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_reversed[2]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_reversed[3]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_reversed[4]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_reversed[5]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_reversed[6]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_reversed[7]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_reversed[8]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_reversed[9]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_reversed[10]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_reversed[11]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_reversed[12]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_reversed[13]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_reversed[14]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_reversed[15]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe15]
set_property port_width 5 [get_debug_ports u_ila_1/probe15]
connect_debug_port u_ila_1/probe15 [get_nets [list {pcie_phy_top_inst/pcie_datalink_layer_inst/pcie_flow_ctrl_init_inst/curr_state[0]} {pcie_phy_top_inst/pcie_datalink_layer_inst/pcie_flow_ctrl_init_inst/curr_state[1]} {pcie_phy_top_inst/pcie_datalink_layer_inst/pcie_flow_ctrl_init_inst/curr_state[2]} {pcie_phy_top_inst/pcie_datalink_layer_inst/pcie_flow_ctrl_init_inst/curr_state[3]} {pcie_phy_top_inst/pcie_datalink_layer_inst/pcie_flow_ctrl_init_inst/curr_state[4]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe16]
set_property port_width 2 [get_debug_ports u_ila_1/probe16]
connect_debug_port u_ila_1/probe16 [get_nets [list {pcie_phy_top_inst/pcie_datalink_layer_inst/link_status[0]} {pcie_phy_top_inst/pcie_datalink_layer_inst/link_status[1]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe17]
set_property port_width 8 [get_debug_ports u_ila_1/probe17]
connect_debug_port u_ila_1/probe17 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts2_cnt[0]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts2_cnt[1]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts2_cnt[2]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts2_cnt[3]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts2_cnt[4]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts2_cnt[5]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts2_cnt[6]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts2_cnt[7]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe18]
set_property port_width 8 [get_debug_ports u_ila_1/probe18]
connect_debug_port u_ila_1/probe18 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts1_cnt[0]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts1_cnt[1]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts1_cnt[2]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts1_cnt[3]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts1_cnt[4]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts1_cnt[5]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts1_cnt[6]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts1_cnt[7]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe19]
set_property port_width 16 [get_debug_ports u_ila_1/probe19]
connect_debug_port u_ila_1/probe19 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[0]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[1]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[2]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[3]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[4]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[5]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[6]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[7]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[8]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[9]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[10]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[11]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[12]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[13]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[14]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[15]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe20]
set_property port_width 1 [get_debug_ports u_ila_1/probe20]
connect_debug_port u_ila_1/probe20 [get_nets [list dbg_phystatus]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe21]
set_property port_width 1 [get_debug_ports u_ila_1/probe21]
connect_debug_port u_ila_1/probe21 [get_nets [list dbg_rxelecidle]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe22]
set_property port_width 1 [get_debug_ports u_ila_1/probe22]
connect_debug_port u_ila_1/probe22 [get_nets [list dbg_txdetectrx]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe23]
set_property port_width 1 [get_debug_ports u_ila_1/probe23]
connect_debug_port u_ila_1/probe23 [get_nets [list dbg_txelecidle]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe24]
set_property port_width 1 [get_debug_ports u_ila_1/probe24]
connect_debug_port u_ila_1/probe24 [get_nets [list {pcie_phy_top_inst/gen_os_ctrl[gen2_eieos]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe25]
set_property port_width 1 [get_debug_ports u_ila_1/probe25]
connect_debug_port u_ila_1/probe25 [get_nets [list {pcie_phy_top_inst/gen_os_ctrl[gen3_eieos]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe26]
set_property port_width 1 [get_debug_ports u_ila_1/probe26]
connect_debug_port u_ila_1/probe26 [get_nets [list {pcie_phy_top_inst/gen_os_ctrl[gen_eios]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe27]
set_property port_width 1 [get_debug_ports u_ila_1/probe27]
connect_debug_port u_ila_1/probe27 [get_nets [list {pcie_phy_top_inst/gen_os_ctrl[gen_idle]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe28]
set_property port_width 1 [get_debug_ports u_ila_1/probe28]
connect_debug_port u_ila_1/probe28 [get_nets [list {pcie_phy_top_inst/gen_os_ctrl[gen_skp]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe29]
set_property port_width 1 [get_debug_ports u_ila_1/probe29]
connect_debug_port u_ila_1/probe29 [get_nets [list {pcie_phy_top_inst/gen_os_ctrl[gen_ts1]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe30]
set_property port_width 1 [get_debug_ports u_ila_1/probe30]
connect_debug_port u_ila_1/probe30 [get_nets [list {pcie_phy_top_inst/gen_os_ctrl[gen_ts2]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe31]
set_property port_width 1 [get_debug_ports u_ila_1/probe31]
connect_debug_port u_ila_1/probe31 [get_nets [list {pcie_phy_top_inst/gen_os_ctrl[rate_id][autonomous_change]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe32]
set_property port_width 1 [get_debug_ports u_ila_1/probe32]
connect_debug_port u_ila_1/probe32 [get_nets [list {pcie_phy_top_inst/gen_os_ctrl[rate_id][rsvd0]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe33]
set_property port_width 1 [get_debug_ports u_ila_1/probe33]
connect_debug_port u_ila_1/probe33 [get_nets [list {pcie_phy_top_inst/gen_os_ctrl[rate_id][speed_change]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe34]
set_property port_width 1 [get_debug_ports u_ila_1/probe34]
connect_debug_port u_ila_1/probe34 [get_nets [list {pcie_phy_top_inst/gen_os_ctrl[set_lane]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe35]
set_property port_width 1 [get_debug_ports u_ila_1/probe35]
connect_debug_port u_ila_1/probe35 [get_nets [list {pcie_phy_top_inst/gen_os_ctrl[set_link]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe36]
set_property port_width 1 [get_debug_ports u_ila_1/probe36]
connect_debug_port u_ila_1/probe36 [get_nets [list {pcie_phy_top_inst/gen_os_ctrl[set_speed_change]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe37]
set_property port_width 1 [get_debug_ports u_ila_1/probe37]
connect_debug_port u_ila_1/probe37 [get_nets [list {pcie_phy_top_inst/gen_os_ctrl[ts6_sym][quience_guarantee]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe38]
set_property port_width 1 [get_debug_ports u_ila_1/probe38]
connect_debug_port u_ila_1/probe38 [get_nets [list {pcie_phy_top_inst/gen_os_ctrl[ts6_sym][req_equal]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe39]
set_property port_width 1 [get_debug_ports u_ila_1/probe39]
connect_debug_port u_ila_1/probe39 [get_nets [list {pcie_phy_top_inst/gen_os_ctrl[valid]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe40]
set_property port_width 1 [get_debug_ports u_ila_1/probe40]
connect_debug_port u_ila_1/probe40 [get_nets [list pipe_wrapper_i/gt_rxvalid]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe41]
set_property port_width 1 [get_debug_ports u_ila_1/probe41]
connect_debug_port u_ila_1/probe41 [get_nets [list pcie_phy_top_inst/idle_valid]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe42]
set_property port_width 1 [get_debug_ports u_ila_1/probe42]
connect_debug_port u_ila_1/probe42 [get_nets [list pcie_phy_top_inst/lane_status]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe43]
set_property port_width 1 [get_debug_ports u_ila_1/probe43]
connect_debug_port u_ila_1/probe43 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst/link_idle_satisfied]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe44]
set_property port_width 1 [get_debug_ports u_ila_1/probe44]
connect_debug_port u_ila_1/probe44 [get_nets [list link_up]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe45]
set_property port_width 1 [get_debug_ports u_ila_1/probe45]
connect_debug_port u_ila_1/probe45 [get_nets [list pcie_phy_top_inst/ordered_set_tranmitted]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe46]
set_property port_width 1 [get_debug_ports u_ila_1/probe46]
connect_debug_port u_ila_1/probe46 [get_nets [list pipe_wrapper_i/rst_idle_reg]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe47]
set_property port_width 1 [get_debug_ports u_ila_1/probe47]
connect_debug_port u_ila_1/probe47 [get_nets [list pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/pcie_cfg_wrapper_inst/s_axis_tvalid]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe48]
set_property port_width 1 [get_debug_ports u_ila_1/probe48]
connect_debug_port u_ila_1/probe48 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst/single_idle_received]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe49]
set_property port_width 1 [get_debug_ports u_ila_1/probe49]
connect_debug_port u_ila_1/probe49 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst/single_ts1_received]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe50]
set_property port_width 1 [get_debug_ports u_ila_1/probe50]
connect_debug_port u_ila_1/probe50 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst/single_ts2_received]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe51]
set_property port_width 1 [get_debug_ports u_ila_1/probe51]
connect_debug_port u_ila_1/probe51 [get_nets [list pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tvalid]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe52]
set_property port_width 1 [get_debug_ports u_ila_1/probe52]
connect_debug_port u_ila_1/probe52 [get_nets [list pcie_phy_top_inst/ts1_valid]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe53]
set_property port_width 1 [get_debug_ports u_ila_1/probe53]
connect_debug_port u_ila_1/probe53 [get_nets [list pcie_phy_top_inst/ts2_valid]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe54]
set_property port_width 1 [get_debug_ports u_ila_1/probe54]
connect_debug_port u_ila_1/probe54 [get_nets [list tx_elec_idle]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets PIPE_PCLK_IN]
