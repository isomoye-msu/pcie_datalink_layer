`timescale 1ns/1ps
module tlp_generator
  import tlp_pkg::*;
#(
    parameter int DATA_WIDTH = 32,
    parameter int KEEP_WIDTH = DATA_WIDTH / 8,
    parameter int USER_WIDTH = 3
) (
    input  logic                  clk_i,
    input  logic                  rst_i,

    input  tlp_header_t           header_i,
    input  logic                  header_valid_i,
    output logic                  header_ready_o,
    input  logic [DATA_WIDTH-1:0] payload_tdata_i,
    input  logic [KEEP_WIDTH-1:0] payload_tkeep_i,
    input  logic                  payload_tvalid_i,
    input  logic                  payload_tlast_i,
    output logic                  payload_tready_o,

    output logic [DATA_WIDTH-1:0] m_axis_tdata,
    output logic [KEEP_WIDTH-1:0] m_axis_tkeep,
    output logic                  m_axis_tvalid,
    output logic                  m_axis_tlast,
    output logic [USER_WIDTH-1:0] m_axis_tuser,
    input  logic                  m_axis_tready
);

  typedef enum logic [3:0] {
    TX_IDLE, TX_PREFIX, TX_DW0, TX_DW1, TX_DW2, TX_DW3,
    TX_PAYLOAD_START, TX_PAYLOAD, TX_ECRC
  } tx_state_e;
  tx_state_e state_r;
  tlp_header_t header_r;
  logic [31:0] dw0;
  logic [31:0] dw1;
  logic [31:0] dw2;
  logic [31:0] formatted_data;
  logic [3:0] formatted_keep;
  logic formatted_valid;
  logic formatted_last;
  logic formatted_ready;
  logic formatter_start_valid;
  logic formatter_start_ready;
  logic [9:0] encoded_length;
  logic [1:0] payload_offset;
  wire output_fire = m_axis_tvalid && m_axis_tready;

  always_comb begin
    encoded_length = tlp_encode_length(header_r.length_dw);
    dw0 = '0;
    dw0[7:5]   = header_r.fmt;
    dw0[4:0]   = header_r.tlp_type;
    dw0[8]     = header_r.th;
    dw0[10]    = header_r.attributes[0];
    dw0[14:12] = header_r.traffic_class;
    dw0[17:16] = encoded_length[9:8];
    dw0[19:18] = header_r.address_type;
    dw0[21:20] = header_r.attributes[2:1];
    dw0[22]    = header_r.poisoned;
    dw0[23]    = header_r.digest_present;
    dw0[31:24] = encoded_length[7:0];

    if (header_r.tlp_type == TLP_TYPE_CPL || header_r.tlp_type == TLP_TYPE_CPL_LOCK) begin
      dw1 = {header_r.completer_id, header_r.completion_status,
             header_r.byte_count_modified, header_r.byte_count[11:0]};
      dw2 = {header_r.requester_id, header_r.tag, 1'b0, header_r.lower_address};
    end else begin
      dw1 = {header_r.requester_id, header_r.tag, header_r.last_be, header_r.first_be};
      dw2 = tlp_is_4dw(header_r.fmt) ? header_r.address[63:32] :
            {header_r.address[31:2], 2'b00};
    end
  end

  assign header_ready_o = state_r == TX_IDLE;
  assign formatter_start_valid = state_r == TX_PAYLOAD_START;
  assign payload_offset = (header_r.tlp_type == TLP_TYPE_CPL ||
                           header_r.tlp_type == TLP_TYPE_CPL_LOCK) ?
                          header_r.lower_address[1:0] : header_r.address[1:0];

  always_comb begin
    m_axis_tdata  = '0;
    m_axis_tkeep  = '1;
    m_axis_tvalid = 1'b0;
    m_axis_tlast  = 1'b0;
    m_axis_tuser  = '0;
    formatted_ready = 1'b0;

    unique case (state_r)
      TX_PREFIX: begin
        m_axis_tdata  = header_r.prefix;
        m_axis_tvalid = 1'b1;
      end
      TX_DW0: begin
        m_axis_tdata  = dw0;
        m_axis_tvalid = 1'b1;
      end
      TX_DW1: begin
        m_axis_tdata  = dw1;
        m_axis_tvalid = 1'b1;
      end
      TX_DW2: begin
        m_axis_tdata  = dw2;
        m_axis_tvalid = 1'b1;
        m_axis_tlast  = !tlp_is_4dw(header_r.fmt) && !tlp_has_data(header_r.fmt) &&
                        !header_r.digest_present;
      end
      TX_DW3: begin
        m_axis_tdata  = {header_r.address[31:2], 2'b00};
        m_axis_tvalid = 1'b1;
        m_axis_tlast  = !tlp_has_data(header_r.fmt) && !header_r.digest_present;
      end
      TX_PAYLOAD: begin
        m_axis_tdata  = formatted_data;
        m_axis_tkeep  = formatted_keep;
        m_axis_tvalid = formatted_valid;
        m_axis_tlast  = formatted_last && !header_r.digest_present;
        formatted_ready = m_axis_tready;
      end
      TX_ECRC: begin
        m_axis_tdata  = header_r.digest;
        m_axis_tvalid = 1'b1;
        m_axis_tlast  = 1'b1;
      end
      default: ;
    endcase
  end

  always_ff @(posedge clk_i) begin
    if (rst_i) begin
      state_r  <= TX_IDLE;
      header_r <= '0;
    end else begin
      unique case (state_r)
        TX_IDLE: if (header_valid_i && header_ready_o) begin
          header_r <= header_i;
          state_r <= header_i.prefix_present ? TX_PREFIX : TX_DW0;
        end
        TX_PREFIX: if (output_fire) state_r <= TX_DW0;
        TX_DW0:    if (output_fire) state_r <= TX_DW1;
        TX_DW1:    if (output_fire) state_r <= TX_DW2;
        TX_DW2: if (output_fire) begin
          if (tlp_is_4dw(header_r.fmt))
            state_r <= TX_DW3;
          else if (tlp_has_data(header_r.fmt))
            state_r <= TX_PAYLOAD_START;
          else if (header_r.digest_present)
            state_r <= TX_ECRC;
          else
            state_r <= TX_IDLE;
        end
        TX_DW3: if (output_fire) begin
          if (tlp_has_data(header_r.fmt))
            state_r <= TX_PAYLOAD_START;
          else if (header_r.digest_present)
            state_r <= TX_ECRC;
          else
            state_r <= TX_IDLE;
        end
        TX_PAYLOAD_START: if (formatter_start_ready)
          state_r <= TX_PAYLOAD;
        TX_PAYLOAD: if (formatted_valid && formatted_ready && formatted_last)
          state_r <= header_r.digest_present ? TX_ECRC : TX_IDLE;
        TX_ECRC: if (output_fire)
          state_r <= TX_IDLE;
        default: state_r <= TX_IDLE;
      endcase
    end
  end

  tlp_payload_formatter #(
      .DATA_WIDTH(DATA_WIDTH),
      .KEEP_WIDTH(KEEP_WIDTH)
  ) payload_formatter_inst (
      .clk_i(clk_i),
      .rst_i(rst_i),
      .start_valid_i(formatter_start_valid),
      .start_ready_o(formatter_start_ready),
      .start_offset_i(payload_offset),
      .s_axis_tdata(payload_tdata_i),
      .s_axis_tkeep(payload_tkeep_i),
      .s_axis_tvalid(payload_tvalid_i),
      .s_axis_tlast(payload_tlast_i),
      .s_axis_tready(payload_tready_o),
      .m_axis_tdata(formatted_data),
      .m_axis_tkeep(formatted_keep),
      .m_axis_tvalid(formatted_valid),
      .m_axis_tlast(formatted_last),
      .m_axis_tready(formatted_ready)
  );

endmodule
