

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 2 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 4096 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list in_module_mmcm.pipe_clock_i/CLK]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 1 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {pcie_phy_top_inst/phy_phystatus[0]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 1 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {pcie_phy_top_inst/phy_rxelecidle[0]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 3 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {pcie_phy_top_inst/phy_rxstatus[0]} {pcie_phy_top_inst/phy_rxstatus[1]} {pcie_phy_top_inst/phy_rxstatus[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 32 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {pcie_phy_top_inst/phy_txdata[0]} {pcie_phy_top_inst/phy_txdata[1]} {pcie_phy_top_inst/phy_txdata[2]} {pcie_phy_top_inst/phy_txdata[3]} {pcie_phy_top_inst/phy_txdata[4]} {pcie_phy_top_inst/phy_txdata[5]} {pcie_phy_top_inst/phy_txdata[6]} {pcie_phy_top_inst/phy_txdata[7]} {pcie_phy_top_inst/phy_txdata[8]} {pcie_phy_top_inst/phy_txdata[9]} {pcie_phy_top_inst/phy_txdata[10]} {pcie_phy_top_inst/phy_txdata[11]} {pcie_phy_top_inst/phy_txdata[12]} {pcie_phy_top_inst/phy_txdata[13]} {pcie_phy_top_inst/phy_txdata[14]} {pcie_phy_top_inst/phy_txdata[15]} {pcie_phy_top_inst/phy_txdata[16]} {pcie_phy_top_inst/phy_txdata[17]} {pcie_phy_top_inst/phy_txdata[18]} {pcie_phy_top_inst/phy_txdata[19]} {pcie_phy_top_inst/phy_txdata[20]} {pcie_phy_top_inst/phy_txdata[21]} {pcie_phy_top_inst/phy_txdata[22]} {pcie_phy_top_inst/phy_txdata[23]} {pcie_phy_top_inst/phy_txdata[24]} {pcie_phy_top_inst/phy_txdata[25]} {pcie_phy_top_inst/phy_txdata[26]} {pcie_phy_top_inst/phy_txdata[27]} {pcie_phy_top_inst/phy_txdata[28]} {pcie_phy_top_inst/phy_txdata[29]} {pcie_phy_top_inst/phy_txdata[30]} {pcie_phy_top_inst/phy_txdata[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 4 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {pcie_phy_top_inst/phy_txdatak[0]} {pcie_phy_top_inst/phy_txdatak[1]} {pcie_phy_top_inst/phy_txdatak[2]} {pcie_phy_top_inst/phy_txdatak[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 20 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[0]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[1]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[2]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[3]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[4]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[5]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[6]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[7]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[8]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[9]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[10]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[11]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[12]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[13]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[14]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[15]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[16]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[17]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[18]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[19]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 8 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].idle_cnt[0]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].idle_cnt[1]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].idle_cnt[2]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].idle_cnt[3]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].idle_cnt[4]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].idle_cnt[5]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].idle_cnt[6]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].idle_cnt[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 8 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts1_cnt[0]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts1_cnt[1]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts1_cnt[2]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts1_cnt[3]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts1_cnt[4]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts1_cnt[5]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts1_cnt[6]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts1_cnt[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 8 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts2_cnt[0]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts2_cnt[1]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts2_cnt[2]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts2_cnt[3]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts2_cnt[4]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts2_cnt[5]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts2_cnt[6]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts2_cnt[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 20 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/next_state[0]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/next_state[1]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/next_state[2]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/next_state[3]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/next_state[4]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/next_state[5]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/next_state[6]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/next_state[7]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/next_state[8]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/next_state[9]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/next_state[10]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/next_state[11]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/next_state[12]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/next_state[13]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/next_state[14]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/next_state[15]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/next_state[16]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/next_state[17]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/next_state[18]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/next_state[19]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 8 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_c[symbols][0][0]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_c[symbols][0][1]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_c[symbols][0][2]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_c[symbols][0][3]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_c[symbols][0][4]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_c[symbols][0][5]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_c[symbols][0][6]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_c[symbols][0][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 8 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_c[symbols][1][0]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_c[symbols][1][1]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_c[symbols][1][2]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_c[symbols][1][3]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_c[symbols][1][4]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_c[symbols][1][5]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_c[symbols][1][6]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_c[symbols][1][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 8 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_c[symbols][2][0]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_c[symbols][2][1]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_c[symbols][2][2]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_c[symbols][2][3]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_c[symbols][2][4]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_c[symbols][2][5]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_c[symbols][2][6]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_c[symbols][2][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 8 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_c[symbols][3][0]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_c[symbols][3][1]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_c[symbols][3][2]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_c[symbols][3][3]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_c[symbols][3][4]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_c[symbols][3][5]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_c[symbols][3][6]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_c[symbols][3][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 8 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_c[symbols][4][0]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_c[symbols][4][1]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_c[symbols][4][2]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_c[symbols][4][3]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_c[symbols][4][4]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_c[symbols][4][5]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_c[symbols][4][6]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_c[symbols][4][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 64 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[0]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[1]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[2]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[3]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[4]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[5]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[6]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[7]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[8]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[9]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[10]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[11]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[12]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[13]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[14]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[15]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[16]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[17]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[18]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[19]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[20]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[21]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[22]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[23]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[24]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[25]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[26]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[27]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[28]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[29]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[30]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[31]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[32]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[33]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[34]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[35]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[36]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[37]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[38]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[39]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[40]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[41]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[42]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[43]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[44]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[45]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[46]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[47]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[48]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[49]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[50]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[51]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[52]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[53]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[54]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[55]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[56]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[57]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[58]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[59]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[60]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[61]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[62]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_c[63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 64 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[0]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[1]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[2]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[3]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[4]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[5]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[6]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[7]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[8]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[9]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[10]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[11]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[12]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[13]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[14]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[15]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[16]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[17]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[18]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[19]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[20]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[21]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[22]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[23]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[24]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[25]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[26]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[27]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[28]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[29]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[30]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[31]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[32]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[33]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[34]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[35]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[36]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[37]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[38]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[39]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[40]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[41]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[42]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[43]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[44]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[45]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[46]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[47]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[48]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[49]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[50]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[51]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[52]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[53]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[54]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[55]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[56]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[57]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[58]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[59]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[60]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[61]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[62]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 1 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst/error_c]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 1 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst/error_r]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 1 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].first_ts1}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 1 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list pcie_phy_top_inst/n_1_0]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 1 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list pcie_phy_top_inst/n_1_1]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 1 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list pcie_phy_top_inst/n_1_2]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 1 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list pcie_phy_top_inst/n_1_3]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 1 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list pcie_phy_top_inst/n_1_4]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 1 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list pcie_phy_top_inst/n_1_5]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 1 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_tranmitted_r]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
set_property port_width 1 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst_n_29]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
set_property port_width 1 [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst_n_30]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
set_property port_width 1 [get_debug_ports u_ila_0/probe29]
connect_debug_port u_ila_0/probe29 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst_n_31]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe30]
set_property port_width 1 [get_debug_ports u_ila_0/probe30]
connect_debug_port u_ila_0/probe30 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst_n_32]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe31]
set_property port_width 1 [get_debug_ports u_ila_0/probe31]
connect_debug_port u_ila_0/probe31 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst_n_33]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe32]
set_property port_width 1 [get_debug_ports u_ila_0/probe32]
connect_debug_port u_ila_0/probe32 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst_n_34]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe33]
set_property port_width 1 [get_debug_ports u_ila_0/probe33]
connect_debug_port u_ila_0/probe33 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst_n_35]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe34]
set_property port_width 1 [get_debug_ports u_ila_0/probe34]
connect_debug_port u_ila_0/probe34 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst_n_36]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe35]
set_property port_width 1 [get_debug_ports u_ila_0/probe35]
connect_debug_port u_ila_0/probe35 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst_n_37]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe36]
set_property port_width 1 [get_debug_ports u_ila_0/probe36]
connect_debug_port u_ila_0/probe36 [get_nets [list pcie_phy_top_inst/phy_phystatus_rst]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe37]
set_property port_width 1 [get_debug_ports u_ila_0/probe37]
connect_debug_port u_ila_0/probe37 [get_nets [list pcie_phy_top_inst/phy_ready_en]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe38]
set_property port_width 1 [get_debug_ports u_ila_0/probe38]
connect_debug_port u_ila_0/probe38 [get_nets [list pcie_phy_top_inst/phy_transmit_inst_n_33]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe39]
set_property port_width 1 [get_debug_ports u_ila_0/probe39]
connect_debug_port u_ila_0/probe39 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst/success_c]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe40]
set_property port_width 1 [get_debug_ports u_ila_0/probe40]
connect_debug_port u_ila_0/probe40 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst/success_r]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe41]
set_property port_width 1 [get_debug_ports u_ila_0/probe41]
connect_debug_port u_ila_0/probe41 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst/ts1_cnt_satisfied]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe42]
set_property port_width 1 [get_debug_ports u_ila_0/probe42]
connect_debug_port u_ila_0/probe42 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst/ts2_cnt_satisfied]]
create_debug_core u_ila_1 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_1]
set_property ALL_PROBE_SAME_MU_CNT 2 [get_debug_cores u_ila_1]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_1]
set_property C_DATA_DEPTH 4096 [get_debug_cores u_ila_1]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_1]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_1]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_1]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_1]
set_property port_width 1 [get_debug_ports u_ila_1/clk]
connect_debug_port u_ila_1/clk [get_nets [list pcie_phy_top_inst/n_0_1490_BUFG]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe0]
set_property port_width 1 [get_debug_ports u_ila_1/probe0]
connect_debug_port u_ila_1/probe0 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst_n_18]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe1]
set_property port_width 1 [get_debug_ports u_ila_1/probe1]
connect_debug_port u_ila_1/probe1 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst_n_19]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe2]
set_property port_width 1 [get_debug_ports u_ila_1/probe2]
connect_debug_port u_ila_1/probe2 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst_n_20]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe3]
set_property port_width 1 [get_debug_ports u_ila_1/probe3]
connect_debug_port u_ila_1/probe3 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst_n_21]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe4]
set_property port_width 1 [get_debug_ports u_ila_1/probe4]
connect_debug_port u_ila_1/probe4 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst_n_22]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe5]
set_property port_width 1 [get_debug_ports u_ila_1/probe5]
connect_debug_port u_ila_1/probe5 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst_n_23]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe6]
set_property port_width 1 [get_debug_ports u_ila_1/probe6]
connect_debug_port u_ila_1/probe6 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst_n_24]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe7]
set_property port_width 1 [get_debug_ports u_ila_1/probe7]
connect_debug_port u_ila_1/probe7 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst_n_25]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe8]
set_property port_width 1 [get_debug_ports u_ila_1/probe8]
connect_debug_port u_ila_1/probe8 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst_n_26]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe9]
set_property port_width 1 [get_debug_ports u_ila_1/probe9]
connect_debug_port u_ila_1/probe9 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst_n_27]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe10]
set_property port_width 1 [get_debug_ports u_ila_1/probe10]
connect_debug_port u_ila_1/probe10 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst_n_28]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets u_ila_1_n_0_1490_BUFG]