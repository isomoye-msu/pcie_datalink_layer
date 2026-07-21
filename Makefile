# ============================================================================
# Cocotb 1.9.2 + VCS test for pcie_datalink_layer
#
# DUT:
#   src/dllp/pcie_datalink_layer.sv
#
# Python test:
#   tb/dllp/test_pcie_datalink_layer.py
# ============================================================================

SIM := vcs
TOPLEVEL_LANG := verilog

# Name of the RTL module, not the SystemVerilog testbench.
TOPLEVEL := pcie_datalink_layer

# Python filename without the .py extension.
MODULE := test_dll_comprehensive

# Make the Python test importable by cocotb.
export PYTHONPATH := $(PWD)/tb/dllp:$(PYTHONPATH)

VERILOG_SOURCES := \
	$(PWD)/src/packages/pcie_datalink_pkg.sv \
	$(PWD)/src/pcie_cfg/pcie_config_reg_pkg.sv \
	$(PWD)/src/pcie_cfg/pcie_config_reg.sv \
	$(PWD)/src/packages/pcie_tlp_pkg.sv \
	$(PWD)/src/pcie_cfg/pcie_cfg_wrapper.sv \
	$(PWD)/src/pcie_cfg/pcie_config_decode.sv \
	$(PWD)/src/pcie_cfg/pcie_config_mux.sv \
	$(PWD)/src/pcie_cfg/pcie_config_handler.sv \
	$(PWD)/src/crc/pcie_dllp_crc8.v \
	$(PWD)/src/crc/pcie_datalink_crc.sv \
	$(PWD)/src/crc/pcie_crc8.v \
	$(PWD)/src/crc/pcie_lcrc16.sv \
	$(PWD)/src/crc/pcie_lcrc32.sv \
	$(PWD)/src/dllp/pcie_datalink_layer.sv \
	$(PWD)/src/dllp/pcie_datalink_init.sv \
	$(PWD)/src/dllp/pcie_flow_ctrl_init.sv \
	$(PWD)/src/dllp/dllp_receive.sv \
	$(PWD)/src/dllp/dllp_handler.sv \
	$(PWD)/src/dllp/dllp_transmit.sv \
	$(PWD)/src/dllp/dllp2tlp.sv \
	$(PWD)/src/dllp/tlp2dllp.sv \
	$(PWD)/src/dllp/dllp_fc_update.sv \
	$(PWD)/src/dllp/retry_management.sv \
	$(PWD)/src/dllp/retry_transmit.sv \
	$(PWD)/src/dllp/axis_retry_fifo.sv \
	$(PWD)/src/dllp/axis_user_demux.sv \
	$(PWD)/src/bram/bram_dp.sv \
	$(PWD)/src/verilog-axis/rtl/arbiter.v \
	$(PWD)/src/verilog-axis/rtl/priority_encoder.v \
	$(PWD)/src/verilog-axis/rtl/axis_register.v \
	$(PWD)/src/verilog-axis/rtl/axis_arb_mux.v \
	$(PWD)/src/verilog-axis/rtl/axis_mux.v \
	$(PWD)/src/verilog-axis/rtl/axis_demux.v \
	$(PWD)/src/verilog-axis/rtl/axis_fifo.v

# Options used while VCS compiles the RTL.
COMPILE_ARGS += -full64
COMPILE_ARGS += -sverilog
COMPILE_ARGS += -timescale=1ns/1ps
COMPILE_ARGS += -debug_access+all
COMPILE_ARGS += -kdb
COMPILE_ARGS += -lca
COMPILE_ARGS += +v2k

# Build output directory used by cocotb.
SIM_BUILD := sim_build

# Cocotb result summary. This is XML, separate from the terminal text log.
COCOTB_RESULTS_FILE := results_pcie_datalink.xml

.PHONY: test-log clean-all print-sources

# Run cocotb/VCS and save stdout and stderr to the requested text file.
test-log:
	@set -o pipefail; \
	$(MAKE) sim 2>&1 | tee output_testPcie_python.txt

print-sources:
	@printf "%s\n" $(VERILOG_SOURCES)

clean-all:
	rm -rf \
		$(SIM_BUILD) \
		simv \
		simv.daidir \
		csrc \
		DVEfiles \
		ucli.key \
		*.vpd \
		*.vcd \
		*.fsdb \
		*.log \
		results*.xml \
		output_testPcie_python.txt \
		novas.* \
		verdiLog

include $(shell cocotb-config --makefiles)/Makefile.sim