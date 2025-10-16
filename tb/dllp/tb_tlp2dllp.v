//==========================================================================
//
//  Morgan State University
//  Open Hardware Acceleration Lab (HAL-O)
//
//  Project:   Open-Source PCIe Endpoint Controller.
//  File:      tb_tlp2dllp.v
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

module tb_tlp2dllp;

  // Parameters
  localparam int DATA_WIDTH = 32;
  localparam int KEEP_WIDTH = 32 / 8;
  localparam int USER_WIDTH = 3;
  localparam int S_COUNT = 1;
  localparam int RAM_DATA_WIDTH = DATA_WIDTH;
  localparam int RAM_ADDR_WIDTH = $clog2(DATA_WIDTH);

  //Ports
  reg                       clk;
  reg                       rst;
  reg  [    DATA_WIDTH-1:0] s_axis_tdata;
  reg  [    KEEP_WIDTH-1:0] s_axis_tkeep;
  reg  [       S_COUNT-1:0] s_axis_tvalid;
  reg  [       S_COUNT-1:0] s_axis_tlast;
  reg  [    USER_WIDTH-1:0] s_axis_tuser;
  wire [       S_COUNT-1:0] s_axis_tready;
  wire [    DATA_WIDTH-1:0] m_axis_tdata;
  wire [    KEEP_WIDTH-1:0] m_axis_tkeep;
  wire                      m_axis_tvalid;
  wire                      m_axis_tlast;
  wire [    USER_WIDTH-1:0] m_axis_tuser;
  reg                       m_axis_tready;
  wire                      bram_wr;
  wire [RAM_ADDR_WIDTH-1:0] bram_addr;
  wire [RAM_DATA_WIDTH-1:0] bram_data_out;
  reg  [RAM_DATA_WIDTH-1:0] bram_data_in;
  wire [              15:0] seq_num;
  wire                      dllp_valid;
  reg                       retry_available;
  reg  [               7:0] retry_index;
  reg  [               7:0] tx_fc_ph;
  reg  [              11:0] tx_fc_pd;
  reg  [               7:0] tx_fc_nph;
  reg  [              11:0] tx_fc_npd;

  tlp2dllp #(
      .DATA_WIDTH(DATA_WIDTH),
      .KEEP_WIDTH(KEEP_WIDTH),
      .USER_WIDTH(USER_WIDTH),
      .S_COUNT(S_COUNT),
      .RAM_DATA_WIDTH(RAM_DATA_WIDTH),
      .RAM_ADDR_WIDTH(RAM_ADDR_WIDTH)
  ) tlp2dllp_inst (
      .clk_i(clk),
      .rst_i(rst),
      .s_axis_tdata_i(s_axis_tdata),
      .s_axis_tkeep_i(s_axis_tkeep),
      .s_axis_tvalid_i(s_axis_tvalid),
      .s_axis_tlast_i(s_axis_tlast),
      .s_axis_tuser_i(s_axis_tuser),
      .s_axis_tready_o(s_axis_tready),
      .m_axis_tdata_o(m_axis_tdata),
      .m_axis_tkeep_o(m_axis_tkeep),
      .m_axis_tvalid_o(m_axis_tvalid),
      .m_axis_tlast_o(m_axis_tlast),
      .m_axis_tuser_o(m_axis_tuser),
      .m_axis_tready_i(m_axis_tready),
      .bram_wr_o(bram_wr),
      .bram_addr_o(bram_addr),
      .bram_data_out_o(bram_data_out),
      .bram_data_in_i(bram_data_in),
      .seq_num_o(seq_num),
      .dllp_valid_o(dllp_valid),
      .retry_available_i(retry_available),
      .retry_index_i(retry_index),
      .tx_fc_ph_i(tx_fc_ph),
      .tx_fc_pd_i(tx_fc_pd),
      .tx_fc_nph_i(tx_fc_nph),
      .tx_fc_npd_i(tx_fc_npd)
  );


  // Dump waves
  // initial begin
  //   $dumpfile("tb_tlp2dllp.vcd");
  //   $dumpvars(1, tb_tlp2dllp);
  // end
  //always #5  clk = ! clk ;

endmodule
