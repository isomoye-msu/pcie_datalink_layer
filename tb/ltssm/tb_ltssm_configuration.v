//==========================================================================
//
//  Morgan State University
//  Open Hardware Acceleration Lab (HAL-O)
//
//  Project:   Open-Source PCIe Endpoint Controller.
//  File:      tb_ltssm_configuration.v
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
module tb_ltssm_configuration;

  // Parameters
  localparam int MAX_NUM_LANES = 4;
  localparam int DATA_WIDTH = 32;
  localparam int KEEP_WIDTH = DATA_WIDTH / 8;
  localparam int USER_WIDTH = DATA_WIDTH / 8;

  //Ports
  reg clk;
  reg rst;
  reg en;
  reg link_up;
  reg is_timeout;
  reg recovery;
  wire error;
  wire success;
  wire error_loopback;
  wire error_disable;
  reg [(MAX_NUM_LANES * 8)-1:0] rate_id;
  reg [MAX_NUM_LANES-1:0] ts1_valid;
  reg [MAX_NUM_LANES-1:0] ts2_valid;
  reg [MAX_NUM_LANES-1:0] idle_valid;
  reg [(MAX_NUM_LANES * 8)-1:0] link_num;
  reg [(MAX_NUM_LANES * 8)-1:0] lane_num;
  reg [(MAX_NUM_LANES * 8)-1:0] lane_num_transmitted;
  reg [(MAX_NUM_LANES * 8)-1:0] training_ctrl;
  reg [MAX_NUM_LANES-1:0] lane_active;
  reg [MAX_NUM_LANES-1:0] lanes_ts2_satisfied;
  reg [MAX_NUM_LANES-1:0] config_copmlete_ts2;
  wire [DATA_WIDTH-1:0] m_axis_tdata;
  wire [KEEP_WIDTH-1:0] m_axis_tkeep;
  wire m_axis_tvalid;
  wire m_axis_tlast;
  wire [USER_WIDTH-1:0] m_axis_tuser;
  reg m_axis_tready;

  ltssm_configuration #(
      .MAX_NUM_LANES(MAX_NUM_LANES),
      .DATA_WIDTH(DATA_WIDTH),
      .KEEP_WIDTH(KEEP_WIDTH),
      .USER_WIDTH(USER_WIDTH),
      .IS_UPSTREAM(1)
  ) ltssm_configuration_inst (
      .clk_i(clk),
      .rst_i(rst),
      .en_i(en),
      .link_up_i(link_up),
      .is_timeout_i(is_timeout),
      .recovery_i(recovery),
      .error_o(error),
      .success_o(success),
      .error_loopback_o(error_loopback),
      .error_disable_o(error_disable),
      .rate_id_i(rate_id),
      .ts1_valid_i(ts1_valid),
      .ts2_valid_i(ts2_valid),
      .idle_valid_i(idle_valid),
      .link_num_i(link_num),
      .lane_num_i(lane_num),
      .lane_num_transmitted_i(lane_num_transmitted),
      .training_ctrl_i(training_ctrl),
      .lane_active_i(lane_active),
      .lanes_ts2_satisfied_i(lanes_ts2_satisfied),
      .config_copmlete_ts2_i(config_copmlete_ts2),
      .m_axis_tdata(m_axis_tdata),
      .m_axis_tkeep(m_axis_tkeep),
      .m_axis_tvalid(m_axis_tvalid),
      .m_axis_tlast(m_axis_tlast),
      .m_axis_tuser(m_axis_tuser),
      .m_axis_tready(m_axis_tready)
  );

  //always #5  clk = ! clk ;

endmodule
