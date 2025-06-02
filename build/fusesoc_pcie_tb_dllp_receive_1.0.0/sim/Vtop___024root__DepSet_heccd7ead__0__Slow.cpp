// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtop.h for the primary calling header

#include "verilated.h"
#include "verilated_dpi.h"

#include "Vtop___024root.h"

VL_ATTR_COLD void Vtop___024root___eval_static__TOP(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_static__TOP\n"); );
    // Body
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__s_axis_tready_reg = 0U;
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__m_axis_tdata_reg = 0U;
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__m_axis_tkeep_reg = 0U;
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__m_axis_tvalid_reg = 0U;
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__m_axis_tlast_reg = 0U;
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__m_axis_tid_reg = 0U;
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__m_axis_tdest_reg = 0U;
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__m_axis_tuser_reg = 0U;
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg = 0U;
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg = 0U;
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg = 0U;
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg = 0U;
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg = 0U;
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg = 0U;
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg = 0U;
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__s_axis_tready_reg = 0U;
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__m_axis_tdata_reg = 0U;
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__m_axis_tkeep_reg = 0U;
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__m_axis_tvalid_reg = 0U;
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__m_axis_tlast_reg = 0U;
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__m_axis_tid_reg = 0U;
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__m_axis_tdest_reg = 0U;
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__m_axis_tuser_reg = 0U;
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg = 0U;
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg = 0U;
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg = 0U;
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg = 0U;
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg = 0U;
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg = 0U;
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__s_axis_tready_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tdata_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tkeep_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tvalid_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tlast_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tid_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tdest_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tuser_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tdata_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tkeep_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tvalid_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tlast_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tid_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tdest_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tuser_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__wr_ptr_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__wr_ptr_commit_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__rd_ptr_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__mem_read_data_valid_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_tvalid_pipe_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__s_frame_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__drop_frame_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__mark_frame_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__send_frame_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__depth_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__depth_commit_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__overflow_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__bad_frame_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__good_frame_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tdata_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tkeep_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tvalid_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tlast_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tid_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tdest_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tuser_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__s_axis_tready_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tdata_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tkeep_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tvalid_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tlast_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tid_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tdest_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tuser_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__s_axis_tready_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__m_axis_tdata_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__m_axis_tkeep_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__m_axis_tvalid_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__m_axis_tlast_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__m_axis_tid_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__m_axis_tdest_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__m_axis_tuser_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg = 0U;
}

VL_ATTR_COLD void Vtop___024root___eval_initial__TOP(Vtop___024root* vlSelf);

VL_ATTR_COLD void Vtop___024root___eval_initial(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_initial\n"); );
    // Body
    Vtop___024root___eval_initial__TOP(vlSelf);
    vlSelf->__Vtrigrprev__TOP__dllp_receive__DOT__dllp2tlp_inst__DOT__crc_byte_select 
        = vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__crc_byte_select;
    vlSelf->__Vtrigrprev__TOP__clk_i = vlSelf->clk_i;
}

VL_ATTR_COLD void Vtop___024root___eval_initial__TOP(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_initial__TOP\n"); );
    // Body
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__byteswap__DOT__unnamedblk1__DOT__i = 1U;
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__byteswap__DOT__unnamedblk1__DOT__i = 2U;
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__byteswap__DOT__unnamedblk1__DOT__i = 3U;
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__byteswap__DOT__unnamedblk1__DOT__i = 4U;
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__byteswap__DOT__unnamedblk1__DOT__i = 5U;
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__byteswap__DOT__unnamedblk1__DOT__i = 6U;
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__byteswap__DOT__unnamedblk1__DOT__i = 7U;
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__byteswap__DOT__unnamedblk1__DOT__i = 8U;
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__unnamedblk1__DOT__i = 1U;
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__unnamedblk1__DOT__i = 2U;
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__unnamedblk1__DOT__i = 3U;
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__unnamedblk1__DOT__i = 4U;
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__unnamedblk1__DOT__i = 5U;
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__unnamedblk1__DOT__i = 6U;
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__unnamedblk1__DOT__i = 7U;
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__unnamedblk1__DOT__i = 8U;
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__byteswap__DOT__unnamedblk1__DOT__i = 1U;
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__byteswap__DOT__unnamedblk1__DOT__i = 2U;
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__byteswap__DOT__unnamedblk1__DOT__i = 3U;
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__byteswap__DOT__unnamedblk1__DOT__i = 4U;
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__byteswap__DOT__unnamedblk1__DOT__i = 5U;
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__byteswap__DOT__unnamedblk1__DOT__i = 6U;
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__byteswap__DOT__unnamedblk1__DOT__i = 7U;
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__byteswap__DOT__unnamedblk1__DOT__i = 8U;
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__fc_axis_tuser = 1U;
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__unnamedblk1__DOT__i = 1U;
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__unnamedblk1__DOT__i = 2U;
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__unnamedblk1__DOT__i = 3U;
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__unnamedblk1__DOT__i = 4U;
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__unnamedblk1__DOT__i = 5U;
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__unnamedblk1__DOT__i = 6U;
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__unnamedblk1__DOT__i = 7U;
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__unnamedblk1__DOT__i = 8U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__byteswap__DOT__unnamedblk1__DOT__i = 1U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__byteswap__DOT__unnamedblk1__DOT__i = 2U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__byteswap__DOT__unnamedblk1__DOT__i = 3U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__byteswap__DOT__unnamedblk1__DOT__i = 4U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__byteswap__DOT__unnamedblk1__DOT__i = 5U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__byteswap__DOT__unnamedblk1__DOT__i = 6U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__byteswap__DOT__unnamedblk1__DOT__i = 7U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__byteswap__DOT__unnamedblk1__DOT__i = 8U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dll_packet = 0ULL;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__tlp_header_offset = 0U;
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__m_axis_tid = 0U;
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__m_axis_tdest = 0U;
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__m_axis_tid = 0U;
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__m_axis_tdest = 0U;
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__m_axis_tid = 0U;
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__m_axis_tdest = 0U;
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tid = 0U;
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tdest = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_tid_pipe = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_tdest_pipe = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__status_depth = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__status_depth_commit = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__pipe_ready = 1U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__pause_ack = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tid = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tdest = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__m_axis_tid = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__m_axis_tdest = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__m_axis_tid = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__m_axis_tdest = 0U;
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__s_axis_tid = 0U;
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__s_axis_tdest = 0U;
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__s_axis_tid = 0U;
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__s_axis_tdest = 0U;
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crcIn = 0xffffU;
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__s_axis_tid = 0U;
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__s_axis_tdest = 0U;
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tid = 0U;
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tdest = 0U;
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crcIn = 0xffffU;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tid = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tdest = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__s_axis_tid = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__s_axis_tdest = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__s_axis_tid = 0U;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__s_axis_tdest = 0U;
}

VL_ATTR_COLD void Vtop___024root___eval_final(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_final\n"); );
}

VL_ATTR_COLD void Vtop___024root___eval_triggers__stl(Vtop___024root* vlSelf);
#ifdef VL_DEBUG
VL_ATTR_COLD void Vtop___024root___dump_triggers__stl(Vtop___024root* vlSelf);
#endif  // VL_DEBUG
VL_ATTR_COLD void Vtop___024root___eval_stl(Vtop___024root* vlSelf);

VL_ATTR_COLD void Vtop___024root___eval_settle(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_settle\n"); );
    // Init
    CData/*0:0*/ __VstlContinue;
    // Body
    vlSelf->__VstlIterCount = 0U;
    __VstlContinue = 1U;
    while (__VstlContinue) {
        __VstlContinue = 0U;
        Vtop___024root___eval_triggers__stl(vlSelf);
        if (vlSelf->__VstlTriggered.any()) {
            __VstlContinue = 1U;
            if (VL_UNLIKELY((0x64U < vlSelf->__VstlIterCount))) {
#ifdef VL_DEBUG
                Vtop___024root___dump_triggers__stl(vlSelf);
#endif
                VL_FATAL_MT("src/fusesoc_pcie_dllp_receive_1.0.0/dllp_receive.sv", 11, "", "Settle region did not converge.");
            }
            vlSelf->__VstlIterCount = ((IData)(1U) 
                                       + vlSelf->__VstlIterCount);
            Vtop___024root___eval_stl(vlSelf);
        }
    }
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vtop___024root___dump_triggers__stl(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___dump_triggers__stl\n"); );
    // Body
    if ((1U & (~ (IData)(vlSelf->__VstlTriggered.any())))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if (vlSelf->__VstlTriggered.at(0U)) {
        VL_DBG_MSGF("         'stl' region trigger index 0 is active: Internal 'stl' trigger - first iteration\n");
    }
    if (vlSelf->__VstlTriggered.at(1U)) {
        VL_DBG_MSGF("         'stl' region trigger index 1 is active: @([hybrid] dllp_receive.dllp2tlp_inst.crc_byte_select)\n");
    }
}
#endif  // VL_DEBUG

void Vtop___024root___ico_sequent__TOP__0(Vtop___024root* vlSelf);
void Vtop___024root___ico_comb__TOP__0(Vtop___024root* vlSelf);

VL_ATTR_COLD void Vtop___024root___eval_stl(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_stl\n"); );
    // Body
    if (vlSelf->__VstlTriggered.at(0U)) {
        Vtop___024root___ico_sequent__TOP__0(vlSelf);
    }
    if ((vlSelf->__VstlTriggered.at(0U) | vlSelf->__VstlTriggered.at(1U))) {
        Vtop___024root___ico_comb__TOP__0(vlSelf);
    }
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vtop___024root___dump_triggers__ico(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___dump_triggers__ico\n"); );
    // Body
    if ((1U & (~ (IData)(vlSelf->__VicoTriggered.any())))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if (vlSelf->__VicoTriggered.at(0U)) {
        VL_DBG_MSGF("         'ico' region trigger index 0 is active: Internal 'ico' trigger - first iteration\n");
    }
    if (vlSelf->__VicoTriggered.at(1U)) {
        VL_DBG_MSGF("         'ico' region trigger index 1 is active: @([hybrid] dllp_receive.dllp2tlp_inst.crc_byte_select)\n");
    }
}
#endif  // VL_DEBUG

#ifdef VL_DEBUG
VL_ATTR_COLD void Vtop___024root___dump_triggers__act(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___dump_triggers__act\n"); );
    // Body
    if ((1U & (~ (IData)(vlSelf->__VactTriggered.any())))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if (vlSelf->__VactTriggered.at(0U)) {
        VL_DBG_MSGF("         'act' region trigger index 0 is active: @([hybrid] dllp_receive.dllp2tlp_inst.crc_byte_select)\n");
    }
    if (vlSelf->__VactTriggered.at(1U)) {
        VL_DBG_MSGF("         'act' region trigger index 1 is active: @(posedge clk_i)\n");
    }
}
#endif  // VL_DEBUG

#ifdef VL_DEBUG
VL_ATTR_COLD void Vtop___024root___dump_triggers__nba(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___dump_triggers__nba\n"); );
    // Body
    if ((1U & (~ (IData)(vlSelf->__VnbaTriggered.any())))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if (vlSelf->__VnbaTriggered.at(0U)) {
        VL_DBG_MSGF("         'nba' region trigger index 0 is active: @([hybrid] dllp_receive.dllp2tlp_inst.crc_byte_select)\n");
    }
    if (vlSelf->__VnbaTriggered.at(1U)) {
        VL_DBG_MSGF("         'nba' region trigger index 1 is active: @(posedge clk_i)\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void Vtop___024root___ctor_var_reset(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___ctor_var_reset\n"); );
    // Body
    vlSelf->clk_i = VL_RAND_RESET_I(1);
    vlSelf->rst_i = VL_RAND_RESET_I(1);
    vlSelf->link_status_i = VL_RAND_RESET_I(2);
    vlSelf->phy_link_up_i = VL_RAND_RESET_I(1);
    vlSelf->s_axis_tdata = VL_RAND_RESET_I(32);
    vlSelf->s_axis_tkeep = VL_RAND_RESET_I(4);
    vlSelf->s_axis_tvalid = VL_RAND_RESET_I(1);
    vlSelf->s_axis_tlast = VL_RAND_RESET_I(1);
    vlSelf->s_axis_tuser = VL_RAND_RESET_I(4);
    vlSelf->s_axis_tready = VL_RAND_RESET_I(1);
    vlSelf->m_axis_dllp2tlp_tdata = VL_RAND_RESET_I(32);
    vlSelf->m_axis_dllp2tlp_tkeep = VL_RAND_RESET_I(4);
    vlSelf->m_axis_dllp2tlp_tvalid = VL_RAND_RESET_I(1);
    vlSelf->m_axis_dllp2tlp_tlast = VL_RAND_RESET_I(1);
    vlSelf->m_axis_dllp2tlp_tuser = VL_RAND_RESET_I(4);
    vlSelf->m_axis_dllp2tlp_tready = VL_RAND_RESET_I(1);
    vlSelf->m_axis_dllp2phy_tdata = VL_RAND_RESET_I(32);
    vlSelf->m_axis_dllp2phy_tkeep = VL_RAND_RESET_I(4);
    vlSelf->m_axis_dllp2phy_tvalid = VL_RAND_RESET_I(1);
    vlSelf->m_axis_dllp2phy_tlast = VL_RAND_RESET_I(1);
    vlSelf->m_axis_dllp2phy_tuser = VL_RAND_RESET_I(4);
    vlSelf->m_axis_dllp2phy_tready = VL_RAND_RESET_I(1);
    vlSelf->seq_num_o = VL_RAND_RESET_I(12);
    vlSelf->seq_num_vld_o = VL_RAND_RESET_I(1);
    vlSelf->seq_num_acknack_o = VL_RAND_RESET_I(1);
    vlSelf->fc1_values_stored_o = VL_RAND_RESET_I(1);
    vlSelf->fc2_values_stored_o = VL_RAND_RESET_I(1);
    vlSelf->tx_fc_ph_o = VL_RAND_RESET_I(8);
    vlSelf->tx_fc_pd_o = VL_RAND_RESET_I(12);
    vlSelf->tx_fc_nph_o = VL_RAND_RESET_I(8);
    vlSelf->tx_fc_npd_o = VL_RAND_RESET_I(12);
    vlSelf->tx_fc_cplh_o = VL_RAND_RESET_I(8);
    vlSelf->tx_fc_cpld_o = VL_RAND_RESET_I(12);
    vlSelf->update_fc_o = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__clk_i = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__rst_i = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__link_status_i = VL_RAND_RESET_I(2);
    vlSelf->dllp_receive__DOT__phy_link_up_i = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__s_axis_tdata = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__s_axis_tkeep = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__s_axis_tvalid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__s_axis_tlast = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__s_axis_tuser = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__s_axis_tready = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__m_axis_dllp2tlp_tdata = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__m_axis_dllp2tlp_tkeep = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__m_axis_dllp2tlp_tvalid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__m_axis_dllp2tlp_tlast = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__m_axis_dllp2tlp_tuser = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__m_axis_dllp2tlp_tready = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__m_axis_dllp2phy_tdata = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__m_axis_dllp2phy_tkeep = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__m_axis_dllp2phy_tvalid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__m_axis_dllp2phy_tlast = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__m_axis_dllp2phy_tuser = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__m_axis_dllp2phy_tready = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__seq_num_o = VL_RAND_RESET_I(12);
    vlSelf->dllp_receive__DOT__seq_num_vld_o = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__seq_num_acknack_o = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__fc1_values_stored_o = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__fc2_values_stored_o = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__tx_fc_ph_o = VL_RAND_RESET_I(8);
    vlSelf->dllp_receive__DOT__tx_fc_pd_o = VL_RAND_RESET_I(12);
    vlSelf->dllp_receive__DOT__tx_fc_nph_o = VL_RAND_RESET_I(8);
    vlSelf->dllp_receive__DOT__tx_fc_npd_o = VL_RAND_RESET_I(12);
    vlSelf->dllp_receive__DOT__tx_fc_cplh_o = VL_RAND_RESET_I(8);
    vlSelf->dllp_receive__DOT__tx_fc_cpld_o = VL_RAND_RESET_I(12);
    vlSelf->dllp_receive__DOT__update_fc_o = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_ready = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__tlp_ready = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__start_flow_control = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__start_flow_control_ack = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__next_transmit_seq = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__tlp_nullified = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__ph_credits_consumed = VL_RAND_RESET_I(8);
    vlSelf->dllp_receive__DOT__pd_credits_consumed = VL_RAND_RESET_I(12);
    vlSelf->dllp_receive__DOT__nph_credits_consumed = VL_RAND_RESET_I(8);
    vlSelf->dllp_receive__DOT__npd_credits_consumed = VL_RAND_RESET_I(12);
    vlSelf->dllp_receive__DOT__tlp_axis_tdata = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__tlp_axis_tkeep = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__tlp_axis_tvalid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__tlp_axis_tlast = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__tlp_axis_tuser = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__tlp_axis_tready = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_axis_tdata = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp_axis_tkeep = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp_axis_tvalid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_axis_tlast = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_axis_tuser = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp_axis_tready = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__clk_i = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__rst_i = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__link_status_i = VL_RAND_RESET_I(2);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__s_axis_tdata = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__s_axis_tkeep = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__s_axis_tvalid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__s_axis_tlast = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__s_axis_tuser = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__s_axis_tready = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__m_tlp_axis_tdata = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__m_tlp_axis_tkeep = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__m_tlp_axis_tvalid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__m_tlp_axis_tlast = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__m_tlp_axis_tuser = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__m_tlp_axis_tready = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__m_dllp_axis_tdata = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__m_dllp_axis_tkeep = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__m_dllp_axis_tvalid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__m_dllp_axis_tlast = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__m_dllp_axis_tuser = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__m_dllp_axis_tready = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__curr_state = VL_RAND_RESET_I(3);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__next_state = VL_RAND_RESET_I(3);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_valid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_valid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__clk = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__rst = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__s_axis_tdata = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__s_axis_tkeep = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__s_axis_tvalid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__s_axis_tready = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__s_axis_tlast = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__s_axis_tid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__s_axis_tdest = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__s_axis_tuser = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__m_axis_tdata = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__m_axis_tkeep = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__m_axis_tvalid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__m_axis_tready = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__m_axis_tlast = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__m_axis_tid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__m_axis_tdest = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__m_axis_tuser = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__s_axis_tready_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__m_axis_tdata_reg = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__m_axis_tkeep_reg = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__m_axis_tvalid_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__m_axis_tvalid_next = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__m_axis_tlast_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__m_axis_tid_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__m_axis_tdest_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__m_axis_tuser_reg = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_next = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__store_axis_input_to_output = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__store_axis_input_to_temp = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__store_axis_temp_to_output = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__s_axis_tready_early = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__clk = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__rst = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__s_axis_tdata = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__s_axis_tkeep = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__s_axis_tvalid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__s_axis_tready = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__s_axis_tlast = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__s_axis_tid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__s_axis_tdest = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__s_axis_tuser = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__m_axis_tdata = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__m_axis_tkeep = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__m_axis_tvalid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__m_axis_tready = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__m_axis_tlast = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__m_axis_tid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__m_axis_tdest = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__m_axis_tuser = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__s_axis_tready_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__m_axis_tdata_reg = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__m_axis_tkeep_reg = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__m_axis_tvalid_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__m_axis_tvalid_next = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__m_axis_tlast_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__m_axis_tid_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__m_axis_tdest_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__m_axis_tuser_reg = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_next = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__store_axis_input_to_output = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__store_axis_input_to_temp = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__store_axis_temp_to_output = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__s_axis_tready_early = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__clk_i = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__rst_i = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__phy_link_up_i = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__s_axis_tdata = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__s_axis_tkeep = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__s_axis_tvalid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__s_axis_tlast = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__s_axis_tuser = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__s_axis_tready = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__seq_num_o = VL_RAND_RESET_I(12);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__seq_num_vld_o = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__seq_num_acknack_o = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__fc1_values_stored_o = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__fc2_values_stored_o = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__tx_fc_ph_o = VL_RAND_RESET_I(8);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__tx_fc_pd_o = VL_RAND_RESET_I(12);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__tx_fc_nph_o = VL_RAND_RESET_I(8);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__tx_fc_npd_o = VL_RAND_RESET_I(12);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__tx_fc_cplh_o = VL_RAND_RESET_I(8);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__tx_fc_cpld_o = VL_RAND_RESET_I(12);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__update_fc_o = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__curr_state = VL_RAND_RESET_I(3);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__next_state = VL_RAND_RESET_I(3);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__dll_packet_c = VL_RAND_RESET_Q(48);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__dll_packet_r = VL_RAND_RESET_Q(48);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__crc_in_c = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__crc_in_r = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__crc_out = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__tlp_nullified_c = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__tlp_nullified_r = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__tx_tlp_ready_c = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__tx_tlp_ready_r = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__next_transmit_seq_c = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__next_transmit_seq_r = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__ackd_transmit_seq_c = VL_RAND_RESET_I(12);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__ackd_transmit_seq_r = VL_RAND_RESET_I(12);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__skid_s_axis_tdata = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__skid_s_axis_tkeep = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__skid_s_axis_tvalid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__skid_s_axis_tlast = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__skid_s_axis_tuser = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__skid_s_axis_tready = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__tx_fc_ph_c = VL_RAND_RESET_I(8);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__tx_fc_ph_r = VL_RAND_RESET_I(8);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__tx_fc_pd_c = VL_RAND_RESET_I(12);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__tx_fc_pd_r = VL_RAND_RESET_I(12);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__tx_fc_nph_c = VL_RAND_RESET_I(8);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__tx_fc_nph_r = VL_RAND_RESET_I(8);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__tx_fc_npd_c = VL_RAND_RESET_I(12);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__tx_fc_npd_r = VL_RAND_RESET_I(12);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__tx_fc_cplh_c = VL_RAND_RESET_I(8);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__tx_fc_cplh_r = VL_RAND_RESET_I(8);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__tx_fc_cpld_c = VL_RAND_RESET_I(12);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__tx_fc_cpld_r = VL_RAND_RESET_I(12);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__update_fc_c = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__update_fc_r = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__fc1_np_stored_c = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__fc1_np_stored_r = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__fc1_p_stored_c = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__fc1_p_stored_r = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__fc1_c_stored_c = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__fc1_c_stored_r = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__fc2_np_stored_c = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__fc2_np_stored_r = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__fc2_p_stored_c = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__fc2_p_stored_r = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__fc2_c_stored_c = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__fc2_c_stored_r = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__crc_reversed = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__byteswap__DOT__unnamedblk1__DOT__i = 0;
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crcIn = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__data = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crcOut = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc0 = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc1 = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc2 = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc3 = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc4 = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__unnamedblk1__DOT__i = 0;
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_0__DOT__crcIn = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_0__DOT__data = VL_RAND_RESET_I(8);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_0__DOT__crcOut = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_1__DOT__crcIn = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_1__DOT__data = VL_RAND_RESET_I(8);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_1__DOT__crcOut = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_2__DOT__crcIn = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_2__DOT__data = VL_RAND_RESET_I(8);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_2__DOT__crcOut = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_3__DOT__crcIn = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_3__DOT__data = VL_RAND_RESET_I(8);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_3__DOT__crcOut = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__clk = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__rst = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__s_axis_tdata = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__s_axis_tkeep = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__s_axis_tvalid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__s_axis_tready = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__s_axis_tlast = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__s_axis_tid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__s_axis_tdest = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__s_axis_tuser = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__m_axis_tdata = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__m_axis_tkeep = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__m_axis_tvalid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__m_axis_tready = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__m_axis_tlast = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__m_axis_tid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__m_axis_tdest = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__m_axis_tuser = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__s_axis_tready_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tdata_reg = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tkeep_reg = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tvalid_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tvalid_next = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tlast_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tid_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tdest_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tuser_reg = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_next = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__store_axis_input_to_output = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__store_axis_input_to_temp = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__store_axis_temp_to_output = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__s_axis_tready_early = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__clk_i = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__rst_i = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__link_status_i = VL_RAND_RESET_I(2);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__start_flow_control_i = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__start_flow_control_ack_o = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__next_transmit_seq_i = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__tlp_nullified_i = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__ph_credits_consumed_i = VL_RAND_RESET_I(8);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__pd_credits_consumed_i = VL_RAND_RESET_I(12);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__nph_credits_consumed_i = VL_RAND_RESET_I(8);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__npd_credits_consumed_i = VL_RAND_RESET_I(12);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__m_axis_tdata = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__m_axis_tkeep = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__m_axis_tvalid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__m_axis_tlast = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__m_axis_tuser = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__m_axis_tready = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__fc_axis_tdata = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__fc_axis_tkeep = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__fc_axis_tvalid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__fc_axis_tlast = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__fc_axis_tuser = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__fc_axis_tready = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__curr_state = VL_RAND_RESET_I(5);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__next_state = VL_RAND_RESET_I(5);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__dll_packet_c = VL_RAND_RESET_Q(48);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__dll_packet_r = VL_RAND_RESET_Q(48);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__dllp_lcrc_c = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__dllp_lcrc_r = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__timer_c = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__timer_r = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__crc_out = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__crc_reversed = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__start_ack_c = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__start_ack_r = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__byteswap__DOT__unnamedblk1__DOT__i = 0;
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__clk = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__rst = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tdata = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tkeep = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tvalid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tlast = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tdest = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tuser = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tdata = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tkeep = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tvalid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tready = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tlast = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tdest = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tuser = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tdata_reg = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tkeep_reg = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tvalid_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tvalid_next = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tlast_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tid_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tdest_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tuser_reg = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_next = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__store_axis_input_to_output = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__store_axis_input_to_temp = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__store_axis_temp_to_output = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_early = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crcIn = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__data = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crcOut = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc0 = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc1 = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc2 = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc3 = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc4 = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__unnamedblk1__DOT__i = 0;
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT__crcIn = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT__data = VL_RAND_RESET_I(8);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT__crcOut = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT__crcIn = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT__data = VL_RAND_RESET_I(8);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT__crcOut = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT__crcIn = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT__data = VL_RAND_RESET_I(8);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT__crcOut = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT__crcIn = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT__data = VL_RAND_RESET_I(8);
    vlSelf->dllp_receive__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT__crcOut = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__clk_i = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__rst_i = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__link_status_i = VL_RAND_RESET_I(2);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__s_axis_tdata = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__s_axis_tkeep = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__s_axis_tvalid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__s_axis_tlast = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__s_axis_tuser = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__s_axis_tready = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__start_flow_control_o = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__start_flow_control_ack_i = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__next_transmit_seq_o = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__tlp_nullified_o = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__ph_credits_consumed_o = VL_RAND_RESET_I(8);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__pd_credits_consumed_o = VL_RAND_RESET_I(12);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__nph_credits_consumed_o = VL_RAND_RESET_I(8);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__npd_credits_consumed_o = VL_RAND_RESET_I(12);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__m_tlp_axis_tdata = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__m_tlp_axis_tkeep = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__m_tlp_axis_tvalid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__m_tlp_axis_tlast = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__m_tlp_axis_tuser = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__m_tlp_axis_tready = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__curr_state = VL_RAND_RESET_I(5);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__next_state = VL_RAND_RESET_I(5);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dll_packet = VL_RAND_RESET_Q(48);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__fc_start_c = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__fc_start_r = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__tlp_nullified_c = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__tlp_nullified_r = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__next_transmit_seq_c = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__next_transmit_seq_r = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__next_expected_seq_num_c = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__next_expected_seq_num_r = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__ackd_transmit_seq_c = VL_RAND_RESET_I(12);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__ackd_transmit_seq_r = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__crc_from_tlp_c = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__crc_from_tlp_r = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__crc_calculated_c = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__crc_calculated_r = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__crc_output = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__crc_reversed = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp_crc_out = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp_crc_reversed = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp_lcrc_c = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp_lcrc_r = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__word_count_c = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__word_count_r = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__crc_byte_select = VL_RAND_RESET_I(2);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__tlp_dw0 = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_c = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_r = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__tlp_is_nph_c = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__tlp_is_nph_r = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__tlp_is_ph_c = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__tlp_is_ph_r = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__tlp_is_npd_c = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__tlp_is_npd_r = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__tlp_is_pd_c = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__tlp_is_pd_r = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_c = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_r = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__skid_axis_tdata = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__skid_axis_tkeep = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__skid_axis_tvalid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__skid_axis_tlast = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__skid_axis_tuser = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__skid_axis_tready = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__pipeline_axis_tdata = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__pipeline_axis_tkeep = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__pipeline_axis_tvalid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__pipeline_axis_tlast = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__pipeline_axis_tuser = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__pipeline_axis_tready = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__pipeline_stg2_axis_tdata = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__pipeline_stg2_axis_tkeep = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__pipeline_stg2_axis_tvalid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__pipeline_stg2_axis_tlast = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__pipeline_stg2_axis_tuser = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__pipeline_stg2_axis_tready = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__phy_axis_tdata = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__phy_axis_tkeep = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__phy_axis_tvalid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__phy_axis_tlast = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__phy_axis_tuser = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__phy_axis_tready = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__tlp_axis_tdata = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__tlp_axis_tkeep = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__tlp_axis_tvalid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__tlp_axis_tlast = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__tlp_axis_tuser = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__tlp_axis_tready = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__tlp_header_offset = VL_RAND_RESET_I(16);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__ph_credits_consumed_c = VL_RAND_RESET_I(8);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__ph_credits_consumed_r = VL_RAND_RESET_I(8);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__pd_credits_consumed_c = VL_RAND_RESET_I(12);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__pd_credits_consumed_r = VL_RAND_RESET_I(12);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__nph_credits_consumed_c = VL_RAND_RESET_I(8);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__nph_credits_consumed_r = VL_RAND_RESET_I(8);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__npd_credits_consumed_c = VL_RAND_RESET_I(12);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__npd_credits_consumed_r = VL_RAND_RESET_I(12);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__cplh_credits_consumed_c = VL_RAND_RESET_I(8);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__cplh_credits_consumed_r = VL_RAND_RESET_I(8);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__cpld_credits_consumed_c = VL_RAND_RESET_I(12);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__cpld_credits_consumed_r = VL_RAND_RESET_I(12);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__byteswap__DOT__unnamedblk1__DOT__i = 0;
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__clk = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__rst = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__s_axis_tdata = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__s_axis_tkeep = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__s_axis_tvalid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__s_axis_tready = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__s_axis_tlast = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__s_axis_tid = VL_RAND_RESET_I(8);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__s_axis_tdest = VL_RAND_RESET_I(8);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__s_axis_tuser = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_tdata = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_tkeep = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_tvalid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_tready = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_tlast = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_tid = VL_RAND_RESET_I(8);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_tdest = VL_RAND_RESET_I(8);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_tuser = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__pause_req = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__pause_ack = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__status_depth = VL_RAND_RESET_I(2);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__status_depth_commit = VL_RAND_RESET_I(2);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__status_overflow = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__status_bad_frame = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__status_good_frame = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__wr_ptr_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__wr_ptr_commit_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__rd_ptr_reg = VL_RAND_RESET_I(1);
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__mem[__Vi0] = VL_RAND_RESET_Q(41);
    }
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__mem_read_data_valid_reg = VL_RAND_RESET_I(1);
    for (int __Vi0 = 0; __Vi0 < 2; ++__Vi0) {
        vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_pipe_reg[__Vi0] = VL_RAND_RESET_Q(41);
    }
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_tvalid_pipe_reg = VL_RAND_RESET_I(2);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__full = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__empty = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__full_wr = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__s_frame_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__drop_frame_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__mark_frame_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__send_frame_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__depth_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__depth_commit_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__overflow_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__bad_frame_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__good_frame_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__s_axis = VL_RAND_RESET_Q(41);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis = VL_RAND_RESET_Q(41);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_tready_pipe = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_tvalid_pipe = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_tdata_pipe = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_tkeep_pipe = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_tlast_pipe = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_tid_pipe = VL_RAND_RESET_I(8);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_tdest_pipe = VL_RAND_RESET_I(8);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_tuser_pipe = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_tready_out = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_tvalid_out = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_tdata_out = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_tkeep_out = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_tlast_out = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_tid_out = VL_RAND_RESET_I(8);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_tdest_out = VL_RAND_RESET_I(8);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_tuser_out = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__pipe_ready = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__j = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT____Vlvbound_h08452fba__0 = VL_RAND_RESET_Q(41);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__clk = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__rst = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tdata = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tkeep = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tvalid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tready = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tlast = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tdest = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__s_axis_tuser = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tdata = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tkeep = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tvalid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tready = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tlast = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tdest = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__m_axis_tuser = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tdata_reg = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tkeep_reg = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tvalid_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tvalid_next = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tlast_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tid_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tdest_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tuser_reg = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_next = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__store_axis_input_to_output = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__store_axis_input_to_temp = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__store_axis_temp_to_output = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_early = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__clk = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__rst = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__s_axis_tdata = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__s_axis_tkeep = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__s_axis_tvalid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__s_axis_tready = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__s_axis_tlast = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__s_axis_tid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__s_axis_tdest = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__s_axis_tuser = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__m_axis_tdata = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__m_axis_tkeep = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__m_axis_tvalid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__m_axis_tready = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__m_axis_tlast = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__m_axis_tid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__m_axis_tdest = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__m_axis_tuser = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__s_axis_tready_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tdata_reg = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tkeep_reg = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tvalid_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tvalid_next = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tlast_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tid_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tdest_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tuser_reg = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_next = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__store_axis_input_to_output = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__store_axis_input_to_temp = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__store_axis_temp_to_output = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__s_axis_tready_early = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__clk = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__rst = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__s_axis_tdata = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__s_axis_tkeep = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__s_axis_tvalid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__s_axis_tready = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__s_axis_tlast = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__s_axis_tid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__s_axis_tdest = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__s_axis_tuser = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__m_axis_tdata = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__m_axis_tkeep = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__m_axis_tvalid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__m_axis_tready = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__m_axis_tlast = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__m_axis_tid = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__m_axis_tdest = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__m_axis_tuser = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__s_axis_tready_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__m_axis_tdata_reg = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__m_axis_tkeep_reg = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__m_axis_tvalid_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__m_axis_tvalid_next = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__m_axis_tlast_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__m_axis_tid_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__m_axis_tdest_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__m_axis_tuser_reg = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_next = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg = VL_RAND_RESET_I(4);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__store_axis_input_to_output = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__store_axis_input_to_temp = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__store_axis_temp_to_output = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__s_axis_tready_early = VL_RAND_RESET_I(1);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__tlp_crc16_inst__DOT__crcIn = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__tlp_crc16_inst__DOT__data = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__tlp_crc16_inst__DOT__crcOut = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__tlp_crc16_inst__DOT__select = VL_RAND_RESET_I(2);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__tlp_crc16_inst__DOT__crc_out8 = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__tlp_crc16_inst__DOT__crc_out16 = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__tlp_crc16_inst__DOT__crc_out24 = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__tlp_crc16_inst__DOT__crc_out32 = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__tlp_crc16_inst__DOT__pcie_crc8_inst0__DOT__crcIn = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__tlp_crc16_inst__DOT__pcie_crc8_inst0__DOT__data = VL_RAND_RESET_I(8);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__tlp_crc16_inst__DOT__pcie_crc8_inst0__DOT__crcOut = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__tlp_crc16_inst__DOT__pcie_crc8_inst1__DOT__crcIn = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__tlp_crc16_inst__DOT__pcie_crc8_inst1__DOT__data = VL_RAND_RESET_I(8);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__tlp_crc16_inst__DOT__pcie_crc8_inst1__DOT__crcOut = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__tlp_crc16_inst__DOT__pcie_crc8_inst2__DOT__crcIn = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__tlp_crc16_inst__DOT__pcie_crc8_inst2__DOT__data = VL_RAND_RESET_I(8);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__tlp_crc16_inst__DOT__pcie_crc8_inst2__DOT__crcOut = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__tlp_crc16_inst__DOT__pcie_crc8_inst3__DOT__crcIn = VL_RAND_RESET_I(32);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__tlp_crc16_inst__DOT__pcie_crc8_inst3__DOT__data = VL_RAND_RESET_I(8);
    vlSelf->dllp_receive__DOT__dllp2tlp_inst__DOT__tlp_crc16_inst__DOT__pcie_crc8_inst3__DOT__crcOut = VL_RAND_RESET_I(32);
    vlSelf->__Vtask_get_fc_values__0__hdr_fc_out = VL_RAND_RESET_I(8);
    vlSelf->__Vtask_get_fc_values__0__data_fc_out = VL_RAND_RESET_I(12);
    vlSelf->__Vtask_get_fc_values__0__flow_control_in = VL_RAND_RESET_Q(48);
    vlSelf->__Vtask_get_fc_values__1__hdr_fc_out = VL_RAND_RESET_I(8);
    vlSelf->__Vtask_get_fc_values__1__data_fc_out = VL_RAND_RESET_I(12);
    vlSelf->__Vtask_get_fc_values__1__flow_control_in = VL_RAND_RESET_Q(48);
    vlSelf->__Vtask_get_fc_values__2__hdr_fc_out = VL_RAND_RESET_I(8);
    vlSelf->__Vtask_get_fc_values__2__data_fc_out = VL_RAND_RESET_I(12);
    vlSelf->__Vtask_get_fc_values__2__flow_control_in = VL_RAND_RESET_Q(48);
    vlSelf->__Vtask_get_fc_values__3__hdr_fc_out = VL_RAND_RESET_I(8);
    vlSelf->__Vtask_get_fc_values__3__data_fc_out = VL_RAND_RESET_I(12);
    vlSelf->__Vtask_get_fc_values__3__flow_control_in = VL_RAND_RESET_Q(48);
    vlSelf->__Vtask_get_fc_values__4__hdr_fc_out = VL_RAND_RESET_I(8);
    vlSelf->__Vtask_get_fc_values__4__data_fc_out = VL_RAND_RESET_I(12);
    vlSelf->__Vtask_get_fc_values__4__flow_control_in = VL_RAND_RESET_Q(48);
    vlSelf->__Vtask_get_fc_values__5__hdr_fc_out = VL_RAND_RESET_I(8);
    vlSelf->__Vtask_get_fc_values__5__data_fc_out = VL_RAND_RESET_I(12);
    vlSelf->__Vtask_get_fc_values__5__flow_control_in = VL_RAND_RESET_Q(48);
    vlSelf->__Vtask_get_fc_values__6__hdr_fc_out = VL_RAND_RESET_I(8);
    vlSelf->__Vtask_get_fc_values__6__data_fc_out = VL_RAND_RESET_I(12);
    vlSelf->__Vtask_get_fc_values__6__flow_control_in = VL_RAND_RESET_Q(48);
    vlSelf->__Vtask_get_fc_values__7__hdr_fc_out = VL_RAND_RESET_I(8);
    vlSelf->__Vtask_get_fc_values__7__data_fc_out = VL_RAND_RESET_I(12);
    vlSelf->__Vtask_get_fc_values__7__flow_control_in = VL_RAND_RESET_Q(48);
    vlSelf->__Vtask_get_fc_values__8__hdr_fc_out = VL_RAND_RESET_I(8);
    vlSelf->__Vtask_get_fc_values__8__data_fc_out = VL_RAND_RESET_I(12);
    vlSelf->__Vtask_get_fc_values__8__flow_control_in = VL_RAND_RESET_Q(48);
    vlSelf->__Vfunc_get_ack_nack_seq__9__Vfuncout = VL_RAND_RESET_I(12);
    vlSelf->__Vfunc_get_ack_nack_seq__9__ack_nack_in = VL_RAND_RESET_Q(48);
    vlSelf->__Vfunc_get_ack_nack_seq__10__Vfuncout = VL_RAND_RESET_I(12);
    vlSelf->__Vfunc_get_ack_nack_seq__10__ack_nack_in = VL_RAND_RESET_Q(48);
    vlSelf->__Vfunc_send_fc_init__11__Vfuncout = VL_RAND_RESET_Q(48);
    vlSelf->__Vfunc_send_fc_init__11__hdrfc = VL_RAND_RESET_I(8);
    vlSelf->__Vfunc_send_fc_init__11__datafc = VL_RAND_RESET_I(12);
    vlSelf->__Vfunc_send_fc_init__11__unnamedblk1__DOT__dll_packet = VL_RAND_RESET_Q(48);
    vlSelf->__Vfunc_send_fc_init__12__Vfuncout = VL_RAND_RESET_Q(48);
    vlSelf->__Vfunc_send_fc_init__12__hdrfc = VL_RAND_RESET_I(8);
    vlSelf->__Vfunc_send_fc_init__12__datafc = VL_RAND_RESET_I(12);
    vlSelf->__Vfunc_send_fc_init__12__unnamedblk1__DOT__dll_packet = VL_RAND_RESET_Q(48);
    vlSelf->__Vfunc_send_fc_init__13__Vfuncout = VL_RAND_RESET_Q(48);
    vlSelf->__Vfunc_send_fc_init__13__hdrfc = VL_RAND_RESET_I(8);
    vlSelf->__Vfunc_send_fc_init__13__datafc = VL_RAND_RESET_I(12);
    vlSelf->__Vfunc_send_fc_init__13__unnamedblk1__DOT__dll_packet = VL_RAND_RESET_Q(48);
    vlSelf->__Vfunc_set_ack_nack__14__Vfuncout = VL_RAND_RESET_Q(48);
    vlSelf->__Vfunc_set_ack_nack__14__dllp_type = VL_RAND_RESET_I(8);
    vlSelf->__Vfunc_set_ack_nack__14__seq_num = VL_RAND_RESET_I(12);
    vlSelf->__Vfunc_set_ack_nack__14__temp_dllp = VL_RAND_RESET_Q(48);
    vlSelf->__Vtrigrprev__TOP__dllp_receive__DOT__dllp2tlp_inst__DOT__crc_byte_select = VL_RAND_RESET_I(2);
    vlSelf->__VstlDidInit = 0;
    vlSelf->__VicoDidInit = 0;
    vlSelf->__Vtrigrprev__TOP__clk_i = VL_RAND_RESET_I(1);
    vlSelf->__VactDidInit = 0;
}
