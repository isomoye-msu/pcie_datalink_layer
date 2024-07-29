//-----------------------------------------------------------------------------
//
// Project    : PCIE4 PHY IP Block 
// File       : pcie_phy_top.v
// Version    : 1.0 
//-----------------------------------------------------------------------------
//--
//-- Description:  PCIE4 PHY IP example design top file
//--
//------------------------------------------------------------------------------
`timescale 1ps / 1ps
module pcie_top #(

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

  // Local Parameters derived from user selection
  localparam TCQ = 1;
  localparam DATA_WIDTH = DW;
  localparam KEEP_WIDTH = DATA_WIDTH/8;
  localparam USER_WIDTH = KEEP_WIDTH;
  localparam STRB_WIDTH = USER_WIDTH;


  parameter int CLK_RATE      = 100;         
parameter int MAX_NUM_LANES = 8;         
// TLP keep width
parameter int IS_ROOT_PORT  = 1;
parameter int LINK_NUM      = 0;
parameter int IS_UPSTREAM   = 0;             
parameter int CROSSLINK_EN  = 0;             
parameter int UPCONFIG_EN   = 0;             

  //----------------------------------------------------------------------------------------------------------------//
  //  AXI Interface                                                                                                 //
  //----------------------------------------------------------------------------------------------------------------//

  wire                  user_clk;
  wire                  mcap_clk;
  wire                  pipe_clk;
  wire                  core_clk;

  //----------------------------------------------------------------------------------------------------------------//
  //    System(SYS) Interface                                                                                       //
  //----------------------------------------------------------------------------------------------------------------//

  wire                  sys_clk;
  wire                  sys_clk_gt;
  wire                  sys_rst_n_c;
  wire                  sys_rst_dipswt_n;
  wire                  sys_rst_edgecon_n;

  reg  [          25:0] user_clk_heartbeat;

  (* mark_debug *)wire [(LANES*DW)-1:0] phy_txdata;
  (* mark_debug *)wire [(LANES* 2)-1:0] phy_txdatak;
  (* mark_debug *)wire [     LANES-1:0] phy_txdata_valid;
  (* mark_debug *)wire [     LANES-1:0] phy_txstart_block;
  (* mark_debug *)wire [(LANES* 2)-1:0] phy_txsync_header;

  wire [     LANES-1:0] PHY_TXP;  // Serial Line      
  wire [     LANES-1:0] PHY_TXN;  // Serial Line  

  // RX Data
  wire [     LANES-1:0] PHY_RXP;  // Serial Line           
  wire [     LANES-1:0] PHY_RXN;  // Serial Line

  (* mark_debug *)wire [(LANES*DW)-1:0] phy_rxdata;
  (* mark_debug *)wire [(LANES* 2)-1:0] phy_rxdatak;
  (* mark_debug *)wire [     LANES-1:0] phy_rxdata_valid;
  (* mark_debug *)wire [(LANES* 2)-1:0] phy_rxstart_block;
  (* mark_debug *)wire [(LANES* 2)-1:0] phy_rxsync_header;

  // PHY Command
  wire                  phy_txdetectrx;
  (* mark_debug *)wire [     LANES-1:0] phy_txelecidle;
  wire [     LANES-1:0] phy_txcompliance;
  wire [     LANES-1:0] phy_rxpolarity;
  (* mark_debug *)wire [           1:0] phy_powerdown;
  (* mark_debug *)wire [           2:0] phy_rate;

  // PHY Status
  (* mark_debug *)wire [     LANES-1:0] phy_rxvalid;
  (* mark_debug *)wire [     LANES-1:0] phy_phystatus;
  (* mark_debug *)wire                  phy_phystatus_rst;
  (* mark_debug *)wire [     LANES-1:0] phy_rxelecidle;
  (* mark_debug *)wire [ (LANES*3)-1:0] phy_rxstatus;

  // TX Driver
  wire [           2:0] phy_txmargin;
  wire                  phy_txswing;
  wire                  phy_txdeemph;

  // TX Equalization (Gen3/4)
  wire [ (LANES*2)-1:0] phy_txeq_ctrl;
  wire [ (LANES*4)-1:0] phy_txeq_preset;
  wire [ (LANES*6)-1:0] phy_txeq_coeff;

  wire [           5:0] phy_txeq_fs;
  wire [           5:0] phy_txeq_lf;
  wire [(LANES*18)-1:0] phy_txeq_new_coeff;
  wire [     LANES-1:0] phy_txeq_done;

  // RX Equalization (Gen3/4)
  wire [ (LANES*2)-1:0] phy_rxeq_ctrl;
  wire [ (LANES*4)-1:0] phy_rxeq_txpreset;

  wire [     LANES-1:0] phy_rxeq_preset_sel;
  wire [(LANES*18)-1:0] phy_rxeq_new_txcoeff;
  wire [     LANES-1:0] phy_rxeq_adapt_done;
  wire [     LANES-1:0] phy_rxeq_done;
  wire [     LANES-1:0] gt_gtpowergood;


  // Assist Signals
  wire                  as_mac_in_detect;
  wire                  as_cdr_hold_req;

  wire                  tx_elec_idle_m;  // muxed input to phy_ctrl module
  wire                  phy_ready_en_m;
  wire                  gen1_en_m;
  wire                  gen2_en_m;
  wire                  gen3_en_m;
  wire                  gen4_en_m;
  wire                  tx_elec_idle_c;  // output of IBUF
  wire                  phy_ready_en_c;
  wire                  gen1_en_c;
  wire                  gen2_en_c;
  wire                  gen3_en_c;
  wire                  gen4_en_c;

  wire [           7:0] debug_state;


 //TLP AXIS inputs
  wire [DATA_WIDTH-1:0] s_tlp_axis_tdata;
  wire [KEEP_WIDTH-1:0] s_tlp_axis_tkeep;
  wire                  s_tlp_axis_tvalid;
  wire                  s_tlp_axis_tlast;
  wire [USER_WIDTH-1:0] s_tlp_axis_tuser;
  wire                  s_tlp_axis_tready;
  //TLP AXIS output
  wire [DATA_WIDTH-1:0] m_tlp_axis_tdata;
  wire [KEEP_WIDTH-1:0] m_tlp_axis_tkeep;
  wire                  m_tlp_axis_tvalid;
  wire                  m_tlp_axis_tlast;
  wire [USER_WIDTH-1:0] m_tlp_axis_tuser;
  wire                  m_tlp_axis_tready;


  assign sys_rst_n_c = sys_rst_edgecon_n & sys_rst_dipswt_n;

  IBUF sys_reset_ibuf (
      .O(sys_rst_edgecon_n),
      .I(sys_rst_n)
  );
  IBUF sys_reset_override_ibuf (
      .O(sys_rst_dipswt_n),
      .I(sys_rst_override_n)
  );

  // synthesis translate_off
  IBUF tx_elec_idle_ibuf (
      .O(tx_elec_idle_c),
      .I(tx_elec_idle)
  );
  IBUF phy_ready_en_ibuf (
      .O(phy_ready_en_c),
      .I(phy_ready_en)
  );
  IBUF gen1_en_ibuf (
      .O(gen1_en_c),
      .I(gen1_en)
  );
  IBUF gen2_en_ibuf (
      .O(gen2_en_c),
      .I(gen2_en)
  );
  IBUF gen3_en_ibuf (
      .O(gen3_en_c),
      .I(gen3_en)
  );
  IBUF gen4_en_ibuf (
      .O(gen4_en_c),
      .I(gen4_en)
  );
  // synthesis translate_on


  IBUFDS_GTE4 refclk_ibuf (
      .O(sys_clk_gt),
      .ODIV2(sys_clk),
      .I(sys_clk_p),
      .CEB(1'b0),
      .IB(sys_clk_n)
  );

  // synthesis translate_off
  // LED's enabled for Reference Board design
  OBUF led_0_obuf (
      .O(led_0),
      .I(sys_rst_n_c)
  );
  OBUF led_1_obuf (
      .O(led_1),
      .I(user_clk_heartbeat[25])
  );
  OBUF led_2_obuf (
      .O(led_2),
      .I(~phy_phystatus_rst)
  );
  OBUF led_3_obuf (
      .O(led_3),
      .I(debug_state == 8'h04)
  );
  OBUF led_4_obuf (
      .O(led_4),
      .I(phy_rate[1:0] == 2'b00)
  );
  OBUF led_5_obuf (
      .O(led_5),
      .I(phy_rate[1:0] == 2'b01)
  );
  OBUF led_6_obuf (
      .O(led_6),
      .I(phy_rate[1:0] == 2'b10)
  );
  OBUF led_7_obuf (
      .O(led_7),
      .I(phy_rate[1:0] == 2'b11)
  );
  // synthesis translate_on

  // Create a Clock Heartbeat
  always @(posedge user_clk) begin
    if (phy_phystatus_rst) begin
      user_clk_heartbeat <= #TCQ 26'd0;
    end else begin
      user_clk_heartbeat <= #TCQ user_clk_heartbeat + 1'b1;
    end
  end

  BUFG_GT bufg_gt_sysclk (
      .CE(gt_gtpowergood[0]),
      .CEMASK(1'd0),
      .CLR(1'd0),
      .CLRMASK(1'd0),
      .DIV(3'd0),
      .I(sys_clk),
      .O(sys_clk_bufg)
  );

  pcie_phy_0 pcie_phy_0_i (

      //--------------------------------------------------------------------------
      //  Clock & Reset Ports
      //--------------------------------------------------------------------------
      .phy_refclk  (sys_clk_bufg),
      .phy_userclk (user_clk),
      .phy_mcapclk (mcap_clk),
      .phy_gtrefclk(sys_clk_gt),
      .phy_rst_n   (sys_rst_n_c),

      .phy_pclk   (pipe_clk),
      .phy_coreclk(core_clk),


      //--------------------------------------------------------------------------
      //  Serial Line Ports
      //--------------------------------------------------------------------------

      .phy_rxp(pci_exp_rxp),
      .phy_rxn(pci_exp_rxn),

      .phy_txp(pci_exp_txp),
      .phy_txn(pci_exp_txn),

      //--------------------------------------------------------------------------
      //  TX Data Ports 
      //--------------------------------------------------------------------------

      .phy_txdata       (phy_txdata),
      .phy_txdatak      (phy_txdatak),
      .phy_txdata_valid (phy_txdata_valid),
      .phy_txstart_block(phy_txstart_block),
      .phy_txsync_header(phy_txsync_header),

      //--------------------------------------------------------------------------
      //  RX Data Ports 
      //--------------------------------------------------------------------------

      .phy_rxdata       (phy_rxdata),
      .phy_rxdatak      (phy_rxdatak),
      .phy_rxdata_valid (phy_rxdata_valid),
      .phy_rxstart_block(phy_rxstart_block),
      .phy_rxsync_header(phy_rxsync_header),

      //--------------------------------------------------------------------------
      //  PHY Command Port
      //--------------------------------------------------------------------------

      .phy_txdetectrx  (phy_txdetectrx),
      .phy_txelecidle  (phy_txelecidle),
      .phy_txcompliance(phy_txcompliance),
      .phy_rxpolarity  (phy_rxpolarity),
      .phy_powerdown   (phy_powerdown),
      .phy_rate        (phy_rate[1:0]),

      //--------------------------------------------------------------------------   
      //  PHY Status Ports
      //-------------------------------------------------------------------------- 

      .phy_rxvalid      (phy_rxvalid),
      .phy_phystatus    (phy_phystatus),
      .phy_phystatus_rst(phy_phystatus_rst),
      .phy_rxelecidle   (phy_rxelecidle),
      .phy_rxstatus     (phy_rxstatus),

      //--------------------------------------------------------------------------
      //  TX Driver Ports
      //--------------------------------------------------------------------------

      .phy_txmargin(phy_txmargin),
      .phy_txswing (phy_txswing),
      .phy_txdeemph(phy_txdeemph),

      //--------------------------------------------------------------------------   
      //  TX Equalization Ports for Gen3/4
      //--------------------------------------------------------------------------  

      .phy_txeq_ctrl     (phy_txeq_ctrl),
      .phy_txeq_preset   (phy_txeq_preset),
      .phy_txeq_coeff    (phy_txeq_coeff),
      .phy_txeq_fs       (phy_txeq_fs),
      .phy_txeq_lf       (phy_txeq_lf),
      .phy_txeq_new_coeff(phy_txeq_new_coeff),
      .phy_txeq_done     (phy_txeq_done),

      //--------------------------------------------------------------------------
      //  RX Equalization Ports for Gen3/4
      //--------------------------------------------------------------------------                                               

      .phy_rxeq_ctrl       (phy_rxeq_ctrl),
      .phy_rxeq_txpreset   (phy_rxeq_txpreset),
      .phy_rxeq_preset_sel (phy_rxeq_preset_sel),
      .phy_rxeq_new_txcoeff(phy_rxeq_new_txcoeff),
      .phy_rxeq_done       (phy_rxeq_done),
      .phy_rxeq_adapt_done (phy_rxeq_adapt_done),

      //--------------------------------------------------------------------------
      // Additional
      //--------------------------------------------------------------------------


      .gt_gtpowergood(gt_gtpowergood),


      .as_mac_in_detect(as_mac_in_detect),
      .as_cdr_hold_req (as_cdr_hold_req)

  );



  pcie_phy_top #(
      .CLK_RATE(CLK_RATE),
      .MAX_NUM_LANES(LANES),
      .DATA_WIDTH(DATA_WIDTH),
      .STRB_WIDTH(STRB_WIDTH),
      .KEEP_WIDTH(KEEP_WIDTH),
      .USER_WIDTH(USER_WIDTH),
      .IS_ROOT_PORT(IS_ROOT_PORT),
      .LINK_NUM(LINK_NUM),
      .IS_UPSTREAM(IS_UPSTREAM),
      .CROSSLINK_EN(CROSSLINK_EN),
      .UPCONFIG_EN(UPCONFIG_EN)
  ) pcie_phy_top_inst (
      .clk_i               (clk_i),
      .rst_i               (rst_i),
      .en_i                (en_i),

      //not used
      .fc_initialized_o    (),

      //phy txdata signals
      .phy_txdata          (phy_txdata),
      .phy_txdata_valid    (phy_txdata_valid),
      .phy_txdatak         (phy_txdatak),
      .phy_txstart_block   (phy_txstart_block),
      .phy_txsync_header   (phy_txsync_header),

      //phy rxdata signals
      .phy_rxdata          (phy_rxdata),
      .phy_rxdata_valid    (phy_rxdata_valid),
      .phy_rxdatak         (phy_rxdatak),
      .phy_rxstart_block   (phy_rxstart_block),
      .phy_rxsync_header   (phy_rxsync_header),

      //control signals
      .phy_txdetectrx      (phy_txdetectrx),
      .phy_txelecidle      (phy_txelecidle),
      .phy_txcompliance    (phy_txcompliance),
      .phy_rxpolarity      (phy_rxpolarity),
      .phy_powerdown       (phy_powerdown),

      //status signals
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

      //mac input signals
      .s_tlp_axis_tdata    (s_tlp_axis_tdata),
      .s_tlp_axis_tkeep    (s_tlp_axis_tkeep),
      .s_tlp_axis_tvalid   (s_tlp_axis_tvalid),
      .s_tlp_axis_tlast    (s_tlp_axis_tlast),
      .s_tlp_axis_tuser    (s_tlp_axis_tuser),
      .s_tlp_axis_tready   (s_tlp_axis_tready),

      //mac output signals
      .m_tlp_axis_tdata    (m_tlp_axis_tdata),
      .m_tlp_axis_tkeep    (m_tlp_axis_tkeep),
      .m_tlp_axis_tvalid   (m_tlp_axis_tvalid),
      .m_tlp_axis_tlast    (m_tlp_axis_tlast),
      .m_tlp_axis_tuser    (m_tlp_axis_tuser),
      .m_tlp_axis_tready   (m_tlp_axis_tready)
  );


//   phy_ctrl #(

//       .PHY_LANE(LANES),
//       .DW      (DW),
//       .TCQ     (TCQ)

//   ) phy_ctrl_i (

//       .CLK(pipe_clk),
//       .RST(phy_phystatus_rst),

//       //--------------------------------------------------------------------------
//       //  TX Data Ports 
//       //--------------------------------------------------------------------------

//       .PHY_TXDATA       (phy_txdata),
//       .PHY_TXDATAK      (phy_txdatak),
//       .PHY_TXDATA_VALID (phy_txdata_valid),
//       .PHY_TXSTART_BLOCK(phy_txstart_block),
//       .PHY_TXSYNC_HEADER(phy_txsync_header),

//       //--------------------------------------------------------------------------
//       //  RX Data Ports 
//       //--------------------------------------------------------------------------

//       .PHY_RXDATA       (phy_rxdata),
//       .PHY_RXDATAK      (phy_rxdatak),
//       .PHY_RXDATA_VALID (phy_rxdata_valid),
//       .PHY_RXSTART_BLOCK(phy_rxstart_block),
//       .PHY_RXSYNC_HEADER(phy_rxsync_header),

//       //--------------------------------------------------------------------------
//       //  PHY Command Port
//       //--------------------------------------------------------------------------

//       .PHY_TXDETECTRX  (phy_txdetectrx),
//       .PHY_TXELECIDLE  (phy_txelecidle),
//       .PHY_TXCOMPLIANCE(phy_txcompliance),
//       .PHY_RXPOLARITY  (phy_rxpolarity),
//       .PHY_POWERDOWN   (phy_powerdown),
//       .PHY_RATE        (phy_rate),

//       //--------------------------------------------------------------------------   
//       //  PHY Status Ports
//       //-------------------------------------------------------------------------- 

//       .PHY_RXVALID      (phy_rxvalid),
//       .PHY_PHYSTATUS    (phy_phystatus),
//       .PHY_PHYSTATUS_RST(phy_phystatus_rst),
//       .PHY_RXELECIDLE   (phy_rxelecidle),
//       .PHY_RXSTATUS     (phy_rxstatus),

//       //--------------------------------------------------------------------------
//       //  TX Driver Ports
//       //--------------------------------------------------------------------------

//       .PHY_TXMARGIN(phy_txmargin),
//       .PHY_TXSWING (phy_txswing),
//       .PHY_TXDEEMPH(phy_txdeemph),

//       //--------------------------------------------------------------------------   
//       //  TX Equalization Ports for Gen3/4
//       //--------------------------------------------------------------------------  

//       .PHY_TXEQ_CTRL     (phy_txeq_ctrl),
//       .PHY_TXEQ_PRESET   (phy_txeq_preset),
//       .PHY_TXEQ_COEFF    (phy_txeq_coeff),
//       .PHY_TXEQ_FS       (phy_txeq_fs),
//       .PHY_TXEQ_LF       (phy_txeq_lf),
//       .PHY_TXEQ_NEW_COEFF(phy_txeq_new_coeff),
//       .PHY_TXEQ_DONE     (phy_txeq_done),

//       //--------------------------------------------------------------------------
//       //  RX Equalization Ports for Gen3/4
//       //--------------------------------------------------------------------------                                               

//       .PHY_RXEQ_CTRL       (phy_rxeq_ctrl),
//       .PHY_RXEQ_TXPRESET   (phy_rxeq_txpreset),
//       .PHY_RXEQ_PRESET_SEL (phy_rxeq_preset_sel),
//       .PHY_RXEQ_NEW_TXCOEFF(phy_rxeq_new_txcoeff),
//       .PHY_RXEQ_DONE       (phy_rxeq_done),
//       .PHY_RXEQ_ADAPT_DONE (phy_rxeq_adapt_done),

//       .debug_state(debug_state),


//       .as_mac_in_detect(as_mac_in_detect),
//       .as_cdr_hold_req (as_cdr_hold_req),

//       // Bringup Control Inputs
//       .tx_elec_idle(tx_elec_idle_m),
//       .phy_ready_en(phy_ready_en_m),
//       .gen1_en(gen1_en_m),
//       .gen2_en(gen2_en_m),
//       .gen3_en(gen3_en_m),
//       .gen4_en(gen4_en_m)

//   );

  // VIO Controller
  wire mux_control_vo;  // VIO Output Enable from vio_0
  wire tx_elec_idle_vo;  // muxed input to phy_bringup module
  wire phy_ready_en_vo;
  wire gen1_en_vo;
  wire gen2_en_vo;
  wire gen3_en_vo;
  wire gen4_en_vo;

  assign tx_elec_idle_m = mux_control_vo ? tx_elec_idle_vo : tx_elec_idle_c;
  assign phy_ready_en_m = mux_control_vo ? phy_ready_en_vo : phy_ready_en_c;
  assign gen1_en_m = mux_control_vo ? gen1_en_vo : gen1_en_c;
  assign gen2_en_m = mux_control_vo ? gen2_en_vo : gen2_en_c;
  assign gen3_en_m = mux_control_vo ? gen3_en_vo : gen3_en_c;
  assign gen4_en_m = mux_control_vo ? gen4_en_vo : gen4_en_c;

`ifndef ADD_CHIPSCOPE_VIO0
  assign mux_control_vo = 1'b0;
`else  // ADD_CHIPSCOPE_VIO0
  wire probe_in8 = 0;
  wire probe_in9 = 0;
  wire probe_out7;
  wire probe_out8;
  wire probe_out9;

  vio_0 vio_i0 (
      .clk       (core_clk),                // input wire clk
      .probe_in0 (sys_rst_n_c),             // input wire [0 : 0] probe_in0
      .probe_in1 (user_clk_heartbeat[25]),  // input wire [0 : 0] probe_in1
      .probe_in2 (~phy_phystatus_rst),      // input wire [0 : 0] probe_in2
      .probe_in3 (debug_state == 8'h04),    // input wire [0 : 0] probe_in3
      .probe_in4 (phy_rate[1:0] == 2'b00),  // input wire [0 : 0] probe_in4
      .probe_in5 (phy_rate[1:0] == 2'b01),  // input wire [0 : 0] probe_in5
      .probe_in6 (phy_rate[1:0] == 2'b10),  // input wire [0 : 0] probe_in6
      .probe_in7 (phy_rate[1:0] == 2'b11),  // input wire [0 : 0] probe_in7
      .probe_in8 (probe_in8),               // input wire [0 : 0] probe_in8
      .probe_in9 (probe_in9),               // input wire [0 : 0] probe_in9
      .probe_out0(tx_elec_idle_vo),         // output wire [0 : 0] probe_out0
      .probe_out1(phy_ready_en_vo),         // output wire [0 : 0] probe_out1
      .probe_out2(gen1_en_vo),              // output wire [0 : 0] probe_out2
      .probe_out3(gen2_en_vo),              // output wire [0 : 0] probe_out3
      .probe_out4(gen3_en_vo),              // output wire [0 : 0] probe_out4
      .probe_out5(gen4_en_vo),              // output wire [0 : 0] probe_out5
      .probe_out6(mux_control_vo),          // output wire [0 : 0] probe_out6
      .probe_out7(probe_out7),              // output wire [0 : 0] probe_out7
      .probe_out8(probe_out8),              // output wire [0 : 0] probe_out8
      .probe_out9(probe_out9)               // output wire [0 : 0] probe_out9
  );
  // You must compile the wrapper file vio_0.v when simulating
  // the core, vio_0. When compiling the wrapper file, be sure to
  // reference the Verilog simulation library.
`endif  // ADD_CHIPSCOPE_VIO0






endmodule
