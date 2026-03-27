create_debug_core u_ila_0 ila
set_property C_DATA_DEPTH 2048 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
startgroup 
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0 ]
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0 ]
set_property ALL_PROBE_SAME_MU_CNT 2 [get_debug_cores u_ila_0 ]
endgroup
connect_debug_port u_ila_0/clk [get_nets [list in_module_mmcm.pipe_clock_i/CLK ]]
set_property port_width 20 [get_debug_ports u_ila_0/probe0]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[0]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[1]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[2]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[3]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[4]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[5]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[6]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[7]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[8]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[9]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[10]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[11]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[12]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[13]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[14]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[15]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[16]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[17]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[18]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/curr_state[19]} ]]
create_debug_port u_ila_0 probe
set_property port_width 8 [get_debug_ports u_ila_0/probe1]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].idle_cnt[0]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].idle_cnt[1]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].idle_cnt[2]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].idle_cnt[3]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].idle_cnt[4]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].idle_cnt[5]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].idle_cnt[6]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].idle_cnt[7]} ]]
create_debug_port u_ila_0 probe
set_property port_width 8 [get_debug_ports u_ila_0/probe2]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts1_cnt[0]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts1_cnt[1]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts1_cnt[2]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts1_cnt[3]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts1_cnt[4]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts1_cnt[5]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts1_cnt[6]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts1_cnt[7]} ]]
create_debug_port u_ila_0 probe
set_property port_width 8 [get_debug_ports u_ila_0/probe3]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts2_cnt[0]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts2_cnt[1]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts2_cnt[2]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts2_cnt[3]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts2_cnt[4]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts2_cnt[5]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts2_cnt[6]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].ts2_cnt[7]} ]]
create_debug_port u_ila_0 probe
set_property port_width 9 [get_debug_ports u_ila_0/probe4]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[0]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[1]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[2]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[3]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[4]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[5]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[6]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[7]} {pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_sent_cnt_r[8]} ]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {pcie_phy_top_inst/phy_phystatus[0]} ]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {pcie_phy_top_inst/phy_rxelecidle[0]} ]]
create_debug_port u_ila_0 probe
set_property port_width 3 [get_debug_ports u_ila_0/probe7]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {pcie_phy_top_inst/phy_rxstatus[0]} {pcie_phy_top_inst/phy_rxstatus[1]} {pcie_phy_top_inst/phy_rxstatus[2]} ]]
create_debug_port u_ila_0 probe
set_property port_width 17 [get_debug_ports u_ila_0/probe8]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {pcie_phy_top_inst/phy_txdata[0]} {pcie_phy_top_inst/phy_txdata[1]} {pcie_phy_top_inst/phy_txdata[2]} {pcie_phy_top_inst/phy_txdata[3]} {pcie_phy_top_inst/phy_txdata[4]} {pcie_phy_top_inst/phy_txdata[5]} {pcie_phy_top_inst/phy_txdata[6]} {pcie_phy_top_inst/phy_txdata[7]} {pcie_phy_top_inst/phy_txdata[8]} {pcie_phy_top_inst/phy_txdata[9]} {pcie_phy_top_inst/phy_txdata[10]} {pcie_phy_top_inst/phy_txdata[11]} {pcie_phy_top_inst/phy_txdata[12]} {pcie_phy_top_inst/phy_txdata[13]} {pcie_phy_top_inst/phy_txdata[14]} {pcie_phy_top_inst/phy_txdata[15]} {pcie_phy_top_inst/phy_txdata[16]} ]]
create_debug_port u_ila_0 probe
set_property port_width 4 [get_debug_ports u_ila_0/probe9]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {pcie_phy_top_inst/phy_txdatak[0]} {pcie_phy_top_inst/phy_txdatak[1]} {pcie_phy_top_inst/phy_txdatak[2]} {pcie_phy_top_inst/phy_txdatak[3]} ]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst/error_r ]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {pcie_phy_top_inst/pcie_ltssm_downstream_inst/gen_cnt_ts1[0].first_ts1} ]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst/idle_valid_r ]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe13]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_tranmitted_r ]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe14]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst/ordered_set_tx_in_process_r ]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe15]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list pcie_phy_top_inst/phy_phystatus_rst ]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe16]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst/single_idle_received ]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe17]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst/success_r ]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe18]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst/ts1_cnt_satisfied ]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe19]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst/ts1_valid_r ]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe20]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst/ts2_cnt_satisfied ]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe21]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list pcie_phy_top_inst/pcie_ltssm_downstream_inst/ts2_valid_r ]]