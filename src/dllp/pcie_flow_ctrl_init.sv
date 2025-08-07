// import pcie_datalink_pkg::*;
module pcie_flow_ctrl_init
  import pcie_datalink_pkg::*;
#(
    // TLP data width
    parameter int DATA_WIDTH = 32,
    // TLP strobe width
    parameter int STRB_WIDTH = DATA_WIDTH / 8,
    parameter int KEEP_WIDTH = STRB_WIDTH,
    parameter int USER_WIDTH = 3,
    parameter int MAX_PAYLOAD_SIZE = 256
) (
    input logic clk_i,                 // Clock signal
    input logic rst_i,                 // Reset signal
    input logic start_flow_control_i,
    input logic fc1_values_stored_i,
    input logic fc2_values_stored_i,

    /*
     * DLLP UPDATE AXI output
     */
    output logic [(DATA_WIDTH)-1:0] m_axis_tdata,
    output logic [(KEEP_WIDTH)-1:0] m_axis_tkeep,
    output logic                    m_axis_tvalid,
    output logic                    m_axis_tlast,
    output logic [  USER_WIDTH-1:0] m_axis_tuser,
    input  logic                    m_axis_tready,
    output logic                    fc2_values_sent_o,
    output logic                    init_ack_o
);


  localparam int PdMinCredits = MAX_PAYLOAD_SIZE >> 4;  //((8 << (5 + MAX_PAYLOAD_SIZE)) / 4);
  localparam int FcWaitPeriod = 8'hA0;

  typedef enum logic [4:0] {
    ST_IDLE,
    ST_FC1_P,
    ST_FC1_CRC,
    ST_FC1_NP,
    ST_FC1_NP_CRC,
    ST_FC1_CPL,
    ST_FC1_CPL_CRC,
    CHECK_FC1,
    ST_FC2,
    ST_FC2_CRC,
    ST_FC2_P,
    ST_FC2_P_CRC,
    ST_FC2_NP,
    ST_FC2_NP_CRC,
    ST_FC2_CPL,
    ST_FC2_CPL_CRC,
    CHECK_FC2,
    ST_FC_COMPLETE
  } flow_control_state_e;


  //axis registered output signals
  logic                [DATA_WIDTH-1:0] fc_axis_tdata;
  logic                [KEEP_WIDTH-1:0] fc_axis_tkeep;
  logic                                 fc_axis_tvalid;
  logic                                 fc_axis_tlast;
  logic                [USER_WIDTH-1:0] fc_axis_tuser;
  logic                                 fc_axis_tready;

  // Internal state machine for link flow control
  flow_control_state_e                  curr_state;
  flow_control_state_e                  next_state;
  dllp_fc_t                             dll_packet_c;
  dllp_fc_t                             dll_packet_r;
  logic                [          15:0] dllp_lcrc_c;
  logic                [          15:0] dllp_lcrc_r;
  logic                [          15:0] seq_count_c;
  logic                [          15:0] seq_count_r;
  logic                [          15:0] crc_out;
  logic                [          15:0] crc_reversed;


  always_comb begin : byteswap
    crc_reversed[7:0] = ~dllp_lcrc_r[15:8];
    crc_reversed[15:8] = ~dllp_lcrc_r[7:0];
    // for (int i = 0; i < 8; i++) begin
    //   crc_reversed[i]   = dllp_lcrc_r[7-i];
    //   crc_reversed[i+8] = dllp_lcrc_r[15-i];
    // end
  end

  // Initialize to idle state
  always_ff @(posedge clk_i) begin : main_seq
    if (rst_i) begin
      curr_state   <= ST_IDLE;
      dll_packet_r <= '0;
      seq_count_r  <= '0;
      //crc signals
      dllp_lcrc_r  <= '0;
    end else begin
      curr_state   <= next_state;
      dll_packet_r <= dll_packet_c;
      seq_count_r  <= seq_count_c;
      //crc signals
      dllp_lcrc_r  <= dllp_lcrc_c;
    end
  end


  always_comb begin : combo_block
    next_state        = curr_state;
    dll_packet_c      = dll_packet_r;
    seq_count_c       = seq_count_r;
    //axis flow control defaults
    fc_axis_tdata     = '0;
    fc_axis_tkeep     = '0;
    fc_axis_tvalid    = '0;
    fc_axis_tlast     = '0;
    fc_axis_tuser     = 4'h01;
    //crc signals
    dllp_lcrc_c       = dllp_lcrc_r;
    //init handshake
    init_ack_o        = '0;
    fc2_values_sent_o = '0;
    case (curr_state)
      ST_IDLE: begin
        if (start_flow_control_i && (fc_axis_tready)) begin
          seq_count_c    = '0;
          //build dllp packet
          fc_axis_tdata  = send_fc_init(InitFC1_P, '0, HdrMinCredits, PdMinCredits);
          dllp_lcrc_c    = crc_out;
          fc_axis_tkeep  = '1;
          fc_axis_tvalid = '1;
          fc_axis_tlast  = '0;
          init_ack_o     = '1;
          next_state     = ST_FC1_P;
        end
      end
      ST_FC1_P: begin
        if (fc_axis_tready) begin
          fc_axis_tdata  = crc_reversed;
          dllp_lcrc_c    = crc_out;
          fc_axis_tkeep  = 8'h3;
          fc_axis_tvalid = '1;
          fc_axis_tlast  = '1;
          seq_count_c    = '0;
          next_state     = ST_FC1_CRC;
        end
      end
      ST_FC1_CRC: begin
        seq_count_c = seq_count_r >= FcWaitPeriod ? FcWaitPeriod : seq_count_r + 1'b1;
        if (fc_axis_tready) begin
          seq_count_c    = '0;
          fc_axis_tvalid = '0;
          next_state     = ST_FC1_NP;
        end
      end
      ST_FC1_NP: begin
        seq_count_c = seq_count_r + 1'b1;
        if (fc_axis_tready) begin
          fc_axis_tvalid = '0;
          //wait for 10us
          if (seq_count_r >= FcWaitPeriod) begin
            seq_count_c    = '0;
            fc_axis_tdata  = send_fc_init(InitFC1_NP, '0, HdrMinCredits, HdrMinCredits);
            dllp_lcrc_c    = crc_out;
            fc_axis_tkeep  = '1;
            fc_axis_tvalid = '1;
            fc_axis_tlast  = '0;
            next_state     = ST_FC1_NP_CRC;
          end
        end
      end
      ST_FC1_NP_CRC: begin
        //we never received an ack restart FC1P
        if (fc_axis_tready) begin
          fc_axis_tdata  = crc_reversed;
          fc_axis_tkeep  = 8'h3;
          fc_axis_tvalid = '1;
          fc_axis_tlast  = '1;
          seq_count_c    = '0;
          next_state     = ST_FC1_CPL;
        end
      end
      //send np
      ST_FC1_CPL: begin
        seq_count_c = seq_count_r + 1'b1;
        if (fc_axis_tready) begin
          fc_axis_tvalid = '0;
          //wait for 10us
          if (seq_count_r >= FcWaitPeriod) begin
            fc_axis_tdata  = send_fc_init(InitFC1_Cpl, '0, HdrMinCredits, PdMinCredits);
            dllp_lcrc_c    = crc_out;
            fc_axis_tkeep  = '1;
            fc_axis_tvalid = '1;
            fc_axis_tlast  = '0;
            seq_count_c    = '0;
            next_state     = ST_FC1_CPL_CRC;
          end
        end
      end
      ST_FC1_CPL_CRC: begin
        //we never received an ack restart FC1P
        if (fc_axis_tready) begin
          fc_axis_tdata  = crc_reversed;
          fc_axis_tkeep  = 8'h3;
          fc_axis_tvalid = '1;
          fc_axis_tlast  = '1;
          seq_count_c    = '0;
          next_state     = CHECK_FC1;
        end
      end
      CHECK_FC1: begin
        seq_count_c = (seq_count_r >= FcWaitPeriod) ? FcWaitPeriod : seq_count_r + 1'b1;
        if (fc_axis_tready) begin
          fc_axis_tvalid = '0;
          if (fc1_values_stored_i) begin
            seq_count_c = '0;
            next_state  = ST_FC2;
          end else if (seq_count_r >= FcWaitPeriod) begin
            seq_count_c    = '0;
            fc_axis_tvalid = '0;
            next_state     = ST_IDLE;
            if (fc1_values_stored_i) begin
              seq_count_c = '0;
              next_state  = ST_FC2;
            end
          end
        end
      end
      ST_FC2: begin
        seq_count_c = seq_count_r + 1'b1;
        if (fc_axis_tready) begin
          fc_axis_tvalid = '0;
          //wait for 10us
          if (seq_count_r >= FcWaitPeriod) begin
            fc_axis_tdata  = send_fc_init(InitFC2_P, '0, HdrMinCredits, PdMinCredits);
            fc_axis_tkeep  = '1;
            fc_axis_tvalid = '1;
            fc_axis_tlast  = '0;
            dllp_lcrc_c    = crc_out;
            seq_count_c    = '0;
            next_state     = ST_FC2_CRC;
          end
        end
      end
      ST_FC2_CRC: begin
        //we never received an ack restart FC1P
        if (fc_axis_tready) begin
          fc_axis_tdata  = crc_reversed;
          fc_axis_tkeep  = 8'h3;
          fc_axis_tvalid = '1;
          fc_axis_tlast  = '1;
          seq_count_c    = '0;
          next_state     = ST_FC2_NP;
        end
      end
      ST_FC2_NP: begin
        seq_count_c = seq_count_r + 1'b1;
        if (fc_axis_tready) begin
          fc_axis_tvalid = '0;
          //wait for 10us
          if (seq_count_r >= FcWaitPeriod) begin
            fc_axis_tdata  = send_fc_init(InitFC2_NP, '0, HdrMinCredits, HdrMinCredits);
            // fc_axis_tdata = dll_packet_c;
            fc_axis_tkeep  = '1;
            fc_axis_tvalid = '1;
            fc_axis_tlast  = '0;
            dllp_lcrc_c    = crc_out;
            seq_count_c    = '0;
            next_state     = ST_FC2_NP_CRC;
          end
        end
      end
      ST_FC2_NP_CRC: begin
        //we never received an ack restart FC1P
        if (fc_axis_tready) begin
          fc_axis_tdata  = crc_reversed;
          fc_axis_tkeep  = 8'h3;
          fc_axis_tvalid = '1;
          fc_axis_tlast  = '1;
          seq_count_c    = '0;
          next_state     = ST_FC2_CPL;
        end
      end
      ST_FC2_CPL: begin
        seq_count_c = seq_count_r + 1'b1;
        //wait for 10us
        if (fc_axis_tready) begin
          fc_axis_tvalid = '0;
          if (seq_count_r >= FcWaitPeriod) begin
            fc_axis_tdata  = send_fc_init(InitFC2_Cpl, '0, HdrMinCredits, PdMinCredits);
            dllp_lcrc_c    = crc_out;
            fc_axis_tkeep  = '1;
            fc_axis_tvalid = '1;
            fc_axis_tlast  = '0;
            seq_count_c    = '0;
            next_state     = ST_FC2_CPL_CRC;
          end
        end
      end
      ST_FC2_CPL_CRC: begin
        //we never received an ack restart FC1P
        if (fc_axis_tready) begin
          fc_axis_tdata  = crc_reversed;
          fc_axis_tkeep  = 8'h3;
          fc_axis_tvalid = '1;
          fc_axis_tlast  = '1;
          seq_count_c    = '0;
          next_state     = CHECK_FC2;
        end
      end
      CHECK_FC2: begin
        seq_count_c = seq_count_r + 1'b1;
        if (fc_axis_tready) begin
          fc_axis_tvalid = '0;
          if (fc2_values_stored_i) begin
            seq_count_c    = '0;
            fc_axis_tvalid = '0;
            next_state     = ST_FC_COMPLETE;
          end else if (seq_count_r >= FcWaitPeriod) begin
            seq_count_c    = '0;
            fc_axis_tvalid = '0;
            next_state     = ST_FC2;
          end
        end
      end
      ST_FC_COMPLETE: begin
        fc2_values_sent_o = '1;
        //hang around
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
      .s_axis_tdata (fc_axis_tdata),
      .s_axis_tkeep (fc_axis_tkeep),
      .s_axis_tvalid(fc_axis_tvalid),
      .s_axis_tready(fc_axis_tready),
      .s_axis_tlast (fc_axis_tlast),
      .s_axis_tuser (fc_axis_tuser),
      .s_axis_tid   ('0),
      .s_axis_tdest ('0),
      .m_axis_tdata (m_axis_tdata),
      .m_axis_tkeep (m_axis_tkeep),
      .m_axis_tvalid(m_axis_tvalid),
      .m_axis_tready(m_axis_tready),
      .m_axis_tlast (m_axis_tlast),
      .m_axis_tuser (m_axis_tuser),
      .m_axis_tid   (),
      .m_axis_tdest ()
  );

  pcie_datalink_crc dllp_crc_inst (
      .crcIn ('1),
      .data  (fc_axis_tdata),
      .crcOut(crc_out)
  );


endmodule
