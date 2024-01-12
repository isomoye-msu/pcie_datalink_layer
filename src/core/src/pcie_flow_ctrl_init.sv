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
    parameter int S_COUNT = 1,
    parameter int MAX_PAYLOAD_SIZE = 0
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

    output logic init_ack_o
);


  localparam int PdMinCredits = ((8 << (5 + MAX_PAYLOAD_SIZE)) / 4 / 4);
  localparam int HdrMinCredits = 8'h01;
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
  logic [DATA_WIDTH-1:0] m_axis_tdata_c1, m_axis_tdata_r1;
  logic [KEEP_WIDTH-1:0] m_axis_tkeep_c1, m_axis_tkeep_r1;
  logic m_axis_tvalid_c1, m_axis_tvalid_r1;
  logic m_axis_tlast_c1, m_axis_tlast_r1;
  logic [USER_WIDTH-1:0] m_axis_tuser_c1, m_axis_tuser_r1;
  logic m_axis_tready_c1, m_axis_tready_r1;

  // Internal state machine for link flow control
  flow_control_state_e curr_state, next_state;
  dllp_fc_t dll_packet_c, dll_packet_r;
  logic [15:0] dllp_lcrc_c, dllp_lcrc_r;
  logic [15:0] seq_count_c, seq_count_r;
  logic [15:0] crc_out;
  logic [15:0] crc_reversed;


  always_comb begin : byteswap
    for (int i = 0; i < 8; i++) begin
      crc_reversed[i]   = dllp_lcrc_r[7-i];
      crc_reversed[i+8] = dllp_lcrc_r[15-i];
    end
  end

  // Initialize to idle state
  always_ff @(posedge clk_i) begin : main_seq
    if (rst_i) begin
      curr_state       <= ST_IDLE;
      dll_packet_r     <= '0;
      seq_count_r      <= '0;
      //axis signals
      m_axis_tvalid_r1 <= '0;
      //crc signals
      dllp_lcrc_r      <= '0;
    end else begin
      curr_state       <= next_state;
      dll_packet_r     <= dll_packet_c;
      seq_count_r      <= seq_count_c;
      //axis signals
      m_axis_tvalid_r1 <= m_axis_tvalid_c1;
      //crc signals
      dllp_lcrc_r      <= dllp_lcrc_c;
    end
    //stage 1
    m_axis_tdata_r1 <= m_axis_tdata_c1;
    m_axis_tkeep_r1 <= m_axis_tkeep_c1;
    m_axis_tlast_r1 <= m_axis_tlast_c1;
    m_axis_tuser_r1 <= m_axis_tuser_c1;
  end


  always_comb begin : combo_block
    next_state = curr_state;
    dll_packet_c = dll_packet_r;
    seq_count_c = seq_count_r;
    //axis signals
    //@hint: axis signals not registered...look here for easy timing improvements
    // m_axis_tdata_o = '0;
    // m_axis_tkeep_o = '0;
    // m_axis_tvalid_o = '0;
    // m_axis_tlast_o = '0;
    // m_axis_tuser_o = '0;

    //axis signals
    m_axis_tdata_c1 = m_axis_tdata_r1;
    m_axis_tkeep_c1 = m_axis_tkeep_r1;
    m_axis_tvalid_c1 = m_axis_tvalid_r1;
    m_axis_tlast_c1 = m_axis_tlast_r1;
    m_axis_tuser_c1 = m_axis_tuser_r1;
    //crc signals
    dllp_lcrc_c = dllp_lcrc_r;
    //init handshake
    init_ack_o = '0;
    case (curr_state)
      ST_IDLE: begin
        if (start_flow_control_i && (m_axis_tready|| !m_axis_tvalid_r1)) begin
          seq_count_c = '0;
          //build dllp packet
          dll_packet_c = send_fc_init(InitFC1_P, '0, HdrMinCredits, PdMinCredits);
          dllp_lcrc_c = crc_out;
          m_axis_tdata_c1 = dll_packet_c;
          m_axis_tkeep_c1 = '1;
          m_axis_tvalid_c1 = '1;
          m_axis_tlast_c1 = '0;
          m_axis_tuser_c1 = '0;
          init_ack_o = '1;
          next_state = ST_FC1_P;
        end
      end
      ST_FC1_P: begin
        if (m_axis_tready || !m_axis_tvalid_r1) begin
          m_axis_tdata_c1 = crc_reversed;
          dllp_lcrc_c = crc_out;
          m_axis_tkeep_c1 = 8'h3;
          m_axis_tvalid_c1 = '1;
          m_axis_tlast_c1 = '1;
          seq_count_c = '0;
          next_state = ST_FC1_CRC;
        end
      end
      ST_FC1_CRC: begin
        seq_count_c = seq_count_r >= FcWaitPeriod ? FcWaitPeriod : seq_count_r + 1'b1;
        if (m_axis_tready || !m_axis_tvalid_r1) begin
          seq_count_c = '0;
          m_axis_tvalid_c1 = '0;
          next_state = ST_FC1_NP;
        end
      end
      ST_FC1_NP: begin
        seq_count_c = seq_count_r + 1'b1;
        if (m_axis_tready || !m_axis_tvalid_r1) begin
          m_axis_tvalid_c1 = '0;
          //wait for 10us
          if (seq_count_r >= FcWaitPeriod) begin
            seq_count_c = '0;
            dll_packet_c = send_fc_init(InitFC1_NP, '0, HdrMinCredits, HdrMinCredits);
            dllp_lcrc_c = crc_out;
            m_axis_tdata_c1 = dll_packet_c;
            m_axis_tkeep_c1 = '1;
            m_axis_tvalid_c1 = '1;
            m_axis_tlast_c1 = '0;
            m_axis_tuser_c1 = '0;
            next_state = ST_FC1_NP_CRC;
          end
        end
      end
      ST_FC1_NP_CRC: begin
        //we never recieved an ack restart FC1P
        if (m_axis_tready || !m_axis_tvalid_r1) begin
          m_axis_tdata_c1 = crc_reversed;
          m_axis_tkeep_c1 = 8'h3;
          m_axis_tvalid_c1 = '1;
          m_axis_tlast_c1 = '1;
          seq_count_c = '0;
          next_state = ST_FC1_CPL;
        end
      end
      //send np
      ST_FC1_CPL: begin
        seq_count_c = seq_count_r + 1'b1;
        if (m_axis_tready || !m_axis_tvalid_r1) begin
          m_axis_tvalid_c1 = '0;
          //wait for 10us
          if (seq_count_r >= FcWaitPeriod) begin
            dll_packet_c = send_fc_init(InitFC1_Cpl, '0, '0, '0);
            m_axis_tdata_c1 = dll_packet_c;
            dllp_lcrc_c = crc_out;
            m_axis_tkeep_c1 = '1;
            m_axis_tvalid_c1 = '1;
            m_axis_tlast_c1 = '0;
            m_axis_tuser_c1 = '0;
            seq_count_c = '0;
            next_state = ST_FC1_CPL_CRC;
          end
        end
      end
      ST_FC1_CPL_CRC: begin
        //we never recieved an ack restart FC1P
        if (m_axis_tready) begin
          m_axis_tdata_c1 = crc_reversed;
          m_axis_tkeep_c1 = 8'h3;
          m_axis_tvalid_c1 = '1;
          m_axis_tlast_c1 = '1;
          seq_count_c = '0;
          next_state = CHECK_FC1;
        end
      end
      CHECK_FC1: begin
        seq_count_c = (seq_count_r >= FcWaitPeriod) ? FcWaitPeriod : seq_count_r + 1'b1;
        if (m_axis_tready || !m_axis_tvalid_r1) begin
          m_axis_tvalid_c1 = '0;
          if (fc1_values_stored_i) begin
            seq_count_c = '0;
            next_state  = ST_FC2;
          end else if (seq_count_r >= FcWaitPeriod) begin
            seq_count_c = '0;
            m_axis_tvalid_c1 = '0;
            next_state = ST_IDLE;
            if (fc1_values_stored_i) begin
              seq_count_c = '0;
              next_state  = ST_FC2;
            end
          end
        end
      end
      ST_FC2: begin
        seq_count_c = seq_count_r + 1'b1;
        if (m_axis_tready || !m_axis_tvalid_r1) begin
          m_axis_tvalid_c1 = '0;
          //wait for 10us
          if (seq_count_r >= FcWaitPeriod) begin
            dll_packet_c = send_fc_init(InitFC2_P, '0, HdrMinCredits, PdMinCredits);
            m_axis_tdata_c1 = dll_packet_c;
            m_axis_tkeep_c1 = '1;
            m_axis_tvalid_c1 = '1;
            m_axis_tlast_c1 = '0;
            m_axis_tuser_c1 = '0;
            dllp_lcrc_c = crc_out;
            seq_count_c = '0;
            next_state = ST_FC2_CRC;
          end
        end
      end
      ST_FC2_CRC: begin
        //we never recieved an ack restart FC1P
        if (m_axis_tready) begin
          m_axis_tdata_c1 = crc_reversed;
          m_axis_tkeep_c1 = 8'h3;
          m_axis_tvalid_c1 = '1;
          m_axis_tlast_c1 = '1;
          seq_count_c = '0;
          next_state = ST_FC2_NP;
        end
      end
      ST_FC2_NP: begin
        seq_count_c = seq_count_r + 1'b1;
        if (m_axis_tready || !m_axis_tvalid_r1) begin
          m_axis_tvalid_c1 = '0;
          //wait for 10us
          if (seq_count_r >= FcWaitPeriod) begin
            dll_packet_c = send_fc_init(InitFC2_NP, '0, HdrMinCredits, HdrMinCredits);
            m_axis_tdata_c1 = dll_packet_c;
            m_axis_tkeep_c1 = '1;
            m_axis_tvalid_c1 = '1;
            m_axis_tlast_c1 = '0;
            m_axis_tuser_c1 = '0;
            dllp_lcrc_c = crc_out;
            seq_count_c = '0;
            next_state = ST_FC2_NP_CRC;
          end
        end
      end
      ST_FC2_NP_CRC: begin
        //we never recieved an ack restart FC1P
        if (m_axis_tready) begin
          m_axis_tdata_c1 = crc_reversed;
          m_axis_tkeep_c1 = 8'h3;
          m_axis_tvalid_c1 = '1;
          m_axis_tlast_c1 = '1;
          seq_count_c = '0;
          next_state = ST_FC2_CPL;
        end
      end
      ST_FC2_CPL: begin
        seq_count_c = seq_count_r + 1'b1;
        //wait for 10us
        if (m_axis_tready || !m_axis_tvalid_r1) begin
          m_axis_tvalid_c1 = '0;
          if (seq_count_r >= FcWaitPeriod) begin
            dll_packet_c = send_fc_init(InitFC2_Cpl, '0, '0, '0);
            m_axis_tdata_c1 = dll_packet_c;
            dllp_lcrc_c = crc_out;
            m_axis_tkeep_c1 = '1;
            m_axis_tvalid_c1 = '1;
            m_axis_tlast_c1 = '0;
            m_axis_tuser_c1 = '0;
            seq_count_c = '0;
            next_state = ST_FC2_CPL_CRC;
          end
        end
      end
      ST_FC2_CPL_CRC: begin
        //we never recieved an ack restart FC1P
        if (m_axis_tready) begin
          m_axis_tdata_c1 = crc_reversed;
          m_axis_tkeep_c1 = 8'h3;
          m_axis_tvalid_c1 = '1;
          m_axis_tlast_c1 = '1;
          m_axis_tuser_c1 = '0;
          seq_count_c = '0;
          next_state = CHECK_FC2;
        end
      end
      CHECK_FC2: begin
        seq_count_c = seq_count_r + 1'b1;
        if (m_axis_tready || !m_axis_tvalid_r1) begin
          m_axis_tvalid_c1 = '0;
          if (fc2_values_stored_i) begin
            seq_count_c = '0;
            m_axis_tvalid_c1 = '0;
            next_state = ST_FC_COMPLETE;
          end else if (seq_count_r >= FcWaitPeriod) begin
            seq_count_c = '0;
            m_axis_tvalid_c1 = '0;
            next_state = ST_FC2;
          end
        end
      end
      ST_FC_COMPLETE: begin
        //hang around
      end
      default: begin

      end
    endcase
  end

  pcie_datalink_crc dllp_crc_inst (
      .crcIn ('1),
      .data  (dll_packet_c[31:0]),
      .crcOut(crc_out)
  );


  assign m_axis_tdata  = m_axis_tdata_r1;
  assign m_axis_tkeep  = m_axis_tkeep_r1;
  assign m_axis_tvalid = m_axis_tvalid_r1;
  assign m_axis_tlast  = m_axis_tlast_r1;
  assign m_axis_tuser  = m_axis_tuser_r1;



endmodule
