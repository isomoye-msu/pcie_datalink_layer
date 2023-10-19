all: clean lint sim

lint:	$(wildcard *.v)
	verible-verilog-lint --autofix inplace src/*.sv

SRC_FILE=src/*.v
INC_DIR= +incdir+=/src/*


testbench:
	iverilog -Wall -g2012 -c file_list.txt -Wall tb tb/tb_pcie_datalink_layer.sv -o $@ 


sim: clean testbench
	vvp ./testbench


clean:
	rm -f testbench tb_layered tb_class *.vcd