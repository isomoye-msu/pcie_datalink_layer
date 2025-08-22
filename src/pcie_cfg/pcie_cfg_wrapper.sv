module pcie_cfg_wrapper
  import pcie_datalink_pkg::*;
  import pcie_tlp_pkg::*;
  import pcie_config_reg_pkg::*;
#(
    // TLP data width
    parameter int DATA_WIDTH     = 32,
    // TLP strobe width
    parameter int STRB_WIDTH     = DATA_WIDTH / 8,
    parameter int KEEP_WIDTH     = STRB_WIDTH,
    parameter int USER_WIDTH     = 1,
    parameter int TLP_SEG_COUNT  = 1,
    parameter int TLP_DATA_WIDTH = 128,
    parameter int TLP_STRB_WIDTH = 5,
    parameter int TLP_HDR_WIDTH  = 128

) (
    input  logic                    clk_i,
    input  logic                    rst_i,
    //TLP AXIS inputs
    input  logic [  DATA_WIDTH-1:0] s_axis_tdata,
    input  logic [  KEEP_WIDTH-1:0] s_axis_tkeep,
    input  logic                    s_axis_tvalid,
    input  logic                    s_axis_tlast,
    input  logic [  USER_WIDTH-1:0] s_axis_tuser,
    output logic                    s_axis_tready,
    /*
     * TLP output (completion to DMA)
     */
    output logic [(DATA_WIDTH)-1:0] cpl_axis_tdata,
    output logic [(KEEP_WIDTH)-1:0] cpl_axis_tkeep,
    output logic                    cpl_axis_tvalid,
    output logic                    cpl_axis_tlast,
    output logic [  USER_WIDTH-1:0] cpl_axis_tuser,
    input  logic                    cpl_axis_tready,
    /*
     * TLP output (completion to DMA)
     */
    //TLP AXIS inputs
    output logic [  DATA_WIDTH-1:0] m_tlp_axis_tdata,
    output logic [  KEEP_WIDTH-1:0] m_tlp_axis_tkeep,
    output logic                    m_tlp_axis_tvalid,
    output logic                    m_tlp_axis_tlast,
    output logic [  USER_WIDTH-1:0] m_tlp_axis_tuser,
    input  logic                    m_tlp_axis_tready,

    output logic [7:0] cfg_bus_number_o,
    output logic [4:0] cfg_device_number_o,
    output logic [2:0] cfg_function_number_o,


    // Parameters
    input  pcie_config_reg__in_t  hwif_in,
    output pcie_config_reg__out_t hwif_out
);

  //Ports
  logic [             TLP_DATA_WIDTH-1:0] rx_tlp_data;
  logic [             TLP_STRB_WIDTH-1:0] rx_tlp_strb;
  logic [TLP_SEG_COUNT*TLP_HDR_WIDTH-1:0] rx_tlp_hdr;
  logic [            TLP_SEG_COUNT*4-1:0] rx_tlp_error;
  logic [              TLP_SEG_COUNT-1:0] rx_tlp_valid;
  logic [              TLP_SEG_COUNT-1:0] rx_tlp_sop;
  logic [              TLP_SEG_COUNT-1:0] rx_tlp_eop;
  logic                                   rx_tlp_ready;


  //   wire                                   s_axil_awvalid;
  //   reg                                    s_axil_awready;
  //   wire [                           31:0] s_axil_awaddr;
  //   wire                                   s_axil_wvalid;
  //   reg                                    s_axil_wready;
  //   wire [                           31:0] s_axil_wdata;
  //   wire [                            3:0] s_axil_wstrb;
  //   wire                                   s_axil_arvalid;
  //   reg                                    s_axil_arready;
  //   wire [                           31:0] s_axil_araddr;
  //   reg                                    s_axil_rvalid;
  //   wire                                   s_axil_rready;
  //   reg  [                           31:0] s_axil_rdata;
  //   reg  [                            1:0] s_axil_rresp;
  //   reg                                    s_axil_bvalid;
  //   wire                                   s_axil_bready;
  //   reg  [                            1:0] s_axil_bresp;


  logic                                   s_axil_awready;
  logic                                   s_axil_awvalid;
  logic [                           31:0] s_axil_awaddr;
  logic [                            2:0] s_axil_awprot;
  logic                                   s_axil_wready;
  logic                                   s_axil_wvalid;
  logic [                           31:0] s_axil_wdata;
  logic [                            3:0] s_axil_wstrb;
  logic                                   s_axil_bready;
  logic                                   s_axil_bvalid;
  logic [                            1:0] s_axil_bresp;
  logic                                   s_axil_arready;
  logic                                   s_axil_arvalid;
  logic [                           31:0] s_axil_araddr;
  logic [                            2:0] s_axil_arprot;
  logic                                   s_axil_rready;
  logic                                   s_axil_rvalid;
  logic [                           31:0] s_axil_rdata;
  logic [                            1:0] s_axil_rresp;

  //   logic [               (DATA_WIDTH)-1:0] cpl_axis_tdata;
  //   logic [               (KEEP_WIDTH)-1:0] cpl_axis_tkeep;
  //   logic                                   cpl_axis_tvalid;
  //   logic                                   cpl_axis_tlast;
  //   logic [                 USER_WIDTH-1:0] cpl_axis_tuser;
  //   logic                                   cpl_axis_tready;


  logic [                 DATA_WIDTH-1:0] m_cfg_axis_tdata;
  logic [                 KEEP_WIDTH-1:0] m_cfg_axis_tkeep;
  logic                                   m_cfg_axis_tvalid;
  logic                                   m_cfg_axis_tlast;
  logic [                 USER_WIDTH-1:0] m_cfg_axis_tuser;
  logic                                   m_cfg_axis_tready;


  //   wire  [             TLP_DATA_WIDTH-1:0] rx_tlp_data;
  //   wire  [             TLP_STRB_WIDTH-1:0] rx_tlp_strb;
  //   wire  [TLP_SEG_COUNT*TLP_HDR_WIDTH-1:0] rx_tlp_hdr;
  //   wire  [            TLP_SEG_COUNT*4-1:0] rx_tlp_error;
  //   wire  [              TLP_SEG_COUNT-1:0] rx_tlp_valid;
  //   wire  [              TLP_SEG_COUNT-1:0] rx_tlp_sop;
  //   wire  [              TLP_SEG_COUNT-1:0] rx_tlp_eop;
  //   reg                                     rx_tlp_ready;

  pcie_config_decode #(
      .DATA_WIDTH    (DATA_WIDTH),
      .STRB_WIDTH    (STRB_WIDTH),
      .KEEP_WIDTH    (KEEP_WIDTH),
      .USER_WIDTH    (USER_WIDTH),
      .TLP_SEG_COUNT (TLP_SEG_COUNT),
      .TLP_DATA_WIDTH(TLP_DATA_WIDTH),
      .TLP_STRB_WIDTH(TLP_STRB_WIDTH),
      .TLP_HDR_WIDTH (TLP_HDR_WIDTH)
  ) pcie_config_decode_inst (
      .clk_i        (clk_i),
      .rst_i        (rst_i),
      .s_axis_tdata (m_cfg_axis_tdata),
      .s_axis_tkeep (m_cfg_axis_tkeep),
      .s_axis_tvalid(m_cfg_axis_tvalid),
      .s_axis_tlast (m_cfg_axis_tlast),
      .s_axis_tuser (m_cfg_axis_tuser),
      .s_axis_tready(m_cfg_axis_tready),
      .rx_tlp_data  (rx_tlp_data),
      .rx_tlp_strb  (rx_tlp_strb),
      .rx_tlp_hdr   (rx_tlp_hdr),
      .rx_tlp_error (rx_tlp_error),
      .rx_tlp_valid (rx_tlp_valid),
      .rx_tlp_sop   (rx_tlp_sop),
      .rx_tlp_eop   (rx_tlp_eop),
      .rx_tlp_ready (rx_tlp_ready)
  );

  pcie_config_mux #(
      .DATA_WIDTH    (DATA_WIDTH),
      .STRB_WIDTH    (STRB_WIDTH),
      .KEEP_WIDTH    (KEEP_WIDTH),
      .USER_WIDTH    (USER_WIDTH),
      .TLP_SEG_COUNT (TLP_SEG_COUNT),
      .TLP_DATA_WIDTH(TLP_DATA_WIDTH),
      .TLP_STRB_WIDTH(TLP_STRB_WIDTH),
      .TLP_HDR_WIDTH (TLP_HDR_WIDTH)
  ) pcie_config_mux_inst (
      .clk_i            (clk_i),
      .rst_i            (rst_i),
      .s_axis_tdata     (s_axis_tdata),
      .s_axis_tkeep     (s_axis_tkeep),
      .s_axis_tvalid    (s_axis_tvalid),
      .s_axis_tlast     (s_axis_tlast),
      .s_axis_tuser     (s_axis_tuser),
      .s_axis_tready    (s_axis_tready),
      .m_cfg_axis_tdata (m_cfg_axis_tdata),
      .m_cfg_axis_tkeep (m_cfg_axis_tkeep),
      .m_cfg_axis_tvalid(m_cfg_axis_tvalid),
      .m_cfg_axis_tlast (m_cfg_axis_tlast),
      .m_cfg_axis_tuser (m_cfg_axis_tuser),
      .m_cfg_axis_tready(m_cfg_axis_tready),
      .m_tlp_axis_tdata (m_tlp_axis_tdata),
      .m_tlp_axis_tkeep (m_tlp_axis_tkeep),
      .m_tlp_axis_tvalid(m_tlp_axis_tvalid),
      .m_tlp_axis_tlast (m_tlp_axis_tlast),
      .m_tlp_axis_tuser (m_tlp_axis_tuser),
      .m_tlp_axis_tready(m_tlp_axis_tready)
  );

  pcie_config_handler #(
      .DATA_WIDTH    (DATA_WIDTH),
      .STRB_WIDTH    (STRB_WIDTH),
      .KEEP_WIDTH    (KEEP_WIDTH),
      .USER_WIDTH    (USER_WIDTH),
      .TLP_SEG_COUNT (TLP_SEG_COUNT),
      .TLP_DATA_WIDTH(TLP_DATA_WIDTH),
      .TLP_STRB_WIDTH(TLP_STRB_WIDTH),
      .TLP_HDR_WIDTH (TLP_HDR_WIDTH)
  ) pcie_config_handler_inst (
      .clk_i                (clk_i),
      .rst_i                (rst_i),
      .rx_tlp_data          (rx_tlp_data),
      .rx_tlp_strb          (rx_tlp_strb),
      .rx_tlp_hdr           (rx_tlp_hdr),
      .rx_tlp_error         (rx_tlp_error),
      .rx_tlp_valid         (rx_tlp_valid),
      .rx_tlp_sop           (rx_tlp_sop),
      .rx_tlp_eop           (rx_tlp_eop),
      .rx_tlp_ready         (rx_tlp_ready),
      .s_axil_awvalid       (s_axil_awvalid),
      .s_axil_awready       (s_axil_awready),
      .s_axil_awaddr        (s_axil_awaddr),
      .s_axil_wvalid        (s_axil_wvalid),
      .s_axil_wready        (s_axil_wready),
      .s_axil_wdata         (s_axil_wdata),
      .s_axil_wstrb         (s_axil_wstrb),
      .s_axil_arvalid       (s_axil_arvalid),
      .s_axil_arready       (s_axil_arready),
      .s_axil_araddr        (s_axil_araddr),
      .s_axil_rvalid        (s_axil_rvalid),
      .s_axil_rready        (s_axil_rready),
      .s_axil_rdata         (s_axil_rdata),
      .s_axil_rresp         (s_axil_rresp),
      .s_axil_bvalid        (s_axil_bvalid),
      .s_axil_bready        (s_axil_bready),
      .s_axil_bresp         (s_axil_bresp),
      .cfg_bus_number_o     (cfg_bus_number_o),
      .cfg_device_number_o  (cfg_device_number_o),
      .cfg_function_number_o(cfg_function_number_o),

      .cpl_axis_tdata (cpl_axis_tdata),
      .cpl_axis_tkeep (cpl_axis_tkeep),
      .cpl_axis_tvalid(cpl_axis_tvalid),
      .cpl_axis_tlast (cpl_axis_tlast),
      .cpl_axis_tuser (cpl_axis_tuser),
      .cpl_axis_tready(cpl_axis_tready)
  );


  pcie_config_reg pcie_config_reg_inst (
      .clk           (clk_i),
      .rst           (rst_i),
      .s_axil_awready(s_axil_awready),
      .s_axil_awvalid(s_axil_awvalid),
      .s_axil_awaddr (s_axil_awaddr),
      .s_axil_awprot (s_axil_awprot),
      .s_axil_wready (s_axil_wready),
      .s_axil_wvalid (s_axil_wvalid),
      .s_axil_wdata  (s_axil_wdata),
      .s_axil_wstrb  (s_axil_wstrb),
      .s_axil_bready (s_axil_bready),
      .s_axil_bvalid (s_axil_bvalid),
      .s_axil_bresp  (s_axil_bresp),
      .s_axil_arready(s_axil_arready),
      .s_axil_arvalid(s_axil_arvalid),
      .s_axil_araddr (s_axil_araddr),
      .s_axil_arprot (s_axil_arprot),
      .s_axil_rready (s_axil_rready),
      .s_axil_rvalid (s_axil_rvalid),
      .s_axil_rdata  (s_axil_rdata),
      .s_axil_rresp  (s_axil_rresp),
      .hwif_in       (hwif_in),
      .hwif_out      (hwif_out)
  );


endmodule
