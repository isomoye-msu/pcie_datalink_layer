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
connect_debug_port u_ila_0/clk [get_nets [list in_module_mmcm.pipe_clock_i/CLK]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 8 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {pcie_phy_top_inst/phy_receive_inst/gen_lane_descramble[0].ordered_set_handler_inst/curr_state[0]} {pcie_phy_top_inst/phy_receive_inst/gen_lane_descramble[0].ordered_set_handler_inst/curr_state[1]} {pcie_phy_top_inst/phy_receive_inst/gen_lane_descramble[0].ordered_set_handler_inst/curr_state[2]} {pcie_phy_top_inst/phy_receive_inst/gen_lane_descramble[0].ordered_set_handler_inst/curr_state[3]} {pcie_phy_top_inst/phy_receive_inst/gen_lane_descramble[0].ordered_set_handler_inst/curr_state[4]} {pcie_phy_top_inst/phy_receive_inst/gen_lane_descramble[0].ordered_set_handler_inst/curr_state[5]} {pcie_phy_top_inst/phy_receive_inst/gen_lane_descramble[0].ordered_set_handler_inst/curr_state[6]} {pcie_phy_top_inst/phy_receive_inst/gen_lane_descramble[0].ordered_set_handler_inst/curr_state[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 21 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {pcie_phy_top_inst/ltssm_debug_state[0]} {pcie_phy_top_inst/ltssm_debug_state[1]} {pcie_phy_top_inst/ltssm_debug_state[2]} {pcie_phy_top_inst/ltssm_debug_state[3]} {pcie_phy_top_inst/ltssm_debug_state[4]} {pcie_phy_top_inst/ltssm_debug_state[5]} {pcie_phy_top_inst/ltssm_debug_state[6]} {pcie_phy_top_inst/ltssm_debug_state[7]} {pcie_phy_top_inst/ltssm_debug_state[8]} {pcie_phy_top_inst/ltssm_debug_state[9]} {pcie_phy_top_inst/ltssm_debug_state[10]} {pcie_phy_top_inst/ltssm_debug_state[11]} {pcie_phy_top_inst/ltssm_debug_state[12]} {pcie_phy_top_inst/ltssm_debug_state[13]} {pcie_phy_top_inst/ltssm_debug_state[14]} {pcie_phy_top_inst/ltssm_debug_state[15]} {pcie_phy_top_inst/ltssm_debug_state[16]} {pcie_phy_top_inst/ltssm_debug_state[17]} {pcie_phy_top_inst/ltssm_debug_state[18]} {pcie_phy_top_inst/ltssm_debug_state[19]} {pcie_phy_top_inst/ltssm_debug_state[20]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 1 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {pcie_phy_top_inst/phy_phystatus[0]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 1 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {pcie_phy_top_inst/phy_rxelecidle[0]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 3 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {pcie_phy_top_inst/phy_rxstatus[0]} {pcie_phy_top_inst/phy_rxstatus[1]} {pcie_phy_top_inst/phy_rxstatus[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 32 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {pcie_phy_top_inst/phy_txdata[0]} {pcie_phy_top_inst/phy_txdata[1]} {pcie_phy_top_inst/phy_txdata[2]} {pcie_phy_top_inst/phy_txdata[3]} {pcie_phy_top_inst/phy_txdata[4]} {pcie_phy_top_inst/phy_txdata[5]} {pcie_phy_top_inst/phy_txdata[6]} {pcie_phy_top_inst/phy_txdata[7]} {pcie_phy_top_inst/phy_txdata[8]} {pcie_phy_top_inst/phy_txdata[9]} {pcie_phy_top_inst/phy_txdata[10]} {pcie_phy_top_inst/phy_txdata[11]} {pcie_phy_top_inst/phy_txdata[12]} {pcie_phy_top_inst/phy_txdata[13]} {pcie_phy_top_inst/phy_txdata[14]} {pcie_phy_top_inst/phy_txdata[15]} {pcie_phy_top_inst/phy_txdata[16]} {pcie_phy_top_inst/phy_txdata[17]} {pcie_phy_top_inst/phy_txdata[18]} {pcie_phy_top_inst/phy_txdata[19]} {pcie_phy_top_inst/phy_txdata[20]} {pcie_phy_top_inst/phy_txdata[21]} {pcie_phy_top_inst/phy_txdata[22]} {pcie_phy_top_inst/phy_txdata[23]} {pcie_phy_top_inst/phy_txdata[24]} {pcie_phy_top_inst/phy_txdata[25]} {pcie_phy_top_inst/phy_txdata[26]} {pcie_phy_top_inst/phy_txdata[27]} {pcie_phy_top_inst/phy_txdata[28]} {pcie_phy_top_inst/phy_txdata[29]} {pcie_phy_top_inst/phy_txdata[30]} {pcie_phy_top_inst/phy_txdata[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 4 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {pcie_phy_top_inst/phy_txdatak[0]} {pcie_phy_top_inst/phy_txdatak[1]} {pcie_phy_top_inst/phy_txdatak[2]} {pcie_phy_top_inst/phy_txdatak[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 20 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[0]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[1]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[2]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[3]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[4]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[5]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[6]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[7]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[8]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[9]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[10]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[11]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[12]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[13]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[14]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[15]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[16]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[17]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[18]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[19]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 8 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].idle_cnt[0]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].idle_cnt[1]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].idle_cnt[2]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].idle_cnt[3]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].idle_cnt[4]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].idle_cnt[5]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].idle_cnt[6]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].idle_cnt[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 8 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts1_cnt[0]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts1_cnt[1]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts1_cnt[2]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts1_cnt[3]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts1_cnt[4]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts1_cnt[5]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts1_cnt[6]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts1_cnt[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 8 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts2_cnt[0]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts2_cnt[1]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts2_cnt[2]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts2_cnt[3]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts2_cnt[4]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts2_cnt[5]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts2_cnt[6]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts2_cnt[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 8 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][0][0]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][0][1]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][0][2]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][0][3]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][0][4]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][0][5]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][0][6]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][0][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 8 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][10][0]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][10][1]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][10][2]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][10][3]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][10][4]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][10][5]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][10][6]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][10][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 8 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][11][0]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][11][1]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][11][2]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][11][3]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][11][4]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][11][5]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][11][6]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][11][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 8 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][12][0]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][12][1]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][12][2]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][12][3]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][12][4]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][12][5]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][12][6]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][12][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 8 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][13][0]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][13][1]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][13][2]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][13][3]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][13][4]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][13][5]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][13][6]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][13][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 8 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][14][0]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][14][1]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][14][2]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][14][3]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][14][4]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][14][5]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][14][6]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][14][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 8 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][15][0]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][15][1]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][15][2]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][15][3]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][15][4]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][15][5]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][15][6]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][15][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 8 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][1][0]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][1][1]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][1][2]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][1][3]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][1][4]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][1][5]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][1][6]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][1][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 8 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][2][0]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][2][1]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][2][2]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][2][3]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][2][4]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][2][5]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][2][6]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][2][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 8 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][3][0]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][3][1]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][3][2]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][3][3]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][3][4]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][3][5]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][3][6]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][3][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 8 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][4][0]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][4][1]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][4][2]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][4][3]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][4][4]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][4][5]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][4][6]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][4][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 8 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][5][0]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][5][1]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][5][2]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][5][3]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][5][4]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][5][5]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][5][6]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][5][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 8 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][6][0]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][6][1]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][6][2]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][6][3]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][6][4]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][6][5]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][6][6]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][6][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 8 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][7][0]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][7][1]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][7][2]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][7][3]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][7][4]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][7][5]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][7][6]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][7][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 8 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][8][0]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][8][1]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][8][2]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][8][3]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][8][4]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][8][5]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][8][6]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][8][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 8 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][9][0]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][9][1]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][9][2]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][9][3]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][9][4]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][9][5]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][9][6]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_r[symbols][9][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
set_property port_width 16 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[0]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[1]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[2]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[3]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[4]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[5]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[6]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[7]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[8]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[9]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[10]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[11]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[12]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[13]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[14]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
set_property port_width 64 [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[0]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[1]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[2]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[3]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[4]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[5]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[6]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[7]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[8]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[9]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[10]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[11]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[12]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[13]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[14]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[15]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[16]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[17]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[18]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[19]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[20]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[21]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[22]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[23]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[24]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[25]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[26]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[27]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[28]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[29]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[30]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[31]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[32]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[33]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[34]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[35]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[36]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[37]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[38]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[39]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[40]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[41]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[42]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[43]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[44]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[45]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[46]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[47]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[48]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[49]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[50]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[51]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[52]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[53]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[54]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[55]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[56]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[57]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[58]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[59]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[60]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[61]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[62]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/timer_r[63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
set_property port_width 5 [get_debug_ports u_ila_0/probe29]
connect_debug_port u_ila_0/probe29 [get_nets [list {pipe_wrapper_i/rxvalid_cnt[0]} {pipe_wrapper_i/rxvalid_cnt[1]} {pipe_wrapper_i/rxvalid_cnt[2]} {pipe_wrapper_i/rxvalid_cnt[3]} {pipe_wrapper_i/rxvalid_cnt[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe30]
set_property port_width 32 [get_debug_ports u_ila_0/probe30]
connect_debug_port u_ila_0/probe30 [get_nets [list {dbg_rxdata[0]} {dbg_rxdata[1]} {dbg_rxdata[2]} {dbg_rxdata[3]} {dbg_rxdata[4]} {dbg_rxdata[5]} {dbg_rxdata[6]} {dbg_rxdata[7]} {dbg_rxdata[8]} {dbg_rxdata[9]} {dbg_rxdata[10]} {dbg_rxdata[11]} {dbg_rxdata[12]} {dbg_rxdata[13]} {dbg_rxdata[14]} {dbg_rxdata[15]} {dbg_rxdata[16]} {dbg_rxdata[17]} {dbg_rxdata[18]} {dbg_rxdata[19]} {dbg_rxdata[20]} {dbg_rxdata[21]} {dbg_rxdata[22]} {dbg_rxdata[23]} {dbg_rxdata[24]} {dbg_rxdata[25]} {dbg_rxdata[26]} {dbg_rxdata[27]} {dbg_rxdata[28]} {dbg_rxdata[29]} {dbg_rxdata[30]} {dbg_rxdata[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe31]
set_property port_width 4 [get_debug_ports u_ila_0/probe31]
connect_debug_port u_ila_0/probe31 [get_nets [list {dbg_rxdatak[0]} {dbg_rxdatak[1]} {dbg_rxdatak[2]} {dbg_rxdatak[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe32]
set_property port_width 3 [get_debug_ports u_ila_0/probe32]
connect_debug_port u_ila_0/probe32 [get_nets [list {dbg_rxstatus[0]} {dbg_rxstatus[1]} {dbg_rxstatus[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe33]
set_property port_width 32 [get_debug_ports u_ila_0/probe33]
connect_debug_port u_ila_0/probe33 [get_nets [list {dbg_txdata[0]} {dbg_txdata[1]} {dbg_txdata[2]} {dbg_txdata[3]} {dbg_txdata[4]} {dbg_txdata[5]} {dbg_txdata[6]} {dbg_txdata[7]} {dbg_txdata[8]} {dbg_txdata[9]} {dbg_txdata[10]} {dbg_txdata[11]} {dbg_txdata[12]} {dbg_txdata[13]} {dbg_txdata[14]} {dbg_txdata[15]} {dbg_txdata[16]} {dbg_txdata[17]} {dbg_txdata[18]} {dbg_txdata[19]} {dbg_txdata[20]} {dbg_txdata[21]} {dbg_txdata[22]} {dbg_txdata[23]} {dbg_txdata[24]} {dbg_txdata[25]} {dbg_txdata[26]} {dbg_txdata[27]} {dbg_txdata[28]} {dbg_txdata[29]} {dbg_txdata[30]} {dbg_txdata[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe34]
set_property port_width 4 [get_debug_ports u_ila_0/probe34]
connect_debug_port u_ila_0/probe34 [get_nets [list {dbg_txdatak[0]} {dbg_txdatak[1]} {dbg_txdatak[2]} {dbg_txdatak[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe35]
set_property port_width 21 [get_debug_ports u_ila_0/probe35]
connect_debug_port u_ila_0/probe35 [get_nets [list {debug_state[0]} {debug_state[1]} {debug_state[2]} {debug_state[3]} {debug_state[4]} {debug_state[5]} {debug_state[6]} {debug_state[7]} {debug_state[8]} {debug_state[9]} {debug_state[10]} {debug_state[11]} {debug_state[12]} {debug_state[13]} {debug_state[14]} {debug_state[15]} {debug_state[16]} {debug_state[17]} {debug_state[18]} {debug_state[19]} {debug_state[20]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe36]
set_property port_width 3 [get_debug_ports u_ila_0/probe36]
connect_debug_port u_ila_0/probe36 [get_nets [list {phy_rxstatus[0]} {phy_rxstatus[1]} {phy_rxstatus[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe37]
set_property port_width 1 [get_debug_ports u_ila_0/probe37]
connect_debug_port u_ila_0/probe37 [get_nets [list dbg_phystatus]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe38]
set_property port_width 1 [get_debug_ports u_ila_0/probe38]
connect_debug_port u_ila_0/probe38 [get_nets [list dbg_rxelecidle]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe39]
set_property port_width 1 [get_debug_ports u_ila_0/probe39]
connect_debug_port u_ila_0/probe39 [get_nets [list dbg_txdetectrx]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe40]
set_property port_width 1 [get_debug_ports u_ila_0/probe40]
connect_debug_port u_ila_0/probe40 [get_nets [list dbg_txelecidle]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe41]
set_property port_width 1 [get_debug_ports u_ila_0/probe41]
connect_debug_port u_ila_0/probe41 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst/error_r]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe42]
set_property port_width 1 [get_debug_ports u_ila_0/probe42]
connect_debug_port u_ila_0/probe42 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].first_ts1}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe43]
set_property port_width 1 [get_debug_ports u_ila_0/probe43]
connect_debug_port u_ila_0/probe43 [get_nets [list pipe_wrapper_i/gt_rxvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe44]
set_property port_width 1 [get_debug_ports u_ila_0/probe44]
connect_debug_port u_ila_0/probe44 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst/idle_valid_r]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe45]
set_property port_width 1 [get_debug_ports u_ila_0/probe45]
connect_debug_port u_ila_0/probe45 [get_nets [list link_up]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe46]
set_property port_width 1 [get_debug_ports u_ila_0/probe46]
connect_debug_port u_ila_0/probe46 [get_nets [list pcie_phy_top_inst/n_1_0]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe47]
set_property port_width 1 [get_debug_ports u_ila_0/probe47]
connect_debug_port u_ila_0/probe47 [get_nets [list pcie_phy_top_inst/n_1_1]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe48]
set_property port_width 1 [get_debug_ports u_ila_0/probe48]
connect_debug_port u_ila_0/probe48 [get_nets [list pcie_phy_top_inst/n_1_2]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe49]
set_property port_width 1 [get_debug_ports u_ila_0/probe49]
connect_debug_port u_ila_0/probe49 [get_nets [list pcie_phy_top_inst/n_1_3]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe50]
set_property port_width 1 [get_debug_ports u_ila_0/probe50]
connect_debug_port u_ila_0/probe50 [get_nets [list pcie_phy_top_inst/n_1_5]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe51]
set_property port_width 1 [get_debug_ports u_ila_0/probe51]
connect_debug_port u_ila_0/probe51 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_tranmitted_r]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe52]
set_property port_width 1 [get_debug_ports u_ila_0/probe52]
connect_debug_port u_ila_0/probe52 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_tx_in_process_r]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe53]
set_property port_width 1 [get_debug_ports u_ila_0/probe53]
connect_debug_port u_ila_0/probe53 [get_nets [list pcie_phy_top_inst/phy_phystatus_rst]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe54]
set_property port_width 1 [get_debug_ports u_ila_0/probe54]
connect_debug_port u_ila_0/probe54 [get_nets [list pcie_phy_top_inst/phy_transmit_inst_n_33]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe55]
set_property port_width 1 [get_debug_ports u_ila_0/probe55]
connect_debug_port u_ila_0/probe55 [get_nets [list pipe_wrapper_i/rst_idle_reg]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe56]
set_property port_width 1 [get_debug_ports u_ila_0/probe56]
connect_debug_port u_ila_0/probe56 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst/single_idle_received]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe57]
set_property port_width 1 [get_debug_ports u_ila_0/probe57]
connect_debug_port u_ila_0/probe57 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst/success_r]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe58]
set_property port_width 1 [get_debug_ports u_ila_0/probe58]
connect_debug_port u_ila_0/probe58 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst/ts1_cnt_satisfied]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe59]
set_property port_width 1 [get_debug_ports u_ila_0/probe59]
connect_debug_port u_ila_0/probe59 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst/ts1_valid_r]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe60]
set_property port_width 1 [get_debug_ports u_ila_0/probe60]
connect_debug_port u_ila_0/probe60 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst/ts2_cnt_satisfied]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe61]
set_property port_width 1 [get_debug_ports u_ila_0/probe61]
connect_debug_port u_ila_0/probe61 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst/ts2_valid_r]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe62]
set_property port_width 1 [get_debug_ports u_ila_0/probe62]
connect_debug_port u_ila_0/probe62 [get_nets [list pcie_phy_top_inst/tx_elec_idle]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe63]
set_property port_width 1 [get_debug_ports u_ila_0/probe63]
connect_debug_port u_ila_0/probe63 [get_nets [list tx_elec_idle]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets PIPE_PCLK_IN]
