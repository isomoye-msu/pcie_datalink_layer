// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Vtop.h"
#include "Vtop__Syms.h"
#include "verilated_fst_c.h"
#include "verilated_dpi.h"

//============================================================
// Constructors

Vtop::Vtop(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new Vtop__Syms(contextp(), _vcname__, this)}
    , clk_i{vlSymsp->TOP.clk_i}
    , rst_i{vlSymsp->TOP.rst_i}
    , link_status_i{vlSymsp->TOP.link_status_i}
    , phy_link_up_i{vlSymsp->TOP.phy_link_up_i}
    , s_axis_tkeep{vlSymsp->TOP.s_axis_tkeep}
    , s_axis_tvalid{vlSymsp->TOP.s_axis_tvalid}
    , s_axis_tlast{vlSymsp->TOP.s_axis_tlast}
    , s_axis_tuser{vlSymsp->TOP.s_axis_tuser}
    , s_axis_tready{vlSymsp->TOP.s_axis_tready}
    , m_axis_dllp2tlp_tkeep{vlSymsp->TOP.m_axis_dllp2tlp_tkeep}
    , m_axis_dllp2tlp_tvalid{vlSymsp->TOP.m_axis_dllp2tlp_tvalid}
    , m_axis_dllp2tlp_tlast{vlSymsp->TOP.m_axis_dllp2tlp_tlast}
    , m_axis_dllp2tlp_tuser{vlSymsp->TOP.m_axis_dllp2tlp_tuser}
    , m_axis_dllp2tlp_tready{vlSymsp->TOP.m_axis_dllp2tlp_tready}
    , m_axis_dllp2phy_tkeep{vlSymsp->TOP.m_axis_dllp2phy_tkeep}
    , m_axis_dllp2phy_tvalid{vlSymsp->TOP.m_axis_dllp2phy_tvalid}
    , m_axis_dllp2phy_tlast{vlSymsp->TOP.m_axis_dllp2phy_tlast}
    , m_axis_dllp2phy_tuser{vlSymsp->TOP.m_axis_dllp2phy_tuser}
    , m_axis_dllp2phy_tready{vlSymsp->TOP.m_axis_dllp2phy_tready}
    , seq_num_vld_o{vlSymsp->TOP.seq_num_vld_o}
    , seq_num_acknack_o{vlSymsp->TOP.seq_num_acknack_o}
    , fc1_values_stored_o{vlSymsp->TOP.fc1_values_stored_o}
    , fc2_values_stored_o{vlSymsp->TOP.fc2_values_stored_o}
    , tx_fc_ph_o{vlSymsp->TOP.tx_fc_ph_o}
    , tx_fc_nph_o{vlSymsp->TOP.tx_fc_nph_o}
    , tx_fc_cplh_o{vlSymsp->TOP.tx_fc_cplh_o}
    , update_fc_o{vlSymsp->TOP.update_fc_o}
    , seq_num_o{vlSymsp->TOP.seq_num_o}
    , tx_fc_pd_o{vlSymsp->TOP.tx_fc_pd_o}
    , tx_fc_npd_o{vlSymsp->TOP.tx_fc_npd_o}
    , tx_fc_cpld_o{vlSymsp->TOP.tx_fc_cpld_o}
    , s_axis_tdata{vlSymsp->TOP.s_axis_tdata}
    , m_axis_dllp2tlp_tdata{vlSymsp->TOP.m_axis_dllp2tlp_tdata}
    , m_axis_dllp2phy_tdata{vlSymsp->TOP.m_axis_dllp2phy_tdata}
    , __PVT__pcie_phy_pkg{vlSymsp->TOP.__PVT__pcie_phy_pkg}
    , __PVT__pcie_datalink_pkg{vlSymsp->TOP.__PVT__pcie_datalink_pkg}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
}

Vtop::Vtop(const char* _vcname__)
    : Vtop(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

Vtop::~Vtop() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void Vtop___024root___eval_debug_assertions(Vtop___024root* vlSelf);
#endif  // VL_DEBUG
void Vtop___024root___eval_static(Vtop___024root* vlSelf);
void Vtop___024root___eval_initial(Vtop___024root* vlSelf);
void Vtop___024root___eval_settle(Vtop___024root* vlSelf);
void Vtop___024root___eval(Vtop___024root* vlSelf);

void Vtop::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vtop::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Vtop___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_activity = true;
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        vlSymsp->__Vm_didInit = true;
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        Vtop___024root___eval_static(&(vlSymsp->TOP));
        Vtop___024root___eval_initial(&(vlSymsp->TOP));
        Vtop___024root___eval_settle(&(vlSymsp->TOP));
    }
    // MTask 0 start
    VL_DEBUG_IF(VL_DBG_MSGF("MTask0 starting\n"););
    Verilated::mtaskId(0);
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    Vtop___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfThreadMTask(vlSymsp->__Vm_evalMsgQp);
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

//============================================================
// Events and timing
bool Vtop::eventsPending() { return false; }

uint64_t Vtop::nextTimeSlot() {
    VL_FATAL_MT(__FILE__, __LINE__, "", "%Error: No delays in the design");
    return 0;
}

//============================================================
// Utilities

const char* Vtop::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void Vtop___024root___eval_final(Vtop___024root* vlSelf);

VL_ATTR_COLD void Vtop::final() {
    Vtop___024root___eval_final(&(vlSymsp->TOP));
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* Vtop::hierName() const { return vlSymsp->name(); }
const char* Vtop::modelName() const { return "Vtop"; }
unsigned Vtop::threads() const { return 1; }
std::unique_ptr<VerilatedTraceConfig> Vtop::traceConfig() const {
    return std::unique_ptr<VerilatedTraceConfig>{new VerilatedTraceConfig{false, false, false}};
};

//============================================================
// Trace configuration

void Vtop___024root__trace_init_top(Vtop___024root* vlSelf, VerilatedFst* tracep);

VL_ATTR_COLD static void trace_init(void* voidSelf, VerilatedFst* tracep, uint32_t code) {
    // Callback from tracep->open()
    Vtop___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vtop___024root*>(voidSelf);
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (!vlSymsp->_vm_contextp__->calcUnusedSigs()) {
        VL_FATAL_MT(__FILE__, __LINE__, __FILE__,
            "Turning on wave traces requires Verilated::traceEverOn(true) call before time 0.");
    }
    vlSymsp->__Vm_baseCode = code;
    tracep->scopeEscape(' ');
    tracep->pushNamePrefix(std::string{vlSymsp->name()} + ' ');
    Vtop___024root__trace_init_top(vlSelf, tracep);
    tracep->popNamePrefix();
    tracep->scopeEscape('.');
}

VL_ATTR_COLD void Vtop___024root__trace_register(Vtop___024root* vlSelf, VerilatedFst* tracep);

VL_ATTR_COLD void Vtop::trace(VerilatedFstC* tfp, int levels, int options) {
    if (tfp->isOpen()) {
        vl_fatal(__FILE__, __LINE__, __FILE__,"'Vtop::trace()' shall not be called after 'VerilatedFstC::open()'.");
    }
    if (false && levels && options) {}  // Prevent unused
    tfp->spTrace()->addModel(this);
    tfp->spTrace()->addInitCb(&trace_init, &(vlSymsp->TOP));
    Vtop___024root__trace_register(&(vlSymsp->TOP), tfp->spTrace());
}
