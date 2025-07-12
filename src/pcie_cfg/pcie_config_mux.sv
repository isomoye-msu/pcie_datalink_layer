//! @title dllp2tlp
//! @author Idris Somoye
//! Module coverts axis tlp packets to pcie avalon type tlp packets.
module pcie_config_mux
  import pcie_datalink_pkg::*;
  import pcie_tlp_pkg::*;
#(
    // TLP data width
    parameter int DATA_WIDTH = 32,
    // TLP strobe width
    parameter int STRB_WIDTH = DATA_WIDTH / 8,
    parameter int KEEP_WIDTH = STRB_WIDTH,
    parameter int USER_WIDTH = 1,
    parameter int TLP_SEG_COUNT = 1,
    parameter int TLP_DATA_WIDTH = 128,
    parameter int TLP_STRB_WIDTH = 5,
    parameter int TLP_HDR_WIDTH = 128

) (
    //clocks and resets
    input  logic                  clk_i,          // Clock signal
    input  logic                  rst_i,          // Reset signal
    //TLP AXIS inputs
    input  logic [DATA_WIDTH-1:0] s_axis_tdata,
    input  logic [KEEP_WIDTH-1:0] s_axis_tkeep,
    input  logic                  s_axis_tvalid,
    input  logic                  s_axis_tlast,
    input  logic [USER_WIDTH-1:0] s_axis_tuser,
    output logic                  s_axis_tready,


    /*
     * TLP output (completion to DMA)
     */
    //TLP AXIS inputs
    output logic [DATA_WIDTH-1:0] m_cfg_axis_tdata,
    output logic [KEEP_WIDTH-1:0] m_cfg_axis_tkeep,
    output logic                  m_cfg_axis_tvalid,
    output logic                  m_cfg_axis_tlast,
    output logic [USER_WIDTH-1:0] m_cfg_axis_tuser,
    input  logic                  m_cfg_axis_tready,


    /*
     * TLP output (completion to DMA)
     */
    //TLP AXIS inputs
    output logic [DATA_WIDTH-1:0] m_tlp_axis_tdata,
    output logic [KEEP_WIDTH-1:0] m_tlp_axis_tkeep,
    output logic                  m_tlp_axis_tvalid,
    output logic                  m_tlp_axis_tlast,
    output logic [USER_WIDTH-1:0] m_tlp_axis_tuser,
    input  logic                  m_tlp_axis_tready
);
  /* verilator lint_off WIDTHEXPAND */
  /* verilator lint_off WIDTHTRUNC */

  //dllp to tlp fsm emum
  typedef enum logic [4:0] {
    ST_IDLE,
    ST_CFG_TLP,
    ST_MEM_TLP
  } cfg_decode_state_t;

  typedef struct packed {

    cfg_decode_state_t state;
    tlp_hdr_union_t    tlp_hdr;
    logic [31:0]       word_count;
  } cfg_decode_t;

  pcie_tlp_header_dw0_t tlp_dw0;

  cfg_decode_t D, Q;

  logic [DATA_WIDTH-1:0] tlp_axis_tdata;
  logic [KEEP_WIDTH-1:0] tlp_axis_tkeep;
  logic                  tlp_axis_tvalid;
  logic                  tlp_axis_tlast;
  logic [USER_WIDTH-1:0] tlp_axis_tuser;
  logic                  tlp_axis_tready;


  logic [DATA_WIDTH-1:0] cfg_axis_tdata;
  logic [KEEP_WIDTH-1:0] cfg_axis_tkeep;
  logic                  cfg_axis_tvalid;
  logic                  cfg_axis_tlast;
  logic [USER_WIDTH-1:0] cfg_axis_tuser;
  logic                  cfg_axis_tready;


  //   axis_pcie_conv_t                            Q.state;
  //   axis_pcie_conv_t                            next_state;


  //   tlp_hdr_union_t                             tlp_hdr_c;
  //   tlp_hdr_union_t                             tlp_hdr_r;
  //   logic                 [               31:0] word_count_c;
  //   logic                 [               31:0] word_count_r;
  //tlp type signals
  //   pcie_tlp_header_dw0_t                       tlp_dw0;
  //   logic                                       tlp_is_3dw_c;
  //   logic                                       tlp_is_3dw_r;
  //   logic                                       tlp_is_sop_c;
  //   logic                                       tlp_is_sop_r;
  //   logic                                       tlp_is_pd_c;
  //   logic                                       tlp_is_pd_r;
  //   logic                                       tlp_is_eop_c;
  //   logic                                       tlp_is_eop_r;

  //   logic                 [ TLP_DATA_WIDTH-1:0] tlp_data_c;
  //   logic                 [ TLP_DATA_WIDTH-1:0] tlp_data_r;
  //   //skid buffer axis signals
    logic                 [     DATA_WIDTH-1:0] skid_axis_tdata;
    logic                 [     KEEP_WIDTH-1:0] skid_axis_tkeep;
    logic                                       skid_axis_tvalid;
    logic                                       skid_axis_tlast;
    logic                 [     USER_WIDTH-1:0] skid_axis_tuser;
    logic                                       skid_axis_tready;
    logic                 [               31:0] tlp_byte_swapped;
  //   //tlp output axis signals
  //   logic                 [     DATA_WIDTH-1:0] tlp_tdata;
  //   logic                 [     KEEP_WIDTH-1:0] tlp_strb;
  //   logic                                       tlp_valid;
  //   logic                                       tlp_eop;
  //   logic                 [     USER_WIDTH-1:0] tlp_sop;
  //   logic                 [TLP_SEG_COUNT*4-1:0] tlp_error;
  //   logic                                       tlp_ready;

  //main sequential block
  always_ff @(posedge clk_i) begin : main_seq
    if (rst_i) begin
      Q <= '{state: ST_IDLE, default: 'd0};
    end else begin
      Q <= D;
    end
    //non resetable
    // word_count_r <= word_count_c;
    // tlp_is_3dw_r <= tlp_is_3dw_c;
    // tlp_is_eop_r <= tlp_is_eop_c;
    // tlp_is_sop_r <= tlp_is_sop_c;
    // tlp_is_pd_r  <= tlp_is_pd_c;
    // tlp_data_r   <= tlp_data_c;
    // tlp_hdr_r    <= tlp_hdr_c;
  end


  always_comb begin : byte_swap_tlp
    for (int i = 0; i < 4; i++) begin
      tlp_byte_swapped[(8*i)+:8] = skid_axis_tdata[8*(3-i)+:8];
    end
  end


  always_comb begin : main_combo
    D               = Q;
    tlp_dw0         = '0;

    //tlp axis signals
    tlp_axis_tvalid = '0;
    cfg_axis_tvalid = '0;
    tlp_axis_tdata  = skid_axis_tdata;
    tlp_axis_tkeep  = skid_axis_tkeep;
    tlp_axis_tlast  = skid_axis_tlast;
    tlp_axis_tuser  = skid_axis_tuser;
    cfg_axis_tdata  = skid_axis_tdata;
    cfg_axis_tkeep  = skid_axis_tkeep;
    cfg_axis_tlast  = skid_axis_tlast;
    cfg_axis_tuser  = skid_axis_tuser;

    case (Q.state)
      ST_IDLE: begin
        skid_axis_tready = tlp_axis_tready && cfg_axis_tready;
        if (skid_axis_tvalid) begin
          tlp_dw0 = skid_axis_tdata;
          if (1 & tlp_dw0.byte0.Type inside {IORd, CfgRd0, TCfgRd,MsgD,IOWr,
           CfgWr0,TCfgWr}) begin
            cfg_axis_tvalid = '1;
            //  tlp_axis_tvalid = '1;
            if (!skid_axis_tlast) begin
              D.state = ST_CFG_TLP;
            end
          end else begin
            tlp_axis_tvalid = '1;
            if (!skid_axis_tlast) begin
              D.state = ST_MEM_TLP;
            end
          end
        end
      end
      ST_CFG_TLP: begin
        skid_axis_tready = cfg_axis_tready;
        cfg_axis_tvalid = skid_axis_tvalid;
        // tlp_axis_tvalid = skid_axis_tvalid;
        if (skid_axis_tvalid) begin
          // cfg_axis_tvalid = '1;
          if (skid_axis_tlast) begin
            D.state = ST_IDLE;
          end
        end
      end
      ST_MEM_TLP: begin
        skid_axis_tready = tlp_axis_tready;
        tlp_axis_tvalid = skid_axis_tvalid;
        if (skid_axis_tvalid) begin
          // tlp_axis_tvalid = '1;
          if (skid_axis_tlast) begin
            D.state = ST_IDLE;
          end
        end
      end
      default: begin
      end
    endcase
  end

  axis_register #(
      .DATA_WIDTH (DATA_WIDTH),
      .KEEP_ENABLE('1),
      .KEEP_WIDTH (KEEP_WIDTH),
      .LAST_ENABLE('1),
      .ID_ENABLE  ('0),
      .ID_WIDTH   (1),
      .DEST_ENABLE('0),
      .DEST_WIDTH (1),
      .USER_ENABLE('1),
      .USER_WIDTH (USER_WIDTH),
      .REG_TYPE   (SkidBuffer)
  ) tlp_fifo_inst (
      .clk          (clk_i),
      .rst          (rst_i),
      // AXI input
      .s_axis_tdata (tlp_axis_tdata),
      .s_axis_tkeep (tlp_axis_tkeep),
      .s_axis_tvalid(tlp_axis_tvalid),
      .s_axis_tready(tlp_axis_tready),
      .s_axis_tlast (tlp_axis_tlast),
      .s_axis_tuser (tlp_axis_tuser),
      .s_axis_tid   (),
      .s_axis_tdest (),
      // AXI output
      .m_axis_tdata (m_tlp_axis_tdata),
      .m_axis_tkeep (m_tlp_axis_tkeep),
      .m_axis_tvalid(m_tlp_axis_tvalid),
      .m_axis_tready(m_tlp_axis_tready),
      .m_axis_tlast (m_tlp_axis_tlast),
      .m_axis_tuser (m_tlp_axis_tuser),
      .m_axis_tid   (),
      .m_axis_tdest ()
  );


  axis_register #(
      .DATA_WIDTH (DATA_WIDTH),
      .KEEP_ENABLE('1),
      .KEEP_WIDTH (KEEP_WIDTH),
      .LAST_ENABLE('1),
      .ID_ENABLE  ('0),
      .ID_WIDTH   (1),
      .DEST_ENABLE('0),
      .DEST_WIDTH (1),
      .USER_ENABLE('1),
      .USER_WIDTH (USER_WIDTH),
      .REG_TYPE   (SkidBuffer)
  ) cfg_fifo_inst (
      .clk          (clk_i),
      .rst          (rst_i),
      // AXI input
      .s_axis_tdata (cfg_axis_tdata),
      .s_axis_tkeep (cfg_axis_tkeep),
      .s_axis_tvalid(cfg_axis_tvalid),
      .s_axis_tready(cfg_axis_tready),
      .s_axis_tlast (cfg_axis_tlast),
      .s_axis_tuser (cfg_axis_tuser),
      .s_axis_tid   (),
      .s_axis_tdest (),
      // AXI output
      .m_axis_tdata (m_cfg_axis_tdata),
      .m_axis_tkeep (m_cfg_axis_tkeep),
      .m_axis_tvalid(m_cfg_axis_tvalid),
      .m_axis_tready(m_cfg_axis_tready),
      .m_axis_tlast (m_cfg_axis_tlast),
      .m_axis_tuser (m_cfg_axis_tuser),
      .m_axis_tid   (),
      .m_axis_tdest ()
  );


  //axis input skid buffer
  axis_register #(
      .DATA_WIDTH (DATA_WIDTH),
      .KEEP_ENABLE('1),
      .KEEP_WIDTH (KEEP_WIDTH),
      .LAST_ENABLE('1),
      .ID_ENABLE  ('0),
      .ID_WIDTH   (1),
      .DEST_ENABLE('0),
      .DEST_WIDTH (1),
      .USER_ENABLE('1),
      .USER_WIDTH (USER_WIDTH),
      .REG_TYPE   (SkidBuffer)
  ) axis_register_pipeline_inst (
      .clk          (clk_i),
      .rst          (rst_i),
      .s_axis_tdata (s_axis_tdata),
      .s_axis_tkeep (s_axis_tkeep),
      .s_axis_tvalid(s_axis_tvalid),
      .s_axis_tready(s_axis_tready),
      .s_axis_tlast (s_axis_tlast),
      .s_axis_tuser (s_axis_tuser),
      .s_axis_tid   ('0),
      .s_axis_tdest ('0),
      .m_axis_tdata (skid_axis_tdata),
      .m_axis_tkeep (skid_axis_tkeep),
      .m_axis_tvalid(skid_axis_tvalid),
      .m_axis_tready(skid_axis_tready),
      .m_axis_tlast (skid_axis_tlast),
      .m_axis_tuser (skid_axis_tuser),
      .m_axis_tid   (),
      .m_axis_tdest ()
  );

  /* verilator lint_on WIDTHEXPAND */
  /* verilator lint_on WIDTHTRUNC */
endmodule
