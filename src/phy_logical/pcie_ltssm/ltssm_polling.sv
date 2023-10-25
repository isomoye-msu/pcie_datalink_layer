module ltssm_polling
  import pcie_phy_pkg::*;
#(
    parameter int MAX_NUM_LANES = 4

) (
    input logic clk_i,  // Clock signal
    input logic rst_i,  // Reset signal

    // Control

    input logic       en_i,
    input logic [2:0] phy_rate_i,


    output logic [MAX_NUM_LANES-1:0] lane_detected_i,
    output logic [MAX_NUM_LANES-1:0] lane_elec_idle_o,
    output logic [MAX_NUM_LANES-1:0] txdetectrx_o

    // output logic [DW-1:0] phy_txdata_o,
    // output logic [   1:0] phy_txdatak,
    // output logic [   0:0] phy_txdata_valid_o,
    // output logic [   0:0] phy_txstart_block_o,
    // output logic [   1:0] phy_txsync_header_o,
    // output logic          phy_txelecidle_o
);


  typedef enum logic {
    ST_IDLE,
    ST_POLLING_ACTIVE,
    ST_DETECT_ACTIVE,
    ST_DETECT_RX,
    ST_WAIT_EN_LOW
  } detect_st_e;


  detect_st_e curr_state, next_state;

  logic [31:0] timer_c, timer_r;
  logic error_c, error_r;
  logic success_c, success_r;
  logic [MAX_NUM_LANES-1:0] lane_status_c, lane_status_r;
  logic [MAX_NUM_LANES-1:0] lanes_detected_c, lanes_detected_r;
  logic [MAX_NUM_LANES-1:0] ena_lane_detect_c, ena_lane_detect_r;
  logic [MAX_NUM_LANES-1:0] lane_elec_idle_c, lane_elec_idle_r;


  always_ff @(posedge clk_i or posedge rst_i) begin : main_seq
    if (rst_i) begin
      curr_state <= ST_IDLE;
      timer_r <= '0;
      error_r <= '0;
      succes_r <= '0;
      lane_status_r <= '0;
      lanes_detected_r <= '0;
      ena_lane_detect_r <= '0;
      lane_elec_idle_r <= '0;
    end else begin
      curr_state <= next_state;
      timer_r <= timer_c;
      error_r <= error_c;
      success_r <= success_c;
      lane_status_r <= lane_status_c;
      lanes_detected_r <= lanes_detected_c;
      ena_lane_detect_r <= ena_lane_detect_c;
      lane_elec_idle_r <= lane_elec_idle_c;
    end
  end


  always_comb begin : main_combo
    next_state = curr_state;
    timer_c = timer_r;
    error_c = error_r;
    success_c = success_r;
    lane_status_c = lane_status_r;
    lanes_detected_c = lanes_detected_r;
    ena_lane_detect_c = ena_lane_detect_r;
    lane_elec_idle_c = lane_elec_idle_r;
    case (curr_state)
      ST_IDLE: begin
        if (en_i) begin
          timer_c = '0;
          next_state = ST_DETECT_ACTIVE;
        end
      end
      ST_POLLING_ACTIVE: begin
        
      end
      default: begin

      end
    endcase
  end





endmodule
