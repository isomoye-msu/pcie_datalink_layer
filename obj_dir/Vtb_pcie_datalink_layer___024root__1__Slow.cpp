// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtb_pcie_datalink_layer.h for the primary calling header

#include "Vtb_pcie_datalink_layer__pch.h"

VL_ATTR_COLD void Vtb_pcie_datalink_layer___024root___stl_sequent__TOP__1(Vtb_pcie_datalink_layer___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_pcie_datalink_layer___024root___stl_sequent__TOP__1\n"); );
    Vtb_pcie_datalink_layer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VdfgRegularize_h6e95ff9d_0_42;
    __VdfgRegularize_h6e95ff9d_0_42 = 0;
    CData/*0:0*/ __VdfgRegularize_h6e95ff9d_0_79;
    __VdfgRegularize_h6e95ff9d_0_79 = 0;
    CData/*0:0*/ __VdfgRegularize_h6e95ff9d_0_84;
    __VdfgRegularize_h6e95ff9d_0_84 = 0;
    CData/*0:0*/ __VdfgRegularize_h6e95ff9d_0_85;
    __VdfgRegularize_h6e95ff9d_0_85 = 0;
    CData/*0:0*/ __VdfgRegularize_h6e95ff9d_0_86;
    __VdfgRegularize_h6e95ff9d_0_86 = 0;
    CData/*0:0*/ __VdfgRegularize_h6e95ff9d_0_87;
    __VdfgRegularize_h6e95ff9d_0_87 = 0;
    // Body
    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__request 
        = ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__s_axis_tvalid) 
           | ((~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_reg)) 
              & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__s_axis_tvalid_reg)));
    __VdfgRegularize_h6e95ff9d_0_84 = (1U & ((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                                              >> 4U) 
                                             ^ (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_64)));
    __VdfgRegularize_h6e95ff9d_0_79 = (1U & ((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                                              >> 7U) 
                                             ^ (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_44)));
    __VdfgRegularize_h6e95ff9d_0_87 = (1U & ((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                                              >> 5U) 
                                             ^ (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_4)));
    __VdfgRegularize_h6e95ff9d_0_42 = (1U & ((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                                              >> 3U) 
                                             ^ (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_29)));
    __VdfgRegularize_h6e95ff9d_0_86 = (1U & (VL_REDXOR_8(
                                                         (0x00000030U 
                                                          & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data)) 
                                             ^ (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_29)));
    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__next_state 
        = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__curr_state;
    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_axis_tvalid = 0U;
    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__skid_axis_tready = 0U;
    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__crc_in_c 
        = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__crc_in_r;
    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_dw0 = 0U;
    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__ph_credits_consumed_c 
        = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__ph_credits_consumed_r;
    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__pd_credits_consumed_c 
        = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__pd_credits_consumed_r;
    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__nph_credits_consumed_c 
        = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__nph_credits_consumed_r;
    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__npd_credits_consumed_c 
        = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__npd_credits_consumed_r;
    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cplh_credits_consumed_c 
        = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cplh_credits_consumed_r;
    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cpld_credits_consumed_c 
        = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cpld_credits_consumed_r;
    if ((8U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__curr_state))) {
        if ((1U & (~ ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__curr_state) 
                      >> 2U)))) {
            if ((2U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__curr_state))) {
                if ((1U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__curr_state))) {
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__crc_in_c = 0xffffffffU;
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__next_state = 0U;
                } else {
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__skid_axis_tready = 0U;
                    if (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_output_register_inst__DOT__genblk1__DOT__s_axis_tready_reg) {
                        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_axis_tvalid = 1U;
                        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__next_state = 0x0bU;
                    }
                }
            } else if ((1U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__curr_state))) {
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__skid_axis_tready = 0U;
                if (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_output_register_inst__DOT__genblk1__DOT__s_axis_tready_reg) {
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_axis_tvalid = 1U;
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__next_state = 0x0aU;
                }
            } else {
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__skid_axis_tready = 0U;
                if (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_output_register_inst__DOT__genblk1__DOT__s_axis_tready_reg) {
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__crc_in_c 
                        = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_crc16_inst__DOT__crcOut;
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__next_state = 9U;
                }
            }
        }
    } else if ((4U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__curr_state))) {
        if ((2U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__curr_state))) {
            if ((1U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__curr_state))) {
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__skid_axis_tready 
                    = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_output_register_inst__DOT__genblk1__DOT__s_axis_tready_reg;
                if (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_output_register_inst__DOT__genblk1__DOT__s_axis_tready_reg) 
                     & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__m_axis_tvalid_reg))) {
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__crc_in_c 
                        = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__pcie_lcrc32_inst__DOT__crcOut;
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_axis_tvalid 
                        = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__m_axis_tvalid_reg;
                    if (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__m_axis_tlast_reg) {
                        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__next_state = 8U;
                    }
                }
            } else {
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_dw0 
                    = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__m_axis_tdata_reg;
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk6__DOT__has_cplh_credit = 0U;
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk6__DOT__has_cpld_credit = 0U;
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk6__DOT__data_length 
                    = ((0x00000300U & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_dw0 
                                       >> 8U)) | (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_dw0 
                                                  >> 0x00000018U));
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk6__DOT__data_credits_required 
                    = ((0U == ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk6__DOT__data_length) 
                               >> 2U)) ? 1U : ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk6__DOT__data_length) 
                                               >> 2U));
                if (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cplh_credit_limit_r) 
                     >= (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cplh_credits_consumed_r))) {
                    if ((1U <= (0x00000fffU & ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cplh_credit_limit_r) 
                                               - (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cplh_credits_consumed_r))))) {
                        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk6__DOT__has_cplh_credit = 1U;
                    }
                    if (((0U == (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cplh_credit_limit_r)) 
                         & (0U == (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cplh_credits_consumed_r)))) {
                        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk6__DOT__has_cplh_credit = 1U;
                    }
                } else if ((1U <= (0x00000fffU & ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cplh_credits_consumed_r) 
                                                  - (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cplh_credit_limit_r))))) {
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk6__DOT__has_cplh_credit = 1U;
                }
                if (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cpld_credit_limit_r) 
                     >= (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cpld_credits_consumed_r))) {
                    if (((0x0000ffffU & ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cpld_credit_limit_r) 
                                         - (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cpld_credits_consumed_r))) 
                         >= (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk6__DOT__data_credits_required))) {
                        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk6__DOT__has_cpld_credit = 1U;
                    }
                    if (((0U == (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cpld_credit_limit_r)) 
                         & (0U == (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cpld_credits_consumed_r)))) {
                        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk6__DOT__has_cpld_credit = 1U;
                    }
                } else if (((0x0000ffffU & ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cpld_credits_consumed_r) 
                                            - (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cpld_credit_limit_r))) 
                            >= (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk6__DOT__data_credits_required))) {
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk6__DOT__has_cpld_credit = 1U;
                }
                if (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk6__DOT__has_cplh_credit) 
                     & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk6__DOT__has_cpld_credit))) {
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cplh_credits_consumed_c 
                        = (0x000000ffU & ((IData)(1U) 
                                          + (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cplh_credits_consumed_r)));
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cpld_credits_consumed_c 
                        = (0x00000fffU & ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cpld_credits_consumed_r) 
                                          + (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk6__DOT__data_credits_required)));
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__crc_in_c 
                        = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__pcie_lcrc32_inst__DOT__crcOut;
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_axis_tvalid 
                        = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__m_axis_tvalid_reg;
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__skid_axis_tready = 1U;
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__next_state = 7U;
                }
            }
        } else if ((1U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__curr_state))) {
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk5__DOT__has_cplh_credit = 0U;
            if (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cplh_credit_limit_r) 
                 >= (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cplh_credits_consumed_r))) {
                if ((1U <= (0x00000fffU & ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cplh_credit_limit_r) 
                                           - (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cplh_credits_consumed_r))))) {
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cplh_credits_consumed_c 
                        = (0x000000ffU & ((IData)(1U) 
                                          + (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cplh_credits_consumed_r)));
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk5__DOT__has_cplh_credit = 1U;
                }
                if (((0U == (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cplh_credit_limit_r)) 
                     & (0U == (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cplh_credits_consumed_r)))) {
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk5__DOT__has_cplh_credit = 1U;
                }
            } else if ((1U <= (0x00000fffU & ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cplh_credits_consumed_r) 
                                              - (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cplh_credit_limit_r))))) {
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cplh_credits_consumed_c 
                    = (0x000000ffU & ((IData)(1U) + (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cplh_credits_consumed_r)));
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk5__DOT__has_cplh_credit = 1U;
            }
            if (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk5__DOT__has_cplh_credit) {
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__crc_in_c 
                    = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__pcie_lcrc32_inst__DOT__crcOut;
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_axis_tvalid 
                    = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__m_axis_tvalid_reg;
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__skid_axis_tready = 1U;
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__next_state = 7U;
            }
        } else {
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_dw0 
                = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__m_axis_tdata_reg;
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk4__DOT__has_ph_credit = 0U;
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk4__DOT__has_pd_credit = 0U;
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk4__DOT__data_length 
                = ((0x00000300U & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_dw0 
                                   >> 8U)) | (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_dw0 
                                              >> 0x00000018U));
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk4__DOT__data_credits_required 
                = ((0U == ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk4__DOT__data_length) 
                           >> 2U)) ? 1U : ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk4__DOT__data_length) 
                                           >> 2U));
            if (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__ph_credit_limit_r) 
                 >= (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__ph_credits_consumed_r))) {
                if ((1U <= (0x000000ffU & ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__ph_credit_limit_r) 
                                           - (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__ph_credits_consumed_r))))) {
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk4__DOT__has_ph_credit = 1U;
                }
            } else if ((1U <= (0x000000ffU & ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__ph_credits_consumed_r) 
                                              - (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__ph_credit_limit_r))))) {
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk4__DOT__has_ph_credit = 1U;
            }
            if (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__pd_credit_limit_r) 
                 >= (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__pd_credits_consumed_r))) {
                if (((0x0000ffffU & ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__pd_credit_limit_r) 
                                     - (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__pd_credits_consumed_r))) 
                     >= (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk4__DOT__data_credits_required))) {
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk4__DOT__has_pd_credit = 1U;
                }
            } else if (((0x0000ffffU & ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__pd_credits_consumed_r) 
                                        - (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__pd_credit_limit_r))) 
                        >= (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk4__DOT__data_credits_required))) {
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk4__DOT__has_pd_credit = 1U;
            }
            if (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk4__DOT__has_ph_credit) 
                 & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk4__DOT__has_pd_credit))) {
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__pd_credits_consumed_c 
                    = (0x00000fffU & ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__pd_credits_consumed_r) 
                                      + (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk4__DOT__data_credits_required)));
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__ph_credits_consumed_c 
                    = (0x000000ffU & ((IData)(1U) + (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__ph_credits_consumed_r)));
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__crc_in_c 
                    = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__pcie_lcrc32_inst__DOT__crcOut;
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_axis_tvalid 
                    = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__m_axis_tvalid_reg;
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__skid_axis_tready = 1U;
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__next_state = 7U;
            }
        }
    } else if ((2U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__curr_state))) {
        if ((1U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__curr_state))) {
            if (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__ph_credit_limit_r) 
                 >= (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__ph_credits_consumed_r))) {
                if ((1U <= (0x000000ffU & ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__ph_credit_limit_r) 
                                           - (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__ph_credits_consumed_r))))) {
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__ph_credits_consumed_c 
                        = (0x000000ffU & ((IData)(1U) 
                                          + (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__ph_credits_consumed_r)));
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk3__DOT__has_ph_credit = 1U;
                }
            } else if ((1U <= (0x000000ffU & ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__ph_credits_consumed_r) 
                                              - (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__ph_credit_limit_r))))) {
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__ph_credits_consumed_c 
                    = (0x000000ffU & ((IData)(1U) + (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__ph_credits_consumed_r)));
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk3__DOT__has_ph_credit = 1U;
            }
            if (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk3__DOT__has_ph_credit) {
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__crc_in_c 
                    = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__pcie_lcrc32_inst__DOT__crcOut;
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_axis_tvalid 
                    = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__m_axis_tvalid_reg;
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__skid_axis_tready = 1U;
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__next_state = 7U;
            }
        } else {
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk2__DOT__has_nph_credit = 0U;
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk2__DOT__has_npd_credit = 0U;
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk2__DOT__data_credits_required = 1U;
            if (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__nph_credit_limit_r) 
                 >= (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__nph_credits_consumed_r))) {
                if ((1U <= (0x000000ffU & ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__nph_credit_limit_r) 
                                           - (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__nph_credits_consumed_r))))) {
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk2__DOT__has_nph_credit = 1U;
                }
            } else if ((1U <= (0x000000ffU & ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__nph_credits_consumed_r) 
                                              - (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__nph_credit_limit_r))))) {
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk2__DOT__has_nph_credit = 1U;
            }
            if (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__npd_credit_limit_r) 
                 >= (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__npd_credits_consumed_r))) {
                if (((0x0000ffffU & ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__npd_credit_limit_r) 
                                     - (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__npd_credits_consumed_r))) 
                     >= (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk2__DOT__data_credits_required))) {
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk2__DOT__has_npd_credit = 1U;
                }
            } else if (((0x0000ffffU & ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__npd_credits_consumed_r) 
                                        - (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__npd_credit_limit_r))) 
                        >= (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk2__DOT__data_credits_required))) {
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk2__DOT__has_npd_credit = 1U;
            }
            if (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk2__DOT__has_nph_credit) 
                 & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk2__DOT__has_npd_credit))) {
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__nph_credits_consumed_c 
                    = (0x000000ffU & ((IData)(1U) + (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__nph_credits_consumed_r)));
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__npd_credits_consumed_c 
                    = (0x00000fffU & ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__npd_credits_consumed_r) 
                                      + (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk2__DOT__data_credits_required)));
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__crc_in_c 
                    = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__pcie_lcrc32_inst__DOT__crcOut;
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_axis_tvalid 
                    = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__m_axis_tvalid_reg;
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__skid_axis_tready = 1U;
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__next_state = 7U;
            }
        }
    } else if ((1U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__curr_state))) {
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk1__DOT__has_nph_credit = 0U;
        if (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__nph_credit_limit_r) 
             >= (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__nph_credits_consumed_r))) {
            if ((1U <= (0x000000ffU & ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__nph_credit_limit_r) 
                                       - (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__nph_credits_consumed_r))))) {
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__nph_credits_consumed_c 
                    = (0x000000ffU & ((IData)(1U) + (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__nph_credits_consumed_r)));
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk1__DOT__has_nph_credit = 1U;
            }
        } else if ((1U <= (0x000000ffU & ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__nph_credits_consumed_r) 
                                          - (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__nph_credit_limit_r))))) {
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__nph_credits_consumed_c 
                = (0x000000ffU & ((IData)(1U) + (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__nph_credits_consumed_r)));
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk1__DOT__has_nph_credit = 1U;
        }
        if (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk1__DOT__has_nph_credit) {
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__crc_in_c 
                = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__pcie_lcrc32_inst__DOT__crcOut;
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_axis_tvalid 
                = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__m_axis_tvalid_reg;
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__skid_axis_tready = 1U;
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__next_state = 7U;
        }
    } else if (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_output_register_inst__DOT__genblk1__DOT__s_axis_tready_reg) 
                & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__m_axis_tvalid_reg))) {
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_dw0 
            = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__m_axis_tdata_reg;
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__crc_in_c = 0xffffffffU;
        if (((((((0U == (0xdfU & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_dw0)) 
                 | (1U == (0xdfU & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_dw0))) 
                | (2U == (0x000000ffU & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_dw0))) 
               | (4U == (0x000000ffU & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_dw0))) 
              | (5U == (0x000000ffU & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_dw0))) 
             | (0x1bU == (0x000000ffU & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_dw0)))) {
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__next_state = 1U;
        } else if (((0x40U == (0xdfU & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_dw0)) 
                    | (0x70U == (0xf8U & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_dw0)))) {
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__next_state = 4U;
        } else if ((0x30U == (0xf8U & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_dw0))) {
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__next_state = 3U;
        } else if ((((((((0x42U == (0x000000ffU & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_dw0)) 
                         | (0x44U == (0x000000ffU & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_dw0))) 
                        | (0x45U == (0x000000ffU & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_dw0))) 
                       | (0x5bU == (0x000000ffU & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_dw0))) 
                      | (0x4cU == (0xdfU & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_dw0))) 
                     | (0x4dU == (0xdfU & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_dw0))) 
                    | (0x4eU == (0xdfU & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_dw0)))) {
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__next_state = 2U;
        } else if (((0x0aU == (0x000000ffU & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_dw0)) 
                    | (0x0bU == (0x000000ffU & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_dw0)))) {
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__next_state = 5U;
        } else if (((0x4aU == (0x000000ffU & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_dw0)) 
                    | (0x4bU == (0x000000ffU & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_dw0)))) {
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__next_state = 6U;
        }
    }
    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_inst__DOT__stage_valid[0U] 
        = (0U != (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__request));
    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_inst__DOT__stage_enc[0U] 
        = (1U & (~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__request)));
    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_next = 0U;
    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_valid_next = 0U;
    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_encoded_next = 0U;
    if (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_valid_reg) 
         & (~ (0U != ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_reg) 
                      & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__acknowledge)))))) {
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_next 
            = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_reg;
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_valid_next 
            = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_valid_reg;
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_encoded_next 
            = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_encoded_reg;
    } else if ((0U != (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__request))) {
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_next 
            = (3U & ((IData)(1U) << (1U & (~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__request)))));
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_valid_next = 1U;
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_encoded_next 
            = (1U & (~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__request)));
    }
    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__input_unencoded 
        = ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__mask_reg) 
           & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__request));
    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_crc16_inst__DOT__crcOut 
        = ((((((((2U & (((((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_44) 
                           ^ (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                              >> 0x0000000aU)) ^ VL_REDXOR_32(
                                                              (0x88208000U 
                                                               & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                         ^ VL_REDXOR_32((3U & ((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r 
                                                >> 0x00000018U) 
                                               ^ (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                                                  >> 6U))))) 
                        << 1U)) | (1U & ((((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_90) 
                                           ^ (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                                              >> 0x0000000bU)) 
                                          ^ VL_REDXOR_32(
                                                         (0x44104000U 
                                                          & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                                         ^ VL_REDXOR_32(
                                                        (3U 
                                                         & ((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r 
                                                             >> 0x00000017U) 
                                                            ^ 
                                                            (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                                                             >> 7U))))))) 
                << 6U) | (((2U & (((VL_REDXOR_16((0x00001044U 
                                                  & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data)) 
                                    ^ VL_REDXOR_32(
                                                   (0x22082000U 
                                                    & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                                   ^ VL_REDXOR_32((3U 
                                                   & ((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r 
                                                       >> 0x00000016U) 
                                                      ^ 
                                                      (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                                                       >> 8U))))) 
                                  << 1U)) | (1U & (
                                                   (VL_REDXOR_16(
                                                                 (0x00002088U 
                                                                  & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data)) 
                                                    ^ 
                                                    VL_REDXOR_32(
                                                                 (0x11041000U 
                                                                  & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                                                   ^ 
                                                   VL_REDXOR_32(
                                                                (3U 
                                                                 & ((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r 
                                                                     >> 0x00000015U) 
                                                                    ^ 
                                                                    (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                                                                     >> 9U))))))) 
                          << 4U)) | ((((2U & (((VL_REDXOR_16(
                                                             (0x00004110U 
                                                              & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data)) 
                                                ^ VL_REDXOR_32(
                                                               (0x08820800U 
                                                                & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                                               ^ VL_REDXOR_32(
                                                              (3U 
                                                               & ((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r 
                                                                   >> 0x00000014U) 
                                                                  ^ 
                                                                  (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                                                                   >> 0x0000000aU))))) 
                                              << 1U)) 
                                       | (1U & ((VL_REDXOR_16(
                                                              (0x00008220U 
                                                               & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data)) 
                                                 ^ 
                                                 VL_REDXOR_32(
                                                              (0x04410400U 
                                                               & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                                                ^ VL_REDXOR_32(
                                                               (3U 
                                                                & ((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r 
                                                                    >> 0x00000013U) 
                                                                   ^ 
                                                                   (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                                                                    >> 0x0000000bU))))))) 
                                      << 2U) | ((2U 
                                                 & ((((IData)(__VdfgRegularize_h6e95ff9d_0_79) 
                                                      ^ 
                                                      VL_REDXOR_32(
                                                                   (0x89000200U 
                                                                    & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                                                     ^ 
                                                     VL_REDXOR_32(
                                                                  (3U 
                                                                   & ((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r 
                                                                       >> 0x00000012U) 
                                                                      ^ 
                                                                      (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                                                                       >> 0x0000000cU))))) 
                                                    << 1U)) 
                                                | (1U 
                                                   & (((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_90) 
                                                       ^ 
                                                       VL_REDXOR_32(
                                                                    (0x44860100U 
                                                                     & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                                                      ^ 
                                                      VL_REDXOR_16(
                                                                   (0x00006100U 
                                                                    & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data))))))) 
             << 0x00000018U) | ((((((2U & (((((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_29) 
                                              ^ VL_REDXOR_16(
                                                             (0x00000240U 
                                                              & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data))) 
                                             ^ VL_REDXOR_32(
                                                            (0xa2400080U 
                                                             & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                                            ^ VL_REDXOR_32(
                                                           (3U 
                                                            & ((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r 
                                                                >> 0x00000010U) 
                                                               ^ 
                                                               (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                                                                >> 0x0000000eU))))) 
                                           << 1U)) 
                                    | (1U & (VL_REDXOR_16(
                                                          (0x0000805aU 
                                                           & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data)) 
                                             ^ VL_REDXOR_32(
                                                            (0x5a010040U 
                                                             & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))))) 
                                   << 6U) | (((2U & 
                                               ((((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_43) 
                                                  ^ 
                                                  VL_REDXOR_16(
                                                               (0x00000440U 
                                                                & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data))) 
                                                 ^ 
                                                 VL_REDXOR_32(
                                                              (0x26200020U 
                                                               & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                                                << 1U)) 
                                              | (1U 
                                                 & (VL_REDXOR_16(
                                                                 (0x000008c8U 
                                                                  & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data)) 
                                                    ^ 
                                                    VL_REDXOR_32(
                                                                 (0x13100010U 
                                                                  & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))))) 
                                             << 4U)) 
                                 | ((((2U & ((((IData)(__VdfgRegularize_h6e95ff9d_0_79) 
                                               ^ VL_REDXOR_16(
                                                              (0x00001100U 
                                                               & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data))) 
                                              ^ VL_REDXOR_32(
                                                             (0x89880008U 
                                                              & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                                             << 1U)) 
                                      | (1U & (((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_82) 
                                                ^ VL_REDXOR_16(
                                                               (0x00002300U 
                                                                & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data))) 
                                               ^ VL_REDXOR_32(
                                                              (0xc4c40004U 
                                                               & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))))) 
                                     << 2U) | ((2U 
                                                & (((((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_40) 
                                                      ^ 
                                                      VL_REDXOR_16(
                                                                   (0x00004600U 
                                                                    & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data))) 
                                                     ^ 
                                                     VL_REDXOR_32(
                                                                  (0x00620002U 
                                                                   & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                                                    ^ (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_39)) 
                                                   << 1U)) 
                                               | (1U 
                                                  & (VL_REDXOR_16(
                                                                  (0x00008c8cU 
                                                                   & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data)) 
                                                     ^ 
                                                     VL_REDXOR_32(
                                                                  (0x31310001U 
                                                                   & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))))))) 
                                << 0x00000010U)) | 
           (((((((2U & ((((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_4) 
                          ^ VL_REDXOR_16((0x00001dc0U 
                                          & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data))) 
                         ^ VL_REDXOR_32((0x93b80000U 
                                         & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                        << 1U)) | (1U & (VL_REDXOR_16(
                                                      (0x00003b93U 
                                                       & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data)) 
                                         ^ VL_REDXOR_32(
                                                        (0xc9dc0000U 
                                                         & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))))) 
                << 6U) | (((2U & ((VL_REDXOR_16((0x00007726U 
                                                 & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data)) 
                                   ^ VL_REDXOR_32((0x64ee0000U 
                                                   & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                                  << 1U)) | (1U & (
                                                   ((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_29) 
                                                    ^ 
                                                    VL_REDXOR_16(
                                                                 (0x0000ee48U 
                                                                  & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data))) 
                                                   ^ 
                                                   VL_REDXOR_32(
                                                                (0xb2770000U 
                                                                 & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))))) 
                          << 4U)) | ((((2U & ((VL_REDXOR_16(
                                                            (0x0000d84bU 
                                                             & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data)) 
                                               ^ VL_REDXOR_32(
                                                              (0xd21b0000U 
                                                               & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                                              << 1U)) 
                                       | (1U & ((((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_40) 
                                                  ^ 
                                                  VL_REDXOR_16(
                                                               (0x0000b400U 
                                                                & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data))) 
                                                 ^ 
                                                 VL_REDXOR_32(
                                                              (0x002d0000U 
                                                               & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                                                ^ (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_39)))) 
                                      << 2U) | ((2U 
                                                 & (((((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_83) 
                                                       ^ 
                                                       VL_REDXOR_16(
                                                                    (0x00006c00U 
                                                                     & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data))) 
                                                      ^ 
                                                      VL_REDXOR_32(
                                                                   (0x00360000U 
                                                                    & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                                                     ^ (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_80)) 
                                                    << 1U)) 
                                                | (1U 
                                                   & (VL_REDXOR_16(
                                                                   (0x0000d8b8U 
                                                                    & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data)) 
                                                      ^ 
                                                      VL_REDXOR_32(
                                                                   (0x1d1b0000U 
                                                                    & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))))))) 
             << 8U) | (((((2U & (((VL_REDXOR_16((0x0000b5a1U 
                                                 & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data)) 
                                   ^ VL_REDXOR_32((0x01ad0000U 
                                                   & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                                  ^ (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_81)) 
                                 << 1U)) | (1U & ((
                                                   (VL_REDXOR_16(
                                                                 (0x00006812U 
                                                                  & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data)) 
                                                    ^ 
                                                    VL_REDXOR_32(
                                                                 (0x00060000U 
                                                                  & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                                                   ^ (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_41)) 
                                                  ^ 
                                                  VL_REDXOR_32(
                                                               (0x0000000fU 
                                                                & ((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r 
                                                                    >> 0x00000014U) 
                                                                   ^ 
                                                                   (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                                                                    >> 7U))))))) 
                         << 6U) | (((2U & (((((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_43) 
                                              ^ VL_REDXOR_16(
                                                             (0x0000d000U 
                                                              & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data))) 
                                             ^ VL_REDXOR_32(
                                                            (0x24830000U 
                                                             & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                                            ^ VL_REDXOR_32(
                                                           (0x0000000fU 
                                                            & ((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r 
                                                                >> 0x00000013U) 
                                                               ^ 
                                                               (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                                                                >> 8U))))) 
                                           << 1U)) 
                                    | (1U & ((((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_4) 
                                               ^ VL_REDXOR_16(
                                                              (0x0000ba90U 
                                                               & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data))) 
                                              ^ VL_REDXOR_32(
                                                             (0x805d0000U 
                                                              & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                                             ^ (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_89)))) 
                                   << 4U)) | ((((2U 
                                                 & ((((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_82) 
                                                      ^ 
                                                      VL_REDXOR_16(
                                                                   (0x000071c0U 
                                                                    & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data))) 
                                                     ^ 
                                                     VL_REDXOR_32(
                                                                  (0xc78e0000U 
                                                                   & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                                                    << 1U)) 
                                                | (1U 
                                                   & (((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_40) 
                                                       ^ 
                                                       VL_REDXOR_16(
                                                                    (0x0000e380U 
                                                                     & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data))) 
                                                      ^ 
                                                      VL_REDXOR_32(
                                                                   (0x63c70000U 
                                                                    & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))))) 
                                               << 2U) 
                                              | ((2U 
                                                  & (((((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_83) 
                                                        ^ 
                                                        VL_REDXOR_16(
                                                                     (0x0000c300U 
                                                                      & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data))) 
                                                       ^ 
                                                       VL_REDXOR_32(
                                                                    (0x00c30000U 
                                                                     & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                                                      ^ (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_80)) 
                                                     << 1U)) 
                                                 | (1U 
                                                    & (VL_REDXOR_16(
                                                                    (0x00008268U 
                                                                     & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data)) 
                                                       ^ 
                                                       VL_REDXOR_32(
                                                                    (0x16410000U 
                                                                     & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r)))))))));
    __VdfgRegularize_h6e95ff9d_0_85 = (1U & ((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                                              >> 7U) 
                                             ^ (IData)(__VdfgRegularize_h6e95ff9d_0_86)));
    vlSelfRef.__VdfgRegularize_h6e95ff9d_0_21 = ((((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_axis_tvalid) 
                                                   << 4U) 
                                                  | (((2U 
                                                       & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__s_axis_tready)) 
                                                      | (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_output_register_inst__DOT__genblk1__DOT__s_axis_tready_reg)) 
                                                     << 2U)) 
                                                 | (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_output_register_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg) 
                                                     << 1U) 
                                                    | (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_output_register_inst__DOT__genblk1__DOT__m_axis_tvalid_reg)));
    vlSelfRef.__VdfgRegularize_h6e95ff9d_0_22 = ((((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__m_axis_tvalid_reg) 
                                                   << 4U) 
                                                  | (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__skid_axis_tready) 
                                                      << 3U) 
                                                     | ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_flow_inst__DOT__genblk1__DOT__s_axis_tready_reg) 
                                                        << 2U))) 
                                                 | (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_flow_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg) 
                                                     << 1U) 
                                                    | (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_flow_inst__DOT__genblk1__DOT__m_axis_tvalid_reg)));
    vlSelfRef.__VdfgRegularize_h6e95ff9d_0_23 = ((((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__m_axis_tvalid_reg) 
                                                   << 4U) 
                                                  | (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__skid_axis_tready) 
                                                      << 3U) 
                                                     | ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__s_axis_tready_reg) 
                                                        << 2U))) 
                                                 | (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg) 
                                                     << 1U) 
                                                    | (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__m_axis_tvalid_reg)));
    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__stage_valid[0U] 
        = (0U != (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__input_unencoded));
    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__stage_enc[0U] 
        = (1U & (~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__input_unencoded)));
    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__crcOut 
        = ((((((((2U & (((VL_REDXOR_32((0x0411011fU 
                                        & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data)) 
                          ^ VL_REDXOR_32((0xfb808820U 
                                          & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                         ^ VL_REDXOR_32((3U & ((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r 
                                                >> 8U) 
                                               ^ ((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                                                   >> 6U) 
                                                  ^ 
                                                  (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                                                   >> 0x00000016U)))))) 
                        << 1U)) | (1U & ((VL_REDXOR_32(
                                                       (0x0822023eU 
                                                        & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data)) 
                                          ^ VL_REDXOR_32(
                                                         (0x7dc04410U 
                                                          & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                                         ^ VL_REDXOR_32(
                                                        (3U 
                                                         & ((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                                                             >> 0x00000017U) 
                                                            ^ 
                                                            ((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r 
                                                              ^ vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data) 
                                                             >> 7U))))))) 
                << 6U) | (((2U & (((((IData)(__VdfgRegularize_h6e95ff9d_0_42) 
                                     ^ VL_REDXOR_32(
                                                    (0x10440440U 
                                                     & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data))) 
                                    ^ VL_REDXOR_32(
                                                   (0xbee02208U 
                                                    & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                                   ^ VL_REDXOR_32((3U 
                                                   & ((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r 
                                                       >> 6U) 
                                                      ^ 
                                                      ((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                                                        >> 0x00000018U) 
                                                       ^ 
                                                       ((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                                                         >> 4U) 
                                                        ^ 
                                                        (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                                                         >> 8U))))))) 
                                  << 1U)) | (1U & (
                                                   (((IData)(__VdfgRegularize_h6e95ff9d_0_84) 
                                                     ^ 
                                                     VL_REDXOR_32(
                                                                  (0x20880880U 
                                                                   & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data))) 
                                                    ^ 
                                                    VL_REDXOR_32(
                                                                 (0x5f701104U 
                                                                  & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                                                   ^ 
                                                   VL_REDXOR_32(
                                                                (3U 
                                                                 & ((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r 
                                                                     >> 5U) 
                                                                    ^ 
                                                                    ((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                                                                      >> 0x00000019U) 
                                                                     ^ 
                                                                     ((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                                                                       >> 5U) 
                                                                      ^ 
                                                                      (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                                                                       >> 9U))))))))) 
                          << 4U)) | ((((2U & ((((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_63) 
                                                ^ VL_REDXOR_32(
                                                               (0x4d101de0U 
                                                                & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data))) 
                                               ^ VL_REDXOR_32(
                                                              (0x2fb808b2U 
                                                               & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                                              << 1U)) 
                                       | (1U & (((IData)(__VdfgRegularize_h6e95ff9d_0_87) 
                                                 ^ 
                                                 VL_REDXOR_32(
                                                              (0x9a203bc0U 
                                                               & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data))) 
                                                ^ VL_REDXOR_32(
                                                               (0x97dc0459U 
                                                                & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))))) 
                                      << 2U) | ((2U 
                                                 & ((((IData)(__VdfgRegularize_h6e95ff9d_0_42) 
                                                      ^ 
                                                      VL_REDXOR_32(
                                                                   (0x30917600U 
                                                                    & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data))) 
                                                     ^ 
                                                     VL_REDXOR_32(
                                                                  (0xb06e890cU 
                                                                   & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                                                    << 1U)) 
                                                | (1U 
                                                   & ((((IData)(__VdfgRegularize_h6e95ff9d_0_84) 
                                                        ^ 
                                                        VL_REDXOR_32(
                                                                     (0x01228c00U 
                                                                      & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data))) 
                                                       ^ 
                                                       VL_REDXOR_32(
                                                                    (0x58374480U 
                                                                     & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                                                      ^ 
                                                      VL_REDXOR_32(
                                                                   (3U 
                                                                    & ((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r 
                                                                        >> 1U) 
                                                                       ^ 
                                                                       ((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                                                                         >> 0x0000000dU) 
                                                                        ^ 
                                                                        (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                                                                         >> 0x0000001dU)))))))))) 
             << 0x00000018U) | ((((((2U & (((((IData)(__VdfgRegularize_h6e95ff9d_0_86) 
                                              ^ VL_REDXOR_32(
                                                             (0x02451800U 
                                                              & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data))) 
                                             ^ VL_REDXOR_32(
                                                            (0xa01a2240U 
                                                             & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                                            ^ VL_REDXOR_32(
                                                           (3U 
                                                            & ((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r 
                                                                >> 0x0000001aU) 
                                                               ^ 
                                                               ((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r 
                                                                 >> 0x0000000fU) 
                                                                ^ 
                                                                (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r 
                                                                 ^ 
                                                                 ((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                                                                   >> 0x0000000eU) 
                                                                  ^ 
                                                                  (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                                                                   >> 0x0000001eU)))))))) 
                                           << 1U)) 
                                    | (1U & ((((IData)(__VdfgRegularize_h6e95ff9d_0_85) 
                                               ^ VL_REDXOR_32(
                                                              (0x8042b100U 
                                                               & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data))) 
                                              ^ VL_REDXOR_32(
                                                             (0xad8d4201U 
                                                              & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                                             ^ VL_REDXOR_32(
                                                            (3U 
                                                             & ((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                                                                 >> 0x00000013U) 
                                                                ^ 
                                                                (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r 
                                                                 >> 0x0000000bU))))))) 
                                   << 6U) | (((2U & 
                                               ((((IData)(__VdfgRegularize_h6e95ff9d_0_85) 
                                                  ^ 
                                                  VL_REDXOR_32(
                                                               (0x04646200U 
                                                                & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data))) 
                                                 ^ 
                                                 VL_REDXOR_32(
                                                              (0xad462620U 
                                                               & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                                                << 1U)) 
                                              | (1U 
                                                 & (((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_64) 
                                                     ^ 
                                                     VL_REDXOR_32(
                                                                  (0x08c8c560U 
                                                                   & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data))) 
                                                    ^ 
                                                    VL_REDXOR_32(
                                                                 (0x56a31310U 
                                                                  & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))))) 
                                             << 4U)) 
                                 | ((((2U & ((((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_63) 
                                               ^ VL_REDXOR_32(
                                                              (0x11918ac0U 
                                                               & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data))) 
                                              ^ VL_REDXOR_32(
                                                             (0x2b518988U 
                                                              & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                                             << 1U)) 
                                      | (1U & ((((IData)(__VdfgRegularize_h6e95ff9d_0_87) 
                                                 ^ 
                                                 VL_REDXOR_32(
                                                              (0x23201400U 
                                                               & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data))) 
                                                ^ VL_REDXOR_32(
                                                               (0x95a8c4c4U 
                                                                & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                                               ^ VL_REDXOR_32(
                                                              (3U 
                                                               & ((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                                                                   >> 7U) 
                                                                  ^ 
                                                                  (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                                                                   >> 0x00000010U))))))) 
                                     << 2U) | ((2U 
                                                & ((((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_88) 
                                                     ^ 
                                                     VL_REDXOR_32(
                                                                  (0x46462b40U 
                                                                   & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data))) 
                                                    ^ 
                                                    VL_REDXOR_32(
                                                                 (0xcad46262U 
                                                                  & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                                                   << 1U)) 
                                               | (1U 
                                                  & ((VL_REDXOR_32(
                                                                   (0x8c8056a6U 
                                                                    & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data)) 
                                                      ^ 
                                                      VL_REDXOR_32(
                                                                   (0x056a0131U 
                                                                    & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                                                     ^ 
                                                     VL_REDXOR_32(
                                                                  (3U 
                                                                   & ((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r 
                                                                       >> 0x0000001dU) 
                                                                      ^ 
                                                                      ((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                                                                        >> 0x00000012U) 
                                                                       ^ 
                                                                       (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r 
                                                                        >> 0x0000000cU)))))))))) 
                                << 0x00000010U)) | 
           (((((((2U & (((VL_REDXOR_32((0x1dc9ac92U 
                                        & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data)) 
                          ^ VL_REDXOR_32((0x003593b8U 
                                          & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                         ^ (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_41)) 
                        << 1U)) | (1U & (((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_43) 
                                          ^ VL_REDXOR_32(
                                                         (0x3b935900U 
                                                          & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data))) 
                                         ^ VL_REDXOR_32(
                                                        (0x249ac9dcU 
                                                         & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))))) 
                << 6U) | (((2U & ((((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_4) 
                                    ^ VL_REDXOR_32(
                                                   (0x7726b240U 
                                                    & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data))) 
                                   ^ VL_REDXOR_32((0x924d64eeU 
                                                   & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                                  << 1U)) | (1U & (
                                                   (((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_88) 
                                                     ^ 
                                                     VL_REDXOR_32(
                                                                  (0xee4d6480U 
                                                                   & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data))) 
                                                    ^ 
                                                    VL_REDXOR_32(
                                                                 (0x8026b277U 
                                                                  & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                                                   ^ (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_41)))) 
                          << 4U)) | ((((2U & (((((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_4) 
                                                 ^ 
                                                 VL_REDXOR_32(
                                                              (0xd8480800U 
                                                               & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data))) 
                                                ^ VL_REDXOR_32(
                                                               (0x9f10121bU 
                                                                & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                                               ^ VL_REDXOR_32(
                                                              (0x0000000fU 
                                                               & ((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r 
                                                                   >> 0x0000000eU) 
                                                                  ^ 
                                                                  ((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                                                                    >> 4U) 
                                                                   ^ 
                                                                   (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                                                                    >> 0x0000000eU)))))) 
                                              << 1U)) 
                                       | (1U & ((((IData)(__VdfgRegularize_h6e95ff9d_0_42) 
                                                  ^ 
                                                  VL_REDXOR_32(
                                                               (0xb4469020U 
                                                                & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data))) 
                                                 ^ 
                                                 VL_REDXOR_32(
                                                              (0x3009622dU 
                                                               & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                                                ^ (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_81)))) 
                                      << 2U) | ((2U 
                                                 & ((VL_REDXOR_32(
                                                                  (0x6c5c2184U 
                                                                   & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data)) 
                                                     ^ 
                                                     VL_REDXOR_32(
                                                                  (0x21843a36U 
                                                                   & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                                                    << 1U)) 
                                                | (1U 
                                                   & (((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_4) 
                                                       ^ 
                                                       VL_REDXOR_32(
                                                                    (0xd8b84300U 
                                                                     & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data))) 
                                                      ^ 
                                                      VL_REDXOR_32(
                                                                   (0x90c21d1bU 
                                                                    & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))))))) 
             << 8U) | (((((2U & ((VL_REDXOR_32((0xb5a187ccU 
                                                & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data)) 
                                  ^ VL_REDXOR_32((0x33e185adU 
                                                  & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                                 << 1U)) | (1U & ((
                                                   (VL_REDXOR_32(
                                                                 (0x68120e46U 
                                                                  & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data)) 
                                                    ^ 
                                                    VL_REDXOR_32(
                                                                 (0x00704906U 
                                                                  & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                                                   ^ (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_39)) 
                                                  ^ 
                                                  VL_REDXOR_32(
                                                               (0x0000000fU 
                                                                & ((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                                                                    >> 0x00000017U) 
                                                                   ^ 
                                                                   (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r 
                                                                    >> 4U))))))) 
                         << 6U) | (((2U & (((VL_REDXOR_32(
                                                          (0xd0241c8cU 
                                                           & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data)) 
                                             ^ VL_REDXOR_32(
                                                            (0x31382483U 
                                                             & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                                            ^ VL_REDXOR_32(
                                                           (0x0000000fU 
                                                            & ((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                                                                >> 0x00000018U) 
                                                               ^ 
                                                               (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r 
                                                                >> 3U))))) 
                                           << 1U)) 
                                    | (1U & (VL_REDXOR_32(
                                                          (0xba9938c7U 
                                                           & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data)) 
                                             ^ VL_REDXOR_32(
                                                            (0xe31c995dU 
                                                             & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))))) 
                                   << 4U)) | ((((2U 
                                                 & (((((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_44) 
                                                       ^ 
                                                       VL_REDXOR_32(
                                                                    (0x70037040U 
                                                                     & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data))) 
                                                      ^ 
                                                      VL_REDXOR_32(
                                                                   (0x8a0ec00eU 
                                                                    & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                                                     ^ 
                                                     VL_REDXOR_32(
                                                                  (0x0000000fU 
                                                                   & ((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                                                                       >> 0x00000015U) 
                                                                      ^ 
                                                                      (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r 
                                                                       >> 7U))))) 
                                                    << 1U)) 
                                                | (1U 
                                                   & ((VL_REDXOR_32(
                                                                    (0xe006e0a3U 
                                                                     & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data)) 
                                                       ^ 
                                                       VL_REDXOR_32(
                                                                    (0xc5076007U 
                                                                     & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                                                      ^ 
                                                      VL_REDXOR_32(
                                                                   (0x0000000fU 
                                                                    & ((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                                                                        >> 0x00000016U) 
                                                                       ^ 
                                                                       (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r 
                                                                        >> 6U))))))) 
                                               << 2U) 
                                              | ((2U 
                                                  & (((VL_REDXOR_32(
                                                                    (0xc35cc098U 
                                                                     & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data)) 
                                                       ^ 
                                                       VL_REDXOR_32(
                                                                    (0x00033ac3U 
                                                                     & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))) 
                                                      ^ (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_89)) 
                                                     << 1U)) 
                                                 | (1U 
                                                    & (VL_REDXOR_32(
                                                                    (0x826880efU 
                                                                     & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data)) 
                                                       ^ 
                                                       VL_REDXOR_32(
                                                                    (0xf7011641U 
                                                                     & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r)))))))));
    vlSelfRef.__VdfgRegularize_h6e95ff9d_0_62 = ((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_0)
                                                  ? vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__crcOut
                                                  : vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r);
    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_c 
        = ((0x00000010U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
            ? vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r
            : ((8U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                ? vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r
                : ((4U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                    ? ((2U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                        ? vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r
                        : (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r 
                           | ((- (IData)((1U & (~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))))) 
                              | (- (IData)((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__start_ack_r))))))
                    : ((2U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                        ? ((1U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                            ? vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r
                            : vlSelfRef.__VdfgRegularize_h6e95ff9d_0_62)
                        : ((1U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                            ? vlSelfRef.__VdfgRegularize_h6e95ff9d_0_62
                            : ((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_6)
                                ? vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_crc16_inst__DOT__crcOut
                                : vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))))));
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vtb_pcie_datalink_layer___024root___dump_triggers__stl(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag);
#endif  // VL_DEBUG
VL_ATTR_COLD bool Vtb_pcie_datalink_layer___024root___trigger_anySet__stl(const VlUnpacked<QData/*63:0*/, 1> &in);
VL_ATTR_COLD void Vtb_pcie_datalink_layer___024root___stl_sequent__TOP__0(Vtb_pcie_datalink_layer___024root* vlSelf);

VL_ATTR_COLD bool Vtb_pcie_datalink_layer___024root___eval_phase__stl(Vtb_pcie_datalink_layer___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_pcie_datalink_layer___024root___eval_phase__stl\n"); );
    Vtb_pcie_datalink_layer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VstlExecute;
    // Body
    {
        // Inlined CFunc: _eval_triggers_vec__stl
        vlSelfRef.__VstlTriggered[0U] = ((0xfffffffffffffffeULL 
                                          & vlSelfRef.__VstlTriggered[0U]) 
                                         | (IData)((IData)(vlSelfRef.__VstlFirstIteration)));
    }
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vtb_pcie_datalink_layer___024root___dump_triggers__stl(vlSelfRef.__VstlTriggered, "stl"s);
    }
#endif
    __VstlExecute = Vtb_pcie_datalink_layer___024root___trigger_anySet__stl(vlSelfRef.__VstlTriggered);
    if (__VstlExecute) {
        {
            // Inlined CFunc: _eval_stl
            if ((1ULL & vlSelfRef.__VstlTriggered[0U])) {
                Vtb_pcie_datalink_layer___024root___stl_sequent__TOP__0(vlSelf);
                {
                    // Inlined CFunc: __Vm_traceActivitySetAll
                    vlSelfRef.__Vm_traceActivity[0U] = 1U;
                    vlSelfRef.__Vm_traceActivity[1U] = 1U;
                    vlSelfRef.__Vm_traceActivity[2U] = 1U;
                    vlSelfRef.__Vm_traceActivity[3U] = 1U;
                }
                Vtb_pcie_datalink_layer___024root___stl_sequent__TOP__1(vlSelf);
            }
        }
    }
    return (__VstlExecute);
}

bool Vtb_pcie_datalink_layer___024root___trigger_anySet__act(const VlUnpacked<QData/*63:0*/, 1> &in);

#ifdef VL_DEBUG
VL_ATTR_COLD void Vtb_pcie_datalink_layer___024root___dump_triggers__act(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_pcie_datalink_layer___024root___dump_triggers__act\n"); );
    // Body
    if ((1U & (~ (IData)(Vtb_pcie_datalink_layer___024root___trigger_anySet__act(triggers))))) {
        VL_DBG_MSGS("         No '" + tag + "' region triggers active\n");
    }
    if ((1U & (IData)(triggers[0U]))) {
        VL_DBG_MSGS("         '" + tag + "' region trigger index 0 is active: @(posedge tb_pcie_datalink_layer.clk)\n");
    }
    if ((1U & (IData)((triggers[0U] >> 1U)))) {
        VL_DBG_MSGS("         '" + tag + "' region trigger index 1 is active: @(posedge tb_pcie_datalink_layer.rst)\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void Vtb_pcie_datalink_layer___024root___ctor_var_reset(Vtb_pcie_datalink_layer___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_pcie_datalink_layer___024root___ctor_var_reset\n"); );
    Vtb_pcie_datalink_layer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    const uint64_t __VscopeHash = VL_MURMUR64_HASH(vlSelf->vlNamep);
    vlSelf->tb_pcie_datalink_layer__DOT__clk = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 11985642729520575664ull);
    vlSelf->tb_pcie_datalink_layer__DOT__rst = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 4160427883651076397ull);
    vlSelf->tb_pcie_datalink_layer__DOT__s_axis_tlpin_tdata = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 1802434097389926726ull);
    vlSelf->tb_pcie_datalink_layer__DOT__s_axis_tlpin_tkeep = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 5881746765719067152ull);
    vlSelf->tb_pcie_datalink_layer__DOT__s_axis_tlpin_tvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 16567539714478613259ull);
    vlSelf->tb_pcie_datalink_layer__DOT__s_axis_tlpin_tlast = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 1725819395651214704ull);
    vlSelf->tb_pcie_datalink_layer__DOT__s_axis_tlpin_tuser = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 5760187320264905934ull);
    vlSelf->tb_pcie_datalink_layer__DOT__m_axis_tlpout_tready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 7287059696239248641ull);
    vlSelf->tb_pcie_datalink_layer__DOT__s_axis_phy2dllp_tdata = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 7397464255017657841ull);
    vlSelf->tb_pcie_datalink_layer__DOT__s_axis_phy2dllp_tkeep = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 4275056714339451124ull);
    vlSelf->tb_pcie_datalink_layer__DOT__s_axis_phy2dllp_tvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 8397035290470214554ull);
    vlSelf->tb_pcie_datalink_layer__DOT__s_axis_phy2dllp_tlast = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 15437459558551637870ull);
    vlSelf->tb_pcie_datalink_layer__DOT__s_axis_phy2dllp_tuser = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 14302796962635422604ull);
    vlSelf->tb_pcie_datalink_layer__DOT__s_axis_phy2dllp_tready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13209372277174108455ull);
    vlSelf->tb_pcie_datalink_layer__DOT__m_axis_dllp2phy_tready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12402077997062274438ull);
    vlSelf->tb_pcie_datalink_layer__DOT__s_axis_phy2tlp_tdata = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 3056903515587160804ull);
    vlSelf->tb_pcie_datalink_layer__DOT__s_axis_phy2tlp_tkeep = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 13227556541522755341ull);
    vlSelf->tb_pcie_datalink_layer__DOT__s_axis_phy2tlp_tvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 7108938603254951526ull);
    vlSelf->tb_pcie_datalink_layer__DOT__s_axis_phy2tlp_tlast = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9575756024266582460ull);
    vlSelf->tb_pcie_datalink_layer__DOT__s_axis_phy2tlp_tuser = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 16260446714093419866ull);
    vlSelf->tb_pcie_datalink_layer__DOT__s_axis_phy2tlp_tready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 3979700739735423452ull);
    vlSelf->tb_pcie_datalink_layer__DOT__m_axis_tlp2phy_tdata = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 11133274396872586028ull);
    vlSelf->tb_pcie_datalink_layer__DOT__m_axis_tlp2phy_tkeep = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 6985495576495570943ull);
    vlSelf->tb_pcie_datalink_layer__DOT__m_axis_tlp2phy_tvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 16951653941359823600ull);
    vlSelf->tb_pcie_datalink_layer__DOT__m_axis_tlp2phy_tlast = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13664255232284691132ull);
    vlSelf->tb_pcie_datalink_layer__DOT__m_axis_tlp2phy_tuser = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 1556243915674471741ull);
    vlSelf->tb_pcie_datalink_layer__DOT__m_axis_tlp2phy_tready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9386739241350890686ull);
    vlSelf->tb_pcie_datalink_layer__DOT__phy_link_up = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9884603202720112494ull);
    vlSelf->tb_pcie_datalink_layer__DOT__bus_num = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 6254083871724047061ull);
    vlSelf->tb_pcie_datalink_layer__DOT__status_error_cor = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 5549080457321739221ull);
    vlSelf->tb_pcie_datalink_layer__DOT__status_error_uncor = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12213366501631790372ull);
    vlSelf->tb_pcie_datalink_layer__DOT__rx_cpl_stall = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13936040754733182486ull);
    vlSelf->tb_pcie_datalink_layer__DOT__idle_valid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 6434260829732804006ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__seq_num = VL_SCOPED_RAND_RESET_I(12, __VscopeHash, 17598636410692463896ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__seq_num_vld = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 14560389686037464816ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__seq_num_acknack = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 17579714686485823899ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__init_ack = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 14953729970905863944ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__ack_nack = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 10225249304624506168ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__ack_nack_vld = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 1077654354747933ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__ack_seq_num = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 10814230128278998485ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__fc1_values_stored = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 7844394043838182774ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__fc2_values_stored = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 7977032316883371257ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__fc2_values_sent = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 824910907994609571ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__fc2_values_stored_reg = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12214836500543121696ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_ready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 8024279882944758643ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__tlp_ready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 18359313669992555726ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_tdata = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 1708911651412922590ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_tkeep = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 4371798536404028011ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_tvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 6107308259865609944ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_tlast = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12045892281364120944ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_tuser = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 6443700471114176162ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_tready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 7811923100897953043ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__byte_offset_00.__PVT__Vendor_ID.__PVT__value = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__byte_offset_00.__PVT__Device_ID.__PVT__value = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__byte_offset_04.__PVT__bus_master_enable.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__byte_offset_04.__PVT__special_cycle_enable.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__byte_offset_04.__PVT__memory_write_invalidate.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__byte_offset_04.__PVT__vga_palette_snoop.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__byte_offset_04.__PVT__parity_error_response.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__byte_offset_04.__PVT__idsel_step_wait_cycle_control.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__byte_offset_04.__PVT__SERR_Enable.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__byte_offset_04.__PVT__fast_b2b_transactions_enable.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__byte_offset_04.__PVT__interrupt_disable.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__byte_offset_04.__PVT__rsvd.__PVT__value = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__byte_offset_04.__PVT__interrupt_status.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__byte_offset_04.__PVT__capabilities_list.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__byte_offset_04.__PVT__sixtysix_mhz_capable.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__byte_offset_04.__PVT__fast_b2b_transactions_capable.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__byte_offset_04.__PVT__master_data_parity_error.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__byte_offset_04.__PVT__devsel_timing.__PVT__value = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__byte_offset_04.__PVT__signaled_target_abort.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__byte_offset_04.__PVT__received_target_abort.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__byte_offset_04.__PVT__received_master_abort.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__byte_offset_04.__PVT__signaled_system_error.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__byte_offset_04.__PVT__detected_parity_error.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__byte_offset_08.__PVT__Revision_ID.__PVT__value = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__byte_offset_08.__PVT__Class_Code.__PVT__value = VL_SCOPED_RAND_RESET_I(24, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__byte_offset_0C.__PVT__cache_line_size_register.__PVT__value = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__byte_offset_0C.__PVT__latency_timer_register.__PVT__value = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__byte_offset_0C.__PVT__interrupt_line_register.__PVT__value = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__byte_offset_0C.__PVT__interrupt_pin_register.__PVT__value = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__base_address_register_0.__PVT__region_type.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__base_address_register_0.__PVT__locatable.__PVT__value = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__base_address_register_0.__PVT__prefetchable.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__base_address_register_0.__PVT__base_adress.__PVT__value = VL_SCOPED_RAND_RESET_I(28, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__base_ddress_register_1.__PVT__region_type.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__base_ddress_register_1.__PVT__locatable.__PVT__value = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__base_ddress_register_1.__PVT__prefetchable.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__base_ddress_register_1.__PVT__base_adress.__PVT__value = VL_SCOPED_RAND_RESET_I(28, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__base_ddress_register_2.__PVT__BAR.__PVT__value = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__base_ddress_register_3.__PVT__BAR.__PVT__value = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__base_ddress_register_4.__PVT__BAR.__PVT__value = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__base_ddress_register_5.__PVT__BAR.__PVT__value = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__cardbus_cis_pointer.__PVT__word.__PVT__value = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__byte_offset_2C.__PVT__Vendor_ID.__PVT__value = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__byte_offset_2C.__PVT__Device_ID.__PVT__value = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__capabilities_pointer.__PVT__capabilities_ptr.__PVT__value = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__byte_offset_3C.__PVT__interrupt_line.__PVT__value = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__byte_offset_3C.__PVT__interrupt_pin.__PVT__value = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__byte_offset_3C.__PVT__min_gnt.__PVT__value = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__byte_offset_3C.__PVT__max_lat.__PVT__value = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__capabilities_power_mngt_pointer.__PVT__capabilities_id.__PVT__value = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__capabilities_power_mngt_pointer.__PVT__next_cap_ptr.__PVT__value = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__capabilities_power_mngt_pointer.__PVT__version.__PVT__value = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__capabilities_power_mngt_pointer.__PVT__pme_clock.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__capabilities_power_mngt_pointer.__PVT__dev_spec_init.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__capabilities_power_mngt_pointer.__PVT__aux_current.__PVT__value = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__capabilities_power_mngt_pointer.__PVT__d1_support.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__capabilities_power_mngt_pointer.__PVT__d2_support.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__capabilities_power_mngt_pointer.__PVT__pme_support.__PVT__value = VL_SCOPED_RAND_RESET_I(5, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__power_management_pointer.__PVT__power_state.__PVT__value = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__power_management_pointer.__PVT__pme_enable.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__power_management_pointer.__PVT__data_select.__PVT__value = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__power_management_pointer.__PVT__data_scale.__PVT__value = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__power_management_pointer.__PVT__pme_status.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__power_management_pointer.__PVT__b2_b3_support.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__power_management_pointer.__PVT__bus_pwr_clk_ctrl_en.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__power_management_pointer.__PVT__data.__PVT__value = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__capabilities_power_na_pointer.__PVT__capabilities_id.__PVT__value = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__capabilities_power_na_pointer.__PVT__next_cap_ptr.__PVT__value = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__capabilities_power_na_pointer.__PVT__capability_version.__PVT__value = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__capabilities_power_na_pointer.__PVT__device_port_type.__PVT__value = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__capabilities_power_na_pointer.__PVT__slot_implemented.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__capabilities_power_na_pointer.__PVT__interrupt_msg_number.__PVT__value = VL_SCOPED_RAND_RESET_I(5, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__capabilities_power_na_pointer.__PVT__Undefined.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__capabilities_power_na_pointer.__PVT__RsvdP.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__link_control_3_register.__PVT__perform_equalization.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__link_control_3_register.__PVT__link_eq_req_intr_en.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__lane_error_status_register.__PVT__lane_error.__PVT__value = VL_SCOPED_RAND_RESET_I(5, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__lane_eq_ctrl_register.__PVT__downstream_tx_preset.__PVT__value = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__lane_eq_ctrl_register.__PVT__downstream_rx_preset_hint.__PVT__value = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__lane_eq_ctrl_register.__PVT__upstream_tx_preset.__PVT__value = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__lane_eq_ctrl_register.__PVT__upstream_rx_preset_hint.__PVT__value = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out.__PVT__extended_capabilities.__PVT__ext_cap.__PVT__value = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 13715086270957305893ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__rx_tlp_ready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 4399983558465987286ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__s_axil_awvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 16433761099503276138ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__s_axil_awprot = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 16309921622733978216ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__s_axil_wvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 7337853975074842257ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__s_axil_bready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 16642953376666778924ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__s_axil_bvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 18002424990685896520ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__s_axil_arvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 17257643014632896034ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__s_axil_arprot = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 5504246104561215628ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__s_axil_rready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 14762336561099183187ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__s_axil_rvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 7973489211315372920ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__tlp_dw0 = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 16892672053906448729ull);
    VL_SCOPED_RAND_RESET_W(165, vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__D, __VscopeHash, 6533241075931590830ull);
    VL_SCOPED_RAND_RESET_W(165, vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__Q, __VscopeHash, 8908277731273818833ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__tlp_axis_tvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 1052849347835502293ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__cfg_axis_tvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 8736925670105665579ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__skid_axis_tready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 15805796708109411786ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__cfg_fifo_inst__DOT__s_axis_tid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12733947148519307932ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__cfg_fifo_inst__DOT__s_axis_tdest = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 1850766997134185306ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__tlp_fifo_inst__DOT__s_axis_tid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 10699369860622364581ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__tlp_fifo_inst__DOT__s_axis_tdest = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 325193704578877894ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__D.__PVT__state = VL_SCOPED_RAND_RESET_I(5, __VscopeHash, 9884365669070755343ull);
    VL_SCOPED_RAND_RESET_W(128, vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__D.__PVT__tlp_hdr, __VscopeHash, 9884365669070755343ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__D.__PVT__word_count = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 9884365669070755343ull);
    VL_SCOPED_RAND_RESET_W(128, vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__D.__PVT__cpl_tlp, __VscopeHash, 9884365669070755343ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__D.__PVT__cfg_bus_number = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 9884365669070755343ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__D.__PVT__cfg_device_number = VL_SCOPED_RAND_RESET_I(5, __VscopeHash, 9884365669070755343ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__D.__PVT__cfg_function_number = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 9884365669070755343ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__D.__PVT__tlp_dw0 = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 9884365669070755343ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__D.__PVT__tlp_is_3dw = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9884365669070755343ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__D.__PVT__tlp_is_sop = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9884365669070755343ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__D.__PVT__tlp_is_pd = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9884365669070755343ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__D.__PVT__tlp_is_eop = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9884365669070755343ull);
    VL_SCOPED_RAND_RESET_W(256, vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__D.__PVT__tlp_data, __VscopeHash, 9884365669070755343ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__D.__PVT__length = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 9884365669070755343ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__Q.__PVT__state = VL_SCOPED_RAND_RESET_I(5, __VscopeHash, 7952520716387611022ull);
    VL_SCOPED_RAND_RESET_W(128, vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__Q.__PVT__tlp_hdr, __VscopeHash, 7952520716387611022ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__Q.__PVT__word_count = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 7952520716387611022ull);
    VL_SCOPED_RAND_RESET_W(128, vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__Q.__PVT__cpl_tlp, __VscopeHash, 7952520716387611022ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__Q.__PVT__cfg_bus_number = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 7952520716387611022ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__Q.__PVT__cfg_device_number = VL_SCOPED_RAND_RESET_I(5, __VscopeHash, 7952520716387611022ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__Q.__PVT__cfg_function_number = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 7952520716387611022ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__Q.__PVT__tlp_dw0 = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 7952520716387611022ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__Q.__PVT__tlp_is_3dw = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 7952520716387611022ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__Q.__PVT__tlp_is_sop = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 7952520716387611022ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__Q.__PVT__tlp_is_pd = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 7952520716387611022ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__Q.__PVT__tlp_is_eop = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 7952520716387611022ull);
    VL_SCOPED_RAND_RESET_W(256, vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__Q.__PVT__tlp_data, __VscopeHash, 7952520716387611022ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__Q.__PVT__length = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 7952520716387611022ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__s_axis_tdata = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 15825601228041017545ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__s_axis_tkeep = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 9815844282624051268ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__s_axis_tvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 7097683919570370580ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__s_axis_tlast = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 6210666075232323552ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__s_axis_tuser = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 18194472825352526981ull);
    VL_SCOPED_RAND_RESET_W(425, vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__D, __VscopeHash, 3683621438240907566ull);
    VL_SCOPED_RAND_RESET_W(425, vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__Q, __VscopeHash, 5906117578731498718ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__tlp_dw0 = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 13052811598030883313ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__skid_axis_tready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9879098248318610381ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__tlp_byte_swapped = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 10474737949050953332ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__tlp_tdata = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 15275920263663075143ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__tlp_strb = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 16302592873471331547ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__tlp_valid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 11705357453790488270ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__tlp_eop = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13830640969855090568ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__tlp_sop = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 18198607186532862696ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__rst = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9768624558706124180ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__s_axil_awready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 8209442028832028509ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__s_axil_wready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 15478572335053696465ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__s_axil_arready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 11019505367953578817ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__cpuif_req = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 6115117809594303300ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__cpuif_req_is_wr = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 2664779377029271402ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__cpuif_addr = VL_SCOPED_RAND_RESET_I(9, __VscopeHash, 8546021031768841158ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__cpuif_wr_biten = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 8991887423315167416ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__cpuif_rd_ack = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 4576499831366061616ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__cpuif_wr_ack = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9975002818859618716ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_n_in_flight = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 16737362419413257641ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_prev_was_rd = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 5661390178113819968ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_arvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 11044111247209348720ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_araddr = VL_SCOPED_RAND_RESET_I(9, __VscopeHash, 7886034215366263442ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_ar_accept = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 902539654304853944ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_awvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 4102402230301395044ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_awaddr = VL_SCOPED_RAND_RESET_I(9, __VscopeHash, 13702917995098609271ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_wvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 17236408029542272517ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_wdata = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 13996600030582720388ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_wstrb = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 8989438203492334216ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_aw_accept = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 743677931591930602ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_resp_acked = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 18439983642945978432ull);
    for (int __Vi0 = 0; __Vi0 < 2; ++__Vi0) {
        vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_resp_is_wr[__Vi0] = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9467452402064678916ull);
    }
    for (int __Vi0 = 0; __Vi0 < 2; ++__Vi0) {
        vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_resp_err[__Vi0] = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 15936849867175188015ull);
    }
    for (int __Vi0 = 0; __Vi0 < 2; ++__Vi0) {
        vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_resp_rdata[__Vi0] = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 15958089298664545104ull);
    }
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_resp_wptr = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 4924429463016616651ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_resp_rptr = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 17725735550400896786ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb.__PVT__byte_offset_00 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12793073431308792199ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb.__PVT__byte_offset_04 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12793073431308792199ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb.__PVT__byte_offset_08 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12793073431308792199ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb.__PVT__byte_offset_0C = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12793073431308792199ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb.__PVT__base_address_register_0 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12793073431308792199ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb.__PVT__base_ddress_register_1 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12793073431308792199ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb.__PVT__base_ddress_register_2 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12793073431308792199ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb.__PVT__base_ddress_register_3 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12793073431308792199ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb.__PVT__base_ddress_register_4 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12793073431308792199ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb.__PVT__base_ddress_register_5 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12793073431308792199ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb.__PVT__cardbus_cis_pointer = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12793073431308792199ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb.__PVT__byte_offset_2C = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12793073431308792199ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb.__PVT__capabilities_pointer = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12793073431308792199ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb.__PVT__byte_offset_3C = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12793073431308792199ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb.__PVT__capabilities_power_mngt_pointer = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12793073431308792199ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb.__PVT__power_management_pointer = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12793073431308792199ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb.__PVT__capabilities_power_na_pointer = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12793073431308792199ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb.__PVT__link_control_3_register = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12793073431308792199ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb.__PVT__lane_error_status_register = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12793073431308792199ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb.__PVT__lane_eq_ctrl_register = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12793073431308792199ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb.__PVT__extended_capabilities = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12793073431308792199ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_04.__PVT__bus_master_enable.__PVT__next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_04.__PVT__bus_master_enable.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_04.__PVT__special_cycle_enable.__PVT__next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_04.__PVT__special_cycle_enable.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_04.__PVT__memory_write_invalidate.__PVT__next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_04.__PVT__memory_write_invalidate.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_04.__PVT__vga_palette_snoop.__PVT__next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_04.__PVT__vga_palette_snoop.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_04.__PVT__parity_error_response.__PVT__next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_04.__PVT__parity_error_response.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_04.__PVT__idsel_step_wait_cycle_control.__PVT__next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_04.__PVT__idsel_step_wait_cycle_control.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_04.__PVT__SERR_Enable.__PVT__next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_04.__PVT__SERR_Enable.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_04.__PVT__fast_b2b_transactions_enable.__PVT__next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_04.__PVT__fast_b2b_transactions_enable.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_04.__PVT__interrupt_disable.__PVT__next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_04.__PVT__interrupt_disable.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_04.__PVT__rsvd.__PVT__next = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_04.__PVT__rsvd.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_04.__PVT__interrupt_status.__PVT__next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_04.__PVT__interrupt_status.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_04.__PVT__capabilities_list.__PVT__next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_04.__PVT__capabilities_list.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_04.__PVT__sixtysix_mhz_capable.__PVT__next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_04.__PVT__sixtysix_mhz_capable.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_04.__PVT__fast_b2b_transactions_capable.__PVT__next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_04.__PVT__fast_b2b_transactions_capable.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_04.__PVT__master_data_parity_error.__PVT__next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_04.__PVT__master_data_parity_error.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_04.__PVT__devsel_timing.__PVT__next = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_04.__PVT__devsel_timing.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_04.__PVT__signaled_target_abort.__PVT__next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_04.__PVT__signaled_target_abort.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_04.__PVT__received_target_abort.__PVT__next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_04.__PVT__received_target_abort.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_04.__PVT__received_master_abort.__PVT__next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_04.__PVT__received_master_abort.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_04.__PVT__signaled_system_error.__PVT__next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_04.__PVT__signaled_system_error.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_04.__PVT__detected_parity_error.__PVT__next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_04.__PVT__detected_parity_error.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_0C.__PVT__cache_line_size_register.__PVT__next = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_0C.__PVT__cache_line_size_register.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_0C.__PVT__latency_timer_register.__PVT__next = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_0C.__PVT__latency_timer_register.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_0C.__PVT__interrupt_line_register.__PVT__next = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_0C.__PVT__interrupt_line_register.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_0C.__PVT__interrupt_pin_register.__PVT__next = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_0C.__PVT__interrupt_pin_register.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__base_ddress_register_2.__PVT__BAR.__PVT__next = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__base_ddress_register_2.__PVT__BAR.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__base_ddress_register_3.__PVT__BAR.__PVT__next = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__base_ddress_register_3.__PVT__BAR.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__base_ddress_register_4.__PVT__BAR.__PVT__next = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__base_ddress_register_4.__PVT__BAR.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__base_ddress_register_5.__PVT__BAR.__PVT__next = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__base_ddress_register_5.__PVT__BAR.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__cardbus_cis_pointer.__PVT__word.__PVT__next = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__cardbus_cis_pointer.__PVT__word.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_3C.__PVT__interrupt_line.__PVT__next = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_3C.__PVT__interrupt_line.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_3C.__PVT__interrupt_pin.__PVT__next = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__byte_offset_3C.__PVT__interrupt_pin.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__capabilities_power_mngt_pointer.__PVT__version.__PVT__next = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__capabilities_power_mngt_pointer.__PVT__version.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__capabilities_power_mngt_pointer.__PVT__pme_clock.__PVT__next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__capabilities_power_mngt_pointer.__PVT__pme_clock.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__capabilities_power_mngt_pointer.__PVT__dev_spec_init.__PVT__next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__capabilities_power_mngt_pointer.__PVT__dev_spec_init.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__capabilities_power_mngt_pointer.__PVT__aux_current.__PVT__next = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__capabilities_power_mngt_pointer.__PVT__aux_current.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__capabilities_power_mngt_pointer.__PVT__d1_support.__PVT__next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__capabilities_power_mngt_pointer.__PVT__d1_support.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__capabilities_power_mngt_pointer.__PVT__d2_support.__PVT__next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__capabilities_power_mngt_pointer.__PVT__d2_support.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__capabilities_power_mngt_pointer.__PVT__pme_support.__PVT__next = VL_SCOPED_RAND_RESET_I(5, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__capabilities_power_mngt_pointer.__PVT__pme_support.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__power_management_pointer.__PVT__power_state.__PVT__next = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__power_management_pointer.__PVT__power_state.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__power_management_pointer.__PVT__pme_enable.__PVT__next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__power_management_pointer.__PVT__pme_enable.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__power_management_pointer.__PVT__data_select.__PVT__next = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__power_management_pointer.__PVT__data_select.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__power_management_pointer.__PVT__data_scale.__PVT__next = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__power_management_pointer.__PVT__data_scale.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__power_management_pointer.__PVT__pme_status.__PVT__next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__power_management_pointer.__PVT__pme_status.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__power_management_pointer.__PVT__b2_b3_support.__PVT__next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__power_management_pointer.__PVT__b2_b3_support.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__power_management_pointer.__PVT__bus_pwr_clk_ctrl_en.__PVT__next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__power_management_pointer.__PVT__bus_pwr_clk_ctrl_en.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__power_management_pointer.__PVT__data.__PVT__next = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__power_management_pointer.__PVT__data.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__link_control_3_register.__PVT__perform_equalization.__PVT__next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__link_control_3_register.__PVT__perform_equalization.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__link_control_3_register.__PVT__link_eq_req_intr_en.__PVT__next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__link_control_3_register.__PVT__link_eq_req_intr_en.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__lane_error_status_register.__PVT__lane_error.__PVT__next = VL_SCOPED_RAND_RESET_I(5, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__lane_error_status_register.__PVT__lane_error.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__lane_eq_ctrl_register.__PVT__downstream_tx_preset.__PVT__next = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__lane_eq_ctrl_register.__PVT__downstream_tx_preset.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__lane_eq_ctrl_register.__PVT__downstream_rx_preset_hint.__PVT__next = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__lane_eq_ctrl_register.__PVT__downstream_rx_preset_hint.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__lane_eq_ctrl_register.__PVT__upstream_tx_preset.__PVT__next = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__lane_eq_ctrl_register.__PVT__upstream_tx_preset.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__lane_eq_ctrl_register.__PVT__upstream_rx_preset_hint.__PVT__next = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo.__PVT__lane_eq_ctrl_register.__PVT__upstream_rx_preset_hint.__PVT__load_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9134711182649623331ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__byte_offset_04.__PVT__bus_master_enable.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__byte_offset_04.__PVT__special_cycle_enable.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__byte_offset_04.__PVT__memory_write_invalidate.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__byte_offset_04.__PVT__vga_palette_snoop.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__byte_offset_04.__PVT__parity_error_response.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__byte_offset_04.__PVT__idsel_step_wait_cycle_control.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__byte_offset_04.__PVT__SERR_Enable.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__byte_offset_04.__PVT__fast_b2b_transactions_enable.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__byte_offset_04.__PVT__interrupt_disable.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__byte_offset_04.__PVT__rsvd.__PVT__value = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__byte_offset_04.__PVT__interrupt_status.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__byte_offset_04.__PVT__capabilities_list.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__byte_offset_04.__PVT__sixtysix_mhz_capable.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__byte_offset_04.__PVT__fast_b2b_transactions_capable.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__byte_offset_04.__PVT__master_data_parity_error.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__byte_offset_04.__PVT__devsel_timing.__PVT__value = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__byte_offset_04.__PVT__signaled_target_abort.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__byte_offset_04.__PVT__received_target_abort.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__byte_offset_04.__PVT__received_master_abort.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__byte_offset_04.__PVT__signaled_system_error.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__byte_offset_04.__PVT__detected_parity_error.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__byte_offset_0C.__PVT__cache_line_size_register.__PVT__value = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__byte_offset_0C.__PVT__latency_timer_register.__PVT__value = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__byte_offset_0C.__PVT__interrupt_line_register.__PVT__value = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__byte_offset_0C.__PVT__interrupt_pin_register.__PVT__value = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__base_ddress_register_2.__PVT__BAR.__PVT__value = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__base_ddress_register_3.__PVT__BAR.__PVT__value = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__base_ddress_register_4.__PVT__BAR.__PVT__value = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__base_ddress_register_5.__PVT__BAR.__PVT__value = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__cardbus_cis_pointer.__PVT__word.__PVT__value = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__byte_offset_3C.__PVT__interrupt_line.__PVT__value = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__byte_offset_3C.__PVT__interrupt_pin.__PVT__value = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__capabilities_power_mngt_pointer.__PVT__version.__PVT__value = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__capabilities_power_mngt_pointer.__PVT__pme_clock.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__capabilities_power_mngt_pointer.__PVT__dev_spec_init.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__capabilities_power_mngt_pointer.__PVT__aux_current.__PVT__value = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__capabilities_power_mngt_pointer.__PVT__d1_support.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__capabilities_power_mngt_pointer.__PVT__d2_support.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__capabilities_power_mngt_pointer.__PVT__pme_support.__PVT__value = VL_SCOPED_RAND_RESET_I(5, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__power_management_pointer.__PVT__power_state.__PVT__value = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__power_management_pointer.__PVT__pme_enable.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__power_management_pointer.__PVT__data_select.__PVT__value = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__power_management_pointer.__PVT__data_scale.__PVT__value = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__power_management_pointer.__PVT__pme_status.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__power_management_pointer.__PVT__b2_b3_support.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__power_management_pointer.__PVT__bus_pwr_clk_ctrl_en.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__power_management_pointer.__PVT__data.__PVT__value = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__link_control_3_register.__PVT__perform_equalization.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__link_control_3_register.__PVT__link_eq_req_intr_en.__PVT__value = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__lane_error_status_register.__PVT__lane_error.__PVT__value = VL_SCOPED_RAND_RESET_I(5, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__lane_eq_ctrl_register.__PVT__downstream_tx_preset.__PVT__value = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__lane_eq_ctrl_register.__PVT__downstream_rx_preset_hint.__PVT__value = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__lane_eq_ctrl_register.__PVT__upstream_tx_preset.__PVT__value = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 12748057316896256467ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage.__PVT__lane_eq_ctrl_register.__PVT__upstream_rx_preset_hint.__PVT__value = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 12748057316896256467ull);
    for (int __Vi0 = 0; __Vi0 < 21; ++__Vi0) {
        vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__readback_array[__Vi0] = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 9102144198348377790ull);
    }
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state = VL_SCOPED_RAND_RESET_I(5, __VscopeHash, 10587019433025489942ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_state = VL_SCOPED_RAND_RESET_I(5, __VscopeHash, 8524603382801850910ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__fc_start_c = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 17159034030709407535ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__fc_start_r = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 16583722822654825710ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_nullified_c = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 751094816252391585ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_nullified_r = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 5984715831516333840ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_transmit_seq_c = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 2393407912271671969ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_transmit_seq_r = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 10352191646642332460ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_expected_seq_num_c = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 16323357879383207544ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_expected_seq_num_r = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 2174019790718854681ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__ackd_transmit_seq_c = VL_SCOPED_RAND_RESET_I(12, __VscopeHash, 10128834351951612498ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__ackd_transmit_seq_r = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 11726159768893175566ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_from_tlp_c = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 10482741376553359276ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_from_tlp_r = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 3647363890308413425ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_c = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 5601036170966697817ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 14455071924888180450ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__lcrc32d32 = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 12057479586207082577ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp_crc_out = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 13612058172298981538ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp_lcrc32d32 = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 15775435532213405691ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp_lcrc_r = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 10688680259051193453ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__word_count_c = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 4159428364305784916ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__word_count_r = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 16408158924174869718ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_c = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 6329089649779309001ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_r = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9213410043150349103ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_nph_c = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 17763946645358548065ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_nph_r = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 7969017805854440104ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_ph_c = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 18379181048174640746ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_ph_r = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12004354104134608441ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_c = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 17015836460740499777ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_r = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 271175502409749349ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_pd_c = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 2709938834244518951ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_pd_r = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 3896536368000766481ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_c = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 14723680257314050580ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_r = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 15693233803682523406ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__skid_axis_tready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 5680482000773253480ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pipeline_axis_tready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 16822349057939220420ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pipeline_stg2_axis_tready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12416481122280942587ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_axis_tvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 8639323017631839788ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_axis_tlast = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 8225924094910488550ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_axis_tuser = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 16905773648944479557ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_axis_tready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9019681591845939736ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__ph_credits_consumed_c = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 4702513701444719307ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__ph_credits_consumed_r = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 11534620408513642853ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pd_credits_consumed_c = VL_SCOPED_RAND_RESET_I(12, __VscopeHash, 14387723050319525528ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pd_credits_consumed_r = VL_SCOPED_RAND_RESET_I(12, __VscopeHash, 5327175721415053272ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__nph_credits_consumed_c = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 6676962420806300999ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__nph_credits_consumed_r = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 8011520826078220029ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__npd_credits_consumed_c = VL_SCOPED_RAND_RESET_I(12, __VscopeHash, 13646869384806638073ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__npd_credits_consumed_r = VL_SCOPED_RAND_RESET_I(12, __VscopeHash, 9329575392320518738ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__cplh_credits_consumed_c = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 7285194049995897693ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__cplh_credits_consumed_r = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 6484306239384049170ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__cpld_credits_consumed_c = VL_SCOPED_RAND_RESET_I(12, __VscopeHash, 6939458185918661312ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__cpld_credits_consumed_r = VL_SCOPED_RAND_RESET_I(12, __VscopeHash, 115343806957306678ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 2636317033469026573ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__crcOut = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 2573720355013644080ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_crc16_inst__DOT__crcOut = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 9194913920436571919ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__s_axis_tid = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 2148665980561656372ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__s_axis_tdest = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 3513524205550228276ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__pause_req = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9158687694334135133ull);
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__mem[__Vi0] = VL_SCOPED_RAND_RESET_Q(41, __VscopeHash, 974384605928354642ull);
    }
    for (int __Vi0 = 0; __Vi0 < 2; ++__Vi0) {
        vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_pipe_reg[__Vi0] = VL_SCOPED_RAND_RESET_Q(41, __VscopeHash, 9756719718711173777ull);
    }
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__empty = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12392844568526218747ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__full_wr = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 5807972430232602277ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__j = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 17521449896542044142ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__fc_axis_tdata = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 15062934991534475847ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__fc_axis_tkeep = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 12029427649703549825ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__fc_axis_tvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 15725992292120113375ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__fc_axis_tlast = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 5947057684172514426ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__curr_state = VL_SCOPED_RAND_RESET_I(5, __VscopeHash, 7270744917501743064ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__next_state = VL_SCOPED_RAND_RESET_I(5, __VscopeHash, 12392836322853078437ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dll_packet_r = VL_SCOPED_RAND_RESET_Q(48, __VscopeHash, 4924605110706500952ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_lcrc_c = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 14504020642709248101ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_lcrc_r = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 9812163881713335624ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__timer_c = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 18045264848293453576ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__timer_r = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 5175610149706773880ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__start_ack_c = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 18145097463025829747ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__start_ack_r = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 11543951612711447319ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc4 = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 872654177415535950ull);
    for (int __Vi0 = 0; __Vi0 < 9; ++__Vi0) {
        vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT__crc[__Vi0] = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 11759487095936192336ull);
    }
    for (int __Vi0 = 0; __Vi0 < 9; ++__Vi0) {
        vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT__crc[__Vi0] = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 12969754265545640425ull);
    }
    for (int __Vi0 = 0; __Vi0 < 9; ++__Vi0) {
        vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT__crc[__Vi0] = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 11315581389238885751ull);
    }
    for (int __Vi0 = 0; __Vi0 < 9; ++__Vi0) {
        vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT__crc[__Vi0] = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 13820254142273972879ull);
    }
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__curr_state = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 13054729329679166527ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__next_state = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 862428129494851335ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__dll_packet_c = VL_SCOPED_RAND_RESET_Q(48, __VscopeHash, 2610957520838647411ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__dll_packet_r = VL_SCOPED_RAND_RESET_Q(48, __VscopeHash, 3936126212859241009ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__crc_in_c = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 13727599563553524709ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__crc_in_r = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 16791265172398288726ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tlp_nullified_c = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 346631201803447099ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tlp_nullified_r = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 8962161480704934683ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_tlp_ready_c = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 10977642609096483045ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_tlp_ready_r = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 16973895234657306839ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__next_transmit_seq_r = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 7454729479320519ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__ackd_transmit_seq_c = VL_SCOPED_RAND_RESET_I(12, __VscopeHash, 13770856110092827898ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__ackd_transmit_seq_r = VL_SCOPED_RAND_RESET_I(12, __VscopeHash, 9998949043818930905ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__skid_s_axis_tready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 14607524249355701208ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_ph_c = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 4794588528291990645ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_ph_r = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 9557755366572271418ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_pd_c = VL_SCOPED_RAND_RESET_I(12, __VscopeHash, 14167201094841361256ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_pd_r = VL_SCOPED_RAND_RESET_I(12, __VscopeHash, 3112567430533611478ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_nph_c = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 4166649877276771713ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_nph_r = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 4536350932185525150ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_npd_c = VL_SCOPED_RAND_RESET_I(12, __VscopeHash, 10931029855828388667ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_npd_r = VL_SCOPED_RAND_RESET_I(12, __VscopeHash, 12753680674830410740ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_cplh_c = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 10757258730168667047ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_cplh_r = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 13659117645870999568ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_cpld_c = VL_SCOPED_RAND_RESET_I(12, __VscopeHash, 8489418823013377187ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_cpld_r = VL_SCOPED_RAND_RESET_I(12, __VscopeHash, 801312049933278787ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__update_fc_c = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 2811453670781878318ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__update_fc_r = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9791910129771064067ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__fc1_np_stored_c = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 11253348442317323492ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__fc1_np_stored_r = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 4401861899187411122ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__fc1_p_stored_c = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 14461902327929307124ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__fc1_p_stored_r = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13452423609636119194ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__fc1_c_stored_c = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13213213511241431401ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__fc1_c_stored_r = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 4763525334283233183ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__fc2_np_stored_c = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 11738143365834706409ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__fc2_np_stored_r = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 5647847188295227069ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__fc2_p_stored_c = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 2918335629088402387ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__fc2_p_stored_r = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 11307395226999956880ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__fc2_c_stored_c = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13065278567526262911ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__fc2_c_stored_r = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 14096997551812159225ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__first_feature_exchange_dllp_received_r = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9824149615309182500ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__first_feature_exchange_dllp_received_c = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 5749011067581033676ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc4 = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 4499014657035592182ull);
    for (int __Vi0 = 0; __Vi0 < 9; ++__Vi0) {
        vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_3__DOT__crc[__Vi0] = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 61173803124415115ull);
    }
    for (int __Vi0 = 0; __Vi0 < 9; ++__Vi0) {
        vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_2__DOT__crc[__Vi0] = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 14297794565399036160ull);
    }
    for (int __Vi0 = 0; __Vi0 < 9; ++__Vi0) {
        vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_1__DOT__crc[__Vi0] = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 10159555444826180289ull);
    }
    for (int __Vi0 = 0; __Vi0 < 9; ++__Vi0) {
        vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_0__DOT__crc[__Vi0] = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 7634953271224659764ull);
    }
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__curr_state = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 16986197468932302570ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__next_state = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 2752184540363678652ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__dllp_valid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13915520766351912586ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_valid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12405275616248347975ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__first_tlp_valid_c = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 8230328815093944807ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__first_tlp_valid_r = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 18400049462241384576ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__update_fc_i = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 17461062878474286693ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__m_axis_retry_tdata = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 6610598312598164202ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__m_axis_retry_tkeep = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 12484066190804338910ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__m_axis_retry_tvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 1650507285044472225ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__m_axis_retry_tlast = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 14371733775884201224ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__m_axis_retry_tuser = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 9112032830952230053ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_complete = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 18253711027119826029ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__curr_state = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 8769257106101354278ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__next_state = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 4620084152117262966ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__next_transmit_seq_c = VL_SCOPED_RAND_RESET_I(12, __VscopeHash, 15032600135127492680ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__next_transmit_seq_r = VL_SCOPED_RAND_RESET_I(12, __VscopeHash, 7421535051716619575ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__skid_axis_tready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 11265187316522753694ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__pipeline_axis_tready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 16183437403608673400ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_axis_tdata = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 496687785049239187ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_axis_tkeep = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 4986212796825452628ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_axis_tvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 6771367978418700900ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_axis_tlast = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 6657628332448261126ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__crc_tlp_axis_tdata = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 4231806400576291388ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__crc_in_c = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 10402746949869096227ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__dllp_lcrc_c = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 4629294590614772809ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__crc_in_r = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 17890946032968266815ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__dllp_lcrc_r = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 17794145595805370432ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__lcrc32d32 = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 14908605746238639418ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__dllp_crc_out = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 14545354987041558873ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__dllp_lcrc32d32 = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 1656916618070804887ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_nullified_c = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 2253235174415838107ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_nullified_r = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 14206724607080037952ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_dw0 = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 16921513842434518827ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__ph_credits_consumed_c = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 6865154323081300440ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__ph_credits_consumed_r = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 6077864087710148869ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__pd_credits_consumed_c = VL_SCOPED_RAND_RESET_I(12, __VscopeHash, 7535465759551366269ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__pd_credits_consumed_r = VL_SCOPED_RAND_RESET_I(12, __VscopeHash, 10212150902330069576ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__npd_credits_consumed_c = VL_SCOPED_RAND_RESET_I(12, __VscopeHash, 4580845253184116190ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__npd_credits_consumed_r = VL_SCOPED_RAND_RESET_I(12, __VscopeHash, 12203491778020344063ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__nph_credits_consumed_c = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 542676606327622660ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__nph_credits_consumed_r = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 18229385518071206782ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cpld_credits_consumed_c = VL_SCOPED_RAND_RESET_I(12, __VscopeHash, 11539957212862094058ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cpld_credits_consumed_r = VL_SCOPED_RAND_RESET_I(12, __VscopeHash, 3537517975963061901ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cplh_credits_consumed_c = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 17325449958362789177ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cplh_credits_consumed_r = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 5122581606759446905ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__ph_credit_limit_c = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 18329917722466261330ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__ph_credit_limit_r = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 10513007471333339457ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__pd_credit_limit_c = VL_SCOPED_RAND_RESET_I(12, __VscopeHash, 2352793331323519952ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__pd_credit_limit_r = VL_SCOPED_RAND_RESET_I(12, __VscopeHash, 17764702532223731845ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cpld_credit_limit_c = VL_SCOPED_RAND_RESET_I(12, __VscopeHash, 2229845415500859ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cpld_credit_limit_r = VL_SCOPED_RAND_RESET_I(12, __VscopeHash, 667366537519615899ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__nph_credit_limit_c = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 6622969502133439689ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__nph_credit_limit_r = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 7093160205373023922ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__npd_credit_limit_c = VL_SCOPED_RAND_RESET_I(12, __VscopeHash, 6188500249983129284ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__npd_credit_limit_r = VL_SCOPED_RAND_RESET_I(12, __VscopeHash, 13582342618274892236ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cplh_credit_limit_c = VL_SCOPED_RAND_RESET_I(12, __VscopeHash, 6032411392066828378ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cplh_credit_limit_r = VL_SCOPED_RAND_RESET_I(12, __VscopeHash, 4619950212075583832ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__pcie_lcrc32_inst__DOT__crcOut = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 10761247138394361837ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_crc16_inst__DOT__crcOut = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 3934470619467156063ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__tlp_curr_state = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 8399552853625954597ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__tlp_next_state = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 7948311518965303571ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__retry_ack_c = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 5979931296226167557ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__retry_ack_r = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 6406356842997778351ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__retry_ready = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 9093634569401227664ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__mutex_flag = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 8901259225871088617ull);
    for (int __Vi0 = 0; __Vi0 < 3; ++__Vi0) {
        vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__retry_axis_tdata[__Vi0] = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 2575528777966935087ull);
    }
    for (int __Vi0 = 0; __Vi0 < 3; ++__Vi0) {
        vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__retry_axis_tkeep[__Vi0] = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 17701240936001563878ull);
    }
    for (int __Vi0 = 0; __Vi0 < 3; ++__Vi0) {
        vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__retry_axis_tvalid[__Vi0] = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 5924986389240860258ull);
    }
    for (int __Vi0 = 0; __Vi0 < 3; ++__Vi0) {
        vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__retry_axis_tlast[__Vi0] = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 6353350887378707648ull);
    }
    for (int __Vi0 = 0; __Vi0 < 3; ++__Vi0) {
        vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__retry_axis_tuser[__Vi0] = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 3830384460174652173ull);
    }
    for (int __Vi0 = 0; __Vi0 < 3; ++__Vi0) {
        vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__retry_axis_tready[__Vi0] = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 3299907819437783791ull);
    }
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__retry_index_c = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 3625314546889189764ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__retry_index_r = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 13689297786345363061ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT____Vcellout__gen_retry_axis_fifo__BRA__0__KET____DOT__axis_retry_fifo_inst__m_axis_tlast = 0;
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT____Vcellout__gen_retry_axis_fifo__BRA__1__KET____DOT__axis_retry_fifo_inst__m_axis_tlast = 0;
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT____Vcellout__gen_retry_axis_fifo__BRA__2__KET____DOT__axis_retry_fifo_inst__m_axis_tlast = 0;
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__2__KET____DOT__axis_retry_fifo_inst__DOT__s_axis_tvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 17502277777750968113ull);
    VL_SCOPED_RAND_RESET_W(201, vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__2__KET____DOT__axis_retry_fifo_inst__DOT__D, __VscopeHash, 3100673521320734568ull);
    VL_SCOPED_RAND_RESET_W(201, vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__2__KET____DOT__axis_retry_fifo_inst__DOT__Q, __VscopeHash, 1329889538814806043ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__1__KET____DOT__axis_retry_fifo_inst__DOT__s_axis_tvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 1530796710636751249ull);
    VL_SCOPED_RAND_RESET_W(201, vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__1__KET____DOT__axis_retry_fifo_inst__DOT__D, __VscopeHash, 13270804603831393628ull);
    VL_SCOPED_RAND_RESET_W(201, vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__1__KET____DOT__axis_retry_fifo_inst__DOT__Q, __VscopeHash, 12834936311536515714ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__0__KET____DOT__axis_retry_fifo_inst__DOT__s_axis_tvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 16541407365864283592ull);
    VL_SCOPED_RAND_RESET_W(201, vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__0__KET____DOT__axis_retry_fifo_inst__DOT__D, __VscopeHash, 1694273730088699013ull);
    VL_SCOPED_RAND_RESET_W(201, vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__0__KET____DOT__axis_retry_fifo_inst__DOT__Q, __VscopeHash, 5600857186170096336ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__s_axis_tdata = VL_SCOPED_RAND_RESET_Q(64, __VscopeHash, 5433975821203439903ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__s_axis_tkeep = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 8303904673019664569ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__s_axis_tvalid = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 12301645093682656408ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__s_axis_tready = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 14078712375916081610ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__s_axis_tlast = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 10363571011782311ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__s_axis_tid = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 14941760955570925624ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__s_axis_tdest = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 12762819232345178324ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__s_axis_tuser = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 14185780935324366301ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__m_axis_tdata_int = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 5929143591568241537ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__m_axis_tkeep_int = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 7724266025772451768ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__m_axis_tvalid_int = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 10491545398608992028ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__m_axis_tlast_int = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 3863453891928744189ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__m_axis_tdest_int = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 9708882337336938387ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__m_axis_tuser_int = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 9739488355335686698ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__current_s_tid = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 805376158732375923ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__i = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 14744021485537363999ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__request = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 12270642566378916319ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__acknowledge = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 13646968675961498850ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_next = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 13521184839313112244ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_valid_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 782523056387880109ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_encoded_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 17672430327754013541ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__input_unencoded = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 10524282326082839652ull);
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__stage_valid[__Vi0] = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 10466300197769776616ull);
    }
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__stage_enc[__Vi0] = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 4818940954774828480ull);
    }
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_inst__DOT__stage_valid[__Vi0] = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 1047925554149308760ull);
    }
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_inst__DOT__stage_enc[__Vi0] = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 1711875413388440181ull);
    }
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__error_c = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 15810251396644183804ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__error_r = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 5427029669989770907ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__next_retry_index_c = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 16305320248579483407ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__next_retry_index_r = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 12628349207636703817ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__retry_valid_c = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 9541251440488104787ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__retry_valid_r = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 4165276355254ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__free_retry_c = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 4936049422236589552ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__free_retry_r = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 10787477426959532340ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__retrys_c = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 16635038049381589887ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__retrys_r = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 6318970441716147193ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__retry_index_flag = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 6307212179553830653ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__store_seq_c = VL_SCOPED_RAND_RESET_I(12, __VscopeHash, 13259973284868221415ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__store_seq_r = VL_SCOPED_RAND_RESET_I(12, __VscopeHash, 18276750112077808716ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__seq_num_out = VL_SCOPED_RAND_RESET_I(12, __VscopeHash, 7053589453205767887ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__ack_seq_mem_c = VL_SCOPED_RAND_RESET_Q(36, __VscopeHash, 12648267043924662450ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__ack_seq_mem_r = VL_SCOPED_RAND_RESET_Q(36, __VscopeHash, 16358737915705214102ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__0__KET____DOT__curr_state = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 2743731859646787756ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__0__KET____DOT__next_state = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 15696523325386135253ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__0__KET____DOT__replay_cnt_c = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 1220704178860142319ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__0__KET____DOT__replay_cnt_r = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 3428896940023142090ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__0__KET____DOT__retry_timer_c = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 2339227783248068768ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__0__KET____DOT__retry_timer_r = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 8217454666384797831ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__1__KET____DOT__curr_state = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 15548589827935502109ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__1__KET____DOT__next_state = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 1981139518533302344ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__1__KET____DOT__replay_cnt_c = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 7000257853438062160ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__1__KET____DOT__replay_cnt_r = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 14038411426977426187ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__1__KET____DOT__retry_timer_c = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 12698401105058331189ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__1__KET____DOT__retry_timer_r = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 14168232752175914643ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__2__KET____DOT__curr_state = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 2483521063216071853ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__2__KET____DOT__next_state = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 16283393223066432683ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__2__KET____DOT__replay_cnt_c = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 2859001973546378227ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__2__KET____DOT__replay_cnt_r = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 7834913240138849550ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__2__KET____DOT__retry_timer_c = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 13271662813017246436ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__2__KET____DOT__retry_timer_r = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 16242506030048312991ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 16581513894021933295ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tkeep = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 1805652803803677663ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 17808650312411817906ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tlast = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 16934315095810032567ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state = VL_SCOPED_RAND_RESET_I(5, __VscopeHash, 15105279959361663599ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__next_state = VL_SCOPED_RAND_RESET_I(5, __VscopeHash, 3542321946038187995ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dll_packet_r = VL_SCOPED_RAND_RESET_Q(48, __VscopeHash, 13470093117919202494ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_lcrc_c = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 17197570465611689328ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_lcrc_r = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 16937071553671167895ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 4228795575613374257ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 7025484716035288336ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__fc2_count_c = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 15266875968335303852ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__fc2_count_r = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 1761365597614649227ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__idle_count_c = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 8394599628099919394ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__idle_count_r = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 2342646498286253610ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__update_fc_c = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 11714926441922083979ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__update_fc_r = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 3474795997406285531ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc4 = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 15282733209840227087ull);
    for (int __Vi0 = 0; __Vi0 < 9; ++__Vi0) {
        vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT__crc[__Vi0] = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 17224649489604120080ull);
    }
    for (int __Vi0 = 0; __Vi0 < 9; ++__Vi0) {
        vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT__crc[__Vi0] = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 8140305427088624432ull);
    }
    for (int __Vi0 = 0; __Vi0 < 9; ++__Vi0) {
        vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT__crc[__Vi0] = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 10664884680149510493ull);
    }
    for (int __Vi0 = 0; __Vi0 < 9; ++__Vi0) {
        vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT__crc[__Vi0] = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 3609418808557397654ull);
    }
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__s_axis_tdata = VL_SCOPED_RAND_RESET_Q(64, __VscopeHash, 4124991143214028865ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__s_axis_tkeep = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 13334982605804805916ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__s_axis_tvalid = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 4044421998568819071ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__s_axis_tready = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 1640108837094791656ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__s_axis_tlast = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 16491574797854904012ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__s_axis_tid = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 4679546330900232634ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__s_axis_tdest = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 4193454913559934111ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__s_axis_tuser = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 15847129394930364212ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__m_axis_tdata_int = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 17581439798894485943ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__m_axis_tkeep_int = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 11344745367880960305ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__m_axis_tvalid_int = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 15787955241169964302ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__m_axis_tlast_int = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 10119271704062975456ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__m_axis_tdest_int = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 10010918245835491892ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__m_axis_tuser_int = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 13983058643520677267ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__current_s_tid = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 14421561938809011668ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__i = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 2428172800079711515ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__request = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 6711738034322913964ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__acknowledge = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 4553291850406445866ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__grant_next = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 12341007311605926012ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__grant_valid_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 15850648766519592827ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__grant_encoded_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 2384201546159927936ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__input_unencoded = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 2936636136911170656ull);
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__stage_valid[__Vi0] = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12485139781379762145ull);
    }
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__stage_enc[__Vi0] = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 7537302628019150575ull);
    }
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_inst__DOT__stage_valid[__Vi0] = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 11291941649726572325ull);
    }
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_inst__DOT__stage_enc[__Vi0] = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 14944003505888764579ull);
    }
    VL_SCOPED_RAND_RESET_W(96, vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__s_axis_tdata, __VscopeHash, 6004496253428797815ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__s_axis_tkeep = VL_SCOPED_RAND_RESET_I(12, __VscopeHash, 18086564586059244154ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__s_axis_tvalid = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 6275243930401651346ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__s_axis_tready = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 8110987955581915885ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__s_axis_tlast = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 9830014032369117113ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__s_axis_tid = VL_SCOPED_RAND_RESET_I(24, __VscopeHash, 11844764735198701161ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__s_axis_tdest = VL_SCOPED_RAND_RESET_I(24, __VscopeHash, 9745825964013655627ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__s_axis_tuser = VL_SCOPED_RAND_RESET_I(12, __VscopeHash, 16678445768192030267ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__m_axis_tdata_int = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 9049137763241547844ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__m_axis_tkeep_int = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 16231666642118715525ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__m_axis_tvalid_int = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 976560419633341835ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__m_axis_tlast_int = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 483801686428686758ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__m_axis_tdest_int = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 4657757937200887987ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__m_axis_tuser_int = VL_SCOPED_RAND_RESET_I(4, __VscopeHash, 17446680014664889933ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__current_s_tid = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 797837358093399633ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__i = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 18030221811156758794ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__request = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 3535415887943917690ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__acknowledge = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 1170725181578119691ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_next = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 8909818050784840860ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_valid_next = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 1132016736592042532ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_encoded_next = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 5769634549242756484ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__request_index = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 6489007276637711789ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__input_unencoded = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 17183807501664028057ull);
    for (int __Vi0 = 0; __Vi0 < 2; ++__Vi0) {
        vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__stage_valid[__Vi0] = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 8755312320804206410ull);
    }
    for (int __Vi0 = 0; __Vi0 < 2; ++__Vi0) {
        vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__stage_enc[__Vi0] = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 10262503566102790858ull);
    }
    for (int __Vi0 = 0; __Vi0 < 2; ++__Vi0) {
        vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_inst__DOT__stage_valid[__Vi0] = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 14529696916155238631ull);
    }
    for (int __Vi0 = 0; __Vi0 < 2; ++__Vi0) {
        vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_inst__DOT__stage_enc[__Vi0] = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 5151137421480303123ull);
    }
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__next_state = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 16042407721767547201ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__curr_state = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 17837189060883960490ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__link_state = VL_SCOPED_RAND_RESET_I(7, __VscopeHash, 16267905503288631372ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__link_status_c = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 17282917497805250981ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__link_status_r = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 4455952897812715407ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__init_flow_control_c = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 14279410020482380687ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__init_flow_control_r = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 3611980036169940340ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__soft_reset_r = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 17724971579332865412ull);
    vlSelf->tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__soft_reset_c = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12503636703179018689ull);
    VL_ZERO_RESET_W(128, vlSelf->__Vfunc_gen_cpld__0__tlp_hdr_in);
    vlSelf->__Vfunc_gen_cpld__0__data_in = 0;
    VL_ZERO_RESET_W(128, vlSelf->__Vfunc_gen_cpl__1__tlp_hdr_in);
    vlSelf->__Vfunc_gen_cpl__1__data_in = 0;
    vlSelf->__Vfunc_send_fc_init__2__unnamedblk1__DOT__dll_packet = 0;
    vlSelf->__Vfunc_send_fc_init__3__hdrfc = 0;
    vlSelf->__Vfunc_send_fc_init__3__datafc = 0;
    vlSelf->__Vfunc_send_fc_init__3__unnamedblk1__DOT__dll_packet = 0;
    vlSelf->__Vfunc_send_fc_init__4__hdrfc = 0;
    vlSelf->__Vfunc_send_fc_init__4__datafc = 0;
    vlSelf->__Vfunc_send_fc_init__4__unnamedblk1__DOT__dll_packet = 0;
    vlSelf->__Vfunc_set_ack_nack__5__dllp_type = 0;
    vlSelf->__Vfunc_set_ack_nack__5__seq_num = 0;
    vlSelf->__Vfunc_set_ack_nack__5__temp_dllp = 0;
    vlSelf->__Vtask_get_fc_values__6__hdr_fc_out = 0;
    vlSelf->__Vtask_get_fc_values__6__data_fc_out = 0;
    vlSelf->__Vtask_get_fc_values__6__flow_control_in = 0;
    vlSelf->__Vtask_get_fc_values__7__hdr_fc_out = 0;
    vlSelf->__Vtask_get_fc_values__7__data_fc_out = 0;
    vlSelf->__Vtask_get_fc_values__7__flow_control_in = 0;
    vlSelf->__Vtask_get_fc_values__8__hdr_fc_out = 0;
    vlSelf->__Vtask_get_fc_values__8__data_fc_out = 0;
    vlSelf->__Vtask_get_fc_values__8__flow_control_in = 0;
    vlSelf->__Vtask_get_fc_values__9__hdr_fc_out = 0;
    vlSelf->__Vtask_get_fc_values__9__data_fc_out = 0;
    vlSelf->__Vtask_get_fc_values__9__flow_control_in = 0;
    vlSelf->__Vtask_get_fc_values__10__hdr_fc_out = 0;
    vlSelf->__Vtask_get_fc_values__10__data_fc_out = 0;
    vlSelf->__Vtask_get_fc_values__10__flow_control_in = 0;
    vlSelf->__Vtask_get_fc_values__11__hdr_fc_out = 0;
    vlSelf->__Vtask_get_fc_values__11__data_fc_out = 0;
    vlSelf->__Vtask_get_fc_values__11__flow_control_in = 0;
    vlSelf->__Vtask_get_fc_values__12__hdr_fc_out = 0;
    vlSelf->__Vtask_get_fc_values__12__data_fc_out = 0;
    vlSelf->__Vtask_get_fc_values__12__flow_control_in = 0;
    vlSelf->__Vtask_get_fc_values__13__hdr_fc_out = 0;
    vlSelf->__Vtask_get_fc_values__13__data_fc_out = 0;
    vlSelf->__Vtask_get_fc_values__13__flow_control_in = 0;
    vlSelf->__Vtask_get_fc_values__14__hdr_fc_out = 0;
    vlSelf->__Vtask_get_fc_values__14__data_fc_out = 0;
    vlSelf->__Vtask_get_fc_values__14__flow_control_in = 0;
    vlSelf->__Vfunc_get_ack_nack_seq__15__Vfuncout = 0;
    vlSelf->__Vfunc_get_ack_nack_seq__15__ack_nack_in = 0;
    vlSelf->__Vfunc_get_ack_nack_seq__16__Vfuncout = 0;
    vlSelf->__Vfunc_get_ack_nack_seq__16__ack_nack_in = 0;
    vlSelf->__Vfunc_send_fc_init__17__unnamedblk1__DOT__dll_packet = 0;
    vlSelf->__Vfunc_send_fc_init__18__unnamedblk1__DOT__dll_packet = 0;
    vlSelf->__Vfunc_send_fc_init__19__unnamedblk1__DOT__dll_packet = 0;
    vlSelf->__Vfunc_send_fc_init__20__unnamedblk1__DOT__dll_packet = 0;
    vlSelf->__Vfunc_send_fc_init__21__unnamedblk1__DOT__dll_packet = 0;
    vlSelf->__Vfunc_send_fc_init__22__unnamedblk1__DOT__dll_packet = 0;
    vlSelf->__Vfunc_send_fc_init__23__unnamedblk1__DOT__dll_packet = 0;
    vlSelf->__Vfunc_send_fc_init__24__unnamedblk1__DOT__dll_packet = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_0 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_4 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_5 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_6 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_8 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_9 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_10 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_11 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_12 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_13 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_14 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_15 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_16 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_17 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_18 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_19 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_20 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_21 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_22 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_23 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_24 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_25 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_26 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_27 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_29 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_39 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_40 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_41 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_43 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_44 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_48 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_49 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_50 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_52 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_54 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_57 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_58 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_59 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_61 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_62 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_63 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_64 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_80 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_81 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_82 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_83 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_88 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_89 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_90 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_91 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_99 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_100 = 0;
    vlSelf->__VdfgRegularize_h6e95ff9d_0_116 = 0;
    vlSelf->__VdlyVal__tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_pipe_reg__v0 = 0;
    vlSelf->__VdlySet__tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_pipe_reg__v0 = 0;
    vlSelf->__VdlyVal__tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_pipe_reg__v1 = 0;
    vlSelf->__VdlySet__tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_pipe_reg__v1 = 0;
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        vlSelf->__VstlTriggered[__Vi0] = 0;
    }
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        vlSelf->__VactTriggered[__Vi0] = 0;
    }
    vlSelf->__Vtrigprevexpr___TOP__tb_pcie_datalink_layer__DOT__clk__0 = 0;
    vlSelf->__Vtrigprevexpr___TOP__tb_pcie_datalink_layer__DOT__rst__0 = 0;
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        vlSelf->__VnbaTriggered[__Vi0] = 0;
    }
    for (int __Vi0 = 0; __Vi0 < 4; ++__Vi0) {
        vlSelf->__Vm_traceActivity[__Vi0] = 0;
    }
}
