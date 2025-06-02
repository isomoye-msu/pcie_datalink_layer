// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtop.h for the primary calling header

#include "verilated.h"
#include "verilated_dpi.h"

#include "Vtop__Syms.h"
#include "Vtop___024root.h"

#ifdef VL_DEBUG
VL_ATTR_COLD void Vtop___024root___dump_triggers__ico(Vtop___024root* vlSelf);
#endif  // VL_DEBUG

void Vtop___024root___eval_triggers__ico(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_triggers__ico\n"); );
    // Body
    vlSelf->__VicoTriggered.at(0U) = (0U == vlSelf->__VicoIterCount);
    vlSelf->__VicoTriggered.at(1U) = ((IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_byte_select) 
                                      != (IData)(vlSelf->__Vtrigrprev__TOP__pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_byte_select));
    vlSelf->__Vtrigrprev__TOP__pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_byte_select 
        = vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_byte_select;
    if (VL_UNLIKELY((1U & (~ (IData)(vlSelf->__VicoDidInit))))) {
        vlSelf->__VicoDidInit = 1U;
        vlSelf->__VicoTriggered.at(1U) = 1U;
    }
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vtop___024root___dump_triggers__ico(vlSelf);
    }
#endif
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vtop___024root___dump_triggers__act(Vtop___024root* vlSelf);
#endif  // VL_DEBUG

void Vtop___024root___eval_triggers__act(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_triggers__act\n"); );
    // Body
    vlSelf->__VactTriggered.at(0U) = ((IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_byte_select) 
                                      != (IData)(vlSelf->__Vtrigrprev__TOP__pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_byte_select));
    vlSelf->__VactTriggered.at(1U) = vlSelf->pcie_datalink_layer__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_inst__DOT__stage_valid.neq(vlSelf->__Vtrigrprev__TOP__pcie_datalink_layer__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_inst__DOT__stage_valid);
    vlSelf->__VactTriggered.at(2U) = (vlSelf->pcie_datalink_layer__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_inst__DOT__stage_valid.neq(vlSelf->__Vtrigrprev__TOP__pcie_datalink_layer__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_inst__DOT__stage_valid) 
                                      | vlSelf->pcie_datalink_layer__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_inst__DOT__stage_enc.neq(vlSelf->__Vtrigrprev__TOP__pcie_datalink_layer__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_inst__DOT__stage_enc));
    vlSelf->__VactTriggered.at(3U) = vlSelf->pcie_datalink_layer__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__stage_valid.neq(vlSelf->__Vtrigrprev__TOP__pcie_datalink_layer__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__stage_valid);
    vlSelf->__VactTriggered.at(4U) = (vlSelf->pcie_datalink_layer__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__stage_valid.neq(vlSelf->__Vtrigrprev__TOP__pcie_datalink_layer__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__stage_valid) 
                                      | vlSelf->pcie_datalink_layer__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__stage_enc.neq(vlSelf->__Vtrigrprev__TOP__pcie_datalink_layer__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__stage_enc));
    vlSelf->__VactTriggered.at(5U) = (((IData)(vlSelf->clk_i) 
                                       & (~ (IData)(vlSelf->__Vtrigrprev__TOP__clk_i))) 
                                      | ((IData)(vlSelf->rst_i) 
                                         & (~ (IData)(vlSelf->__Vtrigrprev__TOP__rst_i))));
    vlSelf->__VactTriggered.at(6U) = ((IData)(vlSelf->clk_i) 
                                      & (~ (IData)(vlSelf->__Vtrigrprev__TOP__clk_i)));
    vlSelf->__Vtrigrprev__TOP__pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_byte_select 
        = vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_byte_select;
    vlSelf->__Vtrigrprev__TOP__pcie_datalink_layer__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_inst__DOT__stage_valid.assign(vlSelf->pcie_datalink_layer__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_inst__DOT__stage_valid);
    vlSelf->__Vtrigrprev__TOP__pcie_datalink_layer__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_inst__DOT__stage_enc.assign(vlSelf->pcie_datalink_layer__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_inst__DOT__stage_enc);
    vlSelf->__Vtrigrprev__TOP__pcie_datalink_layer__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__stage_valid.assign(vlSelf->pcie_datalink_layer__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__stage_valid);
    vlSelf->__Vtrigrprev__TOP__pcie_datalink_layer__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__stage_enc.assign(vlSelf->pcie_datalink_layer__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__stage_enc);
    vlSelf->__Vtrigrprev__TOP__clk_i = vlSelf->clk_i;
    vlSelf->__Vtrigrprev__TOP__rst_i = vlSelf->rst_i;
    if (VL_UNLIKELY((1U & (~ (IData)(vlSelf->__VactDidInit))))) {
        vlSelf->__VactDidInit = 1U;
        vlSelf->__VactTriggered.at(0U) = 1U;
        vlSelf->__VactTriggered.at(1U) = 1U;
        vlSelf->__VactTriggered.at(2U) = 1U;
        vlSelf->__VactTriggered.at(3U) = 1U;
        vlSelf->__VactTriggered.at(4U) = 1U;
    }
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vtop___024root___dump_triggers__act(vlSelf);
    }
#endif
}
