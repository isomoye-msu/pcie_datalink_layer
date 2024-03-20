//!module: axis_retry_fifo
//! Author: Idris Somoye
//! Module implements a retry management FIFO. Stores TLPs as axis frames. 
//! Module resets read and write pointer after every frame allowing for retransmission
//! as long as data is not overwritten.
module axis_retry_fifo
  import pcie_datalink_pkg::*;
#(
    // TLP data width
    parameter int DATA_WIDTH       = 32,
    // TLP strobe width
    parameter int STRB_WIDTH       = DATA_WIDTH / 8,
    parameter int KEEP_WIDTH       = STRB_WIDTH,
    parameter int USER_WIDTH       = 1,
    parameter int MAX_PAYLOAD_SIZE = 256
) (
    input logic clk_i,  // Clock signal
    input logic rst_i,  // Reset signal


    //! @virtualbus TLP_axis_inputs @dir in
    input  logic [DATA_WIDTH-1:0] s_axis_tdata,
    input  logic [KEEP_WIDTH-1:0] s_axis_tkeep,
    input  logic                  s_axis_tvalid,
    input  logic                  s_axis_tlast,
    input  logic [USER_WIDTH-1:0] s_axis_tuser,
    output logic                  s_axis_tready,
    //! @end
    //! @virtualbus TLP_axis_outputs @dir out
    output logic [DATA_WIDTH-1:0] m_axis_tdata,
    output logic [KEEP_WIDTH-1:0] m_axis_tkeep,
    output logic                  m_axis_tvalid,
    output logic                  m_axis_tlast,
    output logic [USER_WIDTH-1:0] m_axis_tuser,
    input  logic                  m_axis_tready
    //! @end
);

  localparam int MaxHdrSize = 4;
  localparam int MaxPktSize = (MAX_PAYLOAD_SIZE >> 2) + MaxHdrSize;

  //axis packet holder struct
  typedef struct packed {
    logic                  tvalid;
    logic [USER_WIDTH-1:0] tuser;
    logic                  tlast;
    logic [KEEP_WIDTH-1:0] tkeep;
    logic [DATA_WIDTH-1:0] tdata;
  } axis_tlp_pkt_t;

  //incoming surbodanate axis helper struct
  axis_tlp_pkt_t                  s_axis;
  //outgoing surbodanate axis helper struct
  axis_tlp_pkt_t                  m_axis;
  //write pointer signals
  logic          [          15:0] wr_ptr_c;
  logic          [          15:0] wr_ptr_r;
  //read pointer signals
  logic          [          15:0] rd_ptr_c;
  logic          [          15:0] rd_ptr_r;
  axis_tlp_pkt_t                  axis_mem_c        [MaxPktSize];
  axis_tlp_pkt_t                  axis_mem_r        [MaxPktSize];
  logic                           frame_available_c;
  logic                           frame_available_r;
  //axis signals
  logic          [DATA_WIDTH-1:0] retry_axis_tdata;
  logic          [KEEP_WIDTH-1:0] retry_axis_tkeep;
  logic                           retry_axis_tvalid;
  logic                           retry_axis_tlast;
  logic          [USER_WIDTH-1:0] retry_axis_tuser;
  logic                           retry_axis_tready;


  always_ff @(posedge clk_i) begin : main_seq
    if (rst_i) begin
      wr_ptr_r          <= '0;
      rd_ptr_r          <= '0;
      frame_available_r <= '0;
    end else begin
      wr_ptr_r          <= wr_ptr_c;
      rd_ptr_r          <= rd_ptr_c;
      frame_available_r <= frame_available_c;
    end
    //non-resetable
    axis_mem_r <= axis_mem_c;
  end


  //simple write logic overflow is handled by retry management module
  always_comb begin : write_logic
    axis_mem_c        = axis_mem_r;
    s_axis.tdata      = s_axis_tdata;
    s_axis.tkeep      = s_axis_tkeep;
    s_axis.tlast      = s_axis_tlast;
    s_axis.tuser      = s_axis_tuser;
    s_axis.tvalid     = s_axis_tvalid;
    wr_ptr_c          = wr_ptr_r;
    s_axis_tready     = '1;
    frame_available_c = frame_available_r;
    if (s_axis_tvalid && s_axis_tready) begin
      axis_mem_c[wr_ptr_r] = s_axis;
      wr_ptr_c             = wr_ptr_r + 1'b1;
      if (s_axis_tlast) begin
        wr_ptr_c          = '0;
        frame_available_c = '1;
      end
    end
  end

  //read out data to master
  always_comb begin : read_logic
    retry_axis_tdata  = '0;
    retry_axis_tkeep  = '0;
    retry_axis_tvalid = '0;
    retry_axis_tlast  = '0;
    retry_axis_tuser  = '0;
    rd_ptr_c          = rd_ptr_r;
    m_axis            = axis_mem_r[rd_ptr_r];
    if (retry_axis_tready && frame_available_r) begin
      retry_axis_tvalid = m_axis.tvalid;
      retry_axis_tdata  = m_axis.tdata;
      retry_axis_tkeep  = m_axis.tkeep;
      retry_axis_tlast  = m_axis.tlast;
      retry_axis_tuser  = m_axis.tuser;
      rd_ptr_c          = rd_ptr_r + 1'b1;
      if (m_axis.tlast) begin
        rd_ptr_c = '0;
      end
    end
  end


  //output register for axis fifo
  axis_register #(
      .DATA_WIDTH(DATA_WIDTH),
      .KEEP_ENABLE('1),
      .KEEP_WIDTH(KEEP_WIDTH),
      .LAST_ENABLE('1),
      .ID_ENABLE('0),
      .ID_WIDTH(1),
      .DEST_ENABLE('0),
      .DEST_WIDTH(1),
      .USER_ENABLE('1),
      .USER_WIDTH(USER_WIDTH),
      .REG_TYPE(SkidBuffer)
  ) axis_register_inst (
      .clk(clk_i),
      .rst(rst_i),
      .s_axis_tdata(retry_axis_tdata),
      .s_axis_tkeep(retry_axis_tkeep),
      .s_axis_tvalid(retry_axis_tvalid),
      .s_axis_tready(retry_axis_tready),
      .s_axis_tlast(retry_axis_tlast),
      .s_axis_tuser(retry_axis_tuser),
      .s_axis_tid('0),
      .s_axis_tdest('0),
      .m_axis_tdata(m_axis_tdata),
      .m_axis_tkeep(m_axis_tkeep),
      .m_axis_tvalid(m_axis_tvalid),
      .m_axis_tready(m_axis_tready),
      .m_axis_tlast(m_axis_tlast),
      .m_axis_tuser(m_axis_tuser),
      .m_axis_tid(),
      .m_axis_tdest()
  );


endmodule
