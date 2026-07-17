// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtb_tlp_comb.h for the primary calling header

#include "Vtb_tlp_comb__pch.h"


Vtb_tlp_comb___024root::Vtb_tlp_comb___024root(Vtb_tlp_comb__Syms* symsp, const char* namep)
 {
    vlSymsp = symsp;
    vlNamep = strdup(namep);
    // Reset structure values
}

void Vtb_tlp_comb___024root::__Vconfigure(bool first) {
    (void)first;  // Prevent unused variable warning
}

Vtb_tlp_comb___024root::~Vtb_tlp_comb___024root() {
    VL_DO_DANGLING(std::free(const_cast<char*>(vlNamep)), vlNamep);
}
