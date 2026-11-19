//!module: retry_management
//! Original author: Idris Somoye
//! Refactor: one link-level REPLAY_TIMER / REPLAY_NUM and ordered retry buffer replay.
//!
//! PCI Express Base Specification Rev. 2.0, sections 3.5.2.1 and 3.5.2.2.
//!
//! INTEGRATION CONTRACT (read before wiring):
//! * tx_valid_i is a ONE-CYCLE TLP/slot ALLOCATION strobe, accepted only while
//!   retry_available_o is 1. tx_seq_num_i is the assigned 12-bit TLP sequence.
//! * tx_tlp_done_i pulses when the last SYMBOL of an ORIGINAL TLP exits the
//!   transmit Port (not when the FIFO is written). This starts the timer.
//! * tx_tlp_busy_i is high while an ORIGINAL TLP already in progress must
//!   finish before replay can begin. Prevent NEW original TLP starts when
//!   retry_available_o == 0. This input is not a replay-buffer occupancy bit.
//! * retry_valid_o[i] requests retransmission of buffer slot i; hold until
//!   retry_ack_i[i] accepts it. retry_complete_i[i] MUST pulse only when the
//!   last SYMBOL of that replayed TLP exits the transmit Port.
//! * ack_nack_i = 1: Ack; ack_nack_i = 0: Nak. ack_nack_vld_i means a CRC-
//!   checked, validly decoded DLLP; this module also checks its sequence.
//! * link_retraining_i is asserted in LTSSM Recovery OR Configuration.
//! * retrain_request_o asks LTSSM to retrain after REPLAY_NUM rolls over;
//!   retrain_done_i pulses after successful retrain. If link fails and the
//!   Data Link Layer reaches DL_Inactive, assert dl_inactive_i instead.
//! * REPLAY_TIMEOUT_CYCLES MUST be set for actual clock, speed, width, MPS,
//!   L0s policy, and end-to-end Port latency. Zero deliberately fails sim.
//!
//! No synchronizers are included: all inputs must be synchronous to clk_i.
module retry_management
  import pcie_datalink_pkg::*;
#(
    parameter int DATA_WIDTH       = 32,
    parameter int STRB_WIDTH       = DATA_WIDTH / 8,
    parameter int KEEP_WIDTH       = STRB_WIDTH,
    parameter int USER_WIDTH       = 1,
    parameter int S_COUNT          = 1,
    parameter int MAX_PAYLOAD_SIZE = 256,
    parameter int RAM_DATA_WIDTH   = 32,
    parameter int RETRY_TLP_SIZE   = 3,
    parameter int RAM_ADDR_WIDTH   = $clog2(RAM_DATA_WIDTH),
    // Explicitly configure using PCIe 2.0 Table 3-4 (Gen1) or 3-5 (Gen2).
    parameter int unsigned REPLAY_TIMEOUT_CYCLES = 0
) (
    input  logic                       clk_i,
    input  logic                       rst_i,
    input  logic [11:0]                tx_seq_num_i,
    input  logic                       tx_valid_i,
    input  logic                       tx_tlp_done_i,
    input  logic                       tx_tlp_busy_i,
    output logic                       retry_available_o,
    output logic [7:0]                 retry_index_o,
    output logic                       retry_err_o,
    output logic [RETRY_TLP_SIZE-1:0]  retry_valid_o,
    input  logic [RETRY_TLP_SIZE-1:0]  retry_ack_i,
    input  logic [RETRY_TLP_SIZE-1:0]  retry_complete_i,
    input  logic                       ack_nack_i,
    input  logic                       ack_nack_vld_i,
    input  logic [11:0]                ack_seq_num_i,
    input  logic                       link_retraining_i,
    input  logic                       retrain_done_i,
    input  logic                       dl_inactive_i,
    output logic                       retrain_request_o,
    output logic                       replay_timeout_error_o,
    output logic                       dllp_protocol_error_o
);

    localparam int IDX_W = (RETRY_TLP_SIZE > 1) ? $clog2(RETRY_TLP_SIZE) : 1;

    typedef enum logic [2:0] {
        RP_IDLE, RP_RUN, RP_DRAIN, RP_SELECT,
        RP_REQUEST, RP_WAIT, RP_RETRAIN
    } replay_state_e;

    replay_state_e state_r;

    // Physical retry buffer occupancy (also retains any slot for a replay
    // request already issued even if it was cumulatively ACKed meanwhile).
    logic [RETRY_TLP_SIZE-1:0] occupied_r;
    logic [RETRY_TLP_SIZE-1:0] acked_hold_r;
    logic [11:0] seq_mem_r [0:RETRY_TLP_SIZE-1];
    logic [11:0] ackd_seq_r;
    logic [11:0] next_seq_r;

    // One replay control context for the whole link.
    logic [31:0] replay_timer_r;
    logic        timer_running_r;
    logic [1:0]  replay_num_r;
    logic [RETRY_TLP_SIZE-1:0] replay_pending_r;
    logic [IDX_W-1:0] replay_index_r;
    logic first_replayed_r;
    logic replay_again_r;

    logic timeout_error_r;
    logic protocol_error_r;
    logic replay_rollover_error_r;

    logic [RETRY_TLP_SIZE-1:0] live_mask;
    logic [RETRY_TLP_SIZE-1:0] ack_clear_mask;
    logic [RETRY_TLP_SIZE-1:0] live_after_ack;
    logic [RETRY_TLP_SIZE-1:0] pending_live;
    logic any_live;
    logic any_live_after_ack;

    logic free_found;
    logic [IDX_W-1:0] free_index;
    logic selected_valid;
    logic [IDX_W-1:0] selected_index;

    logic [11:0] ack_delta;
    logic ack_match;
    logic ack_new;
    logic ack_duplicate;
    logic ack_valid;
    logic ack_progress;
    logic nak_event;
    logic invalid_acknak;

    logic tx_accept;
    logic replay_timer_expired;
    logic replay_trigger;
    logic late_replay_timeout;
    logic first_replay_done;
    logic replay_slot_done;
    logic normal_tx_done;

    function automatic logic [11:0] seq_distance(
        input logic [11:0] seq_newer,
        input logic [11:0] seq_older
    );
        // 12-bit subtraction naturally wraps modulo 4096.
        return seq_newer - seq_older;
    endfunction

    initial begin
        if (RETRY_TLP_SIZE < 1 || RETRY_TLP_SIZE > 256)
            $fatal(1, "retry_management: RETRY_TLP_SIZE must be 1..256");
        if (REPLAY_TIMEOUT_CYCLES == 0)
            $fatal(1, "retry_management: configure REPLAY_TIMEOUT_CYCLES");
    end

    assign live_mask          = occupied_r & ~acked_hold_r;
    assign any_live           = |live_mask;
    assign live_after_ack     = live_mask & ~ack_clear_mask;
    assign any_live_after_ack = |live_after_ack;
    assign pending_live       = replay_pending_r & live_after_ack;

    // Allocate the first physically free retry buffer slot.
    always_comb begin
        free_found = 1'b0;
        free_index = '0;
        for (int i = 0; i < RETRY_TLP_SIZE; i++) begin
            if (!free_found && !occupied_r[i]) begin
                free_found = 1'b1;
                free_index = IDX_W'(i);
            end
        end
    end

    // PCIe sequence window cannot grow to 2048 outstanding sequence numbers.
    assign retry_available_o = free_found &&
        (seq_distance(next_seq_r, ackd_seq_r) < 12'd2048) &&
        ((state_r == RP_IDLE) || (state_r == RP_RUN)) &&
        !link_retraining_i && !dl_inactive_i;

    assign retry_index_o = 8'(free_index);
    assign tx_accept = tx_valid_i && retry_available_o;

    // ACK/NAK validation: target must be ACKD_SEQ or a presently outstanding
    // TLP. Only a NEW ACK/NAK target causes cumulative retirement.
    always_comb begin
        ack_match = 1'b0;
        for (int i = 0; i < RETRY_TLP_SIZE; i++) begin
            if (live_mask[i] && seq_mem_r[i] == ack_seq_num_i)
                ack_match = 1'b1;
        end
    end

    assign ack_delta     = seq_distance(ack_seq_num_i, ackd_seq_r);
    assign ack_duplicate = ack_nack_vld_i && (ack_seq_num_i == ackd_seq_r);
    assign ack_new       = ack_nack_vld_i && ack_match &&
                           (ack_delta != 12'd0) &&
                           (ack_delta < 12'd2048);
    assign ack_valid     = ack_duplicate || ack_new;
    assign ack_progress  = ack_new;
    assign nak_event     = ack_valid && !ack_nack_i;
    assign invalid_acknak = ack_nack_vld_i && !ack_valid;

    always_comb begin
        ack_clear_mask = '0;
        if (ack_progress) begin
            for (int i = 0; i < RETRY_TLP_SIZE; i++) begin
                if (live_mask[i] &&
                    seq_distance(seq_mem_r[i], ackd_seq_r) != 12'd0 &&
                    seq_distance(seq_mem_r[i], ackd_seq_r) <= ack_delta)
                    ack_clear_mask[i] = 1'b1;
            end
        end
    end

    // Oldest pending TLP has smallest positive distance from ACKD_SEQ.
    // The 2048-window rule above makes this ordering unambiguous.
    always_comb begin
        selected_valid = 1'b0;
        selected_index = '0;
        for (int i = 0; i < RETRY_TLP_SIZE; i++) begin
            if (pending_live[i]) begin
                if (!selected_valid) begin
                    selected_valid = 1'b1;
                    selected_index = IDX_W'(i);
                end else if (
                    seq_distance(seq_mem_r[i], ackd_seq_r) <
                    seq_distance(seq_mem_r[selected_index], ackd_seq_r)
                ) begin
                    selected_index = IDX_W'(i);
                end
            end
        end
    end

    // Request remains at the selected buffer until accepted by retry transmitter.
    always_comb begin
        retry_valid_o = '0;
        if ((state_r == RP_REQUEST) && !link_retraining_i &&
            !dl_inactive_i)
            retry_valid_o[replay_index_r] = 1'b1;
    end

    assign retrain_request_o = (state_r == RP_RETRAIN);
    assign replay_timeout_error_o = timeout_error_r;
    assign dllp_protocol_error_o  = protocol_error_r;
    assign retry_err_o = timeout_error_r || protocol_error_r ||
                         replay_rollover_error_r;

    assign replay_slot_done = (state_r == RP_WAIT) &&
                              retry_complete_i[replay_index_r];
    assign first_replay_done = replay_slot_done && !first_replayed_r;
    assign normal_tx_done = tx_tlp_done_i &&
                           ((state_r == RP_IDLE) || (state_r == RP_RUN));

    assign replay_timer_expired = timer_running_r && any_live &&
                                  !ack_progress && !link_retraining_i &&
                                  (replay_timer_r >= REPLAY_TIMEOUT_CYCLES);
    assign replay_trigger = (state_r == RP_RUN) &&
                            any_live_after_ack &&
                            (nak_event || replay_timer_expired);
    assign late_replay_timeout = ((state_r == RP_SELECT) ||
                                  (state_r == RP_REQUEST) ||
                                  (state_r == RP_WAIT)) &&
                                 replay_timer_expired;

    // Retry buffer bookkeeping. ACKed entries are released immediately unless
    // their request is already outstanding or their retransmission is active.
    // Such an entry is released after the current replay TLP completes.
    always_ff @(posedge clk_i) begin
        if (rst_i || dl_inactive_i) begin
            occupied_r   <= '0;
            acked_hold_r <= '0;
            ackd_seq_r   <= 12'hfff;
            next_seq_r   <= 12'h000;
            protocol_error_r <= 1'b0;
            for (int i = 0; i < RETRY_TLP_SIZE; i++)
                seq_mem_r[i] <= '0;
        end else begin
            if (invalid_acknak)
                protocol_error_r <= 1'b1;

            if (ack_progress) begin
                ackd_seq_r <= ack_seq_num_i;
                for (int i = 0; i < RETRY_TLP_SIZE; i++) begin
                    if (ack_clear_mask[i]) begin
                        if (((state_r == RP_REQUEST) ||
                             (state_r == RP_WAIT)) &&
                            (replay_index_r == IDX_W'(i))) begin
                            acked_hold_r[i] <= 1'b1;
                        end else begin
                            occupied_r[i]   <= 1'b0;
                            acked_hold_r[i] <= 1'b0;
                        end
                    end
                end
            end

            if (tx_accept) begin
                occupied_r[free_index]   <= 1'b1;
                acked_hold_r[free_index] <= 1'b0;
                seq_mem_r[free_index]    <= tx_seq_num_i;
                if (tx_seq_num_i != next_seq_r)
                    protocol_error_r <= 1'b1;
                next_seq_r <= tx_seq_num_i + 12'd1;
            end

            if (replay_slot_done && acked_hold_r[replay_index_r]) begin
                occupied_r[replay_index_r]   <= 1'b0;
                acked_hold_r[replay_index_r] <= 1'b0;
            end
            // An ACK and replay_complete may arrive on the same cycle.
            if (replay_slot_done && ack_clear_mask[replay_index_r]) begin
                occupied_r[replay_index_r]   <= 1'b0;
                acked_hold_r[replay_index_r] <= 1'b0;
            end
        end
    end

    // One timer, independent of the replay-request FSM. This separation lets
    // it continue counting after the FIRST retransmitted TLP finishes.
    always_ff @(posedge clk_i) begin
        if (rst_i || dl_inactive_i) begin
            replay_timer_r  <= '0;
            timer_running_r <= 1'b0;
            timeout_error_r <= 1'b0;
        end else begin
            if (replay_timer_expired)
                timeout_error_r <= 1'b1;

            if ((!any_live_after_ack && !tx_accept) || replay_trigger ||
                late_replay_timeout) begin
                replay_timer_r   <= '0;
                timer_running_r  <= 1'b0;
            end else if (first_replay_done) begin
                replay_timer_r  <= '0;
                timer_running_r <= any_live_after_ack;
            end else if (ack_progress) begin
                replay_timer_r  <= '0;
                timer_running_r <= any_live_after_ack;
            end else if (normal_tx_done && !timer_running_r &&
                         (any_live_after_ack || tx_accept)) begin
                replay_timer_r  <= '0;
                timer_running_r <= 1'b1;
            end else if (timer_running_r && !link_retraining_i) begin
                replay_timer_r <= replay_timer_r + 1'b1;
            end
            // Otherwise retain timer value (Recovery / Configuration hold).
        end
    end

    // Single link-level replay state machine and two-bit REPLAY_NUM.
    always_ff @(posedge clk_i) begin
        if (rst_i || dl_inactive_i) begin
            state_r              <= RP_IDLE;
            replay_num_r         <= '0;
            replay_pending_r     <= '0;
            replay_index_r       <= '0;
            first_replayed_r     <= 1'b0;
            replay_again_r       <= 1'b0;
            replay_rollover_error_r <= 1'b0;
        end else begin
            // Only an ACK with forward progress clears REPLAY_NUM. A NAK that
            // acknowledges a newer sequence still counts as a replay event.
            if (ack_progress && ack_nack_i)
                replay_num_r <= '0;

            if (late_replay_timeout ||
                (nak_event && (state_r == RP_SELECT ||
                               state_r == RP_REQUEST || state_r == RP_WAIT)))
                replay_again_r <= 1'b1;

            case (state_r)
                RP_IDLE: begin
                    if (any_live || tx_accept)
                        state_r <= RP_RUN;
                end

                RP_RUN: begin
                    if (!any_live_after_ack && !tx_accept)
                        state_r <= RP_IDLE;
                    else if (replay_trigger)
                        state_r <= RP_DRAIN;
                end

                RP_DRAIN: begin
                    // Stop new TLP acceptance, finish the currently
                    // transmitting ORIGINAL TLP, then begin a full replay.
                    if (!tx_tlp_busy_i && !link_retraining_i) begin
                        if (!any_live_after_ack) begin
                            state_r <= RP_IDLE;
                            replay_again_r <= 1'b0;
                        end else begin
                            replay_pending_r <= live_after_ack;
                            first_replayed_r <= 1'b0;
                            replay_again_r   <= 1'b0;
                            if (replay_num_r == 2'd3) begin
                                replay_num_r <= 2'd0;
                                replay_rollover_error_r <= 1'b1;
                                state_r <= RP_RETRAIN;
                            end else begin
                                replay_num_r <= replay_num_r + 2'd1;
                                state_r <= RP_SELECT;
                            end
                        end
                    end
                end

                RP_RETRAIN: begin
                    // REPLAY_NUM rollover requires retraining, not a
                    // permanent 'error' sink state. Retry buffer retained.
                    if (retrain_done_i)
                        state_r <= RP_SELECT;
                end

                RP_SELECT: begin
                    if (!selected_valid) begin
                        if (replay_again_r && any_live_after_ack) begin
                            replay_again_r <= 1'b0;
                            state_r <= RP_DRAIN;
                        end else begin
                            state_r <= any_live_after_ack ? RP_RUN : RP_IDLE;
                        end
                    end else if (!link_retraining_i) begin
                        replay_index_r <= selected_index;
                        state_r <= RP_REQUEST;
                    end
                end

                RP_REQUEST: begin
                    // Index is latched; valid stays asserted until handshake.
                    if (!link_retraining_i &&
                        retry_ack_i[replay_index_r])
                        state_r <= RP_WAIT;
                end

                RP_WAIT: begin
                    // Completion must mean last physical symbol transmitted.
                    if (replay_slot_done) begin
                        replay_pending_r[replay_index_r] <= 1'b0;
                        if (!first_replayed_r)
                            first_replayed_r <= 1'b1;
                        state_r <= RP_SELECT;
                    end
                end

                default: state_r <= RP_IDLE;
            endcase
        end
    end

endmodule
