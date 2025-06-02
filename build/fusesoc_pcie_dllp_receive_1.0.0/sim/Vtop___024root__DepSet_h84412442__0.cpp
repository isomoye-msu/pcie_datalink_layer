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
    vlSelf->__VicoTriggered.at(1U) = ((IData)(vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__crc_byte_select) 
                                      != (IData)(vlSelf->__Vtrigrprev__TOP__dllp_receive__DOT__dllp2tlp_inst__DOT__crc_byte_select));
    vlSelf->__Vtrigrprev__TOP__dllp_receive__DOT__dllp2tlp_inst__DOT__crc_byte_select 
        = vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__crc_byte_select;
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
    vlSelf->__VactTriggered.at(0U) = ((IData)(vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__crc_byte_select) 
                                      != (IData)(vlSelf->__Vtrigrprev__TOP__dllp_receive__DOT__dllp2tlp_inst__DOT__crc_byte_select));
    vlSelf->__VactTriggered.at(1U) = ((IData)(vlSelf->clk_i) 
                                      & (~ (IData)(vlSelf->__Vtrigrprev__TOP__clk_i)));
    vlSelf->__Vtrigrprev__TOP__dllp_receive__DOT__dllp2tlp_inst__DOT__crc_byte_select 
        = vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__crc_byte_select;
    vlSelf->__Vtrigrprev__TOP__clk_i = vlSelf->clk_i;
    if (VL_UNLIKELY((1U & (~ (IData)(vlSelf->__VactDidInit))))) {
        vlSelf->__VactDidInit = 1U;
        vlSelf->__VactTriggered.at(0U) = 1U;
    }
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vtop___024root___dump_triggers__act(vlSelf);
    }
#endif
}
