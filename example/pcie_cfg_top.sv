
module pcie_cfg_top
  import pcie_phy_pkg::*;
  import pcie_config_reg_pkg::*;
#(
    parameter int CLK_RATE = 100,  //!Clock speed in MHz, Defualt is 100
    parameter int MAX_NUM_LANES = 4,  //! Maximum number of lanes module can support
    // TLP data width
    parameter int DATA_WIDTH = 32,  //! AXIS data width
    // TLP strobe width
    parameter int STRB_WIDTH = DATA_WIDTH / 8,
    parameter int KEEP_WIDTH = STRB_WIDTH,
    parameter int USER_WIDTH = 5,
    // TLP keep width
    parameter int IS_ROOT_PORT = 1,
    parameter int LINK_NUM = 0,
    parameter int IS_UPSTREAM = 0,  //downstream by default
    parameter int CROSSLINK_EN = 0,  //crosslink not supported
    parameter int UPCONFIG_EN = 0,  //upconfig not supported
    parameter int TLP_SEG_COUNT = 1,
    parameter int TLP_DATA_WIDTH = 256,
    parameter int TLP_STRB_WIDTH = TLP_DATA_WIDTH / 32,
    parameter int TLP_HDR_WIDTH = 128

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


  parameter int KEEP_ENABLE = (DATA_WIDTH > 8);
  parameter int ID_ENABLE = 0;
  parameter int ID_WIDTH = 8;
  parameter int DEST_ENABLE = 0;
  parameter int DEST_WIDTH = 8;
  parameter int USER_ENABLE = 1;
  parameter int LAST_ENABLE = 1;
  parameter int ARB_TYPE_ROUND_ROBIN = 0;
  parameter int ARB_LSB_HIGH_PRIORITY = 1;


  logic                  [DATA_WIDTH-1:0] pipe_tlp_axis_tdata;
  logic                  [KEEP_WIDTH-1:0] pipe_tlp_axis_tkeep;
  logic                                   pipe_tlp_axis_tvalid;
  logic                                   pipe_tlp_axis_tlast;
  logic                  [USER_WIDTH-1:0] pipe_tlp_axis_tuser;
  logic                                   pipe_tlp_axis_tready;


  logic                  [DATA_WIDTH-1:0] tlp_axis_tdata;
  logic                  [KEEP_WIDTH-1:0] tlp_axis_tkeep;
  logic                                   tlp_axis_tvalid;
  logic                                   tlp_axis_tlast;
  logic                  [USER_WIDTH-1:0] tlp_axis_tuser;
  logic                                   tlp_axis_tready;


  logic                  [DATA_WIDTH-1:0] cpl_axis_tdata;
  logic                  [KEEP_WIDTH-1:0] cpl_axis_tkeep;
  logic                                   cpl_axis_tvalid;
  logic                                   cpl_axis_tlast;
  logic                  [USER_WIDTH-1:0] cpl_axis_tuser;
  logic                                   cpl_axis_tready;

  pcie_config_reg__in_t                   hwif_in;
  pcie_config_reg__out_t                  hwif_out;
  logic              [                  5:0] num_active_lanes_i;

  pcie_cfg_wrapper #(
      .DATA_WIDTH    (DATA_WIDTH),
      .STRB_WIDTH    (STRB_WIDTH),
      .KEEP_WIDTH    (KEEP_WIDTH),
      .USER_WIDTH    (USER_WIDTH),
      .TLP_DATA_WIDTH(TLP_DATA_WIDTH),
      .TLP_STRB_WIDTH(TLP_STRB_WIDTH),
      .TLP_HDR_WIDTH (TLP_HDR_WIDTH)
  ) pcie_cfg_wrapper_inst (
      .clk_i        (clk_i),
      .rst_i        (rst_i),
      .s_axis_tdata (pipe_tlp_axis_tdata),
      .s_axis_tkeep (pipe_tlp_axis_tkeep),
      .s_axis_tvalid(pipe_tlp_axis_tvalid),
      .s_axis_tlast (pipe_tlp_axis_tlast),
      .s_axis_tuser (pipe_tlp_axis_tuser),
      .s_axis_tready(pipe_tlp_axis_tready),

      .cpl_axis_tdata (cpl_axis_tdata),
      .cpl_axis_tkeep (cpl_axis_tkeep),
      .cpl_axis_tvalid(cpl_axis_tvalid),
      .cpl_axis_tlast (cpl_axis_tlast),
      .cpl_axis_tuser (cpl_axis_tuser),
      .cpl_axis_tready(cpl_axis_tready),

      .m_tlp_axis_tdata (m_tlp_axis_tdata),
      .m_tlp_axis_tkeep (m_tlp_axis_tkeep),
      .m_tlp_axis_tvalid(m_tlp_axis_tvalid),
      .m_tlp_axis_tlast (m_tlp_axis_tlast),
      .m_tlp_axis_tuser (m_tlp_axis_tuser),
      .m_tlp_axis_tready(m_tlp_axis_tready),
      .hwif_in          (hwif_in),
      .hwif_out         (hwif_out)
  );




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
      .clk_i               (clk_i),
      .rst_i               (rst_i),
      .en_i                (en_i),
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
      .link_up_o           (link_up_o),

      .s_tlp_axis_tdata (tlp_axis_tdata),
      .s_tlp_axis_tkeep (tlp_axis_tkeep),
      .s_tlp_axis_tvalid(tlp_axis_tvalid),
      .s_tlp_axis_tlast (tlp_axis_tlast),
      .s_tlp_axis_tuser (tlp_axis_tuser),
      .s_tlp_axis_tready(tlp_axis_tready),

      .m_tlp_axis_tdata (pipe_tlp_axis_tdata),
      .m_tlp_axis_tkeep (pipe_tlp_axis_tkeep),
      .m_tlp_axis_tvalid(pipe_tlp_axis_tvalid),
      .m_tlp_axis_tlast (pipe_tlp_axis_tlast),
      .m_tlp_axis_tuser (pipe_tlp_axis_tuser),
      .m_tlp_axis_tready(pipe_tlp_axis_tready)
  );


  axis_arb_mux #(
      .S_COUNT              (2),
      .DATA_WIDTH           (DATA_WIDTH),
      .KEEP_ENABLE          (KEEP_ENABLE),
      .KEEP_WIDTH           (KEEP_WIDTH),
      .ID_ENABLE            (ID_ENABLE),
      .S_ID_WIDTH           (ID_WIDTH),
      .DEST_ENABLE          (DEST_ENABLE),
      .DEST_WIDTH           (DEST_WIDTH),
      .USER_ENABLE          (USER_ENABLE),
      .USER_WIDTH           (USER_WIDTH),
      .LAST_ENABLE          (LAST_ENABLE),
      .ARB_TYPE_ROUND_ROBIN (ARB_TYPE_ROUND_ROBIN),
      .ARB_LSB_HIGH_PRIORITY(ARB_LSB_HIGH_PRIORITY)
  ) arbiter_mux_inst (
      .clk          (clk_i),
      .rst          (rst_i),
      // AXI inputs
      .s_axis_tdata ({cpl_axis_tdata, s_tlp_axis_tdata}),
      .s_axis_tkeep ({cpl_axis_tkeep, s_tlp_axis_tkeep}),
      .s_axis_tvalid({cpl_axis_tvalid, s_tlp_axis_tvalid}),
      .s_axis_tready({cpl_axis_tready, s_tlp_axis_tready}),
      .s_axis_tlast ({cpl_axis_tlast, s_tlp_axis_tlast}),
      .s_axis_tid   (),
      .s_axis_tdest (),
      .s_axis_tuser ({cpl_axis_tuser, s_tlp_axis_tuser}),
      // AXI output
      .m_axis_tdata (tlp_axis_tdata),
      .m_axis_tkeep (tlp_axis_tkeep),
      .m_axis_tvalid(tlp_axis_tvalid),
      .m_axis_tready(tlp_axis_tready),
      .m_axis_tlast (tlp_axis_tlast),
      .m_axis_tid   (),
      .m_axis_tdest (),
      .m_axis_tuser (tlp_axis_tuser)
  );
  //always #5  clk = ! clk ;

endmodule
