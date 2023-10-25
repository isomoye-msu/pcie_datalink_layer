import pcie_datalink_pkg::*;
module pcie_ltssm #(
    // TLP data width
    parameter int DATA_WIDTH = 32,
    // TLP strobe width
    parameter int STRB_WIDTH = DATA_WIDTH / 8,
    parameter int KEEP_WIDTH = STRB_WIDTH,
    parameter int USER_WIDTH = 1,
    parameter int S_COUNT = 1,
    // TLP segment count
    parameter int TLP_SEG_COUNT = 1,
    // TX sequence number count
    parameter int TX_SEQ_NUM_COUNT = 1,
    // TX sequence number width
    parameter int TX_SEQ_NUM_WIDTH = 5,

    //
    parameter int RAM_DATA_WIDTH = 8,  // width of the data
    parameter int RAM_ADDR_WIDTH = 4   // number of address bits
) (
    input logic clk_i,  // Clock signal
    input logic rst_i,  // Reset signal

    /*
     * PHY AXIS inputs
     */
    input  logic [DATA_WIDTH-1:0] s_axis_tdata_i,
    input  logic [KEEP_WIDTH-1:0] s_axis_tkeep_i,
    input  logic [   S_COUNT-1:0] s_axis_tvalid_i,
    input  logic [   S_COUNT-1:0] s_axis_tlast_i,
    input  logic [USER_WIDTH-1:0] s_axis_tuser_i,
    output logic [   S_COUNT-1:0] s_axis_tready_o,

    input  logic detect_i,
    input  logic elec_idle_break_i,
    output logic linkup_o,
    output logic link_training_o
);


  typedef enum logic [1:0] {
    ST_IDLE,
    ST_DETECT,
    ST_POLLING,
    ST_CONFIGURATION,
    ST_RECOVERY,
    ST_L0,
    ST_L0s,
    ST_L1,
    ST_L2,
    ST_DISABLED,
    ST_LOOPBACK,
    ST_HOT_RESET
  } ltssm_state_e;

  ltssm_state_e curr_state, next_state;

  logic [31:0] timer_c, timer_r;

  always_ff @(posedge clk_i or posedge rst_i) begin : ltssm_seq
    if (rst_i) begin
      curr_state <= ST_IDLE;
      timer_r <= '0;
    end else begin
      curr_state <= next_state;
      timer_r <= timer_c;
    end
  end


  always_comb begin : ltssm_combo
    timer_c = timer_r;
    case (curr_state)
      ST_IDLE: begin
        timer_c = timer_r + 1;
        if(elec_idle_break_i || timer_r > LtssmDetect) begin
        end
      end
      default: begin
      end
    endcase
  end


endmodule
