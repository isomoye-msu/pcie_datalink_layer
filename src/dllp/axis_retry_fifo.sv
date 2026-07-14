//==========================================================================
//
//  Morgan State University
//  Open Hardware Acceleration Lab (HAL-O)
//
//!  Project:   Open-Source PCIe Endpoint Controller.
//   File:      axis_retry_fifo.v
//  Author:    <Your Name>
//  Created:   <Date>
//
//! Description:
//! Module implements a retry management FIFO. Stores TLPs as axis frames.
//! Module resets read and write pointer after every frame allowing for retransmission
//! as long as data is not overwritten.
//
//
//  Project:
//    This file is part of the PCIe Gen1/Gen2 Endpoint Controller project.
//    Developed as an open-source, synthesizable Verilog RTL IP core, this
//    project provides FPGA designers and researchers with an educational
//    and extensible platform for high-speed interconnect design.
//
//  Institutional Acknowledgement:
//    - Project oversight and research guidance provided by the CEAMLS
//      (Center for Equitable AI & Machine Learning Systems) Director.
//
//  Notes:
//    - Compliant with PCIe Base Specification (Gen1: 2.5 GT/s,
//      Gen2: 5.0 GT/s).
//
//  License: MIT License
//
//==========================================================================

module axis_retry_fifo
  import pcie_datalink_pkg::*;
#(
    // TLP data width
    parameter int DATA_WIDTH       = 32,
    // TLP strobe width
    parameter int STRB_WIDTH       = DATA_WIDTH / 8,
    parameter int KEEP_WIDTH       = STRB_WIDTH,
    parameter int USER_WIDTH       = 1,
    parameter int MAX_PAYLOAD_SIZE = 256
) (
    input logic clk_i,  // Clock signal
    input logic rst_i,  // Reset signal


    //! @virtualbus TLP_axis_inputs @dir in
    input  logic [DATA_WIDTH-1:0] s_axis_tdata,
    input  logic [KEEP_WIDTH-1:0] s_axis_tkeep,
    input  logic                  s_axis_tvalid,
    input  logic                  s_axis_tlast,
    input  logic [USER_WIDTH-1:0] s_axis_tuser,
    output logic                  s_axis_tready,
    //! @end
    //! @virtualbus TLP_axis_outputs @dir out
    output logic [DATA_WIDTH-1:0] m_axis_tdata,
    output logic [KEEP_WIDTH-1:0] m_axis_tkeep,
    output logic                  m_axis_tvalid,
    output logic                  m_axis_tlast,
    output logic [USER_WIDTH-1:0] m_axis_tuser,
    input  logic                  m_axis_tready
    //! @end
);

  localparam int MaxHdrSize = 4;
  // Include the sequence/LCRC alignment beats in addition to header/payload.
  localparam int MaxPktSize = ((MAX_PAYLOAD_SIZE + 3) >> 2) + MaxHdrSize + 2;
  localparam int PtrWidth = (MaxPktSize < 2) ? 1 : $clog2(MaxPktSize);

  //axis packet holder struct
  typedef struct packed {
    logic                  tvalid;
    logic [USER_WIDTH-1:0] tuser;
    logic                  tlast;
    logic [KEEP_WIDTH-1:0] tkeep;
    logic [DATA_WIDTH-1:0] tdata;
  } axis_tlp_pkt_t;


  typedef struct packed {
    logic [PtrWidth-1:0]            wr_ptr;
    //read pointer signals
    logic [PtrWidth-1:0]            rd_ptr;
    axis_tlp_pkt_t [MaxPktSize-1:0] axis_mem;
    logic                           frame_available;
    logic                           dropping_frame;
  } retry_fifo_t;


  retry_fifo_t D;
  retry_fifo_t Q;
  always_ff @(posedge clk_i) begin : main_seq
    if (rst_i) begin
      Q <= '{default: 'd0};
    end else begin
      Q <= D;
    end
  end


  //simple write logic overflow is handled by retry management module
  always_comb begin : read_write_logic
    D             = Q;
    s_axis_tready = '1;
    m_axis_tdata  = '0;
    m_axis_tkeep  = '0;
    m_axis_tvalid = '0;
    m_axis_tlast  = '0;
    m_axis_tuser  = '0;

    if (Q.frame_available) begin
      m_axis_tvalid = Q.axis_mem[Q.rd_ptr].tvalid;
      m_axis_tdata  = Q.axis_mem[Q.rd_ptr].tdata;
      m_axis_tkeep  = Q.axis_mem[Q.rd_ptr].tkeep;
      m_axis_tlast  = Q.axis_mem[Q.rd_ptr].tlast;
      m_axis_tuser  = Q.axis_mem[Q.rd_ptr].tuser;
      if (m_axis_tready && m_axis_tvalid) begin
        if (m_axis_tlast) begin
          D.rd_ptr = '0;
        end else if (Q.rd_ptr == MaxPktSize - 1) begin
          // A stored frame can never legally continue past the memory boundary.
          D.rd_ptr          = '0;
          D.frame_available = '0;
        end else begin
          D.rd_ptr = Q.rd_ptr + 1'b1;
        end
      end
    end


    if (s_axis_tvalid && s_axis_tready) begin
      if (Q.dropping_frame) begin
        // Consume the remainder of an oversized/malformed frame without
        // allowing its pointer to wrap and overwrite the start of the buffer.
        if (s_axis_tlast) begin
          D.wr_ptr          = '0;
          D.dropping_frame  = '0;
          D.frame_available = '0;
        end
      end else begin
        if (Q.wr_ptr == '0) begin
          D.frame_available = '0;
        end
        D.axis_mem[Q.wr_ptr] = {
          s_axis_tvalid, s_axis_tuser, s_axis_tlast, s_axis_tkeep, s_axis_tdata
        };
        if (s_axis_tlast) begin
          D.wr_ptr          = '0;
          D.frame_available = '1;
        end else if (Q.wr_ptr == MaxPktSize - 1) begin
          D.wr_ptr          = '0;
          D.dropping_frame  = '1;
          D.frame_available = '0;
        end else begin
          D.wr_ptr = Q.wr_ptr + 1'b1;
        end
      end
    end
  end

endmodule
