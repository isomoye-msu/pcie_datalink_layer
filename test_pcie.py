from cocotb_vivado import run
import subprocess
import os
import pathlib

import cocotb
from cocotb.triggers import Timer


def test_fw():
    src_path = pathlib.Path(__file__).parent.absolute()

    # if not os.path.exists("fw/fw.xpr"):
    #     subprocess.run(["vivado", "-nolog", "-mode", "tcl", "-source", src_path / "fw.tcl"])

    # if not os.path.exists("xsim.dir/fw_wrapper_behav/xsimk.so"):
    #     subprocess.run(["xvlog", "-prj", "fw/fw.sim/sim_1/behav/xsim/fw_wrapper_vlog.prj"])
    #     subprocess.run(["xvhdl", "-prj", "fw/fw.sim/sim_1/behav/xsim/fw_wrapper_vhdl.prj"])
    #     subprocess.run(
    #         "xelab --debug typical --relax -L xil_defaultlib -L xlconstant_v1_1_9 -L lib_cdc_v1_0_3 -L proc_sys_reset_v5_0_15 -L smartconnect_v1_0 -L axi_infrastructure_v1_1_0 -L axi_register_slice_v2_1_31 -L axi_vip_v1_1_17 -L axi_bram_ctrl_v4_1_10 -L axi_lite_ipif_v3_0_4 -L lib_pkg_v1_0_4 -L fifo_generator_v13_2_10 -L lib_fifo_v1_0_19 -L axi_fifo_mm_s_v4_3_3 -L blk_mem_gen_v8_4_8 -L util_vector_logic_v2_0_4 -L uvm -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot fw_wrapper_behav xil_defaultlib.fw_wrapper xil_defaultlib.glbl -log elaborate.log -dll".split()
    #     )
    run(module="test_fw", xsim_design="build/fusesoc_pcie_pcie_kc705_1.0.0/xsim-xsim/xsim.dir/fusesoc_pcie_pcie_kc705_1.0.0/xsimk.so", top_level_lang="verilog")

if __name__ == "__main__":
    test_fw()