// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtb_pcie_datalink_layer.h for the primary calling header

#include "Vtb_pcie_datalink_layer__pch.h"

void Vtb_pcie_datalink_layer___024root___nba_comb__TOP__0(Vtb_pcie_datalink_layer___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_pcie_datalink_layer___024root___nba_comb__TOP__0\n"); );
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
    CData/*0:0*/ __VdfgRegularize_h6e95ff9d_0_92;
    __VdfgRegularize_h6e95ff9d_0_92 = 0;
    // Body
    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__fc2_count_c 
        = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__fc2_count_r;
    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c 
        = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r;
    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__next_state 
        = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state;
    if ((0x00000010U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
        if ((1U & (~ ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state) 
                      >> 3U)))) {
            if ((1U & (~ ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state) 
                          >> 2U)))) {
                if ((1U & (~ ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state) 
                              >> 1U)))) {
                    if ((1U & (~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state)))) {
                        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c 
                            = ((2U <= (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))
                                ? 2U : (0x0000ffffU 
                                        & ((IData)(1U) 
                                           + (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))));
                        if (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg) {
                            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__fc2_count_c 
                                = (0x0000ffffU & ((IData)(1U) 
                                                  + (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__fc2_count_r)));
                            if (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__fc2_values_stored) 
                                 & ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__update_fc_r) 
                                    | (0x0060U <= (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__idle_count_r))))) {
                                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c = 0U;
                            } else if ((2U <= (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))) {
                                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c = 0U;
                            }
                        }
                    }
                }
            }
            if ((4U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
                if ((1U & (~ ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state) 
                              >> 1U)))) {
                    if ((1U & (~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state)))) {
                        if (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg) {
                            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__next_state = 0x15U;
                        }
                    }
                }
            } else if ((2U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
                if ((1U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
                    if (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg) {
                        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__next_state = 0x14U;
                    }
                } else if (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg) {
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__next_state = 0x13U;
                }
            } else if ((1U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
                if (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg) {
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__next_state = 0x12U;
                }
            } else if (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg) {
                if (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__fc2_values_stored) 
                     & ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__update_fc_r) 
                        | (0x0060U <= (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__idle_count_r))))) {
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__next_state = 0x11U;
                } else if ((2U <= (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))) {
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__next_state = 8U;
                }
            }
        }
    } else {
        if ((1U & (~ ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state) 
                      >> 3U)))) {
            if ((4U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
                if ((2U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
                    if ((1U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
                        if (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg) 
                             & (2U <= (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r)))) {
                            if (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__fc1_values_stored) {
                                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__fc2_count_c 
                                    = (0x0000ffffU 
                                       & ((IData)(1U) 
                                          + (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__fc2_count_r)));
                                if ((5U <= (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__fc2_count_r))) {
                                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__fc2_count_c = 0U;
                                }
                            }
                        }
                    }
                }
            } else if ((1U & (~ ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state) 
                                 >> 1U)))) {
                if ((1U & (~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state)))) {
                    if (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__init_flow_control_r) 
                         & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg))) {
                        if (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__fc1_values_stored) 
                             | (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__first_feature_exchange_dllp_received_r))) {
                            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__fc2_count_c = 0U;
                        }
                    }
                }
            }
        }
        if ((8U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
            if ((4U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
                if ((1U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
                    if (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg) {
                        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c = 0U;
                    }
                } else {
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c 
                        = ((2U <= (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))
                            ? 2U : (0x0000ffffU & ((IData)(1U) 
                                                   + (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))));
                    if (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg) 
                         & (2U <= (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r)))) {
                        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c = 0U;
                    }
                }
                if ((2U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
                    if ((1U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
                        if (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg) {
                            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__next_state = 0x10U;
                        }
                    } else if (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg) 
                                & (2U <= (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r)))) {
                        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__next_state = 0x0fU;
                    }
                } else if ((1U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
                    if (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg) {
                        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__next_state = 0x0eU;
                    }
                } else if (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg) 
                            & (2U <= (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r)))) {
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__next_state = 0x0dU;
                }
            } else if ((1U & (~ ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state) 
                                 >> 1U)))) {
                if ((1U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
                    if (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg) {
                        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c = 0U;
                        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__next_state = 0x0cU;
                    }
                } else {
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c 
                        = ((2U <= (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))
                            ? 2U : (0x0000ffffU & ((IData)(1U) 
                                                   + (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))));
                    if (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg) 
                         & (2U <= (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r)))) {
                        if ((2U <= (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))) {
                            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c = 0U;
                            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__next_state = 9U;
                        }
                    }
                }
            }
        } else if ((4U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
            if ((2U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
                if ((1U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c 
                        = ((2U <= (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))
                            ? 2U : (0x0000ffffU & ((IData)(1U) 
                                                   + (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))));
                    if (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg) 
                         & (2U <= (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r)))) {
                        if (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__fc1_values_stored) {
                            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c = 0U;
                            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__next_state 
                                = ((5U <= (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__fc2_count_r))
                                    ? 8U : 1U);
                        }
                    }
                } else if (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg) {
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c = 0U;
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__next_state = 7U;
                }
            } else if ((1U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c 
                    = ((2U <= (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))
                        ? 2U : (0x0000ffffU & ((IData)(1U) 
                                               + (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))));
                if (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg) 
                     & (2U <= (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r)))) {
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c = 0U;
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__next_state = 6U;
                }
            } else if (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg) {
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c = 0U;
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__next_state = 5U;
            }
        } else if ((2U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
            if ((1U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c 
                    = ((2U <= (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))
                        ? 2U : (0x0000ffffU & ((IData)(1U) 
                                               + (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))));
                if (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg) 
                     & (2U <= (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r)))) {
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c = 0U;
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__next_state = 4U;
                }
            } else if (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg) {
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c = 0U;
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__next_state = 3U;
            }
        } else if ((1U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c 
                = ((2U <= (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))
                    ? 2U : (0x0000ffffU & ((IData)(1U) 
                                           + (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))));
            if (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg) 
                 & (2U <= (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r)))) {
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c = 0U;
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__next_state = 2U;
            }
        } else if (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__init_flow_control_r) 
                    & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg))) {
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c 
                = ((0x006eU <= (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))
                    ? 0x0000006eU : (0x0000ffffU & 
                                     ((IData)(1U) + (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))));
            if (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__fc1_values_stored) 
                 | (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__first_feature_exchange_dllp_received_r))) {
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c = 0U;
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__next_state = 1U;
            }
        }
    }
    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__init_ack = 0U;
    if ((1U & (~ ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state) 
                  >> 4U)))) {
        if ((1U & (~ ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state) 
                      >> 3U)))) {
            if ((1U & (~ ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state) 
                          >> 2U)))) {
                if ((1U & (~ ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state) 
                              >> 1U)))) {
                    if ((1U & (~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state)))) {
                        if (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__init_flow_control_r) 
                             & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg))) {
                            if (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__fc1_values_stored) 
                                 | (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__first_feature_exchange_dllp_received_r))) {
                                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__init_ack = 1U;
                            }
                        }
                    }
                }
            }
        }
    }
    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__timer_c 
        = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__timer_r;
    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__next_state 
        = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__curr_state;
    if ((1U & (~ ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__curr_state) 
                  >> 4U)))) {
        if ((8U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__curr_state))) {
            if ((1U & (~ ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__curr_state) 
                          >> 2U)))) {
                if ((1U & (~ ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__curr_state) 
                              >> 1U)))) {
                    if ((1U & (~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__curr_state)))) {
                        if (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg) {
                            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__timer_c = 0U;
                        }
                    }
                    if ((1U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__curr_state))) {
                        if ((1U & (~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__fc_start_r)))) {
                            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__next_state = 0U;
                        }
                    } else if (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg) {
                        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__next_state = 9U;
                    }
                }
            }
        } else if ((4U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__curr_state))) {
            if ((2U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__curr_state))) {
                if ((1U & (~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__curr_state)))) {
                    if (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg) {
                        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__timer_c = 0U;
                    }
                }
                if ((1U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__curr_state))) {
                    if (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg) {
                        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__next_state = 8U;
                    }
                } else if (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg) {
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__next_state = 9U;
                }
            } else if ((1U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__curr_state))) {
                if (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg) {
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__next_state = 6U;
                }
            } else if (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg) {
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__next_state = 5U;
            }
        } else {
            if ((1U & (~ ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__curr_state) 
                          >> 1U)))) {
                if ((1U & (~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__curr_state)))) {
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__timer_c 
                        = ((0x07d0U <= (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__timer_r))
                            ? 0x000007d0U : (0x0000ffffU 
                                             & ((IData)(1U) 
                                                + (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__timer_r))));
                    if (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__fc_start_r) {
                        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__timer_c = 0U;
                    } else if (((0x07d0U <= (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__timer_r)) 
                                & (2U == (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__link_status_r)))) {
                        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__timer_c = 0U;
                    }
                }
            }
            if ((2U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__curr_state))) {
                if ((1U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__curr_state))) {
                    if (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg) {
                        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__next_state = 4U;
                    }
                } else if (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg) {
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__next_state = 3U;
                    if (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_nullified_r) {
                        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__next_state = 9U;
                    }
                }
            } else if ((1U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__curr_state))) {
                if (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg) {
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__next_state = 2U;
                }
            } else if (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__fc_start_r) {
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__next_state = 1U;
            } else if (((0x07d0U <= (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__timer_r)) 
                        & (2U == (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__link_status_r)))) {
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__next_state = 3U;
            }
        }
    }
    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__link_status_c 
        = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__link_status_r;
    if ((1U & (~ ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__curr_state) 
                  >> 2U)))) {
        if ((2U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__curr_state))) {
            if ((1U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__curr_state))) {
                if (vlSelfRef.tb_pcie_datalink_layer__DOT__phy_link_up) {
                    if (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__fc2_values_stored) {
                        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__link_status_c = 2U;
                    }
                }
            } else if (vlSelfRef.tb_pcie_datalink_layer__DOT__phy_link_up) {
                if (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__fc1_values_stored) 
                     | (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__fc2_values_stored))) {
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__link_status_c = 1U;
                }
            }
        } else if ((1U & (~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__curr_state)))) {
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__link_status_c = 0U;
        }
    }
    __VdfgRegularize_h6e95ff9d_0_92 = ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_axis_tready) 
                                       & ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__m_axis_tvalid_reg) 
                                          & (2U == (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__link_status_r))));
    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__next_state 
        = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__curr_state;
    if ((4U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__curr_state))) {
        if ((1U & (~ ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__curr_state) 
                      >> 1U)))) {
            if ((1U & (~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__curr_state)))) {
                if ((1U & (~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__phy_link_up)))) {
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__next_state = 0U;
                }
            }
        }
    } else if ((2U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__curr_state))) {
        if ((1U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__curr_state))) {
            if (vlSelfRef.tb_pcie_datalink_layer__DOT__phy_link_up) {
                if (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__fc2_values_stored) {
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__next_state = 4U;
                }
            } else {
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__next_state = 0U;
            }
        } else if (vlSelfRef.tb_pcie_datalink_layer__DOT__phy_link_up) {
            if (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__fc1_values_stored) 
                 | (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__fc2_values_stored))) {
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__next_state = 3U;
            }
        } else {
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__next_state = 0U;
        }
    } else if ((1U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__curr_state))) {
        if (vlSelfRef.tb_pcie_datalink_layer__DOT__phy_link_up) {
            if (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__init_ack) {
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__next_state = 2U;
            }
        } else {
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__next_state = 0U;
        }
    } else if (vlSelfRef.tb_pcie_datalink_layer__DOT__phy_link_up) {
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__next_state = 1U;
    }
    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__skid_axis_tready 
        = ((~ ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state) 
               >> 2U)) & ((~ (0U != (3U & ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state) 
                                           >> 3U)))) 
                          & ((2U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                              ? (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_48)
                              : ((1U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                  ? (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_0)
                                  : (IData)(__VdfgRegularize_h6e95ff9d_0_92)))));
    vlSelfRef.__VdfgRegularize_h6e95ff9d_0_6 = ((IData)(__VdfgRegularize_h6e95ff9d_0_92) 
                                                & ((~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tlast_reg)) 
                                                   & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tvalid_reg)));
    vlSelfRef.__VdfgRegularize_h6e95ff9d_0_14 = ((((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tvalid_reg) 
                                                   << 4U) 
                                                  | (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__skid_axis_tready) 
                                                      << 3U) 
                                                     | ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__s_axis_tready_reg) 
                                                        << 2U))) 
                                                 | (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg) 
                                                     << 1U) 
                                                    | (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__m_axis_tvalid_reg)));
    vlSelfRef.__VdfgRegularize_h6e95ff9d_0_15 = ((((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tvalid_reg) 
                                                   << 4U) 
                                                  | (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__skid_axis_tready) 
                                                      << 3U) 
                                                     | ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__s_axis_tready_reg) 
                                                        << 2U))) 
                                                 | (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg) 
                                                     << 1U) 
                                                    | (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tvalid_reg)));
    vlSelfRef.__VdfgRegularize_h6e95ff9d_0_16 = ((((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__m_axis_tvalid_reg) 
                                                   << 4U) 
                                                  | (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__skid_axis_tready) 
                                                      << 3U) 
                                                     | ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg) 
                                                        << 2U))) 
                                                 | (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg) 
                                                     << 1U) 
                                                    | (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tvalid_reg)));
    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
        = (((4U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
             ? ((- (IData)((1U & (~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))))) 
                & (((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tdata_reg 
                     << 0x00000010U) | (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__m_axis_tdata_reg 
                                        >> 0x00000010U)) 
                   & (- (IData)((1U & (~ ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state) 
                                          >> 1U)))))))
             : ((2U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                 ? ((- (IData)((1U & (~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))))) 
                    & vlSelfRef.__VdfgRegularize_h6e95ff9d_0_49)
                 : ((1U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                     ? vlSelfRef.__VdfgRegularize_h6e95ff9d_0_49
                     : (0x0000ffffU & ((- (IData)((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_6))) 
                                       & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tdata_reg))))) 
           & (- (IData)((1U & (~ (0U != (3U & ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state) 
                                               >> 3U))))))));
    vlSelfRef.__VdfgRegularize_h6e95ff9d_0_40 = (1U 
                                                 & VL_REDXOR_8(
                                                               (0x00000046U 
                                                                & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data)));
    vlSelfRef.__VdfgRegularize_h6e95ff9d_0_82 = (1U 
                                                 & VL_REDXOR_8(
                                                               (0x00000023U 
                                                                & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data)));
    vlSelfRef.__VdfgRegularize_h6e95ff9d_0_83 = (1U 
                                                 & VL_REDXOR_8(
                                                               (0x0000005cU 
                                                                & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data)));
    vlSelfRef.__VdfgRegularize_h6e95ff9d_0_90 = (1U 
                                                 & VL_REDXOR_8(
                                                               (0x00000022U 
                                                                & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data)));
    vlSelfRef.__VdfgRegularize_h6e95ff9d_0_63 = (1U 
                                                 & VL_REDXOR_8(
                                                               (0x00000014U 
                                                                & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data)));
    vlSelfRef.__VdfgRegularize_h6e95ff9d_0_88 = (1U 
                                                 & VL_REDXOR_8(
                                                               (0x00000013U 
                                                                & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data)));
    vlSelfRef.__VdfgRegularize_h6e95ff9d_0_43 = (1U 
                                                 & VL_REDXOR_8(
                                                               (0x00000024U 
                                                                & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data)));
    vlSelfRef.__VdfgRegularize_h6e95ff9d_0_64 = (1U 
                                                 & VL_REDXOR_4(
                                                               (0x0000000aU 
                                                                & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data)));
    vlSelfRef.__VdfgRegularize_h6e95ff9d_0_44 = (1U 
                                                 & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                                                    ^ 
                                                    (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                                                     >> 4U)));
    vlSelfRef.__VdfgRegularize_h6e95ff9d_0_4 = (1U 
                                                & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                                                   ^ 
                                                   (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                                                    >> 3U)));
    vlSelfRef.__VdfgRegularize_h6e95ff9d_0_29 = (1U 
                                                 & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                                                    ^ 
                                                    (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data 
                                                     >> 2U)));
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
    if ((0x00000010U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))) {
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_transmit_seq_c 
            = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_transmit_seq_r;
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__word_count_c 
            = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__word_count_r;
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_nph_c 
            = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_nph_r;
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_pd_c 
            = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_pd_r;
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_ph_c 
            = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_ph_r;
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_c 
            = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_r;
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_c 
            = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_r;
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_c 
            = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_r;
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_state 
            = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state;
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_c 
            = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r;
    } else if ((8U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))) {
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_transmit_seq_c 
            = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_transmit_seq_r;
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__word_count_c 
            = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__word_count_r;
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_nph_c 
            = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_nph_r;
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_pd_c 
            = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_pd_r;
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_ph_c 
            = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_ph_r;
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_c 
            = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_r;
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_c 
            = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_r;
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_c 
            = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_r;
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_state 
            = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state;
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_c 
            = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r;
    } else if ((4U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))) {
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_transmit_seq_c 
            = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_transmit_seq_r;
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__word_count_c 
            = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__word_count_r;
        if ((2U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))) {
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_nph_c 
                = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_nph_r;
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_pd_c 
                = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_pd_r;
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_ph_c 
                = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_ph_r;
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_c 
                = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_r;
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_c 
                = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_r;
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_c 
                = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_r;
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_state 
                = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state;
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_c 
                = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r;
        } else {
            if ((1U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))) {
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_nph_c 
                    = ((~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__start_ack_r)) 
                       & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_nph_r));
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_pd_c 
                    = ((~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__start_ack_r)) 
                       & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_pd_r));
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_ph_c 
                    = ((~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__start_ack_r)) 
                       & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_ph_r));
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_c 
                    = ((~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__start_ack_r)) 
                       & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_r));
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_c 
                    = ((~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__start_ack_r)) 
                       & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_r));
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_c 
                    = ((~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__start_ack_r)) 
                       & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_r));
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_state 
                    = ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state) 
                       & (- (IData)((1U & (~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__start_ack_r))))));
            } else {
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_nph_c 
                    = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_nph_r;
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_pd_c 
                    = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_pd_r;
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_ph_c 
                    = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_ph_r;
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_c 
                    = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_r;
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_c 
                    = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_r;
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_c 
                    = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_r;
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_state = 5U;
            }
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_c 
                = (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r 
                   | ((- (IData)((1U & (~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))))) 
                      | (- (IData)((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__start_ack_r)))));
        }
    } else if ((2U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))) {
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_transmit_seq_c 
            = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_transmit_seq_r;
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__word_count_c 
            = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__word_count_r;
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_nph_c 
            = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_nph_r;
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_pd_c 
            = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_pd_r;
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_ph_c 
            = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_ph_r;
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_c 
            = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_r;
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_c 
            = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_r;
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_c 
            = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_r;
        if ((1U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))) {
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_state = 4U;
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_c 
                = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r;
        } else {
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_state 
                = ((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_0)
                    ? ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__m_axis_tlast_reg)
                        ? 3U : (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                    : (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state));
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_c 
                = vlSelfRef.__VdfgRegularize_h6e95ff9d_0_62;
        }
    } else if ((1U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))) {
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_transmit_seq_c 
            = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_transmit_seq_r;
        if (vlSelfRef.__VdfgRegularize_h6e95ff9d_0_0) {
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__word_count_c 
                = ((0x00000300U & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tdata_reg 
                                   << 8U)) | (0x000000ffU 
                                              & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tdata_reg 
                                                 >> 8U)));
            if (vlSelfRef.__VdfgRegularize_h6e95ff9d_0_5) {
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_pd_c 
                    = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_pd_r;
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_ph_c 
                    = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_ph_r;
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_c 
                    = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_r;
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_c 
                    = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_r;
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_c 
                    = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_r;
            } else {
                vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_pd_c 
                    = ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_pd_r) 
                       | (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_13));
                if (vlSelfRef.__VdfgRegularize_h6e95ff9d_0_13) {
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_ph_c 
                        = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_ph_r;
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_c 
                        = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_r;
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_c 
                        = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_r;
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_c 
                        = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_r;
                } else {
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_ph_c 
                        = ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_ph_r) 
                           | (0x30U == (0xf8U & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tdata_reg 
                                                 >> 0x00000010U))));
                    if ((0x30U == (0xf8U & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tdata_reg 
                                            >> 0x00000010U)))) {
                        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_c 
                            = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_r;
                        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_c 
                            = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_r;
                        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_c 
                            = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_r;
                    } else {
                        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_c 
                            = ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_r) 
                               | (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_50));
                        if (vlSelfRef.__VdfgRegularize_h6e95ff9d_0_50) {
                            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_c 
                                = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_r;
                            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_c 
                                = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_r;
                        } else {
                            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_c 
                                = ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_r) 
                                   | (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_61));
                            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_c 
                                = ((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_61)
                                    ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_r)
                                    : ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_r) 
                                       | ((0x4aU == 
                                           (0x000000ffU 
                                            & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tdata_reg 
                                               >> 0x00000010U))) 
                                          | (0x4bU 
                                             == (0x000000ffU 
                                                 & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tdata_reg 
                                                    >> 0x00000010U))))));
                        }
                    }
                }
            }
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_state = 2U;
        } else {
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__word_count_c 
                = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__word_count_r;
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_pd_c 
                = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_pd_r;
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_ph_c 
                = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_ph_r;
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_c 
                = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_r;
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_c 
                = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_r;
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_c 
                = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_r;
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_state 
                = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state;
        }
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_nph_c 
            = ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_nph_r) 
               | ((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_5) 
                  & (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_0)));
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_c 
            = vlSelfRef.__VdfgRegularize_h6e95ff9d_0_62;
    } else {
        if (vlSelfRef.__VdfgRegularize_h6e95ff9d_0_6) {
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_transmit_seq_c 
                = ((0x0000ff00U & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tdata_reg 
                                   << 8U)) | (0x000000ffU 
                                              & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tdata_reg 
                                                 >> 8U)));
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_state = 1U;
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_c 
                = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_crc16_inst__DOT__crcOut;
        } else {
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_transmit_seq_c 
                = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_transmit_seq_r;
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_state 
                = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state;
            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_c 
                = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r;
        }
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__word_count_c 
            = (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__word_count_r 
               & (- (IData)((1U & (~ (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_6))))));
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_nph_c 
            = ((~ (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_6)) 
               & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_nph_r));
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_pd_c 
            = ((~ (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_6)) 
               & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_pd_r));
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_ph_c 
            = ((~ (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_6)) 
               & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_ph_r));
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_c 
            = ((~ (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_6)) 
               & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_r));
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_c 
            = ((~ (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_6)) 
               & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_r));
        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_c 
            = ((~ (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_6)) 
               & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_r));
    }
}

void Vtb_pcie_datalink_layer___024root___trigger_orInto__act_vec_vec(VlUnpacked<QData/*63:0*/, 1> &out, const VlUnpacked<QData/*63:0*/, 1> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_pcie_datalink_layer___024root___trigger_orInto__act_vec_vec\n"); );
    // Locals
    IData/*31:0*/ n;
    // Body
    n = 0U;
    do {
        out[n] = (out[n] | in[n]);
        n = ((IData)(1U) + n);
    } while ((0U >= n));
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vtb_pcie_datalink_layer___024root___dump_triggers__act(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag);
#endif  // VL_DEBUG

bool Vtb_pcie_datalink_layer___024root___eval_phase__act(Vtb_pcie_datalink_layer___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_pcie_datalink_layer___024root___eval_phase__act\n"); );
    Vtb_pcie_datalink_layer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    {
        // Inlined CFunc: _eval_triggers_vec__act
        vlSelfRef.__VactTriggered[0U] = (QData)((IData)(
                                                        ((((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__rst) 
                                                           & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__tb_pcie_datalink_layer__DOT__rst__0))) 
                                                          << 1U) 
                                                         | ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__clk) 
                                                            & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__tb_pcie_datalink_layer__DOT__clk__0))))));
        vlSelfRef.__Vtrigprevexpr___TOP__tb_pcie_datalink_layer__DOT__clk__0 
            = vlSelfRef.tb_pcie_datalink_layer__DOT__clk;
        vlSelfRef.__Vtrigprevexpr___TOP__tb_pcie_datalink_layer__DOT__rst__0 
            = vlSelfRef.tb_pcie_datalink_layer__DOT__rst;
    }
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vtb_pcie_datalink_layer___024root___dump_triggers__act(vlSelfRef.__VactTriggered, "act"s);
    }
#endif
    Vtb_pcie_datalink_layer___024root___trigger_orInto__act_vec_vec(vlSelfRef.__VnbaTriggered, vlSelfRef.__VactTriggered);
    return (0U);
}

void Vtb_pcie_datalink_layer___024root___trigger_clear__act(VlUnpacked<QData/*63:0*/, 1> &out) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_pcie_datalink_layer___024root___trigger_clear__act\n"); );
    // Locals
    IData/*31:0*/ n;
    // Body
    n = 0U;
    do {
        out[n] = 0ULL;
        n = ((IData)(1U) + n);
    } while ((1U > n));
}

bool Vtb_pcie_datalink_layer___024root___trigger_anySet__act(const VlUnpacked<QData/*63:0*/, 1> &in);
void Vtb_pcie_datalink_layer___024root___nba_sequent__TOP__0(Vtb_pcie_datalink_layer___024root* vlSelf);
void Vtb_pcie_datalink_layer___024root___nba_sequent__TOP__1(Vtb_pcie_datalink_layer___024root* vlSelf);

bool Vtb_pcie_datalink_layer___024root___eval_phase__nba(Vtb_pcie_datalink_layer___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_pcie_datalink_layer___024root___eval_phase__nba\n"); );
    Vtb_pcie_datalink_layer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VnbaExecute;
    // Body
    __VnbaExecute = Vtb_pcie_datalink_layer___024root___trigger_anySet__act(vlSelfRef.__VnbaTriggered);
    if (__VnbaExecute) {
        {
            // Inlined CFunc: _eval_nba
            if ((1ULL & vlSelfRef.__VnbaTriggered[0U])) {
                Vtb_pcie_datalink_layer___024root___nba_sequent__TOP__0(vlSelf);
                vlSelfRef.__Vm_traceActivity[1U] = 1U;
                Vtb_pcie_datalink_layer___024root___nba_sequent__TOP__1(vlSelf);
            }
            if ((3ULL & vlSelfRef.__VnbaTriggered[0U])) {
                {
                    // Inlined CFunc: _nba_sequent__TOP__2
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__soft_reset_r 
                        = ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__rst) 
                           || (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__soft_reset_c));
                    if (vlSelfRef.tb_pcie_datalink_layer__DOT__rst) {
                        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__curr_state = 0U;
                        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__link_status_r = 0U;
                    } else {
                        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__curr_state 
                            = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__next_state;
                        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__link_status_r 
                            = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__link_status_c;
                    }
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__init_flow_control_r 
                        = ((1U & (~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__rst))) 
                           && (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__init_flow_control_c));
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__rst 
                        = ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__rst) 
                           | (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__soft_reset_r));
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__soft_reset_c 
                        = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__soft_reset_r;
                    if ((4U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__curr_state))) {
                        if ((1U & (~ ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__curr_state) 
                                      >> 1U)))) {
                            if ((1U & (~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__curr_state)))) {
                                if ((1U & (~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__phy_link_up)))) {
                                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__soft_reset_c = 1U;
                                }
                            }
                        }
                    } else if ((2U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__curr_state))) {
                        if ((1U & (~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__phy_link_up)))) {
                            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__soft_reset_c = 1U;
                        }
                    } else if ((1U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__curr_state))) {
                        if ((1U & (~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__phy_link_up)))) {
                            vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__soft_reset_c = 1U;
                        }
                    } else if (vlSelfRef.tb_pcie_datalink_layer__DOT__phy_link_up) {
                        vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__soft_reset_c = 0U;
                    }
                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__init_flow_control_c 
                        = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__init_flow_control_r;
                    if ((1U & (~ ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__curr_state) 
                                  >> 2U)))) {
                        if ((1U & (~ ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__curr_state) 
                                      >> 1U)))) {
                            if ((1U & (~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__curr_state)))) {
                                if (vlSelfRef.tb_pcie_datalink_layer__DOT__phy_link_up) {
                                    vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__init_flow_control_c = 1U;
                                }
                            }
                        }
                    }
                }
                vlSelfRef.__Vm_traceActivity[2U] = 1U;
            }
            if ((3ULL & vlSelfRef.__VnbaTriggered[0U])) {
                Vtb_pcie_datalink_layer___024root___nba_comb__TOP__0(vlSelf);
                vlSelfRef.__Vm_traceActivity[3U] = 1U;
            }
        }
        Vtb_pcie_datalink_layer___024root___trigger_clear__act(vlSelfRef.__VnbaTriggered);
    }
    return (__VnbaExecute);
}

void Vtb_pcie_datalink_layer___024root___eval(Vtb_pcie_datalink_layer___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_pcie_datalink_layer___024root___eval\n"); );
    Vtb_pcie_datalink_layer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    IData/*31:0*/ __VnbaIterCount;
    // Body
    __VnbaIterCount = 0U;
    do {
        if (VL_UNLIKELY(((0x00002710U < __VnbaIterCount)))) {
#ifdef VL_DEBUG
            Vtb_pcie_datalink_layer___024root___dump_triggers__act(vlSelfRef.__VnbaTriggered, "nba"s);
#endif
            VL_FATAL_MT("tb/dllp/tb_pcie_datalink_layer.v", 35, "", "DIDNOTCONVERGE: NBA region did not converge after '--converge-limit' of 10000 tries");
        }
        __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
        vlSelfRef.__VactIterCount = 0U;
        do {
            if (VL_UNLIKELY(((0x00002710U < vlSelfRef.__VactIterCount)))) {
#ifdef VL_DEBUG
                Vtb_pcie_datalink_layer___024root___dump_triggers__act(vlSelfRef.__VactTriggered, "act"s);
#endif
                VL_FATAL_MT("tb/dllp/tb_pcie_datalink_layer.v", 35, "", "DIDNOTCONVERGE: Active region did not converge after '--converge-limit' of 10000 tries");
            }
            vlSelfRef.__VactIterCount = ((IData)(1U) 
                                         + vlSelfRef.__VactIterCount);
            vlSelfRef.__VactPhaseResult = Vtb_pcie_datalink_layer___024root___eval_phase__act(vlSelf);
        } while (vlSelfRef.__VactPhaseResult);
        vlSelfRef.__VnbaPhaseResult = Vtb_pcie_datalink_layer___024root___eval_phase__nba(vlSelf);
    } while (vlSelfRef.__VnbaPhaseResult);
}

#ifdef VL_DEBUG
void Vtb_pcie_datalink_layer___024root___eval_debug_assertions(Vtb_pcie_datalink_layer___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_pcie_datalink_layer___024root___eval_debug_assertions\n"); );
    Vtb_pcie_datalink_layer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}
#endif  // VL_DEBUG
