//==========================================================================
//
//  Morgan State University
//  Open Hardware Acceleration Lab (HAL-O)
//
//  Project:   Open-Source PCIe Endpoint Controller.
//  File:      tb_pcie_datalink_layer.v
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

module tb_pcie_datalink_layer;


  // Parameters
  localparam int DATA_WIDTH = 32;
  localparam int STRB_WIDTH = DATA_WIDTH / 8;
  localparam int KEEP_WIDTH = STRB_WIDTH;
  localparam int USER_WIDTH = 4;
  localparam int S_COUNT = 2;
  localparam int M_COUNT = 2;
  localparam int RAM_DATA_WIDTH = 32;
  localparam int RAM_ADDR_WIDTH = 12;
  localparam int RETRY_TLP_SIZE = 3;
  localparam int MAX_PAYLOAD_SIZE = 1;
  localparam int RX_FIFO_SIZE = 3;

  //Ports
  reg                   clk;
  reg                   rst;
  reg  [DATA_WIDTH-1:0] s_axis_tlpin_tdata;
  reg  [KEEP_WIDTH-1:0] s_axis_tlpin_tkeep;
  reg                   s_axis_tlpin_tvalid;
  reg                   s_axis_tlpin_tlast;
  reg  [USER_WIDTH-1:0] s_axis_tlpin_tuser;
  wire                  s_axis_tlpin_tready;
  wire [DATA_WIDTH-1:0] m_axis_tlpout_tdata;
  wire [KEEP_WIDTH-1:0] m_axis_tlpout_tkeep;
  wire                  m_axis_tlpout_tvalid;
  wire                  m_axis_tlpout_tlast;
  wire [USER_WIDTH-1:0] m_axis_tlpout_tuser;
  reg                   m_axis_tlpout_tready;
  reg  [DATA_WIDTH-1:0] s_axis_phy2dllp_tdata;
  reg  [KEEP_WIDTH-1:0] s_axis_phy2dllp_tkeep;
  reg                   s_axis_phy2dllp_tvalid;
  reg                   s_axis_phy2dllp_tlast;
  reg  [USER_WIDTH-1:0] s_axis_phy2dllp_tuser;
  wire                  s_axis_phy2dllp_tready;
  wire [DATA_WIDTH-1:0] m_axis_dllp2phy_tdata;
  wire [KEEP_WIDTH-1:0] m_axis_dllp2phy_tkeep;
  wire                  m_axis_dllp2phy_tvalid;
  wire                  m_axis_dllp2phy_tlast;
  wire [USER_WIDTH-1:0] m_axis_dllp2phy_tuser;
  reg                   m_axis_dllp2phy_tready;
  reg  [DATA_WIDTH-1:0] s_axis_phy2tlp_tdata;
  reg  [KEEP_WIDTH-1:0] s_axis_phy2tlp_tkeep;
  reg                   s_axis_phy2tlp_tvalid;
  reg                   s_axis_phy2tlp_tlast;
  reg  [USER_WIDTH-1:0] s_axis_phy2tlp_tuser;
  wire                  s_axis_phy2tlp_tready;
  wire [DATA_WIDTH-1:0] m_axis_tlp2phy_tdata;
  wire [KEEP_WIDTH-1:0] m_axis_tlp2phy_tkeep;
  wire                  m_axis_tlp2phy_tvalid;
  wire                  m_axis_tlp2phy_tlast;
  wire [USER_WIDTH-1:0] m_axis_tlp2phy_tuser;
  reg                   m_axis_tlp2phy_tready;
  reg                   phy_link_up;
  wire [           7:0] bus_num;
  wire                  ext_tag_enable;
  wire                  rcb_128b;
  wire [           2:0] max_read_request_size;
  wire [           2:0] max_payload_size;
  wire                  msix_enable;
  wire                  msix_mask;
  reg                   status_error_cor;
  reg                   status_error_uncor;
  reg                   rx_cpl_stall;

  pcie_datalink_layer #(
      .DATA_WIDTH(DATA_WIDTH),
      .STRB_WIDTH(STRB_WIDTH),
      .KEEP_WIDTH(KEEP_WIDTH),
      .USER_WIDTH(USER_WIDTH),
      .S_COUNT(S_COUNT),
      .RX_FIFO_SIZE(RX_FIFO_SIZE),
      .RETRY_TLP_SIZE(RETRY_TLP_SIZE),
      .MAX_PAYLOAD_SIZE(MAX_PAYLOAD_SIZE),
      .RAM_DATA_WIDTH(RAM_DATA_WIDTH),
      .RAM_ADDR_WIDTH(RAM_ADDR_WIDTH)
  ) pcie_datalink_layer_inst (
      .clk_i(clk),
      .rst_i(rst),
      .s_axis_tlp_tdata_i(s_axis_tlpin_tdata),
      .s_axis_tlp_tkeep_i(s_axis_tlpin_tkeep),
      .s_axis_tlp_tvalid_i(s_axis_tlpin_tvalid),
      .s_axis_tlp_tlast_i(s_axis_tlpin_tlast),
      .s_axis_tlp_tuser_i(s_axis_tlpin_tuser),
      .s_axis_tlp_tready_o(s_axis_tlpin_tready),
      .m_axis_tlp_tdata_o(m_axis_tlpout_tdata),
      .m_axis_tlp_tkeep_o(m_axis_tlpout_tkeep),
      .m_axis_tlp_tvalid_o(m_axis_tlpout_tvalid),
      .m_axis_tlp_tlast_o(m_axis_tlpout_tlast),
      .m_axis_tlp_tuser_o(m_axis_tlpout_tuser),
      .m_axis_tlp_tready_i(m_axis_tlpout_tready),
      .s_axis_phy2dllp_tdata_i(s_axis_phy2dllp_tdata),
      .s_axis_phy2dllp_tkeep_i(s_axis_phy2dllp_tkeep),
      .s_axis_phy2dllp_tvalid_i(s_axis_phy2dllp_tvalid),
      .s_axis_phy2dllp_tlast_i(s_axis_phy2dllp_tlast),
      .s_axis_phy2dllp_tuser_i(s_axis_phy2dllp_tuser),
      .s_axis_phy2dllp_tready_o(s_axis_phy2dllp_tready),
      .m_axis_dllp2phy_tdata_o(m_axis_dllp2phy_tdata),
      .m_axis_dllp2phy_tkeep_o(m_axis_dllp2phy_tkeep),
      .m_axis_dllp2phy_tvalid_o(m_axis_dllp2phy_tvalid),
      .m_axis_dllp2phy_tlast_o(m_axis_dllp2phy_tlast),
      .m_axis_dllp2phy_tuser_o(m_axis_dllp2phy_tuser),
      .m_axis_dllp2phy_tready_i(m_axis_dllp2phy_tready),
      .s_axis_phy2tlp_tdata_i(s_axis_phy2tlp_tdata),
      .s_axis_phy2tlp_tkeep_i(s_axis_phy2tlp_tkeep),
      .s_axis_phy2tlp_tvalid_i(s_axis_phy2tlp_tvalid),
      .s_axis_phy2tlp_tlast_i(s_axis_phy2tlp_tlast),
      .s_axis_phy2tlp_tuser_i(s_axis_phy2tlp_tuser),
      .s_axis_phy2tlp_tready_o(s_axis_phy2tlp_tready),
      .m_axis_tlp2phy_tdata_o(m_axis_tlp2phy_tdata),
      .m_axis_tlp2phy_tkeep_o(m_axis_tlp2phy_tkeep),
      .m_axis_tlp2phy_tvalid_o(m_axis_tlp2phy_tvalid),
      .m_axis_tlp2phy_tlast_o(m_axis_tlp2phy_tlast),
      .m_axis_tlp2phy_tuser_o(m_axis_tlp2phy_tuser),
      .m_axis_tlp2phy_tready_i(m_axis_tlp2phy_tready),
      .phy_link_up_i(phy_link_up),
      .bus_num_o(bus_num),
      .ext_tag_enable_o(ext_tag_enable),
      .rcb_128b_o(rcb_128b),
      .max_read_request_size_o(max_read_request_size),
      .max_payload_size_o(max_payload_size),
      .msix_enable_o(msix_enable),
      .msix_mask_o(msix_mask),
      .status_error_cor_i(status_error_cor),
      .status_error_uncor_i(status_error_uncor),
      .rx_cpl_stall_i(rx_cpl_stall)
  );

  //always #5  clk = ! clk ;

endmodule
