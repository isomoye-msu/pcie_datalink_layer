// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtop.h for the primary calling header

#include "verilated.h"
#include "verilated_dpi.h"

#include "Vtop__Syms.h"
#include "Vtop_pcie_phy_pkg.h"

// Parameter definitions for Vtop_pcie_phy_pkg
constexpr IData/*31:0*/ Vtop_pcie_phy_pkg::SkidBuffer;


void Vtop_pcie_phy_pkg___ctor_var_reset(Vtop_pcie_phy_pkg* vlSelf);

Vtop_pcie_phy_pkg::Vtop_pcie_phy_pkg(Vtop__Syms* symsp, const char* v__name)
    : VerilatedModule{v__name}
    , vlSymsp{symsp}
 {
    // Reset structure values
    Vtop_pcie_phy_pkg___ctor_var_reset(this);
}

void Vtop_pcie_phy_pkg::__Vconfigure(bool first) {
    if (false && first) {}  // Prevent unused
}

Vtop_pcie_phy_pkg::~Vtop_pcie_phy_pkg() {
}
