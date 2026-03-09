# tool_hooks.tcl
set current_dir [pwd]
puts "Current directory: $current_dir"
set_property STEPS.SYNTH_DESIGN.TCL.PRE {../../../../../example/async_fifo_constraints.tcl} [get_runs synth_1]