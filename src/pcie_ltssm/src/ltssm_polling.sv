module ltssm_polling
  import pcie_phy_pkg::*;
#(
    parameter int CLK_RATE      = 100,
    parameter int MAX_NUM_LANES = 4,
    // TLP data width
    parameter int DATA_WIDTH    = 32,
    // TLP keep width
    parameter int KEEP_WIDTH    = DATA_WIDTH / 8,
    parameter int USER_WIDTH    = $bits(phy_user_t)

) (
    input  logic                                 clk_i,                // Clock signal
    input  logic                                 rst_i,                // Reset signal
    //lane signals
    input  logic           [  MAX_NUM_LANES-1:0] reciever_detected_i,
    input  logic           [  MAX_NUM_LANES-1:0] ts1_valid_i,
    input  logic           [  MAX_NUM_LANES-1:0] ts2_valid_i,
    input  logic           [8*MAX_NUM_LANES-1:0] link_num_i,
    input  logic           [8*MAX_NUM_LANES-1:0] lane_num_i,
    input  training_ctrl_t [  MAX_NUM_LANES-1:0] training_ctrl_i,
    // Control
    input  logic                                 en_i,
    output logic                                 error_o,
    output logic                                 success_o,
    //TLP AXI output
    output logic           [     DATA_WIDTH-1:0] m_axis_tdata,
    output logic           [     KEEP_WIDTH-1:0] m_axis_tkeep,
    output logic                                 m_axis_tvalid,
    output logic                                 m_axis_tlast,
    output logic           [     USER_WIDTH-1:0] m_axis_tuser,
    input  logic                                 m_axis_tready
);

  localparam int FourtyEightMsTimeOut = (CLK_RATE * (48 ** 5));
  localparam int TwentyFourMsTimeOut = (CLK_RATE * (24 ** 5));  //32'h015B8D80;  //temp value
  localparam int TwoMsTimeOut = (CLK_RATE * (2 ** 5));  //32'h000B8D80;  //temp value


  typedef enum logic [4:0] {
    ST_IDLE,
    ST_POLLING_ACTIVE,
    ST_POLLING_CONFIGURATION,
    ST_POLLING_COMPLIANCE,
    ST_WAIT_EN_LOW
  } detect_st_e;


  detect_st_e                     curr_state;
  detect_st_e                     next_state;
  pcie_tsos_t                     tsos_c;
  pcie_tsos_t                     tsos_r;

  logic       [             31:0] timer_c;
  logic       [             31:0] timer_r;
  logic                           error_c;
  logic                           error_r;
  logic                           success_c;
  logic                           success_r;
  logic       [MAX_NUM_LANES-1:0] lane_status_c;
  logic       [MAX_NUM_LANES-1:0] lane_status_r;
  logic       [MAX_NUM_LANES-1:0] lanes_detected_c;
  logic       [MAX_NUM_LANES-1:0] lanes_detected_r;
  logic       [             15:0] ordered_set_sent_cnt_c;
  logic       [             15:0] ordered_set_sent_cnt_r;
  logic       [              7:0] pkt_cnt_c;
  logic       [              7:0] pkt_cnt_r;

  //training sequence satisfy signals
  logic       [MAX_NUM_LANES-1:0] lanes_ts1_satisfied;
  logic       [MAX_NUM_LANES-1:0] lanes_ts2_satisfied;

  //axis signals
  logic       [   DATA_WIDTH-1:0] dllp_axis_tdata;
  logic       [   KEEP_WIDTH-1:0] dllp_axis_tkeep;
  logic                           dllp_axis_tvalid;
  logic                           dllp_axis_tlast;
  logic       [   USER_WIDTH-1:0] dllp_axis_tuser;
  logic                           dllp_axis_tready;

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
    end else begin
      curr_state       <= next_state;
      timer_r          <= timer_c;
      error_r          <= error_c;
      success_r        <= success_c;
      lane_status_r    <= lane_status_c;
      lanes_detected_r <= lanes_detected_c;
    end
    //non-resetable
    ordered_set_sent_cnt_r <= ordered_set_sent_cnt_c;
    pkt_cnt_r <= pkt_cnt_c;
    tsos_r <= tsos_c;
  end

  //-----------------------------------------------------------
  //  Main Combinational Block
  //-----------------------------------------------------------
  always_comb begin : main_combo
    next_state             = curr_state;
    timer_c                = timer_r;
    error_c                = error_r;
    success_c              = success_r;
    lane_status_c          = lane_status_r;
    lanes_detected_c       = lanes_detected_r;
    ordered_set_sent_cnt_c = ordered_set_sent_cnt_r;
    pkt_cnt_c              = pkt_cnt_r;
    //axis signals
    dllp_axis_tdata        = '0;
    dllp_axis_tkeep        = '0;
    dllp_axis_tvalid       = '0;
    dllp_axis_tlast        = '0;
    dllp_axis_tuser        = '0;
    //training seq
    tsos_c                 = tsos_r;
    case (curr_state)
      ST_IDLE: begin
        //wait for enable
        if (en_i) begin
          timer_c    = '0;
          next_state = ST_POLLING_ACTIVE;
          gen_tsos(tsos_c, TS1);
          ordered_set_sent_cnt_c = '0;
        end
      end
      ST_POLLING_ACTIVE: begin
        //bounded timeout counter
        timer_c = (timer_r >= TwentyFourMsTimeOut) ? TwentyFourMsTimeOut : timer_r + 1;
        //pkt empty
        if (m_axis_tready | !m_axis_tvalid_r) begin
          //increment packet counter
          pkt_cnt_c        = pkt_cnt_r + 1;
          //build axis pkt
          dllp_axis_tdata  = tsos_r[32*pkt_cnt_r+:32];
          dllp_axis_tkeep  = '1;
          dllp_axis_tvalid = '1;
          dllp_axis_tlast  = '0;
          dllp_axis_tuser  = 8'h01;
          //check if last packet in frame
          if (pkt_cnt_r == 8'h03) begin
            m_axis_tlast_c         = '1;
            pkt_cnt_c              = '0;
            ordered_set_sent_cnt_c = ordered_set_sent_cnt_r + 1;
          end
          //check if last packet sent or first packet
          if (pkt_cnt_r == 8'h00) begin
            //check if timer reached or TSOS sent count met
            if ((timer_r >= TwentyFourMsTimeOut) || (ordered_set_sent_cnt_r >= 1024)) begin
              //reset counts
              pkt_cnt_c       = '0;
              timer_c         = '0;
              m_axis_tvalid_c = '0;
              //check if ts1 reqs satisfied
              if (&lanes_ts1_satisfied) begin
                //build ts2 ordered set
                gen_tsos(tsos_c, TS2);
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
        if (m_axis_tready | !m_axis_tvalid_r) begin
          //increment packet count
          pkt_cnt_c        = pkt_cnt_r + 1;
          //build axis pkt
          dllp_axis_tdata  = tsos_r[32*pkt_cnt_r+:32];
          dllp_axis_tkeep  = '1;
          dllp_axis_tvalid = '1;
          dllp_axis_tlast  = '0;
          dllp_axis_tuser  = 8'h01;
          //check if last pkt
          if (pkt_cnt_r == 8'h03) begin
            pkt_cnt_c      = '0;
            m_axis_tlast_c = '1;
          end
          //check if last packet sent or first packet
          if (pkt_cnt_r == 8'h00) begin
            if (&lanes_ts2_satisfied) begin
              //assert success
              success_c  = '1;
              //reset counts
              timer_c    = '0;
              //goto wait low
              next_state = ST_WAIT_EN_LOW;
            end  //check timeout count
            else if (timer_r >= TwentyFourMsTimeOut) begin
              timer_c    = '0;
              //assert error.
              error_c    = '1;
              //goto wait low
              next_state = ST_WAIT_EN_LOW;
            end
          end
        end
      end
      ST_WAIT_EN_LOW: begin
        if (!en_i) begin
          next_state = ST_IDLE;
          success_c  = '0;
          error_c    = '0;
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
              if(((link_num_i[i*8 +: 8] == PAD) && (lane_num_i[i*8 +: 8] == PAD)) &&
                training_ctrl_i[i].loopback || training_ctrl_i[i][4]) begin
                ts1_cnt <= ts1_cnt + 1;
              end else begin
                ts1_cnt <= '0;
              end
            end else if (ts2_valid_i[i] && (ts1_cnt != 8'h8)) begin
              if (((link_num_i[i*8+:8] == PAD) && (lane_num_i[i] == PAD))) begin
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
              if (((link_num_i[i*8+:8] == PAD) && (lane_num_i[i] == PAD))) begin
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
      .s_axis_tdata(dllp_axis_tdata),
      .s_axis_tkeep(dllp_axis_tkeep),
      .s_axis_tvalid(dllp_axis_tvalid),
      .s_axis_tready(dllp_axis_tready),
      .s_axis_tlast(dllp_axis_tlast),
      .s_axis_tuser(dllp_axis_tuser),
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


  //--------------------------------------------------------------------
  //assign outputs
  //--------------------------------------------------------------------
  assign success_o = success_r;
  assign error_o   = error_r;

endmodule
