module pcie_top_gtp #(

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
    parameter USER_CLK_FREQ    = 1,
    parameter USER_CLK2_DIV2   = "FALSE",


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
  wire [                            31:0] icap_i;
  wire                                    icap_csib;
  wire                                    icap_rdwrb;
  wire [                            31:0] icap_o;
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
  wire [( MAX_NUM_LANES* DATA_WIDTH)-1:0] phy_rxdata;
  wire [               MAX_NUM_LANES-1:0] phy_rxdata_valid;
  wire [           (4*MAX_NUM_LANES)-1:0] phy_rxdatak;
  wire [               MAX_NUM_LANES-1:0] phy_rxstart_block;
  wire [           (2*MAX_NUM_LANES)-1:0] phy_rxsync_header;
  wire                                    phy_txdetectrx;
  wire [               MAX_NUM_LANES-1:0] phy_txelecidle;
  wire [               MAX_NUM_LANES-1:0] phy_txcompliance;
  wire [               MAX_NUM_LANES-1:0] phy_rxpolarity;
  wire [                             1:0] phy_powerdown;
  wire [                             2:0] phy_rate;
  wire [               MAX_NUM_LANES-1:0] phy_rxvalid;
  wire [               MAX_NUM_LANES-1:0] phy_phystatus;
  wire                                    phy_phystatus_rst;
  wire [               MAX_NUM_LANES-1:0] phy_rxelecidle;
  wire [           (MAX_NUM_LANES*3)-1:0] phy_rxstatus;
  wire [                             2:0] phy_txmargin;
  wire                                    phy_txswing;
  wire                                    phy_txdeemph;
  wire [           (MAX_NUM_LANES*2)-1:0] phy_txeq_ctrl;
  wire [           (MAX_NUM_LANES*4)-1:0] phy_txeq_preset;
  wire [           (MAX_NUM_LANES*6)-1:0] phy_txeq_coeff;
  wire [                             5:0] phy_txeq_fs;
  wire [                             5:0] phy_txeq_lf;
  wire [          (MAX_NUM_LANES*18)-1:0] phy_txeq_new_coeff;
  wire [               MAX_NUM_LANES-1:0] phy_txeq_done;
  wire [           (MAX_NUM_LANES*2)-1:0] phy_rxeq_ctrl;
  wire [           (MAX_NUM_LANES*4)-1:0] phy_rxeq_txpreset;
  wire [               MAX_NUM_LANES-1:0] phy_rxeq_preset_sel;
  wire [          (MAX_NUM_LANES*18)-1:0] phy_rxeq_new_txcoeff;
  wire [               MAX_NUM_LANES-1:0] phy_rxeq_adapt_done;
  wire [               MAX_NUM_LANES-1:0] phy_rxeq_done;
  wire [                           8-1:0] pipe_width_o;
  wire                                    as_mac_in_detect;
  wire                                    as_cdr_hold_req;
  wire [                             7:0] debug_state;
  wire                                    tx_elec_idle;
  wire                                    phy_ready_en;


  wire [                  DATA_WIDTH-1:0] s_tlp_axis_tdata;
  wire [                  DATA_WIDTH-1:0] s_tlp_axis_byte_swap_tdata;
  wire [                  KEEP_WIDTH-1:0] s_tlp_axis_tkeep;
  wire                                    s_tlp_axis_tvalid;
  wire                                    s_tlp_axis_tlast;
  wire [                  USER_WIDTH-1:0] s_tlp_axis_tuser;
  wire                                    s_tlp_axis_tready;

  wire [                  DATA_WIDTH-1:0] m_tlp_axis_tdata;
  wire [                  DATA_WIDTH-1:0] m_tlp_axis_byte_swap_tdata;
  wire [                  KEEP_WIDTH-1:0] m_tlp_axis_tkeep;
  wire                                    m_tlp_axis_tvalid;
  wire                                    m_tlp_axis_tlast;
  wire [                  USER_WIDTH-1:0] m_tlp_axis_tuser;
  wire                                    m_tlp_axis_tready;




  wire [              APP_DATA_WIDTH-1:0] s_app_axis_tdata;
  wire [              APP_KEEP_WIDTH-1:0] s_app_axis_tkeep;
  wire                                    s_app_axis_tvalid;
  wire                                    s_app_axis_tlast;
  wire [              APP_USER_WIDTH-1:0] s_app_axis_tuser;
  wire                                    s_app_axis_tready;



  wire [              APP_DATA_WIDTH-1:0] s_app_reg_axis_tdata;
  wire [              APP_KEEP_WIDTH-1:0] s_app_reg_axis_tkeep;
  wire                                    s_app_reg_axis_tvalid;
  wire                                    s_app_reg_axis_tlast;
  wire [              APP_USER_WIDTH-1:0] s_app_reg_axis_tuser;
  wire                                    s_app_reg_axis_tready;

  wire [              APP_DATA_WIDTH-1:0] m_app_axis_tdata;
  wire [              APP_KEEP_WIDTH-1:0] m_app_axis_tkeep;
  wire                                    m_app_axis_tvalid;
  wire                                    m_app_axis_tlast;
  wire [              APP_USER_WIDTH-1:0] m_app_axis_tuser;
  wire                                    m_app_axis_tready;
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

  wire       pl_directed_link_auton;
  wire [1:0] pl_directed_link_change;
  wire       pl_directed_link_speed;
  wire [1:0] pl_directed_link_width;
  wire       pl_upstream_prefer_deemph;

  wire       sys_rst_n_c;

  // Wires used for external clocking connectivity
  wire       pipe_pclk_in;
  wire       pipe_rxusrclk_in;
  wire [7:0] pipe_rxoutclk_in;
  wire       pipe_dclk_in;
  wire       pipe_userclk1_in;
  wire       pipe_userclk2_in;
  wire       pipe_mmcm_lock_in;

  wire       pipe_txoutclk_out;
  wire [7:0] pipe_rxoutclk_out;
  wire [7:0] pipe_pclk_sel_out;
  wire       pipe_gen3_out;
  wire       pipe_oobclk_in;

  wire       rx_np_req;

  // Flow Control
  wire [2:0] fc_sel;

  wire       link_up;

  wire       PIPE_TXOUTCLK_OUT;
  wire       PIPE_DCLK_IN;
  wire       PIPE_MMCM_LOCK_IN;
  wire       PIPE_RXUSRCLK_IN;
  wire       PIPE_OOBCLK_IN;


  wire       trn_lnk_up;
  reg        user_reset_int;
  reg        bridge_reset_int;
  reg        bridge_reset_d;
  reg        phy_rdy_n;
  wire       user_clk_out;  // actually is user_clk2
  reg        user_reset_out;
  reg        user_lnk_up;

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
      .pipe_tx_usr_clk_i(PIPE_RXUSRCLK_IN),
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

      .pipe_width_o           (pipe_width_o),
      .as_mac_in_detect       (as_mac_in_detect),
      .as_cdr_hold_req        (as_cdr_hold_req),
      .ltssm_debug_state      (debug_state),
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


//axis input skid buffer
  axis_register #(
      .DATA_WIDTH (APP_DATA_WIDTH),
      .KEEP_ENABLE(1'b1),
      .KEEP_WIDTH (APP_KEEP_WIDTH),
      .LAST_ENABLE(1'b1),
      .ID_ENABLE  (1'b0),
      .ID_WIDTH   (1),
      .DEST_ENABLE(1'b0),
      .DEST_WIDTH (1),
      .USER_ENABLE(1'b1),
      .USER_WIDTH (USER_WIDTH),
      .REG_TYPE   (2)
  ) app_rx_pipeline_inst (
      .clk          (sys_clk),
      .rst          (!sys_rst_n),
      .s_axis_tdata (s_app_axis_tdata),
      .s_axis_tkeep (s_app_axis_tkeep),
      .s_axis_tvalid(s_app_axis_tvalid),
      .s_axis_tready(s_app_axis_tready),
      .s_axis_tlast (s_app_axis_tlast),
      .s_axis_tuser (s_app_axis_tuser),
      .s_axis_tid   (1'b0),
      .s_axis_tdest (1'b0),
      .m_axis_tdata (s_app_reg_axis_tdata),
      .m_axis_tkeep (s_app_reg_axis_tkeep),
      .m_axis_tvalid(s_app_reg_axis_tvalid),
      .m_axis_tready(s_app_reg_axis_tready),
      .m_axis_tlast (s_app_reg_axis_tlast),
      .m_axis_tuser (s_app_reg_axis_tuser),
      .m_axis_tid   (),
      .m_axis_tdest ()
  );


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

      .s_axis_tdata (s_app_reg_axis_tdata),
      .s_axis_tkeep (s_app_reg_axis_tkeep),
      .s_axis_tvalid(s_app_reg_axis_tvalid),
      .s_axis_tready(s_app_reg_axis_tready),
      .s_axis_tlast (s_app_reg_axis_tlast),
      .s_axis_tid   (),
      .s_axis_tdest (),
      .s_axis_tuser (s_app_reg_axis_tuser),

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
  always @(posedge PIPE_PCLK_IN) begin
    if (!reg_clock_locked) phy_rdy_n <= 1'b0;
    else phy_rdy_n <= phy_phystatus_rst;
  end


  assign pipe_mmcm_rst_n = sys_rst_n;

   // Clocking PRIMITIVE
  //------------------------------------

  // Instantiation of the MMCM PRIMITIVE
  //    * Unused inputs are tied off
  //    * Unused outputs are labeled unused

  wire        clk_out1_clk_wiz_0;
  wire        clk_out2_clk_wiz_0;
  wire        clk_out3_clk_wiz_0;
  wire        clk_out4_clk_wiz_0;
  wire        clk_out5_clk_wiz_0;
  wire        clk_out6_clk_wiz_0;
  wire        clk_out7_clk_wiz_0;

  wire [15:0] do_unused;
  wire        drdy_unused;
  wire        psdone_unused;
  wire        locked_int;
  wire        clkfbout_clk_wiz_0;
  wire        clkfbout_buf_clk_wiz_0;
  wire        clkfboutb_unused;
    wire clkout0b_unused;
   wire clkout1_unused;
   wire clkout1b_unused;
   wire clkout2_unused;
   wire clkout2b_unused;
   wire clkout3_unused;
   wire clkout3b_unused;
   wire clkout4_unused;
  wire        clkout5_unused;
  wire        clkout6_unused;
  wire        clkfbstopped_unused;
  wire        clkinstopped_unused;
  wire        reset_high;
  wire gt_clk;

  MMCME2_ADV
  #(.BANDWIDTH            ("OPTIMIZED"),
    .CLKOUT4_CASCADE      ("FALSE"),
    .COMPENSATION         ("ZHOLD"),
    .STARTUP_WAIT         ("FALSE"),
    .DIVCLK_DIVIDE        (1),
    .CLKFBOUT_MULT_F      (10.000),
    .CLKFBOUT_PHASE       (0.000),
    .CLKFBOUT_USE_FINE_PS ("FALSE"),
    .CLKOUT0_DIVIDE_F     (10.000),
    .CLKOUT0_PHASE        (0.000),
    .CLKOUT0_DUTY_CYCLE   (0.500),
    .CLKOUT0_USE_FINE_PS  ("FALSE"),
    .CLKIN1_PERIOD        (10.000))
  mmcm_adv_inst
    // Output clocks
   (
    .CLKFBOUT            (clkfbout_clk_wiz_0),
    .CLKFBOUTB           (clkfboutb_unused),
    .CLKOUT0             (gt_clk),
    .CLKOUT0B            (clkout0b_unused),
    .CLKOUT1             (clkout1_unused),
    .CLKOUT1B            (clkout1b_unused),
    .CLKOUT2             (clkout2_unused),
    .CLKOUT2B            (clkout2b_unused),
    .CLKOUT3             (clkout3_unused),
    .CLKOUT3B            (clkout3b_unused),
    .CLKOUT4             (clkout4_unused),
    .CLKOUT5             (clkout5_unused),
    .CLKOUT6             (clkout6_unused),
     // Input clock control
    .CLKFBIN             (clkfbout_buf_clk_wiz_0),
    .CLKIN1              (sys_clk),
    .CLKIN2              (1'b0),
     // Tied to always select the primary input clock
    .CLKINSEL            (1'b1),
    // Ports for dynamic reconfiguration
    .DADDR               (7'h0),
    .DCLK                (1'b0),
    .DEN                 (1'b0),
    .DI                  (16'h0),
    .DO                  (do_unused),
    .DRDY                (drdy_unused),
    .DWE                 (1'b0),
    // Ports for dynamic phase shift
    .PSCLK               (1'b0),
    .PSEN                (1'b0),
    .PSINCDEC            (1'b0),
    .PSDONE              (psdone_unused),
    // Other control and status signals
    .LOCKED              (locked_int),
    .CLKINSTOPPED        (clkinstopped_unused),
    .CLKFBSTOPPED        (clkfbstopped_unused),
    .PWRDWN              (1'b0),
    .RST                 (!sys_rst_n));


//      assign reset_high = reset; 

  assign locked = locked_int;
// Clock Monitor clock assigning
//--------------------------------------
 // Output buffering
  //-----------------------------------

  BUFG clkf_buf
   (.O (clkfbout_buf_clk_wiz_0),
    .I (clkfbout_clk_wiz_0));






  // BUFG clkout1_buf
  //  (.O   (clk_out1),
  //   .I   (clk_out1_clk_wiz_0));


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

  pipe_wrapper #(
      .PCIE_SIM_MODE             ("TRUE"),
      // synthesis translate_off
      .PCIE_SIM_SPEEDUP          ("TRUE"),
      // synthesis translate_on
      .PCIE_EXT_CLK              (PCIE_EXT_CLK),
      .PCIE_TXBUF_EN             (PCIE_TXBUF_EN),
      .PCIE_EXT_GT_COMMON        (PCIE_EXT_GT_COMMON),
      .EXT_CH_GT_DRP             (EXT_CH_GT_DRP),
      .TX_MARGIN_FULL_0          (TX_MARGIN_FULL_0),
      .TX_MARGIN_FULL_1          (TX_MARGIN_FULL_1),
      .TX_MARGIN_FULL_2          (TX_MARGIN_FULL_2),
      .TX_MARGIN_FULL_3          (TX_MARGIN_FULL_3),
      .TX_MARGIN_FULL_4          (TX_MARGIN_FULL_4),
      .TX_MARGIN_LOW_0           (TX_MARGIN_LOW_0),
      .TX_MARGIN_LOW_1           (TX_MARGIN_LOW_1),
      .TX_MARGIN_LOW_2           (TX_MARGIN_LOW_2),
      .TX_MARGIN_LOW_3           (TX_MARGIN_LOW_3),
      .TX_MARGIN_LOW_4           (TX_MARGIN_LOW_4),
      .PCIE_ASYNC_EN             (PCIE_ASYNC_EN),
      .PCIE_CHAN_BOND            (PCIE_CHAN_BOND),
      .PCIE_PLL_SEL              (PCIE_PLL_SEL),
      .PCIE_GT_DEVICE            (PCIE_GT_DEVICE),
      .PCIE_USE_MODE             (PCIE_USE_MODE),
      .PCIE_LANE                 (LINK_CAP_MAX_LINK_WIDTH),
      .PCIE_LPM_DFE              ("LPM"),
      .PCIE_LINK_SPEED           (3),
      .PCIE_TX_EIDLE_ASSERT_DELAY(3'd2),
      .PCIE_OOBCLK_MODE          (1),
      .PCIE_REFCLK_FREQ          (REF_CLK_FREQ),
      .PCIE_USERCLK1_FREQ        (USER_CLK_FREQ + 1),        // unused
      .PCIE_USERCLK2_FREQ        (USERCLK2_FREQ + 1)         // unused
  ) pipe_wrapper_i (
      //---------- PIPE Clock & Reset Ports ------------------
      .PIPE_CLK    (gt_clk),
      .PIPE_RESET_N(sys_rst_n),
      // .PIPE_PCLK   (),
      //---------- PIPE TX Data Ports ------------------
      .PIPE_TXDATA (phy_txdata),
      .PIPE_TXDATAK(phy_txdatak),

      .PIPE_TXP(pci_exp_txp[0:0]),
      .PIPE_TXN(pci_exp_txn[0:0]),
      //---------- PIPE RX Data Ports ------------------
      .PIPE_RXP(pci_exp_rxp[0:0]),
      .PIPE_RXN(pci_exp_rxn[0:0]),

      .PIPE_RXDATA          (phy_rxdata[31:0]),
      .PIPE_RXDATAK         (phy_rxdatak[3:0]),
      //---------- PIPE Command Ports ------------------
      .PIPE_TXDETECTRX      (phy_txdetectrx),
      .PIPE_TXELECIDLE      (phy_txelecidle),
      .PIPE_TXCOMPLIANCE    (phy_txcompliance),
      .PIPE_RXPOLARITY      (phy_rxpolarity),
      .PIPE_POWERDOWN       (phy_powerdown),
      .PIPE_RATE            ({1'b0, phy_rate}),
      //---------- PIPE Electrical Command Ports ------------------
      .PIPE_TXMARGIN        (phy_txmargin[2:0]),
      .PIPE_TXSWING         (0),
      .PIPE_TXDEEMPH        ({(LINK_CAP_MAX_LINK_WIDTH) {phy_txdeemph}}),
      //---------- PIPE Status Ports -------------------
      .PIPE_RXVALID         (phy_rxdata_valid[0:0]),
      .PIPE_PHYSTATUS       (phy_phystatus[0:0]),
      .PIPE_PHYSTATUS_RST   (phy_phystatus_rst),
      .PIPE_RXELECIDLE      (phy_rxelecidle[0:0]),
      .PIPE_EYESCANDATAERROR(),
      .PIPE_RXSTATUS        (phy_rxstatus[2:0]),
      //---------- PIPE User Ports ---------------------------
      .PIPE_MMCM_RST_N      (pipe_mmcm_rst_n),
      .PIPE_PCLK_LOCK       (clock_locked),
      .PIPE_RXCHANISALIGNED (  /*gt_rxchanisaligned_wire[LINK_CAP_MAX_LINK_WIDTH-1:0]*/),
      //---------- External Clock Ports ---------------------------
      .PIPE_PCLK_IN         (PIPE_PCLK_IN),
      .PIPE_RXUSRCLK_IN     (PIPE_RXUSRCLK_IN),
      .PIPE_DCLK_IN         (PIPE_DCLK_IN),
      .PIPE_OOBCLK_IN       (PIPE_OOBCLK_IN),
      .PIPE_MMCM_LOCK_IN    (PIPE_MMCM_LOCK_IN),
      .PIPE_TXOUTCLK_OUT    (PIPE_TXOUTCLK_OUT),
      .gt_reset_fsm         (gt_reset_fsm)
  );



endmodule
