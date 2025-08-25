module pcie_gtx_kc705
  import pcie_phy_pkg::*;
#(
    parameter int CLK_RATE      = 100,             //!Clock speed in MHz, Defualt is 100
    parameter int MAX_NUM_LANES = 4,               //! Maximum number of lanes module can support
    // TLP data width
    parameter int DATA_WIDTH    = 32,              //! AXIS data width
    // TLP strobe width
    parameter int STRB_WIDTH    = DATA_WIDTH / 8,
    parameter int KEEP_WIDTH    = STRB_WIDTH,
    parameter int USER_WIDTH    = 5,
    // TLP keep width
    parameter int IS_ROOT_PORT  = 0,
    parameter int LINK_NUM      = 0,
    parameter int IS_UPSTREAM   = 0,               //downstream by default
    parameter int CROSSLINK_EN  = 0,               //crosslink not supported
    parameter int UPCONFIG_EN   = 0                //upconfig not supported
) (
    input  logic                                    clk_i,                 //! 100MHz clock signal
    input  logic                                    rst_i,                 //! Reset signal
    input  logic                                    en_i,
    // input  logic [                             5:0] num_active_lanes_i,
    // input  logic [               MAX_NUM_LANES-1:0] lane_active_i,
    // input  logic [               MAX_NUM_LANES-1:0] lane_status_i,
    output logic                                    fc_initialized_o,
    //pipe interface output
    output logic [( MAX_NUM_LANES* DATA_WIDTH)-1:0] phy_txdata,
    output logic [               MAX_NUM_LANES-1:0] phy_txdata_valid,
    output logic [           (4*MAX_NUM_LANES)-1:0] phy_txdatak,
    output logic [               MAX_NUM_LANES-1:0] phy_txstart_block,
    output logic [           (2*MAX_NUM_LANES)-1:0] phy_txsync_header,
    //pipe interface input
    input  logic [( MAX_NUM_LANES* DATA_WIDTH)-1:0] phy_rxdata,
    input  logic [               MAX_NUM_LANES-1:0] phy_rxdata_valid,
    input  logic [           (4*MAX_NUM_LANES)-1:0] phy_rxdatak,
    input  logic [               MAX_NUM_LANES-1:0] phy_rxstart_block,
    input  logic [           (2*MAX_NUM_LANES)-1:0] phy_rxsync_header,
    // PHY Command
    output wire                                     phy_txdetectrx,
    output wire  [               MAX_NUM_LANES-1:0] phy_txelecidle,
    output wire  [               MAX_NUM_LANES-1:0] phy_txcompliance,
    output wire  [               MAX_NUM_LANES-1:0] phy_rxpolarity,
    output wire  [                             1:0] phy_powerdown,
    output wire  [                             2:0] phy_rate,
    // PHY Status
    input  wire  [               MAX_NUM_LANES-1:0] phy_rxvalid,
    input  wire  [               MAX_NUM_LANES-1:0] phy_phystatus,
    input  wire                                     phy_phystatus_rst,
    input  wire  [               MAX_NUM_LANES-1:0] phy_rxelecidle,
    input  wire  [           (MAX_NUM_LANES*3)-1:0] phy_rxstatus,
    // TX Driver
    output wire  [                             2:0] phy_txmargin,
    output wire                                     phy_txswing,
    output wire                                     phy_txdeemph,
    // TX Equalization (Gen3/4)
    output wire  [           (MAX_NUM_LANES*2)-1:0] phy_txeq_ctrl,
    output wire  [           (MAX_NUM_LANES*4)-1:0] phy_txeq_preset,
    output wire  [           (MAX_NUM_LANES*6)-1:0] phy_txeq_coeff,
    input  wire  [                             5:0] phy_txeq_fs,
    input  wire  [                             5:0] phy_txeq_lf,
    input  wire  [          (MAX_NUM_LANES*18)-1:0] phy_txeq_new_coeff,
    input  wire  [               MAX_NUM_LANES-1:0] phy_txeq_done,
    // RX Equalization (Gen3/4)
    output wire  [           (MAX_NUM_LANES*2)-1:0] phy_rxeq_ctrl,
    output wire  [           (MAX_NUM_LANES*4)-1:0] phy_rxeq_txpreset,
    input  wire  [               MAX_NUM_LANES-1:0] phy_rxeq_preset_sel,
    input  wire  [          (MAX_NUM_LANES*18)-1:0] phy_rxeq_new_txcoeff,
    input  wire  [               MAX_NUM_LANES-1:0] phy_rxeq_adapt_done,
    input  wire  [               MAX_NUM_LANES-1:0] phy_rxeq_done,
    output wire  [                           8-1:0] pipe_width_o,
    //detect phy signals
    output reg                                      as_mac_in_detect,
    output reg                                      as_cdr_hold_req,

    // Debug output

    (* mark_debug *) output wire [7:0] debug_state,

    // Bringup Control Inputs
    (* mark_debug *) input wire tx_elec_idle,
    (* mark_debug *) input wire phy_ready_en,


    output logic link_up_o,


    //TLP AXIS inputs
    input  logic [DATA_WIDTH-1:0] s_tlp_axis_tdata,
    input  logic [KEEP_WIDTH-1:0] s_tlp_axis_tkeep,
    input  logic                  s_tlp_axis_tvalid,
    input  logic                  s_tlp_axis_tlast,
    input  logic [USER_WIDTH-1:0] s_tlp_axis_tuser,
    output logic                  s_tlp_axis_tready,
    //TLP AXIS output
    output logic [DATA_WIDTH-1:0] m_tlp_axis_tdata,
    output logic [KEEP_WIDTH-1:0] m_tlp_axis_tkeep,
    output logic                  m_tlp_axis_tvalid,
    output logic                  m_tlp_axis_tlast,
    output logic [USER_WIDTH-1:0] m_tlp_axis_tuser,
    input  logic                  m_tlp_axis_tready
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
  localparam int CLK_RATE = 200;
  localparam int MAX_NUM_LANES = 1;
  localparam int DATA_WIDTH = 32;
  localparam int STRB_WIDTH = DATA_WIDTH / 8;
  localparam int KEEP_WIDTH = STRB_WIDTH;
  localparam int USER_WIDTH = 5;
  localparam int IS_ROOT_PORT = 1;
  localparam int LINK_NUM = 0;
  localparam int IS_UPSTREAM = 0;
  localparam int CROSSLINK_EN = 0;
  localparam int UPCONFIG_EN = 0;


  localparam int APP_DATA_WIDTH = 64;
  localparam int APP_STRB_WIDTH = APP_DATA_WIDTH / 8;
  localparam int APP_KEEP_WIDTH = APP_STRB_WIDTH;
  localparam int APP_USER_WIDTH = 5;


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
  wire [( MAX_NUM_LANES* DATA_WIDTH)-1:0] phy_kc705_txdata;
  wire [               MAX_NUM_LANES-1:0] phy_kc705_txdata_valid;
  wire [           (4*MAX_NUM_LANES)-1:0] phy_kc705_txdatak;
  wire [               MAX_NUM_LANES-1:0] phy_kc705_txstart_block;
  wire [           (2*MAX_NUM_LANES)-1:0] phy_kc705_txsync_header;
  reg  [( MAX_NUM_LANES* DATA_WIDTH)-1:0] phy_kc705_rxdata;
  reg  [               MAX_NUM_LANES-1:0] phy_kc705_rxdata_valid;
  reg  [           (4*MAX_NUM_LANES)-1:0] phy_kc705_rxdatak;
  reg  [               MAX_NUM_LANES-1:0] phy_kc705_rxstart_block;
  reg  [           (2*MAX_NUM_LANES)-1:0] phy_kc705_rxsync_header;
  wire                                    phy_kc705_txdetectrx;
  wire [               MAX_NUM_LANES-1:0] phy_kc705_txelecidle;
  wire [               MAX_NUM_LANES-1:0] phy_kc705_txcompliance;
  wire [               MAX_NUM_LANES-1:0] phy_kc705_rxpolarity;
  wire [                             1:0] phy_kc705_powerdown;
  wire [                             2:0] phy_kc705_rate;
  reg  [               MAX_NUM_LANES-1:0] phy_kc705_rxvalid;
  reg  [               MAX_NUM_LANES-1:0] phy_kc705_phystatus;
  reg                                     phy_kc705_phystatus_rst;
  reg  [               MAX_NUM_LANES-1:0] phy_kc705_rxelecidle;
  reg  [           (MAX_NUM_LANES*3)-1:0] phy_kc705_rxstatus;
  wire [                             2:0] phy_kc705_txmargin;
  wire                                    phy_kc705_txswing;
  wire                                    phy_kc705_txdeemph;
  wire [           (MAX_NUM_LANES*2)-1:0] phy_kc705_txeq_ctrl;
  wire [           (MAX_NUM_LANES*4)-1:0] phy_kc705_txeq_preset;
  wire [           (MAX_NUM_LANES*6)-1:0] phy_kc705_txeq_coeff;
  reg  [                             5:0] phy_kc705_txeq_fs;
  reg  [                             5:0] phy_kc705_txeq_lf;
  reg  [          (MAX_NUM_LANES*18)-1:0] phy_kc705_txeq_new_coeff;
  reg  [               MAX_NUM_LANES-1:0] phy_kc705_txeq_done;
  wire [           (MAX_NUM_LANES*2)-1:0] phy_kc705_rxeq_ctrl;
  wire [           (MAX_NUM_LANES*4)-1:0] phy_kc705_rxeq_txpreset;
  reg  [               MAX_NUM_LANES-1:0] phy_kc705_rxeq_preset_sel;
  reg  [          (MAX_NUM_LANES*18)-1:0] phy_kc705_rxeq_new_txcoeff;
  reg  [               MAX_NUM_LANES-1:0] phy_kc705_rxeq_adapt_done;
  reg  [               MAX_NUM_LANES-1:0] phy_kc705_rxeq_done;
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




  //   reg  [              APP_DATA_WIDTH-1:0] s_app_axis_tdata;
  //   reg  [              APP_KEEP_WIDTH-1:0] s_app_axis_tkeep;
  //   reg                                     s_app_axis_tvalid;
  //   reg                                     s_app_axis_tlast;
  //   reg  [              APP_USER_WIDTH-1:0] s_app_axis_tuser;
  //   wire                                    s_app_axis_tready;

  //   wire [              APP_DATA_WIDTH-1:0] m_app_axis_tdata;
  //   wire [              APP_KEEP_WIDTH-1:0] m_app_axis_tkeep;
  //   wire                                    m_app_axis_tvalid;
  //   wire                                    m_app_axis_tlast;
  //   wire [              APP_USER_WIDTH-1:0] m_app_axis_tuser;
  //   reg                                     m_app_axis_tready;


  reg  [               MAX_NUM_LANES-1:0] gtx_rx_init_Xxuserrdy0;


  //-------------------------------------------------------
  // 3. Configuration (CFG) Interface
  //-------------------------------------------------------
  wire                                    cfg_err_cor;
  wire                                    cfg_err_ur;
  wire                                    cfg_err_ecrc;
  wire                                    cfg_err_cpl_timeout;
  wire                                    cfg_err_cpl_abort;
  wire                                    cfg_err_cpl_unexpect;
  wire                                    cfg_err_posted;
  wire                                    cfg_err_locked;
  wire [                            47:0] cfg_err_tlp_cpl_header;
  wire                                    cfg_interrupt;
  wire                                    cfg_interrupt_assert;
  wire [                             7:0] cfg_interrupt_di;
  wire                                    cfg_interrupt_stat;
  wire [                             4:0] cfg_pciecap_interrupt_msgnum;
  wire                                    cfg_turnoff_ok;
  wire                                    cfg_to_turnoff;
  wire                                    cfg_trn_pending;
  wire                                    cfg_pm_halt_aspm_l0s;
  wire                                    cfg_pm_halt_aspm_l1;
  wire                                    cfg_pm_force_state_en;
  wire [                             1:0] cfg_pm_force_state;
  wire                                    cfg_pm_wake;
  wire [                             7:0] cfg_bus_number;
  wire [                             4:0] cfg_device_number;
  wire [                             2:0] cfg_function_number;
  wire [                            63:0] cfg_dsn;
  wire [                           127:0] cfg_err_aer_headerlog;
  wire [                             4:0] cfg_aer_interrupt_msgnum;

  wire [                            31:0] cfg_mgmt_di;
  wire [                             3:0] cfg_mgmt_byte_en;
  wire [                             9:0] cfg_mgmt_dwaddr;
  wire                                    cfg_mgmt_wr_en;
  wire                                    cfg_mgmt_rd_en;
  wire                                    cfg_mgmt_wr_readonly;


  //-------------------------------------------------------
  // 4. Physical Layer Control and Status (PL) Interface
  //-------------------------------------------------------

  wire                                    pl_directed_link_auton;
  wire [                             1:0] pl_directed_link_change;
  wire                                    pl_directed_link_speed;
  wire [                             1:0] pl_directed_link_width;
  wire                                    pl_upstream_prefer_deemph;

  wire                                    sys_rst_n_c;

  // Wires used for external clocking connectivity
  wire                                    pipe_pclk_in;
  wire                                    pipe_rxusrclk_in;
  wire [                             7:0] pipe_rxoutclk_in;
  wire                                    pipe_dclk_in;
  wire                                    pipe_userclk1_in;
  wire                                    pipe_userclk2_in;
  wire                                    pipe_mmcm_lock_in;

  wire                                    pipe_txoutclk_out;
  wire [                             7:0] pipe_rxoutclk_out;
  wire [                             7:0] pipe_pclk_sel_out;
  wire                                    pipe_gen3_out;
  wire                                    pipe_oobclk_in;

  wire                                    rx_np_req;

  // Flow Control
  wire [                             2:0] fc_sel;

  wire                                    link_up;

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
      .clk_i            (clkin),
      .rst_i            (sys_rst_n),
      .en_i             ('1),
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

      .pipe_width_o     (pipe_width_o),
      .as_mac_in_detect (as_mac_in_detect),
      .as_cdr_hold_req  (as_cdr_hold_req),
      .debug_state      (debug_state),
      .tx_elec_idle     (tx_elec_idle),
      .phy_ready_en     (phy_ready_en),
      .link_up_o        (link_up),
      //tlp inputs
      .s_tlp_axis_tdata (s_tlp_axis_tdata),
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

  //   pcie_to_axis_converter #(
  //       .DATA_WIDTH      (DATA_WIDTH),
  //       .STRB_WIDTH      (STRB_WIDTH),
  //       .KEEP_WIDTH      (KEEP_WIDTH),
  //       .USER_WIDTH      (USER_WIDTH),
  //       .MAX_PAYLOAD_SIZE(MAX_PAYLOAD_SIZE),
  //       .RX_FIFO_SIZE    (RX_FIFO_SIZE),
  //       .TLP_SEG_COUNT   (TLP_SEG_COUNT),
  //       .TLP_DATA_WIDTH  (TLP_DATA_WIDTH),
  //       .TLP_STRB_WIDTH  (TLP_STRB_WIDTH),
  //       .TLP_HDR_WIDTH   (TLP_HDR_WIDTH)
  //   ) pcie_to_axis_converter_inst (
  //       .clk_i       (clk_i),
  //       .rst_i       (rst_i),
  //       .tx_tlp_data (tx_tlp_data),
  //       .tx_tlp_strb (tx_tlp_strb),
  //       .tx_tlp_hdr  (tx_tlp_hdr),
  //       .tx_tlp_error(tx_tlp_error),
  //       .tx_tlp_valid(tx_tlp_valid),
  //       .tx_tlp_sop  (tx_tlp_sop),
  //       .tx_tlp_eop  (tx_tlp_eop),
  //       .tx_tlp_ready(tx_tlp_ready),



  //       .m_axis_tdata (m_tlp_axis_tdata),
  //       .m_axis_tkeep (m_tlp_axis_tkeep),
  //       .m_axis_tvalid(m_tlp_axis_tvalid),
  //       .m_axis_tlast (m_tlp_axis_tlast),
  //       .m_axis_tuser (m_tlp_axis_tuser),
  //       .m_axis_tready(m_tlp_axis_tready)
  //   );

  //   axis_to_pcie_converter #(
  //       .DATA_WIDTH      (DATA_WIDTH),
  //       .STRB_WIDTH      (STRB_WIDTH),
  //       .KEEP_WIDTH      (KEEP_WIDTH),
  //       .USER_WIDTH      (USER_WIDTH),
  //       .MAX_PAYLOAD_SIZE(MAX_PAYLOAD_SIZE),
  //       .RX_FIFO_SIZE    (RX_FIFO_SIZE),
  //       .TLP_SEG_COUNT   (TLP_SEG_COUNT),
  //       .TLP_DATA_WIDTH  (TLP_DATA_WIDTH),
  //       .TLP_STRB_WIDTH  (TLP_STRB_WIDTH),
  //       .TLP_HDR_WIDTH   (TLP_HDR_WIDTH)
  //   ) axis_to_pcie_converter_inst (
  //       .clk_i        (clk_i),
  //       .rst_i        (rst_i),
  //       .s_axis_tdata (s_tlp_axis_tdata),
  //       .s_axis_tkeep (s_tlp_axis_tkeep),
  //       .s_axis_tvalid(s_tlp_axis_tvalid),
  //       .s_axis_tlast (s_tlp_axis_tlast),
  //       .s_axis_tuser (s_tlp_axis_tuser),
  //       .s_axis_tready(s_tlp_axis_tready),
  //       //outputs
  //       .rx_tlp_data  (rx_tlp_data),
  //       .rx_tlp_strb  (rx_tlp_strb),
  //       .rx_tlp_hdr   (rx_tlp_hdr),
  //       .rx_tlp_error (rx_tlp_error),
  //       .rx_tlp_valid (rx_tlp_valid),
  //       .rx_tlp_sop   (rx_tlp_sop),
  //       .rx_tlp_eop   (rx_tlp_eop),
  //       .rx_tlp_ready (rx_tlp_ready)
  //   );

  //   wire cfg_to_turnoff;
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


  //   axis_adapter #(
  //       .S_DATA_WIDTH (S_DATA_WIDTH),
  //       .S_KEEP_ENABLE(S_KEEP_ENABLE),
  //       .S_KEEP_WIDTH (S_KEEP_WIDTH),
  //       .M_DATA_WIDTH (M_DATA_WIDTH),
  //       .M_KEEP_ENABLE(M_KEEP_ENABLE),
  //       .M_KEEP_WIDTH (M_KEEP_WIDTH),
  //       .ID_ENABLE    (ID_ENABLE),
  //       .ID_WIDTH     (ID_WIDTH),
  //       .DEST_ENABLE  (DEST_ENABLE),
  //       .DEST_WIDTH   (DEST_WIDTH),
  //       .USER_ENABLE  (USER_ENABLE),
  //       .USER_WIDTH   (USER_WIDTH)
  //   ) axis_app_rx_inst (
  //       .clk          (clkin),
  //       .rst          (sys_rst_n),
  //       .s_axis_tdata (s_tlp_axis_tdata),
  //       .s_axis_tkeep (s_tlp_axis_tkeep),
  //       .s_axis_tvalid(s_tlp_axis_tvalid),
  //       .s_axis_tready(s_tlp_axis_tready),
  //       .s_axis_tlast (s_tlp_axis_tlast),
  //       .s_axis_tid   (),
  //       .s_axis_tdest (),
  //       .s_axis_tuser (s_tlp_axis_tuser),
  //       .m_axis_tdata (s_app_axis_tdata),
  //       .m_axis_tkeep (s_app_axis_tkeep),
  //       .m_axis_tvalid(s_app_axis_tvalid),
  //       .m_axis_tready(s_app_axis_tready),
  //       .m_axis_tlast (s_app_axis_tlast),
  //       .m_axis_tid   (),
  //       .m_axis_tdest (),
  //       .m_axis_tuser (s_app_axis_tuser)
  //   );


  //   axis_adapter #(
  //       .S_DATA_WIDTH (APP_DATA_WIDTH),
  //       .S_KEEP_ENABLE('1),
  //       .S_KEEP_WIDTH (APP_KEEP_WIDTH),
  //       .M_DATA_WIDTH (DATA_WIDTH),
  //       .M_KEEP_ENABLE('1),
  //       .M_KEEP_WIDTH (KEEP_WIDTH),
  //       .ID_ENABLE    ('0),
  //       .ID_WIDTH     (1),
  //       .DEST_ENABLE  ('0),
  //       .DEST_WIDTH   (1),
  //       .USER_ENABLE  ('1),
  //       .USER_WIDTH   (USER_WIDTH)
  //   ) axis_app_rx_inst (
  //       .clk(clkin),
  //       .rst(sys_rst_n),

  //       .s_axis_tdata (s_app_axis_tdata),
  //       .s_axis_tkeep (s_app_axis_tkeep),
  //       .s_axis_tvalid(s_app_axis_tvalid),
  //       .s_axis_tready(s_app_axis_tready),
  //       .s_axis_tlast (s_app_axis_tlast),
  //       .s_axis_tid   (),
  //       .s_axis_tdest (),
  //       .s_axis_tuser (s_app_axis_tuser),

  //       .m_axis_tdata (s_tlp_axis_tdata),
  //       .m_axis_tkeep (s_tlp_axis_tkeep),
  //       .m_axis_tvalid(s_tlp_axis_tvalid),
  //       .m_axis_tready(s_tlp_axis_tready),
  //       .m_axis_tlast (s_tlp_axis_tlast),
  //       .m_axis_tid   (),
  //       .m_axis_tdest (),
  //       .m_axis_tuser (s_tlp_axis_tuser)
  //   );



  //   axis_adapter #(
  //       .S_DATA_WIDTH (DATA_WIDTH),
  //       .S_KEEP_ENABLE('1),
  //       .S_KEEP_WIDTH (KEEP_WIDTH),
  //       .M_DATA_WIDTH (APP_DATA_WIDTH),
  //       .M_KEEP_ENABLE('1),
  //       .M_KEEP_WIDTH (APP_KEEP_WIDTH),
  //       .ID_ENABLE    ('0),
  //       .ID_WIDTH     (1),
  //       .DEST_ENABLE  ('0),
  //       .DEST_WIDTH   (1),
  //       .USER_ENABLE  ('1),
  //       .USER_WIDTH   (USER_WIDTH)
  //   ) axis_app_tx_inst (
  //       .clk(clkin),
  //       .rst(sys_rst_n),

  //       .s_axis_tdata (m_tlp_axis_tdata),
  //       .s_axis_tkeep (m_tlp_axis_tkeep),
  //       .s_axis_tvalid(m_tlp_axis_tvalid),
  //       .s_axis_tready(m_tlp_axis_tready),
  //       .s_axis_tlast (m_tlp_axis_tlast),
  //       .s_axis_tid   (),
  //       .s_axis_tdest (),
  //       .s_axis_tuser (m_tlp_axis_tuser),

  //       .m_axis_tdata (m_app_axis_tdata),
  //       .m_axis_tkeep (m_app_axis_tkeep),
  //       .m_axis_tvalid(m_app_axis_tvalid),
  //       .m_axis_tready(m_app_axis_tready),
  //       .m_axis_tlast (m_app_axis_tlast),
  //       .m_axis_tid   (),
  //       .m_axis_tdest (),
  //       .m_axis_tuser (m_app_axis_tuser)
  //   );


  //   pcie_app_7x #(
  //       .C_DATA_WIDTH(APP_DATA_WIDTH),
  //       .TCQ(1)

  //   ) app (
  //       //----------------------------------------------------------------------------------------------------------------//
  //       // 1. AXI-S Interface                                                                                             //
  //       //----------------------------------------------------------------------------------------------------------------//
  //       // Common
  //       .user_clk        (clkin),
  //       .user_reset      (sys_rst_n),
  //       .user_lnk_up     (link_up),
  //       // Tx
  //       .s_axis_tx_tready(s_app_axis_tready),
  //       .s_axis_tx_tdata (s_app_axis_tdata),
  //       .s_axis_tx_tkeep (s_app_axis_tkeep),
  //       .s_axis_tx_tuser (s_app_axis_tuser),
  //       .s_axis_tx_tlast (s_app_axis_tlast),
  //       .s_axis_tx_tvalid(s_app_axis_tvalid),
  //       .tx_cfg_gnt      (tx_cfg_gnt),
  //       // Rx
  //       .m_axis_rx_tdata (m_app_axis_tdata),
  //       .m_axis_rx_tkeep (m_app_axis_tkeep),
  //       .m_axis_rx_tlast (m_app_axis_tlast),
  //       .m_axis_rx_tvalid(m_app_axis_tvalid),
  //       .m_axis_rx_tready(m_app_axis_tready),
  //       .m_axis_rx_tuser (m_app_axis_tuser),
  //       .rx_np_ok        (rx_np_ok),
  //       .rx_np_req       (rx_np_req),

  //       // Flow Control
  //       .fc_sel                       (fc_sel),
  //       //----------------------------------------------------------------------------------------------------------------//
  //       // 2. Configuration (CFG) Interface                                                                               //
  //       //----------------------------------------------------------------------------------------------------------------//
  //       .cfg_err_cor                  (cfg_err_cor),
  //       .cfg_err_atomic_egress_blocked(cfg_err_atomic_egress_blocked),
  //       .cfg_err_internal_cor         (cfg_err_internal_cor),
  //       .cfg_err_malformed            (cfg_err_malformed),
  //       .cfg_err_mc_blocked           (cfg_err_mc_blocked),
  //       .cfg_err_poisoned             (cfg_err_poisoned),
  //       .cfg_err_norecovery           (cfg_err_norecovery),
  //       .cfg_err_ur                   (cfg_err_ur),
  //       .cfg_err_ecrc                 (cfg_err_ecrc),
  //       .cfg_err_cpl_timeout          (cfg_err_cpl_timeout),
  //       .cfg_err_cpl_abort            (cfg_err_cpl_abort),
  //       .cfg_err_cpl_unexpect         (cfg_err_cpl_unexpect),
  //       .cfg_err_posted               (cfg_err_posted),
  //       .cfg_err_locked               (cfg_err_locked),
  //       .cfg_err_acs                  (cfg_err_acs),                    //1'b0 ),
  //       .cfg_err_internal_uncor       (cfg_err_internal_uncor),         //1'b0 ),
  //       .cfg_err_tlp_cpl_header       (cfg_err_tlp_cpl_header),
  //       .cfg_interrupt                (cfg_interrupt),
  //       .cfg_interrupt_assert         (cfg_interrupt_assert),
  //       .cfg_interrupt_di             (cfg_interrupt_di),
  //       .cfg_interrupt_stat           (cfg_interrupt_stat),
  //       .cfg_pciecap_interrupt_msgnum (cfg_pciecap_interrupt_msgnum),
  //       .cfg_turnoff_ok               (cfg_turnoff_ok),
  //       .cfg_to_turnoff               (cfg_to_turnoff),

  //       .cfg_trn_pending      (cfg_trn_pending),
  //       .cfg_pm_halt_aspm_l0s (cfg_pm_halt_aspm_l0s),
  //       .cfg_pm_halt_aspm_l1  (cfg_pm_halt_aspm_l1),
  //       .cfg_pm_force_state_en(cfg_pm_force_state_en),
  //       .cfg_pm_force_state   (cfg_pm_force_state),

  //       .cfg_pm_wake        (cfg_pm_wake),
  //       .cfg_bus_number     (cfg_bus_number),
  //       .cfg_device_number  (cfg_device_number),
  //       .cfg_function_number(cfg_function_number),
  //       .cfg_dsn            (cfg_dsn),

  //       //----------------------------------------------------------------------------------------------------------------//
  //       // 3. Management (MGMT) Interface                                                                                 //
  //       //----------------------------------------------------------------------------------------------------------------//
  //       .cfg_mgmt_di         (cfg_mgmt_di),
  //       .cfg_mgmt_byte_en    (cfg_mgmt_byte_en),
  //       .cfg_mgmt_dwaddr     (cfg_mgmt_dwaddr),
  //       .cfg_mgmt_wr_en      (cfg_mgmt_wr_en),
  //       .cfg_mgmt_rd_en      (cfg_mgmt_rd_en),
  //       .cfg_mgmt_wr_readonly(cfg_mgmt_wr_readonly),

  //       //----------------------------------------------------------------------------------------------------------------//
  //       // 3. Advanced Error Reporting (AER) Interface                                                                    //
  //       //----------------------------------------------------------------------------------------------------------------//
  //       .cfg_err_aer_headerlog   (cfg_err_aer_headerlog),
  //       .cfg_aer_interrupt_msgnum(cfg_aer_interrupt_msgnum),

  //       //----------------------------------------------------------------------------------------------------------------//
  //       // 4. Physical Layer Control and Status (PL) Interface                                                            //
  //       //----------------------------------------------------------------------------------------------------------------//
  //       .pl_directed_link_auton   (pl_directed_link_auton),
  //       .pl_directed_link_change  (pl_directed_link_change),
  //       .pl_directed_link_speed   (pl_directed_link_speed),
  //       .pl_directed_link_width   (pl_directed_link_width),
  //       .pl_upstream_prefer_deemph(pl_upstream_prefer_deemph)

  //   );

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
      wire        clkout_buf1;
      wire        refclk_clk;

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
      //   GTXE2_COMMON #(
      //       // Parameters.
      //       .QPLL_CFG        (23'd6816193),
      //       .QPLL_FBDIV      (8'd224),
      //       .QPLL_FBDIV_RATIO(1'd1),
      //       .QPLL_REFCLK_DIV (1'd1)
      //   ) GTXE2_COMMON (
      //       // Inputs.
      //       .DRPADDR      (gpll_drp_addr),
      //       .DRPCLK       (gpll_drp_clk),
      //       .DRPDI        (gpll_drp_di),
      //       .DRPEN        (gpll_drp_en),
      //       .DRPWE        (gpll_drp_we),
      //       .GTREFCLK0    (clkout1),
      //       .QPLLLOCKEN   (1'd1),
      //       .QPLLPD       (gpll_powerdown),
      //       .QPLLREFCLKSEL(1'd1),
      //       .QPLLRESET    (gpll_reset),

      //       // Outputs.
      //       .DRPDO        (gpll_drp_do),
      //       .DRPRDY       (gpll_drp_rdy),
      //       .QPLLLOCK     (gpll_lock),
      //       .QPLLOUTCLK   (gpll_clk),
      //       .QPLLOUTREFCLK(gpll_refclk)
      //   );


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
      ) GTXE2_CHANNEL_inst_0 (
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
          //   .RXDFEVSEN       (1'd0),
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
          .GTXTXN          (pci_exp_txn[gtx_lane]),
          .GTXTXP          (pci_exp_txp[gtx_lane]),
          .PCSRSVDOUT      (gtx39),
          .PHYSTATUS       (phy_phystatus[gtx_lane]),
          .RXBUFSTATUS     (),
          .RXBYTEISALIGNED (gtx17),
          .RXBYTEREALIGN   (gtx18),
          .RXCDRLOCK       (gtx9),
          .RXCHANBONDSEQ   (gtx20),
          .RXCHANISALIGNED (gtx22),
          .RXCHANREALIGN   (gtx23),
          .RXCHARISCOMMA   (gtx36),
          .RXCHARISK       (phy_rxdatak[gtx_lane*4+:4]),
          .RXCHBONDO       (gtx21),
          .RXCLKCORCNT     (gtx10),
          .RXCOMINITDET    (gtx34),
          .RXCOMMADET      (gtx19),
          .RXCOMSASDET     (gtx32),
          .RXCOMWAKEDET    (gtx33),
          .RXDATA          (phy_rxdata[gtx_lane*32+:32]),
          .RXDATAVALID     (phy_rxdata_valid[gtx_lane]),
          .RXDISPERR       (),
          .RXDLYSRESETDONE (),
          .RXELECIDLE      (),
          .RXHEADER        (phy_rxsync_header[gtx_lane*2+:2]),
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
          .RXSTATUS        (phy_rxstatus[gtx_lane*3+:3]),
          .RXVALID         (phy_rxvalid),
          .TSTOUT          (),
          .TXBUFSTATUS     (),
          .TXCOMFINISH     (),
          .TXDLYSRESETDONE (),
          .TXGEARBOXREADY  (),
          .TXOUTCLK        (),
          .TXOUTCLKFABRIC  (),
          .TXOUTCLKPCS     (),
          .TXPHALIGNDONE   (),
          .TXPHINITDONE    (),
          .TXQPISENN       (),
          .TXQPISENP       (),
          .TXRATEDONE      (),
          .TXRESETDONE     ()
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
      ) GTXE2_CHANNEL_inst_1 (
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
          .GTXRXN          (pci_exp_txn[gtx_lane]),
          .GTXRXP          (pci_exp_txp[gtx_lane]),
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
          //   .RXDFEVSEN       (1'd0),
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
          .GTXTXN          (pci_exp_rxn[gtx_lane]),
          .GTXTXP          (pci_exp_rxp[gtx_lane]),
          .PCSRSVDOUT      (gtx39),
          .PHYSTATUS       (phy_phystatus[gtx_lane]),
          .RXBUFSTATUS     (),
          .RXBYTEISALIGNED (gtx17),
          .RXBYTEREALIGN   (gtx18),
          .RXCDRLOCK       (gtx9),
          .RXCHANBONDSEQ   (gtx20),
          .RXCHANISALIGNED (gtx22),
          .RXCHANREALIGN   (gtx23),
          .RXCHARISCOMMA   (gtx36),
          .RXCHARISK       (phy_rxdatak[gtx_lane*4+:4]),
          .RXCHBONDO       (gtx21),
          .RXCLKCORCNT     (gtx10),
          .RXCOMINITDET    (gtx34),
          .RXCOMMADET      (gtx19),
          .RXCOMSASDET     (gtx32),
          .RXCOMWAKEDET    (gtx33),
          .RXDATA          (phy_rxdata[gtx_lane*32+:32]),
          .RXDATAVALID     (phy_rxdata_valid[gtx_lane]),
          .RXDISPERR       (),
          .RXDLYSRESETDONE (),
          .RXELECIDLE      (phy_rxelecidle[gtx_lane]),
          .RXHEADER        (phy_rxsync_header[gtx_lane*2+:2]),
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
          .RXSTATUS        (phy_rxstatus[gtx_lane*3+:3]),
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
