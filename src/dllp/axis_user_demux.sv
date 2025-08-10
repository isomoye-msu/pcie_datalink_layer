//! @title dllp2tlp
//! @author Idris Somoye
//! Module splits axis tlp into two ouputs based on user flag
//!
module axis_user_demux
  import pcie_datalink_pkg::*;
#(
    // TLP data width
    parameter int DATA_WIDTH = 32,
    // TLP strobe width
    parameter int STRB_WIDTH = DATA_WIDTH / 8,
    parameter int KEEP_WIDTH = STRB_WIDTH,
    parameter int USER_WIDTH = 1,
    parameter int MAX_PAYLOAD_SIZE = 256,
    parameter int RX_FIFO_SIZE = 2
) (
    //clocks and resets
    input  logic                               clk_i,              // Clock signal
    input  logic                               rst_i,              // Reset signal
    //link status
    input  pcie_dl_status_e                    link_status_i,
    //TLP AXIS inputs
    input  logic            [  DATA_WIDTH-1:0] s_axis_tdata,
    input  logic            [  KEEP_WIDTH-1:0] s_axis_tkeep,
    input  logic                               s_axis_tvalid,
    input  logic                               s_axis_tlast,
    input  logic            [  USER_WIDTH-1:0] s_axis_tuser,
    output logic                               s_axis_tready,
    //to tlp
    output logic            [(DATA_WIDTH)-1:0] m_tlp_axis_tdata,
    output logic            [(KEEP_WIDTH)-1:0] m_tlp_axis_tkeep,
    output logic                               m_tlp_axis_tvalid,
    output logic                               m_tlp_axis_tlast,
    output logic            [(USER_WIDTH)-1:0] m_tlp_axis_tuser,
    input  logic                               m_tlp_axis_tready,

    //to dllp
    output logic [(DATA_WIDTH)-1:0] m_dllp_axis_tdata,
    output logic [(KEEP_WIDTH)-1:0] m_dllp_axis_tkeep,
    output logic                    m_dllp_axis_tvalid,
    output logic                    m_dllp_axis_tlast,
    output logic [(USER_WIDTH)-1:0] m_dllp_axis_tuser,
    input  logic                    m_dllp_axis_tready
);

  localparam int UserIsTlp = 1;
  localparam int UserIsDllp = 0;

  //tlp to dllp fsm emum
  typedef enum logic [2:0] {
    ST_IDLE,
    ST_STREAM,
    ST_DLLP,
    ST_TLP
  } demux_st_e;

  demux_st_e curr_state;
  demux_st_e next_state;


  logic dllp_valid;
  logic tlp_valid;


  logic tlp_ready;
  logic dllp_ready;

  always @(posedge clk_i) begin : main_seq
    if (rst_i) begin
      curr_state <= ST_IDLE;
    end else begin
      curr_state <= next_state;
    end
  end

  always_comb begin : main_combo
    next_state = curr_state;
    dllp_valid = '0;
    tlp_valid = '0;
    s_axis_tready = '0;
    case (curr_state)
      ST_IDLE: begin
        if (s_axis_tvalid) begin
          if (s_axis_tuser[UserIsTlp]) begin
            s_axis_tready = m_tlp_axis_tready;
            tlp_valid = s_axis_tvalid;
            next_state = ST_TLP;
          end else if (s_axis_tuser[UserIsDllp]) begin
            s_axis_tready = m_dllp_axis_tready;
            dllp_valid = s_axis_tvalid;
            next_state = ST_DLLP;
          end
        end
      end
      ST_TLP: begin
        s_axis_tready = tlp_ready;
        tlp_valid = s_axis_tvalid;
        if (s_axis_tvalid && tlp_ready && s_axis_tlast) begin
          next_state = ST_IDLE;
        end
      end
      ST_DLLP: begin
        s_axis_tready = dllp_ready;
        dllp_valid = s_axis_tvalid;
        if (s_axis_tvalid && dllp_ready && s_axis_tlast) begin
          next_state = ST_IDLE;
        end
      end
      default: begin
      end
    endcase

  end



  //axis skid buffer
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
  ) dllp_axis_register_inst (
      .clk(clk_i),
      .rst(rst_i),
      .s_axis_tdata(s_axis_tdata),
      .s_axis_tkeep(s_axis_tkeep),
      .s_axis_tvalid(dllp_valid),
      .s_axis_tready(dllp_ready),
      .s_axis_tlast(s_axis_tlast),
      .s_axis_tid('0),
      .s_axis_tdest('0),
      .s_axis_tuser(s_axis_tuser),
      .m_axis_tdata(m_dllp_axis_tdata),
      .m_axis_tkeep(m_dllp_axis_tkeep),
      .m_axis_tvalid(m_dllp_axis_tvalid),
      .m_axis_tready(m_dllp_axis_tready),
      .m_axis_tlast(m_dllp_axis_tlast),
      .m_axis_tid(),
      .m_axis_tdest(),
      .m_axis_tuser(m_dllp_axis_tuser)
  );


  //axis skid buffer
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
  ) tlp_axis_register_inst (
      .clk(clk_i),
      .rst(rst_i),
      .s_axis_tdata(s_axis_tdata),
      .s_axis_tkeep(s_axis_tkeep),
      .s_axis_tvalid(tlp_valid),
      .s_axis_tready(tlp_ready),
      .s_axis_tlast(s_axis_tlast),
      .s_axis_tid('0),
      .s_axis_tdest('0),
      .s_axis_tuser(s_axis_tuser),
      .m_axis_tdata(m_tlp_axis_tdata),
      .m_axis_tkeep(m_tlp_axis_tkeep),
      .m_axis_tvalid(m_tlp_axis_tvalid),
      .m_axis_tready(m_tlp_axis_tready),
      .m_axis_tlast(m_tlp_axis_tlast),
      .m_axis_tid(),
      .m_axis_tdest(),
      .m_axis_tuser(m_tlp_axis_tuser)
  );

endmodule
