-makelib xcelium_lib/xpm -sv \
  "/tools/C/research/tools/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "/tools/C/research/tools/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "/tools/C/research/tools/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../pcie_7x_0_ex.gen/sources_1/ip/pcie_7x_0/source/pcie_7x_0_pipe_eq.v" \
  "../../../../pcie_7x_0_ex.gen/sources_1/ip/pcie_7x_0/source/pcie_7x_0_pipe_drp.v" \
  "../../../../pcie_7x_0_ex.gen/sources_1/ip/pcie_7x_0/source/pcie_7x_0_pipe_rate.v" \
  "../../../../pcie_7x_0_ex.gen/sources_1/ip/pcie_7x_0/source/pcie_7x_0_pipe_reset.v" \
  "../../../../pcie_7x_0_ex.gen/sources_1/ip/pcie_7x_0/source/pcie_7x_0_pipe_sync.v" \
  "../../../../pcie_7x_0_ex.gen/sources_1/ip/pcie_7x_0/source/pcie_7x_0_gtp_pipe_rate.v" \
  "../../../../pcie_7x_0_ex.gen/sources_1/ip/pcie_7x_0/source/pcie_7x_0_gtp_pipe_drp.v" \
  "../../../../pcie_7x_0_ex.gen/sources_1/ip/pcie_7x_0/source/pcie_7x_0_gtp_pipe_reset.v" \
  "../../../../pcie_7x_0_ex.gen/sources_1/ip/pcie_7x_0/source/pcie_7x_0_pipe_user.v" \
  "../../../../pcie_7x_0_ex.gen/sources_1/ip/pcie_7x_0/source/pcie_7x_0_pipe_wrapper.v" \
  "../../../../pcie_7x_0_ex.gen/sources_1/ip/pcie_7x_0/source/pcie_7x_0_qpll_drp.v" \
  "../../../../pcie_7x_0_ex.gen/sources_1/ip/pcie_7x_0/source/pcie_7x_0_qpll_reset.v" \
  "../../../../pcie_7x_0_ex.gen/sources_1/ip/pcie_7x_0/source/pcie_7x_0_qpll_wrapper.v" \
  "../../../../pcie_7x_0_ex.gen/sources_1/ip/pcie_7x_0/source/pcie_7x_0_rxeq_scan.v" \
  "../../../../pcie_7x_0_ex.gen/sources_1/ip/pcie_7x_0/source/pcie_7x_0_pcie_top.v" \
  "../../../../pcie_7x_0_ex.gen/sources_1/ip/pcie_7x_0/source/pcie_7x_0_core_top.v" \
  "../../../../pcie_7x_0_ex.gen/sources_1/ip/pcie_7x_0/source/pcie_7x_0_axi_basic_rx_null_gen.v" \
  "../../../../pcie_7x_0_ex.gen/sources_1/ip/pcie_7x_0/source/pcie_7x_0_axi_basic_rx_pipeline.v" \
  "../../../../pcie_7x_0_ex.gen/sources_1/ip/pcie_7x_0/source/pcie_7x_0_axi_basic_rx.v" \
  "../../../../pcie_7x_0_ex.gen/sources_1/ip/pcie_7x_0/source/pcie_7x_0_axi_basic_top.v" \
  "../../../../pcie_7x_0_ex.gen/sources_1/ip/pcie_7x_0/source/pcie_7x_0_axi_basic_tx_pipeline.v" \
  "../../../../pcie_7x_0_ex.gen/sources_1/ip/pcie_7x_0/source/pcie_7x_0_axi_basic_tx_thrtl_ctl.v" \
  "../../../../pcie_7x_0_ex.gen/sources_1/ip/pcie_7x_0/source/pcie_7x_0_axi_basic_tx.v" \
  "../../../../pcie_7x_0_ex.gen/sources_1/ip/pcie_7x_0/source/pcie_7x_0_pcie_7x.v" \
  "../../../../pcie_7x_0_ex.gen/sources_1/ip/pcie_7x_0/source/pcie_7x_0_pcie_bram_7x.v" \
  "../../../../pcie_7x_0_ex.gen/sources_1/ip/pcie_7x_0/source/pcie_7x_0_pcie_bram_top_7x.v" \
  "../../../../pcie_7x_0_ex.gen/sources_1/ip/pcie_7x_0/source/pcie_7x_0_pcie_brams_7x.v" \
  "../../../../pcie_7x_0_ex.gen/sources_1/ip/pcie_7x_0/source/pcie_7x_0_pcie_pipe_lane.v" \
  "../../../../pcie_7x_0_ex.gen/sources_1/ip/pcie_7x_0/source/pcie_7x_0_pcie_pipe_misc.v" \
  "../../../../pcie_7x_0_ex.gen/sources_1/ip/pcie_7x_0/source/pcie_7x_0_pcie_pipe_pipeline.v" \
  "../../../../pcie_7x_0_ex.gen/sources_1/ip/pcie_7x_0/source/pcie_7x_0_gt_top.v" \
  "../../../../pcie_7x_0_ex.gen/sources_1/ip/pcie_7x_0/source/pcie_7x_0_gt_common.v" \
  "../../../../pcie_7x_0_ex.gen/sources_1/ip/pcie_7x_0/source/pcie_7x_0_gtp_cpllpd_ovrd.v" \
  "../../../../pcie_7x_0_ex.gen/sources_1/ip/pcie_7x_0/source/pcie_7x_0_gtx_cpllpd_ovrd.v" \
  "../../../../pcie_7x_0_ex.gen/sources_1/ip/pcie_7x_0/source/pcie_7x_0_gt_rx_valid_filter_7x.v" \
  "../../../../pcie_7x_0_ex.gen/sources_1/ip/pcie_7x_0/source/pcie_7x_0_gt_wrapper.v" \
  "../../../../pcie_7x_0_ex.gen/sources_1/ip/pcie_7x_0/source/pcie_7x_0_pcie2_top.v" \
  "../../../../pcie_7x_0_ex.gen/sources_1/ip/pcie_7x_0/sim/pcie_7x_0.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

