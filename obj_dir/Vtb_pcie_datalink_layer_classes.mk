# Verilated -*- Makefile -*-
# DESCRIPTION: Verilator output: Make include file with class lists
#
# This file lists generated Verilated files, for including in higher level makefiles.
# See Vtb_pcie_datalink_layer.mk for the caller.

### Switches...
# C11 constructs required?  0/1 (always on now)
VM_C11 = 1
# Timing enabled?  0/1
VM_TIMING = 0
# Coverage output mode?  0/1 (from --coverage)
VM_COVERAGE = 0
# Parallel builds?  0/1 (from --output-split)
VM_PARALLEL_BUILDS = 1
# Tracing output mode?  0/1 (from --trace-fst/--trace-saif/--trace-vcd)
VM_TRACE = 1
# Tracing output mode in FST format?  0/1 (from --trace-fst)
VM_TRACE_FST = 0
# Tracing output mode in SAIF format?  0/1 (from --trace-saif)
VM_TRACE_SAIF = 0
# Tracing output mode in VCD format?  0/1 (from --trace-vcd)
VM_TRACE_VCD = 1
# VPI enabled?  0/1 (from --vpi)
VM_VPI = 0

### Object file lists...
# Generated module classes, fast-path, compile with highest optimization
VM_CLASSES_FAST += \
  Vtb_pcie_datalink_layer \
  Vtb_pcie_datalink_layer___024root__0 \
  Vtb_pcie_datalink_layer___024root__1 \
  Vtb_pcie_datalink_layer__main \

# Generated module classes, non-fast-path, compile with low/medium optimization
VM_CLASSES_SLOW += \
  Vtb_pcie_datalink_layer__ConstPool__0__Slow \
  Vtb_pcie_datalink_layer___024root__Slow \
  Vtb_pcie_datalink_layer___024root__0__Slow \
  Vtb_pcie_datalink_layer___024root__1__Slow \
  Vtb_pcie_datalink_layer_pcie_config_reg_pkg__Slow \
  Vtb_pcie_datalink_layer_pcie_tlp_pkg__Slow \
  Vtb_pcie_datalink_layer_pcie_tlp_pkg__0__Slow \

# Generated support classes, fast-path, compile with highest optimization
VM_SUPPORT_FAST += \
  Vtb_pcie_datalink_layer__Trace__0 \

# Generated support classes, non-fast-path, compile with low/medium optimization
VM_SUPPORT_SLOW += \
  Vtb_pcie_datalink_layer__Syms__Slow \
  Vtb_pcie_datalink_layer__Trace__0__Slow \
  Vtb_pcie_datalink_layer__TraceDecls__0__Slow \

# Global classes, need linked once per executable, fast-path, compile with highest optimization
VM_GLOBAL_FAST += \
  verilated \
  verilated_vcd_c \
  verilated_threads \

# Global classes, need linked once per executable, non-fast-path, compile with low/medium optimization
VM_GLOBAL_SLOW += \

# Verilated -*- Makefile -*-
