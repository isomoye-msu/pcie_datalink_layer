
module tb_dllp2tlp;

  import pcie_datalink_pkg::*;
  // Parameters
  localparam int DATA_WIDTH = 32;
  localparam int STRB_WIDTH = DATA_WIDTH / 8;
  localparam int KEEP_WIDTH = STRB_WIDTH;
  localparam int USER_WIDTH = 4;
  localparam int S_COUNT = 1;
  localparam int M_COUNT = 1;
  localparam int TLP_SEG_COUNT = 0;
  localparam int TX_SEQ_NUM_COUNT = 0;
  localparam int TX_SEQ_NUM_WIDTH = 0;
  localparam int RAM_DATA_WIDTH = 32;
  localparam int RAM_ADDR_WIDTH = 12;
  localparam int RETRY_TLP_SIZE = 3;
  localparam int RX_FIFO_SIZE = 2;

  //Ports
  reg                   clk;
  reg                   rst;
  reg  [           1:0] link_status;
  reg  [DATA_WIDTH-1:0] s_axis_tdata;
  reg  [KEEP_WIDTH-1:0] s_axis_tkeep;
  reg  [   S_COUNT-1:0] s_axis_tvalid;
  reg  [   S_COUNT-1:0] s_axis_tlast;
  reg  [USER_WIDTH-1:0] s_axis_tuser;
  wire [   S_COUNT-1:0] s_axis_tready;

  wire [DATA_WIDTH-1:0] m_axis_tlp_tdata;
  wire [KEEP_WIDTH-1:0] m_axis_tlp_tkeep;
  wire                  m_axis_tlp_tvalid;
  wire                  m_axis_tlp_tlast;
  wire [USER_WIDTH-1:0] m_axis_tlp_tuser;
  reg                   m_axis_tlp_tready;
  wire [DATA_WIDTH-1:0] m_axis_dllp_tdata;
  wire [KEEP_WIDTH-1:0] m_axis_dllp_tkeep;
  wire                  m_axis_dllp_tvalid;
  wire                  m_axis_dllp_tlast;
  wire [USER_WIDTH-1:0] m_axis_dllp_tuser;
  reg                   m_axis_dllp_tready;
  reg [M_COUNT-1:0] m_axis_tvalid;

  dllp2tlp #(
      .DATA_WIDTH(DATA_WIDTH),
      .STRB_WIDTH(STRB_WIDTH),
      .KEEP_WIDTH(KEEP_WIDTH),
      .USER_WIDTH(USER_WIDTH),
      .S_COUNT(S_COUNT),
      .RX_FIFO_SIZE(RX_FIFO_SIZE),
      .RAM_DATA_WIDTH(RAM_DATA_WIDTH),
      .RAM_ADDR_WIDTH(RAM_ADDR_WIDTH)
  ) dllp2tlp_inst (
      .clk_i(clk),
      .rst_i(rst),
      .link_status_i(link_status),
      .s_axis_tdata_i(s_axis_tdata),
      .s_axis_tkeep_i(s_axis_tkeep),
      .s_axis_tvalid_i(s_axis_tvalid),
      .s_axis_tlast_i(s_axis_tlast),
      .s_axis_tuser_i(s_axis_tuser),
      .s_axis_tready_o(s_axis_tready),
      .m_axis_tdata_o({m_axis_tlp_tdata, m_axis_dllp_tdata}),
      .m_axis_tkeep_o({m_axis_tlp_tkeep, m_axis_dllp_tkeep}),
      .m_axis_tvalid_o({m_axis_tlp_tvalid, m_axis_dllp_tvalid}),
      .m_axis_tlast_o({m_axis_tlp_tlast, m_axis_dllp_tlast}),
      .m_axis_tuser_o({m_axis_tlp_tuser, m_axis_dllp_tuser}),
      .m_axis_tready_i({m_axis_tlp_tready, m_axis_dllp_tready})
  );

  //always #5  clk = ! clk ;

endmodule
