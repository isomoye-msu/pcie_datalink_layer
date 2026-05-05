//! @title pcie_config_handler
//! @author Idris Somoye
//! Module coverts pcie avalon type packets to axis tlp packets.
module pcie_config_handler
  import pcie_datalink_pkg::*;
  import pcie_tlp_pkg::*;
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
    //clocks and resets
    input  logic                                   clk_i,         // Clock signal
    input  logic                                   rst_i,         // Reset signal
    /*
     * TLP output (completion to DMA)
     */
    input  logic [             TLP_DATA_WIDTH-1:0] rx_tlp_data,
    input  logic [             TLP_STRB_WIDTH-1:0] rx_tlp_strb,
    input  logic [TLP_SEG_COUNT*TLP_HDR_WIDTH-1:0] rx_tlp_hdr,
    input  logic [            TLP_SEG_COUNT*4-1:0] rx_tlp_error,
    input  logic [              TLP_SEG_COUNT-1:0] rx_tlp_valid,
    input  logic [              TLP_SEG_COUNT-1:0] rx_tlp_sop,
    input  logic [              TLP_SEG_COUNT-1:0] rx_tlp_eop,
    output logic                                   rx_tlp_ready,

    //AXI-LITE
    // AXI-L
    output logic        s_axil_awvalid,
    input  logic        s_axil_awready,
    output logic [31:0] s_axil_awaddr,
    output logic        s_axil_wvalid,
    input  logic        s_axil_wready,
    output logic [31:0] s_axil_wdata,
    output logic [ 3:0] s_axil_wstrb,
    output logic        s_axil_arvalid,
    input  logic        s_axil_arready,
    output       [31:0] s_axil_araddr,
    input  logic        s_axil_rvalid,
    output logic        s_axil_rready,
    input  logic [31:0] s_axil_rdata,
    input  logic [ 1:0] s_axil_rresp,
    input  logic        s_axil_bvalid,
    output logic        s_axil_bready,
    input  logic [ 1:0] s_axil_bresp,

    /*
     * Captured Config IDs
     */

    output logic [7:0] cfg_bus_number_o,
    output logic [4:0] cfg_device_number_o,
    output logic [2:0] cfg_function_number_o,

    /*
     * TLP output (completion to DMA)
     */
    output logic [(DATA_WIDTH)-1:0] cpl_axis_tdata,
    output logic [(KEEP_WIDTH)-1:0] cpl_axis_tkeep,
    output logic                    cpl_axis_tvalid,
    output logic                    cpl_axis_tlast,
    output logic [  USER_WIDTH-1:0] cpl_axis_tuser,
    input  logic                    cpl_axis_tready
);



  typedef enum logic [4:0] {
    ST_IDLE,
    ST_CFG_RD,
    ST_CFG_WR,
    ST_CFG_WR_DATA,
    ST_CFG_WR_ACK,
    ST_WAIT_RD,
    ST_WAIT_WR,
    ST_SEND_CPL_TLP
  } axis_pcie_conv_t;

  typedef struct {

    axis_pcie_conv_t           state;
    tlp_hdr_union_t            tlp_hdr;
    logic [31:0]               word_count;
    cpl_tlp_hdr_t              cpl_tlp;
    logic [7:0]                cfg_bus_number;
    logic [4:0]                cfg_device_number;
    logic [2:0]                cfg_function_number;
    //tlp type signals
    pcie_tlp_header_dw0_t      tlp_dw0;
    logic                      tlp_is_3dw;
    logic                      tlp_is_sop;
    logic                      tlp_is_pd;
    logic                      tlp_is_eop;
    logic [TLP_DATA_WIDTH-1:0] tlp_data;
    logic [31:0]               length;
  } fsm_struct_t;

  fsm_struct_t D, Q;


  //skid buffer axis signals
  logic [DATA_WIDTH-1:0] s_axis_tdata;
  logic [KEEP_WIDTH-1:0] s_axis_tkeep;
  logic                  s_axis_tvalid;
  logic                  s_axis_tlast;
  logic [USER_WIDTH-1:0] s_axis_tuser;
  logic                  s_axis_tready;
  logic [          31:0] address;

  assign cfg_bus_number_o      = Q.cfg_bus_number;
  assign cfg_device_number_o   = Q.cfg_device_number;
  assign cfg_function_number_o = Q.cfg_function_number;



  //main sequential block
  always_ff @(posedge clk_i) begin : main_seq
    if (rst_i) begin
      Q <= '{state: ST_IDLE, default: 'd0};
    end else begin
      Q <= D;
    end
  end

  // address = (uint32_t)((lbus << 16) | (lslot << 11) |
  // (lfunc << 8) | (offset & 0xFC) | ((uint32_t)0x80000000));
  assign address = {
    1'b1,
    7'h0,
    Q.tlp_hdr.struct_.word_2.byte_0,
    Q.tlp_hdr.struct_.word_2.byte_1,
    Q.tlp_hdr.struct_.word_2.byte_2,
    Q.tlp_hdr.struct_.word_2.byte_3[7:0]
  };
  assign s_axil_awaddr = address;
  assign s_axil_wdata = Q.tlp_data[31:0];
  assign s_axil_wstrb = 4'b1111;
  assign s_axil_araddr = address;


  always_comb begin : main_combo
    D             = Q;
    //skid data
    // tlp_ready        = '0;
    D.tlp_dw0     = '0;
    //tlp signals
    s_axis_tdata  = '0;
    s_axis_tkeep  = '0;
    s_axis_tvalid = '0;
    //  s_axis_tready = '0;
    s_axis_tlast  = '0;
    s_axis_tuser  = '0;
    // tlp_data_word    = '0;
    // tlp_byte_swapped = '0;
    rx_tlp_ready  = '0;
    case (Q.state)
      ST_IDLE: begin
        rx_tlp_ready = '1;
        if (rx_tlp_valid && rx_tlp_sop) begin
          D.tlp_hdr.whole_ = rx_tlp_hdr;
          D.tlp_data       = rx_tlp_data;
          D.tlp_is_eop     = rx_tlp_eop;
          D.word_count     = '0;
          if (D.tlp_hdr.struct_.word_0.byte0 == CfgRd0) begin
            s_axis_tlast = '1;
            D.state = ST_CFG_RD;
          end else if (D.tlp_hdr.struct_.word_0.byte0 == CfgWr0) begin
            D.state = ST_CFG_WR;
          end
        end
      end
      ST_CFG_WR: begin
        s_axil_awvalid = 1'b1;
        // pready         = 1'b0;
        // pslverr        = 1'b0;
        // prdata         = '0;
        s_axil_wvalid = 1'b1;
        s_axil_arvalid = 1'b0;
        s_axil_rready = 1'b0;
        s_axil_bready = 1'b0;
        {D.cfg_bus_number, D.cfg_device_number, D.cfg_function_number} = {
          Q.tlp_hdr.struct_.word_2.byte_0, Q.tlp_hdr.struct_.word_2.byte_1
        };
        if ((s_axil_awready & s_axil_wready) == 1'b1) begin
          D.state = ST_CFG_WR_ACK;
        end else if (s_axil_awready == 1'b1) begin
          D.state = ST_CFG_WR_DATA;
        end else begin
          D.state = ST_CFG_WR;
        end
      end  // case: write

      ST_CFG_WR_DATA: begin
        s_axil_awvalid = 1'b0;
        // pready         = 1'b0;
        // pslverr        = 1'b0;
        // prdata         = '0;
        s_axil_wvalid = 1'b1;
        s_axil_arvalid = 1'b0;
        s_axil_rready = 1'b0;
        s_axil_bready = 1'b0;
        {D.cfg_bus_number, D.cfg_device_number, D.cfg_function_number} = {
          Q.tlp_hdr.struct_.word_2.byte_0, Q.tlp_hdr.struct_.word_2.byte_1
        };
        if (s_axil_wready == 1'b1) begin
          D.state = ST_CFG_WR_ACK;
        end else begin
          D.state = ST_CFG_WR_DATA;
        end
      end  // case: write_data
      ST_CFG_WR_ACK: begin
        s_axil_awvalid = 1'b0;
        // pready         = s_axil_bvalid;
        // pslverr        = s_axil_bresp == '0 ? 1'b0 : s_axil_bvalid;
        // prdata         = '0;
        s_axil_wvalid  = 1'b0;
        s_axil_arvalid = 1'b0;
        s_axil_rready  = 1'b0;
        s_axil_bready  = 1'b1;
        if (s_axil_bvalid == 1'b1) begin
          D.cpl_tlp    = gen_cpl(Q.tlp_hdr, s_axil_rdata);
          D.word_count = '0;
          D.length     = 32'd2;
          D.state      = ST_SEND_CPL_TLP;
        end else begin
          D.state = ST_CFG_WR_ACK;
        end
      end

      ST_CFG_RD: begin
        s_axil_awvalid = 1'b0;
        s_axil_wvalid  = 1'b0;
        s_axil_arvalid = 1'b1;
        s_axil_rready  = 1'b1;
        s_axil_bready  = 1'b0;
        if ((s_axil_arready & s_axil_rvalid) == 1'b1) begin
          D.state = ST_IDLE;
        end else if (s_axil_arready == 1'b1) begin
          D.state = ST_WAIT_RD;
        end
      end  // case: write_ack

      ST_WAIT_RD: begin
        // pready         = s_axil_arready & s_axil_rvalid;
        // pslverr        = s_axil_rresp == '0 ? 1'b0 : s_axil_rvalid;
        // prdata         = s_axil_rdata;
        D.cpl_tlp      = gen_cpld(Q.tlp_hdr, s_axil_rdata);
        s_axil_awvalid = 1'b0;
        s_axil_wvalid  = 1'b0;
        s_axil_arvalid = 1'b0;
        s_axil_rready  = 1'b1;
        s_axil_bready  = 1'b0;
        if (s_axil_rvalid == 1'b1) begin
          D.word_count = '0;
          D.length     = 32'd3;
          D.state      = ST_SEND_CPL_TLP;
        end  // case: read
      end

      ST_WAIT_WR: begin
        // pready         = s_axil_rvalid;
        // pslverr        = s_axil_rresp == '0 ? 1'b0 : s_axil_rvalid;
        // prdata         = s_axil_rdata;
        s_axil_awvalid = 1'b0;
        s_axil_wvalid  = 1'b0;
        s_axil_arvalid = 1'b0;
        s_axil_rready  = 1'b1;
        s_axil_bready  = 1'b0;
        if (s_axil_rvalid == 1'b1) begin
          D.cpl_tlp    = gen_cpl(Q.tlp_hdr, s_axil_rdata);
          D.word_count = '0;
          D.length     = 32'd2;
          D.state      = ST_SEND_CPL_TLP;
        end else begin
          D.state = ST_WAIT_WR;
        end
      end  // case: read_data
      ST_SEND_CPL_TLP: begin
        s_axis_tdata  = Q.cpl_tlp[(32*Q.word_count)+:32];
        s_axis_tkeep  = '1;
        s_axis_tvalid = '1;
        s_axis_tlast  = '0;
        s_axis_tuser  = 8'h2;
        if (s_axis_tready) begin
          D.word_count = Q.word_count + 1'b1;
          //tlp word length reached...
          if ((Q.word_count >= Q.length)) begin
            s_axis_tlast = '1;
            D.state      = ST_IDLE;
          end
        end

      end
      default: begin

      end
    endcase
  end


  //axis skid buffer
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
      .m_axis_tdata (cpl_axis_tdata),
      .m_axis_tkeep (cpl_axis_tkeep),
      .m_axis_tvalid(cpl_axis_tvalid),
      .m_axis_tready(cpl_axis_tready),
      .m_axis_tlast (cpl_axis_tlast),
      .m_axis_tuser (cpl_axis_tuser),
      .m_axis_tid   (),
      .m_axis_tdest ()
  );

endmodule
