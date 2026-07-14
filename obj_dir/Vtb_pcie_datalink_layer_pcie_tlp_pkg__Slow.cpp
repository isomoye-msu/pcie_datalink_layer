// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtb_pcie_datalink_layer.h for the primary calling header

#include "Vtb_pcie_datalink_layer__pch.h"


Vtb_pcie_datalink_layer_pcie_tlp_pkg::Vtb_pcie_datalink_layer_pcie_tlp_pkg() = default;
Vtb_pcie_datalink_layer_pcie_tlp_pkg::~Vtb_pcie_datalink_layer_pcie_tlp_pkg() = default;

void Vtb_pcie_datalink_layer_pcie_tlp_pkg::ctor(Vtb_pcie_datalink_layer__Syms* symsp, const char* namep) {
    vlSymsp = symsp;
    vlNamep = strdup(Verilated::catName(vlSymsp->name(), namep));
    // Reset structure values
}

void Vtb_pcie_datalink_layer_pcie_tlp_pkg::__Vconfigure(bool first) {
    (void)first;  // Prevent unused variable warning
}

void Vtb_pcie_datalink_layer_pcie_tlp_pkg::dtor() {
    VL_DO_DANGLING(std::free(const_cast<char*>(vlNamep)), vlNamep);
}
