// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtb_pcie_datalink_layer.h for the primary calling header

#include "Vtb_pcie_datalink_layer__pch.h"

void Vtb_pcie_datalink_layer___024root___ctor_var_reset(Vtb_pcie_datalink_layer___024root* vlSelf);

Vtb_pcie_datalink_layer___024root::Vtb_pcie_datalink_layer___024root(Vtb_pcie_datalink_layer__Syms* symsp, const char* namep)
 {
    vlSymsp = symsp;
    vlNamep = strdup(namep);
    // Reset structure values
    Vtb_pcie_datalink_layer___024root___ctor_var_reset(this);
}

void Vtb_pcie_datalink_layer___024root::__Vconfigure(bool first) {
    (void)first;  // Prevent unused variable warning
}

Vtb_pcie_datalink_layer___024root::~Vtb_pcie_datalink_layer___024root() {
    VL_DO_DANGLING(std::free(const_cast<char*>(vlNamep)), vlNamep);
}
