// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtb_pcie_datalink_layer.h for the primary calling header

#include "Vtb_pcie_datalink_layer__pch.h"

VL_ATTR_COLD void Vtb_pcie_datalink_layer_pcie_tlp_pkg___eval_static__TOP__pcie_tlp_pkg(Vtb_pcie_datalink_layer_pcie_tlp_pkg* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+                Vtb_pcie_datalink_layer_pcie_tlp_pkg___eval_static__TOP__pcie_tlp_pkg\n"); );
    Vtb_pcie_datalink_layer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    const uint64_t __VscopeHash = VL_MURMUR64_HASH(vlSelf->vlNamep);
    VL_SCOPED_RAND_RESET_W(128, vlSelfRef.gen_cpld__Vstatic__unnamedblk1__DOT__temp_cpl, __VscopeHash, 15871515573885234300ull);
    VL_SCOPED_RAND_RESET_W(128, vlSelfRef.gen_cpl__Vstatic__unnamedblk2__DOT__temp_cpl, __VscopeHash, 4045171893048173736ull);
}
