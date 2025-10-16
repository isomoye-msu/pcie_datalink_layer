//==========================================================================
//
//  Morgan State University
//  Open Hardware Acceleration Lab (HAL-O)
//
//  Project:   Open-Source PCIe Endpoint Controller.
//  File:      tb_retry_management.v
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

module tb_retry_management;

  // Parameters
  localparam int DATA_WIDTH = 32;
  localparam int KEEP_WIDTH = 32 / 8;
  localparam int STRB_WIDTH = KEEP_WIDTH;
  localparam int USER_WIDTH = 3;
  localparam int S_COUNT = 1;
  localparam int RAM_DATA_WIDTH = DATA_WIDTH;
  localparam int RAM_ADDR_WIDTH = 32;
  localparam int RX_FIFO_SIZE = 1;
  localparam int RETRY_TLP_SIZE = 3;

  //Ports
  reg                       clk;
  reg                       rst;
  reg  [              11:0] tx_seq_num;
  reg                       tx_valid;
  wire                      retry_available;
  wire [               7:0] retryndex;
  wire                      retry_err;
  reg                       ack_nack;
  reg                       ack_nack_vld;
  reg  [              11:0] ack_seq_num;
  wire                      bram_wr;
  wire [RAM_ADDR_WIDTH-1:0] bram_addr;
  wire [RAM_DATA_WIDTH-1:0] bram_data_out;
  reg  [RAM_DATA_WIDTH-1:0] bram_data_in;
  wire [  (DATA_WIDTH)-1:0] m_axis_tdata;
  wire [  (KEEP_WIDTH)-1:0] m_axis_tkeep;
  wire                      m_axis_tvalid;
  wire                      m_axis_tlast;
  wire [    USER_WIDTH-1:0] m_axis_tuser;
  reg                       m_axis_tready;

  retry_management #(
      .DATA_WIDTH(DATA_WIDTH),
      .STRB_WIDTH(STRB_WIDTH),
      .KEEP_WIDTH(KEEP_WIDTH),
      .USER_WIDTH(USER_WIDTH),
      .S_COUNT(S_COUNT),
      .RAM_DATA_WIDTH(RAM_DATA_WIDTH),
      .RAM_ADDR_WIDTH(RAM_ADDR_WIDTH),
      .RETRY_TLP_SIZE(RETRY_TLP_SIZE)
  ) retry_management_inst (
      .clk_i(clk),
      .rst_i(rst),
      .tx_seq_num_i(tx_seq_num),
      .tx_valid_i(tx_valid),
      .retry_available_o(retry_available),
      .retry_index_o(retry_index),
      .retry_err_o(retry_err),
      .ack_nack_i(ack_nack),
      .ack_nack_vld_i(ack_nack_vld),
      .ack_seq_num_i(ack_seq_num),
      .bram_wr_o(bram_wr),
      .bram_addr_o(bram_addr),
      .bram_data_out_o(bram_data_out),
      .bram_data_in_i(bram_data_in),
      .m_axis_tdata_o(m_axis_tdata),
      .m_axis_tkeep_o(m_axis_tkeep),
      .m_axis_tvalid_o(m_axis_tvalid),
      .m_axis_tlast_o(m_axis_tlast),
      .m_axis_tuser_o(m_axis_tuser),
      .m_axis_tready_i(m_axis_tready)
  );



  //always #5  clk = ! clk ;
   // Dump waves
//   initial begin
//     $dumpfile("tb_retry_management.vcd");
//     $dumpvars(1, tb_retry_management);
//   end

endmodule
