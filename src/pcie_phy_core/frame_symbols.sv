//!module: frame_symbols
//! Author: Idris Somoye
//! Module accepts DLLPs or TLPs from the dllp layer and adds framing symbols prior
//! to lane management.
module frame_symbols
  import pcie_phy_pkg::*;
#(
    parameter int USER_WIDTH       = 1,
    parameter int DATA_WIDTH       = 32,                  // Width of AXI stream interfaces in bits
    parameter int KEEP_WIDTH       = ((DATA_WIDTH) / 8),  // tkeep signal width (words per cycle)
    parameter int MAX_PAYLOAD_SIZE = 256,
    parameter int RX_FIFO_SIZE     = 2

) (
    input  logic                         clk_i,             // Clock signal
    input  logic                         rst_i,             // Reset signal
    // input  logic                         phy_link_up_i,
    input  rate_speed_e                  curr_data_rate_i,
    //TLP AXIS inputs
    input  logic        [DATA_WIDTH-1:0] s_axis_tdata,
    input  logic        [KEEP_WIDTH-1:0] s_axis_tkeep,
    input  logic                         s_axis_tvalid,
    input  logic                         s_axis_tlast,
    input  logic        [USER_WIDTH-1:0] s_axis_tuser,
    output logic                         s_axis_tready,
    //TLP AXI output
    output logic        [DATA_WIDTH-1:0] m_axis_tdata,
    output logic        [KEEP_WIDTH-1:0] m_axis_tkeep,
    output logic                         m_axis_tvalid,
    output logic                         m_axis_tlast,
    output logic        [USER_WIDTH-1:0] m_axis_tuser,
    input  logic                         m_axis_tready

);


  //tlp to dllp fsm emum
  typedef enum logic [3:0] {
    ST_IDLE,
    ST_FRAME_STREAM,
    ST_FRAME_GEN_3_TLP,
    ST_FRAME_GEN_3_DLLP,
    ST_FRAME_GEN_3_TLP_SDS,
    ST_FRAME_GEN_3_STREAM,
    ST_FRAME_LAST,
    ST_FRAME_LAST_TLP,
    ST_FRAME_LAST_DLLP,
    ST_FRAME_LAST_DLLP_ALLIGN
  } frame_st_e;

  //fsm holder signals
  frame_st_e                  curr_state;
  frame_st_e                  next_state;
  //phy data out axis signals
  logic      [DATA_WIDTH-1:0] phy_axis_tdata;
  logic      [KEEP_WIDTH-1:0] phy_axis_tkeep;
  logic                       phy_axis_tvalid;
  logic                       phy_axis_tlast;
  logic      [USER_WIDTH-1:0] phy_axis_tuser;
  logic                       phy_axis_tready;

  //buffer axis signals
  logic      [DATA_WIDTH-1:0] buffer_axis_tdata;
  logic      [KEEP_WIDTH-1:0] buffer_axis_tkeep;
  logic                       buffer_axis_tvalid;
  logic                       buffer_axis_tlast;
  logic      [USER_WIDTH-1:0] buffer_axis_tuser;
  logic                       buffer_axis_tready;

  //flow buffer axis stage1 signals
  logic      [DATA_WIDTH-1:0] fifo_axis_tdata;
  logic      [KEEP_WIDTH-1:0] fifo_axis_tkeep;
  logic                       fifo_axis_tvalid;
  logic                       fifo_axis_tlast;
  logic      [USER_WIDTH-1:0] fifo_axis_tuser;
  logic                       fifo_axis_tready;


  logic      [DATA_WIDTH-1:0] mux_axis_tdata;
  logic      [KEEP_WIDTH-1:0] mux_axis_tkeep;
  logic                       mux_axis_tvalid;
  logic                       mux_axis_tlast;
  logic      [USER_WIDTH-1:0] mux_axis_tuser;
  logic                       mux_axis_tready;

  logic      [          15:0] tlp_length_c;
  logic      [          15:0] tlp_length_r;
  logic      [           3:0] fcrc;
  logic                       fp;
  logic                       fifo_ready;
  logic                       fifo_valid;
  logic                       is_tlp_c;
  logic                       is_tlp_r;
  logic                       is_dllp_c;
  logic                       is_dllp_r;
  logic                       mux_axis_buffer;

  always @(posedge clk_i) begin
    if (rst_i) begin
      curr_state <= ST_IDLE;
    end else begin
      curr_state <= next_state;
    end
    tlp_length_r <= tlp_length_c;
    is_tlp_r     <= is_tlp_c;
    is_dllp_r    <= is_dllp_c;
  end


  always_comb begin : main_seq
    next_state      = curr_state;
    phy_axis_tdata  = '0;
    phy_axis_tkeep  = '0;
    phy_axis_tvalid = '0;
    phy_axis_tlast  = '0;
    phy_axis_tuser  = '0;
    s_axis_tready   = '0;
    fifo_valid      = '0;
    mux_axis_buffer = '0;
    is_tlp_c        = is_tlp_r;
    is_dllp_c       = is_dllp_r;
    tlp_length_c    = tlp_length_r;

    if (!mux_axis_buffer) begin
      mux_axis_tdata  = s_axis_tdata;
      mux_axis_tkeep  = s_axis_tkeep;
      mux_axis_tvalid = s_axis_tvalid;
      mux_axis_tlast  = s_axis_tlast;
      mux_axis_tuser  = s_axis_tuser;
    end else begin
      mux_axis_tdata  = fifo_axis_tdata;
      mux_axis_tkeep  = fifo_axis_tkeep;
      mux_axis_tvalid = fifo_axis_tvalid;
      mux_axis_tlast  = fifo_axis_tlast;
      mux_axis_tuser  = fifo_axis_tuser;
    end
    case (curr_state)
      //wait until pipeline is full and upstream ready
      //store packet, because we're shifting the data to fit in
      //the seq number, we'll need to save 2 bytes of this packet
      ST_IDLE: begin
        if (phy_axis_tready && s_axis_tvalid) begin
          phy_axis_tvalid = '1;
          phy_axis_tkeep  = '1;
          if (curr_data_rate_i < gen3) begin
            s_axis_tready = '1;
            phy_axis_tdata = {s_axis_tdata[23:0], s_axis_tuser[0] ? SDP : STP};
            phy_axis_tuser = 4'b0001;
            next_state = ST_FRAME_STREAM;
          end else begin
            if (s_axis_tuser[0]) begin
              is_dllp_c      = '1;
              is_tlp_c       = '0;
              s_axis_tready  = '1;
              phy_axis_tdata = {s_axis_tdata[15:0], GEN3_SDP[15:0]};
              phy_axis_tuser = 4'b0011;
              next_state     = ST_FRAME_GEN_3_DLLP;
            end else if (s_axis_tuser[1] && fifo_ready) begin
              is_dllp_c     = '0;
              is_tlp_c      = '1;
              fifo_valid    = '1;
              s_axis_tready = '1;
              next_state    = ST_FRAME_GEN_3_TLP;
            end
          end
        end
      end
      ST_FRAME_STREAM: begin
        s_axis_tready   = phy_axis_tready;
        if (s_axis_tready && s_axis_tvalid) begin
          s_axis_tready   = '1;
          phy_axis_tvalid = '1;
          phy_axis_tdata  = {s_axis_tdata[23:0], buffer_axis_tdata[31:24]};
          phy_axis_tkeep  = {s_axis_tkeep[2:0], buffer_axis_tkeep[3]};
          if (s_axis_tlast) begin
            next_state = ST_IDLE;
            // phy_axis_tlast = '1;
            case (s_axis_tkeep)
              4'b0001: begin
                phy_axis_tdata[23:16] = ENDP;
                phy_axis_tkeep[2]     = '1;
                phy_axis_tuser        = 4'b0100;
                phy_axis_tlast        = '1;
              end
              4'b0011: begin
                phy_axis_tdata[31:24] = ENDP;
                phy_axis_tuser        = 4'b1000;
                phy_axis_tlast        = '1;
                phy_axis_tkeep[3]     = '1;
              end
              default: begin
                next_state = ST_FRAME_LAST;
              end
            endcase
          end
        end
      end
      ST_FRAME_GEN_3_DLLP: begin
        if (phy_axis_tready && s_axis_tvalid) begin
          s_axis_tready   = '1;
          phy_axis_tvalid = '1;
          phy_axis_tdata  = {s_axis_tdata[15:0], buffer_axis_tdata[31:16]};
          phy_axis_tkeep  = {s_axis_tkeep[1:0], buffer_axis_tkeep[3:2]};
          if (s_axis_tlast) begin
            phy_axis_tlast = '1;
            next_state = ST_IDLE;
            case (s_axis_tkeep)
              4'b0001, 4'b0011: begin
              end
              default: begin
                phy_axis_tlast = '0;
                next_state = ST_FRAME_LAST_DLLP;
              end
            endcase
          end
        end
      end
      ST_FRAME_GEN_3_TLP: begin
        s_axis_tready = fifo_ready;
        fifo_valid    = '1;
        if (fifo_ready && s_axis_tvalid) begin
          tlp_length_c = tlp_length_r + 1'b1;
          if (s_axis_tlast) begin
            next_state = ST_FRAME_GEN_3_TLP_SDS;
            if (s_axis_tkeep != 4'b0011) begin
              //this is bad.. misalliged tlp. goto idle
              next_state = ST_IDLE;
            end
          end
        end
      end
      ST_FRAME_GEN_3_TLP_SDS: begin
        fifo_axis_tready = phy_axis_tready;
        mux_axis_buffer  = '1;
        if (phy_axis_tready && fifo_axis_tvalid) begin
          phy_axis_tvalid = '1;
          phy_axis_tuser  = '1;
          gen_fcrc_parity(fcrc, fp, tlp_length_r);
          gen_stp_gen3(phy_axis_tdata, fp, fcrc, tlp_length_r, {
                       fifo_axis_tdata[15:8], fifo_axis_tdata[3:0]});
          next_state = ST_FRAME_GEN_3_STREAM;
        end
      end
      ST_FRAME_GEN_3_STREAM: begin
        fifo_axis_tready = phy_axis_tready;
        if (phy_axis_tready && fifo_axis_tvalid) begin
          phy_axis_tvalid = '1;
          phy_axis_tdata  = {fifo_axis_tdata[15:0], buffer_axis_tdata[31:16]};
          phy_axis_tkeep  = {fifo_axis_tdata[1:0], buffer_axis_tkeep[3:2]};
          if (fifo_axis_tlast) begin
            next_state = ST_FRAME_LAST_DLLP;
            case (fifo_axis_tkeep)
              4'b0001, 4'b0011: begin
              end
              default: begin
                next_state = ST_FRAME_LAST_DLLP;
              end
            endcase
          end
        end
      end
      ST_FRAME_LAST: begin
        if (phy_axis_tready) begin
          next_state = ST_IDLE;
          phy_axis_tvalid = '1;
          case (buffer_axis_tkeep)
            4'b0111: begin
              phy_axis_tuser      = 4'b0001;
              phy_axis_tdata[7:0] = ENDP;
              phy_axis_tkeep      = 4'b0001;
            end
            4'b1111: begin
              phy_axis_tuser = 4'b0010;
              phy_axis_tdata = {ENDP, buffer_axis_tdata[31:24]};
              phy_axis_tkeep = 4'b0011;
            end
            default: begin
            end
          endcase
        end
      end
      ST_FRAME_LAST_DLLP: begin  //unreachable in current design
        if (phy_axis_tready) begin
          next_state = ST_IDLE;
          phy_axis_tvalid = '1;
          case (buffer_axis_tkeep)
            4'b0111: begin
              phy_axis_tdata[15:0] = buffer_axis_tdata[23:16];
              phy_axis_tkeep[1:0]  = buffer_axis_tkeep[3];
            end
            4'b1111: begin
              phy_axis_tdata[15:0] = buffer_axis_tdata[31:16];
              phy_axis_tkeep       = buffer_axis_tkeep[3:2];
            end
            default: begin
            end
          endcase
        end
      end
      ST_FRAME_LAST_DLLP_ALLIGN: begin  //unreachable in current design
        if (phy_axis_tready) begin
          next_state      = ST_IDLE;
          phy_axis_tvalid = '1;
          phy_axis_tlast  = '1;
          case (buffer_axis_tkeep)
            4'b0111: begin
              phy_axis_tuser = 4'b0001;
              phy_axis_tdata = GEN3_EDS[31:24];
              phy_axis_tkeep = 4'b0001;
            end
            4'b1111: begin
              phy_axis_tuser    = 4'b0011;
              phy_axis_tdata    = GEN3_EDS[31:16];
              phy_axis_tkeep[0] = 4'b0011;
            end
            default: begin
            end
          endcase
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
  ) axis_buffer_register_inst (
      .clk(clk_i),
      .rst(rst_i),
      .s_axis_tdata(mux_axis_tdata),
      .s_axis_tkeep(mux_axis_tkeep),
      .s_axis_tvalid(mux_axis_tvalid),
      .s_axis_tready(),
      .s_axis_tlast(mux_axis_tlast),
      .s_axis_tid('0),
      .s_axis_tdest('0),
      .s_axis_tuser(mux_axis_tuser),
      .m_axis_tdata(buffer_axis_tdata),
      .m_axis_tkeep(buffer_axis_tkeep),
      .m_axis_tvalid(buffer_axis_tvalid),
      .m_axis_tready(phy_axis_tready && mux_axis_tvalid),
      .m_axis_tlast(buffer_axis_tlast),
      .m_axis_tid(),
      .m_axis_tdest(),
      .m_axis_tuser(buffer_axis_tuser)
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
  ) axis_output_register_inst (
      .clk(clk_i),
      .rst(rst_i),
      .s_axis_tdata(phy_axis_tdata),
      .s_axis_tkeep(phy_axis_tkeep),
      .s_axis_tvalid(phy_axis_tvalid),
      .s_axis_tready(phy_axis_tready),
      .s_axis_tlast(phy_axis_tlast),
      .s_axis_tid('0),
      .s_axis_tdest('0),
      .s_axis_tuser(phy_axis_tuser),
      .m_axis_tdata(m_axis_tdata),
      .m_axis_tkeep(m_axis_tkeep),
      .m_axis_tvalid(m_axis_tvalid),
      .m_axis_tready(m_axis_tready),
      .m_axis_tlast(m_axis_tlast),
      .m_axis_tid(),
      .m_axis_tdest(),
      .m_axis_tuser(m_axis_tuser)
  );


  //dllp2tlp fifo.. allows for processing tlp
  //and storing to confirm proper tlp seq num and crc..
  //before sending to the transaction layer
  axis_fifo #(
      .DEPTH(RX_FIFO_SIZE * MAX_PAYLOAD_SIZE),
      .DATA_WIDTH(DATA_WIDTH),
      .KEEP_ENABLE(KEEP_WIDTH > 0),
      .KEEP_WIDTH(KEEP_WIDTH),
      .LAST_ENABLE(1),
      .ID_ENABLE(0),
      .DEST_ENABLE(0),
      .USER_ENABLE('1),
      .USER_WIDTH(USER_WIDTH),
      // .PIPELINE_OUTPUT(2),
      .FRAME_FIFO(1),
      .USER_BAD_FRAME_VALUE('1),
      .USER_BAD_FRAME_MASK('1),
      // .PIPELINE_OUTPUT(),
      .DROP_BAD_FRAME(1),
      .DROP_WHEN_FULL(0)
  ) dllp2tlp_fifo_inst (
      .clk(clk_i),
      .rst(rst_i),
      // AXI input
      .s_axis_tdata(s_axis_tdata),
      .s_axis_tkeep(s_axis_tkeep),
      .s_axis_tvalid(s_axis_tvalid && fifo_valid),
      .s_axis_tready(fifo_ready),
      .s_axis_tlast(s_axis_tlast),
      .s_axis_tuser(s_axis_tuser),
      .s_axis_tid(),
      .s_axis_tdest(),
      // AXI output
      .m_axis_tdata(fifo_axis_tdata),
      .m_axis_tkeep(fifo_axis_tkeep),
      .m_axis_tvalid(fifo_axis_tvalid),
      .m_axis_tready(fifo_axis_tready),
      .m_axis_tlast(fifo_axis_tlast),
      .m_axis_tuser(fifo_axis_tuser),
      .m_axis_tid(),
      .m_axis_tdest(),
      .pause_ack(),
      .pause_req(),
      .status_depth(),
      .status_depth_commit(),
      // Status
      .status_overflow(),
      .status_bad_frame(),
      .status_good_frame()
  );

endmodule
