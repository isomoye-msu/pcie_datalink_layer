module pcie_top_gtx #(

    parameter         [ 4:0] PL_LINK_CAP_MAX_LINK_WIDTH    = 5'd1,
    parameter                EXTERNAL_MMCM                 = "FALSE",
    parameter integer        LANES                         = PL_LINK_CAP_MAX_LINK_WIDTH,
    parameter integer        DW                            = 64,
    parameter         [ 1:0] CRM_USER_CLK_FREQ             = 2'b11,
    parameter                CRM_MCAP_CLK_FREQ             = 1'b0,
    parameter                CRM_CORE_CLK_FREQ_500         = "TRUE",
    parameter         [15:0] RBAR_CAP_ID                   = 16'h0015,
    parameter         [11:0] RBAR_CAP_NEXTPTR              = 12'h000,
    parameter         [ 3:0] RBAR_CAP_VERSION              = 4'h1,
    parameter                PCIE_USE_MODE                 = "1.0",
    parameter                PCIE_GT_DEVICE                = "GTX",
    parameter                PL_AUTO_CONFIG                = 0,
    parameter                ENABLE_JTAG_DBG               = "FALSE",
    parameter                PL_FAST_TRAIN                 = "FALSE",
    parameter                PCIE_EXT_CLK                  = "TRUE",
    parameter                PCIE_EXT_GT_COMMON            = "FALSE",
    parameter                EXT_CH_GT_DRP                 = "FALSE",
    parameter                TRANSCEIVER_CTRL_STATUS_PORTS = "FALSE",
    parameter                SHARED_LOGIC_IN_CORE          = "FALSE",
    parameter                PCIE_CHAN_BOND                = 1,
    parameter                TX_MARGIN_FULL_0              = 7'b1001111,
    parameter                TX_MARGIN_FULL_1              = 7'b1001110,
    parameter                TX_MARGIN_FULL_2              = 7'b1001101,
    parameter                TX_MARGIN_FULL_3              = 7'b1001100,
    parameter                TX_MARGIN_FULL_4              = 7'b1000011,
    parameter                TX_MARGIN_LOW_0               = 7'b1000101,
    parameter                TX_MARGIN_LOW_1               = 7'b1000110,
    parameter                TX_MARGIN_LOW_2               = 7'b1000011,
    parameter                TX_MARGIN_LOW_3               = 7'b1000010,
    parameter                TX_MARGIN_LOW_4               = 7'b1000000,

    parameter REF_CLK_FREQ = 0,  // 0 - 100 MHz, 1 - 125 MHz, 2 - 250 MHz
    parameter USER_CLK_FREQ = 1,
    parameter USER_CLK2_DIV2 = "FALSE",
    parameter AXISTEN_IF_EXT_512_INTFC_RAM_STYLE = "BRAM",
    parameter FPGA_FAMILY = "USM",
    parameter FPGA_XCVR = "H",
    parameter [1:0] PL_SIM_FAST_LINK_TRAINING = 2'h3,
    parameter [3:0] PL_LINK_CAP_MAX_LINK_SPEED = 4'b0100,

    parameter PHY_REFCLK_FREQ = 0,
    parameter PF0_LINK_STATUS_SLOT_CLOCK_CONFIG = "TRUE",
    parameter PHY_LP_TXPRESET = 4,

    parameter PCIE_PLL_SEL       = "CPLL",
    parameter PCIE_ASYNC_EN      = "FALSE",
    parameter PCIE_TXBUF_EN      = "TRUE",
    parameter PL_INTERFACE       = "FALSE",
    parameter CFG_MGMT_IF        = "FALSE",
    parameter CFG_CTL_IF         = "TRUE",
    parameter CFG_STATUS_IF      = "TRUE",
    parameter RCV_MSG_IF         = "FALSE",
    parameter CFG_FC_IF          = "FALSE",
    parameter EXT_PIPE_INTERFACE = "FALSE"


) (

    output [(PL_LINK_CAP_MAX_LINK_WIDTH - 1) : 0] pci_exp_txp,
    output [(PL_LINK_CAP_MAX_LINK_WIDTH - 1) : 0] pci_exp_txn,
    input  [(PL_LINK_CAP_MAX_LINK_WIDTH - 1) : 0] pci_exp_rxp,
    input  [(PL_LINK_CAP_MAX_LINK_WIDTH - 1) : 0] pci_exp_rxn,

    //pipe interface input
    // input  logic [( MAX_NUM_LANES* DATA_WIDTH)-1:0] phy_rxdata,
    // input  logic [               MAX_NUM_LANES-1:0] phy_rxdata_valid,
    // input  logic [           (4*MAX_NUM_LANES)-1:0] phy_rxdatak,
    // input  logic [               MAX_NUM_LANES-1:0] phy_rxstart_block,
    // input  logic [           (2*MAX_NUM_LANES)-1:0] phy_rxsync_header,

    // synthesis translate_off
    output led_0,
    output led_1,
    output led_2,
    output led_3,

    //TLP AXIS output
    // output logic [DATA_WIDTH-1:0] m_tlp_axis_tdata,
    // output logic [KEEP_WIDTH-1:0] m_tlp_axis_tkeep,
    // output logic                  m_tlp_axis_tvalid,
    // output logic                  m_tlp_axis_tlast,
    // output logic [USER_WIDTH-1:0] m_tlp_axis_tuser,
    // input  logic                  m_tlp_axis_tready,
    // output led_4,
    // output led_5,
    // output led_6,
    // output led_7,
    // synthesis translate_on   

    // synthesis translate_off
    // input phy_ready_en,  // 0 = Power Down; 1 = Power Up. Power On state = 0
    // input gen1_en,       // 1 = Enter Gen1 Operation; 1->0 Exit to Gen1
    // input gen2_en,       // 1 = Enter Gen2 Operation; 1->0 Exit to Gen1
    // input gen3_en,       // 1 = Enter Gen3 Operation; 1->0 Exit to Gen1
    // input gen4_en,       // 1 = Enter Gen4 Operation; 1->0 Exit to Gen1
    // input tx_elec_idle,  // 0 = No Tx EI; 1 = Tx EI. 
    // synthesis translate_on   

    input sys_clk_p,
    input sys_clk_n,
    input sys_rst_n

);


  wire sys_clk;



  //------------------------------------------------------------------------------
  // Instance IBUFDS of IBUFDS Module.
  //------------------------------------------------------------------------------
  IBUFDS IBUFDS (
      // Inputs.
      .I (sys_clk_p),
      .IB(sys_clk_n),

      // Outputs.
      .O(sys_clk)
  );

  // Parameters
  localparam CLK_RATE = 100;
  localparam MAX_NUM_LANES = 1;
  parameter [5:0] LINK_CAP_MAX_LINK_WIDTH = MAX_NUM_LANES;
  localparam DATA_WIDTH = 32;
  localparam STRB_WIDTH = DATA_WIDTH / 8;
  localparam KEEP_WIDTH = STRB_WIDTH;
  localparam USER_WIDTH = 5;
  localparam IS_ROOT_PORT = 1;
  localparam LINK_NUM = 0;
  localparam IS_UPSTREAM = 0;
  localparam CROSSLINK_EN = 0;
  localparam UPCONFIG_EN = 0;


  localparam APP_DATA_WIDTH = 64;
  localparam APP_STRB_WIDTH = APP_DATA_WIDTH / 8;
  localparam APP_KEEP_WIDTH = APP_STRB_WIDTH;
  localparam APP_USER_WIDTH = 5;


  // ICAP interface - wire up to user app if ICAP access required
  wire [                              31:0] icap_i;
  wire                                      icap_csib;
  wire                                      icap_rdwrb;
  wire [                              31:0] icap_o;
  //Ports
  //   reg clk_i;
  //   reg rst_i;
  //   reg en_i;
  wire                                      fc_initialized_o;
  wire [  ( MAX_NUM_LANES* DATA_WIDTH)-1:0] phy_txdata;
  wire [                 MAX_NUM_LANES-1:0] phy_txdata_valid;
  wire [             (4*MAX_NUM_LANES)-1:0] phy_txdatak;
  wire [                 MAX_NUM_LANES-1:0] phy_txstart_block;
  wire [             (2*MAX_NUM_LANES)-1:0] phy_txsync_header;
  wire [  ( MAX_NUM_LANES* DATA_WIDTH)-1:0] phy_rxdata;
  wire [                 MAX_NUM_LANES-1:0] phy_rxdata_valid;
  wire [             (4*MAX_NUM_LANES)-1:0] phy_rxdatak;
  wire [                 MAX_NUM_LANES-1:0] phy_rxstart_block;
  wire [             (2*MAX_NUM_LANES)-1:0] phy_rxsync_header;
  wire                                      phy_txdetectrx;
  wire [                 MAX_NUM_LANES-1:0] phy_txelecidle;
  wire [                 MAX_NUM_LANES-1:0] phy_txcompliance;
  wire [                 MAX_NUM_LANES-1:0] phy_rxpolarity;
  wire [                               1:0] phy_powerdown;
  wire [                               2:0] phy_rate;
  wire [                 MAX_NUM_LANES-1:0] phy_rxvalid;
  wire [                 MAX_NUM_LANES-1:0] phy_phystatus;
  wire                                      phy_phystatus_rst;
  wire [                 MAX_NUM_LANES-1:0] phy_rxelecidle;
  wire [             (MAX_NUM_LANES*3)-1:0] phy_rxstatus;
  wire [                               2:0] phy_txmargin;
  wire                                      phy_txswing;
  wire                                      phy_txdeemph;
  wire [             (MAX_NUM_LANES*2)-1:0] phy_txeq_ctrl;
  wire [             (MAX_NUM_LANES*4)-1:0] phy_txeq_preset;
  wire [             (MAX_NUM_LANES*6)-1:0] phy_txeq_coeff;
  wire [                               5:0] phy_txeq_fs;
  wire [                               5:0] phy_txeq_lf;
  wire [            (MAX_NUM_LANES*18)-1:0] phy_txeq_new_coeff;
  wire [                 MAX_NUM_LANES-1:0] phy_txeq_done;
  wire [             (MAX_NUM_LANES*2)-1:0] phy_rxeq_ctrl;
  wire [             (MAX_NUM_LANES*4)-1:0] phy_rxeq_txpreset;
  wire [                 MAX_NUM_LANES-1:0] phy_rxeq_preset_sel;
  wire [            (MAX_NUM_LANES*18)-1:0] phy_rxeq_new_txcoeff;
  wire [                 MAX_NUM_LANES-1:0] phy_rxeq_adapt_done;
  wire [                 MAX_NUM_LANES-1:0] phy_rxeq_done;
  wire [                             8-1:0] pipe_width_o;
  wire                                      as_mac_in_detect;
  wire                                      as_cdr_hold_req;
  wire [                               7:0] ltssm_debug_state;
  wire                                      tx_elec_idle;
  wire                                      phy_ready_en;


  wire [                    DATA_WIDTH-1:0] s_tlp_axis_tdata;
  wire [                    DATA_WIDTH-1:0] s_tlp_axis_byte_swap_tdata;
  wire [                    KEEP_WIDTH-1:0] s_tlp_axis_tkeep;
  wire                                      s_tlp_axis_tvalid;
  wire                                      s_tlp_axis_tlast;
  wire [                    USER_WIDTH-1:0] s_tlp_axis_tuser;
  wire                                      s_tlp_axis_tready;

  wire [                    DATA_WIDTH-1:0] m_tlp_axis_tdata;
  wire [                    DATA_WIDTH-1:0] m_tlp_axis_byte_swap_tdata;
  wire [                    KEEP_WIDTH-1:0] m_tlp_axis_tkeep;
  wire                                      m_tlp_axis_tvalid;
  wire                                      m_tlp_axis_tlast;
  wire [                    USER_WIDTH-1:0] m_tlp_axis_tuser;
  wire                                      m_tlp_axis_tready;



  wire [(PL_LINK_CAP_MAX_LINK_WIDTH*5)-1:0] txeq_precursor_o;
  wire [(PL_LINK_CAP_MAX_LINK_WIDTH*5)-1:0] txeq_postcursor_o;
  wire [    PL_LINK_CAP_MAX_LINK_WIDTH-1:0] gt_pcierategen3_o;
  wire [                               1:0] pipe_tx_rate_o;
  wire                                      pipe_tx0_rcvr_det;
  wire [                               1:0] pipe_tx0_powerdown;


  wire [                APP_DATA_WIDTH-1:0] s_app_axis_tdata;
  wire [                APP_KEEP_WIDTH-1:0] s_app_axis_tkeep;
  wire                                      s_app_axis_tvalid;
  wire                                      s_app_axis_tlast;
  wire [                APP_USER_WIDTH-1:0] s_app_axis_tuser;
  wire                                      s_app_axis_tready;

  wire [                APP_DATA_WIDTH-1:0] m_app_axis_tdata;
  wire [                APP_KEEP_WIDTH-1:0] m_app_axis_tkeep;
  wire                                      m_app_axis_tvalid;
  wire                                      m_app_axis_tlast;
  wire [                APP_USER_WIDTH-1:0] m_app_axis_tuser;
  wire                                      m_app_axis_tready;
  localparam USERCLK2_FREQ   =  (USER_CLK2_DIV2 == "FALSE") ? USER_CLK_FREQ :
										(USER_CLK_FREQ == 4) ? 3 :
										(USER_CLK_FREQ == 3) ? 2 :
										 USER_CLK_FREQ;
  // GT to PIPE

  reg  [MAX_NUM_LANES-1:0] gtx_rx_init_Xxuserrdy0;

  wire                     clock_locked;
  wire                     pipe_mmcm_rst_n;

  wire                     PIPE_PCLK_IN;
  wire                     PIPE_USERCLK1_IN;
  wire                     PIPE_USERCLK2_IN;

  wire [              4:0] gt_reset_fsm;

  reg                      reg_clock_locked;

  //-------------------------------------------------------
  // 3. Configuration (CFG) Interface
  //-------------------------------------------------------
  wire                     cfg_err_cor;
  wire                     cfg_err_ur;
  wire                     cfg_err_ecrc;
  wire                     cfg_err_cpl_timeout;
  wire                     cfg_err_cpl_abort;
  wire                     cfg_err_cpl_unexpect;
  wire                     cfg_err_posted;
  wire                     cfg_err_locked;
  wire [             47:0] cfg_err_tlp_cpl_header;
  wire                     cfg_interrupt;
  wire                     cfg_interrupt_assert;
  wire [              7:0] cfg_interrupt_di;
  wire                     cfg_interrupt_stat;
  wire [              4:0] cfg_pciecap_interrupt_msgnum;
  wire                     cfg_turnoff_ok;
  wire                     cfg_to_turnoff;
  wire                     cfg_trn_pending;
  wire                     cfg_pm_halt_aspm_l0s;
  wire                     cfg_pm_halt_aspm_l1;
  wire                     cfg_pm_force_state_en;
  wire [              1:0] cfg_pm_force_state;
  wire                     cfg_pm_wake;
  wire [              7:0] cfg_bus_number;
  wire [              4:0] cfg_device_number;
  wire [              2:0] cfg_function_number;
  wire [             63:0] cfg_dsn;
  wire [            127:0] cfg_err_aer_headerlog;
  wire [              4:0] cfg_aer_interrupt_msgnum;

  wire [             31:0] cfg_mgmt_di;
  wire [              3:0] cfg_mgmt_byte_en;
  wire [              9:0] cfg_mgmt_dwaddr;
  wire                     cfg_mgmt_wr_en;
  wire                     cfg_mgmt_rd_en;
  wire                     cfg_mgmt_wr_readonly;



  // assign cfg_bus_number      = 8'd0;
  // assign cfg_device_number   = 8'd0;
  // assign cfg_function_number = 8'd0;

  //-------------------------------------------------------
  // 4. Physical Layer Control and Status (PL) Interface
  //-------------------------------------------------------

  wire                     pl_directed_link_auton;
  wire [              1:0] pl_directed_link_change;
  wire                     pl_directed_link_speed;
  wire [              1:0] pl_directed_link_width;
  wire                     pl_upstream_prefer_deemph;

  wire                     sys_rst_n_c;

  // Wires used for external clocking connectivity
  wire                     pipe_pclk_in;
  wire                     pipe_rxusrclk_in;
  wire [              7:0] pipe_rxoutclk_in;
  wire                     pipe_dclk_in;
  wire                     pipe_userclk1_in;
  wire                     pipe_userclk2_in;
  wire                     pipe_mmcm_lock_in;

  wire                     pipe_txoutclk_out;
  wire [              7:0] pipe_rxoutclk_out;
  wire [              7:0] pipe_pclk_sel_out;
  wire                     pipe_gen3_out;
  wire                     pipe_oobclk_in;

  wire                     rx_np_req;

  // Flow Control
  wire [              2:0] fc_sel;

  wire                     link_up;

  wire                     PIPE_TXOUTCLK_OUT;
  wire                     PIPE_DCLK_IN;
  wire                     PIPE_MMCM_LOCK_IN;
  wire                     PIPE_RXUSRCLK_IN;
  wire                     PIPE_OOBCLK_IN;


  wire                     trn_lnk_up;
  reg                      user_reset_int;
  reg                      bridge_reset_int;
  reg                      bridge_reset_d;
  // reg                      phy_rdy_n;
  wire                     user_clk_out;  // actually is user_clk2
  reg                      user_reset_out;
  reg                      user_lnk_up;

  // PIPE Interface Wires
  wire                     phy_rdy_n;
  wire                     pipe_rx0_polarity_gt;
  wire                     pipe_rx1_polarity_gt;
  wire                     pipe_rx2_polarity_gt;
  wire                     pipe_rx3_polarity_gt;
  wire                     pipe_rx4_polarity_gt;
  wire                     pipe_rx5_polarity_gt;
  wire                     pipe_rx6_polarity_gt;
  wire                     pipe_rx7_polarity_gt;
  wire                     pipe_tx_deemph_gt;
  wire [              2:0] pipe_tx_margin_gt;
  wire                     pipe_tx_rate_gt;
  wire                     pipe_tx_rcvr_det_gt;
  wire [              1:0] pipe_tx0_char_is_k_gt;
  wire                     pipe_tx0_compliance_gt;
  wire [             15:0] pipe_tx0_data_gt;
  wire                     pipe_tx0_elec_idle_gt;
  wire [              1:0] pipe_tx0_powerdown_gt;
  wire [              1:0] pipe_tx1_char_is_k_gt;
  wire                     pipe_tx1_compliance_gt;
  wire [             15:0] pipe_tx1_data_gt;
  wire                     pipe_tx1_elec_idle_gt;
  wire [              1:0] pipe_tx1_powerdown_gt;
  wire [              1:0] pipe_tx2_char_is_k_gt;
  wire                     pipe_tx2_compliance_gt;
  wire [             15:0] pipe_tx2_data_gt;
  wire                     pipe_tx2_elec_idle_gt;
  wire [              1:0] pipe_tx2_powerdown_gt;
  wire [              1:0] pipe_tx3_char_is_k_gt;
  wire                     pipe_tx3_compliance_gt;
  wire [             15:0] pipe_tx3_data_gt;
  wire                     pipe_tx3_elec_idle_gt;
  wire [              1:0] pipe_tx3_powerdown_gt;
  wire [              1:0] pipe_tx4_char_is_k_gt;
  wire                     pipe_tx4_compliance_gt;
  wire [             15:0] pipe_tx4_data_gt;
  wire                     pipe_tx4_elec_idle_gt;
  wire [              1:0] pipe_tx4_powerdown_gt;
  wire [              1:0] pipe_tx5_char_is_k_gt;
  wire                     pipe_tx5_compliance_gt;
  wire [             15:0] pipe_tx5_data_gt;
  wire                     pipe_tx5_elec_idle_gt;
  wire [              1:0] pipe_tx5_powerdown_gt;
  wire [              1:0] pipe_tx6_char_is_k_gt;
  wire                     pipe_tx6_compliance_gt;
  wire [             15:0] pipe_tx6_data_gt;
  wire                     pipe_tx6_elec_idle_gt;
  wire [              1:0] pipe_tx6_powerdown_gt;
  wire [              1:0] pipe_tx7_char_is_k_gt;
  wire                     pipe_tx7_compliance_gt;
  wire [             15:0] pipe_tx7_data_gt;
  wire                     pipe_tx7_elec_idle_gt;
  wire [              1:0] pipe_tx7_powerdown_gt;

  wire                     pipe_rx0_chanisaligned_gt;
  wire [              1:0] pipe_rx0_char_is_k_gt;
  wire [             15:0] pipe_rx0_data_gt;
  wire                     pipe_rx0_elec_idle_gt;
  wire                     pipe_rx0_phy_status_gt;
  wire [              2:0] pipe_rx0_status_gt;
  wire                     pipe_rx0_valid_gt;
  wire                     pipe_rx1_chanisaligned_gt;
  wire [              1:0] pipe_rx1_char_is_k_gt;
  wire [             15:0] pipe_rx1_data_gt;
  wire                     pipe_rx1_elec_idle_gt;
  wire                     pipe_rx1_phy_status_gt;
  wire [              2:0] pipe_rx1_status_gt;
  wire                     pipe_rx1_valid_gt;
  wire                     pipe_rx2_chanisaligned_gt;
  wire [              1:0] pipe_rx2_char_is_k_gt;
  wire [             15:0] pipe_rx2_data_gt;
  wire                     pipe_rx2_elec_idle_gt;
  wire                     pipe_rx2_phy_status_gt;
  wire [              2:0] pipe_rx2_status_gt;
  wire                     pipe_rx2_valid_gt;
  wire                     pipe_rx3_chanisaligned_gt;
  wire [              1:0] pipe_rx3_char_is_k_gt;
  wire [             15:0] pipe_rx3_data_gt;
  wire                     pipe_rx3_elec_idle_gt;
  wire                     pipe_rx3_phy_status_gt;
  wire [              2:0] pipe_rx3_status_gt;
  wire                     pipe_rx3_valid_gt;
  wire                     pipe_rx4_chanisaligned_gt;
  wire [              1:0] pipe_rx4_char_is_k_gt;
  wire [             15:0] pipe_rx4_data_gt;
  wire                     pipe_rx4_elec_idle_gt;
  wire                     pipe_rx4_phy_status_gt;
  wire [              2:0] pipe_rx4_status_gt;
  wire                     pipe_rx4_valid_gt;
  wire                     pipe_rx5_chanisaligned_gt;
  wire [              1:0] pipe_rx5_char_is_k_gt;
  wire [             15:0] pipe_rx5_data_gt;
  wire                     pipe_rx5_elec_idle_gt;
  wire                     pipe_rx5_phy_status_gt;
  wire [              2:0] pipe_rx5_status_gt;
  wire                     pipe_rx5_valid_gt;
  wire                     pipe_rx6_chanisaligned_gt;
  wire [              1:0] pipe_rx6_char_is_k_gt;
  wire [             15:0] pipe_rx6_data_gt;
  wire                     pipe_rx6_elec_idle_gt;
  wire                     pipe_rx6_phy_status_gt;
  wire [              2:0] pipe_rx6_status_gt;
  wire                     pipe_rx6_valid_gt;
  wire                     pipe_rx7_chanisaligned_gt;
  wire [              1:0] pipe_rx7_char_is_k_gt;
  wire [             15:0] pipe_rx7_data_gt;
  wire                     pipe_rx7_elec_idle_gt;
  wire                     pipe_rx7_phy_status_gt;
  wire [              2:0] pipe_rx7_status_gt;
  wire                     pipe_rx7_valid_gt;
  wire [              3:0] cfg_link_status_negotiated_width;
  wire [              1:0] cfg_link_status_current_speed;


  (* ASYNC_REG = "TRUE" *)reg                      user_lnk_up_mux;
  (* KEEP = "TRUE", ASYNC_REG = "TRUE" *)reg                      user_lnk_up_int;
  // reg                      user_reset_int;

  reg                      bridge_reset_int;
  reg                      bridge_reset_d;
  wire                     user_rst_n;
  reg                      pl_received_hot_rst_q;
  wire                     pl_received_hot_rst_wire;
  wire                     pl_received_hot_rst_sync;
  reg                      pl_phy_lnk_up_q;
  wire                     pl_phy_lnk_up_wire;
  wire                     pl_phy_lnk_up_sync;
  wire                     sys_or_hot_rst;
  // wire                     trn_lnk_up;

  wire [              5:0] pl_ltssm_state_int;
  wire                     user_app_rdy_req;

  localparam TCQ = 100;
  localparam ENABLE_FAST_SIM_TRAINING = "TRUE";

  // assign user_lnk_up = user_lnk_up_int;
  assign user_clk_out = sys_clk;


  assign user_app_rdy = 1'b1;
  assign pl_ltssm_state = pl_ltssm_state_int;
  assign pl_phy_lnk_up = pl_phy_lnk_up_q;
  assign pl_received_hot_rst = pl_received_hot_rst_q;

  // CDC on PCIe block outputs The source clock of these pins is in
  // the pipe_clk domain.
  xpm_cdc_single #(
      .DEST_SYNC_FF (2),
      .SRC_INPUT_REG(0)
  ) phy_lnk_up_cdc (
      .src_clk (pipe_clk),
      .src_in  (pl_phy_lnk_up_wire),
      .dest_clk(user_clk_out),
      .dest_out(pl_phy_lnk_up_sync)
  );
  xpm_cdc_single #(
      .DEST_SYNC_FF (2),
      .SRC_INPUT_REG(0)
  ) pl_received_hot_rst_cdc (
      .src_clk (pipe_clk),
      .src_in  (pl_received_hot_rst_wire),
      .dest_clk(user_clk_out),
      .dest_out(pl_received_hot_rst_sync)
  );

  // Register block outputs pl_received_hot_rst and phy_lnk_up to ease timing on block output
  assign sys_or_hot_rst = !sys_rst_n || pl_received_hot_rst_q;
  always @(posedge user_clk_out) begin
    if (!sys_rst_n) begin
      pl_received_hot_rst_q <= #TCQ 1'b0;
      pl_phy_lnk_up_q       <= #TCQ 1'b0;
    end else begin
      pl_received_hot_rst_q <= #TCQ pl_received_hot_rst_sync;
      pl_phy_lnk_up_q       <= #TCQ pl_phy_lnk_up_sync;
    end
  end
  // Generate user_lnk_up_mux
  always @(posedge user_clk_out) begin
    if (!sys_rst_n) begin
      user_lnk_up_mux <= #TCQ 1'b0;
    end else begin
      user_lnk_up_mux <= #TCQ user_lnk_up_int;
    end
  end

  always @(posedge user_clk_out) begin
    if (!sys_rst_n) begin
      user_lnk_up_int <= #TCQ 1'b0;
    end else begin
      user_lnk_up_int <= #TCQ trn_lnk_up;
    end
  end


  // Generate user_reset_out                                                                                          //
  // Once user reset output of PCIE and Phy Layer is active, de-assert reset                                          //
  // Only assert reset if system reset or hot reset is seen.  Keep AXI backend/user application alive otherwise       //
  //------------------------------------------------------------------------------------------------------------------//

  always @(posedge user_clk_out or posedge sys_or_hot_rst) begin
    if (sys_or_hot_rst) begin
      user_reset_int <= #TCQ 1'b1;
    end else if (user_rst_n && pl_phy_lnk_up_q) begin
      user_reset_int <= #TCQ 1'b0;
    end
  end

  // Invert active low reset to active high AXI reset
  always @(posedge user_clk_out or posedge sys_or_hot_rst) begin
    if (sys_or_hot_rst) begin
      user_reset_out <= #TCQ 1'b1;
    end else begin
      user_reset_out <= #TCQ user_reset_int;
    end
  end
  always @(posedge user_clk_out or posedge sys_or_hot_rst) begin
    if (sys_or_hot_rst) begin
      bridge_reset_int <= #TCQ 1'b1;
    end else if (user_rst_n && pl_phy_lnk_up_q) begin
      bridge_reset_int <= #TCQ 1'b0;
    end
  end

  // Invert active low reset to active high AXI reset
  always @(posedge user_clk_out or posedge sys_or_hot_rst) begin
    if (sys_or_hot_rst) begin
      bridge_reset_d <= #TCQ 1'b1;
    end else begin
      bridge_reset_d <= #TCQ bridge_reset_int;
    end
  end

  assign m_tlp_axis_byte_swap_tdata[7:0]   = m_tlp_axis_tdata[31:24];
  assign m_tlp_axis_byte_swap_tdata[15:8]  = m_tlp_axis_tdata[23:16];
  assign m_tlp_axis_byte_swap_tdata[23:16] = m_tlp_axis_tdata[15:8];
  assign m_tlp_axis_byte_swap_tdata[31:24] = m_tlp_axis_tdata[7:0];


  assign s_tlp_axis_byte_swap_tdata[7:0]   = s_tlp_axis_tdata[31:24];
  assign s_tlp_axis_byte_swap_tdata[15:8]  = s_tlp_axis_tdata[23:16];
  assign s_tlp_axis_byte_swap_tdata[23:16] = s_tlp_axis_tdata[15:8];
  assign s_tlp_axis_byte_swap_tdata[31:24] = s_tlp_axis_tdata[7:0];

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
      .clk_i            (sys_clk),
      .rst_i            (!sys_rst_n),
      .en_i             (1'b1),
      .pipe_rx_usr_clk_i(PIPE_RXUSRCLK_IN),
      .pipe_tx_usr_clk_i(PIPE_TXOUTCLK_OUT),
      .fc_initialized_o (fc_initialized_o),
      .phy_txdata       (phy_txdata),
      .phy_txdata_valid (phy_txdata_valid),
      .phy_txdatak      (phy_txdatak),
      .phy_txstart_block(phy_txstart_block),
      .phy_txsync_header(phy_txsync_header),
      .phy_rxdata       (phy_rxdata),
      .phy_rxdata_valid (phy_rxdata_valid),
      .phy_rxdatak      (phy_rxdatak),
      .phy_rxstart_block(phy_rxstart_block),
      .phy_rxsync_header(phy_rxsync_header),
      .phy_txdetectrx   (phy_txdetectrx),
      .phy_txelecidle   (phy_txelecidle),
      .phy_txcompliance (phy_txcompliance),
      .phy_rxpolarity   (phy_rxpolarity),
      .phy_powerdown    (phy_powerdown),

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

      .cfg_bus_number_o     (cfg_bus_number),
      .cfg_device_number_o  (cfg_device_number),
      .cfg_function_number_o(cfg_function_number),

      .pipe_width_o     (pipe_width_o),
      .as_mac_in_detect (as_mac_in_detect),
      .as_cdr_hold_req  (as_cdr_hold_req),
      .ltssm_debug_state(ltssm_debug_state),
      .tx_elec_idle     (tx_elec_idle),
      .phy_ready_en     (phy_ready_en),
      .link_up_o        (link_up),
      //tlp inputs
      .s_tlp_axis_tdata (s_tlp_axis_byte_swap_tdata),
      .s_tlp_axis_tkeep (s_tlp_axis_tkeep),
      .s_tlp_axis_tvalid(s_tlp_axis_tvalid),
      .s_tlp_axis_tlast (s_tlp_axis_tlast),
      .s_tlp_axis_tuser (s_tlp_axis_tuser),
      .s_tlp_axis_tready(s_tlp_axis_tready),
      //tlp outputs
      .m_tlp_axis_tdata (m_tlp_axis_tdata),
      .m_tlp_axis_tkeep (m_tlp_axis_tkeep),
      .m_tlp_axis_tvalid(m_tlp_axis_tvalid),
      .m_tlp_axis_tlast (m_tlp_axis_tlast),
      .m_tlp_axis_tuser (m_tlp_axis_tuser),
      .m_tlp_axis_tready(m_tlp_axis_tready)
  );

  wire tx_cfg_gnt;
  wire rx_np_ok;
  wire cfg_err_atomic_egress_blocked;
  wire cfg_err_malformed;
  wire cfg_err_mc_blocked;
  wire cfg_err_poisoned;
  wire cfg_err_norecovery;
  wire cfg_err_acs;
  wire cfg_err_internal_uncor;
  wire cfg_err_internal_cor;





  axis_adapter #(
      .S_DATA_WIDTH (APP_DATA_WIDTH),
      .S_KEEP_ENABLE(1'b1),
      .S_KEEP_WIDTH (APP_KEEP_WIDTH),
      .M_DATA_WIDTH (DATA_WIDTH),
      .M_KEEP_ENABLE(1'b1),
      .M_KEEP_WIDTH (KEEP_WIDTH),
      .ID_ENABLE    (1'b0),
      .ID_WIDTH     (1),
      .DEST_ENABLE  (1'b0),
      .DEST_WIDTH   (1),
      .USER_ENABLE  (1'b1),
      .USER_WIDTH   (USER_WIDTH)
  ) axis_app_rx_inst (
      .clk(sys_clk),
      .rst(!sys_rst_n),

      .s_axis_tdata (s_app_axis_tdata),
      .s_axis_tkeep (s_app_axis_tkeep),
      .s_axis_tvalid(s_app_axis_tvalid),
      .s_axis_tready(s_app_axis_tready),
      .s_axis_tlast (s_app_axis_tlast),
      .s_axis_tid   (),
      .s_axis_tdest (),
      .s_axis_tuser (s_app_axis_tuser),

      .m_axis_tdata (s_tlp_axis_tdata),
      .m_axis_tkeep (s_tlp_axis_tkeep),
      .m_axis_tvalid(s_tlp_axis_tvalid),
      .m_axis_tready(s_tlp_axis_tready),
      .m_axis_tlast (s_tlp_axis_tlast),
      .m_axis_tid   (),
      .m_axis_tdest (),
      .m_axis_tuser (s_tlp_axis_tuser)
  );



  axis_adapter #(
      .S_DATA_WIDTH (DATA_WIDTH),
      .S_KEEP_ENABLE(1'b1),
      .S_KEEP_WIDTH (KEEP_WIDTH),
      .M_DATA_WIDTH (APP_DATA_WIDTH),
      .M_KEEP_ENABLE(1'b1),
      .M_KEEP_WIDTH (APP_KEEP_WIDTH),
      .ID_ENABLE    (1'b0),
      .ID_WIDTH     (1),
      .DEST_ENABLE  (1'b0),
      .DEST_WIDTH   (1),
      .USER_ENABLE  (1'b1),
      .USER_WIDTH   (USER_WIDTH)
  ) axis_app_tx_inst (
      .clk(sys_clk),
      .rst(!sys_rst_n),

      .s_axis_tdata (m_tlp_axis_byte_swap_tdata),
      .s_axis_tkeep (m_tlp_axis_tkeep),
      .s_axis_tvalid(m_tlp_axis_tvalid),
      .s_axis_tready(m_tlp_axis_tready),
      .s_axis_tlast (m_tlp_axis_tlast),
      .s_axis_tid   (),
      .s_axis_tdest (),
      .s_axis_tuser (m_tlp_axis_tuser),

      .m_axis_tdata (m_app_axis_tdata),
      .m_axis_tkeep (m_app_axis_tkeep),
      .m_axis_tvalid(m_app_axis_tvalid),
      .m_axis_tready(m_app_axis_tready),
      .m_axis_tlast (m_app_axis_tlast),
      .m_axis_tid   (),
      .m_axis_tdest (),
      .m_axis_tuser (m_app_axis_tuser)
  );


  pcie_app_7x #(
      .C_DATA_WIDTH(APP_DATA_WIDTH),
      .TCQ(1)

  ) app (
      //----------------------------------------------------------------------------------------------------------------//
      // 1. AXI-S Interface                                                                                             //
      //----------------------------------------------------------------------------------------------------------------//
      // Common
      .user_clk        (sys_clk),
      .user_reset      (!sys_rst_n),
      .user_lnk_up     (link_up),
      // Tx
      .s_axis_tx_tready(s_app_axis_tready),
      .s_axis_tx_tdata (s_app_axis_tdata),
      .s_axis_tx_tkeep (s_app_axis_tkeep),
      .s_axis_tx_tuser (s_app_axis_tuser),
      .s_axis_tx_tlast (s_app_axis_tlast),
      .s_axis_tx_tvalid(s_app_axis_tvalid),
      .tx_cfg_gnt      (tx_cfg_gnt),
      // Rx
      .m_axis_rx_tdata (m_app_axis_tdata),
      .m_axis_rx_tkeep (m_app_axis_tkeep),
      .m_axis_rx_tlast (m_app_axis_tlast),
      .m_axis_rx_tvalid(m_app_axis_tvalid),
      .m_axis_rx_tready(m_app_axis_tready),
      .m_axis_rx_tuser (m_app_axis_tuser),
      .rx_np_ok        (rx_np_ok),
      .rx_np_req       (rx_np_req),

      // Flow Control
      .fc_sel                       (fc_sel),
      //----------------------------------------------------------------------------------------------------------------//
      // 2. Configuration (CFG) Interface                                                                               //
      //----------------------------------------------------------------------------------------------------------------//
      .cfg_err_cor                  (cfg_err_cor),
      .cfg_err_atomic_egress_blocked(cfg_err_atomic_egress_blocked),
      .cfg_err_internal_cor         (cfg_err_internal_cor),
      .cfg_err_malformed            (cfg_err_malformed),
      .cfg_err_mc_blocked           (cfg_err_mc_blocked),
      .cfg_err_poisoned             (cfg_err_poisoned),
      .cfg_err_norecovery           (cfg_err_norecovery),
      .cfg_err_ur                   (cfg_err_ur),
      .cfg_err_ecrc                 (cfg_err_ecrc),
      .cfg_err_cpl_timeout          (cfg_err_cpl_timeout),
      .cfg_err_cpl_abort            (cfg_err_cpl_abort),
      .cfg_err_cpl_unexpect         (cfg_err_cpl_unexpect),
      .cfg_err_posted               (cfg_err_posted),
      .cfg_err_locked               (cfg_err_locked),
      .cfg_err_acs                  (cfg_err_acs),                    //1'b0 ),
      .cfg_err_internal_uncor       (cfg_err_internal_uncor),         //1'b0 ),
      .cfg_err_tlp_cpl_header       (cfg_err_tlp_cpl_header),
      .cfg_interrupt                (cfg_interrupt),
      .cfg_interrupt_assert         (cfg_interrupt_assert),
      .cfg_interrupt_di             (cfg_interrupt_di),
      .cfg_interrupt_stat           (cfg_interrupt_stat),
      .cfg_pciecap_interrupt_msgnum (cfg_pciecap_interrupt_msgnum),
      .cfg_turnoff_ok               (cfg_turnoff_ok),
      .cfg_to_turnoff               (cfg_to_turnoff),

      .cfg_trn_pending      (cfg_trn_pending),
      .cfg_pm_halt_aspm_l0s (cfg_pm_halt_aspm_l0s),
      .cfg_pm_halt_aspm_l1  (cfg_pm_halt_aspm_l1),
      .cfg_pm_force_state_en(cfg_pm_force_state_en),
      .cfg_pm_force_state   (cfg_pm_force_state),

      .cfg_pm_wake        (cfg_pm_wake),
      .cfg_bus_number     (cfg_bus_number),
      .cfg_device_number  (cfg_device_number),
      .cfg_function_number(cfg_function_number),
      .cfg_dsn            (cfg_dsn),

      //----------------------------------------------------------------------------------------------------------------//
      // 3. Management (MGMT) Interface                                                                                 //
      //----------------------------------------------------------------------------------------------------------------//
      .cfg_mgmt_di         (cfg_mgmt_di),
      .cfg_mgmt_byte_en    (cfg_mgmt_byte_en),
      .cfg_mgmt_dwaddr     (cfg_mgmt_dwaddr),
      .cfg_mgmt_wr_en      (cfg_mgmt_wr_en),
      .cfg_mgmt_rd_en      (cfg_mgmt_rd_en),
      .cfg_mgmt_wr_readonly(cfg_mgmt_wr_readonly),

      //----------------------------------------------------------------------------------------------------------------//
      // 3. Advanced Error Reporting (AER) Interface                                                                    //
      //----------------------------------------------------------------------------------------------------------------//
      .cfg_err_aer_headerlog   (cfg_err_aer_headerlog),
      .cfg_aer_interrupt_msgnum(cfg_aer_interrupt_msgnum),

      //----------------------------------------------------------------------------------------------------------------//
      // 4. Physical Layer Control and Status (PL) Interface                                                            //
      //----------------------------------------------------------------------------------------------------------------//
      .pl_directed_link_auton   (pl_directed_link_auton),
      .pl_directed_link_change  (pl_directed_link_change),
      .pl_directed_link_speed   (pl_directed_link_speed),
      .pl_directed_link_width   (pl_directed_link_width),
      .pl_upstream_prefer_deemph(pl_upstream_prefer_deemph)

  );

  wire       ext_ch_gt_drpclk;
  wire [3:0] pipe_rx_eq_lp_tx_preset;

  assign pipe_rx_eq_lp_tx_preset = 4'b0000;


  always @(posedge user_clk_out) begin
    if (!sys_rst_n) begin
      user_lnk_up <= 1'b0;
      user_reset_int <= 1'b1;
      user_reset_out <= 1'b1;
      bridge_reset_int <= 1'b1;
      bridge_reset_d <= 1'b1;
    end else begin
      user_lnk_up <= trn_lnk_up;
      user_reset_int <= 1'b0;
      user_reset_out <= user_reset_int;
      bridge_reset_int <= 1'b0;
      bridge_reset_d <= bridge_reset_int;
    end
  end

  always @(posedge PIPE_PCLK_IN or negedge clock_locked) begin
    if (!clock_locked) reg_clock_locked <= 1'b0;
    else reg_clock_locked <= 1'b1;
  end
  // always @(posedge PIPE_PCLK_IN) begin
  //   if (!reg_clock_locked) phy_rdy_n <= 1'b0;
  //   else phy_rdy_n <= phy_phystatus_rst;
  // end


  assign pipe_mmcm_rst_n = sys_rst_n;

  generate
    if (EXTERNAL_MMCM == "FALSE") begin : in_module_mmcm
      // clock for pipe
      xilinx_pci_mmcm #(
          .PCIE_USERCLK_FREQ(USER_CLK_FREQ + 1),
          .PCIE_LANE        (1),
          .PCIE_LINK_SPEED  (2)
      ) pipe_clock_i (
          .refclk_i    (PIPE_TXOUTCLK_OUT),  // Reference clock from lane 0
          .rst_n_i     (pipe_mmcm_rst_n),    // Allow system reset for error_recovery             
          .refclk_sel_i(0),
          .pclk_sel_i  (phy_rate),
          .pipeclk_en_i(1),
          .pclk_o      (PIPE_PCLK_IN),
          .dclk_o      (PIPE_DCLK_IN),
          .userclk_o   (PIPE_USERCLK1_IN),
          .mmcm_lock_o (PIPE_MMCM_LOCK_IN)
      );
      assign PIPE_USERCLK2_IN = PIPE_USERCLK1_IN;
      assign PIPE_RXUSRCLK_IN = PIPE_PCLK_IN;
      assign PIPE_OOBCLK_IN   = PIPE_PCLK_IN;
    end else begin : external_mmcm
      assign PIPE_PCLK_IN = pipe_pclk_in;
      assign PIPE_DCLK_IN = pipe_dclk_in;
      assign PIPE_OOBCLK_IN = pipe_oobclk_in;
      assign PIPE_USERCLK1_IN = pipe_userclk1_in;
      assign PIPE_USERCLK2_IN = pipe_userclk2_in;
      assign PIPE_RXUSRCLK_IN = pipe_rxusrclk_in;
      assign PIPE_MMCM_LOCK_IN = pipe_mmcm_lock_in;
      assign pipe_pclk_sel_out = phy_rate;
      assign pipe_txoutclk_out = PIPE_TXOUTCLK_OUT;
    end
  endgenerate

  assign pipe_mmcm_lock = PIPE_MMCM_LOCK_IN;

  wire [PL_LINK_CAP_MAX_LINK_WIDTH*2-1:0] PHY_TXEQ_CTRL;
  wire [PL_LINK_CAP_MAX_LINK_WIDTH*4-1:0] PHY_TXEQ_PRESET;
  wire [PL_LINK_CAP_MAX_LINK_WIDTH*6-1:0] PHY_TXEQ_COEFF;
  wire [PL_LINK_CAP_MAX_LINK_WIDTH*2-1:0] PHY_RXEQ_CTRL;
  wire [                             5:0] pipe_eq_fs;
  wire [                             5:0] pipe_eq_lf;


  assign common_commands_out = 12'b0;
  assign pipe_tx_0_sigs      = 25'b0;
  assign pipe_tx_1_sigs      = 25'b0;
  assign pipe_tx_2_sigs      = 25'b0;
  assign pipe_tx_3_sigs      = 25'b0;
  assign pipe_tx_4_sigs      = 25'b0;
  assign pipe_tx_5_sigs      = 25'b0;
  assign pipe_tx_6_sigs      = 25'b0;
  assign pipe_tx_7_sigs      = 25'b0;


  //------------------------------------------------------------------------------------------------------------------//
  // **** V7/K7/A7 GTX Wrapper ****                                                                                   //
  //   The 7-Series GTX Wrapper includes the following:                                                               //
  //     1) Virtex-7 GTX                                                                                              //
  //     2) Kintex-7 GTX                                                                                              //
  //     3) Artix-7  GTP                                                                                              //
  //------------------------------------------------------------------------------------------------------------------//
  pcie_7x_0_gt_top_temp #(
      .LINK_CAP_MAX_LINK_WIDTH(LINK_CAP_MAX_LINK_WIDTH),
      .REF_CLK_FREQ           (REF_CLK_FREQ),
      .USER_CLK_FREQ          (USER_CLK_FREQ),
      .USER_CLK2_DIV2         (USER_CLK2_DIV2),

      // synthesis translate_off
      .PL_FAST_TRAIN(PL_SIM_FAST_LINK_TRAINING),
      // synthesis translate_on

      .PCIE_EXT_CLK      (PCIE_EXT_CLK),
      .PCIE_USE_MODE     (PCIE_USE_MODE),
      .PCIE_GT_DEVICE    (PCIE_GT_DEVICE),
      .PCIE_PLL_SEL      (PCIE_PLL_SEL),
      .PCIE_ASYNC_EN     (PCIE_ASYNC_EN),
      .PCIE_TXBUF_EN     (PCIE_TXBUF_EN),
      .PCIE_EXT_GT_COMMON(PCIE_EXT_GT_COMMON),
      .EXT_CH_GT_DRP     (EXT_CH_GT_DRP),
      .TX_MARGIN_FULL_0  (TX_MARGIN_FULL_0),
      .TX_MARGIN_FULL_1  (TX_MARGIN_FULL_1),
      .TX_MARGIN_FULL_2  (TX_MARGIN_FULL_2),
      .TX_MARGIN_FULL_3  (TX_MARGIN_FULL_3),
      .TX_MARGIN_FULL_4  (TX_MARGIN_FULL_4),
      .TX_MARGIN_LOW_0   (TX_MARGIN_LOW_0),
      .TX_MARGIN_LOW_1   (TX_MARGIN_LOW_1),
      .TX_MARGIN_LOW_2   (TX_MARGIN_LOW_2),
      .TX_MARGIN_LOW_3   (TX_MARGIN_LOW_3),
      .TX_MARGIN_LOW_4   (TX_MARGIN_LOW_4),
      .PCIE_CHAN_BOND    (PCIE_CHAN_BOND)

  ) gt_top_i (
      // pl ltssm
      .pl_ltssm_state(ltssm_debug_state),

      // Pipe Common Signals
      .pipe_tx_rcvr_det(phy_txelecidle),
      .pipe_tx_reset   (1'b0),
      .pipe_tx_rate    (phy_rate),
      .pipe_tx_deemph  (phy_txdeemph),
      .pipe_tx_margin  (phy_txmargin),
      .pipe_tx_swing   (1'b0),

      // Pipe Per-Lane Signals - Lane 0
      .pipe_rx0_char_is_k    (phy_rxdatak),
      .pipe_rx0_data         (phy_rxdata),
      .pipe_rx0_valid        (phy_rxdata_valid),
      .pipe_rx0_chanisaligned(pipe_rx0_chanisaligned_gt),
      .pipe_rx0_status       (phy_phystatus),
      .pipe_rx0_phy_status   (phy_rxstatus),
      .pipe_rx0_elec_idle    (phy_rxelecidle),
      .pipe_rx0_polarity     (phy_rxpolarity),
      .pipe_tx0_compliance   (phy_txcompliance),
      .pipe_tx0_char_is_k    (phy_txdatak),
      .pipe_tx0_data         (phy_txdata),
      .pipe_tx0_elec_idle    (phy_txelecidle),
      .pipe_tx0_powerdown    (phy_powerdown),

      // Pipe Per-Lane Signals - Lane 1

      // .pipe_rx1_char_is_k    (pipe_rx1_char_is_k_gt),
      // .pipe_rx1_data         (pipe_rx1_data_gt),
      // .pipe_rx1_valid        (pipe_rx1_valid_gt),
      // .pipe_rx1_chanisaligned(pipe_rx1_chanisaligned_gt),
      // .pipe_rx1_status       (pipe_rx1_status_gt),
      // .pipe_rx1_phy_status   (pipe_rx1_phy_status_gt),
      // .pipe_rx1_elec_idle    (pipe_rx1_elec_idle_gt),
      // .pipe_rx1_polarity     (pipe_rx1_polarity_gt),
      // .pipe_tx1_compliance   (pipe_tx1_compliance_gt),
      // .pipe_tx1_char_is_k    (pipe_tx1_char_is_k_gt),
      // .pipe_tx1_data         (pipe_tx1_data_gt),
      // .pipe_tx1_elec_idle    (pipe_tx1_elec_idle_gt),
      // .pipe_tx1_powerdown    (pipe_tx1_powerdown_gt),

      // Pipe Per-Lane Signals - Lane 2

      // .pipe_rx2_char_is_k    (pipe_rx2_char_is_k_gt),
      // .pipe_rx2_data         (pipe_rx2_data_gt),
      // .pipe_rx2_valid        (pipe_rx2_valid_gt),
      // .pipe_rx2_chanisaligned(pipe_rx2_chanisaligned_gt),
      // .pipe_rx2_status       (pipe_rx2_status_gt),
      // .pipe_rx2_phy_status   (pipe_rx2_phy_status_gt),
      // .pipe_rx2_elec_idle    (pipe_rx2_elec_idle_gt),
      // .pipe_rx2_polarity     (pipe_rx2_polarity_gt),
      // .pipe_tx2_compliance   (pipe_tx2_compliance_gt),
      // .pipe_tx2_char_is_k    (pipe_tx2_char_is_k_gt),
      // .pipe_tx2_data         (pipe_tx2_data_gt),
      // .pipe_tx2_elec_idle    (pipe_tx2_elec_idle_gt),
      // .pipe_tx2_powerdown    (pipe_tx2_powerdown_gt),

      // Pipe Per-Lane Signals - Lane 3

      // .pipe_rx3_char_is_k    (pipe_rx3_char_is_k_gt),
      // .pipe_rx3_data         (pipe_rx3_data_gt),
      // .pipe_rx3_valid        (pipe_rx3_valid_gt),
      // .pipe_rx3_chanisaligned(pipe_rx3_chanisaligned_gt),
      // .pipe_rx3_status       (pipe_rx3_status_gt),
      // .pipe_rx3_phy_status   (pipe_rx3_phy_status_gt),
      // .pipe_rx3_elec_idle    (pipe_rx3_elec_idle_gt),
      // .pipe_rx3_polarity     (pipe_rx3_polarity_gt),
      // .pipe_tx3_compliance   (pipe_tx3_compliance_gt),
      // .pipe_tx3_char_is_k    (pipe_tx3_char_is_k_gt),
      // .pipe_tx3_data         (pipe_tx3_data_gt),
      // .pipe_tx3_elec_idle    (pipe_tx3_elec_idle_gt),
      // .pipe_tx3_powerdown    (pipe_tx3_powerdown_gt),

      // Pipe Per-Lane Signals - Lane 4

      // .pipe_rx4_char_is_k    (pipe_rx4_char_is_k_gt),
      // .pipe_rx4_data         (pipe_rx4_data_gt),
      // .pipe_rx4_valid        (pipe_rx4_valid_gt),
      // .pipe_rx4_chanisaligned(pipe_rx4_chanisaligned_gt),
      // .pipe_rx4_status       (pipe_rx4_status_gt),
      // .pipe_rx4_phy_status   (pipe_rx4_phy_status_gt),
      // .pipe_rx4_elec_idle    (pipe_rx4_elec_idle_gt),
      // .pipe_rx4_polarity     (pipe_rx4_polarity_gt),
      // .pipe_tx4_compliance   (pipe_tx4_compliance_gt),
      // .pipe_tx4_char_is_k    (pipe_tx4_char_is_k_gt),
      // .pipe_tx4_data         (pipe_tx4_data_gt),
      // .pipe_tx4_elec_idle    (pipe_tx4_elec_idle_gt),
      // .pipe_tx4_powerdown    (pipe_tx4_powerdown_gt),

      // Pipe Per-Lane Signals - Lane 5

      // .pipe_rx5_char_is_k    (pipe_rx5_char_is_k_gt),
      // .pipe_rx5_data         (pipe_rx5_data_gt),
      // .pipe_rx5_valid        (pipe_rx5_valid_gt),
      // .pipe_rx5_chanisaligned(pipe_rx5_chanisaligned_gt),
      // .pipe_rx5_status       (pipe_rx5_status_gt),
      // .pipe_rx5_phy_status   (pipe_rx5_phy_status_gt),
      // .pipe_rx5_elec_idle    (pipe_rx5_elec_idle_gt),
      // .pipe_rx5_polarity     (pipe_rx5_polarity_gt),
      // .pipe_tx5_compliance   (pipe_tx5_compliance_gt),
      // .pipe_tx5_char_is_k    (pipe_tx5_char_is_k_gt),
      // .pipe_tx5_data         (pipe_tx5_data_gt),
      // .pipe_tx5_elec_idle    (pipe_tx5_elec_idle_gt),
      // .pipe_tx5_powerdown    (pipe_tx5_powerdown_gt),

      // Pipe Per-Lane Signals - Lane 6

      // .pipe_rx6_char_is_k    (pipe_rx6_char_is_k_gt),
      // .pipe_rx6_data         (pipe_rx6_data_gt),
      // .pipe_rx6_valid        (pipe_rx6_valid_gt),
      // .pipe_rx6_chanisaligned(pipe_rx6_chanisaligned_gt),
      // .pipe_rx6_status       (pipe_rx6_status_gt),
      // .pipe_rx6_phy_status   (pipe_rx6_phy_status_gt),
      // .pipe_rx6_elec_idle    (pipe_rx6_elec_idle_gt),
      // .pipe_rx6_polarity     (pipe_rx6_polarity_gt),
      // .pipe_tx6_compliance   (pipe_tx6_compliance_gt),
      // .pipe_tx6_char_is_k    (pipe_tx6_char_is_k_gt),
      // .pipe_tx6_data         (pipe_tx6_data_gt),
      // .pipe_tx6_elec_idle    (pipe_tx6_elec_idle_gt),
      // .pipe_tx6_powerdown    (pipe_tx6_powerdown_gt),

      // Pipe Per-Lane Signals - Lane 7

      // .pipe_rx7_char_is_k    (pipe_rx7_char_is_k_gt),
      // .pipe_rx7_data         (pipe_rx7_data_gt),
      // .pipe_rx7_valid        (pipe_rx7_valid_gt),
      // .pipe_rx7_chanisaligned(pipe_rx7_chanisaligned_gt),
      // .pipe_rx7_status       (pipe_rx7_status_gt),
      // .pipe_rx7_phy_status   (pipe_rx7_phy_status_gt),
      // .pipe_rx7_elec_idle    (pipe_rx7_elec_idle_gt),
      // .pipe_rx7_polarity     (pipe_rx7_polarity_gt),
      // .pipe_tx7_compliance   (pipe_tx7_compliance_gt),
      // .pipe_tx7_char_is_k    (pipe_tx7_char_is_k_gt),
      // .pipe_tx7_data         (pipe_tx7_data_gt),
      // .pipe_tx7_elec_idle    (pipe_tx7_elec_idle_gt),
      // .pipe_tx7_powerdown    (pipe_tx7_powerdown_gt),

      // PCI Express Signals
      .pci_exp_txn(pci_exp_txn),
      .pci_exp_txp(pci_exp_txp),
      .pci_exp_rxn(pci_exp_rxn),
      .pci_exp_rxp(pci_exp_rxp),

      // Non PIPE Signals
      .sys_clk        (sys_clk),
      .sys_rst_n      (sys_rst_n),
      .PIPE_MMCM_RST_N(pipe_mmcm_rst_n),  // Async      | Async
      .pipe_clk       (pipe_clk),

      .user_clk (user_clk),
      .user_clk2(user_clk2),
      .phy_rdy_n(phy_rdy_n),

      // ---------- Shared Logic Internal------------------
      // .INT_PCLK_OUT_SLAVE   (int_pclk_out_slave),
      // .INT_RXUSRCLK_OUT     (int_pipe_rxusrclk_out),
      // .INT_RXOUTCLK_OUT     (int_rxoutclk_out),
      // .INT_DCLK_OUT         (int_dclk_out),
      // .INT_USERCLK1_OUT     (int_userclk1_out),
      // .INT_USERCLK2_OUT     (int_userclk2_out),
      // .INT_OOBCLK_OUT       (int_oobclk_out),
      // .INT_MMCM_LOCK_OUT    (int_mmcm_lock_out),
      // .INT_QPLLLOCK_OUT     (int_qplllock_out),
      // .INT_QPLLOUTCLK_OUT   (int_qplloutclk_out),
      // .INT_QPLLOUTREFCLK_OUT(int_qplloutrefclk_out),
      .INT_PCLK_SEL_SLAVE   (1'b0),

      // ---------- Shared Logic External------------------
      //External Clock Ports 
      .PIPE_PCLK_IN     (PIPE_PCLK_IN),
      .PIPE_RXUSRCLK_IN (PIPE_RXUSRCLK_IN),
      .PIPE_RXOUTCLK_IN (),
      .PIPE_DCLK_IN     (PIPE_DCLK_IN),
      .PIPE_USERCLK1_IN (PIPE_USERCLK1_IN),
      .PIPE_USERCLK2_IN (PIPE_USERCLK2_IN),
      .PIPE_OOBCLK_IN   (PIPE_OOBCLK_IN),
      .PIPE_MMCM_LOCK_IN(PIPE_MMCM_LOCK_IN),

      .PIPE_TXOUTCLK_OUT(PIPE_TXOUTCLK_OUT),
      .PIPE_RXOUTCLK_OUT(),
      .PIPE_PCLK_SEL_OUT(),
      .PIPE_GEN3_OUT    (),

      //External GT COMMON Ports
      .qpll_drp_crscode(12'B0),
      .qpll_drp_fsm(18'B0),
      .qpll_drp_done(2'B0),
      .qpll_drp_reset(2'B0),
      .qpll_qplllock(2'B0),
      .qpll_qplloutclk(2'B0),
      .qpll_qplloutrefclk(2'B0),
      .qpll_qplld(),
      .qpll_qpllreset(),
      .qpll_drp_clk(),
      .qpll_drp_rst_n(),
      .qpll_drp_ovrd(),
      .qpll_drp_gen3(),
      .qpll_drp_start(),

      //TRANSCEIVER DEBUG EOU
      .ext_ch_gt_drpclk(),
      .ext_ch_gt_drpaddr(9'B0),
      .ext_ch_gt_drpen(1'B0),
      .ext_ch_gt_drpdi(16'B0),
      .ext_ch_gt_drpwe(1'B0),
      .ext_ch_gt_drpdo(),
      .ext_ch_gt_drprdy(),

      //---------- PRBS/Loopback Ports -----------------------
      .PIPE_TXPRBSSEL     (3'B0),
      .PIPE_RXPRBSSEL     (3'B0),
      .PIPE_TXPRBSFORCEERR(1'B0),
      .PIPE_RXPRBSCNTRESET(1'B0),
      .PIPE_LOOPBACK      (3'B0),

      .PIPE_RXPRBSERR(),
      .PIPE_TXINHIBIT(1'B0),

      //---------- Transceiver Debug FSM Ports ---------------------------------
      .PIPE_RST_FSM    (),
      .PIPE_QRST_FSM   (),
      .PIPE_RATE_FSM   (),
      .PIPE_SYNC_FSM_TX(),
      .PIPE_SYNC_FSM_RX(),
      .PIPE_DRP_FSM    (),

      .PIPE_RST_IDLE        (phy_phystatus_rst),
      .PIPE_QRST_IDLE       (),
      .PIPE_RATE_IDLE       (),
      .PIPE_EYESCANDATAERROR(),
      .PIPE_RXSTATUS        (),
      .PIPE_DMONITOROUT     (),

      .PIPE_CPLL_LOCK      (),
      .PIPE_QPLL_LOCK      (),
      .PIPE_RXPMARESETDONE (),
      .PIPE_RXBUFSTATUS    (),
      .PIPE_TXPHALIGNDONE  (),
      .PIPE_TXPHINITDONE   (),
      .PIPE_TXDLYSRESETDONE(),
      .PIPE_RXPHALIGNDONE  (),
      .PIPE_RXDLYSRESETDONE(),
      .PIPE_RXSYNCDONE     (),
      .PIPE_RXDISPERR      (),
      .PIPE_RXNOTINTABLE   (),
      .PIPE_RXCOMMADET     (),
      //---------- JTAG Ports --------------------------------
      .PIPE_JTAG_RDY       (),


      //---------- Debug Ports -------------------------------
      .PIPE_DEBUG_0(),
      .PIPE_DEBUG_1(),
      .PIPE_DEBUG_2(),
      .PIPE_DEBUG_3(),
      .PIPE_DEBUG_4(),
      .PIPE_DEBUG_5(),
      .PIPE_DEBUG_6(),
      .PIPE_DEBUG_7(),
      .PIPE_DEBUG_8(),
      .PIPE_DEBUG_9(),
      .PIPE_DEBUG  ()
  );

  assign common_commands_out = 12'b0;
  assign pipe_tx_0_sigs      = 25'b0;
  assign pipe_tx_1_sigs      = 25'b0;
  assign pipe_tx_2_sigs      = 25'b0;
  assign pipe_tx_3_sigs      = 25'b0;
  assign pipe_tx_4_sigs      = 25'b0;
  assign pipe_tx_5_sigs      = 25'b0;
  assign pipe_tx_6_sigs      = 25'b0;
  assign pipe_tx_7_sigs      = 25'b0;
  //------------------------------------------------------------------------------------------------------------------//

  // Tie-Off Unused Tandem Outputs
  assign icap_o              = 32'b0;
  assign startup_cfgclk      = 1'b0;
  assign startup_cfgmclk     = 1'b0;
  assign startup_eos         = 1'b0;
  assign startup_preq        = 1'b0;

  //////////////////////////////////////////////STORE_LTSSM//////////////////////////////////////////////////

  (* dont_touch = "true" *) wire store_ltssm;
  reg [5:0] ltssm_reg0 = 6'b0;
  reg [5:0] ltssm_reg1 = 6'b0;
  reg [5:0] ltssm_reg2 = 6'b0;

  always @(posedge pipe_clk) begin
    ltssm_reg0 <= pl_ltssm_state;
    ltssm_reg1 <= ltssm_reg0;
    ltssm_reg2 <= ltssm_reg1;
  end

  assign store_ltssm = (ltssm_reg2 != pl_ltssm_state) ? 1'b1 : 1'b0;

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////
  //enable_jtag_dbg = FALSE 

endmodule
