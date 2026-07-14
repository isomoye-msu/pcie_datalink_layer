// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Vtb_pcie_datalink_layer__pch.h"
#include "verilated_vcd_c.h"

//============================================================
// Constructors

Vtb_pcie_datalink_layer::Vtb_pcie_datalink_layer(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new Vtb_pcie_datalink_layer__Syms(contextp(), _vcname__, this)}
    , __PVT__pcie_config_reg_pkg{vlSymsp->TOP.__PVT__pcie_config_reg_pkg}
    , __PVT__pcie_tlp_pkg{vlSymsp->TOP.__PVT__pcie_tlp_pkg}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
    contextp()->traceBaseModelCbAdd(
        [this](VerilatedTraceBaseC* tfp, int levels, int options) { traceBaseModel(tfp, levels, options); });
}

Vtb_pcie_datalink_layer::Vtb_pcie_datalink_layer(const char* _vcname__)
    : Vtb_pcie_datalink_layer(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

Vtb_pcie_datalink_layer::~Vtb_pcie_datalink_layer() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void Vtb_pcie_datalink_layer___024root___eval_debug_assertions(Vtb_pcie_datalink_layer___024root* vlSelf);
#endif  // VL_DEBUG
void Vtb_pcie_datalink_layer___024root___eval_static(Vtb_pcie_datalink_layer___024root* vlSelf);
void Vtb_pcie_datalink_layer___024root___eval_initial(Vtb_pcie_datalink_layer___024root* vlSelf);
void Vtb_pcie_datalink_layer___024root___eval_settle(Vtb_pcie_datalink_layer___024root* vlSelf);
void Vtb_pcie_datalink_layer___024root___eval(Vtb_pcie_datalink_layer___024root* vlSelf);

void Vtb_pcie_datalink_layer::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vtb_pcie_datalink_layer::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Vtb_pcie_datalink_layer___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_activity = true;
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        Vtb_pcie_datalink_layer___024root___eval_static(&(vlSymsp->TOP));
        Vtb_pcie_datalink_layer___024root___eval_initial(&(vlSymsp->TOP));
        Vtb_pcie_datalink_layer___024root___eval_settle(&(vlSymsp->TOP));
        vlSymsp->__Vm_didInit = true;
    }
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    Vtb_pcie_datalink_layer___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

//============================================================
// Events and timing
bool Vtb_pcie_datalink_layer::eventsPending() { return false; }

uint64_t Vtb_pcie_datalink_layer::nextTimeSlot() {
    VL_FATAL_MT(__FILE__, __LINE__, "", "No delays in the design");
    return 0;
}

//============================================================
// Utilities

const char* Vtb_pcie_datalink_layer::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void Vtb_pcie_datalink_layer___024root___eval_final(Vtb_pcie_datalink_layer___024root* vlSelf);

VL_ATTR_COLD void Vtb_pcie_datalink_layer::final() {
    contextp()->executingFinal(true);
    Vtb_pcie_datalink_layer___024root___eval_final(&(vlSymsp->TOP));
    contextp()->executingFinal(false);
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* Vtb_pcie_datalink_layer::hierName() const { return vlSymsp->name(); }
const char* Vtb_pcie_datalink_layer::modelName() const { return "Vtb_pcie_datalink_layer"; }
unsigned Vtb_pcie_datalink_layer::threads() const { return 1; }
void Vtb_pcie_datalink_layer::prepareClone() const { contextp()->prepareClone(); }
void Vtb_pcie_datalink_layer::atClone() const {
    contextp()->threadPoolpOnClone();
}
std::unique_ptr<VerilatedTraceConfig> Vtb_pcie_datalink_layer::traceConfig() const {
    return std::unique_ptr<VerilatedTraceConfig>{new VerilatedTraceConfig{false}};
};

//============================================================
// Trace configuration

void Vtb_pcie_datalink_layer___024root__trace_decl_types(VerilatedVcd* tracep);

void Vtb_pcie_datalink_layer___024root__trace_init_top(Vtb_pcie_datalink_layer___024root* vlSelf, VerilatedVcd* tracep);

VL_ATTR_COLD static void trace_init(void* voidSelf, VerilatedVcd* tracep, uint32_t code) {
    // Callback from tracep->open()
    Vtb_pcie_datalink_layer___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vtb_pcie_datalink_layer___024root*>(voidSelf);
    Vtb_pcie_datalink_layer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (!vlSymsp->_vm_contextp__->calcUnusedSigs()) {
        VL_FATAL_MT(__FILE__, __LINE__, __FILE__,
            "Turning on wave traces requires Verilated::traceEverOn(true) call before time 0.");
    }
    vlSymsp->__Vm_baseCode = code;
    tracep->pushPrefix(vlSymsp->name(), VerilatedTracePrefixType::SCOPE_MODULE);
    Vtb_pcie_datalink_layer___024root__trace_decl_types(tracep);
    Vtb_pcie_datalink_layer___024root__trace_init_top(vlSelf, tracep);
    tracep->popPrefix();
}

VL_ATTR_COLD void Vtb_pcie_datalink_layer___024root__trace_register(Vtb_pcie_datalink_layer___024root* vlSelf, VerilatedVcd* tracep);

VL_ATTR_COLD void Vtb_pcie_datalink_layer::traceBaseModel(VerilatedTraceBaseC* tfp, int levels, int options) {
    (void)levels; (void)options;
    VerilatedVcdC* const stfp = dynamic_cast<VerilatedVcdC*>(tfp);
    if (VL_UNLIKELY(!stfp)) {
        vl_fatal(__FILE__, __LINE__, __FILE__,"'Vtb_pcie_datalink_layer::trace()' called on non-VerilatedVcdC object;"
            " use --trace-fst with VerilatedFst object, and --trace-vcd with VerilatedVcd object");
    }
    stfp->spTrace()->addModel(this);
    stfp->spTrace()->addInitCb(&trace_init, &(vlSymsp->TOP), name(), false, 1686);
    Vtb_pcie_datalink_layer___024root__trace_register(&(vlSymsp->TOP), stfp->spTrace());
}
