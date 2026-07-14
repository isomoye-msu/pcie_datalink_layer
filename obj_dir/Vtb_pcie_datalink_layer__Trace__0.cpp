// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals

#include "verilated_vcd_c.h"
#include "Vtb_pcie_datalink_layer__Syms.h"


void Vtb_pcie_datalink_layer___024root__trace_chg_0_sub_0(Vtb_pcie_datalink_layer___024root* vlSelf, VerilatedVcd::Buffer* bufp);

void Vtb_pcie_datalink_layer___024root__trace_chg_0(void* voidSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_pcie_datalink_layer___024root__trace_chg_0\n"); );
    // Body
    Vtb_pcie_datalink_layer___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vtb_pcie_datalink_layer___024root*>(voidSelf);
    Vtb_pcie_datalink_layer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (VL_UNLIKELY(!vlSymsp->__Vm_activity)) return;
    Vtb_pcie_datalink_layer___024root__trace_chg_0_sub_0((&vlSymsp->TOP), bufp);
}

extern const VlUnpacked<CData/*0:0*/, 32> Vtb_pcie_datalink_layer__ConstPool__TABLE_hb0f749ab_0;
extern const VlUnpacked<CData/*0:0*/, 32> Vtb_pcie_datalink_layer__ConstPool__TABLE_hea75a59c_0;
extern const VlUnpacked<CData/*0:0*/, 32> Vtb_pcie_datalink_layer__ConstPool__TABLE_h9068cabe_0;
extern const VlUnpacked<CData/*0:0*/, 32> Vtb_pcie_datalink_layer__ConstPool__TABLE_h5ebe4fc2_0;
extern const VlUnpacked<CData/*0:0*/, 32> Vtb_pcie_datalink_layer__ConstPool__TABLE_h70871376_0;
void Vtb_pcie_datalink_layer___024root__trace_chg_dtype____0(Vtb_pcie_datalink_layer___024root* vlSelf, VerilatedVcd::Buffer* bufp, uint32_t offset, const Vtb_pcie_datalink_layer_pcie_config_reg___05Fout_t__struct__0& __VdtypeVar);
void Vtb_pcie_datalink_layer___024root__trace_chg_dtype____1(Vtb_pcie_datalink_layer___024root* vlSelf, VerilatedVcd::Buffer* bufp, uint32_t offset, const VlUnpacked<QData/*40:0*/, 1>& __VdtypeVar);
void Vtb_pcie_datalink_layer___024root__trace_chg_dtype____2(Vtb_pcie_datalink_layer___024root* vlSelf, VerilatedVcd::Buffer* bufp, uint32_t offset, const VlUnpacked<QData/*40:0*/, 2>& __VdtypeVar);
void Vtb_pcie_datalink_layer___024root__trace_chg_dtype____3(Vtb_pcie_datalink_layer___024root* vlSelf, VerilatedVcd::Buffer* bufp, uint32_t offset, const VlUnpacked<CData/*0:0*/, 2>& __VdtypeVar);
void Vtb_pcie_datalink_layer___024root__trace_chg_dtype____4(Vtb_pcie_datalink_layer___024root* vlSelf, VerilatedVcd::Buffer* bufp, uint32_t offset, const VlUnpacked<CData/*0:0*/, 2>& __VdtypeVar);
void Vtb_pcie_datalink_layer___024root__trace_chg_dtype____5(Vtb_pcie_datalink_layer___024root* vlSelf, VerilatedVcd::Buffer* bufp, uint32_t offset, const VlUnpacked<IData/*31:0*/, 2>& __VdtypeVar);
void Vtb_pcie_datalink_layer___024root__trace_chg_dtype____6(Vtb_pcie_datalink_layer___024root* vlSelf, VerilatedVcd::Buffer* bufp, uint32_t offset, const Vtb_pcie_datalink_layer_tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage_t__struct__0& __VdtypeVar);

void Vtb_pcie_datalink_layer___024root__trace_chg_0_sub_0(Vtb_pcie_datalink_layer___024root* vlSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_pcie_datalink_layer___024root__trace_chg_0_sub_0\n"); );
    Vtb_pcie_datalink_layer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    VlWide<8>/*255:0*/ __Vtemp_1;
    VlWide<4>/*127:0*/ __Vtemp_2;
    // Body
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode + 0);
    if (VL_UNLIKELY((vlSelfRef.__Vm_traceActivity[1U]))) {
        bufp->chgBit(oldp+0,((1U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__s_axis_tready))));
        bufp->chgIData(oldp+1,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__tlp_fifo_inst__DOT__genblk1__DOT__m_axis_tdata_reg),32);
        bufp->chgCData(oldp+2,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__tlp_fifo_inst__DOT__genblk1__DOT__m_axis_tkeep_reg),4);
        bufp->chgBit(oldp+3,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__tlp_fifo_inst__DOT__genblk1__DOT__m_axis_tvalid_reg));
        bufp->chgBit(oldp+4,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__tlp_fifo_inst__DOT__genblk1__DOT__m_axis_tlast_reg));
        bufp->chgCData(oldp+5,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__tlp_fifo_inst__DOT__genblk1__DOT__m_axis_tuser_reg),4);
        bufp->chgBit(oldp+6,(vlSelfRef.tb_pcie_datalink_layer__DOT__s_axis_phy2dllp_tready));
        bufp->chgIData(oldp+7,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__m_axis_tdata_reg),32);
        bufp->chgCData(oldp+8,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__m_axis_tkeep_reg),4);
        bufp->chgBit(oldp+9,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__m_axis_tvalid_reg));
        bufp->chgBit(oldp+10,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__m_axis_tlast_reg));
        bufp->chgCData(oldp+11,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__m_axis_tuser_reg),4);
        bufp->chgBit(oldp+12,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__fc2_values_sent));
        bufp->chgCData(oldp+13,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__Q
                                .__PVT__cfg_bus_number),8);
        bufp->chgCData(oldp+14,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__Q
                                .__PVT__cfg_device_number),5);
        bufp->chgCData(oldp+15,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__Q
                                .__PVT__cfg_function_number),3);
        bufp->chgIData(oldp+16,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tdata_reg),32);
        bufp->chgCData(oldp+17,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tkeep_reg),4);
        bufp->chgBit(oldp+18,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tvalid_reg));
        bufp->chgBit(oldp+19,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tlast_reg));
        bufp->chgCData(oldp+20,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tuser_reg),4);
        bufp->chgBit(oldp+21,((1U & ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__s_axis_tready) 
                                     >> 1U))));
        bufp->chgIData(oldp+22,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tdata_reg),32);
        bufp->chgCData(oldp+23,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tkeep_reg),4);
        bufp->chgBit(oldp+24,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tvalid_reg));
        bufp->chgBit(oldp+25,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tlast_reg));
        bufp->chgCData(oldp+26,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tuser_reg),4);
        bufp->chgBit(oldp+27,((1U & ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__s_axis_tready) 
                                     >> 2U))));
        bufp->chgIData(oldp+28,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__m_axis_tdata_reg),32);
        bufp->chgCData(oldp+29,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__m_axis_tkeep_reg),4);
        bufp->chgBit(oldp+30,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__m_axis_tvalid_reg));
        bufp->chgBit(oldp+31,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__m_axis_tlast_reg));
        bufp->chgCData(oldp+32,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__m_axis_tuser_reg),4);
        bufp->chgBit(oldp+33,((1U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__s_axis_tready))));
        bufp->chgIData(oldp+34,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tdata_reg),32);
        bufp->chgCData(oldp+35,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tkeep_reg),4);
        bufp->chgBit(oldp+36,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tvalid_reg));
        bufp->chgBit(oldp+37,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tlast_reg));
        bufp->chgCData(oldp+38,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tuser_reg),4);
        bufp->chgBit(oldp+39,((1U & ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__s_axis_tready) 
                                     >> 1U))));
        bufp->chgIData(oldp+40,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__m_axis_tdata_reg),32);
        bufp->chgCData(oldp+41,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__m_axis_tkeep_reg),4);
        bufp->chgBit(oldp+42,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__m_axis_tvalid_reg));
        bufp->chgBit(oldp+43,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__m_axis_tlast_reg));
        bufp->chgCData(oldp+44,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__m_axis_tuser_reg),4);
        bufp->chgBit(oldp+45,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__s_axis_tready_reg));
        bufp->chgSData(oldp+46,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__seq_num),12);
        bufp->chgBit(oldp+47,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__seq_num_vld));
        bufp->chgBit(oldp+48,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__seq_num_acknack));
        bufp->chgCData(oldp+49,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_ph_r),8);
        bufp->chgSData(oldp+50,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_pd_r),12);
        bufp->chgCData(oldp+51,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_nph_r),8);
        bufp->chgSData(oldp+52,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_npd_r),12);
        bufp->chgCData(oldp+53,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_cplh_r),8);
        bufp->chgSData(oldp+54,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_cpld_r),12);
        bufp->chgBit(oldp+55,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__update_fc_r));
        bufp->chgBit(oldp+56,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__fc1_values_stored));
        bufp->chgBit(oldp+57,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__fc2_values_stored));
        bufp->chgBit(oldp+58,(((~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__fc2_values_stored_reg)) 
                               & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__fc1_values_stored))));
        bufp->chgBit(oldp+59,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__fc2_values_stored_reg));
        bufp->chgBit(oldp+60,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__first_feature_exchange_dllp_received_r));
        bufp->chgBit(oldp+61,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__first_tlp_valid_r));
        bufp->chgWData(oldp+62,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__s_axis_tdata),96);
        bufp->chgSData(oldp+65,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__s_axis_tkeep),12);
        bufp->chgCData(oldp+66,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__s_axis_tvalid),3);
        bufp->chgCData(oldp+67,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__s_axis_tready),3);
        bufp->chgCData(oldp+68,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__s_axis_tlast),3);
        bufp->chgSData(oldp+69,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__s_axis_tuser),12);
        bufp->chgCData(oldp+70,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__request),3);
        bufp->chgCData(oldp+71,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__acknowledge),3);
        bufp->chgCData(oldp+72,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_reg),3);
        bufp->chgBit(oldp+73,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_valid_reg));
        bufp->chgCData(oldp+74,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_encoded_reg),2);
        bufp->chgWData(oldp+75,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__s_axis_tdata_reg),96);
        bufp->chgSData(oldp+78,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__s_axis_tkeep_reg),12);
        bufp->chgCData(oldp+79,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__s_axis_tvalid_reg),3);
        bufp->chgCData(oldp+80,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__s_axis_tlast_reg),3);
        bufp->chgIData(oldp+81,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__s_axis_tid_reg),24);
        bufp->chgIData(oldp+82,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__s_axis_tdest_reg),24);
        bufp->chgSData(oldp+83,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__s_axis_tuser_reg),12);
        bufp->chgIData(oldp+84,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__m_axis_tdata_int),32);
        bufp->chgCData(oldp+85,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__m_axis_tkeep_int),4);
        bufp->chgBit(oldp+86,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__m_axis_tvalid_int));
        bufp->chgBit(oldp+87,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__m_axis_tready_int_reg));
        bufp->chgBit(oldp+88,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__m_axis_tlast_int));
        bufp->chgSData(oldp+89,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__current_s_tid),10);
        bufp->chgCData(oldp+90,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__m_axis_tdest_int),8);
        bufp->chgCData(oldp+91,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__m_axis_tuser_int),4);
        bufp->chgBit(oldp+92,((1U & ((~ ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__temp_m_axis_tvalid_reg) 
                                         | ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__m_axis_tvalid_reg) 
                                            & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__m_axis_tvalid_int)))) 
                                     | (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__m_axis_dllp2phy_tready)))));
        bufp->chgBit(oldp+93,(((2U >= (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_encoded_reg)) 
                               & ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__s_axis_tvalid_reg) 
                                  >> (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_encoded_reg)))));
        bufp->chgBit(oldp+94,(((2U >= (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_encoded_reg)) 
                               & ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__s_axis_tready) 
                                  >> (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_encoded_reg)))));
        bufp->chgCData(oldp+95,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__current_s_tid),8);
        bufp->chgIData(oldp+96,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__i),32);
        bufp->chgBit(oldp+97,(Vtb_pcie_datalink_layer__ConstPool__TABLE_hb0f749ab_0
                              [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_27]));
        bufp->chgSData(oldp+98,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__m_axis_tid_reg),10);
        bufp->chgCData(oldp+99,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__m_axis_tdest_reg),8);
        bufp->chgIData(oldp+100,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__temp_m_axis_tdata_reg),32);
        bufp->chgCData(oldp+101,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__temp_m_axis_tkeep_reg),4);
        bufp->chgBit(oldp+102,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__temp_m_axis_tvalid_reg));
        bufp->chgBit(oldp+103,(Vtb_pcie_datalink_layer__ConstPool__TABLE_hea75a59c_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_27]));
        bufp->chgBit(oldp+104,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__temp_m_axis_tlast_reg));
        bufp->chgSData(oldp+105,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__temp_m_axis_tid_reg),10);
        bufp->chgCData(oldp+106,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__temp_m_axis_tdest_reg),8);
        bufp->chgCData(oldp+107,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__temp_m_axis_tuser_reg),4);
        bufp->chgBit(oldp+108,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h9068cabe_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_27]));
        bufp->chgBit(oldp+109,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h5ebe4fc2_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_27]));
        bufp->chgBit(oldp+110,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h70871376_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_27]));
        bufp->chgCData(oldp+111,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_next),3);
        bufp->chgBit(oldp+112,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_valid_next));
        bufp->chgCData(oldp+113,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_encoded_next),2);
        bufp->chgBit(oldp+114,((1U & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_inst__DOT__stage_valid[1U])));
        bufp->chgCData(oldp+115,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__request_index),2);
        bufp->chgCData(oldp+116,((7U & ((IData)(1U) 
                                        << (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__request_index)))),3);
        bufp->chgCData(oldp+117,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__mask_reg),3);
        bufp->chgBit(oldp+118,((1U & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__stage_valid[1U])));
        bufp->chgCData(oldp+119,(((0U != (3U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__input_unencoded)))
                                   ? (1U & (~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__input_unencoded)))
                                   : (2U | (1U & (~ 
                                                  ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__input_unencoded) 
                                                   >> 2U)))))),2);
        bufp->chgCData(oldp+120,((7U & ((IData)(1U) 
                                        << ((0U != 
                                             (3U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__input_unencoded)))
                                             ? (1U 
                                                & (~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__input_unencoded)))
                                             : (2U 
                                                | (1U 
                                                   & (~ 
                                                      ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__input_unencoded) 
                                                       >> 2U)))))))),3);
        bufp->chgCData(oldp+121,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__request),4);
        bufp->chgCData(oldp+122,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_inst__DOT__stage_valid[1]),2);
        bufp->chgCData(oldp+123,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_inst__DOT__stage_valid[0]),2);
        bufp->chgCData(oldp+124,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_inst__DOT__stage_enc[1]),2);
        bufp->chgCData(oldp+125,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_inst__DOT__stage_enc[0]),2);
        bufp->chgCData(oldp+126,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__input_unencoded),3);
        bufp->chgCData(oldp+127,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__input_unencoded),4);
        bufp->chgCData(oldp+128,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__stage_valid[1]),2);
        bufp->chgCData(oldp+129,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__stage_valid[0]),2);
        bufp->chgCData(oldp+130,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__stage_enc[1]),2);
        bufp->chgCData(oldp+131,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__stage_enc[0]),2);
        bufp->chgBit(oldp+132,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__fc_start_r));
        bufp->chgBit(oldp+133,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__start_ack_r));
        bufp->chgSData(oldp+134,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_transmit_seq_r),16);
        bufp->chgBit(oldp+135,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_nullified_r));
        bufp->chgCData(oldp+136,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__ph_credits_consumed_r),8);
        bufp->chgSData(oldp+137,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pd_credits_consumed_r),12);
        bufp->chgCData(oldp+138,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__nph_credits_consumed_r),8);
        bufp->chgSData(oldp+139,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__npd_credits_consumed_r),12);
        bufp->chgIData(oldp+140,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__m_axis_tdata_reg),32);
        bufp->chgCData(oldp+141,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__m_axis_tkeep_reg),4);
        bufp->chgBit(oldp+142,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__m_axis_tvalid_reg));
        bufp->chgBit(oldp+143,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__m_axis_tlast_reg));
        bufp->chgCData(oldp+144,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__m_axis_tuser_reg),4);
        bufp->chgBit(oldp+145,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg));
        bufp->chgIData(oldp+146,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__m_axis_tdata_reg),32);
        bufp->chgCData(oldp+147,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__m_axis_tkeep_reg),4);
        bufp->chgBit(oldp+148,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__m_axis_tvalid_reg));
        bufp->chgBit(oldp+149,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__m_axis_tlast_reg));
        bufp->chgCData(oldp+150,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__m_axis_tuser_reg),4);
        bufp->chgBit(oldp+151,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__s_axis_tready_reg));
        bufp->chgIData(oldp+152,((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_pipe_reg[1U])),32);
        bufp->chgCData(oldp+153,((0x0000000fU & (IData)(
                                                        (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_pipe_reg[1U] 
                                                         >> 0x00000020U)))),4);
        bufp->chgBit(oldp+154,((1U & ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_tvalid_pipe_reg) 
                                      >> 1U))));
        bufp->chgBit(oldp+155,((1U & (IData)((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_pipe_reg[1U] 
                                              >> 0x00000024U)))));
        bufp->chgCData(oldp+156,((0x0000000fU & (IData)(
                                                        (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_pipe_reg[1U] 
                                                         >> 0x00000025U)))),4);
        bufp->chgBit(oldp+157,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg));
        Vtb_pcie_datalink_layer___024root__trace_chg_dtype____0(vlSelf, bufp, 158, vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out);
        bufp->chgCData(oldp+240,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__curr_state),3);
        bufp->chgCData(oldp+241,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__next_state),3);
        bufp->chgBit(oldp+242,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__dllp_valid));
        bufp->chgBit(oldp+243,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_valid));
        bufp->chgBit(oldp+244,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__first_tlp_valid_c));
        bufp->chgBit(oldp+245,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__s_axis_tready_reg));
        bufp->chgBit(oldp+246,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__s_axis_tready_reg));
        bufp->chgBit(oldp+247,(Vtb_pcie_datalink_layer__ConstPool__TABLE_hb0f749ab_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_20]));
        bufp->chgBit(oldp+248,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__m_axis_tid_reg));
        bufp->chgBit(oldp+249,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__m_axis_tdest_reg));
        bufp->chgIData(oldp+250,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg),32);
        bufp->chgCData(oldp+251,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg),4);
        bufp->chgBit(oldp+252,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg));
        bufp->chgBit(oldp+253,(Vtb_pcie_datalink_layer__ConstPool__TABLE_hea75a59c_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_20]));
        bufp->chgBit(oldp+254,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg));
        bufp->chgBit(oldp+255,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg));
        bufp->chgBit(oldp+256,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg));
        bufp->chgCData(oldp+257,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg),4);
        bufp->chgBit(oldp+258,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h9068cabe_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_20]));
        bufp->chgBit(oldp+259,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h5ebe4fc2_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_20]));
        bufp->chgBit(oldp+260,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h70871376_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_20]));
        bufp->chgBit(oldp+261,((1U & ((~ ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg) 
                                          | ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__dllp_valid) 
                                             & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__m_axis_tvalid_reg)))) 
                                      | (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__s_axis_tready_reg)))));
        bufp->chgBit(oldp+262,(Vtb_pcie_datalink_layer__ConstPool__TABLE_hb0f749ab_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_19]));
        bufp->chgBit(oldp+263,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__m_axis_tid_reg));
        bufp->chgBit(oldp+264,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__m_axis_tdest_reg));
        bufp->chgIData(oldp+265,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg),32);
        bufp->chgCData(oldp+266,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg),4);
        bufp->chgBit(oldp+267,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg));
        bufp->chgBit(oldp+268,(Vtb_pcie_datalink_layer__ConstPool__TABLE_hea75a59c_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_19]));
        bufp->chgBit(oldp+269,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg));
        bufp->chgBit(oldp+270,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg));
        bufp->chgBit(oldp+271,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg));
        bufp->chgCData(oldp+272,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg),4);
        bufp->chgBit(oldp+273,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h9068cabe_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_19]));
        bufp->chgBit(oldp+274,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h5ebe4fc2_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_19]));
        bufp->chgBit(oldp+275,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h70871376_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_19]));
        bufp->chgBit(oldp+276,((1U & ((~ ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg) 
                                          | ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_valid) 
                                             & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__m_axis_tvalid_reg)))) 
                                      | (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg)))));
        bufp->chgCData(oldp+277,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state),5);
        bufp->chgBit(oldp+278,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__fc_start_c));
        bufp->chgBit(oldp+279,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_nullified_c));
        bufp->chgSData(oldp+280,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_expected_seq_num_c),16);
        bufp->chgSData(oldp+281,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_expected_seq_num_r),16);
        bufp->chgIData(oldp+282,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_from_tlp_c),32);
        bufp->chgIData(oldp+283,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_from_tlp_r),32);
        bufp->chgIData(oldp+284,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r),32);
        bufp->chgIData(oldp+285,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__lcrc32d32),32);
        bufp->chgIData(oldp+286,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp_lcrc_r),32);
        bufp->chgIData(oldp+287,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__word_count_r),32);
        bufp->chgIData(oldp+288,(((- (IData)((IData)(
                                                     ((1U 
                                                       == 
                                                       (7U 
                                                        & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))) 
                                                      & (~ 
                                                         (0U 
                                                          != 
                                                          (3U 
                                                           & ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state) 
                                                              >> 3U)))))))) 
                                  & vlSelfRef.__VdfgRegularize_h6e95ff9d_0_49)),32);
        bufp->chgBit(oldp+289,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_r));
        bufp->chgBit(oldp+290,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_nph_r));
        bufp->chgBit(oldp+291,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_ph_r));
        bufp->chgBit(oldp+292,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_r));
        bufp->chgBit(oldp+293,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_pd_r));
        bufp->chgBit(oldp+294,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_r));
        bufp->chgIData(oldp+295,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tdata_reg),32);
        bufp->chgCData(oldp+296,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tkeep_reg),4);
        bufp->chgBit(oldp+297,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tvalid_reg));
        bufp->chgBit(oldp+298,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tlast_reg));
        bufp->chgCData(oldp+299,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tuser_reg),4);
        bufp->chgIData(oldp+300,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tdata_reg),32);
        bufp->chgCData(oldp+301,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tkeep_reg),4);
        bufp->chgBit(oldp+302,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tvalid_reg));
        bufp->chgBit(oldp+303,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tlast_reg));
        bufp->chgCData(oldp+304,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tuser_reg),4);
        bufp->chgIData(oldp+305,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__m_axis_tdata_reg),32);
        bufp->chgCData(oldp+306,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__m_axis_tkeep_reg),4);
        bufp->chgBit(oldp+307,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__m_axis_tvalid_reg));
        bufp->chgBit(oldp+308,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__m_axis_tlast_reg));
        bufp->chgCData(oldp+309,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__m_axis_tuser_reg),4);
        bufp->chgCData(oldp+310,((0x0000000fU & (((4U 
                                                   & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                                   ? 
                                                  ((- (IData)(
                                                              (1U 
                                                               & (~ 
                                                                  ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state) 
                                                                   >> 1U))))) 
                                                   & (- (IData)(
                                                                (1U 
                                                                 & (~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))))))
                                                   : 
                                                  ((2U 
                                                    & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                                    ? 
                                                   ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tkeep_reg) 
                                                    & (- (IData)((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_48))))
                                                    : 
                                                   (- (IData)((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_91))))) 
                                                 & (- (IData)(
                                                              (1U 
                                                               & (~ 
                                                                  (0U 
                                                                   != 
                                                                   (3U 
                                                                    & ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state) 
                                                                       >> 3U)))))))))),4);
        bufp->chgBit(oldp+311,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_axis_tvalid));
        bufp->chgBit(oldp+312,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_axis_tlast));
        bufp->chgCData(oldp+313,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_axis_tuser),4);
        bufp->chgBit(oldp+314,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_axis_tready));
        bufp->chgCData(oldp+315,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__ph_credits_consumed_c),8);
        bufp->chgSData(oldp+316,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pd_credits_consumed_c),12);
        bufp->chgCData(oldp+317,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__nph_credits_consumed_c),8);
        bufp->chgSData(oldp+318,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__npd_credits_consumed_c),12);
        bufp->chgCData(oldp+319,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__cplh_credits_consumed_c),8);
        bufp->chgCData(oldp+320,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__cplh_credits_consumed_r),8);
        bufp->chgSData(oldp+321,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__cpld_credits_consumed_c),12);
        bufp->chgSData(oldp+322,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__cpld_credits_consumed_r),12);
        bufp->chgBit(oldp+323,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__s_axis_tready_reg));
        bufp->chgBit(oldp+324,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tid_reg));
        bufp->chgBit(oldp+325,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tdest_reg));
        bufp->chgIData(oldp+326,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg),32);
        bufp->chgCData(oldp+327,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg),4);
        bufp->chgBit(oldp+328,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg));
        bufp->chgBit(oldp+329,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg));
        bufp->chgBit(oldp+330,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg));
        bufp->chgBit(oldp+331,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg));
        bufp->chgCData(oldp+332,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg),4);
        bufp->chgBit(oldp+333,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tid_reg));
        bufp->chgBit(oldp+334,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tdest_reg));
        bufp->chgIData(oldp+335,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg),32);
        bufp->chgCData(oldp+336,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg),4);
        bufp->chgBit(oldp+337,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg));
        bufp->chgBit(oldp+338,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg));
        bufp->chgBit(oldp+339,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg));
        bufp->chgBit(oldp+340,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg));
        bufp->chgCData(oldp+341,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg),4);
        bufp->chgBit(oldp+342,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__s_axis_tready_reg));
        bufp->chgBit(oldp+343,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__m_axis_tid_reg));
        bufp->chgBit(oldp+344,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__m_axis_tdest_reg));
        bufp->chgIData(oldp+345,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg),32);
        bufp->chgCData(oldp+346,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg),4);
        bufp->chgBit(oldp+347,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg));
        bufp->chgBit(oldp+348,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg));
        bufp->chgBit(oldp+349,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg));
        bufp->chgBit(oldp+350,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg));
        bufp->chgCData(oldp+351,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg),4);
        bufp->chgCData(oldp+352,(((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__depth_reg) 
                                  << 2U)),3);
        bufp->chgCData(oldp+353,(((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__depth_commit_reg) 
                                  << 2U)),3);
        bufp->chgBit(oldp+354,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__overflow_reg));
        bufp->chgBit(oldp+355,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__bad_frame_reg));
        bufp->chgBit(oldp+356,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__good_frame_reg));
        bufp->chgBit(oldp+357,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__wr_ptr_reg));
        bufp->chgBit(oldp+358,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__wr_ptr_commit_reg));
        bufp->chgBit(oldp+359,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__rd_ptr_reg));
        Vtb_pcie_datalink_layer___024root__trace_chg_dtype____1(vlSelf, bufp, 360, vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__mem);
        Vtb_pcie_datalink_layer___024root__trace_chg_dtype____2(vlSelf, bufp, 362, vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_pipe_reg);
        bufp->chgCData(oldp+366,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_tvalid_pipe_reg),2);
        bufp->chgBit(oldp+367,(((1U & (~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__rd_ptr_reg))) 
                                == (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__wr_ptr_reg))));
        bufp->chgBit(oldp+368,(((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__rd_ptr_reg) 
                                == (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__wr_ptr_commit_reg))));
        bufp->chgBit(oldp+369,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__full_wr));
        bufp->chgBit(oldp+370,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__s_frame_reg));
        bufp->chgBit(oldp+371,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__drop_frame_reg));
        bufp->chgBit(oldp+372,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__mark_frame_reg));
        bufp->chgBit(oldp+373,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__send_frame_reg));
        bufp->chgBit(oldp+374,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__depth_reg));
        bufp->chgBit(oldp+375,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__depth_commit_reg));
        bufp->chgQData(oldp+376,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_pipe_reg[1U]),41);
        bufp->chgIData(oldp+378,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__j),32);
        bufp->chgIData(oldp+379,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__fc_axis_tdata),32);
        bufp->chgCData(oldp+380,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__fc_axis_tkeep),4);
        bufp->chgBit(oldp+381,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__fc_axis_tvalid));
        bufp->chgBit(oldp+382,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__fc_axis_tlast));
        bufp->chgBit(oldp+383,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg));
        bufp->chgCData(oldp+384,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__curr_state),5);
        bufp->chgQData(oldp+385,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dll_packet_r),48);
        bufp->chgSData(oldp+387,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_lcrc_c),16);
        bufp->chgSData(oldp+388,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_lcrc_r),16);
        bufp->chgSData(oldp+389,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__timer_r),16);
        bufp->chgSData(oldp+390,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT__crc[8U]),16);
        bufp->chgSData(oldp+391,((0x0000ffffU & (~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_lcrc_r)))),16);
        bufp->chgBit(oldp+392,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__start_ack_c));
        bufp->chgBit(oldp+393,(Vtb_pcie_datalink_layer__ConstPool__TABLE_hb0f749ab_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_17]));
        bufp->chgBit(oldp+394,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tid_reg));
        bufp->chgBit(oldp+395,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tdest_reg));
        bufp->chgIData(oldp+396,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg),32);
        bufp->chgCData(oldp+397,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg),4);
        bufp->chgBit(oldp+398,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg));
        bufp->chgBit(oldp+399,(Vtb_pcie_datalink_layer__ConstPool__TABLE_hea75a59c_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_17]));
        bufp->chgBit(oldp+400,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg));
        bufp->chgBit(oldp+401,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg));
        bufp->chgBit(oldp+402,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg));
        bufp->chgCData(oldp+403,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg),4);
        bufp->chgBit(oldp+404,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h9068cabe_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_17]));
        bufp->chgBit(oldp+405,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h5ebe4fc2_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_17]));
        bufp->chgBit(oldp+406,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h70871376_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_17]));
        bufp->chgBit(oldp+407,((1U & ((~ ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg) 
                                          | ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__fc_axis_tvalid) 
                                             & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tvalid_reg)))) 
                                      | ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__s_axis_tready) 
                                         >> 2U)))));
        bufp->chgSData(oldp+408,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT__crc[8U]),16);
        bufp->chgSData(oldp+409,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT__crc[8U]),16);
        bufp->chgSData(oldp+410,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT__crc[8U]),16);
        bufp->chgCData(oldp+411,((0x000000ffU & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__fc_axis_tdata)),8);
        bufp->chgSData(oldp+412,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT__crc[8]),16);
        bufp->chgSData(oldp+413,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT__crc[7]),16);
        bufp->chgSData(oldp+414,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT__crc[6]),16);
        bufp->chgSData(oldp+415,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT__crc[5]),16);
        bufp->chgSData(oldp+416,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT__crc[4]),16);
        bufp->chgSData(oldp+417,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT__crc[3]),16);
        bufp->chgSData(oldp+418,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT__crc[2]),16);
        bufp->chgSData(oldp+419,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT__crc[1]),16);
        bufp->chgSData(oldp+420,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT__crc[0]),16);
        bufp->chgCData(oldp+421,((0x000000ffU & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__fc_axis_tdata 
                                                 >> 8U))),8);
        bufp->chgSData(oldp+422,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT__crc[8]),16);
        bufp->chgSData(oldp+423,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT__crc[7]),16);
        bufp->chgSData(oldp+424,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT__crc[6]),16);
        bufp->chgSData(oldp+425,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT__crc[5]),16);
        bufp->chgSData(oldp+426,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT__crc[4]),16);
        bufp->chgSData(oldp+427,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT__crc[3]),16);
        bufp->chgSData(oldp+428,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT__crc[2]),16);
        bufp->chgSData(oldp+429,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT__crc[1]),16);
        bufp->chgSData(oldp+430,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT__crc[0]),16);
        bufp->chgCData(oldp+431,((0x000000ffU & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__fc_axis_tdata 
                                                 >> 0x00000010U))),8);
        bufp->chgSData(oldp+432,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT__crc[8]),16);
        bufp->chgSData(oldp+433,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT__crc[7]),16);
        bufp->chgSData(oldp+434,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT__crc[6]),16);
        bufp->chgSData(oldp+435,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT__crc[5]),16);
        bufp->chgSData(oldp+436,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT__crc[4]),16);
        bufp->chgSData(oldp+437,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT__crc[3]),16);
        bufp->chgSData(oldp+438,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT__crc[2]),16);
        bufp->chgSData(oldp+439,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT__crc[1]),16);
        bufp->chgSData(oldp+440,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT__crc[0]),16);
        bufp->chgCData(oldp+441,((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__fc_axis_tdata 
                                  >> 0x00000018U)),8);
        bufp->chgSData(oldp+442,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT__crc[8]),16);
        bufp->chgSData(oldp+443,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT__crc[7]),16);
        bufp->chgSData(oldp+444,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT__crc[6]),16);
        bufp->chgSData(oldp+445,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT__crc[5]),16);
        bufp->chgSData(oldp+446,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT__crc[4]),16);
        bufp->chgSData(oldp+447,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT__crc[3]),16);
        bufp->chgSData(oldp+448,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT__crc[2]),16);
        bufp->chgSData(oldp+449,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT__crc[1]),16);
        bufp->chgSData(oldp+450,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT__crc[0]),16);
        bufp->chgCData(oldp+451,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__curr_state),3);
        bufp->chgCData(oldp+452,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__next_state),3);
        bufp->chgQData(oldp+453,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__dll_packet_c),48);
        bufp->chgQData(oldp+455,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__dll_packet_r),48);
        bufp->chgSData(oldp+457,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__crc_in_c),16);
        bufp->chgSData(oldp+458,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__crc_in_r),16);
        bufp->chgSData(oldp+459,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_3__DOT__crc[8U]),16);
        bufp->chgSData(oldp+460,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__next_transmit_seq_r),16);
        bufp->chgIData(oldp+461,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tdata_reg),32);
        bufp->chgCData(oldp+462,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tkeep_reg),4);
        bufp->chgBit(oldp+463,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tvalid_reg));
        bufp->chgBit(oldp+464,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tlast_reg));
        bufp->chgCData(oldp+465,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tuser_reg),4);
        bufp->chgBit(oldp+466,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__skid_s_axis_tready));
        bufp->chgCData(oldp+467,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_ph_c),8);
        bufp->chgSData(oldp+468,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_pd_c),12);
        bufp->chgCData(oldp+469,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_nph_c),8);
        bufp->chgSData(oldp+470,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_npd_c),12);
        bufp->chgCData(oldp+471,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_cplh_c),8);
        bufp->chgSData(oldp+472,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_cpld_c),12);
        bufp->chgBit(oldp+473,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__update_fc_c));
        bufp->chgBit(oldp+474,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__fc1_np_stored_c));
        bufp->chgBit(oldp+475,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__fc1_np_stored_r));
        bufp->chgBit(oldp+476,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__fc1_p_stored_c));
        bufp->chgBit(oldp+477,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__fc1_p_stored_r));
        bufp->chgBit(oldp+478,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__fc1_c_stored_c));
        bufp->chgBit(oldp+479,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__fc1_c_stored_r));
        bufp->chgBit(oldp+480,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__fc2_np_stored_c));
        bufp->chgBit(oldp+481,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__fc2_np_stored_r));
        bufp->chgBit(oldp+482,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__fc2_p_stored_c));
        bufp->chgBit(oldp+483,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__fc2_p_stored_r));
        bufp->chgBit(oldp+484,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__fc2_c_stored_c));
        bufp->chgBit(oldp+485,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__fc2_c_stored_r));
        bufp->chgSData(oldp+486,((0x0000ffffU & (~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__crc_in_r)))),16);
        bufp->chgBit(oldp+487,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__first_feature_exchange_dllp_received_c));
        bufp->chgSData(oldp+488,((0x0000ffffU & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tdata_reg)),16);
        bufp->chgBit(oldp+489,(Vtb_pcie_datalink_layer__ConstPool__TABLE_hb0f749ab_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_18]));
        bufp->chgBit(oldp+490,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tid_reg));
        bufp->chgBit(oldp+491,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tdest_reg));
        bufp->chgIData(oldp+492,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg),32);
        bufp->chgCData(oldp+493,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg),4);
        bufp->chgBit(oldp+494,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg));
        bufp->chgBit(oldp+495,(Vtb_pcie_datalink_layer__ConstPool__TABLE_hea75a59c_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_18]));
        bufp->chgBit(oldp+496,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg));
        bufp->chgBit(oldp+497,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg));
        bufp->chgBit(oldp+498,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg));
        bufp->chgCData(oldp+499,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg),4);
        bufp->chgBit(oldp+500,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h9068cabe_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_18]));
        bufp->chgBit(oldp+501,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h5ebe4fc2_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_18]));
        bufp->chgBit(oldp+502,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h70871376_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_18]));
        bufp->chgBit(oldp+503,((1U & ((~ ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg) 
                                          | ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tvalid_reg) 
                                             & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__m_axis_tvalid_reg)))) 
                                      | (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__skid_s_axis_tready)))));
        bufp->chgSData(oldp+504,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_0__DOT__crc[8U]),16);
        bufp->chgSData(oldp+505,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_1__DOT__crc[8U]),16);
        bufp->chgSData(oldp+506,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_2__DOT__crc[8U]),16);
        bufp->chgCData(oldp+507,((0x000000ffU & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tdata_reg)),8);
        bufp->chgSData(oldp+508,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_0__DOT__crc[8]),16);
        bufp->chgSData(oldp+509,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_0__DOT__crc[7]),16);
        bufp->chgSData(oldp+510,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_0__DOT__crc[6]),16);
        bufp->chgSData(oldp+511,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_0__DOT__crc[5]),16);
        bufp->chgSData(oldp+512,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_0__DOT__crc[4]),16);
        bufp->chgSData(oldp+513,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_0__DOT__crc[3]),16);
        bufp->chgSData(oldp+514,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_0__DOT__crc[2]),16);
        bufp->chgSData(oldp+515,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_0__DOT__crc[1]),16);
        bufp->chgSData(oldp+516,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_0__DOT__crc[0]),16);
        bufp->chgCData(oldp+517,((0x000000ffU & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tdata_reg 
                                                 >> 8U))),8);
        bufp->chgSData(oldp+518,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_1__DOT__crc[8]),16);
        bufp->chgSData(oldp+519,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_1__DOT__crc[7]),16);
        bufp->chgSData(oldp+520,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_1__DOT__crc[6]),16);
        bufp->chgSData(oldp+521,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_1__DOT__crc[5]),16);
        bufp->chgSData(oldp+522,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_1__DOT__crc[4]),16);
        bufp->chgSData(oldp+523,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_1__DOT__crc[3]),16);
        bufp->chgSData(oldp+524,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_1__DOT__crc[2]),16);
        bufp->chgSData(oldp+525,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_1__DOT__crc[1]),16);
        bufp->chgSData(oldp+526,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_1__DOT__crc[0]),16);
        bufp->chgCData(oldp+527,((0x000000ffU & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tdata_reg 
                                                 >> 0x00000010U))),8);
        bufp->chgSData(oldp+528,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_2__DOT__crc[8]),16);
        bufp->chgSData(oldp+529,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_2__DOT__crc[7]),16);
        bufp->chgSData(oldp+530,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_2__DOT__crc[6]),16);
        bufp->chgSData(oldp+531,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_2__DOT__crc[5]),16);
        bufp->chgSData(oldp+532,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_2__DOT__crc[4]),16);
        bufp->chgSData(oldp+533,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_2__DOT__crc[3]),16);
        bufp->chgSData(oldp+534,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_2__DOT__crc[2]),16);
        bufp->chgSData(oldp+535,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_2__DOT__crc[1]),16);
        bufp->chgSData(oldp+536,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_2__DOT__crc[0]),16);
        bufp->chgCData(oldp+537,((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tdata_reg 
                                  >> 0x00000018U)),8);
        bufp->chgSData(oldp+538,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_3__DOT__crc[8]),16);
        bufp->chgSData(oldp+539,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_3__DOT__crc[7]),16);
        bufp->chgSData(oldp+540,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_3__DOT__crc[6]),16);
        bufp->chgSData(oldp+541,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_3__DOT__crc[5]),16);
        bufp->chgSData(oldp+542,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_3__DOT__crc[4]),16);
        bufp->chgSData(oldp+543,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_3__DOT__crc[3]),16);
        bufp->chgSData(oldp+544,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_3__DOT__crc[2]),16);
        bufp->chgSData(oldp+545,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_3__DOT__crc[1]),16);
        bufp->chgSData(oldp+546,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_3__DOT__crc[0]),16);
        __Vtemp_1[0U] = vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__tlp_tdata;
        __Vtemp_1[1U] = 0U;
        __Vtemp_1[2U] = 0U;
        __Vtemp_1[3U] = 0U;
        __Vtemp_1[4U] = 0U;
        __Vtemp_1[5U] = 0U;
        __Vtemp_1[6U] = 0U;
        __Vtemp_1[7U] = 0U;
        bufp->chgWData(oldp+547,(__Vtemp_1),256);
        bufp->chgCData(oldp+555,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__tlp_strb),8);
        __Vtemp_2[0U] = ((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__Q[10U] 
                          << 0x0000001cU) | (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__Q[9U] 
                                             >> 4U));
        __Vtemp_2[1U] = ((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__Q[11U] 
                          << 0x0000001cU) | (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__Q[10U] 
                                             >> 4U));
        __Vtemp_2[2U] = ((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__Q[12U] 
                          << 0x0000001cU) | (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__Q[11U] 
                                             >> 4U));
        __Vtemp_2[3U] = ((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__Q[13U] 
                          << 0x0000001cU) | (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__Q[12U] 
                                             >> 4U));
        bufp->chgWData(oldp+556,(__Vtemp_2),128);
        bufp->chgBit(oldp+560,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__tlp_valid));
        bufp->chgBit(oldp+561,((1U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__tlp_sop))));
        bufp->chgBit(oldp+562,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__tlp_eop));
        bufp->chgBit(oldp+563,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__rx_tlp_ready));
        bufp->chgBit(oldp+564,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__s_axil_awready));
        bufp->chgBit(oldp+565,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__s_axil_awvalid));
        bufp->chgIData(oldp+566,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__Q
                                 .__PVT__tlp_hdr[2U]),32);
        bufp->chgBit(oldp+567,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__s_axil_wready));
        bufp->chgBit(oldp+568,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__s_axil_wvalid));
        bufp->chgIData(oldp+569,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__Q
                                 .__PVT__tlp_data[0U]),32);
        bufp->chgBit(oldp+570,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__s_axil_bready));
        bufp->chgBit(oldp+571,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__s_axil_bvalid));
        bufp->chgCData(oldp+572,((2U & (- (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_resp_err
                                                  [
                                                  (1U 
                                                   & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_resp_rptr))])))),2);
        bufp->chgBit(oldp+573,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__s_axil_arready));
        bufp->chgBit(oldp+574,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__s_axil_arvalid));
        bufp->chgBit(oldp+575,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__s_axil_rready));
        bufp->chgBit(oldp+576,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__s_axil_rvalid));
        bufp->chgIData(oldp+577,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_resp_rdata
                                 [(1U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_resp_rptr))]),32);
        bufp->chgIData(oldp+578,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__cfg_fifo_inst__DOT__genblk1__DOT__m_axis_tdata_reg),32);
        bufp->chgCData(oldp+579,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__cfg_fifo_inst__DOT__genblk1__DOT__m_axis_tkeep_reg),4);
        bufp->chgBit(oldp+580,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__cfg_fifo_inst__DOT__genblk1__DOT__m_axis_tvalid_reg));
        bufp->chgBit(oldp+581,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__cfg_fifo_inst__DOT__genblk1__DOT__m_axis_tlast_reg));
        bufp->chgCData(oldp+582,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__cfg_fifo_inst__DOT__genblk1__DOT__m_axis_tuser_reg),4);
        bufp->chgBit(oldp+583,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg));
        bufp->chgWData(oldp+584,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__D),425);
        bufp->chgWData(oldp+598,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__Q),425);
        bufp->chgIData(oldp+612,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__tlp_dw0),32);
        bufp->chgIData(oldp+613,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tdata_reg),32);
        bufp->chgCData(oldp+614,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tkeep_reg),4);
        bufp->chgBit(oldp+615,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tvalid_reg));
        bufp->chgBit(oldp+616,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tlast_reg));
        bufp->chgCData(oldp+617,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tuser_reg),4);
        bufp->chgBit(oldp+618,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__skid_axis_tready));
        bufp->chgIData(oldp+619,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__tlp_byte_swapped),32);
        bufp->chgIData(oldp+620,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__tlp_tdata),32);
        bufp->chgCData(oldp+621,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__tlp_strb),4);
        bufp->chgBit(oldp+622,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__tlp_valid));
        bufp->chgBit(oldp+623,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__tlp_eop));
        bufp->chgCData(oldp+624,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__tlp_sop),4);
        bufp->chgBit(oldp+625,(Vtb_pcie_datalink_layer__ConstPool__TABLE_hb0f749ab_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_12]));
        bufp->chgBit(oldp+626,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tid_reg));
        bufp->chgBit(oldp+627,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tdest_reg));
        bufp->chgIData(oldp+628,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg),32);
        bufp->chgCData(oldp+629,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg),4);
        bufp->chgBit(oldp+630,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg));
        bufp->chgBit(oldp+631,(Vtb_pcie_datalink_layer__ConstPool__TABLE_hea75a59c_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_12]));
        bufp->chgBit(oldp+632,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg));
        bufp->chgBit(oldp+633,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg));
        bufp->chgBit(oldp+634,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg));
        bufp->chgCData(oldp+635,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg),4);
        bufp->chgBit(oldp+636,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h9068cabe_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_12]));
        bufp->chgBit(oldp+637,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h5ebe4fc2_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_12]));
        bufp->chgBit(oldp+638,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h70871376_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_12]));
        bufp->chgBit(oldp+639,((1U & ((~ ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg) 
                                          | ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__cfg_fifo_inst__DOT__genblk1__DOT__m_axis_tvalid_reg) 
                                             & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tvalid_reg)))) 
                                      | (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__skid_axis_tready)))));
        bufp->chgCData(oldp+640,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__D
                                 .__PVT__state),5);
        bufp->chgWData(oldp+641,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__D
                                 .__PVT__tlp_hdr),128);
        bufp->chgIData(oldp+645,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__D
                                 .__PVT__word_count),32);
        bufp->chgWData(oldp+646,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__D
                                 .__PVT__cpl_tlp),128);
        bufp->chgCData(oldp+650,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__D
                                 .__PVT__cfg_bus_number),8);
        bufp->chgCData(oldp+651,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__D
                                 .__PVT__cfg_device_number),5);
        bufp->chgCData(oldp+652,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__D
                                 .__PVT__cfg_function_number),3);
        bufp->chgIData(oldp+653,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__D
                                 .__PVT__tlp_dw0),32);
        bufp->chgBit(oldp+654,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__D
                               .__PVT__tlp_is_3dw));
        bufp->chgBit(oldp+655,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__D
                               .__PVT__tlp_is_sop));
        bufp->chgBit(oldp+656,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__D
                               .__PVT__tlp_is_pd));
        bufp->chgBit(oldp+657,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__D
                               .__PVT__tlp_is_eop));
        bufp->chgWData(oldp+658,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__D
                                 .__PVT__tlp_data),256);
        bufp->chgIData(oldp+666,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__D
                                 .__PVT__length),32);
        bufp->chgCData(oldp+667,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__Q
                                 .__PVT__state),5);
        bufp->chgWData(oldp+668,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__Q
                                 .__PVT__tlp_hdr),128);
        bufp->chgIData(oldp+672,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__Q
                                 .__PVT__word_count),32);
        bufp->chgWData(oldp+673,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__Q
                                 .__PVT__cpl_tlp),128);
        bufp->chgIData(oldp+677,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__Q
                                 .__PVT__tlp_dw0),32);
        bufp->chgBit(oldp+678,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__Q
                               .__PVT__tlp_is_3dw));
        bufp->chgBit(oldp+679,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__Q
                               .__PVT__tlp_is_sop));
        bufp->chgBit(oldp+680,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__Q
                               .__PVT__tlp_is_pd));
        bufp->chgBit(oldp+681,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__Q
                               .__PVT__tlp_is_eop));
        bufp->chgWData(oldp+682,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__Q
                                 .__PVT__tlp_data),256);
        bufp->chgIData(oldp+690,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__Q
                                 .__PVT__length),32);
        bufp->chgIData(oldp+691,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__s_axis_tdata),32);
        bufp->chgCData(oldp+692,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__s_axis_tkeep),4);
        bufp->chgBit(oldp+693,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__s_axis_tvalid));
        bufp->chgBit(oldp+694,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__s_axis_tlast));
        bufp->chgCData(oldp+695,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__s_axis_tuser),4);
        bufp->chgBit(oldp+696,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg));
        bufp->chgBit(oldp+697,(Vtb_pcie_datalink_layer__ConstPool__TABLE_hb0f749ab_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_11]));
        bufp->chgBit(oldp+698,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tid_reg));
        bufp->chgBit(oldp+699,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tdest_reg));
        bufp->chgIData(oldp+700,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg),32);
        bufp->chgCData(oldp+701,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg),4);
        bufp->chgBit(oldp+702,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg));
        bufp->chgBit(oldp+703,(Vtb_pcie_datalink_layer__ConstPool__TABLE_hea75a59c_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_11]));
        bufp->chgBit(oldp+704,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg));
        bufp->chgBit(oldp+705,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg));
        bufp->chgBit(oldp+706,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg));
        bufp->chgCData(oldp+707,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg),4);
        bufp->chgBit(oldp+708,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h9068cabe_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_11]));
        bufp->chgBit(oldp+709,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h5ebe4fc2_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_11]));
        bufp->chgBit(oldp+710,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h70871376_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_11]));
        bufp->chgBit(oldp+711,((1U & ((~ ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg) 
                                          | ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__s_axis_tvalid) 
                                             & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tvalid_reg)))) 
                                      | ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__s_axis_tready) 
                                         >> 1U)))));
        bufp->chgIData(oldp+712,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__tlp_dw0),32);
        bufp->chgWData(oldp+713,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__D),165);
        bufp->chgWData(oldp+719,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__Q),165);
        bufp->chgIData(oldp+725,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tdata_reg),32);
        bufp->chgCData(oldp+726,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tkeep_reg),4);
        bufp->chgBit(oldp+727,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__tlp_axis_tvalid));
        bufp->chgBit(oldp+728,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tlast_reg));
        bufp->chgCData(oldp+729,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tuser_reg),4);
        bufp->chgBit(oldp+730,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__tlp_fifo_inst__DOT__genblk1__DOT__s_axis_tready_reg));
        bufp->chgBit(oldp+731,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__cfg_axis_tvalid));
        bufp->chgBit(oldp+732,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__cfg_fifo_inst__DOT__genblk1__DOT__s_axis_tready_reg));
        bufp->chgBit(oldp+733,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tvalid_reg));
        bufp->chgBit(oldp+734,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__skid_axis_tready));
        bufp->chgIData(oldp+735,(((((0x0000ff00U & 
                                     (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tdata_reg 
                                      << 8U)) | (0x000000ffU 
                                                 & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tdata_reg 
                                                    >> 8U))) 
                                   << 0x00000010U) 
                                  | ((0x0000ff00U & 
                                      (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tdata_reg 
                                       >> 8U)) | (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tdata_reg 
                                                  >> 0x00000018U)))),32);
        bufp->chgBit(oldp+736,(Vtb_pcie_datalink_layer__ConstPool__TABLE_hb0f749ab_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_8]));
        bufp->chgBit(oldp+737,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tid_reg));
        bufp->chgBit(oldp+738,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tdest_reg));
        bufp->chgIData(oldp+739,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg),32);
        bufp->chgCData(oldp+740,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg),4);
        bufp->chgBit(oldp+741,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg));
        bufp->chgBit(oldp+742,(Vtb_pcie_datalink_layer__ConstPool__TABLE_hea75a59c_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_8]));
        bufp->chgBit(oldp+743,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg));
        bufp->chgBit(oldp+744,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg));
        bufp->chgBit(oldp+745,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg));
        bufp->chgCData(oldp+746,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg),4);
        bufp->chgBit(oldp+747,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h9068cabe_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_8]));
        bufp->chgBit(oldp+748,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h5ebe4fc2_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_8]));
        bufp->chgBit(oldp+749,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h70871376_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_8]));
        bufp->chgBit(oldp+750,((1U & ((~ ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg) 
                                          | ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tvalid_reg) 
                                             & ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_tvalid_pipe_reg) 
                                                >> 1U)))) 
                                      | (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__skid_axis_tready)))));
        bufp->chgBit(oldp+751,(Vtb_pcie_datalink_layer__ConstPool__TABLE_hb0f749ab_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_9]));
        bufp->chgBit(oldp+752,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__cfg_fifo_inst__DOT__genblk1__DOT__m_axis_tid_reg));
        bufp->chgBit(oldp+753,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__cfg_fifo_inst__DOT__genblk1__DOT__m_axis_tdest_reg));
        bufp->chgIData(oldp+754,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__cfg_fifo_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg),32);
        bufp->chgCData(oldp+755,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__cfg_fifo_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg),4);
        bufp->chgBit(oldp+756,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__cfg_fifo_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg));
        bufp->chgBit(oldp+757,(Vtb_pcie_datalink_layer__ConstPool__TABLE_hea75a59c_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_9]));
        bufp->chgBit(oldp+758,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__cfg_fifo_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg));
        bufp->chgBit(oldp+759,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__cfg_fifo_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg));
        bufp->chgBit(oldp+760,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__cfg_fifo_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg));
        bufp->chgCData(oldp+761,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__cfg_fifo_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg),4);
        bufp->chgBit(oldp+762,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h9068cabe_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_9]));
        bufp->chgBit(oldp+763,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h5ebe4fc2_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_9]));
        bufp->chgBit(oldp+764,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h70871376_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_9]));
        bufp->chgBit(oldp+765,((1U & ((~ ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__cfg_fifo_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg) 
                                          | ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__cfg_axis_tvalid) 
                                             & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__cfg_fifo_inst__DOT__genblk1__DOT__m_axis_tvalid_reg)))) 
                                      | (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg)))));
        bufp->chgBit(oldp+766,(Vtb_pcie_datalink_layer__ConstPool__TABLE_hb0f749ab_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_10]));
        bufp->chgBit(oldp+767,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__tlp_fifo_inst__DOT__genblk1__DOT__m_axis_tid_reg));
        bufp->chgBit(oldp+768,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__tlp_fifo_inst__DOT__genblk1__DOT__m_axis_tdest_reg));
        bufp->chgIData(oldp+769,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__tlp_fifo_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg),32);
        bufp->chgCData(oldp+770,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__tlp_fifo_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg),4);
        bufp->chgBit(oldp+771,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__tlp_fifo_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg));
        bufp->chgBit(oldp+772,(Vtb_pcie_datalink_layer__ConstPool__TABLE_hea75a59c_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_10]));
        bufp->chgBit(oldp+773,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__tlp_fifo_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg));
        bufp->chgBit(oldp+774,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__tlp_fifo_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg));
        bufp->chgBit(oldp+775,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__tlp_fifo_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg));
        bufp->chgCData(oldp+776,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__tlp_fifo_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg),4);
        bufp->chgBit(oldp+777,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h9068cabe_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_10]));
        bufp->chgBit(oldp+778,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h5ebe4fc2_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_10]));
        bufp->chgBit(oldp+779,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h70871376_0
                               [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_10]));
        bufp->chgBit(oldp+780,((1U & ((~ ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__tlp_fifo_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg) 
                                          | ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__tlp_axis_tvalid) 
                                             & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__tlp_fifo_inst__DOT__genblk1__DOT__m_axis_tvalid_reg)))) 
                                      | (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__m_axis_tlpout_tready)))));
        bufp->chgSData(oldp+781,((0x000001ffU & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__Q
                                  .__PVT__tlp_hdr[2U])),9);
        bufp->chgBit(oldp+782,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__cpuif_req));
        bufp->chgBit(oldp+783,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__cpuif_req_is_wr));
        bufp->chgSData(oldp+784,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__cpuif_addr),9);
        bufp->chgIData(oldp+785,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_wdata),32);
        bufp->chgIData(oldp+786,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__cpuif_wr_biten),32);
        bufp->chgBit(oldp+787,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__cpuif_rd_ack));
        bufp->chgIData(oldp+788,((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__readback_array[0U] 
                                  | (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__readback_array[1U] 
                                     | (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__readback_array[3U] 
                                        | (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__readback_array[4U] 
                                           | (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__readback_array[5U] 
                                              | (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__readback_array[6U] 
                                                 | (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__readback_array[7U] 
                                                    | (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__readback_array[8U] 
                                                       | (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__readback_array[9U] 
                                                          | (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__readback_array[10U] 
                                                             | (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__readback_array[12U] 
                                                                | (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__readback_array[13U] 
                                                                   | (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__readback_array[14U] 
                                                                      | (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__readback_array[15U] 
                                                                         | (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__readback_array[16U] 
                                                                            | (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__readback_array[17U] 
                                                                               | (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__readback_array[18U] 
                                                                                | vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__readback_array[19U])))))))))))))))))),32);
        bufp->chgBit(oldp+789,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__cpuif_wr_ack));
        bufp->chgCData(oldp+790,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_n_in_flight),2);
        bufp->chgBit(oldp+791,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_prev_was_rd));
        bufp->chgBit(oldp+792,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_arvalid));
        bufp->chgSData(oldp+793,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_araddr),9);
        bufp->chgBit(oldp+794,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_ar_accept));
        bufp->chgBit(oldp+795,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_awvalid));
        bufp->chgSData(oldp+796,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_awaddr),9);
        bufp->chgBit(oldp+797,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_wvalid));
        bufp->chgCData(oldp+798,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_wstrb),4);
        bufp->chgBit(oldp+799,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_aw_accept));
        bufp->chgBit(oldp+800,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_resp_acked));
        Vtb_pcie_datalink_layer___024root__trace_chg_dtype____3(vlSelf, bufp, 801, vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_resp_is_wr);
        Vtb_pcie_datalink_layer___024root__trace_chg_dtype____4(vlSelf, bufp, 803, vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_resp_err);
        Vtb_pcie_datalink_layer___024root__trace_chg_dtype____5(vlSelf, bufp, 805, vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_resp_rdata);
        bufp->chgCData(oldp+807,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_resp_wptr),2);
        bufp->chgCData(oldp+808,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_resp_rptr),2);
        bufp->chgBit(oldp+809,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb
                               .__PVT__byte_offset_00));
        bufp->chgBit(oldp+810,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb
                               .__PVT__byte_offset_04));
        bufp->chgBit(oldp+811,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb
                               .__PVT__byte_offset_08));
        bufp->chgBit(oldp+812,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb
                               .__PVT__byte_offset_0C));
        bufp->chgBit(oldp+813,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb
                               .__PVT__base_address_register_0));
        bufp->chgBit(oldp+814,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb
                               .__PVT__base_ddress_register_1));
        bufp->chgBit(oldp+815,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb
                               .__PVT__base_ddress_register_2));
        bufp->chgBit(oldp+816,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb
                               .__PVT__base_ddress_register_3));
        bufp->chgBit(oldp+817,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb
                               .__PVT__base_ddress_register_4));
        bufp->chgBit(oldp+818,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb
                               .__PVT__base_ddress_register_5));
        bufp->chgBit(oldp+819,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb
                               .__PVT__cardbus_cis_pointer));
        bufp->chgBit(oldp+820,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb
                               .__PVT__byte_offset_2C));
        bufp->chgBit(oldp+821,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb
                               .__PVT__capabilities_pointer));
        bufp->chgBit(oldp+822,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb
                               .__PVT__byte_offset_3C));
        bufp->chgBit(oldp+823,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb
                               .__PVT__capabilities_power_mngt_pointer));
        bufp->chgBit(oldp+824,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb
                               .__PVT__power_management_pointer));
        bufp->chgBit(oldp+825,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb
                               .__PVT__capabilities_power_na_pointer));
        bufp->chgBit(oldp+826,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb
                               .__PVT__link_control_3_register));
        bufp->chgBit(oldp+827,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb
                               .__PVT__lane_error_status_register));
        bufp->chgBit(oldp+828,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb
                               .__PVT__lane_eq_ctrl_register));
        bufp->chgBit(oldp+829,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb
                               .__PVT__extended_capabilities));
        bufp->chgBit(oldp+830,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_04
                               .__PVT__bus_master_enable
                               .__PVT__next));
        bufp->chgBit(oldp+831,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_04
                               .__PVT__bus_master_enable
                               .__PVT__load_next));
        bufp->chgBit(oldp+832,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_04
                               .__PVT__special_cycle_enable
                               .__PVT__next));
        bufp->chgBit(oldp+833,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_04
                               .__PVT__special_cycle_enable
                               .__PVT__load_next));
        bufp->chgBit(oldp+834,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_04
                               .__PVT__memory_write_invalidate
                               .__PVT__next));
        bufp->chgBit(oldp+835,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_04
                               .__PVT__memory_write_invalidate
                               .__PVT__load_next));
        bufp->chgBit(oldp+836,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_04
                               .__PVT__vga_palette_snoop
                               .__PVT__next));
        bufp->chgBit(oldp+837,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_04
                               .__PVT__vga_palette_snoop
                               .__PVT__load_next));
        bufp->chgBit(oldp+838,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_04
                               .__PVT__parity_error_response
                               .__PVT__next));
        bufp->chgBit(oldp+839,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_04
                               .__PVT__parity_error_response
                               .__PVT__load_next));
        bufp->chgBit(oldp+840,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_04
                               .__PVT__idsel_step_wait_cycle_control
                               .__PVT__next));
        bufp->chgBit(oldp+841,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_04
                               .__PVT__idsel_step_wait_cycle_control
                               .__PVT__load_next));
        bufp->chgBit(oldp+842,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_04
                               .__PVT__SERR_Enable.__PVT__next));
        bufp->chgBit(oldp+843,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_04
                               .__PVT__SERR_Enable.__PVT__load_next));
        bufp->chgBit(oldp+844,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_04
                               .__PVT__fast_b2b_transactions_enable
                               .__PVT__next));
        bufp->chgBit(oldp+845,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_04
                               .__PVT__fast_b2b_transactions_enable
                               .__PVT__load_next));
        bufp->chgBit(oldp+846,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_04
                               .__PVT__interrupt_disable
                               .__PVT__next));
        bufp->chgBit(oldp+847,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_04
                               .__PVT__interrupt_disable
                               .__PVT__load_next));
        bufp->chgCData(oldp+848,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                                 .__PVT__byte_offset_04
                                 .__PVT__rsvd.__PVT__next),8);
        bufp->chgBit(oldp+849,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_04
                               .__PVT__rsvd.__PVT__load_next));
        bufp->chgBit(oldp+850,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_04
                               .__PVT__interrupt_status
                               .__PVT__next));
        bufp->chgBit(oldp+851,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_04
                               .__PVT__interrupt_status
                               .__PVT__load_next));
        bufp->chgBit(oldp+852,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_04
                               .__PVT__capabilities_list
                               .__PVT__next));
        bufp->chgBit(oldp+853,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_04
                               .__PVT__capabilities_list
                               .__PVT__load_next));
        bufp->chgBit(oldp+854,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_04
                               .__PVT__sixtysix_mhz_capable
                               .__PVT__next));
        bufp->chgBit(oldp+855,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_04
                               .__PVT__sixtysix_mhz_capable
                               .__PVT__load_next));
        bufp->chgBit(oldp+856,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_04
                               .__PVT__fast_b2b_transactions_capable
                               .__PVT__next));
        bufp->chgBit(oldp+857,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_04
                               .__PVT__fast_b2b_transactions_capable
                               .__PVT__load_next));
        bufp->chgBit(oldp+858,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_04
                               .__PVT__master_data_parity_error
                               .__PVT__next));
        bufp->chgBit(oldp+859,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_04
                               .__PVT__master_data_parity_error
                               .__PVT__load_next));
        bufp->chgCData(oldp+860,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                                 .__PVT__byte_offset_04
                                 .__PVT__devsel_timing
                                 .__PVT__next),2);
        bufp->chgBit(oldp+861,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_04
                               .__PVT__devsel_timing
                               .__PVT__load_next));
        bufp->chgBit(oldp+862,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_04
                               .__PVT__signaled_target_abort
                               .__PVT__next));
        bufp->chgBit(oldp+863,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_04
                               .__PVT__signaled_target_abort
                               .__PVT__load_next));
        bufp->chgBit(oldp+864,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_04
                               .__PVT__received_target_abort
                               .__PVT__next));
        bufp->chgBit(oldp+865,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_04
                               .__PVT__received_target_abort
                               .__PVT__load_next));
        bufp->chgBit(oldp+866,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_04
                               .__PVT__received_master_abort
                               .__PVT__next));
        bufp->chgBit(oldp+867,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_04
                               .__PVT__received_master_abort
                               .__PVT__load_next));
        bufp->chgBit(oldp+868,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_04
                               .__PVT__signaled_system_error
                               .__PVT__next));
        bufp->chgBit(oldp+869,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_04
                               .__PVT__signaled_system_error
                               .__PVT__load_next));
        bufp->chgBit(oldp+870,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_04
                               .__PVT__detected_parity_error
                               .__PVT__next));
        bufp->chgBit(oldp+871,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_04
                               .__PVT__detected_parity_error
                               .__PVT__load_next));
        bufp->chgCData(oldp+872,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                                 .__PVT__byte_offset_0C
                                 .__PVT__cache_line_size_register
                                 .__PVT__next),8);
        bufp->chgBit(oldp+873,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_0C
                               .__PVT__cache_line_size_register
                               .__PVT__load_next));
        bufp->chgCData(oldp+874,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                                 .__PVT__byte_offset_0C
                                 .__PVT__latency_timer_register
                                 .__PVT__next),8);
        bufp->chgBit(oldp+875,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_0C
                               .__PVT__latency_timer_register
                               .__PVT__load_next));
        bufp->chgCData(oldp+876,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                                 .__PVT__byte_offset_0C
                                 .__PVT__interrupt_line_register
                                 .__PVT__next),8);
        bufp->chgBit(oldp+877,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_0C
                               .__PVT__interrupt_line_register
                               .__PVT__load_next));
        bufp->chgCData(oldp+878,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                                 .__PVT__byte_offset_0C
                                 .__PVT__interrupt_pin_register
                                 .__PVT__next),8);
        bufp->chgBit(oldp+879,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_0C
                               .__PVT__interrupt_pin_register
                               .__PVT__load_next));
        bufp->chgIData(oldp+880,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                                 .__PVT__base_ddress_register_2
                                 .__PVT__BAR.__PVT__next),32);
        bufp->chgBit(oldp+881,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__base_ddress_register_2
                               .__PVT__BAR.__PVT__load_next));
        bufp->chgIData(oldp+882,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                                 .__PVT__base_ddress_register_3
                                 .__PVT__BAR.__PVT__next),32);
        bufp->chgBit(oldp+883,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__base_ddress_register_3
                               .__PVT__BAR.__PVT__load_next));
        bufp->chgIData(oldp+884,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                                 .__PVT__base_ddress_register_4
                                 .__PVT__BAR.__PVT__next),32);
        bufp->chgBit(oldp+885,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__base_ddress_register_4
                               .__PVT__BAR.__PVT__load_next));
        bufp->chgIData(oldp+886,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                                 .__PVT__base_ddress_register_5
                                 .__PVT__BAR.__PVT__next),32);
        bufp->chgBit(oldp+887,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__base_ddress_register_5
                               .__PVT__BAR.__PVT__load_next));
        bufp->chgIData(oldp+888,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                                 .__PVT__cardbus_cis_pointer
                                 .__PVT__word.__PVT__next),32);
        bufp->chgBit(oldp+889,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__cardbus_cis_pointer
                               .__PVT__word.__PVT__load_next));
        bufp->chgCData(oldp+890,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                                 .__PVT__byte_offset_3C
                                 .__PVT__interrupt_line
                                 .__PVT__next),8);
        bufp->chgBit(oldp+891,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_3C
                               .__PVT__interrupt_line
                               .__PVT__load_next));
        bufp->chgCData(oldp+892,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                                 .__PVT__byte_offset_3C
                                 .__PVT__interrupt_pin
                                 .__PVT__next),8);
        bufp->chgBit(oldp+893,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__byte_offset_3C
                               .__PVT__interrupt_pin
                               .__PVT__load_next));
        bufp->chgCData(oldp+894,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                                 .__PVT__capabilities_power_mngt_pointer
                                 .__PVT__version.__PVT__next),3);
        bufp->chgBit(oldp+895,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__capabilities_power_mngt_pointer
                               .__PVT__version.__PVT__load_next));
        bufp->chgBit(oldp+896,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__capabilities_power_mngt_pointer
                               .__PVT__pme_clock.__PVT__next));
        bufp->chgBit(oldp+897,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__capabilities_power_mngt_pointer
                               .__PVT__pme_clock.__PVT__load_next));
        bufp->chgBit(oldp+898,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__capabilities_power_mngt_pointer
                               .__PVT__dev_spec_init
                               .__PVT__next));
        bufp->chgBit(oldp+899,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__capabilities_power_mngt_pointer
                               .__PVT__dev_spec_init
                               .__PVT__load_next));
        bufp->chgCData(oldp+900,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                                 .__PVT__capabilities_power_mngt_pointer
                                 .__PVT__aux_current
                                 .__PVT__next),3);
        bufp->chgBit(oldp+901,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__capabilities_power_mngt_pointer
                               .__PVT__aux_current.__PVT__load_next));
        bufp->chgBit(oldp+902,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__capabilities_power_mngt_pointer
                               .__PVT__d1_support.__PVT__next));
        bufp->chgBit(oldp+903,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__capabilities_power_mngt_pointer
                               .__PVT__d1_support.__PVT__load_next));
        bufp->chgBit(oldp+904,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__capabilities_power_mngt_pointer
                               .__PVT__d2_support.__PVT__next));
        bufp->chgBit(oldp+905,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__capabilities_power_mngt_pointer
                               .__PVT__d2_support.__PVT__load_next));
        bufp->chgCData(oldp+906,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                                 .__PVT__capabilities_power_mngt_pointer
                                 .__PVT__pme_support
                                 .__PVT__next),5);
        bufp->chgBit(oldp+907,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__capabilities_power_mngt_pointer
                               .__PVT__pme_support.__PVT__load_next));
        bufp->chgCData(oldp+908,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                                 .__PVT__power_management_pointer
                                 .__PVT__power_state
                                 .__PVT__next),2);
        bufp->chgBit(oldp+909,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__power_management_pointer
                               .__PVT__power_state.__PVT__load_next));
        bufp->chgBit(oldp+910,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__power_management_pointer
                               .__PVT__pme_enable.__PVT__next));
        bufp->chgBit(oldp+911,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__power_management_pointer
                               .__PVT__pme_enable.__PVT__load_next));
        bufp->chgCData(oldp+912,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                                 .__PVT__power_management_pointer
                                 .__PVT__data_select
                                 .__PVT__next),4);
        bufp->chgBit(oldp+913,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__power_management_pointer
                               .__PVT__data_select.__PVT__load_next));
        bufp->chgCData(oldp+914,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                                 .__PVT__power_management_pointer
                                 .__PVT__data_scale
                                 .__PVT__next),2);
        bufp->chgBit(oldp+915,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__power_management_pointer
                               .__PVT__data_scale.__PVT__load_next));
        bufp->chgBit(oldp+916,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__power_management_pointer
                               .__PVT__pme_status.__PVT__next));
        bufp->chgBit(oldp+917,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__power_management_pointer
                               .__PVT__pme_status.__PVT__load_next));
        bufp->chgBit(oldp+918,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__power_management_pointer
                               .__PVT__b2_b3_support
                               .__PVT__next));
        bufp->chgBit(oldp+919,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__power_management_pointer
                               .__PVT__b2_b3_support
                               .__PVT__load_next));
        bufp->chgBit(oldp+920,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__power_management_pointer
                               .__PVT__bus_pwr_clk_ctrl_en
                               .__PVT__next));
        bufp->chgBit(oldp+921,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__power_management_pointer
                               .__PVT__bus_pwr_clk_ctrl_en
                               .__PVT__load_next));
        bufp->chgCData(oldp+922,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                                 .__PVT__power_management_pointer
                                 .__PVT__data.__PVT__next),8);
        bufp->chgBit(oldp+923,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__power_management_pointer
                               .__PVT__data.__PVT__load_next));
        bufp->chgBit(oldp+924,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__link_control_3_register
                               .__PVT__perform_equalization
                               .__PVT__next));
        bufp->chgBit(oldp+925,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__link_control_3_register
                               .__PVT__perform_equalization
                               .__PVT__load_next));
        bufp->chgBit(oldp+926,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__link_control_3_register
                               .__PVT__link_eq_req_intr_en
                               .__PVT__next));
        bufp->chgBit(oldp+927,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__link_control_3_register
                               .__PVT__link_eq_req_intr_en
                               .__PVT__load_next));
        bufp->chgCData(oldp+928,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                                 .__PVT__lane_error_status_register
                                 .__PVT__lane_error
                                 .__PVT__next),5);
        bufp->chgBit(oldp+929,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__lane_error_status_register
                               .__PVT__lane_error.__PVT__load_next));
        bufp->chgCData(oldp+930,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                                 .__PVT__lane_eq_ctrl_register
                                 .__PVT__downstream_tx_preset
                                 .__PVT__next),4);
        bufp->chgBit(oldp+931,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__lane_eq_ctrl_register
                               .__PVT__downstream_tx_preset
                               .__PVT__load_next));
        bufp->chgCData(oldp+932,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                                 .__PVT__lane_eq_ctrl_register
                                 .__PVT__downstream_rx_preset_hint
                                 .__PVT__next),3);
        bufp->chgBit(oldp+933,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__lane_eq_ctrl_register
                               .__PVT__downstream_rx_preset_hint
                               .__PVT__load_next));
        bufp->chgCData(oldp+934,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                                 .__PVT__lane_eq_ctrl_register
                                 .__PVT__upstream_tx_preset
                                 .__PVT__next),4);
        bufp->chgBit(oldp+935,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__lane_eq_ctrl_register
                               .__PVT__upstream_tx_preset
                               .__PVT__load_next));
        bufp->chgCData(oldp+936,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                                 .__PVT__lane_eq_ctrl_register
                                 .__PVT__upstream_rx_preset_hint
                                 .__PVT__next),3);
        bufp->chgBit(oldp+937,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo
                               .__PVT__lane_eq_ctrl_register
                               .__PVT__upstream_rx_preset_hint
                               .__PVT__load_next));
        Vtb_pcie_datalink_layer___024root__trace_chg_dtype____6(vlSelf, bufp, 938, vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage);
        bufp->chgIData(oldp+992,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__readback_array[0]),32);
        bufp->chgIData(oldp+993,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__readback_array[1]),32);
        bufp->chgIData(oldp+994,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__readback_array[2]),32);
        bufp->chgIData(oldp+995,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__readback_array[3]),32);
        bufp->chgIData(oldp+996,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__readback_array[4]),32);
        bufp->chgIData(oldp+997,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__readback_array[5]),32);
        bufp->chgIData(oldp+998,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__readback_array[6]),32);
        bufp->chgIData(oldp+999,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__readback_array[7]),32);
        bufp->chgIData(oldp+1000,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__readback_array[8]),32);
        bufp->chgIData(oldp+1001,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__readback_array[9]),32);
        bufp->chgIData(oldp+1002,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__readback_array[10]),32);
        bufp->chgIData(oldp+1003,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__readback_array[11]),32);
        bufp->chgIData(oldp+1004,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__readback_array[12]),32);
        bufp->chgIData(oldp+1005,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__readback_array[13]),32);
        bufp->chgIData(oldp+1006,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__readback_array[14]),32);
        bufp->chgIData(oldp+1007,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__readback_array[15]),32);
        bufp->chgIData(oldp+1008,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__readback_array[16]),32);
        bufp->chgIData(oldp+1009,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__readback_array[17]),32);
        bufp->chgIData(oldp+1010,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__readback_array[18]),32);
        bufp->chgIData(oldp+1011,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__readback_array[19]),32);
        bufp->chgIData(oldp+1012,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__readback_array[20]),32);
        bufp->chgBit(oldp+1013,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__update_fc_i));
        bufp->chgIData(oldp+1014,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__m_axis_retry_tdata),32);
        bufp->chgCData(oldp+1015,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__m_axis_retry_tkeep),4);
        bufp->chgBit(oldp+1016,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__m_axis_retry_tvalid));
        bufp->chgBit(oldp+1017,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__m_axis_retry_tlast));
        bufp->chgCData(oldp+1018,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__m_axis_retry_tuser),4);
        bufp->chgBit(oldp+1019,((1U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__s_axis_tready))));
        bufp->chgIData(oldp+1020,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_output_register_inst__DOT__genblk1__DOT__m_axis_tdata_reg),32);
        bufp->chgCData(oldp+1021,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_output_register_inst__DOT__genblk1__DOT__m_axis_tkeep_reg),4);
        bufp->chgBit(oldp+1022,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_output_register_inst__DOT__genblk1__DOT__m_axis_tvalid_reg));
        bufp->chgBit(oldp+1023,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_output_register_inst__DOT__genblk1__DOT__m_axis_tlast_reg));
        bufp->chgCData(oldp+1024,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_output_register_inst__DOT__genblk1__DOT__m_axis_tuser_reg),4);
        bufp->chgBit(oldp+1025,((1U & ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__s_axis_tready) 
                                       >> 1U))));
        bufp->chgSData(oldp+1026,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__next_transmit_seq_r),12);
        bufp->chgBit(oldp+1027,((7U != (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__retrys_r))));
        bufp->chgCData(oldp+1028,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__next_retry_index_r),8);
        bufp->chgBit(oldp+1029,((0U != (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__error_r))));
        bufp->chgCData(oldp+1030,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__retry_valid_r),3);
        bufp->chgCData(oldp+1031,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__retry_ack_r),3);
        bufp->chgCData(oldp+1032,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_complete),3);
        bufp->chgQData(oldp+1033,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__s_axis_tdata),64);
        bufp->chgCData(oldp+1035,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__s_axis_tkeep),8);
        bufp->chgCData(oldp+1036,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__s_axis_tvalid),2);
        bufp->chgCData(oldp+1037,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__s_axis_tready),2);
        bufp->chgCData(oldp+1038,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__s_axis_tlast),2);
        bufp->chgCData(oldp+1039,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__s_axis_tuser),8);
        bufp->chgCData(oldp+1040,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__request),2);
        bufp->chgCData(oldp+1041,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__acknowledge),2);
        bufp->chgCData(oldp+1042,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_reg),2);
        bufp->chgBit(oldp+1043,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_valid_reg));
        bufp->chgBit(oldp+1044,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_encoded_reg));
        bufp->chgQData(oldp+1045,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__s_axis_tdata_reg),64);
        bufp->chgCData(oldp+1047,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__s_axis_tkeep_reg),8);
        bufp->chgCData(oldp+1048,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__s_axis_tvalid_reg),2);
        bufp->chgCData(oldp+1049,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__s_axis_tlast_reg),2);
        bufp->chgSData(oldp+1050,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__s_axis_tid_reg),16);
        bufp->chgSData(oldp+1051,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__s_axis_tdest_reg),16);
        bufp->chgCData(oldp+1052,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__s_axis_tuser_reg),8);
        bufp->chgIData(oldp+1053,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__m_axis_tdata_int),32);
        bufp->chgCData(oldp+1054,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__m_axis_tkeep_int),4);
        bufp->chgBit(oldp+1055,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__m_axis_tvalid_int));
        bufp->chgBit(oldp+1056,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__m_axis_tready_int_reg));
        bufp->chgBit(oldp+1057,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__m_axis_tlast_int));
        bufp->chgSData(oldp+1058,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__current_s_tid),9);
        bufp->chgCData(oldp+1059,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__m_axis_tdest_int),8);
        bufp->chgCData(oldp+1060,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__m_axis_tuser_int),4);
        bufp->chgBit(oldp+1061,((1U & ((~ ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__temp_m_axis_tvalid_reg) 
                                           | ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__m_axis_tvalid_reg) 
                                              & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__m_axis_tvalid_int)))) 
                                       | (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__s_axis_tready)))));
        bufp->chgBit(oldp+1062,((1U & ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__s_axis_tvalid_reg) 
                                       >> (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_encoded_reg)))));
        bufp->chgBit(oldp+1063,((1U & ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__s_axis_tready) 
                                       >> (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_encoded_reg)))));
        bufp->chgCData(oldp+1064,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__current_s_tid),8);
        bufp->chgIData(oldp+1065,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__i),32);
        bufp->chgBit(oldp+1066,(Vtb_pcie_datalink_layer__ConstPool__TABLE_hb0f749ab_0
                                [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_24]));
        bufp->chgSData(oldp+1067,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__m_axis_tid_reg),9);
        bufp->chgCData(oldp+1068,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__m_axis_tdest_reg),8);
        bufp->chgIData(oldp+1069,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__temp_m_axis_tdata_reg),32);
        bufp->chgCData(oldp+1070,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__temp_m_axis_tkeep_reg),4);
        bufp->chgBit(oldp+1071,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__temp_m_axis_tvalid_reg));
        bufp->chgBit(oldp+1072,(Vtb_pcie_datalink_layer__ConstPool__TABLE_hea75a59c_0
                                [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_24]));
        bufp->chgBit(oldp+1073,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__temp_m_axis_tlast_reg));
        bufp->chgSData(oldp+1074,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__temp_m_axis_tid_reg),9);
        bufp->chgCData(oldp+1075,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__temp_m_axis_tdest_reg),8);
        bufp->chgCData(oldp+1076,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__temp_m_axis_tuser_reg),4);
        bufp->chgBit(oldp+1077,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h9068cabe_0
                                [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_24]));
        bufp->chgBit(oldp+1078,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h5ebe4fc2_0
                                [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_24]));
        bufp->chgBit(oldp+1079,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h70871376_0
                                [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_24]));
        bufp->chgCData(oldp+1080,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_next),2);
        bufp->chgBit(oldp+1081,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_valid_next));
        bufp->chgBit(oldp+1082,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_encoded_next));
        bufp->chgBit(oldp+1083,((0U != (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__request))));
        bufp->chgBit(oldp+1084,((1U & (~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__request)))));
        bufp->chgCData(oldp+1085,((3U & ((IData)(1U) 
                                         << (1U & (~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__request)))))),2);
        bufp->chgCData(oldp+1086,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__mask_reg),2);
        bufp->chgBit(oldp+1087,((0U != (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__input_unencoded))));
        bufp->chgBit(oldp+1088,((1U & (~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__input_unencoded)))));
        bufp->chgCData(oldp+1089,((3U & ((IData)(1U) 
                                         << (1U & (~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__input_unencoded)))))),2);
        bufp->chgBit(oldp+1090,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_inst__DOT__stage_valid[0]));
        bufp->chgBit(oldp+1091,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_inst__DOT__stage_enc[0]));
        bufp->chgCData(oldp+1092,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__input_unencoded),2);
        bufp->chgBit(oldp+1093,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__stage_valid[0]));
        bufp->chgBit(oldp+1094,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__stage_enc[0]));
        bufp->chgCData(oldp+1095,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__error_c),3);
        bufp->chgCData(oldp+1096,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__error_r),3);
        bufp->chgCData(oldp+1097,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__next_retry_index_c),8);
        bufp->chgCData(oldp+1098,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__retry_valid_c),3);
        bufp->chgBit(oldp+1099,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__free_retry_c));
        bufp->chgBit(oldp+1100,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__free_retry_r));
        bufp->chgCData(oldp+1101,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__retrys_c),3);
        bufp->chgCData(oldp+1102,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__retrys_r),3);
        bufp->chgCData(oldp+1103,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__retry_index_flag),3);
        bufp->chgSData(oldp+1104,(((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__free_retry_c)
                                    ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__seq_num)
                                    : (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__store_seq_r))),12);
        bufp->chgSData(oldp+1105,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__store_seq_r),12);
        bufp->chgQData(oldp+1106,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__ack_seq_mem_c),36);
        bufp->chgQData(oldp+1108,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__ack_seq_mem_r),36);
        bufp->chgCData(oldp+1110,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__0__KET____DOT__curr_state),3);
        bufp->chgCData(oldp+1111,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__0__KET____DOT__next_state),3);
        bufp->chgCData(oldp+1112,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__0__KET____DOT__replay_cnt_c),2);
        bufp->chgCData(oldp+1113,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__0__KET____DOT__replay_cnt_r),2);
        bufp->chgIData(oldp+1114,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__0__KET____DOT__retry_timer_c),32);
        bufp->chgIData(oldp+1115,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__0__KET____DOT__retry_timer_r),32);
        bufp->chgCData(oldp+1116,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__1__KET____DOT__curr_state),3);
        bufp->chgCData(oldp+1117,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__1__KET____DOT__next_state),3);
        bufp->chgCData(oldp+1118,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__1__KET____DOT__replay_cnt_c),2);
        bufp->chgCData(oldp+1119,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__1__KET____DOT__replay_cnt_r),2);
        bufp->chgIData(oldp+1120,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__1__KET____DOT__retry_timer_c),32);
        bufp->chgIData(oldp+1121,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__1__KET____DOT__retry_timer_r),32);
        bufp->chgCData(oldp+1122,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__2__KET____DOT__curr_state),3);
        bufp->chgCData(oldp+1123,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__2__KET____DOT__next_state),3);
        bufp->chgCData(oldp+1124,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__2__KET____DOT__replay_cnt_c),2);
        bufp->chgCData(oldp+1125,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__2__KET____DOT__replay_cnt_r),2);
        bufp->chgIData(oldp+1126,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__2__KET____DOT__retry_timer_c),32);
        bufp->chgIData(oldp+1127,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__2__KET____DOT__retry_timer_r),32);
        bufp->chgCData(oldp+1128,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__tlp_curr_state),3);
        bufp->chgCData(oldp+1129,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__tlp_next_state),3);
        bufp->chgCData(oldp+1130,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__retry_ack_c),3);
        bufp->chgCData(oldp+1131,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__retry_ready),3);
        bufp->chgCData(oldp+1132,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__mutex_flag),3);
        bufp->chgIData(oldp+1133,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__retry_axis_tdata[0]),32);
        bufp->chgIData(oldp+1134,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__retry_axis_tdata[1]),32);
        bufp->chgIData(oldp+1135,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__retry_axis_tdata[2]),32);
        bufp->chgCData(oldp+1136,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__retry_axis_tkeep[0]),4);
        bufp->chgCData(oldp+1137,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__retry_axis_tkeep[1]),4);
        bufp->chgCData(oldp+1138,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__retry_axis_tkeep[2]),4);
        bufp->chgBit(oldp+1139,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__retry_axis_tvalid[0]));
        bufp->chgBit(oldp+1140,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__retry_axis_tvalid[1]));
        bufp->chgBit(oldp+1141,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__retry_axis_tvalid[2]));
        bufp->chgBit(oldp+1142,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__retry_axis_tlast[0]));
        bufp->chgBit(oldp+1143,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__retry_axis_tlast[1]));
        bufp->chgBit(oldp+1144,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__retry_axis_tlast[2]));
        bufp->chgCData(oldp+1145,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__retry_axis_tuser[0]),4);
        bufp->chgCData(oldp+1146,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__retry_axis_tuser[1]),4);
        bufp->chgCData(oldp+1147,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__retry_axis_tuser[2]),4);
        bufp->chgCData(oldp+1148,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__retry_index_c),8);
        bufp->chgCData(oldp+1149,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__retry_index_r),8);
        bufp->chgBit(oldp+1150,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__0__KET____DOT__axis_retry_fifo_inst__DOT__s_axis_tvalid));
        bufp->chgIData(oldp+1151,(((((0U == (0x0000001fU 
                                             & ((IData)(1U) 
                                                + (0x000000ffU 
                                                   & ((IData)(0x0000002aU) 
                                                      * 
                                                      (0x0000ffffU 
                                                       & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__0__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                          >> 9U)))))))
                                      ? 0U : (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__0__KET____DOT__axis_retry_fifo_inst__DOT__Q
                                              [(((IData)(0x00000020U) 
                                                 + 
                                                 (0x000000ffU 
                                                  & ((IData)(0x0000002aU) 
                                                     * 
                                                     (0x0000ffffU 
                                                      & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__0__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                         >> 9U))))) 
                                                >> 5U)] 
                                              << ((IData)(0x00000020U) 
                                                  - 
                                                  (0x0000001fU 
                                                   & ((IData)(1U) 
                                                      + 
                                                      (0x000000ffU 
                                                       & ((IData)(0x0000002aU) 
                                                          * 
                                                          (0x0000ffffU 
                                                           & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__0__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                              >> 9U))))))))) 
                                    | (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__0__KET____DOT__axis_retry_fifo_inst__DOT__Q
                                       [(((IData)(1U) 
                                          + (0x000000ffU 
                                             & ((IData)(0x0000002aU) 
                                                * (0x0000ffffU 
                                                   & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__0__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                      >> 9U))))) 
                                         >> 5U)] >> 
                                       (0x0000001fU 
                                        & ((IData)(1U) 
                                           + (0x000000ffU 
                                              & ((IData)(0x0000002aU) 
                                                 * 
                                                 (0x0000ffffU 
                                                  & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__0__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                     >> 9U)))))))) 
                                   & (- (IData)((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_59))))),32);
        bufp->chgCData(oldp+1152,((0x0000000fU & ((
                                                   ((0U 
                                                     == 
                                                     (0x0000001fU 
                                                      & ((IData)(0x00000021U) 
                                                         + 
                                                         (0x000000ffU 
                                                          & ((IData)(0x0000002aU) 
                                                             * 
                                                             (0x0000ffffU 
                                                              & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__0__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                                 >> 9U)))))))
                                                     ? 0U
                                                     : 
                                                    (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__0__KET____DOT__axis_retry_fifo_inst__DOT__Q
                                                     [
                                                     (((IData)(0x00000024U) 
                                                       + 
                                                       (0x000000ffU 
                                                        & ((IData)(0x0000002aU) 
                                                           * 
                                                           (0x0000ffffU 
                                                            & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__0__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                               >> 9U))))) 
                                                      >> 5U)] 
                                                     << 
                                                     ((IData)(0x00000020U) 
                                                      - 
                                                      (0x0000001fU 
                                                       & ((IData)(0x00000021U) 
                                                          + 
                                                          (0x000000ffU 
                                                           & ((IData)(0x0000002aU) 
                                                              * 
                                                              (0x0000ffffU 
                                                               & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__0__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                                  >> 9U))))))))) 
                                                   | (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__0__KET____DOT__axis_retry_fifo_inst__DOT__Q
                                                      [
                                                      (((IData)(0x00000021U) 
                                                        + 
                                                        (0x000000ffU 
                                                         & ((IData)(0x0000002aU) 
                                                            * 
                                                            (0x0000ffffU 
                                                             & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__0__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                                >> 9U))))) 
                                                       >> 5U)] 
                                                      >> 
                                                      (0x0000001fU 
                                                       & ((IData)(0x00000021U) 
                                                          + 
                                                          (0x000000ffU 
                                                           & ((IData)(0x0000002aU) 
                                                              * 
                                                              (0x0000ffffU 
                                                               & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__0__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                                  >> 9U)))))))) 
                                                  & (- (IData)((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_59)))))),4);
        bufp->chgBit(oldp+1153,(((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__0__KET____DOT__axis_retry_fifo_inst__DOT__Q
                                  [(((IData)(0x0000002aU) 
                                     + (0x000000ffU 
                                        & ((IData)(0x0000002aU) 
                                           * (0x0000ffffU 
                                              & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__0__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                 >> 9U))))) 
                                    >> 5U)] >> (0x0000001fU 
                                                & ((IData)(0x0000002aU) 
                                                   + 
                                                   (0x000000ffU 
                                                    & ((IData)(0x0000002aU) 
                                                       * 
                                                       (0x0000ffffU 
                                                        & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__0__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                           >> 9U))))))) 
                                 & (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_59))));
        bufp->chgBit(oldp+1154,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT____Vcellout__gen_retry_axis_fifo__BRA__0__KET____DOT__axis_retry_fifo_inst__m_axis_tlast));
        bufp->chgCData(oldp+1155,((0x0000000fU & ((
                                                   ((0U 
                                                     == 
                                                     (0x0000001fU 
                                                      & ((IData)(0x00000026U) 
                                                         + 
                                                         (0x000000ffU 
                                                          & ((IData)(0x0000002aU) 
                                                             * 
                                                             (0x0000ffffU 
                                                              & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__0__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                                 >> 9U)))))))
                                                     ? 0U
                                                     : 
                                                    (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__0__KET____DOT__axis_retry_fifo_inst__DOT__Q
                                                     [
                                                     (((IData)(0x00000029U) 
                                                       + 
                                                       (0x000000ffU 
                                                        & ((IData)(0x0000002aU) 
                                                           * 
                                                           (0x0000ffffU 
                                                            & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__0__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                               >> 9U))))) 
                                                      >> 5U)] 
                                                     << 
                                                     ((IData)(0x00000020U) 
                                                      - 
                                                      (0x0000001fU 
                                                       & ((IData)(0x00000026U) 
                                                          + 
                                                          (0x000000ffU 
                                                           & ((IData)(0x0000002aU) 
                                                              * 
                                                              (0x0000ffffU 
                                                               & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__0__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                                  >> 9U))))))))) 
                                                   | (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__0__KET____DOT__axis_retry_fifo_inst__DOT__Q
                                                      [
                                                      (((IData)(0x00000026U) 
                                                        + 
                                                        (0x000000ffU 
                                                         & ((IData)(0x0000002aU) 
                                                            * 
                                                            (0x0000ffffU 
                                                             & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__0__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                                >> 9U))))) 
                                                       >> 5U)] 
                                                      >> 
                                                      (0x0000001fU 
                                                       & ((IData)(0x00000026U) 
                                                          + 
                                                          (0x000000ffU 
                                                           & ((IData)(0x0000002aU) 
                                                              * 
                                                              (0x0000ffffU 
                                                               & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__0__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                                  >> 9U)))))))) 
                                                  & (- (IData)((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_59)))))),4);
        bufp->chgBit(oldp+1156,((1U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__retry_ready))));
        bufp->chgWData(oldp+1157,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__0__KET____DOT__axis_retry_fifo_inst__DOT__D),201);
        bufp->chgWData(oldp+1164,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__0__KET____DOT__axis_retry_fifo_inst__DOT__Q),201);
        bufp->chgBit(oldp+1171,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__1__KET____DOT__axis_retry_fifo_inst__DOT__s_axis_tvalid));
        bufp->chgIData(oldp+1172,(((((0U == (0x0000001fU 
                                             & ((IData)(1U) 
                                                + (0x000000ffU 
                                                   & ((IData)(0x0000002aU) 
                                                      * 
                                                      (0x0000ffffU 
                                                       & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__1__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                          >> 9U)))))))
                                      ? 0U : (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__1__KET____DOT__axis_retry_fifo_inst__DOT__Q
                                              [(((IData)(0x00000020U) 
                                                 + 
                                                 (0x000000ffU 
                                                  & ((IData)(0x0000002aU) 
                                                     * 
                                                     (0x0000ffffU 
                                                      & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__1__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                         >> 9U))))) 
                                                >> 5U)] 
                                              << ((IData)(0x00000020U) 
                                                  - 
                                                  (0x0000001fU 
                                                   & ((IData)(1U) 
                                                      + 
                                                      (0x000000ffU 
                                                       & ((IData)(0x0000002aU) 
                                                          * 
                                                          (0x0000ffffU 
                                                           & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__1__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                              >> 9U))))))))) 
                                    | (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__1__KET____DOT__axis_retry_fifo_inst__DOT__Q
                                       [(((IData)(1U) 
                                          + (0x000000ffU 
                                             & ((IData)(0x0000002aU) 
                                                * (0x0000ffffU 
                                                   & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__1__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                      >> 9U))))) 
                                         >> 5U)] >> 
                                       (0x0000001fU 
                                        & ((IData)(1U) 
                                           + (0x000000ffU 
                                              & ((IData)(0x0000002aU) 
                                                 * 
                                                 (0x0000ffffU 
                                                  & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__1__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                     >> 9U)))))))) 
                                   & (- (IData)((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_58))))),32);
        bufp->chgCData(oldp+1173,((0x0000000fU & ((
                                                   ((0U 
                                                     == 
                                                     (0x0000001fU 
                                                      & ((IData)(0x00000021U) 
                                                         + 
                                                         (0x000000ffU 
                                                          & ((IData)(0x0000002aU) 
                                                             * 
                                                             (0x0000ffffU 
                                                              & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__1__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                                 >> 9U)))))))
                                                     ? 0U
                                                     : 
                                                    (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__1__KET____DOT__axis_retry_fifo_inst__DOT__Q
                                                     [
                                                     (((IData)(0x00000024U) 
                                                       + 
                                                       (0x000000ffU 
                                                        & ((IData)(0x0000002aU) 
                                                           * 
                                                           (0x0000ffffU 
                                                            & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__1__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                               >> 9U))))) 
                                                      >> 5U)] 
                                                     << 
                                                     ((IData)(0x00000020U) 
                                                      - 
                                                      (0x0000001fU 
                                                       & ((IData)(0x00000021U) 
                                                          + 
                                                          (0x000000ffU 
                                                           & ((IData)(0x0000002aU) 
                                                              * 
                                                              (0x0000ffffU 
                                                               & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__1__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                                  >> 9U))))))))) 
                                                   | (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__1__KET____DOT__axis_retry_fifo_inst__DOT__Q
                                                      [
                                                      (((IData)(0x00000021U) 
                                                        + 
                                                        (0x000000ffU 
                                                         & ((IData)(0x0000002aU) 
                                                            * 
                                                            (0x0000ffffU 
                                                             & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__1__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                                >> 9U))))) 
                                                       >> 5U)] 
                                                      >> 
                                                      (0x0000001fU 
                                                       & ((IData)(0x00000021U) 
                                                          + 
                                                          (0x000000ffU 
                                                           & ((IData)(0x0000002aU) 
                                                              * 
                                                              (0x0000ffffU 
                                                               & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__1__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                                  >> 9U)))))))) 
                                                  & (- (IData)((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_58)))))),4);
        bufp->chgBit(oldp+1174,(((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__1__KET____DOT__axis_retry_fifo_inst__DOT__Q
                                  [(((IData)(0x0000002aU) 
                                     + (0x000000ffU 
                                        & ((IData)(0x0000002aU) 
                                           * (0x0000ffffU 
                                              & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__1__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                 >> 9U))))) 
                                    >> 5U)] >> (0x0000001fU 
                                                & ((IData)(0x0000002aU) 
                                                   + 
                                                   (0x000000ffU 
                                                    & ((IData)(0x0000002aU) 
                                                       * 
                                                       (0x0000ffffU 
                                                        & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__1__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                           >> 9U))))))) 
                                 & (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_58))));
        bufp->chgBit(oldp+1175,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT____Vcellout__gen_retry_axis_fifo__BRA__1__KET____DOT__axis_retry_fifo_inst__m_axis_tlast));
        bufp->chgCData(oldp+1176,((0x0000000fU & ((
                                                   ((0U 
                                                     == 
                                                     (0x0000001fU 
                                                      & ((IData)(0x00000026U) 
                                                         + 
                                                         (0x000000ffU 
                                                          & ((IData)(0x0000002aU) 
                                                             * 
                                                             (0x0000ffffU 
                                                              & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__1__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                                 >> 9U)))))))
                                                     ? 0U
                                                     : 
                                                    (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__1__KET____DOT__axis_retry_fifo_inst__DOT__Q
                                                     [
                                                     (((IData)(0x00000029U) 
                                                       + 
                                                       (0x000000ffU 
                                                        & ((IData)(0x0000002aU) 
                                                           * 
                                                           (0x0000ffffU 
                                                            & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__1__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                               >> 9U))))) 
                                                      >> 5U)] 
                                                     << 
                                                     ((IData)(0x00000020U) 
                                                      - 
                                                      (0x0000001fU 
                                                       & ((IData)(0x00000026U) 
                                                          + 
                                                          (0x000000ffU 
                                                           & ((IData)(0x0000002aU) 
                                                              * 
                                                              (0x0000ffffU 
                                                               & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__1__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                                  >> 9U))))))))) 
                                                   | (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__1__KET____DOT__axis_retry_fifo_inst__DOT__Q
                                                      [
                                                      (((IData)(0x00000026U) 
                                                        + 
                                                        (0x000000ffU 
                                                         & ((IData)(0x0000002aU) 
                                                            * 
                                                            (0x0000ffffU 
                                                             & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__1__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                                >> 9U))))) 
                                                       >> 5U)] 
                                                      >> 
                                                      (0x0000001fU 
                                                       & ((IData)(0x00000026U) 
                                                          + 
                                                          (0x000000ffU 
                                                           & ((IData)(0x0000002aU) 
                                                              * 
                                                              (0x0000ffffU 
                                                               & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__1__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                                  >> 9U)))))))) 
                                                  & (- (IData)((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_58)))))),4);
        bufp->chgBit(oldp+1177,((1U & ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__retry_ready) 
                                       >> 1U))));
        bufp->chgWData(oldp+1178,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__1__KET____DOT__axis_retry_fifo_inst__DOT__D),201);
        bufp->chgWData(oldp+1185,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__1__KET____DOT__axis_retry_fifo_inst__DOT__Q),201);
        bufp->chgBit(oldp+1192,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__2__KET____DOT__axis_retry_fifo_inst__DOT__s_axis_tvalid));
        bufp->chgIData(oldp+1193,(((((0U == (0x0000001fU 
                                             & ((IData)(1U) 
                                                + (0x000000ffU 
                                                   & ((IData)(0x0000002aU) 
                                                      * 
                                                      (0x0000ffffU 
                                                       & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__2__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                          >> 9U)))))))
                                      ? 0U : (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__2__KET____DOT__axis_retry_fifo_inst__DOT__Q
                                              [(((IData)(0x00000020U) 
                                                 + 
                                                 (0x000000ffU 
                                                  & ((IData)(0x0000002aU) 
                                                     * 
                                                     (0x0000ffffU 
                                                      & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__2__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                         >> 9U))))) 
                                                >> 5U)] 
                                              << ((IData)(0x00000020U) 
                                                  - 
                                                  (0x0000001fU 
                                                   & ((IData)(1U) 
                                                      + 
                                                      (0x000000ffU 
                                                       & ((IData)(0x0000002aU) 
                                                          * 
                                                          (0x0000ffffU 
                                                           & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__2__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                              >> 9U))))))))) 
                                    | (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__2__KET____DOT__axis_retry_fifo_inst__DOT__Q
                                       [(((IData)(1U) 
                                          + (0x000000ffU 
                                             & ((IData)(0x0000002aU) 
                                                * (0x0000ffffU 
                                                   & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__2__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                      >> 9U))))) 
                                         >> 5U)] >> 
                                       (0x0000001fU 
                                        & ((IData)(1U) 
                                           + (0x000000ffU 
                                              & ((IData)(0x0000002aU) 
                                                 * 
                                                 (0x0000ffffU 
                                                  & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__2__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                     >> 9U)))))))) 
                                   & (- (IData)((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_57))))),32);
        bufp->chgCData(oldp+1194,((0x0000000fU & ((
                                                   ((0U 
                                                     == 
                                                     (0x0000001fU 
                                                      & ((IData)(0x00000021U) 
                                                         + 
                                                         (0x000000ffU 
                                                          & ((IData)(0x0000002aU) 
                                                             * 
                                                             (0x0000ffffU 
                                                              & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__2__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                                 >> 9U)))))))
                                                     ? 0U
                                                     : 
                                                    (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__2__KET____DOT__axis_retry_fifo_inst__DOT__Q
                                                     [
                                                     (((IData)(0x00000024U) 
                                                       + 
                                                       (0x000000ffU 
                                                        & ((IData)(0x0000002aU) 
                                                           * 
                                                           (0x0000ffffU 
                                                            & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__2__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                               >> 9U))))) 
                                                      >> 5U)] 
                                                     << 
                                                     ((IData)(0x00000020U) 
                                                      - 
                                                      (0x0000001fU 
                                                       & ((IData)(0x00000021U) 
                                                          + 
                                                          (0x000000ffU 
                                                           & ((IData)(0x0000002aU) 
                                                              * 
                                                              (0x0000ffffU 
                                                               & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__2__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                                  >> 9U))))))))) 
                                                   | (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__2__KET____DOT__axis_retry_fifo_inst__DOT__Q
                                                      [
                                                      (((IData)(0x00000021U) 
                                                        + 
                                                        (0x000000ffU 
                                                         & ((IData)(0x0000002aU) 
                                                            * 
                                                            (0x0000ffffU 
                                                             & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__2__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                                >> 9U))))) 
                                                       >> 5U)] 
                                                      >> 
                                                      (0x0000001fU 
                                                       & ((IData)(0x00000021U) 
                                                          + 
                                                          (0x000000ffU 
                                                           & ((IData)(0x0000002aU) 
                                                              * 
                                                              (0x0000ffffU 
                                                               & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__2__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                                  >> 9U)))))))) 
                                                  & (- (IData)((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_57)))))),4);
        bufp->chgBit(oldp+1195,(((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__2__KET____DOT__axis_retry_fifo_inst__DOT__Q
                                  [(((IData)(0x0000002aU) 
                                     + (0x000000ffU 
                                        & ((IData)(0x0000002aU) 
                                           * (0x0000ffffU 
                                              & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__2__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                 >> 9U))))) 
                                    >> 5U)] >> (0x0000001fU 
                                                & ((IData)(0x0000002aU) 
                                                   + 
                                                   (0x000000ffU 
                                                    & ((IData)(0x0000002aU) 
                                                       * 
                                                       (0x0000ffffU 
                                                        & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__2__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                           >> 9U))))))) 
                                 & (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_57))));
        bufp->chgBit(oldp+1196,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT____Vcellout__gen_retry_axis_fifo__BRA__2__KET____DOT__axis_retry_fifo_inst__m_axis_tlast));
        bufp->chgCData(oldp+1197,((0x0000000fU & ((
                                                   ((0U 
                                                     == 
                                                     (0x0000001fU 
                                                      & ((IData)(0x00000026U) 
                                                         + 
                                                         (0x000000ffU 
                                                          & ((IData)(0x0000002aU) 
                                                             * 
                                                             (0x0000ffffU 
                                                              & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__2__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                                 >> 9U)))))))
                                                     ? 0U
                                                     : 
                                                    (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__2__KET____DOT__axis_retry_fifo_inst__DOT__Q
                                                     [
                                                     (((IData)(0x00000029U) 
                                                       + 
                                                       (0x000000ffU 
                                                        & ((IData)(0x0000002aU) 
                                                           * 
                                                           (0x0000ffffU 
                                                            & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__2__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                               >> 9U))))) 
                                                      >> 5U)] 
                                                     << 
                                                     ((IData)(0x00000020U) 
                                                      - 
                                                      (0x0000001fU 
                                                       & ((IData)(0x00000026U) 
                                                          + 
                                                          (0x000000ffU 
                                                           & ((IData)(0x0000002aU) 
                                                              * 
                                                              (0x0000ffffU 
                                                               & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__2__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                                  >> 9U))))))))) 
                                                   | (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__2__KET____DOT__axis_retry_fifo_inst__DOT__Q
                                                      [
                                                      (((IData)(0x00000026U) 
                                                        + 
                                                        (0x000000ffU 
                                                         & ((IData)(0x0000002aU) 
                                                            * 
                                                            (0x0000ffffU 
                                                             & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__2__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                                >> 9U))))) 
                                                       >> 5U)] 
                                                      >> 
                                                      (0x0000001fU 
                                                       & ((IData)(0x00000026U) 
                                                          + 
                                                          (0x000000ffU 
                                                           & ((IData)(0x0000002aU) 
                                                              * 
                                                              (0x0000ffffU 
                                                               & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__2__KET____DOT__axis_retry_fifo_inst__DOT__Q[5U] 
                                                                  >> 9U)))))))) 
                                                  & (- (IData)((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_57)))))),4);
        bufp->chgBit(oldp+1198,((1U & ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__retry_ready) 
                                       >> 2U))));
        bufp->chgWData(oldp+1199,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__2__KET____DOT__axis_retry_fifo_inst__DOT__D),201);
        bufp->chgWData(oldp+1206,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__2__KET____DOT__axis_retry_fifo_inst__DOT__Q),201);
        bufp->chgSData(oldp+1213,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__next_transmit_seq_r),16);
        bufp->chgCData(oldp+1214,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__curr_state),4);
        bufp->chgCData(oldp+1215,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__next_state),4);
        bufp->chgSData(oldp+1216,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__next_transmit_seq_c),12);
        bufp->chgIData(oldp+1217,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__m_axis_tdata_reg),32);
        bufp->chgCData(oldp+1218,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__m_axis_tkeep_reg),4);
        bufp->chgBit(oldp+1219,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__m_axis_tvalid_reg));
        bufp->chgBit(oldp+1220,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__m_axis_tlast_reg));
        bufp->chgCData(oldp+1221,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__m_axis_tuser_reg),4);
        bufp->chgBit(oldp+1222,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__skid_axis_tready));
        bufp->chgIData(oldp+1223,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_flow_inst__DOT__genblk1__DOT__m_axis_tdata_reg),32);
        bufp->chgCData(oldp+1224,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_flow_inst__DOT__genblk1__DOT__m_axis_tkeep_reg),4);
        bufp->chgBit(oldp+1225,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_flow_inst__DOT__genblk1__DOT__m_axis_tvalid_reg));
        bufp->chgBit(oldp+1226,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_flow_inst__DOT__genblk1__DOT__m_axis_tlast_reg));
        bufp->chgCData(oldp+1227,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_flow_inst__DOT__genblk1__DOT__m_axis_tuser_reg),4);
        bufp->chgIData(oldp+1228,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_axis_tdata),32);
        bufp->chgCData(oldp+1229,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_axis_tkeep),4);
        bufp->chgBit(oldp+1230,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_axis_tvalid));
        bufp->chgBit(oldp+1231,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_axis_tlast));
        bufp->chgBit(oldp+1232,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_output_register_inst__DOT__genblk1__DOT__s_axis_tready_reg));
        bufp->chgIData(oldp+1233,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__crc_tlp_axis_tdata),32);
        bufp->chgIData(oldp+1234,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__crc_in_c),32);
        bufp->chgIData(oldp+1235,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__crc_in_r),32);
        bufp->chgIData(oldp+1236,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__pcie_lcrc32_inst__DOT__crcOut),32);
        bufp->chgIData(oldp+1237,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_crc16_inst__DOT__crcOut),32);
        bufp->chgIData(oldp+1238,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__lcrc32d32),32);
        bufp->chgIData(oldp+1239,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_dw0),32);
        bufp->chgCData(oldp+1240,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__ph_credits_consumed_c),8);
        bufp->chgCData(oldp+1241,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__ph_credits_consumed_r),8);
        bufp->chgSData(oldp+1242,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__pd_credits_consumed_c),12);
        bufp->chgSData(oldp+1243,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__pd_credits_consumed_r),12);
        bufp->chgSData(oldp+1244,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__npd_credits_consumed_c),12);
        bufp->chgSData(oldp+1245,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__npd_credits_consumed_r),12);
        bufp->chgCData(oldp+1246,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__nph_credits_consumed_c),8);
        bufp->chgCData(oldp+1247,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__nph_credits_consumed_r),8);
        bufp->chgSData(oldp+1248,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cpld_credits_consumed_c),12);
        bufp->chgSData(oldp+1249,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cpld_credits_consumed_r),12);
        bufp->chgCData(oldp+1250,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cplh_credits_consumed_c),8);
        bufp->chgCData(oldp+1251,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cplh_credits_consumed_r),8);
        bufp->chgCData(oldp+1252,(((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__update_fc_i)
                                    ? (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_ph_r) 
                                        == (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__ph_credit_limit_r))
                                        ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__ph_credit_limit_r)
                                        : (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_ph_r))
                                    : (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__ph_credit_limit_r))),8);
        bufp->chgCData(oldp+1253,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__ph_credit_limit_r),8);
        bufp->chgSData(oldp+1254,(((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__update_fc_i)
                                    ? (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_pd_r) 
                                        == (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__pd_credit_limit_r))
                                        ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__pd_credit_limit_r)
                                        : (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_pd_r))
                                    : (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__pd_credit_limit_r))),12);
        bufp->chgSData(oldp+1255,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__pd_credit_limit_r),12);
        bufp->chgSData(oldp+1256,(((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__update_fc_i)
                                    ? (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_cpld_r) 
                                        == (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cpld_credit_limit_r))
                                        ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cpld_credit_limit_r)
                                        : (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_cpld_r))
                                    : (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cpld_credit_limit_r))),12);
        bufp->chgSData(oldp+1257,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cpld_credit_limit_r),12);
        bufp->chgCData(oldp+1258,(((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__update_fc_i)
                                    ? (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_nph_r) 
                                        == (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__nph_credit_limit_r))
                                        ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__nph_credit_limit_r)
                                        : (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_nph_r))
                                    : (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__nph_credit_limit_r))),8);
        bufp->chgCData(oldp+1259,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__nph_credit_limit_r),8);
        bufp->chgSData(oldp+1260,(((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__update_fc_i)
                                    ? (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_npd_r) 
                                        == (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__npd_credit_limit_r))
                                        ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__npd_credit_limit_r)
                                        : (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_npd_r))
                                    : (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__npd_credit_limit_r))),12);
        bufp->chgSData(oldp+1261,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__npd_credit_limit_r),12);
        bufp->chgSData(oldp+1262,(((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__update_fc_i)
                                    ? (((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cplh_credit_limit_r) 
                                        == (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_cplh_r))
                                        ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cplh_credit_limit_r)
                                        : (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_cplh_r))
                                    : (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cplh_credit_limit_r))),12);
        bufp->chgSData(oldp+1263,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cplh_credit_limit_r),12);
        bufp->chgBit(oldp+1264,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_flow_inst__DOT__genblk1__DOT__s_axis_tready_reg));
        bufp->chgCData(oldp+1265,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__m_axis_tuser_reg),3);
        bufp->chgCData(oldp+1266,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_flow_inst__DOT__genblk1__DOT__m_axis_tuser_reg),3);
        bufp->chgBit(oldp+1267,(Vtb_pcie_datalink_layer__ConstPool__TABLE_hb0f749ab_0
                                [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_22]));
        bufp->chgBit(oldp+1268,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_flow_inst__DOT__genblk1__DOT__m_axis_tid_reg));
        bufp->chgBit(oldp+1269,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_flow_inst__DOT__genblk1__DOT__m_axis_tdest_reg));
        bufp->chgIData(oldp+1270,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_flow_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg),32);
        bufp->chgCData(oldp+1271,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_flow_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg),4);
        bufp->chgBit(oldp+1272,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_flow_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg));
        bufp->chgBit(oldp+1273,(Vtb_pcie_datalink_layer__ConstPool__TABLE_hea75a59c_0
                                [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_22]));
        bufp->chgBit(oldp+1274,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_flow_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg));
        bufp->chgBit(oldp+1275,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_flow_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg));
        bufp->chgBit(oldp+1276,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_flow_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg));
        bufp->chgCData(oldp+1277,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_flow_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg),3);
        bufp->chgBit(oldp+1278,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h9068cabe_0
                                [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_22]));
        bufp->chgBit(oldp+1279,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h5ebe4fc2_0
                                [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_22]));
        bufp->chgBit(oldp+1280,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h70871376_0
                                [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_22]));
        bufp->chgBit(oldp+1281,((1U & ((~ ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_flow_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg) 
                                           | ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_flow_inst__DOT__genblk1__DOT__m_axis_tvalid_reg) 
                                              & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__m_axis_tvalid_reg)))) 
                                       | (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__skid_axis_tready)))));
        bufp->chgCData(oldp+1282,((7U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__m_axis_tuser_reg))),3);
        bufp->chgBit(oldp+1283,(Vtb_pcie_datalink_layer__ConstPool__TABLE_hb0f749ab_0
                                [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_23]));
        bufp->chgBit(oldp+1284,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__m_axis_tid_reg));
        bufp->chgBit(oldp+1285,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__m_axis_tdest_reg));
        bufp->chgIData(oldp+1286,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg),32);
        bufp->chgCData(oldp+1287,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg),4);
        bufp->chgBit(oldp+1288,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg));
        bufp->chgBit(oldp+1289,(Vtb_pcie_datalink_layer__ConstPool__TABLE_hea75a59c_0
                                [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_23]));
        bufp->chgBit(oldp+1290,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg));
        bufp->chgBit(oldp+1291,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg));
        bufp->chgBit(oldp+1292,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg));
        bufp->chgCData(oldp+1293,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg),3);
        bufp->chgBit(oldp+1294,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h9068cabe_0
                                [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_23]));
        bufp->chgBit(oldp+1295,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h5ebe4fc2_0
                                [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_23]));
        bufp->chgBit(oldp+1296,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h70871376_0
                                [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_23]));
        bufp->chgBit(oldp+1297,((1U & ((~ ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg) 
                                           | ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__m_axis_tvalid_reg) 
                                              & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__m_axis_tvalid_reg)))) 
                                       | (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__skid_axis_tready)))));
        bufp->chgCData(oldp+1298,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_output_register_inst__DOT__genblk1__DOT__m_axis_tuser_reg),3);
        bufp->chgBit(oldp+1299,(Vtb_pcie_datalink_layer__ConstPool__TABLE_hb0f749ab_0
                                [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_21]));
        bufp->chgBit(oldp+1300,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_output_register_inst__DOT__genblk1__DOT__m_axis_tid_reg));
        bufp->chgBit(oldp+1301,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_output_register_inst__DOT__genblk1__DOT__m_axis_tdest_reg));
        bufp->chgIData(oldp+1302,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_output_register_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg),32);
        bufp->chgCData(oldp+1303,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_output_register_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg),4);
        bufp->chgBit(oldp+1304,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_output_register_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg));
        bufp->chgBit(oldp+1305,(Vtb_pcie_datalink_layer__ConstPool__TABLE_hea75a59c_0
                                [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_21]));
        bufp->chgBit(oldp+1306,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_output_register_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg));
        bufp->chgBit(oldp+1307,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_output_register_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg));
        bufp->chgBit(oldp+1308,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_output_register_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg));
        bufp->chgCData(oldp+1309,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_output_register_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg),3);
        bufp->chgBit(oldp+1310,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h9068cabe_0
                                [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_21]));
        bufp->chgBit(oldp+1311,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h5ebe4fc2_0
                                [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_21]));
        bufp->chgBit(oldp+1312,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h70871376_0
                                [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_21]));
        bufp->chgBit(oldp+1313,((1U & ((~ ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_output_register_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg) 
                                           | ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_axis_tvalid) 
                                              & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_output_register_inst__DOT__genblk1__DOT__m_axis_tvalid_reg)))) 
                                       | ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__s_axis_tready) 
                                          >> 1U)))));
        bufp->chgBit(oldp+1314,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk1__DOT__has_nph_credit));
        bufp->chgBit(oldp+1315,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk2__DOT__has_nph_credit));
        bufp->chgBit(oldp+1316,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk2__DOT__has_npd_credit));
        bufp->chgSData(oldp+1317,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk2__DOT__data_credits_required),16);
        bufp->chgBit(oldp+1318,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk3__DOT__has_ph_credit));
        bufp->chgBit(oldp+1319,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk4__DOT__has_ph_credit));
        bufp->chgBit(oldp+1320,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk4__DOT__has_pd_credit));
        bufp->chgSData(oldp+1321,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk4__DOT__data_length),16);
        bufp->chgSData(oldp+1322,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk4__DOT__data_credits_required),16);
        bufp->chgBit(oldp+1323,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk5__DOT__has_cplh_credit));
        bufp->chgBit(oldp+1324,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk6__DOT__has_cplh_credit));
        bufp->chgBit(oldp+1325,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk6__DOT__has_cpld_credit));
        bufp->chgSData(oldp+1326,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk6__DOT__data_length),16);
        bufp->chgSData(oldp+1327,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk6__DOT__data_credits_required),16);
        bufp->chgIData(oldp+1328,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata),32);
        bufp->chgCData(oldp+1329,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tkeep),4);
        bufp->chgBit(oldp+1330,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tvalid));
        bufp->chgBit(oldp+1331,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tlast));
        bufp->chgBit(oldp+1332,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg));
        bufp->chgCData(oldp+1333,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state),5);
        bufp->chgQData(oldp+1334,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dll_packet_r),48);
        bufp->chgSData(oldp+1336,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_lcrc_c),16);
        bufp->chgSData(oldp+1337,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_lcrc_r),16);
        bufp->chgSData(oldp+1338,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r),16);
        bufp->chgSData(oldp+1339,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__fc2_count_r),16);
        bufp->chgSData(oldp+1340,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__idle_count_c),16);
        bufp->chgSData(oldp+1341,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__idle_count_r),16);
        bufp->chgSData(oldp+1342,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT__crc[8U]),16);
        bufp->chgSData(oldp+1343,((0x0000ffffU & (~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_lcrc_r)))),16);
        bufp->chgBit(oldp+1344,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__update_fc_c));
        bufp->chgBit(oldp+1345,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__update_fc_r));
        bufp->chgBit(oldp+1346,(Vtb_pcie_datalink_layer__ConstPool__TABLE_hb0f749ab_0
                                [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_25]));
        bufp->chgBit(oldp+1347,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tid_reg));
        bufp->chgBit(oldp+1348,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tdest_reg));
        bufp->chgIData(oldp+1349,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg),32);
        bufp->chgCData(oldp+1350,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg),4);
        bufp->chgBit(oldp+1351,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg));
        bufp->chgBit(oldp+1352,(Vtb_pcie_datalink_layer__ConstPool__TABLE_hea75a59c_0
                                [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_25]));
        bufp->chgBit(oldp+1353,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg));
        bufp->chgBit(oldp+1354,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg));
        bufp->chgBit(oldp+1355,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg));
        bufp->chgCData(oldp+1356,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg),4);
        bufp->chgBit(oldp+1357,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h9068cabe_0
                                [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_25]));
        bufp->chgBit(oldp+1358,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h5ebe4fc2_0
                                [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_25]));
        bufp->chgBit(oldp+1359,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h70871376_0
                                [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_25]));
        bufp->chgBit(oldp+1360,((1U & ((~ ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg) 
                                           | ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tvalid) 
                                              & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tvalid_reg)))) 
                                       | ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__s_axis_tready) 
                                          >> 1U)))));
        bufp->chgSData(oldp+1361,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT__crc[8U]),16);
        bufp->chgSData(oldp+1362,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT__crc[8U]),16);
        bufp->chgSData(oldp+1363,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT__crc[8U]),16);
        bufp->chgCData(oldp+1364,((0x000000ffU & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata)),8);
        bufp->chgSData(oldp+1365,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT__crc[8]),16);
        bufp->chgSData(oldp+1366,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT__crc[7]),16);
        bufp->chgSData(oldp+1367,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT__crc[6]),16);
        bufp->chgSData(oldp+1368,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT__crc[5]),16);
        bufp->chgSData(oldp+1369,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT__crc[4]),16);
        bufp->chgSData(oldp+1370,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT__crc[3]),16);
        bufp->chgSData(oldp+1371,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT__crc[2]),16);
        bufp->chgSData(oldp+1372,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT__crc[1]),16);
        bufp->chgSData(oldp+1373,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT__crc[0]),16);
        bufp->chgCData(oldp+1374,((0x000000ffU & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata 
                                                  >> 8U))),8);
        bufp->chgSData(oldp+1375,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT__crc[8]),16);
        bufp->chgSData(oldp+1376,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT__crc[7]),16);
        bufp->chgSData(oldp+1377,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT__crc[6]),16);
        bufp->chgSData(oldp+1378,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT__crc[5]),16);
        bufp->chgSData(oldp+1379,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT__crc[4]),16);
        bufp->chgSData(oldp+1380,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT__crc[3]),16);
        bufp->chgSData(oldp+1381,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT__crc[2]),16);
        bufp->chgSData(oldp+1382,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT__crc[1]),16);
        bufp->chgSData(oldp+1383,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT__crc[0]),16);
        bufp->chgCData(oldp+1384,((0x000000ffU & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata 
                                                  >> 0x00000010U))),8);
        bufp->chgSData(oldp+1385,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT__crc[8]),16);
        bufp->chgSData(oldp+1386,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT__crc[7]),16);
        bufp->chgSData(oldp+1387,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT__crc[6]),16);
        bufp->chgSData(oldp+1388,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT__crc[5]),16);
        bufp->chgSData(oldp+1389,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT__crc[4]),16);
        bufp->chgSData(oldp+1390,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT__crc[3]),16);
        bufp->chgSData(oldp+1391,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT__crc[2]),16);
        bufp->chgSData(oldp+1392,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT__crc[1]),16);
        bufp->chgSData(oldp+1393,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT__crc[0]),16);
        bufp->chgCData(oldp+1394,((vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata 
                                   >> 0x00000018U)),8);
        bufp->chgSData(oldp+1395,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT__crc[8]),16);
        bufp->chgSData(oldp+1396,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT__crc[7]),16);
        bufp->chgSData(oldp+1397,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT__crc[6]),16);
        bufp->chgSData(oldp+1398,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT__crc[5]),16);
        bufp->chgSData(oldp+1399,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT__crc[4]),16);
        bufp->chgSData(oldp+1400,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT__crc[3]),16);
        bufp->chgSData(oldp+1401,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT__crc[2]),16);
        bufp->chgSData(oldp+1402,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT__crc[1]),16);
        bufp->chgSData(oldp+1403,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT__crc[0]),16);
        bufp->chgQData(oldp+1404,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__s_axis_tdata),64);
        bufp->chgCData(oldp+1406,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__s_axis_tkeep),8);
        bufp->chgCData(oldp+1407,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__s_axis_tvalid),2);
        bufp->chgCData(oldp+1408,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__s_axis_tready),2);
        bufp->chgCData(oldp+1409,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__s_axis_tlast),2);
        bufp->chgCData(oldp+1410,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__s_axis_tuser),8);
        bufp->chgCData(oldp+1411,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__request),2);
        bufp->chgCData(oldp+1412,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__acknowledge),2);
        bufp->chgCData(oldp+1413,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__grant_reg),2);
        bufp->chgBit(oldp+1414,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__grant_valid_reg));
        bufp->chgBit(oldp+1415,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__grant_encoded_reg));
        bufp->chgQData(oldp+1416,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__s_axis_tdata_reg),64);
        bufp->chgCData(oldp+1418,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__s_axis_tkeep_reg),8);
        bufp->chgCData(oldp+1419,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__s_axis_tvalid_reg),2);
        bufp->chgCData(oldp+1420,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__s_axis_tlast_reg),2);
        bufp->chgSData(oldp+1421,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__s_axis_tid_reg),16);
        bufp->chgSData(oldp+1422,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__s_axis_tdest_reg),16);
        bufp->chgCData(oldp+1423,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__s_axis_tuser_reg),8);
        bufp->chgIData(oldp+1424,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__m_axis_tdata_int),32);
        bufp->chgCData(oldp+1425,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__m_axis_tkeep_int),4);
        bufp->chgBit(oldp+1426,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__m_axis_tvalid_int));
        bufp->chgBit(oldp+1427,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__m_axis_tready_int_reg));
        bufp->chgBit(oldp+1428,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__m_axis_tlast_int));
        bufp->chgSData(oldp+1429,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__current_s_tid),9);
        bufp->chgCData(oldp+1430,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__m_axis_tdest_int),8);
        bufp->chgCData(oldp+1431,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__m_axis_tuser_int),4);
        bufp->chgBit(oldp+1432,((1U & ((~ ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__temp_m_axis_tvalid_reg) 
                                           | ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__m_axis_tvalid_reg) 
                                              & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__m_axis_tvalid_int)))) 
                                       | (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__s_axis_tready_reg)))));
        bufp->chgBit(oldp+1433,((1U & ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__s_axis_tvalid_reg) 
                                       >> (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__grant_encoded_reg)))));
        bufp->chgBit(oldp+1434,((1U & ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__s_axis_tready) 
                                       >> (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__grant_encoded_reg)))));
        bufp->chgCData(oldp+1435,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__current_s_tid),8);
        bufp->chgIData(oldp+1436,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__i),32);
        bufp->chgBit(oldp+1437,(Vtb_pcie_datalink_layer__ConstPool__TABLE_hb0f749ab_0
                                [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_26]));
        bufp->chgSData(oldp+1438,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__m_axis_tid_reg),9);
        bufp->chgCData(oldp+1439,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__m_axis_tdest_reg),8);
        bufp->chgIData(oldp+1440,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__temp_m_axis_tdata_reg),32);
        bufp->chgCData(oldp+1441,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__temp_m_axis_tkeep_reg),4);
        bufp->chgBit(oldp+1442,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__temp_m_axis_tvalid_reg));
        bufp->chgBit(oldp+1443,(Vtb_pcie_datalink_layer__ConstPool__TABLE_hea75a59c_0
                                [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_26]));
        bufp->chgBit(oldp+1444,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__temp_m_axis_tlast_reg));
        bufp->chgSData(oldp+1445,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__temp_m_axis_tid_reg),9);
        bufp->chgCData(oldp+1446,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__temp_m_axis_tdest_reg),8);
        bufp->chgCData(oldp+1447,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__temp_m_axis_tuser_reg),4);
        bufp->chgBit(oldp+1448,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h9068cabe_0
                                [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_26]));
        bufp->chgBit(oldp+1449,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h5ebe4fc2_0
                                [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_26]));
        bufp->chgBit(oldp+1450,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h70871376_0
                                [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_26]));
        bufp->chgCData(oldp+1451,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__grant_next),2);
        bufp->chgBit(oldp+1452,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__grant_valid_next));
        bufp->chgBit(oldp+1453,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__grant_encoded_next));
        bufp->chgBit(oldp+1454,((0U != (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__request))));
        bufp->chgBit(oldp+1455,((1U & (~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__request)))));
        bufp->chgCData(oldp+1456,((3U & ((IData)(1U) 
                                         << (1U & (~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__request)))))),2);
        bufp->chgCData(oldp+1457,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__mask_reg),2);
        bufp->chgBit(oldp+1458,((0U != (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__input_unencoded))));
        bufp->chgBit(oldp+1459,((1U & (~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__input_unencoded)))));
        bufp->chgCData(oldp+1460,((3U & ((IData)(1U) 
                                         << (1U & (~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__input_unencoded)))))),2);
        bufp->chgBit(oldp+1461,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_inst__DOT__stage_valid[0]));
        bufp->chgBit(oldp+1462,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_inst__DOT__stage_enc[0]));
        bufp->chgCData(oldp+1463,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__input_unencoded),2);
        bufp->chgBit(oldp+1464,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__stage_valid[0]));
        bufp->chgBit(oldp+1465,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__stage_enc[0]));
        bufp->chgWData(oldp+1466,(vlSymsp->TOP__pcie_tlp_pkg.gen_cpl__Vstatic__unnamedblk2__DOT__temp_cpl),128);
        bufp->chgWData(oldp+1470,(vlSymsp->TOP__pcie_tlp_pkg.gen_cpld__Vstatic__unnamedblk1__DOT__temp_cpl),128);
    }
    if (VL_UNLIKELY(((vlSelfRef.__Vm_traceActivity[1U] 
                      | vlSelfRef.__Vm_traceActivity[3U])))) {
        bufp->chgCData(oldp+1474,(((0x00000010U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                    ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state)
                                    : ((8U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                        ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state)
                                        : ((4U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                            ? ((2U 
                                                & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                                ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state)
                                                : (
                                                   (1U 
                                                    & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                                    ? 
                                                   ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state) 
                                                    & (- (IData)(
                                                                 (1U 
                                                                  & (~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__start_ack_r))))))
                                                    : 5U))
                                            : ((2U 
                                                & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                                ? (
                                                   (1U 
                                                    & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                                    ? 4U
                                                    : 
                                                   ((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_0)
                                                     ? 
                                                    ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__m_axis_tlast_reg)
                                                      ? 3U
                                                      : (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                                     : (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state)))
                                                : (
                                                   (1U 
                                                    & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                                    ? 
                                                   ((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_0)
                                                     ? 2U
                                                     : (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                                    : 
                                                   ((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_6)
                                                     ? 1U
                                                     : (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state)))))))),5);
        bufp->chgSData(oldp+1475,(((0x00000010U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                    ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_transmit_seq_r)
                                    : ((8U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                        ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_transmit_seq_r)
                                        : ((4U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                            ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_transmit_seq_r)
                                            : ((2U 
                                                & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                                ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_transmit_seq_r)
                                                : (
                                                   (1U 
                                                    & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                                    ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_transmit_seq_r)
                                                    : 
                                                   ((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_6)
                                                     ? 
                                                    ((0x0000ff00U 
                                                      & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tdata_reg 
                                                         << 8U)) 
                                                     | (0x000000ffU 
                                                        & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tdata_reg 
                                                           >> 8U)))
                                                     : (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_transmit_seq_r)))))))),16);
        bufp->chgIData(oldp+1476,(((0x00000010U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                    ? vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r
                                    : ((8U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                        ? vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r
                                        : ((4U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                            ? ((2U 
                                                & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                                ? vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r
                                                : (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r 
                                                   | ((- (IData)(
                                                                 (1U 
                                                                  & (~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))))) 
                                                      | (- (IData)((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__start_ack_r))))))
                                            : ((2U 
                                                & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                                ? (
                                                   (1U 
                                                    & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                                    ? vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r
                                                    : vlSelfRef.__VdfgRegularize_h6e95ff9d_0_62)
                                                : (
                                                   (1U 
                                                    & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                                    ? vlSelfRef.__VdfgRegularize_h6e95ff9d_0_62
                                                    : 
                                                   ((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_6)
                                                     ? vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_crc16_inst__DOT__crcOut
                                                     : vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r))))))),32);
        bufp->chgIData(oldp+1477,(((0x00000010U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                    ? vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__word_count_r
                                    : ((8U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                        ? vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__word_count_r
                                        : ((4U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                            ? vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__word_count_r
                                            : ((2U 
                                                & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                                ? vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__word_count_r
                                                : (
                                                   (1U 
                                                    & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                                    ? 
                                                   ((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_0)
                                                     ? 
                                                    ((0x00000300U 
                                                      & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tdata_reg 
                                                         << 8U)) 
                                                     | (0x000000ffU 
                                                        & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tdata_reg 
                                                           >> 8U)))
                                                     : vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__word_count_r)
                                                    : 
                                                   (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__word_count_r 
                                                    & (- (IData)(
                                                                 (1U 
                                                                  & (~ (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_6)))))))))))),32);
        bufp->chgCData(oldp+1478,((3U & ((- (IData)(
                                                    (1U 
                                                     & (~ 
                                                        ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state) 
                                                         >> 2U))))) 
                                         & ((- (IData)(
                                                       (1U 
                                                        & (~ 
                                                           (0U 
                                                            != 
                                                            (3U 
                                                             & ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state) 
                                                                >> 3U))))))) 
                                            & ((- (IData)(
                                                          (1U 
                                                           & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state)))) 
                                               | ((- (IData)(
                                                             (1U 
                                                              & ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state) 
                                                                 >> 1U)))) 
                                                  | (- (IData)((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_6))))))))),2);
        bufp->chgBit(oldp+1479,(((0x00000010U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                  ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_r)
                                  : ((8U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                      ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_r)
                                      : ((4U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                          ? ((2U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                              ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_r)
                                              : ((1U 
                                                  & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                                  ? 
                                                 ((~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__start_ack_r)) 
                                                  & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_r))
                                                  : (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_r)))
                                          : ((2U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                              ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_r)
                                              : ((1U 
                                                  & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                                  ? 
                                                 ((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_0)
                                                   ? 
                                                  ((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_5)
                                                    ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_r)
                                                    : 
                                                   ((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_13)
                                                     ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_r)
                                                     : 
                                                    ((0x30U 
                                                      == 
                                                      (0xf8U 
                                                       & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tdata_reg 
                                                          >> 0x00000010U)))
                                                      ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_r)
                                                      : 
                                                     ((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_50)
                                                       ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_r)
                                                       : 
                                                      ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_r) 
                                                       | (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_61))))))
                                                   : (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_r))
                                                  : 
                                                 ((~ (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_6)) 
                                                  & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_r)))))))));
        bufp->chgBit(oldp+1480,(((0x00000010U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                  ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_nph_r)
                                  : ((8U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                      ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_nph_r)
                                      : ((4U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                          ? ((2U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                              ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_nph_r)
                                              : ((1U 
                                                  & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                                  ? 
                                                 ((~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__start_ack_r)) 
                                                  & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_nph_r))
                                                  : (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_nph_r)))
                                          : ((2U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                              ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_nph_r)
                                              : ((1U 
                                                  & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                                  ? 
                                                 ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_nph_r) 
                                                  | ((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_5) 
                                                     & (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_0)))
                                                  : 
                                                 ((~ (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_6)) 
                                                  & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_nph_r)))))))));
        bufp->chgBit(oldp+1481,(((0x00000010U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                  ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_ph_r)
                                  : ((8U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                      ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_ph_r)
                                      : ((4U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                          ? ((2U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                              ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_ph_r)
                                              : ((1U 
                                                  & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                                  ? 
                                                 ((~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__start_ack_r)) 
                                                  & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_ph_r))
                                                  : (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_ph_r)))
                                          : ((2U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                              ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_ph_r)
                                              : ((1U 
                                                  & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                                  ? 
                                                 ((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_0)
                                                   ? 
                                                  ((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_5)
                                                    ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_ph_r)
                                                    : 
                                                   ((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_13)
                                                     ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_ph_r)
                                                     : 
                                                    ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_ph_r) 
                                                     | (0x30U 
                                                        == 
                                                        (0xf8U 
                                                         & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tdata_reg 
                                                            >> 0x00000010U))))))
                                                   : (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_ph_r))
                                                  : 
                                                 ((~ (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_6)) 
                                                  & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_ph_r)))))))));
        bufp->chgBit(oldp+1482,(((0x00000010U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                  ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_r)
                                  : ((8U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                      ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_r)
                                      : ((4U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                          ? ((2U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                              ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_r)
                                              : ((1U 
                                                  & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                                  ? 
                                                 ((~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__start_ack_r)) 
                                                  & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_r))
                                                  : (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_r)))
                                          : ((2U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                              ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_r)
                                              : ((1U 
                                                  & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                                  ? 
                                                 ((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_0)
                                                   ? 
                                                  ((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_5)
                                                    ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_r)
                                                    : 
                                                   ((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_13)
                                                     ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_r)
                                                     : 
                                                    ((0x30U 
                                                      == 
                                                      (0xf8U 
                                                       & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tdata_reg 
                                                          >> 0x00000010U)))
                                                      ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_r)
                                                      : 
                                                     ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_r) 
                                                      | (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_50)))))
                                                   : (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_r))
                                                  : 
                                                 ((~ (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_6)) 
                                                  & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_r)))))))));
        bufp->chgBit(oldp+1483,(((0x00000010U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                  ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_pd_r)
                                  : ((8U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                      ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_pd_r)
                                      : ((4U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                          ? ((2U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                              ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_pd_r)
                                              : ((1U 
                                                  & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                                  ? 
                                                 ((~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__start_ack_r)) 
                                                  & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_pd_r))
                                                  : (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_pd_r)))
                                          : ((2U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                              ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_pd_r)
                                              : ((1U 
                                                  & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                                  ? 
                                                 ((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_0)
                                                   ? 
                                                  ((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_5)
                                                    ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_pd_r)
                                                    : 
                                                   ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_pd_r) 
                                                    | (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_13)))
                                                   : (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_pd_r))
                                                  : 
                                                 ((~ (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_6)) 
                                                  & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_pd_r)))))))));
        bufp->chgBit(oldp+1484,(((0x00000010U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                  ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_r)
                                  : ((8U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                      ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_r)
                                      : ((4U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                          ? ((2U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                              ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_r)
                                              : ((1U 
                                                  & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                                  ? 
                                                 ((~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__start_ack_r)) 
                                                  & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_r))
                                                  : (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_r)))
                                          : ((2U & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                              ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_r)
                                              : ((1U 
                                                  & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                                  ? 
                                                 ((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_0)
                                                   ? 
                                                  ((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_5)
                                                    ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_r)
                                                    : 
                                                   ((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_13)
                                                     ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_r)
                                                     : 
                                                    ((0x30U 
                                                      == 
                                                      (0xf8U 
                                                       & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tdata_reg 
                                                          >> 0x00000010U)))
                                                      ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_r)
                                                      : 
                                                     ((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_50)
                                                       ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_r)
                                                       : 
                                                      ((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_61)
                                                        ? (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_r)
                                                        : 
                                                       ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_r) 
                                                        | ((0x4aU 
                                                            == 
                                                            (0x000000ffU 
                                                             & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tdata_reg 
                                                                >> 0x00000010U))) 
                                                           | (0x4bU 
                                                              == 
                                                              (0x000000ffU 
                                                               & (vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tdata_reg 
                                                                  >> 0x00000010U))))))))))
                                                   : (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_r))
                                                  : 
                                                 ((~ (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_6)) 
                                                  & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_r)))))))));
        bufp->chgBit(oldp+1485,((1U & ((~ ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg) 
                                           | ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tvalid_reg) 
                                              & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tvalid_reg)))) 
                                       | (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__skid_axis_tready)))));
        bufp->chgBit(oldp+1486,((1U & ((~ ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg) 
                                           | ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tvalid_reg) 
                                              & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__m_axis_tvalid_reg)))) 
                                       | (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__skid_axis_tready)))));
        bufp->chgBit(oldp+1487,((1U & ((~ ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg) 
                                           | ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__m_axis_tvalid_reg) 
                                              & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tvalid_reg)))) 
                                       | (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__skid_axis_tready)))));
        bufp->chgQData(oldp+1488,((((QData)((IData)(
                                                    ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__mark_frame_reg)
                                                      ? 1U
                                                      : (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_axis_tuser)))) 
                                    << 0x00000025U) 
                                   | (((QData)((IData)(
                                                       ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_axis_tlast) 
                                                        | (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__mark_frame_reg)))) 
                                       << 0x00000024U) 
                                      | (((QData)((IData)(
                                                          (0x0000000fU 
                                                           & (((4U 
                                                                & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                                                ? 
                                                               ((- (IData)(
                                                                           (1U 
                                                                            & (~ 
                                                                               ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state) 
                                                                                >> 1U))))) 
                                                                & (- (IData)(
                                                                             (1U 
                                                                              & (~ (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))))))
                                                                : 
                                                               ((2U 
                                                                 & (IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state))
                                                                 ? 
                                                                ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tkeep_reg) 
                                                                 & (- (IData)((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_48))))
                                                                 : 
                                                                (- (IData)((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_91))))) 
                                                              & (- (IData)(
                                                                           (1U 
                                                                            & (~ 
                                                                               (0U 
                                                                                != 
                                                                                (3U 
                                                                                & ((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state) 
                                                                                >> 3U))))))))))) 
                                          << 0x00000020U) 
                                         | (QData)((IData)(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data)))))),41);
    }
    if (VL_UNLIKELY((vlSelfRef.__Vm_traceActivity[2U]))) {
        bufp->chgBit(oldp+1490,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__init_flow_control_r));
        bufp->chgBit(oldp+1491,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__soft_reset_r));
        bufp->chgCData(oldp+1492,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__link_status_r),2);
        bufp->chgBit(oldp+1493,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__rst));
        bufp->chgCData(oldp+1494,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__curr_state),3);
        bufp->chgBit(oldp+1495,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__init_flow_control_c));
        bufp->chgBit(oldp+1496,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__soft_reset_c));
    }
    if (VL_UNLIKELY((vlSelfRef.__Vm_traceActivity[3U]))) {
        bufp->chgBit(oldp+1497,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__init_ack));
        bufp->chgIData(oldp+1498,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_crc16_inst__DOT__crcOut),32);
        bufp->chgIData(oldp+1499,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__crcOut),32);
        bufp->chgBit(oldp+1500,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__skid_axis_tready));
        bufp->chgIData(oldp+1501,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data),32);
        bufp->chgBit(oldp+1502,(Vtb_pcie_datalink_layer__ConstPool__TABLE_hb0f749ab_0
                                [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_15]));
        bufp->chgBit(oldp+1503,(Vtb_pcie_datalink_layer__ConstPool__TABLE_hea75a59c_0
                                [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_15]));
        bufp->chgBit(oldp+1504,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h9068cabe_0
                                [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_15]));
        bufp->chgBit(oldp+1505,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h5ebe4fc2_0
                                [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_15]));
        bufp->chgBit(oldp+1506,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h70871376_0
                                [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_15]));
        bufp->chgBit(oldp+1507,(Vtb_pcie_datalink_layer__ConstPool__TABLE_hb0f749ab_0
                                [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_16]));
        bufp->chgBit(oldp+1508,(Vtb_pcie_datalink_layer__ConstPool__TABLE_hea75a59c_0
                                [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_16]));
        bufp->chgBit(oldp+1509,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h9068cabe_0
                                [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_16]));
        bufp->chgBit(oldp+1510,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h5ebe4fc2_0
                                [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_16]));
        bufp->chgBit(oldp+1511,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h70871376_0
                                [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_16]));
        bufp->chgBit(oldp+1512,(Vtb_pcie_datalink_layer__ConstPool__TABLE_hb0f749ab_0
                                [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_14]));
        bufp->chgBit(oldp+1513,(Vtb_pcie_datalink_layer__ConstPool__TABLE_hea75a59c_0
                                [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_14]));
        bufp->chgBit(oldp+1514,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h9068cabe_0
                                [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_14]));
        bufp->chgBit(oldp+1515,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h5ebe4fc2_0
                                [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_14]));
        bufp->chgBit(oldp+1516,(Vtb_pcie_datalink_layer__ConstPool__TABLE_h70871376_0
                                [vlSelfRef.__VdfgRegularize_h6e95ff9d_0_14]));
        bufp->chgIData(oldp+1517,((0x0001ffffU & vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data)),32);
        bufp->chgCData(oldp+1518,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__next_state),5);
        bufp->chgSData(oldp+1519,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__timer_c),16);
        bufp->chgCData(oldp+1520,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__next_state),3);
        bufp->chgCData(oldp+1521,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__link_status_c),2);
        bufp->chgCData(oldp+1522,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__next_state),5);
        bufp->chgSData(oldp+1523,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c),16);
        bufp->chgSData(oldp+1524,(vlSelfRef.tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__fc2_count_c),16);
    }
}

void Vtb_pcie_datalink_layer___024root__trace_chg_dtype____0(Vtb_pcie_datalink_layer___024root* vlSelf, VerilatedVcd::Buffer* bufp, uint32_t offset, const Vtb_pcie_datalink_layer_pcie_config_reg___05Fout_t__struct__0& __VdtypeVar) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_pcie_datalink_layer___024root__trace_chg_dtype____0\n"); );
    Vtb_pcie_datalink_layer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode +  offset);
    bufp->chgSData(oldp+0,(__VdtypeVar.__PVT__byte_offset_00
                           .__PVT__Vendor_ID.__PVT__value),16);
    bufp->chgSData(oldp+1,(__VdtypeVar.__PVT__byte_offset_00
                           .__PVT__Device_ID.__PVT__value),16);
    bufp->chgBit(oldp+2,(__VdtypeVar.__PVT__byte_offset_04
                         .__PVT__bus_master_enable.__PVT__value));
    bufp->chgBit(oldp+3,(__VdtypeVar.__PVT__byte_offset_04
                         .__PVT__special_cycle_enable
                         .__PVT__value));
    bufp->chgBit(oldp+4,(__VdtypeVar.__PVT__byte_offset_04
                         .__PVT__memory_write_invalidate
                         .__PVT__value));
    bufp->chgBit(oldp+5,(__VdtypeVar.__PVT__byte_offset_04
                         .__PVT__vga_palette_snoop.__PVT__value));
    bufp->chgBit(oldp+6,(__VdtypeVar.__PVT__byte_offset_04
                         .__PVT__parity_error_response
                         .__PVT__value));
    bufp->chgBit(oldp+7,(__VdtypeVar.__PVT__byte_offset_04
                         .__PVT__idsel_step_wait_cycle_control
                         .__PVT__value));
    bufp->chgBit(oldp+8,(__VdtypeVar.__PVT__byte_offset_04
                         .__PVT__SERR_Enable.__PVT__value));
    bufp->chgBit(oldp+9,(__VdtypeVar.__PVT__byte_offset_04
                         .__PVT__fast_b2b_transactions_enable
                         .__PVT__value));
    bufp->chgBit(oldp+10,(__VdtypeVar.__PVT__byte_offset_04
                          .__PVT__interrupt_disable
                          .__PVT__value));
    bufp->chgCData(oldp+11,(__VdtypeVar.__PVT__byte_offset_04
                            .__PVT__rsvd.__PVT__value),8);
    bufp->chgBit(oldp+12,(__VdtypeVar.__PVT__byte_offset_04
                          .__PVT__interrupt_status.__PVT__value));
    bufp->chgBit(oldp+13,(__VdtypeVar.__PVT__byte_offset_04
                          .__PVT__capabilities_list
                          .__PVT__value));
    bufp->chgBit(oldp+14,(__VdtypeVar.__PVT__byte_offset_04
                          .__PVT__sixtysix_mhz_capable
                          .__PVT__value));
    bufp->chgBit(oldp+15,(__VdtypeVar.__PVT__byte_offset_04
                          .__PVT__fast_b2b_transactions_capable
                          .__PVT__value));
    bufp->chgBit(oldp+16,(__VdtypeVar.__PVT__byte_offset_04
                          .__PVT__master_data_parity_error
                          .__PVT__value));
    bufp->chgCData(oldp+17,(__VdtypeVar.__PVT__byte_offset_04
                            .__PVT__devsel_timing.__PVT__value),2);
    bufp->chgBit(oldp+18,(__VdtypeVar.__PVT__byte_offset_04
                          .__PVT__signaled_target_abort
                          .__PVT__value));
    bufp->chgBit(oldp+19,(__VdtypeVar.__PVT__byte_offset_04
                          .__PVT__received_target_abort
                          .__PVT__value));
    bufp->chgBit(oldp+20,(__VdtypeVar.__PVT__byte_offset_04
                          .__PVT__received_master_abort
                          .__PVT__value));
    bufp->chgBit(oldp+21,(__VdtypeVar.__PVT__byte_offset_04
                          .__PVT__signaled_system_error
                          .__PVT__value));
    bufp->chgBit(oldp+22,(__VdtypeVar.__PVT__byte_offset_04
                          .__PVT__detected_parity_error
                          .__PVT__value));
    bufp->chgCData(oldp+23,(__VdtypeVar.__PVT__byte_offset_08
                            .__PVT__Revision_ID.__PVT__value),8);
    bufp->chgIData(oldp+24,(__VdtypeVar.__PVT__byte_offset_08
                            .__PVT__Class_Code.__PVT__value),24);
    bufp->chgCData(oldp+25,(__VdtypeVar.__PVT__byte_offset_0C
                            .__PVT__cache_line_size_register
                            .__PVT__value),8);
    bufp->chgCData(oldp+26,(__VdtypeVar.__PVT__byte_offset_0C
                            .__PVT__latency_timer_register
                            .__PVT__value),8);
    bufp->chgCData(oldp+27,(__VdtypeVar.__PVT__byte_offset_0C
                            .__PVT__interrupt_line_register
                            .__PVT__value),8);
    bufp->chgCData(oldp+28,(__VdtypeVar.__PVT__byte_offset_0C
                            .__PVT__interrupt_pin_register
                            .__PVT__value),8);
    bufp->chgBit(oldp+29,(__VdtypeVar.__PVT__base_address_register_0
                          .__PVT__region_type.__PVT__value));
    bufp->chgCData(oldp+30,(__VdtypeVar.__PVT__base_address_register_0
                            .__PVT__locatable.__PVT__value),2);
    bufp->chgBit(oldp+31,(__VdtypeVar.__PVT__base_address_register_0
                          .__PVT__prefetchable.__PVT__value));
    bufp->chgIData(oldp+32,(__VdtypeVar.__PVT__base_address_register_0
                            .__PVT__base_adress.__PVT__value),28);
    bufp->chgBit(oldp+33,(__VdtypeVar.__PVT__base_ddress_register_1
                          .__PVT__region_type.__PVT__value));
    bufp->chgCData(oldp+34,(__VdtypeVar.__PVT__base_ddress_register_1
                            .__PVT__locatable.__PVT__value),2);
    bufp->chgBit(oldp+35,(__VdtypeVar.__PVT__base_ddress_register_1
                          .__PVT__prefetchable.__PVT__value));
    bufp->chgIData(oldp+36,(__VdtypeVar.__PVT__base_ddress_register_1
                            .__PVT__base_adress.__PVT__value),28);
    bufp->chgIData(oldp+37,(__VdtypeVar.__PVT__base_ddress_register_2
                            .__PVT__BAR.__PVT__value),32);
    bufp->chgIData(oldp+38,(__VdtypeVar.__PVT__base_ddress_register_3
                            .__PVT__BAR.__PVT__value),32);
    bufp->chgIData(oldp+39,(__VdtypeVar.__PVT__base_ddress_register_4
                            .__PVT__BAR.__PVT__value),32);
    bufp->chgIData(oldp+40,(__VdtypeVar.__PVT__base_ddress_register_5
                            .__PVT__BAR.__PVT__value),32);
    bufp->chgIData(oldp+41,(__VdtypeVar.__PVT__cardbus_cis_pointer
                            .__PVT__word.__PVT__value),32);
    bufp->chgSData(oldp+42,(__VdtypeVar.__PVT__byte_offset_2C
                            .__PVT__Vendor_ID.__PVT__value),16);
    bufp->chgSData(oldp+43,(__VdtypeVar.__PVT__byte_offset_2C
                            .__PVT__Device_ID.__PVT__value),16);
    bufp->chgCData(oldp+44,(__VdtypeVar.__PVT__capabilities_pointer
                            .__PVT__capabilities_ptr
                            .__PVT__value),8);
    bufp->chgCData(oldp+45,(__VdtypeVar.__PVT__byte_offset_3C
                            .__PVT__interrupt_line.__PVT__value),8);
    bufp->chgCData(oldp+46,(__VdtypeVar.__PVT__byte_offset_3C
                            .__PVT__interrupt_pin.__PVT__value),8);
    bufp->chgCData(oldp+47,(__VdtypeVar.__PVT__byte_offset_3C
                            .__PVT__min_gnt.__PVT__value),8);
    bufp->chgCData(oldp+48,(__VdtypeVar.__PVT__byte_offset_3C
                            .__PVT__max_lat.__PVT__value),8);
    bufp->chgCData(oldp+49,(__VdtypeVar.__PVT__capabilities_power_mngt_pointer
                            .__PVT__capabilities_id
                            .__PVT__value),8);
    bufp->chgCData(oldp+50,(__VdtypeVar.__PVT__capabilities_power_mngt_pointer
                            .__PVT__next_cap_ptr.__PVT__value),8);
    bufp->chgCData(oldp+51,(__VdtypeVar.__PVT__capabilities_power_mngt_pointer
                            .__PVT__version.__PVT__value),3);
    bufp->chgBit(oldp+52,(__VdtypeVar.__PVT__capabilities_power_mngt_pointer
                          .__PVT__pme_clock.__PVT__value));
    bufp->chgBit(oldp+53,(__VdtypeVar.__PVT__capabilities_power_mngt_pointer
                          .__PVT__dev_spec_init.__PVT__value));
    bufp->chgCData(oldp+54,(__VdtypeVar.__PVT__capabilities_power_mngt_pointer
                            .__PVT__aux_current.__PVT__value),3);
    bufp->chgBit(oldp+55,(__VdtypeVar.__PVT__capabilities_power_mngt_pointer
                          .__PVT__d1_support.__PVT__value));
    bufp->chgBit(oldp+56,(__VdtypeVar.__PVT__capabilities_power_mngt_pointer
                          .__PVT__d2_support.__PVT__value));
    bufp->chgCData(oldp+57,(__VdtypeVar.__PVT__capabilities_power_mngt_pointer
                            .__PVT__pme_support.__PVT__value),5);
    bufp->chgCData(oldp+58,(__VdtypeVar.__PVT__power_management_pointer
                            .__PVT__power_state.__PVT__value),2);
    bufp->chgBit(oldp+59,(__VdtypeVar.__PVT__power_management_pointer
                          .__PVT__pme_enable.__PVT__value));
    bufp->chgCData(oldp+60,(__VdtypeVar.__PVT__power_management_pointer
                            .__PVT__data_select.__PVT__value),4);
    bufp->chgCData(oldp+61,(__VdtypeVar.__PVT__power_management_pointer
                            .__PVT__data_scale.__PVT__value),2);
    bufp->chgBit(oldp+62,(__VdtypeVar.__PVT__power_management_pointer
                          .__PVT__pme_status.__PVT__value));
    bufp->chgBit(oldp+63,(__VdtypeVar.__PVT__power_management_pointer
                          .__PVT__b2_b3_support.__PVT__value));
    bufp->chgBit(oldp+64,(__VdtypeVar.__PVT__power_management_pointer
                          .__PVT__bus_pwr_clk_ctrl_en
                          .__PVT__value));
    bufp->chgCData(oldp+65,(__VdtypeVar.__PVT__power_management_pointer
                            .__PVT__data.__PVT__value),8);
    bufp->chgCData(oldp+66,(__VdtypeVar.__PVT__capabilities_power_na_pointer
                            .__PVT__capabilities_id
                            .__PVT__value),8);
    bufp->chgCData(oldp+67,(__VdtypeVar.__PVT__capabilities_power_na_pointer
                            .__PVT__next_cap_ptr.__PVT__value),8);
    bufp->chgCData(oldp+68,(__VdtypeVar.__PVT__capabilities_power_na_pointer
                            .__PVT__capability_version
                            .__PVT__value),4);
    bufp->chgCData(oldp+69,(__VdtypeVar.__PVT__capabilities_power_na_pointer
                            .__PVT__device_port_type
                            .__PVT__value),4);
    bufp->chgBit(oldp+70,(__VdtypeVar.__PVT__capabilities_power_na_pointer
                          .__PVT__slot_implemented.__PVT__value));
    bufp->chgCData(oldp+71,(__VdtypeVar.__PVT__capabilities_power_na_pointer
                            .__PVT__interrupt_msg_number
                            .__PVT__value),5);
    bufp->chgBit(oldp+72,(__VdtypeVar.__PVT__capabilities_power_na_pointer
                          .__PVT__Undefined.__PVT__value));
    bufp->chgBit(oldp+73,(__VdtypeVar.__PVT__capabilities_power_na_pointer
                          .__PVT__RsvdP.__PVT__value));
    bufp->chgBit(oldp+74,(__VdtypeVar.__PVT__link_control_3_register
                          .__PVT__perform_equalization
                          .__PVT__value));
    bufp->chgBit(oldp+75,(__VdtypeVar.__PVT__link_control_3_register
                          .__PVT__link_eq_req_intr_en
                          .__PVT__value));
    bufp->chgCData(oldp+76,(__VdtypeVar.__PVT__lane_error_status_register
                            .__PVT__lane_error.__PVT__value),5);
    bufp->chgCData(oldp+77,(__VdtypeVar.__PVT__lane_eq_ctrl_register
                            .__PVT__downstream_tx_preset
                            .__PVT__value),4);
    bufp->chgCData(oldp+78,(__VdtypeVar.__PVT__lane_eq_ctrl_register
                            .__PVT__downstream_rx_preset_hint
                            .__PVT__value),3);
    bufp->chgCData(oldp+79,(__VdtypeVar.__PVT__lane_eq_ctrl_register
                            .__PVT__upstream_tx_preset
                            .__PVT__value),4);
    bufp->chgCData(oldp+80,(__VdtypeVar.__PVT__lane_eq_ctrl_register
                            .__PVT__upstream_rx_preset_hint
                            .__PVT__value),3);
    bufp->chgIData(oldp+81,(__VdtypeVar.__PVT__extended_capabilities
                            .__PVT__ext_cap.__PVT__value),32);
}

void Vtb_pcie_datalink_layer___024root__trace_chg_dtype____1(Vtb_pcie_datalink_layer___024root* vlSelf, VerilatedVcd::Buffer* bufp, uint32_t offset, const VlUnpacked<QData/*40:0*/, 1>& __VdtypeVar) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_pcie_datalink_layer___024root__trace_chg_dtype____1\n"); );
    Vtb_pcie_datalink_layer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode +  offset);
    bufp->chgQData(oldp+0,(__VdtypeVar[0]),41);
}

void Vtb_pcie_datalink_layer___024root__trace_chg_dtype____2(Vtb_pcie_datalink_layer___024root* vlSelf, VerilatedVcd::Buffer* bufp, uint32_t offset, const VlUnpacked<QData/*40:0*/, 2>& __VdtypeVar) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_pcie_datalink_layer___024root__trace_chg_dtype____2\n"); );
    Vtb_pcie_datalink_layer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode +  offset);
    bufp->chgQData(oldp+0,(__VdtypeVar[1]),41);
    bufp->chgQData(oldp+2,(__VdtypeVar[0]),41);
}

void Vtb_pcie_datalink_layer___024root__trace_chg_dtype____3(Vtb_pcie_datalink_layer___024root* vlSelf, VerilatedVcd::Buffer* bufp, uint32_t offset, const VlUnpacked<CData/*0:0*/, 2>& __VdtypeVar) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_pcie_datalink_layer___024root__trace_chg_dtype____3\n"); );
    Vtb_pcie_datalink_layer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode +  offset);
    bufp->chgBit(oldp+0,(__VdtypeVar[0]));
    bufp->chgBit(oldp+1,(__VdtypeVar[1]));
}

void Vtb_pcie_datalink_layer___024root__trace_chg_dtype____4(Vtb_pcie_datalink_layer___024root* vlSelf, VerilatedVcd::Buffer* bufp, uint32_t offset, const VlUnpacked<CData/*0:0*/, 2>& __VdtypeVar) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_pcie_datalink_layer___024root__trace_chg_dtype____4\n"); );
    Vtb_pcie_datalink_layer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode +  offset);
    bufp->chgBit(oldp+0,(__VdtypeVar[0]));
    bufp->chgBit(oldp+1,(__VdtypeVar[1]));
}

void Vtb_pcie_datalink_layer___024root__trace_chg_dtype____5(Vtb_pcie_datalink_layer___024root* vlSelf, VerilatedVcd::Buffer* bufp, uint32_t offset, const VlUnpacked<IData/*31:0*/, 2>& __VdtypeVar) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_pcie_datalink_layer___024root__trace_chg_dtype____5\n"); );
    Vtb_pcie_datalink_layer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode +  offset);
    bufp->chgIData(oldp+0,(__VdtypeVar[0]),32);
    bufp->chgIData(oldp+1,(__VdtypeVar[1]),32);
}

void Vtb_pcie_datalink_layer___024root__trace_chg_dtype____6(Vtb_pcie_datalink_layer___024root* vlSelf, VerilatedVcd::Buffer* bufp, uint32_t offset, const Vtb_pcie_datalink_layer_tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage_t__struct__0& __VdtypeVar) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_pcie_datalink_layer___024root__trace_chg_dtype____6\n"); );
    Vtb_pcie_datalink_layer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode +  offset);
    bufp->chgBit(oldp+0,(__VdtypeVar.__PVT__byte_offset_04
                         .__PVT__bus_master_enable.__PVT__value));
    bufp->chgBit(oldp+1,(__VdtypeVar.__PVT__byte_offset_04
                         .__PVT__special_cycle_enable
                         .__PVT__value));
    bufp->chgBit(oldp+2,(__VdtypeVar.__PVT__byte_offset_04
                         .__PVT__memory_write_invalidate
                         .__PVT__value));
    bufp->chgBit(oldp+3,(__VdtypeVar.__PVT__byte_offset_04
                         .__PVT__vga_palette_snoop.__PVT__value));
    bufp->chgBit(oldp+4,(__VdtypeVar.__PVT__byte_offset_04
                         .__PVT__parity_error_response
                         .__PVT__value));
    bufp->chgBit(oldp+5,(__VdtypeVar.__PVT__byte_offset_04
                         .__PVT__idsel_step_wait_cycle_control
                         .__PVT__value));
    bufp->chgBit(oldp+6,(__VdtypeVar.__PVT__byte_offset_04
                         .__PVT__SERR_Enable.__PVT__value));
    bufp->chgBit(oldp+7,(__VdtypeVar.__PVT__byte_offset_04
                         .__PVT__fast_b2b_transactions_enable
                         .__PVT__value));
    bufp->chgBit(oldp+8,(__VdtypeVar.__PVT__byte_offset_04
                         .__PVT__interrupt_disable.__PVT__value));
    bufp->chgCData(oldp+9,(__VdtypeVar.__PVT__byte_offset_04
                           .__PVT__rsvd.__PVT__value),8);
    bufp->chgBit(oldp+10,(__VdtypeVar.__PVT__byte_offset_04
                          .__PVT__interrupt_status.__PVT__value));
    bufp->chgBit(oldp+11,(__VdtypeVar.__PVT__byte_offset_04
                          .__PVT__capabilities_list
                          .__PVT__value));
    bufp->chgBit(oldp+12,(__VdtypeVar.__PVT__byte_offset_04
                          .__PVT__sixtysix_mhz_capable
                          .__PVT__value));
    bufp->chgBit(oldp+13,(__VdtypeVar.__PVT__byte_offset_04
                          .__PVT__fast_b2b_transactions_capable
                          .__PVT__value));
    bufp->chgBit(oldp+14,(__VdtypeVar.__PVT__byte_offset_04
                          .__PVT__master_data_parity_error
                          .__PVT__value));
    bufp->chgCData(oldp+15,(__VdtypeVar.__PVT__byte_offset_04
                            .__PVT__devsel_timing.__PVT__value),2);
    bufp->chgBit(oldp+16,(__VdtypeVar.__PVT__byte_offset_04
                          .__PVT__signaled_target_abort
                          .__PVT__value));
    bufp->chgBit(oldp+17,(__VdtypeVar.__PVT__byte_offset_04
                          .__PVT__received_target_abort
                          .__PVT__value));
    bufp->chgBit(oldp+18,(__VdtypeVar.__PVT__byte_offset_04
                          .__PVT__received_master_abort
                          .__PVT__value));
    bufp->chgBit(oldp+19,(__VdtypeVar.__PVT__byte_offset_04
                          .__PVT__signaled_system_error
                          .__PVT__value));
    bufp->chgBit(oldp+20,(__VdtypeVar.__PVT__byte_offset_04
                          .__PVT__detected_parity_error
                          .__PVT__value));
    bufp->chgCData(oldp+21,(__VdtypeVar.__PVT__byte_offset_0C
                            .__PVT__cache_line_size_register
                            .__PVT__value),8);
    bufp->chgCData(oldp+22,(__VdtypeVar.__PVT__byte_offset_0C
                            .__PVT__latency_timer_register
                            .__PVT__value),8);
    bufp->chgCData(oldp+23,(__VdtypeVar.__PVT__byte_offset_0C
                            .__PVT__interrupt_line_register
                            .__PVT__value),8);
    bufp->chgCData(oldp+24,(__VdtypeVar.__PVT__byte_offset_0C
                            .__PVT__interrupt_pin_register
                            .__PVT__value),8);
    bufp->chgIData(oldp+25,(__VdtypeVar.__PVT__base_ddress_register_2
                            .__PVT__BAR.__PVT__value),32);
    bufp->chgIData(oldp+26,(__VdtypeVar.__PVT__base_ddress_register_3
                            .__PVT__BAR.__PVT__value),32);
    bufp->chgIData(oldp+27,(__VdtypeVar.__PVT__base_ddress_register_4
                            .__PVT__BAR.__PVT__value),32);
    bufp->chgIData(oldp+28,(__VdtypeVar.__PVT__base_ddress_register_5
                            .__PVT__BAR.__PVT__value),32);
    bufp->chgIData(oldp+29,(__VdtypeVar.__PVT__cardbus_cis_pointer
                            .__PVT__word.__PVT__value),32);
    bufp->chgCData(oldp+30,(__VdtypeVar.__PVT__byte_offset_3C
                            .__PVT__interrupt_line.__PVT__value),8);
    bufp->chgCData(oldp+31,(__VdtypeVar.__PVT__byte_offset_3C
                            .__PVT__interrupt_pin.__PVT__value),8);
    bufp->chgCData(oldp+32,(__VdtypeVar.__PVT__capabilities_power_mngt_pointer
                            .__PVT__version.__PVT__value),3);
    bufp->chgBit(oldp+33,(__VdtypeVar.__PVT__capabilities_power_mngt_pointer
                          .__PVT__pme_clock.__PVT__value));
    bufp->chgBit(oldp+34,(__VdtypeVar.__PVT__capabilities_power_mngt_pointer
                          .__PVT__dev_spec_init.__PVT__value));
    bufp->chgCData(oldp+35,(__VdtypeVar.__PVT__capabilities_power_mngt_pointer
                            .__PVT__aux_current.__PVT__value),3);
    bufp->chgBit(oldp+36,(__VdtypeVar.__PVT__capabilities_power_mngt_pointer
                          .__PVT__d1_support.__PVT__value));
    bufp->chgBit(oldp+37,(__VdtypeVar.__PVT__capabilities_power_mngt_pointer
                          .__PVT__d2_support.__PVT__value));
    bufp->chgCData(oldp+38,(__VdtypeVar.__PVT__capabilities_power_mngt_pointer
                            .__PVT__pme_support.__PVT__value),5);
    bufp->chgCData(oldp+39,(__VdtypeVar.__PVT__power_management_pointer
                            .__PVT__power_state.__PVT__value),2);
    bufp->chgBit(oldp+40,(__VdtypeVar.__PVT__power_management_pointer
                          .__PVT__pme_enable.__PVT__value));
    bufp->chgCData(oldp+41,(__VdtypeVar.__PVT__power_management_pointer
                            .__PVT__data_select.__PVT__value),4);
    bufp->chgCData(oldp+42,(__VdtypeVar.__PVT__power_management_pointer
                            .__PVT__data_scale.__PVT__value),2);
    bufp->chgBit(oldp+43,(__VdtypeVar.__PVT__power_management_pointer
                          .__PVT__pme_status.__PVT__value));
    bufp->chgBit(oldp+44,(__VdtypeVar.__PVT__power_management_pointer
                          .__PVT__b2_b3_support.__PVT__value));
    bufp->chgBit(oldp+45,(__VdtypeVar.__PVT__power_management_pointer
                          .__PVT__bus_pwr_clk_ctrl_en
                          .__PVT__value));
    bufp->chgCData(oldp+46,(__VdtypeVar.__PVT__power_management_pointer
                            .__PVT__data.__PVT__value),8);
    bufp->chgBit(oldp+47,(__VdtypeVar.__PVT__link_control_3_register
                          .__PVT__perform_equalization
                          .__PVT__value));
    bufp->chgBit(oldp+48,(__VdtypeVar.__PVT__link_control_3_register
                          .__PVT__link_eq_req_intr_en
                          .__PVT__value));
    bufp->chgCData(oldp+49,(__VdtypeVar.__PVT__lane_error_status_register
                            .__PVT__lane_error.__PVT__value),5);
    bufp->chgCData(oldp+50,(__VdtypeVar.__PVT__lane_eq_ctrl_register
                            .__PVT__downstream_tx_preset
                            .__PVT__value),4);
    bufp->chgCData(oldp+51,(__VdtypeVar.__PVT__lane_eq_ctrl_register
                            .__PVT__downstream_rx_preset_hint
                            .__PVT__value),3);
    bufp->chgCData(oldp+52,(__VdtypeVar.__PVT__lane_eq_ctrl_register
                            .__PVT__upstream_tx_preset
                            .__PVT__value),4);
    bufp->chgCData(oldp+53,(__VdtypeVar.__PVT__lane_eq_ctrl_register
                            .__PVT__upstream_rx_preset_hint
                            .__PVT__value),3);
}

void Vtb_pcie_datalink_layer___024root__trace_cleanup(void* voidSelf, VerilatedVcd* /*unused*/) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_pcie_datalink_layer___024root__trace_cleanup\n"); );
    // Body
    Vtb_pcie_datalink_layer___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vtb_pcie_datalink_layer___024root*>(voidSelf);
    Vtb_pcie_datalink_layer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    vlSymsp->__Vm_activity = false;
    vlSymsp->TOP.__Vm_traceActivity[0U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[1U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[2U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[3U] = 0U;
}
