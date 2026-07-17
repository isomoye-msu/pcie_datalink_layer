// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Vtb_tlp_comb__pch.h"

//============================================================
// Constructors

Vtb_tlp_comb::Vtb_tlp_comb(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new Vtb_tlp_comb__Syms(contextp(), _vcname__, this)}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
}

Vtb_tlp_comb::Vtb_tlp_comb(const char* _vcname__)
    : Vtb_tlp_comb(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

Vtb_tlp_comb::~Vtb_tlp_comb() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void Vtb_tlp_comb___024root___eval_debug_assertions(Vtb_tlp_comb___024root* vlSelf);
#endif  // VL_DEBUG
void Vtb_tlp_comb___024root___eval_static(Vtb_tlp_comb___024root* vlSelf);
void Vtb_tlp_comb___024root___eval_initial(Vtb_tlp_comb___024root* vlSelf);
void Vtb_tlp_comb___024root___eval_settle(Vtb_tlp_comb___024root* vlSelf);
void Vtb_tlp_comb___024root___eval(Vtb_tlp_comb___024root* vlSelf);

void Vtb_tlp_comb::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vtb_tlp_comb::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Vtb_tlp_comb___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        Vtb_tlp_comb___024root___eval_static(&(vlSymsp->TOP));
        Vtb_tlp_comb___024root___eval_initial(&(vlSymsp->TOP));
        Vtb_tlp_comb___024root___eval_settle(&(vlSymsp->TOP));
        vlSymsp->__Vm_didInit = true;
    }
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    Vtb_tlp_comb___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

//============================================================
// Events and timing
bool Vtb_tlp_comb::eventsPending() { return false; }

uint64_t Vtb_tlp_comb::nextTimeSlot() {
    VL_FATAL_MT(__FILE__, __LINE__, "", "No delays in the design");
    return 0;
}

//============================================================
// Utilities

const char* Vtb_tlp_comb::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void Vtb_tlp_comb___024root___eval_final(Vtb_tlp_comb___024root* vlSelf);

VL_ATTR_COLD void Vtb_tlp_comb::final() {
    contextp()->executingFinal(true);
    Vtb_tlp_comb___024root___eval_final(&(vlSymsp->TOP));
    contextp()->executingFinal(false);
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* Vtb_tlp_comb::hierName() const { return vlSymsp->name(); }
const char* Vtb_tlp_comb::modelName() const { return "Vtb_tlp_comb"; }
unsigned Vtb_tlp_comb::threads() const { return 1; }
void Vtb_tlp_comb::prepareClone() const { contextp()->prepareClone(); }
void Vtb_tlp_comb::atClone() const {
    contextp()->threadPoolpOnClone();
}
