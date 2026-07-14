// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table implementation internals

#include "Vtb_pcie_datalink_layer__pch.h"

Vtb_pcie_datalink_layer__Syms::Vtb_pcie_datalink_layer__Syms(VerilatedContext* contextp, const char* namep, Vtb_pcie_datalink_layer* modelp)
    : VerilatedSyms{contextp}
    // Setup internal state of the Syms class
    , __Vm_modelp{modelp}
    // Setup top module instance
    , TOP{this, namep}
{
    // Check resources
    Verilated::stackCheck(942);
    // Setup sub module instances
    TOP__pcie_tlp_pkg.ctor(this, "pcie_tlp_pkg");
    // Configure time unit / time precision
    _vm_contextp__->timeunit(-9);
    _vm_contextp__->timeprecision(-12);
    // Setup each module's pointers to their submodules
    TOP.__PVT__pcie_tlp_pkg = &TOP__pcie_tlp_pkg;
    // Setup each module's pointer back to symbol table (for public functions)
    TOP.__Vconfigure(true);
    TOP__pcie_tlp_pkg.__Vconfigure(true);
    // Setup scopes
}

Vtb_pcie_datalink_layer__Syms::~Vtb_pcie_datalink_layer__Syms() {
    // Tear down scopes
    // Tear down sub module instances
    TOP__pcie_tlp_pkg.dtor();
}
