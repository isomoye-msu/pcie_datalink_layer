module pcie_top_kc705 #(

    parameter         [4:0] PL_LINK_CAP_MAX_LINK_WIDTH = 5'd1,
    parameter integer       LANES                      = PL_LINK_CAP_MAX_LINK_WIDTH,
    parameter integer       DW                         = 64,
    parameter         [1:0] CRM_USER_CLK_FREQ          = 2'b11,
    parameter               CRM_MCAP_CLK_FREQ          = 1'b0,
    parameter               CRM_CORE_CLK_FREQ_500      = "TRUE"


) (

    output [(PL_LINK_CAP_MAX_LINK_WIDTH - 1) : 0] pci_exp_txp,
    output [(PL_LINK_CAP_MAX_LINK_WIDTH - 1) : 0] pci_exp_txn,
    input  [(PL_LINK_CAP_MAX_LINK_WIDTH - 1) : 0] pci_exp_rxp,
    input  [(PL_LINK_CAP_MAX_LINK_WIDTH - 1) : 0] pci_exp_rxn,

    // synthesis translate_off
    output led_0,
    output led_1,
    output led_2,
    output led_3,
    output led_4,
    output led_5,
    output led_6,
    output led_7,
    // synthesis translate_on   

    // synthesis translate_off
    input phy_ready_en,  // 0 = Power Down; 1 = Power Up. Power On state = 0
    input gen1_en,       // 1 = Enter Gen1 Operation; 1->0 Exit to Gen1
    input gen2_en,       // 1 = Enter Gen2 Operation; 1->0 Exit to Gen1
    input gen3_en,       // 1 = Enter Gen3 Operation; 1->0 Exit to Gen1
    input gen4_en,       // 1 = Enter Gen4 Operation; 1->0 Exit to Gen1
    input tx_elec_idle,  // 0 = No Tx EI; 1 = Tx EI. 
    // synthesis translate_on   

    input sys_clk_p,
    input sys_clk_n,
    input sys_rst_override_n,
    input sys_rst_n

);


  wire clkin;


  //------------------------------------------------------------------------------
  // Instance IBUFDS of IBUFDS Module.
  //------------------------------------------------------------------------------
  IBUFDS IBUFDS (
      // Inputs.
      .I (sys_clk_p),
      .IB(sys_clk_n),

      // Outputs.
      .O(clkin)
  );

  // Parameters
  //   localparam int CLK_RATE = 0;
  localparam int MAX_NUM_LANES = 4;
  localparam int DATA_WIDTH = 32;
  localparam int STRB_WIDTH = DATA_WIDTH / 8;
  localparam int KEEP_WIDTH = STRB_WIDTH;
  localparam int USER_WIDTH = 5;
  localparam int IS_ROOT_PORT = 1;
  localparam int LINK_NUM = 0;
  localparam int IS_UPSTREAM = 0;
  localparam int CROSSLINK_EN = 0;
  localparam int UPCONFIG_EN = 0;

  //Ports
  //   reg clk_i;
  //   reg rst_i;
  //   reg en_i;
  wire                                    fc_initialized_o;
  wire [( MAX_NUM_LANES* DATA_WIDTH)-1:0] phy_txdata;
  wire [               MAX_NUM_LANES-1:0] phy_txdata_valid;
  wire [           (4*MAX_NUM_LANES)-1:0] phy_txdatak;
  wire [               MAX_NUM_LANES-1:0] phy_txstart_block;
  wire [           (2*MAX_NUM_LANES)-1:0] phy_txsync_header;
  reg  [( MAX_NUM_LANES* DATA_WIDTH)-1:0] phy_rxdata;
  reg  [               MAX_NUM_LANES-1:0] phy_rxdata_valid;
  reg  [           (4*MAX_NUM_LANES)-1:0] phy_rxdatak;
  reg  [               MAX_NUM_LANES-1:0] phy_rxstart_block;
  reg  [           (2*MAX_NUM_LANES)-1:0] phy_rxsync_header;
  wire                                    phy_txdetectrx;
  wire [               MAX_NUM_LANES-1:0] phy_txelecidle;
  wire [               MAX_NUM_LANES-1:0] phy_txcompliance;
  wire [               MAX_NUM_LANES-1:0] phy_rxpolarity;
  wire [                             1:0] phy_powerdown;
  wire [                             2:0] phy_rate;
  reg  [               MAX_NUM_LANES-1:0] phy_rxvalid;
  reg  [               MAX_NUM_LANES-1:0] phy_phystatus;
  reg                                     phy_phystatus_rst;
  reg  [               MAX_NUM_LANES-1:0] phy_rxelecidle;
  reg  [           (MAX_NUM_LANES*3)-1:0] phy_rxstatus;
  wire [                             2:0] phy_txmargin;
  wire                                    phy_txswing;
  wire                                    phy_txdeemph;
  wire [           (MAX_NUM_LANES*2)-1:0] phy_txeq_ctrl;
  wire [           (MAX_NUM_LANES*4)-1:0] phy_txeq_preset;
  wire [           (MAX_NUM_LANES*6)-1:0] phy_txeq_coeff;
  reg  [                             5:0] phy_txeq_fs;
  reg  [                             5:0] phy_txeq_lf;
  reg  [          (MAX_NUM_LANES*18)-1:0] phy_txeq_new_coeff;
  reg  [               MAX_NUM_LANES-1:0] phy_txeq_done;
  wire [           (MAX_NUM_LANES*2)-1:0] phy_rxeq_ctrl;
  wire [           (MAX_NUM_LANES*4)-1:0] phy_rxeq_txpreset;
  reg  [               MAX_NUM_LANES-1:0] phy_rxeq_preset_sel;
  reg  [          (MAX_NUM_LANES*18)-1:0] phy_rxeq_new_txcoeff;
  reg  [               MAX_NUM_LANES-1:0] phy_rxeq_adapt_done;
  reg  [               MAX_NUM_LANES-1:0] phy_rxeq_done;
  wire [                           8-1:0] pipe_width_o;
  wire                                    as_mac_in_detect;
  wire                                    as_cdr_hold_req;
  wire [                             7:0] debug_state;
  reg                                     tx_elec_idle;
  reg                                     phy_ready_en;
  reg  [                  DATA_WIDTH-1:0] s_tlp_axis_tdata;
  reg  [                  KEEP_WIDTH-1:0] s_tlp_axis_tkeep;
  reg                                     s_tlp_axis_tvalid;
  reg                                     s_tlp_axis_tlast;
  reg  [                  USER_WIDTH-1:0] s_tlp_axis_tuser;
  wire                                    s_tlp_axis_tready;
  wire [                  DATA_WIDTH-1:0] m_tlp_axis_tdata;
  wire [                  KEEP_WIDTH-1:0] m_tlp_axis_tkeep;
  wire                                    m_tlp_axis_tvalid;
  wire                                    m_tlp_axis_tlast;
  wire [                  USER_WIDTH-1:0] m_tlp_axis_tuser;
  reg                                     m_tlp_axis_tready;


  reg  [               MAX_NUM_LANES-1:0] gtx_rx_init_Xxuserrdy0;

  pcie_phy_top #(
      .CLK_RATE     (CLK_RATE),
      .MAX_NUM_LANES(MAX_NUM_LANES),
      .DATA_WIDTH   (DATA_WIDTH),
      .STRB_WIDTH   (STRB_WIDTH),
      .KEEP_WIDTH   (KEEP_WIDTH),
      .USER_WIDTH   (USER_WIDTH),
      .IS_ROOT_PORT (IS_ROOT_PORT),
      .LINK_NUM     (LINK_NUM),
      .IS_UPSTREAM  (IS_UPSTREAM),
      .CROSSLINK_EN (CROSSLINK_EN),
      .UPCONFIG_EN  (UPCONFIG_EN)
  ) pcie_phy_top_inst (
      .clk_i               (clkin),
      .rst_i               (sys_rst_n),
      .en_i                ('1),
      .fc_initialized_o    (fc_initialized_o),
      .phy_txdata          (phy_txdata),
      .phy_txdata_valid    (phy_txdata_valid),
      .phy_txdatak         (phy_txdatak),
      .phy_txstart_block   (phy_txstart_block),
      .phy_txsync_header   (phy_txsync_header),
      .phy_rxdata          (phy_rxdata),
      .phy_rxdata_valid    (phy_rxdata_valid),
      .phy_rxdatak         (phy_rxdatak),
      .phy_rxstart_block   (phy_rxstart_block),
      .phy_rxsync_header   (phy_rxsync_header),
      .phy_txdetectrx      (phy_txdetectrx),
      .phy_txelecidle      (phy_txelecidle),
      .phy_txcompliance    (phy_txcompliance),
      .phy_rxpolarity      (phy_rxpolarity),
      .phy_powerdown       (phy_powerdown),
      .phy_rate            (phy_rate),
      .phy_rxvalid         (phy_rxvalid),
      .phy_phystatus       (phy_phystatus),
      .phy_phystatus_rst   (phy_phystatus_rst),
      .phy_rxelecidle      (phy_rxelecidle),
      .phy_rxstatus        (phy_rxstatus),
      .phy_txmargin        (phy_txmargin),
      .phy_txswing         (phy_txswing),
      .phy_txdeemph        (phy_txdeemph),
      .phy_txeq_ctrl       (phy_txeq_ctrl),
      .phy_txeq_preset     (phy_txeq_preset),
      .phy_txeq_coeff      (phy_txeq_coeff),
      .phy_txeq_fs         (phy_txeq_fs),
      .phy_txeq_lf         (phy_txeq_lf),
      .phy_txeq_new_coeff  (phy_txeq_new_coeff),
      .phy_txeq_done       (phy_txeq_done),
      .phy_rxeq_ctrl       (phy_rxeq_ctrl),
      .phy_rxeq_txpreset   (phy_rxeq_txpreset),
      .phy_rxeq_preset_sel (phy_rxeq_preset_sel),
      .phy_rxeq_new_txcoeff(phy_rxeq_new_txcoeff),
      .phy_rxeq_adapt_done (phy_rxeq_adapt_done),
      .phy_rxeq_done       (phy_rxeq_done),
      .pipe_width_o        (pipe_width_o),
      .as_mac_in_detect    (as_mac_in_detect),
      .as_cdr_hold_req     (as_cdr_hold_req),
      .debug_state         (debug_state),
      .tx_elec_idle        (tx_elec_idle),
      .phy_ready_en        (phy_ready_en),
      .s_tlp_axis_tdata    (s_tlp_axis_tdata),
      .s_tlp_axis_tkeep    (s_tlp_axis_tkeep),
      .s_tlp_axis_tvalid   (s_tlp_axis_tvalid),
      .s_tlp_axis_tlast    (s_tlp_axis_tlast),
      .s_tlp_axis_tuser    (s_tlp_axis_tuser),
      .s_tlp_axis_tready   (s_tlp_axis_tready),
      .m_tlp_axis_tdata    (m_tlp_axis_tdata),
      .m_tlp_axis_tkeep    (m_tlp_axis_tkeep),
      .m_tlp_axis_tvalid   (m_tlp_axis_tvalid),
      .m_tlp_axis_tlast    (m_tlp_axis_tlast),
      .m_tlp_axis_tuser    (m_tlp_axis_tuser),
      .m_tlp_axis_tready   (m_tlp_axis_tready)
  );

  wire pll_fb;
  wire pll_locked;
  reg  pll_power_down = 1'd0;
  wire clkout0;
  wire clkout1;
  //------------------------------------------------------------------------------
  // Instance PLLE2_ADV of PLLE2_ADV Module.
  //------------------------------------------------------------------------------
  PLLE2_ADV #(
      // Parameters.
      .CLKFBOUT_MULT (3'd5),
      .CLKIN1_PERIOD (5.0),
      .CLKOUT0_DIVIDE(4'd10),
      .CLKOUT0_PHASE (1'd0),
      .CLKOUT1_DIVIDE(4'd8),
      .CLKOUT1_PHASE (1'd0),
      .DIVCLK_DIVIDE (1'd1),
      .REF_JITTER1   (0.01),
      .STARTUP_WAIT  ("FALSE")
  ) PLLE2_ADV (
      // Inputs.
      .CLKFBIN(pll_fb),
      .CLKIN1 (clkin),
      .PWRDWN (pll_power_down),
      .RST    (sys_rst_n),

      // Outputs.
      .CLKFBOUT(pll_fb),
      .CLKOUT0 (clkout0),
      .CLKOUT1 (clkout1),
      .LOCKED  (pll_locked)
  );

  //------------------------------------------------------------------------------
  // Instance GTXE2_CHANNEL of GTXE2_CHANNEL Module.
  //------------------------------------------------------------------------------
  genvar gtx_lane;

  generate
    for (gtx_lane = 0; gtx_lane < MAX_NUM_LANES; gtx_lane++) begin : gen_gtx_lane

      reg  [ 8:0] gpll_drp_addr = 9'd0;
      reg         gpll_drp_clk = 1'd0;
      reg  [15:0] gpll_drp_di = 16'd0;
      wire [15:0] gpll_drp_do;
      reg         gpll_drp_en = 1'd0;
      wire        gpll_drp_rdy;
      reg         gpll_drp_we = 1'd0;
      wire        gpll_lock;
      reg         gpll_powerdown = 1'd0;
      wire        gpll_clk;
      wire        gpll_refclk;
      wire        gpll_reset;
      wire        gtx_tx_init_Xxuserrdy0 = 1'd1;

      assign refclk_clk = clkout_buf1;


      //------------------------------------------------------------------------------
      // Instance BUFG_1 of BUFG Module.
      //------------------------------------------------------------------------------
      BUFG BUFG_1 (
          // Inputs.
          .I(clkout1),

          // Outputs.
          .O(clkout_buf1)
      );

      wire gtx0;
      wire gtx1;
      wire gtx10;
      wire gtx11;
      wire gtx12;
      wire gtx13;
      wire gtx14;
      wire gtx15;
      wire gtx16;
      wire gtx17;
      wire gtx18;
      wire gtx19;
      wire gtx8;
      wire gtx4;

      wire gtx_rxoutclk;
      (* dont_touch = "true" *)
      wire rx_clk;
      wire tx_clk;
      wire gtx_txoutclk;
      wire gtx_txoutclk_bufg;
      assign tx_clk = gtx_txoutclk_bufg;

      //------------------------------------------------------------------------------
      // Instance BUFG_2 of BUFG Module.
      //------------------------------------------------------------------------------
      BUFG BUFG_2 (
          // Inputs.
          .I(gtx_txoutclk),

          // Outputs.
          .O(gtx_txoutclk_bufg)
      );

      //------------------------------------------------------------------------------
      // Instance BUFG_3 of BUFG Module.
      //------------------------------------------------------------------------------
      BUFG BUFG_3 (
          // Inputs.
          .I(gtx_rxoutclk),

          // Outputs.
          .O(rx_clk)
      );

      wire [15:0] gtx_drp_mux_do;
      wire        gtx_drp_mux_rdy;
      wire        gtx_tx_init_Xxresetdone0;


      //------------------------------------------------------------------------------
      // Instance GTXE2_COMMON of GTXE2_COMMON Module.
      //------------------------------------------------------------------------------
      GTXE2_COMMON #(
          // Parameters.
          .QPLL_CFG        (23'd6816193),
          .QPLL_FBDIV      (8'd224),
          .QPLL_FBDIV_RATIO(1'd1),
          .QPLL_REFCLK_DIV (1'd1)
      ) GTXE2_COMMON (
          // Inputs.
          .DRPADDR      (gpll_drp_addr),
          .DRPCLK       (gpll_drp_clk),
          .DRPDI        (gpll_drp_di),
          .DRPEN        (gpll_drp_en),
          .DRPWE        (gpll_drp_we),
          .GTREFCLK0    (refclk_clk),
          .QPLLLOCKEN   (1'd1),
          .QPLLPD       (gpll_powerdown),
          .QPLLREFCLKSEL(1'd1),
          .QPLLRESET    (gpll_reset),

          // Outputs.
          .DRPDO        (gpll_drp_do),
          .DRPRDY       (gpll_drp_rdy),
          .QPLLLOCK     (gpll_lock),
          .QPLLOUTCLK   (gpll_clk),
          .QPLLOUTREFCLK(gpll_refclk)
      );


      GTXE2_CHANNEL #(
          // Parameters.
          .ALIGN_COMMA_DOUBLE          ("FALSE"),
          .ALIGN_COMMA_ENABLE          (10'd1023),
          .ALIGN_COMMA_WORD            (2'd2),
          .ALIGN_MCOMMA_DET            ("TRUE"),
          .ALIGN_MCOMMA_VALUE          (10'd643),
          .ALIGN_PCOMMA_DET            ("TRUE"),
          .ALIGN_PCOMMA_VALUE          (9'd380),
          .CBCC_DATA_SOURCE_SEL        ("DECODED"),
          .CHAN_BOND_KEEP_ALIGN        ("FALSE"),
          .CHAN_BOND_MAX_SKEW          (1'd1),
          .CHAN_BOND_SEQ_1_1           (1'd0),
          .CHAN_BOND_SEQ_1_2           (1'd0),
          .CHAN_BOND_SEQ_1_3           (1'd0),
          .CHAN_BOND_SEQ_1_4           (1'd0),
          .CHAN_BOND_SEQ_1_ENABLE      (4'd15),
          .CHAN_BOND_SEQ_2_1           (1'd0),
          .CHAN_BOND_SEQ_2_2           (1'd0),
          .CHAN_BOND_SEQ_2_3           (1'd0),
          .CHAN_BOND_SEQ_2_4           (1'd0),
          .CHAN_BOND_SEQ_2_ENABLE      (4'd15),
          .CHAN_BOND_SEQ_2_USE         ("FALSE"),
          .CHAN_BOND_SEQ_LEN           (1'd1),
          .CLK_CORRECT_USE             ("FALSE"),
          .CLK_COR_KEEP_IDLE           ("FALSE"),
          .CLK_COR_MAX_LAT             (4'd9),
          .CLK_COR_MIN_LAT             (3'd7),
          .CLK_COR_PRECEDENCE          ("TRUE"),
          .CLK_COR_REPEAT_WAIT         (1'd0),
          .CLK_COR_SEQ_1_1             (9'd256),
          .CLK_COR_SEQ_1_2             (1'd0),
          .CLK_COR_SEQ_1_3             (1'd0),
          .CLK_COR_SEQ_1_4             (1'd0),
          .CLK_COR_SEQ_1_ENABLE        (4'd15),
          .CLK_COR_SEQ_2_1             (9'd256),
          .CLK_COR_SEQ_2_2             (1'd0),
          .CLK_COR_SEQ_2_3             (1'd0),
          .CLK_COR_SEQ_2_4             (1'd0),
          .CLK_COR_SEQ_2_ENABLE        (4'd15),
          .CLK_COR_SEQ_2_USE           ("FALSE"),
          .CLK_COR_SEQ_LEN             (1'd1),
          .CPLL_CFG                    (24'd12322780),
          .CPLL_FBDIV                  (1'd1),
          .CPLL_FBDIV_45               (3'd4),
          .CPLL_INIT_CFG               (5'd30),
          .CPLL_LOCK_CFG               (9'd488),
          .CPLL_REFCLK_DIV             (1'd1),
          .DEC_MCOMMA_DETECT           ("TRUE"),
          .DEC_PCOMMA_DETECT           ("TRUE"),
          .DEC_VALID_COMMA_ONLY        ("TRUE"),
          .DMONITOR_CFG                (12'd2560),
          .ES_CONTROL                  (1'd0),
          .ES_ERRDET_EN                ("FALSE"),
          .ES_EYE_SCAN_EN              ("TRUE"),
          .ES_HORZ_OFFSET              (1'd0),
          .ES_PMA_CFG                  (1'd0),
          .ES_PRESCALE                 (1'd0),
          .ES_QUALIFIER                (1'd0),
          .ES_QUAL_MASK                (1'd0),
          .ES_SDATA_MASK               (1'd0),
          .ES_VERT_OFFSET              (1'd0),
          .FTS_DESKEW_SEQ_ENABLE       (4'd15),
          .FTS_LANE_DESKEW_CFG         (4'd15),
          .FTS_LANE_DESKEW_EN          ("FALSE"),
          .GEARBOX_MODE                (1'd0),
          .OUTREFCLK_SEL_INV           (2'd3),
          .PCS_PCIE_EN                 ("FALSE"),
          .PCS_RSVD_ATTR               (1'd0),
          .PD_TRANS_TIME_FROM_P2       (6'd60),
          .PD_TRANS_TIME_NONE_P2       (6'd60),
          .PD_TRANS_TIME_TO_P2         (7'd100),
          .PMA_RSV                     (21'd1994880),
          .PMA_RSV2                    (14'd8272),
          .PMA_RSV3                    (1'd0),
          .PMA_RSV4                    (1'd0),
          .RXBUFRESET_TIME             (1'd1),
          .RXBUF_ADDR_MODE             ("FAST"),
          .RXBUF_EIDLE_HI_CNT          (4'd8),
          .RXBUF_EIDLE_LO_CNT          (1'd0),
          .RXBUF_EN                    ("FALSE"),
          .RXBUF_RESET_ON_CB_CHANGE    ("TRUE"),
          .RXBUF_RESET_ON_COMMAALIGN   ("FALSE"),
          .RXBUF_RESET_ON_EIDLE        ("FALSE"),
          .RXBUF_RESET_ON_RATE_CHANGE  ("TRUE"),
          .RXBUF_THRESH_OVFLW          (6'd61),
          .RXBUF_THRESH_OVRD           ("FALSE"),
          .RXBUF_THRESH_UNDFLW         (3'd4),
          .RXCDRFREQRESET_TIME         (1'd1),
          .RXCDRPHRESET_TIME           (1'd1),
          .RXCDR_CFG                   (66'd55340271799521247264),
          .RXCDR_FR_RESET_ON_EIDLE     (1'd0),
          .RXCDR_HOLD_DURING_EIDLE     (1'd0),
          .RXCDR_LOCK_CFG              (5'd21),
          .RXCDR_PH_RESET_ON_EIDLE     (1'd0),
          .RXDFELPMRESET_TIME          (4'd15),
          .RXDLY_CFG                   (5'd31),
          .RXDLY_LCFG                  (6'd48),
          .RXDLY_TAP_CFG               (1'd0),
          .RXGEARBOX_EN                ("FALSE"),
          .RXISCANRESET_TIME           (1'd1),
          .RXLPM_HF_CFG                (8'd240),
          .RXLPM_LF_CFG                (8'd240),
          .RXOOB_CFG                   (3'd6),
          .RXOUT_DIV                   (4'd8),
          .RXPCSRESET_TIME             (1'd1),
          .RXPHDLY_CFG                 (20'd540704),
          .RXPH_CFG                    (1'd0),
          .RXPH_MONITOR_SEL            (1'd0),
          .RXPMARESET_TIME             (2'd3),
          .RXPRBS_ERR_LOOPBACK         (1'd0),
          .RXSLIDE_AUTO_WAIT           (3'd7),
          .RXSLIDE_MODE                ("PCS"),
          .RX_BIAS_CFG                 (3'd4),
          .RX_BUFFER_CFG               (1'd0),
          .RX_CLK25_DIV                (3'd5),
          .RX_CLKMUX_PD                (1'd1),
          .RX_CM_SEL                   (2'd3),
          .RX_CM_TRIM                  (2'd2),
          .RX_DATA_WIDTH               (5'd20),
          .RX_DDI_SEL                  (1'd0),
          .RX_DEBUG_CFG                (1'd0),
          .RX_DEFER_RESET_BUF_EN       ("TRUE"),
          .RX_DFE_GAIN_CFG             (18'd135146),
          .RX_DFE_H2_CFG               (1'd0),
          .RX_DFE_H3_CFG               (7'd64),
          .RX_DFE_H4_CFG               (8'd240),
          .RX_DFE_H5_CFG               (8'd224),
          .RX_DFE_KL_CFG               (8'd254),
          .RX_DFE_KL_CFG2              (30'd806439084),
          .RX_DFE_LPM_CFG              (12'd2388),
          .RX_DFE_LPM_HOLD_DURING_EIDLE(1'd0),
          .RX_DFE_UT_CFG               (17'd73216),
          .RX_DFE_VP_CFG               (14'd16131),
          .RX_DFE_XYD_CFG              (1'd0),
          .RX_DISPERR_SEQ_MATCH        ("TRUE"),
          .RX_INT_DATAWIDTH            (1'd0),
          .RX_OS_CFG                   (8'd128),
          .RX_SIG_VALID_DLY            (4'd10),
          .RX_XCLK_SEL                 ("RXUSR"),
          .SAS_MAX_COM                 (7'd64),
          .SAS_MIN_COM                 (6'd36),
          .SATA_BURST_SEQ_LEN          (3'd5),
          .SATA_BURST_VAL              (3'd4),
          .SATA_CPLL_CFG               ("VCO_3000MHZ"),
          .SATA_EIDLE_VAL              (3'd4),
          .SATA_MAX_BURST              (4'd8),
          .SATA_MAX_INIT               (5'd21),
          .SATA_MAX_WAKE               (3'd7),
          .SATA_MIN_BURST              (3'd4),
          .SATA_MIN_INIT               (4'd12),
          .SATA_MIN_WAKE               (3'd4),
          .SHOW_REALIGN_COMMA          ("TRUE"),
          .SIM_CPLLREFCLK_SEL          ("FALSE"),
          .SIM_RECEIVER_DETECT_PASS    ("TRUE"),
          .SIM_RESET_SPEEDUP           ("FALSE"),
          .SIM_TX_EIDLE_DRIVE_LEVEL    ("X"),
          .SIM_VERSION                 ("4.0"),
          .TERM_RCAL_CFG               (5'd16),
          .TERM_RCAL_OVRD              (1'd0),
          .TRANS_TIME_RATE             (4'd14),
          .TST_RSV                     (1'd0),
          .TXBUF_EN                    ("TRUE"),
          .TXBUF_RESET_ON_RATE_CHANGE  ("TRUE"),
          .TXDLY_CFG                   (5'd31),
          .TXDLY_LCFG                  (6'd48),
          .TXDLY_TAP_CFG               (1'd0),
          .TXGEARBOX_EN                ("FALSE"),
          .TXOUT_DIV                   (4'd8),
          .TXPCSRESET_TIME             (1'd1),
          .TXPHDLY_CFG                 (20'd540704),
          .TXPH_CFG                    (11'd1920),
          .TXPH_MONITOR_SEL            (1'd0),
          .TXPMARESET_TIME             (1'd1),
          .TX_CLK25_DIV                (3'd5),
          .TX_CLKMUX_PD                (1'd1),
          .TX_DATA_WIDTH               (5'd20),
          .TX_DEEMPH0                  (1'd0),
          .TX_DEEMPH1                  (1'd0),
          .TX_DRIVE_MODE               ("DIRECT"),
          .TX_EIDLE_ASSERT_DELAY       (3'd6),
          .TX_EIDLE_DEASSERT_DELAY     (3'd4),
          .TX_INT_DATAWIDTH            (1'd0),
          .TX_LOOPBACK_DRIVE_HIZ       ("FALSE"),
          .TX_MAINCURSOR_SEL           (1'd0),
          .TX_MARGIN_FULL_0            (7'd78),
          .TX_MARGIN_FULL_1            (7'd73),
          .TX_MARGIN_FULL_2            (7'd69),
          .TX_MARGIN_FULL_3            (7'd66),
          .TX_MARGIN_FULL_4            (7'd64),
          .TX_MARGIN_LOW_0             (7'd70),
          .TX_MARGIN_LOW_1             (7'd68),
          .TX_MARGIN_LOW_2             (7'd66),
          .TX_MARGIN_LOW_3             (7'd64),
          .TX_MARGIN_LOW_4             (7'd64),
          .TX_PREDRIVER_MODE           (1'd0),
          .TX_QPI_STATUS_EN            (1'd0),
          .TX_RXDETECT_CFG             (13'd6194),
          .TX_RXDETECT_REF             (3'd4),
          .TX_XCLK_SEL                 ("TXOUT"),
          .UCODEER_CLR                 (1'd0)
      ) GTXE2_CHANNEL (
          // Inputs.
          .CFGRESET        (1'd0),
          .CLKRSVD         (1'd0),
          .CPLLLOCKDETCLK  (sys_clk),
          .CPLLLOCKEN      (1'd1),
          .CPLLPD          (1'd0),
          .CPLLREFCLKSEL   (1'd1),
          .CPLLRESET       (1'd0),
          .DRPADDR         (9'b0),
          .DRPCLK          (1'b0),
          .DRPDI           (16'd0),
          .DRPEN           (1'd0),
          .DRPWE           (1'd0),
          .EYESCANMODE     (1'd0),
          .EYESCANRESET    (1'd0),
          .EYESCANTRIGGER  (1'd0),
          .GTGREFCLK       (1'd0),
          .GTNORTHREFCLK0  (1'd0),
          .GTNORTHREFCLK1  (1'd0),
          .GTREFCLK0       (1'd0),
          .GTREFCLK1       (1'd0),
          .GTRESETSEL      (1'd0),
          .GTRSVD          (1'd0),
          .GTRXRESET       (sys_rst_n),
          .GTSOUTHREFCLK0  (1'd0),
          .GTSOUTHREFCLK1  (1'd0),
          .GTTXRESET       (sys_rst_n),
          .GTXRXN          (pci_exp_rxn[gtx_lane]),
          .GTXRXP          (pci_exp_rxp[gtx_lane]),
          .LOOPBACK        (3'd0),
          .PCSRSVDIN       (1'd0),
          .PCSRSVDIN2      (1'd0),
          .PMARSVDIN       (1'd0),
          .PMARSVDIN2      (1'd0),
          .QPLLCLK         (gpll_clk),
          .QPLLREFCLK      (gpll_refclk),
          .RESETOVRD       (1'd0),
          .RX8B10BEN       (1'd0),
          .RXBUFRESET      (1'd0),
          .RXCDRFREQRESET  (1'd0),
          .RXCDRHOLD       (1'd0),
          .RXCDROVRDEN     (1'd0),
          .RXCDRRESET      (1'd0),
          .RXCDRRESETRSV   (1'd0),
          .RXCHBONDEN      (1'd0),
          .RXCHBONDI       (1'd0),
          .RXCHBONDLEVEL   (1'd0),
          .RXCHBONDMASTER  (1'd0),
          .RXCHBONDSLAVE   (1'd0),
          .RXCOMMADETEN    (1'd1),
          .RXDDIEN         (1'd1),
          .RXDFEAGCHOLD    (1'd0),
          .RXDFEAGCOVRDEN  (1'd0),
          .RXDFECM1EN      (1'd0),
          .RXDFELFHOLD     (1'd0),
          .RXDFELFOVRDEN   (1'd1),
          .RXDFELPMRESET   (1'd0),
          .RXDFETAP2HOLD   (1'd0),
          .RXDFETAP2OVRDEN (1'd0),
          .RXDFETAP3HOLD   (1'd0),
          .RXDFETAP3OVRDEN (1'd0),
          .RXDFETAP4HOLD   (1'd0),
          .RXDFETAP4OVRDEN (1'd0),
          .RXDFETAP5HOLD   (1'd0),
          .RXDFETAP5OVRDEN (1'd0),
          .RXDFEUTHOLD     (1'd0),
          .RXDFEUTOVRDEN   (1'd0),
          .RXDFEVPHOLD     (1'd0),
          .RXDFEVPOVRDEN   (1'd0),
          .RXDFEVSEN       (1'd0),
          .RXDFEXYDEN      (1'd1),
          .RXDFEXYDHOLD    (1'd0),
          .RXDFEXYDOVRDEN  (1'd0),
          .RXDLYBYPASS     (1'd0),
          .RXDLYEN         (1'd0),
          .RXDLYOVRDEN     (1'd0),
          .RXDLYSRESET     (1'b0),
          .RXELECIDLEMODE  (2'd3),
          .RXGEARBOXSLIP   (1'd0),
          .RXLPMEN         (1'd0),
          .RXLPMHFHOLD     (1'd0),
          .RXLPMHFOVRDEN   (1'd0),
          .RXLPMLFHOLD     (1'd0),
          .RXLPMLFKLOVRDEN (1'd0),
          .RXMCOMMAALIGNEN (1'd0),
          .RXMONITORSEL    (1'd0),
          .RXOOBRESET      (1'd0),
          .RXOSHOLD        (1'd0),
          .RXOSOVRDEN      (1'd0),
          .RXOUTCLKSEL     (2'd2),
          .RXPCOMMAALIGNEN (1'd0),
          .RXPCSRESET      (1'd0),
          .RXPD            (2'b00),
          .RXPHALIGN       (1'd0),
          .RXPHALIGNEN     (1'd0),
          .RXPHDLYPD       (1'd0),
          .RXPHDLYRESET    (1'd0),
          .RXPHOVRDEN      (1'd0),
          .RXPMARESET      (1'd0),
          .RXPOLARITY      (1'b0),
          .RXPRBSCNTRESET  (1'd0),
          .RXPRBSSEL       (1'd0),
          .RXQPIEN         (1'd0),
          .RXRATE          (1'd0),
          .RXSLIDE         (1'd0),
          .RXSYSCLKSEL     (2'd3),
          .RXUSERRDY       (gtx_rx_init_Xxuserrdy0[gtx_lane]),
          .RXUSRCLK        (rx_clk),
          .RXUSRCLK2       (rx_clk),
          .SETERRSTATUS    (1'd0),
          .TSTIN           (20'd1048575),
          .TX8B10BBYPASS   (1'd0),
          .TX8B10BEN       (1'd0),
          .TXBUFDIFFCTRL   (3'd4),
          .TXCHARDISPMODE  (8'd0),
          .TXCHARDISPVAL   (8'd0),
          .TXCHARISK       (1'd0),
          .TXCOMINIT       (1'd0),
          .TXCOMSAS        (1'd0),
          .TXCOMWAKE       (1'd0),
          .TXDATA          (phy_txdata[gtx_lane*32+:32]),
          .TXDEEMPH        (1'd0),
          .TXDETECTRX      (1'd0),
          .TXDIFFCTRL      (4'b1000),
          .TXDIFFPD        (1'd0),
          .TXDLYBYPASS     (1'd1),
          .TXDLYEN         (1'd0),
          .TXDLYHOLD       (1'd0),
          .TXDLYOVRDEN     (1'd0),
          .TXDLYSRESET     (1'b0),
          .TXDLYUPDOWN     (1'd0),
          .TXELECIDLE      (1'd0),
          .TXHEADER        (1'd0),
          .TXINHIBIT       (1'b0),
          .TXMAINCURSOR    (1'd0),
          .TXMARGIN        (1'd0),
          .TXOUTCLKSEL     (2'd2),
          .TXPCSRESET      (1'd0),
          .TXPD            (2'b00),
          .TXPDELECIDLEMODE(1'd0),
          .TXPHALIGN       (1'd0),
          .TXPHALIGNEN     (1'd0),
          .TXPHDLYPD       (1'd0),
          .TXPHDLYRESET    (1'd0),
          .TXPHDLYTSTCLK   (1'd0),
          .TXPHINIT        (1'd0),
          .TXPHOVRDEN      (1'd0),
          .TXPISOPD        (1'd0),
          .TXPMARESET      (1'd0),
          .TXPOLARITY      (1'b0),
          .TXPOSTCURSOR    (5'b00000),
          .TXPOSTCURSORINV (1'b0),
          .TXPRBSFORCEERR  (1'd0),
          .TXPRBSSEL       (1'd0),
          .TXPRECURSOR     (5'd0),
          .TXPRECURSORINV  (1'b0),
          .TXQPIBIASEN     (1'd0),
          .TXQPISTRONGPDOWN(1'd0),
          .TXQPIWEAKPUP    (1'd0),
          .TXRATE          (1'd0),
          .TXSEQUENCE      (1'd0),
          .TXSTARTSEQ      (1'd0),
          .TXSWING         (1'd0),
          .TXSYSCLKSEL     (2'd3),
          .TXUSERRDY       (gtx_tx_init_Xxuserrdy0),
          .TXUSRCLK        (tx_clk),
          .TXUSRCLK2       (tx_clk),

          // Outputs.
          .CPLLFBCLKLOST   (gtx0),
          .CPLLLOCK        (gtx1),
          .CPLLREFCLKLOST  (gtx2),
          .DMONITOROUT     (gtx5),
          .DRPDO           (gtx_drp_mux_do),
          .DRPRDY          (gtx_drp_mux_rdy),
          .EYESCANDATAERROR(gtx8),
          .GTREFCLKMONITOR (gtx4),
          .GTXTXN          (pci_exp_txn),
          .GTXTXP          (pci_exp_txp),
          .PCSRSVDOUT      (gtx39),
          .PHYSTATUS       (gtx6),
          .RXBUFSTATUS     (gtx13),
          .RXBYTEISALIGNED (gtx17),
          .RXBYTEREALIGN   (gtx18),
          .RXCDRLOCK       (gtx9),
          .RXCHANBONDSEQ   (gtx20),
          .RXCHANISALIGNED (gtx22),
          .RXCHANREALIGN   (gtx23),
          .RXCHARISCOMMA   (gtx36),
          .RXCHARISK       ({gtx_rxdata[18], gtx_rxdata[8]}),
          .RXCHBONDO       (gtx21),
          .RXCLKCORCNT     (gtx10),
          .RXCOMINITDET    (gtx34),
          .RXCOMMADET      (gtx19),
          .RXCOMSASDET     (gtx32),
          .RXCOMWAKEDET    (gtx33),
          .RXDATA          (phy_rxdata[gtx_lane*32+:32]),
          .RXDATAVALID     (gtx28),
          .RXDISPERR       (),
          .RXDLYSRESETDONE (),
          .RXELECIDLE      (phy_rxelecidle),
          .RXHEADER        (phy_rxsync_header),
          .RXHEADERVALID   (),
          .RXMONITOROUT    (),
          .RXNOTINTABLE    (),
          .RXOUTCLK        (),
          .RXOUTCLKFABRIC  (),
          .RXOUTCLKPCS     (),
          .RXPHALIGNDONE   (),
          .RXPHMONITOR     (),
          .RXPHSLIPMONITOR (),
          .RXPRBSERR       (),
          .RXQPISENN       (),
          .RXQPISENP       (),
          .RXRATEDONE      (),
          .RXRESETDONE     (),
          .RXSTARTOFSEQ    (phy_rxstart_block),
          .RXSTATUS        (phy_rxstatus),
          .RXVALID         (phy_rxvalid),
          .TSTOUT          (),
          .TXBUFSTATUS     (),
          .TXCOMFINISH     (),
          .TXDLYSRESETDONE (),
          .TXGEARBOXREADY  (),
          .TXOUTCLK        (gtx_txoutclk),
          .TXOUTCLKFABRIC  (),
          .TXOUTCLKPCS     (),
          .TXPHALIGNDONE   (),
          .TXPHINITDONE    (),
          .TXQPISENN       (),
          .TXQPISENP       (),
          .TXRATEDONE      (),
          .TXRESETDONE     (gtx_tx_init_Xxresetdone0)
      );
    end
  endgenerate

endmodule
