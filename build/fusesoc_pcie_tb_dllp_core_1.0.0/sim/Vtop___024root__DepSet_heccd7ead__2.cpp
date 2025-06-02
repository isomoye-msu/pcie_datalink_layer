// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtop.h for the primary calling header

#include "verilated.h"
#include "verilated_dpi.h"

#include "Vtop___024root.h"

VL_INLINE_OPT void Vtop___024root___nba_sequent__TOP__2(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_sequent__TOP__2\n"); );
    // Body
    if (vlSelf->rst_i) {
        vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__curr_state = 0U;
        vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__link_status_r = 0U;
    } else {
        vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__curr_state 
            = vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__next_state;
        vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__link_status_r 
            = vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__link_status_c;
    }
    vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__soft_reset_r 
        = ((IData)(vlSelf->rst_i) | (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__soft_reset_c));
    vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__init_flow_control_r 
        = ((~ (IData)(vlSelf->rst_i)) & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__init_flow_control_c));
    vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__soft_reset_c 
        = vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__soft_reset_r;
    if ((4U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__curr_state))) {
        if ((1U & (~ ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__curr_state) 
                      >> 1U)))) {
            if ((1U & (~ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__curr_state)))) {
                if ((1U & (~ (IData)(vlSelf->phy_link_up_i)))) {
                    vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__soft_reset_c = 1U;
                }
            }
        }
    } else if ((2U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__curr_state))) {
        if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__curr_state))) {
            if ((1U & (~ (IData)(vlSelf->phy_link_up_i)))) {
                vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__soft_reset_c = 1U;
            }
        } else if ((1U & (~ (IData)(vlSelf->phy_link_up_i)))) {
            vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__soft_reset_c = 1U;
        }
    } else if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__curr_state))) {
        if ((1U & (~ (IData)(vlSelf->phy_link_up_i)))) {
            vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__soft_reset_c = 1U;
        }
    } else if (vlSelf->phy_link_up_i) {
        vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__soft_reset_c = 0U;
    }
    vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__soft_reset_o 
        = vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__soft_reset_r;
    vlSelf->pcie_datalink_layer__DOT____Vcellinp__arbiter_mux_inst__rst 
        = ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__soft_reset_r) 
           | (IData)(vlSelf->rst_i));
    vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__link_status_o 
        = vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__link_status_r;
    vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__init_flow_control_c 
        = vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__init_flow_control_r;
    if ((1U & (~ ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__curr_state) 
                  >> 2U)))) {
        if ((1U & (~ ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__curr_state) 
                      >> 1U)))) {
            if ((1U & (~ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__curr_state)))) {
                if (vlSelf->phy_link_up_i) {
                    vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__init_flow_control_c = 1U;
                }
            }
        }
    }
    vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__init_flow_control_o 
        = vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__init_flow_control_r;
    vlSelf->pcie_datalink_layer__DOT__soft_reset = vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__soft_reset_o;
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__rst_i 
        = vlSelf->pcie_datalink_layer__DOT____Vcellinp__arbiter_mux_inst__rst;
    vlSelf->pcie_datalink_layer__DOT__arbiter_mux_inst__DOT__rst 
        = vlSelf->pcie_datalink_layer__DOT____Vcellinp__arbiter_mux_inst__rst;
    vlSelf->pcie_datalink_layer__DOT__dllp_transmit_inst__DOT__rst_i 
        = vlSelf->pcie_datalink_layer__DOT____Vcellinp__arbiter_mux_inst__rst;
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__rst_i 
        = vlSelf->pcie_datalink_layer__DOT____Vcellinp__arbiter_mux_inst__rst;
    vlSelf->pcie_datalink_layer__DOT__link_status = vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__link_status_o;
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__link_status_i 
        = vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__link_status_o;
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__start_flow_control_i 
        = vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__init_flow_control_o;
    vlSelf->pcie_datalink_layer__DOT__init_flow_control 
        = vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__init_flow_control_o;
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__rst 
        = vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__rst_i;
    vlSelf->pcie_datalink_layer__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__rst 
        = vlSelf->pcie_datalink_layer__DOT__arbiter_mux_inst__DOT__rst;
    vlSelf->pcie_datalink_layer__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__rst_i 
        = vlSelf->pcie_datalink_layer__DOT__dllp_transmit_inst__DOT__rst_i;
    vlSelf->pcie_datalink_layer__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__rst 
        = vlSelf->pcie_datalink_layer__DOT__dllp_transmit_inst__DOT__rst_i;
    vlSelf->pcie_datalink_layer__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__rst_i 
        = vlSelf->pcie_datalink_layer__DOT__dllp_transmit_inst__DOT__rst_i;
    vlSelf->pcie_datalink_layer__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__rst_i 
        = vlSelf->pcie_datalink_layer__DOT__dllp_transmit_inst__DOT__rst_i;
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__rst_i 
        = vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__rst_i;
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__rst_i 
        = vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__rst_i;
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__rst_i 
        = vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__rst_i;
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__rst_i 
        = vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__rst_i;
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__link_status_i 
        = vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__link_status_i;
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__link_status_i 
        = vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__link_status_i;
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__link_status_i 
        = vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__link_status_i;
    vlSelf->pcie_datalink_layer__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__rst 
        = vlSelf->pcie_datalink_layer__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__rst;
    vlSelf->pcie_datalink_layer__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__0__KET____DOT__axis_retry_fifo_inst__DOT__rst_i 
        = vlSelf->pcie_datalink_layer__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__rst_i;
    vlSelf->pcie_datalink_layer__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__1__KET____DOT__axis_retry_fifo_inst__DOT__rst_i 
        = vlSelf->pcie_datalink_layer__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__rst_i;
    vlSelf->pcie_datalink_layer__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__2__KET____DOT__axis_retry_fifo_inst__DOT__rst_i 
        = vlSelf->pcie_datalink_layer__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__rst_i;
    vlSelf->pcie_datalink_layer__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__rst 
        = vlSelf->pcie_datalink_layer__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__rst_i;
    vlSelf->pcie_datalink_layer__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_flow_inst__DOT__rst 
        = vlSelf->pcie_datalink_layer__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__rst_i;
    vlSelf->pcie_datalink_layer__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_output_register_inst__DOT__rst 
        = vlSelf->pcie_datalink_layer__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__rst_i;
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__rst 
        = vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__rst_i;
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__rst 
        = vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__rst_i;
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__rst 
        = vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__rst_i;
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__rst 
        = vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__rst_i;
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__rst 
        = vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__rst_i;
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__rst 
        = vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__rst_i;
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__rst 
        = vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__rst_i;
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__rst 
        = vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__rst_i;
}

VL_INLINE_OPT void Vtop___024root___nba_comb__TOP__0(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_comb__TOP__0\n"); );
    // Body
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_crc16_inst__DOT__crcOut 
        = ((0U == (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_byte_select))
            ? vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_crc16_inst__DOT__pcie_crc8_inst0__DOT__crcOut
            : ((1U == (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_byte_select))
                ? vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_crc16_inst__DOT__pcie_crc8_inst1__DOT__crcOut
                : ((2U == (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_byte_select))
                    ? vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_crc16_inst__DOT__pcie_crc8_inst2__DOT__crcOut
                    : ((3U == (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_byte_select))
                        ? vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_crc16_inst__DOT__pcie_crc8_inst3__DOT__crcOut
                        : 0U))));
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_output 
        = vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_crc16_inst__DOT__crcOut;
}

extern const VlUnpacked<CData/*0:0*/, 32> Vtop__ConstPool__TABLE_h18b094e1_0;
extern const VlUnpacked<CData/*0:0*/, 32> Vtop__ConstPool__TABLE_h16f08759_0;
extern const VlUnpacked<CData/*0:0*/, 32> Vtop__ConstPool__TABLE_hef51093e_0;
extern const VlUnpacked<CData/*0:0*/, 32> Vtop__ConstPool__TABLE_h4c120632_0;
extern const VlUnpacked<CData/*0:0*/, 32> Vtop__ConstPool__TABLE_h31c4cd05_0;

VL_INLINE_OPT void Vtop___024root___nba_comb__TOP__1(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_comb__TOP__1\n"); );
    // Init
    CData/*0:0*/ pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT____VdfgTmp_h68cb8757__0;
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT____VdfgTmp_h68cb8757__0 = 0;
    CData/*0:0*/ pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT____VdfgTmp_h93a27a88__0;
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT____VdfgTmp_h93a27a88__0 = 0;
    CData/*0:0*/ pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT____VdfgTmp_h6e9b026a__0;
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT____VdfgTmp_h6e9b026a__0 = 0;
    CData/*0:0*/ pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT____VdfgTmp_h68c91218__0;
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT____VdfgTmp_h68c91218__0 = 0;
    CData/*0:0*/ pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT____VdfgTmp_h3f454e02__0;
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT____VdfgTmp_h3f454e02__0 = 0;
    CData/*0:0*/ pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h03f6d13a__0;
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h03f6d13a__0 = 0;
    CData/*0:0*/ pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_hf84ccbd6__0;
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_hf84ccbd6__0 = 0;
    CData/*0:0*/ pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_haca89824__0;
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_haca89824__0 = 0;
    CData/*0:0*/ pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h3639f67b__0;
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h3639f67b__0 = 0;
    CData/*0:0*/ pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h3634ff9b__0;
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h3634ff9b__0 = 0;
    CData/*0:0*/ pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h36308f16__0;
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h36308f16__0 = 0;
    CData/*0:0*/ pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h363e2766__0;
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h363e2766__0 = 0;
    CData/*0:0*/ pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h3608ac7c__0;
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h3608ac7c__0 = 0;
    CData/*0:0*/ pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h360c9c01__0;
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h360c9c01__0 = 0;
    CData/*0:0*/ pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h36e44f7c__0;
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h36e44f7c__0 = 0;
    CData/*0:0*/ pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h03f6d13a__0;
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h03f6d13a__0 = 0;
    CData/*0:0*/ pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_hf84ccbd6__0;
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_hf84ccbd6__0 = 0;
    CData/*0:0*/ pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_ha9b3a581__0;
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_ha9b3a581__0 = 0;
    CData/*0:0*/ pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_haca89824__0;
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_haca89824__0 = 0;
    CData/*0:0*/ pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h3639f67b__0;
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h3639f67b__0 = 0;
    CData/*0:0*/ pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h3634ff9b__0;
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h3634ff9b__0 = 0;
    CData/*0:0*/ pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h36308f16__0;
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h36308f16__0 = 0;
    CData/*0:0*/ pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h363e2766__0;
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h363e2766__0 = 0;
    CData/*0:0*/ pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h3608ac7c__0;
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h3608ac7c__0 = 0;
    CData/*0:0*/ pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h36e29791__0;
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h36e29791__0 = 0;
    CData/*0:0*/ pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h360c9c01__0;
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h360c9c01__0 = 0;
    CData/*0:0*/ pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h36e44f7c__0;
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h36e44f7c__0 = 0;
    CData/*0:0*/ pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h03f6d13a__0;
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h03f6d13a__0 = 0;
    CData/*0:0*/ pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_hf84ccbd6__0;
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_hf84ccbd6__0 = 0;
    CData/*0:0*/ pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_ha9b3a581__0;
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_ha9b3a581__0 = 0;
    CData/*0:0*/ pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_haca89824__0;
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_haca89824__0 = 0;
    CData/*0:0*/ __VdfgTmp_hcafa0ae0__0;
    __VdfgTmp_hcafa0ae0__0 = 0;
    CData/*0:0*/ __VdfgTmp_h4d7aab14__0;
    __VdfgTmp_h4d7aab14__0 = 0;
    CData/*0:0*/ __VdfgTmp_h4cea4a0b__0;
    __VdfgTmp_h4cea4a0b__0 = 0;
    CData/*0:0*/ __VdfgTmp_he53401f6__0;
    __VdfgTmp_he53401f6__0 = 0;
    CData/*0:0*/ __VdfgTmp_h2cabaaf1__0;
    __VdfgTmp_h2cabaaf1__0 = 0;
    CData/*0:0*/ __VdfgTmp_h453b4c1c__0;
    __VdfgTmp_h453b4c1c__0 = 0;
    CData/*0:0*/ __VdfgTmp_h15d11a25__0;
    __VdfgTmp_h15d11a25__0 = 0;
    CData/*0:0*/ __VdfgTmp_h080f03ba__0;
    __VdfgTmp_h080f03ba__0 = 0;
    CData/*0:0*/ __VdfgTmp_h4e36faf4__0;
    __VdfgTmp_h4e36faf4__0 = 0;
    CData/*0:0*/ __VdfgTmp_hdc13fa9f__0;
    __VdfgTmp_hdc13fa9f__0 = 0;
    CData/*0:0*/ __VdfgTmp_h30bc4225__0;
    __VdfgTmp_h30bc4225__0 = 0;
    CData/*0:0*/ __VdfgTmp_h02aea5d1__0;
    __VdfgTmp_h02aea5d1__0 = 0;
    CData/*0:0*/ __VdfgTmp_hd70e4e3b__0;
    __VdfgTmp_hd70e4e3b__0 = 0;
    CData/*0:0*/ __VdfgTmp_hf31ac05b__0;
    __VdfgTmp_hf31ac05b__0 = 0;
    CData/*0:0*/ __VdfgTmp_h152ea47b__0;
    __VdfgTmp_h152ea47b__0 = 0;
    CData/*0:0*/ __VdfgTmp_h5d52c0f3__0;
    __VdfgTmp_h5d52c0f3__0 = 0;
    CData/*4:0*/ __Vtableidx1;
    __Vtableidx1 = 0;
    // Body
    vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__link_status_c 
        = vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__link_status_r;
    if ((1U & (~ ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__curr_state) 
                  >> 2U)))) {
        if ((2U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__curr_state))) {
            if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__curr_state))) {
                if (vlSelf->phy_link_up_i) {
                    if (vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__fc2_values_stored_o) {
                        vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__link_status_c = 2U;
                    }
                }
            } else if (vlSelf->phy_link_up_i) {
                if (vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__fc1_values_stored_o) {
                    vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__link_status_c = 1U;
                }
            }
        } else if ((1U & (~ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__curr_state)))) {
            vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__link_status_c = 0U;
        }
    }
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__timer_c 
        = vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__timer_r;
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__next_state 
        = vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__curr_state;
    if ((1U & (~ ((IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__curr_state) 
                  >> 4U)))) {
        if ((8U & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__curr_state))) {
            if ((1U & (~ ((IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__curr_state) 
                          >> 2U)))) {
                if ((1U & (~ ((IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__curr_state) 
                              >> 1U)))) {
                    if ((1U & (~ (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__curr_state)))) {
                        if (vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                            vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__timer_c = 0U;
                        }
                    }
                    if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__curr_state))) {
                        if ((1U & (~ (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__start_flow_control)))) {
                            vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__next_state = 0U;
                        }
                    } else if (vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                        vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__next_state = 9U;
                    }
                }
            }
        } else {
            if ((1U & (~ ((IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__curr_state) 
                          >> 2U)))) {
                if ((1U & (~ ((IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__curr_state) 
                              >> 1U)))) {
                    if ((1U & (~ (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__curr_state)))) {
                        vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__timer_c 
                            = ((0x7d0U <= (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__timer_r))
                                ? 0x7d0U : (0xffffU 
                                            & ((IData)(1U) 
                                               + (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__timer_r))));
                        if (vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__start_flow_control) {
                            vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__timer_c = 0U;
                        } else if (((0x7d0U <= (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__timer_r)) 
                                    & (2U == (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__link_status_o)))) {
                            vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__timer_c = 0U;
                        }
                    }
                }
            }
            if ((4U & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__curr_state))) {
                if ((2U & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__curr_state))) {
                    if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__curr_state))) {
                        if (vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                            vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__next_state = 8U;
                        }
                    } else if (vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                        vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__next_state = 7U;
                    }
                } else if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__curr_state))) {
                    if (vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                        vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__next_state = 6U;
                    }
                } else if (vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__next_state = 5U;
                }
            } else if ((2U & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__curr_state))) {
                if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__curr_state))) {
                    if (vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                        vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__next_state = 4U;
                    }
                } else if (vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__next_state = 3U;
                    if (vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__tlp_nullified) {
                        vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__next_state = 9U;
                    }
                }
            } else if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__curr_state))) {
                if (vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__next_state = 2U;
                }
            } else if (vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__start_flow_control) {
                vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__next_state = 1U;
            } else if (((0x7d0U <= (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__timer_r)) 
                        & (2U == (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__link_status_o)))) {
                vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__next_state = 3U;
            }
        }
    }
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c 
        = vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r;
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__next_state 
        = vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state;
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tlast = 0U;
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tkeep = 0U;
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__init_ack_o = 0U;
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tvalid = 0U;
    if ((0x10U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
        if ((1U & (~ ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state) 
                      >> 3U)))) {
            if ((1U & (~ ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state) 
                          >> 2U)))) {
                if ((1U & (~ ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state) 
                              >> 1U)))) {
                    if ((1U & (~ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state)))) {
                        vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c 
                            = (0xffffU & ((IData)(1U) 
                                          + (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r)));
                        if (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                            vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tvalid = 0U;
                            if (vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__fc2_values_stored_o) {
                                vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c = 0U;
                                vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__next_state = 0x11U;
                                vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tvalid = 0U;
                            } else if ((0xa0U <= (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))) {
                                vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c = 0U;
                                vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__next_state = 8U;
                                vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tvalid = 0U;
                            }
                        }
                    }
                }
            }
        }
    } else if ((8U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
        if ((4U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
            if ((2U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
                if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
                    if (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                        vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c = 0U;
                        vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__next_state = 0x10U;
                        vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tvalid = 1U;
                    }
                } else {
                    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c 
                        = (0xffffU & ((IData)(1U) + (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r)));
                    if (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                        vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tvalid = 0U;
                        if ((0xa0U <= (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))) {
                            vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c = 0U;
                            vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__next_state = 0xfU;
                            vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tvalid = 1U;
                        }
                    }
                }
            } else if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
                if (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c = 0U;
                    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__next_state = 0xeU;
                    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tvalid = 1U;
                }
            } else {
                vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c 
                    = (0xffffU & ((IData)(1U) + (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r)));
                if (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tvalid = 0U;
                    if ((0xa0U <= (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))) {
                        vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c = 0U;
                        vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__next_state = 0xdU;
                        vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tvalid = 1U;
                    }
                }
            }
        } else if ((1U & (~ ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state) 
                             >> 1U)))) {
            if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
                if (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c = 0U;
                    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__next_state = 0xcU;
                    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tvalid = 1U;
                }
            } else {
                vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c 
                    = (0xffffU & ((IData)(1U) + (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r)));
                if (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tvalid = 0U;
                    if ((0xa0U <= (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))) {
                        vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c = 0U;
                        vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__next_state = 9U;
                        vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tvalid = 1U;
                    }
                }
            }
        }
    } else if ((4U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
        if ((2U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
            if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
                vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c 
                    = ((0xa0U <= (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))
                        ? 0xa0U : (0xffffU & ((IData)(1U) 
                                              + (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))));
                if (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                    if (vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__fc1_values_stored_o) {
                        vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c = 0U;
                        vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__next_state = 8U;
                    } else if ((0xa0U <= (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))) {
                        vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c = 0U;
                        vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__next_state = 0U;
                        if (vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__fc1_values_stored_o) {
                            vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c = 0U;
                            vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__next_state = 8U;
                        }
                    }
                    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tvalid = 0U;
                    if ((1U & (~ (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__fc1_values_stored_o)))) {
                        if ((0xa0U <= (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))) {
                            vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tvalid = 0U;
                        }
                    }
                }
            } else if (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c = 0U;
                vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__next_state = 7U;
                vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tvalid = 1U;
            }
        } else if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
            vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c 
                = (0xffffU & ((IData)(1U) + (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r)));
            if (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tvalid = 0U;
                if ((0xa0U <= (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))) {
                    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c = 0U;
                    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__next_state = 6U;
                    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tvalid = 1U;
                }
            }
        } else if (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
            vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c = 0U;
            vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__next_state = 5U;
            vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tvalid = 1U;
        }
    } else if ((2U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
        if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
            vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c 
                = (0xffffU & ((IData)(1U) + (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r)));
            if (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tvalid = 0U;
                if ((0xa0U <= (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))) {
                    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c = 0U;
                    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__next_state = 4U;
                    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tvalid = 1U;
                }
            }
        } else {
            vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c 
                = ((0xa0U <= (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))
                    ? 0xa0U : (0xffffU & ((IData)(1U) 
                                          + (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))));
            if (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c = 0U;
                vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__next_state = 3U;
                vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tvalid = 0U;
            }
        }
    } else if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
        if (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
            vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c = 0U;
            vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__next_state = 2U;
            vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tvalid = 1U;
        }
    } else if (((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__init_flow_control_o) 
                & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready))) {
        vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c = 0U;
        vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__next_state = 1U;
        vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tvalid = 1U;
    }
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata = 0U;
    if ((1U & (~ ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state) 
                  >> 4U)))) {
        if ((8U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
            if ((4U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
                if ((2U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
                    if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
                        if (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                            vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tlast = 1U;
                            vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tkeep = 3U;
                        }
                    } else if (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                        if ((0xa0U <= (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))) {
                            vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tlast = 0U;
                            vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tkeep = 0xfU;
                        }
                    }
                } else if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
                    if (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                        vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tlast = 1U;
                        vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tkeep = 3U;
                    }
                } else if (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                    if ((0xa0U <= (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))) {
                        vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tlast = 0U;
                        vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tkeep = 0xfU;
                    }
                }
            } else if ((1U & (~ ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state) 
                                 >> 1U)))) {
                if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
                    if (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                        vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tlast = 1U;
                        vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tkeep = 3U;
                    }
                } else if (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                    if ((0xa0U <= (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))) {
                        vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tlast = 0U;
                        vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tkeep = 0xfU;
                    }
                }
            }
        } else if ((4U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
            if ((2U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
                if ((1U & (~ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state)))) {
                    if (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                        vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tlast = 1U;
                        vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tkeep = 3U;
                    }
                }
            } else if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
                if (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                    if ((0xa0U <= (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))) {
                        vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tlast = 0U;
                        vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tkeep = 0xfU;
                    }
                }
            } else if (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tlast = 1U;
                vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tkeep = 3U;
            }
        } else if ((2U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
            if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
                if (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                    if ((0xa0U <= (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))) {
                        vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tlast = 0U;
                        vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tkeep = 0xfU;
                    }
                }
            }
        } else if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
            if (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tlast = 1U;
                vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tkeep = 3U;
            }
        } else if (((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__init_flow_control_o) 
                    & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready))) {
            vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tlast = 0U;
            vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tkeep = 0xfU;
        }
        vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tlast 
            = vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tlast;
        vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tkeep 
            = vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tkeep;
        if ((1U & (~ ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state) 
                      >> 3U)))) {
            if ((1U & (~ ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state) 
                          >> 2U)))) {
                if ((1U & (~ ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state) 
                              >> 1U)))) {
                    if ((1U & (~ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state)))) {
                        if (((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__init_flow_control_o) 
                             & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready))) {
                            vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__init_ack_o = 1U;
                        }
                    }
                }
            }
        }
    } else {
        vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tlast 
            = vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tlast;
        vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tkeep 
            = vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tkeep;
    }
    vlSelf->pcie_datalink_layer__DOT__init_ack = vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__init_ack_o;
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tvalid 
        = vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tvalid;
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_early 
        = (1U & ((~ ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg) 
                     | ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tvalid_reg) 
                        & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tvalid)))) 
                 | (IData)(vlSelf->pcie_datalink_layer__DOT__phy_fc_axis_tready)));
    __Vtableidx1 = (((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tvalid) 
                     << 4U) | (((IData)(vlSelf->pcie_datalink_layer__DOT__phy_fc_axis_tready) 
                                << 3U) | (((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg) 
                                           << 2U) | 
                                          (((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg) 
                                            << 1U) 
                                           | (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tvalid_reg)))));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tvalid_next 
        = Vtop__ConstPool__TABLE_h18b094e1_0[__Vtableidx1];
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_next 
        = Vtop__ConstPool__TABLE_h16f08759_0[__Vtableidx1];
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__store_axis_input_to_output 
        = Vtop__ConstPool__TABLE_hef51093e_0[__Vtableidx1];
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__store_axis_input_to_temp 
        = Vtop__ConstPool__TABLE_h4c120632_0[__Vtableidx1];
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__store_axis_temp_to_output 
        = Vtop__ConstPool__TABLE_h31c4cd05_0[__Vtableidx1];
    if ((1U & (~ ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state) 
                  >> 4U)))) {
        if ((8U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
            if ((4U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
                if ((2U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
                    if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
                        if (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                            vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata 
                                = vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__crc_reversed;
                        }
                    } else if (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                        if ((0xa0U <= (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))) {
                            vlSelf->__Vfunc_send_fc_init__0__unnamedblk1__DOT__dll_packet = 0ULL;
                            vlSelf->__Vfunc_send_fc_init__0__unnamedblk1__DOT__dll_packet 
                                = (0xe0ULL | (0xffffffffc000ULL 
                                              & vlSelf->__Vfunc_send_fc_init__0__unnamedblk1__DOT__dll_packet));
                            vlSelf->__Vfunc_send_fc_init__0__unnamedblk1__DOT__dll_packet 
                                = (0x400000ULL | (0xffffff3fffffULL 
                                                  & vlSelf->__Vfunc_send_fc_init__0__unnamedblk1__DOT__dll_packet));
                            vlSelf->__Vfunc_send_fc_init__0__unnamedblk1__DOT__dll_packet 
                                = (0xfffffff0ffffULL 
                                   & vlSelf->__Vfunc_send_fc_init__0__unnamedblk1__DOT__dll_packet);
                            vlSelf->__Vfunc_send_fc_init__0__unnamedblk1__DOT__dll_packet 
                                = (0x10000000ULL | 
                                   (0xffff00ffffffULL 
                                    & vlSelf->__Vfunc_send_fc_init__0__unnamedblk1__DOT__dll_packet));
                            vlSelf->__Vfunc_send_fc_init__0__Vfuncout 
                                = vlSelf->__Vfunc_send_fc_init__0__unnamedblk1__DOT__dll_packet;
                            vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata 
                                = (IData)(vlSelf->__Vfunc_send_fc_init__0__Vfuncout);
                        }
                    }
                } else if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
                    if (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                        vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata 
                            = vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__crc_reversed;
                    }
                } else if (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                    if ((0xa0U <= (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))) {
                        vlSelf->__Vfunc_send_fc_init__1__unnamedblk1__DOT__dll_packet = 0ULL;
                        vlSelf->__Vfunc_send_fc_init__1__unnamedblk1__DOT__dll_packet 
                            = (0xd0ULL | (0xffffffffc000ULL 
                                          & vlSelf->__Vfunc_send_fc_init__1__unnamedblk1__DOT__dll_packet));
                        vlSelf->__Vfunc_send_fc_init__1__unnamedblk1__DOT__dll_packet 
                            = (0x400000ULL | (0xffffff3fffffULL 
                                              & vlSelf->__Vfunc_send_fc_init__1__unnamedblk1__DOT__dll_packet));
                        vlSelf->__Vfunc_send_fc_init__1__unnamedblk1__DOT__dll_packet 
                            = (0xfffffff0ffffULL & vlSelf->__Vfunc_send_fc_init__1__unnamedblk1__DOT__dll_packet);
                        vlSelf->__Vfunc_send_fc_init__1__unnamedblk1__DOT__dll_packet 
                            = (0x1000000ULL | (0xffff00ffffffULL 
                                               & vlSelf->__Vfunc_send_fc_init__1__unnamedblk1__DOT__dll_packet));
                        vlSelf->__Vfunc_send_fc_init__1__Vfuncout 
                            = vlSelf->__Vfunc_send_fc_init__1__unnamedblk1__DOT__dll_packet;
                        vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata 
                            = (IData)(vlSelf->__Vfunc_send_fc_init__1__Vfuncout);
                    }
                }
            } else if ((1U & (~ ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state) 
                                 >> 1U)))) {
                if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
                    if (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                        vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata 
                            = vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__crc_reversed;
                    }
                } else if (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                    if ((0xa0U <= (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))) {
                        vlSelf->__Vfunc_send_fc_init__2__unnamedblk1__DOT__dll_packet = 0ULL;
                        vlSelf->__Vfunc_send_fc_init__2__unnamedblk1__DOT__dll_packet 
                            = (0xc0ULL | (0xffffffffc000ULL 
                                          & vlSelf->__Vfunc_send_fc_init__2__unnamedblk1__DOT__dll_packet));
                        vlSelf->__Vfunc_send_fc_init__2__unnamedblk1__DOT__dll_packet 
                            = (0x400000ULL | (0xffffff3fffffULL 
                                              & vlSelf->__Vfunc_send_fc_init__2__unnamedblk1__DOT__dll_packet));
                        vlSelf->__Vfunc_send_fc_init__2__unnamedblk1__DOT__dll_packet 
                            = (0xfffffff0ffffULL & vlSelf->__Vfunc_send_fc_init__2__unnamedblk1__DOT__dll_packet);
                        vlSelf->__Vfunc_send_fc_init__2__unnamedblk1__DOT__dll_packet 
                            = (0x10000000ULL | (0xffff00ffffffULL 
                                                & vlSelf->__Vfunc_send_fc_init__2__unnamedblk1__DOT__dll_packet));
                        vlSelf->__Vfunc_send_fc_init__2__Vfuncout 
                            = vlSelf->__Vfunc_send_fc_init__2__unnamedblk1__DOT__dll_packet;
                        vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata 
                            = (IData)(vlSelf->__Vfunc_send_fc_init__2__Vfuncout);
                    }
                }
            }
        } else if ((4U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
            if ((2U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
                if ((1U & (~ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state)))) {
                    if (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                        vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata 
                            = vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__crc_reversed;
                    }
                }
            } else if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
                if (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                    if ((0xa0U <= (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))) {
                        vlSelf->__Vfunc_send_fc_init__3__unnamedblk1__DOT__dll_packet = 0ULL;
                        vlSelf->__Vfunc_send_fc_init__3__unnamedblk1__DOT__dll_packet 
                            = (0x60ULL | (0xffffffffc000ULL 
                                          & vlSelf->__Vfunc_send_fc_init__3__unnamedblk1__DOT__dll_packet));
                        vlSelf->__Vfunc_send_fc_init__3__unnamedblk1__DOT__dll_packet 
                            = (0x400000ULL | (0xffffff3fffffULL 
                                              & vlSelf->__Vfunc_send_fc_init__3__unnamedblk1__DOT__dll_packet));
                        vlSelf->__Vfunc_send_fc_init__3__unnamedblk1__DOT__dll_packet 
                            = (0xfffffff0ffffULL & vlSelf->__Vfunc_send_fc_init__3__unnamedblk1__DOT__dll_packet);
                        vlSelf->__Vfunc_send_fc_init__3__unnamedblk1__DOT__dll_packet 
                            = (0x10000000ULL | (0xffff00ffffffULL 
                                                & vlSelf->__Vfunc_send_fc_init__3__unnamedblk1__DOT__dll_packet));
                        vlSelf->__Vfunc_send_fc_init__3__Vfuncout 
                            = vlSelf->__Vfunc_send_fc_init__3__unnamedblk1__DOT__dll_packet;
                        vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata 
                            = (IData)(vlSelf->__Vfunc_send_fc_init__3__Vfuncout);
                    }
                }
            } else if (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata 
                    = vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__crc_reversed;
            }
        } else if ((2U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
            if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
                if (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                    if ((0xa0U <= (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))) {
                        vlSelf->__Vfunc_send_fc_init__4__unnamedblk1__DOT__dll_packet = 0ULL;
                        vlSelf->__Vfunc_send_fc_init__4__unnamedblk1__DOT__dll_packet 
                            = (0x50ULL | (0xffffffffc000ULL 
                                          & vlSelf->__Vfunc_send_fc_init__4__unnamedblk1__DOT__dll_packet));
                        vlSelf->__Vfunc_send_fc_init__4__unnamedblk1__DOT__dll_packet 
                            = (0x400000ULL | (0xffffff3fffffULL 
                                              & vlSelf->__Vfunc_send_fc_init__4__unnamedblk1__DOT__dll_packet));
                        vlSelf->__Vfunc_send_fc_init__4__unnamedblk1__DOT__dll_packet 
                            = (0xfffffff0ffffULL & vlSelf->__Vfunc_send_fc_init__4__unnamedblk1__DOT__dll_packet);
                        vlSelf->__Vfunc_send_fc_init__4__unnamedblk1__DOT__dll_packet 
                            = (0x1000000ULL | (0xffff00ffffffULL 
                                               & vlSelf->__Vfunc_send_fc_init__4__unnamedblk1__DOT__dll_packet));
                        vlSelf->__Vfunc_send_fc_init__4__Vfuncout 
                            = vlSelf->__Vfunc_send_fc_init__4__unnamedblk1__DOT__dll_packet;
                        vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata 
                            = (IData)(vlSelf->__Vfunc_send_fc_init__4__Vfuncout);
                    }
                }
            }
        } else if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
            if (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata 
                    = vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__crc_reversed;
            }
        } else if (((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__init_flow_control_o) 
                    & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready))) {
            vlSelf->__Vfunc_send_fc_init__5__unnamedblk1__DOT__dll_packet = 0ULL;
            vlSelf->__Vfunc_send_fc_init__5__unnamedblk1__DOT__dll_packet 
                = (0x40ULL | (0xffffffffc000ULL & vlSelf->__Vfunc_send_fc_init__5__unnamedblk1__DOT__dll_packet));
            vlSelf->__Vfunc_send_fc_init__5__unnamedblk1__DOT__dll_packet 
                = (0x400000ULL | (0xffffff3fffffULL 
                                  & vlSelf->__Vfunc_send_fc_init__5__unnamedblk1__DOT__dll_packet));
            vlSelf->__Vfunc_send_fc_init__5__unnamedblk1__DOT__dll_packet 
                = (0xfffffff0ffffULL & vlSelf->__Vfunc_send_fc_init__5__unnamedblk1__DOT__dll_packet);
            vlSelf->__Vfunc_send_fc_init__5__unnamedblk1__DOT__dll_packet 
                = (0x10000000ULL | (0xffff00ffffffULL 
                                    & vlSelf->__Vfunc_send_fc_init__5__unnamedblk1__DOT__dll_packet));
            vlSelf->__Vfunc_send_fc_init__5__Vfuncout 
                = vlSelf->__Vfunc_send_fc_init__5__unnamedblk1__DOT__dll_packet;
            vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata 
                = (IData)(vlSelf->__Vfunc_send_fc_init__5__Vfuncout);
        }
    }
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tdata 
        = vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata;
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__data 
        = vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata;
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT__data 
        = (0xffU & (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata 
                    >> 0U));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT__data 
        = (0xffU & (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata 
                    >> 8U));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT__data 
        = (0xffU & (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata 
                    >> 0x10U));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT__data 
        = (0xffU & (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata 
                    >> 0x18U));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h68cb8757__0 
        = (1U & VL_REDXOR_32((0x90000000U & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata)));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h3f454e02__0 
        = (1U & VL_REDXOR_32((0x28000000U & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata)));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h68c91218__0 
        = (1U & VL_REDXOR_32((0x50000000U & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata)));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h3f454e02__0 
        = (1U & VL_REDXOR_32((0x280000U & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata)));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h6e9b026a__0 
        = (1U & VL_REDXOR_32((0xc0000000U & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata)));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h3f454e02__0 
        = (1U & VL_REDXOR_16((0x2800U & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata)));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h68c91218__0 
        = (1U & VL_REDXOR_32((0x500000U & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata)));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h68cb8757__0 
        = (1U & VL_REDXOR_32((0x900000U & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata)));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h6e9b026a__0 
        = (1U & VL_REDXOR_32((0xc00000U & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata)));
    vlSelf->__VdfgTmp_hf0c32f3e__0 = (1U & VL_REDXOR_8(
                                                       (0x71U 
                                                        & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata)));
    vlSelf->__VdfgTmp_hb06ef157__0 = (1U & (~ (1U & 
                                               VL_REDXOR_8(
                                                           (0xaeU 
                                                            & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata)))));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h68c91218__0 
        = (1U & VL_REDXOR_16((0x5000U & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata)));
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT____VdfgTmp_h3f454e02__0 
        = (1U & VL_REDXOR_8((0x28U & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata)));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h68cb8757__0 
        = (1U & VL_REDXOR_16((0x9000U & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata)));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h6e9b026a__0 
        = (1U & VL_REDXOR_16((0xc000U & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata)));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h3608ac7c__0 
        = (1U & VL_REDXOR_8((0x38U & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata)));
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT____VdfgTmp_h68c91218__0 
        = (1U & VL_REDXOR_8((0x50U & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata)));
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT____VdfgTmp_h68cb8757__0 
        = (1U & VL_REDXOR_8((0x90U & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata)));
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT____VdfgTmp_h6e9b026a__0 
        = (1U & VL_REDXOR_8((0xc0U & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata)));
    vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__init_ack_i 
        = vlSelf->pcie_datalink_layer__DOT__init_ack;
    vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__next_state 
        = vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__curr_state;
    if ((4U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__curr_state))) {
        if ((1U & (~ ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__curr_state) 
                      >> 1U)))) {
            if ((1U & (~ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__curr_state)))) {
                if ((1U & (~ (IData)(vlSelf->phy_link_up_i)))) {
                    vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__next_state = 0U;
                }
            }
        }
    } else if ((2U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__curr_state))) {
        if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__curr_state))) {
            if (vlSelf->phy_link_up_i) {
                if (vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__fc2_values_stored_o) {
                    vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__next_state = 4U;
                }
            } else {
                vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__next_state = 0U;
            }
        } else if (vlSelf->phy_link_up_i) {
            if (vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__fc1_values_stored_o) {
                vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__next_state = 3U;
            }
        } else {
            vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__next_state = 0U;
        }
    } else if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__curr_state))) {
        if (vlSelf->phy_link_up_i) {
            if (vlSelf->pcie_datalink_layer__DOT__init_ack) {
                vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__next_state = 2U;
            }
        } else {
            vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__next_state = 0U;
        }
    } else if (vlSelf->phy_link_up_i) {
        vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__next_state = 1U;
    }
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_hee0b7305__0 
        = (1U & (VL_REDXOR_32((0x6000000U & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata)) 
                 ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h68c91218__0)));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h93a27a88__0 
        = (1U & ((vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata 
                  >> 0x1bU) ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h6e9b026a__0)));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_hee0b7305__0 
        = (1U & (VL_REDXOR_32((0x60000U & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata)) 
                 ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h68c91218__0)));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h93a27a88__0 
        = (1U & ((vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata 
                  >> 0x13U) ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h6e9b026a__0)));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_hee0b7305__0 
        = (1U & (VL_REDXOR_16((0x600U & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata)) 
                 ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h68c91218__0)));
    vlSelf->__VdfgTmp_ha7dbf996__0 = (1U & (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata 
                                            ^ ((vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata 
                                                >> 1U) 
                                               ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT____VdfgTmp_h3f454e02__0))));
    vlSelf->__VdfgTmp_he946549f__0 = (1U & (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata 
                                            ^ ((vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata 
                                                >> 2U) 
                                               ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT____VdfgTmp_h3f454e02__0))));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h93a27a88__0 
        = (1U & ((vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata 
                  >> 0xbU) ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h6e9b026a__0)));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT____VdfgTmp_hee0b7305__0 
        = (1U & (VL_REDXOR_4((6U & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata)) 
                 ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT____VdfgTmp_h68c91218__0)));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h363e2766__0 
        = (1U & (VL_REDXOR_4((0xdU & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata)) 
                 ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT____VdfgTmp_h68c91218__0)));
    vlSelf->__VdfgTmp_ha6ba2a99__0 = (1U & (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata 
                                            ^ ((vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata 
                                                >> 1U) 
                                               ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT____VdfgTmp_h68cb8757__0))));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h360c9c01__0 
        = (1U & (~ ((vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata 
                     >> 2U) ^ ((vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata 
                                >> 3U) ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT____VdfgTmp_h68cb8757__0)))));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h36e29791__0 
        = (1U & (~ ((vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata 
                     >> 1U) ^ ((vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata 
                                >> 2U) ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT____VdfgTmp_h68cb8757__0)))));
    vlSelf->__VdfgTmp_hcac389da__0 = (1U & (VL_REDXOR_8(
                                                        (0x1dU 
                                                         & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata)) 
                                            ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT____VdfgTmp_h6e9b026a__0)));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h3634ff9b__0 
        = (1U & (~ (1U & (VL_REDXOR_8((0x27U & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata)) 
                          ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT____VdfgTmp_h6e9b026a__0)))));
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT____VdfgTmp_h93a27a88__0 
        = (1U & ((vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata 
                  >> 3U) ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT____VdfgTmp_h6e9b026a__0)));
    vlSelf->__VdfgTmp_hcb66166d__0 = (1U & (~ (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata 
                                               ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT____VdfgTmp_hee0b7305__0))));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_ha9b3a581__0 
        = ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h36e29791__0) 
           ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h363e2766__0));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h36e29791__0 
        = (1U & (((((((IData)(vlSelf->__VdfgTmp_ha6ba2a99__0) 
                      ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h36e29791__0)) 
                     ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h363e2766__0)) 
                    ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h3634ff9b__0)) 
                   ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h3608ac7c__0)) 
                  ^ VL_REDXOR_16((0x600U & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata))) 
                 ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h68cb8757__0)));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h36308f16__0 
        = (1U & (VL_REDXOR_4((6U & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata)) 
                 ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT____VdfgTmp_h93a27a88__0)));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h3639f67b__0 
        = (1U & (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata 
                 ^ ((vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata 
                     >> 1U) ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT____VdfgTmp_h93a27a88__0))));
    __VdfgTmp_hdc13fa9f__0 = ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_ha9b3a581__0) 
                              ^ ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h3634ff9b__0) 
                                 ^ ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h360c9c01__0) 
                                    ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_hee0b7305__0))));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc0 
        = (((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h3608ac7c__0) 
            << 0xfU) | (((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h360c9c01__0) 
                         << 0xeU) | (((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h36308f16__0) 
                                      << 0xdU) | (((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h3634ff9b__0) 
                                                   << 0xcU) 
                                                  | (((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h3639f67b__0) 
                                                      << 0xbU) 
                                                     | (((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h363e2766__0) 
                                                         << 0xaU) 
                                                        | (((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h36e29791__0) 
                                                            << 9U) 
                                                           | (((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h3639f67b__0) 
                                                               << 8U) 
                                                              | (((IData)(vlSelf->__VdfgTmp_hcac389da__0) 
                                                                  << 7U) 
                                                                 | (((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT____VdfgTmp_hee0b7305__0) 
                                                                     << 6U) 
                                                                    | (((IData)(vlSelf->__VdfgTmp_ha7dbf996__0) 
                                                                        << 5U) 
                                                                       | (((IData)(vlSelf->__VdfgTmp_he946549f__0) 
                                                                           << 4U) 
                                                                          | (((IData)(vlSelf->__VdfgTmp_hb06ef157__0) 
                                                                              << 3U) 
                                                                             | (((IData)(vlSelf->__VdfgTmp_hcb66166d__0) 
                                                                                << 2U) 
                                                                                | (((IData)(vlSelf->__VdfgTmp_ha6ba2a99__0) 
                                                                                << 1U) 
                                                                                | (IData)(vlSelf->__VdfgTmp_hf0c32f3e__0))))))))))))))));
    __VdfgTmp_hd70e4e3b__0 = (1U & (((((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_ha9b3a581__0) 
                                       ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h3639f67b__0)) 
                                      ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h36308f16__0)) 
                                     ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h3608ac7c__0)) 
                                    ^ VL_REDXOR_16(
                                                   (0xae00U 
                                                    & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata))));
    __VdfgTmp_h5d52c0f3__0 = (1U & (((((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h3639f67b__0) 
                                       ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h3634ff9b__0)) 
                                      ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h36308f16__0)) 
                                     ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h360c9c01__0)) 
                                    ^ VL_REDXOR_16(
                                                   (0x7100U 
                                                    & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata))));
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_hf84ccbd6__0 
        = vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h363e2766__0;
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h36308f16__0 
        = (1U & ((((((((IData)(vlSelf->__VdfgTmp_ha7dbf996__0) 
                       ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h36e29791__0)) 
                      ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h363e2766__0)) 
                     ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h3639f67b__0)) 
                    ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h360c9c01__0)) 
                   ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h3608ac7c__0)) 
                  ^ VL_REDXOR_16((0x600U & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata))) 
                 ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h93a27a88__0)));
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_haca89824__0 
        = ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h36e29791__0) 
           ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h3639f67b__0));
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h3634ff9b__0 
        = (1U & (((((((((IData)(vlSelf->__VdfgTmp_he946549f__0) 
                        ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h3639f67b__0)) 
                       ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h36e29791__0)) 
                      ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h363e2766__0)) 
                     ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h36308f16__0)) 
                    ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h360c9c01__0)) 
                   ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h3608ac7c__0)) 
                  ^ VL_REDXOR_16((0x2700U & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata))) 
                 ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h6e9b026a__0)));
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h360c9c01__0 
        = (1U & (((((((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT____VdfgTmp_hee0b7305__0) 
                      ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h363e2766__0)) 
                     ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h3639f67b__0)) 
                    ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h3634ff9b__0)) 
                   ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h3608ac7c__0)) 
                  ^ VL_REDXOR_16((0xc00U & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata))) 
                 ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h68cb8757__0)));
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h363e2766__0 
        = (1U & ((((((IData)(vlSelf->__VdfgTmp_hcb66166d__0) 
                     ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h363e2766__0)) 
                    ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h3634ff9b__0)) 
                   ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h360c9c01__0)) 
                  ^ VL_REDXOR_16((0xd00U & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata))) 
                 ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h68c91218__0)));
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h3608ac7c__0 
        = (1U & (((((IData)(vlSelf->__VdfgTmp_hcac389da__0) 
                    ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h3639f67b__0)) 
                   ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h3634ff9b__0)) 
                  ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h36308f16__0)) 
                 ^ VL_REDXOR_16((0x3800U & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata))));
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h03f6d13a__0 
        = (1U & (((((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h36e29791__0) 
                    ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h360c9c01__0)) 
                   ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h3608ac7c__0)) 
                  ^ VL_REDXOR_16((0x300U & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata))) 
                 ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h93a27a88__0)));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT__crcIn 
        = vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc0;
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT__crcOut 
        = vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc0;
    __VdfgTmp_h02aea5d1__0 = (1U & ((((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_hf84ccbd6__0) 
                                      ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h36308f16__0)) 
                                     ^ VL_REDXOR_16(
                                                    (0x500U 
                                                     & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata))) 
                                    ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h3f454e02__0)));
    __VdfgTmp_h4e36faf4__0 = (1U & ((((((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_hf84ccbd6__0) 
                                        ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h3634ff9b__0)) 
                                       ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h360c9c01__0)) 
                                      ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h3608ac7c__0)) 
                                     ^ VL_REDXOR_16(
                                                    (0x1d00U 
                                                     & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata))) 
                                    ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h6e9b026a__0)));
    __VdfgTmp_h30bc4225__0 = (1U & (((((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_haca89824__0) 
                                       ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h3639f67b__0)) 
                                      ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h36308f16__0)) 
                                     ^ VL_REDXOR_16(
                                                    (0x300U 
                                                     & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata))) 
                                    ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h3f454e02__0)));
    __VdfgTmp_hf31ac05b__0 = (1U & ((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_haca89824__0) 
                                    ^ ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h363e2766__0) 
                                       ^ ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h3634ff9b__0) 
                                          ^ ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h360c9c01__0) 
                                             ^ ((vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata 
                                                 >> 8U) 
                                                ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_hee0b7305__0)))))));
    __VdfgTmp_h152ea47b__0 = (1U & (((((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_haca89824__0) 
                                       ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h3634ff9b__0)) 
                                      ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h3608ac7c__0)) 
                                     ^ VL_REDXOR_16(
                                                    (0x300U 
                                                     & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata))) 
                                    ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h68cb8757__0)));
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_ha9b3a581__0 
        = ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h36e29791__0) 
           ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h363e2766__0));
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h36e44f7c__0 
        = ((IData)(vlSelf->__VdfgTmp_hf0c32f3e__0) 
           ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h03f6d13a__0));
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h3639f67b__0 
        = ((IData)(vlSelf->__VdfgTmp_hb06ef157__0) 
           ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT____VdfgTmp_h03f6d13a__0));
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h36e29791__0 
        = (1U & (((((((IData)(__VdfgTmp_h152ea47b__0) 
                      ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h36e29791__0)) 
                     ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h363e2766__0)) 
                    ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h3634ff9b__0)) 
                   ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h3608ac7c__0)) 
                  ^ VL_REDXOR_32((0x60000U & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata))) 
                 ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h68cb8757__0)));
    __VdfgTmp_h4d7aab14__0 = ((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_ha9b3a581__0) 
                              ^ ((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h3634ff9b__0) 
                                 ^ ((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h360c9c01__0) 
                                    ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_hee0b7305__0))));
    __VdfgTmp_h080f03ba__0 = (1U & (((((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h36e44f7c__0) 
                                       ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h3634ff9b__0)) 
                                      ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h36308f16__0)) 
                                     ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h360c9c01__0)) 
                                    ^ VL_REDXOR_32(
                                                   (0x710000U 
                                                    & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata))));
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h3634ff9b__0 
        = (1U & (((((((((IData)(__VdfgTmp_h02aea5d1__0) 
                        ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h36e44f7c__0)) 
                       ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h36e29791__0)) 
                      ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h363e2766__0)) 
                     ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h36308f16__0)) 
                    ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h360c9c01__0)) 
                   ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h3608ac7c__0)) 
                  ^ VL_REDXOR_32((0x270000U & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata))) 
                 ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h6e9b026a__0)));
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_haca89824__0 
        = ((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h36e44f7c__0) 
           ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h36e29791__0));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc1 
        = (((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h3608ac7c__0) 
            << 0xfU) | (((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h360c9c01__0) 
                         << 0xeU) | (((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h36308f16__0) 
                                      << 0xdU) | (((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h3634ff9b__0) 
                                                   << 0xcU) 
                                                  | (((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h3639f67b__0) 
                                                      << 0xbU) 
                                                     | (((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h363e2766__0) 
                                                         << 0xaU) 
                                                        | (((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h36e29791__0) 
                                                            << 9U) 
                                                           | (((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h36e44f7c__0) 
                                                               << 8U) 
                                                              | (((IData)(__VdfgTmp_h4e36faf4__0) 
                                                                  << 7U) 
                                                                 | (((IData)(__VdfgTmp_hdc13fa9f__0) 
                                                                     << 6U) 
                                                                    | (((IData)(__VdfgTmp_h30bc4225__0) 
                                                                        << 5U) 
                                                                       | (((IData)(__VdfgTmp_h02aea5d1__0) 
                                                                           << 4U) 
                                                                          | (((IData)(__VdfgTmp_hd70e4e3b__0) 
                                                                              << 3U) 
                                                                             | (((IData)(__VdfgTmp_hf31ac05b__0) 
                                                                                << 2U) 
                                                                                | (((IData)(__VdfgTmp_h152ea47b__0) 
                                                                                << 1U) 
                                                                                | (IData)(__VdfgTmp_h5d52c0f3__0))))))))))))))));
    __VdfgTmp_h2cabaaf1__0 = (1U & (((((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_ha9b3a581__0) 
                                       ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h3639f67b__0)) 
                                      ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h36308f16__0)) 
                                     ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h3608ac7c__0)) 
                                    ^ VL_REDXOR_32(
                                                   (0xae0000U 
                                                    & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata))));
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h36308f16__0 
        = (1U & ((((((((IData)(__VdfgTmp_h30bc4225__0) 
                       ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h36e29791__0)) 
                      ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h363e2766__0)) 
                     ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h3639f67b__0)) 
                    ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h360c9c01__0)) 
                   ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h3608ac7c__0)) 
                  ^ VL_REDXOR_32((0x60000U & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata))) 
                 ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h93a27a88__0)));
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h3608ac7c__0 
        = (1U & (((((IData)(__VdfgTmp_h4e36faf4__0) 
                    ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h3639f67b__0)) 
                   ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h3634ff9b__0)) 
                  ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h36308f16__0)) 
                 ^ VL_REDXOR_32((0x380000U & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata))));
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h360c9c01__0 
        = (1U & (((((((IData)(__VdfgTmp_hdc13fa9f__0) 
                      ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h363e2766__0)) 
                     ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h3639f67b__0)) 
                    ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h3634ff9b__0)) 
                   ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h3608ac7c__0)) 
                  ^ VL_REDXOR_32((0xc0000U & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata))) 
                 ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h68cb8757__0)));
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_hf84ccbd6__0 
        = ((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h36e44f7c__0) 
           ^ ((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h363e2766__0) 
              ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h3639f67b__0)));
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h363e2766__0 
        = (1U & ((((((((IData)(__VdfgTmp_hf31ac05b__0) 
                       ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h36e44f7c__0)) 
                      ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h363e2766__0)) 
                     ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h3639f67b__0)) 
                    ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h3634ff9b__0)) 
                   ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h360c9c01__0)) 
                  ^ VL_REDXOR_32((0xd0000U & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata))) 
                 ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h68c91218__0)));
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h03f6d13a__0 
        = (1U & (((((((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h36e44f7c__0) 
                      ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h36e29791__0)) 
                     ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h3639f67b__0)) 
                    ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h360c9c01__0)) 
                   ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h3608ac7c__0)) 
                  ^ VL_REDXOR_32((0x30000U & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata))) 
                 ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h93a27a88__0)));
    __VdfgTmp_h4cea4a0b__0 = (1U & (((((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_haca89824__0) 
                                       ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h3639f67b__0)) 
                                      ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h36308f16__0)) 
                                     ^ VL_REDXOR_32(
                                                    (0x30000U 
                                                     & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata))) 
                                    ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h3f454e02__0)));
    __VdfgTmp_h15d11a25__0 = (1U & (((((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_haca89824__0) 
                                       ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h3634ff9b__0)) 
                                      ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h3608ac7c__0)) 
                                     ^ VL_REDXOR_32(
                                                    (0x30000U 
                                                     & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata))) 
                                    ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h68cb8757__0)));
    __VdfgTmp_h453b4c1c__0 = (1U & ((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_haca89824__0) 
                                    ^ ((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h363e2766__0) 
                                       ^ ((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h3634ff9b__0) 
                                          ^ ((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h360c9c01__0) 
                                             ^ ((vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata 
                                                 >> 0x10U) 
                                                ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_hee0b7305__0)))))));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT__crcIn 
        = vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc1;
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT__crcOut 
        = vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc1;
    __VdfgTmp_he53401f6__0 = (1U & ((((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_hf84ccbd6__0) 
                                      ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h36308f16__0)) 
                                     ^ VL_REDXOR_32(
                                                    (0x50000U 
                                                     & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata))) 
                                    ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h3f454e02__0)));
    __VdfgTmp_hcafa0ae0__0 = (1U & ((((((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_hf84ccbd6__0) 
                                        ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h3634ff9b__0)) 
                                       ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h360c9c01__0)) 
                                      ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h3608ac7c__0)) 
                                     ^ VL_REDXOR_32(
                                                    (0x1d0000U 
                                                     & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata))) 
                                    ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h6e9b026a__0)));
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_ha9b3a581__0 
        = ((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h36e29791__0) 
           ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h363e2766__0));
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h3639f67b__0 
        = ((IData)(__VdfgTmp_hd70e4e3b__0) ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h03f6d13a__0));
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h36e44f7c__0 
        = ((IData)(__VdfgTmp_h5d52c0f3__0) ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT____VdfgTmp_h03f6d13a__0));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc2 
        = (((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h3608ac7c__0) 
            << 0xfU) | (((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h360c9c01__0) 
                         << 0xeU) | (((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h36308f16__0) 
                                      << 0xdU) | (((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h3634ff9b__0) 
                                                   << 0xcU) 
                                                  | (((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h3639f67b__0) 
                                                      << 0xbU) 
                                                     | (((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h363e2766__0) 
                                                         << 0xaU) 
                                                        | (((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h36e29791__0) 
                                                            << 9U) 
                                                           | (((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h36e44f7c__0) 
                                                               << 8U) 
                                                              | (((IData)(__VdfgTmp_hcafa0ae0__0) 
                                                                  << 7U) 
                                                                 | (((IData)(__VdfgTmp_h4d7aab14__0) 
                                                                     << 6U) 
                                                                    | (((IData)(__VdfgTmp_h4cea4a0b__0) 
                                                                        << 5U) 
                                                                       | (((IData)(__VdfgTmp_he53401f6__0) 
                                                                           << 4U) 
                                                                          | (((IData)(__VdfgTmp_h2cabaaf1__0) 
                                                                              << 3U) 
                                                                             | (((IData)(__VdfgTmp_h453b4c1c__0) 
                                                                                << 2U) 
                                                                                | (((IData)(__VdfgTmp_h15d11a25__0) 
                                                                                << 1U) 
                                                                                | (IData)(__VdfgTmp_h080f03ba__0))))))))))))))));
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_haca89824__0 
        = ((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h36e44f7c__0) 
           ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h36e29791__0));
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_hf84ccbd6__0 
        = ((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h36e44f7c__0) 
           ^ ((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h363e2766__0) 
              ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h3639f67b__0)));
    pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h03f6d13a__0 
        = (1U & (((((((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h36e44f7c__0) 
                      ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h36e29791__0)) 
                     ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h3639f67b__0)) 
                    ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h360c9c01__0)) 
                   ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h3608ac7c__0)) 
                  ^ VL_REDXOR_32((0x3000000U & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata))) 
                 ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h93a27a88__0)));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT__crcIn 
        = vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc2;
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT__crcOut 
        = vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc2;
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc3 
        = ((0x8000U & ((((((IData)(__VdfgTmp_hcafa0ae0__0) 
                           ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h3639f67b__0)) 
                          ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h3634ff9b__0)) 
                         ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h36308f16__0)) 
                        ^ VL_REDXOR_32((0x38000000U 
                                        & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata))) 
                       << 0xfU)) | ((0x4000U & ((((
                                                   ((((IData)(__VdfgTmp_h4d7aab14__0) 
                                                      ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h363e2766__0)) 
                                                     ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h3639f67b__0)) 
                                                    ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h3634ff9b__0)) 
                                                   ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h3608ac7c__0)) 
                                                  ^ 
                                                  VL_REDXOR_32(
                                                               (0xc000000U 
                                                                & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata))) 
                                                 ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h68cb8757__0)) 
                                                << 0xeU)) 
                                    | ((0x2000U & (
                                                   ((((((((IData)(__VdfgTmp_h4cea4a0b__0) 
                                                          ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h36e29791__0)) 
                                                         ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h363e2766__0)) 
                                                        ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h3639f67b__0)) 
                                                       ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h360c9c01__0)) 
                                                      ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h3608ac7c__0)) 
                                                     ^ 
                                                     VL_REDXOR_32(
                                                                  (0x6000000U 
                                                                   & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata))) 
                                                    ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h93a27a88__0)) 
                                                   << 0xdU)) 
                                       | ((0x1000U 
                                           & ((((((((((IData)(__VdfgTmp_he53401f6__0) 
                                                      ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h36e44f7c__0)) 
                                                     ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h36e29791__0)) 
                                                    ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h363e2766__0)) 
                                                   ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h36308f16__0)) 
                                                  ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h360c9c01__0)) 
                                                 ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h3608ac7c__0)) 
                                                ^ VL_REDXOR_32(
                                                               (0x27000000U 
                                                                & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata))) 
                                               ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h6e9b026a__0)) 
                                              << 0xcU)) 
                                          | ((((IData)(__VdfgTmp_h2cabaaf1__0) 
                                               ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h03f6d13a__0)) 
                                              << 0xbU) 
                                             | ((0x400U 
                                                 & (((((((((IData)(__VdfgTmp_h453b4c1c__0) 
                                                           ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h36e44f7c__0)) 
                                                          ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h363e2766__0)) 
                                                         ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h3639f67b__0)) 
                                                        ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h3634ff9b__0)) 
                                                       ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h360c9c01__0)) 
                                                      ^ 
                                                      VL_REDXOR_32(
                                                                   (0xd000000U 
                                                                    & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata))) 
                                                     ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h68c91218__0)) 
                                                    << 0xaU)) 
                                                | ((0x200U 
                                                    & ((((((((IData)(__VdfgTmp_h15d11a25__0) 
                                                             ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h36e29791__0)) 
                                                            ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h363e2766__0)) 
                                                           ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h3634ff9b__0)) 
                                                          ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h3608ac7c__0)) 
                                                         ^ 
                                                         VL_REDXOR_32(
                                                                      (0x6000000U 
                                                                       & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata))) 
                                                        ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h68cb8757__0)) 
                                                       << 9U)) 
                                                   | ((((IData)(__VdfgTmp_h080f03ba__0) 
                                                        ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h03f6d13a__0)) 
                                                       << 8U) 
                                                      | ((0x80U 
                                                          & (((((((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_hf84ccbd6__0) 
                                                                  ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h3634ff9b__0)) 
                                                                 ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h360c9c01__0)) 
                                                                ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h3608ac7c__0)) 
                                                               ^ 
                                                               VL_REDXOR_32(
                                                                            (0x1d000000U 
                                                                             & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata))) 
                                                              ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h6e9b026a__0)) 
                                                             << 7U)) 
                                                         | ((((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_ha9b3a581__0) 
                                                              ^ 
                                                              ((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h3634ff9b__0) 
                                                               ^ 
                                                               ((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h360c9c01__0) 
                                                                ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_hee0b7305__0)))) 
                                                             << 6U) 
                                                            | ((0x20U 
                                                                & ((((((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_haca89824__0) 
                                                                       ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h3639f67b__0)) 
                                                                      ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h36308f16__0)) 
                                                                     ^ 
                                                                     VL_REDXOR_32(
                                                                                (0x3000000U 
                                                                                & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata))) 
                                                                    ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h3f454e02__0)) 
                                                                   << 5U)) 
                                                               | ((0x10U 
                                                                   & (((((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_hf84ccbd6__0) 
                                                                         ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h36308f16__0)) 
                                                                        ^ 
                                                                        VL_REDXOR_32(
                                                                                (0x5000000U 
                                                                                & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata))) 
                                                                       ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h3f454e02__0)) 
                                                                      << 4U)) 
                                                                  | ((8U 
                                                                      & ((((((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_ha9b3a581__0) 
                                                                             ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h3639f67b__0)) 
                                                                            ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h36308f16__0)) 
                                                                           ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h3608ac7c__0)) 
                                                                          ^ 
                                                                          VL_REDXOR_32(
                                                                                (0xae000000U 
                                                                                & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata))) 
                                                                         << 3U)) 
                                                                     | ((4U 
                                                                         & (((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_haca89824__0) 
                                                                             << 2U) 
                                                                            ^ 
                                                                            (((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h363e2766__0) 
                                                                              << 2U) 
                                                                             ^ 
                                                                             (((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h3634ff9b__0) 
                                                                               << 2U) 
                                                                              ^ 
                                                                              (((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h360c9c01__0) 
                                                                                << 2U) 
                                                                               ^ 
                                                                               ((0x3fcU 
                                                                                & (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata 
                                                                                >> 0x16U)) 
                                                                                ^ 
                                                                                ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_hee0b7305__0) 
                                                                                << 2U))))))) 
                                                                        | ((2U 
                                                                            & ((((((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_haca89824__0) 
                                                                                ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h3634ff9b__0)) 
                                                                                ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h3608ac7c__0)) 
                                                                                ^ 
                                                                                VL_REDXOR_32(
                                                                                (0x3000000U 
                                                                                & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata))) 
                                                                                ^ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h68cb8757__0)) 
                                                                               << 1U)) 
                                                                           | (1U 
                                                                              & (((((IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h36e44f7c__0) 
                                                                                ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h3634ff9b__0)) 
                                                                                ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h36308f16__0)) 
                                                                                ^ (IData)(pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT____VdfgTmp_h360c9c01__0)) 
                                                                                ^ 
                                                                                VL_REDXOR_32(
                                                                                (0x71000000U 
                                                                                & vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata)))))))))))))))))));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT__crcOut 
        = vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc3;
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc4 
        = ((0xfffeU & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc4)) 
           | (1U & ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc3) 
                    >> 7U)));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc4 
        = ((0xfeffU & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc4)) 
           | (0x100U & ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc3) 
                        >> 7U)));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc4 
        = ((0xfffdU & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc4)) 
           | (2U & ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc3) 
                    >> 5U)));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc4 
        = ((0xfdffU & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc4)) 
           | (0x200U & ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc3) 
                        >> 5U)));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc4 
        = ((0xfffbU & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc4)) 
           | (4U & ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc3) 
                    >> 3U)));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc4 
        = ((0xfbffU & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc4)) 
           | (0x400U & ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc3) 
                        >> 3U)));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc4 
        = ((0xfff7U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc4)) 
           | (8U & ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc3) 
                    >> 1U)));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc4 
        = ((0xf7ffU & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc4)) 
           | (0x800U & ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc3) 
                        >> 1U)));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc4 
        = ((0xffefU & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc4)) 
           | (0x10U & ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc3) 
                       << 1U)));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc4 
        = ((0xefffU & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc4)) 
           | (0x1000U & ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc3) 
                         << 1U)));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc4 
        = ((0xffdfU & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc4)) 
           | (0x20U & ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc3) 
                       << 3U)));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc4 
        = ((0xdfffU & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc4)) 
           | (0x2000U & ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc3) 
                         << 3U)));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc4 
        = ((0xffbfU & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc4)) 
           | (0x40U & ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc3) 
                       << 5U)));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc4 
        = ((0xbfffU & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc4)) 
           | (0x4000U & ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc3) 
                         << 5U)));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc4 
        = ((0xff7fU & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc4)) 
           | (0x80U & ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc3) 
                       << 7U)));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc4 
        = ((0x7fffU & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc4)) 
           | (0x8000U & ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc3) 
                         << 7U)));
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crcOut 
        = vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc4;
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__crc_out 
        = vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crcOut;
    vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_lcrc_c 
        = vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_lcrc_r;
    if ((1U & (~ ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state) 
                  >> 4U)))) {
        if ((8U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
            if ((4U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
                if ((2U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
                    if ((1U & (~ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state)))) {
                        if (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                            if ((0xa0U <= (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))) {
                                vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_lcrc_c 
                                    = vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crcOut;
                            }
                        }
                    }
                } else if ((1U & (~ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state)))) {
                    if (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                        if ((0xa0U <= (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))) {
                            vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_lcrc_c 
                                = vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crcOut;
                        }
                    }
                }
            } else if ((1U & (~ ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state) 
                                 >> 1U)))) {
                if ((1U & (~ (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state)))) {
                    if (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                        if ((0xa0U <= (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))) {
                            vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_lcrc_c 
                                = vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crcOut;
                        }
                    }
                }
            }
        } else if ((4U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
            if ((1U & (~ ((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state) 
                          >> 1U)))) {
                if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
                    if (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                        if ((0xa0U <= (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))) {
                            vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_lcrc_c 
                                = vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crcOut;
                        }
                    }
                }
            }
        } else if ((2U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
            if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
                if (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                    if ((0xa0U <= (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r))) {
                        vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_lcrc_c 
                            = vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crcOut;
                    }
                }
            }
        } else if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state))) {
            if (vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready) {
                vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_lcrc_c 
                    = vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crcOut;
            }
        } else if (((IData)(vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__init_flow_control_o) 
                    & (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready))) {
            vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_lcrc_c 
                = vlSelf->pcie_datalink_layer__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crcOut;
        }
    }
}

VL_INLINE_OPT void Vtop___024root___nba_comb__TOP__2(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_comb__TOP__2\n"); );
    // Init
    CData/*4:0*/ __Vtableidx10;
    __Vtableidx10 = 0;
    CData/*4:0*/ __Vtableidx11;
    __Vtableidx11 = 0;
    CData/*4:0*/ __Vtableidx12;
    __Vtableidx12 = 0;
    // Body
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_state 
        = vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state;
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_c 
        = vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r;
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_byte_select = 0U;
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__word_count_c 
        = vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__word_count_r;
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_c 
        = vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_r;
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_nph_c 
        = vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_nph_r;
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_ph_c 
        = vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_ph_r;
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_c 
        = vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_r;
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_c 
        = vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_r;
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_pd_c 
        = vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_pd_r;
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__skid_axis_tready = 0U;
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_dw0 = 0U;
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_axis_tdata = 0U;
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_axis_tkeep = 0U;
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_axis_tvalid = 0U;
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_transmit_seq_c 
        = vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_transmit_seq_r;
    if ((1U & (~ ((IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state) 
                  >> 4U)))) {
        if ((1U & (~ ((IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state) 
                      >> 3U)))) {
            if ((4U & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))) {
                if ((1U & (~ ((IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state) 
                              >> 1U)))) {
                    if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))) {
                        if (vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__start_flow_control_ack) {
                            vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_nph_c = 0U;
                            vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_pd_c = 0U;
                            vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_ph_c = 0U;
                            vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_c = 0U;
                            vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_c = 0U;
                            vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_c = 0U;
                            vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_c = 0xffffffffU;
                            vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_state = 0U;
                        }
                    } else {
                        vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_axis_tdata 
                            = ((vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__m_axis_tdata 
                                << 0x10U) | (vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__m_axis_tdata 
                                             >> 0x10U));
                        vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_axis_tvalid = 1U;
                        vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_c = 0xffffffffU;
                        vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_state = 5U;
                        if ((8U & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tkeep))) {
                            if ((4U & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tkeep))) {
                                if ((2U & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tkeep))) {
                                    if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tkeep))) {
                                        vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_axis_tkeep = 3U;
                                    }
                                }
                            }
                        } else if ((4U & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tkeep))) {
                            if ((2U & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tkeep))) {
                                if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tkeep))) {
                                    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_axis_tkeep = 1U;
                                }
                            }
                        } else if ((2U & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tkeep))) {
                            if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tkeep))) {
                                vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_axis_tkeep = 0xfU;
                            }
                        } else if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tkeep))) {
                            vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_axis_tkeep = 7U;
                        }
                    }
                }
            } else if ((2U & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))) {
                if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))) {
                    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_byte_select = 3U;
                    if (vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__s_axis_tready) {
                        vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_c 
                            = vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_crc16_inst__DOT__crcOut;
                        vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_state = 4U;
                        if ((8U & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tkeep))) {
                            if ((4U & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tkeep))) {
                                if ((2U & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tkeep))) {
                                    if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tkeep))) {
                                        vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_byte_select = 3U;
                                    }
                                }
                            }
                        } else if ((4U & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tkeep))) {
                            if ((2U & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tkeep))) {
                                if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tkeep))) {
                                    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_byte_select = 2U;
                                }
                            }
                        } else if ((2U & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tkeep))) {
                            if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tkeep))) {
                                vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_byte_select = 1U;
                            }
                        } else if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tkeep))) {
                            vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_byte_select = 0U;
                        }
                    }
                } else if (((IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__s_axis_tready) 
                            & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__m_axis_tvalid))) {
                    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__skid_axis_tready = 1U;
                    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_byte_select = 3U;
                    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_c 
                        = vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_crc16_inst__DOT__crcOut;
                    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_axis_tdata 
                        = ((vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tdata 
                            << 0x10U) | (vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__m_axis_tdata 
                                         >> 0x10U));
                    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_axis_tkeep 
                        = vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tkeep;
                    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_axis_tvalid = 1U;
                    if (vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__m_axis_tlast) {
                        vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__word_count_c 
                            = vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__word_count_r;
                        vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_axis_tvalid = 0U;
                        vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_state = 3U;
                        if ((8U & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__m_axis_tkeep))) {
                            if ((4U & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__m_axis_tkeep))) {
                                if ((2U & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__m_axis_tkeep))) {
                                    if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__m_axis_tkeep))) {
                                        vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_byte_select = 3U;
                                    }
                                }
                            }
                        } else if ((4U & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__m_axis_tkeep))) {
                            if ((2U & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__m_axis_tkeep))) {
                                if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__m_axis_tkeep))) {
                                    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_byte_select = 3U;
                                }
                            }
                        } else if ((2U & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__m_axis_tkeep))) {
                            if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__m_axis_tkeep))) {
                                vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_byte_select = 3U;
                            }
                        } else if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__m_axis_tkeep))) {
                            vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_byte_select = 3U;
                            vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_axis_tvalid = 1U;
                        }
                    }
                } else {
                    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__skid_axis_tready = 0U;
                    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_byte_select = 3U;
                }
            } else if ((1U & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))) {
                vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__skid_axis_tready 
                    = ((IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__s_axis_tready) 
                       & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__m_axis_tvalid));
                vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_byte_select = 3U;
                if (vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__skid_axis_tready) {
                    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_axis_tdata 
                        = ((vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tdata 
                            << 0x10U) | (vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__m_axis_tdata 
                                         >> 0x10U));
                    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_c 
                        = vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_crc16_inst__DOT__crcOut;
                    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_axis_tkeep = 0xfU;
                    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_axis_tvalid = 1U;
                    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_dw0 
                        = vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_axis_tdata;
                    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_state = 2U;
                    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__word_count_c 
                        = ((0x300U & (vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_dw0 
                                      >> 8U)) | (vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_dw0 
                                                 >> 0x18U));
                    if (((((((0U == (0xdfU & vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_dw0)) 
                             | (1U == (0xdfU & vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_dw0))) 
                            | (2U == (0xffU & vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_dw0))) 
                           | (4U == (0xffU & vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_dw0))) 
                          | (5U == (0xffU & vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_dw0))) 
                         | (0x1bU == (0xffU & vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_dw0)))) {
                        vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_nph_c = 1U;
                    } else if (((0x40U == (0xdfU & vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_dw0)) 
                                | (0x70U == (0xf8U 
                                             & vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_dw0)))) {
                        vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_pd_c = 1U;
                    } else if ((0x30U == (0xf8U & vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_dw0))) {
                        vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_ph_c = 1U;
                    } else if ((((((((0x42U == (0xffU 
                                                & vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_dw0)) 
                                     | (0x44U == (0xffU 
                                                  & vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_dw0))) 
                                    | (0x45U == (0xffU 
                                                 & vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_dw0))) 
                                   | (0x5bU == (0xffU 
                                                & vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_dw0))) 
                                  | (0x4cU == (0xdfU 
                                               & vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_dw0))) 
                                 | (0x4dU == (0xdfU 
                                              & vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_dw0))) 
                                | (0x4eU == (0xdfU 
                                             & vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_dw0)))) {
                        vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_c = 1U;
                    } else if (((0xaU == (0xffU & vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_dw0)) 
                                | (0xbU == (0xffU & vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_dw0)))) {
                        vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_c = 1U;
                    } else if (((0x4aU == (0xffU & vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_dw0)) 
                                | (0x4bU == (0xffU 
                                             & vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_dw0)))) {
                        vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_c = 1U;
                    }
                }
            } else {
                vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__skid_axis_tready 
                    = (((IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__s_axis_tready) 
                        & (2U == (IData)(vlSelf->pcie_datalink_layer__DOT__pcie_datalink_init_inst__DOT__link_status_o))) 
                       & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__m_axis_tvalid));
                if ((((IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__skid_axis_tready) 
                      & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tvalid)) 
                     & (~ (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tlast)))) {
                    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_transmit_seq_c 
                        = ((0xff00U & (vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tdata 
                                       << 8U)) | (0xffU 
                                                  & (vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tdata 
                                                     >> 8U)));
                    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_byte_select = 3U;
                    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_nph_c = 0U;
                    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_pd_c = 0U;
                    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_ph_c = 0U;
                    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_c = 0U;
                    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_c = 0U;
                    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_c = 0U;
                    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_c = 0xffffffffU;
                    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__word_count_c = 0U;
                    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_state = 1U;
                }
            }
        }
    }
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_crc16_inst__DOT__select 
        = vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_byte_select;
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__s_axis_tvalid 
        = vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_axis_tvalid;
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__s_axis_tdata 
        = vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_axis_tdata;
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__s_axis_tkeep 
        = vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_axis_tkeep;
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__s_axis 
        = (((QData)((IData)(((IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__mark_frame_reg)
                              ? 1U : (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_axis_tuser)))) 
            << 0x25U) | (((QData)((IData)(((IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__mark_frame_reg) 
                                           | (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_axis_tlast)))) 
                          << 0x24U) | (((QData)((IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_axis_tkeep)) 
                                        << 0x20U) | (QData)((IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_axis_tdata)))));
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tready 
        = vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__skid_axis_tready;
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__m_axis_tready 
        = vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__skid_axis_tready;
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__m_axis_tready 
        = vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__skid_axis_tready;
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_early 
        = (1U & ((~ ((IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg) 
                     | ((IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__m_axis_tvalid_reg) 
                        & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tvalid_reg)))) 
                 | (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__skid_axis_tready)));
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__s_axis_tready_early 
        = (1U & ((~ ((IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg) 
                     | ((IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tvalid_reg) 
                        & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tvalid_reg)))) 
                 | (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__skid_axis_tready)));
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__s_axis_tready_early 
        = (1U & ((~ ((IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg) 
                     | ((IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tvalid_reg) 
                        & (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__m_axis_tvalid_reg)))) 
                 | (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__skid_axis_tready)));
    __Vtableidx10 = (((IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__m_axis_tvalid) 
                      << 4U) | (((IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__skid_axis_tready) 
                                 << 3U) | (((IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg) 
                                            << 2U) 
                                           | (((IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg) 
                                               << 1U) 
                                              | (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tvalid_reg)))));
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tvalid_next 
        = Vtop__ConstPool__TABLE_h18b094e1_0[__Vtableidx10];
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_next 
        = Vtop__ConstPool__TABLE_h16f08759_0[__Vtableidx10];
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__store_axis_input_to_output 
        = Vtop__ConstPool__TABLE_hef51093e_0[__Vtableidx10];
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__store_axis_input_to_temp 
        = Vtop__ConstPool__TABLE_h4c120632_0[__Vtableidx10];
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__store_axis_temp_to_output 
        = Vtop__ConstPool__TABLE_h31c4cd05_0[__Vtableidx10];
    __Vtableidx11 = (((IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tvalid) 
                      << 4U) | (((IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__skid_axis_tready) 
                                 << 3U) | (((IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__s_axis_tready_reg) 
                                            << 2U) 
                                           | (((IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg) 
                                               << 1U) 
                                              | (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tvalid_reg)))));
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tvalid_next 
        = Vtop__ConstPool__TABLE_h18b094e1_0[__Vtableidx11];
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_next 
        = Vtop__ConstPool__TABLE_h16f08759_0[__Vtableidx11];
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__store_axis_input_to_output 
        = Vtop__ConstPool__TABLE_hef51093e_0[__Vtableidx11];
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__store_axis_input_to_temp 
        = Vtop__ConstPool__TABLE_h4c120632_0[__Vtableidx11];
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__store_axis_temp_to_output 
        = Vtop__ConstPool__TABLE_h31c4cd05_0[__Vtableidx11];
    __Vtableidx12 = (((IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__m_axis_tvalid) 
                      << 4U) | (((IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__skid_axis_tready) 
                                 << 3U) | (((IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__s_axis_tready_reg) 
                                            << 2U) 
                                           | (((IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg) 
                                               << 1U) 
                                              | (IData)(vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__m_axis_tvalid_reg)))));
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__m_axis_tvalid_next 
        = Vtop__ConstPool__TABLE_h18b094e1_0[__Vtableidx12];
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_next 
        = Vtop__ConstPool__TABLE_h16f08759_0[__Vtableidx12];
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__store_axis_input_to_output 
        = Vtop__ConstPool__TABLE_hef51093e_0[__Vtableidx12];
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__store_axis_input_to_temp 
        = Vtop__ConstPool__TABLE_h4c120632_0[__Vtableidx12];
    vlSelf->pcie_datalink_layer__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__store_axis_temp_to_output 
        = Vtop__ConstPool__TABLE_h31c4cd05_0[__Vtableidx12];
}

void Vtop___024root___nba_sequent__TOP__0(Vtop___024root* vlSelf);
void Vtop___024root___nba_sequent__TOP__1(Vtop___024root* vlSelf);

void Vtop___024root___eval_nba(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_nba\n"); );
    // Body
    if (vlSelf->__VnbaTriggered.at(6U)) {
        Vtop___024root___nba_sequent__TOP__0(vlSelf);
        Vtop___024root___nba_sequent__TOP__1(vlSelf);
    }
    if (vlSelf->__VnbaTriggered.at(5U)) {
        Vtop___024root___nba_sequent__TOP__2(vlSelf);
    }
    if ((vlSelf->__VnbaTriggered.at(0U) | vlSelf->__VnbaTriggered.at(6U))) {
        Vtop___024root___nba_comb__TOP__0(vlSelf);
    }
    if ((vlSelf->__VnbaTriggered.at(5U) | vlSelf->__VnbaTriggered.at(6U))) {
        Vtop___024root___nba_comb__TOP__1(vlSelf);
    }
    if (((vlSelf->__VnbaTriggered.at(0U) | vlSelf->__VnbaTriggered.at(5U)) 
         | vlSelf->__VnbaTriggered.at(6U))) {
        Vtop___024root___nba_comb__TOP__2(vlSelf);
    }
}

void Vtop___024root___eval_triggers__ico(Vtop___024root* vlSelf);
#ifdef VL_DEBUG
VL_ATTR_COLD void Vtop___024root___dump_triggers__ico(Vtop___024root* vlSelf);
#endif  // VL_DEBUG
void Vtop___024root___eval_ico(Vtop___024root* vlSelf);
void Vtop___024root___eval_triggers__act(Vtop___024root* vlSelf);
#ifdef VL_DEBUG
VL_ATTR_COLD void Vtop___024root___dump_triggers__act(Vtop___024root* vlSelf);
#endif  // VL_DEBUG
void Vtop___024root___eval_act(Vtop___024root* vlSelf);
#ifdef VL_DEBUG
VL_ATTR_COLD void Vtop___024root___dump_triggers__nba(Vtop___024root* vlSelf);
#endif  // VL_DEBUG

void Vtop___024root___eval(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval\n"); );
    // Init
    CData/*0:0*/ __VicoContinue;
    VlTriggerVec<7> __VpreTriggered;
    IData/*31:0*/ __VnbaIterCount;
    CData/*0:0*/ __VnbaContinue;
    // Body
    vlSelf->__VicoIterCount = 0U;
    __VicoContinue = 1U;
    while (__VicoContinue) {
        __VicoContinue = 0U;
        Vtop___024root___eval_triggers__ico(vlSelf);
        if (vlSelf->__VicoTriggered.any()) {
            __VicoContinue = 1U;
            if (VL_UNLIKELY((0x64U < vlSelf->__VicoIterCount))) {
#ifdef VL_DEBUG
                Vtop___024root___dump_triggers__ico(vlSelf);
#endif
                VL_FATAL_MT("src/fusesoc_pcie_dllp_core_1.0.0/pcie_datalink_layer.sv", 15, "", "Input combinational region did not converge.");
            }
            vlSelf->__VicoIterCount = ((IData)(1U) 
                                       + vlSelf->__VicoIterCount);
            Vtop___024root___eval_ico(vlSelf);
        }
    }
    __VnbaIterCount = 0U;
    __VnbaContinue = 1U;
    while (__VnbaContinue) {
        __VnbaContinue = 0U;
        vlSelf->__VnbaTriggered.clear();
        vlSelf->__VactIterCount = 0U;
        vlSelf->__VactContinue = 1U;
        while (vlSelf->__VactContinue) {
            vlSelf->__VactContinue = 0U;
            Vtop___024root___eval_triggers__act(vlSelf);
            if (vlSelf->__VactTriggered.any()) {
                vlSelf->__VactContinue = 1U;
                if (VL_UNLIKELY((0x64U < vlSelf->__VactIterCount))) {
#ifdef VL_DEBUG
                    Vtop___024root___dump_triggers__act(vlSelf);
#endif
                    VL_FATAL_MT("src/fusesoc_pcie_dllp_core_1.0.0/pcie_datalink_layer.sv", 15, "", "Active region did not converge.");
                }
                vlSelf->__VactIterCount = ((IData)(1U) 
                                           + vlSelf->__VactIterCount);
                __VpreTriggered.andNot(vlSelf->__VactTriggered, vlSelf->__VnbaTriggered);
                vlSelf->__VnbaTriggered.set(vlSelf->__VactTriggered);
                Vtop___024root___eval_act(vlSelf);
            }
        }
        if (vlSelf->__VnbaTriggered.any()) {
            __VnbaContinue = 1U;
            if (VL_UNLIKELY((0x64U < __VnbaIterCount))) {
#ifdef VL_DEBUG
                Vtop___024root___dump_triggers__nba(vlSelf);
#endif
                VL_FATAL_MT("src/fusesoc_pcie_dllp_core_1.0.0/pcie_datalink_layer.sv", 15, "", "NBA region did not converge.");
            }
            __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
            Vtop___024root___eval_nba(vlSelf);
        }
    }
}

#ifdef VL_DEBUG
void Vtop___024root___eval_debug_assertions(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((vlSelf->clk_i & 0xfeU))) {
        Verilated::overWidthError("clk_i");}
    if (VL_UNLIKELY((vlSelf->rst_i & 0xfeU))) {
        Verilated::overWidthError("rst_i");}
    if (VL_UNLIKELY((vlSelf->s_tlp_axis_tkeep & 0xf0U))) {
        Verilated::overWidthError("s_tlp_axis_tkeep");}
    if (VL_UNLIKELY((vlSelf->s_tlp_axis_tvalid & 0xfeU))) {
        Verilated::overWidthError("s_tlp_axis_tvalid");}
    if (VL_UNLIKELY((vlSelf->s_tlp_axis_tlast & 0xfeU))) {
        Verilated::overWidthError("s_tlp_axis_tlast");}
    if (VL_UNLIKELY((vlSelf->s_tlp_axis_tuser & 0xf8U))) {
        Verilated::overWidthError("s_tlp_axis_tuser");}
    if (VL_UNLIKELY((vlSelf->m_tlp_axis_tready & 0xfeU))) {
        Verilated::overWidthError("m_tlp_axis_tready");}
    if (VL_UNLIKELY((vlSelf->s_phy_axis_tkeep & 0xf0U))) {
        Verilated::overWidthError("s_phy_axis_tkeep");}
    if (VL_UNLIKELY((vlSelf->s_phy_axis_tvalid & 0xfeU))) {
        Verilated::overWidthError("s_phy_axis_tvalid");}
    if (VL_UNLIKELY((vlSelf->s_phy_axis_tlast & 0xfeU))) {
        Verilated::overWidthError("s_phy_axis_tlast");}
    if (VL_UNLIKELY((vlSelf->s_phy_axis_tuser & 0xf8U))) {
        Verilated::overWidthError("s_phy_axis_tuser");}
    if (VL_UNLIKELY((vlSelf->m_phy_axis_tready & 0xfeU))) {
        Verilated::overWidthError("m_phy_axis_tready");}
    if (VL_UNLIKELY((vlSelf->phy_link_up_i & 0xfeU))) {
        Verilated::overWidthError("phy_link_up_i");}
    if (VL_UNLIKELY((vlSelf->status_error_cor_i & 0xfeU))) {
        Verilated::overWidthError("status_error_cor_i");}
    if (VL_UNLIKELY((vlSelf->status_error_uncor_i & 0xfeU))) {
        Verilated::overWidthError("status_error_uncor_i");}
    if (VL_UNLIKELY((vlSelf->rx_cpl_stall_i & 0xfeU))) {
        Verilated::overWidthError("rx_cpl_stall_i");}
}
#endif  // VL_DEBUG
