// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vtop.h for the primary calling header

#ifndef VERILATED_VTOP_PCIE_PHY_PKG_H_
#define VERILATED_VTOP_PCIE_PHY_PKG_H_  // guard

#include "verilated.h"

class Vtop__Syms;

class Vtop_pcie_phy_pkg final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    VlWide<4>/*127:0*/ GEN3_SDS;
    VlWide<4>/*127:0*/ gen_tsos__Vstatic__temp_os;
    VlWide<4>/*127:0*/ gen_eq_tsos__Vstatic__temp_os;
    VlWide<4>/*127:0*/ gen_idle__Vstatic__temp_os;
    VlUnpacked<IData/*23:0*/, 8> gen3_seed_values;

    // INTERNAL VARIABLES
    Vtop__Syms* const vlSymsp;

    // PARAMETERS
    static constexpr IData/*31:0*/ SkidBuffer = 2U;

    // CONSTRUCTORS
    Vtop_pcie_phy_pkg(Vtop__Syms* symsp, const char* v__name);
    ~Vtop_pcie_phy_pkg();
    VL_UNCOPYABLE(Vtop_pcie_phy_pkg);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);


#endif  // guard
