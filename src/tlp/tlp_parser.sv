`timescale 1ns/1ps
module tlp_parser
  import tlp_pkg::*;
#(
    parameter int DATA_WIDTH = 32,
    parameter int KEEP_WIDTH = DATA_WIDTH / 8,
    parameter int USER_WIDTH = 3
) (
    input  logic                  clk_i,
    input  logic                  rst_i,

    input  logic [DATA_WIDTH-1:0] s_axis_tdata,
    input  logic [KEEP_WIDTH-1:0] s_axis_tkeep,
    input  logic                  s_axis_tvalid,
    input  logic                  s_axis_tlast,
    input  logic [USER_WIDTH-1:0] s_axis_tuser,
    output logic                  s_axis_tready,

    output tlp_header_t           header_o,
    output logic                  header_valid_o,
    input  logic                  header_ready_i,

    output logic [DATA_WIDTH-1:0] payload_tdata_o,
    output logic [KEEP_WIDTH-1:0] payload_tkeep_o,
    output logic                  payload_tvalid_o,
    output logic                  payload_tlast_o,
    input  logic                  payload_tready_i,

    output logic                  malformed_o
);

  typedef enum logic [3:0] {
    RX_FIRST,
    RX_DW0,
    RX_DW1,
    RX_DW2,
    RX_DW3,
    RX_HEADER,
    RX_PAYLOAD,
    RX_ECRC,
    RX_DRAIN,
    RX_DROP
  } rx_state_e;

  rx_state_e state_r;
  tlp_header_t header_r;
  logic [31:0] payload_data_r;
  logic [3:0]  payload_keep_r;
  logic        payload_valid_r;
  logic        payload_last_r;
  logic        packet_done_r;
  logic        malformed_r;
  logic [10:0] payload_count_r;

  wire input_fire = s_axis_tvalid && s_axis_tready;
  wire payload_fire = payload_valid_r && payload_tready_i;

  assign header_o         = header_r;
  assign header_valid_o   = state_r == RX_HEADER;
  assign payload_tdata_o  = payload_data_r;
  assign payload_tkeep_o  = payload_keep_r;
  assign payload_tvalid_o = payload_valid_r;
  assign payload_tlast_o  = payload_last_r;
  assign malformed_o      = malformed_r;

  always_comb begin
    s_axis_tready = 1'b0;
    unique case (state_r)
      RX_FIRST, RX_DW0, RX_DW1, RX_DW2, RX_DW3, RX_ECRC, RX_DROP:
        s_axis_tready = 1'b1;
      RX_PAYLOAD:
        s_axis_tready = !payload_valid_r || payload_tready_i;
      default:
        s_axis_tready = 1'b0;
    endcase
  end

  always_ff @(posedge clk_i) begin
    if (rst_i) begin
      state_r         <= RX_FIRST;
      header_r        <= '0;
      payload_data_r  <= '0;
      payload_keep_r  <= '0;
      payload_valid_r <= 1'b0;
      payload_last_r  <= 1'b0;
      packet_done_r   <= 1'b0;
      malformed_r     <= 1'b0;
      payload_count_r <= '0;
    end else begin
      malformed_r <= 1'b0;

      if (payload_fire) begin
        payload_valid_r <= 1'b0;
        if (payload_last_r) begin
          payload_last_r <= 1'b0;
          packet_done_r  <= 1'b0;
          state_r        <= RX_FIRST;
        end
      end

      unique case (state_r)
        RX_FIRST: if (input_fire) begin
          header_r <= '0;
          packet_done_r <= 1'b0;
          payload_count_r <= '0;
          if (s_axis_tkeep != 4'hf) begin
            malformed_r <= 1'b1;
            state_r <= s_axis_tlast ? RX_FIRST : RX_DROP;
          end else if (s_axis_tdata[7:5] == TLP_FMT_PREFIX) begin
            header_r.prefix_present <= 1'b1;
            header_r.prefix         <= s_axis_tdata;
            state_r                 <= s_axis_tlast ? RX_FIRST : RX_DW0;
            malformed_r             <= s_axis_tlast;
          end else begin
            header_r.fmt             <= s_axis_tdata[7:5];
            header_r.tlp_type        <= s_axis_tdata[4:0];
            header_r.traffic_class   <= s_axis_tdata[14:12];
            header_r.attributes      <= {s_axis_tdata[21:20], s_axis_tdata[10]};
            header_r.digest_present  <= s_axis_tdata[23];
            header_r.poisoned        <= s_axis_tdata[22];
            header_r.address_type    <= s_axis_tdata[19:18];
            header_r.th              <= s_axis_tdata[8];
            header_r.length_dw       <= (((s_axis_tdata[4:0] == TLP_TYPE_CPL ||
                                          s_axis_tdata[4:0] == TLP_TYPE_CPL_LOCK)) &&
                                         !tlp_has_data(s_axis_tdata[7:5]) &&
                                         {s_axis_tdata[17:16], s_axis_tdata[31:24]} == 0) ?
                                        11'd0 : tlp_decode_length({s_axis_tdata[17:16], s_axis_tdata[31:24]});
            state_r                  <= s_axis_tlast ? RX_FIRST : RX_DW1;
            malformed_r              <= s_axis_tlast;
          end
        end

        RX_DW0: if (input_fire) begin
          header_r.fmt             <= s_axis_tdata[7:5];
          header_r.tlp_type        <= s_axis_tdata[4:0];
          header_r.traffic_class   <= s_axis_tdata[14:12];
          header_r.attributes      <= {s_axis_tdata[21:20], s_axis_tdata[10]};
          header_r.digest_present  <= s_axis_tdata[23];
          header_r.poisoned        <= s_axis_tdata[22];
          header_r.address_type    <= s_axis_tdata[19:18];
          header_r.th              <= s_axis_tdata[8];
          header_r.length_dw       <= (((s_axis_tdata[4:0] == TLP_TYPE_CPL ||
                                        s_axis_tdata[4:0] == TLP_TYPE_CPL_LOCK)) &&
                                       !tlp_has_data(s_axis_tdata[7:5]) &&
                                       {s_axis_tdata[17:16], s_axis_tdata[31:24]} == 0) ?
                                      11'd0 : tlp_decode_length({s_axis_tdata[17:16], s_axis_tdata[31:24]});
          state_r                  <= s_axis_tlast ? RX_FIRST : RX_DW1;
          malformed_r              <= s_axis_tlast;
        end

        RX_DW1: if (input_fire) begin
          if (header_r.tlp_type == TLP_TYPE_CPL ||
              header_r.tlp_type == TLP_TYPE_CPL_LOCK) begin
            header_r.completer_id        <= s_axis_tdata[31:16];
            header_r.completion_status   <= s_axis_tdata[15:13];
            header_r.byte_count_modified <= s_axis_tdata[12];
            header_r.byte_count          <= s_axis_tdata[11:0] == 0 ?
                                             13'd4096 : {1'b0, s_axis_tdata[11:0]};
          end else begin
            header_r.requester_id <= s_axis_tdata[31:16];
            header_r.tag          <= s_axis_tdata[15:8];
            header_r.last_be      <= s_axis_tdata[7:4];
            header_r.first_be     <= s_axis_tdata[3:0];
          end
          state_r <= s_axis_tlast ? RX_FIRST : RX_DW2;
          malformed_r <= s_axis_tlast;
        end

        RX_DW2: if (input_fire) begin
          if (header_r.tlp_type == TLP_TYPE_CPL ||
              header_r.tlp_type == TLP_TYPE_CPL_LOCK) begin
            header_r.requester_id  <= s_axis_tdata[31:16];
            header_r.tag           <= s_axis_tdata[15:8];
            header_r.lower_address <= s_axis_tdata[6:0];
            if (tlp_has_data(header_r.fmt)) begin
              state_r <= RX_HEADER;
            end else begin
              state_r <= RX_HEADER;
              packet_done_r <= 1'b1;
              malformed_r <= !s_axis_tlast;
            end
          end else if (tlp_is_4dw(header_r.fmt)) begin
            header_r.address[63:32] <= s_axis_tdata;
            state_r <= s_axis_tlast ? RX_FIRST : RX_DW3;
            malformed_r <= s_axis_tlast;
          end else begin
            if (header_r.tlp_type == TLP_TYPE_CFG0 || header_r.tlp_type == TLP_TYPE_CFG1)
              header_r.address <= {32'd0, s_axis_tdata};
            else
              header_r.address <= {32'd0, s_axis_tdata[31:2], 2'b00};
            state_r <= RX_HEADER;
            packet_done_r <= !tlp_has_data(header_r.fmt);
            malformed_r <= tlp_has_data(header_r.fmt) == s_axis_tlast;
          end
        end

        RX_DW3: if (input_fire) begin
          header_r.address[31:0] <= {s_axis_tdata[31:2], 2'b00};
          state_r <= RX_HEADER;
          packet_done_r <= !tlp_has_data(header_r.fmt);
          malformed_r <= tlp_has_data(header_r.fmt) == s_axis_tlast;
        end

        RX_HEADER: if (header_ready_i) begin
          if (packet_done_r)
            state_r <= RX_FIRST;
          else
            state_r <= RX_PAYLOAD;
        end

        RX_PAYLOAD: if (input_fire) begin
          payload_data_r  <= s_axis_tdata;
          payload_keep_r  <= s_axis_tkeep;
          payload_valid_r <= 1'b1;
          payload_count_r <= payload_count_r + 1'b1;
          payload_last_r  <= (payload_count_r + 1'b1) == header_r.length_dw;
          if ((payload_count_r + 1'b1) == header_r.length_dw) begin
            if (header_r.digest_present) begin
              malformed_r <= s_axis_tlast;
              state_r <= RX_ECRC;
            end else begin
              malformed_r <= !s_axis_tlast;
              state_r <= RX_DRAIN;
            end
          end else if (s_axis_tlast) begin
            malformed_r <= 1'b1;
            payload_last_r <= 1'b1;
            state_r <= RX_DRAIN;
          end
        end

        RX_ECRC: if (input_fire) begin
          header_r.digest <= s_axis_tdata;
          malformed_r <= !s_axis_tlast || s_axis_tkeep != 4'hf;
          state_r <= RX_DRAIN;
        end

        RX_DRAIN: begin
          if (!payload_valid_r)
            state_r <= RX_FIRST;
        end

        RX_DROP: if (input_fire && s_axis_tlast)
          state_r <= RX_FIRST;

        default: state_r <= RX_FIRST;
      endcase
    end
  end

endmodule
