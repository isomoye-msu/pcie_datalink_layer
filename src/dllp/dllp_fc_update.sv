// import pcie_datalink_pkg::*;
module dllp_fc_update
  import pcie_datalink_pkg::*;
#(
    parameter int CLK_RATE         = 100,
    // TLP data width
    parameter int DATA_WIDTH       = 32,
    // TLP strobe width
    parameter int STRB_WIDTH       = DATA_WIDTH / 8,
    parameter int KEEP_WIDTH       = STRB_WIDTH,
    parameter int USER_WIDTH       = 3,
    parameter int MAX_PAYLOAD_SIZE = 256
) (
    input  logic                   clk_i,                     // Clock signal
    input  logic                   rst_i,                     // Reset signal
    //link status
    input  pcie_dl_status_e        link_status_i,
    //flow control signals
    input  logic                   start_flow_control_i,
    output logic                   start_flow_control_ack_o,
    input  logic            [15:0] next_transmit_seq_i,
    input  logic                   tlp_nullified_i,
    input  logic            [ 7:0] ph_credits_consumed_i,
    input  logic            [11:0] pd_credits_consumed_i,
    input  logic            [ 7:0] nph_credits_consumed_i,
    input  logic            [11:0] npd_credits_consumed_i,

    /*
     * DLLP UPDATE AXI output
     */
    output logic [(DATA_WIDTH)-1:0] m_axis_tdata,
    output logic [(KEEP_WIDTH)-1:0] m_axis_tkeep,
    output logic                    m_axis_tvalid,
    output logic                    m_axis_tlast,
    output logic [  USER_WIDTH-1:0] m_axis_tuser,
    input  logic                    m_axis_tready
);

  localparam int PdMinCredits = MAX_PAYLOAD_SIZE >> 4;

  // localparam int PdMinCredits = ((8 << (5 + MAX_PAYLOAD_SIZE)) / 4 / 4);
  // localparam int HdrMinCredits = 8'h040;
  localparam int ClockPeriodNs = ((10 ** 3) / CLK_RATE);
  localparam int TwoMsTimeOut = (2 * (10 ** 4)) / ClockPeriodNs;
  localparam int FcWaitPeriod = TwoMsTimeOut;
  // localparam int TwoMsTimeOut = (CLK_RATE * (2 ** 5));  //32'h000B8D80;  //temp value

  typedef enum logic [4:0] {
    ST_IDLE,
    ST_SEND_ACK,
    ST_SEND_ACK_CRC,
    ST_UPDATE_P,
    ST_UPDATE_CRC,
    ST_UPDATE_NP,
    ST_UPDATE_NP_CRC,
    ST_UPDATE_CPL,
    ST_UPDATE_CPL_CRC,
    ST_WAIT_LOW
  } fc_update_state_e;


  //axis registered output signals
  logic             [DATA_WIDTH-1:0] fc_axis_tdata;
  logic             [KEEP_WIDTH-1:0] fc_axis_tkeep;
  logic                              fc_axis_tvalid;
  logic                              fc_axis_tlast;
  logic             [USER_WIDTH-1:0] fc_axis_tuser;
  logic                              fc_axis_tready;
  // Internal state machine for link flow control
  fc_update_state_e                  curr_state;
  fc_update_state_e                  next_state;
  dllp_fc_t                          dll_packet_c;
  dllp_fc_t                          dll_packet_r;
  logic             [          15:0] dllp_lcrc_c;
  logic             [          15:0] dllp_lcrc_r;
  logic             [          15:0] timer_c;
  logic             [          15:0] timer_r;
  logic             [          15:0] crc_out;
  logic             [          15:0] crc_reversed;
  logic                              start_ack_c;
  logic                              start_ack_r;

  //crc byteswap
  always_comb begin : byteswap
    crc_reversed[7:0]  = ~dllp_lcrc_r[7:0];
    crc_reversed[15:8] = ~dllp_lcrc_r[15:8];
    // for (int i = 0; i < 8; i++) begin
    //   crc_reversed[i]   = dllp_lcrc_r[7-i];
    //   crc_reversed[i+8] = dllp_lcrc_r[15-i];
    // end
  end

  // Initialize to idle state
  always_ff @(posedge clk_i) begin : main_seq
    if (rst_i) begin
      curr_state <= ST_IDLE;
      dll_packet_r <= '0;
      timer_r <= '0;
      dllp_lcrc_r <= '0;
      start_ack_r <= '0;
    end else begin
      curr_state <= next_state;
      dll_packet_r <= dll_packet_c;
      timer_r <= timer_c;
      dllp_lcrc_r <= dllp_lcrc_c;
      start_ack_r <= start_ack_c;

    end
  end


  always_comb begin : combo_block
    next_state     = curr_state;
    dll_packet_c   = dll_packet_r;
    timer_c        = timer_r;
    start_ack_c    = '0;
    //axis flow control defaults
    fc_axis_tdata  = '0;
    fc_axis_tkeep  = '0;
    fc_axis_tvalid = '0;
    fc_axis_tlast  = '0;
    fc_axis_tuser  = 4'h01;
    //crc signals
    dllp_lcrc_c    = dllp_lcrc_r;
    case (curr_state)
      ST_IDLE: begin
        timer_c = (timer_r >= FcWaitPeriod) ? FcWaitPeriod : timer_r + 1;
        if (start_flow_control_i) begin
          next_state = ST_SEND_ACK;
          timer_c    = '0;
        end else if ((timer_r >= FcWaitPeriod) && (link_status_i == DL_ACTIVE)) begin
          timer_c    = '0;
          next_state = ST_UPDATE_P;
        end
      end
      ST_SEND_ACK: begin
        //build axis master output
        fc_axis_tdata  = set_ack_nack(tlp_nullified_i ? Nak : Ack, next_transmit_seq_i[11:0]);
        dllp_lcrc_c    = crc_out;
        fc_axis_tkeep  = '1;
        fc_axis_tvalid = '1;
        if (fc_axis_tready) begin
          next_state = ST_SEND_ACK_CRC;
        end
      end
      ST_SEND_ACK_CRC: begin
        //build axis master output
        fc_axis_tdata  = crc_reversed;
        fc_axis_tkeep  = 8'h3;
        fc_axis_tvalid = '1;
        fc_axis_tlast  = '1;
        if (fc_axis_tready) begin
          next_state = ST_UPDATE_P;
          if (tlp_nullified_i) begin
            start_ack_c = '1;
            next_state  = ST_WAIT_LOW;
          end
        end
      end
      ST_UPDATE_P: begin
        //build dllp fc update for crc
        //build axis master output
        fc_axis_tdata =
            send_fc_init(UpdateFC_P, '0, ph_credits_consumed_i, pd_credits_consumed_i + FcPData);
        dllp_lcrc_c = crc_out;
        fc_axis_tkeep = '1;
        fc_axis_tvalid = '1;
        //done with dllp
        if (fc_axis_tready) begin
          next_state = ST_UPDATE_CRC;
        end
      end
      ST_UPDATE_CRC: begin
        //build axis master output
        fc_axis_tdata  = crc_reversed;
        fc_axis_tkeep  = 8'h03;
        fc_axis_tvalid = '1;
        fc_axis_tlast  = '1;
        //done with dllp
        if (fc_axis_tready) begin
          next_state = ST_UPDATE_NP;
        end
      end
      ST_UPDATE_NP: begin
        //build axis master output
        dllp_lcrc_c = crc_out;
        fc_axis_tkeep = '1;
        fc_axis_tvalid = '1;
        //build dllp fc update for crc
        fc_axis_tdata = send_fc_init(UpdateFC_NP, '0, nph_credits_consumed_i,
                                     npd_credits_consumed_i + FcNpData);
        //done with dllp
        if (fc_axis_tready) begin
          next_state = ST_UPDATE_NP_CRC;
        end
      end
      ST_UPDATE_NP_CRC: begin
        //build axis master output
        fc_axis_tdata  = crc_reversed;
        fc_axis_tkeep  = 8'h03;
        fc_axis_tvalid = '1;
        fc_axis_tlast  = '1;
        //done with dllp
        if (fc_axis_tready) begin
          next_state = ST_UPDATE_CPL;
        end
      end
      //send np
      ST_UPDATE_CPL: begin
        //build dllp fc update for crc
        fc_axis_tdata =
            send_fc_init(UpdateFC_Cpl, '0, '0, '0);
        dllp_lcrc_c = crc_out;
        //build axis master output
        fc_axis_tkeep = '1;
        fc_axis_tvalid = '1;
        //done with dllp
        if (fc_axis_tready) begin
          next_state = ST_UPDATE_CPL_CRC;
        end
      end
      ST_UPDATE_CPL_CRC: begin
        //build axis master output
        fc_axis_tdata  = crc_reversed;
        fc_axis_tkeep  = 8'h03;
        fc_axis_tvalid = '1;
        fc_axis_tlast  = '1;
        //done with dllp
        if (fc_axis_tready) begin
          timer_c = '0;
          start_ack_c = '1;
          next_state = ST_WAIT_LOW;
        end
      end
      ST_WAIT_LOW: begin
        start_ack_c = '1;
        if (!start_flow_control_i) begin
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
  ) axis_register_pipeline_inst (
      .clk(clk_i),
      .rst(rst_i),
      .s_axis_tdata(fc_axis_tdata),
      .s_axis_tkeep(fc_axis_tkeep),
      .s_axis_tvalid(fc_axis_tvalid),
      .s_axis_tready(fc_axis_tready),
      .s_axis_tlast(fc_axis_tlast),
      .s_axis_tuser(fc_axis_tuser),
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

  pcie_datalink_crc dllp_crc_inst (
      .crcIn ('1),
      .data  (fc_axis_tdata),
      .crcOut(crc_out)
  );

  assign start_flow_control_ack_o = start_ack_r;

endmodule
