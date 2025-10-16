// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
// Date        : Tue Jul  8 09:15:09 2025
// Host        : capc-ub22-is running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim
//               /tools/C/research/pcie/KC705_pci_driver/KC705_pci_hardware/pcie_test/pcie_test.gen/sources_1/ip/pcie_7x_0/pcie_7x_0_sim_netlist.v
// Design      : pcie_7x_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k325tffg900-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "pcie_7x_0,pcie_7x_0_pcie2_top,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "pcie_7x_0_pcie2_top,Vivado 2022.1" *) 
(* NotValidForBitStream *)
module pcie_7x_0
   (pci_exp_txp,
    pci_exp_txn,
    pci_exp_rxp,
    pci_exp_rxn,
    pipe_pclk_in,
    pipe_rxusrclk_in,
    pipe_rxoutclk_in,
    pipe_dclk_in,
    pipe_userclk1_in,
    pipe_userclk2_in,
    pipe_oobclk_in,
    pipe_mmcm_lock_in,
    pipe_txoutclk_out,
    pipe_rxoutclk_out,
    pipe_pclk_sel_out,
    pipe_gen3_out,
    user_clk_out,
    user_reset_out,
    user_lnk_up,
    user_app_rdy,
    tx_buf_av,
    tx_cfg_req,
    tx_err_drop,
    s_axis_tx_tready,
    s_axis_tx_tdata,
    s_axis_tx_tkeep,
    s_axis_tx_tlast,
    s_axis_tx_tvalid,
    s_axis_tx_tuser,
    tx_cfg_gnt,
    m_axis_rx_tdata,
    m_axis_rx_tkeep,
    m_axis_rx_tlast,
    m_axis_rx_tvalid,
    m_axis_rx_tready,
    m_axis_rx_tuser,
    rx_np_ok,
    rx_np_req,
    fc_cpld,
    fc_cplh,
    fc_npd,
    fc_nph,
    fc_pd,
    fc_ph,
    fc_sel,
    cfg_mgmt_do,
    cfg_mgmt_rd_wr_done,
    cfg_status,
    cfg_command,
    cfg_dstatus,
    cfg_dcommand,
    cfg_lstatus,
    cfg_lcommand,
    cfg_dcommand2,
    cfg_pcie_link_state,
    cfg_pmcsr_pme_en,
    cfg_pmcsr_powerstate,
    cfg_pmcsr_pme_status,
    cfg_received_func_lvl_rst,
    cfg_mgmt_di,
    cfg_mgmt_byte_en,
    cfg_mgmt_dwaddr,
    cfg_mgmt_wr_en,
    cfg_mgmt_rd_en,
    cfg_mgmt_wr_readonly,
    cfg_err_ecrc,
    cfg_err_ur,
    cfg_err_cpl_timeout,
    cfg_err_cpl_unexpect,
    cfg_err_cpl_abort,
    cfg_err_posted,
    cfg_err_cor,
    cfg_err_atomic_egress_blocked,
    cfg_err_internal_cor,
    cfg_err_malformed,
    cfg_err_mc_blocked,
    cfg_err_poisoned,
    cfg_err_norecovery,
    cfg_err_tlp_cpl_header,
    cfg_err_cpl_rdy,
    cfg_err_locked,
    cfg_err_acs,
    cfg_err_internal_uncor,
    cfg_trn_pending,
    cfg_pm_halt_aspm_l0s,
    cfg_pm_halt_aspm_l1,
    cfg_pm_force_state_en,
    cfg_pm_force_state,
    cfg_dsn,
    cfg_interrupt,
    cfg_interrupt_rdy,
    cfg_interrupt_assert,
    cfg_interrupt_di,
    cfg_interrupt_do,
    cfg_interrupt_mmenable,
    cfg_interrupt_msienable,
    cfg_interrupt_msixenable,
    cfg_interrupt_msixfm,
    cfg_interrupt_stat,
    cfg_pciecap_interrupt_msgnum,
    cfg_to_turnoff,
    cfg_turnoff_ok,
    cfg_bus_number,
    cfg_device_number,
    cfg_function_number,
    cfg_pm_wake,
    cfg_pm_send_pme_to,
    cfg_ds_bus_number,
    cfg_ds_device_number,
    cfg_ds_function_number,
    cfg_mgmt_wr_rw1c_as_rw,
    cfg_msg_received,
    cfg_msg_data,
    cfg_bridge_serr_en,
    cfg_slot_control_electromech_il_ctl_pulse,
    cfg_root_control_syserr_corr_err_en,
    cfg_root_control_syserr_non_fatal_err_en,
    cfg_root_control_syserr_fatal_err_en,
    cfg_root_control_pme_int_en,
    cfg_aer_rooterr_corr_err_reporting_en,
    cfg_aer_rooterr_non_fatal_err_reporting_en,
    cfg_aer_rooterr_fatal_err_reporting_en,
    cfg_aer_rooterr_corr_err_received,
    cfg_aer_rooterr_non_fatal_err_received,
    cfg_aer_rooterr_fatal_err_received,
    cfg_msg_received_err_cor,
    cfg_msg_received_err_non_fatal,
    cfg_msg_received_err_fatal,
    cfg_msg_received_pm_as_nak,
    cfg_msg_received_pm_pme,
    cfg_msg_received_pme_to_ack,
    cfg_msg_received_assert_int_a,
    cfg_msg_received_assert_int_b,
    cfg_msg_received_assert_int_c,
    cfg_msg_received_assert_int_d,
    cfg_msg_received_deassert_int_a,
    cfg_msg_received_deassert_int_b,
    cfg_msg_received_deassert_int_c,
    cfg_msg_received_deassert_int_d,
    cfg_msg_received_setslotpowerlimit,
    pl_directed_link_change,
    pl_directed_link_width,
    pl_directed_link_speed,
    pl_directed_link_auton,
    pl_upstream_prefer_deemph,
    pl_sel_lnk_rate,
    pl_sel_lnk_width,
    pl_ltssm_state,
    pl_lane_reversal_mode,
    pl_phy_lnk_up,
    pl_tx_pm_state,
    pl_rx_pm_state,
    pl_link_upcfg_cap,
    pl_link_gen2_cap,
    pl_link_partner_gen2_supported,
    pl_initial_link_width,
    pl_directed_change_done,
    pl_received_hot_rst,
    pl_transmit_hot_rst,
    pl_downstream_deemph_source,
    cfg_err_aer_headerlog,
    cfg_aer_interrupt_msgnum,
    cfg_err_aer_headerlog_set,
    cfg_aer_ecrc_check_en,
    cfg_aer_ecrc_gen_en,
    cfg_vc_tcvc_map,
    sys_clk,
    sys_rst_n,
    pipe_mmcm_rst_n,
    pcie_drp_clk,
    pcie_drp_en,
    pcie_drp_we,
    pcie_drp_addr,
    pcie_drp_di,
    pcie_drp_do,
    pcie_drp_rdy);
  (* x_interface_info = "xilinx.com:interface:pcie_7x_mgt:1.0 pcie_7x_mgt txp" *) output [0:0]pci_exp_txp;
  (* x_interface_info = "xilinx.com:interface:pcie_7x_mgt:1.0 pcie_7x_mgt txn" *) output [0:0]pci_exp_txn;
  (* x_interface_info = "xilinx.com:interface:pcie_7x_mgt:1.0 pcie_7x_mgt rxp" *) input [0:0]pci_exp_rxp;
  (* x_interface_info = "xilinx.com:interface:pcie_7x_mgt:1.0 pcie_7x_mgt rxn" *) input [0:0]pci_exp_rxn;
  (* x_interface_info = "xilinx.com:interface:pipe_clock:1.0 pipe_clock pclk_in" *) input pipe_pclk_in;
  (* x_interface_info = "xilinx.com:interface:pipe_clock:1.0 pipe_clock rxusrclk_in" *) input pipe_rxusrclk_in;
  (* x_interface_info = "xilinx.com:interface:pipe_clock:1.0 pipe_clock rxoutclk_in" *) input [0:0]pipe_rxoutclk_in;
  (* x_interface_info = "xilinx.com:interface:pipe_clock:1.0 pipe_clock dclk_in" *) input pipe_dclk_in;
  (* x_interface_info = "xilinx.com:interface:pipe_clock:1.0 pipe_clock userclk1_in" *) input pipe_userclk1_in;
  (* x_interface_info = "xilinx.com:interface:pipe_clock:1.0 pipe_clock userclk2_in" *) input pipe_userclk2_in;
  (* x_interface_info = "xilinx.com:interface:pipe_clock:1.0 pipe_clock oobclk_in" *) input pipe_oobclk_in;
  (* x_interface_info = "xilinx.com:interface:pipe_clock:1.0 pipe_clock mmcm_lock_in" *) input pipe_mmcm_lock_in;
  (* x_interface_info = "xilinx.com:interface:pipe_clock:1.0 pipe_clock txoutclk_out" *) output pipe_txoutclk_out;
  (* x_interface_info = "xilinx.com:interface:pipe_clock:1.0 pipe_clock rxoutclk_out" *) output [0:0]pipe_rxoutclk_out;
  (* x_interface_info = "xilinx.com:interface:pipe_clock:1.0 pipe_clock pclk_sel_out" *) output [0:0]pipe_pclk_sel_out;
  (* x_interface_info = "xilinx.com:interface:pipe_clock:1.0 pipe_clock gen3_out" *) output pipe_gen3_out;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 CLK.user_clk_out CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME CLK.user_clk_out, ASSOCIATED_BUSIF m_axis_rx:s_axis_tx, FREQ_HZ 125000000, ASSOCIATED_RESET user_reset_out, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) output user_clk_out;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 RST.user_reset_out RST" *) (* x_interface_parameter = "XIL_INTERFACENAME RST.user_reset_out, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) output user_reset_out;
  output user_lnk_up;
  output user_app_rdy;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status tx_buf_av" *) output [5:0]tx_buf_av;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status tx_cfg_req" *) output tx_cfg_req;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status tx_err_drop" *) output tx_err_drop;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 s_axis_tx TREADY" *) (* x_interface_parameter = "XIL_INTERFACENAME s_axis_tx, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 4, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0" *) output s_axis_tx_tready;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 s_axis_tx TDATA" *) input [63:0]s_axis_tx_tdata;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 s_axis_tx TKEEP" *) input [7:0]s_axis_tx_tkeep;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 s_axis_tx TLAST" *) input s_axis_tx_tlast;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 s_axis_tx TVALID" *) input s_axis_tx_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 s_axis_tx TUSER" *) input [3:0]s_axis_tx_tuser;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_control:1.0 pcie2_cfg_control tx_cfg_gnt" *) input tx_cfg_gnt;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 m_axis_rx TDATA" *) (* x_interface_parameter = "XIL_INTERFACENAME m_axis_rx, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 22, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0" *) output [63:0]m_axis_rx_tdata;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 m_axis_rx TKEEP" *) output [7:0]m_axis_rx_tkeep;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 m_axis_rx TLAST" *) output m_axis_rx_tlast;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 m_axis_rx TVALID" *) output m_axis_rx_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 m_axis_rx TREADY" *) input m_axis_rx_tready;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 m_axis_rx TUSER" *) output [21:0]m_axis_rx_tuser;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_control:1.0 pcie2_cfg_control rx_np_ok" *) input rx_np_ok;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_control:1.0 pcie2_cfg_control rx_np_req" *) input rx_np_req;
  (* x_interface_info = "xilinx.com:interface:pcie_cfg_fc:1.0 pcie_cfg_fc CPLD" *) output [11:0]fc_cpld;
  (* x_interface_info = "xilinx.com:interface:pcie_cfg_fc:1.0 pcie_cfg_fc CPLH" *) output [7:0]fc_cplh;
  (* x_interface_info = "xilinx.com:interface:pcie_cfg_fc:1.0 pcie_cfg_fc NPD" *) output [11:0]fc_npd;
  (* x_interface_info = "xilinx.com:interface:pcie_cfg_fc:1.0 pcie_cfg_fc NPH" *) output [7:0]fc_nph;
  (* x_interface_info = "xilinx.com:interface:pcie_cfg_fc:1.0 pcie_cfg_fc PD" *) output [11:0]fc_pd;
  (* x_interface_info = "xilinx.com:interface:pcie_cfg_fc:1.0 pcie_cfg_fc PH" *) output [7:0]fc_ph;
  (* x_interface_info = "xilinx.com:interface:pcie_cfg_fc:1.0 pcie_cfg_fc SEL" *) input [2:0]fc_sel;
  (* x_interface_info = "xilinx.com:interface:pcie_cfg_mgmt:1.0 pcie_cfg_mgmt READ_DATA" *) output [31:0]cfg_mgmt_do;
  (* x_interface_info = "xilinx.com:interface:pcie_cfg_mgmt:1.0 pcie_cfg_mgmt READ_WRITE_DONE" *) output cfg_mgmt_rd_wr_done;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status status" *) output [15:0]cfg_status;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status command" *) output [15:0]cfg_command;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status dstatus" *) output [15:0]cfg_dstatus;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status dcommand" *) output [15:0]cfg_dcommand;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status lstatus" *) output [15:0]cfg_lstatus;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status lcommand" *) output [15:0]cfg_lcommand;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status dcommand2" *) output [15:0]cfg_dcommand2;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status pcie_link_state" *) output [2:0]cfg_pcie_link_state;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status pmcsr_pme_en" *) output cfg_pmcsr_pme_en;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status pmcsr_powerstate" *) output [1:0]cfg_pmcsr_powerstate;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status pmcsr_pme_status" *) output cfg_pmcsr_pme_status;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status received_func_lvl_rst" *) output cfg_received_func_lvl_rst;
  (* x_interface_info = "xilinx.com:interface:pcie_cfg_mgmt:1.0 pcie_cfg_mgmt WRITE_DATA" *) input [31:0]cfg_mgmt_di;
  (* x_interface_info = "xilinx.com:interface:pcie_cfg_mgmt:1.0 pcie_cfg_mgmt BYTE_EN" *) input [3:0]cfg_mgmt_byte_en;
  (* x_interface_info = "xilinx.com:interface:pcie_cfg_mgmt:1.0 pcie_cfg_mgmt ADDR" *) input [9:0]cfg_mgmt_dwaddr;
  (* x_interface_info = "xilinx.com:interface:pcie_cfg_mgmt:1.0 pcie_cfg_mgmt WRITE_EN" *) input cfg_mgmt_wr_en;
  (* x_interface_info = "xilinx.com:interface:pcie_cfg_mgmt:1.0 pcie_cfg_mgmt READ_EN" *) input cfg_mgmt_rd_en;
  (* x_interface_info = "xilinx.com:interface:pcie_cfg_mgmt:1.0 pcie_cfg_mgmt READONLY" *) input cfg_mgmt_wr_readonly;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err ecrc" *) input cfg_err_ecrc;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err ur" *) input cfg_err_ur;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err cpl_timeout" *) input cfg_err_cpl_timeout;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err cpl_unexpect" *) input cfg_err_cpl_unexpect;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err cpl_abort" *) input cfg_err_cpl_abort;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err posted" *) input cfg_err_posted;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err cor" *) input cfg_err_cor;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err atomic_egress_blocked" *) input cfg_err_atomic_egress_blocked;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err internal_cor" *) input cfg_err_internal_cor;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err malformed" *) input cfg_err_malformed;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err mc_blocked" *) input cfg_err_mc_blocked;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err poisoned" *) input cfg_err_poisoned;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err norecovery" *) input cfg_err_norecovery;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err tlp_cpl_header" *) input [47:0]cfg_err_tlp_cpl_header;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err cpl_rdy" *) output cfg_err_cpl_rdy;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err locked" *) input cfg_err_locked;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err acs" *) input cfg_err_acs;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err internal_uncor" *) input cfg_err_internal_uncor;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_control:1.0 pcie2_cfg_control trn_pending" *) input cfg_trn_pending;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_control:1.0 pcie2_cfg_control pm_halt_aspm_l0s" *) input cfg_pm_halt_aspm_l0s;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_control:1.0 pcie2_cfg_control pm_halt_aspm_l1" *) input cfg_pm_halt_aspm_l1;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_control:1.0 pcie2_cfg_control pm_force_state_en" *) input cfg_pm_force_state_en;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_control:1.0 pcie2_cfg_control pm_force_state" *) input [1:0]cfg_pm_force_state;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_control:1.0 pcie2_cfg_control dsn" *) input [63:0]cfg_dsn;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_interrupt:1.0 pcie2_cfg_interrupt interrupt" *) input cfg_interrupt;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_interrupt:1.0 pcie2_cfg_interrupt rdy" *) output cfg_interrupt_rdy;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_interrupt:1.0 pcie2_cfg_interrupt assert" *) input cfg_interrupt_assert;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_interrupt:1.0 pcie2_cfg_interrupt write_data" *) input [7:0]cfg_interrupt_di;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_interrupt:1.0 pcie2_cfg_interrupt read_data" *) output [7:0]cfg_interrupt_do;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_interrupt:1.0 pcie2_cfg_interrupt mmenable" *) output [2:0]cfg_interrupt_mmenable;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_interrupt:1.0 pcie2_cfg_interrupt msienable" *) output cfg_interrupt_msienable;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_interrupt:1.0 pcie2_cfg_interrupt msixenable" *) output cfg_interrupt_msixenable;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_interrupt:1.0 pcie2_cfg_interrupt msixfm" *) output cfg_interrupt_msixfm;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_interrupt:1.0 pcie2_cfg_interrupt stat" *) input cfg_interrupt_stat;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_interrupt:1.0 pcie2_cfg_interrupt pciecap_interrupt_msgnum" *) input [4:0]cfg_pciecap_interrupt_msgnum;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status turnoff" *) output cfg_to_turnoff;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_control:1.0 pcie2_cfg_control turnoff_ok" *) input cfg_turnoff_ok;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status bus_number" *) output [7:0]cfg_bus_number;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status device_number" *) output [4:0]cfg_device_number;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status function_number" *) output [2:0]cfg_function_number;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_control:1.0 pcie2_cfg_control pm_wake" *) input cfg_pm_wake;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_control:1.0 pcie2_cfg_control pm_send_pme_to" *) input cfg_pm_send_pme_to;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_control:1.0 pcie2_cfg_control ds_bus_number" *) input [7:0]cfg_ds_bus_number;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_control:1.0 pcie2_cfg_control ds_device_number" *) input [4:0]cfg_ds_device_number;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_control:1.0 pcie2_cfg_control ds_function_number" *) input [2:0]cfg_ds_function_number;
  (* x_interface_info = "xilinx.com:interface:pcie_cfg_mgmt:1.0 pcie_cfg_mgmt TYPE1_CFG_REG_ACCESS" *) input cfg_mgmt_wr_rw1c_as_rw;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_msg_rcvd:1.0 pcie2_cfg_msg_rcvd received" *) output cfg_msg_received;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_msg_rcvd:1.0 pcie2_cfg_msg_rcvd data" *) output [15:0]cfg_msg_data;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status bridge_serr_en" *) output cfg_bridge_serr_en;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status slot_control_electromech_il_ctl_pulse" *) output cfg_slot_control_electromech_il_ctl_pulse;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status root_control_syserr_corr_err_en" *) output cfg_root_control_syserr_corr_err_en;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status root_control_syserr_non_fatal_err_en" *) output cfg_root_control_syserr_non_fatal_err_en;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status root_control_syserr_fatal_err_en" *) output cfg_root_control_syserr_fatal_err_en;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status root_control_pme_int_en" *) output cfg_root_control_pme_int_en;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status aer_rooterr_corr_err_reporting_en" *) output cfg_aer_rooterr_corr_err_reporting_en;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status aer_rooterr_non_fatal_err_reporting_en" *) output cfg_aer_rooterr_non_fatal_err_reporting_en;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status aer_rooterr_fatal_err_reporting_en" *) output cfg_aer_rooterr_fatal_err_reporting_en;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status aer_rooterr_corr_err_received" *) output cfg_aer_rooterr_corr_err_received;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status aer_rooterr_non_fatal_err_received" *) output cfg_aer_rooterr_non_fatal_err_received;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status aer_rooterr_fatal_err_received" *) output cfg_aer_rooterr_fatal_err_received;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_msg_rcvd:1.0 pcie2_cfg_msg_rcvd err_cor" *) output cfg_msg_received_err_cor;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_msg_rcvd:1.0 pcie2_cfg_msg_rcvd err_non_fatal" *) output cfg_msg_received_err_non_fatal;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_msg_rcvd:1.0 pcie2_cfg_msg_rcvd err_fatal" *) output cfg_msg_received_err_fatal;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_msg_rcvd:1.0 pcie2_cfg_msg_rcvd received_pm_as_nak" *) output cfg_msg_received_pm_as_nak;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_msg_rcvd:1.0 pcie2_cfg_msg_rcvd pm_pme" *) output cfg_msg_received_pm_pme;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_msg_rcvd:1.0 pcie2_cfg_msg_rcvd pme_to_ack" *) output cfg_msg_received_pme_to_ack;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_msg_rcvd:1.0 pcie2_cfg_msg_rcvd assert_int_a" *) output cfg_msg_received_assert_int_a;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_msg_rcvd:1.0 pcie2_cfg_msg_rcvd assert_int_b" *) output cfg_msg_received_assert_int_b;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_msg_rcvd:1.0 pcie2_cfg_msg_rcvd assert_int_c" *) output cfg_msg_received_assert_int_c;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_msg_rcvd:1.0 pcie2_cfg_msg_rcvd assert_int_d" *) output cfg_msg_received_assert_int_d;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_msg_rcvd:1.0 pcie2_cfg_msg_rcvd deassert_int_a" *) output cfg_msg_received_deassert_int_a;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_msg_rcvd:1.0 pcie2_cfg_msg_rcvd deassert_int_b" *) output cfg_msg_received_deassert_int_b;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_msg_rcvd:1.0 pcie2_cfg_msg_rcvd deassert_int_c" *) output cfg_msg_received_deassert_int_c;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_msg_rcvd:1.0 pcie2_cfg_msg_rcvd deassert_int_d" *) output cfg_msg_received_deassert_int_d;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_msg_rcvd:1.0 pcie2_cfg_msg_rcvd received_setslotpowerlimit" *) output cfg_msg_received_setslotpowerlimit;
  (* x_interface_info = "xilinx.com:interface:pcie2_pl:1.0 pcie2_pl directed_link_change" *) input [1:0]pl_directed_link_change;
  (* x_interface_info = "xilinx.com:interface:pcie2_pl:1.0 pcie2_pl directed_link_width" *) input [1:0]pl_directed_link_width;
  (* x_interface_info = "xilinx.com:interface:pcie2_pl:1.0 pcie2_pl directed_link_speed" *) input pl_directed_link_speed;
  (* x_interface_info = "xilinx.com:interface:pcie2_pl:1.0 pcie2_pl directed_link_auton" *) input pl_directed_link_auton;
  (* x_interface_info = "xilinx.com:interface:pcie2_pl:1.0 pcie2_pl upstream_prefer_deemph" *) input pl_upstream_prefer_deemph;
  (* x_interface_info = "xilinx.com:interface:pcie2_pl:1.0 pcie2_pl sel_lnk_rate" *) output pl_sel_lnk_rate;
  (* x_interface_info = "xilinx.com:interface:pcie2_pl:1.0 pcie2_pl sel_lnk_width" *) output [1:0]pl_sel_lnk_width;
  (* x_interface_info = "xilinx.com:interface:pcie2_pl:1.0 pcie2_pl ltssm_state" *) output [5:0]pl_ltssm_state;
  (* x_interface_info = "xilinx.com:interface:pcie2_pl:1.0 pcie2_pl lane_reversal_mode" *) output [1:0]pl_lane_reversal_mode;
  (* x_interface_info = "xilinx.com:interface:pcie2_pl:1.0 pcie2_pl phy_lnk_up" *) output pl_phy_lnk_up;
  (* x_interface_info = "xilinx.com:interface:pcie2_pl:1.0 pcie2_pl tx_pm_state" *) output [2:0]pl_tx_pm_state;
  (* x_interface_info = "xilinx.com:interface:pcie2_pl:1.0 pcie2_pl rx_pm_state" *) output [1:0]pl_rx_pm_state;
  (* x_interface_info = "xilinx.com:interface:pcie2_pl:1.0 pcie2_pl link_upcfg_cap" *) output pl_link_upcfg_cap;
  (* x_interface_info = "xilinx.com:interface:pcie2_pl:1.0 pcie2_pl link_gen2_cap" *) output pl_link_gen2_cap;
  (* x_interface_info = "xilinx.com:interface:pcie2_pl:1.0 pcie2_pl link_partner_gen2_supported" *) output pl_link_partner_gen2_supported;
  (* x_interface_info = "xilinx.com:interface:pcie2_pl:1.0 pcie2_pl initial_link_width" *) output [2:0]pl_initial_link_width;
  (* x_interface_info = "xilinx.com:interface:pcie2_pl:1.0 pcie2_pl directed_change_done" *) output pl_directed_change_done;
  (* x_interface_info = "xilinx.com:interface:pcie2_pl:1.0 pcie2_pl received_hot_rst" *) output pl_received_hot_rst;
  (* x_interface_info = "xilinx.com:interface:pcie2_pl:1.0 pcie2_pl transmit_hot_rst" *) input pl_transmit_hot_rst;
  (* x_interface_info = "xilinx.com:interface:pcie2_pl:1.0 pcie2_pl downstream_deemph_source" *) input pl_downstream_deemph_source;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err err_aer_headerlog" *) input [127:0]cfg_err_aer_headerlog;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err aer_interrupt_msgnum" *) input [4:0]cfg_aer_interrupt_msgnum;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err err_aer_headerlog_set" *) output cfg_err_aer_headerlog_set;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err aer_ecrc_check_en" *) output cfg_aer_ecrc_check_en;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err aer_ecrc_gen_en" *) output cfg_aer_ecrc_gen_en;
  (* x_interface_info = "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status vc_tcvc_map" *) output [6:0]cfg_vc_tcvc_map;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 CLK.sys_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME CLK.sys_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input sys_clk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 RST.sys_rst_n RST" *) (* x_interface_parameter = "XIL_INTERFACENAME RST.sys_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input sys_rst_n;
  (* x_interface_info = "xilinx.com:interface:pipe_clock:1.0 pipe_clock mmcm_rst_n" *) input pipe_mmcm_rst_n;
  input pcie_drp_clk;
  (* x_interface_info = "xilinx.com:interface:drp:1.0 drp DEN" *) input pcie_drp_en;
  (* x_interface_info = "xilinx.com:interface:drp:1.0 drp DWE" *) input pcie_drp_we;
  (* x_interface_info = "xilinx.com:interface:drp:1.0 drp DADDR" *) input [8:0]pcie_drp_addr;
  (* x_interface_info = "xilinx.com:interface:drp:1.0 drp DI" *) input [15:0]pcie_drp_di;
  (* x_interface_info = "xilinx.com:interface:drp:1.0 drp DO" *) output [15:0]pcie_drp_do;
  (* x_interface_info = "xilinx.com:interface:drp:1.0 drp DRDY" *) output pcie_drp_rdy;

  wire \<const0> ;
  wire \<const1> ;
  wire cfg_aer_ecrc_check_en;
  wire cfg_aer_ecrc_gen_en;
  wire [4:0]cfg_aer_interrupt_msgnum;
  wire cfg_aer_rooterr_corr_err_received;
  wire cfg_aer_rooterr_corr_err_reporting_en;
  wire cfg_aer_rooterr_fatal_err_received;
  wire cfg_aer_rooterr_fatal_err_reporting_en;
  wire cfg_aer_rooterr_non_fatal_err_received;
  wire cfg_aer_rooterr_non_fatal_err_reporting_en;
  wire cfg_bridge_serr_en;
  wire [7:0]cfg_bus_number;
  wire [10:0]\^cfg_command ;
  wire [14:0]\^cfg_dcommand ;
  wire [11:0]\^cfg_dcommand2 ;
  wire [4:0]cfg_device_number;
  wire [7:0]cfg_ds_bus_number;
  wire [4:0]cfg_ds_device_number;
  wire [2:0]cfg_ds_function_number;
  wire [63:0]cfg_dsn;
  wire [5:0]\^cfg_dstatus ;
  wire [127:0]cfg_err_aer_headerlog;
  wire cfg_err_aer_headerlog_set;
  wire cfg_err_atomic_egress_blocked;
  wire cfg_err_cor;
  wire cfg_err_cpl_abort;
  wire cfg_err_cpl_rdy;
  wire cfg_err_cpl_timeout;
  wire cfg_err_cpl_unexpect;
  wire cfg_err_ecrc;
  wire cfg_err_internal_cor;
  wire cfg_err_internal_uncor;
  wire cfg_err_locked;
  wire cfg_err_malformed;
  wire cfg_err_mc_blocked;
  wire cfg_err_norecovery;
  wire cfg_err_poisoned;
  wire cfg_err_posted;
  wire [47:0]cfg_err_tlp_cpl_header;
  wire cfg_err_ur;
  wire [2:0]cfg_function_number;
  wire cfg_interrupt;
  wire cfg_interrupt_assert;
  wire [7:0]cfg_interrupt_di;
  wire [7:0]cfg_interrupt_do;
  wire [2:0]cfg_interrupt_mmenable;
  wire cfg_interrupt_msienable;
  wire cfg_interrupt_msixenable;
  wire cfg_interrupt_msixfm;
  wire cfg_interrupt_rdy;
  wire cfg_interrupt_stat;
  wire [11:0]\^cfg_lcommand ;
  wire [15:0]\^cfg_lstatus ;
  wire [3:0]cfg_mgmt_byte_en;
  wire [31:0]cfg_mgmt_di;
  wire [31:0]cfg_mgmt_do;
  wire [9:0]cfg_mgmt_dwaddr;
  wire cfg_mgmt_rd_en;
  wire cfg_mgmt_rd_wr_done;
  wire cfg_mgmt_wr_en;
  wire cfg_mgmt_wr_readonly;
  wire cfg_mgmt_wr_rw1c_as_rw;
  wire [15:0]cfg_msg_data;
  wire cfg_msg_received;
  wire cfg_msg_received_assert_int_a;
  wire cfg_msg_received_assert_int_b;
  wire cfg_msg_received_assert_int_c;
  wire cfg_msg_received_assert_int_d;
  wire cfg_msg_received_deassert_int_a;
  wire cfg_msg_received_deassert_int_b;
  wire cfg_msg_received_deassert_int_c;
  wire cfg_msg_received_deassert_int_d;
  wire cfg_msg_received_err_cor;
  wire cfg_msg_received_err_fatal;
  wire cfg_msg_received_err_non_fatal;
  wire cfg_msg_received_pm_as_nak;
  wire cfg_msg_received_pm_pme;
  wire cfg_msg_received_pme_to_ack;
  wire cfg_msg_received_setslotpowerlimit;
  wire [2:0]cfg_pcie_link_state;
  wire [4:0]cfg_pciecap_interrupt_msgnum;
  wire [1:0]cfg_pm_force_state;
  wire cfg_pm_force_state_en;
  wire cfg_pm_halt_aspm_l0s;
  wire cfg_pm_halt_aspm_l1;
  wire cfg_pm_wake;
  wire cfg_pmcsr_pme_en;
  wire cfg_pmcsr_pme_status;
  wire [1:0]cfg_pmcsr_powerstate;
  wire cfg_received_func_lvl_rst;
  wire cfg_root_control_pme_int_en;
  wire cfg_root_control_syserr_corr_err_en;
  wire cfg_root_control_syserr_fatal_err_en;
  wire cfg_root_control_syserr_non_fatal_err_en;
  wire cfg_slot_control_electromech_il_ctl_pulse;
  wire cfg_to_turnoff;
  wire cfg_trn_pending;
  wire cfg_turnoff_ok;
  wire [6:0]cfg_vc_tcvc_map;
  wire [11:0]fc_cpld;
  wire [7:0]fc_cplh;
  wire [11:0]fc_npd;
  wire [7:0]fc_nph;
  wire [11:0]fc_pd;
  wire [7:0]fc_ph;
  wire [2:0]fc_sel;
  wire [63:0]m_axis_rx_tdata;
  wire [7:0]m_axis_rx_tkeep;
  wire m_axis_rx_tlast;
  wire m_axis_rx_tready;
  wire [21:0]\^m_axis_rx_tuser ;
  wire m_axis_rx_tvalid;
  wire [0:0]pci_exp_rxn;
  wire [0:0]pci_exp_rxp;
  wire [0:0]pci_exp_txn;
  wire [0:0]pci_exp_txp;
  wire [8:0]pcie_drp_addr;
  wire pcie_drp_clk;
  wire [15:0]pcie_drp_di;
  wire [15:0]pcie_drp_do;
  wire pcie_drp_en;
  wire pcie_drp_rdy;
  wire pcie_drp_we;
  wire pipe_dclk_in;
  wire pipe_gen3_out;
  wire pipe_mmcm_lock_in;
  wire pipe_oobclk_in;
  wire pipe_pclk_in;
  wire [0:0]pipe_pclk_sel_out;
  wire [0:0]pipe_rxoutclk_out;
  wire pipe_rxusrclk_in;
  wire pipe_txoutclk_out;
  wire pipe_userclk1_in;
  wire pipe_userclk2_in;
  wire pl_directed_change_done;
  wire pl_directed_link_auton;
  wire [1:0]pl_directed_link_change;
  wire pl_directed_link_speed;
  wire [1:0]pl_directed_link_width;
  wire pl_downstream_deemph_source;
  wire [2:0]pl_initial_link_width;
  wire [1:0]pl_lane_reversal_mode;
  wire pl_link_gen2_cap;
  wire pl_link_partner_gen2_supported;
  wire pl_link_upcfg_cap;
  wire [5:0]pl_ltssm_state;
  wire pl_phy_lnk_up;
  wire pl_received_hot_rst;
  wire [1:0]pl_rx_pm_state;
  wire pl_sel_lnk_rate;
  wire [1:0]pl_sel_lnk_width;
  wire pl_transmit_hot_rst;
  wire [2:0]pl_tx_pm_state;
  wire pl_upstream_prefer_deemph;
  wire rx_np_ok;
  wire rx_np_req;
  wire [63:0]s_axis_tx_tdata;
  wire [7:0]s_axis_tx_tkeep;
  wire s_axis_tx_tlast;
  wire s_axis_tx_tready;
  wire [3:0]s_axis_tx_tuser;
  wire s_axis_tx_tvalid;
  wire sys_clk;
  wire sys_rst_n;
  wire [5:0]tx_buf_av;
  wire tx_cfg_gnt;
  wire tx_cfg_req;
  wire tx_err_drop;
  wire user_clk_out;
  wire user_lnk_up;
  wire user_reset_out;
  wire NLW_U0_ext_ch_gt_drpclk_UNCONNECTED;
  wire NLW_U0_int_dclk_out_UNCONNECTED;
  wire NLW_U0_int_mmcm_lock_out_UNCONNECTED;
  wire NLW_U0_int_oobclk_out_UNCONNECTED;
  wire NLW_U0_int_pclk_out_slave_UNCONNECTED;
  wire NLW_U0_int_pipe_rxusrclk_out_UNCONNECTED;
  wire NLW_U0_int_userclk1_out_UNCONNECTED;
  wire NLW_U0_int_userclk2_out_UNCONNECTED;
  wire NLW_U0_pipe_qrst_idle_UNCONNECTED;
  wire NLW_U0_pipe_rate_idle_UNCONNECTED;
  wire NLW_U0_pipe_rst_idle_UNCONNECTED;
  wire NLW_U0_qpll_drp_clk_UNCONNECTED;
  wire NLW_U0_qpll_drp_gen3_UNCONNECTED;
  wire NLW_U0_qpll_drp_ovrd_UNCONNECTED;
  wire NLW_U0_qpll_drp_rst_n_UNCONNECTED;
  wire NLW_U0_qpll_drp_start_UNCONNECTED;
  wire NLW_U0_qpll_qplld_UNCONNECTED;
  wire NLW_U0_startup_cfgclk_UNCONNECTED;
  wire NLW_U0_startup_cfgmclk_UNCONNECTED;
  wire NLW_U0_startup_eos_UNCONNECTED;
  wire NLW_U0_startup_preq_UNCONNECTED;
  wire NLW_U0_user_app_rdy_UNCONNECTED;
  wire [15:3]NLW_U0_cfg_command_UNCONNECTED;
  wire [15:15]NLW_U0_cfg_dcommand_UNCONNECTED;
  wire [15:12]NLW_U0_cfg_dcommand2_UNCONNECTED;
  wire [15:4]NLW_U0_cfg_dstatus_UNCONNECTED;
  wire [15:2]NLW_U0_cfg_lcommand_UNCONNECTED;
  wire [12:2]NLW_U0_cfg_lstatus_UNCONNECTED;
  wire [15:0]NLW_U0_cfg_status_UNCONNECTED;
  wire [11:0]NLW_U0_common_commands_out_UNCONNECTED;
  wire [15:0]NLW_U0_ext_ch_gt_drpdo_UNCONNECTED;
  wire [0:0]NLW_U0_ext_ch_gt_drprdy_UNCONNECTED;
  wire [0:0]NLW_U0_gt_ch_drp_rdy_UNCONNECTED;
  wire [31:0]NLW_U0_icap_o_UNCONNECTED;
  wire [1:0]NLW_U0_int_qplllock_out_UNCONNECTED;
  wire [1:0]NLW_U0_int_qplloutclk_out_UNCONNECTED;
  wire [1:0]NLW_U0_int_qplloutrefclk_out_UNCONNECTED;
  wire [0:0]NLW_U0_int_rxoutclk_out_UNCONNECTED;
  wire [20:9]NLW_U0_m_axis_rx_tuser_UNCONNECTED;
  wire [0:0]NLW_U0_pipe_cpll_lock_UNCONNECTED;
  wire [31:0]NLW_U0_pipe_debug_UNCONNECTED;
  wire [0:0]NLW_U0_pipe_debug_0_UNCONNECTED;
  wire [0:0]NLW_U0_pipe_debug_1_UNCONNECTED;
  wire [0:0]NLW_U0_pipe_debug_2_UNCONNECTED;
  wire [0:0]NLW_U0_pipe_debug_3_UNCONNECTED;
  wire [0:0]NLW_U0_pipe_debug_4_UNCONNECTED;
  wire [0:0]NLW_U0_pipe_debug_5_UNCONNECTED;
  wire [0:0]NLW_U0_pipe_debug_6_UNCONNECTED;
  wire [0:0]NLW_U0_pipe_debug_7_UNCONNECTED;
  wire [0:0]NLW_U0_pipe_debug_8_UNCONNECTED;
  wire [0:0]NLW_U0_pipe_debug_9_UNCONNECTED;
  wire [14:0]NLW_U0_pipe_dmonitorout_UNCONNECTED;
  wire [6:0]NLW_U0_pipe_drp_fsm_UNCONNECTED;
  wire [0:0]NLW_U0_pipe_eyescandataerror_UNCONNECTED;
  wire [0:0]NLW_U0_pipe_qpll_lock_UNCONNECTED;
  wire [11:0]NLW_U0_pipe_qrst_fsm_UNCONNECTED;
  wire [4:0]NLW_U0_pipe_rate_fsm_UNCONNECTED;
  wire [4:0]NLW_U0_pipe_rst_fsm_UNCONNECTED;
  wire [2:0]NLW_U0_pipe_rxbufstatus_UNCONNECTED;
  wire [0:0]NLW_U0_pipe_rxcommadet_UNCONNECTED;
  wire [7:0]NLW_U0_pipe_rxdisperr_UNCONNECTED;
  wire [0:0]NLW_U0_pipe_rxdlysresetdone_UNCONNECTED;
  wire [7:0]NLW_U0_pipe_rxnotintable_UNCONNECTED;
  wire [0:0]NLW_U0_pipe_rxphaligndone_UNCONNECTED;
  wire [0:0]NLW_U0_pipe_rxpmaresetdone_UNCONNECTED;
  wire [0:0]NLW_U0_pipe_rxprbserr_UNCONNECTED;
  wire [2:0]NLW_U0_pipe_rxstatus_UNCONNECTED;
  wire [0:0]NLW_U0_pipe_rxsyncdone_UNCONNECTED;
  wire [6:0]NLW_U0_pipe_sync_fsm_rx_UNCONNECTED;
  wire [5:0]NLW_U0_pipe_sync_fsm_tx_UNCONNECTED;
  wire [24:0]NLW_U0_pipe_tx_0_sigs_UNCONNECTED;
  wire [24:0]NLW_U0_pipe_tx_1_sigs_UNCONNECTED;
  wire [24:0]NLW_U0_pipe_tx_2_sigs_UNCONNECTED;
  wire [24:0]NLW_U0_pipe_tx_3_sigs_UNCONNECTED;
  wire [24:0]NLW_U0_pipe_tx_4_sigs_UNCONNECTED;
  wire [24:0]NLW_U0_pipe_tx_5_sigs_UNCONNECTED;
  wire [24:0]NLW_U0_pipe_tx_6_sigs_UNCONNECTED;
  wire [24:0]NLW_U0_pipe_tx_7_sigs_UNCONNECTED;
  wire [0:0]NLW_U0_pipe_txdlysresetdone_UNCONNECTED;
  wire [0:0]NLW_U0_pipe_txphaligndone_UNCONNECTED;
  wire [0:0]NLW_U0_pipe_txphinitdone_UNCONNECTED;
  wire [1:0]NLW_U0_qpll_qpllreset_UNCONNECTED;

  assign cfg_command[15] = \<const0> ;
  assign cfg_command[14] = \<const0> ;
  assign cfg_command[13] = \<const0> ;
  assign cfg_command[12] = \<const0> ;
  assign cfg_command[11] = \<const0> ;
  assign cfg_command[10] = \^cfg_command [10];
  assign cfg_command[9] = \<const0> ;
  assign cfg_command[8] = \^cfg_command [8];
  assign cfg_command[7] = \<const0> ;
  assign cfg_command[6] = \<const0> ;
  assign cfg_command[5] = \<const0> ;
  assign cfg_command[4] = \<const0> ;
  assign cfg_command[3] = \<const0> ;
  assign cfg_command[2:0] = \^cfg_command [2:0];
  assign cfg_dcommand[15] = \<const0> ;
  assign cfg_dcommand[14:0] = \^cfg_dcommand [14:0];
  assign cfg_dcommand2[15] = \<const0> ;
  assign cfg_dcommand2[14] = \<const0> ;
  assign cfg_dcommand2[13] = \<const0> ;
  assign cfg_dcommand2[12] = \<const0> ;
  assign cfg_dcommand2[11:0] = \^cfg_dcommand2 [11:0];
  assign cfg_dstatus[15] = \<const0> ;
  assign cfg_dstatus[14] = \<const0> ;
  assign cfg_dstatus[13] = \<const0> ;
  assign cfg_dstatus[12] = \<const0> ;
  assign cfg_dstatus[11] = \<const0> ;
  assign cfg_dstatus[10] = \<const0> ;
  assign cfg_dstatus[9] = \<const0> ;
  assign cfg_dstatus[8] = \<const0> ;
  assign cfg_dstatus[7] = \<const0> ;
  assign cfg_dstatus[6] = \<const0> ;
  assign cfg_dstatus[5] = \^cfg_dstatus [5];
  assign cfg_dstatus[4] = \<const0> ;
  assign cfg_dstatus[3:0] = \^cfg_dstatus [3:0];
  assign cfg_lcommand[15] = \<const0> ;
  assign cfg_lcommand[14] = \<const0> ;
  assign cfg_lcommand[13] = \<const0> ;
  assign cfg_lcommand[12] = \<const0> ;
  assign cfg_lcommand[11:3] = \^cfg_lcommand [11:3];
  assign cfg_lcommand[2] = \<const0> ;
  assign cfg_lcommand[1:0] = \^cfg_lcommand [1:0];
  assign cfg_lstatus[15:13] = \^cfg_lstatus [15:13];
  assign cfg_lstatus[12] = \<const1> ;
  assign cfg_lstatus[11] = \^cfg_lstatus [11];
  assign cfg_lstatus[10] = \<const0> ;
  assign cfg_lstatus[9] = \<const0> ;
  assign cfg_lstatus[8] = \<const0> ;
  assign cfg_lstatus[7:4] = \^cfg_lstatus [7:4];
  assign cfg_lstatus[3] = \<const0> ;
  assign cfg_lstatus[2] = \<const0> ;
  assign cfg_lstatus[1:0] = \^cfg_lstatus [1:0];
  assign cfg_status[15] = \<const0> ;
  assign cfg_status[14] = \<const0> ;
  assign cfg_status[13] = \<const0> ;
  assign cfg_status[12] = \<const0> ;
  assign cfg_status[11] = \<const0> ;
  assign cfg_status[10] = \<const0> ;
  assign cfg_status[9] = \<const0> ;
  assign cfg_status[8] = \<const0> ;
  assign cfg_status[7] = \<const0> ;
  assign cfg_status[6] = \<const0> ;
  assign cfg_status[5] = \<const0> ;
  assign cfg_status[4] = \<const0> ;
  assign cfg_status[3] = \<const0> ;
  assign cfg_status[2] = \<const0> ;
  assign cfg_status[1] = \<const0> ;
  assign cfg_status[0] = \<const0> ;
  assign m_axis_rx_tuser[21] = \^m_axis_rx_tuser [21];
  assign m_axis_rx_tuser[20] = \<const0> ;
  assign m_axis_rx_tuser[19:17] = \^m_axis_rx_tuser [19:17];
  assign m_axis_rx_tuser[16] = \<const0> ;
  assign m_axis_rx_tuser[15] = \<const0> ;
  assign m_axis_rx_tuser[14] = \^m_axis_rx_tuser [14];
  assign m_axis_rx_tuser[13] = \<const0> ;
  assign m_axis_rx_tuser[12] = \<const0> ;
  assign m_axis_rx_tuser[11] = \<const0> ;
  assign m_axis_rx_tuser[10] = \<const0> ;
  assign m_axis_rx_tuser[9] = \<const0> ;
  assign m_axis_rx_tuser[8:0] = \^m_axis_rx_tuser [8:0];
  assign user_app_rdy = \<const1> ;
  GND GND
       (.G(\<const0> ));
  (* CFG_CTL_IF = "TRUE" *) 
  (* CFG_FC_IF = "TRUE" *) 
  (* CFG_MGMT_IF = "TRUE" *) 
  (* CFG_STATUS_IF = "TRUE" *) 
  (* CLASS_CODE = "058000" *) 
  (* C_DATA_WIDTH = "64" *) 
  (* ENABLE_JTAG_DBG = "FALSE" *) 
  (* ERR_REPORTING_IF = "TRUE" *) 
  (* EXT_CH_GT_DRP = "FALSE" *) 
  (* EXT_PIPE_INTERFACE = "FALSE" *) 
  (* EXT_STARTUP_PRIMITIVE = "FALSE" *) 
  (* KEEP_WIDTH = "8" *) 
  (* LINK_CAP_MAX_LINK_WIDTH = "1" *) 
  (* PCIE_ASYNC_EN = "FALSE" *) 
  (* PCIE_EXT_CLK = "TRUE" *) 
  (* PCIE_EXT_GT_COMMON = "FALSE" *) 
  (* PCIE_ID_IF = "FALSE" *) 
  (* PIPE_SIM = "FALSE" *) 
  (* PL_INTERFACE = "TRUE" *) 
  (* RCV_MSG_IF = "TRUE" *) 
  (* REDUCE_OOB_FREQ = "FALSE" *) 
  (* SHARED_LOGIC_IN_CORE = "FALSE" *) 
  (* TRANSCEIVER_CTRL_STATUS_PORTS = "FALSE" *) 
  (* bar_0 = "FFFFF800" *) 
  (* bar_1 = "00000000" *) 
  (* bar_2 = "00000000" *) 
  (* bar_3 = "00000000" *) 
  (* bar_4 = "00000000" *) 
  (* bar_5 = "00000000" *) 
  (* bram_lat = "0" *) 
  (* c_aer_base_ptr = "000" *) 
  (* c_aer_cap_ecrc_check_capable = "FALSE" *) 
  (* c_aer_cap_ecrc_gen_capable = "FALSE" *) 
  (* c_aer_cap_multiheader = "FALSE" *) 
  (* c_aer_cap_nextptr = "000" *) 
  (* c_aer_cap_on = "FALSE" *) 
  (* c_aer_cap_optional_err_support = "000000" *) 
  (* c_aer_cap_permit_rooterr_update = "FALSE" *) 
  (* c_buf_opt_bma = "TRUE" *) 
  (* c_component_name = "pcie_7x_0" *) 
  (* c_cpl_inf = "TRUE" *) 
  (* c_cpl_infinite = "TRUE" *) 
  (* c_cpl_timeout_disable_sup = "FALSE" *) 
  (* c_cpl_timeout_range = "0010" *) 
  (* c_cpl_timeout_ranges_sup = "2" *) 
  (* c_d1_support = "FALSE" *) 
  (* c_d2_support = "FALSE" *) 
  (* c_de_emph = "FALSE" *) 
  (* c_dev_cap2_ari_forwarding_supported = "FALSE" *) 
  (* c_dev_cap2_atomicop32_completer_supported = "FALSE" *) 
  (* c_dev_cap2_atomicop64_completer_supported = "FALSE" *) 
  (* c_dev_cap2_atomicop_routing_supported = "FALSE" *) 
  (* c_dev_cap2_cas128_completer_supported = "FALSE" *) 
  (* c_dev_cap2_tph_completer_supported = "00" *) 
  (* c_dev_control_ext_tag_default = "FALSE" *) 
  (* c_dev_port_type = "0" *) 
  (* c_dis_lane_reverse = "TRUE" *) 
  (* c_disable_rx_poisoned_resp = "FALSE" *) 
  (* c_disable_scrambling = "FALSE" *) 
  (* c_disable_tx_aspm_l0s = "FALSE" *) 
  (* c_dll_lnk_actv_cap = "FALSE" *) 
  (* c_dsi_bool = "FALSE" *) 
  (* c_dsn_base_ptr = "100" *) 
  (* c_dsn_cap_enabled = "TRUE" *) 
  (* c_dsn_next_ptr = "000" *) 
  (* c_enable_msg_route = "00000000000" *) 
  (* c_ep_l0s_accpt_lat = "0" *) 
  (* c_ep_l1_accpt_lat = "7" *) 
  (* c_ext_pci_cfg_space_addr = "3FF" *) 
  (* c_external_clocking = "TRUE" *) 
  (* c_fc_cpld = "461" *) 
  (* c_fc_cplh = "36" *) 
  (* c_fc_npd = "24" *) 
  (* c_fc_nph = "12" *) 
  (* c_fc_pd = "437" *) 
  (* c_fc_ph = "32" *) 
  (* c_gen1 = "FALSE" *) 
  (* c_header_type = "00" *) 
  (* c_hw_auton_spd_disable = "FALSE" *) 
  (* c_int_width = "64" *) 
  (* c_last_cfg_dw = "10C" *) 
  (* c_link_cap_aspm_optionality = "FALSE" *) 
  (* c_ll_ack_timeout = "0000" *) 
  (* c_ll_ack_timeout_enable = "FALSE" *) 
  (* c_ll_ack_timeout_function = "0" *) 
  (* c_ll_replay_timeout = "0000" *) 
  (* c_ll_replay_timeout_enable = "FALSE" *) 
  (* c_ll_replay_timeout_func = "1" *) 
  (* c_lnk_bndwdt_notif = "FALSE" *) 
  (* c_msi = "0" *) 
  (* c_msi_64b_addr = "TRUE" *) 
  (* c_msi_cap_on = "TRUE" *) 
  (* c_msi_mult_msg_extn = "0" *) 
  (* c_msi_per_vctr_mask_cap = "FALSE" *) 
  (* c_msix_cap_on = "FALSE" *) 
  (* c_msix_next_ptr = "00" *) 
  (* c_msix_pba_bir = "0" *) 
  (* c_msix_pba_offset = "0" *) 
  (* c_msix_table_bir = "0" *) 
  (* c_msix_table_offset = "0" *) 
  (* c_msix_table_size = "000" *) 
  (* c_pci_cfg_space_addr = "3F" *) 
  (* c_pcie_blk_locn = "0" *) 
  (* c_pcie_cap_next_ptr = "00" *) 
  (* c_pcie_cap_slot_implemented = "FALSE" *) 
  (* c_pcie_dbg_ports = "TRUE" *) 
  (* c_pcie_fast_config = "0" *) 
  (* c_perf_level_high = "TRUE" *) 
  (* c_phantom_functions = "0" *) 
  (* c_pm_cap_next_ptr = "48" *) 
  (* c_pme_support = "0F" *) 
  (* c_rbar_base_ptr = "000" *) 
  (* c_rbar_cap_control_encodedbar0 = "00" *) 
  (* c_rbar_cap_control_encodedbar1 = "00" *) 
  (* c_rbar_cap_control_encodedbar2 = "00" *) 
  (* c_rbar_cap_control_encodedbar3 = "00" *) 
  (* c_rbar_cap_control_encodedbar4 = "00" *) 
  (* c_rbar_cap_control_encodedbar5 = "00" *) 
  (* c_rbar_cap_index0 = "0" *) 
  (* c_rbar_cap_index1 = "0" *) 
  (* c_rbar_cap_index2 = "0" *) 
  (* c_rbar_cap_index3 = "0" *) 
  (* c_rbar_cap_index4 = "0" *) 
  (* c_rbar_cap_index5 = "0" *) 
  (* c_rbar_cap_nextptr = "000" *) 
  (* c_rbar_cap_on = "FALSE" *) 
  (* c_rbar_cap_sup0 = "00001" *) 
  (* c_rbar_cap_sup1 = "00001" *) 
  (* c_rbar_cap_sup2 = "00001" *) 
  (* c_rbar_cap_sup3 = "00001" *) 
  (* c_rbar_cap_sup4 = "00001" *) 
  (* c_rbar_cap_sup5 = "00001" *) 
  (* c_rbar_num = "0" *) 
  (* c_rcb = "0" *) 
  (* c_recrc_check = "0" *) 
  (* c_recrc_check_trim = "FALSE" *) 
  (* c_rev_gt_order = "FALSE" *) 
  (* c_root_cap_crs = "FALSE" *) 
  (* c_rx_raddr_lat = "0" *) 
  (* c_rx_ram_limit = "7FF" *) 
  (* c_rx_rdata_lat = "2" *) 
  (* c_rx_write_lat = "0" *) 
  (* c_silicon_rev = "2" *) 
  (* c_slot_cap_attn_butn = "FALSE" *) 
  (* c_slot_cap_attn_ind = "FALSE" *) 
  (* c_slot_cap_elec_interlock = "FALSE" *) 
  (* c_slot_cap_hotplug_cap = "FALSE" *) 
  (* c_slot_cap_hotplug_surprise = "FALSE" *) 
  (* c_slot_cap_mrl = "FALSE" *) 
  (* c_slot_cap_no_cmd_comp_sup = "FALSE" *) 
  (* c_slot_cap_physical_slot_num = "0" *) 
  (* c_slot_cap_pwr_ctrl = "FALSE" *) 
  (* c_slot_cap_pwr_ind = "FALSE" *) 
  (* c_slot_cap_pwr_limit_scale = "0" *) 
  (* c_slot_cap_pwr_limit_value = "0" *) 
  (* c_surprise_dn_err_cap = "FALSE" *) 
  (* c_trgt_lnk_spd = "0" *) 
  (* c_trn_np_fc = "TRUE" *) 
  (* c_tx_last_tlp = "29" *) 
  (* c_tx_raddr_lat = "0" *) 
  (* c_tx_rdata_lat = "2" *) 
  (* c_tx_write_lat = "0" *) 
  (* c_upconfig_capable = "TRUE" *) 
  (* c_upstream_facing = "TRUE" *) 
  (* c_ur_atomic = "FALSE" *) 
  (* c_ur_inv_req = "TRUE" *) 
  (* c_ur_prs_response = "TRUE" *) 
  (* c_vc_base_ptr = "000" *) 
  (* c_vc_cap_enabled = "FALSE" *) 
  (* c_vc_cap_reject_snoop = "FALSE" *) 
  (* c_vc_next_ptr = "000" *) 
  (* c_vsec_base_ptr = "000" *) 
  (* c_vsec_cap_enabled = "FALSE" *) 
  (* c_vsec_next_ptr = "000" *) 
  (* c_xlnx_ref_board = "NONE" *) 
  (* cap_ver = "2" *) 
  (* cardbus_cis_ptr = "00000000" *) 
  (* cmps = "2" *) 
  (* con_scl_fctr_d0_state = "0" *) 
  (* con_scl_fctr_d1_state = "0" *) 
  (* con_scl_fctr_d2_state = "0" *) 
  (* con_scl_fctr_d3_state = "0" *) 
  (* cost_table = "1" *) 
  (* d1_sup = "0" *) 
  (* d2_sup = "0" *) 
  (* dev_id = "7011" *) 
  (* dev_port_type = "0000" *) 
  (* dis_scl_fctr_d0_state = "0" *) 
  (* dis_scl_fctr_d1_state = "0" *) 
  (* dis_scl_fctr_d2_state = "0" *) 
  (* dis_scl_fctr_d3_state = "0" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* dsi = "0" *) 
  (* ep_l0s_accpt_lat = "000" *) 
  (* ep_l1_accpt_lat = "111" *) 
  (* ext_tag_fld_sup = "FALSE" *) 
  (* int_pin = "1" *) 
  (* intx = "TRUE" *) 
  (* max_lnk_spd = "1" *) 
  (* max_lnk_wdt = "000001" *) 
  (* mps = "010" *) 
  (* no_soft_rst = "TRUE" *) 
  (* pci_exp_int_freq = "1" *) 
  (* pci_exp_ref_freq = "0" *) 
  (* phantm_func_sup = "00" *) 
  (* pme_sup = "0F" *) 
  (* pwr_con_d0_state = "00" *) 
  (* pwr_con_d1_state = "00" *) 
  (* pwr_con_d2_state = "00" *) 
  (* pwr_con_d3_state = "00" *) 
  (* pwr_dis_d0_state = "00" *) 
  (* pwr_dis_d1_state = "00" *) 
  (* pwr_dis_d2_state = "00" *) 
  (* pwr_dis_d3_state = "00" *) 
  (* rev_id = "00" *) 
  (* slot_clk = "TRUE" *) 
  (* subsys_id = "0007" *) 
  (* subsys_ven_id = "10EE" *) 
  (* ven_id = "10EE" *) 
  (* xrom_bar = "00000000" *) 
  pcie_7x_0_pcie2_top U0
       (.cfg_aer_ecrc_check_en(cfg_aer_ecrc_check_en),
        .cfg_aer_ecrc_gen_en(cfg_aer_ecrc_gen_en),
        .cfg_aer_interrupt_msgnum(cfg_aer_interrupt_msgnum),
        .cfg_aer_rooterr_corr_err_received(cfg_aer_rooterr_corr_err_received),
        .cfg_aer_rooterr_corr_err_reporting_en(cfg_aer_rooterr_corr_err_reporting_en),
        .cfg_aer_rooterr_fatal_err_received(cfg_aer_rooterr_fatal_err_received),
        .cfg_aer_rooterr_fatal_err_reporting_en(cfg_aer_rooterr_fatal_err_reporting_en),
        .cfg_aer_rooterr_non_fatal_err_received(cfg_aer_rooterr_non_fatal_err_received),
        .cfg_aer_rooterr_non_fatal_err_reporting_en(cfg_aer_rooterr_non_fatal_err_reporting_en),
        .cfg_bridge_serr_en(cfg_bridge_serr_en),
        .cfg_bus_number(cfg_bus_number),
        .cfg_command({NLW_U0_cfg_command_UNCONNECTED[15:11],\^cfg_command }),
        .cfg_dcommand({NLW_U0_cfg_dcommand_UNCONNECTED[15],\^cfg_dcommand }),
        .cfg_dcommand2({NLW_U0_cfg_dcommand2_UNCONNECTED[15:12],\^cfg_dcommand2 }),
        .cfg_dev_id_pf0({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1}),
        .cfg_device_number(cfg_device_number),
        .cfg_ds_bus_number(cfg_ds_bus_number),
        .cfg_ds_device_number(cfg_ds_device_number),
        .cfg_ds_function_number(cfg_ds_function_number),
        .cfg_dsn(cfg_dsn),
        .cfg_dstatus({NLW_U0_cfg_dstatus_UNCONNECTED[15:6],\^cfg_dstatus }),
        .cfg_err_acs(1'b0),
        .cfg_err_aer_headerlog(cfg_err_aer_headerlog),
        .cfg_err_aer_headerlog_set(cfg_err_aer_headerlog_set),
        .cfg_err_atomic_egress_blocked(cfg_err_atomic_egress_blocked),
        .cfg_err_cor(cfg_err_cor),
        .cfg_err_cpl_abort(cfg_err_cpl_abort),
        .cfg_err_cpl_rdy(cfg_err_cpl_rdy),
        .cfg_err_cpl_timeout(cfg_err_cpl_timeout),
        .cfg_err_cpl_unexpect(cfg_err_cpl_unexpect),
        .cfg_err_ecrc(cfg_err_ecrc),
        .cfg_err_internal_cor(cfg_err_internal_cor),
        .cfg_err_internal_uncor(cfg_err_internal_uncor),
        .cfg_err_locked(cfg_err_locked),
        .cfg_err_malformed(cfg_err_malformed),
        .cfg_err_mc_blocked(cfg_err_mc_blocked),
        .cfg_err_norecovery(cfg_err_norecovery),
        .cfg_err_poisoned(cfg_err_poisoned),
        .cfg_err_posted(cfg_err_posted),
        .cfg_err_tlp_cpl_header(cfg_err_tlp_cpl_header),
        .cfg_err_ur(cfg_err_ur),
        .cfg_function_number(cfg_function_number),
        .cfg_interrupt(cfg_interrupt),
        .cfg_interrupt_assert(cfg_interrupt_assert),
        .cfg_interrupt_di(cfg_interrupt_di),
        .cfg_interrupt_do(cfg_interrupt_do),
        .cfg_interrupt_mmenable(cfg_interrupt_mmenable),
        .cfg_interrupt_msienable(cfg_interrupt_msienable),
        .cfg_interrupt_msixenable(cfg_interrupt_msixenable),
        .cfg_interrupt_msixfm(cfg_interrupt_msixfm),
        .cfg_interrupt_rdy(cfg_interrupt_rdy),
        .cfg_interrupt_stat(cfg_interrupt_stat),
        .cfg_lcommand({NLW_U0_cfg_lcommand_UNCONNECTED[15:12],\^cfg_lcommand }),
        .cfg_lstatus(\^cfg_lstatus ),
        .cfg_mgmt_byte_en(cfg_mgmt_byte_en),
        .cfg_mgmt_di(cfg_mgmt_di),
        .cfg_mgmt_do(cfg_mgmt_do),
        .cfg_mgmt_dwaddr(cfg_mgmt_dwaddr),
        .cfg_mgmt_rd_en(cfg_mgmt_rd_en),
        .cfg_mgmt_rd_wr_done(cfg_mgmt_rd_wr_done),
        .cfg_mgmt_wr_en(cfg_mgmt_wr_en),
        .cfg_mgmt_wr_readonly(cfg_mgmt_wr_readonly),
        .cfg_mgmt_wr_rw1c_as_rw(cfg_mgmt_wr_rw1c_as_rw),
        .cfg_msg_data(cfg_msg_data),
        .cfg_msg_received(cfg_msg_received),
        .cfg_msg_received_assert_int_a(cfg_msg_received_assert_int_a),
        .cfg_msg_received_assert_int_b(cfg_msg_received_assert_int_b),
        .cfg_msg_received_assert_int_c(cfg_msg_received_assert_int_c),
        .cfg_msg_received_assert_int_d(cfg_msg_received_assert_int_d),
        .cfg_msg_received_deassert_int_a(cfg_msg_received_deassert_int_a),
        .cfg_msg_received_deassert_int_b(cfg_msg_received_deassert_int_b),
        .cfg_msg_received_deassert_int_c(cfg_msg_received_deassert_int_c),
        .cfg_msg_received_deassert_int_d(cfg_msg_received_deassert_int_d),
        .cfg_msg_received_err_cor(cfg_msg_received_err_cor),
        .cfg_msg_received_err_fatal(cfg_msg_received_err_fatal),
        .cfg_msg_received_err_non_fatal(cfg_msg_received_err_non_fatal),
        .cfg_msg_received_pm_as_nak(cfg_msg_received_pm_as_nak),
        .cfg_msg_received_pm_pme(cfg_msg_received_pm_pme),
        .cfg_msg_received_pme_to_ack(cfg_msg_received_pme_to_ack),
        .cfg_msg_received_setslotpowerlimit(cfg_msg_received_setslotpowerlimit),
        .cfg_pcie_link_state(cfg_pcie_link_state),
        .cfg_pciecap_interrupt_msgnum(cfg_pciecap_interrupt_msgnum),
        .cfg_pm_force_state(cfg_pm_force_state),
        .cfg_pm_force_state_en(cfg_pm_force_state_en),
        .cfg_pm_halt_aspm_l0s(cfg_pm_halt_aspm_l0s),
        .cfg_pm_halt_aspm_l1(cfg_pm_halt_aspm_l1),
        .cfg_pm_send_pme_to(1'b0),
        .cfg_pm_wake(cfg_pm_wake),
        .cfg_pmcsr_pme_en(cfg_pmcsr_pme_en),
        .cfg_pmcsr_pme_status(cfg_pmcsr_pme_status),
        .cfg_pmcsr_powerstate(cfg_pmcsr_powerstate),
        .cfg_received_func_lvl_rst(cfg_received_func_lvl_rst),
        .cfg_rev_id_pf0({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .cfg_root_control_pme_int_en(cfg_root_control_pme_int_en),
        .cfg_root_control_syserr_corr_err_en(cfg_root_control_syserr_corr_err_en),
        .cfg_root_control_syserr_fatal_err_en(cfg_root_control_syserr_fatal_err_en),
        .cfg_root_control_syserr_non_fatal_err_en(cfg_root_control_syserr_non_fatal_err_en),
        .cfg_slot_control_electromech_il_ctl_pulse(cfg_slot_control_electromech_il_ctl_pulse),
        .cfg_status(NLW_U0_cfg_status_UNCONNECTED[15:0]),
        .cfg_subsys_id_pf0({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1}),
        .cfg_subsys_ven_id({1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b0,1'b1,1'b1,1'b1,1'b0}),
        .cfg_to_turnoff(cfg_to_turnoff),
        .cfg_trn_pending(cfg_trn_pending),
        .cfg_turnoff_ok(cfg_turnoff_ok),
        .cfg_vc_tcvc_map(cfg_vc_tcvc_map),
        .cfg_ven_id({1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b0,1'b1,1'b1,1'b1,1'b0}),
        .common_commands_in({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .common_commands_out(NLW_U0_common_commands_out_UNCONNECTED[11:0]),
        .ext_ch_gt_drpaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ext_ch_gt_drpclk(NLW_U0_ext_ch_gt_drpclk_UNCONNECTED),
        .ext_ch_gt_drpdi({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ext_ch_gt_drpdo(NLW_U0_ext_ch_gt_drpdo_UNCONNECTED[15:0]),
        .ext_ch_gt_drpen(1'b0),
        .ext_ch_gt_drprdy(NLW_U0_ext_ch_gt_drprdy_UNCONNECTED[0]),
        .ext_ch_gt_drpwe(1'b0),
        .fc_cpld(fc_cpld),
        .fc_cplh(fc_cplh),
        .fc_npd(fc_npd),
        .fc_nph(fc_nph),
        .fc_pd(fc_pd),
        .fc_ph(fc_ph),
        .fc_sel(fc_sel),
        .gt_ch_drp_rdy(NLW_U0_gt_ch_drp_rdy_UNCONNECTED[0]),
        .icap_clk(1'b0),
        .icap_csib(1'b0),
        .icap_i({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .icap_o(NLW_U0_icap_o_UNCONNECTED[31:0]),
        .icap_rdwrb(1'b0),
        .int_dclk_out(NLW_U0_int_dclk_out_UNCONNECTED),
        .int_mmcm_lock_out(NLW_U0_int_mmcm_lock_out_UNCONNECTED),
        .int_oobclk_out(NLW_U0_int_oobclk_out_UNCONNECTED),
        .int_pclk_out_slave(NLW_U0_int_pclk_out_slave_UNCONNECTED),
        .int_pclk_sel_slave(1'b0),
        .int_pipe_rxusrclk_out(NLW_U0_int_pipe_rxusrclk_out_UNCONNECTED),
        .int_qplllock_out(NLW_U0_int_qplllock_out_UNCONNECTED[1:0]),
        .int_qplloutclk_out(NLW_U0_int_qplloutclk_out_UNCONNECTED[1:0]),
        .int_qplloutrefclk_out(NLW_U0_int_qplloutrefclk_out_UNCONNECTED[1:0]),
        .int_rxoutclk_out(NLW_U0_int_rxoutclk_out_UNCONNECTED[0]),
        .int_userclk1_out(NLW_U0_int_userclk1_out_UNCONNECTED),
        .int_userclk2_out(NLW_U0_int_userclk2_out_UNCONNECTED),
        .m_axis_rx_tdata(m_axis_rx_tdata),
        .m_axis_rx_tkeep(m_axis_rx_tkeep),
        .m_axis_rx_tlast(m_axis_rx_tlast),
        .m_axis_rx_tready(m_axis_rx_tready),
        .m_axis_rx_tuser(\^m_axis_rx_tuser ),
        .m_axis_rx_tvalid(m_axis_rx_tvalid),
        .pci_exp_rxn(pci_exp_rxn),
        .pci_exp_rxp(pci_exp_rxp),
        .pci_exp_txn(pci_exp_txn),
        .pci_exp_txp(pci_exp_txp),
        .pcie_drp_addr(pcie_drp_addr),
        .pcie_drp_clk(pcie_drp_clk),
        .pcie_drp_di(pcie_drp_di),
        .pcie_drp_do(pcie_drp_do),
        .pcie_drp_en(pcie_drp_en),
        .pcie_drp_rdy(pcie_drp_rdy),
        .pcie_drp_we(pcie_drp_we),
        .pipe_cpll_lock(NLW_U0_pipe_cpll_lock_UNCONNECTED[0]),
        .pipe_dclk_in(pipe_dclk_in),
        .pipe_debug(NLW_U0_pipe_debug_UNCONNECTED[31:0]),
        .pipe_debug_0(NLW_U0_pipe_debug_0_UNCONNECTED[0]),
        .pipe_debug_1(NLW_U0_pipe_debug_1_UNCONNECTED[0]),
        .pipe_debug_2(NLW_U0_pipe_debug_2_UNCONNECTED[0]),
        .pipe_debug_3(NLW_U0_pipe_debug_3_UNCONNECTED[0]),
        .pipe_debug_4(NLW_U0_pipe_debug_4_UNCONNECTED[0]),
        .pipe_debug_5(NLW_U0_pipe_debug_5_UNCONNECTED[0]),
        .pipe_debug_6(NLW_U0_pipe_debug_6_UNCONNECTED[0]),
        .pipe_debug_7(NLW_U0_pipe_debug_7_UNCONNECTED[0]),
        .pipe_debug_8(NLW_U0_pipe_debug_8_UNCONNECTED[0]),
        .pipe_debug_9(NLW_U0_pipe_debug_9_UNCONNECTED[0]),
        .pipe_dmonitorout(NLW_U0_pipe_dmonitorout_UNCONNECTED[14:0]),
        .pipe_drp_fsm(NLW_U0_pipe_drp_fsm_UNCONNECTED[6:0]),
        .pipe_eyescandataerror(NLW_U0_pipe_eyescandataerror_UNCONNECTED[0]),
        .pipe_gen3_out(pipe_gen3_out),
        .pipe_loopback({1'b0,1'b0,1'b0}),
        .pipe_mmcm_lock_in(pipe_mmcm_lock_in),
        .pipe_mmcm_rst_n(1'b0),
        .pipe_oobclk_in(pipe_oobclk_in),
        .pipe_pclk_in(pipe_pclk_in),
        .pipe_pclk_sel_out(pipe_pclk_sel_out),
        .pipe_qpll_lock(NLW_U0_pipe_qpll_lock_UNCONNECTED[0]),
        .pipe_qrst_fsm(NLW_U0_pipe_qrst_fsm_UNCONNECTED[11:0]),
        .pipe_qrst_idle(NLW_U0_pipe_qrst_idle_UNCONNECTED),
        .pipe_rate_fsm(NLW_U0_pipe_rate_fsm_UNCONNECTED[4:0]),
        .pipe_rate_idle(NLW_U0_pipe_rate_idle_UNCONNECTED),
        .pipe_rst_fsm(NLW_U0_pipe_rst_fsm_UNCONNECTED[4:0]),
        .pipe_rst_idle(NLW_U0_pipe_rst_idle_UNCONNECTED),
        .pipe_rx_0_sigs({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .pipe_rx_1_sigs({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .pipe_rx_2_sigs({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .pipe_rx_3_sigs({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .pipe_rx_4_sigs({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .pipe_rx_5_sigs({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .pipe_rx_6_sigs({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .pipe_rx_7_sigs({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .pipe_rxbufstatus(NLW_U0_pipe_rxbufstatus_UNCONNECTED[2:0]),
        .pipe_rxcommadet(NLW_U0_pipe_rxcommadet_UNCONNECTED[0]),
        .pipe_rxdisperr(NLW_U0_pipe_rxdisperr_UNCONNECTED[7:0]),
        .pipe_rxdlysresetdone(NLW_U0_pipe_rxdlysresetdone_UNCONNECTED[0]),
        .pipe_rxnotintable(NLW_U0_pipe_rxnotintable_UNCONNECTED[7:0]),
        .pipe_rxoutclk_in(1'b0),
        .pipe_rxoutclk_out(pipe_rxoutclk_out),
        .pipe_rxphaligndone(NLW_U0_pipe_rxphaligndone_UNCONNECTED[0]),
        .pipe_rxpmaresetdone(NLW_U0_pipe_rxpmaresetdone_UNCONNECTED[0]),
        .pipe_rxprbscntreset(1'b0),
        .pipe_rxprbserr(NLW_U0_pipe_rxprbserr_UNCONNECTED[0]),
        .pipe_rxprbssel({1'b0,1'b0,1'b0}),
        .pipe_rxstatus(NLW_U0_pipe_rxstatus_UNCONNECTED[2:0]),
        .pipe_rxsyncdone(NLW_U0_pipe_rxsyncdone_UNCONNECTED[0]),
        .pipe_rxusrclk_in(pipe_rxusrclk_in),
        .pipe_sync_fsm_rx(NLW_U0_pipe_sync_fsm_rx_UNCONNECTED[6:0]),
        .pipe_sync_fsm_tx(NLW_U0_pipe_sync_fsm_tx_UNCONNECTED[5:0]),
        .pipe_tx_0_sigs(NLW_U0_pipe_tx_0_sigs_UNCONNECTED[24:0]),
        .pipe_tx_1_sigs(NLW_U0_pipe_tx_1_sigs_UNCONNECTED[24:0]),
        .pipe_tx_2_sigs(NLW_U0_pipe_tx_2_sigs_UNCONNECTED[24:0]),
        .pipe_tx_3_sigs(NLW_U0_pipe_tx_3_sigs_UNCONNECTED[24:0]),
        .pipe_tx_4_sigs(NLW_U0_pipe_tx_4_sigs_UNCONNECTED[24:0]),
        .pipe_tx_5_sigs(NLW_U0_pipe_tx_5_sigs_UNCONNECTED[24:0]),
        .pipe_tx_6_sigs(NLW_U0_pipe_tx_6_sigs_UNCONNECTED[24:0]),
        .pipe_tx_7_sigs(NLW_U0_pipe_tx_7_sigs_UNCONNECTED[24:0]),
        .pipe_txdlysresetdone(NLW_U0_pipe_txdlysresetdone_UNCONNECTED[0]),
        .pipe_txinhibit(1'b0),
        .pipe_txoutclk_out(pipe_txoutclk_out),
        .pipe_txphaligndone(NLW_U0_pipe_txphaligndone_UNCONNECTED[0]),
        .pipe_txphinitdone(NLW_U0_pipe_txphinitdone_UNCONNECTED[0]),
        .pipe_txprbsforceerr(1'b0),
        .pipe_txprbssel({1'b0,1'b0,1'b0}),
        .pipe_userclk1_in(pipe_userclk1_in),
        .pipe_userclk2_in(pipe_userclk2_in),
        .pl_directed_change_done(pl_directed_change_done),
        .pl_directed_link_auton(pl_directed_link_auton),
        .pl_directed_link_change(pl_directed_link_change),
        .pl_directed_link_speed(pl_directed_link_speed),
        .pl_directed_link_width(pl_directed_link_width),
        .pl_downstream_deemph_source(pl_downstream_deemph_source),
        .pl_initial_link_width(pl_initial_link_width),
        .pl_lane_reversal_mode(pl_lane_reversal_mode),
        .pl_link_gen2_cap(pl_link_gen2_cap),
        .pl_link_partner_gen2_supported(pl_link_partner_gen2_supported),
        .pl_link_upcfg_cap(pl_link_upcfg_cap),
        .pl_ltssm_state(pl_ltssm_state),
        .pl_phy_lnk_up(pl_phy_lnk_up),
        .pl_received_hot_rst(pl_received_hot_rst),
        .pl_rx_pm_state(pl_rx_pm_state),
        .pl_sel_lnk_rate(pl_sel_lnk_rate),
        .pl_sel_lnk_width(pl_sel_lnk_width),
        .pl_transmit_hot_rst(pl_transmit_hot_rst),
        .pl_tx_pm_state(pl_tx_pm_state),
        .pl_upstream_prefer_deemph(pl_upstream_prefer_deemph),
        .qpll_drp_clk(NLW_U0_qpll_drp_clk_UNCONNECTED),
        .qpll_drp_crscode({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .qpll_drp_done({1'b0,1'b0}),
        .qpll_drp_fsm({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .qpll_drp_gen3(NLW_U0_qpll_drp_gen3_UNCONNECTED),
        .qpll_drp_ovrd(NLW_U0_qpll_drp_ovrd_UNCONNECTED),
        .qpll_drp_reset({1'b0,1'b0}),
        .qpll_drp_rst_n(NLW_U0_qpll_drp_rst_n_UNCONNECTED),
        .qpll_drp_start(NLW_U0_qpll_drp_start_UNCONNECTED),
        .qpll_qplld(NLW_U0_qpll_qplld_UNCONNECTED),
        .qpll_qplllock({1'b0,1'b0}),
        .qpll_qplloutclk({1'b0,1'b0}),
        .qpll_qplloutrefclk({1'b0,1'b0}),
        .qpll_qpllreset(NLW_U0_qpll_qpllreset_UNCONNECTED[1:0]),
        .rx_np_ok(rx_np_ok),
        .rx_np_req(rx_np_req),
        .s_axis_tx_tdata(s_axis_tx_tdata),
        .s_axis_tx_tkeep({s_axis_tx_tkeep[7],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tx_tlast(s_axis_tx_tlast),
        .s_axis_tx_tready(s_axis_tx_tready),
        .s_axis_tx_tuser(s_axis_tx_tuser),
        .s_axis_tx_tvalid(s_axis_tx_tvalid),
        .startup_cfgclk(NLW_U0_startup_cfgclk_UNCONNECTED),
        .startup_cfgmclk(NLW_U0_startup_cfgmclk_UNCONNECTED),
        .startup_clk(1'b0),
        .startup_eos(NLW_U0_startup_eos_UNCONNECTED),
        .startup_eos_in(1'b0),
        .startup_gsr(1'b0),
        .startup_gts(1'b0),
        .startup_keyclearb(1'b1),
        .startup_pack(1'b0),
        .startup_preq(NLW_U0_startup_preq_UNCONNECTED),
        .startup_usrcclko(1'b1),
        .startup_usrcclkts(1'b0),
        .startup_usrdoneo(1'b0),
        .startup_usrdonets(1'b1),
        .sys_clk(sys_clk),
        .sys_rst_n(sys_rst_n),
        .tx_buf_av(tx_buf_av),
        .tx_cfg_gnt(tx_cfg_gnt),
        .tx_cfg_req(tx_cfg_req),
        .tx_err_drop(tx_err_drop),
        .user_app_rdy(NLW_U0_user_app_rdy_UNCONNECTED),
        .user_clk_out(user_clk_out),
        .user_lnk_up(user_lnk_up),
        .user_reset_out(user_reset_out));
  VCC VCC
       (.P(\<const1> ));
endmodule

module pcie_7x_0_axi_basic_rx
   (trn_rsrc_dsc_d,
    E,
    m_axis_rx_tvalid_xhdl2_reg,
    m_axis_rx_tlast,
    trn_in_packet,
    reg_dsc_detect_reg,
    m_axis_rx_tuser,
    m_axis_rx_tdata,
    m_axis_rx_tkeep,
    \trn_rbar_hit_prev_reg[0] ,
    pipe_userclk2_in,
    trn_rsrc_dsc,
    rsrc_rdy_filtered6_out,
    trn_rrem,
    trn_reof,
    trn_rsrc_dsc_prev0,
    trn_rsof,
    trn_recrc_err,
    trn_rerrfwd,
    trn_in_packet_reg,
    m_axis_rx_tready,
    dsc_detect,
    trn_rd,
    trn_rbar_hit);
  output trn_rsrc_dsc_d;
  output [0:0]E;
  output m_axis_rx_tvalid_xhdl2_reg;
  output m_axis_rx_tlast;
  output trn_in_packet;
  output reg_dsc_detect_reg;
  output [12:0]m_axis_rx_tuser;
  output [63:0]m_axis_rx_tdata;
  output [1:0]m_axis_rx_tkeep;
  input \trn_rbar_hit_prev_reg[0] ;
  input pipe_userclk2_in;
  input trn_rsrc_dsc;
  input rsrc_rdy_filtered6_out;
  input [0:0]trn_rrem;
  input trn_reof;
  input trn_rsrc_dsc_prev0;
  input trn_rsof;
  input trn_recrc_err;
  input trn_rerrfwd;
  input trn_in_packet_reg;
  input m_axis_rx_tready;
  input dsc_detect;
  input [63:0]trn_rd;
  input [6:0]trn_rbar_hit;

  wire [0:0]E;
  wire dsc_detect;
  wire [63:0]m_axis_rx_tdata;
  wire [1:0]m_axis_rx_tkeep;
  wire m_axis_rx_tlast;
  wire m_axis_rx_tready;
  wire [12:0]m_axis_rx_tuser;
  wire m_axis_rx_tvalid_xhdl2_reg;
  wire null_mux_sel;
  wire [9:5]payload_len;
  wire pipe_userclk2_in;
  wire [4:0]plusOp;
  wire reg_dsc_detect_reg;
  wire rsrc_rdy_filtered6_out;
  wire rx_null_gen_inst_n_0;
  wire rx_null_gen_inst_n_1;
  wire rx_null_gen_inst_n_2;
  wire rx_null_gen_inst_n_3;
  wire rx_null_gen_inst_n_4;
  wire rx_pipeline_inst_n_7;
  wire trn_in_packet;
  wire trn_in_packet_reg;
  wire [6:0]trn_rbar_hit;
  wire \trn_rbar_hit_prev_reg[0] ;
  wire [63:0]trn_rd;
  wire trn_recrc_err;
  wire trn_reof;
  wire trn_rerrfwd;
  wire [0:0]trn_rrem;
  wire trn_rsof;
  wire trn_rsrc_dsc;
  wire trn_rsrc_dsc_d;
  wire trn_rsrc_dsc_prev0;

  pcie_7x_0_axi_basic_rx_null_gen rx_null_gen_inst
       (.D(rx_null_gen_inst_n_0),
        .cur_state_reg_0(\trn_rbar_hit_prev_reg[0] ),
        .cur_state_reg_1(m_axis_rx_tvalid_xhdl2_reg),
        .in0(plusOp),
        .m_axis_rx_tready(m_axis_rx_tready),
        .m_axis_rx_tuser(m_axis_rx_tuser[12]),
        .\m_axis_rx_tuser_xhdl1_reg[19] (rx_pipeline_inst_n_7),
        .null_mux_sel(null_mux_sel),
        .null_mux_sel_reg(rx_null_gen_inst_n_4),
        .pipe_userclk2_in(pipe_userclk2_in),
        .\reg_pkt_len_counter_reg[0]_0 (rx_null_gen_inst_n_3),
        .\reg_pkt_len_counter_reg[3]_0 (rx_null_gen_inst_n_2),
        .\reg_pkt_len_counter_reg[9]_0 (payload_len),
        .\reg_tkeep[7]_i_7_0 (rx_null_gen_inst_n_1));
  pcie_7x_0_axi_basic_rx_pipeline rx_pipeline_inst
       (.D(rx_null_gen_inst_n_0),
        .E(E),
        .dsc_detect(dsc_detect),
        .in0(plusOp),
        .m_axis_rx_tdata(m_axis_rx_tdata),
        .\m_axis_rx_tdata_xhdl0_reg[30]_0 (payload_len),
        .m_axis_rx_tkeep(m_axis_rx_tkeep),
        .m_axis_rx_tlast(m_axis_rx_tlast),
        .m_axis_rx_tready(m_axis_rx_tready),
        .m_axis_rx_tuser(m_axis_rx_tuser),
        .\m_axis_rx_tuser_xhdl1_reg[21]_0 (rx_null_gen_inst_n_3),
        .m_axis_rx_tvalid_xhdl2_reg_0(m_axis_rx_tvalid_xhdl2_reg),
        .null_mux_sel(null_mux_sel),
        .null_mux_sel_reg_0(rx_null_gen_inst_n_4),
        .pcie_block_i(rx_pipeline_inst_n_7),
        .pipe_userclk2_in(pipe_userclk2_in),
        .reg_dsc_detect_reg_0(reg_dsc_detect_reg),
        .\reg_tkeep_reg[7]_0 (rx_null_gen_inst_n_1),
        .\reg_tkeep_reg[7]_1 (rx_null_gen_inst_n_2),
        .rsrc_rdy_filtered6_out(rsrc_rdy_filtered6_out),
        .trn_in_packet(trn_in_packet),
        .trn_in_packet_reg_0(trn_in_packet_reg),
        .trn_rbar_hit(trn_rbar_hit),
        .\trn_rbar_hit_prev_reg[0]_0 (\trn_rbar_hit_prev_reg[0] ),
        .trn_rd(trn_rd),
        .trn_recrc_err(trn_recrc_err),
        .trn_reof(trn_reof),
        .trn_rerrfwd(trn_rerrfwd),
        .trn_rrem(trn_rrem),
        .trn_rsof(trn_rsof),
        .trn_rsrc_dsc(trn_rsrc_dsc),
        .trn_rsrc_dsc_d(trn_rsrc_dsc_d),
        .trn_rsrc_dsc_prev0(trn_rsrc_dsc_prev0));
endmodule

module pcie_7x_0_axi_basic_rx_null_gen
   (D,
    \reg_tkeep[7]_i_7_0 ,
    \reg_pkt_len_counter_reg[3]_0 ,
    \reg_pkt_len_counter_reg[0]_0 ,
    null_mux_sel_reg,
    in0,
    \reg_pkt_len_counter_reg[9]_0 ,
    cur_state_reg_0,
    pipe_userclk2_in,
    null_mux_sel,
    \m_axis_rx_tuser_xhdl1_reg[19] ,
    m_axis_rx_tready,
    cur_state_reg_1,
    m_axis_rx_tuser);
  output [0:0]D;
  output \reg_tkeep[7]_i_7_0 ;
  output \reg_pkt_len_counter_reg[3]_0 ;
  output \reg_pkt_len_counter_reg[0]_0 ;
  output null_mux_sel_reg;
  input [4:0]in0;
  input [4:0]\reg_pkt_len_counter_reg[9]_0 ;
  input cur_state_reg_0;
  input pipe_userclk2_in;
  input null_mux_sel;
  input \m_axis_rx_tuser_xhdl1_reg[19] ;
  input m_axis_rx_tready;
  input cur_state_reg_1;
  input [0:0]m_axis_rx_tuser;

  wire [0:0]D;
  wire cur_state;
  wire cur_state_i_2_n_0;
  wire cur_state_i_3_n_0;
  wire cur_state_i_4_n_0;
  wire cur_state_reg_0;
  wire cur_state_reg_1;
  wire m_axis_rx_tready;
  wire [0:0]m_axis_rx_tuser;
  wire \m_axis_rx_tuser_xhdl1_reg[19] ;
  wire minusOp__0_carry__0_i_1_n_0;
  wire minusOp__0_carry__0_i_2_n_0;
  wire minusOp__0_carry__0_i_3_n_0;
  wire minusOp__0_carry__0_i_4_n_0;
  wire minusOp__0_carry__0_n_0;
  wire minusOp__0_carry__0_n_1;
  wire minusOp__0_carry__0_n_2;
  wire minusOp__0_carry__0_n_3;
  wire minusOp__0_carry__1_i_1_n_0;
  wire minusOp__0_carry__1_i_2_n_0;
  wire minusOp__0_carry__1_i_3_n_0;
  wire minusOp__0_carry__1_n_2;
  wire minusOp__0_carry__1_n_3;
  wire minusOp__0_carry_i_1_n_0;
  wire minusOp__0_carry_i_2_n_0;
  wire minusOp__0_carry_i_3_n_0;
  wire minusOp__0_carry_i_4_n_0;
  wire minusOp__0_carry_i_5_n_0;
  wire minusOp__0_carry_n_0;
  wire minusOp__0_carry_n_1;
  wire minusOp__0_carry_n_2;
  wire minusOp__0_carry_n_3;
  (* RTL_KEEP = "true" *) wire [11:0]new_pkt_len;
  (* RTL_KEEP = "true" *) wire [4:0]new_pkt_len_1;
  wire next_state;
  wire null_mux_sel;
  wire null_mux_sel_reg;
  wire pipe_userclk2_in;
  wire [11:1]pkt_len_counter;
  wire [11:0]reg_pkt_len_counter;
  wire \reg_pkt_len_counter[0]_i_1_n_0 ;
  wire \reg_pkt_len_counter[10]_i_1_n_0 ;
  wire \reg_pkt_len_counter[11]_i_1_n_0 ;
  wire \reg_pkt_len_counter[1]_i_1_n_0 ;
  wire \reg_pkt_len_counter[2]_i_1_n_0 ;
  wire \reg_pkt_len_counter[3]_i_1_n_0 ;
  wire \reg_pkt_len_counter[4]_i_1_n_0 ;
  wire \reg_pkt_len_counter[5]_i_1_n_0 ;
  wire \reg_pkt_len_counter[6]_i_1_n_0 ;
  wire \reg_pkt_len_counter[7]_i_1_n_0 ;
  wire \reg_pkt_len_counter[8]_i_1_n_0 ;
  wire \reg_pkt_len_counter[9]_i_1_n_0 ;
  wire \reg_pkt_len_counter_reg[0]_0 ;
  wire \reg_pkt_len_counter_reg[3]_0 ;
  wire \reg_tkeep[7]_i_4_n_0 ;
  wire \reg_tkeep[7]_i_5_n_0 ;
  wire \reg_tkeep[7]_i_6_n_0 ;
  wire \reg_tkeep[7]_i_7_0 ;
  wire \reg_tkeep[7]_i_7_n_0 ;
  wire [3:2]NLW_minusOp__0_carry__1_CO_UNCONNECTED;
  wire [3:3]NLW_minusOp__0_carry__1_O_UNCONNECTED;

  assign new_pkt_len[9:5] = \reg_pkt_len_counter_reg[9]_0 [4:0];
  assign new_pkt_len_1 = in0[4:0];
  LUT5 #(
    .INIT(32'hAAAAAAEA)) 
    cur_state_i_1
       (.I0(cur_state_i_2_n_0),
        .I1(m_axis_rx_tready),
        .I2(cur_state_reg_1),
        .I3(cur_state),
        .I4(m_axis_rx_tuser),
        .O(next_state));
  LUT6 #(
    .INIT(64'hAAAAAAA8AAAAAAAA)) 
    cur_state_i_2
       (.I0(cur_state),
        .I1(reg_pkt_len_counter[4]),
        .I2(reg_pkt_len_counter[6]),
        .I3(reg_pkt_len_counter[7]),
        .I4(cur_state_i_3_n_0),
        .I5(cur_state_i_4_n_0),
        .O(cur_state_i_2_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    cur_state_i_3
       (.I0(reg_pkt_len_counter[8]),
        .I1(reg_pkt_len_counter[5]),
        .I2(reg_pkt_len_counter[9]),
        .I3(reg_pkt_len_counter[2]),
        .O(cur_state_i_3_n_0));
  LUT6 #(
    .INIT(64'h0000000000000700)) 
    cur_state_i_4
       (.I0(reg_pkt_len_counter[0]),
        .I1(reg_pkt_len_counter[1]),
        .I2(reg_pkt_len_counter[3]),
        .I3(m_axis_rx_tready),
        .I4(reg_pkt_len_counter[10]),
        .I5(reg_pkt_len_counter[11]),
        .O(cur_state_i_4_n_0));
  FDRE #(
    .INIT(1'b0)) 
    cur_state_reg
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(next_state),
        .Q(cur_state),
        .R(cur_state_reg_0));
  LUT1 #(
    .INIT(2'h2)) 
    i_0
       (.I0(1'b0),
        .O(new_pkt_len[11]));
  LUT1 #(
    .INIT(2'h2)) 
    i_1
       (.I0(1'b0),
        .O(new_pkt_len[10]));
  LUT6 #(
    .INIT(64'h5555555500000400)) 
    \m_axis_rx_tuser_xhdl1[19]_i_2 
       (.I0(cur_state_reg_0),
        .I1(\reg_tkeep[7]_i_7_0 ),
        .I2(\reg_pkt_len_counter_reg[3]_0 ),
        .I3(null_mux_sel),
        .I4(\reg_pkt_len_counter[0]_i_1_n_0 ),
        .I5(\m_axis_rx_tuser_xhdl1_reg[19] ),
        .O(D));
  LUT6 #(
    .INIT(64'h202A808A2A208A80)) 
    \m_axis_rx_tuser_xhdl1[21]_i_3 
       (.I0(\reg_tkeep[7]_i_7_0 ),
        .I1(pkt_len_counter[1]),
        .I2(cur_state_i_2_n_0),
        .I3(new_pkt_len[1]),
        .I4(reg_pkt_len_counter[0]),
        .I5(new_pkt_len[0]),
        .O(\reg_pkt_len_counter_reg[0]_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 minusOp__0_carry
       (.CI(1'b0),
        .CO({minusOp__0_carry_n_0,minusOp__0_carry_n_1,minusOp__0_carry_n_2,minusOp__0_carry_n_3}),
        .CYINIT(1'b0),
        .DI({reg_pkt_len_counter[3:2],minusOp__0_carry_i_1_n_0,1'b0}),
        .O(pkt_len_counter[4:1]),
        .S({minusOp__0_carry_i_2_n_0,minusOp__0_carry_i_3_n_0,minusOp__0_carry_i_4_n_0,minusOp__0_carry_i_5_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 minusOp__0_carry__0
       (.CI(minusOp__0_carry_n_0),
        .CO({minusOp__0_carry__0_n_0,minusOp__0_carry__0_n_1,minusOp__0_carry__0_n_2,minusOp__0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI(reg_pkt_len_counter[7:4]),
        .O(pkt_len_counter[8:5]),
        .S({minusOp__0_carry__0_i_1_n_0,minusOp__0_carry__0_i_2_n_0,minusOp__0_carry__0_i_3_n_0,minusOp__0_carry__0_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp__0_carry__0_i_1
       (.I0(reg_pkt_len_counter[7]),
        .I1(reg_pkt_len_counter[8]),
        .O(minusOp__0_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp__0_carry__0_i_2
       (.I0(reg_pkt_len_counter[6]),
        .I1(reg_pkt_len_counter[7]),
        .O(minusOp__0_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp__0_carry__0_i_3
       (.I0(reg_pkt_len_counter[5]),
        .I1(reg_pkt_len_counter[6]),
        .O(minusOp__0_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp__0_carry__0_i_4
       (.I0(reg_pkt_len_counter[4]),
        .I1(reg_pkt_len_counter[5]),
        .O(minusOp__0_carry__0_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 minusOp__0_carry__1
       (.CI(minusOp__0_carry__0_n_0),
        .CO({NLW_minusOp__0_carry__1_CO_UNCONNECTED[3:2],minusOp__0_carry__1_n_2,minusOp__0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,reg_pkt_len_counter[9:8]}),
        .O({NLW_minusOp__0_carry__1_O_UNCONNECTED[3],pkt_len_counter[11:9]}),
        .S({1'b0,minusOp__0_carry__1_i_1_n_0,minusOp__0_carry__1_i_2_n_0,minusOp__0_carry__1_i_3_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp__0_carry__1_i_1
       (.I0(reg_pkt_len_counter[10]),
        .I1(reg_pkt_len_counter[11]),
        .O(minusOp__0_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp__0_carry__1_i_2
       (.I0(reg_pkt_len_counter[9]),
        .I1(reg_pkt_len_counter[10]),
        .O(minusOp__0_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp__0_carry__1_i_3
       (.I0(reg_pkt_len_counter[8]),
        .I1(reg_pkt_len_counter[9]),
        .O(minusOp__0_carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    minusOp__0_carry_i_1
       (.I0(reg_pkt_len_counter[1]),
        .I1(m_axis_rx_tready),
        .O(minusOp__0_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp__0_carry_i_2
       (.I0(reg_pkt_len_counter[3]),
        .I1(reg_pkt_len_counter[4]),
        .O(minusOp__0_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp__0_carry_i_3
       (.I0(reg_pkt_len_counter[2]),
        .I1(reg_pkt_len_counter[3]),
        .O(minusOp__0_carry_i_3_n_0));
  LUT3 #(
    .INIT(8'hD2)) 
    minusOp__0_carry_i_4
       (.I0(m_axis_rx_tready),
        .I1(reg_pkt_len_counter[1]),
        .I2(reg_pkt_len_counter[2]),
        .O(minusOp__0_carry_i_4_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    minusOp__0_carry_i_5
       (.I0(reg_pkt_len_counter[1]),
        .I1(m_axis_rx_tready),
        .O(minusOp__0_carry_i_5_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    new_pkt_len_1_inst
       (.I0(new_pkt_len_1[4]),
        .O(new_pkt_len[4]));
  LUT1 #(
    .INIT(2'h2)) 
    new_pkt_len_1_inst__0
       (.I0(new_pkt_len_1[3]),
        .O(new_pkt_len[3]));
  LUT1 #(
    .INIT(2'h2)) 
    new_pkt_len_1_inst__1
       (.I0(new_pkt_len_1[2]),
        .O(new_pkt_len[2]));
  LUT1 #(
    .INIT(2'h2)) 
    new_pkt_len_1_inst__2
       (.I0(new_pkt_len_1[1]),
        .O(new_pkt_len[1]));
  LUT1 #(
    .INIT(2'h2)) 
    new_pkt_len_1_inst__3
       (.I0(new_pkt_len_1[0]),
        .O(new_pkt_len[0]));
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_pkt_len_counter[0]_i_1 
       (.I0(reg_pkt_len_counter[0]),
        .I1(cur_state_i_2_n_0),
        .I2(new_pkt_len[0]),
        .O(\reg_pkt_len_counter[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_pkt_len_counter[10]_i_1 
       (.I0(pkt_len_counter[10]),
        .I1(cur_state_i_2_n_0),
        .I2(new_pkt_len[10]),
        .O(\reg_pkt_len_counter[10]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hE2)) 
    \reg_pkt_len_counter[11]_i_1 
       (.I0(new_pkt_len[11]),
        .I1(cur_state_i_2_n_0),
        .I2(pkt_len_counter[11]),
        .O(\reg_pkt_len_counter[11]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hE2)) 
    \reg_pkt_len_counter[1]_i_1 
       (.I0(new_pkt_len[1]),
        .I1(cur_state_i_2_n_0),
        .I2(pkt_len_counter[1]),
        .O(\reg_pkt_len_counter[1]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_pkt_len_counter[2]_i_1 
       (.I0(pkt_len_counter[2]),
        .I1(cur_state_i_2_n_0),
        .I2(new_pkt_len[2]),
        .O(\reg_pkt_len_counter[2]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_pkt_len_counter[3]_i_1 
       (.I0(pkt_len_counter[3]),
        .I1(cur_state_i_2_n_0),
        .I2(new_pkt_len[3]),
        .O(\reg_pkt_len_counter[3]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_pkt_len_counter[4]_i_1 
       (.I0(pkt_len_counter[4]),
        .I1(cur_state_i_2_n_0),
        .I2(new_pkt_len[4]),
        .O(\reg_pkt_len_counter[4]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_pkt_len_counter[5]_i_1 
       (.I0(pkt_len_counter[5]),
        .I1(cur_state_i_2_n_0),
        .I2(new_pkt_len[5]),
        .O(\reg_pkt_len_counter[5]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_pkt_len_counter[6]_i_1 
       (.I0(pkt_len_counter[6]),
        .I1(cur_state_i_2_n_0),
        .I2(new_pkt_len[6]),
        .O(\reg_pkt_len_counter[6]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_pkt_len_counter[7]_i_1 
       (.I0(pkt_len_counter[7]),
        .I1(cur_state_i_2_n_0),
        .I2(new_pkt_len[7]),
        .O(\reg_pkt_len_counter[7]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_pkt_len_counter[8]_i_1 
       (.I0(pkt_len_counter[8]),
        .I1(cur_state_i_2_n_0),
        .I2(new_pkt_len[8]),
        .O(\reg_pkt_len_counter[8]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \reg_pkt_len_counter[9]_i_1 
       (.I0(pkt_len_counter[9]),
        .I1(cur_state_i_2_n_0),
        .I2(new_pkt_len[9]),
        .O(\reg_pkt_len_counter[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \reg_pkt_len_counter_reg[0] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(\reg_pkt_len_counter[0]_i_1_n_0 ),
        .Q(reg_pkt_len_counter[0]),
        .R(cur_state_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    \reg_pkt_len_counter_reg[10] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(\reg_pkt_len_counter[10]_i_1_n_0 ),
        .Q(reg_pkt_len_counter[10]),
        .R(cur_state_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    \reg_pkt_len_counter_reg[11] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(\reg_pkt_len_counter[11]_i_1_n_0 ),
        .Q(reg_pkt_len_counter[11]),
        .R(cur_state_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    \reg_pkt_len_counter_reg[1] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(\reg_pkt_len_counter[1]_i_1_n_0 ),
        .Q(reg_pkt_len_counter[1]),
        .R(cur_state_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    \reg_pkt_len_counter_reg[2] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(\reg_pkt_len_counter[2]_i_1_n_0 ),
        .Q(reg_pkt_len_counter[2]),
        .R(cur_state_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    \reg_pkt_len_counter_reg[3] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(\reg_pkt_len_counter[3]_i_1_n_0 ),
        .Q(reg_pkt_len_counter[3]),
        .R(cur_state_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    \reg_pkt_len_counter_reg[4] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(\reg_pkt_len_counter[4]_i_1_n_0 ),
        .Q(reg_pkt_len_counter[4]),
        .R(cur_state_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    \reg_pkt_len_counter_reg[5] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(\reg_pkt_len_counter[5]_i_1_n_0 ),
        .Q(reg_pkt_len_counter[5]),
        .R(cur_state_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    \reg_pkt_len_counter_reg[6] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(\reg_pkt_len_counter[6]_i_1_n_0 ),
        .Q(reg_pkt_len_counter[6]),
        .R(cur_state_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    \reg_pkt_len_counter_reg[7] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(\reg_pkt_len_counter[7]_i_1_n_0 ),
        .Q(reg_pkt_len_counter[7]),
        .R(cur_state_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    \reg_pkt_len_counter_reg[8] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(\reg_pkt_len_counter[8]_i_1_n_0 ),
        .Q(reg_pkt_len_counter[8]),
        .R(cur_state_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    \reg_pkt_len_counter_reg[9] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(\reg_pkt_len_counter[9]_i_1_n_0 ),
        .Q(reg_pkt_len_counter[9]),
        .R(cur_state_reg_0));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    \reg_tkeep[7]_i_2 
       (.I0(\reg_pkt_len_counter[9]_i_1_n_0 ),
        .I1(\reg_tkeep[7]_i_4_n_0 ),
        .I2(\reg_tkeep[7]_i_5_n_0 ),
        .I3(\reg_tkeep[7]_i_6_n_0 ),
        .I4(\reg_pkt_len_counter[4]_i_1_n_0 ),
        .I5(\reg_tkeep[7]_i_7_n_0 ),
        .O(\reg_tkeep[7]_i_7_0 ));
  LUT3 #(
    .INIT(8'h47)) 
    \reg_tkeep[7]_i_3 
       (.I0(pkt_len_counter[1]),
        .I1(cur_state_i_2_n_0),
        .I2(new_pkt_len[1]),
        .O(\reg_pkt_len_counter_reg[3]_0 ));
  LUT5 #(
    .INIT(32'hFFFACCFA)) 
    \reg_tkeep[7]_i_4 
       (.I0(new_pkt_len[7]),
        .I1(pkt_len_counter[7]),
        .I2(new_pkt_len[8]),
        .I3(cur_state_i_2_n_0),
        .I4(pkt_len_counter[8]),
        .O(\reg_tkeep[7]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h00053305)) 
    \reg_tkeep[7]_i_5 
       (.I0(new_pkt_len[11]),
        .I1(pkt_len_counter[11]),
        .I2(new_pkt_len[10]),
        .I3(cur_state_i_2_n_0),
        .I4(pkt_len_counter[10]),
        .O(\reg_tkeep[7]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFFFACCFA)) 
    \reg_tkeep[7]_i_6 
       (.I0(new_pkt_len[6]),
        .I1(pkt_len_counter[6]),
        .I2(new_pkt_len[5]),
        .I3(cur_state_i_2_n_0),
        .I4(pkt_len_counter[5]),
        .O(\reg_tkeep[7]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hFFFACCFA)) 
    \reg_tkeep[7]_i_7 
       (.I0(new_pkt_len[3]),
        .I1(pkt_len_counter[3]),
        .I2(new_pkt_len[2]),
        .I3(cur_state_i_2_n_0),
        .I4(pkt_len_counter[2]),
        .O(\reg_tkeep[7]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h8888888800088808)) 
    reg_tlast_i_2
       (.I0(null_mux_sel),
        .I1(\reg_tkeep[7]_i_7_0 ),
        .I2(new_pkt_len[0]),
        .I3(cur_state_i_2_n_0),
        .I4(reg_pkt_len_counter[0]),
        .I5(\reg_pkt_len_counter_reg[3]_0 ),
        .O(null_mux_sel_reg));
endmodule

module pcie_7x_0_axi_basic_rx_pipeline
   (trn_rsrc_dsc_d,
    E,
    m_axis_rx_tvalid_xhdl2_reg_0,
    m_axis_rx_tlast,
    null_mux_sel,
    trn_in_packet,
    reg_dsc_detect_reg_0,
    pcie_block_i,
    m_axis_rx_tdata,
    m_axis_rx_tkeep,
    m_axis_rx_tuser,
    in0,
    \m_axis_rx_tdata_xhdl0_reg[30]_0 ,
    \trn_rbar_hit_prev_reg[0]_0 ,
    pipe_userclk2_in,
    trn_rsrc_dsc,
    rsrc_rdy_filtered6_out,
    trn_rrem,
    trn_reof,
    trn_rsrc_dsc_prev0,
    trn_rsof,
    trn_recrc_err,
    trn_rerrfwd,
    trn_in_packet_reg_0,
    m_axis_rx_tready,
    dsc_detect,
    null_mux_sel_reg_0,
    \reg_tkeep_reg[7]_0 ,
    \reg_tkeep_reg[7]_1 ,
    trn_rd,
    trn_rbar_hit,
    D,
    \m_axis_rx_tuser_xhdl1_reg[21]_0 );
  output trn_rsrc_dsc_d;
  output [0:0]E;
  output m_axis_rx_tvalid_xhdl2_reg_0;
  output m_axis_rx_tlast;
  output null_mux_sel;
  output trn_in_packet;
  output reg_dsc_detect_reg_0;
  output pcie_block_i;
  output [63:0]m_axis_rx_tdata;
  output [1:0]m_axis_rx_tkeep;
  output [12:0]m_axis_rx_tuser;
  output [4:0]in0;
  output [4:0]\m_axis_rx_tdata_xhdl0_reg[30]_0 ;
  input \trn_rbar_hit_prev_reg[0]_0 ;
  input pipe_userclk2_in;
  input trn_rsrc_dsc;
  input rsrc_rdy_filtered6_out;
  input [0:0]trn_rrem;
  input trn_reof;
  input trn_rsrc_dsc_prev0;
  input trn_rsof;
  input trn_recrc_err;
  input trn_rerrfwd;
  input trn_in_packet_reg_0;
  input m_axis_rx_tready;
  input dsc_detect;
  input null_mux_sel_reg_0;
  input \reg_tkeep_reg[7]_0 ;
  input \reg_tkeep_reg[7]_1 ;
  input [63:0]trn_rd;
  input [6:0]trn_rbar_hit;
  input [0:0]D;
  input \m_axis_rx_tuser_xhdl1_reg[21]_0 ;

  wire [0:0]D;
  wire [0:0]E;
  wire data_hold;
  wire data_prev;
  wire dsc_detect;
  wire [4:0]in0;
  wire [4:2]is_eof_prev;
  wire [63:0]m_axis_rx_tdata;
  wire \m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ;
  wire [4:0]\m_axis_rx_tdata_xhdl0_reg[30]_0 ;
  wire [1:0]m_axis_rx_tkeep;
  wire m_axis_rx_tlast;
  wire m_axis_rx_tready;
  wire [12:0]m_axis_rx_tuser;
  wire [18:0]m_axis_rx_tuser_xhdl1;
  wire \m_axis_rx_tuser_xhdl1[14]_i_2_n_0 ;
  wire \m_axis_rx_tuser_xhdl1[19]_i_1_n_0 ;
  wire \m_axis_rx_tuser_xhdl1[21]_i_1_n_0 ;
  wire \m_axis_rx_tuser_xhdl1[21]_i_2_n_0 ;
  wire \m_axis_rx_tuser_xhdl1_reg[21]_0 ;
  wire m_axis_rx_tvalid_xhdl2_i_1_n_0;
  wire m_axis_rx_tvalid_xhdl2_reg_0;
  wire new_pkt_len_1_inferred_i_6_n_0;
  wire null_mux_sel;
  wire null_mux_sel_i_1_n_0;
  wire null_mux_sel_i_2_n_0;
  wire null_mux_sel_reg_0;
  wire [63:0]p_1_in;
  wire pcie_block_i;
  wire pipe_userclk2_in;
  wire reg_dsc_detect_i_1_n_0;
  wire reg_dsc_detect_reg_0;
  wire \reg_tkeep[7]_i_1_n_0 ;
  wire \reg_tkeep_reg[7]_0 ;
  wire \reg_tkeep_reg[7]_1 ;
  wire reg_tlast_i_1_n_0;
  wire rsrc_rdy_filtered6_out;
  wire trn_in_packet;
  wire trn_in_packet_reg_0;
  wire [6:0]trn_rbar_hit;
  wire [6:0]trn_rbar_hit_prev;
  wire \trn_rbar_hit_prev_reg[0]_0 ;
  wire [63:0]trn_rd;
  wire [63:0]trn_rd_prev;
  wire trn_rdst_rdy_xhdl4_i_1_n_0;
  wire trn_recrc_err;
  wire trn_recrc_err_prev;
  wire trn_reof;
  wire trn_rerrfwd;
  wire trn_rerrfwd_prev;
  wire [0:0]trn_rrem;
  wire trn_rsof;
  wire trn_rsof_prev;
  wire trn_rsrc_dsc;
  wire trn_rsrc_dsc_d;
  wire trn_rsrc_dsc_prev;
  wire trn_rsrc_dsc_prev0;
  wire trn_rsrc_rdy_prev;

  LUT2 #(
    .INIT(4'h2)) 
    data_prev_i_1
       (.I0(m_axis_rx_tvalid_xhdl2_reg_0),
        .I1(m_axis_rx_tready),
        .O(data_hold));
  FDRE #(
    .INIT(1'b0)) 
    data_prev_reg
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(data_hold),
        .Q(data_prev),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[0]_i_1 
       (.I0(trn_rd_prev[0]),
        .I1(data_prev),
        .I2(trn_rd[32]),
        .O(p_1_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[10]_i_1 
       (.I0(trn_rd_prev[10]),
        .I1(data_prev),
        .I2(trn_rd[42]),
        .O(p_1_in[10]));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[11]_i_1 
       (.I0(trn_rd_prev[11]),
        .I1(data_prev),
        .I2(trn_rd[43]),
        .O(p_1_in[11]));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[12]_i_1 
       (.I0(trn_rd_prev[12]),
        .I1(data_prev),
        .I2(trn_rd[44]),
        .O(p_1_in[12]));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[13]_i_1 
       (.I0(trn_rd_prev[13]),
        .I1(data_prev),
        .I2(trn_rd[45]),
        .O(p_1_in[13]));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[14]_i_1 
       (.I0(trn_rd_prev[14]),
        .I1(data_prev),
        .I2(trn_rd[46]),
        .O(p_1_in[14]));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[15]_i_1 
       (.I0(trn_rd_prev[15]),
        .I1(data_prev),
        .I2(trn_rd[47]),
        .O(p_1_in[15]));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[16]_i_1 
       (.I0(trn_rd_prev[16]),
        .I1(data_prev),
        .I2(trn_rd[48]),
        .O(p_1_in[16]));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[17]_i_1 
       (.I0(trn_rd_prev[17]),
        .I1(data_prev),
        .I2(trn_rd[49]),
        .O(p_1_in[17]));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[18]_i_1 
       (.I0(trn_rd_prev[18]),
        .I1(data_prev),
        .I2(trn_rd[50]),
        .O(p_1_in[18]));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[19]_i_1 
       (.I0(trn_rd_prev[19]),
        .I1(data_prev),
        .I2(trn_rd[51]),
        .O(p_1_in[19]));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[1]_i_1 
       (.I0(trn_rd_prev[1]),
        .I1(data_prev),
        .I2(trn_rd[33]),
        .O(p_1_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[20]_i_1 
       (.I0(trn_rd_prev[20]),
        .I1(data_prev),
        .I2(trn_rd[52]),
        .O(p_1_in[20]));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[21]_i_1 
       (.I0(trn_rd_prev[21]),
        .I1(data_prev),
        .I2(trn_rd[53]),
        .O(p_1_in[21]));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[22]_i_1 
       (.I0(trn_rd_prev[22]),
        .I1(data_prev),
        .I2(trn_rd[54]),
        .O(p_1_in[22]));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[23]_i_1 
       (.I0(trn_rd_prev[23]),
        .I1(data_prev),
        .I2(trn_rd[55]),
        .O(p_1_in[23]));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[24]_i_1 
       (.I0(trn_rd_prev[24]),
        .I1(data_prev),
        .I2(trn_rd[56]),
        .O(p_1_in[24]));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[25]_i_1 
       (.I0(trn_rd_prev[25]),
        .I1(data_prev),
        .I2(trn_rd[57]),
        .O(p_1_in[25]));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[26]_i_1 
       (.I0(trn_rd_prev[26]),
        .I1(data_prev),
        .I2(trn_rd[58]),
        .O(p_1_in[26]));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[27]_i_1 
       (.I0(trn_rd_prev[27]),
        .I1(data_prev),
        .I2(trn_rd[59]),
        .O(p_1_in[27]));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[28]_i_1 
       (.I0(trn_rd_prev[28]),
        .I1(data_prev),
        .I2(trn_rd[60]),
        .O(p_1_in[28]));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[29]_i_1 
       (.I0(trn_rd_prev[29]),
        .I1(data_prev),
        .I2(trn_rd[61]),
        .O(p_1_in[29]));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[2]_i_1 
       (.I0(trn_rd_prev[2]),
        .I1(data_prev),
        .I2(trn_rd[34]),
        .O(p_1_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[30]_i_1 
       (.I0(trn_rd_prev[30]),
        .I1(data_prev),
        .I2(trn_rd[62]),
        .O(p_1_in[30]));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[31]_i_1 
       (.I0(trn_rd_prev[31]),
        .I1(data_prev),
        .I2(trn_rd[63]),
        .O(p_1_in[31]));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[32]_i_1 
       (.I0(trn_rd_prev[32]),
        .I1(data_prev),
        .I2(trn_rd[0]),
        .O(p_1_in[32]));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[33]_i_1 
       (.I0(trn_rd_prev[33]),
        .I1(data_prev),
        .I2(trn_rd[1]),
        .O(p_1_in[33]));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[34]_i_1 
       (.I0(trn_rd_prev[34]),
        .I1(data_prev),
        .I2(trn_rd[2]),
        .O(p_1_in[34]));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[35]_i_1 
       (.I0(trn_rd_prev[35]),
        .I1(data_prev),
        .I2(trn_rd[3]),
        .O(p_1_in[35]));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[36]_i_1 
       (.I0(trn_rd_prev[36]),
        .I1(data_prev),
        .I2(trn_rd[4]),
        .O(p_1_in[36]));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[37]_i_1 
       (.I0(trn_rd_prev[37]),
        .I1(data_prev),
        .I2(trn_rd[5]),
        .O(p_1_in[37]));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[38]_i_1 
       (.I0(trn_rd_prev[38]),
        .I1(data_prev),
        .I2(trn_rd[6]),
        .O(p_1_in[38]));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[39]_i_1 
       (.I0(trn_rd_prev[39]),
        .I1(data_prev),
        .I2(trn_rd[7]),
        .O(p_1_in[39]));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[3]_i_1 
       (.I0(trn_rd_prev[3]),
        .I1(data_prev),
        .I2(trn_rd[35]),
        .O(p_1_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[40]_i_1 
       (.I0(trn_rd_prev[40]),
        .I1(data_prev),
        .I2(trn_rd[8]),
        .O(p_1_in[40]));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[41]_i_1 
       (.I0(trn_rd_prev[41]),
        .I1(data_prev),
        .I2(trn_rd[9]),
        .O(p_1_in[41]));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[42]_i_1 
       (.I0(trn_rd_prev[42]),
        .I1(data_prev),
        .I2(trn_rd[10]),
        .O(p_1_in[42]));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[43]_i_1 
       (.I0(trn_rd_prev[43]),
        .I1(data_prev),
        .I2(trn_rd[11]),
        .O(p_1_in[43]));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[44]_i_1 
       (.I0(trn_rd_prev[44]),
        .I1(data_prev),
        .I2(trn_rd[12]),
        .O(p_1_in[44]));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[45]_i_1 
       (.I0(trn_rd_prev[45]),
        .I1(data_prev),
        .I2(trn_rd[13]),
        .O(p_1_in[45]));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[46]_i_1 
       (.I0(trn_rd_prev[46]),
        .I1(data_prev),
        .I2(trn_rd[14]),
        .O(p_1_in[46]));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[47]_i_1 
       (.I0(trn_rd_prev[47]),
        .I1(data_prev),
        .I2(trn_rd[15]),
        .O(p_1_in[47]));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[48]_i_1 
       (.I0(trn_rd_prev[48]),
        .I1(data_prev),
        .I2(trn_rd[16]),
        .O(p_1_in[48]));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[49]_i_1 
       (.I0(trn_rd_prev[49]),
        .I1(data_prev),
        .I2(trn_rd[17]),
        .O(p_1_in[49]));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[4]_i_1 
       (.I0(trn_rd_prev[4]),
        .I1(data_prev),
        .I2(trn_rd[36]),
        .O(p_1_in[4]));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[50]_i_1 
       (.I0(trn_rd_prev[50]),
        .I1(data_prev),
        .I2(trn_rd[18]),
        .O(p_1_in[50]));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[51]_i_1 
       (.I0(trn_rd_prev[51]),
        .I1(data_prev),
        .I2(trn_rd[19]),
        .O(p_1_in[51]));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[52]_i_1 
       (.I0(trn_rd_prev[52]),
        .I1(data_prev),
        .I2(trn_rd[20]),
        .O(p_1_in[52]));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[53]_i_1 
       (.I0(trn_rd_prev[53]),
        .I1(data_prev),
        .I2(trn_rd[21]),
        .O(p_1_in[53]));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[54]_i_1 
       (.I0(trn_rd_prev[54]),
        .I1(data_prev),
        .I2(trn_rd[22]),
        .O(p_1_in[54]));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[55]_i_1 
       (.I0(trn_rd_prev[55]),
        .I1(data_prev),
        .I2(trn_rd[23]),
        .O(p_1_in[55]));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[56]_i_1 
       (.I0(trn_rd_prev[56]),
        .I1(data_prev),
        .I2(trn_rd[24]),
        .O(p_1_in[56]));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[57]_i_1 
       (.I0(trn_rd_prev[57]),
        .I1(data_prev),
        .I2(trn_rd[25]),
        .O(p_1_in[57]));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[58]_i_1 
       (.I0(trn_rd_prev[58]),
        .I1(data_prev),
        .I2(trn_rd[26]),
        .O(p_1_in[58]));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[59]_i_1 
       (.I0(trn_rd_prev[59]),
        .I1(data_prev),
        .I2(trn_rd[27]),
        .O(p_1_in[59]));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[5]_i_1 
       (.I0(trn_rd_prev[5]),
        .I1(data_prev),
        .I2(trn_rd[37]),
        .O(p_1_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[60]_i_1 
       (.I0(trn_rd_prev[60]),
        .I1(data_prev),
        .I2(trn_rd[28]),
        .O(p_1_in[60]));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[61]_i_1 
       (.I0(trn_rd_prev[61]),
        .I1(data_prev),
        .I2(trn_rd[29]),
        .O(p_1_in[61]));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[62]_i_1 
       (.I0(trn_rd_prev[62]),
        .I1(data_prev),
        .I2(trn_rd[30]),
        .O(p_1_in[62]));
  LUT2 #(
    .INIT(4'hB)) 
    \m_axis_rx_tdata_xhdl0[63]_i_1 
       (.I0(m_axis_rx_tready),
        .I1(m_axis_rx_tvalid_xhdl2_reg_0),
        .O(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[63]_i_2 
       (.I0(trn_rd_prev[63]),
        .I1(data_prev),
        .I2(trn_rd[31]),
        .O(p_1_in[63]));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[6]_i_1 
       (.I0(trn_rd_prev[6]),
        .I1(data_prev),
        .I2(trn_rd[38]),
        .O(p_1_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[7]_i_1 
       (.I0(trn_rd_prev[7]),
        .I1(data_prev),
        .I2(trn_rd[39]),
        .O(p_1_in[7]));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[8]_i_1 
       (.I0(trn_rd_prev[8]),
        .I1(data_prev),
        .I2(trn_rd[40]),
        .O(p_1_in[8]));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tdata_xhdl0[9]_i_1 
       (.I0(trn_rd_prev[9]),
        .I1(data_prev),
        .I2(trn_rd[41]),
        .O(p_1_in[9]));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[0] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[0]),
        .Q(m_axis_rx_tdata[0]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[10] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[10]),
        .Q(m_axis_rx_tdata[10]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[11] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[11]),
        .Q(m_axis_rx_tdata[11]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[12] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[12]),
        .Q(m_axis_rx_tdata[12]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[13] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[13]),
        .Q(m_axis_rx_tdata[13]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[14] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[14]),
        .Q(m_axis_rx_tdata[14]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[15] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[15]),
        .Q(m_axis_rx_tdata[15]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[16] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[16]),
        .Q(m_axis_rx_tdata[16]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[17] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[17]),
        .Q(m_axis_rx_tdata[17]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[18] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[18]),
        .Q(m_axis_rx_tdata[18]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[19] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[19]),
        .Q(m_axis_rx_tdata[19]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[1] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[1]),
        .Q(m_axis_rx_tdata[1]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[20] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[20]),
        .Q(m_axis_rx_tdata[20]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[21] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[21]),
        .Q(m_axis_rx_tdata[21]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[22] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[22]),
        .Q(m_axis_rx_tdata[22]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[23] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[23]),
        .Q(m_axis_rx_tdata[23]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[24] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[24]),
        .Q(m_axis_rx_tdata[24]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[25] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[25]),
        .Q(m_axis_rx_tdata[25]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[26] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[26]),
        .Q(m_axis_rx_tdata[26]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[27] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[27]),
        .Q(m_axis_rx_tdata[27]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[28] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[28]),
        .Q(m_axis_rx_tdata[28]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[29] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[29]),
        .Q(m_axis_rx_tdata[29]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[2] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[2]),
        .Q(m_axis_rx_tdata[2]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[30] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[30]),
        .Q(m_axis_rx_tdata[30]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[31] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[31]),
        .Q(m_axis_rx_tdata[31]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[32] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[32]),
        .Q(m_axis_rx_tdata[32]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[33] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[33]),
        .Q(m_axis_rx_tdata[33]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[34] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[34]),
        .Q(m_axis_rx_tdata[34]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[35] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[35]),
        .Q(m_axis_rx_tdata[35]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[36] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[36]),
        .Q(m_axis_rx_tdata[36]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[37] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[37]),
        .Q(m_axis_rx_tdata[37]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[38] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[38]),
        .Q(m_axis_rx_tdata[38]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[39] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[39]),
        .Q(m_axis_rx_tdata[39]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[3] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[3]),
        .Q(m_axis_rx_tdata[3]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[40] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[40]),
        .Q(m_axis_rx_tdata[40]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[41] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[41]),
        .Q(m_axis_rx_tdata[41]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[42] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[42]),
        .Q(m_axis_rx_tdata[42]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[43] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[43]),
        .Q(m_axis_rx_tdata[43]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[44] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[44]),
        .Q(m_axis_rx_tdata[44]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[45] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[45]),
        .Q(m_axis_rx_tdata[45]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[46] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[46]),
        .Q(m_axis_rx_tdata[46]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[47] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[47]),
        .Q(m_axis_rx_tdata[47]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[48] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[48]),
        .Q(m_axis_rx_tdata[48]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[49] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[49]),
        .Q(m_axis_rx_tdata[49]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[4] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[4]),
        .Q(m_axis_rx_tdata[4]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[50] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[50]),
        .Q(m_axis_rx_tdata[50]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[51] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[51]),
        .Q(m_axis_rx_tdata[51]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[52] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[52]),
        .Q(m_axis_rx_tdata[52]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[53] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[53]),
        .Q(m_axis_rx_tdata[53]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[54] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[54]),
        .Q(m_axis_rx_tdata[54]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[55] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[55]),
        .Q(m_axis_rx_tdata[55]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[56] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[56]),
        .Q(m_axis_rx_tdata[56]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[57] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[57]),
        .Q(m_axis_rx_tdata[57]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[58] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[58]),
        .Q(m_axis_rx_tdata[58]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[59] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[59]),
        .Q(m_axis_rx_tdata[59]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[5] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[5]),
        .Q(m_axis_rx_tdata[5]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[60] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[60]),
        .Q(m_axis_rx_tdata[60]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[61] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[61]),
        .Q(m_axis_rx_tdata[61]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[62] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[62]),
        .Q(m_axis_rx_tdata[62]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[63] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[63]),
        .Q(m_axis_rx_tdata[63]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[6] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[6]),
        .Q(m_axis_rx_tdata[6]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[7] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[7]),
        .Q(m_axis_rx_tdata[7]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[8] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[8]),
        .Q(m_axis_rx_tdata[8]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tdata_xhdl0_reg[9] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(p_1_in[9]),
        .Q(m_axis_rx_tdata[9]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  LUT5 #(
    .INIT(32'h000000B8)) 
    \m_axis_rx_tuser_xhdl1[0]_i_1 
       (.I0(trn_recrc_err_prev),
        .I1(data_prev),
        .I2(trn_recrc_err),
        .I3(\trn_rbar_hit_prev_reg[0]_0 ),
        .I4(null_mux_sel),
        .O(m_axis_rx_tuser_xhdl1[0]));
  LUT6 #(
    .INIT(64'h0000000004F40404)) 
    \m_axis_rx_tuser_xhdl1[14]_i_1 
       (.I0(trn_rsrc_dsc),
        .I1(trn_rsof),
        .I2(data_prev),
        .I3(trn_rsrc_dsc_prev),
        .I4(trn_rsof_prev),
        .I5(\m_axis_rx_tuser_xhdl1[14]_i_2_n_0 ),
        .O(m_axis_rx_tuser_xhdl1[14]));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \m_axis_rx_tuser_xhdl1[14]_i_2 
       (.I0(\trn_rbar_hit_prev_reg[0]_0 ),
        .I1(null_mux_sel),
        .O(\m_axis_rx_tuser_xhdl1[14]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \m_axis_rx_tuser_xhdl1[18]_i_1 
       (.I0(\trn_rbar_hit_prev_reg[0]_0 ),
        .O(m_axis_rx_tuser_xhdl1[18]));
  LUT3 #(
    .INIT(8'hEF)) 
    \m_axis_rx_tuser_xhdl1[19]_i_1 
       (.I0(\trn_rbar_hit_prev_reg[0]_0 ),
        .I1(m_axis_rx_tready),
        .I2(m_axis_rx_tvalid_xhdl2_reg_0),
        .O(\m_axis_rx_tuser_xhdl1[19]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \m_axis_rx_tuser_xhdl1[19]_i_3 
       (.I0(trn_rrem),
        .I1(data_prev),
        .I2(is_eof_prev[2]),
        .I3(null_mux_sel),
        .O(pcie_block_i));
  LUT5 #(
    .INIT(32'h000000E2)) 
    \m_axis_rx_tuser_xhdl1[1]_i_1 
       (.I0(trn_rerrfwd),
        .I1(data_prev),
        .I2(trn_rerrfwd_prev),
        .I3(\trn_rbar_hit_prev_reg[0]_0 ),
        .I4(null_mux_sel),
        .O(m_axis_rx_tuser_xhdl1[1]));
  LUT6 #(
    .INIT(64'h0000AAAAFC0CAAAA)) 
    \m_axis_rx_tuser_xhdl1[21]_i_1 
       (.I0(m_axis_rx_tuser[12]),
        .I1(\m_axis_rx_tuser_xhdl1[21]_i_2_n_0 ),
        .I2(null_mux_sel),
        .I3(\m_axis_rx_tuser_xhdl1_reg[21]_0 ),
        .I4(\m_axis_rx_tuser_xhdl1[19]_i_1_n_0 ),
        .I5(\trn_rbar_hit_prev_reg[0]_0 ),
        .O(\m_axis_rx_tuser_xhdl1[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_rx_tuser_xhdl1[21]_i_2 
       (.I0(is_eof_prev[4]),
        .I1(data_prev),
        .I2(trn_reof),
        .O(\m_axis_rx_tuser_xhdl1[21]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT5 #(
    .INIT(32'h000000B8)) 
    \m_axis_rx_tuser_xhdl1[2]_i_1 
       (.I0(trn_rbar_hit_prev[0]),
        .I1(data_prev),
        .I2(trn_rbar_hit[0]),
        .I3(\trn_rbar_hit_prev_reg[0]_0 ),
        .I4(null_mux_sel),
        .O(m_axis_rx_tuser_xhdl1[2]));
  LUT5 #(
    .INIT(32'h000000B8)) 
    \m_axis_rx_tuser_xhdl1[3]_i_1 
       (.I0(trn_rbar_hit_prev[1]),
        .I1(data_prev),
        .I2(trn_rbar_hit[1]),
        .I3(\trn_rbar_hit_prev_reg[0]_0 ),
        .I4(null_mux_sel),
        .O(m_axis_rx_tuser_xhdl1[3]));
  LUT5 #(
    .INIT(32'h000000B8)) 
    \m_axis_rx_tuser_xhdl1[4]_i_1 
       (.I0(trn_rbar_hit_prev[2]),
        .I1(data_prev),
        .I2(trn_rbar_hit[2]),
        .I3(\trn_rbar_hit_prev_reg[0]_0 ),
        .I4(null_mux_sel),
        .O(m_axis_rx_tuser_xhdl1[4]));
  LUT5 #(
    .INIT(32'h000000B8)) 
    \m_axis_rx_tuser_xhdl1[5]_i_1 
       (.I0(trn_rbar_hit_prev[3]),
        .I1(data_prev),
        .I2(trn_rbar_hit[3]),
        .I3(\trn_rbar_hit_prev_reg[0]_0 ),
        .I4(null_mux_sel),
        .O(m_axis_rx_tuser_xhdl1[5]));
  LUT5 #(
    .INIT(32'h000000E2)) 
    \m_axis_rx_tuser_xhdl1[6]_i_1 
       (.I0(trn_rbar_hit[4]),
        .I1(data_prev),
        .I2(trn_rbar_hit_prev[4]),
        .I3(\trn_rbar_hit_prev_reg[0]_0 ),
        .I4(null_mux_sel),
        .O(m_axis_rx_tuser_xhdl1[6]));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT5 #(
    .INIT(32'h000000B8)) 
    \m_axis_rx_tuser_xhdl1[7]_i_1 
       (.I0(trn_rbar_hit_prev[5]),
        .I1(data_prev),
        .I2(trn_rbar_hit[5]),
        .I3(\trn_rbar_hit_prev_reg[0]_0 ),
        .I4(null_mux_sel),
        .O(m_axis_rx_tuser_xhdl1[7]));
  LUT5 #(
    .INIT(32'h000000B8)) 
    \m_axis_rx_tuser_xhdl1[8]_i_1 
       (.I0(trn_rbar_hit_prev[6]),
        .I1(data_prev),
        .I2(trn_rbar_hit[6]),
        .I3(\trn_rbar_hit_prev_reg[0]_0 ),
        .I4(null_mux_sel),
        .O(m_axis_rx_tuser_xhdl1[8]));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tuser_xhdl1_reg[0] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tuser_xhdl1[19]_i_1_n_0 ),
        .D(m_axis_rx_tuser_xhdl1[0]),
        .Q(m_axis_rx_tuser[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tuser_xhdl1_reg[14] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tuser_xhdl1[19]_i_1_n_0 ),
        .D(m_axis_rx_tuser_xhdl1[14]),
        .Q(m_axis_rx_tuser[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tuser_xhdl1_reg[18] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tuser_xhdl1[19]_i_1_n_0 ),
        .D(m_axis_rx_tuser_xhdl1[18]),
        .Q(m_axis_rx_tuser[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tuser_xhdl1_reg[19] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tuser_xhdl1[19]_i_1_n_0 ),
        .D(D),
        .Q(m_axis_rx_tuser[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tuser_xhdl1_reg[1] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tuser_xhdl1[19]_i_1_n_0 ),
        .D(m_axis_rx_tuser_xhdl1[1]),
        .Q(m_axis_rx_tuser[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tuser_xhdl1_reg[21] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(\m_axis_rx_tuser_xhdl1[21]_i_1_n_0 ),
        .Q(m_axis_rx_tuser[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tuser_xhdl1_reg[2] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tuser_xhdl1[19]_i_1_n_0 ),
        .D(m_axis_rx_tuser_xhdl1[2]),
        .Q(m_axis_rx_tuser[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tuser_xhdl1_reg[3] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tuser_xhdl1[19]_i_1_n_0 ),
        .D(m_axis_rx_tuser_xhdl1[3]),
        .Q(m_axis_rx_tuser[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tuser_xhdl1_reg[4] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tuser_xhdl1[19]_i_1_n_0 ),
        .D(m_axis_rx_tuser_xhdl1[4]),
        .Q(m_axis_rx_tuser[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tuser_xhdl1_reg[5] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tuser_xhdl1[19]_i_1_n_0 ),
        .D(m_axis_rx_tuser_xhdl1[5]),
        .Q(m_axis_rx_tuser[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tuser_xhdl1_reg[6] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tuser_xhdl1[19]_i_1_n_0 ),
        .D(m_axis_rx_tuser_xhdl1[6]),
        .Q(m_axis_rx_tuser[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tuser_xhdl1_reg[7] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tuser_xhdl1[19]_i_1_n_0 ),
        .D(m_axis_rx_tuser_xhdl1[7]),
        .Q(m_axis_rx_tuser[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \m_axis_rx_tuser_xhdl1_reg[8] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tuser_xhdl1[19]_i_1_n_0 ),
        .D(m_axis_rx_tuser_xhdl1[8]),
        .Q(m_axis_rx_tuser[8]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFECE)) 
    m_axis_rx_tvalid_xhdl2_i_1
       (.I0(rsrc_rdy_filtered6_out),
        .I1(null_mux_sel),
        .I2(data_prev),
        .I3(trn_rsrc_rdy_prev),
        .I4(reg_dsc_detect_reg_0),
        .I5(dsc_detect),
        .O(m_axis_rx_tvalid_xhdl2_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    m_axis_rx_tvalid_xhdl2_reg
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(m_axis_rx_tvalid_xhdl2_i_1_n_0),
        .Q(m_axis_rx_tvalid_xhdl2_reg_0),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT4 #(
    .INIT(16'h7800)) 
    new_pkt_len_1_inferred_i_1
       (.I0(new_pkt_len_1_inferred_i_6_n_0),
        .I1(m_axis_rx_tdata[3]),
        .I2(m_axis_rx_tdata[4]),
        .I3(m_axis_rx_tdata[30]),
        .O(in0[4]));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    new_pkt_len_1_inferred_i_2
       (.I0(new_pkt_len_1_inferred_i_6_n_0),
        .I1(m_axis_rx_tdata[3]),
        .I2(m_axis_rx_tdata[30]),
        .O(in0[3]));
  LUT6 #(
    .INIT(64'h017FFE8000000000)) 
    new_pkt_len_1_inferred_i_3
       (.I0(m_axis_rx_tdata[0]),
        .I1(m_axis_rx_tdata[15]),
        .I2(m_axis_rx_tdata[29]),
        .I3(m_axis_rx_tdata[1]),
        .I4(m_axis_rx_tdata[2]),
        .I5(m_axis_rx_tdata[30]),
        .O(in0[2]));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT5 #(
    .INIT(32'hB73F3F48)) 
    new_pkt_len_1_inferred_i_4
       (.I0(m_axis_rx_tdata[0]),
        .I1(m_axis_rx_tdata[30]),
        .I2(m_axis_rx_tdata[1]),
        .I3(m_axis_rx_tdata[15]),
        .I4(m_axis_rx_tdata[29]),
        .O(in0[1]));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT4 #(
    .INIT(16'h6999)) 
    new_pkt_len_1_inferred_i_5
       (.I0(m_axis_rx_tdata[29]),
        .I1(m_axis_rx_tdata[15]),
        .I2(m_axis_rx_tdata[0]),
        .I3(m_axis_rx_tdata[30]),
        .O(in0[0]));
  LUT6 #(
    .INIT(64'hAAA8000080000000)) 
    new_pkt_len_1_inferred_i_6
       (.I0(m_axis_rx_tdata[2]),
        .I1(m_axis_rx_tdata[0]),
        .I2(m_axis_rx_tdata[15]),
        .I3(m_axis_rx_tdata[29]),
        .I4(m_axis_rx_tdata[30]),
        .I5(m_axis_rx_tdata[1]),
        .O(new_pkt_len_1_inferred_i_6_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    new_pkt_len_inferred_i_1
       (.I0(m_axis_rx_tdata[30]),
        .I1(m_axis_rx_tdata[9]),
        .O(\m_axis_rx_tdata_xhdl0_reg[30]_0 [4]));
  (* SOFT_HLUTNM = "soft_lutpair103" *) 
  LUT2 #(
    .INIT(4'h8)) 
    new_pkt_len_inferred_i_2
       (.I0(m_axis_rx_tdata[30]),
        .I1(m_axis_rx_tdata[8]),
        .O(\m_axis_rx_tdata_xhdl0_reg[30]_0 [3]));
  (* SOFT_HLUTNM = "soft_lutpair103" *) 
  LUT2 #(
    .INIT(4'h8)) 
    new_pkt_len_inferred_i_3
       (.I0(m_axis_rx_tdata[30]),
        .I1(m_axis_rx_tdata[7]),
        .O(\m_axis_rx_tdata_xhdl0_reg[30]_0 [2]));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
  LUT2 #(
    .INIT(4'h8)) 
    new_pkt_len_inferred_i_4
       (.I0(m_axis_rx_tdata[30]),
        .I1(m_axis_rx_tdata[6]),
        .O(\m_axis_rx_tdata_xhdl0_reg[30]_0 [1]));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
  LUT2 #(
    .INIT(4'h8)) 
    new_pkt_len_inferred_i_5
       (.I0(m_axis_rx_tdata[30]),
        .I1(m_axis_rx_tdata[5]),
        .O(\m_axis_rx_tdata_xhdl0_reg[30]_0 [0]));
  LUT6 #(
    .INIT(64'h0000000055FF1103)) 
    null_mux_sel_i_1
       (.I0(null_mux_sel_reg_0),
        .I1(null_mux_sel_i_2_n_0),
        .I2(m_axis_rx_tvalid_xhdl2_reg_0),
        .I3(m_axis_rx_tready),
        .I4(null_mux_sel),
        .I5(\trn_rbar_hit_prev_reg[0]_0 ),
        .O(null_mux_sel_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT2 #(
    .INIT(4'h1)) 
    null_mux_sel_i_2
       (.I0(reg_dsc_detect_reg_0),
        .I1(dsc_detect),
        .O(null_mux_sel_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    null_mux_sel_reg
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(null_mux_sel_i_1_n_0),
        .Q(null_mux_sel),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT3 #(
    .INIT(8'hDC)) 
    reg_dsc_detect_i_1
       (.I0(null_mux_sel),
        .I1(dsc_detect),
        .I2(reg_dsc_detect_reg_0),
        .O(reg_dsc_detect_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    reg_dsc_detect_reg
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(reg_dsc_detect_i_1_n_0),
        .Q(reg_dsc_detect_reg_0),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  LUT6 #(
    .INIT(64'h7F7F7F7070707F70)) 
    \reg_tkeep[7]_i_1 
       (.I0(\reg_tkeep_reg[7]_0 ),
        .I1(\reg_tkeep_reg[7]_1 ),
        .I2(null_mux_sel),
        .I3(trn_rrem),
        .I4(data_prev),
        .I5(is_eof_prev[2]),
        .O(\reg_tkeep[7]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \reg_tkeep_reg[3] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(1'b1),
        .Q(m_axis_rx_tkeep[0]),
        .S(\trn_rbar_hit_prev_reg[0]_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \reg_tkeep_reg[7] 
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(\reg_tkeep[7]_i_1_n_0 ),
        .Q(m_axis_rx_tkeep[1]),
        .S(\trn_rbar_hit_prev_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT5 #(
    .INIT(32'hBABBBAAA)) 
    reg_tlast_i_1
       (.I0(null_mux_sel_reg_0),
        .I1(null_mux_sel),
        .I2(is_eof_prev[4]),
        .I3(data_prev),
        .I4(trn_reof),
        .O(reg_tlast_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    reg_tlast_reg
       (.C(pipe_userclk2_in),
        .CE(\m_axis_rx_tdata_xhdl0[63]_i_1_n_0 ),
        .D(reg_tlast_i_1_n_0),
        .Q(m_axis_rx_tlast),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    trn_in_packet_reg
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(trn_in_packet_reg_0),
        .Q(trn_in_packet),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rbar_hit_prev_reg[0] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rbar_hit[0]),
        .Q(trn_rbar_hit_prev[0]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rbar_hit_prev_reg[1] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rbar_hit[1]),
        .Q(trn_rbar_hit_prev[1]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rbar_hit_prev_reg[2] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rbar_hit[2]),
        .Q(trn_rbar_hit_prev[2]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rbar_hit_prev_reg[3] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rbar_hit[3]),
        .Q(trn_rbar_hit_prev[3]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rbar_hit_prev_reg[4] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rbar_hit[4]),
        .Q(trn_rbar_hit_prev[4]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rbar_hit_prev_reg[5] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rbar_hit[5]),
        .Q(trn_rbar_hit_prev[5]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rbar_hit_prev_reg[6] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rbar_hit[6]),
        .Q(trn_rbar_hit_prev[6]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[0] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[32]),
        .Q(trn_rd_prev[0]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[10] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[42]),
        .Q(trn_rd_prev[10]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[11] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[43]),
        .Q(trn_rd_prev[11]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[12] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[44]),
        .Q(trn_rd_prev[12]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[13] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[45]),
        .Q(trn_rd_prev[13]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[14] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[46]),
        .Q(trn_rd_prev[14]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[15] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[47]),
        .Q(trn_rd_prev[15]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[16] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[48]),
        .Q(trn_rd_prev[16]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[17] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[49]),
        .Q(trn_rd_prev[17]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[18] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[50]),
        .Q(trn_rd_prev[18]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[19] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[51]),
        .Q(trn_rd_prev[19]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[1] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[33]),
        .Q(trn_rd_prev[1]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[20] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[52]),
        .Q(trn_rd_prev[20]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[21] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[53]),
        .Q(trn_rd_prev[21]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[22] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[54]),
        .Q(trn_rd_prev[22]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[23] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[55]),
        .Q(trn_rd_prev[23]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[24] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[56]),
        .Q(trn_rd_prev[24]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[25] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[57]),
        .Q(trn_rd_prev[25]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[26] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[58]),
        .Q(trn_rd_prev[26]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[27] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[59]),
        .Q(trn_rd_prev[27]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[28] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[60]),
        .Q(trn_rd_prev[28]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[29] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[61]),
        .Q(trn_rd_prev[29]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[2] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[34]),
        .Q(trn_rd_prev[2]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[30] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[62]),
        .Q(trn_rd_prev[30]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[31] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[63]),
        .Q(trn_rd_prev[31]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[32] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[0]),
        .Q(trn_rd_prev[32]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[33] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[1]),
        .Q(trn_rd_prev[33]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[34] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[2]),
        .Q(trn_rd_prev[34]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[35] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[3]),
        .Q(trn_rd_prev[35]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[36] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[4]),
        .Q(trn_rd_prev[36]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[37] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[5]),
        .Q(trn_rd_prev[37]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[38] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[6]),
        .Q(trn_rd_prev[38]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[39] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[7]),
        .Q(trn_rd_prev[39]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[3] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[35]),
        .Q(trn_rd_prev[3]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[40] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[8]),
        .Q(trn_rd_prev[40]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[41] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[9]),
        .Q(trn_rd_prev[41]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[42] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[10]),
        .Q(trn_rd_prev[42]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[43] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[11]),
        .Q(trn_rd_prev[43]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[44] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[12]),
        .Q(trn_rd_prev[44]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[45] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[13]),
        .Q(trn_rd_prev[45]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[46] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[14]),
        .Q(trn_rd_prev[46]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[47] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[15]),
        .Q(trn_rd_prev[47]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[48] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[16]),
        .Q(trn_rd_prev[48]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[49] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[17]),
        .Q(trn_rd_prev[49]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[4] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[36]),
        .Q(trn_rd_prev[4]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[50] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[18]),
        .Q(trn_rd_prev[50]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[51] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[19]),
        .Q(trn_rd_prev[51]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[52] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[20]),
        .Q(trn_rd_prev[52]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[53] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[21]),
        .Q(trn_rd_prev[53]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[54] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[22]),
        .Q(trn_rd_prev[54]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[55] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[23]),
        .Q(trn_rd_prev[55]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[56] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[24]),
        .Q(trn_rd_prev[56]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[57] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[25]),
        .Q(trn_rd_prev[57]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[58] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[26]),
        .Q(trn_rd_prev[58]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[59] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[27]),
        .Q(trn_rd_prev[59]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[5] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[37]),
        .Q(trn_rd_prev[5]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[60] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[28]),
        .Q(trn_rd_prev[60]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[61] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[29]),
        .Q(trn_rd_prev[61]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[62] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[30]),
        .Q(trn_rd_prev[62]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[63] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[31]),
        .Q(trn_rd_prev[63]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[6] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[38]),
        .Q(trn_rd_prev[6]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[7] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[39]),
        .Q(trn_rd_prev[7]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[8] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[40]),
        .Q(trn_rd_prev[8]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rd_prev_reg[9] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rd[41]),
        .Q(trn_rd_prev[9]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  LUT6 #(
    .INIT(64'hFFFF000500030003)) 
    trn_rdst_rdy_xhdl4_i_1
       (.I0(null_mux_sel),
        .I1(m_axis_rx_tvalid_xhdl2_reg_0),
        .I2(reg_dsc_detect_reg_0),
        .I3(dsc_detect),
        .I4(null_mux_sel_reg_0),
        .I5(m_axis_rx_tready),
        .O(trn_rdst_rdy_xhdl4_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    trn_rdst_rdy_xhdl4_reg
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(trn_rdst_rdy_xhdl4_i_1_n_0),
        .Q(E),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    trn_recrc_err_prev_reg
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_recrc_err),
        .Q(trn_recrc_err_prev),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    trn_reof_prev_reg
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_reof),
        .Q(is_eof_prev[4]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    trn_rerrfwd_prev_reg
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rerrfwd),
        .Q(trn_rerrfwd_prev),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \trn_rrem_prev_reg[0] 
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rrem),
        .Q(is_eof_prev[2]),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    trn_rsof_prev_reg
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rsof),
        .Q(trn_rsof_prev),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    trn_rsrc_dsc_d_reg
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(trn_rsrc_dsc),
        .Q(trn_rsrc_dsc_d),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    trn_rsrc_dsc_prev_reg
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(trn_rsrc_dsc_prev0),
        .Q(trn_rsrc_dsc_prev),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    trn_rsrc_rdy_prev_reg
       (.C(pipe_userclk2_in),
        .CE(E),
        .D(rsrc_rdy_filtered6_out),
        .Q(trn_rsrc_rdy_prev),
        .R(\trn_rbar_hit_prev_reg[0]_0 ));
endmodule

module pcie_7x_0_axi_basic_top
   (trn_rsrc_dsc_d,
    E,
    m_axis_rx_tvalid_xhdl2_reg,
    m_axis_rx_tlast,
    trn_teof,
    trn_tsrc_rdy,
    trn_trem,
    reg_tcfg_gnt,
    tready_thrtl_xhdl1_reg,
    trn_in_packet,
    reg_dsc_detect,
    ppm_L1_thrtl,
    lnk_up_thrtl,
    m_axis_rx_tuser,
    cfg_pm_turnoff_ok_n,
    trn_tcfg_gnt,
    trn_tsof,
    ppm_L1_trig,
    m_axis_rx_tdata,
    m_axis_rx_tkeep,
    Q,
    \xhdl12.reg_tuser_reg[3] ,
    \tbuf_gap_cnt_reg[0] ,
    pipe_userclk2_in,
    trn_rsrc_dsc,
    rsrc_rdy_filtered6_out,
    trn_rrem,
    trn_reof,
    trn_rsrc_dsc_prev0,
    trn_rsof,
    trn_recrc_err,
    trn_rerrfwd,
    s_axis_tx_tlast,
    s_axis_tx_tvalid,
    s_axis_tx_tkeep,
    tx_cfg_gnt,
    trn_tdst_rdy,
    trn_tcfg_req,
    cfg_turnoff_ok,
    tbuf_av_min_trig,
    trn_in_packet_reg,
    ppm_L1_thrtl_reg,
    lnk_up_thrtl_reg,
    m_axis_rx_tready,
    dsc_detect,
    out,
    s_axis_tx_tdata,
    s_axis_tx_tuser,
    tready_thrtl_xhdl1_i_5,
    trn_tbuf_av,
    tcfg_req_trig,
    cfg_pcie_link_state,
    trn_rd,
    trn_rbar_hit,
    cfg_to_turnoff);
  output trn_rsrc_dsc_d;
  output [0:0]E;
  output m_axis_rx_tvalid_xhdl2_reg;
  output m_axis_rx_tlast;
  output trn_teof;
  output trn_tsrc_rdy;
  output [0:0]trn_trem;
  output reg_tcfg_gnt;
  output tready_thrtl_xhdl1_reg;
  output trn_in_packet;
  output reg_dsc_detect;
  output ppm_L1_thrtl;
  output lnk_up_thrtl;
  output [12:0]m_axis_rx_tuser;
  output cfg_pm_turnoff_ok_n;
  output trn_tcfg_gnt;
  output trn_tsof;
  output ppm_L1_trig;
  output [63:0]m_axis_rx_tdata;
  output [1:0]m_axis_rx_tkeep;
  output [63:0]Q;
  output [3:0]\xhdl12.reg_tuser_reg[3] ;
  input \tbuf_gap_cnt_reg[0] ;
  input pipe_userclk2_in;
  input trn_rsrc_dsc;
  input rsrc_rdy_filtered6_out;
  input [0:0]trn_rrem;
  input trn_reof;
  input trn_rsrc_dsc_prev0;
  input trn_rsof;
  input trn_recrc_err;
  input trn_rerrfwd;
  input s_axis_tx_tlast;
  input s_axis_tx_tvalid;
  input [0:0]s_axis_tx_tkeep;
  input tx_cfg_gnt;
  input trn_tdst_rdy;
  input trn_tcfg_req;
  input cfg_turnoff_ok;
  input tbuf_av_min_trig;
  input trn_in_packet_reg;
  input ppm_L1_thrtl_reg;
  input lnk_up_thrtl_reg;
  input m_axis_rx_tready;
  input dsc_detect;
  input out;
  input [63:0]s_axis_tx_tdata;
  input [3:0]s_axis_tx_tuser;
  input tready_thrtl_xhdl1_i_5;
  input [5:0]trn_tbuf_av;
  input tcfg_req_trig;
  input [2:0]cfg_pcie_link_state;
  input [63:0]trn_rd;
  input [6:0]trn_rbar_hit;
  input cfg_to_turnoff;

  wire [0:0]E;
  wire [63:0]Q;
  wire [2:0]cfg_pcie_link_state;
  wire cfg_pm_turnoff_ok_n;
  wire cfg_to_turnoff;
  wire cfg_turnoff_ok;
  wire dsc_detect;
  wire lnk_up_thrtl;
  wire lnk_up_thrtl_reg;
  wire [63:0]m_axis_rx_tdata;
  wire [1:0]m_axis_rx_tkeep;
  wire m_axis_rx_tlast;
  wire m_axis_rx_tready;
  wire [12:0]m_axis_rx_tuser;
  wire m_axis_rx_tvalid_xhdl2_reg;
  wire out;
  wire pipe_userclk2_in;
  wire ppm_L1_thrtl;
  wire ppm_L1_thrtl_reg;
  wire ppm_L1_trig;
  wire reg_dsc_detect;
  wire reg_tcfg_gnt;
  wire rsrc_rdy_filtered6_out;
  wire [63:0]s_axis_tx_tdata;
  wire [0:0]s_axis_tx_tkeep;
  wire s_axis_tx_tlast;
  wire [3:0]s_axis_tx_tuser;
  wire s_axis_tx_tvalid;
  wire tbuf_av_min_trig;
  wire \tbuf_gap_cnt_reg[0] ;
  wire tcfg_req_trig;
  wire tready_thrtl_xhdl1_i_5;
  wire tready_thrtl_xhdl1_reg;
  wire trn_in_packet;
  wire trn_in_packet_reg;
  wire [6:0]trn_rbar_hit;
  wire [63:0]trn_rd;
  wire trn_recrc_err;
  wire trn_reof;
  wire trn_rerrfwd;
  wire [0:0]trn_rrem;
  wire trn_rsof;
  wire trn_rsrc_dsc;
  wire trn_rsrc_dsc_d;
  wire trn_rsrc_dsc_prev0;
  wire [5:0]trn_tbuf_av;
  wire trn_tcfg_gnt;
  wire trn_tcfg_req;
  wire trn_tdst_rdy;
  wire trn_teof;
  wire [0:0]trn_trem;
  wire trn_tsof;
  wire trn_tsrc_rdy;
  wire tx_cfg_gnt;
  wire [3:0]\xhdl12.reg_tuser_reg[3] ;

  pcie_7x_0_axi_basic_rx rx_inst
       (.E(E),
        .dsc_detect(dsc_detect),
        .m_axis_rx_tdata(m_axis_rx_tdata),
        .m_axis_rx_tkeep(m_axis_rx_tkeep),
        .m_axis_rx_tlast(m_axis_rx_tlast),
        .m_axis_rx_tready(m_axis_rx_tready),
        .m_axis_rx_tuser(m_axis_rx_tuser),
        .m_axis_rx_tvalid_xhdl2_reg(m_axis_rx_tvalid_xhdl2_reg),
        .pipe_userclk2_in(pipe_userclk2_in),
        .reg_dsc_detect_reg(reg_dsc_detect),
        .rsrc_rdy_filtered6_out(rsrc_rdy_filtered6_out),
        .trn_in_packet(trn_in_packet),
        .trn_in_packet_reg(trn_in_packet_reg),
        .trn_rbar_hit(trn_rbar_hit),
        .\trn_rbar_hit_prev_reg[0] (\tbuf_gap_cnt_reg[0] ),
        .trn_rd(trn_rd),
        .trn_recrc_err(trn_recrc_err),
        .trn_reof(trn_reof),
        .trn_rerrfwd(trn_rerrfwd),
        .trn_rrem(trn_rrem),
        .trn_rsof(trn_rsof),
        .trn_rsrc_dsc(trn_rsrc_dsc),
        .trn_rsrc_dsc_d(trn_rsrc_dsc_d),
        .trn_rsrc_dsc_prev0(trn_rsrc_dsc_prev0));
  pcie_7x_0_axi_basic_tx tx_inst
       (.Q(Q),
        .cfg_pcie_link_state(cfg_pcie_link_state),
        .cfg_pm_turnoff_ok_n(cfg_pm_turnoff_ok_n),
        .cfg_to_turnoff(cfg_to_turnoff),
        .cfg_turnoff_ok(cfg_turnoff_ok),
        .lnk_up_thrtl(lnk_up_thrtl),
        .lnk_up_thrtl_reg(lnk_up_thrtl_reg),
        .out(out),
        .pipe_userclk2_in(pipe_userclk2_in),
        .ppm_L1_thrtl(ppm_L1_thrtl),
        .ppm_L1_thrtl_reg(ppm_L1_thrtl_reg),
        .ppm_L1_trig(ppm_L1_trig),
        .reg_tcfg_gnt(reg_tcfg_gnt),
        .s_axis_tx_tdata(s_axis_tx_tdata),
        .s_axis_tx_tkeep(s_axis_tx_tkeep),
        .s_axis_tx_tlast(s_axis_tx_tlast),
        .s_axis_tx_tuser(s_axis_tx_tuser),
        .s_axis_tx_tvalid(s_axis_tx_tvalid),
        .tbuf_av_min_trig(tbuf_av_min_trig),
        .\tbuf_gap_cnt_reg[0] (\tbuf_gap_cnt_reg[0] ),
        .tcfg_req_trig(tcfg_req_trig),
        .tready_thrtl_xhdl1_i_5(tready_thrtl_xhdl1_i_5),
        .tready_thrtl_xhdl1_reg(tready_thrtl_xhdl1_reg),
        .trn_tbuf_av(trn_tbuf_av),
        .trn_tcfg_gnt(trn_tcfg_gnt),
        .trn_tcfg_req(trn_tcfg_req),
        .trn_tdst_rdy(trn_tdst_rdy),
        .trn_teof(trn_teof),
        .trn_trem(trn_trem),
        .trn_tsof(trn_tsof),
        .trn_tsrc_rdy(trn_tsrc_rdy),
        .tx_cfg_gnt(tx_cfg_gnt),
        .\xhdl12.reg_tuser_reg[3] (\xhdl12.reg_tuser_reg[3] ));
endmodule

module pcie_7x_0_axi_basic_tx
   (trn_teof,
    trn_tsrc_rdy,
    trn_trem,
    reg_tcfg_gnt,
    tready_thrtl_xhdl1_reg,
    ppm_L1_thrtl,
    lnk_up_thrtl,
    cfg_pm_turnoff_ok_n,
    trn_tcfg_gnt,
    trn_tsof,
    ppm_L1_trig,
    Q,
    \xhdl12.reg_tuser_reg[3] ,
    \tbuf_gap_cnt_reg[0] ,
    s_axis_tx_tlast,
    pipe_userclk2_in,
    s_axis_tx_tvalid,
    s_axis_tx_tkeep,
    tx_cfg_gnt,
    trn_tdst_rdy,
    trn_tcfg_req,
    cfg_turnoff_ok,
    tbuf_av_min_trig,
    ppm_L1_thrtl_reg,
    lnk_up_thrtl_reg,
    out,
    s_axis_tx_tdata,
    s_axis_tx_tuser,
    tready_thrtl_xhdl1_i_5,
    trn_tbuf_av,
    tcfg_req_trig,
    cfg_pcie_link_state,
    cfg_to_turnoff);
  output trn_teof;
  output trn_tsrc_rdy;
  output [0:0]trn_trem;
  output reg_tcfg_gnt;
  output tready_thrtl_xhdl1_reg;
  output ppm_L1_thrtl;
  output lnk_up_thrtl;
  output cfg_pm_turnoff_ok_n;
  output trn_tcfg_gnt;
  output trn_tsof;
  output ppm_L1_trig;
  output [63:0]Q;
  output [3:0]\xhdl12.reg_tuser_reg[3] ;
  input \tbuf_gap_cnt_reg[0] ;
  input s_axis_tx_tlast;
  input pipe_userclk2_in;
  input s_axis_tx_tvalid;
  input [0:0]s_axis_tx_tkeep;
  input tx_cfg_gnt;
  input trn_tdst_rdy;
  input trn_tcfg_req;
  input cfg_turnoff_ok;
  input tbuf_av_min_trig;
  input ppm_L1_thrtl_reg;
  input lnk_up_thrtl_reg;
  input out;
  input [63:0]s_axis_tx_tdata;
  input [3:0]s_axis_tx_tuser;
  input tready_thrtl_xhdl1_i_5;
  input [5:0]trn_tbuf_av;
  input tcfg_req_trig;
  input [2:0]cfg_pcie_link_state;
  input cfg_to_turnoff;

  wire [63:0]Q;
  wire axi_in_packet;
  wire [2:0]cfg_pcie_link_state;
  wire cfg_pm_turnoff_ok_n;
  wire cfg_to_turnoff;
  wire cfg_turnoff_ok;
  wire lnk_up_thrtl;
  wire lnk_up_thrtl_reg;
  wire out;
  wire pipe_userclk2_in;
  wire ppm_L1_thrtl;
  wire ppm_L1_thrtl_reg;
  wire ppm_L1_trig;
  wire reg_disable_trn;
  wire reg_tcfg_gnt;
  wire reg_tsrc_rdy0;
  wire [63:0]s_axis_tx_tdata;
  wire [0:0]s_axis_tx_tkeep;
  wire s_axis_tx_tlast;
  wire [3:0]s_axis_tx_tuser;
  wire s_axis_tx_tvalid;
  wire tbuf_av_min_trig;
  wire \tbuf_gap_cnt_reg[0] ;
  wire tcfg_req_trig;
  wire tready_thrtl_xhdl1_i_5;
  wire tready_thrtl_xhdl1_reg;
  wire [5:0]trn_tbuf_av;
  wire trn_tcfg_gnt;
  wire trn_tcfg_req;
  wire trn_tdst_rdy;
  wire trn_teof;
  wire [0:0]trn_trem;
  wire trn_tsof;
  wire trn_tsrc_rdy;
  wire tx_cfg_gnt;
  wire [3:0]\xhdl12.reg_tuser_reg[3] ;
  wire \xhdl12.tx_thrl_ctl_inst_n_4 ;

  pcie_7x_0_axi_basic_tx_pipeline tx_pipeline_inst
       (.Q(Q),
        .\TNRTL_CTL_TRN_FLUSH.reg_disable_trn_reg_0 (tready_thrtl_xhdl1_reg),
        .axi_in_packet(axi_in_packet),
        .axi_in_packet_reg_0(\xhdl12.tx_thrl_ctl_inst_n_4 ),
        .out(out),
        .pipe_userclk2_in(pipe_userclk2_in),
        .reg_disable_trn(reg_disable_trn),
        .reg_tsrc_rdy0(reg_tsrc_rdy0),
        .s_axis_tx_tdata(s_axis_tx_tdata),
        .s_axis_tx_tkeep(s_axis_tx_tkeep),
        .s_axis_tx_tlast(s_axis_tx_tlast),
        .s_axis_tx_tuser(s_axis_tx_tuser),
        .s_axis_tx_tvalid(s_axis_tx_tvalid),
        .trn_tdst_rdy(trn_tdst_rdy),
        .trn_teof(trn_teof),
        .trn_trem(trn_trem),
        .trn_tsof(trn_tsof),
        .trn_tsrc_rdy(trn_tsrc_rdy),
        .\xhdl12.reg_tuser_reg[0]_0 (\tbuf_gap_cnt_reg[0] ),
        .\xhdl12.reg_tuser_reg[3]_0 (\xhdl12.reg_tuser_reg[3] ));
  pcie_7x_0_axi_basic_tx_thrtl_ctl \xhdl12.tx_thrl_ctl_inst 
       (.axi_in_packet(axi_in_packet),
        .cfg_pcie_link_state(cfg_pcie_link_state),
        .cfg_pm_turnoff_ok_n(cfg_pm_turnoff_ok_n),
        .cfg_to_turnoff(cfg_to_turnoff),
        .cfg_turnoff_ok(cfg_turnoff_ok),
        .lnk_up_thrtl(lnk_up_thrtl),
        .lnk_up_thrtl_reg_0(lnk_up_thrtl_reg),
        .out(out),
        .pipe_userclk2_in(pipe_userclk2_in),
        .ppm_L1_thrtl(ppm_L1_thrtl),
        .ppm_L1_thrtl_reg_0(ppm_L1_thrtl_reg),
        .ppm_L1_trig(ppm_L1_trig),
        .reg_disable_trn(reg_disable_trn),
        .reg_tcfg_gnt(reg_tcfg_gnt),
        .reg_tsrc_rdy0(reg_tsrc_rdy0),
        .s_axis_tx_tdata({s_axis_tx_tdata[30:29],s_axis_tx_tdata[15],s_axis_tx_tdata[0]}),
        .s_axis_tx_tlast(s_axis_tx_tlast),
        .s_axis_tx_tlast_0(\xhdl12.tx_thrl_ctl_inst_n_4 ),
        .s_axis_tx_tuser(s_axis_tx_tuser[0]),
        .s_axis_tx_tvalid(s_axis_tx_tvalid),
        .tbuf_av_min_trig(tbuf_av_min_trig),
        .\tbuf_gap_cnt_reg[0]_0 (\tbuf_gap_cnt_reg[0] ),
        .tcfg_req_trig(tcfg_req_trig),
        .tready_thrtl_xhdl1_i_5_0(tready_thrtl_xhdl1_i_5),
        .tready_thrtl_xhdl1_reg_0(tready_thrtl_xhdl1_reg),
        .trn_tbuf_av(trn_tbuf_av),
        .trn_tcfg_gnt(trn_tcfg_gnt),
        .trn_tcfg_req(trn_tcfg_req),
        .trn_tdst_rdy(trn_tdst_rdy),
        .tx_cfg_gnt(tx_cfg_gnt));
endmodule

module pcie_7x_0_axi_basic_tx_pipeline
   (trn_teof,
    trn_tsrc_rdy,
    trn_trem,
    axi_in_packet,
    reg_disable_trn,
    trn_tsof,
    Q,
    \xhdl12.reg_tuser_reg[3]_0 ,
    \xhdl12.reg_tuser_reg[0]_0 ,
    s_axis_tx_tlast,
    pipe_userclk2_in,
    reg_tsrc_rdy0,
    s_axis_tx_tvalid,
    s_axis_tx_tkeep,
    axi_in_packet_reg_0,
    out,
    \TNRTL_CTL_TRN_FLUSH.reg_disable_trn_reg_0 ,
    trn_tdst_rdy,
    s_axis_tx_tdata,
    s_axis_tx_tuser);
  output trn_teof;
  output trn_tsrc_rdy;
  output [0:0]trn_trem;
  output axi_in_packet;
  output reg_disable_trn;
  output trn_tsof;
  output [63:0]Q;
  output [3:0]\xhdl12.reg_tuser_reg[3]_0 ;
  input \xhdl12.reg_tuser_reg[0]_0 ;
  input s_axis_tx_tlast;
  input pipe_userclk2_in;
  input reg_tsrc_rdy0;
  input s_axis_tx_tvalid;
  input [0:0]s_axis_tx_tkeep;
  input axi_in_packet_reg_0;
  input out;
  input \TNRTL_CTL_TRN_FLUSH.reg_disable_trn_reg_0 ;
  input trn_tdst_rdy;
  input [63:0]s_axis_tx_tdata;
  input [3:0]s_axis_tx_tuser;

  wire [63:0]Q;
  wire \TNRTL_CTL_TRN_FLUSH.reg_disable_trn_i_1_n_0 ;
  wire \TNRTL_CTL_TRN_FLUSH.reg_disable_trn_reg_0 ;
  wire axi_in_packet;
  wire axi_in_packet_reg_0;
  wire out;
  wire pipe_userclk2_in;
  wire reg_disable_trn;
  wire reg_tsrc_rdy0;
  wire reg_tvalid;
  wire [63:0]s_axis_tx_tdata;
  wire [0:0]s_axis_tx_tkeep;
  wire s_axis_tx_tlast;
  wire [3:0]s_axis_tx_tuser;
  wire s_axis_tx_tvalid;
  wire trn_in_packet;
  wire trn_in_packet_i_1__0_n_0;
  wire trn_tdst_rdy;
  wire trn_teof;
  wire [0:0]trn_trem;
  wire trn_tsof;
  wire trn_tsrc_rdy;
  wire \xhdl12.reg_tuser_reg[0]_0 ;
  wire [3:0]\xhdl12.reg_tuser_reg[3]_0 ;

  LUT6 #(
    .INIT(64'h0FFFFFFF04444444)) 
    \TNRTL_CTL_TRN_FLUSH.reg_disable_trn_i_1 
       (.I0(out),
        .I1(axi_in_packet),
        .I2(\TNRTL_CTL_TRN_FLUSH.reg_disable_trn_reg_0 ),
        .I3(s_axis_tx_tlast),
        .I4(s_axis_tx_tvalid),
        .I5(reg_disable_trn),
        .O(\TNRTL_CTL_TRN_FLUSH.reg_disable_trn_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \TNRTL_CTL_TRN_FLUSH.reg_disable_trn_reg 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(\TNRTL_CTL_TRN_FLUSH.reg_disable_trn_i_1_n_0 ),
        .Q(reg_disable_trn),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    axi_in_packet_reg
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(axi_in_packet_reg_0),
        .Q(axi_in_packet),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    pcie_block_i_i_31
       (.I0(reg_tvalid),
        .I1(trn_in_packet),
        .O(trn_tsof));
  LUT6 #(
    .INIT(64'h0000F088F000F000)) 
    trn_in_packet_i_1__0
       (.I0(trn_tdst_rdy),
        .I1(reg_tvalid),
        .I2(out),
        .I3(trn_in_packet),
        .I4(trn_teof),
        .I5(trn_tsrc_rdy),
        .O(trn_in_packet_i_1__0_n_0));
  FDRE #(
    .INIT(1'b0)) 
    trn_in_packet_reg
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(trn_in_packet_i_1__0_n_0),
        .Q(trn_in_packet),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[0] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[0]),
        .Q(Q[0]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[10] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[10]),
        .Q(Q[10]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[11] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[11]),
        .Q(Q[11]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[12] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[12]),
        .Q(Q[12]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[13] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[13]),
        .Q(Q[13]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[14] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[14]),
        .Q(Q[14]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[15] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[15]),
        .Q(Q[15]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[16] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[16]),
        .Q(Q[16]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[17] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[17]),
        .Q(Q[17]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[18] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[18]),
        .Q(Q[18]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[19] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[19]),
        .Q(Q[19]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[1] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[1]),
        .Q(Q[1]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[20] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[20]),
        .Q(Q[20]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[21] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[21]),
        .Q(Q[21]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[22] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[22]),
        .Q(Q[22]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[23] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[23]),
        .Q(Q[23]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[24] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[24]),
        .Q(Q[24]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[25] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[25]),
        .Q(Q[25]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[26] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[26]),
        .Q(Q[26]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[27] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[27]),
        .Q(Q[27]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[28] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[28]),
        .Q(Q[28]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[29] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[29]),
        .Q(Q[29]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[2] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[2]),
        .Q(Q[2]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[30] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[30]),
        .Q(Q[30]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[31] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[31]),
        .Q(Q[31]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[32] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[32]),
        .Q(Q[32]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[33] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[33]),
        .Q(Q[33]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[34] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[34]),
        .Q(Q[34]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[35] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[35]),
        .Q(Q[35]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[36] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[36]),
        .Q(Q[36]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[37] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[37]),
        .Q(Q[37]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[38] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[38]),
        .Q(Q[38]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[39] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[39]),
        .Q(Q[39]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[3] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[3]),
        .Q(Q[3]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[40] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[40]),
        .Q(Q[40]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[41] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[41]),
        .Q(Q[41]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[42] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[42]),
        .Q(Q[42]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[43] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[43]),
        .Q(Q[43]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[44] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[44]),
        .Q(Q[44]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[45] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[45]),
        .Q(Q[45]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[46] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[46]),
        .Q(Q[46]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[47] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[47]),
        .Q(Q[47]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[48] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[48]),
        .Q(Q[48]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[49] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[49]),
        .Q(Q[49]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[4] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[4]),
        .Q(Q[4]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[50] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[50]),
        .Q(Q[50]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[51] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[51]),
        .Q(Q[51]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[52] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[52]),
        .Q(Q[52]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[53] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[53]),
        .Q(Q[53]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[54] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[54]),
        .Q(Q[54]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[55] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[55]),
        .Q(Q[55]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[56] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[56]),
        .Q(Q[56]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[57] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[57]),
        .Q(Q[57]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[58] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[58]),
        .Q(Q[58]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[59] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[59]),
        .Q(Q[59]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[5] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[5]),
        .Q(Q[5]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[60] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[60]),
        .Q(Q[60]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[61] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[61]),
        .Q(Q[61]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[62] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[62]),
        .Q(Q[62]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[63] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[63]),
        .Q(Q[63]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[6] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[6]),
        .Q(Q[6]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[7] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[7]),
        .Q(Q[7]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[8] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[8]),
        .Q(Q[8]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tdata_reg[9] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tdata[9]),
        .Q(Q[9]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tkeep_reg[7] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tkeep),
        .Q(trn_trem),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tlast_reg 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tlast),
        .Q(trn_teof),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tsrc_rdy_reg 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(reg_tsrc_rdy0),
        .Q(trn_tsrc_rdy),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tuser_reg[0] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tuser[0]),
        .Q(\xhdl12.reg_tuser_reg[3]_0 [0]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tuser_reg[1] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tuser[1]),
        .Q(\xhdl12.reg_tuser_reg[3]_0 [1]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tuser_reg[2] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tuser[2]),
        .Q(\xhdl12.reg_tuser_reg[3]_0 [2]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tuser_reg[3] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tuser[3]),
        .Q(\xhdl12.reg_tuser_reg[3]_0 [3]),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.reg_tvalid_reg 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(s_axis_tx_tvalid),
        .Q(reg_tvalid),
        .R(\xhdl12.reg_tuser_reg[0]_0 ));
endmodule

module pcie_7x_0_axi_basic_tx_thrtl_ctl
   (reg_tcfg_gnt,
    tready_thrtl_xhdl1_reg_0,
    ppm_L1_thrtl,
    lnk_up_thrtl,
    s_axis_tx_tlast_0,
    reg_tsrc_rdy0,
    cfg_pm_turnoff_ok_n,
    trn_tcfg_gnt,
    ppm_L1_trig,
    \tbuf_gap_cnt_reg[0]_0 ,
    tx_cfg_gnt,
    pipe_userclk2_in,
    trn_tdst_rdy,
    trn_tcfg_req,
    cfg_turnoff_ok,
    tbuf_av_min_trig,
    ppm_L1_thrtl_reg_0,
    lnk_up_thrtl_reg_0,
    s_axis_tx_tvalid,
    s_axis_tx_tlast,
    axi_in_packet,
    s_axis_tx_tdata,
    s_axis_tx_tuser,
    out,
    reg_disable_trn,
    tready_thrtl_xhdl1_i_5_0,
    trn_tbuf_av,
    tcfg_req_trig,
    cfg_pcie_link_state,
    cfg_to_turnoff);
  output reg_tcfg_gnt;
  output tready_thrtl_xhdl1_reg_0;
  output ppm_L1_thrtl;
  output lnk_up_thrtl;
  output s_axis_tx_tlast_0;
  output reg_tsrc_rdy0;
  output cfg_pm_turnoff_ok_n;
  output trn_tcfg_gnt;
  output ppm_L1_trig;
  input \tbuf_gap_cnt_reg[0]_0 ;
  input tx_cfg_gnt;
  input pipe_userclk2_in;
  input trn_tdst_rdy;
  input trn_tcfg_req;
  input cfg_turnoff_ok;
  input tbuf_av_min_trig;
  input ppm_L1_thrtl_reg_0;
  input lnk_up_thrtl_reg_0;
  input s_axis_tx_tvalid;
  input s_axis_tx_tlast;
  input axi_in_packet;
  input [3:0]s_axis_tx_tdata;
  input [0:0]s_axis_tx_tuser;
  input out;
  input reg_disable_trn;
  input tready_thrtl_xhdl1_i_5_0;
  input [5:0]trn_tbuf_av;
  input tcfg_req_trig;
  input [2:0]cfg_pcie_link_state;
  input cfg_to_turnoff;

  wire CUR_STATE_A;
  wire CUR_STATE_A_i_2_n_0;
  wire NEXT_STATE_A;
  wire axi_in_packet;
  wire [2:0]cfg_pcie_link_state;
  wire [2:0]cfg_pcie_link_state_d;
  wire cfg_pm_turnoff_ok_n;
  wire cfg_to_turnoff;
  wire cfg_turnoff_ok;
  wire cfg_turnoff_ok_pending;
  wire cfg_turnoff_ok_pending_i_1_n_0;
  wire gtOp;
  wire lnk_up_thrtl;
  wire lnk_up_thrtl_reg_0;
  wire out;
  wire pcie_block_i_i_38_n_0;
  wire pipe_userclk2_in;
  wire ppm_L1_thrtl;
  wire ppm_L1_thrtl_reg_0;
  wire ppm_L1_trig;
  wire ppm_L23_thrtl;
  wire ppm_L23_thrtl_i_1_n_0;
  wire ppm_L23_trig16_out;
  wire reg_axi_in_pkt;
  wire reg_axi_in_pkt_i_1_n_0;
  wire reg_disable_trn;
  wire reg_tcfg_gnt;
  wire reg_to_turnoff;
  wire reg_tsrc_rdy0;
  wire reg_turnoff_ok;
  wire reg_tx_ecrc_pkt;
  wire reg_tx_ecrc_pkt08_out;
  wire [3:0]s_axis_tx_tdata;
  wire s_axis_tx_tlast;
  wire s_axis_tx_tlast_0;
  wire [0:0]s_axis_tx_tuser;
  wire s_axis_tx_tvalid;
  wire [5:0]tbuf_av_d;
  wire tbuf_av_gap_thrtl;
  wire tbuf_av_gap_thrtl_i_1_n_0;
  wire tbuf_av_gap_trig0_out;
  wire tbuf_av_min_thrtl;
  wire tbuf_av_min_trig;
  wire \tbuf_gap_cnt[0]_i_1_n_0 ;
  wire \tbuf_gap_cnt_reg[0]_0 ;
  wire \tbuf_gap_cnt_reg_n_0_[0] ;
  wire tcfg_gnt_pending;
  wire tcfg_gnt_pending_i_1_n_0;
  wire [1:0]tcfg_req_cnt;
  wire \tcfg_req_cnt[0]_i_1_n_0 ;
  wire \tcfg_req_cnt[1]_i_1_n_0 ;
  wire tcfg_req_thrtl;
  wire tcfg_req_thrtl_i_1_n_0;
  wire tcfg_req_trig;
  wire tready_thrtl_xhdl10;
  wire tready_thrtl_xhdl1_i_10_n_0;
  wire tready_thrtl_xhdl1_i_12_n_0;
  wire tready_thrtl_xhdl1_i_2_n_0;
  wire tready_thrtl_xhdl1_i_3_n_0;
  wire tready_thrtl_xhdl1_i_4_n_0;
  wire tready_thrtl_xhdl1_i_5_0;
  wire tready_thrtl_xhdl1_i_6_n_0;
  wire tready_thrtl_xhdl1_i_7_n_0;
  wire tready_thrtl_xhdl1_reg_0;
  wire [5:0]trn_tbuf_av;
  wire trn_tcfg_gnt;
  wire trn_tcfg_req;
  wire trn_tcfg_req_d;
  wire trn_tdst_rdy;
  wire trn_tdst_rdy_d;
  wire tx_cfg_gnt;
  wire \xhdl12.xhdl14.xhdl15.reg_to_turnoff_i_1_n_0 ;
  wire \xhdl17.reg_tx_ecrc_pkt_i_1_n_0 ;

  LUT6 #(
    .INIT(64'h5455445554555555)) 
    CUR_STATE_A_i_1
       (.I0(CUR_STATE_A_i_2_n_0),
        .I1(CUR_STATE_A),
        .I2(s_axis_tx_tlast),
        .I3(tready_thrtl_xhdl1_reg_0),
        .I4(s_axis_tx_tvalid),
        .I5(reg_axi_in_pkt),
        .O(NEXT_STATE_A));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    CUR_STATE_A_i_2
       (.I0(tbuf_av_min_thrtl),
        .I1(ppm_L1_thrtl),
        .I2(tbuf_av_gap_thrtl),
        .I3(tcfg_req_thrtl),
        .I4(ppm_L23_thrtl),
        .I5(lnk_up_thrtl),
        .O(CUR_STATE_A_i_2_n_0));
  FDSE CUR_STATE_A_reg
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(NEXT_STATE_A),
        .Q(CUR_STATE_A),
        .S(\tbuf_gap_cnt_reg[0]_0 ));
  LUT4 #(
    .INIT(16'h7F40)) 
    axi_in_packet_i_1
       (.I0(s_axis_tx_tlast),
        .I1(s_axis_tx_tvalid),
        .I2(tready_thrtl_xhdl1_reg_0),
        .I3(axi_in_packet),
        .O(s_axis_tx_tlast_0));
  FDRE #(
    .INIT(1'b0)) 
    \cfg_pcie_link_state_d_reg[0] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(cfg_pcie_link_state[0]),
        .Q(cfg_pcie_link_state_d[0]),
        .R(\tbuf_gap_cnt_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cfg_pcie_link_state_d_reg[1] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(cfg_pcie_link_state[1]),
        .Q(cfg_pcie_link_state_d[1]),
        .R(\tbuf_gap_cnt_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cfg_pcie_link_state_d_reg[2] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(cfg_pcie_link_state[2]),
        .Q(cfg_pcie_link_state_d[2]),
        .R(\tbuf_gap_cnt_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair106" *) 
  LUT5 #(
    .INIT(32'hFF404040)) 
    cfg_turnoff_ok_pending_i_1
       (.I0(ppm_L23_thrtl),
        .I1(reg_turnoff_ok),
        .I2(reg_to_turnoff),
        .I3(cfg_pm_turnoff_ok_n),
        .I4(cfg_turnoff_ok_pending),
        .O(cfg_turnoff_ok_pending_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    cfg_turnoff_ok_pending_reg
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(cfg_turnoff_ok_pending_i_1_n_0),
        .Q(cfg_turnoff_ok_pending),
        .R(\tbuf_gap_cnt_reg[0]_0 ));
  FDSE #(
    .INIT(1'b0)) 
    lnk_up_thrtl_reg
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(lnk_up_thrtl_reg_0),
        .Q(lnk_up_thrtl),
        .S(\tbuf_gap_cnt_reg[0]_0 ));
  LUT6 #(
    .INIT(64'hDFDFDFDF5F505F5F)) 
    pcie_block_i_i_26
       (.I0(cfg_turnoff_ok_pending),
        .I1(tcfg_gnt_pending),
        .I2(CUR_STATE_A),
        .I3(pcie_block_i_i_38_n_0),
        .I4(ppm_L23_thrtl),
        .I5(tcfg_req_thrtl),
        .O(cfg_pm_turnoff_ok_n));
  (* SOFT_HLUTNM = "soft_lutpair108" *) 
  LUT4 #(
    .INIT(16'hA202)) 
    pcie_block_i_i_30
       (.I0(tcfg_req_thrtl),
        .I1(pcie_block_i_i_38_n_0),
        .I2(CUR_STATE_A),
        .I3(tcfg_gnt_pending),
        .O(trn_tcfg_gnt));
  (* SOFT_HLUTNM = "soft_lutpair104" *) 
  LUT5 #(
    .INIT(32'hFFFF20E0)) 
    pcie_block_i_i_38
       (.I0(reg_axi_in_pkt),
        .I1(s_axis_tx_tvalid),
        .I2(tready_thrtl_xhdl1_reg_0),
        .I3(s_axis_tx_tlast),
        .I4(CUR_STATE_A_i_2_n_0),
        .O(pcie_block_i_i_38_n_0));
  LUT6 #(
    .INIT(64'h0000010000000000)) 
    ppm_L1_thrtl_i_2
       (.I0(cfg_pcie_link_state_d[1]),
        .I1(cfg_pcie_link_state_d[2]),
        .I2(cfg_pcie_link_state_d[0]),
        .I3(cfg_pcie_link_state[0]),
        .I4(cfg_pcie_link_state[1]),
        .I5(cfg_pcie_link_state[2]),
        .O(ppm_L1_trig));
  FDRE #(
    .INIT(1'b0)) 
    ppm_L1_thrtl_reg
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(ppm_L1_thrtl_reg_0),
        .Q(ppm_L1_thrtl),
        .R(\tbuf_gap_cnt_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair106" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    ppm_L23_thrtl_i_1
       (.I0(reg_to_turnoff),
        .I1(reg_turnoff_ok),
        .I2(ppm_L23_thrtl),
        .O(ppm_L23_thrtl_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    ppm_L23_thrtl_reg
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(ppm_L23_thrtl_i_1_n_0),
        .Q(ppm_L23_thrtl),
        .R(\tbuf_gap_cnt_reg[0]_0 ));
  LUT5 #(
    .INIT(32'h00005F40)) 
    reg_axi_in_pkt_i_1
       (.I0(s_axis_tx_tlast),
        .I1(tready_thrtl_xhdl1_reg_0),
        .I2(s_axis_tx_tvalid),
        .I3(reg_axi_in_pkt),
        .I4(\tbuf_gap_cnt_reg[0]_0 ),
        .O(reg_axi_in_pkt_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    reg_axi_in_pkt_reg
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(reg_axi_in_pkt_i_1_n_0),
        .Q(reg_axi_in_pkt),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    reg_tcfg_gnt_reg
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(tx_cfg_gnt),
        .Q(reg_tcfg_gnt),
        .R(\tbuf_gap_cnt_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tbuf_av_d_reg[0] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(trn_tbuf_av[0]),
        .Q(tbuf_av_d[0]),
        .R(\tbuf_gap_cnt_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tbuf_av_d_reg[1] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(trn_tbuf_av[1]),
        .Q(tbuf_av_d[1]),
        .R(\tbuf_gap_cnt_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tbuf_av_d_reg[2] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(trn_tbuf_av[2]),
        .Q(tbuf_av_d[2]),
        .R(\tbuf_gap_cnt_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tbuf_av_d_reg[3] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(trn_tbuf_av[3]),
        .Q(tbuf_av_d[3]),
        .R(\tbuf_gap_cnt_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tbuf_av_d_reg[4] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(trn_tbuf_av[4]),
        .Q(tbuf_av_d[4]),
        .R(\tbuf_gap_cnt_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tbuf_av_d_reg[5] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(trn_tbuf_av[5]),
        .Q(tbuf_av_d[5]),
        .R(\tbuf_gap_cnt_reg[0]_0 ));
  LUT3 #(
    .INIT(8'hEA)) 
    tbuf_av_gap_thrtl_i_1
       (.I0(tbuf_av_gap_trig0_out),
        .I1(\tbuf_gap_cnt_reg_n_0_[0] ),
        .I2(tbuf_av_gap_thrtl),
        .O(tbuf_av_gap_thrtl_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    tbuf_av_gap_thrtl_reg
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(tbuf_av_gap_thrtl_i_1_n_0),
        .Q(tbuf_av_gap_thrtl),
        .R(\tbuf_gap_cnt_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    tbuf_av_min_thrtl_reg
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(tbuf_av_min_trig),
        .Q(tbuf_av_min_thrtl),
        .R(\tbuf_gap_cnt_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair108" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \tbuf_gap_cnt[0]_i_1 
       (.I0(tbuf_av_gap_thrtl),
        .I1(CUR_STATE_A),
        .O(\tbuf_gap_cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tbuf_gap_cnt_reg[0] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(\tbuf_gap_cnt[0]_i_1_n_0 ),
        .Q(\tbuf_gap_cnt_reg_n_0_[0] ),
        .R(\tbuf_gap_cnt_reg[0]_0 ));
  LUT6 #(
    .INIT(64'h44F44444F4F4F4F4)) 
    tcfg_gnt_pending_i_1
       (.I0(trn_tcfg_req_d),
        .I1(trn_tcfg_req),
        .I2(tcfg_gnt_pending),
        .I3(CUR_STATE_A),
        .I4(pcie_block_i_i_38_n_0),
        .I5(tcfg_req_thrtl),
        .O(tcfg_gnt_pending_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    tcfg_gnt_pending_reg
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(tcfg_gnt_pending_i_1_n_0),
        .Q(tcfg_gnt_pending),
        .R(\tbuf_gap_cnt_reg[0]_0 ));
  LUT6 #(
    .INIT(64'h0000000000000D00)) 
    \tcfg_req_cnt[0]_i_1 
       (.I0(trn_tcfg_req),
        .I1(trn_tcfg_req_d),
        .I2(tcfg_gnt_pending),
        .I3(tcfg_req_cnt[1]),
        .I4(tcfg_req_cnt[0]),
        .I5(\tbuf_gap_cnt_reg[0]_0 ),
        .O(\tcfg_req_cnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair105" *) 
  LUT5 #(
    .INIT(32'hFFFF88F8)) 
    \tcfg_req_cnt[1]_i_1 
       (.I0(tcfg_req_cnt[0]),
        .I1(tcfg_req_cnt[1]),
        .I2(trn_tcfg_req),
        .I3(trn_tcfg_req_d),
        .I4(tcfg_gnt_pending),
        .O(\tcfg_req_cnt[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tcfg_req_cnt_reg[0] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(\tcfg_req_cnt[0]_i_1_n_0 ),
        .Q(tcfg_req_cnt[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tcfg_req_cnt_reg[1] 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(\tcfg_req_cnt[1]_i_1_n_0 ),
        .Q(tcfg_req_cnt[1]),
        .R(\tbuf_gap_cnt_reg[0]_0 ));
  LUT6 #(
    .INIT(64'hFFFFF8FF88888888)) 
    tcfg_req_thrtl_i_1
       (.I0(reg_tcfg_gnt),
        .I1(trn_tcfg_req),
        .I2(trn_tdst_rdy_d),
        .I3(trn_tdst_rdy),
        .I4(gtOp),
        .I5(tcfg_req_thrtl),
        .O(tcfg_req_thrtl_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair105" *) 
  LUT2 #(
    .INIT(4'hE)) 
    tcfg_req_thrtl_i_2
       (.I0(tcfg_req_cnt[1]),
        .I1(tcfg_req_cnt[0]),
        .O(gtOp));
  FDRE #(
    .INIT(1'b0)) 
    tcfg_req_thrtl_reg
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(tcfg_req_thrtl_i_1_n_0),
        .Q(tcfg_req_thrtl),
        .R(\tbuf_gap_cnt_reg[0]_0 ));
  LUT6 #(
    .INIT(64'hF1F1F1F10000F100)) 
    tready_thrtl_xhdl1_i_1
       (.I0(reg_tx_ecrc_pkt),
        .I1(tready_thrtl_xhdl1_i_2_n_0),
        .I2(tready_thrtl_xhdl1_i_3_n_0),
        .I3(tready_thrtl_xhdl1_i_4_n_0),
        .I4(tbuf_av_gap_trig0_out),
        .I5(tready_thrtl_xhdl1_i_6_n_0),
        .O(tready_thrtl_xhdl10));
  LUT6 #(
    .INIT(64'h00002000AAAAAAAA)) 
    tready_thrtl_xhdl1_i_10
       (.I0(tready_thrtl_xhdl1_i_5_0),
        .I1(tbuf_av_d[4]),
        .I2(trn_tbuf_av[1]),
        .I3(tbuf_av_d[1]),
        .I4(tready_thrtl_xhdl1_i_12_n_0),
        .I5(tready_thrtl_xhdl1_i_3_n_0),
        .O(tready_thrtl_xhdl1_i_10_n_0));
  LUT4 #(
    .INIT(16'hFFFD)) 
    tready_thrtl_xhdl1_i_12
       (.I0(tbuf_av_d[0]),
        .I1(tbuf_av_d[2]),
        .I2(tbuf_av_d[5]),
        .I3(tbuf_av_d[3]),
        .O(tready_thrtl_xhdl1_i_12_n_0));
  (* SOFT_HLUTNM = "soft_lutpair107" *) 
  LUT4 #(
    .INIT(16'h0078)) 
    tready_thrtl_xhdl1_i_2
       (.I0(s_axis_tx_tdata[0]),
        .I1(s_axis_tx_tdata[3]),
        .I2(s_axis_tx_tdata[2]),
        .I3(tready_thrtl_xhdl1_i_7_n_0),
        .O(tready_thrtl_xhdl1_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair104" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    tready_thrtl_xhdl1_i_3
       (.I0(s_axis_tx_tvalid),
        .I1(s_axis_tx_tlast),
        .I2(tready_thrtl_xhdl1_reg_0),
        .O(tready_thrtl_xhdl1_i_3_n_0));
  LUT6 #(
    .INIT(64'h0000000000100000)) 
    tready_thrtl_xhdl1_i_4
       (.I0(tbuf_av_min_trig),
        .I1(tcfg_req_trig),
        .I2(out),
        .I3(ppm_L23_trig16_out),
        .I4(CUR_STATE_A_i_2_n_0),
        .I5(ppm_L1_trig),
        .O(tready_thrtl_xhdl1_i_4_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFF00100000)) 
    tready_thrtl_xhdl1_i_5
       (.I0(tcfg_req_cnt[0]),
        .I1(tcfg_req_cnt[1]),
        .I2(trn_tdst_rdy),
        .I3(trn_tdst_rdy_d),
        .I4(tcfg_req_thrtl),
        .I5(tready_thrtl_xhdl1_i_10_n_0),
        .O(tbuf_av_gap_trig0_out));
  LUT5 #(
    .INIT(32'h000020E0)) 
    tready_thrtl_xhdl1_i_6
       (.I0(reg_axi_in_pkt),
        .I1(s_axis_tx_tvalid),
        .I2(tready_thrtl_xhdl1_reg_0),
        .I3(s_axis_tx_tlast),
        .I4(CUR_STATE_A),
        .O(tready_thrtl_xhdl1_i_6_n_0));
  LUT5 #(
    .INIT(32'hFFFFDFFF)) 
    tready_thrtl_xhdl1_i_7
       (.I0(s_axis_tx_tuser),
        .I1(reg_axi_in_pkt),
        .I2(s_axis_tx_tvalid),
        .I3(tready_thrtl_xhdl1_reg_0),
        .I4(s_axis_tx_tdata[1]),
        .O(tready_thrtl_xhdl1_i_7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair109" *) 
  LUT2 #(
    .INIT(4'h8)) 
    tready_thrtl_xhdl1_i_9
       (.I0(reg_turnoff_ok),
        .I1(reg_to_turnoff),
        .O(ppm_L23_trig16_out));
  FDRE #(
    .INIT(1'b0)) 
    tready_thrtl_xhdl1_reg
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(tready_thrtl_xhdl10),
        .Q(tready_thrtl_xhdl1_reg_0),
        .R(\tbuf_gap_cnt_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    trn_tcfg_req_d_reg
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(trn_tcfg_req),
        .Q(trn_tcfg_req_d),
        .R(\tbuf_gap_cnt_reg[0]_0 ));
  FDSE #(
    .INIT(1'b0)) 
    trn_tdst_rdy_d_reg
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(trn_tdst_rdy),
        .Q(trn_tdst_rdy_d),
        .S(\tbuf_gap_cnt_reg[0]_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \xhdl12.reg_tsrc_rdy_i_1 
       (.I0(tready_thrtl_xhdl1_reg_0),
        .I1(s_axis_tx_tvalid),
        .I2(out),
        .I3(reg_disable_trn),
        .O(reg_tsrc_rdy0));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.xhdl14.reg_turnoff_ok_reg 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(cfg_turnoff_ok),
        .Q(reg_turnoff_ok),
        .R(\tbuf_gap_cnt_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair109" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \xhdl12.xhdl14.xhdl15.reg_to_turnoff_i_1 
       (.I0(cfg_to_turnoff),
        .I1(reg_to_turnoff),
        .O(\xhdl12.xhdl14.xhdl15.reg_to_turnoff_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl12.xhdl14.xhdl15.reg_to_turnoff_reg 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(\xhdl12.xhdl14.xhdl15.reg_to_turnoff_i_1_n_0 ),
        .Q(reg_to_turnoff),
        .R(\tbuf_gap_cnt_reg[0]_0 ));
  LUT5 #(
    .INIT(32'hBFFFAAAA)) 
    \xhdl17.reg_tx_ecrc_pkt_i_1 
       (.I0(reg_tx_ecrc_pkt08_out),
        .I1(tready_thrtl_xhdl1_reg_0),
        .I2(s_axis_tx_tlast),
        .I3(s_axis_tx_tvalid),
        .I4(reg_tx_ecrc_pkt),
        .O(\xhdl17.reg_tx_ecrc_pkt_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair107" *) 
  LUT5 #(
    .INIT(32'h00001444)) 
    \xhdl17.reg_tx_ecrc_pkt_i_2 
       (.I0(tready_thrtl_xhdl1_i_7_n_0),
        .I1(s_axis_tx_tdata[2]),
        .I2(s_axis_tx_tdata[3]),
        .I3(s_axis_tx_tdata[0]),
        .I4(s_axis_tx_tlast),
        .O(reg_tx_ecrc_pkt08_out));
  FDRE #(
    .INIT(1'b0)) 
    \xhdl17.reg_tx_ecrc_pkt_reg 
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(\xhdl17.reg_tx_ecrc_pkt_i_1_n_0 ),
        .Q(reg_tx_ecrc_pkt),
        .R(\tbuf_gap_cnt_reg[0]_0 ));
endmodule

module pcie_7x_0_core_top
   (pl_ltssm_state,
    pl_phy_lnk_up,
    user_reset_out,
    m_axis_rx_tvalid,
    s_axis_tx_tready,
    pl_received_hot_rst,
    cfg_aer_ecrc_check_en,
    cfg_aer_ecrc_gen_en,
    cfg_aer_rooterr_corr_err_received,
    cfg_aer_rooterr_corr_err_reporting_en,
    cfg_aer_rooterr_fatal_err_received,
    cfg_aer_rooterr_fatal_err_reporting_en,
    cfg_aer_rooterr_non_fatal_err_received,
    cfg_aer_rooterr_non_fatal_err_reporting_en,
    cfg_bridge_serr_en,
    cfg_command,
    cfg_dcommand2,
    cfg_dcommand,
    cfg_dstatus,
    cfg_interrupt_msienable,
    cfg_interrupt_msixenable,
    cfg_interrupt_msixfm,
    cfg_lcommand,
    cfg_lstatus,
    cfg_msg_received,
    cfg_msg_received_assert_int_a,
    cfg_msg_received_assert_int_b,
    cfg_msg_received_assert_int_c,
    cfg_msg_received_assert_int_d,
    cfg_msg_received_deassert_int_a,
    cfg_msg_received_deassert_int_b,
    cfg_msg_received_deassert_int_c,
    cfg_msg_received_deassert_int_d,
    cfg_msg_received_err_cor,
    cfg_msg_received_err_fatal,
    cfg_msg_received_err_non_fatal,
    cfg_msg_received_pm_as_nak,
    cfg_to_turnoff,
    cfg_msg_received_pme_to_ack,
    cfg_msg_received_pm_pme,
    cfg_msg_received_setslotpowerlimit,
    cfg_pmcsr_pme_en,
    cfg_pmcsr_pme_status,
    cfg_root_control_pme_int_en,
    cfg_root_control_syserr_corr_err_en,
    cfg_root_control_syserr_fatal_err_en,
    cfg_root_control_syserr_non_fatal_err_en,
    cfg_slot_control_electromech_il_ctl_pulse,
    pcie_drp_rdy,
    pl_directed_change_done,
    pl_link_gen2_cap,
    pl_link_partner_gen2_supported,
    pl_link_upcfg_cap,
    pl_sel_lnk_rate,
    tx_cfg_req,
    tx_err_drop,
    fc_cpld,
    fc_npd,
    fc_pd,
    cfg_msg_data,
    pcie_drp_do,
    cfg_pmcsr_powerstate,
    pl_lane_reversal_mode,
    pl_rx_pm_state,
    pl_sel_lnk_width,
    cfg_interrupt_mmenable,
    cfg_pcie_link_state,
    pl_initial_link_width,
    pl_tx_pm_state,
    cfg_mgmt_do,
    tx_buf_av,
    cfg_vc_tcvc_map,
    cfg_interrupt_do,
    fc_cplh,
    fc_nph,
    fc_ph,
    gen3_reg,
    pipe_pclk_sel_out,
    pci_exp_txn,
    pci_exp_txp,
    pipe_rxoutclk_out,
    pipe_txoutclk_out,
    user_lnk_up,
    m_axis_rx_tdata,
    m_axis_rx_tkeep,
    m_axis_rx_tlast,
    m_axis_rx_tuser,
    cfg_bus_number,
    cfg_device_number,
    cfg_function_number,
    cfg_mgmt_rd_wr_done,
    cfg_err_aer_headerlog_set,
    cfg_err_cpl_rdy,
    cfg_interrupt_rdy,
    cfg_received_func_lvl_rst,
    pipe_pclk_in,
    m_axis_rx_tready,
    s_axis_tx_tvalid,
    s_axis_tx_tlast,
    sys_rst_n,
    pipe_userclk2_in,
    pipe_userclk1_in,
    pcie_drp_clk,
    pcie_drp_en,
    pcie_drp_we,
    pl_directed_link_auton,
    pl_directed_link_speed,
    pl_downstream_deemph_source,
    pl_transmit_hot_rst,
    pl_upstream_prefer_deemph,
    rx_np_ok,
    rx_np_req,
    cfg_err_aer_headerlog,
    pcie_drp_di,
    cfg_pm_force_state,
    pl_directed_link_change,
    pl_directed_link_width,
    cfg_ds_function_number,
    fc_sel,
    cfg_mgmt_di,
    cfg_err_tlp_cpl_header,
    cfg_aer_interrupt_msgnum,
    cfg_ds_device_number,
    cfg_pciecap_interrupt_msgnum,
    cfg_dsn,
    cfg_ds_bus_number,
    cfg_interrupt_di,
    pcie_drp_addr,
    cfg_mgmt_dwaddr,
    pipe_mmcm_lock_in,
    pipe_rxusrclk_in,
    pipe_dclk_in,
    sys_clk,
    pipe_oobclk_in,
    pci_exp_rxn,
    pci_exp_rxp,
    s_axis_tx_tdata,
    s_axis_tx_tuser,
    s_axis_tx_tkeep,
    tx_cfg_gnt,
    cfg_turnoff_ok,
    cfg_mgmt_byte_en,
    cfg_trn_pending,
    cfg_mgmt_wr_rw1c_as_rw,
    cfg_mgmt_wr_readonly,
    cfg_mgmt_wr_en,
    cfg_mgmt_rd_en,
    cfg_err_malformed,
    cfg_err_cor,
    cfg_err_ur,
    cfg_err_ecrc,
    cfg_err_cpl_timeout,
    cfg_err_cpl_abort,
    cfg_err_cpl_unexpect,
    cfg_err_poisoned,
    cfg_err_atomic_egress_blocked,
    cfg_err_mc_blocked,
    cfg_err_internal_uncor,
    cfg_err_internal_cor,
    cfg_err_posted,
    cfg_err_locked,
    cfg_err_norecovery,
    cfg_interrupt,
    cfg_interrupt_assert,
    cfg_interrupt_stat,
    cfg_pm_halt_aspm_l0s,
    cfg_pm_halt_aspm_l1,
    cfg_pm_force_state_en,
    cfg_pm_wake);
  output [5:0]pl_ltssm_state;
  output pl_phy_lnk_up;
  output user_reset_out;
  output m_axis_rx_tvalid;
  output s_axis_tx_tready;
  output pl_received_hot_rst;
  output cfg_aer_ecrc_check_en;
  output cfg_aer_ecrc_gen_en;
  output cfg_aer_rooterr_corr_err_received;
  output cfg_aer_rooterr_corr_err_reporting_en;
  output cfg_aer_rooterr_fatal_err_received;
  output cfg_aer_rooterr_fatal_err_reporting_en;
  output cfg_aer_rooterr_non_fatal_err_received;
  output cfg_aer_rooterr_non_fatal_err_reporting_en;
  output cfg_bridge_serr_en;
  output [4:0]cfg_command;
  output [11:0]cfg_dcommand2;
  output [14:0]cfg_dcommand;
  output [3:0]cfg_dstatus;
  output cfg_interrupt_msienable;
  output cfg_interrupt_msixenable;
  output cfg_interrupt_msixfm;
  output [10:0]cfg_lcommand;
  output [9:0]cfg_lstatus;
  output cfg_msg_received;
  output cfg_msg_received_assert_int_a;
  output cfg_msg_received_assert_int_b;
  output cfg_msg_received_assert_int_c;
  output cfg_msg_received_assert_int_d;
  output cfg_msg_received_deassert_int_a;
  output cfg_msg_received_deassert_int_b;
  output cfg_msg_received_deassert_int_c;
  output cfg_msg_received_deassert_int_d;
  output cfg_msg_received_err_cor;
  output cfg_msg_received_err_fatal;
  output cfg_msg_received_err_non_fatal;
  output cfg_msg_received_pm_as_nak;
  output cfg_to_turnoff;
  output cfg_msg_received_pme_to_ack;
  output cfg_msg_received_pm_pme;
  output cfg_msg_received_setslotpowerlimit;
  output cfg_pmcsr_pme_en;
  output cfg_pmcsr_pme_status;
  output cfg_root_control_pme_int_en;
  output cfg_root_control_syserr_corr_err_en;
  output cfg_root_control_syserr_fatal_err_en;
  output cfg_root_control_syserr_non_fatal_err_en;
  output cfg_slot_control_electromech_il_ctl_pulse;
  output pcie_drp_rdy;
  output pl_directed_change_done;
  output pl_link_gen2_cap;
  output pl_link_partner_gen2_supported;
  output pl_link_upcfg_cap;
  output pl_sel_lnk_rate;
  output tx_cfg_req;
  output tx_err_drop;
  output [11:0]fc_cpld;
  output [11:0]fc_npd;
  output [11:0]fc_pd;
  output [15:0]cfg_msg_data;
  output [15:0]pcie_drp_do;
  output [1:0]cfg_pmcsr_powerstate;
  output [1:0]pl_lane_reversal_mode;
  output [1:0]pl_rx_pm_state;
  output [1:0]pl_sel_lnk_width;
  output [2:0]cfg_interrupt_mmenable;
  output [2:0]cfg_pcie_link_state;
  output [2:0]pl_initial_link_width;
  output [2:0]pl_tx_pm_state;
  output [31:0]cfg_mgmt_do;
  output [5:0]tx_buf_av;
  output [6:0]cfg_vc_tcvc_map;
  output [7:0]cfg_interrupt_do;
  output [7:0]fc_cplh;
  output [7:0]fc_nph;
  output [7:0]fc_ph;
  output gen3_reg;
  output [0:0]pipe_pclk_sel_out;
  output [0:0]pci_exp_txn;
  output [0:0]pci_exp_txp;
  output [0:0]pipe_rxoutclk_out;
  output pipe_txoutclk_out;
  output user_lnk_up;
  output [63:0]m_axis_rx_tdata;
  output [1:0]m_axis_rx_tkeep;
  output m_axis_rx_tlast;
  output [12:0]m_axis_rx_tuser;
  output [7:0]cfg_bus_number;
  output [4:0]cfg_device_number;
  output [2:0]cfg_function_number;
  output cfg_mgmt_rd_wr_done;
  output cfg_err_aer_headerlog_set;
  output cfg_err_cpl_rdy;
  output cfg_interrupt_rdy;
  output cfg_received_func_lvl_rst;
  input pipe_pclk_in;
  input m_axis_rx_tready;
  input s_axis_tx_tvalid;
  input s_axis_tx_tlast;
  input sys_rst_n;
  input pipe_userclk2_in;
  input pipe_userclk1_in;
  input pcie_drp_clk;
  input pcie_drp_en;
  input pcie_drp_we;
  input pl_directed_link_auton;
  input pl_directed_link_speed;
  input pl_downstream_deemph_source;
  input pl_transmit_hot_rst;
  input pl_upstream_prefer_deemph;
  input rx_np_ok;
  input rx_np_req;
  input [127:0]cfg_err_aer_headerlog;
  input [15:0]pcie_drp_di;
  input [1:0]cfg_pm_force_state;
  input [1:0]pl_directed_link_change;
  input [1:0]pl_directed_link_width;
  input [2:0]cfg_ds_function_number;
  input [2:0]fc_sel;
  input [31:0]cfg_mgmt_di;
  input [47:0]cfg_err_tlp_cpl_header;
  input [4:0]cfg_aer_interrupt_msgnum;
  input [4:0]cfg_ds_device_number;
  input [4:0]cfg_pciecap_interrupt_msgnum;
  input [63:0]cfg_dsn;
  input [7:0]cfg_ds_bus_number;
  input [7:0]cfg_interrupt_di;
  input [8:0]pcie_drp_addr;
  input [9:0]cfg_mgmt_dwaddr;
  input pipe_mmcm_lock_in;
  input pipe_rxusrclk_in;
  input pipe_dclk_in;
  input sys_clk;
  input pipe_oobclk_in;
  input [0:0]pci_exp_rxn;
  input [0:0]pci_exp_rxp;
  input [63:0]s_axis_tx_tdata;
  input [3:0]s_axis_tx_tuser;
  input [0:0]s_axis_tx_tkeep;
  input tx_cfg_gnt;
  input cfg_turnoff_ok;
  input [3:0]cfg_mgmt_byte_en;
  input cfg_trn_pending;
  input cfg_mgmt_wr_rw1c_as_rw;
  input cfg_mgmt_wr_readonly;
  input cfg_mgmt_wr_en;
  input cfg_mgmt_rd_en;
  input cfg_err_malformed;
  input cfg_err_cor;
  input cfg_err_ur;
  input cfg_err_ecrc;
  input cfg_err_cpl_timeout;
  input cfg_err_cpl_abort;
  input cfg_err_cpl_unexpect;
  input cfg_err_poisoned;
  input cfg_err_atomic_egress_blocked;
  input cfg_err_mc_blocked;
  input cfg_err_internal_uncor;
  input cfg_err_internal_cor;
  input cfg_err_posted;
  input cfg_err_locked;
  input cfg_err_norecovery;
  input cfg_interrupt;
  input cfg_interrupt_assert;
  input cfg_interrupt_stat;
  input cfg_pm_halt_aspm_l0s;
  input cfg_pm_halt_aspm_l1;
  input cfg_pm_force_state_en;
  input cfg_pm_wake;

  wire bridge_reset_int;
  wire cfg_aer_ecrc_check_en;
  wire cfg_aer_ecrc_gen_en;
  wire [4:0]cfg_aer_interrupt_msgnum;
  wire cfg_aer_rooterr_corr_err_received;
  wire cfg_aer_rooterr_corr_err_reporting_en;
  wire cfg_aer_rooterr_fatal_err_received;
  wire cfg_aer_rooterr_fatal_err_reporting_en;
  wire cfg_aer_rooterr_non_fatal_err_received;
  wire cfg_aer_rooterr_non_fatal_err_reporting_en;
  wire cfg_bridge_serr_en;
  wire [7:0]cfg_bus_number;
  wire [4:0]cfg_command;
  wire [14:0]cfg_dcommand;
  wire [11:0]cfg_dcommand2;
  wire [4:0]cfg_device_number;
  wire [7:0]cfg_ds_bus_number;
  wire [4:0]cfg_ds_device_number;
  wire [2:0]cfg_ds_function_number;
  wire [63:0]cfg_dsn;
  wire [3:0]cfg_dstatus;
  wire [127:0]cfg_err_aer_headerlog;
  wire cfg_err_aer_headerlog_set;
  wire cfg_err_atomic_egress_blocked;
  wire cfg_err_cor;
  wire cfg_err_cpl_abort;
  wire cfg_err_cpl_rdy;
  wire cfg_err_cpl_timeout;
  wire cfg_err_cpl_unexpect;
  wire cfg_err_ecrc;
  wire cfg_err_internal_cor;
  wire cfg_err_internal_uncor;
  wire cfg_err_locked;
  wire cfg_err_malformed;
  wire cfg_err_mc_blocked;
  wire cfg_err_norecovery;
  wire cfg_err_poisoned;
  wire cfg_err_posted;
  wire [47:0]cfg_err_tlp_cpl_header;
  wire cfg_err_ur;
  wire [2:0]cfg_function_number;
  wire cfg_interrupt;
  wire cfg_interrupt_assert;
  wire [7:0]cfg_interrupt_di;
  wire [7:0]cfg_interrupt_do;
  wire [2:0]cfg_interrupt_mmenable;
  wire cfg_interrupt_msienable;
  wire cfg_interrupt_msixenable;
  wire cfg_interrupt_msixfm;
  wire cfg_interrupt_rdy;
  wire cfg_interrupt_stat;
  wire [10:0]cfg_lcommand;
  wire [9:0]cfg_lstatus;
  wire [3:0]cfg_mgmt_byte_en;
  wire [3:0]cfg_mgmt_byte_en_n;
  wire [31:0]cfg_mgmt_di;
  wire [31:0]cfg_mgmt_do;
  wire [9:0]cfg_mgmt_dwaddr;
  wire cfg_mgmt_rd_en;
  wire cfg_mgmt_rd_wr_done;
  wire cfg_mgmt_wr_en;
  wire cfg_mgmt_wr_readonly;
  wire cfg_mgmt_wr_rw1c_as_rw;
  wire [15:0]cfg_msg_data;
  wire cfg_msg_received;
  wire cfg_msg_received_assert_int_a;
  wire cfg_msg_received_assert_int_b;
  wire cfg_msg_received_assert_int_c;
  wire cfg_msg_received_assert_int_d;
  wire cfg_msg_received_deassert_int_a;
  wire cfg_msg_received_deassert_int_b;
  wire cfg_msg_received_deassert_int_c;
  wire cfg_msg_received_deassert_int_d;
  wire cfg_msg_received_err_cor;
  wire cfg_msg_received_err_fatal;
  wire cfg_msg_received_err_non_fatal;
  wire cfg_msg_received_pm_as_nak;
  wire cfg_msg_received_pm_pme;
  wire cfg_msg_received_pme_to_ack;
  wire cfg_msg_received_setslotpowerlimit;
  wire [2:0]cfg_pcie_link_state;
  wire [4:0]cfg_pciecap_interrupt_msgnum;
  wire [1:0]cfg_pm_force_state;
  wire cfg_pm_force_state_en;
  wire cfg_pm_halt_aspm_l0s;
  wire cfg_pm_halt_aspm_l1;
  wire cfg_pm_wake;
  wire cfg_pmcsr_pme_en;
  wire cfg_pmcsr_pme_status;
  wire [1:0]cfg_pmcsr_powerstate;
  wire cfg_received_func_lvl_rst;
  wire cfg_root_control_pme_int_en;
  wire cfg_root_control_syserr_corr_err_en;
  wire cfg_root_control_syserr_fatal_err_en;
  wire cfg_root_control_syserr_non_fatal_err_en;
  wire cfg_slot_control_electromech_il_ctl_pulse;
  wire cfg_to_turnoff;
  wire cfg_trn_pending;
  wire cfg_turnoff_ok;
  wire [6:0]cfg_vc_tcvc_map;
  wire [11:0]fc_cpld;
  wire [7:0]fc_cplh;
  wire [11:0]fc_npd;
  wire [7:0]fc_nph;
  wire [11:0]fc_pd;
  wire [7:0]fc_ph;
  wire [2:0]fc_sel;
  wire gen3_reg;
  wire gt_top_i_n_7;
  wire \ltssm_reg1_reg[0]_srl2_n_0 ;
  wire \ltssm_reg1_reg[1]_srl2_n_0 ;
  wire \ltssm_reg1_reg[2]_srl2_n_0 ;
  wire \ltssm_reg1_reg[3]_srl2_n_0 ;
  wire \ltssm_reg1_reg[4]_srl2_n_0 ;
  wire \ltssm_reg1_reg[5]_srl2_n_0 ;
  wire [5:0]ltssm_reg2;
  wire [63:0]m_axis_rx_tdata;
  wire [1:0]m_axis_rx_tkeep;
  wire m_axis_rx_tlast;
  wire m_axis_rx_tready;
  wire [12:0]m_axis_rx_tuser;
  wire m_axis_rx_tvalid;
  wire [0:0]pci_exp_rxn;
  wire [0:0]pci_exp_rxp;
  wire [0:0]pci_exp_txn;
  wire [0:0]pci_exp_txp;
  wire [8:0]pcie_drp_addr;
  wire pcie_drp_clk;
  wire [15:0]pcie_drp_di;
  wire [15:0]pcie_drp_do;
  wire pcie_drp_en;
  wire pcie_drp_rdy;
  wire pcie_drp_we;
  wire pcie_top_i_n_4;
  wire pipe_dclk_in;
  wire pipe_mmcm_lock_in;
  wire pipe_oobclk_in;
  wire pipe_pclk_in;
  wire [0:0]pipe_pclk_sel_out;
  wire pipe_rx0_chanisaligned_gt;
  wire [1:0]pipe_rx0_char_is_k_gt;
  wire [15:0]pipe_rx0_data_gt;
  wire pipe_rx0_elec_idle_gt;
  wire pipe_rx0_phy_status_gt;
  wire pipe_rx0_polarity_gt;
  wire [2:0]pipe_rx0_status_gt;
  wire pipe_rx0_valid_gt;
  wire [0:0]pipe_rxoutclk_out;
  wire pipe_rxusrclk_in;
  wire [1:0]pipe_tx0_char_is_k_gt;
  wire pipe_tx0_compliance_gt;
  wire [15:0]pipe_tx0_data_gt;
  wire pipe_tx0_elec_idle_gt;
  wire [1:0]pipe_tx0_powerdown_gt;
  wire pipe_tx_deemph_gt;
  wire [2:0]pipe_tx_margin_gt;
  wire pipe_tx_rate_gt;
  wire pipe_tx_rcvr_det_gt;
  wire pipe_txoutclk_out;
  wire pipe_userclk1_in;
  wire pipe_userclk2_in;
  wire pl_directed_change_done;
  wire pl_directed_link_auton;
  wire [1:0]pl_directed_link_change;
  wire pl_directed_link_speed;
  wire [1:0]pl_directed_link_width;
  wire pl_downstream_deemph_source;
  wire [2:0]pl_initial_link_width;
  wire [1:0]pl_lane_reversal_mode;
  wire pl_link_gen2_cap;
  wire pl_link_partner_gen2_supported;
  wire pl_link_upcfg_cap;
  wire [5:0]pl_ltssm_state;
  wire pl_phy_lnk_up;
  wire pl_phy_lnk_up_int;
  wire pl_phy_lnk_up_sync;
  wire pl_received_hot_rst;
  wire pl_received_hot_rst_int;
  wire pl_received_hot_rst_sync;
  wire [1:0]pl_rx_pm_state;
  wire pl_sel_lnk_rate;
  wire [1:0]pl_sel_lnk_width;
  wire pl_transmit_hot_rst;
  wire [2:0]pl_tx_pm_state;
  wire pl_upstream_prefer_deemph;
  wire rx_np_ok;
  wire rx_np_req;
  wire [63:0]s_axis_tx_tdata;
  wire [0:0]s_axis_tx_tkeep;
  wire s_axis_tx_tlast;
  wire s_axis_tx_tready;
  wire [3:0]s_axis_tx_tuser;
  wire s_axis_tx_tvalid;
  (* DONT_TOUCH *) wire store_ltssm;
  wire store_ltssm_inferred_i_2_n_0;
  wire store_ltssm_inferred_i_3_n_0;
  wire sys_clk;
  wire sys_rst_n;
  wire sys_rst_n_0;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) wire trn_lnk_up;
  wire [5:0]tx_buf_av;
  wire tx_cfg_gnt;
  wire tx_cfg_req;
  wire tx_err_drop;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* equivalent_register_removal = "no" *) wire user_lnk_up_d;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* equivalent_register_removal = "no" *) wire user_lnk_up_int;
  wire user_reset_out;
  wire user_reset_out_i_1_n_0;

  assign user_lnk_up = user_lnk_up_int;
  pcie_7x_0_gt_top gt_top_i
       (.Q(pipe_rx0_data_gt),
        .QPLL_DRP_GEN3(gen3_reg),
        .\gt_rx_status_q_reg[2] (pipe_rx0_status_gt),
        .pci_exp_rxn(pci_exp_rxn),
        .pci_exp_rxp(pci_exp_rxp),
        .pci_exp_txn(pci_exp_txn),
        .pci_exp_txp(pci_exp_txp),
        .pipe_dclk_in(pipe_dclk_in),
        .pipe_mmcm_lock_in(pipe_mmcm_lock_in),
        .pipe_oobclk_in(pipe_oobclk_in),
        .pipe_pclk_in(pipe_pclk_in),
        .pipe_pclk_sel_out(pipe_pclk_sel_out),
        .pipe_rx0_chanisaligned(pipe_rx0_chanisaligned_gt),
        .pipe_rx0_char_is_k(pipe_rx0_char_is_k_gt),
        .pipe_rx0_elec_idle(pipe_rx0_elec_idle_gt),
        .pipe_rx0_phy_status(pipe_rx0_phy_status_gt),
        .pipe_rx0_polarity(pipe_rx0_polarity_gt),
        .pipe_rx0_valid_gt(pipe_rx0_valid_gt),
        .pipe_rxoutclk_out(pipe_rxoutclk_out),
        .pipe_rxusrclk_in(pipe_rxusrclk_in),
        .pipe_tx0_char_is_k(pipe_tx0_char_is_k_gt),
        .pipe_tx0_compliance(pipe_tx0_compliance_gt),
        .pipe_tx0_data(pipe_tx0_data_gt),
        .pipe_tx0_elec_idle(pipe_tx0_elec_idle_gt),
        .pipe_tx0_powerdown(pipe_tx0_powerdown_gt),
        .pipe_tx_deemph(pipe_tx_deemph_gt),
        .pipe_tx_margin(pipe_tx_margin_gt),
        .pipe_tx_rate(pipe_tx_rate_gt),
        .pipe_tx_rcvr_det(pipe_tx_rcvr_det_gt),
        .pipe_txoutclk_out(pipe_txoutclk_out),
        .pl_ltssm_state(pl_ltssm_state),
        .reset_n_reg2_reg(sys_rst_n),
        .sys_clk(sys_clk),
        .sys_rst_n(sys_rst_n_0),
        .sys_rst_n_0(gt_top_i_n_7));
  (* srl_bus_name = "U0/\inst/ltssm_reg1_reg " *) 
  (* srl_name = "U0/\inst/ltssm_reg1_reg[0]_srl2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \ltssm_reg1_reg[0]_srl2 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(pipe_pclk_in),
        .D(pl_ltssm_state[0]),
        .Q(\ltssm_reg1_reg[0]_srl2_n_0 ));
  (* srl_bus_name = "U0/\inst/ltssm_reg1_reg " *) 
  (* srl_name = "U0/\inst/ltssm_reg1_reg[1]_srl2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \ltssm_reg1_reg[1]_srl2 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(pipe_pclk_in),
        .D(pl_ltssm_state[1]),
        .Q(\ltssm_reg1_reg[1]_srl2_n_0 ));
  (* srl_bus_name = "U0/\inst/ltssm_reg1_reg " *) 
  (* srl_name = "U0/\inst/ltssm_reg1_reg[2]_srl2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \ltssm_reg1_reg[2]_srl2 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(pipe_pclk_in),
        .D(pl_ltssm_state[2]),
        .Q(\ltssm_reg1_reg[2]_srl2_n_0 ));
  (* srl_bus_name = "U0/\inst/ltssm_reg1_reg " *) 
  (* srl_name = "U0/\inst/ltssm_reg1_reg[3]_srl2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \ltssm_reg1_reg[3]_srl2 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(pipe_pclk_in),
        .D(pl_ltssm_state[3]),
        .Q(\ltssm_reg1_reg[3]_srl2_n_0 ));
  (* srl_bus_name = "U0/\inst/ltssm_reg1_reg " *) 
  (* srl_name = "U0/\inst/ltssm_reg1_reg[4]_srl2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \ltssm_reg1_reg[4]_srl2 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(pipe_pclk_in),
        .D(pl_ltssm_state[4]),
        .Q(\ltssm_reg1_reg[4]_srl2_n_0 ));
  (* srl_bus_name = "U0/\inst/ltssm_reg1_reg " *) 
  (* srl_name = "U0/\inst/ltssm_reg1_reg[5]_srl2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \ltssm_reg1_reg[5]_srl2 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(pipe_pclk_in),
        .D(pl_ltssm_state[5]),
        .Q(\ltssm_reg1_reg[5]_srl2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ltssm_reg2_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\ltssm_reg1_reg[0]_srl2_n_0 ),
        .Q(ltssm_reg2[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ltssm_reg2_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\ltssm_reg1_reg[1]_srl2_n_0 ),
        .Q(ltssm_reg2[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ltssm_reg2_reg[2] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\ltssm_reg1_reg[2]_srl2_n_0 ),
        .Q(ltssm_reg2[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ltssm_reg2_reg[3] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\ltssm_reg1_reg[3]_srl2_n_0 ),
        .Q(ltssm_reg2[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ltssm_reg2_reg[4] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\ltssm_reg1_reg[4]_srl2_n_0 ),
        .Q(ltssm_reg2[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ltssm_reg2_reg[5] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\ltssm_reg1_reg[5]_srl2_n_0 ),
        .Q(ltssm_reg2[5]),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    pcie_block_i_i_34
       (.I0(cfg_mgmt_byte_en[3]),
        .O(cfg_mgmt_byte_en_n[3]));
  LUT1 #(
    .INIT(2'h1)) 
    pcie_block_i_i_35
       (.I0(cfg_mgmt_byte_en[2]),
        .O(cfg_mgmt_byte_en_n[2]));
  LUT1 #(
    .INIT(2'h1)) 
    pcie_block_i_i_36
       (.I0(cfg_mgmt_byte_en[1]),
        .O(cfg_mgmt_byte_en_n[1]));
  LUT1 #(
    .INIT(2'h1)) 
    pcie_block_i_i_37
       (.I0(cfg_mgmt_byte_en[0]),
        .O(cfg_mgmt_byte_en_n[0]));
  pcie_7x_0_pcie_top pcie_top_i
       (.bridge_reset_int(bridge_reset_int),
        .cfg_aer_ecrc_check_en(cfg_aer_ecrc_check_en),
        .cfg_aer_ecrc_gen_en(cfg_aer_ecrc_gen_en),
        .cfg_aer_interrupt_msgnum(cfg_aer_interrupt_msgnum),
        .cfg_aer_rooterr_corr_err_received(cfg_aer_rooterr_corr_err_received),
        .cfg_aer_rooterr_corr_err_reporting_en(cfg_aer_rooterr_corr_err_reporting_en),
        .cfg_aer_rooterr_fatal_err_received(cfg_aer_rooterr_fatal_err_received),
        .cfg_aer_rooterr_fatal_err_reporting_en(cfg_aer_rooterr_fatal_err_reporting_en),
        .cfg_aer_rooterr_non_fatal_err_received(cfg_aer_rooterr_non_fatal_err_received),
        .cfg_aer_rooterr_non_fatal_err_reporting_en(cfg_aer_rooterr_non_fatal_err_reporting_en),
        .cfg_bridge_serr_en(cfg_bridge_serr_en),
        .cfg_bus_number(cfg_bus_number),
        .cfg_command(cfg_command),
        .cfg_dcommand(cfg_dcommand),
        .cfg_dcommand2(cfg_dcommand2),
        .cfg_device_number(cfg_device_number),
        .cfg_ds_bus_number(cfg_ds_bus_number),
        .cfg_ds_device_number(cfg_ds_device_number),
        .cfg_ds_function_number(cfg_ds_function_number),
        .cfg_dsn(cfg_dsn),
        .cfg_dstatus(cfg_dstatus),
        .cfg_err_aer_headerlog(cfg_err_aer_headerlog),
        .cfg_err_aer_headerlog_set(cfg_err_aer_headerlog_set),
        .cfg_err_atomic_egress_blocked(cfg_err_atomic_egress_blocked),
        .cfg_err_cor(cfg_err_cor),
        .cfg_err_cpl_abort(cfg_err_cpl_abort),
        .cfg_err_cpl_rdy(cfg_err_cpl_rdy),
        .cfg_err_cpl_timeout(cfg_err_cpl_timeout),
        .cfg_err_cpl_unexpect(cfg_err_cpl_unexpect),
        .cfg_err_ecrc(cfg_err_ecrc),
        .cfg_err_internal_cor(cfg_err_internal_cor),
        .cfg_err_internal_uncor(cfg_err_internal_uncor),
        .cfg_err_locked(cfg_err_locked),
        .cfg_err_malformed(cfg_err_malformed),
        .cfg_err_mc_blocked(cfg_err_mc_blocked),
        .cfg_err_norecovery(cfg_err_norecovery),
        .cfg_err_poisoned(cfg_err_poisoned),
        .cfg_err_posted(cfg_err_posted),
        .cfg_err_tlp_cpl_header(cfg_err_tlp_cpl_header),
        .cfg_err_ur(cfg_err_ur),
        .cfg_function_number(cfg_function_number),
        .cfg_interrupt(cfg_interrupt),
        .cfg_interrupt_assert(cfg_interrupt_assert),
        .cfg_interrupt_di(cfg_interrupt_di),
        .cfg_interrupt_do(cfg_interrupt_do),
        .cfg_interrupt_mmenable(cfg_interrupt_mmenable),
        .cfg_interrupt_msienable(cfg_interrupt_msienable),
        .cfg_interrupt_msixenable(cfg_interrupt_msixenable),
        .cfg_interrupt_msixfm(cfg_interrupt_msixfm),
        .cfg_interrupt_rdy(cfg_interrupt_rdy),
        .cfg_interrupt_stat(cfg_interrupt_stat),
        .cfg_lcommand(cfg_lcommand),
        .cfg_lstatus(cfg_lstatus),
        .cfg_mgmt_byte_en_n(cfg_mgmt_byte_en_n),
        .cfg_mgmt_di(cfg_mgmt_di),
        .cfg_mgmt_do(cfg_mgmt_do),
        .cfg_mgmt_dwaddr(cfg_mgmt_dwaddr),
        .cfg_mgmt_rd_en(cfg_mgmt_rd_en),
        .cfg_mgmt_rd_wr_done(cfg_mgmt_rd_wr_done),
        .cfg_mgmt_wr_en(cfg_mgmt_wr_en),
        .cfg_mgmt_wr_readonly(cfg_mgmt_wr_readonly),
        .cfg_mgmt_wr_rw1c_as_rw(cfg_mgmt_wr_rw1c_as_rw),
        .cfg_msg_data(cfg_msg_data),
        .cfg_msg_received(cfg_msg_received),
        .cfg_msg_received_assert_int_a(cfg_msg_received_assert_int_a),
        .cfg_msg_received_assert_int_b(cfg_msg_received_assert_int_b),
        .cfg_msg_received_assert_int_c(cfg_msg_received_assert_int_c),
        .cfg_msg_received_assert_int_d(cfg_msg_received_assert_int_d),
        .cfg_msg_received_deassert_int_a(cfg_msg_received_deassert_int_a),
        .cfg_msg_received_deassert_int_b(cfg_msg_received_deassert_int_b),
        .cfg_msg_received_deassert_int_c(cfg_msg_received_deassert_int_c),
        .cfg_msg_received_deassert_int_d(cfg_msg_received_deassert_int_d),
        .cfg_msg_received_err_cor(cfg_msg_received_err_cor),
        .cfg_msg_received_err_fatal(cfg_msg_received_err_fatal),
        .cfg_msg_received_err_non_fatal(cfg_msg_received_err_non_fatal),
        .cfg_msg_received_pm_as_nak(cfg_msg_received_pm_as_nak),
        .cfg_msg_received_pm_pme(cfg_msg_received_pm_pme),
        .cfg_msg_received_pme_to_ack(cfg_msg_received_pme_to_ack),
        .cfg_msg_received_setslotpowerlimit(cfg_msg_received_setslotpowerlimit),
        .cfg_pcie_link_state(cfg_pcie_link_state),
        .cfg_pciecap_interrupt_msgnum(cfg_pciecap_interrupt_msgnum),
        .cfg_pm_force_state(cfg_pm_force_state),
        .cfg_pm_force_state_en(cfg_pm_force_state_en),
        .cfg_pm_halt_aspm_l0s(cfg_pm_halt_aspm_l0s),
        .cfg_pm_halt_aspm_l1(cfg_pm_halt_aspm_l1),
        .cfg_pm_wake(cfg_pm_wake),
        .cfg_pmcsr_pme_en(cfg_pmcsr_pme_en),
        .cfg_pmcsr_pme_status(cfg_pmcsr_pme_status),
        .cfg_pmcsr_powerstate(cfg_pmcsr_powerstate),
        .cfg_received_func_lvl_rst(cfg_received_func_lvl_rst),
        .cfg_root_control_pme_int_en(cfg_root_control_pme_int_en),
        .cfg_root_control_syserr_corr_err_en(cfg_root_control_syserr_corr_err_en),
        .cfg_root_control_syserr_fatal_err_en(cfg_root_control_syserr_fatal_err_en),
        .cfg_root_control_syserr_non_fatal_err_en(cfg_root_control_syserr_non_fatal_err_en),
        .cfg_slot_control_electromech_il_ctl_pulse(cfg_slot_control_electromech_il_ctl_pulse),
        .cfg_to_turnoff(cfg_to_turnoff),
        .cfg_trn_pending(cfg_trn_pending),
        .cfg_turnoff_ok(cfg_turnoff_ok),
        .cfg_vc_tcvc_map(cfg_vc_tcvc_map),
        .fc_cpld(fc_cpld),
        .fc_cplh(fc_cplh),
        .fc_npd(fc_npd),
        .fc_nph(fc_nph),
        .fc_pd(fc_pd),
        .fc_ph(fc_ph),
        .fc_sel(fc_sel),
        .m_axis_rx_tdata(m_axis_rx_tdata),
        .m_axis_rx_tkeep(m_axis_rx_tkeep),
        .m_axis_rx_tlast(m_axis_rx_tlast),
        .m_axis_rx_tready(m_axis_rx_tready),
        .m_axis_rx_tuser(m_axis_rx_tuser),
        .m_axis_rx_tvalid_xhdl2_reg(m_axis_rx_tvalid),
        .out(user_lnk_up_int),
        .pcie_drp_addr(pcie_drp_addr),
        .pcie_drp_clk(pcie_drp_clk),
        .pcie_drp_di(pcie_drp_di),
        .pcie_drp_do(pcie_drp_do),
        .pcie_drp_en(pcie_drp_en),
        .pcie_drp_rdy(pcie_drp_rdy),
        .pcie_drp_we(pcie_drp_we),
        .pipe_pclk_in(pipe_pclk_in),
        .pipe_rx0_chanisaligned(pipe_rx0_chanisaligned_gt),
        .pipe_rx0_char_is_k(pipe_rx0_char_is_k_gt),
        .pipe_rx0_data(pipe_rx0_data_gt),
        .pipe_rx0_elec_idle(pipe_rx0_elec_idle_gt),
        .pipe_rx0_phy_status(pipe_rx0_phy_status_gt),
        .pipe_rx0_polarity(pipe_rx0_polarity_gt),
        .pipe_rx0_status(pipe_rx0_status_gt),
        .pipe_rx0_valid(pipe_rx0_valid_gt),
        .pipe_tx0_char_is_k(pipe_tx0_char_is_k_gt),
        .pipe_tx0_compliance(pipe_tx0_compliance_gt),
        .pipe_tx0_data(pipe_tx0_data_gt),
        .pipe_tx0_elec_idle(pipe_tx0_elec_idle_gt),
        .pipe_tx0_powerdown(pipe_tx0_powerdown_gt),
        .pipe_tx_deemph(pipe_tx_deemph_gt),
        .pipe_tx_margin(pipe_tx_margin_gt),
        .pipe_tx_rate(pipe_tx_rate_gt),
        .pipe_tx_rcvr_det(pipe_tx_rcvr_det_gt),
        .pipe_userclk1_in(pipe_userclk1_in),
        .pipe_userclk2_in(pipe_userclk2_in),
        .pl_directed_change_done(pl_directed_change_done),
        .pl_directed_link_auton(pl_directed_link_auton),
        .pl_directed_link_change(pl_directed_link_change),
        .pl_directed_link_speed(pl_directed_link_speed),
        .pl_directed_link_width(pl_directed_link_width),
        .pl_downstream_deemph_source(pl_downstream_deemph_source),
        .pl_initial_link_width(pl_initial_link_width),
        .pl_lane_reversal_mode(pl_lane_reversal_mode),
        .pl_link_gen2_cap(pl_link_gen2_cap),
        .pl_link_partner_gen2_supported(pl_link_partner_gen2_supported),
        .pl_link_upcfg_cap(pl_link_upcfg_cap),
        .pl_ltssm_state(pl_ltssm_state),
        .pl_phy_lnk_up(pl_phy_lnk_up),
        .pl_received_hot_rst(pl_received_hot_rst_int),
        .pl_rx_pm_state(pl_rx_pm_state),
        .pl_sel_lnk_rate(pl_sel_lnk_rate),
        .pl_sel_lnk_width(pl_sel_lnk_width),
        .pl_transmit_hot_rst(pl_transmit_hot_rst),
        .pl_tx_pm_state(pl_tx_pm_state),
        .pl_upstream_prefer_deemph(pl_upstream_prefer_deemph),
        .rx_np_ok(rx_np_ok),
        .rx_np_req(rx_np_req),
        .s_axis_tx_tdata(s_axis_tx_tdata),
        .s_axis_tx_tkeep(s_axis_tx_tkeep),
        .s_axis_tx_tlast(s_axis_tx_tlast),
        .s_axis_tx_tuser(s_axis_tx_tuser),
        .s_axis_tx_tvalid(s_axis_tx_tvalid),
        .src_in(pl_phy_lnk_up_int),
        .sys_rst_n(sys_rst_n_0),
        .\tbuf_gap_cnt_reg[0] (user_reset_out),
        .tready_thrtl_xhdl1_reg(s_axis_tx_tready),
        .trn_lnk_up(trn_lnk_up),
        .trn_tbuf_av(tx_buf_av),
        .trn_tcfg_req(tx_cfg_req),
        .tx_cfg_gnt(tx_cfg_gnt),
        .tx_err_drop(tx_err_drop),
        .user_reset_int_reg(pcie_top_i_n_4));
  (* DEST_SYNC_FF = "2" *) 
  (* INIT_SYNC_FF = "0" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* SRC_INPUT_REG = "0" *) 
  (* VERSION = "0" *) 
  (* XPM_CDC = "SINGLE" *) 
  (* XPM_MODULE = "TRUE" *) 
  pcie_7x_0_xpm_cdc_single__2 pl_phy_lnk_up_cdc
       (.dest_clk(pipe_userclk2_in),
        .dest_out(pl_phy_lnk_up_sync),
        .src_clk(1'b0),
        .src_in(pl_phy_lnk_up_int));
  FDRE pl_phy_lnk_up_q_reg
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(pl_phy_lnk_up_sync),
        .Q(pl_phy_lnk_up),
        .R(gt_top_i_n_7));
  (* DEST_SYNC_FF = "2" *) 
  (* INIT_SYNC_FF = "0" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* SRC_INPUT_REG = "0" *) 
  (* VERSION = "0" *) 
  (* XPM_CDC = "SINGLE" *) 
  (* XPM_MODULE = "TRUE" *) 
  pcie_7x_0_xpm_cdc_single pl_received_hot_rst_cdc
       (.dest_clk(pipe_userclk2_in),
        .dest_out(pl_received_hot_rst_sync),
        .src_clk(1'b0),
        .src_in(pl_received_hot_rst_int));
  FDRE pl_received_hot_rst_q_reg
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(pl_received_hot_rst_sync),
        .Q(pl_received_hot_rst),
        .R(gt_top_i_n_7));
  LUT2 #(
    .INIT(4'hE)) 
    store_ltssm_inferred_i_1
       (.I0(store_ltssm_inferred_i_2_n_0),
        .I1(store_ltssm_inferred_i_3_n_0),
        .O(store_ltssm));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    store_ltssm_inferred_i_2
       (.I0(pl_ltssm_state[0]),
        .I1(ltssm_reg2[0]),
        .I2(ltssm_reg2[2]),
        .I3(pl_ltssm_state[2]),
        .I4(ltssm_reg2[1]),
        .I5(pl_ltssm_state[1]),
        .O(store_ltssm_inferred_i_2_n_0));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    store_ltssm_inferred_i_3
       (.I0(pl_ltssm_state[3]),
        .I1(ltssm_reg2[3]),
        .I2(ltssm_reg2[5]),
        .I3(pl_ltssm_state[5]),
        .I4(ltssm_reg2[4]),
        .I5(pl_ltssm_state[4]),
        .O(store_ltssm_inferred_i_3_n_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE user_lnk_up_d_reg
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(trn_lnk_up),
        .Q(user_lnk_up_d),
        .R(gt_top_i_n_7));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE user_lnk_up_int_reg
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(user_lnk_up_d),
        .Q(user_lnk_up_int),
        .R(gt_top_i_n_7));
  FDPE user_reset_int_reg
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(pcie_top_i_n_4),
        .PRE(user_reset_out_i_1_n_0),
        .Q(bridge_reset_int));
  LUT2 #(
    .INIT(4'hB)) 
    user_reset_out_i_1
       (.I0(pl_received_hot_rst),
        .I1(sys_rst_n),
        .O(user_reset_out_i_1_n_0));
  FDPE user_reset_out_reg
       (.C(pipe_userclk2_in),
        .CE(1'b1),
        .D(bridge_reset_int),
        .PRE(user_reset_out_i_1_n_0),
        .Q(user_reset_out));
endmodule

module pcie_7x_0_gt_common
   (QPLL_QPLLLOCK,
    QPLL_QPLLOUTCLK,
    QPLL_QPLLOUTREFCLK,
    QPLL_DRP_DONE,
    SR,
    pipe_dclk_in,
    sys_clk,
    QPLL_QPLLPD,
    QPLL_QPLLRESET,
    QRST_DRP_START,
    QPLL_DRP_GEN3);
  output QPLL_QPLLLOCK;
  output QPLL_QPLLOUTCLK;
  output QPLL_QPLLOUTREFCLK;
  output QPLL_DRP_DONE;
  input [0:0]SR;
  input pipe_dclk_in;
  input sys_clk;
  input QPLL_QPLLPD;
  input QPLL_QPLLRESET;
  input QRST_DRP_START;
  input QPLL_DRP_GEN3;

  wire QPLL_DRP_DONE;
  wire QPLL_DRP_GEN3;
  wire QPLL_QPLLLOCK;
  wire QPLL_QPLLOUTCLK;
  wire QPLL_QPLLOUTREFCLK;
  wire QPLL_QPLLPD;
  wire QPLL_QPLLRESET;
  wire QRST_DRP_START;
  wire [0:0]SR;
  wire pipe_dclk_in;
  wire [7:0]qpll_drp_addr;
  wire [15:0]qpll_drp_di;
  wire [15:0]qpll_drp_do;
  wire qpll_drp_en;
  wire qpll_drp_rdy;
  wire qpll_drp_we;
  wire sys_clk;

  pcie_7x_0_qpll_drp qpll_drp_i
       (.D(qpll_drp_do),
        .Q({qpll_drp_addr[7],qpll_drp_addr[5],qpll_drp_addr[2:0]}),
        .QPLL_DRP_DONE(QPLL_DRP_DONE),
        .QPLL_DRP_GEN3(QPLL_DRP_GEN3),
        .QPLL_QPLLLOCK(QPLL_QPLLLOCK),
        .QRST_DRP_START(QRST_DRP_START),
        .SR(SR),
        .\di_reg[15]_0 (qpll_drp_di),
        .pipe_dclk_in(pipe_dclk_in),
        .qpll_drp_en(qpll_drp_en),
        .qpll_drp_rdy(qpll_drp_rdy),
        .qpll_drp_we(qpll_drp_we));
  pcie_7x_0_qpll_wrapper qpll_wrapper_i
       (.D(qpll_drp_do),
        .Q({qpll_drp_addr[7],qpll_drp_addr[5],qpll_drp_addr[2:0]}),
        .QPLL_QPLLLOCK(QPLL_QPLLLOCK),
        .QPLL_QPLLOUTCLK(QPLL_QPLLOUTCLK),
        .QPLL_QPLLOUTREFCLK(QPLL_QPLLOUTREFCLK),
        .QPLL_QPLLPD(QPLL_QPLLPD),
        .QPLL_QPLLRESET(QPLL_QPLLRESET),
        .\gtx_common.gtxe2_common_i_0 (qpll_drp_di),
        .pipe_dclk_in(pipe_dclk_in),
        .qpll_drp_en(qpll_drp_en),
        .qpll_drp_rdy(qpll_drp_rdy),
        .qpll_drp_we(qpll_drp_we),
        .sys_clk(sys_clk));
endmodule

module pcie_7x_0_gt_rx_valid_filter_7x
   (gt_rxvalid_q_reg_0,
    pipe_rx0_elec_idle,
    pipe_rx0_phy_status,
    \pl_ltssm_state_q_reg[5] ,
    Q,
    pipe_rx0_char_is_k,
    \gt_rx_status_q_reg[2]_0 ,
    SR,
    pipe_pclk_in,
    PIPE_RXELECIDLE,
    PIPE_PHYSTATUS,
    gt_rxvalid_q_reg_1,
    gt_rxvalid_q_reg_2,
    D,
    \gt_rxcharisk_q_reg[1]_0 ,
    \gt_rx_status_q_reg[2]_1 );
  output gt_rxvalid_q_reg_0;
  output pipe_rx0_elec_idle;
  output pipe_rx0_phy_status;
  output \pl_ltssm_state_q_reg[5] ;
  output [15:0]Q;
  output [1:0]pipe_rx0_char_is_k;
  output [2:0]\gt_rx_status_q_reg[2]_0 ;
  input [0:0]SR;
  input pipe_pclk_in;
  input PIPE_RXELECIDLE;
  input PIPE_PHYSTATUS;
  input gt_rxvalid_q_reg_1;
  input [5:0]gt_rxvalid_q_reg_2;
  input [15:0]D;
  input [1:0]\gt_rxcharisk_q_reg[1]_0 ;
  input [2:0]\gt_rx_status_q_reg[2]_1 ;

  wire [15:0]D;
  wire \FSM_onehot_reg_state_eios_det[1]_i_1_n_0 ;
  wire \FSM_onehot_reg_state_eios_det[1]_i_2_n_0 ;
  wire \FSM_onehot_reg_state_eios_det[1]_i_3_n_0 ;
  wire \FSM_onehot_reg_state_eios_det[2]_i_1_n_0 ;
  wire \FSM_onehot_reg_state_eios_det[3]_i_1_n_0 ;
  wire \FSM_onehot_reg_state_eios_det[3]_i_2_n_0 ;
  wire \FSM_onehot_reg_state_eios_det[3]_i_3_n_0 ;
  wire \FSM_onehot_reg_state_eios_det[3]_i_4_n_0 ;
  wire \FSM_onehot_reg_state_eios_det[3]_i_5_n_0 ;
  wire \FSM_onehot_reg_state_eios_det[5]_i_1_n_0 ;
  wire \FSM_onehot_reg_state_eios_det[5]_i_2_n_0 ;
  wire \FSM_onehot_reg_state_eios_det[5]_i_3_n_0 ;
  wire \FSM_onehot_reg_state_eios_det_reg_n_0_[1] ;
  wire \FSM_onehot_reg_state_eios_det_reg_n_0_[2] ;
  wire \FSM_onehot_reg_state_eios_det_reg_n_0_[3] ;
  wire \FSM_onehot_reg_state_eios_det_reg_n_0_[5] ;
  wire PIPE_PHYSTATUS;
  wire PIPE_RXELECIDLE;
  wire [15:0]Q;
  wire [0:0]SR;
  wire [2:0]\gt_rx_status_q_reg[2]_0 ;
  wire [2:0]\gt_rx_status_q_reg[2]_1 ;
  wire [1:0]\gt_rxcharisk_q_reg[1]_0 ;
  wire \gt_rxcharisk_q_reg_n_0_[0] ;
  wire gt_rxvalid_q;
  wire gt_rxvalid_q_i_4_n_0;
  wire gt_rxvalid_q_i_5_n_0;
  wire gt_rxvalid_q_reg_0;
  wire gt_rxvalid_q_reg_1;
  wire [5:0]gt_rxvalid_q_reg_2;
  wire p_0_in;
  wire pipe_pclk_in;
  wire [1:0]pipe_rx0_char_is_k;
  wire pipe_rx0_elec_idle;
  wire pipe_rx0_phy_status;
  wire \pl_ltssm_state_q_reg[5] ;
  wire reg_symbol_after_eios_i_1_n_0;
  wire reg_symbol_after_eios_i_2_n_0;
  wire symbol_after_eios;

  LUT4 #(
    .INIT(16'hFF80)) 
    \FSM_onehot_reg_state_eios_det[1]_i_1 
       (.I0(\FSM_onehot_reg_state_eios_det_reg_n_0_[1] ),
        .I1(\FSM_onehot_reg_state_eios_det[3]_i_2_n_0 ),
        .I2(\FSM_onehot_reg_state_eios_det[3]_i_3_n_0 ),
        .I3(\FSM_onehot_reg_state_eios_det[1]_i_2_n_0 ),
        .O(\FSM_onehot_reg_state_eios_det[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFC5CCFFFFF5FC)) 
    \FSM_onehot_reg_state_eios_det[1]_i_2 
       (.I0(\FSM_onehot_reg_state_eios_det_reg_n_0_[1] ),
        .I1(\FSM_onehot_reg_state_eios_det[5]_i_2_n_0 ),
        .I2(\FSM_onehot_reg_state_eios_det_reg_n_0_[3] ),
        .I3(\FSM_onehot_reg_state_eios_det[1]_i_3_n_0 ),
        .I4(\FSM_onehot_reg_state_eios_det_reg_n_0_[5] ),
        .I5(reg_symbol_after_eios_i_2_n_0),
        .O(\FSM_onehot_reg_state_eios_det[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \FSM_onehot_reg_state_eios_det[1]_i_3 
       (.I0(symbol_after_eios),
        .I1(\FSM_onehot_reg_state_eios_det_reg_n_0_[2] ),
        .O(\FSM_onehot_reg_state_eios_det[1]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \FSM_onehot_reg_state_eios_det[2]_i_1 
       (.I0(\FSM_onehot_reg_state_eios_det_reg_n_0_[1] ),
        .I1(\FSM_onehot_reg_state_eios_det[3]_i_2_n_0 ),
        .O(\FSM_onehot_reg_state_eios_det[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \FSM_onehot_reg_state_eios_det[3]_i_1 
       (.I0(\FSM_onehot_reg_state_eios_det_reg_n_0_[1] ),
        .I1(\FSM_onehot_reg_state_eios_det[3]_i_2_n_0 ),
        .I2(\FSM_onehot_reg_state_eios_det[3]_i_3_n_0 ),
        .O(\FSM_onehot_reg_state_eios_det[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBFFFFFFFFFFFFFFF)) 
    \FSM_onehot_reg_state_eios_det[3]_i_2 
       (.I0(\FSM_onehot_reg_state_eios_det[3]_i_4_n_0 ),
        .I1(Q[3]),
        .I2(Q[5]),
        .I3(Q[2]),
        .I4(Q[4]),
        .I5(reg_symbol_after_eios_i_2_n_0),
        .O(\FSM_onehot_reg_state_eios_det[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFEFFFFFFF)) 
    \FSM_onehot_reg_state_eios_det[3]_i_3 
       (.I0(\FSM_onehot_reg_state_eios_det[3]_i_5_n_0 ),
        .I1(Q[8]),
        .I2(Q[11]),
        .I3(Q[10]),
        .I4(Q[15]),
        .I5(Q[14]),
        .O(\FSM_onehot_reg_state_eios_det[3]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFDFFFF)) 
    \FSM_onehot_reg_state_eios_det[3]_i_4 
       (.I0(\gt_rxcharisk_q_reg_n_0_[0] ),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[6]),
        .I4(Q[7]),
        .O(\FSM_onehot_reg_state_eios_det[3]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFF7F)) 
    \FSM_onehot_reg_state_eios_det[3]_i_5 
       (.I0(p_0_in),
        .I1(Q[13]),
        .I2(Q[12]),
        .I3(Q[9]),
        .O(\FSM_onehot_reg_state_eios_det[3]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h54)) 
    \FSM_onehot_reg_state_eios_det[5]_i_1 
       (.I0(\FSM_onehot_reg_state_eios_det[5]_i_2_n_0 ),
        .I1(\FSM_onehot_reg_state_eios_det_reg_n_0_[2] ),
        .I2(symbol_after_eios),
        .O(\FSM_onehot_reg_state_eios_det[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFEFFFFFFFFF)) 
    \FSM_onehot_reg_state_eios_det[5]_i_2 
       (.I0(\FSM_onehot_reg_state_eios_det[5]_i_3_n_0 ),
        .I1(Q[7]),
        .I2(Q[6]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\gt_rxcharisk_q_reg_n_0_[0] ),
        .O(\FSM_onehot_reg_state_eios_det[5]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \FSM_onehot_reg_state_eios_det[5]_i_3 
       (.I0(Q[3]),
        .I1(Q[5]),
        .I2(Q[2]),
        .I3(Q[4]),
        .O(\FSM_onehot_reg_state_eios_det[5]_i_3_n_0 ));
  (* FSM_ENCODED_STATES = "eios_det_no_str0:000100,eios_det_str0:001000,eios_det_str1:010000,eios_det_idl:000010,eios_det_done:100000,iSTATE:000001" *) 
  FDSE #(
    .INIT(1'b0)) 
    \FSM_onehot_reg_state_eios_det_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\FSM_onehot_reg_state_eios_det[1]_i_1_n_0 ),
        .Q(\FSM_onehot_reg_state_eios_det_reg_n_0_[1] ),
        .S(SR));
  (* FSM_ENCODED_STATES = "eios_det_no_str0:000100,eios_det_str0:001000,eios_det_str1:010000,eios_det_idl:000010,eios_det_done:100000,iSTATE:000001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_reg_state_eios_det_reg[2] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\FSM_onehot_reg_state_eios_det[2]_i_1_n_0 ),
        .Q(\FSM_onehot_reg_state_eios_det_reg_n_0_[2] ),
        .R(SR));
  (* FSM_ENCODED_STATES = "eios_det_no_str0:000100,eios_det_str0:001000,eios_det_str1:010000,eios_det_idl:000010,eios_det_done:100000,iSTATE:000001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_reg_state_eios_det_reg[3] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\FSM_onehot_reg_state_eios_det[3]_i_1_n_0 ),
        .Q(\FSM_onehot_reg_state_eios_det_reg_n_0_[3] ),
        .R(SR));
  (* FSM_ENCODED_STATES = "eios_det_no_str0:000100,eios_det_str0:001000,eios_det_str1:010000,eios_det_idl:000010,eios_det_done:100000,iSTATE:000001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_reg_state_eios_det_reg[5] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\FSM_onehot_reg_state_eios_det[5]_i_1_n_0 ),
        .Q(\FSM_onehot_reg_state_eios_det_reg_n_0_[5] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    gt_rx_phy_status_q_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(PIPE_PHYSTATUS),
        .Q(pipe_rx0_phy_status),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gt_rx_status_q_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\gt_rx_status_q_reg[2]_1 [0]),
        .Q(\gt_rx_status_q_reg[2]_0 [0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gt_rx_status_q_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\gt_rx_status_q_reg[2]_1 [1]),
        .Q(\gt_rx_status_q_reg[2]_0 [1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gt_rx_status_q_reg[2] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\gt_rx_status_q_reg[2]_1 [2]),
        .Q(\gt_rx_status_q_reg[2]_0 [2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gt_rxcharisk_q_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\gt_rxcharisk_q_reg[1]_0 [0]),
        .Q(\gt_rxcharisk_q_reg_n_0_[0] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gt_rxcharisk_q_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\gt_rxcharisk_q_reg[1]_0 [1]),
        .Q(p_0_in),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gt_rxdata_q_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(D[0]),
        .Q(Q[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gt_rxdata_q_reg[10] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(D[10]),
        .Q(Q[10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gt_rxdata_q_reg[11] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(D[11]),
        .Q(Q[11]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gt_rxdata_q_reg[12] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(D[12]),
        .Q(Q[12]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gt_rxdata_q_reg[13] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(D[13]),
        .Q(Q[13]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gt_rxdata_q_reg[14] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(D[14]),
        .Q(Q[14]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gt_rxdata_q_reg[15] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(D[15]),
        .Q(Q[15]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gt_rxdata_q_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(D[1]),
        .Q(Q[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gt_rxdata_q_reg[2] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(D[2]),
        .Q(Q[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gt_rxdata_q_reg[3] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(D[3]),
        .Q(Q[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gt_rxdata_q_reg[4] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(D[4]),
        .Q(Q[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gt_rxdata_q_reg[5] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(D[5]),
        .Q(Q[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gt_rxdata_q_reg[6] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(D[6]),
        .Q(Q[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gt_rxdata_q_reg[7] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(D[7]),
        .Q(Q[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gt_rxdata_q_reg[8] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(D[8]),
        .Q(Q[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \gt_rxdata_q_reg[9] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(D[9]),
        .Q(Q[9]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    gt_rxelecidle_q_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(PIPE_RXELECIDLE),
        .Q(pipe_rx0_elec_idle),
        .R(SR));
  LUT5 #(
    .INIT(32'h45004545)) 
    gt_rxvalid_q_i_1
       (.I0(gt_rxvalid_q_reg_1),
        .I1(\pl_ltssm_state_q_reg[5] ),
        .I2(\FSM_onehot_reg_state_eios_det_reg_n_0_[5] ),
        .I3(gt_rxvalid_q_i_4_n_0),
        .I4(gt_rxvalid_q_i_5_n_0),
        .O(gt_rxvalid_q));
  LUT6 #(
    .INIT(64'hFEFFFFFFFFFFFFFF)) 
    gt_rxvalid_q_i_3
       (.I0(gt_rxvalid_q_reg_2[5]),
        .I1(gt_rxvalid_q_reg_2[0]),
        .I2(gt_rxvalid_q_reg_2[3]),
        .I3(gt_rxvalid_q_reg_2[2]),
        .I4(gt_rxvalid_q_reg_2[1]),
        .I5(gt_rxvalid_q_reg_2[4]),
        .O(\pl_ltssm_state_q_reg[5] ));
  LUT6 #(
    .INIT(64'hFEFEFEFCFEFEFEFF)) 
    gt_rxvalid_q_i_4
       (.I0(\FSM_onehot_reg_state_eios_det[5]_i_2_n_0 ),
        .I1(\FSM_onehot_reg_state_eios_det_reg_n_0_[5] ),
        .I2(\FSM_onehot_reg_state_eios_det_reg_n_0_[1] ),
        .I3(symbol_after_eios),
        .I4(\FSM_onehot_reg_state_eios_det_reg_n_0_[2] ),
        .I5(\FSM_onehot_reg_state_eios_det_reg_n_0_[3] ),
        .O(gt_rxvalid_q_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h2F)) 
    gt_rxvalid_q_i_5
       (.I0(reg_symbol_after_eios_i_2_n_0),
        .I1(\FSM_onehot_reg_state_eios_det[5]_i_2_n_0 ),
        .I2(\FSM_onehot_reg_state_eios_det_reg_n_0_[3] ),
        .O(gt_rxvalid_q_i_5_n_0));
  FDRE #(
    .INIT(1'b0)) 
    gt_rxvalid_q_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(gt_rxvalid_q),
        .Q(gt_rxvalid_q_reg_0),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h08)) 
    pcie_block_i_i_32
       (.I0(p_0_in),
        .I1(gt_rxvalid_q_reg_0),
        .I2(symbol_after_eios),
        .O(pipe_rx0_char_is_k[1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h8)) 
    pcie_block_i_i_33
       (.I0(gt_rxvalid_q_reg_0),
        .I1(\gt_rxcharisk_q_reg_n_0_[0] ),
        .O(pipe_rx0_char_is_k[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h20)) 
    reg_symbol_after_eios_i_1
       (.I0(reg_symbol_after_eios_i_2_n_0),
        .I1(\FSM_onehot_reg_state_eios_det[5]_i_2_n_0 ),
        .I2(\FSM_onehot_reg_state_eios_det_reg_n_0_[3] ),
        .O(reg_symbol_after_eios_i_1_n_0));
  LUT6 #(
    .INIT(64'h0004000000000000)) 
    reg_symbol_after_eios_i_2
       (.I0(Q[15]),
        .I1(Q[14]),
        .I2(\FSM_onehot_reg_state_eios_det[3]_i_5_n_0 ),
        .I3(Q[8]),
        .I4(Q[11]),
        .I5(Q[10]),
        .O(reg_symbol_after_eios_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    reg_symbol_after_eios_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(reg_symbol_after_eios_i_1_n_0),
        .Q(symbol_after_eios),
        .R(SR));
endmodule

module pcie_7x_0_gt_top
   (QPLL_DRP_GEN3,
    pipe_pclk_sel_out,
    pci_exp_txn,
    pci_exp_txp,
    pipe_rx0_chanisaligned,
    pipe_rxoutclk_out,
    pipe_txoutclk_out,
    sys_rst_n_0,
    pipe_rx0_valid_gt,
    pipe_rx0_elec_idle,
    pipe_rx0_phy_status,
    sys_rst_n,
    Q,
    \gt_rx_status_q_reg[2] ,
    pipe_rx0_char_is_k,
    pipe_mmcm_lock_in,
    pipe_pclk_in,
    pipe_rxusrclk_in,
    pipe_dclk_in,
    pipe_tx0_elec_idle,
    pipe_tx0_compliance,
    sys_clk,
    pci_exp_rxn,
    pci_exp_rxp,
    pipe_rx0_polarity,
    pipe_tx_deemph,
    pipe_tx_rcvr_det,
    pipe_tx0_powerdown,
    pipe_tx_margin,
    pipe_tx0_data,
    pipe_tx0_char_is_k,
    pipe_oobclk_in,
    reset_n_reg2_reg,
    pipe_tx_rate,
    pl_ltssm_state);
  output QPLL_DRP_GEN3;
  output [0:0]pipe_pclk_sel_out;
  output [0:0]pci_exp_txn;
  output [0:0]pci_exp_txp;
  output pipe_rx0_chanisaligned;
  output [0:0]pipe_rxoutclk_out;
  output pipe_txoutclk_out;
  output sys_rst_n_0;
  output pipe_rx0_valid_gt;
  output pipe_rx0_elec_idle;
  output pipe_rx0_phy_status;
  output sys_rst_n;
  output [15:0]Q;
  output [2:0]\gt_rx_status_q_reg[2] ;
  output [1:0]pipe_rx0_char_is_k;
  input pipe_mmcm_lock_in;
  input pipe_pclk_in;
  input pipe_rxusrclk_in;
  input pipe_dclk_in;
  input pipe_tx0_elec_idle;
  input pipe_tx0_compliance;
  input sys_clk;
  input [0:0]pci_exp_rxn;
  input [0:0]pci_exp_rxp;
  input pipe_rx0_polarity;
  input pipe_tx_deemph;
  input pipe_tx_rcvr_det;
  input [1:0]pipe_tx0_powerdown;
  input [2:0]pipe_tx_margin;
  input [15:0]pipe_tx0_data;
  input [1:0]pipe_tx0_char_is_k;
  input pipe_oobclk_in;
  input reset_n_reg2_reg;
  input pipe_tx_rate;
  input [5:0]pl_ltssm_state;

  wire PIPE_PHYSTATUS;
  wire [15:0]PIPE_RXDATA;
  wire [1:0]PIPE_RXDATAK;
  wire PIPE_RXELECIDLE;
  wire [15:0]Q;
  wire QPLL_DRP_GEN3;
  wire [2:0]\gt_rx_status_q_reg[2] ;
  wire \gt_rx_valid_filter[0].GT_RX_VALID_FILTER_7x_inst_n_3 ;
  wire [0:0]pci_exp_rxn;
  wire [0:0]pci_exp_rxp;
  wire [0:0]pci_exp_txn;
  wire [0:0]pci_exp_txp;
  wire phy_rdy_n;
  wire pipe_dclk_in;
  wire pipe_mmcm_lock_in;
  wire pipe_oobclk_in;
  wire pipe_pclk_in;
  wire [0:0]pipe_pclk_sel_out;
  wire pipe_rx0_chanisaligned;
  wire [1:0]pipe_rx0_char_is_k;
  wire pipe_rx0_elec_idle;
  wire pipe_rx0_phy_status;
  wire pipe_rx0_polarity;
  wire pipe_rx0_valid_gt;
  wire [0:0]pipe_rxoutclk_out;
  wire pipe_rxusrclk_in;
  wire [1:0]pipe_tx0_char_is_k;
  wire pipe_tx0_compliance;
  wire [15:0]pipe_tx0_data;
  wire pipe_tx0_elec_idle;
  wire [1:0]pipe_tx0_powerdown;
  wire pipe_tx_deemph;
  wire [2:0]pipe_tx_margin;
  wire pipe_tx_rate;
  wire pipe_tx_rcvr_det;
  wire pipe_txoutclk_out;
  wire pipe_wrapper_i_n_27;
  wire pipe_wrapper_i_n_28;
  wire pipe_wrapper_i_n_29;
  wire pipe_wrapper_i_n_30;
  wire pipe_wrapper_i_n_31;
  wire [5:0]pl_ltssm_state;
  wire [5:0]pl_ltssm_state_q;
  wire reg_clock_locked;
  wire reg_clock_locked_i_1_n_0;
  wire reset_n_reg2_reg;
  wire sys_clk;
  wire sys_rst_n;
  wire sys_rst_n_0;

  pcie_7x_0_gt_rx_valid_filter_7x \gt_rx_valid_filter[0].GT_RX_VALID_FILTER_7x_inst 
       (.D(PIPE_RXDATA),
        .PIPE_PHYSTATUS(PIPE_PHYSTATUS),
        .PIPE_RXELECIDLE(PIPE_RXELECIDLE),
        .Q(Q),
        .SR(phy_rdy_n),
        .\gt_rx_status_q_reg[2]_0 (\gt_rx_status_q_reg[2] ),
        .\gt_rx_status_q_reg[2]_1 ({pipe_wrapper_i_n_29,pipe_wrapper_i_n_30,pipe_wrapper_i_n_31}),
        .\gt_rxcharisk_q_reg[1]_0 (PIPE_RXDATAK),
        .gt_rxvalid_q_reg_0(pipe_rx0_valid_gt),
        .gt_rxvalid_q_reg_1(pipe_wrapper_i_n_27),
        .gt_rxvalid_q_reg_2(pl_ltssm_state_q),
        .pipe_pclk_in(pipe_pclk_in),
        .pipe_rx0_char_is_k(pipe_rx0_char_is_k),
        .pipe_rx0_elec_idle(pipe_rx0_elec_idle),
        .pipe_rx0_phy_status(pipe_rx0_phy_status),
        .\pl_ltssm_state_q_reg[5] (\gt_rx_valid_filter[0].GT_RX_VALID_FILTER_7x_inst_n_3 ));
  LUT1 #(
    .INIT(2'h1)) 
    pcie_block_i_i_29
       (.I0(phy_rdy_n),
        .O(sys_rst_n));
  FDRE #(
    .INIT(1'b0)) 
    phy_rdy_n_int_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(pipe_wrapper_i_n_28),
        .Q(phy_rdy_n),
        .R(1'b0));
  pcie_7x_0_pipe_wrapper pipe_wrapper_i
       (.D(PIPE_RXDATA),
        .PIPE_PHYSTATUS(PIPE_PHYSTATUS),
        .PIPE_RXELECIDLE(PIPE_RXELECIDLE),
        .gen3_reg(QPLL_DRP_GEN3),
        .\gt_rx_status_q_reg[0] (pipe_rx0_valid_gt),
        .\gt_rx_status_q_reg[2] (\gt_rx_valid_filter[0].GT_RX_VALID_FILTER_7x_inst_n_3 ),
        .\gtx_channel.gtxe2_channel_i (PIPE_RXDATAK),
        .\gtx_channel.gtxe2_channel_i_0 ({pipe_wrapper_i_n_29,pipe_wrapper_i_n_30,pipe_wrapper_i_n_31}),
        .pci_exp_rxn(pci_exp_rxn),
        .pci_exp_rxp(pci_exp_rxp),
        .pci_exp_txn(pci_exp_txn),
        .pci_exp_txp(pci_exp_txp),
        .pipe_dclk_in(pipe_dclk_in),
        .pipe_mmcm_lock_in(pipe_mmcm_lock_in),
        .pipe_oobclk_in(pipe_oobclk_in),
        .pipe_pclk_in(pipe_pclk_in),
        .pipe_pclk_sel_out(pipe_pclk_sel_out),
        .pipe_rx0_chanisaligned(pipe_rx0_chanisaligned),
        .pipe_rx0_polarity(pipe_rx0_polarity),
        .pipe_rxoutclk_out(pipe_rxoutclk_out),
        .pipe_rxusrclk_in(pipe_rxusrclk_in),
        .pipe_tx0_char_is_k(pipe_tx0_char_is_k),
        .pipe_tx0_compliance(pipe_tx0_compliance),
        .pipe_tx0_data(pipe_tx0_data),
        .pipe_tx0_elec_idle(pipe_tx0_elec_idle),
        .pipe_tx0_powerdown(pipe_tx0_powerdown),
        .pipe_tx_deemph(pipe_tx_deemph),
        .pipe_tx_margin(pipe_tx_margin),
        .pipe_tx_rate(pipe_tx_rate),
        .pipe_tx_rcvr_det(pipe_tx_rcvr_det),
        .pipe_txoutclk_out(pipe_txoutclk_out),
        .rate_idle_reg2_reg(pipe_wrapper_i_n_27),
        .reg_clock_locked(reg_clock_locked),
        .reg_clock_locked_reg(pipe_wrapper_i_n_28),
        .reset_n_reg2_reg_0(reset_n_reg2_reg),
        .sys_clk(sys_clk),
        .sys_rst_n(sys_rst_n_0));
  FDCE #(
    .INIT(1'b0)) 
    \pl_ltssm_state_q_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .CLR(reg_clock_locked_i_1_n_0),
        .D(pl_ltssm_state[0]),
        .Q(pl_ltssm_state_q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \pl_ltssm_state_q_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .CLR(reg_clock_locked_i_1_n_0),
        .D(pl_ltssm_state[1]),
        .Q(pl_ltssm_state_q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \pl_ltssm_state_q_reg[2] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .CLR(reg_clock_locked_i_1_n_0),
        .D(pl_ltssm_state[2]),
        .Q(pl_ltssm_state_q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \pl_ltssm_state_q_reg[3] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .CLR(reg_clock_locked_i_1_n_0),
        .D(pl_ltssm_state[3]),
        .Q(pl_ltssm_state_q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \pl_ltssm_state_q_reg[4] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .CLR(reg_clock_locked_i_1_n_0),
        .D(pl_ltssm_state[4]),
        .Q(pl_ltssm_state_q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \pl_ltssm_state_q_reg[5] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .CLR(reg_clock_locked_i_1_n_0),
        .D(pl_ltssm_state[5]),
        .Q(pl_ltssm_state_q[5]));
  LUT1 #(
    .INIT(2'h1)) 
    reg_clock_locked_i_1
       (.I0(pipe_mmcm_lock_in),
        .O(reg_clock_locked_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    reg_clock_locked_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .CLR(reg_clock_locked_i_1_n_0),
        .D(1'b1),
        .Q(reg_clock_locked));
endmodule

module pcie_7x_0_gt_wrapper
   (cpllrst,
    QRST_CPLLLOCK,
    \gtx_channel.gtxe2_channel_i_0 ,
    pci_exp_txn,
    pci_exp_txp,
    gt_phystatus,
    gt_rxcdrlock,
    pipe_rx0_chanisaligned,
    \gtx_channel.gtxe2_channel_i_1 ,
    PIPE_RXELECIDLE,
    pipe_rxoutclk_out,
    \gtx_channel.gtxe2_channel_i_2 ,
    gt_rxratedone,
    gt_rxresetdone_0,
    gt_rxvalid,
    \gtx_channel.gtxe2_channel_i_3 ,
    pipe_txoutclk_out,
    \gtx_channel.gtxe2_channel_i_4 ,
    \gtx_channel.gtxe2_channel_i_5 ,
    gt_txratedone,
    gt_txresetdone_0,
    D,
    RXSTATUS,
    \gtx_channel.gtxe2_channel_i_6 ,
    \gtx_channel.gtxe2_channel_i_7 ,
    \gtx_channel.gtxe2_channel_i_8 ,
    gt_cpllpdrefclk,
    CPLLRESET0,
    pipe_dclk_in,
    \gtx_channel.gtxe2_channel_i_9 ,
    \gtx_channel.gtxe2_channel_i_10 ,
    sys_clk,
    rst_gtreset,
    pci_exp_rxn,
    pci_exp_rxp,
    QPLL_QPLLOUTCLK,
    QPLL_QPLLOUTREFCLK,
    RX8B10BEN0,
    user_rx_converge,
    rate_rxpmareset,
    pipe_rx0_polarity,
    rst_userrdy,
    pipe_rxusrclk_in,
    pipe_tx_deemph,
    pipe_tx_rcvr_det,
    sync_txdlyen,
    Q,
    pipe_tx0_elec_idle,
    pipe_pclk_in,
    DRPDI,
    pipe_tx0_powerdown,
    RXSYSCLKSEL,
    RXRATE,
    pipe_tx_margin,
    CLKRSVD,
    TXPOSTCURSOR,
    TXPRECURSOR,
    pipe_tx0_data,
    TXMAINCURSOR,
    pipe_tx0_compliance,
    pipe_tx0_char_is_k,
    DRPADDR,
    rate_cpllpd,
    \gt_rx_status_q_reg[2] ,
    \gt_rx_status_q_reg[0] );
  output cpllrst;
  output [0:0]QRST_CPLLLOCK;
  output \gtx_channel.gtxe2_channel_i_0 ;
  output [0:0]pci_exp_txn;
  output [0:0]pci_exp_txp;
  output gt_phystatus;
  output gt_rxcdrlock;
  output pipe_rx0_chanisaligned;
  output \gtx_channel.gtxe2_channel_i_1 ;
  output PIPE_RXELECIDLE;
  output [0:0]pipe_rxoutclk_out;
  output \gtx_channel.gtxe2_channel_i_2 ;
  output gt_rxratedone;
  output gt_rxresetdone_0;
  output gt_rxvalid;
  output \gtx_channel.gtxe2_channel_i_3 ;
  output pipe_txoutclk_out;
  output \gtx_channel.gtxe2_channel_i_4 ;
  output \gtx_channel.gtxe2_channel_i_5 ;
  output gt_txratedone;
  output gt_txresetdone_0;
  output [15:0]D;
  output [0:0]RXSTATUS;
  output [15:0]\gtx_channel.gtxe2_channel_i_6 ;
  output [1:0]\gtx_channel.gtxe2_channel_i_7 ;
  output [2:0]\gtx_channel.gtxe2_channel_i_8 ;
  input gt_cpllpdrefclk;
  input CPLLRESET0;
  input pipe_dclk_in;
  input \gtx_channel.gtxe2_channel_i_9 ;
  input \gtx_channel.gtxe2_channel_i_10 ;
  input sys_clk;
  input rst_gtreset;
  input [0:0]pci_exp_rxn;
  input [0:0]pci_exp_rxp;
  input QPLL_QPLLOUTCLK;
  input QPLL_QPLLOUTREFCLK;
  input RX8B10BEN0;
  input user_rx_converge;
  input rate_rxpmareset;
  input pipe_rx0_polarity;
  input rst_userrdy;
  input pipe_rxusrclk_in;
  input pipe_tx_deemph;
  input pipe_tx_rcvr_det;
  input sync_txdlyen;
  input [2:0]Q;
  input pipe_tx0_elec_idle;
  input pipe_pclk_in;
  input [15:0]DRPDI;
  input [1:0]pipe_tx0_powerdown;
  input [0:0]RXSYSCLKSEL;
  input [0:0]RXRATE;
  input [2:0]pipe_tx_margin;
  input [0:0]CLKRSVD;
  input [4:0]TXPOSTCURSOR;
  input [4:0]TXPRECURSOR;
  input [15:0]pipe_tx0_data;
  input [6:0]TXMAINCURSOR;
  input pipe_tx0_compliance;
  input [1:0]pipe_tx0_char_is_k;
  input [7:0]DRPADDR;
  input rate_cpllpd;
  input \gt_rx_status_q_reg[2] ;
  input \gt_rx_status_q_reg[0] ;

  wire [0:0]CLKRSVD;
  wire CPLLPD0;
  wire CPLLRESET0;
  wire [15:0]D;
  wire [7:0]DRPADDR;
  wire [15:0]DRPDI;
  wire PIPE_RXELECIDLE;
  wire [2:0]Q;
  wire QPLL_QPLLOUTCLK;
  wire QPLL_QPLLOUTREFCLK;
  wire [0:0]QRST_CPLLLOCK;
  wire RX8B10BEN0;
  wire [0:0]RXRATE;
  wire [0:0]RXSTATUS;
  wire [0:0]RXSYSCLKSEL;
  wire [6:0]TXMAINCURSOR;
  wire [4:0]TXPOSTCURSOR;
  wire [4:0]TXPRECURSOR;
  wire cpllrst;
  wire gt_cpllpdrefclk;
  wire gt_phystatus;
  wire \gt_rx_status_q_reg[0] ;
  wire \gt_rx_status_q_reg[2] ;
  wire gt_rxcdrlock;
  wire gt_rxratedone;
  wire gt_rxresetdone_0;
  wire gt_rxvalid;
  wire gt_txratedone;
  wire gt_txresetdone_0;
  wire \gtx_channel.gtxe2_channel_i_0 ;
  wire \gtx_channel.gtxe2_channel_i_1 ;
  wire \gtx_channel.gtxe2_channel_i_10 ;
  wire \gtx_channel.gtxe2_channel_i_2 ;
  wire \gtx_channel.gtxe2_channel_i_3 ;
  wire \gtx_channel.gtxe2_channel_i_4 ;
  wire \gtx_channel.gtxe2_channel_i_5 ;
  wire [15:0]\gtx_channel.gtxe2_channel_i_6 ;
  wire [1:0]\gtx_channel.gtxe2_channel_i_7 ;
  wire [2:0]\gtx_channel.gtxe2_channel_i_8 ;
  wire \gtx_channel.gtxe2_channel_i_9 ;
  wire \gtx_channel.gtxe2_channel_i_n_10 ;
  wire \gtx_channel.gtxe2_channel_i_n_138 ;
  wire \gtx_channel.gtxe2_channel_i_n_139 ;
  wire \gtx_channel.gtxe2_channel_i_n_140 ;
  wire \gtx_channel.gtxe2_channel_i_n_141 ;
  wire \gtx_channel.gtxe2_channel_i_n_142 ;
  wire \gtx_channel.gtxe2_channel_i_n_143 ;
  wire \gtx_channel.gtxe2_channel_i_n_144 ;
  wire \gtx_channel.gtxe2_channel_i_n_145 ;
  wire \gtx_channel.gtxe2_channel_i_n_146 ;
  wire \gtx_channel.gtxe2_channel_i_n_147 ;
  wire \gtx_channel.gtxe2_channel_i_n_148 ;
  wire \gtx_channel.gtxe2_channel_i_n_149 ;
  wire \gtx_channel.gtxe2_channel_i_n_150 ;
  wire \gtx_channel.gtxe2_channel_i_n_151 ;
  wire \gtx_channel.gtxe2_channel_i_n_152 ;
  wire \gtx_channel.gtxe2_channel_i_n_153 ;
  wire \gtx_channel.gtxe2_channel_i_n_16 ;
  wire \gtx_channel.gtxe2_channel_i_n_177 ;
  wire \gtx_channel.gtxe2_channel_i_n_178 ;
  wire \gtx_channel.gtxe2_channel_i_n_179 ;
  wire \gtx_channel.gtxe2_channel_i_n_180 ;
  wire \gtx_channel.gtxe2_channel_i_n_181 ;
  wire \gtx_channel.gtxe2_channel_i_n_182 ;
  wire \gtx_channel.gtxe2_channel_i_n_183 ;
  wire \gtx_channel.gtxe2_channel_i_n_184 ;
  wire \gtx_channel.gtxe2_channel_i_n_189 ;
  wire \gtx_channel.gtxe2_channel_i_n_190 ;
  wire \gtx_channel.gtxe2_channel_i_n_191 ;
  wire \gtx_channel.gtxe2_channel_i_n_192 ;
  wire \gtx_channel.gtxe2_channel_i_n_197 ;
  wire \gtx_channel.gtxe2_channel_i_n_198 ;
  wire \gtx_channel.gtxe2_channel_i_n_201 ;
  wire \gtx_channel.gtxe2_channel_i_n_202 ;
  wire \gtx_channel.gtxe2_channel_i_n_203 ;
  wire \gtx_channel.gtxe2_channel_i_n_204 ;
  wire \gtx_channel.gtxe2_channel_i_n_205 ;
  wire \gtx_channel.gtxe2_channel_i_n_206 ;
  wire \gtx_channel.gtxe2_channel_i_n_207 ;
  wire \gtx_channel.gtxe2_channel_i_n_208 ;
  wire \gtx_channel.gtxe2_channel_i_n_209 ;
  wire \gtx_channel.gtxe2_channel_i_n_210 ;
  wire \gtx_channel.gtxe2_channel_i_n_211 ;
  wire \gtx_channel.gtxe2_channel_i_n_212 ;
  wire \gtx_channel.gtxe2_channel_i_n_213 ;
  wire \gtx_channel.gtxe2_channel_i_n_214 ;
  wire \gtx_channel.gtxe2_channel_i_n_215 ;
  wire \gtx_channel.gtxe2_channel_i_n_216 ;
  wire \gtx_channel.gtxe2_channel_i_n_27 ;
  wire \gtx_channel.gtxe2_channel_i_n_4 ;
  wire \gtx_channel.gtxe2_channel_i_n_82 ;
  wire \gtx_channel.gtxe2_channel_i_n_83 ;
  wire \gtx_channel.gtxe2_channel_i_n_84 ;
  wire \gtx_channel.gtxe2_channel_i_n_89 ;
  wire \gtx_channel.gtxe2_channel_i_n_9 ;
  wire \gtx_channel.gtxe2_channel_i_n_90 ;
  wire \gtx_channel.gtxe2_channel_i_n_91 ;
  wire \gtx_channel.gtxe2_channel_i_n_92 ;
  wire \gtx_channel.gtxe2_channel_i_n_93 ;
  wire \gtx_channel.gtxe2_channel_i_n_94 ;
  wire \gtx_channel.gtxe2_channel_i_n_95 ;
  wire [0:0]pci_exp_rxn;
  wire [0:0]pci_exp_rxp;
  wire [0:0]pci_exp_txn;
  wire [0:0]pci_exp_txp;
  wire pipe_dclk_in;
  wire pipe_pclk_in;
  wire pipe_rx0_chanisaligned;
  wire pipe_rx0_polarity;
  wire [0:0]pipe_rxoutclk_out;
  wire pipe_rxusrclk_in;
  wire [1:0]pipe_tx0_char_is_k;
  wire pipe_tx0_compliance;
  wire [15:0]pipe_tx0_data;
  wire pipe_tx0_elec_idle;
  wire [1:0]pipe_tx0_powerdown;
  wire pipe_tx_deemph;
  wire [2:0]pipe_tx_margin;
  wire pipe_tx_rcvr_det;
  wire pipe_txoutclk_out;
  wire rate_cpllpd;
  wire rate_rxpmareset;
  wire rst_gtreset;
  wire rst_userrdy;
  wire sync_txdlyen;
  wire sys_clk;
  wire user_rx_converge;
  wire \NLW_gtx_channel.gtxe2_channel_i_CPLLFBCLKLOST_UNCONNECTED ;
  wire \NLW_gtx_channel.gtxe2_channel_i_CPLLREFCLKLOST_UNCONNECTED ;
  wire \NLW_gtx_channel.gtxe2_channel_i_GTREFCLKMONITOR_UNCONNECTED ;
  wire \NLW_gtx_channel.gtxe2_channel_i_RXCHANBONDSEQ_UNCONNECTED ;
  wire \NLW_gtx_channel.gtxe2_channel_i_RXCHANREALIGN_UNCONNECTED ;
  wire \NLW_gtx_channel.gtxe2_channel_i_RXCOMINITDET_UNCONNECTED ;
  wire \NLW_gtx_channel.gtxe2_channel_i_RXCOMSASDET_UNCONNECTED ;
  wire \NLW_gtx_channel.gtxe2_channel_i_RXCOMWAKEDET_UNCONNECTED ;
  wire \NLW_gtx_channel.gtxe2_channel_i_RXDATAVALID_UNCONNECTED ;
  wire \NLW_gtx_channel.gtxe2_channel_i_RXHEADERVALID_UNCONNECTED ;
  wire \NLW_gtx_channel.gtxe2_channel_i_RXOUTCLKFABRIC_UNCONNECTED ;
  wire \NLW_gtx_channel.gtxe2_channel_i_RXOUTCLKPCS_UNCONNECTED ;
  wire \NLW_gtx_channel.gtxe2_channel_i_RXQPISENN_UNCONNECTED ;
  wire \NLW_gtx_channel.gtxe2_channel_i_RXQPISENP_UNCONNECTED ;
  wire \NLW_gtx_channel.gtxe2_channel_i_RXSTARTOFSEQ_UNCONNECTED ;
  wire \NLW_gtx_channel.gtxe2_channel_i_TXCOMFINISH_UNCONNECTED ;
  wire \NLW_gtx_channel.gtxe2_channel_i_TXGEARBOXREADY_UNCONNECTED ;
  wire \NLW_gtx_channel.gtxe2_channel_i_TXOUTCLKFABRIC_UNCONNECTED ;
  wire \NLW_gtx_channel.gtxe2_channel_i_TXOUTCLKPCS_UNCONNECTED ;
  wire \NLW_gtx_channel.gtxe2_channel_i_TXQPISENN_UNCONNECTED ;
  wire \NLW_gtx_channel.gtxe2_channel_i_TXQPISENP_UNCONNECTED ;
  wire [15:0]\NLW_gtx_channel.gtxe2_channel_i_PCSRSVDOUT_UNCONNECTED ;
  wire [7:4]\NLW_gtx_channel.gtxe2_channel_i_RXCHARISCOMMA_UNCONNECTED ;
  wire [7:4]\NLW_gtx_channel.gtxe2_channel_i_RXCHARISK_UNCONNECTED ;
  wire [1:0]\NLW_gtx_channel.gtxe2_channel_i_RXCLKCORCNT_UNCONNECTED ;
  wire [63:32]\NLW_gtx_channel.gtxe2_channel_i_RXDATA_UNCONNECTED ;
  wire [2:0]\NLW_gtx_channel.gtxe2_channel_i_RXHEADER_UNCONNECTED ;
  wire [6:0]\NLW_gtx_channel.gtxe2_channel_i_RXMONITOROUT_UNCONNECTED ;
  wire [4:0]\NLW_gtx_channel.gtxe2_channel_i_RXPHMONITOR_UNCONNECTED ;
  wire [4:0]\NLW_gtx_channel.gtxe2_channel_i_RXPHSLIPMONITOR_UNCONNECTED ;
  wire [9:0]\NLW_gtx_channel.gtxe2_channel_i_TSTOUT_UNCONNECTED ;
  wire [1:0]\NLW_gtx_channel.gtxe2_channel_i_TXBUFSTATUS_UNCONNECTED ;

  pcie_7x_0_gtx_cpllpd_ovrd cpllPDInst
       (.CPLLPD0(CPLLPD0),
        .cpllrst(cpllrst),
        .gt_cpllpdrefclk(gt_cpllpdrefclk),
        .rate_cpllpd(rate_cpllpd));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hA8)) 
    \gt_rx_status_q[0]_i_1 
       (.I0(\gtx_channel.gtxe2_channel_i_n_90 ),
        .I1(\gt_rx_status_q_reg[2] ),
        .I2(\gt_rx_status_q_reg[0] ),
        .O(\gtx_channel.gtxe2_channel_i_8 [0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hA8)) 
    \gt_rx_status_q[1]_i_1 
       (.I0(\gtx_channel.gtxe2_channel_i_n_89 ),
        .I1(\gt_rx_status_q_reg[2] ),
        .I2(\gt_rx_status_q_reg[0] ),
        .O(\gtx_channel.gtxe2_channel_i_8 [1]));
  LUT3 #(
    .INIT(8'hA8)) 
    \gt_rx_status_q[2]_i_1 
       (.I0(RXSTATUS),
        .I1(\gt_rx_status_q_reg[2] ),
        .I2(\gt_rx_status_q_reg[0] ),
        .O(\gtx_channel.gtxe2_channel_i_8 [2]));
  (* box_type = "PRIMITIVE" *) 
  GTXE2_CHANNEL #(
    .ALIGN_COMMA_DOUBLE("FALSE"),
    .ALIGN_COMMA_ENABLE(10'b1111111111),
    .ALIGN_COMMA_WORD(1),
    .ALIGN_MCOMMA_DET("TRUE"),
    .ALIGN_MCOMMA_VALUE(10'b1010000011),
    .ALIGN_PCOMMA_DET("TRUE"),
    .ALIGN_PCOMMA_VALUE(10'b0101111100),
    .CBCC_DATA_SOURCE_SEL("DECODED"),
    .CHAN_BOND_KEEP_ALIGN("TRUE"),
    .CHAN_BOND_MAX_SKEW(7),
    .CHAN_BOND_SEQ_1_1(10'b0001001010),
    .CHAN_BOND_SEQ_1_2(10'b0001001010),
    .CHAN_BOND_SEQ_1_3(10'b0001001010),
    .CHAN_BOND_SEQ_1_4(10'b0110111100),
    .CHAN_BOND_SEQ_1_ENABLE(4'b1111),
    .CHAN_BOND_SEQ_2_1(10'b0001000101),
    .CHAN_BOND_SEQ_2_2(10'b0001000101),
    .CHAN_BOND_SEQ_2_3(10'b0001000101),
    .CHAN_BOND_SEQ_2_4(10'b0110111100),
    .CHAN_BOND_SEQ_2_ENABLE(4'b1111),
    .CHAN_BOND_SEQ_2_USE("TRUE"),
    .CHAN_BOND_SEQ_LEN(4),
    .CLK_CORRECT_USE("TRUE"),
    .CLK_COR_KEEP_IDLE("TRUE"),
    .CLK_COR_MAX_LAT(15),
    .CLK_COR_MIN_LAT(13),
    .CLK_COR_PRECEDENCE("TRUE"),
    .CLK_COR_REPEAT_WAIT(0),
    .CLK_COR_SEQ_1_1(10'b0100011100),
    .CLK_COR_SEQ_1_2(10'b0000000000),
    .CLK_COR_SEQ_1_3(10'b0000000000),
    .CLK_COR_SEQ_1_4(10'b0000000000),
    .CLK_COR_SEQ_1_ENABLE(4'b1111),
    .CLK_COR_SEQ_2_1(10'b0000000000),
    .CLK_COR_SEQ_2_2(10'b0000000000),
    .CLK_COR_SEQ_2_3(10'b0000000000),
    .CLK_COR_SEQ_2_4(10'b0000000000),
    .CLK_COR_SEQ_2_ENABLE(4'b0000),
    .CLK_COR_SEQ_2_USE("FALSE"),
    .CLK_COR_SEQ_LEN(1),
    .CPLL_CFG(24'hA407CC),
    .CPLL_FBDIV(5),
    .CPLL_FBDIV_45(5),
    .CPLL_INIT_CFG(24'h00001E),
    .CPLL_LOCK_CFG(16'h01E8),
    .CPLL_REFCLK_DIV(1),
    .DEC_MCOMMA_DETECT("TRUE"),
    .DEC_PCOMMA_DETECT("TRUE"),
    .DEC_VALID_COMMA_ONLY("FALSE"),
    .DMONITOR_CFG(24'h000B01),
    .ES_CONTROL(6'b000000),
    .ES_ERRDET_EN("FALSE"),
    .ES_EYE_SCAN_EN("FALSE"),
    .ES_HORZ_OFFSET(12'h000),
    .ES_PMA_CFG(10'b0000000000),
    .ES_PRESCALE(5'b00000),
    .ES_QUALIFIER(80'h00000000000000000000),
    .ES_QUAL_MASK(80'h00000000000000000000),
    .ES_SDATA_MASK(80'h00000000000000000000),
    .ES_VERT_OFFSET(9'b000000000),
    .FTS_DESKEW_SEQ_ENABLE(4'b1111),
    .FTS_LANE_DESKEW_CFG(4'b1111),
    .FTS_LANE_DESKEW_EN("TRUE"),
    .GEARBOX_MODE(3'b000),
    .IS_CPLLLOCKDETCLK_INVERTED(1'b0),
    .IS_DRPCLK_INVERTED(1'b0),
    .IS_GTGREFCLK_INVERTED(1'b0),
    .IS_RXUSRCLK2_INVERTED(1'b0),
    .IS_RXUSRCLK_INVERTED(1'b0),
    .IS_TXPHDLYTSTCLK_INVERTED(1'b0),
    .IS_TXUSRCLK2_INVERTED(1'b0),
    .IS_TXUSRCLK_INVERTED(1'b0),
    .OUTREFCLK_SEL_INV(2'b11),
    .PCS_PCIE_EN("TRUE"),
    .PCS_RSVD_ATTR(48'h0000000001CF),
    .PD_TRANS_TIME_FROM_P2(12'h03C),
    .PD_TRANS_TIME_NONE_P2(8'h09),
    .PD_TRANS_TIME_TO_P2(8'h64),
    .PMA_RSV(32'h00018480),
    .PMA_RSV2(16'h2050),
    .PMA_RSV3(2'b00),
    .PMA_RSV4(32'h00000000),
    .RXBUFRESET_TIME(5'b00001),
    .RXBUF_ADDR_MODE("FULL"),
    .RXBUF_EIDLE_HI_CNT(4'b0100),
    .RXBUF_EIDLE_LO_CNT(4'b0000),
    .RXBUF_EN("TRUE"),
    .RXBUF_RESET_ON_CB_CHANGE("TRUE"),
    .RXBUF_RESET_ON_COMMAALIGN("FALSE"),
    .RXBUF_RESET_ON_EIDLE("TRUE"),
    .RXBUF_RESET_ON_RATE_CHANGE("TRUE"),
    .RXBUF_THRESH_OVFLW(61),
    .RXBUF_THRESH_OVRD("FALSE"),
    .RXBUF_THRESH_UNDFLW(4),
    .RXCDRFREQRESET_TIME(5'b00001),
    .RXCDRPHRESET_TIME(5'b00001),
    .RXCDR_CFG(72'h03000023FF10200020),
    .RXCDR_FR_RESET_ON_EIDLE(1'b0),
    .RXCDR_HOLD_DURING_EIDLE(1'b1),
    .RXCDR_LOCK_CFG(6'b010101),
    .RXCDR_PH_RESET_ON_EIDLE(1'b0),
    .RXDFELPMRESET_TIME(7'b0001111),
    .RXDLY_CFG(16'h001F),
    .RXDLY_LCFG(9'h030),
    .RXDLY_TAP_CFG(16'h0000),
    .RXGEARBOX_EN("FALSE"),
    .RXISCANRESET_TIME(5'b00001),
    .RXLPM_HF_CFG(14'b00000011110000),
    .RXLPM_LF_CFG(14'b00000011110000),
    .RXOOB_CFG(7'b0000110),
    .RXOUT_DIV(2),
    .RXPCSRESET_TIME(5'b00001),
    .RXPHDLY_CFG(24'h004020),
    .RXPH_CFG(24'h000000),
    .RXPH_MONITOR_SEL(5'b00000),
    .RXPMARESET_TIME(5'b00011),
    .RXPRBS_ERR_LOOPBACK(1'b0),
    .RXSLIDE_AUTO_WAIT(7),
    .RXSLIDE_MODE("PMA"),
    .RX_BIAS_CFG(12'b000000000100),
    .RX_BUFFER_CFG(6'b000000),
    .RX_CLK25_DIV(4),
    .RX_CLKMUX_PD(1'b1),
    .RX_CM_SEL(2'b11),
    .RX_CM_TRIM(3'b010),
    .RX_DATA_WIDTH(20),
    .RX_DDI_SEL(6'b000000),
    .RX_DEBUG_CFG(12'b000000000000),
    .RX_DEFER_RESET_BUF_EN("TRUE"),
    .RX_DFE_GAIN_CFG(23'h020FEA),
    .RX_DFE_H2_CFG(12'b000000000000),
    .RX_DFE_H3_CFG(12'b000001000000),
    .RX_DFE_H4_CFG(11'b00011110000),
    .RX_DFE_H5_CFG(11'b00011100000),
    .RX_DFE_KL_CFG(13'b0000011111110),
    .RX_DFE_KL_CFG2(32'h3290D86C),
    .RX_DFE_LPM_CFG(16'h0954),
    .RX_DFE_LPM_HOLD_DURING_EIDLE(1'b1),
    .RX_DFE_UT_CFG(17'b10001111000000000),
    .RX_DFE_VP_CFG(17'b00011111100000011),
    .RX_DFE_XYD_CFG(13'b0000000000000),
    .RX_DISPERR_SEQ_MATCH("TRUE"),
    .RX_INT_DATAWIDTH(0),
    .RX_OS_CFG(13'b0000010000000),
    .RX_SIG_VALID_DLY(4),
    .RX_XCLK_SEL("RXREC"),
    .SAS_MAX_COM(64),
    .SAS_MIN_COM(36),
    .SATA_BURST_SEQ_LEN(4'b1111),
    .SATA_BURST_VAL(3'b100),
    .SATA_CPLL_CFG("VCO_3000MHZ"),
    .SATA_EIDLE_VAL(3'b100),
    .SATA_MAX_BURST(8),
    .SATA_MAX_INIT(21),
    .SATA_MAX_WAKE(7),
    .SATA_MIN_BURST(4),
    .SATA_MIN_INIT(12),
    .SATA_MIN_WAKE(4),
    .SHOW_REALIGN_COMMA("FALSE"),
    .SIM_CPLLREFCLK_SEL(3'b001),
    .SIM_RECEIVER_DETECT_PASS("TRUE"),
    .SIM_RESET_SPEEDUP("FALSE"),
    .SIM_TX_EIDLE_DRIVE_LEVEL("1"),
    .SIM_VERSION("3.0"),
    .TERM_RCAL_CFG(5'b10000),
    .TERM_RCAL_OVRD(1'b0),
    .TRANS_TIME_RATE(8'h0E),
    .TST_RSV(32'h00000000),
    .TXBUF_EN("FALSE"),
    .TXBUF_RESET_ON_RATE_CHANGE("TRUE"),
    .TXDLY_CFG(16'h001F),
    .TXDLY_LCFG(9'h030),
    .TXDLY_TAP_CFG(16'h0000),
    .TXGEARBOX_EN("FALSE"),
    .TXOUT_DIV(2),
    .TXPCSRESET_TIME(5'b00001),
    .TXPHDLY_CFG(24'h084020),
    .TXPH_CFG(16'h0780),
    .TXPH_MONITOR_SEL(5'b00000),
    .TXPMARESET_TIME(5'b00011),
    .TX_CLK25_DIV(4),
    .TX_CLKMUX_PD(1'b1),
    .TX_DATA_WIDTH(20),
    .TX_DEEMPH0(5'b10100),
    .TX_DEEMPH1(5'b01011),
    .TX_DRIVE_MODE("PIPE"),
    .TX_EIDLE_ASSERT_DELAY(3'b010),
    .TX_EIDLE_DEASSERT_DELAY(3'b100),
    .TX_INT_DATAWIDTH(0),
    .TX_LOOPBACK_DRIVE_HIZ("FALSE"),
    .TX_MAINCURSOR_SEL(1'b0),
    .TX_MARGIN_FULL_0(7'b1001111),
    .TX_MARGIN_FULL_1(7'b1001110),
    .TX_MARGIN_FULL_2(7'b1001101),
    .TX_MARGIN_FULL_3(7'b1001100),
    .TX_MARGIN_FULL_4(7'b1000011),
    .TX_MARGIN_LOW_0(7'b1000101),
    .TX_MARGIN_LOW_1(7'b1000110),
    .TX_MARGIN_LOW_2(7'b1000011),
    .TX_MARGIN_LOW_3(7'b1000010),
    .TX_MARGIN_LOW_4(7'b1000000),
    .TX_PREDRIVER_MODE(1'b0),
    .TX_QPI_STATUS_EN(1'b0),
    .TX_RXDETECT_CFG(14'h0064),
    .TX_RXDETECT_REF(3'b011),
    .TX_XCLK_SEL("TXUSR"),
    .UCODEER_CLR(1'b0)) 
    \gtx_channel.gtxe2_channel_i 
       (.CFGRESET(1'b0),
        .CLKRSVD({1'b0,1'b0,1'b0,CLKRSVD}),
        .CPLLFBCLKLOST(\NLW_gtx_channel.gtxe2_channel_i_CPLLFBCLKLOST_UNCONNECTED ),
        .CPLLLOCK(QRST_CPLLLOCK),
        .CPLLLOCKDETCLK(1'b0),
        .CPLLLOCKEN(1'b1),
        .CPLLPD(CPLLPD0),
        .CPLLREFCLKLOST(\NLW_gtx_channel.gtxe2_channel_i_CPLLREFCLKLOST_UNCONNECTED ),
        .CPLLREFCLKSEL({1'b0,1'b0,1'b1}),
        .CPLLRESET(CPLLRESET0),
        .DMONITOROUT({\gtx_channel.gtxe2_channel_i_n_177 ,\gtx_channel.gtxe2_channel_i_n_178 ,\gtx_channel.gtxe2_channel_i_n_179 ,\gtx_channel.gtxe2_channel_i_n_180 ,\gtx_channel.gtxe2_channel_i_n_181 ,\gtx_channel.gtxe2_channel_i_n_182 ,\gtx_channel.gtxe2_channel_i_n_183 ,\gtx_channel.gtxe2_channel_i_n_184 }),
        .DRPADDR({1'b0,DRPADDR}),
        .DRPCLK(pipe_dclk_in),
        .DRPDI(DRPDI),
        .DRPDO(D),
        .DRPEN(\gtx_channel.gtxe2_channel_i_9 ),
        .DRPRDY(\gtx_channel.gtxe2_channel_i_0 ),
        .DRPWE(\gtx_channel.gtxe2_channel_i_10 ),
        .EYESCANDATAERROR(\gtx_channel.gtxe2_channel_i_n_4 ),
        .EYESCANMODE(1'b0),
        .EYESCANRESET(1'b0),
        .EYESCANTRIGGER(1'b0),
        .GTGREFCLK(1'b0),
        .GTNORTHREFCLK0(1'b0),
        .GTNORTHREFCLK1(1'b0),
        .GTREFCLK0(sys_clk),
        .GTREFCLK1(1'b0),
        .GTREFCLKMONITOR(\NLW_gtx_channel.gtxe2_channel_i_GTREFCLKMONITOR_UNCONNECTED ),
        .GTRESETSEL(1'b0),
        .GTRSVD({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .GTRXRESET(rst_gtreset),
        .GTSOUTHREFCLK0(1'b0),
        .GTSOUTHREFCLK1(1'b0),
        .GTTXRESET(rst_gtreset),
        .GTXRXN(pci_exp_rxn),
        .GTXRXP(pci_exp_rxp),
        .GTXTXN(pci_exp_txn),
        .GTXTXP(pci_exp_txp),
        .LOOPBACK({1'b0,1'b0,1'b0}),
        .PCSRSVDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCSRSVDIN2({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCSRSVDOUT(\NLW_gtx_channel.gtxe2_channel_i_PCSRSVDOUT_UNCONNECTED [15:0]),
        .PHYSTATUS(gt_phystatus),
        .PMARSVDIN({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PMARSVDIN2({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .QPLLCLK(QPLL_QPLLOUTCLK),
        .QPLLREFCLK(QPLL_QPLLOUTREFCLK),
        .RESETOVRD(1'b0),
        .RX8B10BEN(RX8B10BEN0),
        .RXBUFRESET(1'b0),
        .RXBUFSTATUS({\gtx_channel.gtxe2_channel_i_n_82 ,\gtx_channel.gtxe2_channel_i_n_83 ,\gtx_channel.gtxe2_channel_i_n_84 }),
        .RXBYTEISALIGNED(\gtx_channel.gtxe2_channel_i_n_9 ),
        .RXBYTEREALIGN(\gtx_channel.gtxe2_channel_i_n_10 ),
        .RXCDRFREQRESET(1'b0),
        .RXCDRHOLD(1'b0),
        .RXCDRLOCK(gt_rxcdrlock),
        .RXCDROVRDEN(1'b0),
        .RXCDRRESET(1'b0),
        .RXCDRRESETRSV(1'b0),
        .RXCHANBONDSEQ(\NLW_gtx_channel.gtxe2_channel_i_RXCHANBONDSEQ_UNCONNECTED ),
        .RXCHANISALIGNED(pipe_rx0_chanisaligned),
        .RXCHANREALIGN(\NLW_gtx_channel.gtxe2_channel_i_RXCHANREALIGN_UNCONNECTED ),
        .RXCHARISCOMMA({\NLW_gtx_channel.gtxe2_channel_i_RXCHARISCOMMA_UNCONNECTED [7:4],\gtx_channel.gtxe2_channel_i_n_189 ,\gtx_channel.gtxe2_channel_i_n_190 ,\gtx_channel.gtxe2_channel_i_n_191 ,\gtx_channel.gtxe2_channel_i_n_192 }),
        .RXCHARISK({\NLW_gtx_channel.gtxe2_channel_i_RXCHARISK_UNCONNECTED [7:4],\gtx_channel.gtxe2_channel_i_n_197 ,\gtx_channel.gtxe2_channel_i_n_198 ,\gtx_channel.gtxe2_channel_i_7 }),
        .RXCHBONDEN(1'b0),
        .RXCHBONDI({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .RXCHBONDLEVEL({1'b0,1'b0,1'b0}),
        .RXCHBONDMASTER(RX8B10BEN0),
        .RXCHBONDO({\gtx_channel.gtxe2_channel_i_n_91 ,\gtx_channel.gtxe2_channel_i_n_92 ,\gtx_channel.gtxe2_channel_i_n_93 ,\gtx_channel.gtxe2_channel_i_n_94 ,\gtx_channel.gtxe2_channel_i_n_95 }),
        .RXCHBONDSLAVE(1'b0),
        .RXCLKCORCNT(\NLW_gtx_channel.gtxe2_channel_i_RXCLKCORCNT_UNCONNECTED [1:0]),
        .RXCOMINITDET(\NLW_gtx_channel.gtxe2_channel_i_RXCOMINITDET_UNCONNECTED ),
        .RXCOMMADET(\gtx_channel.gtxe2_channel_i_n_16 ),
        .RXCOMMADETEN(1'b1),
        .RXCOMSASDET(\NLW_gtx_channel.gtxe2_channel_i_RXCOMSASDET_UNCONNECTED ),
        .RXCOMWAKEDET(\NLW_gtx_channel.gtxe2_channel_i_RXCOMWAKEDET_UNCONNECTED ),
        .RXDATA({\NLW_gtx_channel.gtxe2_channel_i_RXDATA_UNCONNECTED [63:32],\gtx_channel.gtxe2_channel_i_n_138 ,\gtx_channel.gtxe2_channel_i_n_139 ,\gtx_channel.gtxe2_channel_i_n_140 ,\gtx_channel.gtxe2_channel_i_n_141 ,\gtx_channel.gtxe2_channel_i_n_142 ,\gtx_channel.gtxe2_channel_i_n_143 ,\gtx_channel.gtxe2_channel_i_n_144 ,\gtx_channel.gtxe2_channel_i_n_145 ,\gtx_channel.gtxe2_channel_i_n_146 ,\gtx_channel.gtxe2_channel_i_n_147 ,\gtx_channel.gtxe2_channel_i_n_148 ,\gtx_channel.gtxe2_channel_i_n_149 ,\gtx_channel.gtxe2_channel_i_n_150 ,\gtx_channel.gtxe2_channel_i_n_151 ,\gtx_channel.gtxe2_channel_i_n_152 ,\gtx_channel.gtxe2_channel_i_n_153 ,\gtx_channel.gtxe2_channel_i_6 }),
        .RXDATAVALID(\NLW_gtx_channel.gtxe2_channel_i_RXDATAVALID_UNCONNECTED ),
        .RXDDIEN(1'b0),
        .RXDFEAGCHOLD(user_rx_converge),
        .RXDFEAGCOVRDEN(1'b0),
        .RXDFECM1EN(1'b0),
        .RXDFELFHOLD(1'b0),
        .RXDFELFOVRDEN(1'b1),
        .RXDFELPMRESET(1'b0),
        .RXDFETAP2HOLD(1'b0),
        .RXDFETAP2OVRDEN(1'b0),
        .RXDFETAP3HOLD(1'b0),
        .RXDFETAP3OVRDEN(1'b0),
        .RXDFETAP4HOLD(1'b0),
        .RXDFETAP4OVRDEN(1'b0),
        .RXDFETAP5HOLD(1'b0),
        .RXDFETAP5OVRDEN(1'b0),
        .RXDFEUTHOLD(1'b0),
        .RXDFEUTOVRDEN(1'b0),
        .RXDFEVPHOLD(1'b0),
        .RXDFEVPOVRDEN(1'b0),
        .RXDFEVSEN(1'b0),
        .RXDFEXYDEN(1'b0),
        .RXDFEXYDHOLD(1'b0),
        .RXDFEXYDOVRDEN(1'b0),
        .RXDISPERR({\gtx_channel.gtxe2_channel_i_n_201 ,\gtx_channel.gtxe2_channel_i_n_202 ,\gtx_channel.gtxe2_channel_i_n_203 ,\gtx_channel.gtxe2_channel_i_n_204 ,\gtx_channel.gtxe2_channel_i_n_205 ,\gtx_channel.gtxe2_channel_i_n_206 ,\gtx_channel.gtxe2_channel_i_n_207 ,\gtx_channel.gtxe2_channel_i_n_208 }),
        .RXDLYBYPASS(1'b1),
        .RXDLYEN(1'b0),
        .RXDLYOVRDEN(1'b0),
        .RXDLYSRESET(1'b0),
        .RXDLYSRESETDONE(\gtx_channel.gtxe2_channel_i_1 ),
        .RXELECIDLE(PIPE_RXELECIDLE),
        .RXELECIDLEMODE({1'b0,1'b0}),
        .RXGEARBOXSLIP(1'b0),
        .RXHEADER(\NLW_gtx_channel.gtxe2_channel_i_RXHEADER_UNCONNECTED [2:0]),
        .RXHEADERVALID(\NLW_gtx_channel.gtxe2_channel_i_RXHEADERVALID_UNCONNECTED ),
        .RXLPMEN(RX8B10BEN0),
        .RXLPMHFHOLD(1'b0),
        .RXLPMHFOVRDEN(1'b0),
        .RXLPMLFHOLD(1'b0),
        .RXLPMLFKLOVRDEN(1'b0),
        .RXMCOMMAALIGNEN(RX8B10BEN0),
        .RXMONITOROUT(\NLW_gtx_channel.gtxe2_channel_i_RXMONITOROUT_UNCONNECTED [6:0]),
        .RXMONITORSEL({1'b0,1'b0}),
        .RXNOTINTABLE({\gtx_channel.gtxe2_channel_i_n_209 ,\gtx_channel.gtxe2_channel_i_n_210 ,\gtx_channel.gtxe2_channel_i_n_211 ,\gtx_channel.gtxe2_channel_i_n_212 ,\gtx_channel.gtxe2_channel_i_n_213 ,\gtx_channel.gtxe2_channel_i_n_214 ,\gtx_channel.gtxe2_channel_i_n_215 ,\gtx_channel.gtxe2_channel_i_n_216 }),
        .RXOOBRESET(1'b0),
        .RXOSHOLD(1'b0),
        .RXOSOVRDEN(1'b0),
        .RXOUTCLK(pipe_rxoutclk_out),
        .RXOUTCLKFABRIC(\NLW_gtx_channel.gtxe2_channel_i_RXOUTCLKFABRIC_UNCONNECTED ),
        .RXOUTCLKPCS(\NLW_gtx_channel.gtxe2_channel_i_RXOUTCLKPCS_UNCONNECTED ),
        .RXOUTCLKSEL({1'b0,1'b0,1'b0}),
        .RXPCOMMAALIGNEN(RX8B10BEN0),
        .RXPCSRESET(1'b0),
        .RXPD(pipe_tx0_powerdown),
        .RXPHALIGN(1'b0),
        .RXPHALIGNDONE(\gtx_channel.gtxe2_channel_i_2 ),
        .RXPHALIGNEN(1'b0),
        .RXPHDLYPD(1'b0),
        .RXPHDLYRESET(1'b0),
        .RXPHMONITOR(\NLW_gtx_channel.gtxe2_channel_i_RXPHMONITOR_UNCONNECTED [4:0]),
        .RXPHOVRDEN(1'b0),
        .RXPHSLIPMONITOR(\NLW_gtx_channel.gtxe2_channel_i_RXPHSLIPMONITOR_UNCONNECTED [4:0]),
        .RXPMARESET(rate_rxpmareset),
        .RXPOLARITY(pipe_rx0_polarity),
        .RXPRBSCNTRESET(1'b0),
        .RXPRBSERR(\gtx_channel.gtxe2_channel_i_n_27 ),
        .RXPRBSSEL({1'b0,1'b0,1'b0}),
        .RXQPIEN(1'b0),
        .RXQPISENN(\NLW_gtx_channel.gtxe2_channel_i_RXQPISENN_UNCONNECTED ),
        .RXQPISENP(\NLW_gtx_channel.gtxe2_channel_i_RXQPISENP_UNCONNECTED ),
        .RXRATE({1'b0,1'b0,RXRATE}),
        .RXRATEDONE(gt_rxratedone),
        .RXRESETDONE(gt_rxresetdone_0),
        .RXSLIDE(1'b0),
        .RXSTARTOFSEQ(\NLW_gtx_channel.gtxe2_channel_i_RXSTARTOFSEQ_UNCONNECTED ),
        .RXSTATUS({RXSTATUS,\gtx_channel.gtxe2_channel_i_n_89 ,\gtx_channel.gtxe2_channel_i_n_90 }),
        .RXSYSCLKSEL({1'b0,RXSYSCLKSEL}),
        .RXUSERRDY(rst_userrdy),
        .RXUSRCLK(pipe_rxusrclk_in),
        .RXUSRCLK2(pipe_rxusrclk_in),
        .RXVALID(gt_rxvalid),
        .SETERRSTATUS(1'b0),
        .TSTIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .TSTOUT(\NLW_gtx_channel.gtxe2_channel_i_TSTOUT_UNCONNECTED [9:0]),
        .TX8B10BBYPASS({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TX8B10BEN(RX8B10BEN0),
        .TXBUFDIFFCTRL({1'b1,1'b0,1'b0}),
        .TXBUFSTATUS(\NLW_gtx_channel.gtxe2_channel_i_TXBUFSTATUS_UNCONNECTED [1:0]),
        .TXCHARDISPMODE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,pipe_tx0_compliance}),
        .TXCHARDISPVAL({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXCHARISK({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,pipe_tx0_char_is_k}),
        .TXCOMFINISH(\NLW_gtx_channel.gtxe2_channel_i_TXCOMFINISH_UNCONNECTED ),
        .TXCOMINIT(1'b0),
        .TXCOMSAS(1'b0),
        .TXCOMWAKE(1'b0),
        .TXDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,pipe_tx0_data}),
        .TXDEEMPH(pipe_tx_deemph),
        .TXDETECTRX(pipe_tx_rcvr_det),
        .TXDIFFCTRL({1'b1,1'b1,1'b0,1'b0}),
        .TXDIFFPD(1'b0),
        .TXDLYBYPASS(1'b0),
        .TXDLYEN(sync_txdlyen),
        .TXDLYHOLD(1'b0),
        .TXDLYOVRDEN(1'b0),
        .TXDLYSRESET(Q[0]),
        .TXDLYSRESETDONE(\gtx_channel.gtxe2_channel_i_3 ),
        .TXDLYUPDOWN(1'b0),
        .TXELECIDLE(pipe_tx0_elec_idle),
        .TXGEARBOXREADY(\NLW_gtx_channel.gtxe2_channel_i_TXGEARBOXREADY_UNCONNECTED ),
        .TXHEADER({1'b0,1'b0,1'b0}),
        .TXINHIBIT(1'b0),
        .TXMAINCURSOR(TXMAINCURSOR),
        .TXMARGIN(pipe_tx_margin),
        .TXOUTCLK(pipe_txoutclk_out),
        .TXOUTCLKFABRIC(\NLW_gtx_channel.gtxe2_channel_i_TXOUTCLKFABRIC_UNCONNECTED ),
        .TXOUTCLKPCS(\NLW_gtx_channel.gtxe2_channel_i_TXOUTCLKPCS_UNCONNECTED ),
        .TXOUTCLKSEL({1'b0,1'b1,1'b1}),
        .TXPCSRESET(1'b0),
        .TXPD(pipe_tx0_powerdown),
        .TXPDELECIDLEMODE(1'b0),
        .TXPHALIGN(Q[2]),
        .TXPHALIGNDONE(\gtx_channel.gtxe2_channel_i_4 ),
        .TXPHALIGNEN(1'b1),
        .TXPHDLYPD(1'b0),
        .TXPHDLYRESET(1'b0),
        .TXPHDLYTSTCLK(1'b0),
        .TXPHINIT(Q[1]),
        .TXPHINITDONE(\gtx_channel.gtxe2_channel_i_5 ),
        .TXPHOVRDEN(1'b0),
        .TXPISOPD(1'b0),
        .TXPMARESET(rate_rxpmareset),
        .TXPOLARITY(1'b0),
        .TXPOSTCURSOR(TXPOSTCURSOR),
        .TXPOSTCURSORINV(1'b0),
        .TXPRBSFORCEERR(1'b0),
        .TXPRBSSEL({1'b0,1'b0,1'b0}),
        .TXPRECURSOR(TXPRECURSOR),
        .TXPRECURSORINV(1'b0),
        .TXQPIBIASEN(1'b0),
        .TXQPISENN(\NLW_gtx_channel.gtxe2_channel_i_TXQPISENN_UNCONNECTED ),
        .TXQPISENP(\NLW_gtx_channel.gtxe2_channel_i_TXQPISENP_UNCONNECTED ),
        .TXQPISTRONGPDOWN(1'b0),
        .TXQPIWEAKPUP(1'b0),
        .TXRATE({1'b0,1'b0,RXRATE}),
        .TXRATEDONE(gt_txratedone),
        .TXRESETDONE(gt_txresetdone_0),
        .TXSEQUENCE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXSTARTSEQ(1'b0),
        .TXSWING(1'b0),
        .TXSYSCLKSEL({1'b0,RXSYSCLKSEL}),
        .TXUSERRDY(rst_userrdy),
        .TXUSRCLK(pipe_pclk_in),
        .TXUSRCLK2(pipe_pclk_in));
endmodule

module pcie_7x_0_gtx_cpllpd_ovrd
   (cpllrst,
    CPLLPD0,
    gt_cpllpdrefclk,
    rate_cpllpd);
  output cpllrst;
  output CPLLPD0;
  input gt_cpllpdrefclk;
  input rate_cpllpd;

  wire CPLLPD0;
  wire cpllpd;
  wire \cpllpd_wait_reg[31]_srl32_n_1 ;
  wire \cpllpd_wait_reg[63]_srl32_n_1 ;
  wire \cpllpd_wait_reg[94]_srl31_n_0 ;
  wire \cpllreset_wait_reg[126]_srl31_n_0 ;
  wire \cpllreset_wait_reg[31]_srl32_n_1 ;
  wire \cpllreset_wait_reg[63]_srl32_n_1 ;
  wire \cpllreset_wait_reg[95]_srl32_n_1 ;
  wire cpllrst;
  wire gt_cpllpdrefclk;
  wire rate_cpllpd;
  wire \NLW_cpllpd_wait_reg[31]_srl32_Q_UNCONNECTED ;
  wire \NLW_cpllpd_wait_reg[63]_srl32_Q_UNCONNECTED ;
  wire \NLW_cpllpd_wait_reg[94]_srl31_Q31_UNCONNECTED ;
  wire \NLW_cpllreset_wait_reg[126]_srl31_Q31_UNCONNECTED ;
  wire \NLW_cpllreset_wait_reg[31]_srl32_Q_UNCONNECTED ;
  wire \NLW_cpllreset_wait_reg[63]_srl32_Q_UNCONNECTED ;
  wire \NLW_cpllreset_wait_reg[95]_srl32_Q_UNCONNECTED ;

  (* srl_bus_name = "U0/\inst/gt_top_i/pipe_wrapper_i/pipe_lane[0].gt_wrapper_i/cpllPDInst/cpllpd_wait_reg " *) 
  (* srl_name = "U0/\inst/gt_top_i/pipe_wrapper_i/pipe_lane[0].gt_wrapper_i/cpllPDInst/cpllpd_wait_reg[31]_srl32 " *) 
  SRLC32E #(
    .INIT(32'hFFFFFFFF)) 
    \cpllpd_wait_reg[31]_srl32 
       (.A({1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CE(1'b1),
        .CLK(gt_cpllpdrefclk),
        .D(1'b0),
        .Q(\NLW_cpllpd_wait_reg[31]_srl32_Q_UNCONNECTED ),
        .Q31(\cpllpd_wait_reg[31]_srl32_n_1 ));
  (* srl_bus_name = "U0/\inst/gt_top_i/pipe_wrapper_i/pipe_lane[0].gt_wrapper_i/cpllPDInst/cpllpd_wait_reg " *) 
  (* srl_name = "U0/\inst/gt_top_i/pipe_wrapper_i/pipe_lane[0].gt_wrapper_i/cpllPDInst/cpllpd_wait_reg[63]_srl32 " *) 
  SRLC32E #(
    .INIT(32'hFFFFFFFF)) 
    \cpllpd_wait_reg[63]_srl32 
       (.A({1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CE(1'b1),
        .CLK(gt_cpllpdrefclk),
        .D(\cpllpd_wait_reg[31]_srl32_n_1 ),
        .Q(\NLW_cpllpd_wait_reg[63]_srl32_Q_UNCONNECTED ),
        .Q31(\cpllpd_wait_reg[63]_srl32_n_1 ));
  (* srl_bus_name = "U0/\inst/gt_top_i/pipe_wrapper_i/pipe_lane[0].gt_wrapper_i/cpllPDInst/cpllpd_wait_reg " *) 
  (* srl_name = "U0/\inst/gt_top_i/pipe_wrapper_i/pipe_lane[0].gt_wrapper_i/cpllPDInst/cpllpd_wait_reg[94]_srl31 " *) 
  SRLC32E #(
    .INIT(32'h7FFFFFFF)) 
    \cpllpd_wait_reg[94]_srl31 
       (.A({1'b1,1'b1,1'b1,1'b1,1'b0}),
        .CE(1'b1),
        .CLK(gt_cpllpdrefclk),
        .D(\cpllpd_wait_reg[63]_srl32_n_1 ),
        .Q(\cpllpd_wait_reg[94]_srl31_n_0 ),
        .Q31(\NLW_cpllpd_wait_reg[94]_srl31_Q31_UNCONNECTED ));
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b1)) 
    \cpllpd_wait_reg[95] 
       (.C(gt_cpllpdrefclk),
        .CE(1'b1),
        .D(\cpllpd_wait_reg[94]_srl31_n_0 ),
        .Q(cpllpd),
        .R(1'b0));
  (* srl_bus_name = "U0/\inst/gt_top_i/pipe_wrapper_i/pipe_lane[0].gt_wrapper_i/cpllPDInst/cpllreset_wait_reg " *) 
  (* srl_name = "U0/\inst/gt_top_i/pipe_wrapper_i/pipe_lane[0].gt_wrapper_i/cpllPDInst/cpllreset_wait_reg[126]_srl31 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \cpllreset_wait_reg[126]_srl31 
       (.A({1'b1,1'b1,1'b1,1'b1,1'b0}),
        .CE(1'b1),
        .CLK(gt_cpllpdrefclk),
        .D(\cpllreset_wait_reg[95]_srl32_n_1 ),
        .Q(\cpllreset_wait_reg[126]_srl31_n_0 ),
        .Q31(\NLW_cpllreset_wait_reg[126]_srl31_Q31_UNCONNECTED ));
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \cpllreset_wait_reg[127] 
       (.C(gt_cpllpdrefclk),
        .CE(1'b1),
        .D(\cpllreset_wait_reg[126]_srl31_n_0 ),
        .Q(cpllrst),
        .R(1'b0));
  (* srl_bus_name = "U0/\inst/gt_top_i/pipe_wrapper_i/pipe_lane[0].gt_wrapper_i/cpllPDInst/cpllreset_wait_reg " *) 
  (* srl_name = "U0/\inst/gt_top_i/pipe_wrapper_i/pipe_lane[0].gt_wrapper_i/cpllPDInst/cpllreset_wait_reg[31]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h000000FF)) 
    \cpllreset_wait_reg[31]_srl32 
       (.A({1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CE(1'b1),
        .CLK(gt_cpllpdrefclk),
        .D(1'b0),
        .Q(\NLW_cpllreset_wait_reg[31]_srl32_Q_UNCONNECTED ),
        .Q31(\cpllreset_wait_reg[31]_srl32_n_1 ));
  (* srl_bus_name = "U0/\inst/gt_top_i/pipe_wrapper_i/pipe_lane[0].gt_wrapper_i/cpllPDInst/cpllreset_wait_reg " *) 
  (* srl_name = "U0/\inst/gt_top_i/pipe_wrapper_i/pipe_lane[0].gt_wrapper_i/cpllPDInst/cpllreset_wait_reg[63]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \cpllreset_wait_reg[63]_srl32 
       (.A({1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CE(1'b1),
        .CLK(gt_cpllpdrefclk),
        .D(\cpllreset_wait_reg[31]_srl32_n_1 ),
        .Q(\NLW_cpllreset_wait_reg[63]_srl32_Q_UNCONNECTED ),
        .Q31(\cpllreset_wait_reg[63]_srl32_n_1 ));
  (* srl_bus_name = "U0/\inst/gt_top_i/pipe_wrapper_i/pipe_lane[0].gt_wrapper_i/cpllPDInst/cpllreset_wait_reg " *) 
  (* srl_name = "U0/\inst/gt_top_i/pipe_wrapper_i/pipe_lane[0].gt_wrapper_i/cpllPDInst/cpllreset_wait_reg[95]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \cpllreset_wait_reg[95]_srl32 
       (.A({1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CE(1'b1),
        .CLK(gt_cpllpdrefclk),
        .D(\cpllreset_wait_reg[63]_srl32_n_1 ),
        .Q(\NLW_cpllreset_wait_reg[95]_srl32_Q_UNCONNECTED ),
        .Q31(\cpllreset_wait_reg[95]_srl32_n_1 ));
  LUT2 #(
    .INIT(4'hE)) 
    \gtx_channel.gtxe2_channel_i_i_1 
       (.I0(cpllpd),
        .I1(rate_cpllpd),
        .O(CPLLPD0));
endmodule

(* CFG_CTL_IF = "TRUE" *) (* CFG_FC_IF = "TRUE" *) (* CFG_MGMT_IF = "TRUE" *) 
(* CFG_STATUS_IF = "TRUE" *) (* C_DATA_WIDTH = "64" *) (* ENABLE_JTAG_DBG = "FALSE" *) 
(* ERR_REPORTING_IF = "TRUE" *) (* EXT_CH_GT_DRP = "FALSE" *) (* EXT_PIPE_INTERFACE = "FALSE" *) 
(* EXT_STARTUP_PRIMITIVE = "FALSE" *) (* KEEP_WIDTH = "8" *) (* LINK_CAP_MAX_LINK_WIDTH = "1" *) 
(* PCIE_ASYNC_EN = "FALSE" *) (* PCIE_EXT_CLK = "TRUE" *) (* PCIE_EXT_GT_COMMON = "FALSE" *) 
(* PCIE_ID_IF = "FALSE" *) (* PIPE_SIM = "FALSE" *) (* PL_INTERFACE = "TRUE" *) 
(* RCV_MSG_IF = "TRUE" *) (* REDUCE_OOB_FREQ = "FALSE" *) (* SHARED_LOGIC_IN_CORE = "FALSE" *) 
(* TRANSCEIVER_CTRL_STATUS_PORTS = "FALSE" *) (* bar_0 = "FFFFF800" *) (* bar_1 = "00000000" *) 
(* bar_2 = "00000000" *) (* bar_3 = "00000000" *) (* bar_4 = "00000000" *) 
(* bar_5 = "00000000" *) (* bram_lat = "0" *) (* c_aer_base_ptr = "000" *) 
(* c_aer_cap_ecrc_check_capable = "FALSE" *) (* c_aer_cap_ecrc_gen_capable = "FALSE" *) (* c_aer_cap_multiheader = "FALSE" *) 
(* c_aer_cap_nextptr = "000" *) (* c_aer_cap_on = "FALSE" *) (* c_aer_cap_optional_err_support = "000000" *) 
(* c_aer_cap_permit_rooterr_update = "FALSE" *) (* c_buf_opt_bma = "TRUE" *) (* c_component_name = "pcie_7x_0" *) 
(* c_cpl_inf = "TRUE" *) (* c_cpl_infinite = "TRUE" *) (* c_cpl_timeout_disable_sup = "FALSE" *) 
(* c_cpl_timeout_range = "0010" *) (* c_cpl_timeout_ranges_sup = "2" *) (* c_d1_support = "FALSE" *) 
(* c_d2_support = "FALSE" *) (* c_de_emph = "FALSE" *) (* c_dev_cap2_ari_forwarding_supported = "FALSE" *) 
(* c_dev_cap2_atomicop32_completer_supported = "FALSE" *) (* c_dev_cap2_atomicop64_completer_supported = "FALSE" *) (* c_dev_cap2_atomicop_routing_supported = "FALSE" *) 
(* c_dev_cap2_cas128_completer_supported = "FALSE" *) (* c_dev_cap2_tph_completer_supported = "00" *) (* c_dev_control_ext_tag_default = "FALSE" *) 
(* c_dev_port_type = "0" *) (* c_dis_lane_reverse = "TRUE" *) (* c_disable_rx_poisoned_resp = "FALSE" *) 
(* c_disable_scrambling = "FALSE" *) (* c_disable_tx_aspm_l0s = "FALSE" *) (* c_dll_lnk_actv_cap = "FALSE" *) 
(* c_dsi_bool = "FALSE" *) (* c_dsn_base_ptr = "100" *) (* c_dsn_cap_enabled = "TRUE" *) 
(* c_dsn_next_ptr = "000" *) (* c_enable_msg_route = "00000000000" *) (* c_ep_l0s_accpt_lat = "0" *) 
(* c_ep_l1_accpt_lat = "7" *) (* c_ext_pci_cfg_space_addr = "3FF" *) (* c_external_clocking = "TRUE" *) 
(* c_fc_cpld = "461" *) (* c_fc_cplh = "36" *) (* c_fc_npd = "24" *) 
(* c_fc_nph = "12" *) (* c_fc_pd = "437" *) (* c_fc_ph = "32" *) 
(* c_gen1 = "FALSE" *) (* c_header_type = "00" *) (* c_hw_auton_spd_disable = "FALSE" *) 
(* c_int_width = "64" *) (* c_last_cfg_dw = "10C" *) (* c_link_cap_aspm_optionality = "FALSE" *) 
(* c_ll_ack_timeout = "0000" *) (* c_ll_ack_timeout_enable = "FALSE" *) (* c_ll_ack_timeout_function = "0" *) 
(* c_ll_replay_timeout = "0000" *) (* c_ll_replay_timeout_enable = "FALSE" *) (* c_ll_replay_timeout_func = "1" *) 
(* c_lnk_bndwdt_notif = "FALSE" *) (* c_msi = "0" *) (* c_msi_64b_addr = "TRUE" *) 
(* c_msi_cap_on = "TRUE" *) (* c_msi_mult_msg_extn = "0" *) (* c_msi_per_vctr_mask_cap = "FALSE" *) 
(* c_msix_cap_on = "FALSE" *) (* c_msix_next_ptr = "00" *) (* c_msix_pba_bir = "0" *) 
(* c_msix_pba_offset = "0" *) (* c_msix_table_bir = "0" *) (* c_msix_table_offset = "0" *) 
(* c_msix_table_size = "000" *) (* c_pci_cfg_space_addr = "3F" *) (* c_pcie_blk_locn = "0" *) 
(* c_pcie_cap_next_ptr = "00" *) (* c_pcie_cap_slot_implemented = "FALSE" *) (* c_pcie_dbg_ports = "TRUE" *) 
(* c_pcie_fast_config = "0" *) (* c_perf_level_high = "TRUE" *) (* c_phantom_functions = "0" *) 
(* c_pm_cap_next_ptr = "48" *) (* c_pme_support = "0F" *) (* c_rbar_base_ptr = "000" *) 
(* c_rbar_cap_control_encodedbar0 = "00" *) (* c_rbar_cap_control_encodedbar1 = "00" *) (* c_rbar_cap_control_encodedbar2 = "00" *) 
(* c_rbar_cap_control_encodedbar3 = "00" *) (* c_rbar_cap_control_encodedbar4 = "00" *) (* c_rbar_cap_control_encodedbar5 = "00" *) 
(* c_rbar_cap_index0 = "0" *) (* c_rbar_cap_index1 = "0" *) (* c_rbar_cap_index2 = "0" *) 
(* c_rbar_cap_index3 = "0" *) (* c_rbar_cap_index4 = "0" *) (* c_rbar_cap_index5 = "0" *) 
(* c_rbar_cap_nextptr = "000" *) (* c_rbar_cap_on = "FALSE" *) (* c_rbar_cap_sup0 = "00001" *) 
(* c_rbar_cap_sup1 = "00001" *) (* c_rbar_cap_sup2 = "00001" *) (* c_rbar_cap_sup3 = "00001" *) 
(* c_rbar_cap_sup4 = "00001" *) (* c_rbar_cap_sup5 = "00001" *) (* c_rbar_num = "0" *) 
(* c_rcb = "0" *) (* c_recrc_check = "0" *) (* c_recrc_check_trim = "FALSE" *) 
(* c_rev_gt_order = "FALSE" *) (* c_root_cap_crs = "FALSE" *) (* c_rx_raddr_lat = "0" *) 
(* c_rx_ram_limit = "7FF" *) (* c_rx_rdata_lat = "2" *) (* c_rx_write_lat = "0" *) 
(* c_silicon_rev = "2" *) (* c_slot_cap_attn_butn = "FALSE" *) (* c_slot_cap_attn_ind = "FALSE" *) 
(* c_slot_cap_elec_interlock = "FALSE" *) (* c_slot_cap_hotplug_cap = "FALSE" *) (* c_slot_cap_hotplug_surprise = "FALSE" *) 
(* c_slot_cap_mrl = "FALSE" *) (* c_slot_cap_no_cmd_comp_sup = "FALSE" *) (* c_slot_cap_physical_slot_num = "0" *) 
(* c_slot_cap_pwr_ctrl = "FALSE" *) (* c_slot_cap_pwr_ind = "FALSE" *) (* c_slot_cap_pwr_limit_scale = "0" *) 
(* c_slot_cap_pwr_limit_value = "0" *) (* c_surprise_dn_err_cap = "FALSE" *) (* c_trgt_lnk_spd = "0" *) 
(* c_trn_np_fc = "TRUE" *) (* c_tx_last_tlp = "29" *) (* c_tx_raddr_lat = "0" *) 
(* c_tx_rdata_lat = "2" *) (* c_tx_write_lat = "0" *) (* c_upconfig_capable = "TRUE" *) 
(* c_upstream_facing = "TRUE" *) (* c_ur_atomic = "FALSE" *) (* c_ur_inv_req = "TRUE" *) 
(* c_ur_prs_response = "TRUE" *) (* c_vc_base_ptr = "000" *) (* c_vc_cap_enabled = "FALSE" *) 
(* c_vc_cap_reject_snoop = "FALSE" *) (* c_vc_next_ptr = "000" *) (* c_vsec_base_ptr = "000" *) 
(* c_vsec_cap_enabled = "FALSE" *) (* c_vsec_next_ptr = "000" *) (* c_xlnx_ref_board = "NONE" *) 
(* cap_ver = "2" *) (* cardbus_cis_ptr = "00000000" *) (* class_code = "058000" *) 
(* cmps = "2" *) (* con_scl_fctr_d0_state = "0" *) (* con_scl_fctr_d1_state = "0" *) 
(* con_scl_fctr_d2_state = "0" *) (* con_scl_fctr_d3_state = "0" *) (* cost_table = "1" *) 
(* d1_sup = "0" *) (* d2_sup = "0" *) (* dev_id = "7011" *) 
(* dev_port_type = "0000" *) (* dis_scl_fctr_d0_state = "0" *) (* dis_scl_fctr_d1_state = "0" *) 
(* dis_scl_fctr_d2_state = "0" *) (* dis_scl_fctr_d3_state = "0" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* dsi = "0" *) (* ep_l0s_accpt_lat = "000" *) (* ep_l1_accpt_lat = "111" *) 
(* ext_tag_fld_sup = "FALSE" *) (* int_pin = "1" *) (* intx = "TRUE" *) 
(* max_lnk_spd = "1" *) (* max_lnk_wdt = "000001" *) (* mps = "010" *) 
(* no_soft_rst = "TRUE" *) (* pci_exp_int_freq = "1" *) (* pci_exp_ref_freq = "0" *) 
(* phantm_func_sup = "00" *) (* pme_sup = "0F" *) (* pwr_con_d0_state = "00" *) 
(* pwr_con_d1_state = "00" *) (* pwr_con_d2_state = "00" *) (* pwr_con_d3_state = "00" *) 
(* pwr_dis_d0_state = "00" *) (* pwr_dis_d1_state = "00" *) (* pwr_dis_d2_state = "00" *) 
(* pwr_dis_d3_state = "00" *) (* rev_id = "00" *) (* slot_clk = "TRUE" *) 
(* subsys_id = "0007" *) (* subsys_ven_id = "10EE" *) (* ven_id = "10EE" *) 
(* xrom_bar = "00000000" *) 
module pcie_7x_0_pcie2_top
   (pci_exp_txp,
    pci_exp_txn,
    pci_exp_rxp,
    pci_exp_rxn,
    int_pclk_out_slave,
    int_pipe_rxusrclk_out,
    int_rxoutclk_out,
    int_dclk_out,
    int_userclk1_out,
    int_userclk2_out,
    int_oobclk_out,
    int_mmcm_lock_out,
    int_qplllock_out,
    int_qplloutclk_out,
    int_qplloutrefclk_out,
    int_pclk_sel_slave,
    pipe_pclk_in,
    pipe_rxusrclk_in,
    pipe_rxoutclk_in,
    pipe_dclk_in,
    pipe_userclk1_in,
    pipe_userclk2_in,
    pipe_oobclk_in,
    pipe_mmcm_lock_in,
    pipe_txoutclk_out,
    pipe_rxoutclk_out,
    pipe_pclk_sel_out,
    pipe_gen3_out,
    user_clk_out,
    user_reset_out,
    user_lnk_up,
    user_app_rdy,
    tx_buf_av,
    tx_cfg_req,
    tx_err_drop,
    s_axis_tx_tready,
    s_axis_tx_tdata,
    s_axis_tx_tkeep,
    s_axis_tx_tlast,
    s_axis_tx_tvalid,
    s_axis_tx_tuser,
    tx_cfg_gnt,
    m_axis_rx_tdata,
    m_axis_rx_tkeep,
    m_axis_rx_tlast,
    m_axis_rx_tvalid,
    m_axis_rx_tready,
    m_axis_rx_tuser,
    rx_np_ok,
    rx_np_req,
    fc_cpld,
    fc_cplh,
    fc_npd,
    fc_nph,
    fc_pd,
    fc_ph,
    fc_sel,
    cfg_mgmt_do,
    cfg_mgmt_rd_wr_done,
    cfg_status,
    cfg_command,
    cfg_dstatus,
    cfg_dcommand,
    cfg_lstatus,
    cfg_lcommand,
    cfg_dcommand2,
    cfg_pcie_link_state,
    cfg_pmcsr_pme_en,
    cfg_pmcsr_powerstate,
    cfg_pmcsr_pme_status,
    cfg_received_func_lvl_rst,
    cfg_mgmt_di,
    cfg_mgmt_byte_en,
    cfg_mgmt_dwaddr,
    cfg_mgmt_wr_en,
    cfg_mgmt_rd_en,
    cfg_mgmt_wr_readonly,
    cfg_err_ecrc,
    cfg_err_ur,
    cfg_err_cpl_timeout,
    cfg_err_cpl_unexpect,
    cfg_err_cpl_abort,
    cfg_err_posted,
    cfg_err_cor,
    cfg_err_atomic_egress_blocked,
    cfg_err_internal_cor,
    cfg_err_malformed,
    cfg_err_mc_blocked,
    cfg_err_poisoned,
    cfg_err_norecovery,
    cfg_err_tlp_cpl_header,
    cfg_err_cpl_rdy,
    cfg_err_locked,
    cfg_err_acs,
    cfg_err_internal_uncor,
    cfg_trn_pending,
    cfg_pm_halt_aspm_l0s,
    cfg_pm_halt_aspm_l1,
    cfg_pm_force_state_en,
    cfg_pm_force_state,
    cfg_dsn,
    cfg_interrupt,
    cfg_interrupt_rdy,
    cfg_interrupt_assert,
    cfg_interrupt_di,
    cfg_interrupt_do,
    cfg_interrupt_mmenable,
    cfg_interrupt_msienable,
    cfg_interrupt_msixenable,
    cfg_interrupt_msixfm,
    cfg_interrupt_stat,
    cfg_pciecap_interrupt_msgnum,
    cfg_to_turnoff,
    cfg_turnoff_ok,
    cfg_bus_number,
    cfg_device_number,
    cfg_function_number,
    cfg_pm_wake,
    cfg_pm_send_pme_to,
    cfg_ds_bus_number,
    cfg_ds_device_number,
    cfg_ds_function_number,
    cfg_mgmt_wr_rw1c_as_rw,
    cfg_msg_received,
    cfg_msg_data,
    cfg_bridge_serr_en,
    cfg_slot_control_electromech_il_ctl_pulse,
    cfg_root_control_syserr_corr_err_en,
    cfg_root_control_syserr_non_fatal_err_en,
    cfg_root_control_syserr_fatal_err_en,
    cfg_root_control_pme_int_en,
    cfg_aer_rooterr_corr_err_reporting_en,
    cfg_aer_rooterr_non_fatal_err_reporting_en,
    cfg_aer_rooterr_fatal_err_reporting_en,
    cfg_aer_rooterr_corr_err_received,
    cfg_aer_rooterr_non_fatal_err_received,
    cfg_aer_rooterr_fatal_err_received,
    cfg_msg_received_err_cor,
    cfg_msg_received_err_non_fatal,
    cfg_msg_received_err_fatal,
    cfg_msg_received_pm_as_nak,
    cfg_msg_received_pm_pme,
    cfg_msg_received_pme_to_ack,
    cfg_msg_received_assert_int_a,
    cfg_msg_received_assert_int_b,
    cfg_msg_received_assert_int_c,
    cfg_msg_received_assert_int_d,
    cfg_msg_received_deassert_int_a,
    cfg_msg_received_deassert_int_b,
    cfg_msg_received_deassert_int_c,
    cfg_msg_received_deassert_int_d,
    cfg_msg_received_setslotpowerlimit,
    pl_directed_link_change,
    pl_directed_link_width,
    pl_directed_link_speed,
    pl_directed_link_auton,
    pl_upstream_prefer_deemph,
    pl_sel_lnk_rate,
    pl_sel_lnk_width,
    pl_ltssm_state,
    pl_lane_reversal_mode,
    pl_phy_lnk_up,
    pl_tx_pm_state,
    pl_rx_pm_state,
    pl_link_upcfg_cap,
    pl_link_gen2_cap,
    pl_link_partner_gen2_supported,
    pl_initial_link_width,
    pl_directed_change_done,
    pl_received_hot_rst,
    pl_transmit_hot_rst,
    pl_downstream_deemph_source,
    cfg_err_aer_headerlog,
    cfg_aer_interrupt_msgnum,
    cfg_err_aer_headerlog_set,
    cfg_aer_ecrc_check_en,
    cfg_aer_ecrc_gen_en,
    cfg_vc_tcvc_map,
    sys_clk,
    sys_rst_n,
    pipe_mmcm_rst_n,
    common_commands_in,
    pipe_rx_0_sigs,
    pipe_rx_1_sigs,
    pipe_rx_2_sigs,
    pipe_rx_3_sigs,
    pipe_rx_4_sigs,
    pipe_rx_5_sigs,
    pipe_rx_6_sigs,
    pipe_rx_7_sigs,
    common_commands_out,
    pipe_tx_0_sigs,
    pipe_tx_1_sigs,
    pipe_tx_2_sigs,
    pipe_tx_3_sigs,
    pipe_tx_4_sigs,
    pipe_tx_5_sigs,
    pipe_tx_6_sigs,
    pipe_tx_7_sigs,
    cfg_dev_id_pf0,
    cfg_ven_id,
    cfg_rev_id_pf0,
    cfg_subsys_id_pf0,
    cfg_subsys_ven_id,
    startup_eos_in,
    startup_cfgclk,
    startup_cfgmclk,
    startup_eos,
    startup_preq,
    startup_clk,
    startup_gsr,
    startup_gts,
    startup_keyclearb,
    startup_pack,
    startup_usrcclko,
    startup_usrcclkts,
    startup_usrdoneo,
    startup_usrdonets,
    icap_clk,
    icap_csib,
    icap_rdwrb,
    icap_i,
    icap_o,
    qpll_drp_crscode,
    qpll_drp_fsm,
    qpll_drp_done,
    qpll_drp_reset,
    qpll_qplllock,
    qpll_qplloutclk,
    qpll_qplloutrefclk,
    qpll_qplld,
    qpll_qpllreset,
    qpll_drp_clk,
    qpll_drp_rst_n,
    qpll_drp_ovrd,
    qpll_drp_gen3,
    qpll_drp_start,
    pipe_txprbssel,
    pipe_rxprbssel,
    pipe_txprbsforceerr,
    pipe_rxprbscntreset,
    pipe_loopback,
    pipe_rxprbserr,
    pipe_txinhibit,
    pipe_rst_fsm,
    pipe_qrst_fsm,
    pipe_rate_fsm,
    pipe_sync_fsm_tx,
    pipe_sync_fsm_rx,
    pipe_drp_fsm,
    pipe_rst_idle,
    pipe_qrst_idle,
    pipe_rate_idle,
    pipe_eyescandataerror,
    pipe_rxstatus,
    pipe_dmonitorout,
    pipe_cpll_lock,
    pipe_qpll_lock,
    pipe_rxpmaresetdone,
    pipe_rxbufstatus,
    pipe_txphaligndone,
    pipe_txphinitdone,
    pipe_txdlysresetdone,
    pipe_rxphaligndone,
    pipe_rxdlysresetdone,
    pipe_rxsyncdone,
    pipe_rxdisperr,
    pipe_rxnotintable,
    pipe_rxcommadet,
    gt_ch_drp_rdy,
    pipe_debug_0,
    pipe_debug_1,
    pipe_debug_2,
    pipe_debug_3,
    pipe_debug_4,
    pipe_debug_5,
    pipe_debug_6,
    pipe_debug_7,
    pipe_debug_8,
    pipe_debug_9,
    pipe_debug,
    ext_ch_gt_drpclk,
    ext_ch_gt_drpaddr,
    ext_ch_gt_drpen,
    ext_ch_gt_drpdi,
    ext_ch_gt_drpwe,
    ext_ch_gt_drpdo,
    ext_ch_gt_drprdy,
    pcie_drp_clk,
    pcie_drp_en,
    pcie_drp_we,
    pcie_drp_addr,
    pcie_drp_di,
    pcie_drp_do,
    pcie_drp_rdy);
  output [0:0]pci_exp_txp;
  output [0:0]pci_exp_txn;
  input [0:0]pci_exp_rxp;
  input [0:0]pci_exp_rxn;
  output int_pclk_out_slave;
  output int_pipe_rxusrclk_out;
  output [0:0]int_rxoutclk_out;
  output int_dclk_out;
  output int_userclk1_out;
  output int_userclk2_out;
  output int_oobclk_out;
  output int_mmcm_lock_out;
  output [1:0]int_qplllock_out;
  output [1:0]int_qplloutclk_out;
  output [1:0]int_qplloutrefclk_out;
  input [0:0]int_pclk_sel_slave;
  input pipe_pclk_in;
  input pipe_rxusrclk_in;
  input [0:0]pipe_rxoutclk_in;
  input pipe_dclk_in;
  input pipe_userclk1_in;
  input pipe_userclk2_in;
  input pipe_oobclk_in;
  input pipe_mmcm_lock_in;
  output pipe_txoutclk_out;
  output [0:0]pipe_rxoutclk_out;
  output [0:0]pipe_pclk_sel_out;
  output pipe_gen3_out;
  output user_clk_out;
  output user_reset_out;
  output user_lnk_up;
  output user_app_rdy;
  output [5:0]tx_buf_av;
  output tx_cfg_req;
  output tx_err_drop;
  output s_axis_tx_tready;
  input [63:0]s_axis_tx_tdata;
  input [7:0]s_axis_tx_tkeep;
  input s_axis_tx_tlast;
  input s_axis_tx_tvalid;
  input [3:0]s_axis_tx_tuser;
  input tx_cfg_gnt;
  output [63:0]m_axis_rx_tdata;
  output [7:0]m_axis_rx_tkeep;
  output m_axis_rx_tlast;
  output m_axis_rx_tvalid;
  input m_axis_rx_tready;
  output [21:0]m_axis_rx_tuser;
  input rx_np_ok;
  input rx_np_req;
  output [11:0]fc_cpld;
  output [7:0]fc_cplh;
  output [11:0]fc_npd;
  output [7:0]fc_nph;
  output [11:0]fc_pd;
  output [7:0]fc_ph;
  input [2:0]fc_sel;
  output [31:0]cfg_mgmt_do;
  output cfg_mgmt_rd_wr_done;
  output [15:0]cfg_status;
  output [15:0]cfg_command;
  output [15:0]cfg_dstatus;
  output [15:0]cfg_dcommand;
  output [15:0]cfg_lstatus;
  output [15:0]cfg_lcommand;
  output [15:0]cfg_dcommand2;
  output [2:0]cfg_pcie_link_state;
  output cfg_pmcsr_pme_en;
  output [1:0]cfg_pmcsr_powerstate;
  output cfg_pmcsr_pme_status;
  output cfg_received_func_lvl_rst;
  input [31:0]cfg_mgmt_di;
  input [3:0]cfg_mgmt_byte_en;
  input [9:0]cfg_mgmt_dwaddr;
  input cfg_mgmt_wr_en;
  input cfg_mgmt_rd_en;
  input cfg_mgmt_wr_readonly;
  input cfg_err_ecrc;
  input cfg_err_ur;
  input cfg_err_cpl_timeout;
  input cfg_err_cpl_unexpect;
  input cfg_err_cpl_abort;
  input cfg_err_posted;
  input cfg_err_cor;
  input cfg_err_atomic_egress_blocked;
  input cfg_err_internal_cor;
  input cfg_err_malformed;
  input cfg_err_mc_blocked;
  input cfg_err_poisoned;
  input cfg_err_norecovery;
  input [47:0]cfg_err_tlp_cpl_header;
  output cfg_err_cpl_rdy;
  input cfg_err_locked;
  input cfg_err_acs;
  input cfg_err_internal_uncor;
  input cfg_trn_pending;
  input cfg_pm_halt_aspm_l0s;
  input cfg_pm_halt_aspm_l1;
  input cfg_pm_force_state_en;
  input [1:0]cfg_pm_force_state;
  input [63:0]cfg_dsn;
  input cfg_interrupt;
  output cfg_interrupt_rdy;
  input cfg_interrupt_assert;
  input [7:0]cfg_interrupt_di;
  output [7:0]cfg_interrupt_do;
  output [2:0]cfg_interrupt_mmenable;
  output cfg_interrupt_msienable;
  output cfg_interrupt_msixenable;
  output cfg_interrupt_msixfm;
  input cfg_interrupt_stat;
  input [4:0]cfg_pciecap_interrupt_msgnum;
  output cfg_to_turnoff;
  input cfg_turnoff_ok;
  output [7:0]cfg_bus_number;
  output [4:0]cfg_device_number;
  output [2:0]cfg_function_number;
  input cfg_pm_wake;
  input cfg_pm_send_pme_to;
  input [7:0]cfg_ds_bus_number;
  input [4:0]cfg_ds_device_number;
  input [2:0]cfg_ds_function_number;
  input cfg_mgmt_wr_rw1c_as_rw;
  output cfg_msg_received;
  output [15:0]cfg_msg_data;
  output cfg_bridge_serr_en;
  output cfg_slot_control_electromech_il_ctl_pulse;
  output cfg_root_control_syserr_corr_err_en;
  output cfg_root_control_syserr_non_fatal_err_en;
  output cfg_root_control_syserr_fatal_err_en;
  output cfg_root_control_pme_int_en;
  output cfg_aer_rooterr_corr_err_reporting_en;
  output cfg_aer_rooterr_non_fatal_err_reporting_en;
  output cfg_aer_rooterr_fatal_err_reporting_en;
  output cfg_aer_rooterr_corr_err_received;
  output cfg_aer_rooterr_non_fatal_err_received;
  output cfg_aer_rooterr_fatal_err_received;
  output cfg_msg_received_err_cor;
  output cfg_msg_received_err_non_fatal;
  output cfg_msg_received_err_fatal;
  output cfg_msg_received_pm_as_nak;
  output cfg_msg_received_pm_pme;
  output cfg_msg_received_pme_to_ack;
  output cfg_msg_received_assert_int_a;
  output cfg_msg_received_assert_int_b;
  output cfg_msg_received_assert_int_c;
  output cfg_msg_received_assert_int_d;
  output cfg_msg_received_deassert_int_a;
  output cfg_msg_received_deassert_int_b;
  output cfg_msg_received_deassert_int_c;
  output cfg_msg_received_deassert_int_d;
  output cfg_msg_received_setslotpowerlimit;
  input [1:0]pl_directed_link_change;
  input [1:0]pl_directed_link_width;
  input pl_directed_link_speed;
  input pl_directed_link_auton;
  input pl_upstream_prefer_deemph;
  output pl_sel_lnk_rate;
  output [1:0]pl_sel_lnk_width;
  output [5:0]pl_ltssm_state;
  output [1:0]pl_lane_reversal_mode;
  output pl_phy_lnk_up;
  output [2:0]pl_tx_pm_state;
  output [1:0]pl_rx_pm_state;
  output pl_link_upcfg_cap;
  output pl_link_gen2_cap;
  output pl_link_partner_gen2_supported;
  output [2:0]pl_initial_link_width;
  output pl_directed_change_done;
  output pl_received_hot_rst;
  input pl_transmit_hot_rst;
  input pl_downstream_deemph_source;
  input [127:0]cfg_err_aer_headerlog;
  input [4:0]cfg_aer_interrupt_msgnum;
  output cfg_err_aer_headerlog_set;
  output cfg_aer_ecrc_check_en;
  output cfg_aer_ecrc_gen_en;
  output [6:0]cfg_vc_tcvc_map;
  input sys_clk;
  input sys_rst_n;
  input pipe_mmcm_rst_n;
  input [11:0]common_commands_in;
  input [24:0]pipe_rx_0_sigs;
  input [24:0]pipe_rx_1_sigs;
  input [24:0]pipe_rx_2_sigs;
  input [24:0]pipe_rx_3_sigs;
  input [24:0]pipe_rx_4_sigs;
  input [24:0]pipe_rx_5_sigs;
  input [24:0]pipe_rx_6_sigs;
  input [24:0]pipe_rx_7_sigs;
  output [11:0]common_commands_out;
  output [24:0]pipe_tx_0_sigs;
  output [24:0]pipe_tx_1_sigs;
  output [24:0]pipe_tx_2_sigs;
  output [24:0]pipe_tx_3_sigs;
  output [24:0]pipe_tx_4_sigs;
  output [24:0]pipe_tx_5_sigs;
  output [24:0]pipe_tx_6_sigs;
  output [24:0]pipe_tx_7_sigs;
  input [15:0]cfg_dev_id_pf0;
  input [15:0]cfg_ven_id;
  input [7:0]cfg_rev_id_pf0;
  input [15:0]cfg_subsys_id_pf0;
  input [15:0]cfg_subsys_ven_id;
  input startup_eos_in;
  output startup_cfgclk;
  output startup_cfgmclk;
  output startup_eos;
  output startup_preq;
  input startup_clk;
  input startup_gsr;
  input startup_gts;
  input startup_keyclearb;
  input startup_pack;
  input startup_usrcclko;
  input startup_usrcclkts;
  input startup_usrdoneo;
  input startup_usrdonets;
  input icap_clk;
  input icap_csib;
  input icap_rdwrb;
  input [31:0]icap_i;
  output [31:0]icap_o;
  input [11:0]qpll_drp_crscode;
  input [17:0]qpll_drp_fsm;
  input [1:0]qpll_drp_done;
  input [1:0]qpll_drp_reset;
  input [1:0]qpll_qplllock;
  input [1:0]qpll_qplloutclk;
  input [1:0]qpll_qplloutrefclk;
  output qpll_qplld;
  output [1:0]qpll_qpllreset;
  output qpll_drp_clk;
  output qpll_drp_rst_n;
  output qpll_drp_ovrd;
  output qpll_drp_gen3;
  output qpll_drp_start;
  input [2:0]pipe_txprbssel;
  input [2:0]pipe_rxprbssel;
  input pipe_txprbsforceerr;
  input pipe_rxprbscntreset;
  input [2:0]pipe_loopback;
  output [0:0]pipe_rxprbserr;
  input [0:0]pipe_txinhibit;
  output [4:0]pipe_rst_fsm;
  output [11:0]pipe_qrst_fsm;
  output [4:0]pipe_rate_fsm;
  output [5:0]pipe_sync_fsm_tx;
  output [6:0]pipe_sync_fsm_rx;
  output [6:0]pipe_drp_fsm;
  output pipe_rst_idle;
  output pipe_qrst_idle;
  output pipe_rate_idle;
  output [0:0]pipe_eyescandataerror;
  output [2:0]pipe_rxstatus;
  output [14:0]pipe_dmonitorout;
  output [0:0]pipe_cpll_lock;
  output [0:0]pipe_qpll_lock;
  output [0:0]pipe_rxpmaresetdone;
  output [2:0]pipe_rxbufstatus;
  output [0:0]pipe_txphaligndone;
  output [0:0]pipe_txphinitdone;
  output [0:0]pipe_txdlysresetdone;
  output [0:0]pipe_rxphaligndone;
  output [0:0]pipe_rxdlysresetdone;
  output [0:0]pipe_rxsyncdone;
  output [7:0]pipe_rxdisperr;
  output [7:0]pipe_rxnotintable;
  output [0:0]pipe_rxcommadet;
  output [0:0]gt_ch_drp_rdy;
  output [0:0]pipe_debug_0;
  output [0:0]pipe_debug_1;
  output [0:0]pipe_debug_2;
  output [0:0]pipe_debug_3;
  output [0:0]pipe_debug_4;
  output [0:0]pipe_debug_5;
  output [0:0]pipe_debug_6;
  output [0:0]pipe_debug_7;
  output [0:0]pipe_debug_8;
  output [0:0]pipe_debug_9;
  output [31:0]pipe_debug;
  output ext_ch_gt_drpclk;
  input [8:0]ext_ch_gt_drpaddr;
  input [0:0]ext_ch_gt_drpen;
  input [15:0]ext_ch_gt_drpdi;
  input [0:0]ext_ch_gt_drpwe;
  output [15:0]ext_ch_gt_drpdo;
  output [0:0]ext_ch_gt_drprdy;
  input pcie_drp_clk;
  input pcie_drp_en;
  input pcie_drp_we;
  input [8:0]pcie_drp_addr;
  input [15:0]pcie_drp_di;
  output [15:0]pcie_drp_do;
  output pcie_drp_rdy;

  wire \<const0> ;
  wire cfg_aer_ecrc_check_en;
  wire cfg_aer_ecrc_gen_en;
  wire [4:0]cfg_aer_interrupt_msgnum;
  wire cfg_aer_rooterr_corr_err_received;
  wire cfg_aer_rooterr_corr_err_reporting_en;
  wire cfg_aer_rooterr_fatal_err_received;
  wire cfg_aer_rooterr_fatal_err_reporting_en;
  wire cfg_aer_rooterr_non_fatal_err_received;
  wire cfg_aer_rooterr_non_fatal_err_reporting_en;
  wire cfg_bridge_serr_en;
  wire [7:0]cfg_bus_number;
  wire [10:0]\^cfg_command ;
  wire [14:0]\^cfg_dcommand ;
  wire [11:0]\^cfg_dcommand2 ;
  wire [4:0]cfg_device_number;
  wire [7:0]cfg_ds_bus_number;
  wire [4:0]cfg_ds_device_number;
  wire [2:0]cfg_ds_function_number;
  wire [63:0]cfg_dsn;
  wire [3:0]\^cfg_dstatus ;
  wire [127:0]cfg_err_aer_headerlog;
  wire cfg_err_aer_headerlog_set;
  wire cfg_err_atomic_egress_blocked;
  wire cfg_err_cor;
  wire cfg_err_cpl_abort;
  wire cfg_err_cpl_rdy;
  wire cfg_err_cpl_timeout;
  wire cfg_err_cpl_unexpect;
  wire cfg_err_ecrc;
  wire cfg_err_internal_cor;
  wire cfg_err_internal_uncor;
  wire cfg_err_locked;
  wire cfg_err_malformed;
  wire cfg_err_mc_blocked;
  wire cfg_err_norecovery;
  wire cfg_err_poisoned;
  wire cfg_err_posted;
  wire [47:0]cfg_err_tlp_cpl_header;
  wire cfg_err_ur;
  wire [2:0]cfg_function_number;
  wire cfg_interrupt;
  wire cfg_interrupt_assert;
  wire [7:0]cfg_interrupt_di;
  wire [7:0]cfg_interrupt_do;
  wire [2:0]cfg_interrupt_mmenable;
  wire cfg_interrupt_msienable;
  wire cfg_interrupt_msixenable;
  wire cfg_interrupt_msixfm;
  wire cfg_interrupt_rdy;
  wire cfg_interrupt_stat;
  wire [11:0]\^cfg_lcommand ;
  wire [15:0]\^cfg_lstatus ;
  wire [3:0]cfg_mgmt_byte_en;
  wire [31:0]cfg_mgmt_di;
  wire [31:0]cfg_mgmt_do;
  wire [9:0]cfg_mgmt_dwaddr;
  wire cfg_mgmt_rd_en;
  wire cfg_mgmt_rd_wr_done;
  wire cfg_mgmt_wr_en;
  wire cfg_mgmt_wr_readonly;
  wire cfg_mgmt_wr_rw1c_as_rw;
  wire [15:0]cfg_msg_data;
  wire cfg_msg_received;
  wire cfg_msg_received_assert_int_a;
  wire cfg_msg_received_assert_int_b;
  wire cfg_msg_received_assert_int_c;
  wire cfg_msg_received_assert_int_d;
  wire cfg_msg_received_deassert_int_a;
  wire cfg_msg_received_deassert_int_b;
  wire cfg_msg_received_deassert_int_c;
  wire cfg_msg_received_deassert_int_d;
  wire cfg_msg_received_err_cor;
  wire cfg_msg_received_err_fatal;
  wire cfg_msg_received_err_non_fatal;
  wire cfg_msg_received_pm_as_nak;
  wire cfg_msg_received_pm_pme;
  wire cfg_msg_received_pme_to_ack;
  wire cfg_msg_received_setslotpowerlimit;
  wire [2:0]cfg_pcie_link_state;
  wire [4:0]cfg_pciecap_interrupt_msgnum;
  wire [1:0]cfg_pm_force_state;
  wire cfg_pm_force_state_en;
  wire cfg_pm_halt_aspm_l0s;
  wire cfg_pm_halt_aspm_l1;
  wire cfg_pm_wake;
  wire cfg_pmcsr_pme_en;
  wire cfg_pmcsr_pme_status;
  wire [1:0]cfg_pmcsr_powerstate;
  wire cfg_received_func_lvl_rst;
  wire cfg_root_control_pme_int_en;
  wire cfg_root_control_syserr_corr_err_en;
  wire cfg_root_control_syserr_fatal_err_en;
  wire cfg_root_control_syserr_non_fatal_err_en;
  wire cfg_slot_control_electromech_il_ctl_pulse;
  wire cfg_to_turnoff;
  wire cfg_trn_pending;
  wire cfg_turnoff_ok;
  wire [6:0]cfg_vc_tcvc_map;
  wire [11:0]fc_cpld;
  wire [7:0]fc_cplh;
  wire [11:0]fc_npd;
  wire [7:0]fc_nph;
  wire [11:0]fc_pd;
  wire [7:0]fc_ph;
  wire [2:0]fc_sel;
  wire [63:0]m_axis_rx_tdata;
  wire [6:2]\^m_axis_rx_tkeep ;
  wire m_axis_rx_tlast;
  wire m_axis_rx_tready;
  wire [21:0]\^m_axis_rx_tuser ;
  wire m_axis_rx_tvalid;
  wire [0:0]pci_exp_rxn;
  wire [0:0]pci_exp_rxp;
  wire [0:0]pci_exp_txn;
  wire [0:0]pci_exp_txp;
  wire [8:0]pcie_drp_addr;
  wire pcie_drp_clk;
  wire [15:0]pcie_drp_di;
  wire [15:0]pcie_drp_do;
  wire pcie_drp_en;
  wire pcie_drp_rdy;
  wire pcie_drp_we;
  wire pipe_dclk_in;
  wire pipe_gen3_out;
  wire pipe_mmcm_lock_in;
  wire pipe_oobclk_in;
  wire pipe_pclk_in;
  wire [0:0]pipe_pclk_sel_out;
  wire [0:0]pipe_rxoutclk_out;
  wire pipe_rxusrclk_in;
  wire pipe_txoutclk_out;
  wire pipe_userclk1_in;
  wire pipe_userclk2_in;
  wire pl_directed_change_done;
  wire pl_directed_link_auton;
  wire [1:0]pl_directed_link_change;
  wire pl_directed_link_speed;
  wire [1:0]pl_directed_link_width;
  wire pl_downstream_deemph_source;
  wire [2:0]pl_initial_link_width;
  wire [1:0]pl_lane_reversal_mode;
  wire pl_link_gen2_cap;
  wire pl_link_partner_gen2_supported;
  wire pl_link_upcfg_cap;
  wire [5:0]pl_ltssm_state;
  wire pl_phy_lnk_up;
  wire pl_received_hot_rst;
  wire [1:0]pl_rx_pm_state;
  wire pl_sel_lnk_rate;
  wire [1:0]pl_sel_lnk_width;
  wire pl_transmit_hot_rst;
  wire [2:0]pl_tx_pm_state;
  wire pl_upstream_prefer_deemph;
  wire rx_np_ok;
  wire rx_np_req;
  wire [63:0]s_axis_tx_tdata;
  wire [7:0]s_axis_tx_tkeep;
  wire s_axis_tx_tlast;
  wire s_axis_tx_tready;
  wire [3:0]s_axis_tx_tuser;
  wire s_axis_tx_tvalid;
  wire sys_clk;
  wire sys_rst_n;
  wire [5:0]tx_buf_av;
  wire tx_cfg_gnt;
  wire tx_cfg_req;
  wire tx_err_drop;
  wire user_lnk_up;
  wire user_reset_out;

  assign cfg_command[15] = \<const0> ;
  assign cfg_command[14] = \<const0> ;
  assign cfg_command[13] = \<const0> ;
  assign cfg_command[12] = \<const0> ;
  assign cfg_command[11] = \<const0> ;
  assign cfg_command[10] = \^cfg_command [10];
  assign cfg_command[9] = \<const0> ;
  assign cfg_command[8] = \^cfg_command [8];
  assign cfg_command[7] = \<const0> ;
  assign cfg_command[6] = \<const0> ;
  assign cfg_command[5] = \<const0> ;
  assign cfg_command[4] = \<const0> ;
  assign cfg_command[3] = \<const0> ;
  assign cfg_command[2:0] = \^cfg_command [2:0];
  assign cfg_dcommand[15] = \<const0> ;
  assign cfg_dcommand[14:0] = \^cfg_dcommand [14:0];
  assign cfg_dcommand2[15] = \<const0> ;
  assign cfg_dcommand2[14] = \<const0> ;
  assign cfg_dcommand2[13] = \<const0> ;
  assign cfg_dcommand2[12] = \<const0> ;
  assign cfg_dcommand2[11:0] = \^cfg_dcommand2 [11:0];
  assign cfg_dstatus[15] = \<const0> ;
  assign cfg_dstatus[14] = \<const0> ;
  assign cfg_dstatus[13] = \<const0> ;
  assign cfg_dstatus[12] = \<const0> ;
  assign cfg_dstatus[11] = \<const0> ;
  assign cfg_dstatus[10] = \<const0> ;
  assign cfg_dstatus[9] = \<const0> ;
  assign cfg_dstatus[8] = \<const0> ;
  assign cfg_dstatus[7] = \<const0> ;
  assign cfg_dstatus[6] = \<const0> ;
  assign cfg_dstatus[5] = cfg_trn_pending;
  assign cfg_dstatus[4] = \<const0> ;
  assign cfg_dstatus[3:0] = \^cfg_dstatus [3:0];
  assign cfg_lcommand[15] = \<const0> ;
  assign cfg_lcommand[14] = \<const0> ;
  assign cfg_lcommand[13] = \<const0> ;
  assign cfg_lcommand[12] = \<const0> ;
  assign cfg_lcommand[11:3] = \^cfg_lcommand [11:3];
  assign cfg_lcommand[2] = \<const0> ;
  assign cfg_lcommand[1:0] = \^cfg_lcommand [1:0];
  assign cfg_lstatus[15:13] = \^cfg_lstatus [15:13];
  assign cfg_lstatus[12] = \<const0> ;
  assign cfg_lstatus[11] = \^cfg_lstatus [11];
  assign cfg_lstatus[10] = \<const0> ;
  assign cfg_lstatus[9] = \<const0> ;
  assign cfg_lstatus[8] = \<const0> ;
  assign cfg_lstatus[7:4] = \^cfg_lstatus [7:4];
  assign cfg_lstatus[3] = \<const0> ;
  assign cfg_lstatus[2] = \<const0> ;
  assign cfg_lstatus[1:0] = \^cfg_lstatus [1:0];
  assign cfg_status[15] = \<const0> ;
  assign cfg_status[14] = \<const0> ;
  assign cfg_status[13] = \<const0> ;
  assign cfg_status[12] = \<const0> ;
  assign cfg_status[11] = \<const0> ;
  assign cfg_status[10] = \<const0> ;
  assign cfg_status[9] = \<const0> ;
  assign cfg_status[8] = \<const0> ;
  assign cfg_status[7] = \<const0> ;
  assign cfg_status[6] = \<const0> ;
  assign cfg_status[5] = \<const0> ;
  assign cfg_status[4] = \<const0> ;
  assign cfg_status[3] = \<const0> ;
  assign cfg_status[2] = \<const0> ;
  assign cfg_status[1] = \<const0> ;
  assign cfg_status[0] = \<const0> ;
  assign common_commands_out[11] = \<const0> ;
  assign common_commands_out[10] = \<const0> ;
  assign common_commands_out[9] = \<const0> ;
  assign common_commands_out[8] = \<const0> ;
  assign common_commands_out[7] = \<const0> ;
  assign common_commands_out[6] = \<const0> ;
  assign common_commands_out[5] = \<const0> ;
  assign common_commands_out[4] = \<const0> ;
  assign common_commands_out[3] = \<const0> ;
  assign common_commands_out[2] = \<const0> ;
  assign common_commands_out[1] = \<const0> ;
  assign common_commands_out[0] = \<const0> ;
  assign ext_ch_gt_drpclk = \<const0> ;
  assign ext_ch_gt_drpdo[15] = \<const0> ;
  assign ext_ch_gt_drpdo[14] = \<const0> ;
  assign ext_ch_gt_drpdo[13] = \<const0> ;
  assign ext_ch_gt_drpdo[12] = \<const0> ;
  assign ext_ch_gt_drpdo[11] = \<const0> ;
  assign ext_ch_gt_drpdo[10] = \<const0> ;
  assign ext_ch_gt_drpdo[9] = \<const0> ;
  assign ext_ch_gt_drpdo[8] = \<const0> ;
  assign ext_ch_gt_drpdo[7] = \<const0> ;
  assign ext_ch_gt_drpdo[6] = \<const0> ;
  assign ext_ch_gt_drpdo[5] = \<const0> ;
  assign ext_ch_gt_drpdo[4] = \<const0> ;
  assign ext_ch_gt_drpdo[3] = \<const0> ;
  assign ext_ch_gt_drpdo[2] = \<const0> ;
  assign ext_ch_gt_drpdo[1] = \<const0> ;
  assign ext_ch_gt_drpdo[0] = \<const0> ;
  assign ext_ch_gt_drprdy[0] = \<const0> ;
  assign gt_ch_drp_rdy[0] = \<const0> ;
  assign icap_o[31] = \<const0> ;
  assign icap_o[30] = \<const0> ;
  assign icap_o[29] = \<const0> ;
  assign icap_o[28] = \<const0> ;
  assign icap_o[27] = \<const0> ;
  assign icap_o[26] = \<const0> ;
  assign icap_o[25] = \<const0> ;
  assign icap_o[24] = \<const0> ;
  assign icap_o[23] = \<const0> ;
  assign icap_o[22] = \<const0> ;
  assign icap_o[21] = \<const0> ;
  assign icap_o[20] = \<const0> ;
  assign icap_o[19] = \<const0> ;
  assign icap_o[18] = \<const0> ;
  assign icap_o[17] = \<const0> ;
  assign icap_o[16] = \<const0> ;
  assign icap_o[15] = \<const0> ;
  assign icap_o[14] = \<const0> ;
  assign icap_o[13] = \<const0> ;
  assign icap_o[12] = \<const0> ;
  assign icap_o[11] = \<const0> ;
  assign icap_o[10] = \<const0> ;
  assign icap_o[9] = \<const0> ;
  assign icap_o[8] = \<const0> ;
  assign icap_o[7] = \<const0> ;
  assign icap_o[6] = \<const0> ;
  assign icap_o[5] = \<const0> ;
  assign icap_o[4] = \<const0> ;
  assign icap_o[3] = \<const0> ;
  assign icap_o[2] = \<const0> ;
  assign icap_o[1] = \<const0> ;
  assign icap_o[0] = \<const0> ;
  assign int_dclk_out = \<const0> ;
  assign int_mmcm_lock_out = \<const0> ;
  assign int_oobclk_out = \<const0> ;
  assign int_pclk_out_slave = \<const0> ;
  assign int_pipe_rxusrclk_out = \<const0> ;
  assign int_qplllock_out[1] = \<const0> ;
  assign int_qplllock_out[0] = \<const0> ;
  assign int_qplloutclk_out[1] = \<const0> ;
  assign int_qplloutclk_out[0] = \<const0> ;
  assign int_qplloutrefclk_out[1] = \<const0> ;
  assign int_qplloutrefclk_out[0] = \<const0> ;
  assign int_rxoutclk_out[0] = \<const0> ;
  assign int_userclk1_out = \<const0> ;
  assign int_userclk2_out = \<const0> ;
  assign m_axis_rx_tkeep[7] = \^m_axis_rx_tkeep [6];
  assign m_axis_rx_tkeep[6] = \^m_axis_rx_tkeep [6];
  assign m_axis_rx_tkeep[5] = \^m_axis_rx_tkeep [6];
  assign m_axis_rx_tkeep[4] = \^m_axis_rx_tkeep [6];
  assign m_axis_rx_tkeep[3] = \^m_axis_rx_tkeep [2];
  assign m_axis_rx_tkeep[2] = \^m_axis_rx_tkeep [2];
  assign m_axis_rx_tkeep[1] = \^m_axis_rx_tkeep [2];
  assign m_axis_rx_tkeep[0] = \^m_axis_rx_tkeep [2];
  assign m_axis_rx_tuser[21] = \^m_axis_rx_tuser [21];
  assign m_axis_rx_tuser[20] = \<const0> ;
  assign m_axis_rx_tuser[19] = \^m_axis_rx_tuser [19];
  assign m_axis_rx_tuser[18] = \^m_axis_rx_tuser [17];
  assign m_axis_rx_tuser[17] = \^m_axis_rx_tuser [17];
  assign m_axis_rx_tuser[16] = \<const0> ;
  assign m_axis_rx_tuser[15] = \<const0> ;
  assign m_axis_rx_tuser[14] = \^m_axis_rx_tuser [14];
  assign m_axis_rx_tuser[13] = \<const0> ;
  assign m_axis_rx_tuser[12] = \<const0> ;
  assign m_axis_rx_tuser[11] = \<const0> ;
  assign m_axis_rx_tuser[10] = \<const0> ;
  assign m_axis_rx_tuser[9] = \<const0> ;
  assign m_axis_rx_tuser[8:0] = \^m_axis_rx_tuser [8:0];
  assign pipe_cpll_lock[0] = \<const0> ;
  assign pipe_debug[31] = \<const0> ;
  assign pipe_debug[30] = \<const0> ;
  assign pipe_debug[29] = \<const0> ;
  assign pipe_debug[28] = \<const0> ;
  assign pipe_debug[27] = \<const0> ;
  assign pipe_debug[26] = \<const0> ;
  assign pipe_debug[25] = \<const0> ;
  assign pipe_debug[24] = \<const0> ;
  assign pipe_debug[23] = \<const0> ;
  assign pipe_debug[22] = \<const0> ;
  assign pipe_debug[21] = \<const0> ;
  assign pipe_debug[20] = \<const0> ;
  assign pipe_debug[19] = \<const0> ;
  assign pipe_debug[18] = \<const0> ;
  assign pipe_debug[17] = \<const0> ;
  assign pipe_debug[16] = \<const0> ;
  assign pipe_debug[15] = \<const0> ;
  assign pipe_debug[14] = \<const0> ;
  assign pipe_debug[13] = \<const0> ;
  assign pipe_debug[12] = \<const0> ;
  assign pipe_debug[11] = \<const0> ;
  assign pipe_debug[10] = \<const0> ;
  assign pipe_debug[9] = \<const0> ;
  assign pipe_debug[8] = \<const0> ;
  assign pipe_debug[7] = \<const0> ;
  assign pipe_debug[6] = \<const0> ;
  assign pipe_debug[5] = \<const0> ;
  assign pipe_debug[4] = \<const0> ;
  assign pipe_debug[3] = \<const0> ;
  assign pipe_debug[2] = \<const0> ;
  assign pipe_debug[1] = \<const0> ;
  assign pipe_debug[0] = \<const0> ;
  assign pipe_debug_0[0] = \<const0> ;
  assign pipe_debug_1[0] = \<const0> ;
  assign pipe_debug_2[0] = \<const0> ;
  assign pipe_debug_3[0] = \<const0> ;
  assign pipe_debug_4[0] = \<const0> ;
  assign pipe_debug_5[0] = \<const0> ;
  assign pipe_debug_6[0] = \<const0> ;
  assign pipe_debug_7[0] = \<const0> ;
  assign pipe_debug_8[0] = \<const0> ;
  assign pipe_debug_9[0] = \<const0> ;
  assign pipe_dmonitorout[14] = \<const0> ;
  assign pipe_dmonitorout[13] = \<const0> ;
  assign pipe_dmonitorout[12] = \<const0> ;
  assign pipe_dmonitorout[11] = \<const0> ;
  assign pipe_dmonitorout[10] = \<const0> ;
  assign pipe_dmonitorout[9] = \<const0> ;
  assign pipe_dmonitorout[8] = \<const0> ;
  assign pipe_dmonitorout[7] = \<const0> ;
  assign pipe_dmonitorout[6] = \<const0> ;
  assign pipe_dmonitorout[5] = \<const0> ;
  assign pipe_dmonitorout[4] = \<const0> ;
  assign pipe_dmonitorout[3] = \<const0> ;
  assign pipe_dmonitorout[2] = \<const0> ;
  assign pipe_dmonitorout[1] = \<const0> ;
  assign pipe_dmonitorout[0] = \<const0> ;
  assign pipe_drp_fsm[6] = \<const0> ;
  assign pipe_drp_fsm[5] = \<const0> ;
  assign pipe_drp_fsm[4] = \<const0> ;
  assign pipe_drp_fsm[3] = \<const0> ;
  assign pipe_drp_fsm[2] = \<const0> ;
  assign pipe_drp_fsm[1] = \<const0> ;
  assign pipe_drp_fsm[0] = \<const0> ;
  assign pipe_eyescandataerror[0] = \<const0> ;
  assign pipe_qpll_lock[0] = \<const0> ;
  assign pipe_qrst_fsm[11] = \<const0> ;
  assign pipe_qrst_fsm[10] = \<const0> ;
  assign pipe_qrst_fsm[9] = \<const0> ;
  assign pipe_qrst_fsm[8] = \<const0> ;
  assign pipe_qrst_fsm[7] = \<const0> ;
  assign pipe_qrst_fsm[6] = \<const0> ;
  assign pipe_qrst_fsm[5] = \<const0> ;
  assign pipe_qrst_fsm[4] = \<const0> ;
  assign pipe_qrst_fsm[3] = \<const0> ;
  assign pipe_qrst_fsm[2] = \<const0> ;
  assign pipe_qrst_fsm[1] = \<const0> ;
  assign pipe_qrst_fsm[0] = \<const0> ;
  assign pipe_qrst_idle = \<const0> ;
  assign pipe_rate_fsm[4] = \<const0> ;
  assign pipe_rate_fsm[3] = \<const0> ;
  assign pipe_rate_fsm[2] = \<const0> ;
  assign pipe_rate_fsm[1] = \<const0> ;
  assign pipe_rate_fsm[0] = \<const0> ;
  assign pipe_rate_idle = \<const0> ;
  assign pipe_rst_fsm[4] = \<const0> ;
  assign pipe_rst_fsm[3] = \<const0> ;
  assign pipe_rst_fsm[2] = \<const0> ;
  assign pipe_rst_fsm[1] = \<const0> ;
  assign pipe_rst_fsm[0] = \<const0> ;
  assign pipe_rst_idle = \<const0> ;
  assign pipe_rxbufstatus[2] = \<const0> ;
  assign pipe_rxbufstatus[1] = \<const0> ;
  assign pipe_rxbufstatus[0] = \<const0> ;
  assign pipe_rxcommadet[0] = \<const0> ;
  assign pipe_rxdisperr[7] = \<const0> ;
  assign pipe_rxdisperr[6] = \<const0> ;
  assign pipe_rxdisperr[5] = \<const0> ;
  assign pipe_rxdisperr[4] = \<const0> ;
  assign pipe_rxdisperr[3] = \<const0> ;
  assign pipe_rxdisperr[2] = \<const0> ;
  assign pipe_rxdisperr[1] = \<const0> ;
  assign pipe_rxdisperr[0] = \<const0> ;
  assign pipe_rxdlysresetdone[0] = \<const0> ;
  assign pipe_rxnotintable[7] = \<const0> ;
  assign pipe_rxnotintable[6] = \<const0> ;
  assign pipe_rxnotintable[5] = \<const0> ;
  assign pipe_rxnotintable[4] = \<const0> ;
  assign pipe_rxnotintable[3] = \<const0> ;
  assign pipe_rxnotintable[2] = \<const0> ;
  assign pipe_rxnotintable[1] = \<const0> ;
  assign pipe_rxnotintable[0] = \<const0> ;
  assign pipe_rxphaligndone[0] = \<const0> ;
  assign pipe_rxpmaresetdone[0] = \<const0> ;
  assign pipe_rxprbserr[0] = \<const0> ;
  assign pipe_rxstatus[2] = \<const0> ;
  assign pipe_rxstatus[1] = \<const0> ;
  assign pipe_rxstatus[0] = \<const0> ;
  assign pipe_rxsyncdone[0] = \<const0> ;
  assign pipe_sync_fsm_rx[6] = \<const0> ;
  assign pipe_sync_fsm_rx[5] = \<const0> ;
  assign pipe_sync_fsm_rx[4] = \<const0> ;
  assign pipe_sync_fsm_rx[3] = \<const0> ;
  assign pipe_sync_fsm_rx[2] = \<const0> ;
  assign pipe_sync_fsm_rx[1] = \<const0> ;
  assign pipe_sync_fsm_rx[0] = \<const0> ;
  assign pipe_sync_fsm_tx[5] = \<const0> ;
  assign pipe_sync_fsm_tx[4] = \<const0> ;
  assign pipe_sync_fsm_tx[3] = \<const0> ;
  assign pipe_sync_fsm_tx[2] = \<const0> ;
  assign pipe_sync_fsm_tx[1] = \<const0> ;
  assign pipe_sync_fsm_tx[0] = \<const0> ;
  assign pipe_tx_0_sigs[24] = \<const0> ;
  assign pipe_tx_0_sigs[23] = \<const0> ;
  assign pipe_tx_0_sigs[22] = \<const0> ;
  assign pipe_tx_0_sigs[21] = \<const0> ;
  assign pipe_tx_0_sigs[20] = \<const0> ;
  assign pipe_tx_0_sigs[19] = \<const0> ;
  assign pipe_tx_0_sigs[18] = \<const0> ;
  assign pipe_tx_0_sigs[17] = \<const0> ;
  assign pipe_tx_0_sigs[16] = \<const0> ;
  assign pipe_tx_0_sigs[15] = \<const0> ;
  assign pipe_tx_0_sigs[14] = \<const0> ;
  assign pipe_tx_0_sigs[13] = \<const0> ;
  assign pipe_tx_0_sigs[12] = \<const0> ;
  assign pipe_tx_0_sigs[11] = \<const0> ;
  assign pipe_tx_0_sigs[10] = \<const0> ;
  assign pipe_tx_0_sigs[9] = \<const0> ;
  assign pipe_tx_0_sigs[8] = \<const0> ;
  assign pipe_tx_0_sigs[7] = \<const0> ;
  assign pipe_tx_0_sigs[6] = \<const0> ;
  assign pipe_tx_0_sigs[5] = \<const0> ;
  assign pipe_tx_0_sigs[4] = \<const0> ;
  assign pipe_tx_0_sigs[3] = \<const0> ;
  assign pipe_tx_0_sigs[2] = \<const0> ;
  assign pipe_tx_0_sigs[1] = \<const0> ;
  assign pipe_tx_0_sigs[0] = \<const0> ;
  assign pipe_tx_1_sigs[24] = \<const0> ;
  assign pipe_tx_1_sigs[23] = \<const0> ;
  assign pipe_tx_1_sigs[22] = \<const0> ;
  assign pipe_tx_1_sigs[21] = \<const0> ;
  assign pipe_tx_1_sigs[20] = \<const0> ;
  assign pipe_tx_1_sigs[19] = \<const0> ;
  assign pipe_tx_1_sigs[18] = \<const0> ;
  assign pipe_tx_1_sigs[17] = \<const0> ;
  assign pipe_tx_1_sigs[16] = \<const0> ;
  assign pipe_tx_1_sigs[15] = \<const0> ;
  assign pipe_tx_1_sigs[14] = \<const0> ;
  assign pipe_tx_1_sigs[13] = \<const0> ;
  assign pipe_tx_1_sigs[12] = \<const0> ;
  assign pipe_tx_1_sigs[11] = \<const0> ;
  assign pipe_tx_1_sigs[10] = \<const0> ;
  assign pipe_tx_1_sigs[9] = \<const0> ;
  assign pipe_tx_1_sigs[8] = \<const0> ;
  assign pipe_tx_1_sigs[7] = \<const0> ;
  assign pipe_tx_1_sigs[6] = \<const0> ;
  assign pipe_tx_1_sigs[5] = \<const0> ;
  assign pipe_tx_1_sigs[4] = \<const0> ;
  assign pipe_tx_1_sigs[3] = \<const0> ;
  assign pipe_tx_1_sigs[2] = \<const0> ;
  assign pipe_tx_1_sigs[1] = \<const0> ;
  assign pipe_tx_1_sigs[0] = \<const0> ;
  assign pipe_tx_2_sigs[24] = \<const0> ;
  assign pipe_tx_2_sigs[23] = \<const0> ;
  assign pipe_tx_2_sigs[22] = \<const0> ;
  assign pipe_tx_2_sigs[21] = \<const0> ;
  assign pipe_tx_2_sigs[20] = \<const0> ;
  assign pipe_tx_2_sigs[19] = \<const0> ;
  assign pipe_tx_2_sigs[18] = \<const0> ;
  assign pipe_tx_2_sigs[17] = \<const0> ;
  assign pipe_tx_2_sigs[16] = \<const0> ;
  assign pipe_tx_2_sigs[15] = \<const0> ;
  assign pipe_tx_2_sigs[14] = \<const0> ;
  assign pipe_tx_2_sigs[13] = \<const0> ;
  assign pipe_tx_2_sigs[12] = \<const0> ;
  assign pipe_tx_2_sigs[11] = \<const0> ;
  assign pipe_tx_2_sigs[10] = \<const0> ;
  assign pipe_tx_2_sigs[9] = \<const0> ;
  assign pipe_tx_2_sigs[8] = \<const0> ;
  assign pipe_tx_2_sigs[7] = \<const0> ;
  assign pipe_tx_2_sigs[6] = \<const0> ;
  assign pipe_tx_2_sigs[5] = \<const0> ;
  assign pipe_tx_2_sigs[4] = \<const0> ;
  assign pipe_tx_2_sigs[3] = \<const0> ;
  assign pipe_tx_2_sigs[2] = \<const0> ;
  assign pipe_tx_2_sigs[1] = \<const0> ;
  assign pipe_tx_2_sigs[0] = \<const0> ;
  assign pipe_tx_3_sigs[24] = \<const0> ;
  assign pipe_tx_3_sigs[23] = \<const0> ;
  assign pipe_tx_3_sigs[22] = \<const0> ;
  assign pipe_tx_3_sigs[21] = \<const0> ;
  assign pipe_tx_3_sigs[20] = \<const0> ;
  assign pipe_tx_3_sigs[19] = \<const0> ;
  assign pipe_tx_3_sigs[18] = \<const0> ;
  assign pipe_tx_3_sigs[17] = \<const0> ;
  assign pipe_tx_3_sigs[16] = \<const0> ;
  assign pipe_tx_3_sigs[15] = \<const0> ;
  assign pipe_tx_3_sigs[14] = \<const0> ;
  assign pipe_tx_3_sigs[13] = \<const0> ;
  assign pipe_tx_3_sigs[12] = \<const0> ;
  assign pipe_tx_3_sigs[11] = \<const0> ;
  assign pipe_tx_3_sigs[10] = \<const0> ;
  assign pipe_tx_3_sigs[9] = \<const0> ;
  assign pipe_tx_3_sigs[8] = \<const0> ;
  assign pipe_tx_3_sigs[7] = \<const0> ;
  assign pipe_tx_3_sigs[6] = \<const0> ;
  assign pipe_tx_3_sigs[5] = \<const0> ;
  assign pipe_tx_3_sigs[4] = \<const0> ;
  assign pipe_tx_3_sigs[3] = \<const0> ;
  assign pipe_tx_3_sigs[2] = \<const0> ;
  assign pipe_tx_3_sigs[1] = \<const0> ;
  assign pipe_tx_3_sigs[0] = \<const0> ;
  assign pipe_tx_4_sigs[24] = \<const0> ;
  assign pipe_tx_4_sigs[23] = \<const0> ;
  assign pipe_tx_4_sigs[22] = \<const0> ;
  assign pipe_tx_4_sigs[21] = \<const0> ;
  assign pipe_tx_4_sigs[20] = \<const0> ;
  assign pipe_tx_4_sigs[19] = \<const0> ;
  assign pipe_tx_4_sigs[18] = \<const0> ;
  assign pipe_tx_4_sigs[17] = \<const0> ;
  assign pipe_tx_4_sigs[16] = \<const0> ;
  assign pipe_tx_4_sigs[15] = \<const0> ;
  assign pipe_tx_4_sigs[14] = \<const0> ;
  assign pipe_tx_4_sigs[13] = \<const0> ;
  assign pipe_tx_4_sigs[12] = \<const0> ;
  assign pipe_tx_4_sigs[11] = \<const0> ;
  assign pipe_tx_4_sigs[10] = \<const0> ;
  assign pipe_tx_4_sigs[9] = \<const0> ;
  assign pipe_tx_4_sigs[8] = \<const0> ;
  assign pipe_tx_4_sigs[7] = \<const0> ;
  assign pipe_tx_4_sigs[6] = \<const0> ;
  assign pipe_tx_4_sigs[5] = \<const0> ;
  assign pipe_tx_4_sigs[4] = \<const0> ;
  assign pipe_tx_4_sigs[3] = \<const0> ;
  assign pipe_tx_4_sigs[2] = \<const0> ;
  assign pipe_tx_4_sigs[1] = \<const0> ;
  assign pipe_tx_4_sigs[0] = \<const0> ;
  assign pipe_tx_5_sigs[24] = \<const0> ;
  assign pipe_tx_5_sigs[23] = \<const0> ;
  assign pipe_tx_5_sigs[22] = \<const0> ;
  assign pipe_tx_5_sigs[21] = \<const0> ;
  assign pipe_tx_5_sigs[20] = \<const0> ;
  assign pipe_tx_5_sigs[19] = \<const0> ;
  assign pipe_tx_5_sigs[18] = \<const0> ;
  assign pipe_tx_5_sigs[17] = \<const0> ;
  assign pipe_tx_5_sigs[16] = \<const0> ;
  assign pipe_tx_5_sigs[15] = \<const0> ;
  assign pipe_tx_5_sigs[14] = \<const0> ;
  assign pipe_tx_5_sigs[13] = \<const0> ;
  assign pipe_tx_5_sigs[12] = \<const0> ;
  assign pipe_tx_5_sigs[11] = \<const0> ;
  assign pipe_tx_5_sigs[10] = \<const0> ;
  assign pipe_tx_5_sigs[9] = \<const0> ;
  assign pipe_tx_5_sigs[8] = \<const0> ;
  assign pipe_tx_5_sigs[7] = \<const0> ;
  assign pipe_tx_5_sigs[6] = \<const0> ;
  assign pipe_tx_5_sigs[5] = \<const0> ;
  assign pipe_tx_5_sigs[4] = \<const0> ;
  assign pipe_tx_5_sigs[3] = \<const0> ;
  assign pipe_tx_5_sigs[2] = \<const0> ;
  assign pipe_tx_5_sigs[1] = \<const0> ;
  assign pipe_tx_5_sigs[0] = \<const0> ;
  assign pipe_tx_6_sigs[24] = \<const0> ;
  assign pipe_tx_6_sigs[23] = \<const0> ;
  assign pipe_tx_6_sigs[22] = \<const0> ;
  assign pipe_tx_6_sigs[21] = \<const0> ;
  assign pipe_tx_6_sigs[20] = \<const0> ;
  assign pipe_tx_6_sigs[19] = \<const0> ;
  assign pipe_tx_6_sigs[18] = \<const0> ;
  assign pipe_tx_6_sigs[17] = \<const0> ;
  assign pipe_tx_6_sigs[16] = \<const0> ;
  assign pipe_tx_6_sigs[15] = \<const0> ;
  assign pipe_tx_6_sigs[14] = \<const0> ;
  assign pipe_tx_6_sigs[13] = \<const0> ;
  assign pipe_tx_6_sigs[12] = \<const0> ;
  assign pipe_tx_6_sigs[11] = \<const0> ;
  assign pipe_tx_6_sigs[10] = \<const0> ;
  assign pipe_tx_6_sigs[9] = \<const0> ;
  assign pipe_tx_6_sigs[8] = \<const0> ;
  assign pipe_tx_6_sigs[7] = \<const0> ;
  assign pipe_tx_6_sigs[6] = \<const0> ;
  assign pipe_tx_6_sigs[5] = \<const0> ;
  assign pipe_tx_6_sigs[4] = \<const0> ;
  assign pipe_tx_6_sigs[3] = \<const0> ;
  assign pipe_tx_6_sigs[2] = \<const0> ;
  assign pipe_tx_6_sigs[1] = \<const0> ;
  assign pipe_tx_6_sigs[0] = \<const0> ;
  assign pipe_tx_7_sigs[24] = \<const0> ;
  assign pipe_tx_7_sigs[23] = \<const0> ;
  assign pipe_tx_7_sigs[22] = \<const0> ;
  assign pipe_tx_7_sigs[21] = \<const0> ;
  assign pipe_tx_7_sigs[20] = \<const0> ;
  assign pipe_tx_7_sigs[19] = \<const0> ;
  assign pipe_tx_7_sigs[18] = \<const0> ;
  assign pipe_tx_7_sigs[17] = \<const0> ;
  assign pipe_tx_7_sigs[16] = \<const0> ;
  assign pipe_tx_7_sigs[15] = \<const0> ;
  assign pipe_tx_7_sigs[14] = \<const0> ;
  assign pipe_tx_7_sigs[13] = \<const0> ;
  assign pipe_tx_7_sigs[12] = \<const0> ;
  assign pipe_tx_7_sigs[11] = \<const0> ;
  assign pipe_tx_7_sigs[10] = \<const0> ;
  assign pipe_tx_7_sigs[9] = \<const0> ;
  assign pipe_tx_7_sigs[8] = \<const0> ;
  assign pipe_tx_7_sigs[7] = \<const0> ;
  assign pipe_tx_7_sigs[6] = \<const0> ;
  assign pipe_tx_7_sigs[5] = \<const0> ;
  assign pipe_tx_7_sigs[4] = \<const0> ;
  assign pipe_tx_7_sigs[3] = \<const0> ;
  assign pipe_tx_7_sigs[2] = \<const0> ;
  assign pipe_tx_7_sigs[1] = \<const0> ;
  assign pipe_tx_7_sigs[0] = \<const0> ;
  assign pipe_txdlysresetdone[0] = \<const0> ;
  assign pipe_txphaligndone[0] = \<const0> ;
  assign pipe_txphinitdone[0] = \<const0> ;
  assign qpll_drp_clk = \<const0> ;
  assign qpll_drp_gen3 = \<const0> ;
  assign qpll_drp_ovrd = \<const0> ;
  assign qpll_drp_rst_n = \<const0> ;
  assign qpll_drp_start = \<const0> ;
  assign qpll_qplld = \<const0> ;
  assign qpll_qpllreset[1] = \<const0> ;
  assign qpll_qpllreset[0] = \<const0> ;
  assign startup_cfgclk = \<const0> ;
  assign startup_cfgmclk = \<const0> ;
  assign startup_eos = \<const0> ;
  assign startup_preq = \<const0> ;
  assign user_app_rdy = \<const0> ;
  assign user_clk_out = pipe_userclk2_in;
  GND GND
       (.G(\<const0> ));
  pcie_7x_0_core_top inst
       (.cfg_aer_ecrc_check_en(cfg_aer_ecrc_check_en),
        .cfg_aer_ecrc_gen_en(cfg_aer_ecrc_gen_en),
        .cfg_aer_interrupt_msgnum(cfg_aer_interrupt_msgnum),
        .cfg_aer_rooterr_corr_err_received(cfg_aer_rooterr_corr_err_received),
        .cfg_aer_rooterr_corr_err_reporting_en(cfg_aer_rooterr_corr_err_reporting_en),
        .cfg_aer_rooterr_fatal_err_received(cfg_aer_rooterr_fatal_err_received),
        .cfg_aer_rooterr_fatal_err_reporting_en(cfg_aer_rooterr_fatal_err_reporting_en),
        .cfg_aer_rooterr_non_fatal_err_received(cfg_aer_rooterr_non_fatal_err_received),
        .cfg_aer_rooterr_non_fatal_err_reporting_en(cfg_aer_rooterr_non_fatal_err_reporting_en),
        .cfg_bridge_serr_en(cfg_bridge_serr_en),
        .cfg_bus_number(cfg_bus_number),
        .cfg_command({\^cfg_command [10],\^cfg_command [8],\^cfg_command [2:0]}),
        .cfg_dcommand(\^cfg_dcommand ),
        .cfg_dcommand2(\^cfg_dcommand2 ),
        .cfg_device_number(cfg_device_number),
        .cfg_ds_bus_number(cfg_ds_bus_number),
        .cfg_ds_device_number(cfg_ds_device_number),
        .cfg_ds_function_number(cfg_ds_function_number),
        .cfg_dsn(cfg_dsn),
        .cfg_dstatus(\^cfg_dstatus ),
        .cfg_err_aer_headerlog(cfg_err_aer_headerlog),
        .cfg_err_aer_headerlog_set(cfg_err_aer_headerlog_set),
        .cfg_err_atomic_egress_blocked(cfg_err_atomic_egress_blocked),
        .cfg_err_cor(cfg_err_cor),
        .cfg_err_cpl_abort(cfg_err_cpl_abort),
        .cfg_err_cpl_rdy(cfg_err_cpl_rdy),
        .cfg_err_cpl_timeout(cfg_err_cpl_timeout),
        .cfg_err_cpl_unexpect(cfg_err_cpl_unexpect),
        .cfg_err_ecrc(cfg_err_ecrc),
        .cfg_err_internal_cor(cfg_err_internal_cor),
        .cfg_err_internal_uncor(cfg_err_internal_uncor),
        .cfg_err_locked(cfg_err_locked),
        .cfg_err_malformed(cfg_err_malformed),
        .cfg_err_mc_blocked(cfg_err_mc_blocked),
        .cfg_err_norecovery(cfg_err_norecovery),
        .cfg_err_poisoned(cfg_err_poisoned),
        .cfg_err_posted(cfg_err_posted),
        .cfg_err_tlp_cpl_header(cfg_err_tlp_cpl_header),
        .cfg_err_ur(cfg_err_ur),
        .cfg_function_number(cfg_function_number),
        .cfg_interrupt(cfg_interrupt),
        .cfg_interrupt_assert(cfg_interrupt_assert),
        .cfg_interrupt_di(cfg_interrupt_di),
        .cfg_interrupt_do(cfg_interrupt_do),
        .cfg_interrupt_mmenable(cfg_interrupt_mmenable),
        .cfg_interrupt_msienable(cfg_interrupt_msienable),
        .cfg_interrupt_msixenable(cfg_interrupt_msixenable),
        .cfg_interrupt_msixfm(cfg_interrupt_msixfm),
        .cfg_interrupt_rdy(cfg_interrupt_rdy),
        .cfg_interrupt_stat(cfg_interrupt_stat),
        .cfg_lcommand({\^cfg_lcommand [11:3],\^cfg_lcommand [1:0]}),
        .cfg_lstatus({\^cfg_lstatus [15:13],\^cfg_lstatus [11],\^cfg_lstatus [7:4],\^cfg_lstatus [1:0]}),
        .cfg_mgmt_byte_en(cfg_mgmt_byte_en),
        .cfg_mgmt_di(cfg_mgmt_di),
        .cfg_mgmt_do(cfg_mgmt_do),
        .cfg_mgmt_dwaddr(cfg_mgmt_dwaddr),
        .cfg_mgmt_rd_en(cfg_mgmt_rd_en),
        .cfg_mgmt_rd_wr_done(cfg_mgmt_rd_wr_done),
        .cfg_mgmt_wr_en(cfg_mgmt_wr_en),
        .cfg_mgmt_wr_readonly(cfg_mgmt_wr_readonly),
        .cfg_mgmt_wr_rw1c_as_rw(cfg_mgmt_wr_rw1c_as_rw),
        .cfg_msg_data(cfg_msg_data),
        .cfg_msg_received(cfg_msg_received),
        .cfg_msg_received_assert_int_a(cfg_msg_received_assert_int_a),
        .cfg_msg_received_assert_int_b(cfg_msg_received_assert_int_b),
        .cfg_msg_received_assert_int_c(cfg_msg_received_assert_int_c),
        .cfg_msg_received_assert_int_d(cfg_msg_received_assert_int_d),
        .cfg_msg_received_deassert_int_a(cfg_msg_received_deassert_int_a),
        .cfg_msg_received_deassert_int_b(cfg_msg_received_deassert_int_b),
        .cfg_msg_received_deassert_int_c(cfg_msg_received_deassert_int_c),
        .cfg_msg_received_deassert_int_d(cfg_msg_received_deassert_int_d),
        .cfg_msg_received_err_cor(cfg_msg_received_err_cor),
        .cfg_msg_received_err_fatal(cfg_msg_received_err_fatal),
        .cfg_msg_received_err_non_fatal(cfg_msg_received_err_non_fatal),
        .cfg_msg_received_pm_as_nak(cfg_msg_received_pm_as_nak),
        .cfg_msg_received_pm_pme(cfg_msg_received_pm_pme),
        .cfg_msg_received_pme_to_ack(cfg_msg_received_pme_to_ack),
        .cfg_msg_received_setslotpowerlimit(cfg_msg_received_setslotpowerlimit),
        .cfg_pcie_link_state(cfg_pcie_link_state),
        .cfg_pciecap_interrupt_msgnum(cfg_pciecap_interrupt_msgnum),
        .cfg_pm_force_state(cfg_pm_force_state),
        .cfg_pm_force_state_en(cfg_pm_force_state_en),
        .cfg_pm_halt_aspm_l0s(cfg_pm_halt_aspm_l0s),
        .cfg_pm_halt_aspm_l1(cfg_pm_halt_aspm_l1),
        .cfg_pm_wake(cfg_pm_wake),
        .cfg_pmcsr_pme_en(cfg_pmcsr_pme_en),
        .cfg_pmcsr_pme_status(cfg_pmcsr_pme_status),
        .cfg_pmcsr_powerstate(cfg_pmcsr_powerstate),
        .cfg_received_func_lvl_rst(cfg_received_func_lvl_rst),
        .cfg_root_control_pme_int_en(cfg_root_control_pme_int_en),
        .cfg_root_control_syserr_corr_err_en(cfg_root_control_syserr_corr_err_en),
        .cfg_root_control_syserr_fatal_err_en(cfg_root_control_syserr_fatal_err_en),
        .cfg_root_control_syserr_non_fatal_err_en(cfg_root_control_syserr_non_fatal_err_en),
        .cfg_slot_control_electromech_il_ctl_pulse(cfg_slot_control_electromech_il_ctl_pulse),
        .cfg_to_turnoff(cfg_to_turnoff),
        .cfg_trn_pending(cfg_trn_pending),
        .cfg_turnoff_ok(cfg_turnoff_ok),
        .cfg_vc_tcvc_map(cfg_vc_tcvc_map),
        .fc_cpld(fc_cpld),
        .fc_cplh(fc_cplh),
        .fc_npd(fc_npd),
        .fc_nph(fc_nph),
        .fc_pd(fc_pd),
        .fc_ph(fc_ph),
        .fc_sel(fc_sel),
        .gen3_reg(pipe_gen3_out),
        .m_axis_rx_tdata(m_axis_rx_tdata),
        .m_axis_rx_tkeep({\^m_axis_rx_tkeep [6],\^m_axis_rx_tkeep [2]}),
        .m_axis_rx_tlast(m_axis_rx_tlast),
        .m_axis_rx_tready(m_axis_rx_tready),
        .m_axis_rx_tuser({\^m_axis_rx_tuser [21],\^m_axis_rx_tuser [19],\^m_axis_rx_tuser [17],\^m_axis_rx_tuser [14],\^m_axis_rx_tuser [8:0]}),
        .m_axis_rx_tvalid(m_axis_rx_tvalid),
        .pci_exp_rxn(pci_exp_rxn),
        .pci_exp_rxp(pci_exp_rxp),
        .pci_exp_txn(pci_exp_txn),
        .pci_exp_txp(pci_exp_txp),
        .pcie_drp_addr(pcie_drp_addr),
        .pcie_drp_clk(pcie_drp_clk),
        .pcie_drp_di(pcie_drp_di),
        .pcie_drp_do(pcie_drp_do),
        .pcie_drp_en(pcie_drp_en),
        .pcie_drp_rdy(pcie_drp_rdy),
        .pcie_drp_we(pcie_drp_we),
        .pipe_dclk_in(pipe_dclk_in),
        .pipe_mmcm_lock_in(pipe_mmcm_lock_in),
        .pipe_oobclk_in(pipe_oobclk_in),
        .pipe_pclk_in(pipe_pclk_in),
        .pipe_pclk_sel_out(pipe_pclk_sel_out),
        .pipe_rxoutclk_out(pipe_rxoutclk_out),
        .pipe_rxusrclk_in(pipe_rxusrclk_in),
        .pipe_txoutclk_out(pipe_txoutclk_out),
        .pipe_userclk1_in(pipe_userclk1_in),
        .pipe_userclk2_in(pipe_userclk2_in),
        .pl_directed_change_done(pl_directed_change_done),
        .pl_directed_link_auton(pl_directed_link_auton),
        .pl_directed_link_change(pl_directed_link_change),
        .pl_directed_link_speed(pl_directed_link_speed),
        .pl_directed_link_width(pl_directed_link_width),
        .pl_downstream_deemph_source(pl_downstream_deemph_source),
        .pl_initial_link_width(pl_initial_link_width),
        .pl_lane_reversal_mode(pl_lane_reversal_mode),
        .pl_link_gen2_cap(pl_link_gen2_cap),
        .pl_link_partner_gen2_supported(pl_link_partner_gen2_supported),
        .pl_link_upcfg_cap(pl_link_upcfg_cap),
        .pl_ltssm_state(pl_ltssm_state),
        .pl_phy_lnk_up(pl_phy_lnk_up),
        .pl_received_hot_rst(pl_received_hot_rst),
        .pl_rx_pm_state(pl_rx_pm_state),
        .pl_sel_lnk_rate(pl_sel_lnk_rate),
        .pl_sel_lnk_width(pl_sel_lnk_width),
        .pl_transmit_hot_rst(pl_transmit_hot_rst),
        .pl_tx_pm_state(pl_tx_pm_state),
        .pl_upstream_prefer_deemph(pl_upstream_prefer_deemph),
        .rx_np_ok(rx_np_ok),
        .rx_np_req(rx_np_req),
        .s_axis_tx_tdata(s_axis_tx_tdata),
        .s_axis_tx_tkeep(s_axis_tx_tkeep[7]),
        .s_axis_tx_tlast(s_axis_tx_tlast),
        .s_axis_tx_tready(s_axis_tx_tready),
        .s_axis_tx_tuser(s_axis_tx_tuser),
        .s_axis_tx_tvalid(s_axis_tx_tvalid),
        .sys_clk(sys_clk),
        .sys_rst_n(sys_rst_n),
        .tx_buf_av(tx_buf_av),
        .tx_cfg_gnt(tx_cfg_gnt),
        .tx_cfg_req(tx_cfg_req),
        .tx_err_drop(tx_err_drop),
        .user_lnk_up(user_lnk_up),
        .user_reset_out(user_reset_out));
endmodule

module pcie_7x_0_pcie_7x
   (user_reset_int_reg,
    src_in,
    cfg_mgmt_rd_wr_done,
    cfg_err_aer_headerlog_set,
    cfg_err_cpl_rdy,
    cfg_interrupt_rdy,
    E,
    cfg_msg_received,
    cfg_received_func_lvl_rst,
    trn_in_packet_reg,
    trn_reof,
    trn_rsof,
    trn_rsrc_dsc,
    pcie_block_i_0,
    cfg_pcie_link_state,
    dsc_detect,
    rsrc_rdy_filtered6_out,
    trn_rsrc_dsc_prev0,
    tcfg_req_trig,
    trn_tcfg_req,
    pcie_block_i_1,
    trn_tbuf_av,
    tbuf_av_min_trig,
    pcie_block_i_2,
    trn_tdst_rdy,
    cfg_aer_ecrc_check_en,
    cfg_aer_ecrc_gen_en,
    cfg_aer_rooterr_corr_err_received,
    cfg_aer_rooterr_corr_err_reporting_en,
    cfg_aer_rooterr_fatal_err_received,
    cfg_aer_rooterr_fatal_err_reporting_en,
    cfg_aer_rooterr_non_fatal_err_received,
    cfg_aer_rooterr_non_fatal_err_reporting_en,
    cfg_bridge_serr_en,
    cfg_command,
    cfg_dcommand2,
    cfg_dcommand,
    cfg_dstatus,
    cfg_interrupt_msienable,
    cfg_interrupt_msixenable,
    cfg_interrupt_msixfm,
    cfg_lcommand,
    cfg_lstatus,
    cfg_msg_received_assert_int_a,
    cfg_msg_received_assert_int_b,
    cfg_msg_received_assert_int_c,
    cfg_msg_received_assert_int_d,
    cfg_msg_received_deassert_int_a,
    cfg_msg_received_deassert_int_b,
    cfg_msg_received_deassert_int_c,
    cfg_msg_received_deassert_int_d,
    cfg_msg_received_err_cor,
    cfg_msg_received_err_fatal,
    cfg_msg_received_err_non_fatal,
    cfg_msg_received_pm_as_nak,
    cfg_to_turnoff,
    cfg_msg_received_pme_to_ack,
    cfg_msg_received_pm_pme,
    cfg_msg_received_setslotpowerlimit,
    cfg_pmcsr_pme_en,
    cfg_pmcsr_pme_status,
    cfg_root_control_pme_int_en,
    cfg_root_control_syserr_corr_err_en,
    cfg_root_control_syserr_fatal_err_en,
    cfg_root_control_syserr_non_fatal_err_en,
    cfg_slot_control_electromech_il_ctl_pulse,
    pcie_drp_rdy,
    pipe_rx0_polarity,
    pipe_tx0_compliance,
    pipe_tx0_elec_idle,
    pipe_tx_deemph,
    pipe_tx_rate,
    pipe_tx_rcvr_det,
    pl_directed_change_done,
    pl_link_gen2_cap,
    pl_link_partner_gen2_supported,
    pl_link_upcfg_cap,
    pl_received_hot_rst,
    pl_sel_lnk_rate,
    trn_lnk_up,
    trn_recrc_err,
    trn_rerrfwd,
    tx_err_drop,
    fc_cpld,
    fc_npd,
    fc_pd,
    trn_rd,
    cfg_msg_data,
    pcie_drp_do,
    pipe_tx0_data,
    cfg_pmcsr_powerstate,
    pipe_tx0_char_is_k,
    pipe_tx0_powerdown,
    pl_lane_reversal_mode,
    pl_rx_pm_state,
    pl_sel_lnk_width,
    trn_rrem,
    cfg_interrupt_mmenable,
    pipe_tx_margin,
    pl_initial_link_width,
    pl_tx_pm_state,
    cfg_mgmt_do,
    pl_ltssm_state,
    cfg_vc_tcvc_map,
    cfg_interrupt_do,
    fc_cplh,
    fc_nph,
    fc_ph,
    trn_rbar_hit,
    bridge_reset_int,
    pl_phy_lnk_up,
    cfg_trn_pending,
    cfg_mgmt_wr_rw1c_as_rw,
    cfg_mgmt_wr_readonly,
    cfg_mgmt_wr_en,
    cfg_mgmt_rd_en,
    cfg_err_malformed,
    cfg_err_cor,
    cfg_err_ur,
    cfg_err_ecrc,
    cfg_err_cpl_timeout,
    cfg_err_cpl_abort,
    cfg_err_cpl_unexpect,
    cfg_err_poisoned,
    cfg_err_atomic_egress_blocked,
    cfg_err_mc_blocked,
    cfg_err_internal_uncor,
    cfg_err_internal_cor,
    cfg_err_posted,
    cfg_err_locked,
    cfg_err_norecovery,
    cfg_interrupt,
    cfg_interrupt_assert,
    cfg_interrupt_stat,
    cfg_pm_halt_aspm_l0s,
    cfg_pm_halt_aspm_l1,
    cfg_pm_force_state_en,
    cfg_pm_wake,
    trn_in_packet,
    trn_rdst_rdy,
    ppm_L1_trig,
    ppm_L1_thrtl,
    trn_rsrc_dsc_d,
    reg_dsc_detect,
    reg_tcfg_gnt,
    lnk_up_thrtl,
    out,
    pipe_userclk1_in,
    cfg_pm_turnoff_ok_n,
    pcie_drp_clk,
    pcie_drp_en,
    pcie_drp_we,
    pipe_pclk_in,
    pipe_rx0_chanisaligned,
    pipe_rx0_elec_idle,
    pipe_rx0_phy_status,
    pipe_rx0_valid,
    pl_directed_link_auton,
    pl_directed_link_speed,
    pl_downstream_deemph_source,
    pl_transmit_hot_rst,
    pl_upstream_prefer_deemph,
    sys_rst_n,
    rx_np_ok,
    rx_np_req,
    trn_tcfg_gnt,
    pcie_block_i_3,
    trn_teof,
    trn_tsof,
    trn_tsrc_rdy,
    pipe_userclk2_in,
    cfg_err_aer_headerlog,
    trn_td,
    pcie_drp_di,
    pipe_rx0_data,
    cfg_pm_force_state,
    pipe_rx0_char_is_k,
    pl_directed_link_change,
    pl_directed_link_width,
    trn_trem,
    cfg_ds_function_number,
    pipe_rx0_status,
    fc_sel,
    cfg_mgmt_di,
    cfg_mgmt_byte_en_n,
    cfg_err_tlp_cpl_header,
    cfg_aer_interrupt_msgnum,
    cfg_ds_device_number,
    cfg_pciecap_interrupt_msgnum,
    cfg_dsn,
    cfg_ds_bus_number,
    cfg_interrupt_di,
    pcie_drp_addr,
    cfg_mgmt_dwaddr);
  output user_reset_int_reg;
  output src_in;
  output cfg_mgmt_rd_wr_done;
  output cfg_err_aer_headerlog_set;
  output cfg_err_cpl_rdy;
  output cfg_interrupt_rdy;
  output [0:0]E;
  output cfg_msg_received;
  output cfg_received_func_lvl_rst;
  output trn_in_packet_reg;
  output trn_reof;
  output trn_rsof;
  output trn_rsrc_dsc;
  output pcie_block_i_0;
  output [2:0]cfg_pcie_link_state;
  output dsc_detect;
  output rsrc_rdy_filtered6_out;
  output trn_rsrc_dsc_prev0;
  output tcfg_req_trig;
  output trn_tcfg_req;
  output pcie_block_i_1;
  output [5:0]trn_tbuf_av;
  output tbuf_av_min_trig;
  output pcie_block_i_2;
  output trn_tdst_rdy;
  output cfg_aer_ecrc_check_en;
  output cfg_aer_ecrc_gen_en;
  output cfg_aer_rooterr_corr_err_received;
  output cfg_aer_rooterr_corr_err_reporting_en;
  output cfg_aer_rooterr_fatal_err_received;
  output cfg_aer_rooterr_fatal_err_reporting_en;
  output cfg_aer_rooterr_non_fatal_err_received;
  output cfg_aer_rooterr_non_fatal_err_reporting_en;
  output cfg_bridge_serr_en;
  output [4:0]cfg_command;
  output [11:0]cfg_dcommand2;
  output [14:0]cfg_dcommand;
  output [3:0]cfg_dstatus;
  output cfg_interrupt_msienable;
  output cfg_interrupt_msixenable;
  output cfg_interrupt_msixfm;
  output [10:0]cfg_lcommand;
  output [9:0]cfg_lstatus;
  output cfg_msg_received_assert_int_a;
  output cfg_msg_received_assert_int_b;
  output cfg_msg_received_assert_int_c;
  output cfg_msg_received_assert_int_d;
  output cfg_msg_received_deassert_int_a;
  output cfg_msg_received_deassert_int_b;
  output cfg_msg_received_deassert_int_c;
  output cfg_msg_received_deassert_int_d;
  output cfg_msg_received_err_cor;
  output cfg_msg_received_err_fatal;
  output cfg_msg_received_err_non_fatal;
  output cfg_msg_received_pm_as_nak;
  output cfg_to_turnoff;
  output cfg_msg_received_pme_to_ack;
  output cfg_msg_received_pm_pme;
  output cfg_msg_received_setslotpowerlimit;
  output cfg_pmcsr_pme_en;
  output cfg_pmcsr_pme_status;
  output cfg_root_control_pme_int_en;
  output cfg_root_control_syserr_corr_err_en;
  output cfg_root_control_syserr_fatal_err_en;
  output cfg_root_control_syserr_non_fatal_err_en;
  output cfg_slot_control_electromech_il_ctl_pulse;
  output pcie_drp_rdy;
  output pipe_rx0_polarity;
  output pipe_tx0_compliance;
  output pipe_tx0_elec_idle;
  output pipe_tx_deemph;
  output pipe_tx_rate;
  output pipe_tx_rcvr_det;
  output pl_directed_change_done;
  output pl_link_gen2_cap;
  output pl_link_partner_gen2_supported;
  output pl_link_upcfg_cap;
  output pl_received_hot_rst;
  output pl_sel_lnk_rate;
  output trn_lnk_up;
  output trn_recrc_err;
  output trn_rerrfwd;
  output tx_err_drop;
  output [11:0]fc_cpld;
  output [11:0]fc_npd;
  output [11:0]fc_pd;
  output [63:0]trn_rd;
  output [15:0]cfg_msg_data;
  output [15:0]pcie_drp_do;
  output [15:0]pipe_tx0_data;
  output [1:0]cfg_pmcsr_powerstate;
  output [1:0]pipe_tx0_char_is_k;
  output [1:0]pipe_tx0_powerdown;
  output [1:0]pl_lane_reversal_mode;
  output [1:0]pl_rx_pm_state;
  output [1:0]pl_sel_lnk_width;
  output [0:0]trn_rrem;
  output [2:0]cfg_interrupt_mmenable;
  output [2:0]pipe_tx_margin;
  output [2:0]pl_initial_link_width;
  output [2:0]pl_tx_pm_state;
  output [31:0]cfg_mgmt_do;
  output [5:0]pl_ltssm_state;
  output [6:0]cfg_vc_tcvc_map;
  output [7:0]cfg_interrupt_do;
  output [7:0]fc_cplh;
  output [7:0]fc_nph;
  output [7:0]fc_ph;
  output [6:0]trn_rbar_hit;
  input bridge_reset_int;
  input pl_phy_lnk_up;
  input cfg_trn_pending;
  input cfg_mgmt_wr_rw1c_as_rw;
  input cfg_mgmt_wr_readonly;
  input cfg_mgmt_wr_en;
  input cfg_mgmt_rd_en;
  input cfg_err_malformed;
  input cfg_err_cor;
  input cfg_err_ur;
  input cfg_err_ecrc;
  input cfg_err_cpl_timeout;
  input cfg_err_cpl_abort;
  input cfg_err_cpl_unexpect;
  input cfg_err_poisoned;
  input cfg_err_atomic_egress_blocked;
  input cfg_err_mc_blocked;
  input cfg_err_internal_uncor;
  input cfg_err_internal_cor;
  input cfg_err_posted;
  input cfg_err_locked;
  input cfg_err_norecovery;
  input cfg_interrupt;
  input cfg_interrupt_assert;
  input cfg_interrupt_stat;
  input cfg_pm_halt_aspm_l0s;
  input cfg_pm_halt_aspm_l1;
  input cfg_pm_force_state_en;
  input cfg_pm_wake;
  input trn_in_packet;
  input trn_rdst_rdy;
  input ppm_L1_trig;
  input ppm_L1_thrtl;
  input trn_rsrc_dsc_d;
  input reg_dsc_detect;
  input reg_tcfg_gnt;
  input lnk_up_thrtl;
  input out;
  input pipe_userclk1_in;
  input cfg_pm_turnoff_ok_n;
  input pcie_drp_clk;
  input pcie_drp_en;
  input pcie_drp_we;
  input pipe_pclk_in;
  input pipe_rx0_chanisaligned;
  input pipe_rx0_elec_idle;
  input pipe_rx0_phy_status;
  input pipe_rx0_valid;
  input pl_directed_link_auton;
  input pl_directed_link_speed;
  input pl_downstream_deemph_source;
  input pl_transmit_hot_rst;
  input pl_upstream_prefer_deemph;
  input sys_rst_n;
  input rx_np_ok;
  input rx_np_req;
  input trn_tcfg_gnt;
  input [3:0]pcie_block_i_3;
  input trn_teof;
  input trn_tsof;
  input trn_tsrc_rdy;
  input pipe_userclk2_in;
  input [127:0]cfg_err_aer_headerlog;
  input [63:0]trn_td;
  input [15:0]pcie_drp_di;
  input [15:0]pipe_rx0_data;
  input [1:0]cfg_pm_force_state;
  input [1:0]pipe_rx0_char_is_k;
  input [1:0]pl_directed_link_change;
  input [1:0]pl_directed_link_width;
  input [0:0]trn_trem;
  input [2:0]cfg_ds_function_number;
  input [2:0]pipe_rx0_status;
  input [2:0]fc_sel;
  input [31:0]cfg_mgmt_di;
  input [3:0]cfg_mgmt_byte_en_n;
  input [47:0]cfg_err_tlp_cpl_header;
  input [4:0]cfg_aer_interrupt_msgnum;
  input [4:0]cfg_ds_device_number;
  input [4:0]cfg_pciecap_interrupt_msgnum;
  input [63:0]cfg_dsn;
  input [7:0]cfg_ds_bus_number;
  input [7:0]cfg_interrupt_di;
  input [8:0]pcie_drp_addr;
  input [9:0]cfg_mgmt_dwaddr;

  wire [0:0]E;
  wire bridge_reset_int;
  wire cfg_aer_ecrc_check_en;
  wire cfg_aer_ecrc_gen_en;
  wire [4:0]cfg_aer_interrupt_msgnum;
  wire cfg_aer_rooterr_corr_err_received;
  wire cfg_aer_rooterr_corr_err_reporting_en;
  wire cfg_aer_rooterr_fatal_err_received;
  wire cfg_aer_rooterr_fatal_err_reporting_en;
  wire cfg_aer_rooterr_non_fatal_err_received;
  wire cfg_aer_rooterr_non_fatal_err_reporting_en;
  wire cfg_bridge_serr_en;
  wire [4:0]cfg_command;
  wire [14:0]cfg_dcommand;
  wire [11:0]cfg_dcommand2;
  wire [7:0]cfg_ds_bus_number;
  wire [4:0]cfg_ds_device_number;
  wire [2:0]cfg_ds_function_number;
  wire [63:0]cfg_dsn;
  wire [3:0]cfg_dstatus;
  wire [127:0]cfg_err_aer_headerlog;
  wire cfg_err_aer_headerlog_set;
  wire cfg_err_aer_headerlog_set_n;
  wire cfg_err_atomic_egress_blocked;
  wire cfg_err_atomic_egress_blocked_n;
  wire cfg_err_cor;
  wire cfg_err_cor_n;
  wire cfg_err_cpl_abort;
  wire cfg_err_cpl_abort_n;
  wire cfg_err_cpl_rdy;
  wire cfg_err_cpl_rdy_n;
  wire cfg_err_cpl_timeout;
  wire cfg_err_cpl_timeout_n;
  wire cfg_err_cpl_unexpect;
  wire cfg_err_cpl_unexpect_n;
  wire cfg_err_ecrc;
  wire cfg_err_ecrc_n;
  wire cfg_err_internal_cor;
  wire cfg_err_internal_cor_n;
  wire cfg_err_internal_uncor;
  wire cfg_err_internal_uncor_n;
  wire cfg_err_locked;
  wire cfg_err_locked_n;
  wire cfg_err_malformed;
  wire cfg_err_malformed_n;
  wire cfg_err_mc_blocked;
  wire cfg_err_mc_blocked_n;
  wire cfg_err_norecovery;
  wire cfg_err_norecovery_n;
  wire cfg_err_poisoned;
  wire cfg_err_poisoned_n;
  wire cfg_err_posted;
  wire cfg_err_posted_n;
  wire [47:0]cfg_err_tlp_cpl_header;
  wire cfg_err_ur;
  wire cfg_err_ur_n;
  wire cfg_interrupt;
  wire cfg_interrupt_assert;
  wire cfg_interrupt_assert_n;
  wire [7:0]cfg_interrupt_di;
  wire [7:0]cfg_interrupt_do;
  wire [2:0]cfg_interrupt_mmenable;
  wire cfg_interrupt_msienable;
  wire cfg_interrupt_msixenable;
  wire cfg_interrupt_msixfm;
  wire cfg_interrupt_n;
  wire cfg_interrupt_rdy;
  wire cfg_interrupt_rdy_n;
  wire cfg_interrupt_stat;
  wire cfg_interrupt_stat_n;
  wire [10:0]cfg_lcommand;
  wire [9:0]cfg_lstatus;
  wire [3:0]cfg_mgmt_byte_en_n;
  wire [31:0]cfg_mgmt_di;
  wire [31:0]cfg_mgmt_do;
  wire [9:0]cfg_mgmt_dwaddr;
  wire cfg_mgmt_rd_en;
  wire cfg_mgmt_rd_en_n;
  wire cfg_mgmt_rd_wr_done;
  wire cfg_mgmt_rd_wr_done_n;
  wire cfg_mgmt_wr_en;
  wire cfg_mgmt_wr_en_n;
  wire cfg_mgmt_wr_readonly;
  wire cfg_mgmt_wr_readonly_n;
  wire cfg_mgmt_wr_rw1c_as_rw;
  wire cfg_mgmt_wr_rw1c_as_rw_n;
  wire [15:0]cfg_msg_data;
  wire cfg_msg_received;
  wire cfg_msg_received_assert_int_a;
  wire cfg_msg_received_assert_int_b;
  wire cfg_msg_received_assert_int_c;
  wire cfg_msg_received_assert_int_d;
  wire cfg_msg_received_deassert_int_a;
  wire cfg_msg_received_deassert_int_b;
  wire cfg_msg_received_deassert_int_c;
  wire cfg_msg_received_deassert_int_d;
  wire cfg_msg_received_err_cor;
  wire cfg_msg_received_err_fatal;
  wire cfg_msg_received_err_non_fatal;
  wire cfg_msg_received_pm_as_nak;
  wire cfg_msg_received_pm_pme;
  wire cfg_msg_received_pme_to_ack;
  wire cfg_msg_received_setslotpowerlimit;
  wire [2:0]cfg_pcie_link_state;
  wire [4:0]cfg_pciecap_interrupt_msgnum;
  wire [1:0]cfg_pm_force_state;
  wire cfg_pm_force_state_en;
  wire cfg_pm_force_state_en_n;
  wire cfg_pm_halt_aspm_l0s;
  wire cfg_pm_halt_aspm_l0s_n;
  wire cfg_pm_halt_aspm_l1;
  wire cfg_pm_halt_aspm_l1_n;
  wire cfg_pm_turnoff_ok_n;
  wire cfg_pm_wake;
  wire cfg_pm_wake_n;
  wire cfg_pmcsr_pme_en;
  wire cfg_pmcsr_pme_status;
  wire [1:0]cfg_pmcsr_powerstate;
  wire cfg_received_func_lvl_rst;
  wire cfg_root_control_pme_int_en;
  wire cfg_root_control_syserr_corr_err_en;
  wire cfg_root_control_syserr_fatal_err_en;
  wire cfg_root_control_syserr_non_fatal_err_en;
  wire cfg_slot_control_electromech_il_ctl_pulse;
  wire cfg_to_turnoff;
  wire cfg_trn_pending;
  wire cfg_trn_pending_n;
  wire [6:0]cfg_vc_tcvc_map;
  wire dsc_detect;
  wire [11:0]fc_cpld;
  wire [7:0]fc_cplh;
  wire [11:0]fc_npd;
  wire [7:0]fc_nph;
  wire [11:0]fc_pd;
  wire [7:0]fc_ph;
  wire [2:0]fc_sel;
  wire lnk_up_thrtl;
  wire [12:0]mim_rx_raddr;
  wire [67:0]mim_rx_rdata_int;
  wire mim_rx_ren;
  wire [12:0]mim_rx_waddr;
  wire [67:0]mim_rx_wdata;
  wire mim_rx_wen;
  wire [12:0]mim_tx_raddr;
  wire [68:0]mim_tx_rdata_int;
  wire mim_tx_ren;
  wire [12:0]mim_tx_waddr;
  wire [68:0]mim_tx_wdata;
  wire mim_tx_wen;
  wire out;
  wire pcie_block_i_0;
  wire pcie_block_i_1;
  wire pcie_block_i_2;
  wire [3:0]pcie_block_i_3;
  wire pcie_block_i_n_100;
  wire pcie_block_i_n_101;
  wire pcie_block_i_n_102;
  wire pcie_block_i_n_103;
  wire pcie_block_i_n_104;
  wire pcie_block_i_n_105;
  wire pcie_block_i_n_106;
  wire pcie_block_i_n_107;
  wire pcie_block_i_n_108;
  wire pcie_block_i_n_1097;
  wire pcie_block_i_n_1098;
  wire pcie_block_i_n_1099;
  wire pcie_block_i_n_1100;
  wire pcie_block_i_n_1101;
  wire pcie_block_i_n_1102;
  wire pcie_block_i_n_1103;
  wire pcie_block_i_n_1143;
  wire pcie_block_i_n_140;
  wire pcie_block_i_n_141;
  wire pcie_block_i_n_142;
  wire pcie_block_i_n_143;
  wire pcie_block_i_n_144;
  wire pcie_block_i_n_145;
  wire pcie_block_i_n_146;
  wire pcie_block_i_n_155;
  wire pcie_block_i_n_156;
  wire pcie_block_i_n_157;
  wire pcie_block_i_n_158;
  wire pcie_block_i_n_159;
  wire pcie_block_i_n_160;
  wire pcie_block_i_n_169;
  wire pcie_block_i_n_172;
  wire pcie_block_i_n_173;
  wire pcie_block_i_n_174;
  wire pcie_block_i_n_175;
  wire pcie_block_i_n_176;
  wire pcie_block_i_n_177;
  wire pcie_block_i_n_178;
  wire pcie_block_i_n_179;
  wire pcie_block_i_n_180;
  wire pcie_block_i_n_181;
  wire pcie_block_i_n_182;
  wire pcie_block_i_n_183;
  wire pcie_block_i_n_184;
  wire pcie_block_i_n_185;
  wire pcie_block_i_n_186;
  wire pcie_block_i_n_187;
  wire pcie_block_i_n_188;
  wire pcie_block_i_n_189;
  wire pcie_block_i_n_190;
  wire pcie_block_i_n_191;
  wire pcie_block_i_n_192;
  wire pcie_block_i_n_193;
  wire pcie_block_i_n_194;
  wire pcie_block_i_n_195;
  wire pcie_block_i_n_610;
  wire pcie_block_i_n_611;
  wire pcie_block_i_n_618;
  wire pcie_block_i_n_619;
  wire pcie_block_i_n_687;
  wire pcie_block_i_n_688;
  wire pcie_block_i_n_689;
  wire pcie_block_i_n_690;
  wire pcie_block_i_n_691;
  wire pcie_block_i_n_704;
  wire pcie_block_i_n_705;
  wire pcie_block_i_n_706;
  wire pcie_block_i_n_707;
  wire pcie_block_i_n_708;
  wire pcie_block_i_n_709;
  wire pcie_block_i_n_710;
  wire pcie_block_i_n_711;
  wire pcie_block_i_n_712;
  wire pcie_block_i_n_713;
  wire pcie_block_i_n_714;
  wire pcie_block_i_n_715;
  wire pcie_block_i_n_716;
  wire pcie_block_i_n_717;
  wire pcie_block_i_n_718;
  wire pcie_block_i_n_719;
  wire pcie_block_i_n_72;
  wire pcie_block_i_n_720;
  wire pcie_block_i_n_721;
  wire pcie_block_i_n_722;
  wire pcie_block_i_n_723;
  wire pcie_block_i_n_724;
  wire pcie_block_i_n_725;
  wire pcie_block_i_n_726;
  wire pcie_block_i_n_727;
  wire pcie_block_i_n_728;
  wire pcie_block_i_n_729;
  wire pcie_block_i_n_730;
  wire pcie_block_i_n_731;
  wire pcie_block_i_n_732;
  wire pcie_block_i_n_733;
  wire pcie_block_i_n_734;
  wire pcie_block_i_n_735;
  wire pcie_block_i_n_736;
  wire pcie_block_i_n_737;
  wire pcie_block_i_n_738;
  wire pcie_block_i_n_739;
  wire pcie_block_i_n_740;
  wire pcie_block_i_n_741;
  wire pcie_block_i_n_742;
  wire pcie_block_i_n_743;
  wire pcie_block_i_n_744;
  wire pcie_block_i_n_745;
  wire pcie_block_i_n_746;
  wire pcie_block_i_n_747;
  wire pcie_block_i_n_748;
  wire pcie_block_i_n_749;
  wire pcie_block_i_n_75;
  wire pcie_block_i_n_750;
  wire pcie_block_i_n_751;
  wire pcie_block_i_n_752;
  wire pcie_block_i_n_753;
  wire pcie_block_i_n_754;
  wire pcie_block_i_n_755;
  wire pcie_block_i_n_756;
  wire pcie_block_i_n_757;
  wire pcie_block_i_n_758;
  wire pcie_block_i_n_759;
  wire pcie_block_i_n_76;
  wire pcie_block_i_n_760;
  wire pcie_block_i_n_761;
  wire pcie_block_i_n_762;
  wire pcie_block_i_n_763;
  wire pcie_block_i_n_764;
  wire pcie_block_i_n_765;
  wire pcie_block_i_n_766;
  wire pcie_block_i_n_767;
  wire pcie_block_i_n_768;
  wire pcie_block_i_n_769;
  wire pcie_block_i_n_77;
  wire pcie_block_i_n_770;
  wire pcie_block_i_n_771;
  wire pcie_block_i_n_772;
  wire pcie_block_i_n_773;
  wire pcie_block_i_n_774;
  wire pcie_block_i_n_775;
  wire pcie_block_i_n_776;
  wire pcie_block_i_n_777;
  wire pcie_block_i_n_778;
  wire pcie_block_i_n_779;
  wire pcie_block_i_n_78;
  wire pcie_block_i_n_780;
  wire pcie_block_i_n_781;
  wire pcie_block_i_n_782;
  wire pcie_block_i_n_783;
  wire pcie_block_i_n_784;
  wire pcie_block_i_n_785;
  wire pcie_block_i_n_786;
  wire pcie_block_i_n_787;
  wire pcie_block_i_n_788;
  wire pcie_block_i_n_789;
  wire pcie_block_i_n_790;
  wire pcie_block_i_n_791;
  wire pcie_block_i_n_792;
  wire pcie_block_i_n_793;
  wire pcie_block_i_n_794;
  wire pcie_block_i_n_795;
  wire pcie_block_i_n_796;
  wire pcie_block_i_n_797;
  wire pcie_block_i_n_798;
  wire pcie_block_i_n_799;
  wire pcie_block_i_n_800;
  wire pcie_block_i_n_801;
  wire pcie_block_i_n_802;
  wire pcie_block_i_n_803;
  wire pcie_block_i_n_804;
  wire pcie_block_i_n_805;
  wire pcie_block_i_n_806;
  wire pcie_block_i_n_807;
  wire pcie_block_i_n_808;
  wire pcie_block_i_n_809;
  wire pcie_block_i_n_810;
  wire pcie_block_i_n_811;
  wire pcie_block_i_n_812;
  wire pcie_block_i_n_813;
  wire pcie_block_i_n_814;
  wire pcie_block_i_n_815;
  wire pcie_block_i_n_816;
  wire pcie_block_i_n_817;
  wire pcie_block_i_n_818;
  wire pcie_block_i_n_819;
  wire pcie_block_i_n_820;
  wire pcie_block_i_n_821;
  wire pcie_block_i_n_822;
  wire pcie_block_i_n_823;
  wire pcie_block_i_n_824;
  wire pcie_block_i_n_825;
  wire pcie_block_i_n_826;
  wire pcie_block_i_n_827;
  wire pcie_block_i_n_828;
  wire pcie_block_i_n_829;
  wire pcie_block_i_n_830;
  wire pcie_block_i_n_831;
  wire pcie_block_i_n_832;
  wire pcie_block_i_n_833;
  wire pcie_block_i_n_834;
  wire pcie_block_i_n_835;
  wire pcie_block_i_n_836;
  wire pcie_block_i_n_837;
  wire pcie_block_i_n_838;
  wire pcie_block_i_n_839;
  wire pcie_block_i_n_84;
  wire pcie_block_i_n_840;
  wire pcie_block_i_n_841;
  wire pcie_block_i_n_842;
  wire pcie_block_i_n_843;
  wire pcie_block_i_n_844;
  wire pcie_block_i_n_845;
  wire pcie_block_i_n_846;
  wire pcie_block_i_n_847;
  wire pcie_block_i_n_848;
  wire pcie_block_i_n_849;
  wire pcie_block_i_n_85;
  wire pcie_block_i_n_850;
  wire pcie_block_i_n_851;
  wire pcie_block_i_n_852;
  wire pcie_block_i_n_853;
  wire pcie_block_i_n_854;
  wire pcie_block_i_n_855;
  wire pcie_block_i_n_856;
  wire pcie_block_i_n_857;
  wire pcie_block_i_n_858;
  wire pcie_block_i_n_859;
  wire pcie_block_i_n_86;
  wire pcie_block_i_n_860;
  wire pcie_block_i_n_861;
  wire pcie_block_i_n_862;
  wire pcie_block_i_n_863;
  wire pcie_block_i_n_864;
  wire pcie_block_i_n_865;
  wire pcie_block_i_n_866;
  wire pcie_block_i_n_867;
  wire pcie_block_i_n_868;
  wire pcie_block_i_n_869;
  wire pcie_block_i_n_87;
  wire pcie_block_i_n_870;
  wire pcie_block_i_n_871;
  wire pcie_block_i_n_872;
  wire pcie_block_i_n_873;
  wire pcie_block_i_n_874;
  wire pcie_block_i_n_875;
  wire pcie_block_i_n_876;
  wire pcie_block_i_n_877;
  wire pcie_block_i_n_878;
  wire pcie_block_i_n_879;
  wire pcie_block_i_n_88;
  wire pcie_block_i_n_880;
  wire pcie_block_i_n_881;
  wire pcie_block_i_n_882;
  wire pcie_block_i_n_883;
  wire pcie_block_i_n_884;
  wire pcie_block_i_n_885;
  wire pcie_block_i_n_886;
  wire pcie_block_i_n_887;
  wire pcie_block_i_n_888;
  wire pcie_block_i_n_889;
  wire pcie_block_i_n_89;
  wire pcie_block_i_n_890;
  wire pcie_block_i_n_891;
  wire pcie_block_i_n_892;
  wire pcie_block_i_n_893;
  wire pcie_block_i_n_894;
  wire pcie_block_i_n_895;
  wire pcie_block_i_n_896;
  wire pcie_block_i_n_897;
  wire pcie_block_i_n_898;
  wire pcie_block_i_n_899;
  wire pcie_block_i_n_90;
  wire pcie_block_i_n_900;
  wire pcie_block_i_n_901;
  wire pcie_block_i_n_902;
  wire pcie_block_i_n_903;
  wire pcie_block_i_n_904;
  wire pcie_block_i_n_905;
  wire pcie_block_i_n_906;
  wire pcie_block_i_n_907;
  wire pcie_block_i_n_908;
  wire pcie_block_i_n_909;
  wire pcie_block_i_n_91;
  wire pcie_block_i_n_910;
  wire pcie_block_i_n_911;
  wire pcie_block_i_n_912;
  wire pcie_block_i_n_913;
  wire pcie_block_i_n_914;
  wire pcie_block_i_n_915;
  wire pcie_block_i_n_916;
  wire pcie_block_i_n_917;
  wire pcie_block_i_n_918;
  wire pcie_block_i_n_919;
  wire pcie_block_i_n_92;
  wire pcie_block_i_n_920;
  wire pcie_block_i_n_921;
  wire pcie_block_i_n_922;
  wire pcie_block_i_n_923;
  wire pcie_block_i_n_924;
  wire pcie_block_i_n_925;
  wire pcie_block_i_n_926;
  wire pcie_block_i_n_927;
  wire pcie_block_i_n_928;
  wire pcie_block_i_n_929;
  wire pcie_block_i_n_93;
  wire pcie_block_i_n_930;
  wire pcie_block_i_n_931;
  wire pcie_block_i_n_932;
  wire pcie_block_i_n_933;
  wire pcie_block_i_n_934;
  wire pcie_block_i_n_935;
  wire pcie_block_i_n_936;
  wire pcie_block_i_n_937;
  wire pcie_block_i_n_938;
  wire pcie_block_i_n_939;
  wire pcie_block_i_n_94;
  wire pcie_block_i_n_940;
  wire pcie_block_i_n_941;
  wire pcie_block_i_n_942;
  wire pcie_block_i_n_943;
  wire pcie_block_i_n_944;
  wire pcie_block_i_n_945;
  wire pcie_block_i_n_946;
  wire pcie_block_i_n_947;
  wire pcie_block_i_n_948;
  wire pcie_block_i_n_949;
  wire pcie_block_i_n_95;
  wire pcie_block_i_n_950;
  wire pcie_block_i_n_951;
  wire pcie_block_i_n_952;
  wire pcie_block_i_n_953;
  wire pcie_block_i_n_954;
  wire pcie_block_i_n_955;
  wire pcie_block_i_n_956;
  wire pcie_block_i_n_957;
  wire pcie_block_i_n_958;
  wire pcie_block_i_n_959;
  wire pcie_block_i_n_96;
  wire pcie_block_i_n_98;
  wire pcie_block_i_n_99;
  wire [8:0]pcie_drp_addr;
  wire pcie_drp_clk;
  wire [15:0]pcie_drp_di;
  wire [15:0]pcie_drp_do;
  wire pcie_drp_en;
  wire pcie_drp_rdy;
  wire pcie_drp_we;
  wire pipe_pclk_in;
  wire pipe_rx0_chanisaligned;
  wire [1:0]pipe_rx0_char_is_k;
  wire [15:0]pipe_rx0_data;
  wire pipe_rx0_elec_idle;
  wire pipe_rx0_phy_status;
  wire pipe_rx0_polarity;
  wire [2:0]pipe_rx0_status;
  wire pipe_rx0_valid;
  wire pipe_rx1_polarity;
  wire pipe_rx2_polarity;
  wire pipe_rx3_polarity;
  wire pipe_rx4_polarity;
  wire pipe_rx5_polarity;
  wire pipe_rx6_polarity;
  wire pipe_rx7_polarity;
  wire [1:0]pipe_tx0_char_is_k;
  wire pipe_tx0_compliance;
  wire [15:0]pipe_tx0_data;
  wire pipe_tx0_elec_idle;
  wire [1:0]pipe_tx0_powerdown;
  wire [1:0]pipe_tx1_char_is_k;
  wire pipe_tx1_compliance;
  wire [15:0]pipe_tx1_data;
  wire pipe_tx1_elec_idle;
  wire [1:0]pipe_tx1_powerdown;
  wire [1:0]pipe_tx2_char_is_k;
  wire pipe_tx2_compliance;
  wire [15:0]pipe_tx2_data;
  wire pipe_tx2_elec_idle;
  wire [1:0]pipe_tx2_powerdown;
  wire [1:0]pipe_tx3_char_is_k;
  wire pipe_tx3_compliance;
  wire [15:0]pipe_tx3_data;
  wire pipe_tx3_elec_idle;
  wire [1:0]pipe_tx3_powerdown;
  wire [1:0]pipe_tx4_char_is_k;
  wire pipe_tx4_compliance;
  wire [15:0]pipe_tx4_data;
  wire pipe_tx4_elec_idle;
  wire [1:0]pipe_tx4_powerdown;
  wire [1:0]pipe_tx5_char_is_k;
  wire pipe_tx5_compliance;
  wire [15:0]pipe_tx5_data;
  wire pipe_tx5_elec_idle;
  wire [1:0]pipe_tx5_powerdown;
  wire [1:0]pipe_tx6_char_is_k;
  wire pipe_tx6_compliance;
  wire [15:0]pipe_tx6_data;
  wire pipe_tx6_elec_idle;
  wire [1:0]pipe_tx6_powerdown;
  wire [1:0]pipe_tx7_char_is_k;
  wire pipe_tx7_compliance;
  wire [15:0]pipe_tx7_data;
  wire pipe_tx7_elec_idle;
  wire [1:0]pipe_tx7_powerdown;
  wire pipe_tx_deemph;
  wire [2:0]pipe_tx_margin;
  wire pipe_tx_rate;
  wire pipe_tx_rcvr_det;
  wire pipe_userclk1_in;
  wire pipe_userclk2_in;
  wire pl_directed_change_done;
  wire pl_directed_link_auton;
  wire [1:0]pl_directed_link_change;
  wire pl_directed_link_speed;
  wire [1:0]pl_directed_link_width;
  wire pl_downstream_deemph_source;
  wire [2:0]pl_initial_link_width;
  wire [1:0]pl_lane_reversal_mode;
  wire pl_link_gen2_cap;
  wire pl_link_partner_gen2_supported;
  wire pl_link_upcfg_cap;
  wire [5:0]pl_ltssm_state;
  wire pl_phy_lnk_up;
  wire pl_phy_lnk_up_n;
  wire pl_received_hot_rst;
  wire [1:0]pl_rx_pm_state;
  wire pl_sel_lnk_rate;
  wire [1:0]pl_sel_lnk_width;
  wire pl_transmit_hot_rst;
  wire [2:0]pl_tx_pm_state;
  wire pl_upstream_prefer_deemph;
  wire ppm_L1_thrtl;
  wire ppm_L1_trig;
  wire received_func_lvl_rst_n;
  wire reg_dsc_detect;
  wire reg_tcfg_gnt;
  wire rsrc_rdy_filtered6_out;
  wire rx_np_ok;
  wire rx_np_req;
  wire src_in;
  wire sys_rst_n;
  wire tbuf_av_min_trig;
  wire tcfg_req_trig;
  wire trn_in_packet;
  wire trn_in_packet_reg;
  wire trn_lnk_up;
  wire [6:0]trn_rbar_hit;
  wire [63:0]trn_rd;
  wire trn_rdst_rdy;
  wire trn_recrc_err;
  wire trn_reof;
  wire trn_rerrfwd;
  wire [0:0]trn_rrem;
  wire trn_rsof;
  wire trn_rsrc_dsc;
  wire trn_rsrc_dsc_d;
  wire trn_rsrc_dsc_prev0;
  wire trn_rsrc_rdy;
  wire [5:0]trn_tbuf_av;
  wire trn_tcfg_gnt;
  wire trn_tcfg_req;
  wire [63:0]trn_td;
  wire trn_tdst_rdy;
  wire trn_teof;
  wire [0:0]trn_trem;
  wire trn_tsof;
  wire trn_tsrc_rdy;
  wire tx_err_drop;
  wire user_reset_int_reg;
  wire user_rst_n;
  wire [127:64]NLW_pcie_block_i_TRNRD_UNCONNECTED;
  wire [1:1]NLW_pcie_block_i_TRNRREM_UNCONNECTED;
  wire [3:1]NLW_pcie_block_i_TRNTDSTRDY_UNCONNECTED;

  LUT1 #(
    .INIT(2'h1)) 
    \cfg_bus_number_d[7]_i_2 
       (.I0(cfg_msg_received),
        .O(E));
  LUT1 #(
    .INIT(2'h1)) 
    cfg_err_aer_headerlog_set_INST_0
       (.I0(cfg_err_aer_headerlog_set_n),
        .O(cfg_err_aer_headerlog_set));
  LUT1 #(
    .INIT(2'h1)) 
    cfg_err_cpl_rdy_INST_0
       (.I0(cfg_err_cpl_rdy_n),
        .O(cfg_err_cpl_rdy));
  LUT1 #(
    .INIT(2'h1)) 
    cfg_interrupt_rdy_INST_0
       (.I0(cfg_interrupt_rdy_n),
        .O(cfg_interrupt_rdy));
  LUT1 #(
    .INIT(2'h1)) 
    cfg_mgmt_rd_wr_done_INST_0
       (.I0(cfg_mgmt_rd_wr_done_n),
        .O(cfg_mgmt_rd_wr_done));
  LUT1 #(
    .INIT(2'h1)) 
    cfg_received_func_lvl_rst_INST_0
       (.I0(received_func_lvl_rst_n),
        .O(cfg_received_func_lvl_rst));
  LUT3 #(
    .INIT(8'h4F)) 
    lnk_up_thrtl_i_1
       (.I0(trn_tdst_rdy),
        .I1(lnk_up_thrtl),
        .I2(out),
        .O(pcie_block_i_2));
  LUT6 #(
    .INIT(64'h0000000027000000)) 
    m_axis_rx_tvalid_xhdl2_i_2
       (.I0(trn_reof),
        .I1(trn_rdst_rdy),
        .I2(trn_rsof),
        .I3(trn_rsrc_dsc),
        .I4(trn_in_packet),
        .I5(trn_rsrc_dsc_d),
        .O(dsc_detect));
  (* box_type = "PRIMITIVE" *) 
  PCIE_2_1 #(
    .AER_BASE_PTR(12'h000),
    .AER_CAP_ECRC_CHECK_CAPABLE("FALSE"),
    .AER_CAP_ECRC_GEN_CAPABLE("FALSE"),
    .AER_CAP_ID(16'h0001),
    .AER_CAP_MULTIHEADER("FALSE"),
    .AER_CAP_NEXTPTR(12'h000),
    .AER_CAP_ON("FALSE"),
    .AER_CAP_OPTIONAL_ERR_SUPPORT(24'h000000),
    .AER_CAP_PERMIT_ROOTERR_UPDATE("FALSE"),
    .AER_CAP_VERSION(4'h1),
    .ALLOW_X8_GEN2("FALSE"),
    .BAR0(32'hFFFFF800),
    .BAR1(32'h00000000),
    .BAR2(32'h00000000),
    .BAR3(32'h00000000),
    .BAR4(32'h00000000),
    .BAR5(32'h00000000),
    .CAPABILITIES_PTR(8'h40),
    .CARDBUS_CIS_POINTER(32'h00000000),
    .CFG_ECRC_ERR_CPLSTAT(0),
    .CLASS_CODE(24'h058000),
    .CMD_INTX_IMPLEMENTED("TRUE"),
    .CPL_TIMEOUT_DISABLE_SUPPORTED("FALSE"),
    .CPL_TIMEOUT_RANGES_SUPPORTED(4'h2),
    .CRM_MODULE_RSTS(7'h00),
    .DEV_CAP2_ARI_FORWARDING_SUPPORTED("FALSE"),
    .DEV_CAP2_ATOMICOP32_COMPLETER_SUPPORTED("FALSE"),
    .DEV_CAP2_ATOMICOP64_COMPLETER_SUPPORTED("FALSE"),
    .DEV_CAP2_ATOMICOP_ROUTING_SUPPORTED("FALSE"),
    .DEV_CAP2_CAS128_COMPLETER_SUPPORTED("FALSE"),
    .DEV_CAP2_ENDEND_TLP_PREFIX_SUPPORTED("FALSE"),
    .DEV_CAP2_EXTENDED_FMT_FIELD_SUPPORTED("FALSE"),
    .DEV_CAP2_LTR_MECHANISM_SUPPORTED("FALSE"),
    .DEV_CAP2_MAX_ENDEND_TLP_PREFIXES(2'h0),
    .DEV_CAP2_NO_RO_ENABLED_PRPR_PASSING("FALSE"),
    .DEV_CAP2_TPH_COMPLETER_SUPPORTED(2'h0),
    .DEV_CAP_ENABLE_SLOT_PWR_LIMIT_SCALE("TRUE"),
    .DEV_CAP_ENABLE_SLOT_PWR_LIMIT_VALUE("TRUE"),
    .DEV_CAP_ENDPOINT_L0S_LATENCY(0),
    .DEV_CAP_ENDPOINT_L1_LATENCY(7),
    .DEV_CAP_EXT_TAG_SUPPORTED("FALSE"),
    .DEV_CAP_FUNCTION_LEVEL_RESET_CAPABLE("FALSE"),
    .DEV_CAP_MAX_PAYLOAD_SUPPORTED(2),
    .DEV_CAP_PHANTOM_FUNCTIONS_SUPPORT(0),
    .DEV_CAP_ROLE_BASED_ERROR("TRUE"),
    .DEV_CAP_RSVD_14_12(0),
    .DEV_CAP_RSVD_17_16(0),
    .DEV_CAP_RSVD_31_29(0),
    .DEV_CONTROL_AUX_POWER_SUPPORTED("FALSE"),
    .DEV_CONTROL_EXT_TAG_DEFAULT("FALSE"),
    .DISABLE_ASPM_L1_TIMER("FALSE"),
    .DISABLE_BAR_FILTERING("FALSE"),
    .DISABLE_ERR_MSG("FALSE"),
    .DISABLE_ID_CHECK("FALSE"),
    .DISABLE_LANE_REVERSAL("TRUE"),
    .DISABLE_LOCKED_FILTER("FALSE"),
    .DISABLE_PPM_FILTER("FALSE"),
    .DISABLE_RX_POISONED_RESP("FALSE"),
    .DISABLE_RX_TC_FILTER("FALSE"),
    .DISABLE_SCRAMBLING("FALSE"),
    .DNSTREAM_LINK_NUM(8'h00),
    .DSN_BASE_PTR(12'h100),
    .DSN_CAP_ID(16'h0003),
    .DSN_CAP_NEXTPTR(12'h000),
    .DSN_CAP_ON("TRUE"),
    .DSN_CAP_VERSION(4'h1),
    .ENABLE_MSG_ROUTE(11'h000),
    .ENABLE_RX_TD_ECRC_TRIM("FALSE"),
    .ENDEND_TLP_PREFIX_FORWARDING_SUPPORTED("FALSE"),
    .ENTER_RVRY_EI_L0("TRUE"),
    .EXIT_LOOPBACK_ON_EI("TRUE"),
    .EXPANSION_ROM(32'h00000000),
    .EXT_CFG_CAP_PTR(6'h3F),
    .EXT_CFG_XP_CAP_PTR(10'h3FF),
    .HEADER_TYPE(8'h00),
    .INFER_EI(5'h00),
    .INTERRUPT_PIN(8'h01),
    .INTERRUPT_STAT_AUTO("TRUE"),
    .IS_SWITCH("FALSE"),
    .LAST_CONFIG_DWORD(10'h3FF),
    .LINK_CAP_ASPM_OPTIONALITY("FALSE"),
    .LINK_CAP_ASPM_SUPPORT(1),
    .LINK_CAP_CLOCK_POWER_MANAGEMENT("FALSE"),
    .LINK_CAP_DLL_LINK_ACTIVE_REPORTING_CAP("FALSE"),
    .LINK_CAP_L0S_EXIT_LATENCY_COMCLK_GEN1(7),
    .LINK_CAP_L0S_EXIT_LATENCY_COMCLK_GEN2(7),
    .LINK_CAP_L0S_EXIT_LATENCY_GEN1(7),
    .LINK_CAP_L0S_EXIT_LATENCY_GEN2(7),
    .LINK_CAP_L1_EXIT_LATENCY_COMCLK_GEN1(7),
    .LINK_CAP_L1_EXIT_LATENCY_COMCLK_GEN2(7),
    .LINK_CAP_L1_EXIT_LATENCY_GEN1(7),
    .LINK_CAP_L1_EXIT_LATENCY_GEN2(7),
    .LINK_CAP_LINK_BANDWIDTH_NOTIFICATION_CAP("FALSE"),
    .LINK_CAP_MAX_LINK_SPEED(4'h1),
    .LINK_CAP_MAX_LINK_WIDTH(6'h01),
    .LINK_CAP_RSVD_23(0),
    .LINK_CAP_SURPRISE_DOWN_ERROR_CAPABLE("FALSE"),
    .LINK_CONTROL_RCB(0),
    .LINK_CTRL2_DEEMPHASIS("FALSE"),
    .LINK_CTRL2_HW_AUTONOMOUS_SPEED_DISABLE("FALSE"),
    .LINK_CTRL2_TARGET_LINK_SPEED(4'h0),
    .LINK_STATUS_SLOT_CLOCK_CONFIG("TRUE"),
    .LL_ACK_TIMEOUT(15'h0000),
    .LL_ACK_TIMEOUT_EN("FALSE"),
    .LL_ACK_TIMEOUT_FUNC(0),
    .LL_REPLAY_TIMEOUT(15'h0000),
    .LL_REPLAY_TIMEOUT_EN("FALSE"),
    .LL_REPLAY_TIMEOUT_FUNC(1),
    .LTSSM_MAX_LINK_WIDTH(6'h01),
    .MPS_FORCE("FALSE"),
    .MSIX_BASE_PTR(8'h9C),
    .MSIX_CAP_ID(8'h11),
    .MSIX_CAP_NEXTPTR(8'h00),
    .MSIX_CAP_ON("FALSE"),
    .MSIX_CAP_PBA_BIR(0),
    .MSIX_CAP_PBA_OFFSET(29'h00000000),
    .MSIX_CAP_TABLE_BIR(0),
    .MSIX_CAP_TABLE_OFFSET(29'h00000000),
    .MSIX_CAP_TABLE_SIZE(11'h000),
    .MSI_BASE_PTR(8'h48),
    .MSI_CAP_64_BIT_ADDR_CAPABLE("TRUE"),
    .MSI_CAP_ID(8'h05),
    .MSI_CAP_MULTIMSGCAP(0),
    .MSI_CAP_MULTIMSG_EXTENSION(0),
    .MSI_CAP_NEXTPTR(8'h60),
    .MSI_CAP_ON("TRUE"),
    .MSI_CAP_PER_VECTOR_MASKING_CAPABLE("FALSE"),
    .N_FTS_COMCLK_GEN1(255),
    .N_FTS_COMCLK_GEN2(255),
    .N_FTS_GEN1(255),
    .N_FTS_GEN2(255),
    .PCIE_BASE_PTR(8'h60),
    .PCIE_CAP_CAPABILITY_ID(8'h10),
    .PCIE_CAP_CAPABILITY_VERSION(4'h2),
    .PCIE_CAP_DEVICE_PORT_TYPE(4'h0),
    .PCIE_CAP_NEXTPTR(8'h00),
    .PCIE_CAP_ON("TRUE"),
    .PCIE_CAP_RSVD_15_14(0),
    .PCIE_CAP_SLOT_IMPLEMENTED("FALSE"),
    .PCIE_REVISION(2),
    .PL_AUTO_CONFIG(0),
    .PL_FAST_TRAIN("TRUE"),
    .PM_ASPML0S_TIMEOUT(15'h0000),
    .PM_ASPML0S_TIMEOUT_EN("FALSE"),
    .PM_ASPML0S_TIMEOUT_FUNC(0),
    .PM_ASPM_FASTEXIT("FALSE"),
    .PM_BASE_PTR(8'h40),
    .PM_CAP_AUXCURRENT(0),
    .PM_CAP_D1SUPPORT("FALSE"),
    .PM_CAP_D2SUPPORT("FALSE"),
    .PM_CAP_DSI("FALSE"),
    .PM_CAP_ID(8'h01),
    .PM_CAP_NEXTPTR(8'h48),
    .PM_CAP_ON("TRUE"),
    .PM_CAP_PMESUPPORT(5'h0F),
    .PM_CAP_PME_CLOCK("FALSE"),
    .PM_CAP_RSVD_04(0),
    .PM_CAP_VERSION(3),
    .PM_CSR_B2B3("FALSE"),
    .PM_CSR_BPCCEN("FALSE"),
    .PM_CSR_NOSOFTRST("TRUE"),
    .PM_DATA0(8'h00),
    .PM_DATA1(8'h00),
    .PM_DATA2(8'h00),
    .PM_DATA3(8'h00),
    .PM_DATA4(8'h00),
    .PM_DATA5(8'h00),
    .PM_DATA6(8'h00),
    .PM_DATA7(8'h00),
    .PM_DATA_SCALE0(2'h0),
    .PM_DATA_SCALE1(2'h0),
    .PM_DATA_SCALE2(2'h0),
    .PM_DATA_SCALE3(2'h0),
    .PM_DATA_SCALE4(2'h0),
    .PM_DATA_SCALE5(2'h0),
    .PM_DATA_SCALE6(2'h0),
    .PM_DATA_SCALE7(2'h0),
    .PM_MF("FALSE"),
    .RBAR_BASE_PTR(12'h000),
    .RBAR_CAP_CONTROL_ENCODEDBAR0(5'h00),
    .RBAR_CAP_CONTROL_ENCODEDBAR1(5'h00),
    .RBAR_CAP_CONTROL_ENCODEDBAR2(5'h00),
    .RBAR_CAP_CONTROL_ENCODEDBAR3(5'h00),
    .RBAR_CAP_CONTROL_ENCODEDBAR4(5'h00),
    .RBAR_CAP_CONTROL_ENCODEDBAR5(5'h00),
    .RBAR_CAP_ID(16'h0015),
    .RBAR_CAP_INDEX0(3'h0),
    .RBAR_CAP_INDEX1(3'h0),
    .RBAR_CAP_INDEX2(3'h0),
    .RBAR_CAP_INDEX3(3'h0),
    .RBAR_CAP_INDEX4(3'h0),
    .RBAR_CAP_INDEX5(3'h0),
    .RBAR_CAP_NEXTPTR(12'h000),
    .RBAR_CAP_ON("FALSE"),
    .RBAR_CAP_SUP0(32'h00000001),
    .RBAR_CAP_SUP1(32'h00000001),
    .RBAR_CAP_SUP2(32'h00000001),
    .RBAR_CAP_SUP3(32'h00000001),
    .RBAR_CAP_SUP4(32'h00000001),
    .RBAR_CAP_SUP5(32'h00000001),
    .RBAR_CAP_VERSION(4'h1),
    .RBAR_NUM(3'h0),
    .RECRC_CHK(0),
    .RECRC_CHK_TRIM("FALSE"),
    .ROOT_CAP_CRS_SW_VISIBILITY("FALSE"),
    .RP_AUTO_SPD(2'h1),
    .RP_AUTO_SPD_LOOPCNT(5'h1F),
    .SELECT_DLL_IF("FALSE"),
    .SIM_VERSION("1.0"),
    .SLOT_CAP_ATT_BUTTON_PRESENT("FALSE"),
    .SLOT_CAP_ATT_INDICATOR_PRESENT("FALSE"),
    .SLOT_CAP_ELEC_INTERLOCK_PRESENT("FALSE"),
    .SLOT_CAP_HOTPLUG_CAPABLE("FALSE"),
    .SLOT_CAP_HOTPLUG_SURPRISE("FALSE"),
    .SLOT_CAP_MRL_SENSOR_PRESENT("FALSE"),
    .SLOT_CAP_NO_CMD_COMPLETED_SUPPORT("FALSE"),
    .SLOT_CAP_PHYSICAL_SLOT_NUM(13'h0000),
    .SLOT_CAP_POWER_CONTROLLER_PRESENT("FALSE"),
    .SLOT_CAP_POWER_INDICATOR_PRESENT("FALSE"),
    .SLOT_CAP_SLOT_POWER_LIMIT_SCALE(0),
    .SLOT_CAP_SLOT_POWER_LIMIT_VALUE(8'h00),
    .SPARE_BIT0(0),
    .SPARE_BIT1(0),
    .SPARE_BIT2(0),
    .SPARE_BIT3(0),
    .SPARE_BIT4(0),
    .SPARE_BIT5(0),
    .SPARE_BIT6(0),
    .SPARE_BIT7(0),
    .SPARE_BIT8(0),
    .SPARE_BYTE0(8'h00),
    .SPARE_BYTE1(8'h00),
    .SPARE_BYTE2(8'h00),
    .SPARE_BYTE3(8'h00),
    .SPARE_WORD0(32'h00000000),
    .SPARE_WORD1(32'h00000000),
    .SPARE_WORD2(32'h00000000),
    .SPARE_WORD3(32'h00000000),
    .SSL_MESSAGE_AUTO("FALSE"),
    .TECRC_EP_INV("FALSE"),
    .TL_RBYPASS("FALSE"),
    .TL_RX_RAM_RADDR_LATENCY(0),
    .TL_RX_RAM_RDATA_LATENCY(2),
    .TL_RX_RAM_WRITE_LATENCY(0),
    .TL_TFC_DISABLE("FALSE"),
    .TL_TX_CHECKS_DISABLE("FALSE"),
    .TL_TX_RAM_RADDR_LATENCY(0),
    .TL_TX_RAM_RDATA_LATENCY(2),
    .TL_TX_RAM_WRITE_LATENCY(0),
    .TRN_DW("FALSE"),
    .TRN_NP_FC("TRUE"),
    .UPCONFIG_CAPABLE("TRUE"),
    .UPSTREAM_FACING("TRUE"),
    .UR_ATOMIC("FALSE"),
    .UR_CFG1("TRUE"),
    .UR_INV_REQ("TRUE"),
    .UR_PRS_RESPONSE("TRUE"),
    .USER_CLK2_DIV2("FALSE"),
    .USER_CLK_FREQ(1),
    .USE_RID_PINS("FALSE"),
    .VC0_CPL_INFINITE("TRUE"),
    .VC0_RX_RAM_LIMIT(13'h07FF),
    .VC0_TOTAL_CREDITS_CD(461),
    .VC0_TOTAL_CREDITS_CH(36),
    .VC0_TOTAL_CREDITS_NPD(24),
    .VC0_TOTAL_CREDITS_NPH(12),
    .VC0_TOTAL_CREDITS_PD(437),
    .VC0_TOTAL_CREDITS_PH(32),
    .VC0_TX_LASTPACKET(29),
    .VC_BASE_PTR(12'h000),
    .VC_CAP_ID(16'h0002),
    .VC_CAP_NEXTPTR(12'h000),
    .VC_CAP_ON("FALSE"),
    .VC_CAP_REJECT_SNOOP_TRANSACTIONS("FALSE"),
    .VC_CAP_VERSION(4'h1),
    .VSEC_BASE_PTR(12'h000),
    .VSEC_CAP_HDR_ID(16'h1234),
    .VSEC_CAP_HDR_LENGTH(12'h018),
    .VSEC_CAP_HDR_REVISION(4'h1),
    .VSEC_CAP_ID(16'h000B),
    .VSEC_CAP_IS_LINK_VISIBLE("TRUE"),
    .VSEC_CAP_NEXTPTR(12'h000),
    .VSEC_CAP_ON("FALSE"),
    .VSEC_CAP_VERSION(4'h1)) 
    pcie_block_i
       (.CFGAERECRCCHECKEN(cfg_aer_ecrc_check_en),
        .CFGAERECRCGENEN(cfg_aer_ecrc_gen_en),
        .CFGAERINTERRUPTMSGNUM(cfg_aer_interrupt_msgnum),
        .CFGAERROOTERRCORRERRRECEIVED(cfg_aer_rooterr_corr_err_received),
        .CFGAERROOTERRCORRERRREPORTINGEN(cfg_aer_rooterr_corr_err_reporting_en),
        .CFGAERROOTERRFATALERRRECEIVED(cfg_aer_rooterr_fatal_err_received),
        .CFGAERROOTERRFATALERRREPORTINGEN(cfg_aer_rooterr_fatal_err_reporting_en),
        .CFGAERROOTERRNONFATALERRRECEIVED(cfg_aer_rooterr_non_fatal_err_received),
        .CFGAERROOTERRNONFATALERRREPORTINGEN(cfg_aer_rooterr_non_fatal_err_reporting_en),
        .CFGBRIDGESERREN(cfg_bridge_serr_en),
        .CFGCOMMANDBUSMASTERENABLE(cfg_command[2]),
        .CFGCOMMANDINTERRUPTDISABLE(cfg_command[4]),
        .CFGCOMMANDIOENABLE(cfg_command[0]),
        .CFGCOMMANDMEMENABLE(cfg_command[1]),
        .CFGCOMMANDSERREN(cfg_command[3]),
        .CFGDEVCONTROL2ARIFORWARDEN(cfg_dcommand2[5]),
        .CFGDEVCONTROL2ATOMICEGRESSBLOCK(cfg_dcommand2[7]),
        .CFGDEVCONTROL2ATOMICREQUESTEREN(cfg_dcommand2[6]),
        .CFGDEVCONTROL2CPLTIMEOUTDIS(cfg_dcommand2[4]),
        .CFGDEVCONTROL2CPLTIMEOUTVAL(cfg_dcommand2[3:0]),
        .CFGDEVCONTROL2IDOCPLEN(cfg_dcommand2[9]),
        .CFGDEVCONTROL2IDOREQEN(cfg_dcommand2[8]),
        .CFGDEVCONTROL2LTREN(cfg_dcommand2[10]),
        .CFGDEVCONTROL2TLPPREFIXBLOCK(cfg_dcommand2[11]),
        .CFGDEVCONTROLAUXPOWEREN(cfg_dcommand[10]),
        .CFGDEVCONTROLCORRERRREPORTINGEN(cfg_dcommand[0]),
        .CFGDEVCONTROLENABLERO(cfg_dcommand[4]),
        .CFGDEVCONTROLEXTTAGEN(cfg_dcommand[8]),
        .CFGDEVCONTROLFATALERRREPORTINGEN(cfg_dcommand[2]),
        .CFGDEVCONTROLMAXPAYLOAD(cfg_dcommand[7:5]),
        .CFGDEVCONTROLMAXREADREQ(cfg_dcommand[14:12]),
        .CFGDEVCONTROLNONFATALREPORTINGEN(cfg_dcommand[1]),
        .CFGDEVCONTROLNOSNOOPEN(cfg_dcommand[11]),
        .CFGDEVCONTROLPHANTOMEN(cfg_dcommand[9]),
        .CFGDEVCONTROLURERRREPORTINGEN(cfg_dcommand[3]),
        .CFGDEVID({1'b0,1'b1,1'b1,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0,1'b1}),
        .CFGDEVSTATUSCORRERRDETECTED(cfg_dstatus[0]),
        .CFGDEVSTATUSFATALERRDETECTED(cfg_dstatus[2]),
        .CFGDEVSTATUSNONFATALERRDETECTED(cfg_dstatus[1]),
        .CFGDEVSTATUSURDETECTED(cfg_dstatus[3]),
        .CFGDSBUSNUMBER(cfg_ds_bus_number),
        .CFGDSDEVICENUMBER(cfg_ds_device_number),
        .CFGDSFUNCTIONNUMBER(cfg_ds_function_number),
        .CFGDSN(cfg_dsn),
        .CFGERRACSN(1'b1),
        .CFGERRAERHEADERLOG(cfg_err_aer_headerlog),
        .CFGERRAERHEADERLOGSETN(cfg_err_aer_headerlog_set_n),
        .CFGERRATOMICEGRESSBLOCKEDN(cfg_err_atomic_egress_blocked_n),
        .CFGERRCORN(cfg_err_cor_n),
        .CFGERRCPLABORTN(cfg_err_cpl_abort_n),
        .CFGERRCPLRDYN(cfg_err_cpl_rdy_n),
        .CFGERRCPLTIMEOUTN(cfg_err_cpl_timeout_n),
        .CFGERRCPLUNEXPECTN(cfg_err_cpl_unexpect_n),
        .CFGERRECRCN(cfg_err_ecrc_n),
        .CFGERRINTERNALCORN(cfg_err_internal_cor_n),
        .CFGERRINTERNALUNCORN(cfg_err_internal_uncor_n),
        .CFGERRLOCKEDN(cfg_err_locked_n),
        .CFGERRMALFORMEDN(cfg_err_malformed_n),
        .CFGERRMCBLOCKEDN(cfg_err_mc_blocked_n),
        .CFGERRNORECOVERYN(cfg_err_norecovery_n),
        .CFGERRPOISONEDN(cfg_err_poisoned_n),
        .CFGERRPOSTEDN(cfg_err_posted_n),
        .CFGERRTLPCPLHEADER(cfg_err_tlp_cpl_header),
        .CFGERRURN(cfg_err_ur_n),
        .CFGFORCECOMMONCLOCKOFF(1'b0),
        .CFGFORCEEXTENDEDSYNCON(1'b0),
        .CFGFORCEMPS({1'b0,1'b0,1'b0}),
        .CFGINTERRUPTASSERTN(cfg_interrupt_assert_n),
        .CFGINTERRUPTDI(cfg_interrupt_di),
        .CFGINTERRUPTDO(cfg_interrupt_do),
        .CFGINTERRUPTMMENABLE(cfg_interrupt_mmenable),
        .CFGINTERRUPTMSIENABLE(cfg_interrupt_msienable),
        .CFGINTERRUPTMSIXENABLE(cfg_interrupt_msixenable),
        .CFGINTERRUPTMSIXFM(cfg_interrupt_msixfm),
        .CFGINTERRUPTN(cfg_interrupt_n),
        .CFGINTERRUPTRDYN(cfg_interrupt_rdy_n),
        .CFGINTERRUPTSTATN(cfg_interrupt_stat_n),
        .CFGLINKCONTROLASPMCONTROL(cfg_lcommand[1:0]),
        .CFGLINKCONTROLAUTOBANDWIDTHINTEN(cfg_lcommand[10]),
        .CFGLINKCONTROLBANDWIDTHINTEN(cfg_lcommand[9]),
        .CFGLINKCONTROLCLOCKPMEN(cfg_lcommand[7]),
        .CFGLINKCONTROLCOMMONCLOCK(cfg_lcommand[5]),
        .CFGLINKCONTROLEXTENDEDSYNC(cfg_lcommand[6]),
        .CFGLINKCONTROLHWAUTOWIDTHDIS(cfg_lcommand[8]),
        .CFGLINKCONTROLLINKDISABLE(cfg_lcommand[3]),
        .CFGLINKCONTROLRCB(cfg_lcommand[2]),
        .CFGLINKCONTROLRETRAINLINK(cfg_lcommand[4]),
        .CFGLINKSTATUSAUTOBANDWIDTHSTATUS(cfg_lstatus[9]),
        .CFGLINKSTATUSBANDWIDTHSTATUS(cfg_lstatus[8]),
        .CFGLINKSTATUSCURRENTSPEED(cfg_lstatus[1:0]),
        .CFGLINKSTATUSDLLACTIVE(cfg_lstatus[7]),
        .CFGLINKSTATUSLINKTRAINING(cfg_lstatus[6]),
        .CFGLINKSTATUSNEGOTIATEDWIDTH(cfg_lstatus[5:2]),
        .CFGMGMTBYTEENN(cfg_mgmt_byte_en_n),
        .CFGMGMTDI(cfg_mgmt_di),
        .CFGMGMTDO(cfg_mgmt_do),
        .CFGMGMTDWADDR(cfg_mgmt_dwaddr),
        .CFGMGMTRDENN(cfg_mgmt_rd_en_n),
        .CFGMGMTRDWRDONEN(cfg_mgmt_rd_wr_done_n),
        .CFGMGMTWRENN(cfg_mgmt_wr_en_n),
        .CFGMGMTWRREADONLYN(cfg_mgmt_wr_readonly_n),
        .CFGMGMTWRRW1CASRWN(cfg_mgmt_wr_rw1c_as_rw_n),
        .CFGMSGDATA(cfg_msg_data),
        .CFGMSGRECEIVED(cfg_msg_received),
        .CFGMSGRECEIVEDASSERTINTA(cfg_msg_received_assert_int_a),
        .CFGMSGRECEIVEDASSERTINTB(cfg_msg_received_assert_int_b),
        .CFGMSGRECEIVEDASSERTINTC(cfg_msg_received_assert_int_c),
        .CFGMSGRECEIVEDASSERTINTD(cfg_msg_received_assert_int_d),
        .CFGMSGRECEIVEDDEASSERTINTA(cfg_msg_received_deassert_int_a),
        .CFGMSGRECEIVEDDEASSERTINTB(cfg_msg_received_deassert_int_b),
        .CFGMSGRECEIVEDDEASSERTINTC(cfg_msg_received_deassert_int_c),
        .CFGMSGRECEIVEDDEASSERTINTD(cfg_msg_received_deassert_int_d),
        .CFGMSGRECEIVEDERRCOR(cfg_msg_received_err_cor),
        .CFGMSGRECEIVEDERRFATAL(cfg_msg_received_err_fatal),
        .CFGMSGRECEIVEDERRNONFATAL(cfg_msg_received_err_non_fatal),
        .CFGMSGRECEIVEDPMASNAK(cfg_msg_received_pm_as_nak),
        .CFGMSGRECEIVEDPMETO(cfg_to_turnoff),
        .CFGMSGRECEIVEDPMETOACK(cfg_msg_received_pme_to_ack),
        .CFGMSGRECEIVEDPMPME(cfg_msg_received_pm_pme),
        .CFGMSGRECEIVEDSETSLOTPOWERLIMIT(cfg_msg_received_setslotpowerlimit),
        .CFGMSGRECEIVEDUNLOCK(pcie_block_i_n_72),
        .CFGPCIECAPINTERRUPTMSGNUM(cfg_pciecap_interrupt_msgnum),
        .CFGPCIELINKSTATE(cfg_pcie_link_state),
        .CFGPMCSRPMEEN(cfg_pmcsr_pme_en),
        .CFGPMCSRPMESTATUS(cfg_pmcsr_pme_status),
        .CFGPMCSRPOWERSTATE(cfg_pmcsr_powerstate),
        .CFGPMFORCESTATE(cfg_pm_force_state),
        .CFGPMFORCESTATEENN(cfg_pm_force_state_en_n),
        .CFGPMHALTASPML0SN(cfg_pm_halt_aspm_l0s_n),
        .CFGPMHALTASPML1N(cfg_pm_halt_aspm_l1_n),
        .CFGPMRCVASREQL1N(pcie_block_i_n_75),
        .CFGPMRCVENTERL1N(pcie_block_i_n_76),
        .CFGPMRCVENTERL23N(pcie_block_i_n_77),
        .CFGPMRCVREQACKN(pcie_block_i_n_78),
        .CFGPMSENDPMETON(1'b1),
        .CFGPMTURNOFFOKN(cfg_pm_turnoff_ok_n),
        .CFGPMWAKEN(cfg_pm_wake_n),
        .CFGPORTNUMBER({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CFGREVID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CFGROOTCONTROLPMEINTEN(cfg_root_control_pme_int_en),
        .CFGROOTCONTROLSYSERRCORRERREN(cfg_root_control_syserr_corr_err_en),
        .CFGROOTCONTROLSYSERRFATALERREN(cfg_root_control_syserr_fatal_err_en),
        .CFGROOTCONTROLSYSERRNONFATALERREN(cfg_root_control_syserr_non_fatal_err_en),
        .CFGSLOTCONTROLELECTROMECHILCTLPULSE(cfg_slot_control_electromech_il_ctl_pulse),
        .CFGSUBSYSID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1}),
        .CFGSUBSYSVENDID({1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b0,1'b1,1'b1,1'b1,1'b0}),
        .CFGTRANSACTION(pcie_block_i_n_84),
        .CFGTRANSACTIONADDR({pcie_block_i_n_1097,pcie_block_i_n_1098,pcie_block_i_n_1099,pcie_block_i_n_1100,pcie_block_i_n_1101,pcie_block_i_n_1102,pcie_block_i_n_1103}),
        .CFGTRANSACTIONTYPE(pcie_block_i_n_85),
        .CFGTRNPENDINGN(cfg_trn_pending_n),
        .CFGVCTCVCMAP(cfg_vc_tcvc_map),
        .CFGVENDID({1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b0,1'b1,1'b1,1'b1,1'b0}),
        .CMRSTN(1'b1),
        .CMSTICKYRSTN(1'b1),
        .DBGMODE({1'b0,1'b0}),
        .DBGSCLRA(pcie_block_i_n_86),
        .DBGSCLRB(pcie_block_i_n_87),
        .DBGSCLRC(pcie_block_i_n_88),
        .DBGSCLRD(pcie_block_i_n_89),
        .DBGSCLRE(pcie_block_i_n_90),
        .DBGSCLRF(pcie_block_i_n_91),
        .DBGSCLRG(pcie_block_i_n_92),
        .DBGSCLRH(pcie_block_i_n_93),
        .DBGSCLRI(pcie_block_i_n_94),
        .DBGSCLRJ(pcie_block_i_n_95),
        .DBGSCLRK(pcie_block_i_n_96),
        .DBGSUBMODE(1'b0),
        .DBGVECA({pcie_block_i_n_704,pcie_block_i_n_705,pcie_block_i_n_706,pcie_block_i_n_707,pcie_block_i_n_708,pcie_block_i_n_709,pcie_block_i_n_710,pcie_block_i_n_711,pcie_block_i_n_712,pcie_block_i_n_713,pcie_block_i_n_714,pcie_block_i_n_715,pcie_block_i_n_716,pcie_block_i_n_717,pcie_block_i_n_718,pcie_block_i_n_719,pcie_block_i_n_720,pcie_block_i_n_721,pcie_block_i_n_722,pcie_block_i_n_723,pcie_block_i_n_724,pcie_block_i_n_725,pcie_block_i_n_726,pcie_block_i_n_727,pcie_block_i_n_728,pcie_block_i_n_729,pcie_block_i_n_730,pcie_block_i_n_731,pcie_block_i_n_732,pcie_block_i_n_733,pcie_block_i_n_734,pcie_block_i_n_735,pcie_block_i_n_736,pcie_block_i_n_737,pcie_block_i_n_738,pcie_block_i_n_739,pcie_block_i_n_740,pcie_block_i_n_741,pcie_block_i_n_742,pcie_block_i_n_743,pcie_block_i_n_744,pcie_block_i_n_745,pcie_block_i_n_746,pcie_block_i_n_747,pcie_block_i_n_748,pcie_block_i_n_749,pcie_block_i_n_750,pcie_block_i_n_751,pcie_block_i_n_752,pcie_block_i_n_753,pcie_block_i_n_754,pcie_block_i_n_755,pcie_block_i_n_756,pcie_block_i_n_757,pcie_block_i_n_758,pcie_block_i_n_759,pcie_block_i_n_760,pcie_block_i_n_761,pcie_block_i_n_762,pcie_block_i_n_763,pcie_block_i_n_764,pcie_block_i_n_765,pcie_block_i_n_766,pcie_block_i_n_767}),
        .DBGVECB({pcie_block_i_n_768,pcie_block_i_n_769,pcie_block_i_n_770,pcie_block_i_n_771,pcie_block_i_n_772,pcie_block_i_n_773,pcie_block_i_n_774,pcie_block_i_n_775,pcie_block_i_n_776,pcie_block_i_n_777,pcie_block_i_n_778,pcie_block_i_n_779,pcie_block_i_n_780,pcie_block_i_n_781,pcie_block_i_n_782,pcie_block_i_n_783,pcie_block_i_n_784,pcie_block_i_n_785,pcie_block_i_n_786,pcie_block_i_n_787,pcie_block_i_n_788,pcie_block_i_n_789,pcie_block_i_n_790,pcie_block_i_n_791,pcie_block_i_n_792,pcie_block_i_n_793,pcie_block_i_n_794,pcie_block_i_n_795,pcie_block_i_n_796,pcie_block_i_n_797,pcie_block_i_n_798,pcie_block_i_n_799,pcie_block_i_n_800,pcie_block_i_n_801,pcie_block_i_n_802,pcie_block_i_n_803,pcie_block_i_n_804,pcie_block_i_n_805,pcie_block_i_n_806,pcie_block_i_n_807,pcie_block_i_n_808,pcie_block_i_n_809,pcie_block_i_n_810,pcie_block_i_n_811,pcie_block_i_n_812,pcie_block_i_n_813,pcie_block_i_n_814,pcie_block_i_n_815,pcie_block_i_n_816,pcie_block_i_n_817,pcie_block_i_n_818,pcie_block_i_n_819,pcie_block_i_n_820,pcie_block_i_n_821,pcie_block_i_n_822,pcie_block_i_n_823,pcie_block_i_n_824,pcie_block_i_n_825,pcie_block_i_n_826,pcie_block_i_n_827,pcie_block_i_n_828,pcie_block_i_n_829,pcie_block_i_n_830,pcie_block_i_n_831}),
        .DBGVECC({pcie_block_i_n_172,pcie_block_i_n_173,pcie_block_i_n_174,pcie_block_i_n_175,pcie_block_i_n_176,pcie_block_i_n_177,pcie_block_i_n_178,pcie_block_i_n_179,pcie_block_i_n_180,pcie_block_i_n_181,pcie_block_i_n_182,pcie_block_i_n_183}),
        .DLRSTN(1'b1),
        .DRPADDR(pcie_drp_addr),
        .DRPCLK(pcie_drp_clk),
        .DRPDI(pcie_drp_di),
        .DRPDO(pcie_drp_do),
        .DRPEN(pcie_drp_en),
        .DRPRDY(pcie_drp_rdy),
        .DRPWE(pcie_drp_we),
        .FUNCLVLRSTN(1'b1),
        .LL2BADDLLPERR(pcie_block_i_n_98),
        .LL2BADTLPERR(pcie_block_i_n_99),
        .LL2LINKSTATUS({pcie_block_i_n_687,pcie_block_i_n_688,pcie_block_i_n_689,pcie_block_i_n_690,pcie_block_i_n_691}),
        .LL2PROTOCOLERR(pcie_block_i_n_100),
        .LL2RECEIVERERR(pcie_block_i_n_101),
        .LL2REPLAYROERR(pcie_block_i_n_102),
        .LL2REPLAYTOERR(pcie_block_i_n_103),
        .LL2SENDASREQL1(1'b0),
        .LL2SENDENTERL1(1'b0),
        .LL2SENDENTERL23(1'b0),
        .LL2SENDPMACK(1'b0),
        .LL2SUSPENDNOW(1'b0),
        .LL2SUSPENDOK(pcie_block_i_n_104),
        .LL2TFCINIT1SEQ(pcie_block_i_n_105),
        .LL2TFCINIT2SEQ(pcie_block_i_n_106),
        .LL2TLPRCV(1'b0),
        .LL2TXIDLE(pcie_block_i_n_107),
        .LNKCLKEN(pcie_block_i_n_108),
        .MIMRXRADDR(mim_rx_raddr),
        .MIMRXRDATA(mim_rx_rdata_int),
        .MIMRXREN(mim_rx_ren),
        .MIMRXWADDR(mim_rx_waddr),
        .MIMRXWDATA(mim_rx_wdata),
        .MIMRXWEN(mim_rx_wen),
        .MIMTXRADDR(mim_tx_raddr),
        .MIMTXRDATA(mim_tx_rdata_int),
        .MIMTXREN(mim_tx_ren),
        .MIMTXWADDR(mim_tx_waddr),
        .MIMTXWDATA(mim_tx_wdata),
        .MIMTXWEN(mim_tx_wen),
        .PIPECLK(pipe_pclk_in),
        .PIPERX0CHANISALIGNED(pipe_rx0_chanisaligned),
        .PIPERX0CHARISK(pipe_rx0_char_is_k),
        .PIPERX0DATA(pipe_rx0_data),
        .PIPERX0ELECIDLE(pipe_rx0_elec_idle),
        .PIPERX0PHYSTATUS(pipe_rx0_phy_status),
        .PIPERX0POLARITY(pipe_rx0_polarity),
        .PIPERX0STATUS(pipe_rx0_status),
        .PIPERX0VALID(pipe_rx0_valid),
        .PIPERX1CHANISALIGNED(1'b0),
        .PIPERX1CHARISK({1'b0,1'b0}),
        .PIPERX1DATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PIPERX1ELECIDLE(1'b1),
        .PIPERX1PHYSTATUS(1'b0),
        .PIPERX1POLARITY(pipe_rx1_polarity),
        .PIPERX1STATUS({1'b0,1'b0,1'b0}),
        .PIPERX1VALID(1'b0),
        .PIPERX2CHANISALIGNED(1'b0),
        .PIPERX2CHARISK({1'b0,1'b0}),
        .PIPERX2DATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PIPERX2ELECIDLE(1'b1),
        .PIPERX2PHYSTATUS(1'b0),
        .PIPERX2POLARITY(pipe_rx2_polarity),
        .PIPERX2STATUS({1'b0,1'b0,1'b0}),
        .PIPERX2VALID(1'b0),
        .PIPERX3CHANISALIGNED(1'b0),
        .PIPERX3CHARISK({1'b0,1'b0}),
        .PIPERX3DATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PIPERX3ELECIDLE(1'b1),
        .PIPERX3PHYSTATUS(1'b0),
        .PIPERX3POLARITY(pipe_rx3_polarity),
        .PIPERX3STATUS({1'b0,1'b0,1'b0}),
        .PIPERX3VALID(1'b0),
        .PIPERX4CHANISALIGNED(1'b0),
        .PIPERX4CHARISK({1'b0,1'b0}),
        .PIPERX4DATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PIPERX4ELECIDLE(1'b1),
        .PIPERX4PHYSTATUS(1'b0),
        .PIPERX4POLARITY(pipe_rx4_polarity),
        .PIPERX4STATUS({1'b0,1'b0,1'b0}),
        .PIPERX4VALID(1'b0),
        .PIPERX5CHANISALIGNED(1'b0),
        .PIPERX5CHARISK({1'b0,1'b0}),
        .PIPERX5DATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PIPERX5ELECIDLE(1'b1),
        .PIPERX5PHYSTATUS(1'b0),
        .PIPERX5POLARITY(pipe_rx5_polarity),
        .PIPERX5STATUS({1'b0,1'b0,1'b0}),
        .PIPERX5VALID(1'b0),
        .PIPERX6CHANISALIGNED(1'b0),
        .PIPERX6CHARISK({1'b0,1'b0}),
        .PIPERX6DATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PIPERX6ELECIDLE(1'b1),
        .PIPERX6PHYSTATUS(1'b0),
        .PIPERX6POLARITY(pipe_rx6_polarity),
        .PIPERX6STATUS({1'b0,1'b0,1'b0}),
        .PIPERX6VALID(1'b0),
        .PIPERX7CHANISALIGNED(1'b0),
        .PIPERX7CHARISK({1'b0,1'b0}),
        .PIPERX7DATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PIPERX7ELECIDLE(1'b1),
        .PIPERX7PHYSTATUS(1'b0),
        .PIPERX7POLARITY(pipe_rx7_polarity),
        .PIPERX7STATUS({1'b0,1'b0,1'b0}),
        .PIPERX7VALID(1'b0),
        .PIPETX0CHARISK(pipe_tx0_char_is_k),
        .PIPETX0COMPLIANCE(pipe_tx0_compliance),
        .PIPETX0DATA(pipe_tx0_data),
        .PIPETX0ELECIDLE(pipe_tx0_elec_idle),
        .PIPETX0POWERDOWN(pipe_tx0_powerdown),
        .PIPETX1CHARISK(pipe_tx1_char_is_k),
        .PIPETX1COMPLIANCE(pipe_tx1_compliance),
        .PIPETX1DATA(pipe_tx1_data),
        .PIPETX1ELECIDLE(pipe_tx1_elec_idle),
        .PIPETX1POWERDOWN(pipe_tx1_powerdown),
        .PIPETX2CHARISK(pipe_tx2_char_is_k),
        .PIPETX2COMPLIANCE(pipe_tx2_compliance),
        .PIPETX2DATA(pipe_tx2_data),
        .PIPETX2ELECIDLE(pipe_tx2_elec_idle),
        .PIPETX2POWERDOWN(pipe_tx2_powerdown),
        .PIPETX3CHARISK(pipe_tx3_char_is_k),
        .PIPETX3COMPLIANCE(pipe_tx3_compliance),
        .PIPETX3DATA(pipe_tx3_data),
        .PIPETX3ELECIDLE(pipe_tx3_elec_idle),
        .PIPETX3POWERDOWN(pipe_tx3_powerdown),
        .PIPETX4CHARISK(pipe_tx4_char_is_k),
        .PIPETX4COMPLIANCE(pipe_tx4_compliance),
        .PIPETX4DATA(pipe_tx4_data),
        .PIPETX4ELECIDLE(pipe_tx4_elec_idle),
        .PIPETX4POWERDOWN(pipe_tx4_powerdown),
        .PIPETX5CHARISK(pipe_tx5_char_is_k),
        .PIPETX5COMPLIANCE(pipe_tx5_compliance),
        .PIPETX5DATA(pipe_tx5_data),
        .PIPETX5ELECIDLE(pipe_tx5_elec_idle),
        .PIPETX5POWERDOWN(pipe_tx5_powerdown),
        .PIPETX6CHARISK(pipe_tx6_char_is_k),
        .PIPETX6COMPLIANCE(pipe_tx6_compliance),
        .PIPETX6DATA(pipe_tx6_data),
        .PIPETX6ELECIDLE(pipe_tx6_elec_idle),
        .PIPETX6POWERDOWN(pipe_tx6_powerdown),
        .PIPETX7CHARISK(pipe_tx7_char_is_k),
        .PIPETX7COMPLIANCE(pipe_tx7_compliance),
        .PIPETX7DATA(pipe_tx7_data),
        .PIPETX7ELECIDLE(pipe_tx7_elec_idle),
        .PIPETX7POWERDOWN(pipe_tx7_powerdown),
        .PIPETXDEEMPH(pipe_tx_deemph),
        .PIPETXMARGIN(pipe_tx_margin),
        .PIPETXRATE(pipe_tx_rate),
        .PIPETXRCVRDET(pipe_tx_rcvr_det),
        .PIPETXRESET(pcie_block_i_n_140),
        .PL2DIRECTEDLSTATE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PL2L0REQ(pcie_block_i_n_141),
        .PL2LINKUP(pcie_block_i_n_142),
        .PL2RECEIVERERR(pcie_block_i_n_143),
        .PL2RECOVERY(pcie_block_i_n_144),
        .PL2RXELECIDLE(pcie_block_i_n_145),
        .PL2RXPMSTATE({pcie_block_i_n_610,pcie_block_i_n_611}),
        .PL2SUSPENDOK(pcie_block_i_n_146),
        .PLDBGMODE({1'b0,1'b0,1'b0}),
        .PLDBGVEC({pcie_block_i_n_184,pcie_block_i_n_185,pcie_block_i_n_186,pcie_block_i_n_187,pcie_block_i_n_188,pcie_block_i_n_189,pcie_block_i_n_190,pcie_block_i_n_191,pcie_block_i_n_192,pcie_block_i_n_193,pcie_block_i_n_194,pcie_block_i_n_195}),
        .PLDIRECTEDCHANGEDONE(pl_directed_change_done),
        .PLDIRECTEDLINKAUTON(pl_directed_link_auton),
        .PLDIRECTEDLINKCHANGE(pl_directed_link_change),
        .PLDIRECTEDLINKSPEED(pl_directed_link_speed),
        .PLDIRECTEDLINKWIDTH(pl_directed_link_width),
        .PLDIRECTEDLTSSMNEW({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PLDIRECTEDLTSSMNEWVLD(1'b0),
        .PLDIRECTEDLTSSMSTALL(1'b0),
        .PLDOWNSTREAMDEEMPHSOURCE(pl_downstream_deemph_source),
        .PLINITIALLINKWIDTH(pl_initial_link_width),
        .PLLANEREVERSALMODE(pl_lane_reversal_mode),
        .PLLINKGEN2CAP(pl_link_gen2_cap),
        .PLLINKPARTNERGEN2SUPPORTED(pl_link_partner_gen2_supported),
        .PLLINKUPCFGCAP(pl_link_upcfg_cap),
        .PLLTSSMSTATE(pl_ltssm_state),
        .PLPHYLNKUPN(pl_phy_lnk_up_n),
        .PLRECEIVEDHOTRST(pl_received_hot_rst),
        .PLRSTN(1'b1),
        .PLRXPMSTATE(pl_rx_pm_state),
        .PLSELLNKRATE(pl_sel_lnk_rate),
        .PLSELLNKWIDTH(pl_sel_lnk_width),
        .PLTRANSMITHOTRST(pl_transmit_hot_rst),
        .PLTXPMSTATE(pl_tx_pm_state),
        .PLUPSTREAMPREFERDEEMPH(pl_upstream_prefer_deemph),
        .RECEIVEDFUNCLVLRSTN(received_func_lvl_rst_n),
        .SYSRSTN(sys_rst_n),
        .TL2ASPMSUSPENDCREDITCHECK(1'b0),
        .TL2ASPMSUSPENDCREDITCHECKOK(pcie_block_i_n_155),
        .TL2ASPMSUSPENDREQ(pcie_block_i_n_156),
        .TL2ERRFCPE(pcie_block_i_n_157),
        .TL2ERRHDR({pcie_block_i_n_832,pcie_block_i_n_833,pcie_block_i_n_834,pcie_block_i_n_835,pcie_block_i_n_836,pcie_block_i_n_837,pcie_block_i_n_838,pcie_block_i_n_839,pcie_block_i_n_840,pcie_block_i_n_841,pcie_block_i_n_842,pcie_block_i_n_843,pcie_block_i_n_844,pcie_block_i_n_845,pcie_block_i_n_846,pcie_block_i_n_847,pcie_block_i_n_848,pcie_block_i_n_849,pcie_block_i_n_850,pcie_block_i_n_851,pcie_block_i_n_852,pcie_block_i_n_853,pcie_block_i_n_854,pcie_block_i_n_855,pcie_block_i_n_856,pcie_block_i_n_857,pcie_block_i_n_858,pcie_block_i_n_859,pcie_block_i_n_860,pcie_block_i_n_861,pcie_block_i_n_862,pcie_block_i_n_863,pcie_block_i_n_864,pcie_block_i_n_865,pcie_block_i_n_866,pcie_block_i_n_867,pcie_block_i_n_868,pcie_block_i_n_869,pcie_block_i_n_870,pcie_block_i_n_871,pcie_block_i_n_872,pcie_block_i_n_873,pcie_block_i_n_874,pcie_block_i_n_875,pcie_block_i_n_876,pcie_block_i_n_877,pcie_block_i_n_878,pcie_block_i_n_879,pcie_block_i_n_880,pcie_block_i_n_881,pcie_block_i_n_882,pcie_block_i_n_883,pcie_block_i_n_884,pcie_block_i_n_885,pcie_block_i_n_886,pcie_block_i_n_887,pcie_block_i_n_888,pcie_block_i_n_889,pcie_block_i_n_890,pcie_block_i_n_891,pcie_block_i_n_892,pcie_block_i_n_893,pcie_block_i_n_894,pcie_block_i_n_895}),
        .TL2ERRMALFORMED(pcie_block_i_n_158),
        .TL2ERRRXOVERFLOW(pcie_block_i_n_159),
        .TL2PPMSUSPENDOK(pcie_block_i_n_160),
        .TL2PPMSUSPENDREQ(1'b0),
        .TLRSTN(1'b1),
        .TRNFCCPLD(fc_cpld),
        .TRNFCCPLH(fc_cplh),
        .TRNFCNPD(fc_npd),
        .TRNFCNPH(fc_nph),
        .TRNFCPD(fc_pd),
        .TRNFCPH(fc_ph),
        .TRNFCSEL(fc_sel),
        .TRNLNKUP(trn_lnk_up),
        .TRNRBARHIT({pcie_block_i_n_1143,trn_rbar_hit}),
        .TRNRD({NLW_pcie_block_i_TRNRD_UNCONNECTED[127:64],trn_rd}),
        .TRNRDLLPDATA({pcie_block_i_n_896,pcie_block_i_n_897,pcie_block_i_n_898,pcie_block_i_n_899,pcie_block_i_n_900,pcie_block_i_n_901,pcie_block_i_n_902,pcie_block_i_n_903,pcie_block_i_n_904,pcie_block_i_n_905,pcie_block_i_n_906,pcie_block_i_n_907,pcie_block_i_n_908,pcie_block_i_n_909,pcie_block_i_n_910,pcie_block_i_n_911,pcie_block_i_n_912,pcie_block_i_n_913,pcie_block_i_n_914,pcie_block_i_n_915,pcie_block_i_n_916,pcie_block_i_n_917,pcie_block_i_n_918,pcie_block_i_n_919,pcie_block_i_n_920,pcie_block_i_n_921,pcie_block_i_n_922,pcie_block_i_n_923,pcie_block_i_n_924,pcie_block_i_n_925,pcie_block_i_n_926,pcie_block_i_n_927,pcie_block_i_n_928,pcie_block_i_n_929,pcie_block_i_n_930,pcie_block_i_n_931,pcie_block_i_n_932,pcie_block_i_n_933,pcie_block_i_n_934,pcie_block_i_n_935,pcie_block_i_n_936,pcie_block_i_n_937,pcie_block_i_n_938,pcie_block_i_n_939,pcie_block_i_n_940,pcie_block_i_n_941,pcie_block_i_n_942,pcie_block_i_n_943,pcie_block_i_n_944,pcie_block_i_n_945,pcie_block_i_n_946,pcie_block_i_n_947,pcie_block_i_n_948,pcie_block_i_n_949,pcie_block_i_n_950,pcie_block_i_n_951,pcie_block_i_n_952,pcie_block_i_n_953,pcie_block_i_n_954,pcie_block_i_n_955,pcie_block_i_n_956,pcie_block_i_n_957,pcie_block_i_n_958,pcie_block_i_n_959}),
        .TRNRDLLPSRCRDY({pcie_block_i_n_618,pcie_block_i_n_619}),
        .TRNRDSTRDY(trn_rdst_rdy),
        .TRNRECRCERR(trn_recrc_err),
        .TRNREOF(trn_reof),
        .TRNRERRFWD(trn_rerrfwd),
        .TRNRFCPRET(1'b1),
        .TRNRNPOK(rx_np_ok),
        .TRNRNPREQ(rx_np_req),
        .TRNRREM({NLW_pcie_block_i_TRNRREM_UNCONNECTED[1],trn_rrem}),
        .TRNRSOF(trn_rsof),
        .TRNRSRCDSC(trn_rsrc_dsc),
        .TRNRSRCRDY(trn_rsrc_rdy),
        .TRNTBUFAV(trn_tbuf_av),
        .TRNTCFGGNT(trn_tcfg_gnt),
        .TRNTCFGREQ(trn_tcfg_req),
        .TRNTD({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,trn_td}),
        .TRNTDLLPDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TRNTDLLPDSTRDY(pcie_block_i_n_169),
        .TRNTDLLPSRCRDY(1'b0),
        .TRNTDSTRDY({NLW_pcie_block_i_TRNTDSTRDY_UNCONNECTED[3:1],trn_tdst_rdy}),
        .TRNTECRCGEN(pcie_block_i_3[0]),
        .TRNTEOF(trn_teof),
        .TRNTERRDROP(tx_err_drop),
        .TRNTERRFWD(pcie_block_i_3[1]),
        .TRNTREM({1'b0,trn_trem}),
        .TRNTSOF(trn_tsof),
        .TRNTSRCDSC(pcie_block_i_3[3]),
        .TRNTSRCRDY(trn_tsrc_rdy),
        .TRNTSTR(pcie_block_i_3[2]),
        .USERCLK(pipe_userclk1_in),
        .USERCLK2(pipe_userclk2_in),
        .USERRSTN(user_rst_n));
  LUT1 #(
    .INIT(2'h1)) 
    pcie_block_i_i_1
       (.I0(cfg_err_atomic_egress_blocked),
        .O(cfg_err_atomic_egress_blocked_n));
  LUT1 #(
    .INIT(2'h1)) 
    pcie_block_i_i_10
       (.I0(cfg_err_malformed),
        .O(cfg_err_malformed_n));
  LUT1 #(
    .INIT(2'h1)) 
    pcie_block_i_i_11
       (.I0(cfg_err_mc_blocked),
        .O(cfg_err_mc_blocked_n));
  LUT1 #(
    .INIT(2'h1)) 
    pcie_block_i_i_12
       (.I0(cfg_err_norecovery),
        .O(cfg_err_norecovery_n));
  LUT1 #(
    .INIT(2'h1)) 
    pcie_block_i_i_13
       (.I0(cfg_err_poisoned),
        .O(cfg_err_poisoned_n));
  LUT1 #(
    .INIT(2'h1)) 
    pcie_block_i_i_14
       (.I0(cfg_err_posted),
        .O(cfg_err_posted_n));
  LUT1 #(
    .INIT(2'h1)) 
    pcie_block_i_i_15
       (.I0(cfg_err_ur),
        .O(cfg_err_ur_n));
  LUT1 #(
    .INIT(2'h1)) 
    pcie_block_i_i_16
       (.I0(cfg_interrupt_assert),
        .O(cfg_interrupt_assert_n));
  LUT1 #(
    .INIT(2'h1)) 
    pcie_block_i_i_17
       (.I0(cfg_interrupt),
        .O(cfg_interrupt_n));
  LUT1 #(
    .INIT(2'h1)) 
    pcie_block_i_i_18
       (.I0(cfg_interrupt_stat),
        .O(cfg_interrupt_stat_n));
  LUT1 #(
    .INIT(2'h1)) 
    pcie_block_i_i_19
       (.I0(cfg_mgmt_rd_en),
        .O(cfg_mgmt_rd_en_n));
  LUT1 #(
    .INIT(2'h1)) 
    pcie_block_i_i_2
       (.I0(cfg_err_cor),
        .O(cfg_err_cor_n));
  LUT1 #(
    .INIT(2'h1)) 
    pcie_block_i_i_20
       (.I0(cfg_mgmt_wr_en),
        .O(cfg_mgmt_wr_en_n));
  LUT1 #(
    .INIT(2'h1)) 
    pcie_block_i_i_21
       (.I0(cfg_mgmt_wr_readonly),
        .O(cfg_mgmt_wr_readonly_n));
  LUT1 #(
    .INIT(2'h1)) 
    pcie_block_i_i_22
       (.I0(cfg_mgmt_wr_rw1c_as_rw),
        .O(cfg_mgmt_wr_rw1c_as_rw_n));
  LUT1 #(
    .INIT(2'h1)) 
    pcie_block_i_i_23
       (.I0(cfg_pm_force_state_en),
        .O(cfg_pm_force_state_en_n));
  LUT1 #(
    .INIT(2'h1)) 
    pcie_block_i_i_24
       (.I0(cfg_pm_halt_aspm_l0s),
        .O(cfg_pm_halt_aspm_l0s_n));
  LUT1 #(
    .INIT(2'h1)) 
    pcie_block_i_i_25
       (.I0(cfg_pm_halt_aspm_l1),
        .O(cfg_pm_halt_aspm_l1_n));
  LUT1 #(
    .INIT(2'h1)) 
    pcie_block_i_i_27
       (.I0(cfg_pm_wake),
        .O(cfg_pm_wake_n));
  LUT1 #(
    .INIT(2'h1)) 
    pcie_block_i_i_28
       (.I0(cfg_trn_pending),
        .O(cfg_trn_pending_n));
  LUT1 #(
    .INIT(2'h1)) 
    pcie_block_i_i_3
       (.I0(cfg_err_cpl_abort),
        .O(cfg_err_cpl_abort_n));
  LUT1 #(
    .INIT(2'h1)) 
    pcie_block_i_i_4
       (.I0(cfg_err_cpl_timeout),
        .O(cfg_err_cpl_timeout_n));
  LUT1 #(
    .INIT(2'h1)) 
    pcie_block_i_i_5
       (.I0(cfg_err_cpl_unexpect),
        .O(cfg_err_cpl_unexpect_n));
  LUT1 #(
    .INIT(2'h1)) 
    pcie_block_i_i_6
       (.I0(cfg_err_ecrc),
        .O(cfg_err_ecrc_n));
  LUT1 #(
    .INIT(2'h1)) 
    pcie_block_i_i_7
       (.I0(cfg_err_internal_cor),
        .O(cfg_err_internal_cor_n));
  LUT1 #(
    .INIT(2'h1)) 
    pcie_block_i_i_8
       (.I0(cfg_err_internal_uncor),
        .O(cfg_err_internal_uncor_n));
  LUT1 #(
    .INIT(2'h1)) 
    pcie_block_i_i_9
       (.I0(cfg_err_locked),
        .O(cfg_err_locked_n));
  pcie_7x_0_pcie_bram_top_7x pcie_bram_top
       (.MIMRXRADDR(mim_rx_raddr[10:0]),
        .MIMRXWADDR(mim_rx_waddr[10:0]),
        .MIMTXRADDR(mim_tx_raddr[10:0]),
        .MIMTXWADDR(mim_tx_waddr[10:0]),
        .mim_rx_ren(mim_rx_ren),
        .mim_rx_wen(mim_rx_wen),
        .mim_tx_ren(mim_tx_ren),
        .mim_tx_wen(mim_tx_wen),
        .pipe_userclk1_in(pipe_userclk1_in),
        .\ramb_bl.ramb36_dp_bl.ram36_bl (mim_rx_rdata_int),
        .\ramb_bl.ramb36_dp_bl.ram36_bl_0 (mim_rx_wdata),
        .rdata(mim_tx_rdata_int),
        .wdata(mim_tx_wdata));
  LUT1 #(
    .INIT(2'h1)) 
    pl_phy_lnk_up_cdc_i_1
       (.I0(pl_phy_lnk_up_n),
        .O(src_in));
  LUT5 #(
    .INIT(32'hFFFEAAAA)) 
    ppm_L1_thrtl_i_1
       (.I0(ppm_L1_trig),
        .I1(cfg_pcie_link_state[0]),
        .I2(cfg_pcie_link_state[2]),
        .I3(cfg_pcie_link_state[1]),
        .I4(ppm_L1_thrtl),
        .O(pcie_block_i_0));
  LUT5 #(
    .INIT(32'h00000001)) 
    tbuf_av_min_thrtl_i_1
       (.I0(trn_tbuf_av[1]),
        .I1(trn_tbuf_av[3]),
        .I2(trn_tbuf_av[2]),
        .I3(trn_tbuf_av[5]),
        .I4(trn_tbuf_av[4]),
        .O(tbuf_av_min_trig));
  LUT6 #(
    .INIT(64'h0000000100000003)) 
    tready_thrtl_xhdl1_i_11
       (.I0(trn_tbuf_av[1]),
        .I1(trn_tbuf_av[4]),
        .I2(trn_tbuf_av[5]),
        .I3(trn_tbuf_av[2]),
        .I4(trn_tbuf_av[3]),
        .I5(trn_tbuf_av[0]),
        .O(pcie_block_i_1));
  LUT2 #(
    .INIT(4'h8)) 
    tready_thrtl_xhdl1_i_8
       (.I0(trn_tcfg_req),
        .I1(reg_tcfg_gnt),
        .O(tcfg_req_trig));
  LUT6 #(
    .INIT(64'h08000000AEAA2AAA)) 
    trn_in_packet_i_1
       (.I0(trn_in_packet),
        .I1(trn_rdst_rdy),
        .I2(trn_reof),
        .I3(trn_rsrc_rdy),
        .I4(trn_rsof),
        .I5(trn_rsrc_dsc),
        .O(trn_in_packet_reg));
  (* SOFT_HLUTNM = "soft_lutpair110" *) 
  LUT2 #(
    .INIT(4'hE)) 
    trn_rsrc_dsc_prev_i_1
       (.I0(trn_rsrc_dsc),
        .I1(reg_dsc_detect),
        .O(trn_rsrc_dsc_prev0));
  (* SOFT_HLUTNM = "soft_lutpair110" *) 
  LUT4 #(
    .INIT(16'hAA08)) 
    trn_rsrc_rdy_prev_i_1
       (.I0(trn_rsrc_rdy),
        .I1(trn_rsof),
        .I2(trn_rsrc_dsc),
        .I3(trn_in_packet),
        .O(rsrc_rdy_filtered6_out));
  LUT3 #(
    .INIT(8'h2A)) 
    user_reset_int_i_1
       (.I0(bridge_reset_int),
        .I1(pl_phy_lnk_up),
        .I2(user_rst_n),
        .O(user_reset_int_reg));
endmodule

module pcie_7x_0_pcie_bram_7x
   (rdata,
    pipe_userclk1_in,
    mim_tx_wen,
    mim_tx_ren,
    MIMTXWADDR,
    MIMTXRADDR,
    wdata);
  output [17:0]rdata;
  input pipe_userclk1_in;
  input mim_tx_wen;
  input mim_tx_ren;
  input [10:0]MIMTXWADDR;
  input [10:0]MIMTXRADDR;
  input [17:0]wdata;

  wire [10:0]MIMTXRADDR;
  wire [10:0]MIMTXWADDR;
  wire mim_tx_ren;
  wire mim_tx_wen;
  wire pipe_userclk1_in;
  wire [17:0]rdata;
  wire [17:0]wdata;

  pcie_7x_0_unimacro_BRAM_TDP_MACRO_6 \use_tdp.ramb36 
       (.MIMTXRADDR(MIMTXRADDR),
        .MIMTXWADDR(MIMTXWADDR),
        .mim_tx_ren(mim_tx_ren),
        .mim_tx_wen(mim_tx_wen),
        .pipe_userclk1_in(pipe_userclk1_in),
        .rdata(rdata),
        .wdata(wdata));
endmodule

(* ORIG_REF_NAME = "pcie_7x_0_pcie_bram_7x" *) 
module pcie_7x_0_pcie_bram_7x_1
   (rdata,
    pipe_userclk1_in,
    mim_tx_wen,
    mim_tx_ren,
    MIMTXWADDR,
    MIMTXRADDR,
    wdata);
  output [17:0]rdata;
  input pipe_userclk1_in;
  input mim_tx_wen;
  input mim_tx_ren;
  input [10:0]MIMTXWADDR;
  input [10:0]MIMTXRADDR;
  input [17:0]wdata;

  wire [10:0]MIMTXRADDR;
  wire [10:0]MIMTXWADDR;
  wire mim_tx_ren;
  wire mim_tx_wen;
  wire pipe_userclk1_in;
  wire [17:0]rdata;
  wire [17:0]wdata;

  pcie_7x_0_unimacro_BRAM_TDP_MACRO_5 \use_tdp.ramb36 
       (.MIMTXRADDR(MIMTXRADDR),
        .MIMTXWADDR(MIMTXWADDR),
        .mim_tx_ren(mim_tx_ren),
        .mim_tx_wen(mim_tx_wen),
        .pipe_userclk1_in(pipe_userclk1_in),
        .rdata(rdata),
        .wdata(wdata));
endmodule

(* ORIG_REF_NAME = "pcie_7x_0_pcie_bram_7x" *) 
module pcie_7x_0_pcie_bram_7x_10
   (\ramb_bl.ramb36_dp_bl.ram36_bl ,
    pipe_userclk1_in,
    mim_rx_wen,
    mim_rx_ren,
    MIMRXWADDR,
    MIMRXRADDR,
    \ramb_bl.ramb36_dp_bl.ram36_bl_0 );
  output [13:0]\ramb_bl.ramb36_dp_bl.ram36_bl ;
  input pipe_userclk1_in;
  input mim_rx_wen;
  input mim_rx_ren;
  input [10:0]MIMRXWADDR;
  input [10:0]MIMRXRADDR;
  input [13:0]\ramb_bl.ramb36_dp_bl.ram36_bl_0 ;

  wire [10:0]MIMRXRADDR;
  wire [10:0]MIMRXWADDR;
  wire mim_rx_ren;
  wire mim_rx_wen;
  wire pipe_userclk1_in;
  wire [13:0]\ramb_bl.ramb36_dp_bl.ram36_bl ;
  wire [13:0]\ramb_bl.ramb36_dp_bl.ram36_bl_0 ;

  pcie_7x_0_unimacro_BRAM_TDP_MACRO_11 \use_tdp.ramb36 
       (.MIMRXRADDR(MIMRXRADDR),
        .MIMRXWADDR(MIMRXWADDR),
        .mim_rx_ren(mim_rx_ren),
        .mim_rx_wen(mim_rx_wen),
        .pipe_userclk1_in(pipe_userclk1_in),
        .\ramb_bl.ramb36_dp_bl.ram36_bl_0 (\ramb_bl.ramb36_dp_bl.ram36_bl ),
        .\ramb_bl.ramb36_dp_bl.ram36_bl_1 (\ramb_bl.ramb36_dp_bl.ram36_bl_0 ));
endmodule

(* ORIG_REF_NAME = "pcie_7x_0_pcie_bram_7x" *) 
module pcie_7x_0_pcie_bram_7x_2
   (rdata,
    pipe_userclk1_in,
    mim_tx_wen,
    mim_tx_ren,
    MIMTXWADDR,
    MIMTXRADDR,
    wdata);
  output [17:0]rdata;
  input pipe_userclk1_in;
  input mim_tx_wen;
  input mim_tx_ren;
  input [10:0]MIMTXWADDR;
  input [10:0]MIMTXRADDR;
  input [17:0]wdata;

  wire [10:0]MIMTXRADDR;
  wire [10:0]MIMTXWADDR;
  wire mim_tx_ren;
  wire mim_tx_wen;
  wire pipe_userclk1_in;
  wire [17:0]rdata;
  wire [17:0]wdata;

  pcie_7x_0_unimacro_BRAM_TDP_MACRO_4 \use_tdp.ramb36 
       (.MIMTXRADDR(MIMTXRADDR),
        .MIMTXWADDR(MIMTXWADDR),
        .mim_tx_ren(mim_tx_ren),
        .mim_tx_wen(mim_tx_wen),
        .pipe_userclk1_in(pipe_userclk1_in),
        .rdata(rdata),
        .wdata(wdata));
endmodule

(* ORIG_REF_NAME = "pcie_7x_0_pcie_bram_7x" *) 
module pcie_7x_0_pcie_bram_7x_3
   (rdata,
    pipe_userclk1_in,
    mim_tx_wen,
    mim_tx_ren,
    MIMTXWADDR,
    MIMTXRADDR,
    wdata);
  output [14:0]rdata;
  input pipe_userclk1_in;
  input mim_tx_wen;
  input mim_tx_ren;
  input [10:0]MIMTXWADDR;
  input [10:0]MIMTXRADDR;
  input [14:0]wdata;

  wire [10:0]MIMTXRADDR;
  wire [10:0]MIMTXWADDR;
  wire mim_tx_ren;
  wire mim_tx_wen;
  wire pipe_userclk1_in;
  wire [14:0]rdata;
  wire [14:0]wdata;

  pcie_7x_0_unimacro_BRAM_TDP_MACRO \use_tdp.ramb36 
       (.MIMTXRADDR(MIMTXRADDR),
        .MIMTXWADDR(MIMTXWADDR),
        .mim_tx_ren(mim_tx_ren),
        .mim_tx_wen(mim_tx_wen),
        .pipe_userclk1_in(pipe_userclk1_in),
        .rdata(rdata),
        .wdata(wdata));
endmodule

(* ORIG_REF_NAME = "pcie_7x_0_pcie_bram_7x" *) 
module pcie_7x_0_pcie_bram_7x_7
   (\ramb_bl.ramb36_dp_bl.ram36_bl ,
    pipe_userclk1_in,
    mim_rx_wen,
    mim_rx_ren,
    MIMRXWADDR,
    MIMRXRADDR,
    \ramb_bl.ramb36_dp_bl.ram36_bl_0 );
  output [17:0]\ramb_bl.ramb36_dp_bl.ram36_bl ;
  input pipe_userclk1_in;
  input mim_rx_wen;
  input mim_rx_ren;
  input [10:0]MIMRXWADDR;
  input [10:0]MIMRXRADDR;
  input [17:0]\ramb_bl.ramb36_dp_bl.ram36_bl_0 ;

  wire [10:0]MIMRXRADDR;
  wire [10:0]MIMRXWADDR;
  wire mim_rx_ren;
  wire mim_rx_wen;
  wire pipe_userclk1_in;
  wire [17:0]\ramb_bl.ramb36_dp_bl.ram36_bl ;
  wire [17:0]\ramb_bl.ramb36_dp_bl.ram36_bl_0 ;

  pcie_7x_0_unimacro_BRAM_TDP_MACRO_14 \use_tdp.ramb36 
       (.MIMRXRADDR(MIMRXRADDR),
        .MIMRXWADDR(MIMRXWADDR),
        .mim_rx_ren(mim_rx_ren),
        .mim_rx_wen(mim_rx_wen),
        .pipe_userclk1_in(pipe_userclk1_in),
        .\ramb_bl.ramb36_dp_bl.ram36_bl_0 (\ramb_bl.ramb36_dp_bl.ram36_bl ),
        .\ramb_bl.ramb36_dp_bl.ram36_bl_1 (\ramb_bl.ramb36_dp_bl.ram36_bl_0 ));
endmodule

(* ORIG_REF_NAME = "pcie_7x_0_pcie_bram_7x" *) 
module pcie_7x_0_pcie_bram_7x_8
   (\ramb_bl.ramb36_dp_bl.ram36_bl ,
    pipe_userclk1_in,
    mim_rx_wen,
    mim_rx_ren,
    MIMRXWADDR,
    MIMRXRADDR,
    \ramb_bl.ramb36_dp_bl.ram36_bl_0 );
  output [17:0]\ramb_bl.ramb36_dp_bl.ram36_bl ;
  input pipe_userclk1_in;
  input mim_rx_wen;
  input mim_rx_ren;
  input [10:0]MIMRXWADDR;
  input [10:0]MIMRXRADDR;
  input [17:0]\ramb_bl.ramb36_dp_bl.ram36_bl_0 ;

  wire [10:0]MIMRXRADDR;
  wire [10:0]MIMRXWADDR;
  wire mim_rx_ren;
  wire mim_rx_wen;
  wire pipe_userclk1_in;
  wire [17:0]\ramb_bl.ramb36_dp_bl.ram36_bl ;
  wire [17:0]\ramb_bl.ramb36_dp_bl.ram36_bl_0 ;

  pcie_7x_0_unimacro_BRAM_TDP_MACRO_13 \use_tdp.ramb36 
       (.MIMRXRADDR(MIMRXRADDR),
        .MIMRXWADDR(MIMRXWADDR),
        .mim_rx_ren(mim_rx_ren),
        .mim_rx_wen(mim_rx_wen),
        .pipe_userclk1_in(pipe_userclk1_in),
        .\ramb_bl.ramb36_dp_bl.ram36_bl_0 (\ramb_bl.ramb36_dp_bl.ram36_bl ),
        .\ramb_bl.ramb36_dp_bl.ram36_bl_1 (\ramb_bl.ramb36_dp_bl.ram36_bl_0 ));
endmodule

(* ORIG_REF_NAME = "pcie_7x_0_pcie_bram_7x" *) 
module pcie_7x_0_pcie_bram_7x_9
   (\ramb_bl.ramb36_dp_bl.ram36_bl ,
    pipe_userclk1_in,
    mim_rx_wen,
    mim_rx_ren,
    MIMRXWADDR,
    MIMRXRADDR,
    \ramb_bl.ramb36_dp_bl.ram36_bl_0 );
  output [17:0]\ramb_bl.ramb36_dp_bl.ram36_bl ;
  input pipe_userclk1_in;
  input mim_rx_wen;
  input mim_rx_ren;
  input [10:0]MIMRXWADDR;
  input [10:0]MIMRXRADDR;
  input [17:0]\ramb_bl.ramb36_dp_bl.ram36_bl_0 ;

  wire [10:0]MIMRXRADDR;
  wire [10:0]MIMRXWADDR;
  wire mim_rx_ren;
  wire mim_rx_wen;
  wire pipe_userclk1_in;
  wire [17:0]\ramb_bl.ramb36_dp_bl.ram36_bl ;
  wire [17:0]\ramb_bl.ramb36_dp_bl.ram36_bl_0 ;

  pcie_7x_0_unimacro_BRAM_TDP_MACRO_12 \use_tdp.ramb36 
       (.MIMRXRADDR(MIMRXRADDR),
        .MIMRXWADDR(MIMRXWADDR),
        .mim_rx_ren(mim_rx_ren),
        .mim_rx_wen(mim_rx_wen),
        .pipe_userclk1_in(pipe_userclk1_in),
        .\ramb_bl.ramb36_dp_bl.ram36_bl_0 (\ramb_bl.ramb36_dp_bl.ram36_bl ),
        .\ramb_bl.ramb36_dp_bl.ram36_bl_1 (\ramb_bl.ramb36_dp_bl.ram36_bl_0 ));
endmodule

module pcie_7x_0_pcie_bram_top_7x
   (rdata,
    \ramb_bl.ramb36_dp_bl.ram36_bl ,
    pipe_userclk1_in,
    mim_tx_wen,
    mim_tx_ren,
    MIMTXWADDR,
    MIMTXRADDR,
    wdata,
    mim_rx_wen,
    mim_rx_ren,
    MIMRXWADDR,
    MIMRXRADDR,
    \ramb_bl.ramb36_dp_bl.ram36_bl_0 );
  output [68:0]rdata;
  output [67:0]\ramb_bl.ramb36_dp_bl.ram36_bl ;
  input pipe_userclk1_in;
  input mim_tx_wen;
  input mim_tx_ren;
  input [10:0]MIMTXWADDR;
  input [10:0]MIMTXRADDR;
  input [68:0]wdata;
  input mim_rx_wen;
  input mim_rx_ren;
  input [10:0]MIMRXWADDR;
  input [10:0]MIMRXRADDR;
  input [67:0]\ramb_bl.ramb36_dp_bl.ram36_bl_0 ;

  wire [10:0]MIMRXRADDR;
  wire [10:0]MIMRXWADDR;
  wire [10:0]MIMTXRADDR;
  wire [10:0]MIMTXWADDR;
  wire mim_rx_ren;
  wire mim_rx_wen;
  wire mim_tx_ren;
  wire mim_tx_wen;
  wire pipe_userclk1_in;
  wire [67:0]\ramb_bl.ramb36_dp_bl.ram36_bl ;
  wire [67:0]\ramb_bl.ramb36_dp_bl.ram36_bl_0 ;
  wire [68:0]rdata;
  wire [68:0]wdata;

  pcie_7x_0_pcie_brams_7x pcie_brams_rx
       (.MIMRXRADDR(MIMRXRADDR),
        .MIMRXWADDR(MIMRXWADDR),
        .mim_rx_ren(mim_rx_ren),
        .mim_rx_wen(mim_rx_wen),
        .pipe_userclk1_in(pipe_userclk1_in),
        .\ramb_bl.ramb36_dp_bl.ram36_bl (\ramb_bl.ramb36_dp_bl.ram36_bl ),
        .\ramb_bl.ramb36_dp_bl.ram36_bl_0 (\ramb_bl.ramb36_dp_bl.ram36_bl_0 ));
  pcie_7x_0_pcie_brams_7x_0 pcie_brams_tx
       (.MIMTXRADDR(MIMTXRADDR),
        .MIMTXWADDR(MIMTXWADDR),
        .mim_tx_ren(mim_tx_ren),
        .mim_tx_wen(mim_tx_wen),
        .pipe_userclk1_in(pipe_userclk1_in),
        .rdata(rdata),
        .wdata(wdata));
endmodule

module pcie_7x_0_pcie_brams_7x
   (\ramb_bl.ramb36_dp_bl.ram36_bl ,
    pipe_userclk1_in,
    mim_rx_wen,
    mim_rx_ren,
    MIMRXWADDR,
    MIMRXRADDR,
    \ramb_bl.ramb36_dp_bl.ram36_bl_0 );
  output [67:0]\ramb_bl.ramb36_dp_bl.ram36_bl ;
  input pipe_userclk1_in;
  input mim_rx_wen;
  input mim_rx_ren;
  input [10:0]MIMRXWADDR;
  input [10:0]MIMRXRADDR;
  input [67:0]\ramb_bl.ramb36_dp_bl.ram36_bl_0 ;

  wire [10:0]MIMRXRADDR;
  wire [10:0]MIMRXWADDR;
  wire mim_rx_ren;
  wire mim_rx_wen;
  wire pipe_userclk1_in;
  wire [67:0]\ramb_bl.ramb36_dp_bl.ram36_bl ;
  wire [67:0]\ramb_bl.ramb36_dp_bl.ram36_bl_0 ;

  pcie_7x_0_pcie_bram_7x_7 \brams[0].ram 
       (.MIMRXRADDR(MIMRXRADDR),
        .MIMRXWADDR(MIMRXWADDR),
        .mim_rx_ren(mim_rx_ren),
        .mim_rx_wen(mim_rx_wen),
        .pipe_userclk1_in(pipe_userclk1_in),
        .\ramb_bl.ramb36_dp_bl.ram36_bl (\ramb_bl.ramb36_dp_bl.ram36_bl [17:0]),
        .\ramb_bl.ramb36_dp_bl.ram36_bl_0 (\ramb_bl.ramb36_dp_bl.ram36_bl_0 [17:0]));
  pcie_7x_0_pcie_bram_7x_8 \brams[1].ram 
       (.MIMRXRADDR(MIMRXRADDR),
        .MIMRXWADDR(MIMRXWADDR),
        .mim_rx_ren(mim_rx_ren),
        .mim_rx_wen(mim_rx_wen),
        .pipe_userclk1_in(pipe_userclk1_in),
        .\ramb_bl.ramb36_dp_bl.ram36_bl (\ramb_bl.ramb36_dp_bl.ram36_bl [35:18]),
        .\ramb_bl.ramb36_dp_bl.ram36_bl_0 (\ramb_bl.ramb36_dp_bl.ram36_bl_0 [35:18]));
  pcie_7x_0_pcie_bram_7x_9 \brams[2].ram 
       (.MIMRXRADDR(MIMRXRADDR),
        .MIMRXWADDR(MIMRXWADDR),
        .mim_rx_ren(mim_rx_ren),
        .mim_rx_wen(mim_rx_wen),
        .pipe_userclk1_in(pipe_userclk1_in),
        .\ramb_bl.ramb36_dp_bl.ram36_bl (\ramb_bl.ramb36_dp_bl.ram36_bl [53:36]),
        .\ramb_bl.ramb36_dp_bl.ram36_bl_0 (\ramb_bl.ramb36_dp_bl.ram36_bl_0 [53:36]));
  pcie_7x_0_pcie_bram_7x_10 \brams[3].ram 
       (.MIMRXRADDR(MIMRXRADDR),
        .MIMRXWADDR(MIMRXWADDR),
        .mim_rx_ren(mim_rx_ren),
        .mim_rx_wen(mim_rx_wen),
        .pipe_userclk1_in(pipe_userclk1_in),
        .\ramb_bl.ramb36_dp_bl.ram36_bl (\ramb_bl.ramb36_dp_bl.ram36_bl [67:54]),
        .\ramb_bl.ramb36_dp_bl.ram36_bl_0 (\ramb_bl.ramb36_dp_bl.ram36_bl_0 [67:54]));
endmodule

(* ORIG_REF_NAME = "pcie_7x_0_pcie_brams_7x" *) 
module pcie_7x_0_pcie_brams_7x_0
   (rdata,
    pipe_userclk1_in,
    mim_tx_wen,
    mim_tx_ren,
    MIMTXWADDR,
    MIMTXRADDR,
    wdata);
  output [68:0]rdata;
  input pipe_userclk1_in;
  input mim_tx_wen;
  input mim_tx_ren;
  input [10:0]MIMTXWADDR;
  input [10:0]MIMTXRADDR;
  input [68:0]wdata;

  wire [10:0]MIMTXRADDR;
  wire [10:0]MIMTXWADDR;
  wire mim_tx_ren;
  wire mim_tx_wen;
  wire pipe_userclk1_in;
  wire [68:0]rdata;
  wire [68:0]wdata;

  pcie_7x_0_pcie_bram_7x \brams[0].ram 
       (.MIMTXRADDR(MIMTXRADDR),
        .MIMTXWADDR(MIMTXWADDR),
        .mim_tx_ren(mim_tx_ren),
        .mim_tx_wen(mim_tx_wen),
        .pipe_userclk1_in(pipe_userclk1_in),
        .rdata(rdata[17:0]),
        .wdata(wdata[17:0]));
  pcie_7x_0_pcie_bram_7x_1 \brams[1].ram 
       (.MIMTXRADDR(MIMTXRADDR),
        .MIMTXWADDR(MIMTXWADDR),
        .mim_tx_ren(mim_tx_ren),
        .mim_tx_wen(mim_tx_wen),
        .pipe_userclk1_in(pipe_userclk1_in),
        .rdata(rdata[35:18]),
        .wdata(wdata[35:18]));
  pcie_7x_0_pcie_bram_7x_2 \brams[2].ram 
       (.MIMTXRADDR(MIMTXRADDR),
        .MIMTXWADDR(MIMTXWADDR),
        .mim_tx_ren(mim_tx_ren),
        .mim_tx_wen(mim_tx_wen),
        .pipe_userclk1_in(pipe_userclk1_in),
        .rdata(rdata[53:36]),
        .wdata(wdata[53:36]));
  pcie_7x_0_pcie_bram_7x_3 \brams[3].ram 
       (.MIMTXRADDR(MIMTXRADDR),
        .MIMTXWADDR(MIMTXWADDR),
        .mim_tx_ren(mim_tx_ren),
        .mim_tx_wen(mim_tx_wen),
        .pipe_userclk1_in(pipe_userclk1_in),
        .rdata(rdata[68:54]),
        .wdata(wdata[68:54]));
endmodule

module pcie_7x_0_pcie_top
   (m_axis_rx_tvalid_xhdl2_reg,
    m_axis_rx_tlast,
    trn_tcfg_req,
    tready_thrtl_xhdl1_reg,
    user_reset_int_reg,
    src_in,
    cfg_mgmt_rd_wr_done,
    cfg_err_aer_headerlog_set,
    cfg_err_cpl_rdy,
    cfg_interrupt_rdy,
    cfg_msg_received,
    cfg_received_func_lvl_rst,
    cfg_pcie_link_state,
    m_axis_rx_tdata,
    m_axis_rx_tkeep,
    m_axis_rx_tuser,
    trn_tbuf_av,
    cfg_to_turnoff,
    cfg_bus_number,
    cfg_msg_data,
    cfg_device_number,
    cfg_function_number,
    cfg_aer_ecrc_check_en,
    cfg_aer_ecrc_gen_en,
    cfg_aer_rooterr_corr_err_received,
    cfg_aer_rooterr_corr_err_reporting_en,
    cfg_aer_rooterr_fatal_err_received,
    cfg_aer_rooterr_fatal_err_reporting_en,
    cfg_aer_rooterr_non_fatal_err_received,
    cfg_aer_rooterr_non_fatal_err_reporting_en,
    cfg_bridge_serr_en,
    cfg_command,
    cfg_dcommand2,
    cfg_dcommand,
    cfg_dstatus,
    cfg_interrupt_msienable,
    cfg_interrupt_msixenable,
    cfg_interrupt_msixfm,
    cfg_lcommand,
    cfg_lstatus,
    cfg_msg_received_assert_int_a,
    cfg_msg_received_assert_int_b,
    cfg_msg_received_assert_int_c,
    cfg_msg_received_assert_int_d,
    cfg_msg_received_deassert_int_a,
    cfg_msg_received_deassert_int_b,
    cfg_msg_received_deassert_int_c,
    cfg_msg_received_deassert_int_d,
    cfg_msg_received_err_cor,
    cfg_msg_received_err_fatal,
    cfg_msg_received_err_non_fatal,
    cfg_msg_received_pm_as_nak,
    cfg_msg_received_pme_to_ack,
    cfg_msg_received_pm_pme,
    cfg_msg_received_setslotpowerlimit,
    cfg_pmcsr_pme_en,
    cfg_pmcsr_pme_status,
    cfg_root_control_pme_int_en,
    cfg_root_control_syserr_corr_err_en,
    cfg_root_control_syserr_fatal_err_en,
    cfg_root_control_syserr_non_fatal_err_en,
    cfg_slot_control_electromech_il_ctl_pulse,
    pcie_drp_rdy,
    pipe_rx0_polarity,
    pipe_tx0_compliance,
    pipe_tx0_elec_idle,
    pipe_tx_deemph,
    pipe_tx_rate,
    pipe_tx_rcvr_det,
    pl_directed_change_done,
    pl_link_gen2_cap,
    pl_link_partner_gen2_supported,
    pl_link_upcfg_cap,
    pl_received_hot_rst,
    pl_sel_lnk_rate,
    trn_lnk_up,
    tx_err_drop,
    fc_cpld,
    fc_npd,
    fc_pd,
    pcie_drp_do,
    pipe_tx0_data,
    cfg_pmcsr_powerstate,
    pipe_tx0_char_is_k,
    pipe_tx0_powerdown,
    pl_lane_reversal_mode,
    pl_rx_pm_state,
    pl_sel_lnk_width,
    cfg_interrupt_mmenable,
    pipe_tx_margin,
    pl_initial_link_width,
    pl_tx_pm_state,
    cfg_mgmt_do,
    pl_ltssm_state,
    cfg_vc_tcvc_map,
    cfg_interrupt_do,
    fc_cplh,
    fc_nph,
    fc_ph,
    \tbuf_gap_cnt_reg[0] ,
    pipe_userclk2_in,
    s_axis_tx_tlast,
    s_axis_tx_tvalid,
    s_axis_tx_tkeep,
    tx_cfg_gnt,
    cfg_turnoff_ok,
    bridge_reset_int,
    pl_phy_lnk_up,
    m_axis_rx_tready,
    cfg_trn_pending,
    cfg_mgmt_wr_rw1c_as_rw,
    cfg_mgmt_wr_readonly,
    cfg_mgmt_wr_en,
    cfg_mgmt_rd_en,
    cfg_err_malformed,
    cfg_err_cor,
    cfg_err_ur,
    cfg_err_ecrc,
    cfg_err_cpl_timeout,
    cfg_err_cpl_abort,
    cfg_err_cpl_unexpect,
    cfg_err_poisoned,
    cfg_err_atomic_egress_blocked,
    cfg_err_mc_blocked,
    cfg_err_internal_uncor,
    cfg_err_internal_cor,
    cfg_err_posted,
    cfg_err_locked,
    cfg_err_norecovery,
    cfg_interrupt,
    cfg_interrupt_assert,
    cfg_interrupt_stat,
    cfg_pm_halt_aspm_l0s,
    cfg_pm_halt_aspm_l1,
    cfg_pm_force_state_en,
    cfg_pm_wake,
    out,
    s_axis_tx_tdata,
    s_axis_tx_tuser,
    pipe_userclk1_in,
    pcie_drp_clk,
    pcie_drp_en,
    pcie_drp_we,
    pipe_pclk_in,
    pipe_rx0_chanisaligned,
    pipe_rx0_elec_idle,
    pipe_rx0_phy_status,
    pipe_rx0_valid,
    pl_directed_link_auton,
    pl_directed_link_speed,
    pl_downstream_deemph_source,
    pl_transmit_hot_rst,
    pl_upstream_prefer_deemph,
    sys_rst_n,
    rx_np_ok,
    rx_np_req,
    cfg_err_aer_headerlog,
    pcie_drp_di,
    pipe_rx0_data,
    cfg_pm_force_state,
    pipe_rx0_char_is_k,
    pl_directed_link_change,
    pl_directed_link_width,
    cfg_ds_function_number,
    pipe_rx0_status,
    fc_sel,
    cfg_mgmt_di,
    cfg_mgmt_byte_en_n,
    cfg_err_tlp_cpl_header,
    cfg_aer_interrupt_msgnum,
    cfg_ds_device_number,
    cfg_pciecap_interrupt_msgnum,
    cfg_dsn,
    cfg_ds_bus_number,
    cfg_interrupt_di,
    pcie_drp_addr,
    cfg_mgmt_dwaddr);
  output m_axis_rx_tvalid_xhdl2_reg;
  output m_axis_rx_tlast;
  output trn_tcfg_req;
  output tready_thrtl_xhdl1_reg;
  output user_reset_int_reg;
  output src_in;
  output cfg_mgmt_rd_wr_done;
  output cfg_err_aer_headerlog_set;
  output cfg_err_cpl_rdy;
  output cfg_interrupt_rdy;
  output cfg_msg_received;
  output cfg_received_func_lvl_rst;
  output [2:0]cfg_pcie_link_state;
  output [63:0]m_axis_rx_tdata;
  output [1:0]m_axis_rx_tkeep;
  output [12:0]m_axis_rx_tuser;
  output [5:0]trn_tbuf_av;
  output cfg_to_turnoff;
  output [7:0]cfg_bus_number;
  output [15:0]cfg_msg_data;
  output [4:0]cfg_device_number;
  output [2:0]cfg_function_number;
  output cfg_aer_ecrc_check_en;
  output cfg_aer_ecrc_gen_en;
  output cfg_aer_rooterr_corr_err_received;
  output cfg_aer_rooterr_corr_err_reporting_en;
  output cfg_aer_rooterr_fatal_err_received;
  output cfg_aer_rooterr_fatal_err_reporting_en;
  output cfg_aer_rooterr_non_fatal_err_received;
  output cfg_aer_rooterr_non_fatal_err_reporting_en;
  output cfg_bridge_serr_en;
  output [4:0]cfg_command;
  output [11:0]cfg_dcommand2;
  output [14:0]cfg_dcommand;
  output [3:0]cfg_dstatus;
  output cfg_interrupt_msienable;
  output cfg_interrupt_msixenable;
  output cfg_interrupt_msixfm;
  output [10:0]cfg_lcommand;
  output [9:0]cfg_lstatus;
  output cfg_msg_received_assert_int_a;
  output cfg_msg_received_assert_int_b;
  output cfg_msg_received_assert_int_c;
  output cfg_msg_received_assert_int_d;
  output cfg_msg_received_deassert_int_a;
  output cfg_msg_received_deassert_int_b;
  output cfg_msg_received_deassert_int_c;
  output cfg_msg_received_deassert_int_d;
  output cfg_msg_received_err_cor;
  output cfg_msg_received_err_fatal;
  output cfg_msg_received_err_non_fatal;
  output cfg_msg_received_pm_as_nak;
  output cfg_msg_received_pme_to_ack;
  output cfg_msg_received_pm_pme;
  output cfg_msg_received_setslotpowerlimit;
  output cfg_pmcsr_pme_en;
  output cfg_pmcsr_pme_status;
  output cfg_root_control_pme_int_en;
  output cfg_root_control_syserr_corr_err_en;
  output cfg_root_control_syserr_fatal_err_en;
  output cfg_root_control_syserr_non_fatal_err_en;
  output cfg_slot_control_electromech_il_ctl_pulse;
  output pcie_drp_rdy;
  output pipe_rx0_polarity;
  output pipe_tx0_compliance;
  output pipe_tx0_elec_idle;
  output pipe_tx_deemph;
  output pipe_tx_rate;
  output pipe_tx_rcvr_det;
  output pl_directed_change_done;
  output pl_link_gen2_cap;
  output pl_link_partner_gen2_supported;
  output pl_link_upcfg_cap;
  output pl_received_hot_rst;
  output pl_sel_lnk_rate;
  output trn_lnk_up;
  output tx_err_drop;
  output [11:0]fc_cpld;
  output [11:0]fc_npd;
  output [11:0]fc_pd;
  output [15:0]pcie_drp_do;
  output [15:0]pipe_tx0_data;
  output [1:0]cfg_pmcsr_powerstate;
  output [1:0]pipe_tx0_char_is_k;
  output [1:0]pipe_tx0_powerdown;
  output [1:0]pl_lane_reversal_mode;
  output [1:0]pl_rx_pm_state;
  output [1:0]pl_sel_lnk_width;
  output [2:0]cfg_interrupt_mmenable;
  output [2:0]pipe_tx_margin;
  output [2:0]pl_initial_link_width;
  output [2:0]pl_tx_pm_state;
  output [31:0]cfg_mgmt_do;
  output [5:0]pl_ltssm_state;
  output [6:0]cfg_vc_tcvc_map;
  output [7:0]cfg_interrupt_do;
  output [7:0]fc_cplh;
  output [7:0]fc_nph;
  output [7:0]fc_ph;
  input \tbuf_gap_cnt_reg[0] ;
  input pipe_userclk2_in;
  input s_axis_tx_tlast;
  input s_axis_tx_tvalid;
  input [0:0]s_axis_tx_tkeep;
  input tx_cfg_gnt;
  input cfg_turnoff_ok;
  input bridge_reset_int;
  input pl_phy_lnk_up;
  input m_axis_rx_tready;
  input cfg_trn_pending;
  input cfg_mgmt_wr_rw1c_as_rw;
  input cfg_mgmt_wr_readonly;
  input cfg_mgmt_wr_en;
  input cfg_mgmt_rd_en;
  input cfg_err_malformed;
  input cfg_err_cor;
  input cfg_err_ur;
  input cfg_err_ecrc;
  input cfg_err_cpl_timeout;
  input cfg_err_cpl_abort;
  input cfg_err_cpl_unexpect;
  input cfg_err_poisoned;
  input cfg_err_atomic_egress_blocked;
  input cfg_err_mc_blocked;
  input cfg_err_internal_uncor;
  input cfg_err_internal_cor;
  input cfg_err_posted;
  input cfg_err_locked;
  input cfg_err_norecovery;
  input cfg_interrupt;
  input cfg_interrupt_assert;
  input cfg_interrupt_stat;
  input cfg_pm_halt_aspm_l0s;
  input cfg_pm_halt_aspm_l1;
  input cfg_pm_force_state_en;
  input cfg_pm_wake;
  input out;
  input [63:0]s_axis_tx_tdata;
  input [3:0]s_axis_tx_tuser;
  input pipe_userclk1_in;
  input pcie_drp_clk;
  input pcie_drp_en;
  input pcie_drp_we;
  input pipe_pclk_in;
  input pipe_rx0_chanisaligned;
  input pipe_rx0_elec_idle;
  input pipe_rx0_phy_status;
  input pipe_rx0_valid;
  input pl_directed_link_auton;
  input pl_directed_link_speed;
  input pl_downstream_deemph_source;
  input pl_transmit_hot_rst;
  input pl_upstream_prefer_deemph;
  input sys_rst_n;
  input rx_np_ok;
  input rx_np_req;
  input [127:0]cfg_err_aer_headerlog;
  input [15:0]pcie_drp_di;
  input [15:0]pipe_rx0_data;
  input [1:0]cfg_pm_force_state;
  input [1:0]pipe_rx0_char_is_k;
  input [1:0]pl_directed_link_change;
  input [1:0]pl_directed_link_width;
  input [2:0]cfg_ds_function_number;
  input [2:0]pipe_rx0_status;
  input [2:0]fc_sel;
  input [31:0]cfg_mgmt_di;
  input [3:0]cfg_mgmt_byte_en_n;
  input [47:0]cfg_err_tlp_cpl_header;
  input [4:0]cfg_aer_interrupt_msgnum;
  input [4:0]cfg_ds_device_number;
  input [4:0]cfg_pciecap_interrupt_msgnum;
  input [63:0]cfg_dsn;
  input [7:0]cfg_ds_bus_number;
  input [7:0]cfg_interrupt_di;
  input [8:0]pcie_drp_addr;
  input [9:0]cfg_mgmt_dwaddr;

  wire bridge_reset_int;
  wire cfg_aer_ecrc_check_en;
  wire cfg_aer_ecrc_gen_en;
  wire [4:0]cfg_aer_interrupt_msgnum;
  wire cfg_aer_rooterr_corr_err_received;
  wire cfg_aer_rooterr_corr_err_reporting_en;
  wire cfg_aer_rooterr_fatal_err_received;
  wire cfg_aer_rooterr_fatal_err_reporting_en;
  wire cfg_aer_rooterr_non_fatal_err_received;
  wire cfg_aer_rooterr_non_fatal_err_reporting_en;
  wire cfg_bridge_serr_en;
  wire [7:0]cfg_bus_number;
  wire [4:0]cfg_command;
  wire [14:0]cfg_dcommand;
  wire [11:0]cfg_dcommand2;
  wire [4:0]cfg_device_number;
  wire [7:0]cfg_ds_bus_number;
  wire [4:0]cfg_ds_device_number;
  wire [2:0]cfg_ds_function_number;
  wire [63:0]cfg_dsn;
  wire [3:0]cfg_dstatus;
  wire [127:0]cfg_err_aer_headerlog;
  wire cfg_err_aer_headerlog_set;
  wire cfg_err_atomic_egress_blocked;
  wire cfg_err_cor;
  wire cfg_err_cpl_abort;
  wire cfg_err_cpl_rdy;
  wire cfg_err_cpl_timeout;
  wire cfg_err_cpl_unexpect;
  wire cfg_err_ecrc;
  wire cfg_err_internal_cor;
  wire cfg_err_internal_uncor;
  wire cfg_err_locked;
  wire cfg_err_malformed;
  wire cfg_err_mc_blocked;
  wire cfg_err_norecovery;
  wire cfg_err_poisoned;
  wire cfg_err_posted;
  wire [47:0]cfg_err_tlp_cpl_header;
  wire cfg_err_ur;
  wire [2:0]cfg_function_number;
  wire cfg_interrupt;
  wire cfg_interrupt_assert;
  wire [7:0]cfg_interrupt_di;
  wire [7:0]cfg_interrupt_do;
  wire [2:0]cfg_interrupt_mmenable;
  wire cfg_interrupt_msienable;
  wire cfg_interrupt_msixenable;
  wire cfg_interrupt_msixfm;
  wire cfg_interrupt_rdy;
  wire cfg_interrupt_stat;
  wire [10:0]cfg_lcommand;
  wire [9:0]cfg_lstatus;
  wire [3:0]cfg_mgmt_byte_en_n;
  wire [31:0]cfg_mgmt_di;
  wire [31:0]cfg_mgmt_do;
  wire [9:0]cfg_mgmt_dwaddr;
  wire cfg_mgmt_rd_en;
  wire cfg_mgmt_rd_wr_done;
  wire cfg_mgmt_wr_en;
  wire cfg_mgmt_wr_readonly;
  wire cfg_mgmt_wr_rw1c_as_rw;
  wire [15:0]cfg_msg_data;
  wire cfg_msg_received;
  wire cfg_msg_received_assert_int_a;
  wire cfg_msg_received_assert_int_b;
  wire cfg_msg_received_assert_int_c;
  wire cfg_msg_received_assert_int_d;
  wire cfg_msg_received_deassert_int_a;
  wire cfg_msg_received_deassert_int_b;
  wire cfg_msg_received_deassert_int_c;
  wire cfg_msg_received_deassert_int_d;
  wire cfg_msg_received_err_cor;
  wire cfg_msg_received_err_fatal;
  wire cfg_msg_received_err_non_fatal;
  wire cfg_msg_received_pm_as_nak;
  wire cfg_msg_received_pm_pme;
  wire cfg_msg_received_pme_to_ack;
  wire cfg_msg_received_setslotpowerlimit;
  wire [2:0]cfg_pcie_link_state;
  wire [4:0]cfg_pciecap_interrupt_msgnum;
  wire [1:0]cfg_pm_force_state;
  wire cfg_pm_force_state_en;
  wire cfg_pm_halt_aspm_l0s;
  wire cfg_pm_halt_aspm_l1;
  wire cfg_pm_turnoff_ok_n;
  wire cfg_pm_wake;
  wire cfg_pmcsr_pme_en;
  wire cfg_pmcsr_pme_status;
  wire [1:0]cfg_pmcsr_powerstate;
  wire cfg_received_func_lvl_rst;
  wire cfg_root_control_pme_int_en;
  wire cfg_root_control_syserr_corr_err_en;
  wire cfg_root_control_syserr_fatal_err_en;
  wire cfg_root_control_syserr_non_fatal_err_en;
  wire cfg_slot_control_electromech_il_ctl_pulse;
  wire cfg_to_turnoff;
  wire cfg_trn_pending;
  wire cfg_turnoff_ok;
  wire [6:0]cfg_vc_tcvc_map;
  wire [11:0]fc_cpld;
  wire [7:0]fc_cplh;
  wire [11:0]fc_npd;
  wire [7:0]fc_nph;
  wire [11:0]fc_pd;
  wire [7:0]fc_ph;
  wire [2:0]fc_sel;
  wire [63:0]m_axis_rx_tdata;
  wire [1:0]m_axis_rx_tkeep;
  wire m_axis_rx_tlast;
  wire m_axis_rx_tready;
  wire [12:0]m_axis_rx_tuser;
  wire m_axis_rx_tvalid_xhdl2_reg;
  wire out;
  wire pcie_7x_i_n_13;
  wire pcie_7x_i_n_22;
  wire pcie_7x_i_n_30;
  wire pcie_7x_i_n_6;
  wire pcie_7x_i_n_9;
  wire [8:0]pcie_drp_addr;
  wire pcie_drp_clk;
  wire [15:0]pcie_drp_di;
  wire [15:0]pcie_drp_do;
  wire pcie_drp_en;
  wire pcie_drp_rdy;
  wire pcie_drp_we;
  wire pipe_pclk_in;
  wire pipe_rx0_chanisaligned;
  wire [1:0]pipe_rx0_char_is_k;
  wire [15:0]pipe_rx0_data;
  wire pipe_rx0_elec_idle;
  wire pipe_rx0_phy_status;
  wire pipe_rx0_polarity;
  wire [2:0]pipe_rx0_status;
  wire pipe_rx0_valid;
  wire [1:0]pipe_tx0_char_is_k;
  wire pipe_tx0_compliance;
  wire [15:0]pipe_tx0_data;
  wire pipe_tx0_elec_idle;
  wire [1:0]pipe_tx0_powerdown;
  wire pipe_tx_deemph;
  wire [2:0]pipe_tx_margin;
  wire pipe_tx_rate;
  wire pipe_tx_rcvr_det;
  wire pipe_userclk1_in;
  wire pipe_userclk2_in;
  wire pl_directed_change_done;
  wire pl_directed_link_auton;
  wire [1:0]pl_directed_link_change;
  wire pl_directed_link_speed;
  wire [1:0]pl_directed_link_width;
  wire pl_downstream_deemph_source;
  wire [2:0]pl_initial_link_width;
  wire [1:0]pl_lane_reversal_mode;
  wire pl_link_gen2_cap;
  wire pl_link_partner_gen2_supported;
  wire pl_link_upcfg_cap;
  wire [5:0]pl_ltssm_state;
  wire pl_phy_lnk_up;
  wire pl_received_hot_rst;
  wire [1:0]pl_rx_pm_state;
  wire pl_sel_lnk_rate;
  wire [1:0]pl_sel_lnk_width;
  wire pl_transmit_hot_rst;
  wire [2:0]pl_tx_pm_state;
  wire pl_upstream_prefer_deemph;
  wire \rx_inst/rx_pipeline_inst/dsc_detect ;
  wire \rx_inst/rx_pipeline_inst/reg_dsc_detect ;
  wire \rx_inst/rx_pipeline_inst/rsrc_rdy_filtered6_out ;
  wire \rx_inst/rx_pipeline_inst/trn_in_packet ;
  wire \rx_inst/rx_pipeline_inst/trn_rsrc_dsc_d ;
  wire \rx_inst/rx_pipeline_inst/trn_rsrc_dsc_prev0 ;
  wire rx_np_ok;
  wire rx_np_req;
  wire [63:0]s_axis_tx_tdata;
  wire [0:0]s_axis_tx_tkeep;
  wire s_axis_tx_tlast;
  wire [3:0]s_axis_tx_tuser;
  wire s_axis_tx_tvalid;
  wire src_in;
  wire sys_rst_n;
  wire \tbuf_gap_cnt_reg[0] ;
  wire tready_thrtl_xhdl1_reg;
  wire trn_lnk_up;
  wire [6:0]trn_rbar_hit;
  wire [63:0]trn_rd;
  wire trn_rdst_rdy;
  wire trn_recrc_err;
  wire trn_reof;
  wire trn_rerrfwd;
  wire trn_rrem;
  wire trn_rsof;
  wire trn_rsrc_dsc;
  wire [5:0]trn_tbuf_av;
  wire trn_tcfg_gnt;
  wire trn_tcfg_req;
  wire [63:0]trn_td;
  wire trn_tdst_rdy;
  wire trn_tecrc_gen;
  wire trn_teof;
  wire trn_terrfwd;
  wire trn_trem;
  wire trn_tsof;
  wire trn_tsrc_dsc;
  wire trn_tsrc_rdy;
  wire trn_tstr;
  wire tx_cfg_gnt;
  wire tx_err_drop;
  wire \tx_inst/xhdl12.tx_thrl_ctl_inst/lnk_up_thrtl ;
  wire \tx_inst/xhdl12.tx_thrl_ctl_inst/lnk_up_trig ;
  wire \tx_inst/xhdl12.tx_thrl_ctl_inst/ppm_L1_thrtl ;
  wire \tx_inst/xhdl12.tx_thrl_ctl_inst/ppm_L1_trig ;
  wire \tx_inst/xhdl12.tx_thrl_ctl_inst/reg_tcfg_gnt ;
  wire \tx_inst/xhdl12.tx_thrl_ctl_inst/tbuf_av_min_trig ;
  wire \tx_inst/xhdl12.tx_thrl_ctl_inst/tcfg_req_trig ;
  wire user_reset_int_reg;

  pcie_7x_0_axi_basic_top axi_basic_top_i
       (.E(trn_rdst_rdy),
        .Q({trn_td[31:0],trn_td[63:32]}),
        .cfg_pcie_link_state(cfg_pcie_link_state),
        .cfg_pm_turnoff_ok_n(cfg_pm_turnoff_ok_n),
        .cfg_to_turnoff(cfg_to_turnoff),
        .cfg_turnoff_ok(cfg_turnoff_ok),
        .dsc_detect(\rx_inst/rx_pipeline_inst/dsc_detect ),
        .lnk_up_thrtl(\tx_inst/xhdl12.tx_thrl_ctl_inst/lnk_up_thrtl ),
        .lnk_up_thrtl_reg(pcie_7x_i_n_30),
        .m_axis_rx_tdata(m_axis_rx_tdata),
        .m_axis_rx_tkeep(m_axis_rx_tkeep),
        .m_axis_rx_tlast(m_axis_rx_tlast),
        .m_axis_rx_tready(m_axis_rx_tready),
        .m_axis_rx_tuser(m_axis_rx_tuser),
        .m_axis_rx_tvalid_xhdl2_reg(m_axis_rx_tvalid_xhdl2_reg),
        .out(out),
        .pipe_userclk2_in(pipe_userclk2_in),
        .ppm_L1_thrtl(\tx_inst/xhdl12.tx_thrl_ctl_inst/ppm_L1_thrtl ),
        .ppm_L1_thrtl_reg(pcie_7x_i_n_13),
        .ppm_L1_trig(\tx_inst/xhdl12.tx_thrl_ctl_inst/ppm_L1_trig ),
        .reg_dsc_detect(\rx_inst/rx_pipeline_inst/reg_dsc_detect ),
        .reg_tcfg_gnt(\tx_inst/xhdl12.tx_thrl_ctl_inst/reg_tcfg_gnt ),
        .rsrc_rdy_filtered6_out(\rx_inst/rx_pipeline_inst/rsrc_rdy_filtered6_out ),
        .s_axis_tx_tdata(s_axis_tx_tdata),
        .s_axis_tx_tkeep(s_axis_tx_tkeep),
        .s_axis_tx_tlast(s_axis_tx_tlast),
        .s_axis_tx_tuser(s_axis_tx_tuser),
        .s_axis_tx_tvalid(s_axis_tx_tvalid),
        .tbuf_av_min_trig(\tx_inst/xhdl12.tx_thrl_ctl_inst/tbuf_av_min_trig ),
        .\tbuf_gap_cnt_reg[0] (\tbuf_gap_cnt_reg[0] ),
        .tcfg_req_trig(\tx_inst/xhdl12.tx_thrl_ctl_inst/tcfg_req_trig ),
        .tready_thrtl_xhdl1_i_5(pcie_7x_i_n_22),
        .tready_thrtl_xhdl1_reg(tready_thrtl_xhdl1_reg),
        .trn_in_packet(\rx_inst/rx_pipeline_inst/trn_in_packet ),
        .trn_in_packet_reg(pcie_7x_i_n_9),
        .trn_rbar_hit(trn_rbar_hit),
        .trn_rd(trn_rd),
        .trn_recrc_err(trn_recrc_err),
        .trn_reof(trn_reof),
        .trn_rerrfwd(trn_rerrfwd),
        .trn_rrem(trn_rrem),
        .trn_rsof(trn_rsof),
        .trn_rsrc_dsc(trn_rsrc_dsc),
        .trn_rsrc_dsc_d(\rx_inst/rx_pipeline_inst/trn_rsrc_dsc_d ),
        .trn_rsrc_dsc_prev0(\rx_inst/rx_pipeline_inst/trn_rsrc_dsc_prev0 ),
        .trn_tbuf_av(trn_tbuf_av),
        .trn_tcfg_gnt(trn_tcfg_gnt),
        .trn_tcfg_req(trn_tcfg_req),
        .trn_tdst_rdy(trn_tdst_rdy),
        .trn_teof(trn_teof),
        .trn_trem(trn_trem),
        .trn_tsof(trn_tsof),
        .trn_tsrc_rdy(trn_tsrc_rdy),
        .tx_cfg_gnt(tx_cfg_gnt),
        .\xhdl12.reg_tuser_reg[3] ({trn_tsrc_dsc,trn_tstr,trn_terrfwd,trn_tecrc_gen}));
  LUT1 #(
    .INIT(2'h1)) 
    \cfg_bus_number_d[7]_i_1 
       (.I0(out),
        .O(\tx_inst/xhdl12.tx_thrl_ctl_inst/lnk_up_trig ));
  FDRE \cfg_bus_number_d_reg[0] 
       (.C(pipe_userclk2_in),
        .CE(pcie_7x_i_n_6),
        .D(cfg_msg_data[8]),
        .Q(cfg_bus_number[0]),
        .R(\tx_inst/xhdl12.tx_thrl_ctl_inst/lnk_up_trig ));
  FDRE \cfg_bus_number_d_reg[1] 
       (.C(pipe_userclk2_in),
        .CE(pcie_7x_i_n_6),
        .D(cfg_msg_data[9]),
        .Q(cfg_bus_number[1]),
        .R(\tx_inst/xhdl12.tx_thrl_ctl_inst/lnk_up_trig ));
  FDRE \cfg_bus_number_d_reg[2] 
       (.C(pipe_userclk2_in),
        .CE(pcie_7x_i_n_6),
        .D(cfg_msg_data[10]),
        .Q(cfg_bus_number[2]),
        .R(\tx_inst/xhdl12.tx_thrl_ctl_inst/lnk_up_trig ));
  FDRE \cfg_bus_number_d_reg[3] 
       (.C(pipe_userclk2_in),
        .CE(pcie_7x_i_n_6),
        .D(cfg_msg_data[11]),
        .Q(cfg_bus_number[3]),
        .R(\tx_inst/xhdl12.tx_thrl_ctl_inst/lnk_up_trig ));
  FDRE \cfg_bus_number_d_reg[4] 
       (.C(pipe_userclk2_in),
        .CE(pcie_7x_i_n_6),
        .D(cfg_msg_data[12]),
        .Q(cfg_bus_number[4]),
        .R(\tx_inst/xhdl12.tx_thrl_ctl_inst/lnk_up_trig ));
  FDRE \cfg_bus_number_d_reg[5] 
       (.C(pipe_userclk2_in),
        .CE(pcie_7x_i_n_6),
        .D(cfg_msg_data[13]),
        .Q(cfg_bus_number[5]),
        .R(\tx_inst/xhdl12.tx_thrl_ctl_inst/lnk_up_trig ));
  FDRE \cfg_bus_number_d_reg[6] 
       (.C(pipe_userclk2_in),
        .CE(pcie_7x_i_n_6),
        .D(cfg_msg_data[14]),
        .Q(cfg_bus_number[6]),
        .R(\tx_inst/xhdl12.tx_thrl_ctl_inst/lnk_up_trig ));
  FDRE \cfg_bus_number_d_reg[7] 
       (.C(pipe_userclk2_in),
        .CE(pcie_7x_i_n_6),
        .D(cfg_msg_data[15]),
        .Q(cfg_bus_number[7]),
        .R(\tx_inst/xhdl12.tx_thrl_ctl_inst/lnk_up_trig ));
  FDRE \cfg_device_number_d_reg[0] 
       (.C(pipe_userclk2_in),
        .CE(pcie_7x_i_n_6),
        .D(cfg_msg_data[3]),
        .Q(cfg_device_number[0]),
        .R(\tx_inst/xhdl12.tx_thrl_ctl_inst/lnk_up_trig ));
  FDRE \cfg_device_number_d_reg[1] 
       (.C(pipe_userclk2_in),
        .CE(pcie_7x_i_n_6),
        .D(cfg_msg_data[4]),
        .Q(cfg_device_number[1]),
        .R(\tx_inst/xhdl12.tx_thrl_ctl_inst/lnk_up_trig ));
  FDRE \cfg_device_number_d_reg[2] 
       (.C(pipe_userclk2_in),
        .CE(pcie_7x_i_n_6),
        .D(cfg_msg_data[5]),
        .Q(cfg_device_number[2]),
        .R(\tx_inst/xhdl12.tx_thrl_ctl_inst/lnk_up_trig ));
  FDRE \cfg_device_number_d_reg[3] 
       (.C(pipe_userclk2_in),
        .CE(pcie_7x_i_n_6),
        .D(cfg_msg_data[6]),
        .Q(cfg_device_number[3]),
        .R(\tx_inst/xhdl12.tx_thrl_ctl_inst/lnk_up_trig ));
  FDRE \cfg_device_number_d_reg[4] 
       (.C(pipe_userclk2_in),
        .CE(pcie_7x_i_n_6),
        .D(cfg_msg_data[7]),
        .Q(cfg_device_number[4]),
        .R(\tx_inst/xhdl12.tx_thrl_ctl_inst/lnk_up_trig ));
  FDRE \cfg_function_number_d_reg[0] 
       (.C(pipe_userclk2_in),
        .CE(pcie_7x_i_n_6),
        .D(cfg_msg_data[0]),
        .Q(cfg_function_number[0]),
        .R(\tx_inst/xhdl12.tx_thrl_ctl_inst/lnk_up_trig ));
  FDRE \cfg_function_number_d_reg[1] 
       (.C(pipe_userclk2_in),
        .CE(pcie_7x_i_n_6),
        .D(cfg_msg_data[1]),
        .Q(cfg_function_number[1]),
        .R(\tx_inst/xhdl12.tx_thrl_ctl_inst/lnk_up_trig ));
  FDRE \cfg_function_number_d_reg[2] 
       (.C(pipe_userclk2_in),
        .CE(pcie_7x_i_n_6),
        .D(cfg_msg_data[2]),
        .Q(cfg_function_number[2]),
        .R(\tx_inst/xhdl12.tx_thrl_ctl_inst/lnk_up_trig ));
  pcie_7x_0_pcie_7x pcie_7x_i
       (.E(pcie_7x_i_n_6),
        .bridge_reset_int(bridge_reset_int),
        .cfg_aer_ecrc_check_en(cfg_aer_ecrc_check_en),
        .cfg_aer_ecrc_gen_en(cfg_aer_ecrc_gen_en),
        .cfg_aer_interrupt_msgnum(cfg_aer_interrupt_msgnum),
        .cfg_aer_rooterr_corr_err_received(cfg_aer_rooterr_corr_err_received),
        .cfg_aer_rooterr_corr_err_reporting_en(cfg_aer_rooterr_corr_err_reporting_en),
        .cfg_aer_rooterr_fatal_err_received(cfg_aer_rooterr_fatal_err_received),
        .cfg_aer_rooterr_fatal_err_reporting_en(cfg_aer_rooterr_fatal_err_reporting_en),
        .cfg_aer_rooterr_non_fatal_err_received(cfg_aer_rooterr_non_fatal_err_received),
        .cfg_aer_rooterr_non_fatal_err_reporting_en(cfg_aer_rooterr_non_fatal_err_reporting_en),
        .cfg_bridge_serr_en(cfg_bridge_serr_en),
        .cfg_command(cfg_command),
        .cfg_dcommand(cfg_dcommand),
        .cfg_dcommand2(cfg_dcommand2),
        .cfg_ds_bus_number(cfg_ds_bus_number),
        .cfg_ds_device_number(cfg_ds_device_number),
        .cfg_ds_function_number(cfg_ds_function_number),
        .cfg_dsn(cfg_dsn),
        .cfg_dstatus(cfg_dstatus),
        .cfg_err_aer_headerlog(cfg_err_aer_headerlog),
        .cfg_err_aer_headerlog_set(cfg_err_aer_headerlog_set),
        .cfg_err_atomic_egress_blocked(cfg_err_atomic_egress_blocked),
        .cfg_err_cor(cfg_err_cor),
        .cfg_err_cpl_abort(cfg_err_cpl_abort),
        .cfg_err_cpl_rdy(cfg_err_cpl_rdy),
        .cfg_err_cpl_timeout(cfg_err_cpl_timeout),
        .cfg_err_cpl_unexpect(cfg_err_cpl_unexpect),
        .cfg_err_ecrc(cfg_err_ecrc),
        .cfg_err_internal_cor(cfg_err_internal_cor),
        .cfg_err_internal_uncor(cfg_err_internal_uncor),
        .cfg_err_locked(cfg_err_locked),
        .cfg_err_malformed(cfg_err_malformed),
        .cfg_err_mc_blocked(cfg_err_mc_blocked),
        .cfg_err_norecovery(cfg_err_norecovery),
        .cfg_err_poisoned(cfg_err_poisoned),
        .cfg_err_posted(cfg_err_posted),
        .cfg_err_tlp_cpl_header(cfg_err_tlp_cpl_header),
        .cfg_err_ur(cfg_err_ur),
        .cfg_interrupt(cfg_interrupt),
        .cfg_interrupt_assert(cfg_interrupt_assert),
        .cfg_interrupt_di(cfg_interrupt_di),
        .cfg_interrupt_do(cfg_interrupt_do),
        .cfg_interrupt_mmenable(cfg_interrupt_mmenable),
        .cfg_interrupt_msienable(cfg_interrupt_msienable),
        .cfg_interrupt_msixenable(cfg_interrupt_msixenable),
        .cfg_interrupt_msixfm(cfg_interrupt_msixfm),
        .cfg_interrupt_rdy(cfg_interrupt_rdy),
        .cfg_interrupt_stat(cfg_interrupt_stat),
        .cfg_lcommand(cfg_lcommand),
        .cfg_lstatus(cfg_lstatus),
        .cfg_mgmt_byte_en_n(cfg_mgmt_byte_en_n),
        .cfg_mgmt_di(cfg_mgmt_di),
        .cfg_mgmt_do(cfg_mgmt_do),
        .cfg_mgmt_dwaddr(cfg_mgmt_dwaddr),
        .cfg_mgmt_rd_en(cfg_mgmt_rd_en),
        .cfg_mgmt_rd_wr_done(cfg_mgmt_rd_wr_done),
        .cfg_mgmt_wr_en(cfg_mgmt_wr_en),
        .cfg_mgmt_wr_readonly(cfg_mgmt_wr_readonly),
        .cfg_mgmt_wr_rw1c_as_rw(cfg_mgmt_wr_rw1c_as_rw),
        .cfg_msg_data(cfg_msg_data),
        .cfg_msg_received(cfg_msg_received),
        .cfg_msg_received_assert_int_a(cfg_msg_received_assert_int_a),
        .cfg_msg_received_assert_int_b(cfg_msg_received_assert_int_b),
        .cfg_msg_received_assert_int_c(cfg_msg_received_assert_int_c),
        .cfg_msg_received_assert_int_d(cfg_msg_received_assert_int_d),
        .cfg_msg_received_deassert_int_a(cfg_msg_received_deassert_int_a),
        .cfg_msg_received_deassert_int_b(cfg_msg_received_deassert_int_b),
        .cfg_msg_received_deassert_int_c(cfg_msg_received_deassert_int_c),
        .cfg_msg_received_deassert_int_d(cfg_msg_received_deassert_int_d),
        .cfg_msg_received_err_cor(cfg_msg_received_err_cor),
        .cfg_msg_received_err_fatal(cfg_msg_received_err_fatal),
        .cfg_msg_received_err_non_fatal(cfg_msg_received_err_non_fatal),
        .cfg_msg_received_pm_as_nak(cfg_msg_received_pm_as_nak),
        .cfg_msg_received_pm_pme(cfg_msg_received_pm_pme),
        .cfg_msg_received_pme_to_ack(cfg_msg_received_pme_to_ack),
        .cfg_msg_received_setslotpowerlimit(cfg_msg_received_setslotpowerlimit),
        .cfg_pcie_link_state(cfg_pcie_link_state),
        .cfg_pciecap_interrupt_msgnum(cfg_pciecap_interrupt_msgnum),
        .cfg_pm_force_state(cfg_pm_force_state),
        .cfg_pm_force_state_en(cfg_pm_force_state_en),
        .cfg_pm_halt_aspm_l0s(cfg_pm_halt_aspm_l0s),
        .cfg_pm_halt_aspm_l1(cfg_pm_halt_aspm_l1),
        .cfg_pm_turnoff_ok_n(cfg_pm_turnoff_ok_n),
        .cfg_pm_wake(cfg_pm_wake),
        .cfg_pmcsr_pme_en(cfg_pmcsr_pme_en),
        .cfg_pmcsr_pme_status(cfg_pmcsr_pme_status),
        .cfg_pmcsr_powerstate(cfg_pmcsr_powerstate),
        .cfg_received_func_lvl_rst(cfg_received_func_lvl_rst),
        .cfg_root_control_pme_int_en(cfg_root_control_pme_int_en),
        .cfg_root_control_syserr_corr_err_en(cfg_root_control_syserr_corr_err_en),
        .cfg_root_control_syserr_fatal_err_en(cfg_root_control_syserr_fatal_err_en),
        .cfg_root_control_syserr_non_fatal_err_en(cfg_root_control_syserr_non_fatal_err_en),
        .cfg_slot_control_electromech_il_ctl_pulse(cfg_slot_control_electromech_il_ctl_pulse),
        .cfg_to_turnoff(cfg_to_turnoff),
        .cfg_trn_pending(cfg_trn_pending),
        .cfg_vc_tcvc_map(cfg_vc_tcvc_map),
        .dsc_detect(\rx_inst/rx_pipeline_inst/dsc_detect ),
        .fc_cpld(fc_cpld),
        .fc_cplh(fc_cplh),
        .fc_npd(fc_npd),
        .fc_nph(fc_nph),
        .fc_pd(fc_pd),
        .fc_ph(fc_ph),
        .fc_sel(fc_sel),
        .lnk_up_thrtl(\tx_inst/xhdl12.tx_thrl_ctl_inst/lnk_up_thrtl ),
        .out(out),
        .pcie_block_i_0(pcie_7x_i_n_13),
        .pcie_block_i_1(pcie_7x_i_n_22),
        .pcie_block_i_2(pcie_7x_i_n_30),
        .pcie_block_i_3({trn_tsrc_dsc,trn_tstr,trn_terrfwd,trn_tecrc_gen}),
        .pcie_drp_addr(pcie_drp_addr),
        .pcie_drp_clk(pcie_drp_clk),
        .pcie_drp_di(pcie_drp_di),
        .pcie_drp_do(pcie_drp_do),
        .pcie_drp_en(pcie_drp_en),
        .pcie_drp_rdy(pcie_drp_rdy),
        .pcie_drp_we(pcie_drp_we),
        .pipe_pclk_in(pipe_pclk_in),
        .pipe_rx0_chanisaligned(pipe_rx0_chanisaligned),
        .pipe_rx0_char_is_k(pipe_rx0_char_is_k),
        .pipe_rx0_data(pipe_rx0_data),
        .pipe_rx0_elec_idle(pipe_rx0_elec_idle),
        .pipe_rx0_phy_status(pipe_rx0_phy_status),
        .pipe_rx0_polarity(pipe_rx0_polarity),
        .pipe_rx0_status(pipe_rx0_status),
        .pipe_rx0_valid(pipe_rx0_valid),
        .pipe_tx0_char_is_k(pipe_tx0_char_is_k),
        .pipe_tx0_compliance(pipe_tx0_compliance),
        .pipe_tx0_data(pipe_tx0_data),
        .pipe_tx0_elec_idle(pipe_tx0_elec_idle),
        .pipe_tx0_powerdown(pipe_tx0_powerdown),
        .pipe_tx_deemph(pipe_tx_deemph),
        .pipe_tx_margin(pipe_tx_margin),
        .pipe_tx_rate(pipe_tx_rate),
        .pipe_tx_rcvr_det(pipe_tx_rcvr_det),
        .pipe_userclk1_in(pipe_userclk1_in),
        .pipe_userclk2_in(pipe_userclk2_in),
        .pl_directed_change_done(pl_directed_change_done),
        .pl_directed_link_auton(pl_directed_link_auton),
        .pl_directed_link_change(pl_directed_link_change),
        .pl_directed_link_speed(pl_directed_link_speed),
        .pl_directed_link_width(pl_directed_link_width),
        .pl_downstream_deemph_source(pl_downstream_deemph_source),
        .pl_initial_link_width(pl_initial_link_width),
        .pl_lane_reversal_mode(pl_lane_reversal_mode),
        .pl_link_gen2_cap(pl_link_gen2_cap),
        .pl_link_partner_gen2_supported(pl_link_partner_gen2_supported),
        .pl_link_upcfg_cap(pl_link_upcfg_cap),
        .pl_ltssm_state(pl_ltssm_state),
        .pl_phy_lnk_up(pl_phy_lnk_up),
        .pl_received_hot_rst(pl_received_hot_rst),
        .pl_rx_pm_state(pl_rx_pm_state),
        .pl_sel_lnk_rate(pl_sel_lnk_rate),
        .pl_sel_lnk_width(pl_sel_lnk_width),
        .pl_transmit_hot_rst(pl_transmit_hot_rst),
        .pl_tx_pm_state(pl_tx_pm_state),
        .pl_upstream_prefer_deemph(pl_upstream_prefer_deemph),
        .ppm_L1_thrtl(\tx_inst/xhdl12.tx_thrl_ctl_inst/ppm_L1_thrtl ),
        .ppm_L1_trig(\tx_inst/xhdl12.tx_thrl_ctl_inst/ppm_L1_trig ),
        .reg_dsc_detect(\rx_inst/rx_pipeline_inst/reg_dsc_detect ),
        .reg_tcfg_gnt(\tx_inst/xhdl12.tx_thrl_ctl_inst/reg_tcfg_gnt ),
        .rsrc_rdy_filtered6_out(\rx_inst/rx_pipeline_inst/rsrc_rdy_filtered6_out ),
        .rx_np_ok(rx_np_ok),
        .rx_np_req(rx_np_req),
        .src_in(src_in),
        .sys_rst_n(sys_rst_n),
        .tbuf_av_min_trig(\tx_inst/xhdl12.tx_thrl_ctl_inst/tbuf_av_min_trig ),
        .tcfg_req_trig(\tx_inst/xhdl12.tx_thrl_ctl_inst/tcfg_req_trig ),
        .trn_in_packet(\rx_inst/rx_pipeline_inst/trn_in_packet ),
        .trn_in_packet_reg(pcie_7x_i_n_9),
        .trn_lnk_up(trn_lnk_up),
        .trn_rbar_hit(trn_rbar_hit),
        .trn_rd(trn_rd),
        .trn_rdst_rdy(trn_rdst_rdy),
        .trn_recrc_err(trn_recrc_err),
        .trn_reof(trn_reof),
        .trn_rerrfwd(trn_rerrfwd),
        .trn_rrem(trn_rrem),
        .trn_rsof(trn_rsof),
        .trn_rsrc_dsc(trn_rsrc_dsc),
        .trn_rsrc_dsc_d(\rx_inst/rx_pipeline_inst/trn_rsrc_dsc_d ),
        .trn_rsrc_dsc_prev0(\rx_inst/rx_pipeline_inst/trn_rsrc_dsc_prev0 ),
        .trn_tbuf_av(trn_tbuf_av),
        .trn_tcfg_gnt(trn_tcfg_gnt),
        .trn_tcfg_req(trn_tcfg_req),
        .trn_td(trn_td),
        .trn_tdst_rdy(trn_tdst_rdy),
        .trn_teof(trn_teof),
        .trn_trem(trn_trem),
        .trn_tsof(trn_tsof),
        .trn_tsrc_rdy(trn_tsrc_rdy),
        .tx_err_drop(tx_err_drop),
        .user_reset_int_reg(user_reset_int_reg));
endmodule

module pcie_7x_0_pipe_drp
   (drp_done,
    \fsm_reg[1]_0 ,
    DRPDI,
    DRPADDR,
    \fsm_reg[1]_1 ,
    SR,
    rate_drp_x16x20_mode,
    pipe_dclk_in,
    rate_drp_start,
    rdy_reg1_reg_0,
    rate_drp_x16,
    rst_gtreset,
    pipe_tx_rate,
    D);
  output drp_done;
  output \fsm_reg[1]_0 ;
  output [15:0]DRPDI;
  output [7:0]DRPADDR;
  output \fsm_reg[1]_1 ;
  input [0:0]SR;
  input rate_drp_x16x20_mode;
  input pipe_dclk_in;
  input rate_drp_start;
  input rdy_reg1_reg_0;
  input rate_drp_x16;
  input rst_gtreset;
  input pipe_tx_rate;
  input [15:0]D;

  wire [15:0]D;
  wire [7:0]DRPADDR;
  wire [15:0]DRPDI;
  wire [0:0]SR;
  wire [7:0]addr_reg;
  wire \addr_reg[4]_i_1_n_0 ;
  wire \addr_reg[6]_i_1_n_0 ;
  wire [15:15]data_pma_rsv_a;
  wire [15:0]di_reg;
  wire \di_reg[0]_i_2_n_0 ;
  wire \di_reg[0]_i_3_n_0 ;
  wire \di_reg[11]_i_2_n_0 ;
  wire \di_reg[11]_i_3_n_0 ;
  wire \di_reg[11]_i_4_n_0 ;
  wire \di_reg[11]_i_5_n_0 ;
  wire \di_reg[12]_i_2_n_0 ;
  wire \di_reg[12]_i_3_n_0 ;
  wire \di_reg[13]_i_2_n_0 ;
  wire \di_reg[13]_i_3_n_0 ;
  wire \di_reg[14]_i_2_n_0 ;
  wire \di_reg[15]_i_2_n_0 ;
  wire \di_reg[1]_i_2_n_0 ;
  wire \di_reg[1]_i_3_n_0 ;
  wire \di_reg[2]_i_2_n_0 ;
  wire \di_reg[2]_i_3_n_0 ;
  wire \di_reg[3]_i_2_n_0 ;
  wire \di_reg[3]_i_3_n_0 ;
  wire \di_reg[4]_i_2_n_0 ;
  wire \di_reg[4]_i_3_n_0 ;
  wire \di_reg[4]_i_4_n_0 ;
  wire \di_reg[5]_i_2_n_0 ;
  wire \di_reg[5]_i_3_n_0 ;
  wire \di_reg[6]_i_2_n_0 ;
  wire \di_reg[6]_i_3_n_0 ;
  wire \di_reg[7]_i_2_n_0 ;
  wire \di_reg[7]_i_3_n_0 ;
  wire \di_reg_reg_n_0_[0] ;
  wire \di_reg_reg_n_0_[10] ;
  wire \di_reg_reg_n_0_[11] ;
  wire \di_reg_reg_n_0_[12] ;
  wire \di_reg_reg_n_0_[13] ;
  wire \di_reg_reg_n_0_[14] ;
  wire \di_reg_reg_n_0_[15] ;
  wire \di_reg_reg_n_0_[1] ;
  wire \di_reg_reg_n_0_[2] ;
  wire \di_reg_reg_n_0_[3] ;
  wire \di_reg_reg_n_0_[4] ;
  wire \di_reg_reg_n_0_[5] ;
  wire \di_reg_reg_n_0_[6] ;
  wire \di_reg_reg_n_0_[7] ;
  wire \di_reg_reg_n_0_[8] ;
  wire \di_reg_reg_n_0_[9] ;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire [15:0]do_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire [15:0]do_reg2;
  wire done_i_1__0_n_0;
  wire drp_done;
  wire [2:0]fsm;
  wire fsm1__8;
  wire \fsm[0]_i_2__1_n_0 ;
  wire \fsm_reg[1]_0 ;
  wire \fsm_reg[1]_1 ;
  wire \fsm_reg_n_0_[0] ;
  wire \fsm_reg_n_0_[1] ;
  wire \fsm_reg_n_0_[2] ;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire gtxreset_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire gtxreset_reg2;
  wire [4:0]index;
  wire \index[0]_i_1_n_0 ;
  wire \index[1]_i_1_n_0 ;
  wire \index[2]_i_1_n_0 ;
  wire \index[3]_i_1_n_0 ;
  wire \index[3]_i_2_n_0 ;
  wire \index[4]_i_1_n_0 ;
  wire \index[4]_i_2_n_0 ;
  wire \index[4]_i_3_n_0 ;
  wire [0:0]load_cnt;
  wire \load_cnt[0]_i_1__0_n_0 ;
  wire [7:0]p_0_in_0;
  wire pipe_dclk_in;
  wire pipe_tx_rate;
  wire rate_drp_start;
  wire rate_drp_x16;
  wire rate_drp_x16x20_mode;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire [1:0]rate_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire [1:0]rate_reg2;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rdy_reg1;
  wire rdy_reg1_reg_0;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rdy_reg2;
  wire rst_gtreset;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire start_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire start_reg2;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire x16_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire x16_reg2;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire x16x20_mode_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire x16x20_mode_reg2;

  LUT6 #(
    .INIT(64'h1736415517364154)) 
    \addr_reg[0]_i_1 
       (.I0(index[4]),
        .I1(index[3]),
        .I2(index[2]),
        .I3(index[1]),
        .I4(index[0]),
        .I5(x16x20_mode_reg2),
        .O(addr_reg[0]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h40500F00)) 
    \addr_reg[1]_i_1 
       (.I0(index[4]),
        .I1(index[0]),
        .I2(index[3]),
        .I3(index[1]),
        .I4(index[2]),
        .O(addr_reg[1]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h05105A00)) 
    \addr_reg[2]_i_1 
       (.I0(index[4]),
        .I1(index[0]),
        .I2(index[3]),
        .I3(index[2]),
        .I4(index[1]),
        .O(addr_reg[2]));
  LUT6 #(
    .INIT(64'h5767576753265327)) 
    \addr_reg[3]_i_1 
       (.I0(index[4]),
        .I1(index[3]),
        .I2(index[2]),
        .I3(index[1]),
        .I4(x16x20_mode_reg2),
        .I5(index[0]),
        .O(addr_reg[3]));
  LUT6 #(
    .INIT(64'h00000000FAAFFF04)) 
    \addr_reg[4]_i_1 
       (.I0(index[0]),
        .I1(x16x20_mode_reg2),
        .I2(index[1]),
        .I3(index[2]),
        .I4(index[3]),
        .I5(index[4]),
        .O(\addr_reg[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h001A0F0A)) 
    \addr_reg[5]_i_1 
       (.I0(index[4]),
        .I1(index[0]),
        .I2(index[3]),
        .I3(index[1]),
        .I4(index[2]),
        .O(addr_reg[5]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h00001454)) 
    \addr_reg[6]_i_1 
       (.I0(index[2]),
        .I1(index[1]),
        .I2(index[3]),
        .I3(index[0]),
        .I4(index[4]),
        .O(\addr_reg[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h5252424223236263)) 
    \addr_reg[7]_i_1 
       (.I0(index[4]),
        .I1(index[3]),
        .I2(index[2]),
        .I3(x16x20_mode_reg2),
        .I4(index[0]),
        .I5(index[1]),
        .O(addr_reg[7]));
  FDRE #(
    .INIT(1'b0)) 
    \addr_reg_reg[0] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(addr_reg[0]),
        .Q(p_0_in_0[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \addr_reg_reg[1] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(addr_reg[1]),
        .Q(p_0_in_0[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \addr_reg_reg[2] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(addr_reg[2]),
        .Q(p_0_in_0[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \addr_reg_reg[3] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(addr_reg[3]),
        .Q(p_0_in_0[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \addr_reg_reg[4] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(\addr_reg[4]_i_1_n_0 ),
        .Q(p_0_in_0[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \addr_reg_reg[5] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(addr_reg[5]),
        .Q(p_0_in_0[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \addr_reg_reg[6] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(\addr_reg[6]_i_1_n_0 ),
        .Q(p_0_in_0[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \addr_reg_reg[7] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(addr_reg[7]),
        .Q(p_0_in_0[7]),
        .R(SR));
  LUT6 #(
    .INIT(64'hFF5E7F6FA1001000)) 
    \di_reg[0]_i_2 
       (.I0(index[3]),
        .I1(index[2]),
        .I2(index[1]),
        .I3(data_pma_rsv_a),
        .I4(index[0]),
        .I5(do_reg2[0]),
        .O(\di_reg[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h000005D0)) 
    \di_reg[0]_i_3 
       (.I0(index[0]),
        .I1(do_reg2[0]),
        .I2(index[2]),
        .I3(index[1]),
        .I4(index[3]),
        .O(\di_reg[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h45555F5540000000)) 
    \di_reg[10]_i_1 
       (.I0(index[4]),
        .I1(\di_reg[15]_i_2_n_0 ),
        .I2(index[1]),
        .I3(index[2]),
        .I4(index[3]),
        .I5(do_reg2[10]),
        .O(di_reg[10]));
  LUT6 #(
    .INIT(64'h4F40DDDD4F408888)) 
    \di_reg[11]_i_2 
       (.I0(index[3]),
        .I1(do_reg2[11]),
        .I2(index[1]),
        .I3(\di_reg[11]_i_4_n_0 ),
        .I4(index[2]),
        .I5(\di_reg[11]_i_5_n_0 ),
        .O(\di_reg[11]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000008080838)) 
    \di_reg[11]_i_3 
       (.I0(do_reg2[11]),
        .I1(index[2]),
        .I2(index[1]),
        .I3(data_pma_rsv_a),
        .I4(index[0]),
        .I5(index[3]),
        .O(\di_reg[11]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hB8BB)) 
    \di_reg[11]_i_4 
       (.I0(do_reg2[11]),
        .I1(index[0]),
        .I2(rate_reg2[0]),
        .I3(rate_reg2[1]),
        .O(\di_reg[11]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF0100)) 
    \di_reg[11]_i_5 
       (.I0(index[1]),
        .I1(index[0]),
        .I2(x16_reg2),
        .I3(x16x20_mode_reg2),
        .I4(do_reg2[11]),
        .O(\di_reg[11]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h777EFFFF01080000)) 
    \di_reg[12]_i_2 
       (.I0(index[3]),
        .I1(index[1]),
        .I2(index[0]),
        .I3(data_pma_rsv_a),
        .I4(index[2]),
        .I5(do_reg2[12]),
        .O(\di_reg[12]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000B08)) 
    \di_reg[12]_i_3 
       (.I0(do_reg2[12]),
        .I1(index[2]),
        .I2(index[1]),
        .I3(index[0]),
        .I4(index[3]),
        .O(\di_reg[12]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h767FFFFF00090000)) 
    \di_reg[13]_i_2 
       (.I0(index[3]),
        .I1(index[1]),
        .I2(index[0]),
        .I3(data_pma_rsv_a),
        .I4(index[2]),
        .I5(do_reg2[13]),
        .O(\di_reg[13]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000008380808)) 
    \di_reg[13]_i_3 
       (.I0(do_reg2[13]),
        .I1(index[2]),
        .I2(index[1]),
        .I3(index[0]),
        .I4(data_pma_rsv_a),
        .I5(index[3]),
        .O(\di_reg[13]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0040FFFF00400000)) 
    \di_reg[14]_i_1 
       (.I0(index[1]),
        .I1(index[2]),
        .I2(do_reg2[14]),
        .I3(index[3]),
        .I4(index[4]),
        .I5(\di_reg[14]_i_2_n_0 ),
        .O(di_reg[14]));
  LUT6 #(
    .INIT(64'h653BFFF721080080)) 
    \di_reg[14]_i_2 
       (.I0(index[3]),
        .I1(index[1]),
        .I2(data_pma_rsv_a),
        .I3(index[0]),
        .I4(index[2]),
        .I5(do_reg2[14]),
        .O(\di_reg[14]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \di_reg[14]_i_3 
       (.I0(rate_reg2[0]),
        .I1(rate_reg2[1]),
        .O(data_pma_rsv_a));
  LUT6 #(
    .INIT(64'h45555F5540000000)) 
    \di_reg[15]_i_1 
       (.I0(index[4]),
        .I1(\di_reg[15]_i_2_n_0 ),
        .I2(index[1]),
        .I3(index[2]),
        .I4(index[3]),
        .I5(do_reg2[15]),
        .O(di_reg[15]));
  LUT3 #(
    .INIT(8'h0D)) 
    \di_reg[15]_i_2 
       (.I0(rate_reg2[1]),
        .I1(rate_reg2[0]),
        .I2(index[0]),
        .O(\di_reg[15]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h5FEE4E0076FF1000)) 
    \di_reg[1]_i_2 
       (.I0(index[3]),
        .I1(index[2]),
        .I2(data_pma_rsv_a),
        .I3(index[1]),
        .I4(do_reg2[1]),
        .I5(index[0]),
        .O(\di_reg[1]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h000005D0)) 
    \di_reg[1]_i_3 
       (.I0(index[0]),
        .I1(do_reg2[1]),
        .I2(index[2]),
        .I3(index[1]),
        .I4(index[3]),
        .O(\di_reg[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h5DEE080067FF0100)) 
    \di_reg[2]_i_2 
       (.I0(index[3]),
        .I1(index[2]),
        .I2(data_pma_rsv_a),
        .I3(index[1]),
        .I4(do_reg2[2]),
        .I5(index[0]),
        .O(\di_reg[2]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000380)) 
    \di_reg[2]_i_3 
       (.I0(do_reg2[2]),
        .I1(index[0]),
        .I2(index[2]),
        .I3(index[1]),
        .I4(index[3]),
        .O(\di_reg[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h43FFFFFF40000000)) 
    \di_reg[3]_i_2 
       (.I0(data_pma_rsv_a),
        .I1(index[2]),
        .I2(index[0]),
        .I3(index[1]),
        .I4(index[3]),
        .I5(do_reg2[3]),
        .O(\di_reg[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h000000000033D100)) 
    \di_reg[3]_i_3 
       (.I0(data_pma_rsv_a),
        .I1(index[0]),
        .I2(do_reg2[3]),
        .I3(index[2]),
        .I4(index[1]),
        .I5(index[3]),
        .O(\di_reg[3]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \di_reg[4]_i_1 
       (.I0(\di_reg[4]_i_2_n_0 ),
        .I1(index[4]),
        .I2(\di_reg[4]_i_3_n_0 ),
        .I3(index[3]),
        .I4(\di_reg[4]_i_4_n_0 ),
        .O(di_reg[4]));
  LUT6 #(
    .INIT(64'h0F0400F0000400F0)) 
    \di_reg[4]_i_2 
       (.I0(rate_reg2[0]),
        .I1(rate_reg2[1]),
        .I2(index[1]),
        .I3(index[2]),
        .I4(index[0]),
        .I5(do_reg2[4]),
        .O(\di_reg[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h400FFFFF40000000)) 
    \di_reg[4]_i_3 
       (.I0(rate_reg2[0]),
        .I1(rate_reg2[1]),
        .I2(index[2]),
        .I3(index[0]),
        .I4(index[1]),
        .I5(do_reg2[4]),
        .O(\di_reg[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hBF00BF01FF40FE40)) 
    \di_reg[4]_i_4 
       (.I0(index[2]),
        .I1(index[1]),
        .I2(index[0]),
        .I3(do_reg2[4]),
        .I4(x16x20_mode_reg2),
        .I5(data_pma_rsv_a),
        .O(\di_reg[4]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h7F7F7F7E00000000)) 
    \di_reg[5]_i_2 
       (.I0(index[3]),
        .I1(index[2]),
        .I2(index[1]),
        .I3(index[0]),
        .I4(x16x20_mode_reg2),
        .I5(do_reg2[5]),
        .O(\di_reg[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000038F0380)) 
    \di_reg[5]_i_3 
       (.I0(do_reg2[5]),
        .I1(index[0]),
        .I2(index[2]),
        .I3(index[1]),
        .I4(data_pma_rsv_a),
        .I5(index[3]),
        .O(\di_reg[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h7D7F7D7E00000000)) 
    \di_reg[6]_i_2 
       (.I0(index[3]),
        .I1(index[2]),
        .I2(index[1]),
        .I3(index[0]),
        .I4(x16x20_mode_reg2),
        .I5(do_reg2[6]),
        .O(\di_reg[6]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000380)) 
    \di_reg[6]_i_3 
       (.I0(do_reg2[6]),
        .I1(index[0]),
        .I2(index[2]),
        .I3(index[1]),
        .I4(index[3]),
        .O(\di_reg[6]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h7FFF0900)) 
    \di_reg[7]_i_2 
       (.I0(index[2]),
        .I1(index[1]),
        .I2(index[0]),
        .I3(index[3]),
        .I4(do_reg2[7]),
        .O(\di_reg[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000003800383)) 
    \di_reg[7]_i_3 
       (.I0(do_reg2[7]),
        .I1(index[0]),
        .I2(index[2]),
        .I3(index[1]),
        .I4(data_pma_rsv_a),
        .I5(index[3]),
        .O(\di_reg[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h03333F7300000040)) 
    \di_reg[8]_i_1 
       (.I0(index[0]),
        .I1(index[4]),
        .I2(index[1]),
        .I3(index[2]),
        .I4(index[3]),
        .I5(do_reg2[8]),
        .O(di_reg[8]));
  LUT6 #(
    .INIT(64'h03333F7300000040)) 
    \di_reg[9]_i_1 
       (.I0(index[0]),
        .I1(index[4]),
        .I2(index[1]),
        .I3(index[2]),
        .I4(index[3]),
        .I5(do_reg2[9]),
        .O(di_reg[9]));
  FDRE #(
    .INIT(1'b0)) 
    \di_reg_reg[0] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(di_reg[0]),
        .Q(\di_reg_reg_n_0_[0] ),
        .R(SR));
  MUXF7 \di_reg_reg[0]_i_1 
       (.I0(\di_reg[0]_i_2_n_0 ),
        .I1(\di_reg[0]_i_3_n_0 ),
        .O(di_reg[0]),
        .S(index[4]));
  FDRE #(
    .INIT(1'b0)) 
    \di_reg_reg[10] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(di_reg[10]),
        .Q(\di_reg_reg_n_0_[10] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \di_reg_reg[11] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(di_reg[11]),
        .Q(\di_reg_reg_n_0_[11] ),
        .R(SR));
  MUXF7 \di_reg_reg[11]_i_1 
       (.I0(\di_reg[11]_i_2_n_0 ),
        .I1(\di_reg[11]_i_3_n_0 ),
        .O(di_reg[11]),
        .S(index[4]));
  FDRE #(
    .INIT(1'b0)) 
    \di_reg_reg[12] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(di_reg[12]),
        .Q(\di_reg_reg_n_0_[12] ),
        .R(SR));
  MUXF7 \di_reg_reg[12]_i_1 
       (.I0(\di_reg[12]_i_2_n_0 ),
        .I1(\di_reg[12]_i_3_n_0 ),
        .O(di_reg[12]),
        .S(index[4]));
  FDRE #(
    .INIT(1'b0)) 
    \di_reg_reg[13] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(di_reg[13]),
        .Q(\di_reg_reg_n_0_[13] ),
        .R(SR));
  MUXF7 \di_reg_reg[13]_i_1 
       (.I0(\di_reg[13]_i_2_n_0 ),
        .I1(\di_reg[13]_i_3_n_0 ),
        .O(di_reg[13]),
        .S(index[4]));
  FDRE #(
    .INIT(1'b0)) 
    \di_reg_reg[14] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(di_reg[14]),
        .Q(\di_reg_reg_n_0_[14] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \di_reg_reg[15] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(di_reg[15]),
        .Q(\di_reg_reg_n_0_[15] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \di_reg_reg[1] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(di_reg[1]),
        .Q(\di_reg_reg_n_0_[1] ),
        .R(SR));
  MUXF7 \di_reg_reg[1]_i_1 
       (.I0(\di_reg[1]_i_2_n_0 ),
        .I1(\di_reg[1]_i_3_n_0 ),
        .O(di_reg[1]),
        .S(index[4]));
  FDRE #(
    .INIT(1'b0)) 
    \di_reg_reg[2] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(di_reg[2]),
        .Q(\di_reg_reg_n_0_[2] ),
        .R(SR));
  MUXF7 \di_reg_reg[2]_i_1 
       (.I0(\di_reg[2]_i_2_n_0 ),
        .I1(\di_reg[2]_i_3_n_0 ),
        .O(di_reg[2]),
        .S(index[4]));
  FDRE #(
    .INIT(1'b0)) 
    \di_reg_reg[3] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(di_reg[3]),
        .Q(\di_reg_reg_n_0_[3] ),
        .R(SR));
  MUXF7 \di_reg_reg[3]_i_1 
       (.I0(\di_reg[3]_i_2_n_0 ),
        .I1(\di_reg[3]_i_3_n_0 ),
        .O(di_reg[3]),
        .S(index[4]));
  FDRE #(
    .INIT(1'b0)) 
    \di_reg_reg[4] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(di_reg[4]),
        .Q(\di_reg_reg_n_0_[4] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \di_reg_reg[5] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(di_reg[5]),
        .Q(\di_reg_reg_n_0_[5] ),
        .R(SR));
  MUXF7 \di_reg_reg[5]_i_1 
       (.I0(\di_reg[5]_i_2_n_0 ),
        .I1(\di_reg[5]_i_3_n_0 ),
        .O(di_reg[5]),
        .S(index[4]));
  FDRE #(
    .INIT(1'b0)) 
    \di_reg_reg[6] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(di_reg[6]),
        .Q(\di_reg_reg_n_0_[6] ),
        .R(SR));
  MUXF7 \di_reg_reg[6]_i_1 
       (.I0(\di_reg[6]_i_2_n_0 ),
        .I1(\di_reg[6]_i_3_n_0 ),
        .O(di_reg[6]),
        .S(index[4]));
  FDRE #(
    .INIT(1'b0)) 
    \di_reg_reg[7] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(di_reg[7]),
        .Q(\di_reg_reg_n_0_[7] ),
        .R(SR));
  MUXF7 \di_reg_reg[7]_i_1 
       (.I0(\di_reg[7]_i_2_n_0 ),
        .I1(\di_reg[7]_i_3_n_0 ),
        .O(di_reg[7]),
        .S(index[4]));
  FDRE #(
    .INIT(1'b0)) 
    \di_reg_reg[8] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(di_reg[8]),
        .Q(\di_reg_reg_n_0_[8] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \di_reg_reg[9] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(di_reg[9]),
        .Q(\di_reg_reg_n_0_[9] ),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg1_reg[0] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(D[0]),
        .Q(do_reg1[0]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg1_reg[10] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(D[10]),
        .Q(do_reg1[10]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg1_reg[11] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(D[11]),
        .Q(do_reg1[11]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg1_reg[12] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(D[12]),
        .Q(do_reg1[12]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg1_reg[13] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(D[13]),
        .Q(do_reg1[13]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg1_reg[14] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(D[14]),
        .Q(do_reg1[14]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg1_reg[15] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(D[15]),
        .Q(do_reg1[15]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg1_reg[1] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(D[1]),
        .Q(do_reg1[1]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg1_reg[2] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(D[2]),
        .Q(do_reg1[2]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg1_reg[3] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(D[3]),
        .Q(do_reg1[3]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg1_reg[4] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(D[4]),
        .Q(do_reg1[4]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg1_reg[5] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(D[5]),
        .Q(do_reg1[5]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg1_reg[6] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(D[6]),
        .Q(do_reg1[6]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg1_reg[7] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(D[7]),
        .Q(do_reg1[7]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg1_reg[8] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(D[8]),
        .Q(do_reg1[8]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg1_reg[9] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(D[9]),
        .Q(do_reg1[9]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg2_reg[0] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(do_reg1[0]),
        .Q(do_reg2[0]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg2_reg[10] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(do_reg1[10]),
        .Q(do_reg2[10]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg2_reg[11] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(do_reg1[11]),
        .Q(do_reg2[11]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg2_reg[12] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(do_reg1[12]),
        .Q(do_reg2[12]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg2_reg[13] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(do_reg1[13]),
        .Q(do_reg2[13]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg2_reg[14] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(do_reg1[14]),
        .Q(do_reg2[14]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg2_reg[15] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(do_reg1[15]),
        .Q(do_reg2[15]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg2_reg[1] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(do_reg1[1]),
        .Q(do_reg2[1]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg2_reg[2] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(do_reg1[2]),
        .Q(do_reg2[2]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg2_reg[3] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(do_reg1[3]),
        .Q(do_reg2[3]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg2_reg[4] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(do_reg1[4]),
        .Q(do_reg2[4]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg2_reg[5] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(do_reg1[5]),
        .Q(do_reg2[5]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg2_reg[6] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(do_reg1[6]),
        .Q(do_reg2[6]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg2_reg[7] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(do_reg1[7]),
        .Q(do_reg2[7]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg2_reg[8] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(do_reg1[8]),
        .Q(do_reg2[8]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg2_reg[9] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(do_reg1[9]),
        .Q(do_reg2[9]),
        .R(SR));
  LUT4 #(
    .INIT(16'h0001)) 
    done_i_1__0
       (.I0(\fsm_reg_n_0_[2] ),
        .I1(\fsm_reg_n_0_[0] ),
        .I2(start_reg2),
        .I3(\fsm_reg_n_0_[1] ),
        .O(done_i_1__0_n_0));
  FDRE #(
    .INIT(1'b0)) 
    done_reg
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(done_i_1__0_n_0),
        .Q(drp_done),
        .R(SR));
  LUT6 #(
    .INIT(64'h0737FFFF07370000)) 
    \fsm[0]_i_1__1 
       (.I0(fsm1__8),
        .I1(\fsm_reg_n_0_[1] ),
        .I2(\fsm_reg_n_0_[0] ),
        .I3(rdy_reg2),
        .I4(\fsm_reg_n_0_[2] ),
        .I5(\fsm[0]_i_2__1_n_0 ),
        .O(fsm[0]));
  LUT5 #(
    .INIT(32'h47FF47CC)) 
    \fsm[0]_i_2__1 
       (.I0(rdy_reg2),
        .I1(\fsm_reg_n_0_[1] ),
        .I2(load_cnt),
        .I3(\fsm_reg_n_0_[0] ),
        .I4(start_reg2),
        .O(\fsm[0]_i_2__1_n_0 ));
  LUT5 #(
    .INIT(32'h1D501850)) 
    \fsm[1]_i_1__1 
       (.I0(\fsm_reg_n_0_[2] ),
        .I1(rdy_reg2),
        .I2(\fsm_reg_n_0_[1] ),
        .I3(\fsm_reg_n_0_[0] ),
        .I4(load_cnt),
        .O(fsm[1]));
  LUT4 #(
    .INIT(16'h6222)) 
    \fsm[2]_i_1__1 
       (.I0(\fsm_reg_n_0_[2] ),
        .I1(\fsm_reg_n_0_[1] ),
        .I2(\fsm_reg_n_0_[0] ),
        .I3(rdy_reg2),
        .O(fsm[2]));
  FDRE #(
    .INIT(1'b0)) 
    \fsm_reg[0] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(fsm[0]),
        .Q(\fsm_reg_n_0_[0] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \fsm_reg[1] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(fsm[1]),
        .Q(\fsm_reg_n_0_[1] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \fsm_reg[2] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(fsm[2]),
        .Q(\fsm_reg_n_0_[2] ),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'hAAA8)) 
    \gtx_channel.gtxe2_channel_i_i_10 
       (.I0(\di_reg_reg_n_0_[12] ),
        .I1(\fsm_reg_n_0_[1] ),
        .I2(\fsm_reg_n_0_[0] ),
        .I3(\fsm_reg_n_0_[2] ),
        .O(DRPDI[12]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'hAAA8)) 
    \gtx_channel.gtxe2_channel_i_i_11 
       (.I0(\di_reg_reg_n_0_[11] ),
        .I1(\fsm_reg_n_0_[1] ),
        .I2(\fsm_reg_n_0_[0] ),
        .I3(\fsm_reg_n_0_[2] ),
        .O(DRPDI[11]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'hAAA8)) 
    \gtx_channel.gtxe2_channel_i_i_12 
       (.I0(\di_reg_reg_n_0_[10] ),
        .I1(\fsm_reg_n_0_[1] ),
        .I2(\fsm_reg_n_0_[0] ),
        .I3(\fsm_reg_n_0_[2] ),
        .O(DRPDI[10]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'hAAA8)) 
    \gtx_channel.gtxe2_channel_i_i_13 
       (.I0(\di_reg_reg_n_0_[9] ),
        .I1(\fsm_reg_n_0_[1] ),
        .I2(\fsm_reg_n_0_[0] ),
        .I3(\fsm_reg_n_0_[2] ),
        .O(DRPDI[9]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'hAAA8)) 
    \gtx_channel.gtxe2_channel_i_i_14 
       (.I0(\di_reg_reg_n_0_[8] ),
        .I1(\fsm_reg_n_0_[1] ),
        .I2(\fsm_reg_n_0_[0] ),
        .I3(\fsm_reg_n_0_[2] ),
        .O(DRPDI[8]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'hAAA8)) 
    \gtx_channel.gtxe2_channel_i_i_15 
       (.I0(\di_reg_reg_n_0_[7] ),
        .I1(\fsm_reg_n_0_[1] ),
        .I2(\fsm_reg_n_0_[0] ),
        .I3(\fsm_reg_n_0_[2] ),
        .O(DRPDI[7]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'hAAA8)) 
    \gtx_channel.gtxe2_channel_i_i_16 
       (.I0(\di_reg_reg_n_0_[6] ),
        .I1(\fsm_reg_n_0_[1] ),
        .I2(\fsm_reg_n_0_[0] ),
        .I3(\fsm_reg_n_0_[2] ),
        .O(DRPDI[6]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'hAAA8)) 
    \gtx_channel.gtxe2_channel_i_i_17 
       (.I0(\di_reg_reg_n_0_[5] ),
        .I1(\fsm_reg_n_0_[1] ),
        .I2(\fsm_reg_n_0_[0] ),
        .I3(\fsm_reg_n_0_[2] ),
        .O(DRPDI[5]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'hAAA8)) 
    \gtx_channel.gtxe2_channel_i_i_18 
       (.I0(\di_reg_reg_n_0_[4] ),
        .I1(\fsm_reg_n_0_[1] ),
        .I2(\fsm_reg_n_0_[0] ),
        .I3(\fsm_reg_n_0_[2] ),
        .O(DRPDI[4]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'hAAA8)) 
    \gtx_channel.gtxe2_channel_i_i_19 
       (.I0(\di_reg_reg_n_0_[3] ),
        .I1(\fsm_reg_n_0_[1] ),
        .I2(\fsm_reg_n_0_[0] ),
        .I3(\fsm_reg_n_0_[2] ),
        .O(DRPDI[3]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hAAA8)) 
    \gtx_channel.gtxe2_channel_i_i_20 
       (.I0(\di_reg_reg_n_0_[2] ),
        .I1(\fsm_reg_n_0_[1] ),
        .I2(\fsm_reg_n_0_[0] ),
        .I3(\fsm_reg_n_0_[2] ),
        .O(DRPDI[2]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hAAA8)) 
    \gtx_channel.gtxe2_channel_i_i_21 
       (.I0(\di_reg_reg_n_0_[1] ),
        .I1(\fsm_reg_n_0_[1] ),
        .I2(\fsm_reg_n_0_[0] ),
        .I3(\fsm_reg_n_0_[2] ),
        .O(DRPDI[1]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hAAA8)) 
    \gtx_channel.gtxe2_channel_i_i_22 
       (.I0(\di_reg_reg_n_0_[0] ),
        .I1(\fsm_reg_n_0_[1] ),
        .I2(\fsm_reg_n_0_[0] ),
        .I3(\fsm_reg_n_0_[2] ),
        .O(DRPDI[0]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h12)) 
    \gtx_channel.gtxe2_channel_i_i_3 
       (.I0(\fsm_reg_n_0_[1] ),
        .I1(\fsm_reg_n_0_[0] ),
        .I2(\fsm_reg_n_0_[2] ),
        .O(\fsm_reg[1]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'h10)) 
    \gtx_channel.gtxe2_channel_i_i_4 
       (.I0(\fsm_reg_n_0_[1] ),
        .I1(\fsm_reg_n_0_[0] ),
        .I2(\fsm_reg_n_0_[2] ),
        .O(\fsm_reg[1]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'hAAA8)) 
    \gtx_channel.gtxe2_channel_i_i_40 
       (.I0(p_0_in_0[7]),
        .I1(\fsm_reg_n_0_[1] ),
        .I2(\fsm_reg_n_0_[0] ),
        .I3(\fsm_reg_n_0_[2] ),
        .O(DRPADDR[7]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'hAAA8)) 
    \gtx_channel.gtxe2_channel_i_i_41 
       (.I0(p_0_in_0[6]),
        .I1(\fsm_reg_n_0_[1] ),
        .I2(\fsm_reg_n_0_[0] ),
        .I3(\fsm_reg_n_0_[2] ),
        .O(DRPADDR[6]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'hAAA8)) 
    \gtx_channel.gtxe2_channel_i_i_42 
       (.I0(p_0_in_0[5]),
        .I1(\fsm_reg_n_0_[1] ),
        .I2(\fsm_reg_n_0_[0] ),
        .I3(\fsm_reg_n_0_[2] ),
        .O(DRPADDR[5]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'hAAA8)) 
    \gtx_channel.gtxe2_channel_i_i_43 
       (.I0(p_0_in_0[4]),
        .I1(\fsm_reg_n_0_[1] ),
        .I2(\fsm_reg_n_0_[0] ),
        .I3(\fsm_reg_n_0_[2] ),
        .O(DRPADDR[4]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'hAAA8)) 
    \gtx_channel.gtxe2_channel_i_i_44 
       (.I0(p_0_in_0[3]),
        .I1(\fsm_reg_n_0_[1] ),
        .I2(\fsm_reg_n_0_[0] ),
        .I3(\fsm_reg_n_0_[2] ),
        .O(DRPADDR[3]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'hAAA8)) 
    \gtx_channel.gtxe2_channel_i_i_45 
       (.I0(p_0_in_0[2]),
        .I1(\fsm_reg_n_0_[1] ),
        .I2(\fsm_reg_n_0_[0] ),
        .I3(\fsm_reg_n_0_[2] ),
        .O(DRPADDR[2]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'hAAA8)) 
    \gtx_channel.gtxe2_channel_i_i_46 
       (.I0(p_0_in_0[1]),
        .I1(\fsm_reg_n_0_[1] ),
        .I2(\fsm_reg_n_0_[0] ),
        .I3(\fsm_reg_n_0_[2] ),
        .O(DRPADDR[1]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'hAAA8)) 
    \gtx_channel.gtxe2_channel_i_i_47 
       (.I0(p_0_in_0[0]),
        .I1(\fsm_reg_n_0_[1] ),
        .I2(\fsm_reg_n_0_[0] ),
        .I3(\fsm_reg_n_0_[2] ),
        .O(DRPADDR[0]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'hAAA8)) 
    \gtx_channel.gtxe2_channel_i_i_7 
       (.I0(\di_reg_reg_n_0_[15] ),
        .I1(\fsm_reg_n_0_[1] ),
        .I2(\fsm_reg_n_0_[0] ),
        .I3(\fsm_reg_n_0_[2] ),
        .O(DRPDI[15]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'hAAA8)) 
    \gtx_channel.gtxe2_channel_i_i_8 
       (.I0(\di_reg_reg_n_0_[14] ),
        .I1(\fsm_reg_n_0_[1] ),
        .I2(\fsm_reg_n_0_[0] ),
        .I3(\fsm_reg_n_0_[2] ),
        .O(DRPDI[14]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'hAAA8)) 
    \gtx_channel.gtxe2_channel_i_i_9 
       (.I0(\di_reg_reg_n_0_[13] ),
        .I1(\fsm_reg_n_0_[1] ),
        .I2(\fsm_reg_n_0_[0] ),
        .I3(\fsm_reg_n_0_[2] ),
        .O(DRPDI[13]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE gtxreset_reg1_reg
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(rst_gtreset),
        .Q(gtxreset_reg1),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE gtxreset_reg2_reg
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(gtxreset_reg1),
        .Q(gtxreset_reg2),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \index[0]_i_1 
       (.I0(\fsm_reg_n_0_[0] ),
        .I1(fsm1__8),
        .I2(index[0]),
        .I3(\fsm_reg_n_0_[2] ),
        .O(\index[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h00140000)) 
    \index[1]_i_1 
       (.I0(\fsm_reg_n_0_[0] ),
        .I1(index[1]),
        .I2(index[0]),
        .I3(fsm1__8),
        .I4(\fsm_reg_n_0_[2] ),
        .O(\index[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000144400000000)) 
    \index[2]_i_1 
       (.I0(\fsm_reg_n_0_[0] ),
        .I1(index[2]),
        .I2(index[1]),
        .I3(index[0]),
        .I4(fsm1__8),
        .I5(\fsm_reg_n_0_[2] ),
        .O(\index[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000144400000000)) 
    \index[3]_i_1 
       (.I0(\fsm_reg_n_0_[0] ),
        .I1(index[3]),
        .I2(index[2]),
        .I3(\index[3]_i_2_n_0 ),
        .I4(fsm1__8),
        .I5(\fsm_reg_n_0_[2] ),
        .O(\index[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \index[3]_i_2 
       (.I0(index[1]),
        .I1(index[0]),
        .O(\index[3]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hA1)) 
    \index[4]_i_1 
       (.I0(\fsm_reg_n_0_[1] ),
        .I1(\fsm_reg_n_0_[0] ),
        .I2(\fsm_reg_n_0_[2] ),
        .O(\index[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000144400000000)) 
    \index[4]_i_2 
       (.I0(\fsm_reg_n_0_[0] ),
        .I1(index[4]),
        .I2(index[3]),
        .I3(\index[4]_i_3_n_0 ),
        .I4(fsm1__8),
        .I5(\fsm_reg_n_0_[2] ),
        .O(\index[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \index[4]_i_3 
       (.I0(index[2]),
        .I1(index[0]),
        .I2(index[1]),
        .O(\index[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h1000000110000000)) 
    \index[4]_i_4 
       (.I0(index[3]),
        .I1(index[1]),
        .I2(index[0]),
        .I3(index[4]),
        .I4(index[2]),
        .I5(x16x20_mode_reg2),
        .O(fsm1__8));
  FDRE #(
    .INIT(1'b0)) 
    \index_reg[0] 
       (.C(pipe_dclk_in),
        .CE(\index[4]_i_1_n_0 ),
        .D(\index[0]_i_1_n_0 ),
        .Q(index[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \index_reg[1] 
       (.C(pipe_dclk_in),
        .CE(\index[4]_i_1_n_0 ),
        .D(\index[1]_i_1_n_0 ),
        .Q(index[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \index_reg[2] 
       (.C(pipe_dclk_in),
        .CE(\index[4]_i_1_n_0 ),
        .D(\index[2]_i_1_n_0 ),
        .Q(index[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \index_reg[3] 
       (.C(pipe_dclk_in),
        .CE(\index[4]_i_1_n_0 ),
        .D(\index[3]_i_1_n_0 ),
        .Q(index[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \index_reg[4] 
       (.C(pipe_dclk_in),
        .CE(\index[4]_i_1_n_0 ),
        .D(\index[4]_i_2_n_0 ),
        .Q(index[4]),
        .R(SR));
  LUT3 #(
    .INIT(8'h10)) 
    \load_cnt[0]_i_1__0 
       (.I0(\fsm_reg_n_0_[1] ),
        .I1(\fsm_reg_n_0_[2] ),
        .I2(\fsm_reg_n_0_[0] ),
        .O(\load_cnt[0]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \load_cnt_reg[0] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(\load_cnt[0]_i_1__0_n_0 ),
        .Q(load_cnt),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rate_reg1_reg[0] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(pipe_tx_rate),
        .Q(rate_reg1[0]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rate_reg1_reg[1] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(rate_reg1[1]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rate_reg2_reg[0] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(rate_reg1[0]),
        .Q(rate_reg2[0]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rate_reg2_reg[1] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(rate_reg1[1]),
        .Q(rate_reg2[1]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rdy_reg1_reg
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(rdy_reg1_reg_0),
        .Q(rdy_reg1),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rdy_reg2_reg
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(rdy_reg1),
        .Q(rdy_reg2),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE start_reg1_reg
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(rate_drp_start),
        .Q(start_reg1),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE start_reg2_reg
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(start_reg1),
        .Q(start_reg2),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE x16_reg1_reg
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(rate_drp_x16),
        .Q(x16_reg1),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE x16_reg2_reg
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(x16_reg1),
        .Q(x16_reg2),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE x16x20_mode_reg1_reg
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(rate_drp_x16x20_mode),
        .Q(x16x20_mode_reg1),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE x16x20_mode_reg2_reg
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(x16x20_mode_reg1),
        .Q(x16x20_mode_reg2),
        .R(SR));
endmodule

module pcie_7x_0_pipe_eq
   (rxeq_adapt_done_reg_0,
    TXPRECURSOR,
    TXMAINCURSOR,
    TXPOSTCURSOR,
    out,
    pipe_pclk_in,
    QPLL_DRP_GEN3);
  output rxeq_adapt_done_reg_0;
  output [4:0]TXPRECURSOR;
  output [6:0]TXMAINCURSOR;
  output [4:0]TXPOSTCURSOR;
  input out;
  input pipe_pclk_in;
  input QPLL_DRP_GEN3;

  wire \FSM_onehot_fsm_rx[1]_i_1_n_0 ;
  wire \FSM_onehot_fsm_rx[1]_i_2_n_0 ;
  wire \FSM_onehot_fsm_rx[3]_i_1_n_0 ;
  wire \FSM_onehot_fsm_rx[4]_i_1_n_0 ;
  wire \FSM_onehot_fsm_rx_reg_n_0_[1] ;
  wire \FSM_onehot_fsm_rx_reg_n_0_[2] ;
  wire \FSM_onehot_fsm_rx_reg_n_0_[3] ;
  wire \FSM_onehot_fsm_rx_reg_n_0_[4] ;
  wire \FSM_onehot_fsm_rx_reg_n_0_[5] ;
  wire \FSM_onehot_fsm_rx_reg_n_0_[6] ;
  wire \FSM_sequential_fsm_tx[1]_i_2_n_0 ;
  wire \FSM_sequential_fsm_tx[2]_i_2_n_0 ;
  wire \FSM_sequential_fsm_tx[2]_i_3_n_0 ;
  wire \FSM_sequential_fsm_tx[2]_i_4_n_0 ;
  wire QPLL_DRP_GEN3;
  wire [6:0]TXMAINCURSOR;
  wire [4:0]TXPOSTCURSOR;
  wire [4:0]TXPRECURSOR;
  wire [2:0]fsm_tx;
  wire [2:0]fsm_tx__0;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire gen3_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire gen3_reg2;
  wire [11:0]in10;
  wire out;
  wire [17:0]p_0_out;
  wire pipe_pclk_in;
  wire rxeq_adapt_done_i_2_n_0;
  wire rxeq_adapt_done_reg_0;
  wire rxeq_adapt_done_reg_i_2_n_0;
  wire rxeq_adapt_done_reg_reg_n_0;
  wire [2:0]rxeq_cnt;
  wire \rxeq_cnt_reg_n_0_[0] ;
  wire \rxeq_cnt_reg_n_0_[1] ;
  wire \rxeq_cnt_reg_n_0_[2] ;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire [1:0]rxeq_control_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire [1:0]rxeq_control_reg2;
  wire [5:0]rxeq_fs;
  wire \rxeq_fs[5]_i_1_n_0 ;
  wire \rxeq_fs_reg_n_0_[0] ;
  wire \rxeq_fs_reg_n_0_[1] ;
  wire \rxeq_fs_reg_n_0_[2] ;
  wire \rxeq_fs_reg_n_0_[3] ;
  wire \rxeq_fs_reg_n_0_[4] ;
  wire \rxeq_fs_reg_n_0_[5] ;
  wire [5:0]rxeq_lf;
  wire \rxeq_lf[5]_i_1_n_0 ;
  wire \rxeq_lf_reg_n_0_[0] ;
  wire \rxeq_lf_reg_n_0_[1] ;
  wire \rxeq_lf_reg_n_0_[2] ;
  wire \rxeq_lf_reg_n_0_[3] ;
  wire \rxeq_lf_reg_n_0_[4] ;
  wire \rxeq_lf_reg_n_0_[5] ;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire [5:0]rxeq_lffs_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire [5:0]rxeq_lffs_reg2;
  wire rxeq_new_txcoeff_req;
  wire rxeq_new_txcoeff_req_reg_n_0;
  wire \rxeq_preset[0]_i_1_n_0 ;
  wire \rxeq_preset[1]_i_1_n_0 ;
  wire \rxeq_preset[2]_i_1_n_0 ;
  wire \rxeq_preset[2]_i_2_n_0 ;
  wire \rxeq_preset[2]_i_3_n_0 ;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire [2:0]rxeq_preset_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire [2:0]rxeq_preset_reg2;
  wire \rxeq_preset_reg_n_0_[0] ;
  wire \rxeq_preset_reg_n_0_[1] ;
  wire \rxeq_preset_reg_n_0_[2] ;
  wire rxeq_preset_valid;
  wire rxeq_scan_i_n_0;
  wire rxeq_scan_i_n_1;
  wire rxeq_scan_i_n_2;
  wire rxeq_scan_i_n_3;
  wire rxeq_scan_i_n_4;
  wire [17:0]rxeq_txcoeff;
  wire \rxeq_txcoeff_reg_n_0_[0] ;
  wire \rxeq_txcoeff_reg_n_0_[1] ;
  wire \rxeq_txcoeff_reg_n_0_[2] ;
  wire \rxeq_txcoeff_reg_n_0_[3] ;
  wire \rxeq_txcoeff_reg_n_0_[4] ;
  wire \rxeq_txcoeff_reg_n_0_[5] ;
  wire [3:0]rxeq_txpreset;
  wire \rxeq_txpreset[3]_i_1_n_0 ;
  wire \rxeq_txpreset[3]_i_3_n_0 ;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire [3:0]rxeq_txpreset_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire [3:0]rxeq_txpreset_reg2;
  wire \rxeq_txpreset_reg_n_0_[0] ;
  wire \rxeq_txpreset_reg_n_0_[1] ;
  wire \rxeq_txpreset_reg_n_0_[2] ;
  wire \rxeq_txpreset_reg_n_0_[3] ;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rxeq_user_en_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rxeq_user_en_reg2;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rxeq_user_mode_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rxeq_user_mode_reg2;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire [17:0]rxeq_user_txcoeff_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire [17:0]rxeq_user_txcoeff_reg2;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire [1:0]txeq_control_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire [1:0]txeq_control_reg2;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire [5:0]txeq_deemph_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire [5:0]txeq_deemph_reg2;
  wire txeq_preset;
  wire \txeq_preset[17]_i_1_n_0 ;
  wire \txeq_preset[3]_i_1_n_0 ;
  wire \txeq_preset[7]_i_1_n_0 ;
  wire \txeq_preset[7]_i_2_n_0 ;
  wire txeq_preset_done;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire [3:0]txeq_preset_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire [3:0]txeq_preset_reg2;
  wire \txeq_preset_reg_n_0_[0] ;
  wire \txeq_preset_reg_n_0_[10] ;
  wire \txeq_preset_reg_n_0_[11] ;
  wire \txeq_preset_reg_n_0_[12] ;
  wire \txeq_preset_reg_n_0_[13] ;
  wire \txeq_preset_reg_n_0_[14] ;
  wire \txeq_preset_reg_n_0_[15] ;
  wire \txeq_preset_reg_n_0_[16] ;
  wire \txeq_preset_reg_n_0_[17] ;
  wire \txeq_preset_reg_n_0_[1] ;
  wire \txeq_preset_reg_n_0_[2] ;
  wire \txeq_preset_reg_n_0_[3] ;
  wire \txeq_preset_reg_n_0_[7] ;
  wire \txeq_preset_reg_n_0_[8] ;
  wire \txeq_preset_reg_n_0_[9] ;
  wire txeq_txcoeff;
  wire \txeq_txcoeff[0]_i_1_n_0 ;
  wire \txeq_txcoeff[0]_i_2_n_0 ;
  wire \txeq_txcoeff[10]_i_1_n_0 ;
  wire \txeq_txcoeff[10]_i_2_n_0 ;
  wire \txeq_txcoeff[11]_i_1_n_0 ;
  wire \txeq_txcoeff[11]_i_2_n_0 ;
  wire \txeq_txcoeff[12]_i_1_n_0 ;
  wire \txeq_txcoeff[12]_i_2_n_0 ;
  wire \txeq_txcoeff[13]_i_1_n_0 ;
  wire \txeq_txcoeff[13]_i_2_n_0 ;
  wire \txeq_txcoeff[14]_i_1_n_0 ;
  wire \txeq_txcoeff[14]_i_2_n_0 ;
  wire \txeq_txcoeff[15]_i_1_n_0 ;
  wire \txeq_txcoeff[15]_i_2_n_0 ;
  wire \txeq_txcoeff[16]_i_1_n_0 ;
  wire \txeq_txcoeff[16]_i_2_n_0 ;
  wire \txeq_txcoeff[17]_i_1_n_0 ;
  wire \txeq_txcoeff[17]_i_2_n_0 ;
  wire \txeq_txcoeff[18]_i_2_n_0 ;
  wire \txeq_txcoeff[18]_i_3_n_0 ;
  wire \txeq_txcoeff[1]_i_1_n_0 ;
  wire \txeq_txcoeff[1]_i_2_n_0 ;
  wire \txeq_txcoeff[2]_i_1_n_0 ;
  wire \txeq_txcoeff[2]_i_2_n_0 ;
  wire \txeq_txcoeff[3]_i_1_n_0 ;
  wire \txeq_txcoeff[3]_i_2_n_0 ;
  wire \txeq_txcoeff[4]_i_1_n_0 ;
  wire \txeq_txcoeff[4]_i_2_n_0 ;
  wire \txeq_txcoeff[5]_i_1_n_0 ;
  wire \txeq_txcoeff[5]_i_2_n_0 ;
  wire \txeq_txcoeff[6]_i_1_n_0 ;
  wire \txeq_txcoeff[6]_i_2_n_0 ;
  wire \txeq_txcoeff[7]_i_1_n_0 ;
  wire \txeq_txcoeff[7]_i_2_n_0 ;
  wire \txeq_txcoeff[8]_i_1_n_0 ;
  wire \txeq_txcoeff[8]_i_2_n_0 ;
  wire \txeq_txcoeff[9]_i_1_n_0 ;
  wire \txeq_txcoeff[9]_i_2_n_0 ;
  wire [1:0]txeq_txcoeff_cnt;
  wire \txeq_txcoeff_cnt_reg_n_0_[0] ;
  wire \txeq_txcoeff_cnt_reg_n_0_[1] ;
  wire \txeq_txcoeff_reg_n_0_[0] ;
  wire \txeq_txcoeff_reg_n_0_[10] ;
  wire \txeq_txcoeff_reg_n_0_[11] ;
  wire \txeq_txcoeff_reg_n_0_[12] ;
  wire \txeq_txcoeff_reg_n_0_[13] ;
  wire \txeq_txcoeff_reg_n_0_[14] ;
  wire \txeq_txcoeff_reg_n_0_[15] ;
  wire \txeq_txcoeff_reg_n_0_[16] ;
  wire \txeq_txcoeff_reg_n_0_[17] ;
  wire \txeq_txcoeff_reg_n_0_[18] ;
  wire \txeq_txcoeff_reg_n_0_[1] ;
  wire \txeq_txcoeff_reg_n_0_[2] ;
  wire \txeq_txcoeff_reg_n_0_[3] ;
  wire \txeq_txcoeff_reg_n_0_[4] ;
  wire \txeq_txcoeff_reg_n_0_[5] ;
  wire \txeq_txcoeff_reg_n_0_[6] ;
  wire \txeq_txcoeff_reg_n_0_[7] ;
  wire \txeq_txcoeff_reg_n_0_[8] ;
  wire \txeq_txcoeff_reg_n_0_[9] ;

  LUT5 #(
    .INIT(32'hABABABAA)) 
    \FSM_onehot_fsm_rx[1]_i_1 
       (.I0(\FSM_onehot_fsm_rx[1]_i_2_n_0 ),
        .I1(rxeq_control_reg2[1]),
        .I2(rxeq_control_reg2[0]),
        .I3(\FSM_onehot_fsm_rx_reg_n_0_[1] ),
        .I4(\FSM_onehot_fsm_rx_reg_n_0_[6] ),
        .O(\FSM_onehot_fsm_rx[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \FSM_onehot_fsm_rx[1]_i_2 
       (.I0(\FSM_onehot_fsm_rx_reg_n_0_[6] ),
        .I1(\FSM_onehot_fsm_rx_reg_n_0_[4] ),
        .I2(\FSM_onehot_fsm_rx_reg_n_0_[5] ),
        .I3(\FSM_onehot_fsm_rx_reg_n_0_[1] ),
        .I4(\FSM_onehot_fsm_rx_reg_n_0_[3] ),
        .I5(\FSM_onehot_fsm_rx_reg_n_0_[2] ),
        .O(\FSM_onehot_fsm_rx[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF8FF88888888)) 
    \FSM_onehot_fsm_rx[3]_i_1 
       (.I0(rxeq_control_reg2[1]),
        .I1(\FSM_onehot_fsm_rx_reg_n_0_[1] ),
        .I2(\rxeq_cnt_reg_n_0_[0] ),
        .I3(\rxeq_cnt_reg_n_0_[1] ),
        .I4(\rxeq_cnt_reg_n_0_[2] ),
        .I5(\FSM_onehot_fsm_rx_reg_n_0_[3] ),
        .O(\FSM_onehot_fsm_rx[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT5 #(
    .INIT(32'h2ABA2AAA)) 
    \FSM_onehot_fsm_rx[4]_i_1 
       (.I0(\FSM_onehot_fsm_rx_reg_n_0_[4] ),
        .I1(\rxeq_cnt_reg_n_0_[0] ),
        .I2(\rxeq_cnt_reg_n_0_[1] ),
        .I3(\rxeq_cnt_reg_n_0_[2] ),
        .I4(\FSM_onehot_fsm_rx_reg_n_0_[3] ),
        .O(\FSM_onehot_fsm_rx[4]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "FSM_RXEQ_PRESET:0000100,FSM_RXEQ_TXCOEFF:0001000,FSM_RXEQ_LF:0010000,FSM_RXEQ_NEW_TXCOEFF_REQ:0100000,FSM_RXEQ_DONE:1000000,FSM_RXEQ_IDLE:0000010,iSTATE:0000001" *) 
  FDSE #(
    .INIT(1'b0)) 
    \FSM_onehot_fsm_rx_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\FSM_onehot_fsm_rx[1]_i_1_n_0 ),
        .Q(\FSM_onehot_fsm_rx_reg_n_0_[1] ),
        .S(out));
  (* FSM_ENCODED_STATES = "FSM_RXEQ_PRESET:0000100,FSM_RXEQ_TXCOEFF:0001000,FSM_RXEQ_LF:0010000,FSM_RXEQ_NEW_TXCOEFF_REQ:0100000,FSM_RXEQ_DONE:1000000,FSM_RXEQ_IDLE:0000010,iSTATE:0000001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_fsm_rx_reg[2] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_scan_i_n_4),
        .Q(\FSM_onehot_fsm_rx_reg_n_0_[2] ),
        .R(out));
  (* FSM_ENCODED_STATES = "FSM_RXEQ_PRESET:0000100,FSM_RXEQ_TXCOEFF:0001000,FSM_RXEQ_LF:0010000,FSM_RXEQ_NEW_TXCOEFF_REQ:0100000,FSM_RXEQ_DONE:1000000,FSM_RXEQ_IDLE:0000010,iSTATE:0000001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_fsm_rx_reg[3] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\FSM_onehot_fsm_rx[3]_i_1_n_0 ),
        .Q(\FSM_onehot_fsm_rx_reg_n_0_[3] ),
        .R(out));
  (* FSM_ENCODED_STATES = "FSM_RXEQ_PRESET:0000100,FSM_RXEQ_TXCOEFF:0001000,FSM_RXEQ_LF:0010000,FSM_RXEQ_NEW_TXCOEFF_REQ:0100000,FSM_RXEQ_DONE:1000000,FSM_RXEQ_IDLE:0000010,iSTATE:0000001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_fsm_rx_reg[4] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\FSM_onehot_fsm_rx[4]_i_1_n_0 ),
        .Q(\FSM_onehot_fsm_rx_reg_n_0_[4] ),
        .R(out));
  (* FSM_ENCODED_STATES = "FSM_RXEQ_PRESET:0000100,FSM_RXEQ_TXCOEFF:0001000,FSM_RXEQ_LF:0010000,FSM_RXEQ_NEW_TXCOEFF_REQ:0100000,FSM_RXEQ_DONE:1000000,FSM_RXEQ_IDLE:0000010,iSTATE:0000001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_fsm_rx_reg[5] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_scan_i_n_3),
        .Q(\FSM_onehot_fsm_rx_reg_n_0_[5] ),
        .R(out));
  (* FSM_ENCODED_STATES = "FSM_RXEQ_PRESET:0000100,FSM_RXEQ_TXCOEFF:0001000,FSM_RXEQ_LF:0010000,FSM_RXEQ_NEW_TXCOEFF_REQ:0100000,FSM_RXEQ_DONE:1000000,FSM_RXEQ_IDLE:0000010,iSTATE:0000001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_fsm_rx_reg[6] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_scan_i_n_2),
        .Q(\FSM_onehot_fsm_rx_reg_n_0_[6] ),
        .R(out));
  LUT6 #(
    .INIT(64'hC04FC043C04FF04F)) 
    \FSM_sequential_fsm_tx[0]_i_1 
       (.I0(\FSM_sequential_fsm_tx[1]_i_2_n_0 ),
        .I1(fsm_tx[0]),
        .I2(fsm_tx[1]),
        .I3(fsm_tx[2]),
        .I4(txeq_control_reg2[1]),
        .I5(txeq_control_reg2[0]),
        .O(fsm_tx__0[0]));
  LUT6 #(
    .INIT(64'h3F4C3F7C3F7C334C)) 
    \FSM_sequential_fsm_tx[1]_i_1 
       (.I0(\FSM_sequential_fsm_tx[1]_i_2_n_0 ),
        .I1(fsm_tx[1]),
        .I2(fsm_tx[0]),
        .I3(fsm_tx[2]),
        .I4(txeq_control_reg2[1]),
        .I5(txeq_control_reg2[0]),
        .O(fsm_tx__0[1]));
  LUT2 #(
    .INIT(4'h2)) 
    \FSM_sequential_fsm_tx[1]_i_2 
       (.I0(\txeq_txcoeff_cnt_reg_n_0_[1] ),
        .I1(\txeq_txcoeff_cnt_reg_n_0_[0] ),
        .O(\FSM_sequential_fsm_tx[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hA8A8A8A8A8AAA8A8)) 
    \FSM_sequential_fsm_tx[2]_i_1 
       (.I0(\FSM_sequential_fsm_tx[2]_i_2_n_0 ),
        .I1(\FSM_sequential_fsm_tx[2]_i_3_n_0 ),
        .I2(fsm_tx[2]),
        .I3(\FSM_sequential_fsm_tx[2]_i_4_n_0 ),
        .I4(\txeq_txcoeff_cnt_reg_n_0_[1] ),
        .I5(\txeq_txcoeff_cnt_reg_n_0_[0] ),
        .O(fsm_tx__0[2]));
  LUT5 #(
    .INIT(32'h7777FFF7)) 
    \FSM_sequential_fsm_tx[2]_i_2 
       (.I0(fsm_tx[1]),
        .I1(fsm_tx[2]),
        .I2(txeq_control_reg2[1]),
        .I3(txeq_control_reg2[0]),
        .I4(fsm_tx[0]),
        .O(\FSM_sequential_fsm_tx[2]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h08F00800)) 
    \FSM_sequential_fsm_tx[2]_i_3 
       (.I0(txeq_control_reg2[1]),
        .I1(txeq_control_reg2[0]),
        .I2(fsm_tx[1]),
        .I3(fsm_tx[0]),
        .I4(txeq_preset_done),
        .O(\FSM_sequential_fsm_tx[2]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \FSM_sequential_fsm_tx[2]_i_4 
       (.I0(fsm_tx[0]),
        .I1(fsm_tx[1]),
        .O(\FSM_sequential_fsm_tx[2]_i_4_n_0 ));
  (* FSM_ENCODED_STATES = "FSM_TXEQ_QUERY:101,FSM_TXEQ_PRESET:010,FSM_TXEQ_TXCOEFF:011,FSM_TXEQ_REMAP:100,FSM_TXEQ_DONE:110,FSM_TXEQ_IDLE:001,iSTATE:000" *) 
  FDSE #(
    .INIT(1'b0)) 
    \FSM_sequential_fsm_tx_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(fsm_tx__0[0]),
        .Q(fsm_tx[0]),
        .S(out));
  (* FSM_ENCODED_STATES = "FSM_TXEQ_QUERY:101,FSM_TXEQ_PRESET:010,FSM_TXEQ_TXCOEFF:011,FSM_TXEQ_REMAP:100,FSM_TXEQ_DONE:110,FSM_TXEQ_IDLE:001,iSTATE:000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_fsm_tx_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(fsm_tx__0[1]),
        .Q(fsm_tx[1]),
        .R(out));
  (* FSM_ENCODED_STATES = "FSM_TXEQ_QUERY:101,FSM_TXEQ_PRESET:010,FSM_TXEQ_TXCOEFF:011,FSM_TXEQ_REMAP:100,FSM_TXEQ_DONE:110,FSM_TXEQ_IDLE:001,iSTATE:000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_fsm_tx_reg[2] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(fsm_tx__0[2]),
        .Q(fsm_tx[2]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE gen3_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(QPLL_DRP_GEN3),
        .Q(gen3_reg1),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE gen3_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(gen3_reg1),
        .Q(gen3_reg2),
        .R(out));
  LUT2 #(
    .INIT(4'h8)) 
    \gtx_channel.gtxe2_channel_i_i_23 
       (.I0(gen3_reg2),
        .I1(\txeq_txcoeff_reg_n_0_[17] ),
        .O(TXPOSTCURSOR[4]));
  LUT2 #(
    .INIT(4'h8)) 
    \gtx_channel.gtxe2_channel_i_i_24 
       (.I0(gen3_reg2),
        .I1(\txeq_txcoeff_reg_n_0_[16] ),
        .O(TXPOSTCURSOR[3]));
  LUT2 #(
    .INIT(4'h8)) 
    \gtx_channel.gtxe2_channel_i_i_25 
       (.I0(gen3_reg2),
        .I1(\txeq_txcoeff_reg_n_0_[15] ),
        .O(TXPOSTCURSOR[2]));
  LUT2 #(
    .INIT(4'h8)) 
    \gtx_channel.gtxe2_channel_i_i_26 
       (.I0(gen3_reg2),
        .I1(\txeq_txcoeff_reg_n_0_[14] ),
        .O(TXPOSTCURSOR[1]));
  LUT2 #(
    .INIT(4'h8)) 
    \gtx_channel.gtxe2_channel_i_i_27 
       (.I0(gen3_reg2),
        .I1(\txeq_txcoeff_reg_n_0_[13] ),
        .O(TXPOSTCURSOR[0]));
  LUT2 #(
    .INIT(4'h8)) 
    \gtx_channel.gtxe2_channel_i_i_28 
       (.I0(gen3_reg2),
        .I1(\txeq_txcoeff_reg_n_0_[4] ),
        .O(TXPRECURSOR[4]));
  LUT2 #(
    .INIT(4'h8)) 
    \gtx_channel.gtxe2_channel_i_i_29 
       (.I0(gen3_reg2),
        .I1(\txeq_txcoeff_reg_n_0_[3] ),
        .O(TXPRECURSOR[3]));
  LUT2 #(
    .INIT(4'h8)) 
    \gtx_channel.gtxe2_channel_i_i_30 
       (.I0(gen3_reg2),
        .I1(\txeq_txcoeff_reg_n_0_[2] ),
        .O(TXPRECURSOR[2]));
  LUT2 #(
    .INIT(4'h8)) 
    \gtx_channel.gtxe2_channel_i_i_31 
       (.I0(gen3_reg2),
        .I1(\txeq_txcoeff_reg_n_0_[1] ),
        .O(TXPRECURSOR[1]));
  LUT2 #(
    .INIT(4'h8)) 
    \gtx_channel.gtxe2_channel_i_i_32 
       (.I0(\txeq_txcoeff_reg_n_0_[0] ),
        .I1(gen3_reg2),
        .O(TXPRECURSOR[0]));
  LUT2 #(
    .INIT(4'h8)) 
    \gtx_channel.gtxe2_channel_i_i_33 
       (.I0(gen3_reg2),
        .I1(\txeq_txcoeff_reg_n_0_[12] ),
        .O(TXMAINCURSOR[6]));
  LUT2 #(
    .INIT(4'h8)) 
    \gtx_channel.gtxe2_channel_i_i_34 
       (.I0(gen3_reg2),
        .I1(\txeq_txcoeff_reg_n_0_[11] ),
        .O(TXMAINCURSOR[5]));
  LUT2 #(
    .INIT(4'h8)) 
    \gtx_channel.gtxe2_channel_i_i_35 
       (.I0(gen3_reg2),
        .I1(\txeq_txcoeff_reg_n_0_[10] ),
        .O(TXMAINCURSOR[4]));
  LUT2 #(
    .INIT(4'h8)) 
    \gtx_channel.gtxe2_channel_i_i_36 
       (.I0(gen3_reg2),
        .I1(\txeq_txcoeff_reg_n_0_[9] ),
        .O(TXMAINCURSOR[3]));
  LUT2 #(
    .INIT(4'h8)) 
    \gtx_channel.gtxe2_channel_i_i_37 
       (.I0(gen3_reg2),
        .I1(\txeq_txcoeff_reg_n_0_[8] ),
        .O(TXMAINCURSOR[2]));
  LUT2 #(
    .INIT(4'h8)) 
    \gtx_channel.gtxe2_channel_i_i_38 
       (.I0(gen3_reg2),
        .I1(\txeq_txcoeff_reg_n_0_[7] ),
        .O(TXMAINCURSOR[1]));
  LUT2 #(
    .INIT(4'h8)) 
    \gtx_channel.gtxe2_channel_i_i_39 
       (.I0(gen3_reg2),
        .I1(\txeq_txcoeff_reg_n_0_[6] ),
        .O(TXMAINCURSOR[0]));
  LUT6 #(
    .INIT(64'hFFFFFFFEFFFFFFFF)) 
    rxeq_adapt_done_i_2
       (.I0(\FSM_onehot_fsm_rx_reg_n_0_[5] ),
        .I1(\FSM_onehot_fsm_rx_reg_n_0_[4] ),
        .I2(\FSM_onehot_fsm_rx_reg_n_0_[2] ),
        .I3(\FSM_onehot_fsm_rx_reg_n_0_[1] ),
        .I4(\FSM_onehot_fsm_rx_reg_n_0_[3] ),
        .I5(\FSM_onehot_fsm_rx_reg_n_0_[6] ),
        .O(rxeq_adapt_done_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    rxeq_adapt_done_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_scan_i_n_1),
        .Q(rxeq_adapt_done_reg_0),
        .R(out));
  LUT3 #(
    .INIT(8'h08)) 
    rxeq_adapt_done_reg_i_2
       (.I0(rxeq_control_reg2[0]),
        .I1(\FSM_onehot_fsm_rx_reg_n_0_[1] ),
        .I2(rxeq_control_reg2[1]),
        .O(rxeq_adapt_done_reg_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    rxeq_adapt_done_reg_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_scan_i_n_0),
        .Q(rxeq_adapt_done_reg_reg_n_0),
        .R(out));
  LUT5 #(
    .INIT(32'h8888FFF8)) 
    \rxeq_cnt[0]_i_1 
       (.I0(rxeq_control_reg2[1]),
        .I1(\FSM_onehot_fsm_rx_reg_n_0_[1] ),
        .I2(\FSM_onehot_fsm_rx_reg_n_0_[3] ),
        .I3(\FSM_onehot_fsm_rx_reg_n_0_[4] ),
        .I4(\rxeq_cnt_reg_n_0_[0] ),
        .O(rxeq_cnt[0]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'h6660)) 
    \rxeq_cnt[1]_i_1 
       (.I0(\rxeq_cnt_reg_n_0_[1] ),
        .I1(\rxeq_cnt_reg_n_0_[0] ),
        .I2(\FSM_onehot_fsm_rx_reg_n_0_[4] ),
        .I3(\FSM_onehot_fsm_rx_reg_n_0_[3] ),
        .O(rxeq_cnt[1]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT5 #(
    .INIT(32'h78787800)) 
    \rxeq_cnt[2]_i_1 
       (.I0(\rxeq_cnt_reg_n_0_[0] ),
        .I1(\rxeq_cnt_reg_n_0_[1] ),
        .I2(\rxeq_cnt_reg_n_0_[2] ),
        .I3(\FSM_onehot_fsm_rx_reg_n_0_[4] ),
        .I4(\FSM_onehot_fsm_rx_reg_n_0_[3] ),
        .O(rxeq_cnt[2]));
  FDRE #(
    .INIT(1'b0)) 
    \rxeq_cnt_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_cnt[0]),
        .Q(\rxeq_cnt_reg_n_0_[0] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \rxeq_cnt_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_cnt[1]),
        .Q(\rxeq_cnt_reg_n_0_[1] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \rxeq_cnt_reg[2] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_cnt[2]),
        .Q(\rxeq_cnt_reg_n_0_[2] ),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_control_reg1_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(rxeq_control_reg1[0]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_control_reg1_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(rxeq_control_reg1[1]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_control_reg2_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_control_reg1[0]),
        .Q(rxeq_control_reg2[0]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_control_reg2_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_control_reg1[1]),
        .Q(rxeq_control_reg2[1]),
        .R(out));
  LUT2 #(
    .INIT(4'h8)) 
    \rxeq_fs[0]_i_1 
       (.I0(\FSM_onehot_fsm_rx_reg_n_0_[1] ),
        .I1(rxeq_lffs_reg2[0]),
        .O(rxeq_fs[0]));
  LUT2 #(
    .INIT(4'h8)) 
    \rxeq_fs[1]_i_1 
       (.I0(\FSM_onehot_fsm_rx_reg_n_0_[1] ),
        .I1(rxeq_lffs_reg2[1]),
        .O(rxeq_fs[1]));
  LUT2 #(
    .INIT(4'h8)) 
    \rxeq_fs[2]_i_1 
       (.I0(\FSM_onehot_fsm_rx_reg_n_0_[1] ),
        .I1(rxeq_lffs_reg2[2]),
        .O(rxeq_fs[2]));
  LUT2 #(
    .INIT(4'h8)) 
    \rxeq_fs[3]_i_1 
       (.I0(\FSM_onehot_fsm_rx_reg_n_0_[1] ),
        .I1(rxeq_lffs_reg2[3]),
        .O(rxeq_fs[3]));
  LUT2 #(
    .INIT(4'h8)) 
    \rxeq_fs[4]_i_1 
       (.I0(\FSM_onehot_fsm_rx_reg_n_0_[1] ),
        .I1(rxeq_lffs_reg2[4]),
        .O(rxeq_fs[4]));
  LUT3 #(
    .INIT(8'hF8)) 
    \rxeq_fs[5]_i_1 
       (.I0(rxeq_control_reg2[1]),
        .I1(\FSM_onehot_fsm_rx_reg_n_0_[1] ),
        .I2(\FSM_onehot_fsm_rx[1]_i_2_n_0 ),
        .O(\rxeq_fs[5]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rxeq_fs[5]_i_2 
       (.I0(\FSM_onehot_fsm_rx_reg_n_0_[1] ),
        .I1(rxeq_lffs_reg2[5]),
        .O(rxeq_fs[5]));
  FDRE #(
    .INIT(1'b0)) 
    \rxeq_fs_reg[0] 
       (.C(pipe_pclk_in),
        .CE(\rxeq_fs[5]_i_1_n_0 ),
        .D(rxeq_fs[0]),
        .Q(\rxeq_fs_reg_n_0_[0] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \rxeq_fs_reg[1] 
       (.C(pipe_pclk_in),
        .CE(\rxeq_fs[5]_i_1_n_0 ),
        .D(rxeq_fs[1]),
        .Q(\rxeq_fs_reg_n_0_[1] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \rxeq_fs_reg[2] 
       (.C(pipe_pclk_in),
        .CE(\rxeq_fs[5]_i_1_n_0 ),
        .D(rxeq_fs[2]),
        .Q(\rxeq_fs_reg_n_0_[2] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \rxeq_fs_reg[3] 
       (.C(pipe_pclk_in),
        .CE(\rxeq_fs[5]_i_1_n_0 ),
        .D(rxeq_fs[3]),
        .Q(\rxeq_fs_reg_n_0_[3] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \rxeq_fs_reg[4] 
       (.C(pipe_pclk_in),
        .CE(\rxeq_fs[5]_i_1_n_0 ),
        .D(rxeq_fs[4]),
        .Q(\rxeq_fs_reg_n_0_[4] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \rxeq_fs_reg[5] 
       (.C(pipe_pclk_in),
        .CE(\rxeq_fs[5]_i_1_n_0 ),
        .D(rxeq_fs[5]),
        .Q(\rxeq_fs_reg_n_0_[5] ),
        .R(out));
  LUT2 #(
    .INIT(4'h8)) 
    \rxeq_lf[0]_i_1 
       (.I0(\FSM_onehot_fsm_rx_reg_n_0_[4] ),
        .I1(rxeq_lffs_reg2[0]),
        .O(rxeq_lf[0]));
  LUT2 #(
    .INIT(4'h8)) 
    \rxeq_lf[1]_i_1 
       (.I0(\FSM_onehot_fsm_rx_reg_n_0_[4] ),
        .I1(rxeq_lffs_reg2[1]),
        .O(rxeq_lf[1]));
  LUT2 #(
    .INIT(4'h8)) 
    \rxeq_lf[2]_i_1 
       (.I0(\FSM_onehot_fsm_rx_reg_n_0_[4] ),
        .I1(rxeq_lffs_reg2[2]),
        .O(rxeq_lf[2]));
  LUT2 #(
    .INIT(4'h8)) 
    \rxeq_lf[3]_i_1 
       (.I0(\FSM_onehot_fsm_rx_reg_n_0_[4] ),
        .I1(rxeq_lffs_reg2[3]),
        .O(rxeq_lf[3]));
  LUT2 #(
    .INIT(4'h8)) 
    \rxeq_lf[4]_i_1 
       (.I0(\FSM_onehot_fsm_rx_reg_n_0_[4] ),
        .I1(rxeq_lffs_reg2[4]),
        .O(rxeq_lf[4]));
  LUT5 #(
    .INIT(32'hEAAAAAAA)) 
    \rxeq_lf[5]_i_1 
       (.I0(\FSM_onehot_fsm_rx[1]_i_2_n_0 ),
        .I1(\rxeq_cnt_reg_n_0_[2] ),
        .I2(\rxeq_cnt_reg_n_0_[1] ),
        .I3(\rxeq_cnt_reg_n_0_[0] ),
        .I4(\FSM_onehot_fsm_rx_reg_n_0_[4] ),
        .O(\rxeq_lf[5]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rxeq_lf[5]_i_2 
       (.I0(\FSM_onehot_fsm_rx_reg_n_0_[4] ),
        .I1(rxeq_lffs_reg2[5]),
        .O(rxeq_lf[5]));
  FDRE #(
    .INIT(1'b0)) 
    \rxeq_lf_reg[0] 
       (.C(pipe_pclk_in),
        .CE(\rxeq_lf[5]_i_1_n_0 ),
        .D(rxeq_lf[0]),
        .Q(\rxeq_lf_reg_n_0_[0] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \rxeq_lf_reg[1] 
       (.C(pipe_pclk_in),
        .CE(\rxeq_lf[5]_i_1_n_0 ),
        .D(rxeq_lf[1]),
        .Q(\rxeq_lf_reg_n_0_[1] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \rxeq_lf_reg[2] 
       (.C(pipe_pclk_in),
        .CE(\rxeq_lf[5]_i_1_n_0 ),
        .D(rxeq_lf[2]),
        .Q(\rxeq_lf_reg_n_0_[2] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \rxeq_lf_reg[3] 
       (.C(pipe_pclk_in),
        .CE(\rxeq_lf[5]_i_1_n_0 ),
        .D(rxeq_lf[3]),
        .Q(\rxeq_lf_reg_n_0_[3] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \rxeq_lf_reg[4] 
       (.C(pipe_pclk_in),
        .CE(\rxeq_lf[5]_i_1_n_0 ),
        .D(rxeq_lf[4]),
        .Q(\rxeq_lf_reg_n_0_[4] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \rxeq_lf_reg[5] 
       (.C(pipe_pclk_in),
        .CE(\rxeq_lf[5]_i_1_n_0 ),
        .D(rxeq_lf[5]),
        .Q(\rxeq_lf_reg_n_0_[5] ),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_lffs_reg1_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(rxeq_lffs_reg1[0]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_lffs_reg1_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(rxeq_lffs_reg1[1]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_lffs_reg1_reg[2] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(rxeq_lffs_reg1[2]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_lffs_reg1_reg[3] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(rxeq_lffs_reg1[3]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_lffs_reg1_reg[4] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(rxeq_lffs_reg1[4]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_lffs_reg1_reg[5] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(rxeq_lffs_reg1[5]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_lffs_reg2_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_lffs_reg1[0]),
        .Q(rxeq_lffs_reg2[0]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_lffs_reg2_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_lffs_reg1[1]),
        .Q(rxeq_lffs_reg2[1]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_lffs_reg2_reg[2] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_lffs_reg1[2]),
        .Q(rxeq_lffs_reg2[2]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_lffs_reg2_reg[3] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_lffs_reg1[3]),
        .Q(rxeq_lffs_reg2[3]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_lffs_reg2_reg[4] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_lffs_reg1[4]),
        .Q(rxeq_lffs_reg2[4]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_lffs_reg2_reg[5] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_lffs_reg1[5]),
        .Q(rxeq_lffs_reg2[5]),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    rxeq_new_txcoeff_req_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_new_txcoeff_req),
        .Q(rxeq_new_txcoeff_req_reg_n_0),
        .R(out));
  LUT5 #(
    .INIT(32'hA8FFA800)) 
    \rxeq_preset[0]_i_1 
       (.I0(rxeq_preset_reg2[0]),
        .I1(\FSM_onehot_fsm_rx_reg_n_0_[2] ),
        .I2(\FSM_onehot_fsm_rx_reg_n_0_[1] ),
        .I3(\rxeq_preset[2]_i_2_n_0 ),
        .I4(\rxeq_preset_reg_n_0_[0] ),
        .O(\rxeq_preset[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hA8FFA800)) 
    \rxeq_preset[1]_i_1 
       (.I0(rxeq_preset_reg2[1]),
        .I1(\FSM_onehot_fsm_rx_reg_n_0_[2] ),
        .I2(\FSM_onehot_fsm_rx_reg_n_0_[1] ),
        .I3(\rxeq_preset[2]_i_2_n_0 ),
        .I4(\rxeq_preset_reg_n_0_[1] ),
        .O(\rxeq_preset[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hA8FFA800)) 
    \rxeq_preset[2]_i_1 
       (.I0(rxeq_preset_reg2[2]),
        .I1(\FSM_onehot_fsm_rx_reg_n_0_[2] ),
        .I2(\FSM_onehot_fsm_rx_reg_n_0_[1] ),
        .I3(\rxeq_preset[2]_i_2_n_0 ),
        .I4(\rxeq_preset_reg_n_0_[2] ),
        .O(\rxeq_preset[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF0100)) 
    \rxeq_preset[2]_i_2 
       (.I0(\FSM_onehot_fsm_rx_reg_n_0_[6] ),
        .I1(\FSM_onehot_fsm_rx_reg_n_0_[4] ),
        .I2(\FSM_onehot_fsm_rx_reg_n_0_[5] ),
        .I3(\rxeq_preset[2]_i_3_n_0 ),
        .I4(rxeq_adapt_done_reg_i_2_n_0),
        .I5(\FSM_onehot_fsm_rx_reg_n_0_[2] ),
        .O(\rxeq_preset[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \rxeq_preset[2]_i_3 
       (.I0(\FSM_onehot_fsm_rx_reg_n_0_[1] ),
        .I1(\FSM_onehot_fsm_rx_reg_n_0_[3] ),
        .O(\rxeq_preset[2]_i_3_n_0 ));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_preset_reg1_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(rxeq_preset_reg1[0]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_preset_reg1_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(rxeq_preset_reg1[1]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_preset_reg1_reg[2] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(rxeq_preset_reg1[2]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_preset_reg2_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_preset_reg1[0]),
        .Q(rxeq_preset_reg2[0]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_preset_reg2_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_preset_reg1[1]),
        .Q(rxeq_preset_reg2[1]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_preset_reg2_reg[2] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_preset_reg1[2]),
        .Q(rxeq_preset_reg2[2]),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \rxeq_preset_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\rxeq_preset[0]_i_1_n_0 ),
        .Q(\rxeq_preset_reg_n_0_[0] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \rxeq_preset_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\rxeq_preset[1]_i_1_n_0 ),
        .Q(\rxeq_preset_reg_n_0_[1] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \rxeq_preset_reg[2] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\rxeq_preset[2]_i_1_n_0 ),
        .Q(\rxeq_preset_reg_n_0_[2] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    rxeq_preset_valid_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\FSM_onehot_fsm_rx_reg_n_0_[2] ),
        .Q(rxeq_preset_valid),
        .R(out));
  pcie_7x_0_rxeq_scan rxeq_scan_i
       (.D({rxeq_scan_i_n_2,rxeq_scan_i_n_3,rxeq_scan_i_n_4}),
        .\FSM_onehot_fsm_rx_reg[5] ({\rxeq_cnt_reg_n_0_[2] ,\rxeq_cnt_reg_n_0_[1] ,\rxeq_cnt_reg_n_0_[0] }),
        .Q({\FSM_onehot_fsm_rx_reg_n_0_[6] ,\FSM_onehot_fsm_rx_reg_n_0_[5] ,\FSM_onehot_fsm_rx_reg_n_0_[4] ,\FSM_onehot_fsm_rx_reg_n_0_[2] ,\FSM_onehot_fsm_rx_reg_n_0_[1] }),
        .adapt_done_cnt_reg_0(rxeq_control_reg2),
        .adapt_done_reg_0(rxeq_scan_i_n_0),
        .\fs_reg1_reg[5]_0 ({\rxeq_fs_reg_n_0_[5] ,\rxeq_fs_reg_n_0_[4] ,\rxeq_fs_reg_n_0_[3] ,\rxeq_fs_reg_n_0_[2] ,\rxeq_fs_reg_n_0_[1] ,\rxeq_fs_reg_n_0_[0] }),
        .\lf_reg1_reg[5]_0 ({\rxeq_lf_reg_n_0_[5] ,\rxeq_lf_reg_n_0_[4] ,\rxeq_lf_reg_n_0_[3] ,\rxeq_lf_reg_n_0_[2] ,\rxeq_lf_reg_n_0_[1] ,\rxeq_lf_reg_n_0_[0] }),
        .new_txcoeff_done_reg_0(rxeq_scan_i_n_1),
        .new_txcoeff_req_reg1_reg_0(rxeq_new_txcoeff_req_reg_n_0),
        .out(out),
        .pipe_pclk_in(pipe_pclk_in),
        .\preset_reg1_reg[2]_0 ({\rxeq_preset_reg_n_0_[2] ,\rxeq_preset_reg_n_0_[1] ,\rxeq_preset_reg_n_0_[0] }),
        .rxeq_adapt_done_reg(rxeq_adapt_done_i_2_n_0),
        .rxeq_adapt_done_reg_0(rxeq_adapt_done_reg_0),
        .rxeq_adapt_done_reg_reg(\FSM_onehot_fsm_rx[1]_i_2_n_0 ),
        .rxeq_adapt_done_reg_reg_0(rxeq_adapt_done_reg_i_2_n_0),
        .rxeq_adapt_done_reg_reg_1(rxeq_adapt_done_reg_reg_n_0),
        .rxeq_new_txcoeff_req(rxeq_new_txcoeff_req),
        .rxeq_preset_valid(rxeq_preset_valid),
        .\txcoeff_reg1_reg[17]_0 ({in10,\rxeq_txcoeff_reg_n_0_[5] ,\rxeq_txcoeff_reg_n_0_[4] ,\rxeq_txcoeff_reg_n_0_[3] ,\rxeq_txcoeff_reg_n_0_[2] ,\rxeq_txcoeff_reg_n_0_[1] ,\rxeq_txcoeff_reg_n_0_[0] }),
        .\txpreset_reg1_reg[3]_0 ({\rxeq_txpreset_reg_n_0_[3] ,\rxeq_txpreset_reg_n_0_[2] ,\rxeq_txpreset_reg_n_0_[1] ,\rxeq_txpreset_reg_n_0_[0] }));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hA8)) 
    \rxeq_txcoeff[0]_i_1 
       (.I0(in10[0]),
        .I1(\FSM_onehot_fsm_rx_reg_n_0_[3] ),
        .I2(\FSM_onehot_fsm_rx_reg_n_0_[1] ),
        .O(rxeq_txcoeff[0]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hA8)) 
    \rxeq_txcoeff[10]_i_1 
       (.I0(in10[10]),
        .I1(\FSM_onehot_fsm_rx_reg_n_0_[3] ),
        .I2(\FSM_onehot_fsm_rx_reg_n_0_[1] ),
        .O(rxeq_txcoeff[10]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hA8)) 
    \rxeq_txcoeff[11]_i_1 
       (.I0(in10[11]),
        .I1(\FSM_onehot_fsm_rx_reg_n_0_[3] ),
        .I2(\FSM_onehot_fsm_rx_reg_n_0_[1] ),
        .O(rxeq_txcoeff[11]));
  LUT3 #(
    .INIT(8'hA8)) 
    \rxeq_txcoeff[12]_i_1 
       (.I0(txeq_deemph_reg2[0]),
        .I1(\FSM_onehot_fsm_rx_reg_n_0_[3] ),
        .I2(\FSM_onehot_fsm_rx_reg_n_0_[1] ),
        .O(rxeq_txcoeff[12]));
  LUT3 #(
    .INIT(8'hA8)) 
    \rxeq_txcoeff[13]_i_1 
       (.I0(txeq_deemph_reg2[1]),
        .I1(\FSM_onehot_fsm_rx_reg_n_0_[3] ),
        .I2(\FSM_onehot_fsm_rx_reg_n_0_[1] ),
        .O(rxeq_txcoeff[13]));
  LUT3 #(
    .INIT(8'hA8)) 
    \rxeq_txcoeff[14]_i_1 
       (.I0(txeq_deemph_reg2[2]),
        .I1(\FSM_onehot_fsm_rx_reg_n_0_[3] ),
        .I2(\FSM_onehot_fsm_rx_reg_n_0_[1] ),
        .O(rxeq_txcoeff[14]));
  LUT3 #(
    .INIT(8'hA8)) 
    \rxeq_txcoeff[15]_i_1 
       (.I0(txeq_deemph_reg2[3]),
        .I1(\FSM_onehot_fsm_rx_reg_n_0_[3] ),
        .I2(\FSM_onehot_fsm_rx_reg_n_0_[1] ),
        .O(rxeq_txcoeff[15]));
  LUT3 #(
    .INIT(8'hA8)) 
    \rxeq_txcoeff[16]_i_1 
       (.I0(txeq_deemph_reg2[4]),
        .I1(\FSM_onehot_fsm_rx_reg_n_0_[3] ),
        .I2(\FSM_onehot_fsm_rx_reg_n_0_[1] ),
        .O(rxeq_txcoeff[16]));
  LUT3 #(
    .INIT(8'hA8)) 
    \rxeq_txcoeff[17]_i_1 
       (.I0(txeq_deemph_reg2[5]),
        .I1(\FSM_onehot_fsm_rx_reg_n_0_[3] ),
        .I2(\FSM_onehot_fsm_rx_reg_n_0_[1] ),
        .O(rxeq_txcoeff[17]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hA8)) 
    \rxeq_txcoeff[1]_i_1 
       (.I0(in10[1]),
        .I1(\FSM_onehot_fsm_rx_reg_n_0_[3] ),
        .I2(\FSM_onehot_fsm_rx_reg_n_0_[1] ),
        .O(rxeq_txcoeff[1]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hA8)) 
    \rxeq_txcoeff[2]_i_1 
       (.I0(in10[2]),
        .I1(\FSM_onehot_fsm_rx_reg_n_0_[3] ),
        .I2(\FSM_onehot_fsm_rx_reg_n_0_[1] ),
        .O(rxeq_txcoeff[2]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hA8)) 
    \rxeq_txcoeff[3]_i_1 
       (.I0(in10[3]),
        .I1(\FSM_onehot_fsm_rx_reg_n_0_[3] ),
        .I2(\FSM_onehot_fsm_rx_reg_n_0_[1] ),
        .O(rxeq_txcoeff[3]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hA8)) 
    \rxeq_txcoeff[4]_i_1 
       (.I0(in10[4]),
        .I1(\FSM_onehot_fsm_rx_reg_n_0_[3] ),
        .I2(\FSM_onehot_fsm_rx_reg_n_0_[1] ),
        .O(rxeq_txcoeff[4]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hA8)) 
    \rxeq_txcoeff[5]_i_1 
       (.I0(in10[5]),
        .I1(\FSM_onehot_fsm_rx_reg_n_0_[3] ),
        .I2(\FSM_onehot_fsm_rx_reg_n_0_[1] ),
        .O(rxeq_txcoeff[5]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hA8)) 
    \rxeq_txcoeff[6]_i_1 
       (.I0(in10[6]),
        .I1(\FSM_onehot_fsm_rx_reg_n_0_[3] ),
        .I2(\FSM_onehot_fsm_rx_reg_n_0_[1] ),
        .O(rxeq_txcoeff[6]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hA8)) 
    \rxeq_txcoeff[7]_i_1 
       (.I0(in10[7]),
        .I1(\FSM_onehot_fsm_rx_reg_n_0_[3] ),
        .I2(\FSM_onehot_fsm_rx_reg_n_0_[1] ),
        .O(rxeq_txcoeff[7]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hA8)) 
    \rxeq_txcoeff[8]_i_1 
       (.I0(in10[8]),
        .I1(\FSM_onehot_fsm_rx_reg_n_0_[3] ),
        .I2(\FSM_onehot_fsm_rx_reg_n_0_[1] ),
        .O(rxeq_txcoeff[8]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hA8)) 
    \rxeq_txcoeff[9]_i_1 
       (.I0(in10[9]),
        .I1(\FSM_onehot_fsm_rx_reg_n_0_[3] ),
        .I2(\FSM_onehot_fsm_rx_reg_n_0_[1] ),
        .O(rxeq_txcoeff[9]));
  FDRE #(
    .INIT(1'b0)) 
    \rxeq_txcoeff_reg[0] 
       (.C(pipe_pclk_in),
        .CE(\rxeq_txpreset[3]_i_1_n_0 ),
        .D(rxeq_txcoeff[0]),
        .Q(\rxeq_txcoeff_reg_n_0_[0] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \rxeq_txcoeff_reg[10] 
       (.C(pipe_pclk_in),
        .CE(\rxeq_txpreset[3]_i_1_n_0 ),
        .D(rxeq_txcoeff[10]),
        .Q(in10[4]),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \rxeq_txcoeff_reg[11] 
       (.C(pipe_pclk_in),
        .CE(\rxeq_txpreset[3]_i_1_n_0 ),
        .D(rxeq_txcoeff[11]),
        .Q(in10[5]),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \rxeq_txcoeff_reg[12] 
       (.C(pipe_pclk_in),
        .CE(\rxeq_txpreset[3]_i_1_n_0 ),
        .D(rxeq_txcoeff[12]),
        .Q(in10[6]),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \rxeq_txcoeff_reg[13] 
       (.C(pipe_pclk_in),
        .CE(\rxeq_txpreset[3]_i_1_n_0 ),
        .D(rxeq_txcoeff[13]),
        .Q(in10[7]),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \rxeq_txcoeff_reg[14] 
       (.C(pipe_pclk_in),
        .CE(\rxeq_txpreset[3]_i_1_n_0 ),
        .D(rxeq_txcoeff[14]),
        .Q(in10[8]),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \rxeq_txcoeff_reg[15] 
       (.C(pipe_pclk_in),
        .CE(\rxeq_txpreset[3]_i_1_n_0 ),
        .D(rxeq_txcoeff[15]),
        .Q(in10[9]),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \rxeq_txcoeff_reg[16] 
       (.C(pipe_pclk_in),
        .CE(\rxeq_txpreset[3]_i_1_n_0 ),
        .D(rxeq_txcoeff[16]),
        .Q(in10[10]),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \rxeq_txcoeff_reg[17] 
       (.C(pipe_pclk_in),
        .CE(\rxeq_txpreset[3]_i_1_n_0 ),
        .D(rxeq_txcoeff[17]),
        .Q(in10[11]),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \rxeq_txcoeff_reg[1] 
       (.C(pipe_pclk_in),
        .CE(\rxeq_txpreset[3]_i_1_n_0 ),
        .D(rxeq_txcoeff[1]),
        .Q(\rxeq_txcoeff_reg_n_0_[1] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \rxeq_txcoeff_reg[2] 
       (.C(pipe_pclk_in),
        .CE(\rxeq_txpreset[3]_i_1_n_0 ),
        .D(rxeq_txcoeff[2]),
        .Q(\rxeq_txcoeff_reg_n_0_[2] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \rxeq_txcoeff_reg[3] 
       (.C(pipe_pclk_in),
        .CE(\rxeq_txpreset[3]_i_1_n_0 ),
        .D(rxeq_txcoeff[3]),
        .Q(\rxeq_txcoeff_reg_n_0_[3] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \rxeq_txcoeff_reg[4] 
       (.C(pipe_pclk_in),
        .CE(\rxeq_txpreset[3]_i_1_n_0 ),
        .D(rxeq_txcoeff[4]),
        .Q(\rxeq_txcoeff_reg_n_0_[4] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \rxeq_txcoeff_reg[5] 
       (.C(pipe_pclk_in),
        .CE(\rxeq_txpreset[3]_i_1_n_0 ),
        .D(rxeq_txcoeff[5]),
        .Q(\rxeq_txcoeff_reg_n_0_[5] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \rxeq_txcoeff_reg[6] 
       (.C(pipe_pclk_in),
        .CE(\rxeq_txpreset[3]_i_1_n_0 ),
        .D(rxeq_txcoeff[6]),
        .Q(in10[0]),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \rxeq_txcoeff_reg[7] 
       (.C(pipe_pclk_in),
        .CE(\rxeq_txpreset[3]_i_1_n_0 ),
        .D(rxeq_txcoeff[7]),
        .Q(in10[1]),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \rxeq_txcoeff_reg[8] 
       (.C(pipe_pclk_in),
        .CE(\rxeq_txpreset[3]_i_1_n_0 ),
        .D(rxeq_txcoeff[8]),
        .Q(in10[2]),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \rxeq_txcoeff_reg[9] 
       (.C(pipe_pclk_in),
        .CE(\rxeq_txpreset[3]_i_1_n_0 ),
        .D(rxeq_txcoeff[9]),
        .Q(in10[3]),
        .R(out));
  LUT3 #(
    .INIT(8'hA8)) 
    \rxeq_txpreset[0]_i_1 
       (.I0(rxeq_txpreset_reg2[0]),
        .I1(\FSM_onehot_fsm_rx_reg_n_0_[3] ),
        .I2(\FSM_onehot_fsm_rx_reg_n_0_[1] ),
        .O(rxeq_txpreset[0]));
  LUT3 #(
    .INIT(8'hA8)) 
    \rxeq_txpreset[1]_i_1 
       (.I0(rxeq_txpreset_reg2[1]),
        .I1(\FSM_onehot_fsm_rx_reg_n_0_[3] ),
        .I2(\FSM_onehot_fsm_rx_reg_n_0_[1] ),
        .O(rxeq_txpreset[1]));
  LUT3 #(
    .INIT(8'hA8)) 
    \rxeq_txpreset[2]_i_1 
       (.I0(rxeq_txpreset_reg2[2]),
        .I1(\FSM_onehot_fsm_rx_reg_n_0_[3] ),
        .I2(\FSM_onehot_fsm_rx_reg_n_0_[1] ),
        .O(rxeq_txpreset[2]));
  LUT5 #(
    .INIT(32'hFFFFF404)) 
    \rxeq_txpreset[3]_i_1 
       (.I0(\FSM_onehot_fsm_rx_reg_n_0_[6] ),
        .I1(\rxeq_txpreset[3]_i_3_n_0 ),
        .I2(\FSM_onehot_fsm_rx_reg_n_0_[1] ),
        .I3(rxeq_control_reg2[1]),
        .I4(\FSM_onehot_fsm_rx_reg_n_0_[3] ),
        .O(\rxeq_txpreset[3]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hA8)) 
    \rxeq_txpreset[3]_i_2 
       (.I0(rxeq_txpreset_reg2[3]),
        .I1(\FSM_onehot_fsm_rx_reg_n_0_[3] ),
        .I2(\FSM_onehot_fsm_rx_reg_n_0_[1] ),
        .O(rxeq_txpreset[3]));
  LUT3 #(
    .INIT(8'h01)) 
    \rxeq_txpreset[3]_i_3 
       (.I0(\FSM_onehot_fsm_rx_reg_n_0_[2] ),
        .I1(\FSM_onehot_fsm_rx_reg_n_0_[4] ),
        .I2(\FSM_onehot_fsm_rx_reg_n_0_[5] ),
        .O(\rxeq_txpreset[3]_i_3_n_0 ));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_txpreset_reg1_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(rxeq_txpreset_reg1[0]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_txpreset_reg1_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(rxeq_txpreset_reg1[1]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_txpreset_reg1_reg[2] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(rxeq_txpreset_reg1[2]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_txpreset_reg1_reg[3] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(rxeq_txpreset_reg1[3]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_txpreset_reg2_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_txpreset_reg1[0]),
        .Q(rxeq_txpreset_reg2[0]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_txpreset_reg2_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_txpreset_reg1[1]),
        .Q(rxeq_txpreset_reg2[1]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_txpreset_reg2_reg[2] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_txpreset_reg1[2]),
        .Q(rxeq_txpreset_reg2[2]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_txpreset_reg2_reg[3] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_txpreset_reg1[3]),
        .Q(rxeq_txpreset_reg2[3]),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \rxeq_txpreset_reg[0] 
       (.C(pipe_pclk_in),
        .CE(\rxeq_txpreset[3]_i_1_n_0 ),
        .D(rxeq_txpreset[0]),
        .Q(\rxeq_txpreset_reg_n_0_[0] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \rxeq_txpreset_reg[1] 
       (.C(pipe_pclk_in),
        .CE(\rxeq_txpreset[3]_i_1_n_0 ),
        .D(rxeq_txpreset[1]),
        .Q(\rxeq_txpreset_reg_n_0_[1] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \rxeq_txpreset_reg[2] 
       (.C(pipe_pclk_in),
        .CE(\rxeq_txpreset[3]_i_1_n_0 ),
        .D(rxeq_txpreset[2]),
        .Q(\rxeq_txpreset_reg_n_0_[2] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \rxeq_txpreset_reg[3] 
       (.C(pipe_pclk_in),
        .CE(\rxeq_txpreset[3]_i_1_n_0 ),
        .D(rxeq_txpreset[3]),
        .Q(\rxeq_txpreset_reg_n_0_[3] ),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rxeq_user_en_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(rxeq_user_en_reg1),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rxeq_user_en_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_user_en_reg1),
        .Q(rxeq_user_en_reg2),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rxeq_user_mode_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(rxeq_user_mode_reg1),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rxeq_user_mode_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_user_mode_reg1),
        .Q(rxeq_user_mode_reg2),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_user_txcoeff_reg1_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(rxeq_user_txcoeff_reg1[0]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_user_txcoeff_reg1_reg[10] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(rxeq_user_txcoeff_reg1[10]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_user_txcoeff_reg1_reg[11] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(rxeq_user_txcoeff_reg1[11]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_user_txcoeff_reg1_reg[12] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(rxeq_user_txcoeff_reg1[12]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_user_txcoeff_reg1_reg[13] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(rxeq_user_txcoeff_reg1[13]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_user_txcoeff_reg1_reg[14] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(rxeq_user_txcoeff_reg1[14]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_user_txcoeff_reg1_reg[15] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(rxeq_user_txcoeff_reg1[15]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_user_txcoeff_reg1_reg[16] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(rxeq_user_txcoeff_reg1[16]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_user_txcoeff_reg1_reg[17] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(rxeq_user_txcoeff_reg1[17]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_user_txcoeff_reg1_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(rxeq_user_txcoeff_reg1[1]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_user_txcoeff_reg1_reg[2] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(rxeq_user_txcoeff_reg1[2]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_user_txcoeff_reg1_reg[3] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(rxeq_user_txcoeff_reg1[3]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_user_txcoeff_reg1_reg[4] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(rxeq_user_txcoeff_reg1[4]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_user_txcoeff_reg1_reg[5] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(rxeq_user_txcoeff_reg1[5]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_user_txcoeff_reg1_reg[6] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(rxeq_user_txcoeff_reg1[6]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_user_txcoeff_reg1_reg[7] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(rxeq_user_txcoeff_reg1[7]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_user_txcoeff_reg1_reg[8] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(rxeq_user_txcoeff_reg1[8]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_user_txcoeff_reg1_reg[9] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(rxeq_user_txcoeff_reg1[9]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_user_txcoeff_reg2_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_user_txcoeff_reg1[0]),
        .Q(rxeq_user_txcoeff_reg2[0]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_user_txcoeff_reg2_reg[10] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_user_txcoeff_reg1[10]),
        .Q(rxeq_user_txcoeff_reg2[10]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_user_txcoeff_reg2_reg[11] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_user_txcoeff_reg1[11]),
        .Q(rxeq_user_txcoeff_reg2[11]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_user_txcoeff_reg2_reg[12] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_user_txcoeff_reg1[12]),
        .Q(rxeq_user_txcoeff_reg2[12]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_user_txcoeff_reg2_reg[13] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_user_txcoeff_reg1[13]),
        .Q(rxeq_user_txcoeff_reg2[13]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_user_txcoeff_reg2_reg[14] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_user_txcoeff_reg1[14]),
        .Q(rxeq_user_txcoeff_reg2[14]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_user_txcoeff_reg2_reg[15] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_user_txcoeff_reg1[15]),
        .Q(rxeq_user_txcoeff_reg2[15]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_user_txcoeff_reg2_reg[16] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_user_txcoeff_reg1[16]),
        .Q(rxeq_user_txcoeff_reg2[16]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_user_txcoeff_reg2_reg[17] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_user_txcoeff_reg1[17]),
        .Q(rxeq_user_txcoeff_reg2[17]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_user_txcoeff_reg2_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_user_txcoeff_reg1[1]),
        .Q(rxeq_user_txcoeff_reg2[1]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_user_txcoeff_reg2_reg[2] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_user_txcoeff_reg1[2]),
        .Q(rxeq_user_txcoeff_reg2[2]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_user_txcoeff_reg2_reg[3] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_user_txcoeff_reg1[3]),
        .Q(rxeq_user_txcoeff_reg2[3]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_user_txcoeff_reg2_reg[4] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_user_txcoeff_reg1[4]),
        .Q(rxeq_user_txcoeff_reg2[4]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_user_txcoeff_reg2_reg[5] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_user_txcoeff_reg1[5]),
        .Q(rxeq_user_txcoeff_reg2[5]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_user_txcoeff_reg2_reg[6] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_user_txcoeff_reg1[6]),
        .Q(rxeq_user_txcoeff_reg2[6]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_user_txcoeff_reg2_reg[7] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_user_txcoeff_reg1[7]),
        .Q(rxeq_user_txcoeff_reg2[7]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_user_txcoeff_reg2_reg[8] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_user_txcoeff_reg1[8]),
        .Q(rxeq_user_txcoeff_reg2[8]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxeq_user_txcoeff_reg2_reg[9] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_user_txcoeff_reg1[9]),
        .Q(rxeq_user_txcoeff_reg2[9]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txeq_control_reg1_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(txeq_control_reg1[0]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txeq_control_reg1_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(txeq_control_reg1[1]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txeq_control_reg2_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txeq_control_reg1[0]),
        .Q(txeq_control_reg2[0]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txeq_control_reg2_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txeq_control_reg1[1]),
        .Q(txeq_control_reg2[1]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDSE \txeq_deemph_reg1_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(txeq_deemph_reg1[0]),
        .S(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txeq_deemph_reg1_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(txeq_deemph_reg1[1]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txeq_deemph_reg1_reg[2] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(txeq_deemph_reg1[2]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txeq_deemph_reg1_reg[3] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(txeq_deemph_reg1[3]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txeq_deemph_reg1_reg[4] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(txeq_deemph_reg1[4]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txeq_deemph_reg1_reg[5] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(txeq_deemph_reg1[5]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDSE \txeq_deemph_reg2_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txeq_deemph_reg1[0]),
        .Q(txeq_deemph_reg2[0]),
        .S(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txeq_deemph_reg2_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txeq_deemph_reg1[1]),
        .Q(txeq_deemph_reg2[1]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txeq_deemph_reg2_reg[2] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txeq_deemph_reg1[2]),
        .Q(txeq_deemph_reg2[2]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txeq_deemph_reg2_reg[3] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txeq_deemph_reg1[3]),
        .Q(txeq_deemph_reg2[3]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txeq_deemph_reg2_reg[4] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txeq_deemph_reg1[4]),
        .Q(txeq_deemph_reg2[4]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txeq_deemph_reg2_reg[5] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txeq_deemph_reg1[5]),
        .Q(txeq_deemph_reg2[5]),
        .R(out));
  LUT5 #(
    .INIT(32'h00040000)) 
    \txeq_preset[0]_i_1 
       (.I0(txeq_preset_reg2[1]),
        .I1(txeq_preset_reg2[3]),
        .I2(out),
        .I3(txeq_preset_reg2[2]),
        .I4(txeq_preset_reg2[0]),
        .O(p_0_out[0]));
  LUT5 #(
    .INIT(32'hAAEABBAF)) 
    \txeq_preset[10]_i_1 
       (.I0(out),
        .I1(txeq_preset_reg2[2]),
        .I2(txeq_preset_reg2[1]),
        .I3(txeq_preset_reg2[3]),
        .I4(txeq_preset_reg2[0]),
        .O(p_0_out[10]));
  LUT5 #(
    .INIT(32'hFFFF1811)) 
    \txeq_preset[11]_i_1 
       (.I0(txeq_preset_reg2[2]),
        .I1(txeq_preset_reg2[0]),
        .I2(txeq_preset_reg2[3]),
        .I3(txeq_preset_reg2[1]),
        .I4(out),
        .O(p_0_out[11]));
  LUT5 #(
    .INIT(32'h01111310)) 
    \txeq_preset[12]_i_1 
       (.I0(txeq_preset_reg2[3]),
        .I1(out),
        .I2(txeq_preset_reg2[2]),
        .I3(txeq_preset_reg2[0]),
        .I4(txeq_preset_reg2[1]),
        .O(p_0_out[12]));
  LUT5 #(
    .INIT(32'h01000010)) 
    \txeq_preset[13]_i_1 
       (.I0(txeq_preset_reg2[2]),
        .I1(out),
        .I2(txeq_preset_reg2[0]),
        .I3(txeq_preset_reg2[3]),
        .I4(txeq_preset_reg2[1]),
        .O(p_0_out[13]));
  LUT5 #(
    .INIT(32'h00100100)) 
    \txeq_preset[14]_i_1 
       (.I0(txeq_preset_reg2[2]),
        .I1(out),
        .I2(txeq_preset_reg2[1]),
        .I3(txeq_preset_reg2[3]),
        .I4(txeq_preset_reg2[0]),
        .O(p_0_out[14]));
  LUT4 #(
    .INIT(16'hF0F1)) 
    \txeq_preset[15]_i_1 
       (.I0(txeq_preset_reg2[2]),
        .I1(txeq_preset_reg2[1]),
        .I2(out),
        .I3(txeq_preset_reg2[3]),
        .O(p_0_out[15]));
  LUT4 #(
    .INIT(16'h0006)) 
    \txeq_preset[16]_i_1 
       (.I0(txeq_preset_reg2[3]),
        .I1(txeq_preset_reg2[0]),
        .I2(txeq_preset_reg2[2]),
        .I3(out),
        .O(p_0_out[16]));
  LUT4 #(
    .INIT(16'hAABA)) 
    \txeq_preset[17]_i_1 
       (.I0(out),
        .I1(fsm_tx[2]),
        .I2(fsm_tx[1]),
        .I3(fsm_tx[0]),
        .O(\txeq_preset[17]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF1091)) 
    \txeq_preset[17]_i_2 
       (.I0(txeq_preset_reg2[2]),
        .I1(txeq_preset_reg2[0]),
        .I2(txeq_preset_reg2[1]),
        .I3(txeq_preset_reg2[3]),
        .I4(out),
        .O(p_0_out[17]));
  LUT5 #(
    .INIT(32'h00001004)) 
    \txeq_preset[1]_i_1 
       (.I0(out),
        .I1(txeq_preset_reg2[3]),
        .I2(txeq_preset_reg2[1]),
        .I3(txeq_preset_reg2[2]),
        .I4(txeq_preset_reg2[0]),
        .O(p_0_out[1]));
  LUT4 #(
    .INIT(16'h4440)) 
    \txeq_preset[2]_i_1 
       (.I0(out),
        .I1(txeq_preset_reg2[3]),
        .I2(txeq_preset_reg2[2]),
        .I3(txeq_preset_reg2[0]),
        .O(p_0_out[2]));
  LUT5 #(
    .INIT(32'h00441140)) 
    \txeq_preset[3]_i_1 
       (.I0(out),
        .I1(txeq_preset_reg2[2]),
        .I2(txeq_preset_reg2[0]),
        .I3(txeq_preset_reg2[3]),
        .I4(txeq_preset_reg2[1]),
        .O(\txeq_preset[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000AAAA3C00AAAA)) 
    \txeq_preset[7]_i_1 
       (.I0(\txeq_preset_reg_n_0_[7] ),
        .I1(txeq_preset_reg2[0]),
        .I2(txeq_preset_reg2[2]),
        .I3(\txeq_preset[7]_i_2_n_0 ),
        .I4(\txeq_preset[17]_i_1_n_0 ),
        .I5(out),
        .O(\txeq_preset[7]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \txeq_preset[7]_i_2 
       (.I0(txeq_preset_reg2[1]),
        .I1(txeq_preset_reg2[3]),
        .O(\txeq_preset[7]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hAABEAFAF)) 
    \txeq_preset[8]_i_1 
       (.I0(out),
        .I1(txeq_preset_reg2[0]),
        .I2(txeq_preset_reg2[2]),
        .I3(txeq_preset_reg2[3]),
        .I4(txeq_preset_reg2[1]),
        .O(p_0_out[8]));
  LUT5 #(
    .INIT(32'hCFCCCCFD)) 
    \txeq_preset[9]_i_1 
       (.I0(txeq_preset_reg2[1]),
        .I1(out),
        .I2(txeq_preset_reg2[3]),
        .I3(txeq_preset_reg2[0]),
        .I4(txeq_preset_reg2[2]),
        .O(p_0_out[9]));
  LUT3 #(
    .INIT(8'h04)) 
    txeq_preset_done_i_1
       (.I0(fsm_tx[0]),
        .I1(fsm_tx[1]),
        .I2(fsm_tx[2]),
        .O(txeq_preset));
  FDRE #(
    .INIT(1'b0)) 
    txeq_preset_done_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txeq_preset),
        .Q(txeq_preset_done),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txeq_preset_reg1_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(txeq_preset_reg1[0]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txeq_preset_reg1_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(txeq_preset_reg1[1]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txeq_preset_reg1_reg[2] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(txeq_preset_reg1[2]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txeq_preset_reg1_reg[3] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(txeq_preset_reg1[3]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txeq_preset_reg2_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txeq_preset_reg1[0]),
        .Q(txeq_preset_reg2[0]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txeq_preset_reg2_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txeq_preset_reg1[1]),
        .Q(txeq_preset_reg2[1]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txeq_preset_reg2_reg[2] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txeq_preset_reg1[2]),
        .Q(txeq_preset_reg2[2]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txeq_preset_reg2_reg[3] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txeq_preset_reg1[3]),
        .Q(txeq_preset_reg2[3]),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \txeq_preset_reg[0] 
       (.C(pipe_pclk_in),
        .CE(\txeq_preset[17]_i_1_n_0 ),
        .D(p_0_out[0]),
        .Q(\txeq_preset_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \txeq_preset_reg[10] 
       (.C(pipe_pclk_in),
        .CE(\txeq_preset[17]_i_1_n_0 ),
        .D(p_0_out[10]),
        .Q(\txeq_preset_reg_n_0_[10] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \txeq_preset_reg[11] 
       (.C(pipe_pclk_in),
        .CE(\txeq_preset[17]_i_1_n_0 ),
        .D(p_0_out[11]),
        .Q(\txeq_preset_reg_n_0_[11] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \txeq_preset_reg[12] 
       (.C(pipe_pclk_in),
        .CE(\txeq_preset[17]_i_1_n_0 ),
        .D(p_0_out[12]),
        .Q(\txeq_preset_reg_n_0_[12] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \txeq_preset_reg[13] 
       (.C(pipe_pclk_in),
        .CE(\txeq_preset[17]_i_1_n_0 ),
        .D(p_0_out[13]),
        .Q(\txeq_preset_reg_n_0_[13] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \txeq_preset_reg[14] 
       (.C(pipe_pclk_in),
        .CE(\txeq_preset[17]_i_1_n_0 ),
        .D(p_0_out[14]),
        .Q(\txeq_preset_reg_n_0_[14] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \txeq_preset_reg[15] 
       (.C(pipe_pclk_in),
        .CE(\txeq_preset[17]_i_1_n_0 ),
        .D(p_0_out[15]),
        .Q(\txeq_preset_reg_n_0_[15] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \txeq_preset_reg[16] 
       (.C(pipe_pclk_in),
        .CE(\txeq_preset[17]_i_1_n_0 ),
        .D(p_0_out[16]),
        .Q(\txeq_preset_reg_n_0_[16] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \txeq_preset_reg[17] 
       (.C(pipe_pclk_in),
        .CE(\txeq_preset[17]_i_1_n_0 ),
        .D(p_0_out[17]),
        .Q(\txeq_preset_reg_n_0_[17] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \txeq_preset_reg[1] 
       (.C(pipe_pclk_in),
        .CE(\txeq_preset[17]_i_1_n_0 ),
        .D(p_0_out[1]),
        .Q(\txeq_preset_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \txeq_preset_reg[2] 
       (.C(pipe_pclk_in),
        .CE(\txeq_preset[17]_i_1_n_0 ),
        .D(p_0_out[2]),
        .Q(\txeq_preset_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \txeq_preset_reg[3] 
       (.C(pipe_pclk_in),
        .CE(\txeq_preset[17]_i_1_n_0 ),
        .D(\txeq_preset[3]_i_1_n_0 ),
        .Q(\txeq_preset_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \txeq_preset_reg[7] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\txeq_preset[7]_i_1_n_0 ),
        .Q(\txeq_preset_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \txeq_preset_reg[8] 
       (.C(pipe_pclk_in),
        .CE(\txeq_preset[17]_i_1_n_0 ),
        .D(p_0_out[8]),
        .Q(\txeq_preset_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \txeq_preset_reg[9] 
       (.C(pipe_pclk_in),
        .CE(\txeq_preset[17]_i_1_n_0 ),
        .D(p_0_out[9]),
        .Q(\txeq_preset_reg_n_0_[9] ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT5 #(
    .INIT(32'h45404040)) 
    \txeq_txcoeff[0]_i_1 
       (.I0(fsm_tx[2]),
        .I1(\txeq_txcoeff[0]_i_2_n_0 ),
        .I2(fsm_tx[1]),
        .I3(\txeq_txcoeff_reg_n_0_[6] ),
        .I4(fsm_tx[0]),
        .O(\txeq_txcoeff[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    \txeq_txcoeff[0]_i_2 
       (.I0(\txeq_txcoeff_reg_n_0_[7] ),
        .I1(\txeq_txcoeff_cnt_reg_n_0_[0] ),
        .I2(\txeq_txcoeff_cnt_reg_n_0_[1] ),
        .I3(\txeq_txcoeff_reg_n_0_[6] ),
        .I4(fsm_tx[0]),
        .I5(\txeq_preset_reg_n_0_[0] ),
        .O(\txeq_txcoeff[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h30BB308830883088)) 
    \txeq_txcoeff[10]_i_1 
       (.I0(\txeq_txcoeff_reg_n_0_[9] ),
        .I1(fsm_tx[2]),
        .I2(\txeq_txcoeff[10]_i_2_n_0 ),
        .I3(fsm_tx[1]),
        .I4(fsm_tx[0]),
        .I5(\txeq_txcoeff_reg_n_0_[16] ),
        .O(\txeq_txcoeff[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    \txeq_txcoeff[10]_i_2 
       (.I0(\txeq_txcoeff_reg_n_0_[17] ),
        .I1(\txeq_txcoeff_cnt_reg_n_0_[0] ),
        .I2(\txeq_txcoeff_cnt_reg_n_0_[1] ),
        .I3(\txeq_txcoeff_reg_n_0_[16] ),
        .I4(fsm_tx[0]),
        .I5(\txeq_preset_reg_n_0_[10] ),
        .O(\txeq_txcoeff[10]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h30BB308830883088)) 
    \txeq_txcoeff[11]_i_1 
       (.I0(\txeq_txcoeff_reg_n_0_[10] ),
        .I1(fsm_tx[2]),
        .I2(\txeq_txcoeff[11]_i_2_n_0 ),
        .I3(fsm_tx[1]),
        .I4(fsm_tx[0]),
        .I5(\txeq_txcoeff_reg_n_0_[17] ),
        .O(\txeq_txcoeff[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    \txeq_txcoeff[11]_i_2 
       (.I0(\txeq_txcoeff_reg_n_0_[18] ),
        .I1(\txeq_txcoeff_cnt_reg_n_0_[0] ),
        .I2(\txeq_txcoeff_cnt_reg_n_0_[1] ),
        .I3(\txeq_txcoeff_reg_n_0_[17] ),
        .I4(fsm_tx[0]),
        .I5(\txeq_preset_reg_n_0_[11] ),
        .O(\txeq_txcoeff[11]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h30BB308830883088)) 
    \txeq_txcoeff[12]_i_1 
       (.I0(\txeq_txcoeff_reg_n_0_[11] ),
        .I1(fsm_tx[2]),
        .I2(\txeq_txcoeff[12]_i_2_n_0 ),
        .I3(fsm_tx[1]),
        .I4(fsm_tx[0]),
        .I5(\txeq_txcoeff_reg_n_0_[18] ),
        .O(\txeq_txcoeff[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    \txeq_txcoeff[12]_i_2 
       (.I0(txeq_deemph_reg2[0]),
        .I1(\txeq_txcoeff_cnt_reg_n_0_[0] ),
        .I2(\txeq_txcoeff_cnt_reg_n_0_[1] ),
        .I3(\txeq_txcoeff_reg_n_0_[18] ),
        .I4(fsm_tx[0]),
        .I5(\txeq_preset_reg_n_0_[12] ),
        .O(\txeq_txcoeff[12]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h30BB308830883088)) 
    \txeq_txcoeff[13]_i_1 
       (.I0(\txeq_txcoeff_reg_n_0_[12] ),
        .I1(fsm_tx[2]),
        .I2(\txeq_txcoeff[13]_i_2_n_0 ),
        .I3(fsm_tx[1]),
        .I4(fsm_tx[0]),
        .I5(txeq_deemph_reg2[0]),
        .O(\txeq_txcoeff[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    \txeq_txcoeff[13]_i_2 
       (.I0(txeq_deemph_reg2[1]),
        .I1(\txeq_txcoeff_cnt_reg_n_0_[0] ),
        .I2(\txeq_txcoeff_cnt_reg_n_0_[1] ),
        .I3(txeq_deemph_reg2[0]),
        .I4(fsm_tx[0]),
        .I5(\txeq_preset_reg_n_0_[13] ),
        .O(\txeq_txcoeff[13]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h30BB308830883088)) 
    \txeq_txcoeff[14]_i_1 
       (.I0(\txeq_txcoeff_reg_n_0_[13] ),
        .I1(fsm_tx[2]),
        .I2(\txeq_txcoeff[14]_i_2_n_0 ),
        .I3(fsm_tx[1]),
        .I4(fsm_tx[0]),
        .I5(txeq_deemph_reg2[1]),
        .O(\txeq_txcoeff[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    \txeq_txcoeff[14]_i_2 
       (.I0(txeq_deemph_reg2[2]),
        .I1(\txeq_txcoeff_cnt_reg_n_0_[0] ),
        .I2(\txeq_txcoeff_cnt_reg_n_0_[1] ),
        .I3(txeq_deemph_reg2[1]),
        .I4(fsm_tx[0]),
        .I5(\txeq_preset_reg_n_0_[14] ),
        .O(\txeq_txcoeff[14]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h30BB308830883088)) 
    \txeq_txcoeff[15]_i_1 
       (.I0(\txeq_txcoeff_reg_n_0_[14] ),
        .I1(fsm_tx[2]),
        .I2(\txeq_txcoeff[15]_i_2_n_0 ),
        .I3(fsm_tx[1]),
        .I4(fsm_tx[0]),
        .I5(txeq_deemph_reg2[2]),
        .O(\txeq_txcoeff[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    \txeq_txcoeff[15]_i_2 
       (.I0(txeq_deemph_reg2[3]),
        .I1(\txeq_txcoeff_cnt_reg_n_0_[0] ),
        .I2(\txeq_txcoeff_cnt_reg_n_0_[1] ),
        .I3(txeq_deemph_reg2[2]),
        .I4(fsm_tx[0]),
        .I5(\txeq_preset_reg_n_0_[15] ),
        .O(\txeq_txcoeff[15]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h30BB308830883088)) 
    \txeq_txcoeff[16]_i_1 
       (.I0(\txeq_txcoeff_reg_n_0_[15] ),
        .I1(fsm_tx[2]),
        .I2(\txeq_txcoeff[16]_i_2_n_0 ),
        .I3(fsm_tx[1]),
        .I4(fsm_tx[0]),
        .I5(txeq_deemph_reg2[3]),
        .O(\txeq_txcoeff[16]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    \txeq_txcoeff[16]_i_2 
       (.I0(txeq_deemph_reg2[4]),
        .I1(\txeq_txcoeff_cnt_reg_n_0_[0] ),
        .I2(\txeq_txcoeff_cnt_reg_n_0_[1] ),
        .I3(txeq_deemph_reg2[3]),
        .I4(fsm_tx[0]),
        .I5(\txeq_preset_reg_n_0_[16] ),
        .O(\txeq_txcoeff[16]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h30BB308830883088)) 
    \txeq_txcoeff[17]_i_1 
       (.I0(\txeq_txcoeff_reg_n_0_[16] ),
        .I1(fsm_tx[2]),
        .I2(\txeq_txcoeff[17]_i_2_n_0 ),
        .I3(fsm_tx[1]),
        .I4(fsm_tx[0]),
        .I5(txeq_deemph_reg2[4]),
        .O(\txeq_txcoeff[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    \txeq_txcoeff[17]_i_2 
       (.I0(txeq_deemph_reg2[5]),
        .I1(\txeq_txcoeff_cnt_reg_n_0_[0] ),
        .I2(\txeq_txcoeff_cnt_reg_n_0_[1] ),
        .I3(txeq_deemph_reg2[4]),
        .I4(fsm_tx[0]),
        .I5(\txeq_preset_reg_n_0_[17] ),
        .O(\txeq_txcoeff[17]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFF040FFF)) 
    \txeq_txcoeff[18]_i_1 
       (.I0(txeq_control_reg2[0]),
        .I1(txeq_control_reg2[1]),
        .I2(fsm_tx[2]),
        .I3(fsm_tx[1]),
        .I4(fsm_tx[0]),
        .O(txeq_txcoeff));
  LUT6 #(
    .INIT(64'h440F440044004400)) 
    \txeq_txcoeff[18]_i_2 
       (.I0(fsm_tx[1]),
        .I1(\txeq_txcoeff_reg_n_0_[17] ),
        .I2(\txeq_txcoeff[18]_i_3_n_0 ),
        .I3(fsm_tx[2]),
        .I4(txeq_deemph_reg2[5]),
        .I5(fsm_tx[0]),
        .O(\txeq_txcoeff[18]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \txeq_txcoeff[18]_i_3 
       (.I0(\txeq_txcoeff_cnt_reg_n_0_[0] ),
        .I1(fsm_tx[1]),
        .I2(\txeq_txcoeff_cnt_reg_n_0_[1] ),
        .O(\txeq_txcoeff[18]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h30BB308830883088)) 
    \txeq_txcoeff[1]_i_1 
       (.I0(\txeq_txcoeff_reg_n_0_[0] ),
        .I1(fsm_tx[2]),
        .I2(\txeq_txcoeff[1]_i_2_n_0 ),
        .I3(fsm_tx[1]),
        .I4(fsm_tx[0]),
        .I5(\txeq_txcoeff_reg_n_0_[7] ),
        .O(\txeq_txcoeff[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    \txeq_txcoeff[1]_i_2 
       (.I0(\txeq_txcoeff_reg_n_0_[8] ),
        .I1(\txeq_txcoeff_cnt_reg_n_0_[0] ),
        .I2(\txeq_txcoeff_cnt_reg_n_0_[1] ),
        .I3(\txeq_txcoeff_reg_n_0_[7] ),
        .I4(fsm_tx[0]),
        .I5(\txeq_preset_reg_n_0_[1] ),
        .O(\txeq_txcoeff[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h30BB308830883088)) 
    \txeq_txcoeff[2]_i_1 
       (.I0(\txeq_txcoeff_reg_n_0_[1] ),
        .I1(fsm_tx[2]),
        .I2(\txeq_txcoeff[2]_i_2_n_0 ),
        .I3(fsm_tx[1]),
        .I4(fsm_tx[0]),
        .I5(\txeq_txcoeff_reg_n_0_[8] ),
        .O(\txeq_txcoeff[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    \txeq_txcoeff[2]_i_2 
       (.I0(\txeq_txcoeff_reg_n_0_[9] ),
        .I1(\txeq_txcoeff_cnt_reg_n_0_[0] ),
        .I2(\txeq_txcoeff_cnt_reg_n_0_[1] ),
        .I3(\txeq_txcoeff_reg_n_0_[8] ),
        .I4(fsm_tx[0]),
        .I5(\txeq_preset_reg_n_0_[2] ),
        .O(\txeq_txcoeff[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h30BB308830883088)) 
    \txeq_txcoeff[3]_i_1 
       (.I0(\txeq_txcoeff_reg_n_0_[2] ),
        .I1(fsm_tx[2]),
        .I2(\txeq_txcoeff[3]_i_2_n_0 ),
        .I3(fsm_tx[1]),
        .I4(fsm_tx[0]),
        .I5(\txeq_txcoeff_reg_n_0_[9] ),
        .O(\txeq_txcoeff[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    \txeq_txcoeff[3]_i_2 
       (.I0(\txeq_txcoeff_reg_n_0_[10] ),
        .I1(\txeq_txcoeff_cnt_reg_n_0_[0] ),
        .I2(\txeq_txcoeff_cnt_reg_n_0_[1] ),
        .I3(\txeq_txcoeff_reg_n_0_[9] ),
        .I4(fsm_tx[0]),
        .I5(\txeq_preset_reg_n_0_[3] ),
        .O(\txeq_txcoeff[3]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h2F20)) 
    \txeq_txcoeff[4]_i_1 
       (.I0(\txeq_txcoeff_reg_n_0_[3] ),
        .I1(fsm_tx[1]),
        .I2(fsm_tx[2]),
        .I3(\txeq_txcoeff[4]_i_2_n_0 ),
        .O(\txeq_txcoeff[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCACCCCCC00000000)) 
    \txeq_txcoeff[4]_i_2 
       (.I0(\txeq_txcoeff_reg_n_0_[11] ),
        .I1(\txeq_txcoeff_reg_n_0_[10] ),
        .I2(\txeq_txcoeff_cnt_reg_n_0_[1] ),
        .I3(fsm_tx[1]),
        .I4(\txeq_txcoeff_cnt_reg_n_0_[0] ),
        .I5(fsm_tx[0]),
        .O(\txeq_txcoeff[4]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h2F20)) 
    \txeq_txcoeff[5]_i_1 
       (.I0(\txeq_txcoeff_reg_n_0_[4] ),
        .I1(fsm_tx[1]),
        .I2(fsm_tx[2]),
        .I3(\txeq_txcoeff[5]_i_2_n_0 ),
        .O(\txeq_txcoeff[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCACCCCCC00000000)) 
    \txeq_txcoeff[5]_i_2 
       (.I0(\txeq_txcoeff_reg_n_0_[12] ),
        .I1(\txeq_txcoeff_reg_n_0_[11] ),
        .I2(\txeq_txcoeff_cnt_reg_n_0_[1] ),
        .I3(fsm_tx[1]),
        .I4(\txeq_txcoeff_cnt_reg_n_0_[0] ),
        .I5(fsm_tx[0]),
        .O(\txeq_txcoeff[5]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h2F20)) 
    \txeq_txcoeff[6]_i_1 
       (.I0(\txeq_txcoeff_reg_n_0_[5] ),
        .I1(fsm_tx[1]),
        .I2(fsm_tx[2]),
        .I3(\txeq_txcoeff[6]_i_2_n_0 ),
        .O(\txeq_txcoeff[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCACCCCCC00000000)) 
    \txeq_txcoeff[6]_i_2 
       (.I0(\txeq_txcoeff_reg_n_0_[13] ),
        .I1(\txeq_txcoeff_reg_n_0_[12] ),
        .I2(\txeq_txcoeff_cnt_reg_n_0_[1] ),
        .I3(fsm_tx[1]),
        .I4(\txeq_txcoeff_cnt_reg_n_0_[0] ),
        .I5(fsm_tx[0]),
        .O(\txeq_txcoeff[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h30BB308830883088)) 
    \txeq_txcoeff[7]_i_1 
       (.I0(\txeq_txcoeff_reg_n_0_[6] ),
        .I1(fsm_tx[2]),
        .I2(\txeq_txcoeff[7]_i_2_n_0 ),
        .I3(fsm_tx[1]),
        .I4(fsm_tx[0]),
        .I5(\txeq_txcoeff_reg_n_0_[13] ),
        .O(\txeq_txcoeff[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    \txeq_txcoeff[7]_i_2 
       (.I0(\txeq_txcoeff_reg_n_0_[14] ),
        .I1(\txeq_txcoeff_cnt_reg_n_0_[0] ),
        .I2(\txeq_txcoeff_cnt_reg_n_0_[1] ),
        .I3(\txeq_txcoeff_reg_n_0_[13] ),
        .I4(fsm_tx[0]),
        .I5(\txeq_preset_reg_n_0_[7] ),
        .O(\txeq_txcoeff[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h30BB308830883088)) 
    \txeq_txcoeff[8]_i_1 
       (.I0(\txeq_txcoeff_reg_n_0_[7] ),
        .I1(fsm_tx[2]),
        .I2(\txeq_txcoeff[8]_i_2_n_0 ),
        .I3(fsm_tx[1]),
        .I4(fsm_tx[0]),
        .I5(\txeq_txcoeff_reg_n_0_[14] ),
        .O(\txeq_txcoeff[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    \txeq_txcoeff[8]_i_2 
       (.I0(\txeq_txcoeff_reg_n_0_[15] ),
        .I1(\txeq_txcoeff_cnt_reg_n_0_[0] ),
        .I2(\txeq_txcoeff_cnt_reg_n_0_[1] ),
        .I3(\txeq_txcoeff_reg_n_0_[14] ),
        .I4(fsm_tx[0]),
        .I5(\txeq_preset_reg_n_0_[8] ),
        .O(\txeq_txcoeff[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h30BB308830883088)) 
    \txeq_txcoeff[9]_i_1 
       (.I0(\txeq_txcoeff_reg_n_0_[8] ),
        .I1(fsm_tx[2]),
        .I2(\txeq_txcoeff[9]_i_2_n_0 ),
        .I3(fsm_tx[1]),
        .I4(fsm_tx[0]),
        .I5(\txeq_txcoeff_reg_n_0_[15] ),
        .O(\txeq_txcoeff[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFB08FFFFFB080000)) 
    \txeq_txcoeff[9]_i_2 
       (.I0(\txeq_txcoeff_reg_n_0_[16] ),
        .I1(\txeq_txcoeff_cnt_reg_n_0_[0] ),
        .I2(\txeq_txcoeff_cnt_reg_n_0_[1] ),
        .I3(\txeq_txcoeff_reg_n_0_[15] ),
        .I4(fsm_tx[0]),
        .I5(\txeq_preset_reg_n_0_[9] ),
        .O(\txeq_txcoeff[9]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h000004000F000400)) 
    \txeq_txcoeff_cnt[0]_i_1 
       (.I0(txeq_control_reg2[0]),
        .I1(txeq_control_reg2[1]),
        .I2(fsm_tx[2]),
        .I3(fsm_tx[0]),
        .I4(fsm_tx[1]),
        .I5(\txeq_txcoeff_cnt_reg_n_0_[0] ),
        .O(txeq_txcoeff_cnt[0]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT5 #(
    .INIT(32'h00006000)) 
    \txeq_txcoeff_cnt[1]_i_1 
       (.I0(\txeq_txcoeff_cnt_reg_n_0_[0] ),
        .I1(\txeq_txcoeff_cnt_reg_n_0_[1] ),
        .I2(fsm_tx[0]),
        .I3(fsm_tx[1]),
        .I4(fsm_tx[2]),
        .O(txeq_txcoeff_cnt[1]));
  FDRE #(
    .INIT(1'b0)) 
    \txeq_txcoeff_cnt_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txeq_txcoeff_cnt[0]),
        .Q(\txeq_txcoeff_cnt_reg_n_0_[0] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \txeq_txcoeff_cnt_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txeq_txcoeff_cnt[1]),
        .Q(\txeq_txcoeff_cnt_reg_n_0_[1] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \txeq_txcoeff_reg[0] 
       (.C(pipe_pclk_in),
        .CE(txeq_txcoeff),
        .D(\txeq_txcoeff[0]_i_1_n_0 ),
        .Q(\txeq_txcoeff_reg_n_0_[0] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \txeq_txcoeff_reg[10] 
       (.C(pipe_pclk_in),
        .CE(txeq_txcoeff),
        .D(\txeq_txcoeff[10]_i_1_n_0 ),
        .Q(\txeq_txcoeff_reg_n_0_[10] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \txeq_txcoeff_reg[11] 
       (.C(pipe_pclk_in),
        .CE(txeq_txcoeff),
        .D(\txeq_txcoeff[11]_i_1_n_0 ),
        .Q(\txeq_txcoeff_reg_n_0_[11] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \txeq_txcoeff_reg[12] 
       (.C(pipe_pclk_in),
        .CE(txeq_txcoeff),
        .D(\txeq_txcoeff[12]_i_1_n_0 ),
        .Q(\txeq_txcoeff_reg_n_0_[12] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \txeq_txcoeff_reg[13] 
       (.C(pipe_pclk_in),
        .CE(txeq_txcoeff),
        .D(\txeq_txcoeff[13]_i_1_n_0 ),
        .Q(\txeq_txcoeff_reg_n_0_[13] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \txeq_txcoeff_reg[14] 
       (.C(pipe_pclk_in),
        .CE(txeq_txcoeff),
        .D(\txeq_txcoeff[14]_i_1_n_0 ),
        .Q(\txeq_txcoeff_reg_n_0_[14] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \txeq_txcoeff_reg[15] 
       (.C(pipe_pclk_in),
        .CE(txeq_txcoeff),
        .D(\txeq_txcoeff[15]_i_1_n_0 ),
        .Q(\txeq_txcoeff_reg_n_0_[15] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \txeq_txcoeff_reg[16] 
       (.C(pipe_pclk_in),
        .CE(txeq_txcoeff),
        .D(\txeq_txcoeff[16]_i_1_n_0 ),
        .Q(\txeq_txcoeff_reg_n_0_[16] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \txeq_txcoeff_reg[17] 
       (.C(pipe_pclk_in),
        .CE(txeq_txcoeff),
        .D(\txeq_txcoeff[17]_i_1_n_0 ),
        .Q(\txeq_txcoeff_reg_n_0_[17] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \txeq_txcoeff_reg[18] 
       (.C(pipe_pclk_in),
        .CE(txeq_txcoeff),
        .D(\txeq_txcoeff[18]_i_2_n_0 ),
        .Q(\txeq_txcoeff_reg_n_0_[18] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \txeq_txcoeff_reg[1] 
       (.C(pipe_pclk_in),
        .CE(txeq_txcoeff),
        .D(\txeq_txcoeff[1]_i_1_n_0 ),
        .Q(\txeq_txcoeff_reg_n_0_[1] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \txeq_txcoeff_reg[2] 
       (.C(pipe_pclk_in),
        .CE(txeq_txcoeff),
        .D(\txeq_txcoeff[2]_i_1_n_0 ),
        .Q(\txeq_txcoeff_reg_n_0_[2] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \txeq_txcoeff_reg[3] 
       (.C(pipe_pclk_in),
        .CE(txeq_txcoeff),
        .D(\txeq_txcoeff[3]_i_1_n_0 ),
        .Q(\txeq_txcoeff_reg_n_0_[3] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \txeq_txcoeff_reg[4] 
       (.C(pipe_pclk_in),
        .CE(txeq_txcoeff),
        .D(\txeq_txcoeff[4]_i_1_n_0 ),
        .Q(\txeq_txcoeff_reg_n_0_[4] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \txeq_txcoeff_reg[5] 
       (.C(pipe_pclk_in),
        .CE(txeq_txcoeff),
        .D(\txeq_txcoeff[5]_i_1_n_0 ),
        .Q(\txeq_txcoeff_reg_n_0_[5] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \txeq_txcoeff_reg[6] 
       (.C(pipe_pclk_in),
        .CE(txeq_txcoeff),
        .D(\txeq_txcoeff[6]_i_1_n_0 ),
        .Q(\txeq_txcoeff_reg_n_0_[6] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \txeq_txcoeff_reg[7] 
       (.C(pipe_pclk_in),
        .CE(txeq_txcoeff),
        .D(\txeq_txcoeff[7]_i_1_n_0 ),
        .Q(\txeq_txcoeff_reg_n_0_[7] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \txeq_txcoeff_reg[8] 
       (.C(pipe_pclk_in),
        .CE(txeq_txcoeff),
        .D(\txeq_txcoeff[8]_i_1_n_0 ),
        .Q(\txeq_txcoeff_reg_n_0_[8] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \txeq_txcoeff_reg[9] 
       (.C(pipe_pclk_in),
        .CE(txeq_txcoeff),
        .D(\txeq_txcoeff[9]_i_1_n_0 ),
        .Q(\txeq_txcoeff_reg_n_0_[9] ),
        .R(out));
endmodule

module pcie_7x_0_pipe_rate
   (rate_drp_start,
    rate_drp_x16x20_mode,
    rate_drp_x16,
    rate_cpllpd,
    QRST_QPLLPD_IN,
    rate_cpllreset,
    QRST_QPLLRESET_IN,
    rate_rxpmareset,
    RXSYSCLKSEL,
    pipe_pclk_sel_out,
    QPLL_DRP_GEN3,
    RXRATE,
    \fsm_reg[2]_0 ,
    \fsm_reg[2]_1 ,
    \fsm_reg[2]_2 ,
    \fsm_reg[4]_0 ,
    \fsm_reg[0]_0 ,
    RX8B10BEN0,
    SYNC_TXSYNC_START0,
    out,
    Q,
    pipe_pclk_in,
    QRST_CPLLLOCK,
    QRST_QPLLLOCK,
    drp_done,
    pipe_mmcm_lock_in,
    gt_phystatus,
    gt_txresetdone_0,
    gt_rxresetdone_0,
    gt_txratedone,
    gt_rxratedone,
    sync_txsync_done,
    \fsm[3]_i_5_0 ,
    \fsm[0]_i_5_0 ,
    \fsm[0]_i_5_1 ,
    pipe_tx_rate);
  output rate_drp_start;
  output rate_drp_x16x20_mode;
  output rate_drp_x16;
  output rate_cpllpd;
  output [0:0]QRST_QPLLPD_IN;
  output rate_cpllreset;
  output [0:0]QRST_QPLLRESET_IN;
  output rate_rxpmareset;
  output [0:0]RXSYSCLKSEL;
  output [0:0]pipe_pclk_sel_out;
  output QPLL_DRP_GEN3;
  output [0:0]RXRATE;
  output \fsm_reg[2]_0 ;
  output \fsm_reg[2]_1 ;
  output \fsm_reg[2]_2 ;
  output \fsm_reg[4]_0 ;
  output \fsm_reg[0]_0 ;
  output RX8B10BEN0;
  output SYNC_TXSYNC_START0;
  input out;
  input [1:0]Q;
  input pipe_pclk_in;
  input [0:0]QRST_CPLLLOCK;
  input [0:0]QRST_QPLLLOCK;
  input drp_done;
  input pipe_mmcm_lock_in;
  input gt_phystatus;
  input gt_txresetdone_0;
  input gt_rxresetdone_0;
  input gt_txratedone;
  input gt_rxratedone;
  input sync_txsync_done;
  input \fsm[3]_i_5_0 ;
  input \fsm[0]_i_5_0 ;
  input \fsm[0]_i_5_1 ;
  input pipe_tx_rate;

  wire [1:0]Q;
  wire QPLL_DRP_GEN3;
  wire [0:0]QRST_CPLLLOCK;
  wire [0:0]QRST_QPLLLOCK;
  wire [0:0]QRST_QPLLPD_IN;
  wire [0:0]QRST_QPLLRESET_IN;
  wire RX8B10BEN0;
  wire [0:0]RXRATE;
  wire [0:0]RXSYSCLKSEL;
  wire SYNC_TXSYNC_START0;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire cplllock_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire cplllock_reg2;
  wire cpllpd_i_1_n_0;
  wire cpllreset_i_1__0_n_0;
  wire drp_done;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire drp_done_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire drp_done_reg2;
  wire drp_start_i_1_n_0;
  wire drp_x16_i_1_n_0;
  wire drp_x16x20_mode_i_1_n_0;
  wire [4:0]fsm;
  wire \fsm[0]_i_10_n_0 ;
  wire \fsm[0]_i_11_n_0 ;
  wire \fsm[0]_i_12_n_0 ;
  wire \fsm[0]_i_13_n_0 ;
  wire \fsm[0]_i_2__0_n_0 ;
  wire \fsm[0]_i_3_n_0 ;
  wire \fsm[0]_i_4_n_0 ;
  wire \fsm[0]_i_5_0 ;
  wire \fsm[0]_i_5_1 ;
  wire \fsm[0]_i_5_n_0 ;
  wire \fsm[0]_i_6_n_0 ;
  wire \fsm[0]_i_7_n_0 ;
  wire \fsm[0]_i_8_n_0 ;
  wire \fsm[0]_i_9_n_0 ;
  wire \fsm[1]_i_10_n_0 ;
  wire \fsm[1]_i_2__0_n_0 ;
  wire \fsm[1]_i_3_n_0 ;
  wire \fsm[1]_i_4_n_0 ;
  wire \fsm[1]_i_5_n_0 ;
  wire \fsm[1]_i_6_n_0 ;
  wire \fsm[1]_i_7_n_0 ;
  wire \fsm[1]_i_8_n_0 ;
  wire \fsm[1]_i_9_n_0 ;
  wire \fsm[2]_i_10_n_0 ;
  wire \fsm[2]_i_11_n_0 ;
  wire \fsm[2]_i_12_n_0 ;
  wire \fsm[2]_i_2_n_0 ;
  wire \fsm[2]_i_3_n_0 ;
  wire \fsm[2]_i_4_n_0 ;
  wire \fsm[2]_i_5_n_0 ;
  wire \fsm[2]_i_6_n_0 ;
  wire \fsm[2]_i_7_n_0 ;
  wire \fsm[2]_i_8_n_0 ;
  wire \fsm[2]_i_9_n_0 ;
  wire \fsm[3]_i_2_n_0 ;
  wire \fsm[3]_i_3_n_0 ;
  wire \fsm[3]_i_4_n_0 ;
  wire \fsm[3]_i_5_0 ;
  wire \fsm[3]_i_5_n_0 ;
  wire \fsm[3]_i_6_n_0 ;
  wire \fsm[4]_i_2_n_0 ;
  wire \fsm[4]_i_3_n_0 ;
  wire \fsm_reg[0]_0 ;
  wire \fsm_reg[2]_0 ;
  wire \fsm_reg[2]_1 ;
  wire \fsm_reg[2]_2 ;
  wire \fsm_reg[4]_0 ;
  wire \fsm_reg_n_0_[0] ;
  wire \fsm_reg_n_0_[1] ;
  wire \fsm_reg_n_0_[2] ;
  wire \fsm_reg_n_0_[3] ;
  wire \fsm_reg_n_0_[4] ;
  wire gen3_exit;
  wire gen3_exit_i_1_n_0;
  wire gen3_exit_i_2_n_0;
  wire gen3_exit_i_3_n_0;
  wire gen3_i_1_n_0;
  wire gen3_i_2_n_0;
  wire gt_phystatus;
  wire gt_rxratedone;
  wire gt_rxresetdone_0;
  wire gt_txratedone;
  wire gt_txresetdone_0;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire mmcm_lock_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire mmcm_lock_reg2;
  wire out;
  wire [3:0]p_0_in__0;
  wire pclk_sel_i_1_n_0;
  wire pclk_sel_i_2_n_0;
  wire phystatus;
  wire phystatus_i_1_n_0;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire phystatus_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire phystatus_reg2;
  wire pipe_mmcm_lock_in;
  wire pipe_pclk_in;
  wire [0:0]pipe_pclk_sel_out;
  wire pipe_tx_rate;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire qplllock_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire qplllock_reg2;
  wire qpllpd;
  wire qpllpd_i_1__0_n_0;
  wire qpllreset;
  wire qpllreset_i_1__0_n_0;
  wire rate_cpllpd;
  wire rate_cpllreset;
  wire rate_drp_start;
  wire rate_drp_x16;
  wire rate_drp_x16x20_mode;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire [1:0]rate_in_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire [1:0]rate_in_reg2;
  wire \rate_out[0]_i_1_n_0 ;
  wire \rate_out[0]_i_2_n_0 ;
  wire \rate_out[0]_i_3_n_0 ;
  wire rate_rxpmareset;
  wire ratedone;
  wire ratedone_i_1_n_0;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire resetovrd_done_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire resetovrd_done_reg2;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rst_idle_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rst_idle_reg2;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rxpmaresetdone_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rxpmaresetdone_reg2;
  wire rxratedone;
  wire rxratedone_i_1_n_0;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rxratedone_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rxratedone_reg2;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rxresetdone_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rxresetdone_reg2;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rxsync_done_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rxsync_done_reg2;
  wire sync_txsync_done;
  wire \sysclksel[0]_i_1_n_0 ;
  wire \sysclksel[0]_i_2_n_0 ;
  wire \txdata_wait_cnt[3]_i_2_n_0 ;
  wire [3:0]txdata_wait_cnt_reg;
  wire txpmareset_i_1_n_0;
  wire txpmareset_i_2_n_0;
  wire txratedone;
  wire txratedone_i_1_n_0;
  wire txratedone_i_2_n_0;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire txratedone_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire txratedone_reg2;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire txresetdone_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire txresetdone_reg2;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire txsync_done_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire txsync_done_reg2;

  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE cplllock_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(QRST_CPLLLOCK),
        .Q(cplllock_reg1),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE cplllock_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(cplllock_reg1),
        .Q(cplllock_reg2),
        .R(out));
  LUT6 #(
    .INIT(64'h0040FFFF00400000)) 
    cpllpd_i_1
       (.I0(rate_in_reg2[0]),
        .I1(rate_in_reg2[1]),
        .I2(\fsm_reg_n_0_[4] ),
        .I3(\fsm_reg_n_0_[2] ),
        .I4(qpllpd),
        .I5(rate_cpllpd),
        .O(cpllpd_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT5 #(
    .INIT(32'h90000010)) 
    cpllpd_i_2
       (.I0(\fsm_reg_n_0_[2] ),
        .I1(\fsm_reg_n_0_[1] ),
        .I2(\fsm_reg_n_0_[0] ),
        .I3(\fsm_reg_n_0_[4] ),
        .I4(\fsm_reg_n_0_[3] ),
        .O(qpllpd));
  FDRE #(
    .INIT(1'b0)) 
    cpllpd_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(cpllpd_i_1_n_0),
        .Q(rate_cpllpd),
        .R(out));
  LUT6 #(
    .INIT(64'h0040FFFF00400000)) 
    cpllreset_i_1__0
       (.I0(rate_in_reg2[0]),
        .I1(rate_in_reg2[1]),
        .I2(\fsm_reg_n_0_[4] ),
        .I3(\fsm_reg_n_0_[2] ),
        .I4(qpllreset),
        .I5(rate_cpllreset),
        .O(cpllreset_i_1__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT5 #(
    .INIT(32'h81000010)) 
    cpllreset_i_2
       (.I0(\fsm_reg_n_0_[0] ),
        .I1(\fsm_reg_n_0_[2] ),
        .I2(\fsm_reg_n_0_[1] ),
        .I3(\fsm_reg_n_0_[3] ),
        .I4(\fsm_reg_n_0_[4] ),
        .O(qpllreset));
  FDRE #(
    .INIT(1'b0)) 
    cpllreset_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(cpllreset_i_1__0_n_0),
        .Q(rate_cpllreset),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE drp_done_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(drp_done),
        .Q(drp_done_reg1),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE drp_done_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(drp_done_reg1),
        .Q(drp_done_reg2),
        .R(out));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT5 #(
    .INIT(32'h40012400)) 
    drp_start_i_1
       (.I0(\fsm_reg_n_0_[4] ),
        .I1(\fsm_reg_n_0_[3] ),
        .I2(\fsm_reg_n_0_[1] ),
        .I3(\fsm_reg_n_0_[0] ),
        .I4(\fsm_reg_n_0_[2] ),
        .O(drp_start_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    drp_start_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(drp_start_i_1_n_0),
        .Q(rate_drp_start),
        .R(out));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT5 #(
    .INIT(32'h0800001A)) 
    drp_x16_i_1
       (.I0(\fsm_reg_n_0_[2] ),
        .I1(\fsm_reg_n_0_[0] ),
        .I2(\fsm_reg_n_0_[4] ),
        .I3(\fsm_reg_n_0_[3] ),
        .I4(\fsm_reg_n_0_[1] ),
        .O(drp_x16_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    drp_x16_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(drp_x16_i_1_n_0),
        .Q(rate_drp_x16),
        .R(out));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT5 #(
    .INIT(32'h40080072)) 
    drp_x16x20_mode_i_1
       (.I0(\fsm_reg_n_0_[4] ),
        .I1(\fsm_reg_n_0_[0] ),
        .I2(\fsm_reg_n_0_[2] ),
        .I3(\fsm_reg_n_0_[3] ),
        .I4(\fsm_reg_n_0_[1] ),
        .O(drp_x16x20_mode_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    drp_x16x20_mode_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(drp_x16x20_mode_i_1_n_0),
        .Q(rate_drp_x16x20_mode),
        .R(out));
  LUT6 #(
    .INIT(64'hAABAAAAAAABABABA)) 
    \fsm[0]_i_10 
       (.I0(\fsm[0]_i_13_n_0 ),
        .I1(\fsm[2]_i_5_n_0 ),
        .I2(\fsm_reg_n_0_[2] ),
        .I3(\fsm_reg_n_0_[0] ),
        .I4(\fsm_reg_n_0_[1] ),
        .I5(drp_done_reg2),
        .O(\fsm[0]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hBABAAAAABBBAABAA)) 
    \fsm[0]_i_11 
       (.I0(\fsm_reg_n_0_[2] ),
        .I1(\fsm_reg_n_0_[1] ),
        .I2(\fsm_reg_n_0_[0] ),
        .I3(mmcm_lock_reg2),
        .I4(drp_done_reg2),
        .I5(rxpmaresetdone_reg2),
        .O(\fsm[0]_i_11_n_0 ));
  LUT5 #(
    .INIT(32'h00DFDFDF)) 
    \fsm[0]_i_12 
       (.I0(rxresetdone_reg2),
        .I1(phystatus_reg2),
        .I2(txresetdone_reg2),
        .I3(\fsm[0]_i_5_0 ),
        .I4(\fsm[0]_i_5_1 ),
        .O(\fsm[0]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h080802A2000002A2)) 
    \fsm[0]_i_13 
       (.I0(\fsm[1]_i_9_n_0 ),
        .I1(\fsm_reg_n_0_[0] ),
        .I2(\fsm_reg_n_0_[1] ),
        .I3(txsync_done_reg2),
        .I4(\fsm_reg_n_0_[2] ),
        .I5(rxsync_done_reg2),
        .O(\fsm[0]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'hCCDDCCCCCCDDFCCC)) 
    \fsm[0]_i_1__0 
       (.I0(\fsm[0]_i_2__0_n_0 ),
        .I1(\fsm[0]_i_3_n_0 ),
        .I2(\fsm[0]_i_4_n_0 ),
        .I3(\fsm_reg_n_0_[3] ),
        .I4(\fsm_reg_n_0_[4] ),
        .I5(\fsm[0]_i_5_n_0 ),
        .O(fsm[0]));
  LUT6 #(
    .INIT(64'h00000000FF11FF1F)) 
    \fsm[0]_i_2__0 
       (.I0(\fsm[0]_i_6_n_0 ),
        .I1(\fsm[3]_i_6_n_0 ),
        .I2(\fsm_reg_n_0_[0] ),
        .I3(\fsm_reg_n_0_[1] ),
        .I4(drp_done_reg2),
        .I5(\fsm[0]_i_7_n_0 ),
        .O(\fsm[0]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF7F550000)) 
    \fsm[0]_i_3 
       (.I0(\fsm[0]_i_8_n_0 ),
        .I1(\fsm[2]_i_4_n_0 ),
        .I2(\fsm_reg_n_0_[0] ),
        .I3(\fsm_reg_n_0_[1] ),
        .I4(\fsm[0]_i_9_n_0 ),
        .I5(\fsm[0]_i_10_n_0 ),
        .O(\fsm[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00008000)) 
    \fsm[0]_i_4 
       (.I0(drp_done_reg2),
        .I1(\fsm[2]_i_4_n_0 ),
        .I2(rst_idle_reg2),
        .I3(\fsm_reg_n_0_[1] ),
        .I4(\fsm_reg_n_0_[0] ),
        .I5(\fsm[0]_i_11_n_0 ),
        .O(\fsm[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0CEE00000C220000)) 
    \fsm[0]_i_5 
       (.I0(\fsm[0]_i_12_n_0 ),
        .I1(\fsm_reg_n_0_[0] ),
        .I2(drp_done_reg2),
        .I3(\fsm_reg_n_0_[1] ),
        .I4(\fsm_reg_n_0_[2] ),
        .I5(\fsm[1]_i_7_n_0 ),
        .O(\fsm[0]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h4F)) 
    \fsm[0]_i_6 
       (.I0(resetovrd_done_reg2),
        .I1(\fsm_reg_n_0_[1] ),
        .I2(\fsm_reg_n_0_[2] ),
        .O(\fsm[0]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h2023ECEF00000000)) 
    \fsm[0]_i_7 
       (.I0(drp_done_reg2),
        .I1(\fsm_reg_n_0_[2] ),
        .I2(\fsm_reg_n_0_[0] ),
        .I3(rxpmaresetdone_reg2),
        .I4(resetovrd_done_reg2),
        .I5(\fsm_reg_n_0_[1] ),
        .O(\fsm[0]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF9009)) 
    \fsm[0]_i_8 
       (.I0(rate_in_reg2[0]),
        .I1(rate_in_reg1[0]),
        .I2(rate_in_reg2[1]),
        .I3(rate_in_reg1[1]),
        .I4(\fsm_reg_n_0_[0] ),
        .I5(\fsm_reg_n_0_[1] ),
        .O(\fsm[0]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \fsm[0]_i_9 
       (.I0(\fsm_reg_n_0_[2] ),
        .I1(\fsm_reg_n_0_[3] ),
        .I2(\fsm_reg_n_0_[4] ),
        .O(\fsm[0]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h00000000A0CA0000)) 
    \fsm[1]_i_10 
       (.I0(cplllock_reg2),
        .I1(qplllock_reg2),
        .I2(rate_in_reg2[1]),
        .I3(rate_in_reg2[0]),
        .I4(rst_idle_reg2),
        .I5(\fsm[2]_i_3_n_0 ),
        .O(\fsm[1]_i_10_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFF4)) 
    \fsm[1]_i_1__0 
       (.I0(\fsm[1]_i_2__0_n_0 ),
        .I1(\fsm[1]_i_3_n_0 ),
        .I2(\fsm[1]_i_4_n_0 ),
        .I3(\fsm[1]_i_5_n_0 ),
        .I4(\fsm[1]_i_6_n_0 ),
        .O(fsm[1]));
  LUT6 #(
    .INIT(64'h3B007F00FFFFFFFF)) 
    \fsm[1]_i_2__0 
       (.I0(\fsm_reg_n_0_[1] ),
        .I1(\fsm_reg_n_0_[0] ),
        .I2(drp_done_reg2),
        .I3(\fsm_reg_n_0_[2] ),
        .I4(\fsm[1]_i_7_n_0 ),
        .I5(\fsm[1]_i_8_n_0 ),
        .O(\fsm[1]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00BF0F00)) 
    \fsm[1]_i_3 
       (.I0(rst_idle_reg2),
        .I1(\fsm[2]_i_4_n_0 ),
        .I2(drp_done_reg2),
        .I3(\fsm_reg_n_0_[0] ),
        .I4(\fsm_reg_n_0_[1] ),
        .I5(\fsm_reg_n_0_[2] ),
        .O(\fsm[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h000000003B00FB00)) 
    \fsm[1]_i_4 
       (.I0(drp_done_reg2),
        .I1(\fsm_reg_n_0_[0] ),
        .I2(\fsm_reg_n_0_[2] ),
        .I3(\fsm_reg_n_0_[1] ),
        .I4(resetovrd_done_reg2),
        .I5(\fsm[2]_i_8_n_0 ),
        .O(\fsm[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0300770077000000)) 
    \fsm[1]_i_5 
       (.I0(rxsync_done_reg2),
        .I1(\fsm_reg_n_0_[2] ),
        .I2(txsync_done_reg2),
        .I3(\fsm[1]_i_9_n_0 ),
        .I4(\fsm_reg_n_0_[1] ),
        .I5(\fsm_reg_n_0_[0] ),
        .O(\fsm[1]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0400404015115050)) 
    \fsm[1]_i_6 
       (.I0(\fsm[2]_i_5_n_0 ),
        .I1(\fsm_reg_n_0_[2] ),
        .I2(\fsm_reg_n_0_[1] ),
        .I3(drp_done_reg2),
        .I4(\fsm_reg_n_0_[0] ),
        .I5(\fsm[1]_i_10_n_0 ),
        .O(\fsm[1]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \fsm[1]_i_7 
       (.I0(txdata_wait_cnt_reg[3]),
        .I1(txdata_wait_cnt_reg[2]),
        .I2(txdata_wait_cnt_reg[0]),
        .I3(txdata_wait_cnt_reg[1]),
        .O(\fsm[1]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \fsm[1]_i_8 
       (.I0(\fsm_reg_n_0_[3] ),
        .I1(\fsm_reg_n_0_[4] ),
        .O(\fsm[1]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \fsm[1]_i_9 
       (.I0(\fsm_reg_n_0_[4] ),
        .I1(\fsm_reg_n_0_[3] ),
        .O(\fsm[1]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \fsm[2]_i_10 
       (.I0(\fsm_reg_n_0_[0] ),
        .I1(drp_done_reg2),
        .O(\fsm[2]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hF0FFF0FC404C404C)) 
    \fsm[2]_i_11 
       (.I0(\fsm[2]_i_12_n_0 ),
        .I1(\fsm[1]_i_8_n_0 ),
        .I2(\fsm_reg_n_0_[2] ),
        .I3(\fsm[2]_i_3_n_0 ),
        .I4(txsync_done_reg2),
        .I5(\fsm[3]_i_4_n_0 ),
        .O(\fsm[2]_i_11_n_0 ));
  LUT3 #(
    .INIT(8'h2A)) 
    \fsm[2]_i_12 
       (.I0(\fsm_reg_n_0_[1] ),
        .I1(\fsm_reg_n_0_[0] ),
        .I2(drp_done_reg2),
        .O(\fsm[2]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF0000D7D5)) 
    \fsm[2]_i_1__0 
       (.I0(\fsm[2]_i_2_n_0 ),
        .I1(\fsm_reg_n_0_[2] ),
        .I2(\fsm[2]_i_3_n_0 ),
        .I3(\fsm[2]_i_4_n_0 ),
        .I4(\fsm[2]_i_5_n_0 ),
        .I5(\fsm[2]_i_6_n_0 ),
        .O(fsm[2]));
  LUT6 #(
    .INIT(64'hFFFFFFFFF5FF7D77)) 
    \fsm[2]_i_2 
       (.I0(\fsm[2]_i_7_n_0 ),
        .I1(rate_in_reg2[0]),
        .I2(rate_in_reg2[1]),
        .I3(rate_in_reg1[0]),
        .I4(rate_in_reg1[1]),
        .I5(\fsm_reg_n_0_[2] ),
        .O(\fsm[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \fsm[2]_i_3 
       (.I0(\fsm_reg_n_0_[1] ),
        .I1(\fsm_reg_n_0_[0] ),
        .O(\fsm[2]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \fsm[2]_i_4 
       (.I0(qplllock_reg2),
        .I1(rate_in_reg2[1]),
        .I2(rate_in_reg2[0]),
        .I3(cplllock_reg2),
        .O(\fsm[2]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \fsm[2]_i_5 
       (.I0(\fsm_reg_n_0_[4] ),
        .I1(\fsm_reg_n_0_[3] ),
        .O(\fsm[2]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF55540000)) 
    \fsm[2]_i_6 
       (.I0(\fsm[2]_i_8_n_0 ),
        .I1(\fsm[2]_i_9_n_0 ),
        .I2(\fsm[2]_i_10_n_0 ),
        .I3(\fsm_reg_n_0_[2] ),
        .I4(\fsm[3]_i_5_n_0 ),
        .I5(\fsm[2]_i_11_n_0 ),
        .O(\fsm[2]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \fsm[2]_i_7 
       (.I0(\fsm_reg_n_0_[1] ),
        .I1(\fsm_reg_n_0_[0] ),
        .O(\fsm[2]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \fsm[2]_i_8 
       (.I0(\fsm_reg_n_0_[3] ),
        .I1(\fsm_reg_n_0_[4] ),
        .O(\fsm[2]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \fsm[2]_i_9 
       (.I0(\fsm_reg_n_0_[0] ),
        .I1(\fsm_reg_n_0_[1] ),
        .O(\fsm[2]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFCFDFCFCFCFDFFFC)) 
    \fsm[3]_i_1__0 
       (.I0(\fsm[3]_i_2_n_0 ),
        .I1(\fsm[3]_i_3_n_0 ),
        .I2(\fsm[3]_i_4_n_0 ),
        .I3(\fsm_reg_n_0_[4] ),
        .I4(\fsm_reg_n_0_[3] ),
        .I5(\fsm[3]_i_5_n_0 ),
        .O(fsm[3]));
  LUT6 #(
    .INIT(64'h22220000AAEA0000)) 
    \fsm[3]_i_2 
       (.I0(\fsm_reg_n_0_[2] ),
        .I1(drp_done_reg2),
        .I2(\fsm[2]_i_4_n_0 ),
        .I3(rst_idle_reg2),
        .I4(\fsm_reg_n_0_[1] ),
        .I5(\fsm_reg_n_0_[0] ),
        .O(\fsm[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h1101010101010101)) 
    \fsm[3]_i_3 
       (.I0(\fsm_reg_n_0_[3] ),
        .I1(\fsm_reg_n_0_[4] ),
        .I2(\fsm[2]_i_2_n_0 ),
        .I3(\fsm_reg_n_0_[0] ),
        .I4(\fsm_reg_n_0_[1] ),
        .I5(\fsm_reg_n_0_[2] ),
        .O(\fsm[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0088080088888888)) 
    \fsm[3]_i_4 
       (.I0(\fsm_reg_n_0_[3] ),
        .I1(\fsm_reg_n_0_[4] ),
        .I2(rxsync_done_reg2),
        .I3(\fsm_reg_n_0_[1] ),
        .I4(\fsm_reg_n_0_[0] ),
        .I5(\fsm_reg_n_0_[2] ),
        .O(\fsm[3]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h77F5F7F5)) 
    \fsm[3]_i_5 
       (.I0(\fsm_reg_n_0_[2] ),
        .I1(resetovrd_done_reg2),
        .I2(\fsm[3]_i_6_n_0 ),
        .I3(\fsm_reg_n_0_[1] ),
        .I4(\fsm_reg_n_0_[0] ),
        .O(\fsm[3]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h01000101FFFFFFFF)) 
    \fsm[3]_i_6 
       (.I0(ratedone),
        .I1(\fsm[3]_i_5_0 ),
        .I2(gen3_exit),
        .I3(rate_in_reg2[0]),
        .I4(rate_in_reg2[1]),
        .I5(\fsm_reg_n_0_[0] ),
        .O(\fsm[3]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h002AFF2AFF2AFF2A)) 
    \fsm[4]_i_1__0 
       (.I0(\fsm[4]_i_2_n_0 ),
        .I1(\fsm_reg_n_0_[0] ),
        .I2(drp_done_reg2),
        .I3(\fsm_reg_n_0_[4] ),
        .I4(\fsm_reg_n_0_[3] ),
        .I5(\fsm[4]_i_3_n_0 ),
        .O(fsm[4]));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \fsm[4]_i_2 
       (.I0(\fsm_reg_n_0_[2] ),
        .I1(\fsm_reg_n_0_[3] ),
        .I2(\fsm_reg_n_0_[1] ),
        .O(\fsm[4]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hA282)) 
    \fsm[4]_i_3 
       (.I0(\fsm_reg_n_0_[2] ),
        .I1(\fsm_reg_n_0_[0] ),
        .I2(\fsm_reg_n_0_[1] ),
        .I3(rxsync_done_reg2),
        .O(\fsm[4]_i_3_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \fsm_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(fsm[0]),
        .Q(\fsm_reg_n_0_[0] ),
        .S(out));
  FDSE #(
    .INIT(1'b0)) 
    \fsm_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(fsm[1]),
        .Q(\fsm_reg_n_0_[1] ),
        .S(out));
  FDRE #(
    .INIT(1'b0)) 
    \fsm_reg[2] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(fsm[2]),
        .Q(\fsm_reg_n_0_[2] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \fsm_reg[3] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(fsm[3]),
        .Q(\fsm_reg_n_0_[3] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \fsm_reg[4] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(fsm[4]),
        .Q(\fsm_reg_n_0_[4] ),
        .R(out));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    gen3_exit_i_1
       (.I0(rate_in_reg2[0]),
        .I1(rate_in_reg2[1]),
        .I2(\fsm_reg_n_0_[4] ),
        .I3(gen3_exit_i_2_n_0),
        .I4(gen3_exit),
        .O(gen3_exit_i_1_n_0));
  LUT6 #(
    .INIT(64'h8800000000000001)) 
    gen3_exit_i_2
       (.I0(\fsm_reg_n_0_[4] ),
        .I1(\fsm_reg_n_0_[3] ),
        .I2(gen3_exit_i_3_n_0),
        .I3(\fsm_reg_n_0_[2] ),
        .I4(\fsm_reg_n_0_[0] ),
        .I5(\fsm_reg_n_0_[1] ),
        .O(gen3_exit_i_2_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    gen3_exit_i_3
       (.I0(rate_in_reg1[1]),
        .I1(rate_in_reg2[1]),
        .I2(rate_in_reg1[0]),
        .I3(rate_in_reg2[0]),
        .O(gen3_exit_i_3_n_0));
  FDRE #(
    .INIT(1'b0)) 
    gen3_exit_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(gen3_exit_i_1_n_0),
        .Q(gen3_exit),
        .R(out));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    gen3_i_1
       (.I0(rate_in_reg2[0]),
        .I1(rate_in_reg2[1]),
        .I2(\fsm_reg_n_0_[4] ),
        .I3(gen3_i_2_n_0),
        .I4(QPLL_DRP_GEN3),
        .O(gen3_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT5 #(
    .INIT(32'h80000040)) 
    gen3_i_2
       (.I0(\fsm_reg_n_0_[4] ),
        .I1(\fsm_reg_n_0_[3] ),
        .I2(\fsm_reg_n_0_[0] ),
        .I3(\fsm_reg_n_0_[2] ),
        .I4(\fsm_reg_n_0_[1] ),
        .O(gen3_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    gen3_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(gen3_i_1_n_0),
        .Q(QPLL_DRP_GEN3),
        .R(out));
  LUT1 #(
    .INIT(2'h1)) 
    \gtx_channel.gtxe2_channel_i_i_5 
       (.I0(QPLL_DRP_GEN3),
        .O(RX8B10BEN0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE mmcm_lock_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(pipe_mmcm_lock_in),
        .Q(mmcm_lock_reg1),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE mmcm_lock_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(mmcm_lock_reg1),
        .Q(mmcm_lock_reg2),
        .R(out));
  LUT5 #(
    .INIT(32'h06FF0600)) 
    pclk_sel_i_1
       (.I0(rate_in_reg2[1]),
        .I1(rate_in_reg2[0]),
        .I2(\fsm_reg_n_0_[4] ),
        .I3(pclk_sel_i_2_n_0),
        .I4(pipe_pclk_sel_out),
        .O(pclk_sel_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT5 #(
    .INIT(32'h80201000)) 
    pclk_sel_i_2
       (.I0(\fsm_reg_n_0_[2] ),
        .I1(\fsm_reg_n_0_[4] ),
        .I2(\fsm_reg_n_0_[3] ),
        .I3(\fsm_reg_n_0_[0] ),
        .I4(\fsm_reg_n_0_[1] ),
        .O(pclk_sel_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    pclk_sel_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(pclk_sel_i_1_n_0),
        .Q(pipe_pclk_sel_out),
        .R(out));
  LUT3 #(
    .INIT(8'hC8)) 
    phystatus_i_1
       (.I0(phystatus_reg2),
        .I1(txratedone_i_2_n_0),
        .I2(phystatus),
        .O(phystatus_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    phystatus_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(phystatus_i_1_n_0),
        .Q(phystatus),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE phystatus_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(gt_phystatus),
        .Q(phystatus_reg1),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE phystatus_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(phystatus_reg1),
        .Q(phystatus_reg2),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE qplllock_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(QRST_QPLLLOCK),
        .Q(qplllock_reg1),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE qplllock_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(qplllock_reg1),
        .Q(qplllock_reg2),
        .R(out));
  LUT6 #(
    .INIT(64'h00B0FFFF00B00000)) 
    qpllpd_i_1__0
       (.I0(rate_in_reg2[0]),
        .I1(rate_in_reg2[1]),
        .I2(\fsm_reg_n_0_[4] ),
        .I3(\fsm_reg_n_0_[2] ),
        .I4(qpllpd),
        .I5(QRST_QPLLPD_IN),
        .O(qpllpd_i_1__0_n_0));
  FDRE #(
    .INIT(1'b0)) 
    qpllpd_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(qpllpd_i_1__0_n_0),
        .Q(QRST_QPLLPD_IN),
        .R(out));
  LUT6 #(
    .INIT(64'h00B0FFFF00B00000)) 
    qpllreset_i_1__0
       (.I0(rate_in_reg2[0]),
        .I1(rate_in_reg2[1]),
        .I2(\fsm_reg_n_0_[4] ),
        .I3(\fsm_reg_n_0_[2] ),
        .I4(qpllreset),
        .I5(QRST_QPLLRESET_IN),
        .O(qpllreset_i_1__0_n_0));
  FDRE #(
    .INIT(1'b0)) 
    qpllreset_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(qpllreset_i_1__0_n_0),
        .Q(QRST_QPLLRESET_IN),
        .R(out));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT5 #(
    .INIT(32'h00000080)) 
    rate_done_reg1_i_1
       (.I0(\fsm_reg_n_0_[2] ),
        .I1(\fsm_reg_n_0_[4] ),
        .I2(\fsm_reg_n_0_[3] ),
        .I3(\fsm_reg_n_0_[0] ),
        .I4(\fsm_reg_n_0_[1] ),
        .O(\fsm_reg[2]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    \rate_idle_reg1[0]_i_1 
       (.I0(\fsm_reg_n_0_[4] ),
        .I1(\fsm_reg_n_0_[3] ),
        .I2(\fsm_reg_n_0_[2] ),
        .I3(\fsm_reg_n_0_[0] ),
        .I4(\fsm_reg_n_0_[1] ),
        .O(\fsm_reg[4]_0 ));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rate_in_reg1_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(pipe_tx_rate),
        .Q(rate_in_reg1[0]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rate_in_reg1_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(rate_in_reg1[1]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rate_in_reg2_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rate_in_reg1[0]),
        .Q(rate_in_reg2[0]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rate_in_reg2_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rate_in_reg1[1]),
        .Q(rate_in_reg2[1]),
        .R(out));
  LUT6 #(
    .INIT(64'h0444FFFF04440000)) 
    \rate_out[0]_i_1 
       (.I0(rate_in_reg2[1]),
        .I1(rate_in_reg2[0]),
        .I2(\fsm_reg_n_0_[3] ),
        .I3(\fsm_reg_n_0_[4] ),
        .I4(\rate_out[0]_i_2_n_0 ),
        .I5(RXRATE),
        .O(\rate_out[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8000040080000600)) 
    \rate_out[0]_i_2 
       (.I0(\fsm_reg_n_0_[3] ),
        .I1(\fsm_reg_n_0_[4] ),
        .I2(\fsm_reg_n_0_[2] ),
        .I3(\fsm_reg_n_0_[0] ),
        .I4(\fsm_reg_n_0_[1] ),
        .I5(\rate_out[0]_i_3_n_0 ),
        .O(\rate_out[0]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h45)) 
    \rate_out[0]_i_3 
       (.I0(gen3_exit),
        .I1(rate_in_reg2[0]),
        .I2(rate_in_reg2[1]),
        .O(\rate_out[0]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rate_out_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\rate_out[0]_i_1_n_0 ),
        .Q(RXRATE),
        .R(out));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT5 #(
    .INIT(32'h28000000)) 
    rate_rxsync_reg1_i_1
       (.I0(\fsm_reg_n_0_[2] ),
        .I1(\fsm_reg_n_0_[0] ),
        .I2(\fsm_reg_n_0_[1] ),
        .I3(\fsm_reg_n_0_[3] ),
        .I4(\fsm_reg_n_0_[4] ),
        .O(\fsm_reg[2]_2 ));
  LUT5 #(
    .INIT(32'hFF008000)) 
    ratedone_i_1
       (.I0(txratedone),
        .I1(phystatus),
        .I2(rxratedone),
        .I3(txratedone_i_2_n_0),
        .I4(ratedone),
        .O(ratedone_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    ratedone_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(ratedone_i_1_n_0),
        .Q(ratedone),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE resetovrd_done_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b1),
        .Q(resetovrd_done_reg1),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE resetovrd_done_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(resetovrd_done_reg1),
        .Q(resetovrd_done_reg2),
        .R(out));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT5 #(
    .INIT(32'h00400000)) 
    resetovrd_start_reg1_i_1
       (.I0(\fsm_reg_n_0_[0] ),
        .I1(\fsm_reg_n_0_[1] ),
        .I2(\fsm_reg_n_0_[2] ),
        .I3(\fsm_reg_n_0_[3] ),
        .I4(\fsm_reg_n_0_[4] ),
        .O(\fsm_reg[0]_0 ));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rst_idle_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(Q[1]),
        .Q(rst_idle_reg1),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rst_idle_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rst_idle_reg1),
        .Q(rst_idle_reg2),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rxpmaresetdone_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(rxpmaresetdone_reg1),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rxpmaresetdone_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxpmaresetdone_reg1),
        .Q(rxpmaresetdone_reg2),
        .R(out));
  LUT3 #(
    .INIT(8'hC8)) 
    rxratedone_i_1
       (.I0(rxratedone_reg2),
        .I1(txratedone_i_2_n_0),
        .I2(rxratedone),
        .O(rxratedone_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    rxratedone_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxratedone_i_1_n_0),
        .Q(rxratedone),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rxratedone_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(gt_rxratedone),
        .Q(rxratedone_reg1),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rxratedone_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxratedone_reg1),
        .Q(rxratedone_reg2),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rxresetdone_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(gt_rxresetdone_0),
        .Q(rxresetdone_reg1),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rxresetdone_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxresetdone_reg1),
        .Q(rxresetdone_reg2),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rxsync_done_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(rxsync_done_reg1),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rxsync_done_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxsync_done_reg1),
        .Q(rxsync_done_reg2),
        .R(out));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT5 #(
    .INIT(32'h00800000)) 
    rxsync_start_reg1_i_1
       (.I0(\fsm_reg_n_0_[2] ),
        .I1(\fsm_reg_n_0_[4] ),
        .I2(\fsm_reg_n_0_[3] ),
        .I3(\fsm_reg_n_0_[1] ),
        .I4(\fsm_reg_n_0_[0] ),
        .O(\fsm_reg[2]_0 ));
  LUT6 #(
    .INIT(64'hF3FFFFFB00000008)) 
    \sysclksel[0]_i_1 
       (.I0(\sysclksel[0]_i_2_n_0 ),
        .I1(\fsm_reg_n_0_[2] ),
        .I2(\fsm[2]_i_3_n_0 ),
        .I3(\fsm_reg_n_0_[3] ),
        .I4(\fsm_reg_n_0_[4] ),
        .I5(RXSYSCLKSEL),
        .O(\sysclksel[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \sysclksel[0]_i_2 
       (.I0(rate_in_reg2[1]),
        .I1(rate_in_reg2[0]),
        .O(\sysclksel[0]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sysclksel_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\sysclksel[0]_i_1_n_0 ),
        .Q(RXSYSCLKSEL),
        .R(out));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT5 #(
    .INIT(32'h80AA00AA)) 
    \txdata_wait_cnt[0]_i_1 
       (.I0(\txdata_wait_cnt[3]_i_2_n_0 ),
        .I1(txdata_wait_cnt_reg[3]),
        .I2(txdata_wait_cnt_reg[2]),
        .I3(txdata_wait_cnt_reg[0]),
        .I4(txdata_wait_cnt_reg[1]),
        .O(p_0_in__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT5 #(
    .INIT(32'hA8282828)) 
    \txdata_wait_cnt[1]_i_1 
       (.I0(\txdata_wait_cnt[3]_i_2_n_0 ),
        .I1(txdata_wait_cnt_reg[0]),
        .I2(txdata_wait_cnt_reg[1]),
        .I3(txdata_wait_cnt_reg[3]),
        .I4(txdata_wait_cnt_reg[2]),
        .O(p_0_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT5 #(
    .INIT(32'h8AA0A0A0)) 
    \txdata_wait_cnt[2]_i_1 
       (.I0(\txdata_wait_cnt[3]_i_2_n_0 ),
        .I1(txdata_wait_cnt_reg[3]),
        .I2(txdata_wait_cnt_reg[2]),
        .I3(txdata_wait_cnt_reg[0]),
        .I4(txdata_wait_cnt_reg[1]),
        .O(p_0_in__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT5 #(
    .INIT(32'hA8888888)) 
    \txdata_wait_cnt[3]_i_1 
       (.I0(\txdata_wait_cnt[3]_i_2_n_0 ),
        .I1(txdata_wait_cnt_reg[3]),
        .I2(txdata_wait_cnt_reg[1]),
        .I3(txdata_wait_cnt_reg[0]),
        .I4(txdata_wait_cnt_reg[2]),
        .O(p_0_in__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT5 #(
    .INIT(32'h00400000)) 
    \txdata_wait_cnt[3]_i_2 
       (.I0(\fsm_reg_n_0_[1] ),
        .I1(\fsm_reg_n_0_[0] ),
        .I2(\fsm_reg_n_0_[3] ),
        .I3(\fsm_reg_n_0_[4] ),
        .I4(\fsm_reg_n_0_[2] ),
        .O(\txdata_wait_cnt[3]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \txdata_wait_cnt_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(p_0_in__0[0]),
        .Q(txdata_wait_cnt_reg[0]),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \txdata_wait_cnt_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(p_0_in__0[1]),
        .Q(txdata_wait_cnt_reg[1]),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \txdata_wait_cnt_reg[2] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(p_0_in__0[2]),
        .Q(txdata_wait_cnt_reg[2]),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \txdata_wait_cnt_reg[3] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(p_0_in__0[3]),
        .Q(txdata_wait_cnt_reg[3]),
        .R(out));
  LUT6 #(
    .INIT(64'h5504FFFF55040000)) 
    txpmareset_i_1
       (.I0(\fsm_reg_n_0_[3] ),
        .I1(rate_in_reg2[1]),
        .I2(rate_in_reg2[0]),
        .I3(gen3_exit),
        .I4(txpmareset_i_2_n_0),
        .I5(rate_rxpmareset),
        .O(txpmareset_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT5 #(
    .INIT(32'h80080200)) 
    txpmareset_i_2
       (.I0(\fsm_reg_n_0_[1] ),
        .I1(\fsm_reg_n_0_[0] ),
        .I2(\fsm_reg_n_0_[4] ),
        .I3(\fsm_reg_n_0_[2] ),
        .I4(\fsm_reg_n_0_[3] ),
        .O(txpmareset_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    txpmareset_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txpmareset_i_1_n_0),
        .Q(rate_rxpmareset),
        .R(out));
  LUT3 #(
    .INIT(8'hC8)) 
    txratedone_i_1
       (.I0(txratedone_reg2),
        .I1(txratedone_i_2_n_0),
        .I2(txratedone),
        .O(txratedone_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT5 #(
    .INIT(32'h00004000)) 
    txratedone_i_2
       (.I0(\fsm_reg_n_0_[1] ),
        .I1(\fsm_reg_n_0_[2] ),
        .I2(\fsm_reg_n_0_[4] ),
        .I3(\fsm_reg_n_0_[0] ),
        .I4(\fsm_reg_n_0_[3] ),
        .O(txratedone_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    txratedone_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txratedone_i_1_n_0),
        .Q(txratedone),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE txratedone_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(gt_txratedone),
        .Q(txratedone_reg1),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE txratedone_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txratedone_reg1),
        .Q(txratedone_reg2),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE txresetdone_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(gt_txresetdone_0),
        .Q(txresetdone_reg1),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE txresetdone_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txresetdone_reg1),
        .Q(txresetdone_reg2),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE txsync_done_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(sync_txsync_done),
        .Q(txsync_done_reg1),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE txsync_done_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txsync_done_reg1),
        .Q(txsync_done_reg2),
        .R(out));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAEAAA)) 
    txsync_start_reg1_i_1
       (.I0(Q[0]),
        .I1(\fsm_reg_n_0_[1] ),
        .I2(\fsm_reg_n_0_[3] ),
        .I3(\fsm_reg_n_0_[4] ),
        .I4(\fsm_reg_n_0_[2] ),
        .I5(\fsm_reg_n_0_[0] ),
        .O(SYNC_TXSYNC_START0));
endmodule

module pcie_7x_0_pipe_reset
   (out,
    rxusrclk_rst_reg2_reg_0,
    dclk_rst_reg2_reg_0,
    reset_n_reg2_reg,
    rst_gtreset,
    rst_userrdy,
    CPLLRESET0,
    Q,
    pipe_mmcm_lock_in,
    pipe_pclk_in,
    user_resetdone,
    QRST_CPLLLOCK,
    \rate_idle_reg1_reg[0]_0 ,
    drp_done,
    gt_phystatus,
    sync_txsync_done,
    pipe_rxusrclk_in,
    pipe_dclk_in,
    QRST_IDLE,
    user_rxcdrlock,
    \cfg_wait_cnt_reg[5]_0 ,
    rate_cpllreset,
    cpllrst);
  output out;
  output rxusrclk_rst_reg2_reg_0;
  output dclk_rst_reg2_reg_0;
  output reset_n_reg2_reg;
  output rst_gtreset;
  output rst_userrdy;
  output CPLLRESET0;
  output [1:0]Q;
  input pipe_mmcm_lock_in;
  input pipe_pclk_in;
  input user_resetdone;
  input [0:0]QRST_CPLLLOCK;
  input \rate_idle_reg1_reg[0]_0 ;
  input drp_done;
  input gt_phystatus;
  input sync_txsync_done;
  input pipe_rxusrclk_in;
  input pipe_dclk_in;
  input QRST_IDLE;
  input user_rxcdrlock;
  input \cfg_wait_cnt_reg[5]_0 ;
  input rate_cpllreset;
  input cpllrst;

  wire CPLLRESET0;
  wire \FSM_onehot_fsm[0]_i_1_n_0 ;
  wire \FSM_onehot_fsm[10]_i_1_n_0 ;
  wire \FSM_onehot_fsm[13]_i_1_n_0 ;
  wire \FSM_onehot_fsm[14]_i_2_n_0 ;
  wire \FSM_onehot_fsm[1]_i_1_n_0 ;
  wire \FSM_onehot_fsm[1]_i_2_n_0 ;
  wire \FSM_onehot_fsm[2]_i_1_n_0 ;
  wire \FSM_onehot_fsm[3]_i_1_n_0 ;
  wire \FSM_onehot_fsm[4]_i_1_n_0 ;
  wire \FSM_onehot_fsm[5]_i_1_n_0 ;
  wire \FSM_onehot_fsm[8]_i_1_n_0 ;
  wire \FSM_onehot_fsm[9]_i_1_n_0 ;
  wire \FSM_onehot_fsm_reg_n_0_[0] ;
  wire \FSM_onehot_fsm_reg_n_0_[13] ;
  wire \FSM_onehot_fsm_reg_n_0_[14] ;
  wire \FSM_onehot_fsm_reg_n_0_[1] ;
  wire \FSM_onehot_fsm_reg_n_0_[4] ;
  wire \FSM_onehot_fsm_reg_n_0_[8] ;
  wire \FSM_onehot_fsm_reg_n_0_[9] ;
  wire [1:0]Q;
  wire [0:0]QRST_CPLLLOCK;
  wire QRST_IDLE;
  wire \cfg_wait_cnt[5]_i_2_n_0 ;
  wire [5:0]cfg_wait_cnt_reg;
  wire \cfg_wait_cnt_reg[5]_0 ;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire cplllock_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire cplllock_reg2;
  wire cpllpd;
  wire cpllreset;
  wire cpllreset_i_1_n_0;
  wire cpllreset_i_2__0_n_0;
  wire cpllrst;
  wire dclk_rst;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire dclk_rst_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire dclk_rst_reg2;
  wire drp_done;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire drp_done_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire drp_done_reg2;
  wire gt_phystatus;
  wire gtreset_i_1_n_0;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire mmcm_lock_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire mmcm_lock_reg2;
  wire [5:0]p_0_in;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire phystatus_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire phystatus_reg2;
  wire pipe_dclk_in;
  wire pipe_mmcm_lock_in;
  wire pipe_pclk_in;
  wire pipe_rxusrclk_in;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire qpll_idle_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire qpll_idle_reg2;
  wire rate_cpllreset;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rate_idle_reg1;
  wire \rate_idle_reg1_reg[0]_0 ;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rate_idle_reg2;
  wire reset_n_reg2_reg;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire resetdone_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire resetdone_reg2;
  wire rst_gtreset;
  wire rst_userrdy;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rxcdrlock_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rxcdrlock_reg2;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rxpmaresetdone_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rxpmaresetdone_reg2;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rxusrclk_rst_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rxusrclk_rst_reg2;
  wire sync_txsync_done;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire txsync_done_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire txsync_done_reg2;
  wire user_resetdone;
  wire user_rxcdrlock;
  wire userrdy;
  wire userrdy_i_1_n_0;

  assign dclk_rst_reg2_reg_0 = dclk_rst_reg2;
  assign out = cpllreset;
  assign rxusrclk_rst_reg2_reg_0 = rxusrclk_rst_reg2;
  LUT5 #(
    .INIT(32'hFFF44444)) 
    \FSM_onehot_fsm[0]_i_1 
       (.I0(\FSM_onehot_fsm[1]_i_2_n_0 ),
        .I1(\FSM_onehot_fsm_reg_n_0_[1] ),
        .I2(resetdone_reg2),
        .I3(cplllock_reg2),
        .I4(\FSM_onehot_fsm_reg_n_0_[0] ),
        .O(\FSM_onehot_fsm[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hEA)) 
    \FSM_onehot_fsm[10]_i_1 
       (.I0(Q[1]),
        .I1(\FSM_onehot_fsm_reg_n_0_[9] ),
        .I2(txsync_done_reg2),
        .O(\FSM_onehot_fsm[10]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \FSM_onehot_fsm[13]_i_1 
       (.I0(rate_idle_reg2),
        .I1(\FSM_onehot_fsm_reg_n_0_[14] ),
        .O(\FSM_onehot_fsm[13]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \FSM_onehot_fsm[14]_i_1 
       (.I0(\cfg_wait_cnt_reg[5]_0 ),
        .O(reset_n_reg2_reg));
  LUT4 #(
    .INIT(16'hF444)) 
    \FSM_onehot_fsm[14]_i_2 
       (.I0(rate_idle_reg2),
        .I1(\FSM_onehot_fsm_reg_n_0_[14] ),
        .I2(\FSM_onehot_fsm_reg_n_0_[8] ),
        .I3(cplllock_reg2),
        .O(\FSM_onehot_fsm[14]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \FSM_onehot_fsm[1]_i_1 
       (.I0(\FSM_onehot_fsm_reg_n_0_[1] ),
        .I1(\FSM_onehot_fsm[1]_i_2_n_0 ),
        .O(\FSM_onehot_fsm[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \FSM_onehot_fsm[1]_i_2 
       (.I0(cfg_wait_cnt_reg[2]),
        .I1(cfg_wait_cnt_reg[0]),
        .I2(cfg_wait_cnt_reg[1]),
        .I3(cfg_wait_cnt_reg[4]),
        .I4(cfg_wait_cnt_reg[3]),
        .I5(cfg_wait_cnt_reg[5]),
        .O(\FSM_onehot_fsm[1]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \FSM_onehot_fsm[2]_i_1 
       (.I0(\FSM_onehot_fsm_reg_n_0_[4] ),
        .I1(phystatus_reg2),
        .I2(resetdone_reg2),
        .O(\FSM_onehot_fsm[2]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hEA)) 
    \FSM_onehot_fsm[3]_i_1 
       (.I0(cpllpd),
        .I1(Q[0]),
        .I2(txsync_done_reg2),
        .O(\FSM_onehot_fsm[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFF8F8888)) 
    \FSM_onehot_fsm[4]_i_1 
       (.I0(userrdy),
        .I1(mmcm_lock_reg2),
        .I2(resetdone_reg2),
        .I3(phystatus_reg2),
        .I4(\FSM_onehot_fsm_reg_n_0_[4] ),
        .O(\FSM_onehot_fsm[4]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hBA)) 
    \FSM_onehot_fsm[5]_i_1 
       (.I0(\FSM_onehot_fsm_reg_n_0_[13] ),
        .I1(mmcm_lock_reg2),
        .I2(userrdy),
        .O(\FSM_onehot_fsm[5]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h00F2)) 
    \FSM_onehot_fsm[8]_i_1 
       (.I0(\FSM_onehot_fsm_reg_n_0_[0] ),
        .I1(resetdone_reg2),
        .I2(\FSM_onehot_fsm_reg_n_0_[8] ),
        .I3(cplllock_reg2),
        .O(\FSM_onehot_fsm[8]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h54)) 
    \FSM_onehot_fsm[9]_i_1 
       (.I0(txsync_done_reg2),
        .I1(\FSM_onehot_fsm_reg_n_0_[9] ),
        .I2(Q[0]),
        .O(\FSM_onehot_fsm[9]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "FSM_CPLL_PD:00000000000000100,FSM_RESETDONE:00000000000010000,FSM_MMCM_LOCK:00000000000100000,FSM_DRP_X16_START:00000000001000000,FSM_CPLLRESET:00000000000000001,FSM_TXSYNC_DONE:00000001000000000,FSM_CFG_WAIT:00000000000000010,FSM_DRP_X20_DONE:00000100000000000,FSM_IDLE:00000010000000000,FSM_DRP_X20_START:00001000000000000,FSM_GTRESET:00010000000000000,FSM_DRP:00100000000000000,FSM_RXPMARESETDONE_2:01000000000000000,FSM_RXPMARESETDONE_1:10000000000000000,FSM_CPLLLOCK:00000000100000000,FSM_DRP_X16_DONE:00000000010000000,FSM_TXSYNC_START:00000000000001000" *) 
  FDRE #(
    .INIT(1'b1)) 
    \FSM_onehot_fsm_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\FSM_onehot_fsm[0]_i_1_n_0 ),
        .Q(\FSM_onehot_fsm_reg_n_0_[0] ),
        .R(reset_n_reg2_reg));
  (* FSM_ENCODED_STATES = "FSM_CPLL_PD:00000000000000100,FSM_RESETDONE:00000000000010000,FSM_MMCM_LOCK:00000000000100000,FSM_DRP_X16_START:00000000001000000,FSM_CPLLRESET:00000000000000001,FSM_TXSYNC_DONE:00000001000000000,FSM_CFG_WAIT:00000000000000010,FSM_DRP_X20_DONE:00000100000000000,FSM_IDLE:00000010000000000,FSM_DRP_X20_START:00001000000000000,FSM_GTRESET:00010000000000000,FSM_DRP:00100000000000000,FSM_RXPMARESETDONE_2:01000000000000000,FSM_RXPMARESETDONE_1:10000000000000000,FSM_CPLLLOCK:00000000100000000,FSM_DRP_X16_DONE:00000000010000000,FSM_TXSYNC_START:00000000000001000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_fsm_reg[10] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\FSM_onehot_fsm[10]_i_1_n_0 ),
        .Q(Q[1]),
        .R(reset_n_reg2_reg));
  (* FSM_ENCODED_STATES = "FSM_CPLL_PD:00000000000000100,FSM_RESETDONE:00000000000010000,FSM_MMCM_LOCK:00000000000100000,FSM_DRP_X16_START:00000000001000000,FSM_CPLLRESET:00000000000000001,FSM_TXSYNC_DONE:00000001000000000,FSM_CFG_WAIT:00000000000000010,FSM_DRP_X20_DONE:00000100000000000,FSM_IDLE:00000010000000000,FSM_DRP_X20_START:00001000000000000,FSM_GTRESET:00010000000000000,FSM_DRP:00100000000000000,FSM_RXPMARESETDONE_2:01000000000000000,FSM_RXPMARESETDONE_1:10000000000000000,FSM_CPLLLOCK:00000000100000000,FSM_DRP_X16_DONE:00000000010000000,FSM_TXSYNC_START:00000000000001000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_fsm_reg[13] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\FSM_onehot_fsm[13]_i_1_n_0 ),
        .Q(\FSM_onehot_fsm_reg_n_0_[13] ),
        .R(reset_n_reg2_reg));
  (* FSM_ENCODED_STATES = "FSM_CPLL_PD:00000000000000100,FSM_RESETDONE:00000000000010000,FSM_MMCM_LOCK:00000000000100000,FSM_DRP_X16_START:00000000001000000,FSM_CPLLRESET:00000000000000001,FSM_TXSYNC_DONE:00000001000000000,FSM_CFG_WAIT:00000000000000010,FSM_DRP_X20_DONE:00000100000000000,FSM_IDLE:00000010000000000,FSM_DRP_X20_START:00001000000000000,FSM_GTRESET:00010000000000000,FSM_DRP:00100000000000000,FSM_RXPMARESETDONE_2:01000000000000000,FSM_RXPMARESETDONE_1:10000000000000000,FSM_CPLLLOCK:00000000100000000,FSM_DRP_X16_DONE:00000000010000000,FSM_TXSYNC_START:00000000000001000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_fsm_reg[14] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\FSM_onehot_fsm[14]_i_2_n_0 ),
        .Q(\FSM_onehot_fsm_reg_n_0_[14] ),
        .R(reset_n_reg2_reg));
  (* FSM_ENCODED_STATES = "FSM_CPLL_PD:00000000000000100,FSM_RESETDONE:00000000000010000,FSM_MMCM_LOCK:00000000000100000,FSM_DRP_X16_START:00000000001000000,FSM_CPLLRESET:00000000000000001,FSM_TXSYNC_DONE:00000001000000000,FSM_CFG_WAIT:00000000000000010,FSM_DRP_X20_DONE:00000100000000000,FSM_IDLE:00000010000000000,FSM_DRP_X20_START:00001000000000000,FSM_GTRESET:00010000000000000,FSM_DRP:00100000000000000,FSM_RXPMARESETDONE_2:01000000000000000,FSM_RXPMARESETDONE_1:10000000000000000,FSM_CPLLLOCK:00000000100000000,FSM_DRP_X16_DONE:00000000010000000,FSM_TXSYNC_START:00000000000001000" *) 
  FDSE #(
    .INIT(1'b0)) 
    \FSM_onehot_fsm_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\FSM_onehot_fsm[1]_i_1_n_0 ),
        .Q(\FSM_onehot_fsm_reg_n_0_[1] ),
        .S(reset_n_reg2_reg));
  (* FSM_ENCODED_STATES = "FSM_CPLL_PD:00000000000000100,FSM_RESETDONE:00000000000010000,FSM_MMCM_LOCK:00000000000100000,FSM_DRP_X16_START:00000000001000000,FSM_CPLLRESET:00000000000000001,FSM_TXSYNC_DONE:00000001000000000,FSM_CFG_WAIT:00000000000000010,FSM_DRP_X20_DONE:00000100000000000,FSM_IDLE:00000010000000000,FSM_DRP_X20_START:00001000000000000,FSM_GTRESET:00010000000000000,FSM_DRP:00100000000000000,FSM_RXPMARESETDONE_2:01000000000000000,FSM_RXPMARESETDONE_1:10000000000000000,FSM_CPLLLOCK:00000000100000000,FSM_DRP_X16_DONE:00000000010000000,FSM_TXSYNC_START:00000000000001000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_fsm_reg[2] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\FSM_onehot_fsm[2]_i_1_n_0 ),
        .Q(cpllpd),
        .R(reset_n_reg2_reg));
  (* FSM_ENCODED_STATES = "FSM_CPLL_PD:00000000000000100,FSM_RESETDONE:00000000000010000,FSM_MMCM_LOCK:00000000000100000,FSM_DRP_X16_START:00000000001000000,FSM_CPLLRESET:00000000000000001,FSM_TXSYNC_DONE:00000001000000000,FSM_CFG_WAIT:00000000000000010,FSM_DRP_X20_DONE:00000100000000000,FSM_IDLE:00000010000000000,FSM_DRP_X20_START:00001000000000000,FSM_GTRESET:00010000000000000,FSM_DRP:00100000000000000,FSM_RXPMARESETDONE_2:01000000000000000,FSM_RXPMARESETDONE_1:10000000000000000,FSM_CPLLLOCK:00000000100000000,FSM_DRP_X16_DONE:00000000010000000,FSM_TXSYNC_START:00000000000001000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_fsm_reg[3] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\FSM_onehot_fsm[3]_i_1_n_0 ),
        .Q(Q[0]),
        .R(reset_n_reg2_reg));
  (* FSM_ENCODED_STATES = "FSM_CPLL_PD:00000000000000100,FSM_RESETDONE:00000000000010000,FSM_MMCM_LOCK:00000000000100000,FSM_DRP_X16_START:00000000001000000,FSM_CPLLRESET:00000000000000001,FSM_TXSYNC_DONE:00000001000000000,FSM_CFG_WAIT:00000000000000010,FSM_DRP_X20_DONE:00000100000000000,FSM_IDLE:00000010000000000,FSM_DRP_X20_START:00001000000000000,FSM_GTRESET:00010000000000000,FSM_DRP:00100000000000000,FSM_RXPMARESETDONE_2:01000000000000000,FSM_RXPMARESETDONE_1:10000000000000000,FSM_CPLLLOCK:00000000100000000,FSM_DRP_X16_DONE:00000000010000000,FSM_TXSYNC_START:00000000000001000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_fsm_reg[4] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\FSM_onehot_fsm[4]_i_1_n_0 ),
        .Q(\FSM_onehot_fsm_reg_n_0_[4] ),
        .R(reset_n_reg2_reg));
  (* FSM_ENCODED_STATES = "FSM_CPLL_PD:00000000000000100,FSM_RESETDONE:00000000000010000,FSM_MMCM_LOCK:00000000000100000,FSM_DRP_X16_START:00000000001000000,FSM_CPLLRESET:00000000000000001,FSM_TXSYNC_DONE:00000001000000000,FSM_CFG_WAIT:00000000000000010,FSM_DRP_X20_DONE:00000100000000000,FSM_IDLE:00000010000000000,FSM_DRP_X20_START:00001000000000000,FSM_GTRESET:00010000000000000,FSM_DRP:00100000000000000,FSM_RXPMARESETDONE_2:01000000000000000,FSM_RXPMARESETDONE_1:10000000000000000,FSM_CPLLLOCK:00000000100000000,FSM_DRP_X16_DONE:00000000010000000,FSM_TXSYNC_START:00000000000001000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_fsm_reg[5] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\FSM_onehot_fsm[5]_i_1_n_0 ),
        .Q(userrdy),
        .R(reset_n_reg2_reg));
  (* FSM_ENCODED_STATES = "FSM_CPLL_PD:00000000000000100,FSM_RESETDONE:00000000000010000,FSM_MMCM_LOCK:00000000000100000,FSM_DRP_X16_START:00000000001000000,FSM_CPLLRESET:00000000000000001,FSM_TXSYNC_DONE:00000001000000000,FSM_CFG_WAIT:00000000000000010,FSM_DRP_X20_DONE:00000100000000000,FSM_IDLE:00000010000000000,FSM_DRP_X20_START:00001000000000000,FSM_GTRESET:00010000000000000,FSM_DRP:00100000000000000,FSM_RXPMARESETDONE_2:01000000000000000,FSM_RXPMARESETDONE_1:10000000000000000,FSM_CPLLLOCK:00000000100000000,FSM_DRP_X16_DONE:00000000010000000,FSM_TXSYNC_START:00000000000001000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_fsm_reg[8] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\FSM_onehot_fsm[8]_i_1_n_0 ),
        .Q(\FSM_onehot_fsm_reg_n_0_[8] ),
        .R(reset_n_reg2_reg));
  (* FSM_ENCODED_STATES = "FSM_CPLL_PD:00000000000000100,FSM_RESETDONE:00000000000010000,FSM_MMCM_LOCK:00000000000100000,FSM_DRP_X16_START:00000000001000000,FSM_CPLLRESET:00000000000000001,FSM_TXSYNC_DONE:00000001000000000,FSM_CFG_WAIT:00000000000000010,FSM_DRP_X20_DONE:00000100000000000,FSM_IDLE:00000010000000000,FSM_DRP_X20_START:00001000000000000,FSM_GTRESET:00010000000000000,FSM_DRP:00100000000000000,FSM_RXPMARESETDONE_2:01000000000000000,FSM_RXPMARESETDONE_1:10000000000000000,FSM_CPLLLOCK:00000000100000000,FSM_DRP_X16_DONE:00000000010000000,FSM_TXSYNC_START:00000000000001000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_fsm_reg[9] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\FSM_onehot_fsm[9]_i_1_n_0 ),
        .Q(\FSM_onehot_fsm_reg_n_0_[9] ),
        .R(reset_n_reg2_reg));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'h2A)) 
    \cfg_wait_cnt[0]_i_1 
       (.I0(\FSM_onehot_fsm_reg_n_0_[1] ),
        .I1(\FSM_onehot_fsm[1]_i_2_n_0 ),
        .I2(cfg_wait_cnt_reg[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT4 #(
    .INIT(16'h28AA)) 
    \cfg_wait_cnt[1]_i_1 
       (.I0(\FSM_onehot_fsm_reg_n_0_[1] ),
        .I1(cfg_wait_cnt_reg[0]),
        .I2(cfg_wait_cnt_reg[1]),
        .I3(\FSM_onehot_fsm[1]_i_2_n_0 ),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT5 #(
    .INIT(32'h2888AAAA)) 
    \cfg_wait_cnt[2]_i_1 
       (.I0(\FSM_onehot_fsm_reg_n_0_[1] ),
        .I1(cfg_wait_cnt_reg[2]),
        .I2(cfg_wait_cnt_reg[1]),
        .I3(cfg_wait_cnt_reg[0]),
        .I4(\FSM_onehot_fsm[1]_i_2_n_0 ),
        .O(p_0_in[2]));
  LUT6 #(
    .INIT(64'h28888888AAAAAAAA)) 
    \cfg_wait_cnt[3]_i_1 
       (.I0(\FSM_onehot_fsm_reg_n_0_[1] ),
        .I1(cfg_wait_cnt_reg[3]),
        .I2(cfg_wait_cnt_reg[2]),
        .I3(cfg_wait_cnt_reg[0]),
        .I4(cfg_wait_cnt_reg[1]),
        .I5(\FSM_onehot_fsm[1]_i_2_n_0 ),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT5 #(
    .INIT(32'hAE00A600)) 
    \cfg_wait_cnt[4]_i_1 
       (.I0(cfg_wait_cnt_reg[4]),
        .I1(cfg_wait_cnt_reg[3]),
        .I2(\cfg_wait_cnt[5]_i_2_n_0 ),
        .I3(\FSM_onehot_fsm_reg_n_0_[1] ),
        .I4(cfg_wait_cnt_reg[5]),
        .O(p_0_in[4]));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT5 #(
    .INIT(32'h88A88888)) 
    \cfg_wait_cnt[5]_i_1 
       (.I0(\FSM_onehot_fsm_reg_n_0_[1] ),
        .I1(cfg_wait_cnt_reg[5]),
        .I2(cfg_wait_cnt_reg[3]),
        .I3(\cfg_wait_cnt[5]_i_2_n_0 ),
        .I4(cfg_wait_cnt_reg[4]),
        .O(p_0_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \cfg_wait_cnt[5]_i_2 
       (.I0(cfg_wait_cnt_reg[1]),
        .I1(cfg_wait_cnt_reg[0]),
        .I2(cfg_wait_cnt_reg[2]),
        .O(\cfg_wait_cnt[5]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cfg_wait_cnt_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(p_0_in[0]),
        .Q(cfg_wait_cnt_reg[0]),
        .R(reset_n_reg2_reg));
  FDRE #(
    .INIT(1'b0)) 
    \cfg_wait_cnt_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(p_0_in[1]),
        .Q(cfg_wait_cnt_reg[1]),
        .R(reset_n_reg2_reg));
  FDRE #(
    .INIT(1'b0)) 
    \cfg_wait_cnt_reg[2] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(p_0_in[2]),
        .Q(cfg_wait_cnt_reg[2]),
        .R(reset_n_reg2_reg));
  FDRE #(
    .INIT(1'b0)) 
    \cfg_wait_cnt_reg[3] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(p_0_in[3]),
        .Q(cfg_wait_cnt_reg[3]),
        .R(reset_n_reg2_reg));
  FDRE #(
    .INIT(1'b0)) 
    \cfg_wait_cnt_reg[4] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(p_0_in[4]),
        .Q(cfg_wait_cnt_reg[4]),
        .R(reset_n_reg2_reg));
  FDRE #(
    .INIT(1'b0)) 
    \cfg_wait_cnt_reg[5] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(p_0_in[5]),
        .Q(cfg_wait_cnt_reg[5]),
        .R(reset_n_reg2_reg));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \cplllock_reg1_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(QRST_CPLLLOCK),
        .Q(cplllock_reg1),
        .R(reset_n_reg2_reg));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \cplllock_reg2_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(cplllock_reg1),
        .Q(cplllock_reg2),
        .R(reset_n_reg2_reg));
  LUT6 #(
    .INIT(64'hFFFFFFFEAAAAAAAA)) 
    cpllreset_i_1
       (.I0(\FSM_onehot_fsm_reg_n_0_[0] ),
        .I1(userrdy),
        .I2(\FSM_onehot_fsm_reg_n_0_[4] ),
        .I3(\FSM_onehot_fsm_reg_n_0_[14] ),
        .I4(cpllreset_i_2__0_n_0),
        .I5(cpllreset),
        .O(cpllreset_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    cpllreset_i_2__0
       (.I0(\FSM_onehot_fsm_reg_n_0_[9] ),
        .I1(Q[0]),
        .I2(\FSM_onehot_fsm_reg_n_0_[1] ),
        .I3(Q[1]),
        .I4(\FSM_onehot_fsm_reg_n_0_[13] ),
        .I5(cpllpd),
        .O(cpllreset_i_2__0_n_0));
  FDRE #(
    .INIT(1'b0)) 
    cpllreset_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(cpllreset_i_1_n_0),
        .Q(cpllreset),
        .R(reset_n_reg2_reg));
  FDRE #(
    .INIT(1'b0)) 
    dclk_rst_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\FSM_onehot_fsm_reg_n_0_[1] ),
        .Q(dclk_rst),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE #(
    .INIT(1'b0)) 
    dclk_rst_reg1_reg
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(dclk_rst),
        .Q(dclk_rst_reg1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE #(
    .INIT(1'b0)) 
    dclk_rst_reg2_reg
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(dclk_rst_reg1),
        .Q(dclk_rst_reg2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \drp_done_reg1_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(drp_done),
        .Q(drp_done_reg1),
        .R(reset_n_reg2_reg));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \drp_done_reg2_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(drp_done_reg1),
        .Q(drp_done_reg2),
        .R(reset_n_reg2_reg));
  LUT3 #(
    .INIT(8'hDC)) 
    gtreset_i_1
       (.I0(\FSM_onehot_fsm_reg_n_0_[13] ),
        .I1(\FSM_onehot_fsm_reg_n_0_[0] ),
        .I2(rst_gtreset),
        .O(gtreset_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    gtreset_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(gtreset_i_1_n_0),
        .Q(rst_gtreset),
        .R(reset_n_reg2_reg));
  LUT3 #(
    .INIT(8'hFE)) 
    \gtx_channel.gtxe2_channel_i_i_2 
       (.I0(cpllreset),
        .I1(rate_cpllreset),
        .I2(cpllrst),
        .O(CPLLRESET0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE mmcm_lock_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(pipe_mmcm_lock_in),
        .Q(mmcm_lock_reg1),
        .R(reset_n_reg2_reg));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE mmcm_lock_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(mmcm_lock_reg1),
        .Q(mmcm_lock_reg2),
        .R(reset_n_reg2_reg));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \phystatus_reg1_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(gt_phystatus),
        .Q(phystatus_reg1),
        .R(reset_n_reg2_reg));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \phystatus_reg2_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(phystatus_reg1),
        .Q(phystatus_reg2),
        .R(reset_n_reg2_reg));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE qpll_idle_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(QRST_IDLE),
        .Q(qpll_idle_reg1),
        .R(reset_n_reg2_reg));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE qpll_idle_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(qpll_idle_reg1),
        .Q(qpll_idle_reg2),
        .R(reset_n_reg2_reg));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rate_idle_reg1_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\rate_idle_reg1_reg[0]_0 ),
        .Q(rate_idle_reg1),
        .R(reset_n_reg2_reg));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rate_idle_reg2_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rate_idle_reg1),
        .Q(rate_idle_reg2),
        .R(reset_n_reg2_reg));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \resetdone_reg1_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(user_resetdone),
        .Q(resetdone_reg1),
        .R(reset_n_reg2_reg));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \resetdone_reg2_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(resetdone_reg1),
        .Q(resetdone_reg2),
        .R(reset_n_reg2_reg));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxcdrlock_reg1_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(user_rxcdrlock),
        .Q(rxcdrlock_reg1),
        .R(reset_n_reg2_reg));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxcdrlock_reg2_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxcdrlock_reg1),
        .Q(rxcdrlock_reg2),
        .R(reset_n_reg2_reg));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxpmaresetdone_reg1_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(rxpmaresetdone_reg1),
        .R(reset_n_reg2_reg));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rxpmaresetdone_reg2_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxpmaresetdone_reg1),
        .Q(rxpmaresetdone_reg2),
        .R(reset_n_reg2_reg));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE #(
    .INIT(1'b0)) 
    rxusrclk_rst_reg1_reg
       (.C(pipe_rxusrclk_in),
        .CE(1'b1),
        .D(cpllreset),
        .Q(rxusrclk_rst_reg1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE #(
    .INIT(1'b0)) 
    rxusrclk_rst_reg2_reg
       (.C(pipe_rxusrclk_in),
        .CE(1'b1),
        .D(rxusrclk_rst_reg1),
        .Q(rxusrclk_rst_reg2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txsync_done_reg1_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(sync_txsync_done),
        .Q(txsync_done_reg1),
        .R(reset_n_reg2_reg));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txsync_done_reg2_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txsync_done_reg1),
        .Q(txsync_done_reg2),
        .R(reset_n_reg2_reg));
  LUT3 #(
    .INIT(8'hB8)) 
    userrdy_i_1
       (.I0(mmcm_lock_reg2),
        .I1(userrdy),
        .I2(rst_userrdy),
        .O(userrdy_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    userrdy_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(userrdy_i_1_n_0),
        .Q(rst_userrdy),
        .R(reset_n_reg2_reg));
endmodule

module pcie_7x_0_pipe_sync
   (out,
    txphaligndone_reg3_reg_0,
    txphinitdone_reg2_reg_0,
    txphinitdone_reg3_reg_0,
    sync_txdlyen,
    sync_txsync_done,
    Q,
    rxphaligndone_s_reg2_reg_0,
    txphaligndone0,
    pipe_pclk_in,
    SYNC_TXSYNC_START0,
    pipe_mmcm_lock_in,
    txdlysresetdone_reg1_reg_0,
    SYNC_TXPHINITDONE1,
    QPLL_DRP_GEN3,
    rate_idle_reg1_reg_0,
    PIPE_RXELECIDLE,
    user_rxcdrlock,
    rxsync_start_reg1_reg_0,
    rxdlysresetdone_reg1_reg_0,
    rxphaligndone_m_reg1_reg_0,
    \FSM_onehot_txsync_fsm.fsm_tx_reg[5]_0 ,
    \FSM_onehot_txsync_fsm.fsm_tx_reg[4]_0 ,
    \FSM_onehot_txsync_fsm.fsm_tx_reg[5]_1 ,
    \FSM_onehot_txsync_fsm.fsm_tx_reg[6]_0 ,
    \FSM_onehot_txsync_fsm.fsm_tx_reg[6]_1 );
  output out;
  output txphaligndone_reg3_reg_0;
  output txphinitdone_reg2_reg_0;
  output txphinitdone_reg3_reg_0;
  output sync_txdlyen;
  output sync_txsync_done;
  output [2:0]Q;
  input rxphaligndone_s_reg2_reg_0;
  input txphaligndone0;
  input pipe_pclk_in;
  input SYNC_TXSYNC_START0;
  input pipe_mmcm_lock_in;
  input txdlysresetdone_reg1_reg_0;
  input SYNC_TXPHINITDONE1;
  input QPLL_DRP_GEN3;
  input rate_idle_reg1_reg_0;
  input PIPE_RXELECIDLE;
  input user_rxcdrlock;
  input rxsync_start_reg1_reg_0;
  input rxdlysresetdone_reg1_reg_0;
  input rxphaligndone_m_reg1_reg_0;
  input \FSM_onehot_txsync_fsm.fsm_tx_reg[5]_0 ;
  input \FSM_onehot_txsync_fsm.fsm_tx_reg[4]_0 ;
  input \FSM_onehot_txsync_fsm.fsm_tx_reg[5]_1 ;
  input \FSM_onehot_txsync_fsm.fsm_tx_reg[6]_0 ;
  input \FSM_onehot_txsync_fsm.fsm_tx_reg[6]_1 ;

  wire \FSM_onehot_txsync_fsm.fsm_tx[1]_i_1_n_0 ;
  wire \FSM_onehot_txsync_fsm.fsm_tx[1]_i_2_n_0 ;
  wire \FSM_onehot_txsync_fsm.fsm_tx[2]_i_1_n_0 ;
  wire \FSM_onehot_txsync_fsm.fsm_tx[3]_i_1_n_0 ;
  wire \FSM_onehot_txsync_fsm.fsm_tx[4]_i_1_n_0 ;
  wire \FSM_onehot_txsync_fsm.fsm_tx[5]_i_1_n_0 ;
  wire \FSM_onehot_txsync_fsm.fsm_tx[6]_i_1_n_0 ;
  wire \FSM_onehot_txsync_fsm.fsm_tx_reg[4]_0 ;
  wire \FSM_onehot_txsync_fsm.fsm_tx_reg[5]_0 ;
  wire \FSM_onehot_txsync_fsm.fsm_tx_reg[5]_1 ;
  wire \FSM_onehot_txsync_fsm.fsm_tx_reg[6]_0 ;
  wire \FSM_onehot_txsync_fsm.fsm_tx_reg[6]_1 ;
  wire \FSM_onehot_txsync_fsm.fsm_tx_reg_n_0_[1] ;
  wire \FSM_onehot_txsync_fsm.fsm_tx_reg_n_0_[2] ;
  wire \FSM_onehot_txsync_fsm.fsm_tx_reg_n_0_[6] ;
  wire PIPE_RXELECIDLE;
  wire [2:0]Q;
  wire QPLL_DRP_GEN3;
  wire SYNC_TXPHINITDONE1;
  wire SYNC_TXSYNC_START0;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire gen3_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire gen3_reg2;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire mmcm_lock_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire mmcm_lock_reg2;
  wire pipe_mmcm_lock_in;
  wire pipe_pclk_in;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rate_idle_reg1;
  wire rate_idle_reg1_reg_0;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rate_idle_reg2;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rxcdrlock_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rxcdrlock_reg2;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rxdlysresetdone_reg1;
  wire rxdlysresetdone_reg1_reg_0;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rxdlysresetdone_reg2;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rxelecidle_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rxelecidle_reg2;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rxphaligndone_m_reg1;
  wire rxphaligndone_m_reg1_reg_0;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rxphaligndone_m_reg2;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rxphaligndone_s_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rxphaligndone_s_reg2;
  wire rxphaligndone_s_reg2_reg_0;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rxsync_donem_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rxsync_donem_reg2;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rxsync_start_reg1;
  wire rxsync_start_reg1_reg_0;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rxsync_start_reg2;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rxsyncdone_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rxsyncdone_reg2;
  wire sync_txdlyen;
  wire sync_txsync_done;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire txdlysresetdone_reg1;
  wire txdlysresetdone_reg1_reg_0;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire txdlysresetdone_reg2;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire txdlysresetdone_reg3;
  wire txphaligndone0;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire txphaligndone_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire txphaligndone_reg2;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire txphaligndone_reg3;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire txphinitdone_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire txphinitdone_reg2;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire txphinitdone_reg3;
  wire \txsync_fsm.txdlyen_i_1_n_0 ;
  wire \txsync_fsm.txsync_done_i_1_n_0 ;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire txsync_start_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire txsync_start_reg2;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire txsync_start_reg3;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire txsyncdone_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire txsyncdone_reg2;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire txsyncdone_reg3;
  wire user_rxcdrlock;

  assign out = txphaligndone_reg2;
  assign txphaligndone_reg3_reg_0 = txphaligndone_reg3;
  assign txphinitdone_reg2_reg_0 = txphinitdone_reg2;
  assign txphinitdone_reg3_reg_0 = txphinitdone_reg3;
  LUT5 #(
    .INIT(32'h1D1DFF1D)) 
    \FSM_onehot_txsync_fsm.fsm_tx[1]_i_1 
       (.I0(\FSM_onehot_txsync_fsm.fsm_tx[1]_i_2_n_0 ),
        .I1(\FSM_onehot_txsync_fsm.fsm_tx_reg_n_0_[1] ),
        .I2(txsync_start_reg2),
        .I3(\FSM_onehot_txsync_fsm.fsm_tx_reg_n_0_[6] ),
        .I4(\FSM_onehot_txsync_fsm.fsm_tx_reg[5]_0 ),
        .O(\FSM_onehot_txsync_fsm.fsm_tx[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \FSM_onehot_txsync_fsm.fsm_tx[1]_i_2 
       (.I0(Q[1]),
        .I1(\FSM_onehot_txsync_fsm.fsm_tx_reg_n_0_[6] ),
        .I2(\FSM_onehot_txsync_fsm.fsm_tx_reg_n_0_[2] ),
        .I3(Q[0]),
        .I4(Q[2]),
        .O(\FSM_onehot_txsync_fsm.fsm_tx[1]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hF444)) 
    \FSM_onehot_txsync_fsm.fsm_tx[2]_i_1 
       (.I0(mmcm_lock_reg2),
        .I1(\FSM_onehot_txsync_fsm.fsm_tx_reg_n_0_[2] ),
        .I2(\FSM_onehot_txsync_fsm.fsm_tx_reg_n_0_[1] ),
        .I3(txsync_start_reg2),
        .O(\FSM_onehot_txsync_fsm.fsm_tx[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFD0D0D0)) 
    \FSM_onehot_txsync_fsm.fsm_tx[3]_i_1 
       (.I0(txdlysresetdone_reg2),
        .I1(txdlysresetdone_reg3),
        .I2(Q[0]),
        .I3(mmcm_lock_reg2),
        .I4(\FSM_onehot_txsync_fsm.fsm_tx_reg_n_0_[2] ),
        .O(\FSM_onehot_txsync_fsm.fsm_tx[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h88F88888)) 
    \FSM_onehot_txsync_fsm.fsm_tx[4]_i_1 
       (.I0(\FSM_onehot_txsync_fsm.fsm_tx_reg[4]_0 ),
        .I1(Q[1]),
        .I2(txdlysresetdone_reg2),
        .I3(txdlysresetdone_reg3),
        .I4(Q[0]),
        .O(\FSM_onehot_txsync_fsm.fsm_tx[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF8FFF8F888888888)) 
    \FSM_onehot_txsync_fsm.fsm_tx[5]_i_1 
       (.I0(\FSM_onehot_txsync_fsm.fsm_tx_reg[5]_0 ),
        .I1(Q[2]),
        .I2(\FSM_onehot_txsync_fsm.fsm_tx_reg[5]_1 ),
        .I3(txphinitdone_reg3),
        .I4(txphinitdone_reg2),
        .I5(Q[1]),
        .O(\FSM_onehot_txsync_fsm.fsm_tx[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEAFFEAEA2A002A2A)) 
    \FSM_onehot_txsync_fsm.fsm_tx[6]_i_1 
       (.I0(\FSM_onehot_txsync_fsm.fsm_tx_reg_n_0_[6] ),
        .I1(\FSM_onehot_txsync_fsm.fsm_tx_reg[6]_0 ),
        .I2(\FSM_onehot_txsync_fsm.fsm_tx_reg[6]_1 ),
        .I3(txphaligndone_reg3),
        .I4(txphaligndone_reg2),
        .I5(Q[2]),
        .O(\FSM_onehot_txsync_fsm.fsm_tx[6]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "FSM_MMCM_LOCK:0000100,FSM_TXSYNC_START:0001000,FSM_TXPHINITDONE:0010000,FSM_TXSYNC_DONE1:0100000,FSM_TXSYNC_DONE2:1000000,FSM_TXSYNC_IDLE:0000010,iSTATE:0000001" *) 
  FDSE #(
    .INIT(1'b0)) 
    \FSM_onehot_txsync_fsm.fsm_tx_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\FSM_onehot_txsync_fsm.fsm_tx[1]_i_1_n_0 ),
        .Q(\FSM_onehot_txsync_fsm.fsm_tx_reg_n_0_[1] ),
        .S(rxphaligndone_s_reg2_reg_0));
  (* FSM_ENCODED_STATES = "FSM_MMCM_LOCK:0000100,FSM_TXSYNC_START:0001000,FSM_TXPHINITDONE:0010000,FSM_TXSYNC_DONE1:0100000,FSM_TXSYNC_DONE2:1000000,FSM_TXSYNC_IDLE:0000010,iSTATE:0000001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_txsync_fsm.fsm_tx_reg[2] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\FSM_onehot_txsync_fsm.fsm_tx[2]_i_1_n_0 ),
        .Q(\FSM_onehot_txsync_fsm.fsm_tx_reg_n_0_[2] ),
        .R(rxphaligndone_s_reg2_reg_0));
  (* FSM_ENCODED_STATES = "FSM_MMCM_LOCK:0000100,FSM_TXSYNC_START:0001000,FSM_TXPHINITDONE:0010000,FSM_TXSYNC_DONE1:0100000,FSM_TXSYNC_DONE2:1000000,FSM_TXSYNC_IDLE:0000010,iSTATE:0000001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_txsync_fsm.fsm_tx_reg[3] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\FSM_onehot_txsync_fsm.fsm_tx[3]_i_1_n_0 ),
        .Q(Q[0]),
        .R(rxphaligndone_s_reg2_reg_0));
  (* FSM_ENCODED_STATES = "FSM_MMCM_LOCK:0000100,FSM_TXSYNC_START:0001000,FSM_TXPHINITDONE:0010000,FSM_TXSYNC_DONE1:0100000,FSM_TXSYNC_DONE2:1000000,FSM_TXSYNC_IDLE:0000010,iSTATE:0000001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_txsync_fsm.fsm_tx_reg[4] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\FSM_onehot_txsync_fsm.fsm_tx[4]_i_1_n_0 ),
        .Q(Q[1]),
        .R(rxphaligndone_s_reg2_reg_0));
  (* FSM_ENCODED_STATES = "FSM_MMCM_LOCK:0000100,FSM_TXSYNC_START:0001000,FSM_TXPHINITDONE:0010000,FSM_TXSYNC_DONE1:0100000,FSM_TXSYNC_DONE2:1000000,FSM_TXSYNC_IDLE:0000010,iSTATE:0000001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_txsync_fsm.fsm_tx_reg[5] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\FSM_onehot_txsync_fsm.fsm_tx[5]_i_1_n_0 ),
        .Q(Q[2]),
        .R(rxphaligndone_s_reg2_reg_0));
  (* FSM_ENCODED_STATES = "FSM_MMCM_LOCK:0000100,FSM_TXSYNC_START:0001000,FSM_TXPHINITDONE:0010000,FSM_TXSYNC_DONE1:0100000,FSM_TXSYNC_DONE2:1000000,FSM_TXSYNC_IDLE:0000010,iSTATE:0000001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_txsync_fsm.fsm_tx_reg[6] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\FSM_onehot_txsync_fsm.fsm_tx[6]_i_1_n_0 ),
        .Q(\FSM_onehot_txsync_fsm.fsm_tx_reg_n_0_[6] ),
        .R(rxphaligndone_s_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE gen3_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(QPLL_DRP_GEN3),
        .Q(gen3_reg1),
        .R(rxphaligndone_s_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE gen3_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(gen3_reg1),
        .Q(gen3_reg2),
        .R(rxphaligndone_s_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE mmcm_lock_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(pipe_mmcm_lock_in),
        .Q(mmcm_lock_reg1),
        .R(rxphaligndone_s_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE mmcm_lock_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(mmcm_lock_reg1),
        .Q(mmcm_lock_reg2),
        .R(rxphaligndone_s_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rate_idle_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rate_idle_reg1_reg_0),
        .Q(rate_idle_reg1),
        .R(rxphaligndone_s_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rate_idle_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rate_idle_reg1),
        .Q(rate_idle_reg2),
        .R(rxphaligndone_s_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rxcdrlock_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(user_rxcdrlock),
        .Q(rxcdrlock_reg1),
        .R(rxphaligndone_s_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rxcdrlock_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxcdrlock_reg1),
        .Q(rxcdrlock_reg2),
        .R(rxphaligndone_s_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rxdlysresetdone_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxdlysresetdone_reg1_reg_0),
        .Q(rxdlysresetdone_reg1),
        .R(rxphaligndone_s_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rxdlysresetdone_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxdlysresetdone_reg1),
        .Q(rxdlysresetdone_reg2),
        .R(rxphaligndone_s_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rxelecidle_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(PIPE_RXELECIDLE),
        .Q(rxelecidle_reg1),
        .R(rxphaligndone_s_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rxelecidle_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxelecidle_reg1),
        .Q(rxelecidle_reg2),
        .R(rxphaligndone_s_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rxphaligndone_m_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxphaligndone_m_reg1_reg_0),
        .Q(rxphaligndone_m_reg1),
        .R(rxphaligndone_s_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rxphaligndone_m_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxphaligndone_m_reg1),
        .Q(rxphaligndone_m_reg2),
        .R(rxphaligndone_s_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rxphaligndone_s_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(rxphaligndone_s_reg1),
        .R(rxphaligndone_s_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rxphaligndone_s_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxphaligndone_s_reg1),
        .Q(rxphaligndone_s_reg2),
        .R(rxphaligndone_s_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rxsync_donem_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(rxsync_donem_reg1),
        .R(rxphaligndone_s_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rxsync_donem_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxsync_donem_reg1),
        .Q(rxsync_donem_reg2),
        .R(rxphaligndone_s_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rxsync_start_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxsync_start_reg1_reg_0),
        .Q(rxsync_start_reg1),
        .R(rxphaligndone_s_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rxsync_start_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxsync_start_reg1),
        .Q(rxsync_start_reg2),
        .R(rxphaligndone_s_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rxsyncdone_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(rxsyncdone_reg1),
        .R(rxphaligndone_s_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rxsyncdone_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxsyncdone_reg1),
        .Q(rxsyncdone_reg2),
        .R(rxphaligndone_s_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE txdlysresetdone_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txdlysresetdone_reg1_reg_0),
        .Q(txdlysresetdone_reg1),
        .R(rxphaligndone_s_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE txdlysresetdone_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txdlysresetdone_reg1),
        .Q(txdlysresetdone_reg2),
        .R(rxphaligndone_s_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE txdlysresetdone_reg3_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txdlysresetdone_reg2),
        .Q(txdlysresetdone_reg3),
        .R(rxphaligndone_s_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE txphaligndone_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txphaligndone0),
        .Q(txphaligndone_reg1),
        .R(rxphaligndone_s_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE txphaligndone_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txphaligndone_reg1),
        .Q(txphaligndone_reg2),
        .R(rxphaligndone_s_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE txphaligndone_reg3_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txphaligndone_reg2),
        .Q(txphaligndone_reg3),
        .R(rxphaligndone_s_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE txphinitdone_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(SYNC_TXPHINITDONE1),
        .Q(txphinitdone_reg1),
        .R(rxphaligndone_s_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE txphinitdone_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txphinitdone_reg1),
        .Q(txphinitdone_reg2),
        .R(rxphaligndone_s_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE txphinitdone_reg3_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txphinitdone_reg2),
        .Q(txphinitdone_reg3),
        .R(rxphaligndone_s_reg2_reg_0));
  LUT5 #(
    .INIT(32'hABAAA8AA)) 
    \txsync_fsm.txdlyen_i_1 
       (.I0(\FSM_onehot_txsync_fsm.fsm_tx_reg_n_0_[6] ),
        .I1(\FSM_onehot_txsync_fsm.fsm_tx[1]_i_2_n_0 ),
        .I2(txsync_start_reg2),
        .I3(\FSM_onehot_txsync_fsm.fsm_tx_reg_n_0_[1] ),
        .I4(sync_txdlyen),
        .O(\txsync_fsm.txdlyen_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \txsync_fsm.txdlyen_reg 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\txsync_fsm.txdlyen_i_1_n_0 ),
        .Q(sync_txdlyen),
        .R(rxphaligndone_s_reg2_reg_0));
  LUT6 #(
    .INIT(64'h222F222222202222)) 
    \txsync_fsm.txsync_done_i_1 
       (.I0(\FSM_onehot_txsync_fsm.fsm_tx_reg_n_0_[6] ),
        .I1(\FSM_onehot_txsync_fsm.fsm_tx_reg[5]_0 ),
        .I2(\FSM_onehot_txsync_fsm.fsm_tx[1]_i_2_n_0 ),
        .I3(txsync_start_reg2),
        .I4(\FSM_onehot_txsync_fsm.fsm_tx_reg_n_0_[1] ),
        .I5(sync_txsync_done),
        .O(\txsync_fsm.txsync_done_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \txsync_fsm.txsync_done_reg 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\txsync_fsm.txsync_done_i_1_n_0 ),
        .Q(sync_txsync_done),
        .R(rxphaligndone_s_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE txsync_start_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(SYNC_TXSYNC_START0),
        .Q(txsync_start_reg1),
        .R(rxphaligndone_s_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE txsync_start_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txsync_start_reg1),
        .Q(txsync_start_reg2),
        .R(rxphaligndone_s_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE txsync_start_reg3_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txsync_start_reg2),
        .Q(txsync_start_reg3),
        .R(rxphaligndone_s_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE txsyncdone_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(txsyncdone_reg1),
        .R(rxphaligndone_s_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE txsyncdone_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txsyncdone_reg1),
        .Q(txsyncdone_reg2),
        .R(rxphaligndone_s_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE txsyncdone_reg3_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txsyncdone_reg2),
        .Q(txsyncdone_reg3),
        .R(rxphaligndone_s_reg2_reg_0));
endmodule

module pcie_7x_0_pipe_user
   (out,
    txcompliance_reg2_reg_0,
    CLKRSVD,
    user_resetdone,
    user_rxcdrlock,
    rate_idle_reg2_reg_0,
    txcompliance_reg2_reg_1,
    txcompliance_reg2_reg_2,
    SYNC_TXPHINITDONE1,
    txphaligndone0,
    txelecidle_reg2_reg_0,
    reg_clock_locked_reg,
    PIPE_PHYSTATUS,
    user_rx_converge,
    resetovrd_start_reg2_reg_0,
    pipe_pclk_sel_out,
    pipe_pclk_in,
    gt_txresetdone_0,
    gt_rxresetdone_0,
    pipe_tx0_elec_idle,
    pipe_tx0_compliance,
    gt_rxcdrlock,
    SR,
    gt_rxvalid,
    pipe_rxusrclk_in,
    RXSTATUS,
    Q,
    rate_idle_reg1_reg_0,
    rate_rxsync_reg1_reg_0,
    rate_done_reg1_reg_0,
    QPLL_DRP_GEN3,
    rxeq_adapt_done_reg1_reg_0,
    resetovrd_start_reg1_reg_0,
    pipe_oobclk_in,
    PIPE_RXELECIDLE,
    gt_rxvalid_q_reg,
    \FSM_onehot_txsync_fsm.fsm_tx_reg[4] ,
    \FSM_onehot_txsync_fsm.fsm_tx_reg[4]_0 ,
    \FSM_onehot_txsync_fsm.fsm_tx_reg[5] ,
    \FSM_onehot_txsync_fsm.fsm_tx_reg[5]_0 ,
    txphinitdone_reg1_reg,
    txphaligndone_reg1_reg,
    reg_clock_locked,
    gt_phystatus);
  output out;
  output txcompliance_reg2_reg_0;
  output [0:0]CLKRSVD;
  output user_resetdone;
  output user_rxcdrlock;
  output rate_idle_reg2_reg_0;
  output txcompliance_reg2_reg_1;
  output txcompliance_reg2_reg_2;
  output SYNC_TXPHINITDONE1;
  output txphaligndone0;
  output txelecidle_reg2_reg_0;
  output reg_clock_locked_reg;
  output PIPE_PHYSTATUS;
  output user_rx_converge;
  input resetovrd_start_reg2_reg_0;
  input [0:0]pipe_pclk_sel_out;
  input pipe_pclk_in;
  input gt_txresetdone_0;
  input gt_rxresetdone_0;
  input pipe_tx0_elec_idle;
  input pipe_tx0_compliance;
  input gt_rxcdrlock;
  input [0:0]SR;
  input gt_rxvalid;
  input pipe_rxusrclk_in;
  input [0:0]RXSTATUS;
  input [0:0]Q;
  input rate_idle_reg1_reg_0;
  input rate_rxsync_reg1_reg_0;
  input rate_done_reg1_reg_0;
  input QPLL_DRP_GEN3;
  input rxeq_adapt_done_reg1_reg_0;
  input resetovrd_start_reg1_reg_0;
  input pipe_oobclk_in;
  input PIPE_RXELECIDLE;
  input gt_rxvalid_q_reg;
  input \FSM_onehot_txsync_fsm.fsm_tx_reg[4] ;
  input \FSM_onehot_txsync_fsm.fsm_tx_reg[4]_0 ;
  input \FSM_onehot_txsync_fsm.fsm_tx_reg[5] ;
  input \FSM_onehot_txsync_fsm.fsm_tx_reg[5]_0 ;
  input txphinitdone_reg1_reg;
  input txphaligndone_reg1_reg;
  input reg_clock_locked;
  input gt_phystatus;

  wire [0:0]CLKRSVD;
  wire \FSM_onehot_txsync_fsm.fsm_tx_reg[4] ;
  wire \FSM_onehot_txsync_fsm.fsm_tx_reg[4]_0 ;
  wire \FSM_onehot_txsync_fsm.fsm_tx_reg[5] ;
  wire \FSM_onehot_txsync_fsm.fsm_tx_reg[5]_0 ;
  wire PIPE_PHYSTATUS;
  wire PIPE_RXELECIDLE;
  wire [0:0]Q;
  wire QPLL_DRP_GEN3;
  wire [0:0]RXSTATUS;
  wire [0:0]SR;
  wire SYNC_TXPHINITDONE1;
  wire \converge_cnt[0]_i_1_n_0 ;
  wire \converge_cnt[0]_i_4_n_0 ;
  wire \converge_cnt[0]_i_5_n_0 ;
  wire \converge_cnt[0]_i_6_n_0 ;
  wire \converge_cnt[0]_i_7_n_0 ;
  wire [21:0]converge_cnt_reg;
  wire \converge_cnt_reg[0]_i_3_n_0 ;
  wire \converge_cnt_reg[0]_i_3_n_1 ;
  wire \converge_cnt_reg[0]_i_3_n_2 ;
  wire \converge_cnt_reg[0]_i_3_n_3 ;
  wire \converge_cnt_reg[0]_i_3_n_4 ;
  wire \converge_cnt_reg[0]_i_3_n_5 ;
  wire \converge_cnt_reg[0]_i_3_n_6 ;
  wire \converge_cnt_reg[0]_i_3_n_7 ;
  wire \converge_cnt_reg[12]_i_1_n_0 ;
  wire \converge_cnt_reg[12]_i_1_n_1 ;
  wire \converge_cnt_reg[12]_i_1_n_2 ;
  wire \converge_cnt_reg[12]_i_1_n_3 ;
  wire \converge_cnt_reg[12]_i_1_n_4 ;
  wire \converge_cnt_reg[12]_i_1_n_5 ;
  wire \converge_cnt_reg[12]_i_1_n_6 ;
  wire \converge_cnt_reg[12]_i_1_n_7 ;
  wire \converge_cnt_reg[16]_i_1_n_0 ;
  wire \converge_cnt_reg[16]_i_1_n_1 ;
  wire \converge_cnt_reg[16]_i_1_n_2 ;
  wire \converge_cnt_reg[16]_i_1_n_3 ;
  wire \converge_cnt_reg[16]_i_1_n_4 ;
  wire \converge_cnt_reg[16]_i_1_n_5 ;
  wire \converge_cnt_reg[16]_i_1_n_6 ;
  wire \converge_cnt_reg[16]_i_1_n_7 ;
  wire \converge_cnt_reg[20]_i_1_n_3 ;
  wire \converge_cnt_reg[20]_i_1_n_6 ;
  wire \converge_cnt_reg[20]_i_1_n_7 ;
  wire \converge_cnt_reg[4]_i_1_n_0 ;
  wire \converge_cnt_reg[4]_i_1_n_1 ;
  wire \converge_cnt_reg[4]_i_1_n_2 ;
  wire \converge_cnt_reg[4]_i_1_n_3 ;
  wire \converge_cnt_reg[4]_i_1_n_4 ;
  wire \converge_cnt_reg[4]_i_1_n_5 ;
  wire \converge_cnt_reg[4]_i_1_n_6 ;
  wire \converge_cnt_reg[4]_i_1_n_7 ;
  wire \converge_cnt_reg[8]_i_1_n_0 ;
  wire \converge_cnt_reg[8]_i_1_n_1 ;
  wire \converge_cnt_reg[8]_i_1_n_2 ;
  wire \converge_cnt_reg[8]_i_1_n_3 ;
  wire \converge_cnt_reg[8]_i_1_n_4 ;
  wire \converge_cnt_reg[8]_i_1_n_5 ;
  wire \converge_cnt_reg[8]_i_1_n_6 ;
  wire \converge_cnt_reg[8]_i_1_n_7 ;
  wire converge_gen3_i_1_n_0;
  wire converge_gen3_reg_n_0;
  wire gt_phystatus;
  wire gt_rxcdrlock;
  wire gt_rxresetdone_0;
  wire gt_rxvalid;
  wire gt_rxvalid_q_i_6_n_0;
  wire gt_rxvalid_q_reg;
  wire gt_txresetdone_0;
  wire \gtx_channel.gtxe2_channel_i_i_48_n_0 ;
  wire \gtx_channel.gtxe2_channel_i_i_49_n_0 ;
  wire \gtx_channel.gtxe2_channel_i_i_50_n_0 ;
  wire \gtx_channel.gtxe2_channel_i_i_51_n_0 ;
  wire \gtx_channel.gtxe2_channel_i_i_52_n_0 ;
  wire \gtx_channel.gtxe2_channel_i_i_53_n_0 ;
  wire [1:0]oobclk_cnt;
  wire \oobclk_div.oobclk_cnt[0]_i_1_n_0 ;
  wire \oobclk_div.oobclk_cnt[1]_i_1_n_0 ;
  wire \oobclk_div.oobclk_i_1_n_0 ;
  wire [3:0]p_0_in__1;
  wire [3:0]p_0_in__2;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire pclk_sel_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire pclk_sel_reg2;
  wire pipe_oobclk_in;
  wire pipe_pclk_in;
  wire [0:0]pipe_pclk_sel_out;
  wire pipe_rxusrclk_in;
  wire pipe_tx0_compliance;
  wire pipe_tx0_elec_idle;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rate_done_reg1;
  wire rate_done_reg1_reg_0;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rate_done_reg2;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rate_gen3_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rate_gen3_reg2;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rate_idle_reg1;
  wire rate_idle_reg1_reg_0;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rate_idle_reg2;
  wire rate_idle_reg2_reg_0;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rate_rxsync_reg1;
  wire rate_rxsync_reg1_reg_0;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rate_rxsync_reg2;
  wire reg_clock_locked;
  wire reg_clock_locked_reg;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire resetovrd_start_reg1;
  wire resetovrd_start_reg1_reg_0;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire resetovrd_start_reg2;
  wire resetovrd_start_reg2_reg_0;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rst_idle_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rst_idle_reg2;
  wire [3:0]rxcdrlock_cnt_reg;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rxcdrlock_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rxcdrlock_reg2;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rxeq_adapt_done_reg1;
  wire rxeq_adapt_done_reg1_reg_0;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rxeq_adapt_done_reg2;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rxresetdone_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rxresetdone_reg2;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rxstatus_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rxstatus_reg2;
  wire [3:0]rxvalid_cnt_reg;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rxvalid_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rxvalid_reg2;
  wire sel;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire txcompliance_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire txcompliance_reg2;
  wire txcompliance_reg2_reg_1;
  wire txcompliance_reg2_reg_2;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire txelecidle_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire txelecidle_reg2;
  wire txelecidle_reg2_reg_0;
  wire txphaligndone0;
  wire txphaligndone_reg1_reg;
  wire txphinitdone_reg1_reg;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire txresetdone_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire txresetdone_reg2;
  wire user_resetdone;
  wire user_rx_converge;
  wire user_rxcdrlock;
  wire [3:1]\NLW_converge_cnt_reg[20]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_converge_cnt_reg[20]_i_1_O_UNCONNECTED ;

  assign out = txelecidle_reg2;
  assign txcompliance_reg2_reg_0 = txcompliance_reg2;
  LUT4 #(
    .INIT(16'h7077)) 
    \FSM_onehot_txsync_fsm.fsm_tx[4]_i_2 
       (.I0(txcompliance_reg2),
        .I1(txelecidle_reg2),
        .I2(\FSM_onehot_txsync_fsm.fsm_tx_reg[4] ),
        .I3(\FSM_onehot_txsync_fsm.fsm_tx_reg[4]_0 ),
        .O(txcompliance_reg2_reg_1));
  LUT4 #(
    .INIT(16'h7077)) 
    \FSM_onehot_txsync_fsm.fsm_tx[5]_i_2 
       (.I0(txcompliance_reg2),
        .I1(txelecidle_reg2),
        .I2(\FSM_onehot_txsync_fsm.fsm_tx_reg[5] ),
        .I3(\FSM_onehot_txsync_fsm.fsm_tx_reg[5]_0 ),
        .O(txcompliance_reg2_reg_2));
  LUT2 #(
    .INIT(4'h8)) 
    \FSM_onehot_txsync_fsm.fsm_tx[5]_i_3 
       (.I0(txelecidle_reg2),
        .I1(txcompliance_reg2),
        .O(txelecidle_reg2_reg_0));
  LUT4 #(
    .INIT(16'hFFF7)) 
    \converge_cnt[0]_i_1 
       (.I0(rate_idle_reg2),
        .I1(rst_idle_reg2),
        .I2(resetovrd_start_reg2_reg_0),
        .I3(rate_gen3_reg2),
        .O(\converge_cnt[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h55555555FFFF55F7)) 
    \converge_cnt[0]_i_2 
       (.I0(converge_cnt_reg[21]),
        .I1(converge_cnt_reg[13]),
        .I2(\converge_cnt[0]_i_4_n_0 ),
        .I3(converge_cnt_reg[14]),
        .I4(\converge_cnt[0]_i_5_n_0 ),
        .I5(converge_cnt_reg[20]),
        .O(sel));
  LUT6 #(
    .INIT(64'h000000007FFFFFFF)) 
    \converge_cnt[0]_i_4 
       (.I0(\converge_cnt[0]_i_7_n_0 ),
        .I1(converge_cnt_reg[9]),
        .I2(converge_cnt_reg[8]),
        .I3(converge_cnt_reg[10]),
        .I4(converge_cnt_reg[11]),
        .I5(converge_cnt_reg[12]),
        .O(\converge_cnt[0]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \converge_cnt[0]_i_5 
       (.I0(converge_cnt_reg[19]),
        .I1(converge_cnt_reg[18]),
        .I2(converge_cnt_reg[16]),
        .I3(converge_cnt_reg[15]),
        .I4(converge_cnt_reg[17]),
        .O(\converge_cnt[0]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \converge_cnt[0]_i_6 
       (.I0(converge_cnt_reg[0]),
        .O(\converge_cnt[0]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \converge_cnt[0]_i_7 
       (.I0(converge_cnt_reg[4]),
        .I1(converge_cnt_reg[5]),
        .I2(converge_cnt_reg[7]),
        .I3(converge_cnt_reg[6]),
        .I4(converge_cnt_reg[3]),
        .O(\converge_cnt[0]_i_7_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \converge_cnt_reg[0] 
       (.C(pipe_pclk_in),
        .CE(sel),
        .D(\converge_cnt_reg[0]_i_3_n_7 ),
        .Q(converge_cnt_reg[0]),
        .R(\converge_cnt[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \converge_cnt_reg[0]_i_3 
       (.CI(1'b0),
        .CO({\converge_cnt_reg[0]_i_3_n_0 ,\converge_cnt_reg[0]_i_3_n_1 ,\converge_cnt_reg[0]_i_3_n_2 ,\converge_cnt_reg[0]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\converge_cnt_reg[0]_i_3_n_4 ,\converge_cnt_reg[0]_i_3_n_5 ,\converge_cnt_reg[0]_i_3_n_6 ,\converge_cnt_reg[0]_i_3_n_7 }),
        .S({converge_cnt_reg[3:1],\converge_cnt[0]_i_6_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \converge_cnt_reg[10] 
       (.C(pipe_pclk_in),
        .CE(sel),
        .D(\converge_cnt_reg[8]_i_1_n_5 ),
        .Q(converge_cnt_reg[10]),
        .R(\converge_cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \converge_cnt_reg[11] 
       (.C(pipe_pclk_in),
        .CE(sel),
        .D(\converge_cnt_reg[8]_i_1_n_4 ),
        .Q(converge_cnt_reg[11]),
        .R(\converge_cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \converge_cnt_reg[12] 
       (.C(pipe_pclk_in),
        .CE(sel),
        .D(\converge_cnt_reg[12]_i_1_n_7 ),
        .Q(converge_cnt_reg[12]),
        .R(\converge_cnt[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \converge_cnt_reg[12]_i_1 
       (.CI(\converge_cnt_reg[8]_i_1_n_0 ),
        .CO({\converge_cnt_reg[12]_i_1_n_0 ,\converge_cnt_reg[12]_i_1_n_1 ,\converge_cnt_reg[12]_i_1_n_2 ,\converge_cnt_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\converge_cnt_reg[12]_i_1_n_4 ,\converge_cnt_reg[12]_i_1_n_5 ,\converge_cnt_reg[12]_i_1_n_6 ,\converge_cnt_reg[12]_i_1_n_7 }),
        .S(converge_cnt_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \converge_cnt_reg[13] 
       (.C(pipe_pclk_in),
        .CE(sel),
        .D(\converge_cnt_reg[12]_i_1_n_6 ),
        .Q(converge_cnt_reg[13]),
        .R(\converge_cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \converge_cnt_reg[14] 
       (.C(pipe_pclk_in),
        .CE(sel),
        .D(\converge_cnt_reg[12]_i_1_n_5 ),
        .Q(converge_cnt_reg[14]),
        .R(\converge_cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \converge_cnt_reg[15] 
       (.C(pipe_pclk_in),
        .CE(sel),
        .D(\converge_cnt_reg[12]_i_1_n_4 ),
        .Q(converge_cnt_reg[15]),
        .R(\converge_cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \converge_cnt_reg[16] 
       (.C(pipe_pclk_in),
        .CE(sel),
        .D(\converge_cnt_reg[16]_i_1_n_7 ),
        .Q(converge_cnt_reg[16]),
        .R(\converge_cnt[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \converge_cnt_reg[16]_i_1 
       (.CI(\converge_cnt_reg[12]_i_1_n_0 ),
        .CO({\converge_cnt_reg[16]_i_1_n_0 ,\converge_cnt_reg[16]_i_1_n_1 ,\converge_cnt_reg[16]_i_1_n_2 ,\converge_cnt_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\converge_cnt_reg[16]_i_1_n_4 ,\converge_cnt_reg[16]_i_1_n_5 ,\converge_cnt_reg[16]_i_1_n_6 ,\converge_cnt_reg[16]_i_1_n_7 }),
        .S(converge_cnt_reg[19:16]));
  FDRE #(
    .INIT(1'b0)) 
    \converge_cnt_reg[17] 
       (.C(pipe_pclk_in),
        .CE(sel),
        .D(\converge_cnt_reg[16]_i_1_n_6 ),
        .Q(converge_cnt_reg[17]),
        .R(\converge_cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \converge_cnt_reg[18] 
       (.C(pipe_pclk_in),
        .CE(sel),
        .D(\converge_cnt_reg[16]_i_1_n_5 ),
        .Q(converge_cnt_reg[18]),
        .R(\converge_cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \converge_cnt_reg[19] 
       (.C(pipe_pclk_in),
        .CE(sel),
        .D(\converge_cnt_reg[16]_i_1_n_4 ),
        .Q(converge_cnt_reg[19]),
        .R(\converge_cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \converge_cnt_reg[1] 
       (.C(pipe_pclk_in),
        .CE(sel),
        .D(\converge_cnt_reg[0]_i_3_n_6 ),
        .Q(converge_cnt_reg[1]),
        .R(\converge_cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \converge_cnt_reg[20] 
       (.C(pipe_pclk_in),
        .CE(sel),
        .D(\converge_cnt_reg[20]_i_1_n_7 ),
        .Q(converge_cnt_reg[20]),
        .R(\converge_cnt[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \converge_cnt_reg[20]_i_1 
       (.CI(\converge_cnt_reg[16]_i_1_n_0 ),
        .CO({\NLW_converge_cnt_reg[20]_i_1_CO_UNCONNECTED [3:1],\converge_cnt_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_converge_cnt_reg[20]_i_1_O_UNCONNECTED [3:2],\converge_cnt_reg[20]_i_1_n_6 ,\converge_cnt_reg[20]_i_1_n_7 }),
        .S({1'b0,1'b0,converge_cnt_reg[21:20]}));
  FDRE #(
    .INIT(1'b0)) 
    \converge_cnt_reg[21] 
       (.C(pipe_pclk_in),
        .CE(sel),
        .D(\converge_cnt_reg[20]_i_1_n_6 ),
        .Q(converge_cnt_reg[21]),
        .R(\converge_cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \converge_cnt_reg[2] 
       (.C(pipe_pclk_in),
        .CE(sel),
        .D(\converge_cnt_reg[0]_i_3_n_5 ),
        .Q(converge_cnt_reg[2]),
        .R(\converge_cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \converge_cnt_reg[3] 
       (.C(pipe_pclk_in),
        .CE(sel),
        .D(\converge_cnt_reg[0]_i_3_n_4 ),
        .Q(converge_cnt_reg[3]),
        .R(\converge_cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \converge_cnt_reg[4] 
       (.C(pipe_pclk_in),
        .CE(sel),
        .D(\converge_cnt_reg[4]_i_1_n_7 ),
        .Q(converge_cnt_reg[4]),
        .R(\converge_cnt[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \converge_cnt_reg[4]_i_1 
       (.CI(\converge_cnt_reg[0]_i_3_n_0 ),
        .CO({\converge_cnt_reg[4]_i_1_n_0 ,\converge_cnt_reg[4]_i_1_n_1 ,\converge_cnt_reg[4]_i_1_n_2 ,\converge_cnt_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\converge_cnt_reg[4]_i_1_n_4 ,\converge_cnt_reg[4]_i_1_n_5 ,\converge_cnt_reg[4]_i_1_n_6 ,\converge_cnt_reg[4]_i_1_n_7 }),
        .S(converge_cnt_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \converge_cnt_reg[5] 
       (.C(pipe_pclk_in),
        .CE(sel),
        .D(\converge_cnt_reg[4]_i_1_n_6 ),
        .Q(converge_cnt_reg[5]),
        .R(\converge_cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \converge_cnt_reg[6] 
       (.C(pipe_pclk_in),
        .CE(sel),
        .D(\converge_cnt_reg[4]_i_1_n_5 ),
        .Q(converge_cnt_reg[6]),
        .R(\converge_cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \converge_cnt_reg[7] 
       (.C(pipe_pclk_in),
        .CE(sel),
        .D(\converge_cnt_reg[4]_i_1_n_4 ),
        .Q(converge_cnt_reg[7]),
        .R(\converge_cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \converge_cnt_reg[8] 
       (.C(pipe_pclk_in),
        .CE(sel),
        .D(\converge_cnt_reg[8]_i_1_n_7 ),
        .Q(converge_cnt_reg[8]),
        .R(\converge_cnt[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \converge_cnt_reg[8]_i_1 
       (.CI(\converge_cnt_reg[4]_i_1_n_0 ),
        .CO({\converge_cnt_reg[8]_i_1_n_0 ,\converge_cnt_reg[8]_i_1_n_1 ,\converge_cnt_reg[8]_i_1_n_2 ,\converge_cnt_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\converge_cnt_reg[8]_i_1_n_4 ,\converge_cnt_reg[8]_i_1_n_5 ,\converge_cnt_reg[8]_i_1_n_6 ,\converge_cnt_reg[8]_i_1_n_7 }),
        .S(converge_cnt_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \converge_cnt_reg[9] 
       (.C(pipe_pclk_in),
        .CE(sel),
        .D(\converge_cnt_reg[8]_i_1_n_6 ),
        .Q(converge_cnt_reg[9]),
        .R(\converge_cnt[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hC8)) 
    converge_gen3_i_1
       (.I0(rxeq_adapt_done_reg2),
        .I1(rate_gen3_reg2),
        .I2(converge_gen3_reg_n_0),
        .O(converge_gen3_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    converge_gen3_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(converge_gen3_i_1_n_0),
        .Q(converge_gen3_reg_n_0),
        .R(resetovrd_start_reg2_reg_0));
  LUT5 #(
    .INIT(32'hFFFFE0FF)) 
    gt_rx_phy_status_q_i_1
       (.I0(rate_idle_reg2),
        .I1(rate_rxsync_reg2),
        .I2(gt_phystatus),
        .I3(rst_idle_reg2),
        .I4(rate_done_reg2),
        .O(PIPE_PHYSTATUS));
  LUT6 #(
    .INIT(64'hBFFFBFFFFFFFBFFF)) 
    gt_rxvalid_q_i_2
       (.I0(gt_rxvalid_q_i_6_n_0),
        .I1(rate_idle_reg2),
        .I2(rst_idle_reg2),
        .I3(gt_rxvalid),
        .I4(PIPE_RXELECIDLE),
        .I5(gt_rxvalid_q_reg),
        .O(rate_idle_reg2_reg_0));
  LUT4 #(
    .INIT(16'h7FFF)) 
    gt_rxvalid_q_i_6
       (.I0(rxvalid_cnt_reg[2]),
        .I1(rxvalid_cnt_reg[0]),
        .I2(rxvalid_cnt_reg[1]),
        .I3(rxvalid_cnt_reg[3]),
        .O(gt_rxvalid_q_i_6_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFEF)) 
    \gtx_channel.gtxe2_channel_i_i_48 
       (.I0(\gtx_channel.gtxe2_channel_i_i_51_n_0 ),
        .I1(converge_cnt_reg[0]),
        .I2(converge_cnt_reg[10]),
        .I3(converge_cnt_reg[20]),
        .I4(\gtx_channel.gtxe2_channel_i_i_52_n_0 ),
        .I5(\gtx_channel.gtxe2_channel_i_i_53_n_0 ),
        .O(\gtx_channel.gtxe2_channel_i_i_48_n_0 ));
  LUT4 #(
    .INIT(16'h1000)) 
    \gtx_channel.gtxe2_channel_i_i_49 
       (.I0(converge_cnt_reg[14]),
        .I1(converge_cnt_reg[1]),
        .I2(converge_cnt_reg[21]),
        .I3(converge_cnt_reg[3]),
        .O(\gtx_channel.gtxe2_channel_i_i_49_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \gtx_channel.gtxe2_channel_i_i_50 
       (.I0(converge_cnt_reg[8]),
        .I1(converge_cnt_reg[9]),
        .O(\gtx_channel.gtxe2_channel_i_i_50_n_0 ));
  LUT4 #(
    .INIT(16'hFFEF)) 
    \gtx_channel.gtxe2_channel_i_i_51 
       (.I0(converge_cnt_reg[6]),
        .I1(converge_cnt_reg[12]),
        .I2(converge_cnt_reg[17]),
        .I3(converge_cnt_reg[2]),
        .O(\gtx_channel.gtxe2_channel_i_i_51_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \gtx_channel.gtxe2_channel_i_i_52 
       (.I0(converge_cnt_reg[7]),
        .I1(converge_cnt_reg[5]),
        .I2(converge_cnt_reg[4]),
        .O(\gtx_channel.gtxe2_channel_i_i_52_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \gtx_channel.gtxe2_channel_i_i_53 
       (.I0(converge_cnt_reg[15]),
        .I1(converge_cnt_reg[16]),
        .I2(converge_cnt_reg[18]),
        .I3(converge_cnt_reg[19]),
        .O(\gtx_channel.gtxe2_channel_i_i_53_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAABAAAAAAA)) 
    \gtx_channel.gtxe2_channel_i_i_6 
       (.I0(converge_gen3_reg_n_0),
        .I1(\gtx_channel.gtxe2_channel_i_i_48_n_0 ),
        .I2(\gtx_channel.gtxe2_channel_i_i_49_n_0 ),
        .I3(converge_cnt_reg[13]),
        .I4(converge_cnt_reg[11]),
        .I5(\gtx_channel.gtxe2_channel_i_i_50_n_0 ),
        .O(user_rx_converge));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \oobclk_div.oobclk_cnt[0]_i_1 
       (.I0(oobclk_cnt[0]),
        .I1(resetovrd_start_reg2_reg_0),
        .O(\oobclk_div.oobclk_cnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'h06)) 
    \oobclk_div.oobclk_cnt[1]_i_1 
       (.I0(oobclk_cnt[1]),
        .I1(oobclk_cnt[0]),
        .I2(resetovrd_start_reg2_reg_0),
        .O(\oobclk_div.oobclk_cnt[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \oobclk_div.oobclk_cnt_reg[0] 
       (.C(pipe_oobclk_in),
        .CE(1'b1),
        .D(\oobclk_div.oobclk_cnt[0]_i_1_n_0 ),
        .Q(oobclk_cnt[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \oobclk_div.oobclk_cnt_reg[1] 
       (.C(pipe_oobclk_in),
        .CE(1'b1),
        .D(\oobclk_div.oobclk_cnt[1]_i_1_n_0 ),
        .Q(oobclk_cnt[1]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h00E2)) 
    \oobclk_div.oobclk_i_1 
       (.I0(oobclk_cnt[0]),
        .I1(pclk_sel_reg2),
        .I2(oobclk_cnt[1]),
        .I3(resetovrd_start_reg2_reg_0),
        .O(\oobclk_div.oobclk_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \oobclk_div.oobclk_reg 
       (.C(pipe_oobclk_in),
        .CE(1'b1),
        .D(\oobclk_div.oobclk_i_1_n_0 ),
        .Q(CLKRSVD),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE pclk_sel_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(pipe_pclk_sel_out),
        .Q(pclk_sel_reg1),
        .R(resetovrd_start_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE pclk_sel_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(pclk_sel_reg1),
        .Q(pclk_sel_reg2),
        .R(resetovrd_start_reg2_reg_0));
  LUT2 #(
    .INIT(4'h2)) 
    phy_rdy_n_int_i_1
       (.I0(reg_clock_locked),
        .I1(rst_idle_reg2),
        .O(reg_clock_locked_reg));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rate_done_reg1_reg
       (.C(pipe_rxusrclk_in),
        .CE(1'b1),
        .D(rate_done_reg1_reg_0),
        .Q(rate_done_reg1),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rate_done_reg2_reg
       (.C(pipe_rxusrclk_in),
        .CE(1'b1),
        .D(rate_done_reg1),
        .Q(rate_done_reg2),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rate_gen3_reg1_reg
       (.C(pipe_rxusrclk_in),
        .CE(1'b1),
        .D(QPLL_DRP_GEN3),
        .Q(rate_gen3_reg1),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rate_gen3_reg2_reg
       (.C(pipe_rxusrclk_in),
        .CE(1'b1),
        .D(rate_gen3_reg1),
        .Q(rate_gen3_reg2),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rate_idle_reg1_reg
       (.C(pipe_rxusrclk_in),
        .CE(1'b1),
        .D(rate_idle_reg1_reg_0),
        .Q(rate_idle_reg1),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rate_idle_reg2_reg
       (.C(pipe_rxusrclk_in),
        .CE(1'b1),
        .D(rate_idle_reg1),
        .Q(rate_idle_reg2),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rate_rxsync_reg1_reg
       (.C(pipe_rxusrclk_in),
        .CE(1'b1),
        .D(rate_rxsync_reg1_reg_0),
        .Q(rate_rxsync_reg1),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rate_rxsync_reg2_reg
       (.C(pipe_rxusrclk_in),
        .CE(1'b1),
        .D(rate_rxsync_reg1),
        .Q(rate_rxsync_reg2),
        .R(SR));
  LUT2 #(
    .INIT(4'h8)) 
    \resetdone_reg1[0]_i_1 
       (.I0(rxresetdone_reg2),
        .I1(txresetdone_reg2),
        .O(user_resetdone));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE resetovrd_start_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(resetovrd_start_reg1_reg_0),
        .Q(resetovrd_start_reg1),
        .R(resetovrd_start_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE resetovrd_start_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(resetovrd_start_reg1),
        .Q(resetovrd_start_reg2),
        .R(resetovrd_start_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rst_idle_reg1_reg
       (.C(pipe_rxusrclk_in),
        .CE(1'b1),
        .D(Q),
        .Q(rst_idle_reg1),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rst_idle_reg2_reg
       (.C(pipe_rxusrclk_in),
        .CE(1'b1),
        .D(rst_idle_reg1),
        .Q(rst_idle_reg2),
        .R(SR));
  LUT5 #(
    .INIT(32'h8A0A0A0A)) 
    \rxcdrlock_cnt[0]_i_1 
       (.I0(rxcdrlock_reg2),
        .I1(rxcdrlock_cnt_reg[3]),
        .I2(rxcdrlock_cnt_reg[0]),
        .I3(rxcdrlock_cnt_reg[1]),
        .I4(rxcdrlock_cnt_reg[2]),
        .O(p_0_in__1[0]));
  LUT5 #(
    .INIT(32'hA8282828)) 
    \rxcdrlock_cnt[1]_i_1 
       (.I0(rxcdrlock_reg2),
        .I1(rxcdrlock_cnt_reg[0]),
        .I2(rxcdrlock_cnt_reg[1]),
        .I3(rxcdrlock_cnt_reg[3]),
        .I4(rxcdrlock_cnt_reg[2]),
        .O(p_0_in__1[1]));
  LUT5 #(
    .INIT(32'hBCCC0000)) 
    \rxcdrlock_cnt[2]_i_1 
       (.I0(rxcdrlock_cnt_reg[3]),
        .I1(rxcdrlock_cnt_reg[2]),
        .I2(rxcdrlock_cnt_reg[1]),
        .I3(rxcdrlock_cnt_reg[0]),
        .I4(rxcdrlock_reg2),
        .O(p_0_in__1[2]));
  LUT5 #(
    .INIT(32'hAAAA8000)) 
    \rxcdrlock_cnt[3]_i_1 
       (.I0(rxcdrlock_reg2),
        .I1(rxcdrlock_cnt_reg[2]),
        .I2(rxcdrlock_cnt_reg[1]),
        .I3(rxcdrlock_cnt_reg[0]),
        .I4(rxcdrlock_cnt_reg[3]),
        .O(p_0_in__1[3]));
  FDRE #(
    .INIT(1'b0)) 
    \rxcdrlock_cnt_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(p_0_in__1[0]),
        .Q(rxcdrlock_cnt_reg[0]),
        .R(resetovrd_start_reg2_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    \rxcdrlock_cnt_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(p_0_in__1[1]),
        .Q(rxcdrlock_cnt_reg[1]),
        .R(resetovrd_start_reg2_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    \rxcdrlock_cnt_reg[2] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(p_0_in__1[2]),
        .Q(rxcdrlock_cnt_reg[2]),
        .R(resetovrd_start_reg2_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    \rxcdrlock_cnt_reg[3] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(p_0_in__1[3]),
        .Q(rxcdrlock_cnt_reg[3]),
        .R(resetovrd_start_reg2_reg_0));
  LUT5 #(
    .INIT(32'h80000000)) 
    \rxcdrlock_reg1[0]_i_1 
       (.I0(gt_rxcdrlock),
        .I1(rxcdrlock_cnt_reg[2]),
        .I2(rxcdrlock_cnt_reg[1]),
        .I3(rxcdrlock_cnt_reg[0]),
        .I4(rxcdrlock_cnt_reg[3]),
        .O(user_rxcdrlock));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rxcdrlock_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(gt_rxcdrlock),
        .Q(rxcdrlock_reg1),
        .R(resetovrd_start_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rxcdrlock_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxcdrlock_reg1),
        .Q(rxcdrlock_reg2),
        .R(resetovrd_start_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rxeq_adapt_done_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_adapt_done_reg1_reg_0),
        .Q(rxeq_adapt_done_reg1),
        .R(resetovrd_start_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rxeq_adapt_done_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_adapt_done_reg1),
        .Q(rxeq_adapt_done_reg2),
        .R(resetovrd_start_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rxresetdone_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(gt_rxresetdone_0),
        .Q(rxresetdone_reg1),
        .R(resetovrd_start_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rxresetdone_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxresetdone_reg1),
        .Q(rxresetdone_reg2),
        .R(resetovrd_start_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rxstatus_reg1_reg
       (.C(pipe_rxusrclk_in),
        .CE(1'b1),
        .D(RXSTATUS),
        .Q(rxstatus_reg1),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rxstatus_reg2_reg
       (.C(pipe_rxusrclk_in),
        .CE(1'b1),
        .D(rxstatus_reg1),
        .Q(rxstatus_reg2),
        .R(SR));
  LUT6 #(
    .INIT(64'h8080000000FF0000)) 
    \rxvalid_cnt[0]_i_1 
       (.I0(rxvalid_cnt_reg[2]),
        .I1(rxvalid_cnt_reg[1]),
        .I2(rxvalid_cnt_reg[3]),
        .I3(rxstatus_reg2),
        .I4(rxvalid_reg2),
        .I5(rxvalid_cnt_reg[0]),
        .O(p_0_in__2[0]));
  LUT6 #(
    .INIT(64'h808000F000F00000)) 
    \rxvalid_cnt[1]_i_1 
       (.I0(rxvalid_cnt_reg[2]),
        .I1(rxvalid_cnt_reg[3]),
        .I2(rxvalid_reg2),
        .I3(rxstatus_reg2),
        .I4(rxvalid_cnt_reg[1]),
        .I5(rxvalid_cnt_reg[0]),
        .O(p_0_in__2[1]));
  LUT6 #(
    .INIT(64'h880C0C000C000C00)) 
    \rxvalid_cnt[2]_i_1 
       (.I0(rxvalid_cnt_reg[3]),
        .I1(rxvalid_reg2),
        .I2(rxstatus_reg2),
        .I3(rxvalid_cnt_reg[2]),
        .I4(rxvalid_cnt_reg[0]),
        .I5(rxvalid_cnt_reg[1]),
        .O(p_0_in__2[2]));
  LUT6 #(
    .INIT(64'hC440404040404040)) 
    \rxvalid_cnt[3]_i_1 
       (.I0(rxstatus_reg2),
        .I1(rxvalid_reg2),
        .I2(rxvalid_cnt_reg[3]),
        .I3(rxvalid_cnt_reg[2]),
        .I4(rxvalid_cnt_reg[0]),
        .I5(rxvalid_cnt_reg[1]),
        .O(p_0_in__2[3]));
  FDRE #(
    .INIT(1'b0)) 
    \rxvalid_cnt_reg[0] 
       (.C(pipe_rxusrclk_in),
        .CE(1'b1),
        .D(p_0_in__2[0]),
        .Q(rxvalid_cnt_reg[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rxvalid_cnt_reg[1] 
       (.C(pipe_rxusrclk_in),
        .CE(1'b1),
        .D(p_0_in__2[1]),
        .Q(rxvalid_cnt_reg[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rxvalid_cnt_reg[2] 
       (.C(pipe_rxusrclk_in),
        .CE(1'b1),
        .D(p_0_in__2[2]),
        .Q(rxvalid_cnt_reg[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rxvalid_cnt_reg[3] 
       (.C(pipe_rxusrclk_in),
        .CE(1'b1),
        .D(p_0_in__2[3]),
        .Q(rxvalid_cnt_reg[3]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rxvalid_reg1_reg
       (.C(pipe_rxusrclk_in),
        .CE(1'b1),
        .D(gt_rxvalid),
        .Q(rxvalid_reg1),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rxvalid_reg2_reg
       (.C(pipe_rxusrclk_in),
        .CE(1'b1),
        .D(rxvalid_reg1),
        .Q(rxvalid_reg2),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE txcompliance_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(pipe_tx0_compliance),
        .Q(txcompliance_reg1),
        .R(resetovrd_start_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE txcompliance_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txcompliance_reg1),
        .Q(txcompliance_reg2),
        .R(resetovrd_start_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE txelecidle_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(pipe_tx0_elec_idle),
        .Q(txelecidle_reg1),
        .R(resetovrd_start_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE txelecidle_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txelecidle_reg1),
        .Q(txelecidle_reg2),
        .R(resetovrd_start_reg2_reg_0));
  LUT3 #(
    .INIT(8'hEA)) 
    txphaligndone_reg1_i_1
       (.I0(txphaligndone_reg1_reg),
        .I1(txcompliance_reg2),
        .I2(txelecidle_reg2),
        .O(txphaligndone0));
  LUT3 #(
    .INIT(8'hEA)) 
    txphinitdone_reg1_i_1
       (.I0(txphinitdone_reg1_reg),
        .I1(txcompliance_reg2),
        .I2(txelecidle_reg2),
        .O(SYNC_TXPHINITDONE1));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE txresetdone_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(gt_txresetdone_0),
        .Q(txresetdone_reg1),
        .R(resetovrd_start_reg2_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE txresetdone_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txresetdone_reg1),
        .Q(txresetdone_reg2),
        .R(resetovrd_start_reg2_reg_0));
endmodule

module pcie_7x_0_pipe_wrapper
   (gen3_reg,
    pipe_pclk_sel_out,
    PIPE_RXELECIDLE,
    pci_exp_txn,
    pci_exp_txp,
    pipe_rx0_chanisaligned,
    pipe_rxoutclk_out,
    pipe_txoutclk_out,
    D,
    \gtx_channel.gtxe2_channel_i ,
    sys_rst_n,
    rate_idle_reg2_reg,
    reg_clock_locked_reg,
    \gtx_channel.gtxe2_channel_i_0 ,
    PIPE_PHYSTATUS,
    pipe_mmcm_lock_in,
    pipe_pclk_in,
    pipe_rxusrclk_in,
    pipe_dclk_in,
    pipe_tx0_elec_idle,
    pipe_tx0_compliance,
    sys_clk,
    pci_exp_rxn,
    pci_exp_rxp,
    pipe_rx0_polarity,
    pipe_tx_deemph,
    pipe_tx_rcvr_det,
    pipe_tx0_powerdown,
    pipe_tx_margin,
    pipe_tx0_data,
    pipe_tx0_char_is_k,
    pipe_oobclk_in,
    reset_n_reg2_reg_0,
    \gt_rx_status_q_reg[0] ,
    reg_clock_locked,
    \gt_rx_status_q_reg[2] ,
    pipe_tx_rate);
  output gen3_reg;
  output [0:0]pipe_pclk_sel_out;
  output PIPE_RXELECIDLE;
  output [0:0]pci_exp_txn;
  output [0:0]pci_exp_txp;
  output pipe_rx0_chanisaligned;
  output [0:0]pipe_rxoutclk_out;
  output pipe_txoutclk_out;
  output [15:0]D;
  output [1:0]\gtx_channel.gtxe2_channel_i ;
  output sys_rst_n;
  output rate_idle_reg2_reg;
  output reg_clock_locked_reg;
  output [2:0]\gtx_channel.gtxe2_channel_i_0 ;
  output PIPE_PHYSTATUS;
  input pipe_mmcm_lock_in;
  input pipe_pclk_in;
  input pipe_rxusrclk_in;
  input pipe_dclk_in;
  input pipe_tx0_elec_idle;
  input pipe_tx0_compliance;
  input sys_clk;
  input [0:0]pci_exp_rxn;
  input [0:0]pci_exp_rxp;
  input pipe_rx0_polarity;
  input pipe_tx_deemph;
  input pipe_tx_rcvr_det;
  input [1:0]pipe_tx0_powerdown;
  input [2:0]pipe_tx_margin;
  input [15:0]pipe_tx0_data;
  input [1:0]pipe_tx0_char_is_k;
  input pipe_oobclk_in;
  input reset_n_reg2_reg_0;
  input \gt_rx_status_q_reg[0] ;
  input reg_clock_locked;
  input \gt_rx_status_q_reg[2] ;
  input pipe_tx_rate;

  wire CPLLRESET0;
  wire [15:0]D;
  wire PIPE_PHYSTATUS;
  wire PIPE_RXELECIDLE;
  wire RX8B10BEN0;
  wire SYNC_TXPHINITDONE1;
  wire SYNC_TXSYNC_START0;
  wire cpllrst;
  wire drp_done;
  wire [6:0]eq_txeq_maincursor;
  wire [4:0]eq_txeq_postcursor;
  wire [4:0]eq_txeq_precursor;
  wire gen3_reg;
  wire gt_cpllpdrefclk;
  wire gt_phystatus;
  wire \gt_rx_status_q_reg[0] ;
  wire \gt_rx_status_q_reg[2] ;
  wire gt_rxcdrlock;
  wire gt_rxratedone;
  wire gt_rxresetdone_0;
  wire gt_rxvalid;
  wire gt_txratedone;
  wire gt_txresetdone_0;
  wire [1:0]\gtx_channel.gtxe2_channel_i ;
  wire [2:0]\gtx_channel.gtxe2_channel_i_0 ;
  wire p_0_in1_in;
  wire p_1_in;
  wire p_1_in0_in;
  wire p_1_in2_in;
  wire [0:0]pci_exp_rxn;
  wire [0:0]pci_exp_rxp;
  wire [0:0]pci_exp_txn;
  wire [0:0]pci_exp_txp;
  wire pipe_dclk_in;
  wire \pipe_lane[0].gt_wrapper_i_n_1 ;
  wire \pipe_lane[0].gt_wrapper_i_n_11 ;
  wire \pipe_lane[0].gt_wrapper_i_n_15 ;
  wire \pipe_lane[0].gt_wrapper_i_n_17 ;
  wire \pipe_lane[0].gt_wrapper_i_n_18 ;
  wire \pipe_lane[0].gt_wrapper_i_n_2 ;
  wire \pipe_lane[0].gt_wrapper_i_n_21 ;
  wire \pipe_lane[0].gt_wrapper_i_n_22 ;
  wire \pipe_lane[0].gt_wrapper_i_n_23 ;
  wire \pipe_lane[0].gt_wrapper_i_n_24 ;
  wire \pipe_lane[0].gt_wrapper_i_n_25 ;
  wire \pipe_lane[0].gt_wrapper_i_n_26 ;
  wire \pipe_lane[0].gt_wrapper_i_n_27 ;
  wire \pipe_lane[0].gt_wrapper_i_n_28 ;
  wire \pipe_lane[0].gt_wrapper_i_n_29 ;
  wire \pipe_lane[0].gt_wrapper_i_n_30 ;
  wire \pipe_lane[0].gt_wrapper_i_n_31 ;
  wire \pipe_lane[0].gt_wrapper_i_n_32 ;
  wire \pipe_lane[0].gt_wrapper_i_n_33 ;
  wire \pipe_lane[0].gt_wrapper_i_n_34 ;
  wire \pipe_lane[0].gt_wrapper_i_n_35 ;
  wire \pipe_lane[0].gt_wrapper_i_n_36 ;
  wire \pipe_lane[0].gt_wrapper_i_n_37 ;
  wire \pipe_lane[0].gt_wrapper_i_n_8 ;
  wire \pipe_lane[0].pipe_drp.pipe_drp_i_n_1 ;
  wire \pipe_lane[0].pipe_drp.pipe_drp_i_n_10 ;
  wire \pipe_lane[0].pipe_drp.pipe_drp_i_n_11 ;
  wire \pipe_lane[0].pipe_drp.pipe_drp_i_n_12 ;
  wire \pipe_lane[0].pipe_drp.pipe_drp_i_n_13 ;
  wire \pipe_lane[0].pipe_drp.pipe_drp_i_n_14 ;
  wire \pipe_lane[0].pipe_drp.pipe_drp_i_n_15 ;
  wire \pipe_lane[0].pipe_drp.pipe_drp_i_n_16 ;
  wire \pipe_lane[0].pipe_drp.pipe_drp_i_n_17 ;
  wire \pipe_lane[0].pipe_drp.pipe_drp_i_n_18 ;
  wire \pipe_lane[0].pipe_drp.pipe_drp_i_n_19 ;
  wire \pipe_lane[0].pipe_drp.pipe_drp_i_n_2 ;
  wire \pipe_lane[0].pipe_drp.pipe_drp_i_n_20 ;
  wire \pipe_lane[0].pipe_drp.pipe_drp_i_n_21 ;
  wire \pipe_lane[0].pipe_drp.pipe_drp_i_n_22 ;
  wire \pipe_lane[0].pipe_drp.pipe_drp_i_n_23 ;
  wire \pipe_lane[0].pipe_drp.pipe_drp_i_n_24 ;
  wire \pipe_lane[0].pipe_drp.pipe_drp_i_n_25 ;
  wire \pipe_lane[0].pipe_drp.pipe_drp_i_n_26 ;
  wire \pipe_lane[0].pipe_drp.pipe_drp_i_n_3 ;
  wire \pipe_lane[0].pipe_drp.pipe_drp_i_n_4 ;
  wire \pipe_lane[0].pipe_drp.pipe_drp_i_n_5 ;
  wire \pipe_lane[0].pipe_drp.pipe_drp_i_n_6 ;
  wire \pipe_lane[0].pipe_drp.pipe_drp_i_n_7 ;
  wire \pipe_lane[0].pipe_drp.pipe_drp_i_n_8 ;
  wire \pipe_lane[0].pipe_drp.pipe_drp_i_n_9 ;
  wire \pipe_lane[0].pipe_eq.pipe_eq_i_n_0 ;
  wire \pipe_lane[0].pipe_quad.gt_common_enabled.gt_common_int.gt_common_i_n_0 ;
  wire \pipe_lane[0].pipe_quad.gt_common_enabled.gt_common_int.gt_common_i_n_1 ;
  wire \pipe_lane[0].pipe_quad.gt_common_enabled.gt_common_int.gt_common_i_n_2 ;
  wire \pipe_lane[0].pipe_rate.pipe_rate_i_n_12 ;
  wire \pipe_lane[0].pipe_rate.pipe_rate_i_n_13 ;
  wire \pipe_lane[0].pipe_rate.pipe_rate_i_n_14 ;
  wire \pipe_lane[0].pipe_rate.pipe_rate_i_n_15 ;
  wire \pipe_lane[0].pipe_rate.pipe_rate_i_n_16 ;
  wire \pipe_lane[0].pipe_sync_i_n_1 ;
  wire \pipe_lane[0].pipe_sync_i_n_3 ;
  wire \pipe_lane[0].pipe_sync_i_n_6 ;
  wire \pipe_lane[0].pipe_sync_i_n_7 ;
  wire \pipe_lane[0].pipe_sync_i_n_8 ;
  wire \pipe_lane[0].pipe_user_i_n_10 ;
  wire \pipe_lane[0].pipe_user_i_n_6 ;
  wire \pipe_lane[0].pipe_user_i_n_7 ;
  wire pipe_mmcm_lock_in;
  wire pipe_oobclk_in;
  wire pipe_pclk_in;
  wire [0:0]pipe_pclk_sel_out;
  wire \pipe_reset.pipe_reset_i_n_3 ;
  wire \pipe_reset.pipe_reset_i_n_7 ;
  wire pipe_rx0_chanisaligned;
  wire pipe_rx0_polarity;
  wire [0:0]pipe_rxoutclk_out;
  wire pipe_rxusrclk_in;
  wire [1:0]pipe_tx0_char_is_k;
  wire pipe_tx0_compliance;
  wire [15:0]pipe_tx0_data;
  wire pipe_tx0_elec_idle;
  wire [1:0]pipe_tx0_powerdown;
  wire pipe_tx_deemph;
  wire [2:0]pipe_tx_margin;
  wire pipe_tx_rate;
  wire pipe_tx_rcvr_det;
  wire pipe_txoutclk_out;
  wire qdrp_done;
  wire \qpll_reset.qpll_reset_i_n_0 ;
  wire qpllpd;
  wire qrst_drp_start;
  wire qrst_qpllreset;
  wire rate_cpllpd;
  wire rate_cpllreset;
  wire rate_drp_start;
  wire rate_drp_x16;
  wire rate_drp_x16x20_mode;
  wire rate_idle_reg2_reg;
  wire rate_qpllpd;
  wire rate_qpllreset;
  wire [0:0]rate_rate_0;
  wire rate_rxpmareset;
  wire [0:0]rate_sysclksel_0;
  wire reg_clock_locked;
  wire reg_clock_locked_reg;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire reset_n_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire reset_n_reg2;
  wire reset_n_reg2_reg_0;
  wire rst_cpllreset;
  wire rst_dclk_reset;
  wire rst_gtreset;
  wire rst_rxusrclk_reset;
  wire rst_txsync_start;
  wire rst_userrdy;
  wire sync_txdlyen;
  wire sync_txsync_done;
  wire sys_clk;
  wire sys_rst_n;
  wire txphaligndone0;
  wire user_oobclk;
  wire user_resetdone;
  wire user_rx_converge;
  wire user_rxcdrlock;

  (* box_type = "PRIMITIVE" *) 
  BUFG cpllpd_refclk_inst
       (.I(sys_clk),
        .O(gt_cpllpdrefclk));
  pcie_7x_0_gt_wrapper \pipe_lane[0].gt_wrapper_i 
       (.CLKRSVD(user_oobclk),
        .CPLLRESET0(CPLLRESET0),
        .D({\pipe_lane[0].gt_wrapper_i_n_21 ,\pipe_lane[0].gt_wrapper_i_n_22 ,\pipe_lane[0].gt_wrapper_i_n_23 ,\pipe_lane[0].gt_wrapper_i_n_24 ,\pipe_lane[0].gt_wrapper_i_n_25 ,\pipe_lane[0].gt_wrapper_i_n_26 ,\pipe_lane[0].gt_wrapper_i_n_27 ,\pipe_lane[0].gt_wrapper_i_n_28 ,\pipe_lane[0].gt_wrapper_i_n_29 ,\pipe_lane[0].gt_wrapper_i_n_30 ,\pipe_lane[0].gt_wrapper_i_n_31 ,\pipe_lane[0].gt_wrapper_i_n_32 ,\pipe_lane[0].gt_wrapper_i_n_33 ,\pipe_lane[0].gt_wrapper_i_n_34 ,\pipe_lane[0].gt_wrapper_i_n_35 ,\pipe_lane[0].gt_wrapper_i_n_36 }),
        .DRPADDR({\pipe_lane[0].pipe_drp.pipe_drp_i_n_18 ,\pipe_lane[0].pipe_drp.pipe_drp_i_n_19 ,\pipe_lane[0].pipe_drp.pipe_drp_i_n_20 ,\pipe_lane[0].pipe_drp.pipe_drp_i_n_21 ,\pipe_lane[0].pipe_drp.pipe_drp_i_n_22 ,\pipe_lane[0].pipe_drp.pipe_drp_i_n_23 ,\pipe_lane[0].pipe_drp.pipe_drp_i_n_24 ,\pipe_lane[0].pipe_drp.pipe_drp_i_n_25 }),
        .DRPDI({\pipe_lane[0].pipe_drp.pipe_drp_i_n_2 ,\pipe_lane[0].pipe_drp.pipe_drp_i_n_3 ,\pipe_lane[0].pipe_drp.pipe_drp_i_n_4 ,\pipe_lane[0].pipe_drp.pipe_drp_i_n_5 ,\pipe_lane[0].pipe_drp.pipe_drp_i_n_6 ,\pipe_lane[0].pipe_drp.pipe_drp_i_n_7 ,\pipe_lane[0].pipe_drp.pipe_drp_i_n_8 ,\pipe_lane[0].pipe_drp.pipe_drp_i_n_9 ,\pipe_lane[0].pipe_drp.pipe_drp_i_n_10 ,\pipe_lane[0].pipe_drp.pipe_drp_i_n_11 ,\pipe_lane[0].pipe_drp.pipe_drp_i_n_12 ,\pipe_lane[0].pipe_drp.pipe_drp_i_n_13 ,\pipe_lane[0].pipe_drp.pipe_drp_i_n_14 ,\pipe_lane[0].pipe_drp.pipe_drp_i_n_15 ,\pipe_lane[0].pipe_drp.pipe_drp_i_n_16 ,\pipe_lane[0].pipe_drp.pipe_drp_i_n_17 }),
        .PIPE_RXELECIDLE(PIPE_RXELECIDLE),
        .Q({\pipe_lane[0].pipe_sync_i_n_6 ,\pipe_lane[0].pipe_sync_i_n_7 ,\pipe_lane[0].pipe_sync_i_n_8 }),
        .QPLL_QPLLOUTCLK(\pipe_lane[0].pipe_quad.gt_common_enabled.gt_common_int.gt_common_i_n_1 ),
        .QPLL_QPLLOUTREFCLK(\pipe_lane[0].pipe_quad.gt_common_enabled.gt_common_int.gt_common_i_n_2 ),
        .QRST_CPLLLOCK(\pipe_lane[0].gt_wrapper_i_n_1 ),
        .RX8B10BEN0(RX8B10BEN0),
        .RXRATE(rate_rate_0),
        .RXSTATUS(\pipe_lane[0].gt_wrapper_i_n_37 ),
        .RXSYSCLKSEL(rate_sysclksel_0),
        .TXMAINCURSOR(eq_txeq_maincursor),
        .TXPOSTCURSOR(eq_txeq_postcursor),
        .TXPRECURSOR(eq_txeq_precursor),
        .cpllrst(cpllrst),
        .gt_cpllpdrefclk(gt_cpllpdrefclk),
        .gt_phystatus(gt_phystatus),
        .\gt_rx_status_q_reg[0] (\gt_rx_status_q_reg[0] ),
        .\gt_rx_status_q_reg[2] (\gt_rx_status_q_reg[2] ),
        .gt_rxcdrlock(gt_rxcdrlock),
        .gt_rxratedone(gt_rxratedone),
        .gt_rxresetdone_0(gt_rxresetdone_0),
        .gt_rxvalid(gt_rxvalid),
        .gt_txratedone(gt_txratedone),
        .gt_txresetdone_0(gt_txresetdone_0),
        .\gtx_channel.gtxe2_channel_i_0 (\pipe_lane[0].gt_wrapper_i_n_2 ),
        .\gtx_channel.gtxe2_channel_i_1 (\pipe_lane[0].gt_wrapper_i_n_8 ),
        .\gtx_channel.gtxe2_channel_i_10 (\pipe_lane[0].pipe_drp.pipe_drp_i_n_26 ),
        .\gtx_channel.gtxe2_channel_i_2 (\pipe_lane[0].gt_wrapper_i_n_11 ),
        .\gtx_channel.gtxe2_channel_i_3 (\pipe_lane[0].gt_wrapper_i_n_15 ),
        .\gtx_channel.gtxe2_channel_i_4 (\pipe_lane[0].gt_wrapper_i_n_17 ),
        .\gtx_channel.gtxe2_channel_i_5 (\pipe_lane[0].gt_wrapper_i_n_18 ),
        .\gtx_channel.gtxe2_channel_i_6 (D),
        .\gtx_channel.gtxe2_channel_i_7 (\gtx_channel.gtxe2_channel_i ),
        .\gtx_channel.gtxe2_channel_i_8 (\gtx_channel.gtxe2_channel_i_0 ),
        .\gtx_channel.gtxe2_channel_i_9 (\pipe_lane[0].pipe_drp.pipe_drp_i_n_1 ),
        .pci_exp_rxn(pci_exp_rxn),
        .pci_exp_rxp(pci_exp_rxp),
        .pci_exp_txn(pci_exp_txn),
        .pci_exp_txp(pci_exp_txp),
        .pipe_dclk_in(pipe_dclk_in),
        .pipe_pclk_in(pipe_pclk_in),
        .pipe_rx0_chanisaligned(pipe_rx0_chanisaligned),
        .pipe_rx0_polarity(pipe_rx0_polarity),
        .pipe_rxoutclk_out(pipe_rxoutclk_out),
        .pipe_rxusrclk_in(pipe_rxusrclk_in),
        .pipe_tx0_char_is_k(pipe_tx0_char_is_k),
        .pipe_tx0_compliance(pipe_tx0_compliance),
        .pipe_tx0_data(pipe_tx0_data),
        .pipe_tx0_elec_idle(pipe_tx0_elec_idle),
        .pipe_tx0_powerdown(pipe_tx0_powerdown),
        .pipe_tx_deemph(pipe_tx_deemph),
        .pipe_tx_margin(pipe_tx_margin),
        .pipe_tx_rcvr_det(pipe_tx_rcvr_det),
        .pipe_txoutclk_out(pipe_txoutclk_out),
        .rate_cpllpd(rate_cpllpd),
        .rate_rxpmareset(rate_rxpmareset),
        .rst_gtreset(rst_gtreset),
        .rst_userrdy(rst_userrdy),
        .sync_txdlyen(sync_txdlyen),
        .sys_clk(sys_clk),
        .user_rx_converge(user_rx_converge));
  pcie_7x_0_pipe_drp \pipe_lane[0].pipe_drp.pipe_drp_i 
       (.D({\pipe_lane[0].gt_wrapper_i_n_21 ,\pipe_lane[0].gt_wrapper_i_n_22 ,\pipe_lane[0].gt_wrapper_i_n_23 ,\pipe_lane[0].gt_wrapper_i_n_24 ,\pipe_lane[0].gt_wrapper_i_n_25 ,\pipe_lane[0].gt_wrapper_i_n_26 ,\pipe_lane[0].gt_wrapper_i_n_27 ,\pipe_lane[0].gt_wrapper_i_n_28 ,\pipe_lane[0].gt_wrapper_i_n_29 ,\pipe_lane[0].gt_wrapper_i_n_30 ,\pipe_lane[0].gt_wrapper_i_n_31 ,\pipe_lane[0].gt_wrapper_i_n_32 ,\pipe_lane[0].gt_wrapper_i_n_33 ,\pipe_lane[0].gt_wrapper_i_n_34 ,\pipe_lane[0].gt_wrapper_i_n_35 ,\pipe_lane[0].gt_wrapper_i_n_36 }),
        .DRPADDR({\pipe_lane[0].pipe_drp.pipe_drp_i_n_18 ,\pipe_lane[0].pipe_drp.pipe_drp_i_n_19 ,\pipe_lane[0].pipe_drp.pipe_drp_i_n_20 ,\pipe_lane[0].pipe_drp.pipe_drp_i_n_21 ,\pipe_lane[0].pipe_drp.pipe_drp_i_n_22 ,\pipe_lane[0].pipe_drp.pipe_drp_i_n_23 ,\pipe_lane[0].pipe_drp.pipe_drp_i_n_24 ,\pipe_lane[0].pipe_drp.pipe_drp_i_n_25 }),
        .DRPDI({\pipe_lane[0].pipe_drp.pipe_drp_i_n_2 ,\pipe_lane[0].pipe_drp.pipe_drp_i_n_3 ,\pipe_lane[0].pipe_drp.pipe_drp_i_n_4 ,\pipe_lane[0].pipe_drp.pipe_drp_i_n_5 ,\pipe_lane[0].pipe_drp.pipe_drp_i_n_6 ,\pipe_lane[0].pipe_drp.pipe_drp_i_n_7 ,\pipe_lane[0].pipe_drp.pipe_drp_i_n_8 ,\pipe_lane[0].pipe_drp.pipe_drp_i_n_9 ,\pipe_lane[0].pipe_drp.pipe_drp_i_n_10 ,\pipe_lane[0].pipe_drp.pipe_drp_i_n_11 ,\pipe_lane[0].pipe_drp.pipe_drp_i_n_12 ,\pipe_lane[0].pipe_drp.pipe_drp_i_n_13 ,\pipe_lane[0].pipe_drp.pipe_drp_i_n_14 ,\pipe_lane[0].pipe_drp.pipe_drp_i_n_15 ,\pipe_lane[0].pipe_drp.pipe_drp_i_n_16 ,\pipe_lane[0].pipe_drp.pipe_drp_i_n_17 }),
        .SR(rst_dclk_reset),
        .drp_done(drp_done),
        .\fsm_reg[1]_0 (\pipe_lane[0].pipe_drp.pipe_drp_i_n_1 ),
        .\fsm_reg[1]_1 (\pipe_lane[0].pipe_drp.pipe_drp_i_n_26 ),
        .pipe_dclk_in(pipe_dclk_in),
        .pipe_tx_rate(pipe_tx_rate),
        .rate_drp_start(rate_drp_start),
        .rate_drp_x16(rate_drp_x16),
        .rate_drp_x16x20_mode(rate_drp_x16x20_mode),
        .rdy_reg1_reg_0(\pipe_lane[0].gt_wrapper_i_n_2 ),
        .rst_gtreset(rst_gtreset));
  pcie_7x_0_pipe_eq \pipe_lane[0].pipe_eq.pipe_eq_i 
       (.QPLL_DRP_GEN3(gen3_reg),
        .TXMAINCURSOR(eq_txeq_maincursor),
        .TXPOSTCURSOR(eq_txeq_postcursor),
        .TXPRECURSOR(eq_txeq_precursor),
        .out(rst_cpllreset),
        .pipe_pclk_in(pipe_pclk_in),
        .rxeq_adapt_done_reg_0(\pipe_lane[0].pipe_eq.pipe_eq_i_n_0 ));
  pcie_7x_0_gt_common \pipe_lane[0].pipe_quad.gt_common_enabled.gt_common_int.gt_common_i 
       (.QPLL_DRP_DONE(qdrp_done),
        .QPLL_DRP_GEN3(gen3_reg),
        .QPLL_QPLLLOCK(\pipe_lane[0].pipe_quad.gt_common_enabled.gt_common_int.gt_common_i_n_0 ),
        .QPLL_QPLLOUTCLK(\pipe_lane[0].pipe_quad.gt_common_enabled.gt_common_int.gt_common_i_n_1 ),
        .QPLL_QPLLOUTREFCLK(\pipe_lane[0].pipe_quad.gt_common_enabled.gt_common_int.gt_common_i_n_2 ),
        .QPLL_QPLLPD(qpllpd),
        .QPLL_QPLLRESET(qrst_qpllreset),
        .QRST_DRP_START(qrst_drp_start),
        .SR(rst_dclk_reset),
        .pipe_dclk_in(pipe_dclk_in),
        .sys_clk(sys_clk));
  pcie_7x_0_pipe_rate \pipe_lane[0].pipe_rate.pipe_rate_i 
       (.Q({\pipe_reset.pipe_reset_i_n_7 ,rst_txsync_start}),
        .QPLL_DRP_GEN3(gen3_reg),
        .QRST_CPLLLOCK(\pipe_lane[0].gt_wrapper_i_n_1 ),
        .QRST_QPLLLOCK(\pipe_lane[0].pipe_quad.gt_common_enabled.gt_common_int.gt_common_i_n_0 ),
        .QRST_QPLLPD_IN(rate_qpllpd),
        .QRST_QPLLRESET_IN(rate_qpllreset),
        .RX8B10BEN0(RX8B10BEN0),
        .RXRATE(rate_rate_0),
        .RXSYSCLKSEL(rate_sysclksel_0),
        .SYNC_TXSYNC_START0(SYNC_TXSYNC_START0),
        .drp_done(drp_done),
        .\fsm[0]_i_5_0 (p_0_in1_in),
        .\fsm[0]_i_5_1 (p_1_in2_in),
        .\fsm[3]_i_5_0 (\pipe_lane[0].pipe_user_i_n_10 ),
        .\fsm_reg[0]_0 (\pipe_lane[0].pipe_rate.pipe_rate_i_n_16 ),
        .\fsm_reg[2]_0 (\pipe_lane[0].pipe_rate.pipe_rate_i_n_12 ),
        .\fsm_reg[2]_1 (\pipe_lane[0].pipe_rate.pipe_rate_i_n_13 ),
        .\fsm_reg[2]_2 (\pipe_lane[0].pipe_rate.pipe_rate_i_n_14 ),
        .\fsm_reg[4]_0 (\pipe_lane[0].pipe_rate.pipe_rate_i_n_15 ),
        .gt_phystatus(gt_phystatus),
        .gt_rxratedone(gt_rxratedone),
        .gt_rxresetdone_0(gt_rxresetdone_0),
        .gt_txratedone(gt_txratedone),
        .gt_txresetdone_0(gt_txresetdone_0),
        .out(rst_cpllreset),
        .pipe_mmcm_lock_in(pipe_mmcm_lock_in),
        .pipe_pclk_in(pipe_pclk_in),
        .pipe_pclk_sel_out(pipe_pclk_sel_out),
        .pipe_tx_rate(pipe_tx_rate),
        .rate_cpllpd(rate_cpllpd),
        .rate_cpllreset(rate_cpllreset),
        .rate_drp_start(rate_drp_start),
        .rate_drp_x16(rate_drp_x16),
        .rate_drp_x16x20_mode(rate_drp_x16x20_mode),
        .rate_rxpmareset(rate_rxpmareset),
        .sync_txsync_done(sync_txsync_done));
  pcie_7x_0_pipe_sync \pipe_lane[0].pipe_sync_i 
       (.\FSM_onehot_txsync_fsm.fsm_tx_reg[4]_0 (\pipe_lane[0].pipe_user_i_n_6 ),
        .\FSM_onehot_txsync_fsm.fsm_tx_reg[5]_0 (\pipe_lane[0].pipe_user_i_n_7 ),
        .\FSM_onehot_txsync_fsm.fsm_tx_reg[5]_1 (\pipe_lane[0].pipe_user_i_n_10 ),
        .\FSM_onehot_txsync_fsm.fsm_tx_reg[6]_0 (p_0_in1_in),
        .\FSM_onehot_txsync_fsm.fsm_tx_reg[6]_1 (p_1_in2_in),
        .PIPE_RXELECIDLE(PIPE_RXELECIDLE),
        .Q({\pipe_lane[0].pipe_sync_i_n_6 ,\pipe_lane[0].pipe_sync_i_n_7 ,\pipe_lane[0].pipe_sync_i_n_8 }),
        .QPLL_DRP_GEN3(gen3_reg),
        .SYNC_TXPHINITDONE1(SYNC_TXPHINITDONE1),
        .SYNC_TXSYNC_START0(SYNC_TXSYNC_START0),
        .out(p_1_in),
        .pipe_mmcm_lock_in(pipe_mmcm_lock_in),
        .pipe_pclk_in(pipe_pclk_in),
        .rate_idle_reg1_reg_0(\pipe_lane[0].pipe_rate.pipe_rate_i_n_15 ),
        .rxdlysresetdone_reg1_reg_0(\pipe_lane[0].gt_wrapper_i_n_8 ),
        .rxphaligndone_m_reg1_reg_0(\pipe_lane[0].gt_wrapper_i_n_11 ),
        .rxphaligndone_s_reg2_reg_0(rst_cpllreset),
        .rxsync_start_reg1_reg_0(\pipe_lane[0].pipe_rate.pipe_rate_i_n_12 ),
        .sync_txdlyen(sync_txdlyen),
        .sync_txsync_done(sync_txsync_done),
        .txdlysresetdone_reg1_reg_0(\pipe_lane[0].gt_wrapper_i_n_15 ),
        .txphaligndone0(txphaligndone0),
        .txphaligndone_reg3_reg_0(\pipe_lane[0].pipe_sync_i_n_1 ),
        .txphinitdone_reg2_reg_0(p_1_in0_in),
        .txphinitdone_reg3_reg_0(\pipe_lane[0].pipe_sync_i_n_3 ),
        .user_rxcdrlock(user_rxcdrlock));
  pcie_7x_0_pipe_user \pipe_lane[0].pipe_user_i 
       (.CLKRSVD(user_oobclk),
        .\FSM_onehot_txsync_fsm.fsm_tx_reg[4] (\pipe_lane[0].pipe_sync_i_n_3 ),
        .\FSM_onehot_txsync_fsm.fsm_tx_reg[4]_0 (p_1_in0_in),
        .\FSM_onehot_txsync_fsm.fsm_tx_reg[5] (\pipe_lane[0].pipe_sync_i_n_1 ),
        .\FSM_onehot_txsync_fsm.fsm_tx_reg[5]_0 (p_1_in),
        .PIPE_PHYSTATUS(PIPE_PHYSTATUS),
        .PIPE_RXELECIDLE(PIPE_RXELECIDLE),
        .Q(\pipe_reset.pipe_reset_i_n_7 ),
        .QPLL_DRP_GEN3(gen3_reg),
        .RXSTATUS(\pipe_lane[0].gt_wrapper_i_n_37 ),
        .SR(rst_rxusrclk_reset),
        .SYNC_TXPHINITDONE1(SYNC_TXPHINITDONE1),
        .gt_phystatus(gt_phystatus),
        .gt_rxcdrlock(gt_rxcdrlock),
        .gt_rxresetdone_0(gt_rxresetdone_0),
        .gt_rxvalid(gt_rxvalid),
        .gt_rxvalid_q_reg(\gt_rx_status_q_reg[0] ),
        .gt_txresetdone_0(gt_txresetdone_0),
        .out(p_1_in2_in),
        .pipe_oobclk_in(pipe_oobclk_in),
        .pipe_pclk_in(pipe_pclk_in),
        .pipe_pclk_sel_out(pipe_pclk_sel_out),
        .pipe_rxusrclk_in(pipe_rxusrclk_in),
        .pipe_tx0_compliance(pipe_tx0_compliance),
        .pipe_tx0_elec_idle(pipe_tx0_elec_idle),
        .rate_done_reg1_reg_0(\pipe_lane[0].pipe_rate.pipe_rate_i_n_13 ),
        .rate_idle_reg1_reg_0(\pipe_lane[0].pipe_rate.pipe_rate_i_n_15 ),
        .rate_idle_reg2_reg_0(rate_idle_reg2_reg),
        .rate_rxsync_reg1_reg_0(\pipe_lane[0].pipe_rate.pipe_rate_i_n_14 ),
        .reg_clock_locked(reg_clock_locked),
        .reg_clock_locked_reg(reg_clock_locked_reg),
        .resetovrd_start_reg1_reg_0(\pipe_lane[0].pipe_rate.pipe_rate_i_n_16 ),
        .resetovrd_start_reg2_reg_0(rst_cpllreset),
        .rxeq_adapt_done_reg1_reg_0(\pipe_lane[0].pipe_eq.pipe_eq_i_n_0 ),
        .txcompliance_reg2_reg_0(p_0_in1_in),
        .txcompliance_reg2_reg_1(\pipe_lane[0].pipe_user_i_n_6 ),
        .txcompliance_reg2_reg_2(\pipe_lane[0].pipe_user_i_n_7 ),
        .txelecidle_reg2_reg_0(\pipe_lane[0].pipe_user_i_n_10 ),
        .txphaligndone0(txphaligndone0),
        .txphaligndone_reg1_reg(\pipe_lane[0].gt_wrapper_i_n_17 ),
        .txphinitdone_reg1_reg(\pipe_lane[0].gt_wrapper_i_n_18 ),
        .user_resetdone(user_resetdone),
        .user_rx_converge(user_rx_converge),
        .user_rxcdrlock(user_rxcdrlock));
  pcie_7x_0_pipe_reset \pipe_reset.pipe_reset_i 
       (.CPLLRESET0(CPLLRESET0),
        .Q({\pipe_reset.pipe_reset_i_n_7 ,rst_txsync_start}),
        .QRST_CPLLLOCK(\pipe_lane[0].gt_wrapper_i_n_1 ),
        .QRST_IDLE(\qpll_reset.qpll_reset_i_n_0 ),
        .\cfg_wait_cnt_reg[5]_0 (reset_n_reg2),
        .cpllrst(cpllrst),
        .dclk_rst_reg2_reg_0(rst_dclk_reset),
        .drp_done(drp_done),
        .gt_phystatus(gt_phystatus),
        .out(rst_cpllreset),
        .pipe_dclk_in(pipe_dclk_in),
        .pipe_mmcm_lock_in(pipe_mmcm_lock_in),
        .pipe_pclk_in(pipe_pclk_in),
        .pipe_rxusrclk_in(pipe_rxusrclk_in),
        .rate_cpllreset(rate_cpllreset),
        .\rate_idle_reg1_reg[0]_0 (\pipe_lane[0].pipe_rate.pipe_rate_i_n_15 ),
        .reset_n_reg2_reg(\pipe_reset.pipe_reset_i_n_3 ),
        .rst_gtreset(rst_gtreset),
        .rst_userrdy(rst_userrdy),
        .rxusrclk_rst_reg2_reg_0(rst_rxusrclk_reset),
        .sync_txsync_done(sync_txsync_done),
        .user_resetdone(user_resetdone),
        .user_rxcdrlock(user_rxcdrlock));
  LUT1 #(
    .INIT(2'h1)) 
    pl_phy_lnk_up_q_i_1
       (.I0(reset_n_reg2_reg_0),
        .O(sys_rst_n));
  pcie_7x_0_qpll_reset \qpll_reset.qpll_reset_i 
       (.Q({\qpll_reset.qpll_reset_i_n_0 ,qrst_drp_start}),
        .QPLL_QPLLPD(qpllpd),
        .QPLL_QPLLRESET(qrst_qpllreset),
        .QRST_CPLLLOCK(\pipe_lane[0].gt_wrapper_i_n_1 ),
        .QRST_DRP_DONE(qdrp_done),
        .QRST_QPLLLOCK(\pipe_lane[0].pipe_quad.gt_common_enabled.gt_common_int.gt_common_i_n_0 ),
        .QRST_QPLLPD_IN(rate_qpllpd),
        .QRST_QPLLRESET_IN(rate_qpllreset),
        .pipe_mmcm_lock_in(pipe_mmcm_lock_in),
        .pipe_pclk_in(pipe_pclk_in),
        .pipe_tx_rate(pipe_tx_rate),
        .qpllpd_reg_0(\pipe_reset.pipe_reset_i_n_3 ));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDCE reset_n_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .CLR(sys_rst_n),
        .D(1'b1),
        .Q(reset_n_reg1));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDCE reset_n_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .CLR(sys_rst_n),
        .D(reset_n_reg1),
        .Q(reset_n_reg2));
endmodule

module pcie_7x_0_qpll_drp
   (QPLL_DRP_DONE,
    Q,
    \di_reg[15]_0 ,
    qpll_drp_en,
    qpll_drp_we,
    SR,
    QRST_DRP_START,
    pipe_dclk_in,
    qpll_drp_rdy,
    QPLL_QPLLLOCK,
    QPLL_DRP_GEN3,
    D);
  output QPLL_DRP_DONE;
  output [4:0]Q;
  output [15:0]\di_reg[15]_0 ;
  output qpll_drp_en;
  output qpll_drp_we;
  input [0:0]SR;
  input QRST_DRP_START;
  input pipe_dclk_in;
  input qpll_drp_rdy;
  input QPLL_QPLLLOCK;
  input QPLL_DRP_GEN3;
  input [15:0]D;

  wire [15:0]D;
  wire [4:0]Q;
  wire QPLL_DRP_DONE;
  wire QPLL_DRP_GEN3;
  wire QPLL_QPLLLOCK;
  wire QRST_DRP_START;
  wire [0:0]SR;
  wire \addr[0]_i_1_n_0 ;
  wire \addr[1]_i_1_n_0 ;
  wire \addr[2]_i_1_n_0 ;
  wire \addr[5]_i_1_n_0 ;
  wire \addr[7]_i_1_n_0 ;
  wire \crscode_reg_n_0_[0] ;
  wire \crscode_reg_n_0_[1] ;
  wire \crscode_reg_n_0_[2] ;
  wire \crscode_reg_n_0_[3] ;
  wire \crscode_reg_n_0_[4] ;
  wire \crscode_reg_n_0_[5] ;
  wire [15:0]di;
  wire \di[11]_i_2_n_0 ;
  wire \di[12]_i_2_n_0 ;
  wire \di[13]_i_2_n_0 ;
  wire \di[14]_i_2_n_0 ;
  wire \di[15]_i_2_n_0 ;
  wire [15:0]\di_reg[15]_0 ;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire [15:0]do_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire [15:0]do_reg2;
  wire done;
  wire \fsm[0]_i_2_n_0 ;
  wire \fsm[1]_i_2_n_0 ;
  wire \fsm_inferred__1/i___0_n_0 ;
  wire \fsm_inferred__1/i___1_n_0 ;
  wire \fsm_inferred__1/i__n_0 ;
  wire \fsm_reg_n_0_[0] ;
  wire \fsm_reg_n_0_[1] ;
  wire \fsm_reg_n_0_[2] ;
  wire \fsm_reg_n_0_[3] ;
  wire \fsm_reg_n_0_[4] ;
  wire \fsm_reg_n_0_[5] ;
  wire \fsm_reg_n_0_[6] ;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire gen3_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire gen3_reg2;
  wire \gtx_common.gtxe2_common_i_i_3_n_0 ;
  wire \gtx_common.gtxe2_common_i_i_4_n_0 ;
  wire index;
  wire \index[0]_i_1_n_0 ;
  wire \index[1]_i_1_n_0 ;
  wire \index[2]_i_1_n_0 ;
  wire \index[2]_i_2_n_0 ;
  wire \index[2]_i_4_n_0 ;
  wire \index_reg_n_0_[0] ;
  wire \index_reg_n_0_[1] ;
  wire \index_reg_n_0_[2] ;
  wire [1:0]load_cnt;
  wire \load_cnt[0]_i_1_n_0 ;
  wire \load_cnt[1]_i_1_n_0 ;
  wire \load_cnt[1]_i_2_n_0 ;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire ovrd_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire ovrd_reg2;
  wire [6:0]p_0_in__0;
  wire p_1_in;
  wire [5:0]p_2_in;
  wire pipe_dclk_in;
  wire qpll_drp_en;
  wire qpll_drp_rdy;
  wire qpll_drp_we;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire qplllock_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire qplllock_reg2;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rdy_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire rdy_reg2;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire start_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire start_reg2;

  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'h12)) 
    \addr[0]_i_1 
       (.I0(\index_reg_n_0_[1] ),
        .I1(\index_reg_n_0_[0] ),
        .I2(\index_reg_n_0_[2] ),
        .O(\addr[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'h0D)) 
    \addr[1]_i_1 
       (.I0(\index_reg_n_0_[2] ),
        .I1(\index_reg_n_0_[0] ),
        .I2(\index_reg_n_0_[1] ),
        .O(\addr[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'h4D)) 
    \addr[2]_i_1 
       (.I0(\index_reg_n_0_[1] ),
        .I1(\index_reg_n_0_[2] ),
        .I2(\index_reg_n_0_[0] ),
        .O(\addr[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \addr[5]_i_1 
       (.I0(\index_reg_n_0_[1] ),
        .I1(\index_reg_n_0_[0] ),
        .O(\addr[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \addr[7]_i_1 
       (.I0(\index_reg_n_0_[1] ),
        .I1(\index_reg_n_0_[0] ),
        .I2(\index_reg_n_0_[2] ),
        .O(\addr[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addr_reg[0] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(\addr[0]_i_1_n_0 ),
        .Q(Q[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \addr_reg[1] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(\addr[1]_i_1_n_0 ),
        .Q(Q[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \addr_reg[2] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(\addr[2]_i_1_n_0 ),
        .Q(Q[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \addr_reg[5] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(\addr[5]_i_1_n_0 ),
        .Q(Q[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \addr_reg[7] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(\addr[7]_i_1_n_0 ),
        .Q(Q[4]),
        .R(SR));
  LUT2 #(
    .INIT(4'h2)) 
    \crscode[0]_i_1 
       (.I0(do_reg2[1]),
        .I1(\index_reg_n_0_[2] ),
        .O(p_2_in[0]));
  LUT2 #(
    .INIT(4'h2)) 
    \crscode[1]_i_1 
       (.I0(do_reg2[2]),
        .I1(\index_reg_n_0_[2] ),
        .O(p_2_in[1]));
  LUT2 #(
    .INIT(4'h2)) 
    \crscode[2]_i_1 
       (.I0(do_reg2[3]),
        .I1(\index_reg_n_0_[2] ),
        .O(p_2_in[2]));
  LUT2 #(
    .INIT(4'h2)) 
    \crscode[3]_i_1 
       (.I0(do_reg2[4]),
        .I1(\index_reg_n_0_[2] ),
        .O(p_2_in[3]));
  LUT2 #(
    .INIT(4'h2)) 
    \crscode[4]_i_1 
       (.I0(do_reg2[5]),
        .I1(\index_reg_n_0_[2] ),
        .O(p_2_in[4]));
  LUT4 #(
    .INIT(16'hC080)) 
    \crscode[5]_i_1 
       (.I0(ovrd_reg2),
        .I1(\index_reg_n_0_[0] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\index_reg_n_0_[2] ),
        .O(p_1_in));
  LUT2 #(
    .INIT(4'h2)) 
    \crscode[5]_i_2 
       (.I0(do_reg2[6]),
        .I1(\index_reg_n_0_[2] ),
        .O(p_2_in[5]));
  FDRE #(
    .INIT(1'b0)) 
    \crscode_reg[0] 
       (.C(pipe_dclk_in),
        .CE(p_1_in),
        .D(p_2_in[0]),
        .Q(\crscode_reg_n_0_[0] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \crscode_reg[1] 
       (.C(pipe_dclk_in),
        .CE(p_1_in),
        .D(p_2_in[1]),
        .Q(\crscode_reg_n_0_[1] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \crscode_reg[2] 
       (.C(pipe_dclk_in),
        .CE(p_1_in),
        .D(p_2_in[2]),
        .Q(\crscode_reg_n_0_[2] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \crscode_reg[3] 
       (.C(pipe_dclk_in),
        .CE(p_1_in),
        .D(p_2_in[3]),
        .Q(\crscode_reg_n_0_[3] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \crscode_reg[4] 
       (.C(pipe_dclk_in),
        .CE(p_1_in),
        .D(p_2_in[4]),
        .Q(\crscode_reg_n_0_[4] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \crscode_reg[5] 
       (.C(pipe_dclk_in),
        .CE(p_1_in),
        .D(p_2_in[5]),
        .Q(\crscode_reg_n_0_[5] ),
        .R(SR));
  LUT4 #(
    .INIT(16'h7E00)) 
    \di[0]_i_1 
       (.I0(\index_reg_n_0_[0] ),
        .I1(\index_reg_n_0_[2] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(do_reg2[0]),
        .O(di[0]));
  LUT5 #(
    .INIT(32'h0CC5CCCC)) 
    \di[10]_i_1 
       (.I0(\crscode_reg_n_0_[0] ),
        .I1(do_reg2[10]),
        .I2(\index_reg_n_0_[1] ),
        .I3(\index_reg_n_0_[0] ),
        .I4(\index_reg_n_0_[2] ),
        .O(di[10]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAEBAA)) 
    \di[11]_i_1 
       (.I0(\di[11]_i_2_n_0 ),
        .I1(\crscode_reg_n_0_[0] ),
        .I2(\crscode_reg_n_0_[1] ),
        .I3(\index_reg_n_0_[2] ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\index_reg_n_0_[1] ),
        .O(di[11]));
  LUT5 #(
    .INIT(32'h20FF2044)) 
    \di[11]_i_2 
       (.I0(\index_reg_n_0_[0] ),
        .I1(\index_reg_n_0_[1] ),
        .I2(ovrd_reg2),
        .I3(\index_reg_n_0_[2] ),
        .I4(do_reg2[11]),
        .O(\di[11]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00AA0000AAAAC3AA)) 
    \di[12]_i_1 
       (.I0(do_reg2[12]),
        .I1(\di[12]_i_2_n_0 ),
        .I2(\crscode_reg_n_0_[2] ),
        .I3(\index_reg_n_0_[2] ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\index_reg_n_0_[1] ),
        .O(di[12]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \di[12]_i_2 
       (.I0(\crscode_reg_n_0_[0] ),
        .I1(\crscode_reg_n_0_[1] ),
        .O(\di[12]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00F0F099F0F0FFF0)) 
    \di[13]_i_1 
       (.I0(\crscode_reg_n_0_[3] ),
        .I1(\di[13]_i_2_n_0 ),
        .I2(do_reg2[13]),
        .I3(\index_reg_n_0_[1] ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\index_reg_n_0_[2] ),
        .O(di[13]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \di[13]_i_2 
       (.I0(\crscode_reg_n_0_[1] ),
        .I1(\crscode_reg_n_0_[0] ),
        .I2(\crscode_reg_n_0_[2] ),
        .O(\di[13]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00F0F099F0F0FFF0)) 
    \di[14]_i_1 
       (.I0(\crscode_reg_n_0_[4] ),
        .I1(\di[14]_i_2_n_0 ),
        .I2(do_reg2[14]),
        .I3(\index_reg_n_0_[1] ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\index_reg_n_0_[2] ),
        .O(di[14]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \di[14]_i_2 
       (.I0(\crscode_reg_n_0_[2] ),
        .I1(\crscode_reg_n_0_[0] ),
        .I2(\crscode_reg_n_0_[1] ),
        .I3(\crscode_reg_n_0_[3] ),
        .O(\di[14]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0AACAAAA0AA3AAAA)) 
    \di[15]_i_1 
       (.I0(do_reg2[15]),
        .I1(\di[15]_i_2_n_0 ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\index_reg_n_0_[0] ),
        .I4(\index_reg_n_0_[2] ),
        .I5(\crscode_reg_n_0_[5] ),
        .O(di[15]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \di[15]_i_2 
       (.I0(\crscode_reg_n_0_[3] ),
        .I1(\crscode_reg_n_0_[1] ),
        .I2(\crscode_reg_n_0_[0] ),
        .I3(\crscode_reg_n_0_[2] ),
        .I4(\crscode_reg_n_0_[4] ),
        .O(\di[15]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h7E00)) 
    \di[1]_i_1 
       (.I0(\index_reg_n_0_[0] ),
        .I1(\index_reg_n_0_[2] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(do_reg2[1]),
        .O(di[1]));
  LUT4 #(
    .INIT(16'h7E00)) 
    \di[2]_i_1 
       (.I0(\index_reg_n_0_[0] ),
        .I1(\index_reg_n_0_[2] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(do_reg2[2]),
        .O(di[2]));
  LUT4 #(
    .INIT(16'h7E00)) 
    \di[3]_i_1 
       (.I0(\index_reg_n_0_[0] ),
        .I1(\index_reg_n_0_[2] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(do_reg2[3]),
        .O(di[3]));
  LUT4 #(
    .INIT(16'h7E00)) 
    \di[4]_i_1 
       (.I0(\index_reg_n_0_[0] ),
        .I1(\index_reg_n_0_[2] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(do_reg2[4]),
        .O(di[4]));
  LUT4 #(
    .INIT(16'h2AAB)) 
    \di[5]_i_1 
       (.I0(do_reg2[5]),
        .I1(\index_reg_n_0_[1] ),
        .I2(\index_reg_n_0_[0] ),
        .I3(\index_reg_n_0_[2] ),
        .O(di[5]));
  LUT4 #(
    .INIT(16'h2BA8)) 
    \di[6]_i_1 
       (.I0(do_reg2[6]),
        .I1(\index_reg_n_0_[1] ),
        .I2(\index_reg_n_0_[2] ),
        .I3(\index_reg_n_0_[0] ),
        .O(di[6]));
  LUT4 #(
    .INIT(16'h7E00)) 
    \di[7]_i_1 
       (.I0(\index_reg_n_0_[0] ),
        .I1(\index_reg_n_0_[2] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(do_reg2[7]),
        .O(di[7]));
  LUT4 #(
    .INIT(16'h2AAB)) 
    \di[8]_i_1 
       (.I0(do_reg2[8]),
        .I1(\index_reg_n_0_[1] ),
        .I2(\index_reg_n_0_[0] ),
        .I3(\index_reg_n_0_[2] ),
        .O(di[8]));
  LUT4 #(
    .INIT(16'h7E00)) 
    \di[9]_i_1 
       (.I0(\index_reg_n_0_[0] ),
        .I1(\index_reg_n_0_[2] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(do_reg2[9]),
        .O(di[9]));
  FDRE #(
    .INIT(1'b0)) 
    \di_reg[0] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(di[0]),
        .Q(\di_reg[15]_0 [0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \di_reg[10] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(di[10]),
        .Q(\di_reg[15]_0 [10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \di_reg[11] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(di[11]),
        .Q(\di_reg[15]_0 [11]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \di_reg[12] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(di[12]),
        .Q(\di_reg[15]_0 [12]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \di_reg[13] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(di[13]),
        .Q(\di_reg[15]_0 [13]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \di_reg[14] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(di[14]),
        .Q(\di_reg[15]_0 [14]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \di_reg[15] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(di[15]),
        .Q(\di_reg[15]_0 [15]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \di_reg[1] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(di[1]),
        .Q(\di_reg[15]_0 [1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \di_reg[2] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(di[2]),
        .Q(\di_reg[15]_0 [2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \di_reg[3] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(di[3]),
        .Q(\di_reg[15]_0 [3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \di_reg[4] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(di[4]),
        .Q(\di_reg[15]_0 [4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \di_reg[5] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(di[5]),
        .Q(\di_reg[15]_0 [5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \di_reg[6] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(di[6]),
        .Q(\di_reg[15]_0 [6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \di_reg[7] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(di[7]),
        .Q(\di_reg[15]_0 [7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \di_reg[8] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(di[8]),
        .Q(\di_reg[15]_0 [8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \di_reg[9] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(di[9]),
        .Q(\di_reg[15]_0 [9]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg1_reg[0] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(D[0]),
        .Q(do_reg1[0]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg1_reg[10] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(D[10]),
        .Q(do_reg1[10]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg1_reg[11] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(D[11]),
        .Q(do_reg1[11]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg1_reg[12] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(D[12]),
        .Q(do_reg1[12]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg1_reg[13] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(D[13]),
        .Q(do_reg1[13]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg1_reg[14] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(D[14]),
        .Q(do_reg1[14]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg1_reg[15] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(D[15]),
        .Q(do_reg1[15]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg1_reg[1] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(D[1]),
        .Q(do_reg1[1]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg1_reg[2] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(D[2]),
        .Q(do_reg1[2]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg1_reg[3] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(D[3]),
        .Q(do_reg1[3]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg1_reg[4] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(D[4]),
        .Q(do_reg1[4]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg1_reg[5] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(D[5]),
        .Q(do_reg1[5]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg1_reg[6] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(D[6]),
        .Q(do_reg1[6]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg1_reg[7] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(D[7]),
        .Q(do_reg1[7]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg1_reg[8] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(D[8]),
        .Q(do_reg1[8]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg1_reg[9] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(D[9]),
        .Q(do_reg1[9]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg2_reg[0] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(do_reg1[0]),
        .Q(do_reg2[0]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg2_reg[10] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(do_reg1[10]),
        .Q(do_reg2[10]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg2_reg[11] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(do_reg1[11]),
        .Q(do_reg2[11]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg2_reg[12] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(do_reg1[12]),
        .Q(do_reg2[12]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg2_reg[13] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(do_reg1[13]),
        .Q(do_reg2[13]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg2_reg[14] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(do_reg1[14]),
        .Q(do_reg2[14]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg2_reg[15] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(do_reg1[15]),
        .Q(do_reg2[15]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg2_reg[1] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(do_reg1[1]),
        .Q(do_reg2[1]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg2_reg[2] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(do_reg1[2]),
        .Q(do_reg2[2]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg2_reg[3] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(do_reg1[3]),
        .Q(do_reg2[3]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg2_reg[4] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(do_reg1[4]),
        .Q(do_reg2[4]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg2_reg[5] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(do_reg1[5]),
        .Q(do_reg2[5]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg2_reg[6] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(do_reg1[6]),
        .Q(do_reg2[6]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg2_reg[7] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(do_reg1[7]),
        .Q(do_reg2[7]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg2_reg[8] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(do_reg1[8]),
        .Q(do_reg2[8]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \do_reg2_reg[9] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(do_reg1[9]),
        .Q(do_reg2[9]),
        .R(SR));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    done_i_1
       (.I0(\fsm_reg_n_0_[6] ),
        .I1(start_reg2),
        .I2(\fsm_reg_n_0_[0] ),
        .I3(\fsm_reg_n_0_[1] ),
        .I4(\fsm_reg_n_0_[4] ),
        .I5(\gtx_common.gtxe2_common_i_i_4_n_0 ),
        .O(done));
  FDRE #(
    .INIT(1'b0)) 
    done_reg
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(done),
        .Q(QPLL_DRP_DONE),
        .R(SR));
  LUT6 #(
    .INIT(64'h5DFF5D5D5D5D5D5D)) 
    \fsm[0]_i_1 
       (.I0(\fsm_inferred__1/i___1_n_0 ),
        .I1(\fsm_reg_n_0_[0] ),
        .I2(start_reg2),
        .I3(\fsm[0]_i_2_n_0 ),
        .I4(\index_reg_n_0_[1] ),
        .I5(\fsm_reg_n_0_[6] ),
        .O(p_0_in__0[0]));
  LUT2 #(
    .INIT(4'hB)) 
    \fsm[0]_i_2 
       (.I0(\index_reg_n_0_[0] ),
        .I1(\index_reg_n_0_[2] ),
        .O(\fsm[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT5 #(
    .INIT(32'hFFFF7000)) 
    \fsm[1]_i_1 
       (.I0(load_cnt[0]),
        .I1(load_cnt[1]),
        .I2(\fsm_inferred__1/i___1_n_0 ),
        .I3(\fsm_reg_n_0_[1] ),
        .I4(\fsm[1]_i_2_n_0 ),
        .O(p_0_in__0[1]));
  LUT6 #(
    .INIT(64'hFF00B000B000B000)) 
    \fsm[1]_i_2 
       (.I0(\fsm[0]_i_2_n_0 ),
        .I1(\index_reg_n_0_[1] ),
        .I2(\fsm_reg_n_0_[6] ),
        .I3(\fsm_inferred__1/i___1_n_0 ),
        .I4(\fsm_reg_n_0_[0] ),
        .I5(start_reg2),
        .O(\fsm[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \fsm[2]_i_1 
       (.I0(\fsm_reg_n_0_[1] ),
        .I1(\fsm_inferred__1/i___1_n_0 ),
        .I2(load_cnt[1]),
        .I3(load_cnt[0]),
        .O(p_0_in__0[2]));
  LUT4 #(
    .INIT(16'h88C8)) 
    \fsm[3]_i_1 
       (.I0(\fsm_reg_n_0_[2] ),
        .I1(\fsm_inferred__1/i___1_n_0 ),
        .I2(\fsm_reg_n_0_[3] ),
        .I3(rdy_reg2),
        .O(p_0_in__0[3]));
  LUT3 #(
    .INIT(8'h80)) 
    \fsm[4]_i_1 
       (.I0(rdy_reg2),
        .I1(\fsm_reg_n_0_[3] ),
        .I2(\fsm_inferred__1/i___1_n_0 ),
        .O(p_0_in__0[4]));
  LUT4 #(
    .INIT(16'h88C8)) 
    \fsm[5]_i_1 
       (.I0(\fsm_reg_n_0_[4] ),
        .I1(\fsm_inferred__1/i___1_n_0 ),
        .I2(\fsm_reg_n_0_[5] ),
        .I3(rdy_reg2),
        .O(p_0_in__0[5]));
  LUT3 #(
    .INIT(8'h80)) 
    \fsm[6]_i_1 
       (.I0(rdy_reg2),
        .I1(\fsm_reg_n_0_[5] ),
        .I2(\fsm_inferred__1/i___1_n_0 ),
        .O(p_0_in__0[6]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT4 #(
    .INIT(16'h0116)) 
    \fsm_inferred__1/i_ 
       (.I0(\fsm_reg_n_0_[0] ),
        .I1(\fsm_reg_n_0_[1] ),
        .I2(\fsm_reg_n_0_[2] ),
        .I3(\fsm_reg_n_0_[3] ),
        .O(\fsm_inferred__1/i__n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT4 #(
    .INIT(16'hFEE8)) 
    \fsm_inferred__1/i___0 
       (.I0(\fsm_reg_n_0_[0] ),
        .I1(\fsm_reg_n_0_[1] ),
        .I2(\fsm_reg_n_0_[2] ),
        .I3(\fsm_reg_n_0_[3] ),
        .O(\fsm_inferred__1/i___0_n_0 ));
  LUT5 #(
    .INIT(32'h00000116)) 
    \fsm_inferred__1/i___1 
       (.I0(\fsm_reg_n_0_[4] ),
        .I1(\fsm_reg_n_0_[5] ),
        .I2(\fsm_reg_n_0_[6] ),
        .I3(\fsm_inferred__1/i__n_0 ),
        .I4(\fsm_inferred__1/i___0_n_0 ),
        .O(\fsm_inferred__1/i___1_n_0 ));
  (* FSM_ENCODED_STATES = "FSM_READ:000000100,FSM_QPLLRESET:010000000,FSM_LOAD:000000010,FSM_DONE:001000000,FSM_WRITE:000010000,FSM_IDLE:000000001,FSM_WRDY:000100000,FSM_RRDY:000001000,FSM_QPLLLOCK:100000000" *) 
  FDSE #(
    .INIT(1'b1)) 
    \fsm_reg[0] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(p_0_in__0[0]),
        .Q(\fsm_reg_n_0_[0] ),
        .S(SR));
  (* FSM_ENCODED_STATES = "FSM_READ:000000100,FSM_QPLLRESET:010000000,FSM_LOAD:000000010,FSM_DONE:001000000,FSM_WRITE:000010000,FSM_IDLE:000000001,FSM_WRDY:000100000,FSM_RRDY:000001000,FSM_QPLLLOCK:100000000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fsm_reg[1] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(p_0_in__0[1]),
        .Q(\fsm_reg_n_0_[1] ),
        .R(SR));
  (* FSM_ENCODED_STATES = "FSM_READ:000000100,FSM_QPLLRESET:010000000,FSM_LOAD:000000010,FSM_DONE:001000000,FSM_WRITE:000010000,FSM_IDLE:000000001,FSM_WRDY:000100000,FSM_RRDY:000001000,FSM_QPLLLOCK:100000000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fsm_reg[2] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(p_0_in__0[2]),
        .Q(\fsm_reg_n_0_[2] ),
        .R(SR));
  (* FSM_ENCODED_STATES = "FSM_READ:000000100,FSM_QPLLRESET:010000000,FSM_LOAD:000000010,FSM_DONE:001000000,FSM_WRITE:000010000,FSM_IDLE:000000001,FSM_WRDY:000100000,FSM_RRDY:000001000,FSM_QPLLLOCK:100000000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fsm_reg[3] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(p_0_in__0[3]),
        .Q(\fsm_reg_n_0_[3] ),
        .R(SR));
  (* FSM_ENCODED_STATES = "FSM_READ:000000100,FSM_QPLLRESET:010000000,FSM_LOAD:000000010,FSM_DONE:001000000,FSM_WRITE:000010000,FSM_IDLE:000000001,FSM_WRDY:000100000,FSM_RRDY:000001000,FSM_QPLLLOCK:100000000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fsm_reg[4] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(p_0_in__0[4]),
        .Q(\fsm_reg_n_0_[4] ),
        .R(SR));
  (* FSM_ENCODED_STATES = "FSM_READ:000000100,FSM_QPLLRESET:010000000,FSM_LOAD:000000010,FSM_DONE:001000000,FSM_WRITE:000010000,FSM_IDLE:000000001,FSM_WRDY:000100000,FSM_RRDY:000001000,FSM_QPLLLOCK:100000000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fsm_reg[5] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(p_0_in__0[5]),
        .Q(\fsm_reg_n_0_[5] ),
        .R(SR));
  (* FSM_ENCODED_STATES = "FSM_READ:000000100,FSM_QPLLRESET:010000000,FSM_LOAD:000000010,FSM_DONE:001000000,FSM_WRITE:000010000,FSM_IDLE:000000001,FSM_WRDY:000100000,FSM_RRDY:000001000,FSM_QPLLLOCK:100000000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \fsm_reg[6] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(p_0_in__0[6]),
        .Q(\fsm_reg_n_0_[6] ),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE gen3_reg1_reg
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(QPLL_DRP_GEN3),
        .Q(gen3_reg1),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE gen3_reg2_reg
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(gen3_reg1),
        .Q(gen3_reg2),
        .R(SR));
  LUT6 #(
    .INIT(64'h0000000000010100)) 
    \gtx_common.gtxe2_common_i_i_1 
       (.I0(\fsm_reg_n_0_[1] ),
        .I1(\fsm_reg_n_0_[0] ),
        .I2(\fsm_reg_n_0_[6] ),
        .I3(\fsm_reg_n_0_[4] ),
        .I4(\fsm_reg_n_0_[2] ),
        .I5(\gtx_common.gtxe2_common_i_i_3_n_0 ),
        .O(qpll_drp_en));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT5 #(
    .INIT(32'h00000010)) 
    \gtx_common.gtxe2_common_i_i_2 
       (.I0(\fsm_reg_n_0_[0] ),
        .I1(\fsm_reg_n_0_[6] ),
        .I2(\fsm_reg_n_0_[4] ),
        .I3(\fsm_reg_n_0_[1] ),
        .I4(\gtx_common.gtxe2_common_i_i_4_n_0 ),
        .O(qpll_drp_we));
  LUT2 #(
    .INIT(4'hE)) 
    \gtx_common.gtxe2_common_i_i_3 
       (.I0(\fsm_reg_n_0_[3] ),
        .I1(\fsm_reg_n_0_[5] ),
        .O(\gtx_common.gtxe2_common_i_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \gtx_common.gtxe2_common_i_i_4 
       (.I0(\fsm_reg_n_0_[5] ),
        .I1(\fsm_reg_n_0_[3] ),
        .I2(\fsm_reg_n_0_[2] ),
        .O(\gtx_common.gtxe2_common_i_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT5 #(
    .INIT(32'h00FF7000)) 
    \index[0]_i_1 
       (.I0(\index_reg_n_0_[1] ),
        .I1(\index_reg_n_0_[2] ),
        .I2(\index[2]_i_2_n_0 ),
        .I3(index),
        .I4(\index_reg_n_0_[0] ),
        .O(\index[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT5 #(
    .INIT(32'h10FFC000)) 
    \index[1]_i_1 
       (.I0(\index_reg_n_0_[2] ),
        .I1(\index_reg_n_0_[0] ),
        .I2(\index[2]_i_2_n_0 ),
        .I3(index),
        .I4(\index_reg_n_0_[1] ),
        .O(\index[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT5 #(
    .INIT(32'h22FF8000)) 
    \index[2]_i_1 
       (.I0(\index[2]_i_2_n_0 ),
        .I1(\index_reg_n_0_[1] ),
        .I2(\index_reg_n_0_[0] ),
        .I3(index),
        .I4(\index_reg_n_0_[2] ),
        .O(\index[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT5 #(
    .INIT(32'h00000004)) 
    \index[2]_i_2 
       (.I0(\fsm_reg_n_0_[1] ),
        .I1(\fsm_reg_n_0_[6] ),
        .I2(\fsm_reg_n_0_[0] ),
        .I3(\gtx_common.gtxe2_common_i_i_4_n_0 ),
        .I4(\fsm_reg_n_0_[4] ),
        .O(\index[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFEFFFEFEEB)) 
    \index[2]_i_3 
       (.I0(\index[2]_i_4_n_0 ),
        .I1(\fsm_reg_n_0_[5] ),
        .I2(\fsm_reg_n_0_[3] ),
        .I3(\fsm_reg_n_0_[2] ),
        .I4(\fsm_reg_n_0_[1] ),
        .I5(\fsm_reg_n_0_[4] ),
        .O(index));
  LUT2 #(
    .INIT(4'hE)) 
    \index[2]_i_4 
       (.I0(\fsm_reg_n_0_[0] ),
        .I1(\fsm_reg_n_0_[6] ),
        .O(\index[2]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \index_reg[0] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(\index[0]_i_1_n_0 ),
        .Q(\index_reg_n_0_[0] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \index_reg[1] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(\index[1]_i_1_n_0 ),
        .Q(\index_reg_n_0_[1] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \index_reg[2] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(\index[2]_i_1_n_0 ),
        .Q(\index_reg_n_0_[2] ),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT5 #(
    .INIT(32'h00B00000)) 
    \load_cnt[0]_i_1 
       (.I0(load_cnt[1]),
        .I1(load_cnt[0]),
        .I2(\fsm_reg_n_0_[1] ),
        .I3(\fsm_reg_n_0_[6] ),
        .I4(\load_cnt[1]_i_2_n_0 ),
        .O(\load_cnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT5 #(
    .INIT(32'h00E00000)) 
    \load_cnt[1]_i_1 
       (.I0(load_cnt[0]),
        .I1(load_cnt[1]),
        .I2(\fsm_reg_n_0_[1] ),
        .I3(\fsm_reg_n_0_[6] ),
        .I4(\load_cnt[1]_i_2_n_0 ),
        .O(\load_cnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    \load_cnt[1]_i_2 
       (.I0(\fsm_reg_n_0_[4] ),
        .I1(\fsm_reg_n_0_[5] ),
        .I2(\fsm_reg_n_0_[3] ),
        .I3(\fsm_reg_n_0_[2] ),
        .I4(\fsm_reg_n_0_[0] ),
        .O(\load_cnt[1]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \load_cnt_reg[0] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(\load_cnt[0]_i_1_n_0 ),
        .Q(load_cnt[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \load_cnt_reg[1] 
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(\load_cnt[1]_i_1_n_0 ),
        .Q(load_cnt[1]),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE ovrd_reg1_reg
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(ovrd_reg1),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE ovrd_reg2_reg
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(ovrd_reg1),
        .Q(ovrd_reg2),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE qplllock_reg1_reg
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(QPLL_QPLLLOCK),
        .Q(qplllock_reg1),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE qplllock_reg2_reg
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(qplllock_reg1),
        .Q(qplllock_reg2),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rdy_reg1_reg
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(qpll_drp_rdy),
        .Q(rdy_reg1),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE rdy_reg2_reg
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(rdy_reg1),
        .Q(rdy_reg2),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE start_reg1_reg
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(QRST_DRP_START),
        .Q(start_reg1),
        .R(SR));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE start_reg2_reg
       (.C(pipe_dclk_in),
        .CE(1'b1),
        .D(start_reg1),
        .Q(start_reg2),
        .R(SR));
endmodule

module pcie_7x_0_qpll_reset
   (Q,
    QPLL_QPLLRESET,
    QPLL_QPLLPD,
    qpllpd_reg_0,
    pipe_pclk_in,
    QRST_QPLLPD_IN,
    pipe_tx_rate,
    QRST_DRP_DONE,
    QRST_QPLLRESET_IN,
    QRST_QPLLLOCK,
    QRST_CPLLLOCK,
    pipe_mmcm_lock_in);
  output [1:0]Q;
  output QPLL_QPLLRESET;
  output QPLL_QPLLPD;
  input qpllpd_reg_0;
  input pipe_pclk_in;
  input [0:0]QRST_QPLLPD_IN;
  input pipe_tx_rate;
  input [0:0]QRST_DRP_DONE;
  input [0:0]QRST_QPLLRESET_IN;
  input [0:0]QRST_QPLLLOCK;
  input [0:0]QRST_CPLLLOCK;
  input pipe_mmcm_lock_in;

  wire \FSM_onehot_fsm[0]_i_1__0_n_0 ;
  wire \FSM_onehot_fsm[1]_i_1_n_0 ;
  wire \FSM_onehot_fsm[2]_i_1_n_0 ;
  wire \FSM_onehot_fsm[3]_i_1_n_0 ;
  wire \FSM_onehot_fsm[4]_i_1_n_0 ;
  wire \FSM_onehot_fsm[5]_i_1_n_0 ;
  wire \FSM_onehot_fsm_reg_n_0_[0] ;
  wire \FSM_onehot_fsm_reg_n_0_[1] ;
  wire \FSM_onehot_fsm_reg_n_0_[3] ;
  wire \FSM_onehot_fsm_reg_n_0_[4] ;
  wire \FSM_onehot_fsm_reg_n_0_[5] ;
  wire \FSM_onehot_fsm_reg_n_0_[6] ;
  wire [1:0]Q;
  wire QPLL_QPLLPD;
  wire QPLL_QPLLRESET;
  wire [0:0]QRST_CPLLLOCK;
  wire [0:0]QRST_DRP_DONE;
  wire [0:0]QRST_QPLLLOCK;
  wire [0:0]QRST_QPLLPD_IN;
  wire [0:0]QRST_QPLLRESET_IN;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire cplllock_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire cplllock_reg2;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire drp_done_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire drp_done_reg2;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire mmcm_lock_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire mmcm_lock_reg2;
  wire pipe_mmcm_lock_in;
  wire pipe_pclk_in;
  wire pipe_tx_rate;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire qplllock_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire qplllock_reg2;
  wire qpllpd;
  wire qpllpd_i_1_n_0;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire qpllpd_in_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire qpllpd_in_reg2;
  wire qpllpd_reg_0;
  wire qpllreset_i_1_n_0;
  wire qpllreset_i_2_n_0;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire qpllreset_in_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire qpllreset_in_reg2;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire [1:0]rate_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire [1:0]rate_reg2;

  LUT3 #(
    .INIT(8'hA8)) 
    \FSM_onehot_fsm[0]_i_1__0 
       (.I0(\FSM_onehot_fsm_reg_n_0_[0] ),
        .I1(qplllock_reg2),
        .I2(cplllock_reg2),
        .O(\FSM_onehot_fsm[0]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'h0FFF0044)) 
    \FSM_onehot_fsm[1]_i_1 
       (.I0(qplllock_reg2),
        .I1(\FSM_onehot_fsm_reg_n_0_[0] ),
        .I2(mmcm_lock_reg2),
        .I3(cplllock_reg2),
        .I4(\FSM_onehot_fsm_reg_n_0_[1] ),
        .O(\FSM_onehot_fsm[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFF808080)) 
    \FSM_onehot_fsm[2]_i_1 
       (.I0(mmcm_lock_reg2),
        .I1(cplllock_reg2),
        .I2(\FSM_onehot_fsm_reg_n_0_[1] ),
        .I3(drp_done_reg2),
        .I4(Q[0]),
        .O(\FSM_onehot_fsm[2]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h32)) 
    \FSM_onehot_fsm[3]_i_1 
       (.I0(Q[0]),
        .I1(drp_done_reg2),
        .I2(\FSM_onehot_fsm_reg_n_0_[3] ),
        .O(\FSM_onehot_fsm[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8F88)) 
    \FSM_onehot_fsm[4]_i_1 
       (.I0(drp_done_reg2),
        .I1(\FSM_onehot_fsm_reg_n_0_[3] ),
        .I2(qplllock_reg2),
        .I3(\FSM_onehot_fsm_reg_n_0_[4] ),
        .O(\FSM_onehot_fsm[4]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \FSM_onehot_fsm[5]_i_1 
       (.I0(\FSM_onehot_fsm_reg_n_0_[4] ),
        .I1(qplllock_reg2),
        .O(\FSM_onehot_fsm[5]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \FSM_onehot_fsm[7]_i_1 
       (.I0(\FSM_onehot_fsm_reg_n_0_[6] ),
        .I1(Q[1]),
        .O(qpllpd));
  (* FSM_ENCODED_STATES = "FSM_MMCM_LOCK:00000010,FSM_DRP_START_NOM:00000100,FSM_WAIT_LOCK:00000001,FSM_QPLL_PD:01000000,FSM_QPLL_PDRESET:00100000,FSM_QPLLLOCK2:1010,FSM_IDLE:10000000,FSM_DRP_START_OPT:0111,FSM_QPLL_RESET:1001,FSM_QPLLLOCK:00010000,FSM_DRP_DONE_OPT:1000,FSM_DRP_DONE_NOM:00001000" *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_onehot_fsm_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\FSM_onehot_fsm[0]_i_1__0_n_0 ),
        .Q(\FSM_onehot_fsm_reg_n_0_[0] ),
        .S(qpllpd_reg_0));
  (* FSM_ENCODED_STATES = "FSM_MMCM_LOCK:00000010,FSM_DRP_START_NOM:00000100,FSM_WAIT_LOCK:00000001,FSM_QPLL_PD:01000000,FSM_QPLL_PDRESET:00100000,FSM_QPLLLOCK2:1010,FSM_IDLE:10000000,FSM_DRP_START_OPT:0111,FSM_QPLL_RESET:1001,FSM_QPLLLOCK:00010000,FSM_DRP_DONE_OPT:1000,FSM_DRP_DONE_NOM:00001000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_fsm_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\FSM_onehot_fsm[1]_i_1_n_0 ),
        .Q(\FSM_onehot_fsm_reg_n_0_[1] ),
        .R(qpllpd_reg_0));
  (* FSM_ENCODED_STATES = "FSM_MMCM_LOCK:00000010,FSM_DRP_START_NOM:00000100,FSM_WAIT_LOCK:00000001,FSM_QPLL_PD:01000000,FSM_QPLL_PDRESET:00100000,FSM_QPLLLOCK2:1010,FSM_IDLE:10000000,FSM_DRP_START_OPT:0111,FSM_QPLL_RESET:1001,FSM_QPLLLOCK:00010000,FSM_DRP_DONE_OPT:1000,FSM_DRP_DONE_NOM:00001000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_fsm_reg[2] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\FSM_onehot_fsm[2]_i_1_n_0 ),
        .Q(Q[0]),
        .R(qpllpd_reg_0));
  (* FSM_ENCODED_STATES = "FSM_MMCM_LOCK:00000010,FSM_DRP_START_NOM:00000100,FSM_WAIT_LOCK:00000001,FSM_QPLL_PD:01000000,FSM_QPLL_PDRESET:00100000,FSM_QPLLLOCK2:1010,FSM_IDLE:10000000,FSM_DRP_START_OPT:0111,FSM_QPLL_RESET:1001,FSM_QPLLLOCK:00010000,FSM_DRP_DONE_OPT:1000,FSM_DRP_DONE_NOM:00001000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_fsm_reg[3] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\FSM_onehot_fsm[3]_i_1_n_0 ),
        .Q(\FSM_onehot_fsm_reg_n_0_[3] ),
        .R(qpllpd_reg_0));
  (* FSM_ENCODED_STATES = "FSM_MMCM_LOCK:00000010,FSM_DRP_START_NOM:00000100,FSM_WAIT_LOCK:00000001,FSM_QPLL_PD:01000000,FSM_QPLL_PDRESET:00100000,FSM_QPLLLOCK2:1010,FSM_IDLE:10000000,FSM_DRP_START_OPT:0111,FSM_QPLL_RESET:1001,FSM_QPLLLOCK:00010000,FSM_DRP_DONE_OPT:1000,FSM_DRP_DONE_NOM:00001000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_fsm_reg[4] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\FSM_onehot_fsm[4]_i_1_n_0 ),
        .Q(\FSM_onehot_fsm_reg_n_0_[4] ),
        .R(qpllpd_reg_0));
  (* FSM_ENCODED_STATES = "FSM_MMCM_LOCK:00000010,FSM_DRP_START_NOM:00000100,FSM_WAIT_LOCK:00000001,FSM_QPLL_PD:01000000,FSM_QPLL_PDRESET:00100000,FSM_QPLLLOCK2:1010,FSM_IDLE:10000000,FSM_DRP_START_OPT:0111,FSM_QPLL_RESET:1001,FSM_QPLLLOCK:00010000,FSM_DRP_DONE_OPT:1000,FSM_DRP_DONE_NOM:00001000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_fsm_reg[5] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\FSM_onehot_fsm[5]_i_1_n_0 ),
        .Q(\FSM_onehot_fsm_reg_n_0_[5] ),
        .R(qpllpd_reg_0));
  (* FSM_ENCODED_STATES = "FSM_MMCM_LOCK:00000010,FSM_DRP_START_NOM:00000100,FSM_WAIT_LOCK:00000001,FSM_QPLL_PD:01000000,FSM_QPLL_PDRESET:00100000,FSM_QPLLLOCK2:1010,FSM_IDLE:10000000,FSM_DRP_START_OPT:0111,FSM_QPLL_RESET:1001,FSM_QPLLLOCK:00010000,FSM_DRP_DONE_OPT:1000,FSM_DRP_DONE_NOM:00001000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_fsm_reg[6] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\FSM_onehot_fsm_reg_n_0_[5] ),
        .Q(\FSM_onehot_fsm_reg_n_0_[6] ),
        .R(qpllpd_reg_0));
  (* FSM_ENCODED_STATES = "FSM_MMCM_LOCK:00000010,FSM_DRP_START_NOM:00000100,FSM_WAIT_LOCK:00000001,FSM_QPLL_PD:01000000,FSM_QPLL_PDRESET:00100000,FSM_QPLLLOCK2:1010,FSM_IDLE:10000000,FSM_DRP_START_OPT:0111,FSM_QPLL_RESET:1001,FSM_QPLLLOCK:00010000,FSM_DRP_DONE_OPT:1000,FSM_DRP_DONE_NOM:00001000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_fsm_reg[7] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(qpllpd),
        .Q(Q[1]),
        .R(qpllpd_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDSE \cplllock_reg1_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(QRST_CPLLLOCK),
        .Q(cplllock_reg1),
        .S(qpllpd_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDSE \cplllock_reg2_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(cplllock_reg1),
        .Q(cplllock_reg2),
        .S(qpllpd_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \drp_done_reg1_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(QRST_DRP_DONE),
        .Q(drp_done_reg1),
        .R(qpllpd_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \drp_done_reg2_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(drp_done_reg1),
        .Q(drp_done_reg2),
        .R(qpllpd_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE mmcm_lock_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(pipe_mmcm_lock_in),
        .Q(mmcm_lock_reg1),
        .R(qpllpd_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE mmcm_lock_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(mmcm_lock_reg1),
        .Q(mmcm_lock_reg2),
        .R(qpllpd_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \qplllock_reg1_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(QRST_QPLLLOCK),
        .Q(qplllock_reg1),
        .R(qpllpd_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \qplllock_reg2_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(qplllock_reg1),
        .Q(qplllock_reg2),
        .R(qpllpd_reg_0));
  LUT6 #(
    .INIT(64'hFBF0BBFFFBF0BB00)) 
    qpllpd_i_1
       (.I0(rate_reg2[0]),
        .I1(rate_reg2[1]),
        .I2(qpllpd_in_reg2),
        .I3(\FSM_onehot_fsm_reg_n_0_[6] ),
        .I4(Q[1]),
        .I5(QPLL_QPLLPD),
        .O(qpllpd_i_1_n_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \qpllpd_in_reg1_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(QRST_QPLLPD_IN),
        .Q(qpllpd_in_reg1),
        .R(qpllpd_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \qpllpd_in_reg2_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(qpllpd_in_reg1),
        .Q(qpllpd_in_reg2),
        .R(qpllpd_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    qpllpd_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(qpllpd_i_1_n_0),
        .Q(QPLL_QPLLPD),
        .R(qpllpd_reg_0));
  LUT6 #(
    .INIT(64'hECECA0AFECECA0A0)) 
    qpllreset_i_1
       (.I0(qpllreset_i_2_n_0),
        .I1(qpllreset_in_reg2),
        .I2(\FSM_onehot_fsm_reg_n_0_[5] ),
        .I3(\FSM_onehot_fsm_reg_n_0_[4] ),
        .I4(Q[1]),
        .I5(QPLL_QPLLRESET),
        .O(qpllreset_i_1_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    qpllreset_i_2
       (.I0(rate_reg2[0]),
        .I1(rate_reg2[1]),
        .O(qpllreset_i_2_n_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDSE \qpllreset_in_reg1_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(QRST_QPLLRESET_IN),
        .Q(qpllreset_in_reg1),
        .S(qpllpd_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDSE \qpllreset_in_reg2_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(qpllreset_in_reg1),
        .Q(qpllreset_in_reg2),
        .S(qpllpd_reg_0));
  FDSE #(
    .INIT(1'b1)) 
    qpllreset_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(qpllreset_i_1_n_0),
        .Q(QPLL_QPLLRESET),
        .S(qpllpd_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rate_reg1_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(pipe_tx_rate),
        .Q(rate_reg1[0]),
        .R(qpllpd_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rate_reg1_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(1'b0),
        .Q(rate_reg1[1]),
        .R(qpllpd_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rate_reg2_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rate_reg1[0]),
        .Q(rate_reg2[0]),
        .R(qpllpd_reg_0));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \rate_reg2_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rate_reg1[1]),
        .Q(rate_reg2[1]),
        .R(qpllpd_reg_0));
endmodule

module pcie_7x_0_qpll_wrapper
   (qpll_drp_rdy,
    QPLL_QPLLLOCK,
    QPLL_QPLLOUTCLK,
    QPLL_QPLLOUTREFCLK,
    D,
    pipe_dclk_in,
    qpll_drp_en,
    qpll_drp_we,
    sys_clk,
    QPLL_QPLLPD,
    QPLL_QPLLRESET,
    \gtx_common.gtxe2_common_i_0 ,
    Q);
  output qpll_drp_rdy;
  output QPLL_QPLLLOCK;
  output QPLL_QPLLOUTCLK;
  output QPLL_QPLLOUTREFCLK;
  output [15:0]D;
  input pipe_dclk_in;
  input qpll_drp_en;
  input qpll_drp_we;
  input sys_clk;
  input QPLL_QPLLPD;
  input QPLL_QPLLRESET;
  input [15:0]\gtx_common.gtxe2_common_i_0 ;
  input [4:0]Q;

  wire [15:0]D;
  wire [4:0]Q;
  wire QPLL_QPLLLOCK;
  wire QPLL_QPLLOUTCLK;
  wire QPLL_QPLLOUTREFCLK;
  wire QPLL_QPLLPD;
  wire QPLL_QPLLRESET;
  wire [15:0]\gtx_common.gtxe2_common_i_0 ;
  wire pipe_dclk_in;
  wire qpll_drp_en;
  wire qpll_drp_rdy;
  wire qpll_drp_we;
  wire sys_clk;
  wire \NLW_gtx_common.gtxe2_common_i_QPLLFBCLKLOST_UNCONNECTED ;
  wire \NLW_gtx_common.gtxe2_common_i_QPLLREFCLKLOST_UNCONNECTED ;
  wire \NLW_gtx_common.gtxe2_common_i_REFCLKOUTMONITOR_UNCONNECTED ;
  wire [7:0]\NLW_gtx_common.gtxe2_common_i_QPLLDMONITOR_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  GTXE2_COMMON #(
    .BIAS_CFG(64'h0000040000001000),
    .COMMON_CFG(32'h00000000),
    .IS_DRPCLK_INVERTED(1'b0),
    .IS_GTGREFCLK_INVERTED(1'b0),
    .IS_QPLLLOCKDETCLK_INVERTED(1'b0),
    .QPLL_CFG(27'h06801C1),
    .QPLL_CLKOUT_CFG(4'b0000),
    .QPLL_COARSE_FREQ_OVRD(6'b010000),
    .QPLL_COARSE_FREQ_OVRD_EN(1'b0),
    .QPLL_CP(10'b0000011111),
    .QPLL_CP_MONITOR_EN(1'b0),
    .QPLL_DMONITOR_SEL(1'b0),
    .QPLL_FBDIV(10'b0100100000),
    .QPLL_FBDIV_MONITOR_EN(1'b0),
    .QPLL_FBDIV_RATIO(1'b1),
    .QPLL_INIT_CFG(24'h000006),
    .QPLL_LOCK_CFG(16'h21E8),
    .QPLL_LPF(4'b1101),
    .QPLL_REFCLK_DIV(1),
    .SIM_QPLLREFCLK_SEL(3'b001),
    .SIM_RESET_SPEEDUP("FALSE"),
    .SIM_VERSION("3.0")) 
    \gtx_common.gtxe2_common_i 
       (.BGBYPASSB(1'b1),
        .BGMONITORENB(1'b1),
        .BGPDB(1'b1),
        .BGRCALOVRD({1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DRPADDR({Q[4],1'b0,Q[3],Q[3],Q[4],Q[2:0]}),
        .DRPCLK(pipe_dclk_in),
        .DRPDI(\gtx_common.gtxe2_common_i_0 ),
        .DRPDO(D),
        .DRPEN(qpll_drp_en),
        .DRPRDY(qpll_drp_rdy),
        .DRPWE(qpll_drp_we),
        .GTGREFCLK(1'b0),
        .GTNORTHREFCLK0(1'b0),
        .GTNORTHREFCLK1(1'b0),
        .GTREFCLK0(sys_clk),
        .GTREFCLK1(1'b0),
        .GTSOUTHREFCLK0(1'b0),
        .GTSOUTHREFCLK1(1'b0),
        .PMARSVD({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .QPLLDMONITOR(\NLW_gtx_common.gtxe2_common_i_QPLLDMONITOR_UNCONNECTED [7:0]),
        .QPLLFBCLKLOST(\NLW_gtx_common.gtxe2_common_i_QPLLFBCLKLOST_UNCONNECTED ),
        .QPLLLOCK(QPLL_QPLLLOCK),
        .QPLLLOCKDETCLK(1'b0),
        .QPLLLOCKEN(1'b1),
        .QPLLOUTCLK(QPLL_QPLLOUTCLK),
        .QPLLOUTREFCLK(QPLL_QPLLOUTREFCLK),
        .QPLLOUTRESET(1'b0),
        .QPLLPD(QPLL_QPLLPD),
        .QPLLREFCLKLOST(\NLW_gtx_common.gtxe2_common_i_QPLLREFCLKLOST_UNCONNECTED ),
        .QPLLREFCLKSEL({1'b0,1'b0,1'b1}),
        .QPLLRESET(QPLL_QPLLRESET),
        .QPLLRSVD1({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .QPLLRSVD2({1'b1,1'b1,1'b1,1'b1,1'b1}),
        .RCALENB(1'b1),
        .REFCLKOUTMONITOR(\NLW_gtx_common.gtxe2_common_i_REFCLKOUTMONITOR_UNCONNECTED ));
endmodule

module pcie_7x_0_rxeq_scan
   (adapt_done_reg_0,
    new_txcoeff_done_reg_0,
    D,
    rxeq_new_txcoeff_req,
    out,
    new_txcoeff_req_reg1_reg_0,
    pipe_pclk_in,
    rxeq_preset_valid,
    adapt_done_cnt_reg_0,
    rxeq_adapt_done_reg_reg,
    Q,
    rxeq_adapt_done_reg_reg_0,
    rxeq_adapt_done_reg_reg_1,
    rxeq_adapt_done_reg,
    rxeq_adapt_done_reg_0,
    \FSM_onehot_fsm_rx_reg[5] ,
    \preset_reg1_reg[2]_0 ,
    \txpreset_reg1_reg[3]_0 ,
    \txcoeff_reg1_reg[17]_0 ,
    \fs_reg1_reg[5]_0 ,
    \lf_reg1_reg[5]_0 );
  output adapt_done_reg_0;
  output new_txcoeff_done_reg_0;
  output [2:0]D;
  output rxeq_new_txcoeff_req;
  input out;
  input new_txcoeff_req_reg1_reg_0;
  input pipe_pclk_in;
  input rxeq_preset_valid;
  input [1:0]adapt_done_cnt_reg_0;
  input rxeq_adapt_done_reg_reg;
  input [4:0]Q;
  input rxeq_adapt_done_reg_reg_0;
  input rxeq_adapt_done_reg_reg_1;
  input rxeq_adapt_done_reg;
  input rxeq_adapt_done_reg_0;
  input [2:0]\FSM_onehot_fsm_rx_reg[5] ;
  input [2:0]\preset_reg1_reg[2]_0 ;
  input [3:0]\txpreset_reg1_reg[3]_0 ;
  input [17:0]\txcoeff_reg1_reg[17]_0 ;
  input [5:0]\fs_reg1_reg[5]_0 ;
  input [5:0]\lf_reg1_reg[5]_0 ;

  wire [2:0]D;
  wire \FSM_onehot_fsm[1]_i_1__0_n_0 ;
  wire \FSM_onehot_fsm[2]_i_1__0_n_0 ;
  wire \FSM_onehot_fsm[3]_i_1__0_n_0 ;
  wire \FSM_onehot_fsm[3]_i_2_n_0 ;
  wire \FSM_onehot_fsm[4]_i_10_n_0 ;
  wire \FSM_onehot_fsm[4]_i_1__0_n_0 ;
  wire \FSM_onehot_fsm[4]_i_2_n_0 ;
  wire \FSM_onehot_fsm[4]_i_3_n_0 ;
  wire \FSM_onehot_fsm[4]_i_4_n_0 ;
  wire \FSM_onehot_fsm[4]_i_5_n_0 ;
  wire \FSM_onehot_fsm[4]_i_6_n_0 ;
  wire \FSM_onehot_fsm[4]_i_7_n_0 ;
  wire \FSM_onehot_fsm[4]_i_8_n_0 ;
  wire \FSM_onehot_fsm[4]_i_9_n_0 ;
  wire \FSM_onehot_fsm_reg_n_0_[1] ;
  wire \FSM_onehot_fsm_reg_n_0_[2] ;
  wire \FSM_onehot_fsm_reg_n_0_[3] ;
  wire \FSM_onehot_fsm_reg_n_0_[4] ;
  wire \FSM_onehot_fsm_rx[6]_i_2_n_0 ;
  wire [2:0]\FSM_onehot_fsm_rx_reg[5] ;
  wire [4:0]Q;
  wire adapt_done;
  wire adapt_done_cnt_i_1_n_0;
  wire adapt_done_cnt_i_2_n_0;
  wire [1:0]adapt_done_cnt_reg_0;
  wire adapt_done_cnt_reg_n_0;
  wire adapt_done_reg_0;
  wire [21:0]converge_cnt;
  wire [21:1]converge_cnt0;
  wire converge_cnt0_carry__0_n_0;
  wire converge_cnt0_carry__0_n_1;
  wire converge_cnt0_carry__0_n_2;
  wire converge_cnt0_carry__0_n_3;
  wire converge_cnt0_carry__1_n_0;
  wire converge_cnt0_carry__1_n_1;
  wire converge_cnt0_carry__1_n_2;
  wire converge_cnt0_carry__1_n_3;
  wire converge_cnt0_carry__2_n_0;
  wire converge_cnt0_carry__2_n_1;
  wire converge_cnt0_carry__2_n_2;
  wire converge_cnt0_carry__2_n_3;
  wire converge_cnt0_carry__3_n_0;
  wire converge_cnt0_carry__3_n_1;
  wire converge_cnt0_carry__3_n_2;
  wire converge_cnt0_carry__3_n_3;
  wire converge_cnt0_carry_n_0;
  wire converge_cnt0_carry_n_1;
  wire converge_cnt0_carry_n_2;
  wire converge_cnt0_carry_n_3;
  wire \converge_cnt_reg_n_0_[0] ;
  wire \converge_cnt_reg_n_0_[10] ;
  wire \converge_cnt_reg_n_0_[11] ;
  wire \converge_cnt_reg_n_0_[12] ;
  wire \converge_cnt_reg_n_0_[13] ;
  wire \converge_cnt_reg_n_0_[14] ;
  wire \converge_cnt_reg_n_0_[15] ;
  wire \converge_cnt_reg_n_0_[16] ;
  wire \converge_cnt_reg_n_0_[17] ;
  wire \converge_cnt_reg_n_0_[18] ;
  wire \converge_cnt_reg_n_0_[19] ;
  wire \converge_cnt_reg_n_0_[1] ;
  wire \converge_cnt_reg_n_0_[20] ;
  wire \converge_cnt_reg_n_0_[21] ;
  wire \converge_cnt_reg_n_0_[2] ;
  wire \converge_cnt_reg_n_0_[3] ;
  wire \converge_cnt_reg_n_0_[4] ;
  wire \converge_cnt_reg_n_0_[5] ;
  wire \converge_cnt_reg_n_0_[6] ;
  wire \converge_cnt_reg_n_0_[7] ;
  wire \converge_cnt_reg_n_0_[8] ;
  wire \converge_cnt_reg_n_0_[9] ;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire [5:0]fs_reg1;
  wire [5:0]\fs_reg1_reg[5]_0 ;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire [5:0]fs_reg2;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire [5:0]lf_reg1;
  wire [5:0]\lf_reg1_reg[5]_0 ;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire [5:0]lf_reg2;
  wire new_txcoeff_done;
  wire new_txcoeff_done_reg_0;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire new_txcoeff_req_reg1;
  wire new_txcoeff_req_reg1_reg_0;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire new_txcoeff_req_reg2;
  wire out;
  wire pipe_pclk_in;
  wire preset_done;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire [2:0]preset_reg1;
  wire [2:0]\preset_reg1_reg[2]_0 ;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire [2:0]preset_reg2;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire preset_valid_reg1;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire preset_valid_reg2;
  wire rxeq_adapt_done_reg;
  wire rxeq_adapt_done_reg_0;
  wire rxeq_adapt_done_reg_reg;
  wire rxeq_adapt_done_reg_reg_0;
  wire rxeq_adapt_done_reg_reg_1;
  wire rxeq_new_txcoeff_req;
  wire rxeq_preset_valid;
  wire rxeqscan_adapt_done;
  wire rxeqscan_new_txcoeff_done;
  wire rxeqscan_preset_done;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire [17:0]txcoeff_reg1;
  wire [17:0]\txcoeff_reg1_reg[17]_0 ;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire [17:0]txcoeff_reg2;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire [3:0]txpreset_reg1;
  wire [3:0]\txpreset_reg1_reg[3]_0 ;
  (* SHIFT_EXTRACT = "NO" *) (* async_reg = "true" *) wire [3:0]txpreset_reg2;
  wire [3:0]NLW_converge_cnt0_carry__4_CO_UNCONNECTED;
  wire [3:1]NLW_converge_cnt0_carry__4_O_UNCONNECTED;

  LUT6 #(
    .INIT(64'h0001FF01AAABFFFB)) 
    \FSM_onehot_fsm[1]_i_1__0 
       (.I0(\FSM_onehot_fsm_reg_n_0_[4] ),
        .I1(\FSM_onehot_fsm_reg_n_0_[3] ),
        .I2(\FSM_onehot_fsm_reg_n_0_[1] ),
        .I3(\FSM_onehot_fsm_reg_n_0_[2] ),
        .I4(preset_valid_reg2),
        .I5(new_txcoeff_req_reg2),
        .O(\FSM_onehot_fsm[1]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'hA8)) 
    \FSM_onehot_fsm[2]_i_1__0 
       (.I0(preset_valid_reg2),
        .I1(\FSM_onehot_fsm_reg_n_0_[2] ),
        .I2(\FSM_onehot_fsm_reg_n_0_[1] ),
        .O(\FSM_onehot_fsm[2]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'h4F444444)) 
    \FSM_onehot_fsm[3]_i_1__0 
       (.I0(\FSM_onehot_fsm[3]_i_2_n_0 ),
        .I1(\FSM_onehot_fsm[4]_i_2_n_0 ),
        .I2(preset_valid_reg2),
        .I3(new_txcoeff_req_reg2),
        .I4(\FSM_onehot_fsm_reg_n_0_[1] ),
        .O(\FSM_onehot_fsm[3]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'h04FF)) 
    \FSM_onehot_fsm[3]_i_2 
       (.I0(adapt_done_cnt_reg_0[0]),
        .I1(adapt_done_cnt_reg_0[1]),
        .I2(adapt_done_cnt_reg_n_0),
        .I3(\FSM_onehot_fsm_reg_n_0_[3] ),
        .O(\FSM_onehot_fsm[3]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFDF)) 
    \FSM_onehot_fsm[4]_i_10 
       (.I0(\converge_cnt_reg_n_0_[13] ),
        .I1(\converge_cnt_reg_n_0_[1] ),
        .I2(\converge_cnt_reg_n_0_[21] ),
        .I3(\converge_cnt_reg_n_0_[2] ),
        .O(\FSM_onehot_fsm[4]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAEAAEEEEEEEE)) 
    \FSM_onehot_fsm[4]_i_1__0 
       (.I0(new_txcoeff_done),
        .I1(\FSM_onehot_fsm_reg_n_0_[3] ),
        .I2(adapt_done_cnt_reg_0[0]),
        .I3(adapt_done_cnt_reg_0[1]),
        .I4(adapt_done_cnt_reg_n_0),
        .I5(\FSM_onehot_fsm[4]_i_2_n_0 ),
        .O(\FSM_onehot_fsm[4]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'hFFBAFF8A)) 
    \FSM_onehot_fsm[4]_i_2 
       (.I0(\FSM_onehot_fsm[4]_i_3_n_0 ),
        .I1(adapt_done_cnt_reg_0[0]),
        .I2(adapt_done_cnt_reg_0[1]),
        .I3(\FSM_onehot_fsm[4]_i_4_n_0 ),
        .I4(\FSM_onehot_fsm[4]_i_5_n_0 ),
        .O(\FSM_onehot_fsm[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \FSM_onehot_fsm[4]_i_3 
       (.I0(\FSM_onehot_fsm[4]_i_6_n_0 ),
        .I1(\FSM_onehot_fsm[4]_i_7_n_0 ),
        .I2(\converge_cnt_reg_n_0_[3] ),
        .I3(\converge_cnt_reg_n_0_[1] ),
        .I4(\converge_cnt_reg_n_0_[10] ),
        .I5(\converge_cnt_reg_n_0_[13] ),
        .O(\FSM_onehot_fsm[4]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFBFF)) 
    \FSM_onehot_fsm[4]_i_4 
       (.I0(\converge_cnt_reg_n_0_[5] ),
        .I1(\converge_cnt_reg_n_0_[19] ),
        .I2(\converge_cnt_reg_n_0_[7] ),
        .I3(\converge_cnt_reg_n_0_[16] ),
        .I4(\FSM_onehot_fsm[4]_i_8_n_0 ),
        .O(\FSM_onehot_fsm[4]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFEFFFF)) 
    \FSM_onehot_fsm[4]_i_5 
       (.I0(\FSM_onehot_fsm[4]_i_9_n_0 ),
        .I1(\FSM_onehot_fsm[4]_i_10_n_0 ),
        .I2(\converge_cnt_reg_n_0_[14] ),
        .I3(\converge_cnt_reg_n_0_[0] ),
        .I4(\converge_cnt_reg_n_0_[10] ),
        .I5(\converge_cnt_reg_n_0_[20] ),
        .O(\FSM_onehot_fsm[4]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFF7FFFFFFFF)) 
    \FSM_onehot_fsm[4]_i_6 
       (.I0(\converge_cnt_reg_n_0_[9] ),
        .I1(\converge_cnt_reg_n_0_[15] ),
        .I2(\converge_cnt_reg_n_0_[12] ),
        .I3(\converge_cnt_reg_n_0_[8] ),
        .I4(\converge_cnt_reg_n_0_[21] ),
        .I5(\converge_cnt_reg_n_0_[0] ),
        .O(\FSM_onehot_fsm[4]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \FSM_onehot_fsm[4]_i_7 
       (.I0(\converge_cnt_reg_n_0_[20] ),
        .I1(\converge_cnt_reg_n_0_[14] ),
        .I2(\converge_cnt_reg_n_0_[11] ),
        .I3(\converge_cnt_reg_n_0_[2] ),
        .O(\FSM_onehot_fsm[4]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFDF)) 
    \FSM_onehot_fsm[4]_i_8 
       (.I0(\converge_cnt_reg_n_0_[17] ),
        .I1(\converge_cnt_reg_n_0_[6] ),
        .I2(\converge_cnt_reg_n_0_[18] ),
        .I3(\converge_cnt_reg_n_0_[4] ),
        .O(\FSM_onehot_fsm[4]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hF7FFFFFFFFFFFFFF)) 
    \FSM_onehot_fsm[4]_i_9 
       (.I0(\converge_cnt_reg_n_0_[9] ),
        .I1(\converge_cnt_reg_n_0_[15] ),
        .I2(\converge_cnt_reg_n_0_[12] ),
        .I3(\converge_cnt_reg_n_0_[11] ),
        .I4(\converge_cnt_reg_n_0_[3] ),
        .I5(\converge_cnt_reg_n_0_[8] ),
        .O(\FSM_onehot_fsm[4]_i_9_n_0 ));
  (* FSM_ENCODED_STATES = "FSM_PRESET:00100,FSM_CONVERGE:01000,FSM_NEW_TXCOEFF_REQ:10000,FSM_IDLE:00010,iSTATE:00001" *) 
  FDSE #(
    .INIT(1'b0)) 
    \FSM_onehot_fsm_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\FSM_onehot_fsm[1]_i_1__0_n_0 ),
        .Q(\FSM_onehot_fsm_reg_n_0_[1] ),
        .S(out));
  (* FSM_ENCODED_STATES = "FSM_PRESET:00100,FSM_CONVERGE:01000,FSM_NEW_TXCOEFF_REQ:10000,FSM_IDLE:00010,iSTATE:00001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_fsm_reg[2] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\FSM_onehot_fsm[2]_i_1__0_n_0 ),
        .Q(\FSM_onehot_fsm_reg_n_0_[2] ),
        .R(out));
  (* FSM_ENCODED_STATES = "FSM_PRESET:00100,FSM_CONVERGE:01000,FSM_NEW_TXCOEFF_REQ:10000,FSM_IDLE:00010,iSTATE:00001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_fsm_reg[3] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\FSM_onehot_fsm[3]_i_1__0_n_0 ),
        .Q(\FSM_onehot_fsm_reg_n_0_[3] ),
        .R(out));
  (* FSM_ENCODED_STATES = "FSM_PRESET:00100,FSM_CONVERGE:01000,FSM_NEW_TXCOEFF_REQ:10000,FSM_IDLE:00010,iSTATE:00001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_fsm_reg[4] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\FSM_onehot_fsm[4]_i_1__0_n_0 ),
        .Q(\FSM_onehot_fsm_reg_n_0_[4] ),
        .R(out));
  LUT5 #(
    .INIT(32'h40FF4040)) 
    \FSM_onehot_fsm_rx[2]_i_1 
       (.I0(adapt_done_cnt_reg_0[1]),
        .I1(Q[0]),
        .I2(adapt_done_cnt_reg_0[0]),
        .I3(rxeqscan_preset_done),
        .I4(Q[1]),
        .O(D[0]));
  LUT6 #(
    .INIT(64'hF444444444444444)) 
    \FSM_onehot_fsm_rx[5]_i_1 
       (.I0(rxeqscan_new_txcoeff_done),
        .I1(Q[3]),
        .I2(\FSM_onehot_fsm_rx_reg[5] [2]),
        .I3(\FSM_onehot_fsm_rx_reg[5] [1]),
        .I4(\FSM_onehot_fsm_rx_reg[5] [0]),
        .I5(Q[2]),
        .O(D[1]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFE0E0E0)) 
    \FSM_onehot_fsm_rx[6]_i_1 
       (.I0(adapt_done_cnt_reg_0[1]),
        .I1(adapt_done_cnt_reg_0[0]),
        .I2(Q[4]),
        .I3(Q[1]),
        .I4(rxeqscan_preset_done),
        .I5(\FSM_onehot_fsm_rx[6]_i_2_n_0 ),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \FSM_onehot_fsm_rx[6]_i_2 
       (.I0(rxeqscan_new_txcoeff_done),
        .I1(Q[3]),
        .O(\FSM_onehot_fsm_rx[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h000A0A0AF0F0F8F0)) 
    adapt_done_cnt_i_1
       (.I0(\FSM_onehot_fsm_reg_n_0_[4] ),
        .I1(\FSM_onehot_fsm_reg_n_0_[3] ),
        .I2(adapt_done_cnt_reg_n_0),
        .I3(adapt_done_cnt_reg_0[1]),
        .I4(adapt_done_cnt_reg_0[0]),
        .I5(adapt_done_cnt_i_2_n_0),
        .O(adapt_done_cnt_i_1_n_0));
  LUT5 #(
    .INIT(32'h00FF0101)) 
    adapt_done_cnt_i_2
       (.I0(\FSM_onehot_fsm_reg_n_0_[2] ),
        .I1(\FSM_onehot_fsm_reg_n_0_[1] ),
        .I2(\FSM_onehot_fsm_reg_n_0_[3] ),
        .I3(new_txcoeff_req_reg2),
        .I4(\FSM_onehot_fsm_reg_n_0_[4] ),
        .O(adapt_done_cnt_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    adapt_done_cnt_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(adapt_done_cnt_i_1_n_0),
        .Q(adapt_done_cnt_reg_n_0),
        .R(out));
  LUT5 #(
    .INIT(32'hF8000000)) 
    adapt_done_i_1
       (.I0(adapt_done_cnt_reg_0[1]),
        .I1(adapt_done_cnt_reg_0[0]),
        .I2(adapt_done_cnt_reg_n_0),
        .I3(new_txcoeff_req_reg2),
        .I4(\FSM_onehot_fsm_reg_n_0_[4] ),
        .O(adapt_done));
  FDRE #(
    .INIT(1'b0)) 
    adapt_done_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(adapt_done),
        .Q(rxeqscan_adapt_done),
        .R(out));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 converge_cnt0_carry
       (.CI(1'b0),
        .CO({converge_cnt0_carry_n_0,converge_cnt0_carry_n_1,converge_cnt0_carry_n_2,converge_cnt0_carry_n_3}),
        .CYINIT(\converge_cnt_reg_n_0_[0] ),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(converge_cnt0[4:1]),
        .S({\converge_cnt_reg_n_0_[4] ,\converge_cnt_reg_n_0_[3] ,\converge_cnt_reg_n_0_[2] ,\converge_cnt_reg_n_0_[1] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 converge_cnt0_carry__0
       (.CI(converge_cnt0_carry_n_0),
        .CO({converge_cnt0_carry__0_n_0,converge_cnt0_carry__0_n_1,converge_cnt0_carry__0_n_2,converge_cnt0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(converge_cnt0[8:5]),
        .S({\converge_cnt_reg_n_0_[8] ,\converge_cnt_reg_n_0_[7] ,\converge_cnt_reg_n_0_[6] ,\converge_cnt_reg_n_0_[5] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 converge_cnt0_carry__1
       (.CI(converge_cnt0_carry__0_n_0),
        .CO({converge_cnt0_carry__1_n_0,converge_cnt0_carry__1_n_1,converge_cnt0_carry__1_n_2,converge_cnt0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(converge_cnt0[12:9]),
        .S({\converge_cnt_reg_n_0_[12] ,\converge_cnt_reg_n_0_[11] ,\converge_cnt_reg_n_0_[10] ,\converge_cnt_reg_n_0_[9] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 converge_cnt0_carry__2
       (.CI(converge_cnt0_carry__1_n_0),
        .CO({converge_cnt0_carry__2_n_0,converge_cnt0_carry__2_n_1,converge_cnt0_carry__2_n_2,converge_cnt0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(converge_cnt0[16:13]),
        .S({\converge_cnt_reg_n_0_[16] ,\converge_cnt_reg_n_0_[15] ,\converge_cnt_reg_n_0_[14] ,\converge_cnt_reg_n_0_[13] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 converge_cnt0_carry__3
       (.CI(converge_cnt0_carry__2_n_0),
        .CO({converge_cnt0_carry__3_n_0,converge_cnt0_carry__3_n_1,converge_cnt0_carry__3_n_2,converge_cnt0_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(converge_cnt0[20:17]),
        .S({\converge_cnt_reg_n_0_[20] ,\converge_cnt_reg_n_0_[19] ,\converge_cnt_reg_n_0_[18] ,\converge_cnt_reg_n_0_[17] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 converge_cnt0_carry__4
       (.CI(converge_cnt0_carry__3_n_0),
        .CO(NLW_converge_cnt0_carry__4_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_converge_cnt0_carry__4_O_UNCONNECTED[3:1],converge_cnt0[21]}),
        .S({1'b0,1'b0,1'b0,\converge_cnt_reg_n_0_[21] }));
  LUT5 #(
    .INIT(32'h44444044)) 
    \converge_cnt[0]_i_1__0 
       (.I0(\converge_cnt_reg_n_0_[0] ),
        .I1(\FSM_onehot_fsm_reg_n_0_[3] ),
        .I2(adapt_done_cnt_reg_n_0),
        .I3(adapt_done_cnt_reg_0[1]),
        .I4(adapt_done_cnt_reg_0[0]),
        .O(converge_cnt[0]));
  LUT5 #(
    .INIT(32'h88888088)) 
    \converge_cnt[10]_i_1 
       (.I0(converge_cnt0[10]),
        .I1(\FSM_onehot_fsm_reg_n_0_[3] ),
        .I2(adapt_done_cnt_reg_n_0),
        .I3(adapt_done_cnt_reg_0[1]),
        .I4(adapt_done_cnt_reg_0[0]),
        .O(converge_cnt[10]));
  LUT5 #(
    .INIT(32'h88888088)) 
    \converge_cnt[11]_i_1 
       (.I0(converge_cnt0[11]),
        .I1(\FSM_onehot_fsm_reg_n_0_[3] ),
        .I2(adapt_done_cnt_reg_n_0),
        .I3(adapt_done_cnt_reg_0[1]),
        .I4(adapt_done_cnt_reg_0[0]),
        .O(converge_cnt[11]));
  LUT5 #(
    .INIT(32'h88888088)) 
    \converge_cnt[12]_i_1 
       (.I0(converge_cnt0[12]),
        .I1(\FSM_onehot_fsm_reg_n_0_[3] ),
        .I2(adapt_done_cnt_reg_n_0),
        .I3(adapt_done_cnt_reg_0[1]),
        .I4(adapt_done_cnt_reg_0[0]),
        .O(converge_cnt[12]));
  LUT5 #(
    .INIT(32'h88888088)) 
    \converge_cnt[13]_i_1 
       (.I0(converge_cnt0[13]),
        .I1(\FSM_onehot_fsm_reg_n_0_[3] ),
        .I2(adapt_done_cnt_reg_n_0),
        .I3(adapt_done_cnt_reg_0[1]),
        .I4(adapt_done_cnt_reg_0[0]),
        .O(converge_cnt[13]));
  LUT5 #(
    .INIT(32'h88888088)) 
    \converge_cnt[14]_i_1 
       (.I0(converge_cnt0[14]),
        .I1(\FSM_onehot_fsm_reg_n_0_[3] ),
        .I2(adapt_done_cnt_reg_n_0),
        .I3(adapt_done_cnt_reg_0[1]),
        .I4(adapt_done_cnt_reg_0[0]),
        .O(converge_cnt[14]));
  LUT5 #(
    .INIT(32'h88888088)) 
    \converge_cnt[15]_i_1 
       (.I0(converge_cnt0[15]),
        .I1(\FSM_onehot_fsm_reg_n_0_[3] ),
        .I2(adapt_done_cnt_reg_n_0),
        .I3(adapt_done_cnt_reg_0[1]),
        .I4(adapt_done_cnt_reg_0[0]),
        .O(converge_cnt[15]));
  LUT5 #(
    .INIT(32'h88888088)) 
    \converge_cnt[16]_i_1 
       (.I0(converge_cnt0[16]),
        .I1(\FSM_onehot_fsm_reg_n_0_[3] ),
        .I2(adapt_done_cnt_reg_n_0),
        .I3(adapt_done_cnt_reg_0[1]),
        .I4(adapt_done_cnt_reg_0[0]),
        .O(converge_cnt[16]));
  LUT5 #(
    .INIT(32'h88888088)) 
    \converge_cnt[17]_i_1 
       (.I0(converge_cnt0[17]),
        .I1(\FSM_onehot_fsm_reg_n_0_[3] ),
        .I2(adapt_done_cnt_reg_n_0),
        .I3(adapt_done_cnt_reg_0[1]),
        .I4(adapt_done_cnt_reg_0[0]),
        .O(converge_cnt[17]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT5 #(
    .INIT(32'h88888088)) 
    \converge_cnt[18]_i_1 
       (.I0(converge_cnt0[18]),
        .I1(\FSM_onehot_fsm_reg_n_0_[3] ),
        .I2(adapt_done_cnt_reg_n_0),
        .I3(adapt_done_cnt_reg_0[1]),
        .I4(adapt_done_cnt_reg_0[0]),
        .O(converge_cnt[18]));
  LUT5 #(
    .INIT(32'h88888088)) 
    \converge_cnt[19]_i_1 
       (.I0(converge_cnt0[19]),
        .I1(\FSM_onehot_fsm_reg_n_0_[3] ),
        .I2(adapt_done_cnt_reg_n_0),
        .I3(adapt_done_cnt_reg_0[1]),
        .I4(adapt_done_cnt_reg_0[0]),
        .O(converge_cnt[19]));
  LUT5 #(
    .INIT(32'h88888088)) 
    \converge_cnt[1]_i_1 
       (.I0(converge_cnt0[1]),
        .I1(\FSM_onehot_fsm_reg_n_0_[3] ),
        .I2(adapt_done_cnt_reg_n_0),
        .I3(adapt_done_cnt_reg_0[1]),
        .I4(adapt_done_cnt_reg_0[0]),
        .O(converge_cnt[1]));
  LUT5 #(
    .INIT(32'h88888088)) 
    \converge_cnt[20]_i_1 
       (.I0(converge_cnt0[20]),
        .I1(\FSM_onehot_fsm_reg_n_0_[3] ),
        .I2(adapt_done_cnt_reg_n_0),
        .I3(adapt_done_cnt_reg_0[1]),
        .I4(adapt_done_cnt_reg_0[0]),
        .O(converge_cnt[20]));
  LUT5 #(
    .INIT(32'h88888088)) 
    \converge_cnt[21]_i_1 
       (.I0(converge_cnt0[21]),
        .I1(\FSM_onehot_fsm_reg_n_0_[3] ),
        .I2(adapt_done_cnt_reg_n_0),
        .I3(adapt_done_cnt_reg_0[1]),
        .I4(adapt_done_cnt_reg_0[0]),
        .O(converge_cnt[21]));
  LUT5 #(
    .INIT(32'h88888088)) 
    \converge_cnt[2]_i_1 
       (.I0(converge_cnt0[2]),
        .I1(\FSM_onehot_fsm_reg_n_0_[3] ),
        .I2(adapt_done_cnt_reg_n_0),
        .I3(adapt_done_cnt_reg_0[1]),
        .I4(adapt_done_cnt_reg_0[0]),
        .O(converge_cnt[2]));
  LUT5 #(
    .INIT(32'h88888088)) 
    \converge_cnt[3]_i_1 
       (.I0(converge_cnt0[3]),
        .I1(\FSM_onehot_fsm_reg_n_0_[3] ),
        .I2(adapt_done_cnt_reg_n_0),
        .I3(adapt_done_cnt_reg_0[1]),
        .I4(adapt_done_cnt_reg_0[0]),
        .O(converge_cnt[3]));
  LUT5 #(
    .INIT(32'h88888088)) 
    \converge_cnt[4]_i_1 
       (.I0(converge_cnt0[4]),
        .I1(\FSM_onehot_fsm_reg_n_0_[3] ),
        .I2(adapt_done_cnt_reg_n_0),
        .I3(adapt_done_cnt_reg_0[1]),
        .I4(adapt_done_cnt_reg_0[0]),
        .O(converge_cnt[4]));
  LUT5 #(
    .INIT(32'h88888088)) 
    \converge_cnt[5]_i_1 
       (.I0(converge_cnt0[5]),
        .I1(\FSM_onehot_fsm_reg_n_0_[3] ),
        .I2(adapt_done_cnt_reg_n_0),
        .I3(adapt_done_cnt_reg_0[1]),
        .I4(adapt_done_cnt_reg_0[0]),
        .O(converge_cnt[5]));
  LUT5 #(
    .INIT(32'h88888088)) 
    \converge_cnt[6]_i_1 
       (.I0(converge_cnt0[6]),
        .I1(\FSM_onehot_fsm_reg_n_0_[3] ),
        .I2(adapt_done_cnt_reg_n_0),
        .I3(adapt_done_cnt_reg_0[1]),
        .I4(adapt_done_cnt_reg_0[0]),
        .O(converge_cnt[6]));
  LUT5 #(
    .INIT(32'h88888088)) 
    \converge_cnt[7]_i_1 
       (.I0(converge_cnt0[7]),
        .I1(\FSM_onehot_fsm_reg_n_0_[3] ),
        .I2(adapt_done_cnt_reg_n_0),
        .I3(adapt_done_cnt_reg_0[1]),
        .I4(adapt_done_cnt_reg_0[0]),
        .O(converge_cnt[7]));
  LUT5 #(
    .INIT(32'h88888088)) 
    \converge_cnt[8]_i_1 
       (.I0(converge_cnt0[8]),
        .I1(\FSM_onehot_fsm_reg_n_0_[3] ),
        .I2(adapt_done_cnt_reg_n_0),
        .I3(adapt_done_cnt_reg_0[1]),
        .I4(adapt_done_cnt_reg_0[0]),
        .O(converge_cnt[8]));
  LUT5 #(
    .INIT(32'h88888088)) 
    \converge_cnt[9]_i_1 
       (.I0(converge_cnt0[9]),
        .I1(\FSM_onehot_fsm_reg_n_0_[3] ),
        .I2(adapt_done_cnt_reg_n_0),
        .I3(adapt_done_cnt_reg_0[1]),
        .I4(adapt_done_cnt_reg_0[0]),
        .O(converge_cnt[9]));
  FDRE #(
    .INIT(1'b0)) 
    \converge_cnt_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(converge_cnt[0]),
        .Q(\converge_cnt_reg_n_0_[0] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \converge_cnt_reg[10] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(converge_cnt[10]),
        .Q(\converge_cnt_reg_n_0_[10] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \converge_cnt_reg[11] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(converge_cnt[11]),
        .Q(\converge_cnt_reg_n_0_[11] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \converge_cnt_reg[12] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(converge_cnt[12]),
        .Q(\converge_cnt_reg_n_0_[12] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \converge_cnt_reg[13] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(converge_cnt[13]),
        .Q(\converge_cnt_reg_n_0_[13] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \converge_cnt_reg[14] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(converge_cnt[14]),
        .Q(\converge_cnt_reg_n_0_[14] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \converge_cnt_reg[15] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(converge_cnt[15]),
        .Q(\converge_cnt_reg_n_0_[15] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \converge_cnt_reg[16] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(converge_cnt[16]),
        .Q(\converge_cnt_reg_n_0_[16] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \converge_cnt_reg[17] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(converge_cnt[17]),
        .Q(\converge_cnt_reg_n_0_[17] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \converge_cnt_reg[18] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(converge_cnt[18]),
        .Q(\converge_cnt_reg_n_0_[18] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \converge_cnt_reg[19] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(converge_cnt[19]),
        .Q(\converge_cnt_reg_n_0_[19] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \converge_cnt_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(converge_cnt[1]),
        .Q(\converge_cnt_reg_n_0_[1] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \converge_cnt_reg[20] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(converge_cnt[20]),
        .Q(\converge_cnt_reg_n_0_[20] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \converge_cnt_reg[21] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(converge_cnt[21]),
        .Q(\converge_cnt_reg_n_0_[21] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \converge_cnt_reg[2] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(converge_cnt[2]),
        .Q(\converge_cnt_reg_n_0_[2] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \converge_cnt_reg[3] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(converge_cnt[3]),
        .Q(\converge_cnt_reg_n_0_[3] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \converge_cnt_reg[4] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(converge_cnt[4]),
        .Q(\converge_cnt_reg_n_0_[4] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \converge_cnt_reg[5] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(converge_cnt[5]),
        .Q(\converge_cnt_reg_n_0_[5] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \converge_cnt_reg[6] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(converge_cnt[6]),
        .Q(\converge_cnt_reg_n_0_[6] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \converge_cnt_reg[7] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(converge_cnt[7]),
        .Q(\converge_cnt_reg_n_0_[7] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \converge_cnt_reg[8] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(converge_cnt[8]),
        .Q(\converge_cnt_reg_n_0_[8] ),
        .R(out));
  FDRE #(
    .INIT(1'b0)) 
    \converge_cnt_reg[9] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(converge_cnt[9]),
        .Q(\converge_cnt_reg_n_0_[9] ),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \fs_reg1_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\fs_reg1_reg[5]_0 [0]),
        .Q(fs_reg1[0]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \fs_reg1_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\fs_reg1_reg[5]_0 [1]),
        .Q(fs_reg1[1]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \fs_reg1_reg[2] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\fs_reg1_reg[5]_0 [2]),
        .Q(fs_reg1[2]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \fs_reg1_reg[3] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\fs_reg1_reg[5]_0 [3]),
        .Q(fs_reg1[3]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \fs_reg1_reg[4] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\fs_reg1_reg[5]_0 [4]),
        .Q(fs_reg1[4]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \fs_reg1_reg[5] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\fs_reg1_reg[5]_0 [5]),
        .Q(fs_reg1[5]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \fs_reg2_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(fs_reg1[0]),
        .Q(fs_reg2[0]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \fs_reg2_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(fs_reg1[1]),
        .Q(fs_reg2[1]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \fs_reg2_reg[2] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(fs_reg1[2]),
        .Q(fs_reg2[2]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \fs_reg2_reg[3] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(fs_reg1[3]),
        .Q(fs_reg2[3]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \fs_reg2_reg[4] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(fs_reg1[4]),
        .Q(fs_reg2[4]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \fs_reg2_reg[5] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(fs_reg1[5]),
        .Q(fs_reg2[5]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \lf_reg1_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\lf_reg1_reg[5]_0 [0]),
        .Q(lf_reg1[0]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \lf_reg1_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\lf_reg1_reg[5]_0 [1]),
        .Q(lf_reg1[1]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \lf_reg1_reg[2] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\lf_reg1_reg[5]_0 [2]),
        .Q(lf_reg1[2]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \lf_reg1_reg[3] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\lf_reg1_reg[5]_0 [3]),
        .Q(lf_reg1[3]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \lf_reg1_reg[4] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\lf_reg1_reg[5]_0 [4]),
        .Q(lf_reg1[4]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \lf_reg1_reg[5] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\lf_reg1_reg[5]_0 [5]),
        .Q(lf_reg1[5]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \lf_reg2_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(lf_reg1[0]),
        .Q(lf_reg2[0]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \lf_reg2_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(lf_reg1[1]),
        .Q(lf_reg2[1]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \lf_reg2_reg[2] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(lf_reg1[2]),
        .Q(lf_reg2[2]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \lf_reg2_reg[3] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(lf_reg1[3]),
        .Q(lf_reg2[3]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \lf_reg2_reg[4] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(lf_reg1[4]),
        .Q(lf_reg2[4]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \lf_reg2_reg[5] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(lf_reg1[5]),
        .Q(lf_reg2[5]),
        .R(out));
  LUT2 #(
    .INIT(4'h8)) 
    new_txcoeff_done_i_1
       (.I0(\FSM_onehot_fsm_reg_n_0_[4] ),
        .I1(new_txcoeff_req_reg2),
        .O(new_txcoeff_done));
  FDRE #(
    .INIT(1'b0)) 
    new_txcoeff_done_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(new_txcoeff_done),
        .Q(rxeqscan_new_txcoeff_done),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE new_txcoeff_req_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(new_txcoeff_req_reg1_reg_0),
        .Q(new_txcoeff_req_reg1),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE new_txcoeff_req_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(new_txcoeff_req_reg1),
        .Q(new_txcoeff_req_reg2),
        .R(out));
  LUT3 #(
    .INIT(8'hEA)) 
    preset_done_i_1
       (.I0(\FSM_onehot_fsm_reg_n_0_[2] ),
        .I1(\FSM_onehot_fsm_reg_n_0_[1] ),
        .I2(preset_valid_reg2),
        .O(preset_done));
  FDRE #(
    .INIT(1'b0)) 
    preset_done_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(preset_done),
        .Q(rxeqscan_preset_done),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \preset_reg1_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\preset_reg1_reg[2]_0 [0]),
        .Q(preset_reg1[0]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \preset_reg1_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\preset_reg1_reg[2]_0 [1]),
        .Q(preset_reg1[1]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \preset_reg1_reg[2] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\preset_reg1_reg[2]_0 [2]),
        .Q(preset_reg1[2]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \preset_reg2_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(preset_reg1[0]),
        .Q(preset_reg2[0]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \preset_reg2_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(preset_reg1[1]),
        .Q(preset_reg2[1]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \preset_reg2_reg[2] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(preset_reg1[2]),
        .Q(preset_reg2[2]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE preset_valid_reg1_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(rxeq_preset_valid),
        .Q(preset_valid_reg1),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE preset_valid_reg2_reg
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(preset_valid_reg1),
        .Q(preset_valid_reg2),
        .R(out));
  LUT6 #(
    .INIT(64'hA800FFFFA8000000)) 
    rxeq_adapt_done_i_1
       (.I0(rxeqscan_new_txcoeff_done),
        .I1(rxeq_adapt_done_reg_reg_1),
        .I2(rxeqscan_adapt_done),
        .I3(Q[3]),
        .I4(rxeq_adapt_done_reg),
        .I5(rxeq_adapt_done_reg_0),
        .O(new_txcoeff_done_reg_0));
  LUT6 #(
    .INIT(64'hFF00FF33AA00A800)) 
    rxeq_adapt_done_reg_i_1
       (.I0(rxeqscan_adapt_done),
        .I1(rxeq_adapt_done_reg_reg),
        .I2(rxeqscan_new_txcoeff_done),
        .I3(Q[3]),
        .I4(rxeq_adapt_done_reg_reg_0),
        .I5(rxeq_adapt_done_reg_reg_1),
        .O(adapt_done_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h2)) 
    rxeq_new_txcoeff_req_i_1
       (.I0(Q[3]),
        .I1(rxeqscan_new_txcoeff_done),
        .O(rxeq_new_txcoeff_req));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txcoeff_reg1_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\txcoeff_reg1_reg[17]_0 [0]),
        .Q(txcoeff_reg1[0]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txcoeff_reg1_reg[10] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\txcoeff_reg1_reg[17]_0 [10]),
        .Q(txcoeff_reg1[10]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txcoeff_reg1_reg[11] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\txcoeff_reg1_reg[17]_0 [11]),
        .Q(txcoeff_reg1[11]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txcoeff_reg1_reg[12] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\txcoeff_reg1_reg[17]_0 [12]),
        .Q(txcoeff_reg1[12]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txcoeff_reg1_reg[13] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\txcoeff_reg1_reg[17]_0 [13]),
        .Q(txcoeff_reg1[13]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txcoeff_reg1_reg[14] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\txcoeff_reg1_reg[17]_0 [14]),
        .Q(txcoeff_reg1[14]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txcoeff_reg1_reg[15] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\txcoeff_reg1_reg[17]_0 [15]),
        .Q(txcoeff_reg1[15]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txcoeff_reg1_reg[16] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\txcoeff_reg1_reg[17]_0 [16]),
        .Q(txcoeff_reg1[16]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txcoeff_reg1_reg[17] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\txcoeff_reg1_reg[17]_0 [17]),
        .Q(txcoeff_reg1[17]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txcoeff_reg1_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\txcoeff_reg1_reg[17]_0 [1]),
        .Q(txcoeff_reg1[1]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txcoeff_reg1_reg[2] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\txcoeff_reg1_reg[17]_0 [2]),
        .Q(txcoeff_reg1[2]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txcoeff_reg1_reg[3] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\txcoeff_reg1_reg[17]_0 [3]),
        .Q(txcoeff_reg1[3]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txcoeff_reg1_reg[4] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\txcoeff_reg1_reg[17]_0 [4]),
        .Q(txcoeff_reg1[4]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txcoeff_reg1_reg[5] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\txcoeff_reg1_reg[17]_0 [5]),
        .Q(txcoeff_reg1[5]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txcoeff_reg1_reg[6] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\txcoeff_reg1_reg[17]_0 [6]),
        .Q(txcoeff_reg1[6]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txcoeff_reg1_reg[7] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\txcoeff_reg1_reg[17]_0 [7]),
        .Q(txcoeff_reg1[7]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txcoeff_reg1_reg[8] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\txcoeff_reg1_reg[17]_0 [8]),
        .Q(txcoeff_reg1[8]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txcoeff_reg1_reg[9] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\txcoeff_reg1_reg[17]_0 [9]),
        .Q(txcoeff_reg1[9]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txcoeff_reg2_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txcoeff_reg1[0]),
        .Q(txcoeff_reg2[0]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txcoeff_reg2_reg[10] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txcoeff_reg1[10]),
        .Q(txcoeff_reg2[10]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txcoeff_reg2_reg[11] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txcoeff_reg1[11]),
        .Q(txcoeff_reg2[11]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txcoeff_reg2_reg[12] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txcoeff_reg1[12]),
        .Q(txcoeff_reg2[12]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txcoeff_reg2_reg[13] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txcoeff_reg1[13]),
        .Q(txcoeff_reg2[13]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txcoeff_reg2_reg[14] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txcoeff_reg1[14]),
        .Q(txcoeff_reg2[14]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txcoeff_reg2_reg[15] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txcoeff_reg1[15]),
        .Q(txcoeff_reg2[15]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txcoeff_reg2_reg[16] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txcoeff_reg1[16]),
        .Q(txcoeff_reg2[16]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txcoeff_reg2_reg[17] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txcoeff_reg1[17]),
        .Q(txcoeff_reg2[17]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txcoeff_reg2_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txcoeff_reg1[1]),
        .Q(txcoeff_reg2[1]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txcoeff_reg2_reg[2] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txcoeff_reg1[2]),
        .Q(txcoeff_reg2[2]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txcoeff_reg2_reg[3] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txcoeff_reg1[3]),
        .Q(txcoeff_reg2[3]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txcoeff_reg2_reg[4] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txcoeff_reg1[4]),
        .Q(txcoeff_reg2[4]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txcoeff_reg2_reg[5] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txcoeff_reg1[5]),
        .Q(txcoeff_reg2[5]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txcoeff_reg2_reg[6] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txcoeff_reg1[6]),
        .Q(txcoeff_reg2[6]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txcoeff_reg2_reg[7] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txcoeff_reg1[7]),
        .Q(txcoeff_reg2[7]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txcoeff_reg2_reg[8] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txcoeff_reg1[8]),
        .Q(txcoeff_reg2[8]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txcoeff_reg2_reg[9] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txcoeff_reg1[9]),
        .Q(txcoeff_reg2[9]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txpreset_reg1_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\txpreset_reg1_reg[3]_0 [0]),
        .Q(txpreset_reg1[0]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txpreset_reg1_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\txpreset_reg1_reg[3]_0 [1]),
        .Q(txpreset_reg1[1]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txpreset_reg1_reg[2] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\txpreset_reg1_reg[3]_0 [2]),
        .Q(txpreset_reg1[2]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txpreset_reg1_reg[3] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(\txpreset_reg1_reg[3]_0 [3]),
        .Q(txpreset_reg1[3]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txpreset_reg2_reg[0] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txpreset_reg1[0]),
        .Q(txpreset_reg2[0]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txpreset_reg2_reg[1] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txpreset_reg1[1]),
        .Q(txpreset_reg2[1]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txpreset_reg2_reg[2] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txpreset_reg1[2]),
        .Q(txpreset_reg2[2]),
        .R(out));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* SHIFT_EXTRACT = "NO" *) 
  FDRE \txpreset_reg2_reg[3] 
       (.C(pipe_pclk_in),
        .CE(1'b1),
        .D(txpreset_reg1[3]),
        .Q(txpreset_reg2[3]),
        .R(out));
endmodule

(* ORIG_REF_NAME = "unimacro_BRAM_TDP_MACRO" *) 
module pcie_7x_0_unimacro_BRAM_TDP_MACRO
   (rdata,
    pipe_userclk1_in,
    mim_tx_wen,
    mim_tx_ren,
    MIMTXWADDR,
    MIMTXRADDR,
    wdata);
  output [14:0]rdata;
  input pipe_userclk1_in;
  input mim_tx_wen;
  input mim_tx_ren;
  input [10:0]MIMTXWADDR;
  input [10:0]MIMTXRADDR;
  input [14:0]wdata;

  wire [10:0]MIMTXRADDR;
  wire [10:0]MIMTXWADDR;
  wire mim_tx_ren;
  wire mim_tx_wen;
  wire pipe_userclk1_in;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_20 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_21 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_22 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_23 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_24 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_25 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_26 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_27 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_28 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_29 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_30 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_31 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_32 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_33 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_34 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_35 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_52 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_53 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_70 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_71 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_74 ;
  wire [14:0]rdata;
  wire [14:0]wdata;
  wire \NLW_ramb_bl.ramb36_dp_bl.ram36_bl_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_ramb_bl.ramb36_dp_bl.ram36_bl_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DBITERR_UNCONNECTED ;
  wire \NLW_ramb_bl.ramb36_dp_bl.ram36_bl_SBITERR_UNCONNECTED ;
  wire [31:16]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOADO_UNCONNECTED ;
  wire [31:16]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOBDO_UNCONNECTED ;
  wire [3:2]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOPADOP_UNCONNECTED ;
  wire [3:2]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(1),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("NO_CHANGE"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    \ramb_bl.ramb36_dp_bl.ram36_bl 
       (.ADDRARDADDR({1'b1,MIMTXWADDR,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,MIMTXRADDR,1'b1,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(pipe_userclk1_in),
        .CLKBWRCLK(pipe_userclk1_in),
        .DBITERR(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,wdata[14:9],wdata[7:0]}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,wdata[8]}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOADO_UNCONNECTED [31:16],\ramb_bl.ramb36_dp_bl.ram36_bl_n_20 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_21 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_22 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_23 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_24 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_25 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_26 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_27 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_28 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_29 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_30 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_31 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_32 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_33 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_34 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_35 }),
        .DOBDO({\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOBDO_UNCONNECTED [31:16],\ramb_bl.ramb36_dp_bl.ram36_bl_n_52 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_53 ,rdata[14:9],rdata[7:0]}),
        .DOPADOP({\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOPADOP_UNCONNECTED [3:2],\ramb_bl.ramb36_dp_bl.ram36_bl_n_70 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_71 }),
        .DOPBDOP({\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOPBDOP_UNCONNECTED [3:2],\ramb_bl.ramb36_dp_bl.ram36_bl_n_74 ,rdata[8]}),
        .ECCPARITY(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(mim_tx_wen),
        .ENBWREN(mim_tx_ren),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_SBITERR_UNCONNECTED ),
        .WEA({1'b1,1'b1,1'b1,1'b1}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "unimacro_BRAM_TDP_MACRO" *) 
module pcie_7x_0_unimacro_BRAM_TDP_MACRO_11
   (\ramb_bl.ramb36_dp_bl.ram36_bl_0 ,
    pipe_userclk1_in,
    mim_rx_wen,
    mim_rx_ren,
    MIMRXWADDR,
    MIMRXRADDR,
    \ramb_bl.ramb36_dp_bl.ram36_bl_1 );
  output [13:0]\ramb_bl.ramb36_dp_bl.ram36_bl_0 ;
  input pipe_userclk1_in;
  input mim_rx_wen;
  input mim_rx_ren;
  input [10:0]MIMRXWADDR;
  input [10:0]MIMRXRADDR;
  input [13:0]\ramb_bl.ramb36_dp_bl.ram36_bl_1 ;

  wire [10:0]MIMRXRADDR;
  wire [10:0]MIMRXWADDR;
  wire mim_rx_ren;
  wire mim_rx_wen;
  wire pipe_userclk1_in;
  wire [13:0]\ramb_bl.ramb36_dp_bl.ram36_bl_0 ;
  wire [13:0]\ramb_bl.ramb36_dp_bl.ram36_bl_1 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_20 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_21 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_22 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_23 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_24 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_25 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_26 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_27 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_28 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_29 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_30 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_31 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_32 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_33 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_34 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_35 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_52 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_53 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_54 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_70 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_71 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_74 ;
  wire \NLW_ramb_bl.ramb36_dp_bl.ram36_bl_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_ramb_bl.ramb36_dp_bl.ram36_bl_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DBITERR_UNCONNECTED ;
  wire \NLW_ramb_bl.ramb36_dp_bl.ram36_bl_SBITERR_UNCONNECTED ;
  wire [31:16]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOADO_UNCONNECTED ;
  wire [31:16]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOBDO_UNCONNECTED ;
  wire [3:2]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOPADOP_UNCONNECTED ;
  wire [3:2]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(1),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("NO_CHANGE"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    \ramb_bl.ramb36_dp_bl.ram36_bl 
       (.ADDRARDADDR({1'b1,MIMRXWADDR,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,MIMRXRADDR,1'b1,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(pipe_userclk1_in),
        .CLKBWRCLK(pipe_userclk1_in),
        .DBITERR(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,\ramb_bl.ramb36_dp_bl.ram36_bl_1 [13:9],\ramb_bl.ramb36_dp_bl.ram36_bl_1 [7:0]}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,\ramb_bl.ramb36_dp_bl.ram36_bl_1 [8]}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOADO_UNCONNECTED [31:16],\ramb_bl.ramb36_dp_bl.ram36_bl_n_20 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_21 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_22 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_23 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_24 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_25 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_26 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_27 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_28 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_29 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_30 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_31 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_32 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_33 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_34 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_35 }),
        .DOBDO({\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOBDO_UNCONNECTED [31:16],\ramb_bl.ramb36_dp_bl.ram36_bl_n_52 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_53 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_54 ,\ramb_bl.ramb36_dp_bl.ram36_bl_0 [13:9],\ramb_bl.ramb36_dp_bl.ram36_bl_0 [7:0]}),
        .DOPADOP({\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOPADOP_UNCONNECTED [3:2],\ramb_bl.ramb36_dp_bl.ram36_bl_n_70 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_71 }),
        .DOPBDOP({\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOPBDOP_UNCONNECTED [3:2],\ramb_bl.ramb36_dp_bl.ram36_bl_n_74 ,\ramb_bl.ramb36_dp_bl.ram36_bl_0 [8]}),
        .ECCPARITY(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(mim_rx_wen),
        .ENBWREN(mim_rx_ren),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_SBITERR_UNCONNECTED ),
        .WEA({1'b1,1'b1,1'b1,1'b1}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "unimacro_BRAM_TDP_MACRO" *) 
module pcie_7x_0_unimacro_BRAM_TDP_MACRO_12
   (\ramb_bl.ramb36_dp_bl.ram36_bl_0 ,
    pipe_userclk1_in,
    mim_rx_wen,
    mim_rx_ren,
    MIMRXWADDR,
    MIMRXRADDR,
    \ramb_bl.ramb36_dp_bl.ram36_bl_1 );
  output [17:0]\ramb_bl.ramb36_dp_bl.ram36_bl_0 ;
  input pipe_userclk1_in;
  input mim_rx_wen;
  input mim_rx_ren;
  input [10:0]MIMRXWADDR;
  input [10:0]MIMRXRADDR;
  input [17:0]\ramb_bl.ramb36_dp_bl.ram36_bl_1 ;

  wire [10:0]MIMRXRADDR;
  wire [10:0]MIMRXWADDR;
  wire mim_rx_ren;
  wire mim_rx_wen;
  wire pipe_userclk1_in;
  wire [17:0]\ramb_bl.ramb36_dp_bl.ram36_bl_0 ;
  wire [17:0]\ramb_bl.ramb36_dp_bl.ram36_bl_1 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_20 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_21 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_22 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_23 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_24 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_25 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_26 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_27 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_28 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_29 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_30 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_31 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_32 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_33 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_34 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_35 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_70 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_71 ;
  wire \NLW_ramb_bl.ramb36_dp_bl.ram36_bl_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_ramb_bl.ramb36_dp_bl.ram36_bl_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DBITERR_UNCONNECTED ;
  wire \NLW_ramb_bl.ramb36_dp_bl.ram36_bl_SBITERR_UNCONNECTED ;
  wire [31:16]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOADO_UNCONNECTED ;
  wire [31:16]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOBDO_UNCONNECTED ;
  wire [3:2]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOPADOP_UNCONNECTED ;
  wire [3:2]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(1),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("NO_CHANGE"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    \ramb_bl.ramb36_dp_bl.ram36_bl 
       (.ADDRARDADDR({1'b1,MIMRXWADDR,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,MIMRXRADDR,1'b1,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(pipe_userclk1_in),
        .CLKBWRCLK(pipe_userclk1_in),
        .DBITERR(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,\ramb_bl.ramb36_dp_bl.ram36_bl_1 [16:9],\ramb_bl.ramb36_dp_bl.ram36_bl_1 [7:0]}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,\ramb_bl.ramb36_dp_bl.ram36_bl_1 [17],\ramb_bl.ramb36_dp_bl.ram36_bl_1 [8]}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOADO_UNCONNECTED [31:16],\ramb_bl.ramb36_dp_bl.ram36_bl_n_20 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_21 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_22 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_23 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_24 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_25 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_26 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_27 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_28 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_29 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_30 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_31 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_32 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_33 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_34 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_35 }),
        .DOBDO({\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOBDO_UNCONNECTED [31:16],\ramb_bl.ramb36_dp_bl.ram36_bl_0 [16:9],\ramb_bl.ramb36_dp_bl.ram36_bl_0 [7:0]}),
        .DOPADOP({\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOPADOP_UNCONNECTED [3:2],\ramb_bl.ramb36_dp_bl.ram36_bl_n_70 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_71 }),
        .DOPBDOP({\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOPBDOP_UNCONNECTED [3:2],\ramb_bl.ramb36_dp_bl.ram36_bl_0 [17],\ramb_bl.ramb36_dp_bl.ram36_bl_0 [8]}),
        .ECCPARITY(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(mim_rx_wen),
        .ENBWREN(mim_rx_ren),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_SBITERR_UNCONNECTED ),
        .WEA({1'b1,1'b1,1'b1,1'b1}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "unimacro_BRAM_TDP_MACRO" *) 
module pcie_7x_0_unimacro_BRAM_TDP_MACRO_13
   (\ramb_bl.ramb36_dp_bl.ram36_bl_0 ,
    pipe_userclk1_in,
    mim_rx_wen,
    mim_rx_ren,
    MIMRXWADDR,
    MIMRXRADDR,
    \ramb_bl.ramb36_dp_bl.ram36_bl_1 );
  output [17:0]\ramb_bl.ramb36_dp_bl.ram36_bl_0 ;
  input pipe_userclk1_in;
  input mim_rx_wen;
  input mim_rx_ren;
  input [10:0]MIMRXWADDR;
  input [10:0]MIMRXRADDR;
  input [17:0]\ramb_bl.ramb36_dp_bl.ram36_bl_1 ;

  wire [10:0]MIMRXRADDR;
  wire [10:0]MIMRXWADDR;
  wire mim_rx_ren;
  wire mim_rx_wen;
  wire pipe_userclk1_in;
  wire [17:0]\ramb_bl.ramb36_dp_bl.ram36_bl_0 ;
  wire [17:0]\ramb_bl.ramb36_dp_bl.ram36_bl_1 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_20 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_21 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_22 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_23 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_24 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_25 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_26 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_27 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_28 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_29 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_30 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_31 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_32 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_33 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_34 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_35 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_70 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_71 ;
  wire \NLW_ramb_bl.ramb36_dp_bl.ram36_bl_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_ramb_bl.ramb36_dp_bl.ram36_bl_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DBITERR_UNCONNECTED ;
  wire \NLW_ramb_bl.ramb36_dp_bl.ram36_bl_SBITERR_UNCONNECTED ;
  wire [31:16]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOADO_UNCONNECTED ;
  wire [31:16]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOBDO_UNCONNECTED ;
  wire [3:2]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOPADOP_UNCONNECTED ;
  wire [3:2]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(1),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("NO_CHANGE"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    \ramb_bl.ramb36_dp_bl.ram36_bl 
       (.ADDRARDADDR({1'b1,MIMRXWADDR,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,MIMRXRADDR,1'b1,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(pipe_userclk1_in),
        .CLKBWRCLK(pipe_userclk1_in),
        .DBITERR(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,\ramb_bl.ramb36_dp_bl.ram36_bl_1 [16:9],\ramb_bl.ramb36_dp_bl.ram36_bl_1 [7:0]}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,\ramb_bl.ramb36_dp_bl.ram36_bl_1 [17],\ramb_bl.ramb36_dp_bl.ram36_bl_1 [8]}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOADO_UNCONNECTED [31:16],\ramb_bl.ramb36_dp_bl.ram36_bl_n_20 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_21 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_22 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_23 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_24 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_25 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_26 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_27 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_28 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_29 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_30 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_31 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_32 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_33 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_34 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_35 }),
        .DOBDO({\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOBDO_UNCONNECTED [31:16],\ramb_bl.ramb36_dp_bl.ram36_bl_0 [16:9],\ramb_bl.ramb36_dp_bl.ram36_bl_0 [7:0]}),
        .DOPADOP({\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOPADOP_UNCONNECTED [3:2],\ramb_bl.ramb36_dp_bl.ram36_bl_n_70 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_71 }),
        .DOPBDOP({\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOPBDOP_UNCONNECTED [3:2],\ramb_bl.ramb36_dp_bl.ram36_bl_0 [17],\ramb_bl.ramb36_dp_bl.ram36_bl_0 [8]}),
        .ECCPARITY(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(mim_rx_wen),
        .ENBWREN(mim_rx_ren),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_SBITERR_UNCONNECTED ),
        .WEA({1'b1,1'b1,1'b1,1'b1}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "unimacro_BRAM_TDP_MACRO" *) 
module pcie_7x_0_unimacro_BRAM_TDP_MACRO_14
   (\ramb_bl.ramb36_dp_bl.ram36_bl_0 ,
    pipe_userclk1_in,
    mim_rx_wen,
    mim_rx_ren,
    MIMRXWADDR,
    MIMRXRADDR,
    \ramb_bl.ramb36_dp_bl.ram36_bl_1 );
  output [17:0]\ramb_bl.ramb36_dp_bl.ram36_bl_0 ;
  input pipe_userclk1_in;
  input mim_rx_wen;
  input mim_rx_ren;
  input [10:0]MIMRXWADDR;
  input [10:0]MIMRXRADDR;
  input [17:0]\ramb_bl.ramb36_dp_bl.ram36_bl_1 ;

  wire [10:0]MIMRXRADDR;
  wire [10:0]MIMRXWADDR;
  wire mim_rx_ren;
  wire mim_rx_wen;
  wire pipe_userclk1_in;
  wire [17:0]\ramb_bl.ramb36_dp_bl.ram36_bl_0 ;
  wire [17:0]\ramb_bl.ramb36_dp_bl.ram36_bl_1 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_20 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_21 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_22 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_23 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_24 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_25 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_26 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_27 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_28 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_29 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_30 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_31 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_32 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_33 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_34 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_35 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_70 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_71 ;
  wire \NLW_ramb_bl.ramb36_dp_bl.ram36_bl_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_ramb_bl.ramb36_dp_bl.ram36_bl_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DBITERR_UNCONNECTED ;
  wire \NLW_ramb_bl.ramb36_dp_bl.ram36_bl_SBITERR_UNCONNECTED ;
  wire [31:16]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOADO_UNCONNECTED ;
  wire [31:16]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOBDO_UNCONNECTED ;
  wire [3:2]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOPADOP_UNCONNECTED ;
  wire [3:2]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(1),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("NO_CHANGE"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    \ramb_bl.ramb36_dp_bl.ram36_bl 
       (.ADDRARDADDR({1'b1,MIMRXWADDR,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,MIMRXRADDR,1'b1,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(pipe_userclk1_in),
        .CLKBWRCLK(pipe_userclk1_in),
        .DBITERR(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,\ramb_bl.ramb36_dp_bl.ram36_bl_1 [16:9],\ramb_bl.ramb36_dp_bl.ram36_bl_1 [7:0]}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,\ramb_bl.ramb36_dp_bl.ram36_bl_1 [17],\ramb_bl.ramb36_dp_bl.ram36_bl_1 [8]}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOADO_UNCONNECTED [31:16],\ramb_bl.ramb36_dp_bl.ram36_bl_n_20 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_21 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_22 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_23 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_24 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_25 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_26 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_27 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_28 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_29 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_30 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_31 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_32 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_33 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_34 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_35 }),
        .DOBDO({\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOBDO_UNCONNECTED [31:16],\ramb_bl.ramb36_dp_bl.ram36_bl_0 [16:9],\ramb_bl.ramb36_dp_bl.ram36_bl_0 [7:0]}),
        .DOPADOP({\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOPADOP_UNCONNECTED [3:2],\ramb_bl.ramb36_dp_bl.ram36_bl_n_70 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_71 }),
        .DOPBDOP({\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOPBDOP_UNCONNECTED [3:2],\ramb_bl.ramb36_dp_bl.ram36_bl_0 [17],\ramb_bl.ramb36_dp_bl.ram36_bl_0 [8]}),
        .ECCPARITY(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(mim_rx_wen),
        .ENBWREN(mim_rx_ren),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_SBITERR_UNCONNECTED ),
        .WEA({1'b1,1'b1,1'b1,1'b1}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "unimacro_BRAM_TDP_MACRO" *) 
module pcie_7x_0_unimacro_BRAM_TDP_MACRO_4
   (rdata,
    pipe_userclk1_in,
    mim_tx_wen,
    mim_tx_ren,
    MIMTXWADDR,
    MIMTXRADDR,
    wdata);
  output [17:0]rdata;
  input pipe_userclk1_in;
  input mim_tx_wen;
  input mim_tx_ren;
  input [10:0]MIMTXWADDR;
  input [10:0]MIMTXRADDR;
  input [17:0]wdata;

  wire [10:0]MIMTXRADDR;
  wire [10:0]MIMTXWADDR;
  wire mim_tx_ren;
  wire mim_tx_wen;
  wire pipe_userclk1_in;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_20 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_21 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_22 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_23 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_24 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_25 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_26 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_27 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_28 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_29 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_30 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_31 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_32 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_33 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_34 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_35 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_70 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_71 ;
  wire [17:0]rdata;
  wire [17:0]wdata;
  wire \NLW_ramb_bl.ramb36_dp_bl.ram36_bl_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_ramb_bl.ramb36_dp_bl.ram36_bl_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DBITERR_UNCONNECTED ;
  wire \NLW_ramb_bl.ramb36_dp_bl.ram36_bl_SBITERR_UNCONNECTED ;
  wire [31:16]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOADO_UNCONNECTED ;
  wire [31:16]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOBDO_UNCONNECTED ;
  wire [3:2]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOPADOP_UNCONNECTED ;
  wire [3:2]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(1),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("NO_CHANGE"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    \ramb_bl.ramb36_dp_bl.ram36_bl 
       (.ADDRARDADDR({1'b1,MIMTXWADDR,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,MIMTXRADDR,1'b1,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(pipe_userclk1_in),
        .CLKBWRCLK(pipe_userclk1_in),
        .DBITERR(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,wdata[16:9],wdata[7:0]}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,wdata[17],wdata[8]}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOADO_UNCONNECTED [31:16],\ramb_bl.ramb36_dp_bl.ram36_bl_n_20 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_21 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_22 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_23 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_24 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_25 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_26 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_27 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_28 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_29 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_30 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_31 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_32 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_33 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_34 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_35 }),
        .DOBDO({\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOBDO_UNCONNECTED [31:16],rdata[16:9],rdata[7:0]}),
        .DOPADOP({\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOPADOP_UNCONNECTED [3:2],\ramb_bl.ramb36_dp_bl.ram36_bl_n_70 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_71 }),
        .DOPBDOP({\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOPBDOP_UNCONNECTED [3:2],rdata[17],rdata[8]}),
        .ECCPARITY(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(mim_tx_wen),
        .ENBWREN(mim_tx_ren),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_SBITERR_UNCONNECTED ),
        .WEA({1'b1,1'b1,1'b1,1'b1}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "unimacro_BRAM_TDP_MACRO" *) 
module pcie_7x_0_unimacro_BRAM_TDP_MACRO_5
   (rdata,
    pipe_userclk1_in,
    mim_tx_wen,
    mim_tx_ren,
    MIMTXWADDR,
    MIMTXRADDR,
    wdata);
  output [17:0]rdata;
  input pipe_userclk1_in;
  input mim_tx_wen;
  input mim_tx_ren;
  input [10:0]MIMTXWADDR;
  input [10:0]MIMTXRADDR;
  input [17:0]wdata;

  wire [10:0]MIMTXRADDR;
  wire [10:0]MIMTXWADDR;
  wire mim_tx_ren;
  wire mim_tx_wen;
  wire pipe_userclk1_in;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_20 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_21 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_22 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_23 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_24 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_25 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_26 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_27 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_28 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_29 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_30 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_31 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_32 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_33 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_34 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_35 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_70 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_71 ;
  wire [17:0]rdata;
  wire [17:0]wdata;
  wire \NLW_ramb_bl.ramb36_dp_bl.ram36_bl_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_ramb_bl.ramb36_dp_bl.ram36_bl_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DBITERR_UNCONNECTED ;
  wire \NLW_ramb_bl.ramb36_dp_bl.ram36_bl_SBITERR_UNCONNECTED ;
  wire [31:16]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOADO_UNCONNECTED ;
  wire [31:16]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOBDO_UNCONNECTED ;
  wire [3:2]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOPADOP_UNCONNECTED ;
  wire [3:2]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(1),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("NO_CHANGE"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    \ramb_bl.ramb36_dp_bl.ram36_bl 
       (.ADDRARDADDR({1'b1,MIMTXWADDR,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,MIMTXRADDR,1'b1,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(pipe_userclk1_in),
        .CLKBWRCLK(pipe_userclk1_in),
        .DBITERR(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,wdata[16:9],wdata[7:0]}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,wdata[17],wdata[8]}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOADO_UNCONNECTED [31:16],\ramb_bl.ramb36_dp_bl.ram36_bl_n_20 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_21 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_22 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_23 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_24 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_25 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_26 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_27 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_28 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_29 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_30 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_31 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_32 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_33 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_34 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_35 }),
        .DOBDO({\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOBDO_UNCONNECTED [31:16],rdata[16:9],rdata[7:0]}),
        .DOPADOP({\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOPADOP_UNCONNECTED [3:2],\ramb_bl.ramb36_dp_bl.ram36_bl_n_70 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_71 }),
        .DOPBDOP({\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOPBDOP_UNCONNECTED [3:2],rdata[17],rdata[8]}),
        .ECCPARITY(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(mim_tx_wen),
        .ENBWREN(mim_tx_ren),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_SBITERR_UNCONNECTED ),
        .WEA({1'b1,1'b1,1'b1,1'b1}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "unimacro_BRAM_TDP_MACRO" *) 
module pcie_7x_0_unimacro_BRAM_TDP_MACRO_6
   (rdata,
    pipe_userclk1_in,
    mim_tx_wen,
    mim_tx_ren,
    MIMTXWADDR,
    MIMTXRADDR,
    wdata);
  output [17:0]rdata;
  input pipe_userclk1_in;
  input mim_tx_wen;
  input mim_tx_ren;
  input [10:0]MIMTXWADDR;
  input [10:0]MIMTXRADDR;
  input [17:0]wdata;

  wire [10:0]MIMTXRADDR;
  wire [10:0]MIMTXWADDR;
  wire mim_tx_ren;
  wire mim_tx_wen;
  wire pipe_userclk1_in;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_20 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_21 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_22 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_23 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_24 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_25 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_26 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_27 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_28 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_29 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_30 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_31 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_32 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_33 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_34 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_35 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_70 ;
  wire \ramb_bl.ramb36_dp_bl.ram36_bl_n_71 ;
  wire [17:0]rdata;
  wire [17:0]wdata;
  wire \NLW_ramb_bl.ramb36_dp_bl.ram36_bl_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_ramb_bl.ramb36_dp_bl.ram36_bl_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DBITERR_UNCONNECTED ;
  wire \NLW_ramb_bl.ramb36_dp_bl.ram36_bl_SBITERR_UNCONNECTED ;
  wire [31:16]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOADO_UNCONNECTED ;
  wire [31:16]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOBDO_UNCONNECTED ;
  wire [3:2]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOPADOP_UNCONNECTED ;
  wire [3:2]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(1),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("NO_CHANGE"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    \ramb_bl.ramb36_dp_bl.ram36_bl 
       (.ADDRARDADDR({1'b1,MIMTXWADDR,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,MIMTXRADDR,1'b1,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(pipe_userclk1_in),
        .CLKBWRCLK(pipe_userclk1_in),
        .DBITERR(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,wdata[16:9],wdata[7:0]}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,wdata[17],wdata[8]}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOADO_UNCONNECTED [31:16],\ramb_bl.ramb36_dp_bl.ram36_bl_n_20 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_21 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_22 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_23 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_24 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_25 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_26 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_27 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_28 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_29 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_30 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_31 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_32 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_33 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_34 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_35 }),
        .DOBDO({\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOBDO_UNCONNECTED [31:16],rdata[16:9],rdata[7:0]}),
        .DOPADOP({\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOPADOP_UNCONNECTED [3:2],\ramb_bl.ramb36_dp_bl.ram36_bl_n_70 ,\ramb_bl.ramb36_dp_bl.ram36_bl_n_71 }),
        .DOPBDOP({\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_DOPBDOP_UNCONNECTED [3:2],rdata[17],rdata[8]}),
        .ECCPARITY(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(mim_tx_wen),
        .ENBWREN(mim_tx_ren),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_ramb_bl.ramb36_dp_bl.ram36_bl_SBITERR_UNCONNECTED ),
        .WEA({1'b1,1'b1,1'b1,1'b1}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "SINGLE" *) 
module pcie_7x_0_xpm_cdc_single
   (src_clk,
    src_in,
    dest_clk,
    dest_out);
  input src_clk;
  input src_in;
  input dest_clk;
  output dest_out;

  wire dest_clk;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [1:0]syncstages_ff;

  assign dest_out = syncstages_ff[1];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "SINGLE" *) 
module pcie_7x_0_xpm_cdc_single__2
   (src_clk,
    src_in,
    dest_clk,
    dest_out);
  input src_clk;
  input src_in;
  input dest_clk;
  output dest_out;

  wire dest_clk;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [1:0]syncstages_ff;

  assign dest_out = syncstages_ff[1];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
