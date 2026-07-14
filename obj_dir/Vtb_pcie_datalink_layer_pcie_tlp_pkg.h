// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vtb_pcie_datalink_layer.h for the primary calling header

#ifndef VERILATED_VTB_PCIE_DATALINK_LAYER_PCIE_TLP_PKG_H_
#define VERILATED_VTB_PCIE_DATALINK_LAYER_PCIE_TLP_PKG_H_  // guard

#include "verilated.h"


class Vtb_pcie_datalink_layer__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vtb_pcie_datalink_layer_pcie_tlp_pkg final {
  public:

    // DESIGN SPECIFIC STATE
    VlWide<4>/*127:0*/ gen_cpld__Vstatic__unnamedblk1__DOT__temp_cpl;
    VlWide<4>/*127:0*/ gen_cpl__Vstatic__unnamedblk2__DOT__temp_cpl;

    // INTERNAL VARIABLES
    Vtb_pcie_datalink_layer__Syms* vlSymsp;
    const char* vlNamep;

    // CONSTRUCTORS
    Vtb_pcie_datalink_layer_pcie_tlp_pkg();
    ~Vtb_pcie_datalink_layer_pcie_tlp_pkg();
    void ctor(Vtb_pcie_datalink_layer__Syms* symsp, const char* namep);
    void dtor();
    VL_UNCOPYABLE(Vtb_pcie_datalink_layer_pcie_tlp_pkg);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
