`timescale 1ns/1ps
module tlp_payload_formatter #(
    parameter int DATA_WIDTH = 32,
    parameter int KEEP_WIDTH = DATA_WIDTH / 8
) (
    input  logic                  clk_i,
    input  logic                  rst_i,
    input  logic                  start_valid_i,
    output logic                  start_ready_o,
    input  logic [1:0]            start_offset_i,

    input  logic [DATA_WIDTH-1:0] s_axis_tdata,
    input  logic [KEEP_WIDTH-1:0] s_axis_tkeep,
    input  logic                  s_axis_tvalid,
    input  logic                  s_axis_tlast,
    output logic                  s_axis_tready,

    output logic [DATA_WIDTH-1:0] m_axis_tdata,
    output logic [KEEP_WIDTH-1:0] m_axis_tkeep,
    output logic                  m_axis_tvalid,
    output logic                  m_axis_tlast,
    input  logic                  m_axis_tready
);

  typedef enum logic [1:0] {FMT_IDLE, FMT_LOAD, FMT_OUTPUT} fmt_state_e;
  fmt_state_e state_r;
  logic [63:0] data_r;
  logic [7:0] keep_r;
  logic [3:0] count_r;
  logic end_r;
  integer lane;
  integer append_index;

  assign start_ready_o = state_r == FMT_IDLE;
  assign s_axis_tready = state_r == FMT_LOAD && count_r <= 4;
  assign m_axis_tdata  = data_r[31:0];
  assign m_axis_tkeep  = keep_r[3:0];
  assign m_axis_tvalid = state_r == FMT_OUTPUT;
  assign m_axis_tlast  = end_r && count_r <= 4;

  always_ff @(posedge clk_i) begin
    if (rst_i) begin
      state_r <= FMT_IDLE;
      data_r  <= '0;
      keep_r  <= '0;
      count_r <= '0;
      end_r   <= 1'b0;
    end else begin
      unique case (state_r)
        FMT_IDLE: if (start_valid_i && start_ready_o) begin
          data_r  <= '0;
          keep_r  <= '0;
          count_r <= {2'b00, start_offset_i};
          end_r   <= 1'b0;
          state_r <= FMT_LOAD;
        end

        FMT_LOAD: if (s_axis_tvalid && s_axis_tready) begin
          append_index = count_r;
          for (lane = 0; lane < KEEP_WIDTH; lane = lane + 1) begin
            if (s_axis_tkeep[lane]) begin
              data_r[append_index*8 +: 8] <= s_axis_tdata[lane*8 +: 8];
              keep_r[append_index] <= 1'b1;
              append_index = append_index + 1;
            end
          end
          count_r <= append_index[3:0];
          end_r <= s_axis_tlast;
          if (append_index >= 4 || s_axis_tlast)
            state_r <= FMT_OUTPUT;
        end

        FMT_OUTPUT: if (m_axis_tready) begin
          if (m_axis_tlast) begin
            data_r  <= '0;
            keep_r  <= '0;
            count_r <= '0;
            end_r   <= 1'b0;
            state_r <= FMT_IDLE;
          end else begin
            data_r  <= data_r >> 32;
            keep_r  <= keep_r >> 4;
            count_r <= count_r - 4;
            state_r <= (count_r >= 8 || end_r) ? FMT_OUTPUT : FMT_LOAD;
          end
        end

        default: state_r <= FMT_IDLE;
      endcase
    end
  end

endmodule
