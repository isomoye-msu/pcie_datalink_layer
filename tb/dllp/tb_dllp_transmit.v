//==========================================================================
//
//  Morgan State University
//  Open Hardware Acceleration Lab (HAL-O)
//
//  Project:   Open-Source PCIe Endpoint Controller.
//  File:      tb_dllp_transmit.v
//  Author:    HAL-O
//  Created:   10/1/25
//
//  Description:
//  Module implements a retry management FIFO. Stores TLPs as axis frames.
//  Module resets read and write pointer after every frame allowing for retransmission
//  as long as data is not overwritten.
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

//`timescale 1ns / 1ps
module tb_dllp_transmit;

  // `include "src/tlp2dllp.sv"
  // `include "src/dllp_transmit.sv"
  // `include "src/retry_management.sv"
  // `include "../crc/Crc16Gen.sv"
  // `include "../crc/pcie_datalink_crc.sv"
  // `include "../crc/pcie_lcrc16.sv"
  // `include "../crc/pcie_lcrc32.sv"

  // Parameters
  localparam int DATA_WIDTH = 32;
  localparam int STRB_WIDTH = DATA_WIDTH / 8;
  localparam int KEEP_WIDTH = STRB_WIDTH;
  localparam int USER_WIDTH = 4;
  localparam int S_COUNT = 1;
  localparam int RETRY_TLP_SIZE = 3;
  parameter int MAX_PAYLOAD_SIZE = 0;

  //Ports
  reg  clk;
  reg  rst;
  reg [DATA_WIDTH-1:0] s_axis_tlp_tdata;
  reg [KEEP_WIDTH-1:0] s_axis_tlp_tkeep;
  reg [   S_COUNT-1:0] s_axis_tlp_tvalid;
  reg [   S_COUNT-1:0] s_axis_tlp_tlast;
  reg [USER_WIDTH-1:0] s_axis_tlp_tuser;
  wire [   S_COUNT-1:0] s_axis_tlp_tready;
  wire [DATA_WIDTH-1:0] m_axis_dllp_tdata;
  wire [KEEP_WIDTH-1:0] m_axis_dllp_tkeep;
  wire  m_axis_dllp_tvalid;
  wire  m_axis_dllp_tlast;
  wire [USER_WIDTH-1:0] m_axis_dllp_tuser;
  reg  m_axis_dllp_tready;
  reg  ack_nack;
  reg  ack_nack_vld;
  reg [11:0] ack_seq_num;
  reg [ 7:0] tx_fc_ph;
  reg [11:0] tx_fc_pd;
  reg [ 7:0] tx_fc_nph;
  reg [11:0] tx_fc_npd;

  dllp_transmit #(
      .DATA_WIDTH(DATA_WIDTH),
      .STRB_WIDTH(STRB_WIDTH),
      .KEEP_WIDTH(KEEP_WIDTH),
      .USER_WIDTH(USER_WIDTH),
      .S_COUNT(S_COUNT),
      .MAX_PAYLOAD_SIZE(MAX_PAYLOAD_SIZE),
      .RETRY_TLP_SIZE(RETRY_TLP_SIZE)
  ) dllp_transmit_inst (
      .clk_i(clk),
      .rst_i(rst),
      .s_axis_tlp_tdata_i(s_axis_tlp_tdata),
      .s_axis_tlp_tkeep_i(s_axis_tlp_tkeep),
      .s_axis_tlp_tvalid_i(s_axis_tlp_tvalid),
      .s_axis_tlp_tlast_i(s_axis_tlp_tlast),
      .s_axis_tlp_tuser_i(s_axis_tlp_tuser),
      .s_axis_tlp_tready_o(s_axis_tlp_tready),
      .m_axis_dllp_tdata_o(m_axis_dllp_tdata),
      .m_axis_dllp_tkeep_o(m_axis_dllp_tkeep),
      .m_axis_dllp_tvalid_o(m_axis_dllp_tvalid),
      .m_axis_dllp_tlast_o(m_axis_dllp_tlast),
      .m_axis_dllp_tuser_o(m_axis_dllp_tuser),
      .m_axis_dllp_tready_i(m_axis_dllp_tready),
      .ack_nack_i(ack_nack),
      .ack_nack_vld_i(ack_nack_vld),
      .ack_seq_num_i(ack_seq_num),
      .tx_fc_ph_i(tx_fc_ph),
      .tx_fc_pd_i(tx_fc_pd),
      .tx_fc_nph_i(tx_fc_nph),
      .tx_fc_npd_i(tx_fc_npd)
  );

  // always begin
  //   #5 clk = ~clk;
  // end


  // initial begin
  //   $dumpfile("tb_dllp_transmit.vcd");
  //   $dumpvars(1, tb_dllp_transmit);
  // end

endmodule
