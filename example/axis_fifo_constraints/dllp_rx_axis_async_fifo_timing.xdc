set async_fifos  [get_cells -hier *dllp_rx_axis_async_fifo_inst* ]

set fifo_inst $async_fifos
# get clock periods
set write_clk [get_clocks -of_objects [get_cells -quiet "$fifo_inst/wr_ptr_reg_reg[*] $fifo_inst/wr_ptr_gray_reg_reg[*] $fifo_inst/rd_ptr_gray_sync1_reg_reg[*]"]]
set read_clk [get_clocks  -of_objects [get_cells -quiet "$fifo_inst/rd_ptr_reg_reg[*] $fifo_inst/rd_ptr_gray_reg_reg[*] $fifo_inst/wr_ptr_gray_sync1_reg_reg[*]"]]

set write_clk_period [get_property -min PERIOD $write_clk]
set read_clk_period [get_property -min PERIOD $read_clk]

set min_clk_period [expr min($write_clk_period, $read_clk_period)]

# reset synchronization
set reset_ffs [get_cells -quiet -hier -regexp ".*/s_rst_sync\[23\]_reg_reg" -filter "PARENT == $fifo_inst"]

set_property ASYNC_REG TRUE $reset_ffs

# hunt down source
set dest [get_cells $fifo_inst/s_rst_sync2_reg_reg]
set dest_pins [get_pins -of_objects $dest -filter {REF_PIN_NAME == D}]
set net [get_nets -segments -of_objects $dest_pins]
set source_pins [get_pins -of_objects $net -filter {IS_LEAF && DIRECTION == OUT}]
set source [get_cells -of_objects $source_pins]

set_max_delay -from $source -to $dest -datapath_only $read_clk_period

set reset_ffs [get_cells -quiet -hier -regexp ".*/m_rst_sync\[23\]_reg_reg" -filter "PARENT == $fifo_inst"]

set_property ASYNC_REG TRUE $reset_ffs

# hunt down source
set dest [get_cells $fifo_inst/m_rst_sync2_reg_reg]
set dest_pins [get_pins -of_objects $dest -filter {REF_PIN_NAME == D}]
set net [get_nets -segments -of_objects $dest_pins]
set source_pins [get_pins -of_objects $net -filter {IS_LEAF && DIRECTION == OUT}]
set source [get_cells -of_objects $source_pins]

set_max_delay -from $source -to $dest -datapath_only $write_clk_period

# pointer synchronization
set sync_ffs [get_cells -quiet -hier -regexp ".*/rd_ptr_gray_sync\[12\]_reg_reg\\\[\\d+\\\]" -filter "PARENT == $fifo_inst"]

set_property ASYNC_REG TRUE $sync_ffs

set_max_delay -from [get_cells "$fifo_inst/rd_ptr_reg_reg[*] $fifo_inst/rd_ptr_gray_reg_reg[*]"] -to [get_cells "$fifo_inst/rd_ptr_gray_sync1_reg_reg[*]"] -datapath_only $read_clk_period
set_bus_skew  -from [get_cells "$fifo_inst/rd_ptr_reg_reg[*] $fifo_inst/rd_ptr_gray_reg_reg[*]"] -to [get_cells "$fifo_inst/rd_ptr_gray_sync1_reg_reg[*]"] $write_clk_period

set sync_ffs [get_cells -quiet -hier -regexp ".*/wr_ptr_gray_sync\[12\]_reg_reg\\\[\\d+\\\]" -filter "PARENT == $fifo_inst"]

set_property ASYNC_REG TRUE $sync_ffs

set_max_delay -from [get_cells -quiet "$fifo_inst/wr_ptr_reg_reg[*] $fifo_inst/wr_ptr_gray_reg_reg[*]"] -to [get_cells "$fifo_inst/wr_ptr_gray_sync1_reg_reg[*]"] -datapath_only $write_clk_period
set_bus_skew  -from [get_cells -quiet "$fifo_inst/wr_ptr_reg_reg[*] $fifo_inst/wr_ptr_gray_reg_reg[*]"] -to [get_cells "$fifo_inst/wr_ptr_gray_sync1_reg_reg[*]"] $read_clk_period


# set sync_ffs [get_cells -quiet -hier -regexp ".*/wr_ptr_commit_sync_reg_reg\\\[\\d+\\\]" -filter "PARENT == $fifo_inst"]


# set_property ASYNC_REG TRUE $sync_ffs

# set_max_delay -from [get_cells -quiet "$fifo_inst/wr_ptr_sync_commit_reg_reg[*]"] -to [get_cells "$fifo_inst/wr_ptr_commit_sync_reg_reg[*]"] -datapath_only $write_clk_period
# set_bus_skew  -from [get_cells -quiet "$fifo_inst/wr_ptr_sync_commit_reg_reg[*]"] -to [get_cells "$fifo_inst/wr_ptr_commit_sync_reg_reg[*]"] $read_clk_period

# output register (needed for distributed RAM sync write/async read)
set output_reg_ffs [get_cells -quiet "$fifo_inst/m_axis_pipe_reg_reg[0][*]"]



set_false_path -from $write_clk -to $output_reg_ffs


# frame FIFO pointer update synchronization
set update_ffs [get_cells -quiet -hier -regexp ".*/wr_ptr_update(_ack)?_sync\[123\]_reg_reg" -filter "PARENT == $fifo_inst"]


# set_property ASYNC_REG TRUE $update_ffs

# set_max_delay -from [get_cells "$fifo_inst/wr_ptr_update_reg_reg"] -to [get_cells "$fifo_inst/wr_ptr_update_sync1_reg_reg"] -datapath_only $write_clk_period
# set_max_delay -from [get_cells "$fifo_inst/wr_ptr_update_sync3_reg_reg"] -to [get_cells "$fifo_inst/wr_ptr_update_ack_sync1_reg_reg"] -datapath_only $read_clk_period


# status synchronization

set status_sync_regs [get_cells -quiet -hier -regexp ".*/*_sync\[123\]_reg_reg" -filter "PARENT == $fifo_inst"]


set_property ASYNC_REG TRUE $status_sync_regs

set_max_delay -from [get_cells "$fifo_inst/*_sync1_reg_reg"] -to [get_cells "$fifo_inst/*_sync2_reg_reg"] -datapath_only $read_clk_period


# pause sync
# set sync_ffs [get_cells -quiet -hier -regexp ".*/pause.s_pause_req_sync\[123\]_reg_reg" -filter "PARENT == $fifo_inst"]

# set_property ASYNC_REG TRUE $sync_ffs

# set_max_delay -from [get_cells "$fifo_inst/pause.s_pause_req_sync1_reg_reg"] -to [get_cells "$fifo_inst/pause.s_pause_req_sync2_reg_reg"] -datapath_only $read_clk_period


# set sync_ffs [get_cells -quiet -hier -regexp ".*/pause.s_pause_ack_sync\[123\]_reg_reg" -filter "PARENT == $fifo_inst"]


# set_property ASYNC_REG TRUE $sync_ffs

# set_max_delay -from [get_cells "$fifo_inst/pause.s_pause_ack_sync1_reg_reg"] -to [get_cells "$fifo_inst/pause.s_pause_ack_sync2_reg_reg"] -datapath_only $write_clk_period
