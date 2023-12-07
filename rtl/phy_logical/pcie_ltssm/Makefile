# Makefile

# defaults
SIM ?= icarus
TOPLEVEL_LANG ?= verilog
WAVES ?= 1

COCOTB_HDL_TIMEUNIT = 1ns
COCOTB_HDL_TIMEPRECISION = 1ps

VERILOG_SOURCES = \
	../../packages/pcie_datalink_pkg.sv  \
	../../packages/pcie_phy_pkg.sv \
	../../crc/pcie_dllp_crc8.v \
	../../crc/pcie_crc8.v  \
    ../../crc/pcie_lcrc16.sv  \
    ../../crc/pcie_lcrc32.sv  \
    ../../crc/Crc16Gen.sv  \
    ../../crc/pcie_datalink_crc.sv   \
    ../../bram/bram_dp.sv  \
    ../../../verilog-axis/rtl/priority_encoder.v  \
    ../../../verilog-axis/rtl/arbiter.v  \
    ../../../verilog-axis/rtl/axis_arb_mux.v \
	../../../verilog-axis/rtl/axis_register.v   \
	src/ltssm_configuration.sv \
	tb/tb_ltssm_configuration.v

VERILOG_INCLUDES = includes/
# use VHDL_SOURCES for VHDL files

# TOPLEVEL is the name of the toplevel module in your Verilog or VHDL file
TOPLEVEL ?= tb_ltssm_configuration

# MODULE is the basename of the Python test file
MODULE ?= test_ltssm_configuration

#EXTRA_ARGS += -g2012

ifeq ($(SIM), icarus)
	PLUSARGS += -fst -g2012 -I $(VERILOG_INCLUDES)

	COMPILE_ARGS += $(foreach v,$(filter PARAM_%,$(.VARIABLES)),-P $(TOPLEVEL).$(subst PARAM_,,$(v))=$($(v))) -I $(VERILOG_INCLUDES)

	ifeq ($(WAVES), 1)
		VERILOG_SOURCES += iverilog_dump.v
		COMPILE_ARGS += -s iverilog_dump 
	endif
else ifeq ($(SIM), verilator)
	COMPILE_ARGS += -Wno-SELRANGE -Wno-WIDTH

	COMPILE_ARGS += $(foreach v,$(filter PARAM_%,$(.VARIABLES)),-G$(subst PARAM_,,$(v))=$($(v)))

	ifeq ($(WAVES), 1)
		COMPILE_ARGS += --trace-fst
	endif
endif

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim

iverilog_dump.v:
	echo 'module iverilog_dump();' > $@
	echo 'initial begin' >> $@
	echo '    $$dumpfile("$(TOPLEVEL).fst");' >> $@
	echo '    $$dumpvars(0, $(TOPLEVEL));' >> $@
	echo 'end' >> $@
	echo 'endmodule' >> $@

clean::
	@rm -rf iverilog_dump.v
	@rm -rf dump.fst $(TOPLEVEL).fst

testbench:
	iverilog -Wall -g2012 $(VERILOG_SOURCES) -o $@ 


clean_sim:
	rm -f testbench tb_layered tb_class *.vcd