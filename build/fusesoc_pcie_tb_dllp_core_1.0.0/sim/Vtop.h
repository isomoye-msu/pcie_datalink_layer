// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Primary model header
//
// This header should be included by all source files instantiating the design.
// The class here is then constructed to instantiate the design.
// See the Verilator manual for examples.

#ifndef VERILATED_VTOP_H_
#define VERILATED_VTOP_H_  // guard

#include "verilated.h"
#include "svdpi.h"

class Vtop__Syms;
class Vtop___024root;
class VerilatedFstC;
class Vtop_pcie_phy_pkg;
class Vtop_pcie_datalink_pkg;


// This class is the main interface to the Verilated model
class Vtop VL_NOT_FINAL : public VerilatedModel {
  private:
    // Symbol table holding complete model state (owned by this class)
    Vtop__Syms* const vlSymsp;

  public:

    // PORTS
    // The application code writes and reads these signals to
    // propagate new values into/out from the Verilated model.
    VL_IN8(&clk_i,0,0);
    VL_IN8(&rst_i,0,0);
    VL_IN8(&s_tlp_axis_tkeep,3,0);
    VL_IN8(&s_tlp_axis_tvalid,0,0);
    VL_IN8(&s_tlp_axis_tlast,0,0);
    VL_IN8(&s_tlp_axis_tuser,2,0);
    VL_OUT8(&s_tlp_axis_tready,0,0);
    VL_OUT8(&m_tlp_axis_tkeep,3,0);
    VL_OUT8(&m_tlp_axis_tvalid,0,0);
    VL_OUT8(&m_tlp_axis_tlast,0,0);
    VL_OUT8(&m_tlp_axis_tuser,2,0);
    VL_IN8(&m_tlp_axis_tready,0,0);
    VL_IN8(&s_phy_axis_tkeep,3,0);
    VL_IN8(&s_phy_axis_tvalid,0,0);
    VL_IN8(&s_phy_axis_tlast,0,0);
    VL_IN8(&s_phy_axis_tuser,2,0);
    VL_OUT8(&s_phy_axis_tready,0,0);
    VL_OUT8(&m_phy_axis_tkeep,3,0);
    VL_OUT8(&m_phy_axis_tvalid,0,0);
    VL_OUT8(&m_phy_axis_tlast,0,0);
    VL_OUT8(&m_phy_axis_tuser,2,0);
    VL_IN8(&m_phy_axis_tready,0,0);
    VL_IN8(&phy_link_up_i,0,0);
    VL_OUT8(&fc_initialized_o,0,0);
    VL_OUT8(&bus_num_o,7,0);
    VL_OUT8(&ext_tag_enable_o,0,0);
    VL_OUT8(&rcb_128b_o,0,0);
    VL_OUT8(&max_read_request_size_o,2,0);
    VL_OUT8(&max_payload_size_o,2,0);
    VL_OUT8(&msix_enable_o,0,0);
    VL_OUT8(&msix_mask_o,0,0);
    VL_IN8(&status_error_cor_i,0,0);
    VL_IN8(&status_error_uncor_i,0,0);
    VL_IN8(&rx_cpl_stall_i,0,0);
    VL_IN(&s_tlp_axis_tdata,31,0);
    VL_OUT(&m_tlp_axis_tdata,31,0);
    VL_IN(&s_phy_axis_tdata,31,0);
    VL_OUT(&m_phy_axis_tdata,31,0);

    // CELLS
    // Public to allow access to /* verilator public */ items.
    // Otherwise the application code can consider these internals.
    Vtop_pcie_phy_pkg* const __PVT__pcie_phy_pkg;
    Vtop_pcie_datalink_pkg* const __PVT__pcie_datalink_pkg;

    // Root instance pointer to allow access to model internals,
    // including inlined /* verilator public_flat_* */ items.
    Vtop___024root* const rootp;

    // CONSTRUCTORS
    /// Construct the model; called by application code
    /// If contextp is null, then the model will use the default global context
    /// If name is "", then makes a wrapper with a
    /// single model invisible with respect to DPI scope names.
    explicit Vtop(VerilatedContext* contextp, const char* name = "TOP");
    explicit Vtop(const char* name = "TOP");
    /// Destroy the model; called (often implicitly) by application code
    virtual ~Vtop();
  private:
    VL_UNCOPYABLE(Vtop);  ///< Copying not allowed

  public:
    // API METHODS
    /// Evaluate the model.  Application must call when inputs change.
    void eval() { eval_step(); }
    /// Evaluate when calling multiple units/models per time step.
    void eval_step();
    /// Evaluate at end of a timestep for tracing, when using eval_step().
    /// Application must call after all eval() and before time changes.
    void eval_end_step() {}
    /// Simulation complete, run final blocks.  Application must call on completion.
    void final();
    /// Are there scheduled events to handle?
    bool eventsPending();
    /// Returns time at next time slot. Aborts if !eventsPending()
    uint64_t nextTimeSlot();
    /// Trace signals in the model; called by application code
    void trace(VerilatedFstC* tfp, int levels, int options = 0);
    /// Retrieve name of this model instance (as passed to constructor).
    const char* name() const;

    // Abstract methods from VerilatedModel
    const char* hierName() const override final;
    const char* modelName() const override final;
    unsigned threads() const override final;
    std::unique_ptr<VerilatedTraceConfig> traceConfig() const override final;
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

#endif  // guard
