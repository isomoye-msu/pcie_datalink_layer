module ltssm_polling
  import pcie_phy_pkg::*;
#(
    parameter int MAX_NUM_LANES = 4,
    // TLP data width
    parameter int DATA_WIDTH = 32,
    // TLP keep width
    parameter int KEEP_WIDTH = DATA_WIDTH / 8,
    parameter int USER_WIDTH = $bits(phy_user_t)

) (
    input logic clk_i,  // Clock signal
    input logic rst_i,  // Reset signal

    // Control
    input  logic en_i,
    output logic error_o,
    output logic success_o,

    input logic [MAX_NUM_LANES-1:0] reciever_detected_i,
    input logic [MAX_NUM_LANES-1:0] ts1_valid_i,
    input logic [MAX_NUM_LANES-1:0] ts2_valid_i,
    input logic [7:0][MAX_NUM_LANES-1:0] link_num_i,
    input logic [7:0][MAX_NUM_LANES-1:0] lane_num_i,
    input training_ctrl_t [MAX_NUM_LANES-1:0] training_ctrl_i,

    /*
 * TLP AXI output
 */
    output logic [DATA_WIDTH-1:0] m_axis_tdata_o,
    output logic [KEEP_WIDTH-1:0] m_axis_tkeep_o,
    output logic m_axis_tvalid_o,
    output logic m_axis_tlast_o,
    output logic [USER_WIDTH-1:0] m_axis_tuser_o,
    input logic m_axis_tready_i
);

  localparam int FourtyEightMsTimeOut = 32'h2B71B00;  //temp value
  localparam int TwentyFourMsTimeOut = 32'h015B8D80;  //temp value

  typedef enum logic [4:0] {
    ST_IDLE,
    ST_POLLING_ACTIVE,
    ST_POLLING_CONFIGURATION,
    ST_POLLING_COMPLIANCE,
    ST_WAIT_EN_LOW
  } detect_st_e;


  detect_st_e curr_state, next_state;
  pcie_tsos_t tsos_c, tsos_r;

  logic [31:0] timer_c, timer_r;
  logic error_c, error_r;
  logic success_c, success_r;
  logic [MAX_NUM_LANES-1:0] lane_status_c, lane_status_r;
  logic [MAX_NUM_LANES-1:0] lanes_detected_c, lanes_detected_r;
  logic [15:0] ordered_set_sent_cnt_c, ordered_set_sent_cnt_r;
  logic [7:0] pkt_cnt_c, pkt_cnt_r;

  //training sequence satisfy signals
  logic [MAX_NUM_LANES-1:0] lanes_ts1_satisfied;
  logic [MAX_NUM_LANES-1:0] lanes_ts2_satisfied;

  //axis signals
  logic [DATA_WIDTH-1:0] m_axis_tdata_c, m_axis_tdata_r;
  logic [KEEP_WIDTH-1:0] m_axis_tkeep_c, m_axis_tkeep_r;
  logic m_axis_tvalid_c, m_axis_tvalid_r;
  logic m_axis_tlast_c, m_axis_tlast_r;
  logic [USER_WIDTH-1:0] m_axis_tuser_c, m_axis_tuser_r;

  //-----------------------------------------------------------
  //  Main Sequential block
  //-----------------------------------------------------------
  always_ff @(posedge clk_i or posedge rst_i) begin : main_seq
    if (rst_i) begin
      curr_state       <= ST_IDLE;
      timer_r          <= '0;
      error_r          <= '0;
      succes_r         <= '0;
      lane_status_r    <= '0;
      lanes_detected_r <= '0;
      //axis signals
      m_axis_tvalid_r  <= '0;
    end else begin
      curr_state       <= next_state;
      timer_r          <= timer_c;
      error_r          <= error_c;
      success_r        <= success_c;
      lane_status_r    <= lane_status_c;
      lanes_detected_r <= lanes_detected_c;
      //axis signals
      m_axis_tvalid_r  <= m_axis_tvalid_c;
    end
    //non-resetable
    ordered_set_sent_cnt_r <= ordered_set_sent_cnt_c;
    pkt_cnt_r <= pkt_cnt_c;
    tsos_r <= tsos_c;
    //axis
    m_axis_tdata_r <= m_axis_tdata_c;
    m_axis_tkeep_r <= m_axis_tkeep_c;
    m_axis_tlast_r <= m_axis_tlast_c;
    m_axis_tuser_r <= m_axis_tuser_c;
  end

  //-----------------------------------------------------------
  //  Main Combinational Block
  //-----------------------------------------------------------
  always_comb begin : main_combo
    next_state = curr_state;
    timer_c = timer_r;
    error_c = error_r;
    success_c = success_r;
    lane_status_c = lane_status_r;
    lanes_detected_c = lanes_detected_r;
    ordered_set_sent_cnt_c = ordered_set_sent_cnt_r;
    pkt_cnt_c = pkt_cnt_r;
    //axis signals
    m_axis_tdata_c = m_axis_tdata_r;
    m_axis_tkeep_c = m_axis_tkeep_r;
    m_axis_tvalid_c = m_axis_tvalid_r;
    m_axis_tlast_c = m_axis_tlast_r;
    m_axis_tuser_c = m_axis_tuser_r;
    //training seq
    tsos_c = tsos_r;
    case (curr_state)
      ST_IDLE: begin
        //wait for enable
        if (en_i) begin
          timer_c = '0;
          next_state = ST_POLLING_ACTIVE;
          tsos_c = gen_tsos(TS1);
          ordered_set_sent_cnt_c = '0;
        end
      end
      ST_POLLING_ACTIVE: begin
        //bounded timeout counter
        timer_c = (timer_r >= TwentyFourMsTimeOut) ? TwentyFourMsTimeOut : timer_r + 1;
        //pkt empty
        if (m_axis_tready_i | !m_axis_tvalid_r) begin
          //increment packet counter
          pkt_cnt_c = pkt_cnt_r + 1;
          //build axis pkt
          m_axis_tdata_c = tsos_r[32*pkt_cnt_r+:32];
          m_axis_tkeep_c = '1;
          m_axis_tvalid_c = '1;
          m_axis_tlast_c = '0;
          m_axis_tuser_c = 8'h01;
          //check if last packet in frame
          if (pkt_cnt_r == 8'h03) begin
            m_axis_tlast_c = '1;
            pkt_cnt_c = '0;
            ordered_set_sent_cnt_c = ordered_set_sent_cnt_r + 1;
          end
          //check if last packet sent or first packet
          if (pkt_cnt_r == 8'h00) begin
            //check if timer reached or TSOS sent count met
            if ((timer_r >= TwentyFourMsTimeOut) || (ordered_set_sent_cnt_r >= 1024)) begin
              //reset counts
              pkt_cnt_c = '0;
              timer_c = '0;
              m_axis_tvalid_c = '0;
              //check if ts1 reqs satisfied
              if (&lanes_ts1_satisfied) begin
                //build ts2 ordered set
                tsos_c = gen_tsos(TS2);
                //goto cofig
                next_state = ST_POLLING_CONFIGURATION;
              end else begin
                //goto compliance
                next_state = ST_POLLING_COMPLIANCE;
              end
            end
          end
        end
      end
      //*********************************************************
      // NOT IMPLEMENTED
      //*********************************************************
      ST_POLLING_COMPLIANCE: begin
        //not implemented
        //assert error and goto wait low
        error_c = '1;
        next_state = ST_WAIT_EN_LOW;
      end
      ST_POLLING_CONFIGURATION: begin
        //bounded timeout counter
        timer_c = (timer_r >= FourtyEightMsTimeOut) ? FourtyEightMsTimeOut : timer_r + 1;
        //empty packet
        if (m_axis_tready_i | !m_axis_tvalid_r) begin
          //increment packet count
          pkt_cnt_c = pkt_cnt_r + 1;
          //build axis pkt
          m_axis_tdata_c = tsos_r[32*pkt_cnt_r+:32];
          m_axis_tkeep_c = '1;
          m_axis_tvalid_c = '1;
          m_axis_tlast_c = '0;
          m_axis_tuser_c = 8'h01;
          //check if last pkt
          if (pkt_cnt_r == 8'h03) begin
            pkt_cnt_c = '0;
            m_axis_tlast_c = '1;
          end
          //check if last packet sent or first packet
          if (pkt_cnt_r == 8'h00) begin
            if (&lanes_ts2_satisfied) begin
              //assert success
              success_c = '1;
              //reset counts
              timer_c = '0;
              //goto wait low
              next_state = ST_WAIT_EN_LOW;
            end  //check timeout count
            else if (timer_r >= TwentyFourMsTimeOut) begin
              timer_c = '0;
              //assert error.
              error_c = '1;
              //goto wait low
              next_state = ST_WAIT_EN_LOW;
            end
          end
        end
      end
      ST_WAIT_EN_LOW: begin
        if (!en_i) begin
          next_state = ST_IDLE;
          success_c = '0;
          error_c = '0;
        end
      end
      default: begin
      end
    endcase
  end

  //-----------------------------------------------------------
  //  Lane based Ordered set handling logic
  //-----------------------------------------------------------
  for (genvar i = 0; i < MAX_NUM_LANES; i++) begin : gen_cnt_ts1
    //local helper counters
    logic [7:0] ts1_cnt;
    logic [7:0] ts2_cnt;
    //assignments for state exit scenarios
    assign lanes_ts1_satisfied[i] = reciever_detected_i[i] ? (ts1_cnt == 8'h8) : '1;
    assign lanes_ts2_satisfied[i] = reciever_detected_i[i] ? (ts2_cnt == 8'h8) : '1;
    //sequential block
    always_ff @(posedge clk_i) begin : cnt_ts1
      if (rst_i) begin
        ts1_cnt <= '0;
        ts2_cnt <= '0;
      end else begin
        case (curr_state)
          ST_IDLE: begin
            ts1_cnt <= '0;
            ts2_cnt <= '0;
          end
          ST_POLLING_ACTIVE: begin
            if (next_state != curr_state) begin
              ts1_cnt <= '0;
              ts2_cnt <= '0;
            end else if (ts1_valid_i[i] && (ts1_cnt != 8'h8)) begin
              if(((link_num_i[i] == PAD) && (lane_num_i[i] == PAD)) &&
                training_ctrl_i[i].loopback || training_ctrl_i[i][4]) begin
                ts1_cnt <= ts1_cnt + 1;
              end else begin
                ts1_cnt <= '0;
              end
            end else if (ts2_valid_i[i] && (ts1_cnt != 8'h8)) begin
              if (((link_num_i[i] == PAD) && (lane_num_i[i] == PAD))) begin
                ts1_cnt <= ts1_cnt + 1;
              end else begin
                ts1_cnt <= '0;
              end
            end
          end
          ST_POLLING_CONFIGURATION: begin
            if (next_state != curr_state) begin
              ts1_cnt <= '0;
              ts2_cnt <= '0;
            end else if (ts2_valid_i[i] && (ts2_cnt != 8'h8)) begin
              if (((link_num_i[i] == PAD) && (lane_num_i[i] == PAD))) begin
                ts2_cnt <= ts2_cnt + 1;
              end else begin
                ts2_cnt <= '0;
              end
            end
          end
          default: begin
          end
        endcase
      end
    end
  end

  //--------------------------------------------------------------------
  //assign outputs
  //--------------------------------------------------------------------
  assign m_axis_tdata_o = m_axis_tdata_r;
  assign m_axis_tkeep_o = m_axis_tkeep_r;
  assign m_axis_tvalid_o = m_axis_tvalid_r;
  assign m_axis_tlast_o = m_axis_tlast_r;
  assign m_axis_tuser_o = m_axis_tuser_r;
  assign success_o = success_r;
  assign error_o = error_r;

endmodule
