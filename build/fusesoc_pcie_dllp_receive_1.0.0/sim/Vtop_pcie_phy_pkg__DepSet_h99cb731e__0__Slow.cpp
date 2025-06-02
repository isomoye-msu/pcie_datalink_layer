// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtop.h for the primary calling header

#include "verilated.h"
#include "verilated_dpi.h"

#include "Vtop_pcie_phy_pkg.h"

VL_ATTR_COLD void Vtop_pcie_phy_pkg___eval_static__TOP__pcie_phy_pkg(Vtop_pcie_phy_pkg* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+        Vtop_pcie_phy_pkg___eval_static__TOP__pcie_phy_pkg\n"); );
    // Body
    vlSelf->gen3_seed_values[0U] = 0x1bb807U;
    vlSelf->gen3_seed_values[1U] = 0x277ceU;
    vlSelf->gen3_seed_values[2U] = 0x19cfc9U;
    vlSelf->gen3_seed_values[3U] = 0x10f12U;
    vlSelf->gen3_seed_values[4U] = 0x18c0dbU;
    vlSelf->gen3_seed_values[5U] = 0x1ec760U;
    vlSelf->gen3_seed_values[6U] = 0x607bbU;
    vlSelf->gen3_seed_values[7U] = 0x1dbfbcU;
    vlSelf->GEN3_SDS[0U] = 0x808d8b8eU;
    vlSelf->GEN3_SDS[1U] = 0x6eec887fU;
    vlSelf->GEN3_SDS[2U] = 0xccc6c925U;
    vlSelf->GEN3_SDS[3U] = 0x55474ec7U;
}

VL_ATTR_COLD void Vtop_pcie_phy_pkg___ctor_var_reset(Vtop_pcie_phy_pkg* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+        Vtop_pcie_phy_pkg___ctor_var_reset\n"); );
    // Body
    for (int __Vi0 = 0; __Vi0 < 8; ++__Vi0) {
        vlSelf->gen3_seed_values[__Vi0] = VL_RAND_RESET_I(24);
    }
    VL_RAND_RESET_W(128, vlSelf->GEN3_SDS);
    VL_RAND_RESET_W(128, vlSelf->gen_tsos__Vstatic__temp_os);
    VL_RAND_RESET_W(128, vlSelf->gen_eq_tsos__Vstatic__temp_os);
    VL_RAND_RESET_W(128, vlSelf->gen_idle__Vstatic__temp_os);
}
