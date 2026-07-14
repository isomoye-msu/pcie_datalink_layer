// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef VERILATED_VTB_PCIE_DATALINK_LAYER__SYMS_H_
#define VERILATED_VTB_PCIE_DATALINK_LAYER__SYMS_H_  // guard

#include "verilated.h"

// INCLUDE MODEL CLASS

#include "Vtb_pcie_datalink_layer.h"

// INCLUDE MODULE CLASSES
#include "Vtb_pcie_datalink_layer___024root.h"
#include "Vtb_pcie_datalink_layer_pcie_config_reg_pkg.h"
#include "Vtb_pcie_datalink_layer_pcie_tlp_pkg.h"

// SYMS CLASS (contains all model state)
class alignas(VL_CACHE_LINE_BYTES) Vtb_pcie_datalink_layer__Syms final : public VerilatedSyms {
  public:
    // INTERNAL STATE
    Vtb_pcie_datalink_layer* const __Vm_modelp;
    bool __Vm_activity = false;  ///< Used by trace routines to determine change occurred
    uint32_t __Vm_baseCode = 0;  ///< Used by trace routines when tracing multiple models
    VlDeleter __Vm_deleter;
    bool __Vm_didInit = false;

    // MODULE INSTANCE STATE
    Vtb_pcie_datalink_layer___024root TOP;
    Vtb_pcie_datalink_layer_pcie_tlp_pkg TOP__pcie_tlp_pkg;

    // CONSTRUCTORS
    Vtb_pcie_datalink_layer__Syms(VerilatedContext* contextp, const char* namep, Vtb_pcie_datalink_layer* modelp);
    ~Vtb_pcie_datalink_layer__Syms();

    // METHODS
    const char* name() const { return TOP.vlNamep; }
};

#endif  // guard
