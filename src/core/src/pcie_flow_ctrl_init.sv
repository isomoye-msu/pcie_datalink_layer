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
    output logic [(DATA_WIDTH)-1:0] m_axis_tdata_o,
    output logic [(KEEP_WIDTH)-1:0] m_axis_tkeep_o,
    output logic                    m_axis_tvalid_o,
    output logic                    m_axis_tlast_o,
    output logic [  USER_WIDTH-1:0] m_axis_tuser_o,
    input  logic                    m_axis_tready_i,

    output logic init_ack_o
);


  localparam int PdMinCredits = ((8 <<(5 + MAX_PAYLOAD_SIZE)) / 4 / 4);
  localparam int HdrMinCredits = 8'h01;
  localparam int FcWaitPeriod = 8'hA0;

  typedef enum logic [4:0] {
    ST_IDLE,
    ST_FC1_CRC,
    ST_FC1_P,
    ST_FC1_NP,
    ST_FC1_NP_CRC,
    ST_FC1_CPL,
    ST_FC1_CPL_CRC,
    CHECK_FC1_VALS,
    ST_FC2,
    ST_FC2_CRC,
    ST_FC2_P,
    ST_FC2_P_CRC,
    ST_FC2_NP,
    ST_FC2_NP_CRC,
    ST_FC2_CPL,
    ST_FC2_CPL_CRC,
    CHECK_FC2_VALS,
    ST_FC_COMPLETE
  } flow_control_state_e;


  // Internal state machine for link flow control
  flow_control_state_e curr_state, next_state;
  dll_packet_t dll_packet_c, dll_packet_r;
  logic [15:0] dllp_lcrc_c, dllp_lcrc_r;
  logic [15:0] seq_count_c, seq_count_r;
  logic [15:0] crc_out;

  // Initialize to idle state
  always_ff @(posedge clk_i or posedge rst_i) begin : main_seq
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
    next_state = curr_state;
    dll_packet_c = dll_packet_r;
    seq_count_c = seq_count_r;
    //axis signals
    //@hint: axis signals not registered...look here for easy timing improvements
    m_axis_tdata_o = '0;
    m_axis_tkeep_o = '0;
    m_axis_tvalid_o = '0;
    m_axis_tlast_o = '0;
    m_axis_tuser_o = '0;
    //crc signals
    dllp_lcrc_c = dllp_lcrc_r;
    //init handshake
    init_ack_o = '0;
    case (curr_state)
      ST_IDLE: begin
        if (start_flow_control_i) begin
          seq_count_c = '0;
          //build dllp packet
          dll_packet_c = send_fc_init(InitFC1_P, '0,HdrMinCredits,PdMinCredits);
          m_axis_tdata_o = dll_packet_c;
          dllp_lcrc_c = crc_out;
          m_axis_tkeep_o = '1;
          m_axis_tvalid_o = '1;
          init_ack_o = '1;
          if (m_axis_tready_i) begin
            next_state = ST_FC1_CRC;
          end
        end
      end
      ST_FC1_CRC: begin
        m_axis_tdata_o = dllp_lcrc_r;
        dllp_lcrc_c = crc_out;
        m_axis_tkeep_o = 8'h3;
        m_axis_tvalid_o = '1;
        init_ack_o = '1;
        if (m_axis_tready_i) begin
          next_state = ST_FC1_NP;
        end
      end
      ST_FC1_NP: begin
        seq_count_c = seq_count_r + 1'b1;
        //wait for 10us
        if (seq_count_r >= FcWaitPeriod) begin
          seq_count_c = seq_count_r;
          dll_packet_c = send_fc_init(InitFC1_P, '0,HdrMinCredits, HdrMinCredits);
          m_axis_tdata_o = dll_packet_c;
          m_axis_tkeep_o = '1;
          m_axis_tvalid_o = '1;
          //we never recieved an ack restart FC1P
          if (m_axis_tready_i) begin
            seq_count_c = '0;
            next_state  = ST_FC1_NP_CRC;
          end
        end
      end
      ST_FC1_NP_CRC: begin
        m_axis_tdata_o  = dllp_lcrc_r;
        m_axis_tkeep_o  = 8'h3;
        m_axis_tvalid_o = '1;
        m_axis_tlast_o  = '1;
        //we never recieved an ack restart FC1P
        if (m_axis_tready_i) begin
          seq_count_c = '0;
          next_state  = ST_FC1_CPL;
        end
      end
      //send np
      ST_FC1_CPL: begin
        seq_count_c = seq_count_r + 1'b1;
        //wait for 10us
        if (seq_count_r >= FcWaitPeriod) begin
          seq_count_c = seq_count_r;
          dll_packet_c = send_fc_init(InitFC1_Cpl, '0,'0,'0);
          m_axis_tdata_o = dll_packet_c;
          m_axis_tkeep_o = '1;
          m_axis_tvalid_o = '1;
          //we never recieved an ack restart FC1NP
          if (m_axis_tready_i) begin
            seq_count_c = '0;
            next_state  = ST_FC1_CPL_CRC;
          end
        end
      end
      ST_FC1_CPL_CRC: begin
        m_axis_tdata_o  = dllp_lcrc_r;
        m_axis_tkeep_o  = 8'h3;
        m_axis_tvalid_o = '1;
        m_axis_tlast_o  = '1;
        //we never recieved an ack restart FC1P
        if (m_axis_tready_i) begin
          seq_count_c = '0;
          next_state  = CHECK_FC1_VALS;
        end
      end
      CHECK_FC1_VALS: begin
        seq_count_c = seq_count_r + 1'b1;
        if (fc1_values_stored_i) begin
          seq_count_c = '0;
          next_state  = ST_FC2;
        end else if (seq_count_r >= FcWaitPeriod) begin
          seq_count_c = '0;
          next_state  = ST_IDLE;
        end
      end
      ST_FC2: begin
        seq_count_c = seq_count_r + 1'b1;
        //wait for 10us
        if (seq_count_r >= FcWaitPeriod) begin
          seq_count_c = seq_count_r;
          dll_packet_c = send_fc_init(InitFC2_P, '0,HdrMinCredits,PdMinCredits);
          m_axis_tdata_o = dll_packet_c;
          m_axis_tkeep_o = '1;
          m_axis_tvalid_o = '1;
          //we never recieved an ack restart FC1NP
          if (m_axis_tready_i) begin
            seq_count_c = '0;
            next_state  = ST_FC2_CRC;
          end
        end
      end
      ST_FC2_CRC: begin
        m_axis_tdata_o  = dllp_lcrc_r;
        m_axis_tkeep_o  = 8'h3;
        m_axis_tvalid_o = '1;
        m_axis_tlast_o  = '1;
        //we never recieved an ack restart FC1P
        if (m_axis_tready_i) begin
          seq_count_c = '0;
          next_state  = ST_FC2_NP;
        end
      end
      ST_FC2_NP: begin
        seq_count_c = seq_count_r + 1'b1;
        //wait for 10us
        if (seq_count_r >= FcWaitPeriod) begin
          seq_count_c = seq_count_r;
          dll_packet_c = send_fc_init(InitFC2_NP, '0,HdrMinCredits,HdrMinCredits);
          m_axis_tdata_o = dll_packet_c;
          m_axis_tkeep_o = '1;
          m_axis_tvalid_o = '1;
          //we never recieved an ack restart FC1NP
          if (m_axis_tready_i) begin
            seq_count_c = '0;
            next_state  = ST_FC2_NP_CRC;
          end
        end
      end
      ST_FC2_NP_CRC: begin
        m_axis_tdata_o  = dllp_lcrc_r;
        m_axis_tkeep_o  = 8'h3;
        m_axis_tvalid_o = '1;
        m_axis_tlast_o  = '1;
        //we never recieved an ack restart FC1P
        if (m_axis_tready_i) begin
          seq_count_c = '0;
          next_state  = ST_FC2_CPL;
        end
      end
      ST_FC2_CPL: begin
        seq_count_c = seq_count_r + 1'b1;
        //wait for 10us
        if (seq_count_r >= FcWaitPeriod) begin
          seq_count_c = seq_count_r;
          dll_packet_c = send_fc_init(InitFC2_Cpl, '0,'0,'0);
          m_axis_tdata_o = dll_packet_c;
          m_axis_tkeep_o = '1;
          m_axis_tvalid_o = '1;
          //we never recieved an ack restart FC1NP
          if (m_axis_tready_i) begin
            seq_count_c = '0;
            next_state  = ST_FC2_CPL_CRC;
          end
        end
      end
      ST_FC2_CPL_CRC: begin
        m_axis_tdata_o  = dllp_lcrc_r;
        m_axis_tkeep_o  = 8'h3;
        m_axis_tvalid_o = '1;
        m_axis_tlast_o  = '1;
        //we never recieved an ack restart FC1P
        if (m_axis_tready_i) begin
          seq_count_c = '0;
          m_axis_tvalid_o = '0;
          next_state  = CHECK_FC2_VALS;
        end
      end
      CHECK_FC2_VALS: begin
        seq_count_c = seq_count_r + 1'b1;
        if (fc2_values_stored_i) begin
          seq_count_c = '0;
          next_state  = ST_FC_COMPLETE;
        end else if (seq_count_r >= FcWaitPeriod) begin
          seq_count_c = '0;
          next_state  = ST_FC2;
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
    .data  (dll_packet_c),
    .crcOut(crc_out)
);

  // pcie_datalink_crc dllp_crc_inst (
  //     .Data(dll_packet_c[31:0]),
  //     .Complement('1),
  //     .Crc(crc_out)
  // );
endmodule
