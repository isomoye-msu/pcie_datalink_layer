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
set_property C_DATA_DEPTH 16384 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list in_module_mmcm.pipe_clock_i/CLK]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 16 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[0]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[1]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[2]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[3]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[4]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[5]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[6]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[7]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[8]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[9]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[10]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[11]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[12]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[13]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[14]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 4 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts2_cnt[0]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts2_cnt[1]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts2_cnt[2]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts2_cnt[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 8 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts1_cnt[0]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts1_cnt[1]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts1_cnt[2]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts1_cnt[3]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts1_cnt[4]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts1_cnt[5]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts1_cnt[6]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts1_cnt[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 3 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {dbg_rxstatus[0]} {dbg_rxstatus[1]} {dbg_rxstatus[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 32 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {dbg_txdata[0]} {dbg_txdata[1]} {dbg_txdata[2]} {dbg_txdata[3]} {dbg_txdata[4]} {dbg_txdata[5]} {dbg_txdata[6]} {dbg_txdata[7]} {dbg_txdata[8]} {dbg_txdata[9]} {dbg_txdata[10]} {dbg_txdata[11]} {dbg_txdata[12]} {dbg_txdata[13]} {dbg_txdata[14]} {dbg_txdata[15]} {dbg_txdata[16]} {dbg_txdata[17]} {dbg_txdata[18]} {dbg_txdata[19]} {dbg_txdata[20]} {dbg_txdata[21]} {dbg_txdata[22]} {dbg_txdata[23]} {dbg_txdata[24]} {dbg_txdata[25]} {dbg_txdata[26]} {dbg_txdata[27]} {dbg_txdata[28]} {dbg_txdata[29]} {dbg_txdata[30]} {dbg_txdata[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 21 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {debug_state[0]} {debug_state[1]} {debug_state[2]} {debug_state[3]} {debug_state[4]} {debug_state[5]} {debug_state[6]} {debug_state[7]} {debug_state[8]} {debug_state[9]} {debug_state[10]} {debug_state[11]} {debug_state[12]} {debug_state[13]} {debug_state[14]} {debug_state[15]} {debug_state[16]} {debug_state[17]} {debug_state[18]} {debug_state[19]} {debug_state[20]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 5 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {pipe_wrapper_i/rxvalid_cnt[0]} {pipe_wrapper_i/rxvalid_cnt[1]} {pipe_wrapper_i/rxvalid_cnt[2]} {pipe_wrapper_i/rxvalid_cnt[3]} {pipe_wrapper_i/rxvalid_cnt[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 16 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/dbg_lower_skid_data_dllp[0]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/dbg_lower_skid_data_dllp[1]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/dbg_lower_skid_data_dllp[2]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/dbg_lower_skid_data_dllp[3]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/dbg_lower_skid_data_dllp[4]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/dbg_lower_skid_data_dllp[5]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/dbg_lower_skid_data_dllp[6]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/dbg_lower_skid_data_dllp[7]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/dbg_lower_skid_data_dllp[8]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/dbg_lower_skid_data_dllp[9]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/dbg_lower_skid_data_dllp[10]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/dbg_lower_skid_data_dllp[11]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/dbg_lower_skid_data_dllp[12]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/dbg_lower_skid_data_dllp[13]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/dbg_lower_skid_data_dllp[14]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/dbg_lower_skid_data_dllp[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 32 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[0]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[1]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[2]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[3]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[4]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[5]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[6]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[7]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[8]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[9]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[10]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[11]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[12]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[13]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[14]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[15]}  {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[16]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[17]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[18]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[19]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[20]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[21]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[22]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[23]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[24]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[25]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[26]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[27]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[28]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[29]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[30]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tdata[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 12 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/get_ack_nack_seq_return[0]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/get_ack_nack_seq_return[1]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/get_ack_nack_seq_return[2]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/get_ack_nack_seq_return[3]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/get_ack_nack_seq_return[4]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/get_ack_nack_seq_return[5]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/get_ack_nack_seq_return[6]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/get_ack_nack_seq_return[7]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/get_ack_nack_seq_return[8]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/get_ack_nack_seq_return[9]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/get_ack_nack_seq_return[10]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/get_ack_nack_seq_return[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 8 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_out[0]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_out[1]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_out[4]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_out[5]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_out[7]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_out[9]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_out[13]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_out[14]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 2 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/curr_state_0[0]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/curr_state_0[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 16 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_in_r[0]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_in_r[1]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_in_r[2]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_in_r[3]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_in_r[4]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_in_r[5]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_in_r[6]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_in_r[7]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_in_r[8]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_in_r[9]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_in_r[10]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_in_r[11]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_in_r[12]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_in_r[13]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_in_r[14]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_in_r[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 30 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {pcie_phy_top_inst/phy_receive_inst/descrambler_data[0]} {pcie_phy_top_inst/phy_receive_inst/descrambler_data[1]} {pcie_phy_top_inst/phy_receive_inst/descrambler_data[3]} {pcie_phy_top_inst/phy_receive_inst/descrambler_data[4]} {pcie_phy_top_inst/phy_receive_inst/descrambler_data[5]} {pcie_phy_top_inst/phy_receive_inst/descrambler_data[7]} {pcie_phy_top_inst/phy_receive_inst/descrambler_data[8]} {pcie_phy_top_inst/phy_receive_inst/descrambler_data[9]} {pcie_phy_top_inst/phy_receive_inst/descrambler_data[10]} {pcie_phy_top_inst/phy_receive_inst/descrambler_data[11]} {pcie_phy_top_inst/phy_receive_inst/descrambler_data[12]} {pcie_phy_top_inst/phy_receive_inst/descrambler_data[13]} {pcie_phy_top_inst/phy_receive_inst/descrambler_data[14]} {pcie_phy_top_inst/phy_receive_inst/descrambler_data[15]} {pcie_phy_top_inst/phy_receive_inst/descrambler_data[16]} {pcie_phy_top_inst/phy_receive_inst/descrambler_data[17]} {pcie_phy_top_inst/phy_receive_inst/descrambler_data[18]} {pcie_phy_top_inst/phy_receive_inst/descrambler_data[19]} {pcie_phy_top_inst/phy_receive_inst/descrambler_data[20]} {pcie_phy_top_inst/phy_receive_inst/descrambler_data[21]} {pcie_phy_top_inst/phy_receive_inst/descrambler_data[22]} {pcie_phy_top_inst/phy_receive_inst/descrambler_data[23]} {pcie_phy_top_inst/phy_receive_inst/descrambler_data[24]} {pcie_phy_top_inst/phy_receive_inst/descrambler_data[25]} {pcie_phy_top_inst/phy_receive_inst/descrambler_data[26]} {pcie_phy_top_inst/phy_receive_inst/descrambler_data[27]} {pcie_phy_top_inst/phy_receive_inst/descrambler_data[28]} {pcie_phy_top_inst/phy_receive_inst/descrambler_data[29]} {pcie_phy_top_inst/phy_receive_inst/descrambler_data[30]} {pcie_phy_top_inst/phy_receive_inst/descrambler_data[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 8 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {pcie_phy_top_inst/phy_receive_inst/gen_lane_descramble[0].ordered_set_handler_inst/curr_state[0]} {pcie_phy_top_inst/phy_receive_inst/gen_lane_descramble[0].ordered_set_handler_inst/curr_state[1]} {pcie_phy_top_inst/phy_receive_inst/gen_lane_descramble[0].ordered_set_handler_inst/curr_state[2]} {pcie_phy_top_inst/phy_receive_inst/gen_lane_descramble[0].ordered_set_handler_inst/curr_state[3]} {pcie_phy_top_inst/phy_receive_inst/gen_lane_descramble[0].ordered_set_handler_inst/curr_state[4]} {pcie_phy_top_inst/phy_receive_inst/gen_lane_descramble[0].ordered_set_handler_inst/curr_state[5]} {pcie_phy_top_inst/phy_receive_inst/gen_lane_descramble[0].ordered_set_handler_inst/curr_state[6]} {pcie_phy_top_inst/phy_receive_inst/gen_lane_descramble[0].ordered_set_handler_inst/curr_state[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 32 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {pcie_phy_top_inst/phy_transmit_inst/phy_axis_tdata[0]} {pcie_phy_top_inst/phy_transmit_inst/phy_axis_tdata[1]} {pcie_phy_top_inst/phy_transmit_inst/phy_axis_tdata[2]} {pcie_phy_top_inst/phy_transmit_inst/phy_axis_tdata[3]} {pcie_phy_top_inst/phy_transmit_inst/phy_axis_tdata[4]} {pcie_phy_top_inst/phy_transmit_inst/phy_axis_tdata[5]} {pcie_phy_top_inst/phy_transmit_inst/phy_axis_tdata[6]} {pcie_phy_top_inst/phy_transmit_inst/phy_axis_tdata[7]} {pcie_phy_top_inst/phy_transmit_inst/phy_axis_tdata[8]} {pcie_phy_top_inst/phy_transmit_inst/phy_axis_tdata[9]} {pcie_phy_top_inst/phy_transmit_inst/phy_axis_tdata[10]} {pcie_phy_top_inst/phy_transmit_inst/phy_axis_tdata[11]} {pcie_phy_top_inst/phy_transmit_inst/phy_axis_tdata[12]} {pcie_phy_top_inst/phy_transmit_inst/phy_axis_tdata[13]} {pcie_phy_top_inst/phy_transmit_inst/phy_axis_tdata[14]} {pcie_phy_top_inst/phy_transmit_inst/phy_axis_tdata[15]} {pcie_phy_top_inst/phy_transmit_inst/phy_axis_tdata[16]} {pcie_phy_top_inst/phy_transmit_inst/phy_axis_tdata[17]} {pcie_phy_top_inst/phy_transmit_inst/phy_axis_tdata[18]} {pcie_phy_top_inst/phy_transmit_inst/phy_axis_tdata[19]} {pcie_phy_top_inst/phy_transmit_inst/phy_axis_tdata[20]} {pcie_phy_top_inst/phy_transmit_inst/phy_axis_tdata[21]} {pcie_phy_top_inst/phy_transmit_inst/phy_axis_tdata[22]} {pcie_phy_top_inst/phy_transmit_inst/phy_axis_tdata[23]} {pcie_phy_top_inst/phy_transmit_inst/phy_axis_tdata[24]} {pcie_phy_top_inst/phy_transmit_inst/phy_axis_tdata[25]} {pcie_phy_top_inst/phy_transmit_inst/phy_axis_tdata[26]} {pcie_phy_top_inst/phy_transmit_inst/phy_axis_tdata[27]} {pcie_phy_top_inst/phy_transmit_inst/phy_axis_tdata[28]} {pcie_phy_top_inst/phy_transmit_inst/phy_axis_tdata[29]} {pcie_phy_top_inst/phy_transmit_inst/phy_axis_tdata[30]} {pcie_phy_top_inst/phy_transmit_inst/phy_axis_tdata[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 4 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {pcie_phy_top_inst/descrambler_data_k[0]} {pcie_phy_top_inst/descrambler_data_k[1]} {pcie_phy_top_inst/descrambler_data_k[2]} {pcie_phy_top_inst/descrambler_data_k[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 4 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {dbg_txdatak[0]} {dbg_txdatak[1]} {dbg_txdatak[2]} {dbg_txdatak[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 32 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list {dbg_rxdata[0]} {dbg_rxdata[1]} {dbg_rxdata[2]} {dbg_rxdata[3]} {dbg_rxdata[4]} {dbg_rxdata[5]} {dbg_rxdata[6]} {dbg_rxdata[7]} {dbg_rxdata[8]} {dbg_rxdata[9]} {dbg_rxdata[10]} {dbg_rxdata[11]} {dbg_rxdata[12]} {dbg_rxdata[13]} {dbg_rxdata[14]} {dbg_rxdata[15]} {dbg_rxdata[16]} {dbg_rxdata[17]} {dbg_rxdata[18]} {dbg_rxdata[19]} {dbg_rxdata[20]} {dbg_rxdata[21]} {dbg_rxdata[22]} {dbg_rxdata[23]} {dbg_rxdata[24]} {dbg_rxdata[25]} {dbg_rxdata[26]} {dbg_rxdata[27]} {dbg_rxdata[28]} {dbg_rxdata[29]} {dbg_rxdata[30]} {dbg_rxdata[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 4 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list {dbg_rxdatak[0]} {dbg_rxdatak[1]} {dbg_rxdatak[2]} {dbg_rxdatak[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 1 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list dbg_phystatus]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 1 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list dbg_rxelecidle]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 1 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list dbg_txdetectrx]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 1 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list dbg_txelecidle]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 1 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list pcie_phy_top_inst/descrambler_data_valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 1 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list {pcie_phy_top_inst/gen_os_ctrl[gen_eios]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 1 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list {pcie_phy_top_inst/gen_os_ctrl[gen_idle]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
set_property port_width 1 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list {pcie_phy_top_inst/gen_os_ctrl[gen_ts1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
set_property port_width 1 [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list {pcie_phy_top_inst/gen_os_ctrl[gen_ts2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
set_property port_width 1 [get_debug_ports u_ila_0/probe29]
connect_debug_port u_ila_0/probe29 [get_nets [list {pcie_phy_top_inst/gen_os_ctrl[set_lane]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe30]
set_property port_width 1 [get_debug_ports u_ila_0/probe30]
connect_debug_port u_ila_0/probe30 [get_nets [list {pcie_phy_top_inst/gen_os_ctrl[valid]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe31]
set_property port_width 1 [get_debug_ports u_ila_0/probe31]
connect_debug_port u_ila_0/probe31 [get_nets [list pipe_wrapper_i/gt_rxvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe32]
set_property port_width 1 [get_debug_ports u_ila_0/probe32]
connect_debug_port u_ila_0/probe32 [get_nets [list pcie_phy_top_inst/idle_valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe33]
set_property port_width 1 [get_debug_ports u_ila_0/probe33]
connect_debug_port u_ila_0/probe33 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst/link_idle_satisfied]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe34]
set_property port_width 1 [get_debug_ports u_ila_0/probe34]
connect_debug_port u_ila_0/probe34 [get_nets [list link_up]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe35]
set_property port_width 1 [get_debug_ports u_ila_0/probe35]
connect_debug_port u_ila_0/probe35 [get_nets [list pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/axis_register_inst/m_axis_tuser_reg]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe36]
set_property port_width 1 [get_debug_ports u_ila_0/probe36]
connect_debug_port u_ila_0/probe36 [get_nets [list pcie_phy_top_inst/ordered_set_tranmitted]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe37]
set_property port_width 1 [get_debug_ports u_ila_0/probe37]
connect_debug_port u_ila_0/probe37 [get_nets [list pipe_wrapper_i/rst_idle_reg]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe38]
set_property port_width 1 [get_debug_ports u_ila_0/probe38]
connect_debug_port u_ila_0/probe38 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst/single_idle_received]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe39]
set_property port_width 1 [get_debug_ports u_ila_0/probe39]
connect_debug_port u_ila_0/probe39 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst/single_ts1_received]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe40]
set_property port_width 1 [get_debug_ports u_ila_0/probe40]
connect_debug_port u_ila_0/probe40 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst/single_ts2_received]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe41]
set_property port_width 1 [get_debug_ports u_ila_0/probe41]
connect_debug_port u_ila_0/probe41 [get_nets [list pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/skid_s_axis_tvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe42]
set_property port_width 1 [get_debug_ports u_ila_0/probe42]
connect_debug_port u_ila_0/probe42 [get_nets [list pcie_phy_top_inst/ts1_valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe43]
set_property port_width 1 [get_debug_ports u_ila_0/probe43]
connect_debug_port u_ila_0/probe43 [get_nets [list pcie_phy_top_inst/ts2_valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe44]
set_property port_width 16 [get_debug_ports u_ila_0/probe44]
connect_debug_port u_ila_0/probe44 [get_nets [list {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_reversed[0]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_reversed[1]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_reversed[2]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_reversed[3]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_reversed[4]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_reversed[5]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_reversed[6]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_reversed[7]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_reversed[8]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_reversed[9]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_reversed[10]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_reversed[11]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_reversed[12]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_reversed[13]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_reversed[14]} {pcie_phy_top_inst/pcie_datalink_layer_inst/dllp_receive_inst/dllp_handler_inst/crc_reversed[15]}]]
