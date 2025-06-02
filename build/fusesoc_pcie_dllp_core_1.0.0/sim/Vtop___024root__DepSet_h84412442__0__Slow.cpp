// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtop.h for the primary calling header

#include "verilated.h"
#include "verilated_dpi.h"

#include "Vtop__Syms.h"
#include "Vtop___024root.h"

VL_ATTR_COLD void Vtop___024root___eval_static__TOP(Vtop___024root* vlSelf);
VL_ATTR_COLD void Vtop_pcie_phy_pkg___eval_static__TOP__pcie_phy_pkg(Vtop_pcie_phy_pkg* vlSelf);

VL_ATTR_COLD void Vtop___024root___eval_static(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_static\n"); );
    // Body
    Vtop___024root___eval_static__TOP(vlSelf);
    Vtop_pcie_phy_pkg___eval_static__TOP__pcie_phy_pkg((&vlSymsp->TOP__pcie_phy_pkg));
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vtop___024root___dump_triggers__stl(Vtop___024root* vlSelf);
#endif  // VL_DEBUG

VL_ATTR_COLD void Vtop___024root___eval_triggers__stl(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_triggers__stl\n"); );
    // Body
    vlSelf->__VstlTriggered.at(0U) = (0U == vlSelf->__VstlIterCount);
    vlSelf->__VstlTriggered.at(1U) = ((IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_byte_select) 
                                      != (IData)(vlSelf->__Vtrigrprev__TOP__pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_byte_select));
    vlSelf->__VstlTriggered.at(2U) = vlSelf->pcie_datalink_layer__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_inst__DOT__stage_valid.neq(vlSelf->__Vtrigrprev__TOP__pcie_datalink_layer__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_inst__DOT__stage_valid);
    vlSelf->__VstlTriggered.at(3U) = (vlSelf->pcie_datalink_layer__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_inst__DOT__stage_valid.neq(vlSelf->__Vtrigrprev__TOP__pcie_datalink_layer__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_inst__DOT__stage_valid) 
                                      | vlSelf->pcie_datalink_layer__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_inst__DOT__stage_enc.neq(vlSelf->__Vtrigrprev__TOP__pcie_datalink_layer__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_inst__DOT__stage_enc));
    vlSelf->__VstlTriggered.at(4U) = vlSelf->pcie_datalink_layer__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__stage_valid.neq(vlSelf->__Vtrigrprev__TOP__pcie_datalink_layer__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__stage_valid);
    vlSelf->__VstlTriggered.at(5U) = (vlSelf->pcie_datalink_layer__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__stage_valid.neq(vlSelf->__Vtrigrprev__TOP__pcie_datalink_layer__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__stage_valid) 
                                      | vlSelf->pcie_datalink_layer__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__stage_enc.neq(vlSelf->__Vtrigrprev__TOP__pcie_datalink_layer__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__stage_enc));
    vlSelf->__Vtrigrprev__TOP__pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_byte_select 
        = vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_byte_select;
    vlSelf->__Vtrigrprev__TOP__pcie_datalink_layer__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_inst__DOT__stage_valid.assign(vlSelf->pcie_datalink_layer__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_inst__DOT__stage_valid);
    vlSelf->__Vtrigrprev__TOP__pcie_datalink_layer__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_inst__DOT__stage_enc.assign(vlSelf->pcie_datalink_layer__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_inst__DOT__stage_enc);
    vlSelf->__Vtrigrprev__TOP__pcie_datalink_layer__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__stage_valid.assign(vlSelf->pcie_datalink_layer__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__stage_valid);
    vlSelf->__Vtrigrprev__TOP__pcie_datalink_layer__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__stage_enc.assign(vlSelf->pcie_datalink_layer__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__stage_enc);
    if (VL_UNLIKELY((1U & (~ (IData)(vlSelf->__VstlDidInit))))) {
        vlSelf->__VstlDidInit = 1U;
        vlSelf->__VstlTriggered.at(1U) = 1U;
        vlSelf->__VstlTriggered.at(2U) = 1U;
        vlSelf->__VstlTriggered.at(3U) = 1U;
        vlSelf->__VstlTriggered.at(4U) = 1U;
        vlSelf->__VstlTriggered.at(5U) = 1U;
    }
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vtop___024root___dump_triggers__stl(vlSelf);
    }
#endif
}
