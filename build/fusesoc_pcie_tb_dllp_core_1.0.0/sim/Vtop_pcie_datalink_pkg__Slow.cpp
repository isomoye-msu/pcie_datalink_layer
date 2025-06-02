// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtop.h for the primary calling header

#include "verilated.h"
#include "verilated_dpi.h"

#include "Vtop__Syms.h"
#include "Vtop_pcie_datalink_pkg.h"

// Parameter definitions for Vtop_pcie_datalink_pkg
constexpr CData/*7:0*/ Vtop_pcie_datalink_pkg::HdrFc;
constexpr CData/*7:0*/ Vtop_pcie_datalink_pkg::DataFc;
constexpr CData/*7:0*/ Vtop_pcie_datalink_pkg::FcPHdr;
constexpr CData/*7:0*/ Vtop_pcie_datalink_pkg::FcNpHdr;
constexpr CData/*7:0*/ Vtop_pcie_datalink_pkg::FcCplHdr;
constexpr IData/*31:0*/ Vtop_pcie_datalink_pkg::FcPData;
constexpr IData/*31:0*/ Vtop_pcie_datalink_pkg::FcNpData;
constexpr IData/*31:0*/ Vtop_pcie_datalink_pkg::DllpHdrByteSize;
constexpr IData/*31:0*/ Vtop_pcie_datalink_pkg::ReplayTimer;
constexpr IData/*31:0*/ Vtop_pcie_datalink_pkg::ReplayNum;
constexpr IData/*31:0*/ Vtop_pcie_datalink_pkg::LtssmDetect;
constexpr IData/*31:0*/ Vtop_pcie_datalink_pkg::FcClpData;
constexpr IData/*31:0*/ Vtop_pcie_datalink_pkg::SkidBuffer;
constexpr IData/*31:0*/ Vtop_pcie_datalink_pkg::HdrMinCredits;


void Vtop_pcie_datalink_pkg___ctor_var_reset(Vtop_pcie_datalink_pkg* vlSelf);

Vtop_pcie_datalink_pkg::Vtop_pcie_datalink_pkg(Vtop__Syms* symsp, const char* v__name)
    : VerilatedModule{v__name}
    , vlSymsp{symsp}
 {
    // Reset structure values
    Vtop_pcie_datalink_pkg___ctor_var_reset(this);
}

void Vtop_pcie_datalink_pkg::__Vconfigure(bool first) {
    if (false && first) {}  // Prevent unused
}

Vtop_pcie_datalink_pkg::~Vtop_pcie_datalink_pkg() {
}
