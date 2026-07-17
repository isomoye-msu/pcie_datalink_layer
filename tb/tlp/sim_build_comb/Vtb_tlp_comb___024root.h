// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vtb_tlp_comb.h for the primary calling header

#ifndef VERILATED_VTB_TLP_COMB___024ROOT_H_
#define VERILATED_VTB_TLP_COMB___024ROOT_H_  // guard

#include "verilated.h"


class Vtb_tlp_comb__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vtb_tlp_comb___024root final {
  public:

    // INTERNAL VARIABLES
    Vtb_tlp_comb__Syms* vlSymsp;
    const char* vlNamep;

    // CONSTRUCTORS
    Vtb_tlp_comb___024root(Vtb_tlp_comb__Syms* symsp, const char* namep);
    ~Vtb_tlp_comb___024root();
    VL_UNCOPYABLE(Vtb_tlp_comb___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
