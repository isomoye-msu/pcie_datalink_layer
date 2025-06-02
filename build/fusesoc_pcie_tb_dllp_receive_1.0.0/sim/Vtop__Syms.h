// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef VERILATED_VTOP__SYMS_H_
#define VERILATED_VTOP__SYMS_H_  // guard

#include "verilated.h"

// INCLUDE MODEL CLASS

#include "Vtop.h"

// INCLUDE MODULE CLASSES
#include "Vtop___024root.h"
#include "Vtop_pcie_phy_pkg.h"
#include "Vtop_pcie_datalink_pkg.h"

// DPI TYPES for DPI Export callbacks (Internal use)

// SYMS CLASS (contains all model state)
class Vtop__Syms final : public VerilatedSyms {
  public:
    // INTERNAL STATE
    Vtop* const __Vm_modelp;
    bool __Vm_activity = false;  ///< Used by trace routines to determine change occurred
    uint32_t __Vm_baseCode = 0;  ///< Used by trace routines when tracing multiple models
    VlDeleter __Vm_deleter;
    bool __Vm_didInit = false;

    // MODULE INSTANCE STATE
    Vtop___024root                 TOP;
    Vtop_pcie_datalink_pkg         TOP__pcie_datalink_pkg;
    Vtop_pcie_phy_pkg              TOP__pcie_phy_pkg;

    // SCOPE NAMES
    VerilatedScope __Vscope_TOP;
    VerilatedScope __Vscope_dllp_receive;
    VerilatedScope __Vscope_dllp_receive__axis_user_demux_inst;
    VerilatedScope __Vscope_dllp_receive__axis_user_demux_inst__dllp_axis_register_inst;
    VerilatedScope __Vscope_dllp_receive__axis_user_demux_inst__dllp_axis_register_inst__genblk1;
    VerilatedScope __Vscope_dllp_receive__axis_user_demux_inst__tlp_axis_register_inst;
    VerilatedScope __Vscope_dllp_receive__axis_user_demux_inst__tlp_axis_register_inst__genblk1;
    VerilatedScope __Vscope_dllp_receive__dllp2tlp_inst;
    VerilatedScope __Vscope_dllp_receive__dllp2tlp_inst__axis_register_inst;
    VerilatedScope __Vscope_dllp_receive__dllp2tlp_inst__axis_register_inst__genblk1;
    VerilatedScope __Vscope_dllp_receive__dllp2tlp_inst__axis_register_pipeline_inst;
    VerilatedScope __Vscope_dllp_receive__dllp2tlp_inst__axis_register_pipeline_inst__genblk1;
    VerilatedScope __Vscope_dllp_receive__dllp2tlp_inst__axis_register_pipeline_stage_2_inst;
    VerilatedScope __Vscope_dllp_receive__dllp2tlp_inst__axis_register_pipeline_stage_2_inst__genblk1;
    VerilatedScope __Vscope_dllp_receive__dllp2tlp_inst__byteswap;
    VerilatedScope __Vscope_dllp_receive__dllp2tlp_inst__byteswap__unnamedblk1;
    VerilatedScope __Vscope_dllp_receive__dllp2tlp_inst__dllp2tlp_fifo_inst;
    VerilatedScope __Vscope_dllp_receive__dllp2tlp_inst__tlp_crc16_inst;
    VerilatedScope __Vscope_dllp_receive__dllp2tlp_inst__tlp_crc16_inst__pcie_crc8_inst0;
    VerilatedScope __Vscope_dllp_receive__dllp2tlp_inst__tlp_crc16_inst__pcie_crc8_inst1;
    VerilatedScope __Vscope_dllp_receive__dllp2tlp_inst__tlp_crc16_inst__pcie_crc8_inst2;
    VerilatedScope __Vscope_dllp_receive__dllp2tlp_inst__tlp_crc16_inst__pcie_crc8_inst3;
    VerilatedScope __Vscope_dllp_receive__dllp_fc_update_inst;
    VerilatedScope __Vscope_dllp_receive__dllp_fc_update_inst__axis_register_pipeline_inst;
    VerilatedScope __Vscope_dllp_receive__dllp_fc_update_inst__axis_register_pipeline_inst__genblk1;
    VerilatedScope __Vscope_dllp_receive__dllp_fc_update_inst__byteswap;
    VerilatedScope __Vscope_dllp_receive__dllp_fc_update_inst__byteswap__unnamedblk1;
    VerilatedScope __Vscope_dllp_receive__dllp_fc_update_inst__dllp_crc_inst;
    VerilatedScope __Vscope_dllp_receive__dllp_fc_update_inst__dllp_crc_inst__crc_inst_0;
    VerilatedScope __Vscope_dllp_receive__dllp_fc_update_inst__dllp_crc_inst__crc_inst_1;
    VerilatedScope __Vscope_dllp_receive__dllp_fc_update_inst__dllp_crc_inst__crc_inst_2;
    VerilatedScope __Vscope_dllp_receive__dllp_fc_update_inst__dllp_crc_inst__crc_inst_3;
    VerilatedScope __Vscope_dllp_receive__dllp_fc_update_inst__dllp_crc_inst__unnamedblk1;
    VerilatedScope __Vscope_dllp_receive__dllp_handler_inst;
    VerilatedScope __Vscope_dllp_receive__dllp_handler_inst__axis_register_inst;
    VerilatedScope __Vscope_dllp_receive__dllp_handler_inst__axis_register_inst__genblk1;
    VerilatedScope __Vscope_dllp_receive__dllp_handler_inst__byteswap;
    VerilatedScope __Vscope_dllp_receive__dllp_handler_inst__byteswap__unnamedblk1;
    VerilatedScope __Vscope_dllp_receive__dllp_handler_inst__pcie_datalink_crc_inst;
    VerilatedScope __Vscope_dllp_receive__dllp_handler_inst__pcie_datalink_crc_inst__crc_inst_0;
    VerilatedScope __Vscope_dllp_receive__dllp_handler_inst__pcie_datalink_crc_inst__crc_inst_1;
    VerilatedScope __Vscope_dllp_receive__dllp_handler_inst__pcie_datalink_crc_inst__crc_inst_2;
    VerilatedScope __Vscope_dllp_receive__dllp_handler_inst__pcie_datalink_crc_inst__crc_inst_3;
    VerilatedScope __Vscope_dllp_receive__dllp_handler_inst__pcie_datalink_crc_inst__unnamedblk1;
    VerilatedScope __Vscope_pcie_datalink_pkg;
    VerilatedScope __Vscope_pcie_phy_pkg;

    // SCOPE HIERARCHY
    VerilatedHierarchy __Vhier;

    // CONSTRUCTORS
    Vtop__Syms(VerilatedContext* contextp, const char* namep, Vtop* modelp);
    ~Vtop__Syms();

    // METHODS
    const char* name() { return TOP.name(); }
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

#endif  // guard
