# Makefile

# defaults
SIM ?= icarus
TOPLEVEL_LANG ?= verilog
WAVES ?= 1

COCOTB_HDL_TIMEUNIT = 1ns
COCOTB_HDL_TIMEPRECISION = 1ps



clean:
	cd src/core && $(MAKE) clean
	cd src/dllp_recieve && $(MAKE) clean
	cd src/dllp_transmit && $(MAKE) clean

# TOPLEVEL_LANG = verilog

# SIM ?= icarus
# WAVES ?= 0

# COCOTB_HDL_TIMEUNIT = 1ns
# COCOTB_HDL_TIMEPRECISION = 1ps

# DUT      = axis_adapter
# TOPLEVEL = $(DUT)
# MODULE   = test_$(DUT)
# VERILOG_SOURCES += ../../rtl/$(DUT).v

# # module parameters
# export PARAM_DATA_WIDTH := 8
# export PARAM_KEEP_WIDTH := $(shell expr \( $(PARAM_DATA_WIDTH) + 7 \) / 8 )
# export PARAM_STRB_WIDTH := $(shell expr \( $(PARAM_DATA_WIDTH) + 7 \) / 8 )
# export PARAM_S_COUNT := 1
# export PARAM_USER_WIDTH := 4
# export PARAM_RAM_ADDR_WIDTH := 1




# all: clean lint sim

# lint:	$(wildcard *.v)
# 	verible-verilog-lint --autofix inplace src/*.sv

# SRC_FILE=src/*.v
# INC_DIR= +incdir+=/src/*


testbench:
	iverilog -Wall -g2012 $(VERILOG_SOURCES) -o $@ 


# sim: clean testbench
# 	vvp ./testbench


clean_sim:
	rm -f testbench tb_layered tb_class *.vcd