// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vtop.h for the primary calling header

#ifndef VERILATED_VTOP_PCIE_DATALINK_PKG_H_
#define VERILATED_VTOP_PCIE_DATALINK_PKG_H_  // guard

#include "verilated.h"

class Vtop__Syms;

class Vtop_pcie_datalink_pkg final : public VerilatedModule {
  public:

    // INTERNAL VARIABLES
    Vtop__Syms* const vlSymsp;

    // PARAMETERS
    static constexpr CData/*7:0*/ HdrFc = 0xd0U;
    static constexpr CData/*7:0*/ DataFc = 0xd0U;
    static constexpr CData/*7:0*/ FcPHdr = 8U;
    static constexpr CData/*7:0*/ FcNpHdr = 8U;
    static constexpr CData/*7:0*/ FcCplHdr = 8U;
    static constexpr IData/*31:0*/ FcPData = 0x00000200U;
    static constexpr IData/*31:0*/ FcNpData = 0x00000080U;
    static constexpr IData/*31:0*/ DllpHdrByteSize = 2U;
    static constexpr IData/*31:0*/ ReplayTimer = 0x000003e7U;
    static constexpr IData/*31:0*/ ReplayNum = 2U;
    static constexpr IData/*31:0*/ LtssmDetect = 0x000005dcU;
    static constexpr IData/*31:0*/ FcClpData = 0x00000040U;
    static constexpr IData/*31:0*/ SkidBuffer = 2U;
    static constexpr IData/*31:0*/ HdrMinCredits = 1U;

    // CONSTRUCTORS
    Vtop_pcie_datalink_pkg(Vtop__Syms* symsp, const char* v__name);
    ~Vtop_pcie_datalink_pkg();
    VL_UNCOPYABLE(Vtop_pcie_datalink_pkg);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);


#endif  // guard
