//! @title pcie_datalink_init
//! @author Idris Somoye
//
//! Implements a pcie datalink layer inititalization.
//!
//!
//! Module ensures flow control packets are recieved and transmitted before beggining to process
//! TLPs
module pcie_datalink_init
  import pcie_datalink_pkg::*;
(
    input  logic            clk_i,                // Clock signal
    input  logic            rst_i,                // Reset signal
    input  logic            phy_link_up_i,        // Signal indicating link is up
    output logic            init_flow_control_o,
    output logic            soft_reset_o,
    output pcie_dl_status_e link_status_o,
    //flow control values
    input  logic            fc1_values_stored_i,
    input  logic            fc2_values_stored_i,
    input  logic            init_ack_i
);

  typedef enum logic [2:0] {
    ST_DL_INACTIVE,
    ST_DL_INIT,
    ST_DL_INIT_FC1,
    ST_DL_INIT_FC2,
    ST_DL_ACTIVE
  } pcie_dl_state_e;

  pcie_dl_state_e        next_state;
  pcie_dl_state_e        curr_state;
  // Internal state machine for link initialization
  logic            [6:0] link_state;

  pcie_dl_status_e       link_status_c;
  pcie_dl_status_e       link_status_r;
  logic                  init_flow_control_c;
  logic                  init_flow_control_r;
  logic                  soft_reset_r;
  logic                  soft_reset_c;

  // Initialize to idle state
  always_ff @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      curr_state          <= ST_DL_INACTIVE;
      link_status_r       <= DL_DOWN;
      init_flow_control_r <= '0;
      soft_reset_r        <= '1;
    end else begin
      curr_state          <= next_state;
      link_status_r       <= link_status_c;
      init_flow_control_r <= init_flow_control_c;
      soft_reset_r        <= soft_reset_c;
    end
  end

  always_comb begin : combo_block
    next_state          = curr_state;
    init_flow_control_c = init_flow_control_r;
    soft_reset_c        = soft_reset_r;
    link_status_c       = link_status_r;
    case (curr_state)
      ST_DL_INACTIVE: begin
        link_status_c = DL_DOWN;
        if (phy_link_up_i) begin
          next_state          = ST_DL_INIT;
          init_flow_control_c = '1;
          soft_reset_c        = '0;
        end
      end
      ST_DL_INIT: begin
        if (!phy_link_up_i) begin
          next_state   = ST_DL_INACTIVE;
          soft_reset_c = '1;
        end else begin
          if (init_ack_i) begin
            next_state = ST_DL_INIT_FC1;
          end
        end
      end
      ST_DL_INIT_FC1: begin
        if (!phy_link_up_i) begin
          next_state   = ST_DL_INACTIVE;
          soft_reset_c = '1;
        end else begin
          if (fc1_values_stored_i || fc2_values_stored_i) begin
            next_state    = ST_DL_INIT_FC2;
            link_status_c = DL_UP;
          end
        end
      end
      ST_DL_INIT_FC2: begin
        if (!phy_link_up_i) begin
          next_state   = ST_DL_INACTIVE;
          soft_reset_c = '1;
        end else begin
          if (fc2_values_stored_i) begin
            next_state    = ST_DL_ACTIVE;
            link_status_c = DL_ACTIVE;
          end
        end
      end
      ST_DL_ACTIVE: begin
        if (!phy_link_up_i) begin
          next_state   = ST_DL_INACTIVE;
          soft_reset_c = '1;
        end
      end
      default: begin
      end
    endcase
  end

  assign init_flow_control_o = init_flow_control_r;
  assign soft_reset_o        = soft_reset_r;
  assign link_status_o       = link_status_r;
endmodule
