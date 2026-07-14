//==========================================================================
//
//  Morgan State University
//  Open Hardware Acceleration Lab (HAL-O)
//
//  Project:   Open-Source PCIe Endpoint Controller.
//  File:      tb_pcie_datalink_layer.v
//  Author:    HAL-O
//  Created:   10/1/25
//
//  Description:
//  Module implements a retry management FIFO. Stores TLPs as axis frames.
//  Module resets read and write pointer after every frame allowing for retransmission
//  as long as data is not overwritten.
//
//
//  Project:
//    This file is part of the PCIe Gen1/Gen2 Endpoint Controller project.
//    Developed as an open-source, synthesizable Verilog RTL IP core, this
//    project provides FPGA designers and researchers with an educational
//    and extensible platform for high-speed interconnect design.
//
//  Institutional Acknowledgement:
//    - Project oversight and research guidance provided by the CEAMLS
//      (Center for Equitable AI & Machine Learning Systems) Director.
//
//  Notes:
//    - Compliant with PCIe Base Specification (Gen1: 2.5 GT/s,
//      Gen2: 5.0 GT/s).
//
//  License: MIT License
//
//==========================================================================

`ifndef TB_PCIE_DATALINK_LAYER_GEN1_MONITOR_DEPS
`define TB_PCIE_DATALINK_LAYER_GEN1_MONITOR_DEPS
`include "src/packages/pcie_phy_pkg.sv"
`include "src/scrambler/byte_scramble.sv"
`include "src/scrambler/gen1_scramble.sv"
`include "src/scrambler/encode_8b10b.sv"
`include "src/scrambler/decode_8b10b.sv"
`endif

module tb_pcie_datalink_layer;


  // Parameters
  localparam int DATA_WIDTH = 32;
  localparam int STRB_WIDTH = DATA_WIDTH / 8;
  localparam int KEEP_WIDTH = STRB_WIDTH;
  localparam int USER_WIDTH = 4;
  localparam int S_COUNT = 2;
  localparam int M_COUNT = 2;
  localparam int RAM_DATA_WIDTH = 32;
  localparam int RAM_ADDR_WIDTH = 12;
  localparam int RETRY_TLP_SIZE = 3;
  localparam int MAX_PAYLOAD_SIZE = 1;
  localparam int RX_FIFO_SIZE = 3;
  localparam int GEN1_PIPE_CLK_PERIOD_NS = 16;
  localparam int GEN1_PIPE_WIDTH = 32;
  localparam [5:0] GEN1_PIPE_WIDTH_FIELD = 6'd32;
  localparam int GEN1_PIPE_BYTES = GEN1_PIPE_WIDTH / 8;
  localparam int GEN1_GT_PER_SEC = 2500;

  //Ports
  reg                   clk;
  reg                   rst;
  reg  [DATA_WIDTH-1:0] s_axis_tlpin_tdata;
  reg  [KEEP_WIDTH-1:0] s_axis_tlpin_tkeep;
  reg                   s_axis_tlpin_tvalid;
  reg                   s_axis_tlpin_tlast;
  reg  [USER_WIDTH-1:0] s_axis_tlpin_tuser;
  wire                  s_axis_tlpin_tready;
  wire [DATA_WIDTH-1:0] m_axis_tlpout_tdata;
  wire [KEEP_WIDTH-1:0] m_axis_tlpout_tkeep;
  wire                  m_axis_tlpout_tvalid;
  wire                  m_axis_tlpout_tlast;
  wire [USER_WIDTH-1:0] m_axis_tlpout_tuser;
  reg                   m_axis_tlpout_tready;
  reg  [DATA_WIDTH-1:0] s_axis_phy2dllp_tdata;
  reg  [KEEP_WIDTH-1:0] s_axis_phy2dllp_tkeep;
  reg                   s_axis_phy2dllp_tvalid;
  reg                   s_axis_phy2dllp_tlast;
  reg  [USER_WIDTH-1:0] s_axis_phy2dllp_tuser;
  wire                  s_axis_phy2dllp_tready;
  wire [DATA_WIDTH-1:0] m_axis_dllp2phy_tdata;
  wire [KEEP_WIDTH-1:0] m_axis_dllp2phy_tkeep;
  wire                  m_axis_dllp2phy_tvalid;
  wire                  m_axis_dllp2phy_tlast;
  wire [USER_WIDTH-1:0] m_axis_dllp2phy_tuser;
  reg                   m_axis_dllp2phy_tready;
  reg  [DATA_WIDTH-1:0] s_axis_phy2tlp_tdata;
  reg  [KEEP_WIDTH-1:0] s_axis_phy2tlp_tkeep;
  reg                   s_axis_phy2tlp_tvalid;
  reg                   s_axis_phy2tlp_tlast;
  reg  [USER_WIDTH-1:0] s_axis_phy2tlp_tuser;
  wire                  s_axis_phy2tlp_tready;
  wire [DATA_WIDTH-1:0] m_axis_tlp2phy_tdata;
  wire [KEEP_WIDTH-1:0] m_axis_tlp2phy_tkeep;
  wire                  m_axis_tlp2phy_tvalid;
  wire                  m_axis_tlp2phy_tlast;
  wire [USER_WIDTH-1:0] m_axis_tlp2phy_tuser;
  reg                   m_axis_tlp2phy_tready;
  reg                   phy_link_up;
  wire [           7:0] bus_num;
  wire                  ext_tag_enable;
  wire                  rcb_128b;
  wire [           2:0] max_read_request_size;
  wire [           2:0] max_payload_size;
  wire                  msix_enable;
  wire                  msix_mask;
  reg                   status_error_cor;
  reg                   status_error_uncor;
  reg                   rx_cpl_stall;


  wire                  fc_initialized;
  reg                   idle_valid;

  wire [7:0]            cfg_bus_number;
  wire [4:0]            cfg_device_number;
  wire [2:0]            cfg_function_number;

  integer tlp_in_beats;
  integer tlp_in_frames;
  integer tlp_out_beats;
  integer tlp_out_frames;
  integer phy_in_beats;
  integer phy_in_frames;
  integer phy_out_beats;
  integer phy_out_frames;
  integer gen1_encoded_beats;

  wire [DATA_WIDTH-1:0] gen1_pipe_scrambled_tdata;
  wire [KEEP_WIDTH-1:0] gen1_pipe_scrambled_tkeep;
  wire                  gen1_pipe_scrambled_tvalid;
  wire [9:0]            gen1_pipe_encoded [0:GEN1_PIPE_BYTES-1];
  wire [8:0]            gen1_pipe_decoded [0:GEN1_PIPE_BYTES-1];
  wire                  gen1_pipe_enc_disp [0:GEN1_PIPE_BYTES-1];
  wire                  gen1_pipe_dec_disp [0:GEN1_PIPE_BYTES-1];
  wire                  gen1_pipe_code_err [0:GEN1_PIPE_BYTES-1];
  wire                  gen1_pipe_disp_err [0:GEN1_PIPE_BYTES-1];
  wire                  gen1_pipe_encoding_error;
  reg  [8:0]            known_8b10b_datain;
  reg                   known_8b10b_dispin;
  wire [9:0]            known_8b10b_encoded;
  wire                  known_8b10b_enc_disp;
  wire [8:0]            known_8b10b_decoded;
  wire                  known_8b10b_dec_disp;
  wire                  known_8b10b_code_err;
  wire                  known_8b10b_disp_err;

  pcie_datalink_layer #(
      .DATA_WIDTH(DATA_WIDTH),
      .STRB_WIDTH(STRB_WIDTH),
      .KEEP_WIDTH(KEEP_WIDTH),
      .USER_WIDTH(USER_WIDTH),
      .S_COUNT(S_COUNT),
      .RX_FIFO_SIZE(RX_FIFO_SIZE),
      .RETRY_TLP_SIZE(RETRY_TLP_SIZE),
      .MAX_PAYLOAD_SIZE(MAX_PAYLOAD_SIZE)
  ) pcie_datalink_layer_inst (
      .clk_i(clk),
      .rst_i(rst),

      .s_tlp_axis_tdata(s_axis_tlpin_tdata),
      .s_tlp_axis_tkeep(s_axis_tlpin_tkeep),
      .s_tlp_axis_tvalid(s_axis_tlpin_tvalid),
      .s_tlp_axis_tlast(s_axis_tlpin_tlast),
      .s_tlp_axis_tuser(s_axis_tlpin_tuser),
      .s_tlp_axis_tready(s_axis_tlpin_tready),

      .m_tlp_axis_tdata(m_axis_tlpout_tdata),
      .m_tlp_axis_tkeep(m_axis_tlpout_tkeep),
      .m_tlp_axis_tvalid(m_axis_tlpout_tvalid),
      .m_tlp_axis_tlast(m_axis_tlpout_tlast),
      .m_tlp_axis_tuser(m_axis_tlpout_tuser),
      .m_tlp_axis_tready(m_axis_tlpout_tready),

      .s_phy_axis_tdata(s_axis_phy2dllp_tdata),
      .s_phy_axis_tkeep(s_axis_phy2dllp_tkeep),
      .s_phy_axis_tvalid(s_axis_phy2dllp_tvalid),
      .s_phy_axis_tlast(s_axis_phy2dllp_tlast),
      .s_phy_axis_tuser(s_axis_phy2dllp_tuser),
      .s_phy_axis_tready(s_axis_phy2dllp_tready),

      .m_phy_axis_tdata(m_axis_dllp2phy_tdata),
      .m_phy_axis_tkeep(m_axis_dllp2phy_tkeep),
      .m_phy_axis_tvalid(m_axis_dllp2phy_tvalid),
      .m_phy_axis_tlast(m_axis_dllp2phy_tlast),
      .m_phy_axis_tuser(m_axis_dllp2phy_tuser),
      .m_phy_axis_tready(m_axis_dllp2phy_tready),

      .phy_link_up_i(phy_link_up),
      .fc_initialized_o(fc_initialized),
      .idle_valid_i(idle_valid),

      .cfg_bus_number_o(cfg_bus_number),
      .cfg_device_number_o(cfg_device_number),
      .cfg_function_number_o(cfg_function_number),

      .ext_tag_enable_o(ext_tag_enable),
      .rcb_128b_o(rcb_128b),
      .max_read_request_size_o(max_read_request_size),
      .max_payload_size_o(max_payload_size),
      .msix_enable_o(msix_enable),
      .msix_mask_o(msix_mask),

      .status_error_cor_i(status_error_cor),
      .status_error_uncor_i(status_error_uncor),
      .rx_cpl_stall_i(rx_cpl_stall)
  );

  gen1_scramble gen1_pipe_scramble_inst (
      .clk_i        (clk),
      .rst_i        (rst),
      .data_in_i    (m_axis_dllp2phy_tdata),
      .data_valid_i (m_axis_dllp2phy_tvalid && m_axis_dllp2phy_tready),
      .data_valid_o (gen1_pipe_scrambled_tvalid),
      .data_out_o   (gen1_pipe_scrambled_tdata),
      .data_k_in_i  ('0),
      .pipe_width_i (GEN1_PIPE_WIDTH_FIELD),
      .data_k_out_o (gen1_pipe_scrambled_tkeep)
  );

  encode_8b10b known_8b10b_encode_inst (
      .datain  (known_8b10b_datain),
      .dispin  (known_8b10b_dispin),
      .dataout (known_8b10b_encoded),
      .dispout (known_8b10b_enc_disp)
  );

  decode_8b10b known_8b10b_decode_inst (
      .datain   (known_8b10b_encoded),
      .dispin   (known_8b10b_dispin),
      .dataout  (known_8b10b_decoded),
      .dispout  (known_8b10b_dec_disp),
      .code_err (known_8b10b_code_err),
      .disp_err (known_8b10b_disp_err)
  );

  generate
    genvar gen1_byte_idx;
    for (gen1_byte_idx = 0; gen1_byte_idx < GEN1_PIPE_BYTES; gen1_byte_idx = gen1_byte_idx + 1) begin : gen1_pipe_codec
      encode_8b10b gen1_pipe_encode_inst (
          .datain  ({1'b0, gen1_pipe_scrambled_tdata[gen1_byte_idx*8+:8]}),
          .dispin  (gen1_byte_idx == 0 ? 1'b0 : gen1_pipe_enc_disp[gen1_byte_idx-1]),
          .dataout (gen1_pipe_encoded[gen1_byte_idx]),
          .dispout (gen1_pipe_enc_disp[gen1_byte_idx])
      );

      decode_8b10b gen1_pipe_decode_inst (
          .datain   (gen1_pipe_encoded[gen1_byte_idx]),
          .dispin   (gen1_byte_idx == 0 ? 1'b0 : gen1_pipe_dec_disp[gen1_byte_idx-1]),
          .dataout  (gen1_pipe_decoded[gen1_byte_idx]),
          .dispout  (gen1_pipe_dec_disp[gen1_byte_idx]),
          .code_err (gen1_pipe_code_err[gen1_byte_idx]),
          .disp_err (gen1_pipe_disp_err[gen1_byte_idx])
      );
    end
  endgenerate

  assign gen1_pipe_encoding_error =
      gen1_pipe_code_err[0] || gen1_pipe_code_err[1] ||
      gen1_pipe_code_err[2] || gen1_pipe_code_err[3] ||
      gen1_pipe_disp_err[0] || gen1_pipe_disp_err[1] ||
      gen1_pipe_disp_err[2] || gen1_pipe_disp_err[3] ||
      (gen1_pipe_decoded[0] != {1'b0, gen1_pipe_scrambled_tdata[7:0]}) ||
      (gen1_pipe_decoded[1] != {1'b0, gen1_pipe_scrambled_tdata[15:8]}) ||
      (gen1_pipe_decoded[2] != {1'b0, gen1_pipe_scrambled_tdata[23:16]}) ||
      (gen1_pipe_decoded[3] != {1'b0, gen1_pipe_scrambled_tdata[31:24]});

  always @(posedge clk) begin
    if (rst) begin
      tlp_in_beats       <= 0;
      tlp_in_frames      <= 0;
      tlp_out_beats      <= 0;
      tlp_out_frames     <= 0;
      phy_in_beats       <= 0;
      phy_in_frames      <= 0;
      phy_out_beats      <= 0;
      phy_out_frames     <= 0;
      gen1_encoded_beats <= 0;
    end else begin
      if (s_axis_tlpin_tvalid && s_axis_tlpin_tready) begin
        tlp_in_beats <= tlp_in_beats + 1;
        if (s_axis_tlpin_tlast) begin
          tlp_in_frames <= tlp_in_frames + 1;
        end
      end

      if (m_axis_tlpout_tvalid && m_axis_tlpout_tready) begin
        tlp_out_beats <= tlp_out_beats + 1;
        if (m_axis_tlpout_tlast) begin
          tlp_out_frames <= tlp_out_frames + 1;
        end
      end

      if (s_axis_phy2dllp_tvalid && s_axis_phy2dllp_tready) begin
        phy_in_beats <= phy_in_beats + 1;
        if (s_axis_phy2dllp_tlast) begin
          phy_in_frames <= phy_in_frames + 1;
        end
      end

      if (m_axis_dllp2phy_tvalid && m_axis_dllp2phy_tready) begin
        phy_out_beats <= phy_out_beats + 1;
        if (m_axis_dllp2phy_tlast) begin
          phy_out_frames <= phy_out_frames + 1;
        end
      end

      if (gen1_pipe_scrambled_tvalid) begin
        gen1_encoded_beats <= gen1_encoded_beats + 1;
        if (gen1_pipe_encoding_error) begin
          $fatal(1, "[%0t] Gen1 8b/10b encode/decode monitor failed", $time);
        end
      end
    end
  end

  task automatic check_no_x_phy_out;
    begin
      if (m_axis_dllp2phy_tvalid && (^m_axis_dllp2phy_tdata === 1'bx)) begin
        $fatal(1, "[%0t] X detected on endpoint-to-PIPE data", $time);
      end
    end
  endtask

  task automatic check_no_x_tlp_out;
    begin
      if (m_axis_tlpout_tvalid && (^m_axis_tlpout_tdata === 1'bx)) begin
        $fatal(1, "[%0t] X detected on endpoint TLP output", $time);
      end
    end
  endtask

  task automatic send_tlp_frame(input integer beats, input [DATA_WIDTH-1:0] base_data);
    integer beat_idx;
    begin
      for (beat_idx = 0; beat_idx < beats; beat_idx = beat_idx + 1) begin
        @(posedge clk);
        s_axis_tlpin_tdata  <= base_data + beat_idx[DATA_WIDTH-1:0];
        s_axis_tlpin_tkeep  <= {KEEP_WIDTH{1'b1}};
        s_axis_tlpin_tvalid <= 1'b1;
        s_axis_tlpin_tlast  <= (beat_idx == beats - 1);
        s_axis_tlpin_tuser  <= '0;
        while (!s_axis_tlpin_tready) begin
          @(posedge clk);
        end
      end
      @(posedge clk);
      s_axis_tlpin_tdata  <= '0;
      s_axis_tlpin_tkeep  <= '0;
      s_axis_tlpin_tvalid <= 1'b0;
      s_axis_tlpin_tlast  <= 1'b0;
      s_axis_tlpin_tuser  <= '0;
    end
  endtask

  task automatic send_phy_frame(
      input integer beats,
      input [DATA_WIDTH-1:0] base_data,
      input [USER_WIDTH-1:0] user
  );
    integer beat_idx;
    begin
      for (beat_idx = 0; beat_idx < beats; beat_idx = beat_idx + 1) begin
        @(posedge clk);
        s_axis_phy2dllp_tdata  <= base_data + beat_idx[DATA_WIDTH-1:0];
        s_axis_phy2dllp_tkeep  <= {KEEP_WIDTH{1'b1}};
        s_axis_phy2dllp_tvalid <= 1'b1;
        s_axis_phy2dllp_tlast  <= (beat_idx == beats - 1);
        s_axis_phy2dllp_tuser  <= user;
        while (!s_axis_phy2dllp_tready) begin
          @(posedge clk);
        end
      end
      @(posedge clk);
      s_axis_phy2dllp_tdata  <= '0;
      s_axis_phy2dllp_tkeep  <= '0;
      s_axis_phy2dllp_tvalid <= 1'b0;
      s_axis_phy2dllp_tlast  <= 1'b0;
      s_axis_phy2dllp_tuser  <= '0;
    end
  endtask

  task automatic stream_tlp_full_rate(input integer beats);
    integer beat_idx;
    begin
      for (beat_idx = 0; beat_idx < beats; beat_idx = beat_idx + 1) begin
        @(posedge clk);
        s_axis_tlpin_tdata  <= 32'h7000_0000 + beat_idx[DATA_WIDTH-1:0];
        s_axis_tlpin_tkeep  <= {KEEP_WIDTH{1'b1}};
        s_axis_tlpin_tvalid <= 1'b1;
        s_axis_tlpin_tlast  <= (beat_idx[3:0] == 4'hf);
        s_axis_tlpin_tuser  <= '0;
        if (!s_axis_tlpin_tready) begin
          @(posedge clk);
          while (!s_axis_tlpin_tready) begin
            @(posedge clk);
          end
        end
      end
      @(posedge clk);
      s_axis_tlpin_tdata  <= '0;
      s_axis_tlpin_tkeep  <= '0;
      s_axis_tlpin_tvalid <= 1'b0;
      s_axis_tlpin_tlast  <= 1'b0;
      s_axis_tlpin_tuser  <= '0;
    end
  endtask

  task automatic check_gen1_tlp_input_rate(input integer beats);
    integer cycle_count;
    time last_accept_time;
    begin
      cycle_count = 0;
      last_accept_time = 0;
      while (cycle_count < beats) begin
        @(posedge clk);
        cycle_count = cycle_count + 1;
        if (s_axis_tlpin_tvalid && s_axis_tlpin_tready) begin
          if (last_accept_time != 0 &&
              (($time - last_accept_time) % GEN1_PIPE_CLK_PERIOD_NS) != 0) begin
            $fatal(1, "[%0t] Gen1 PIPE beat spacing was not aligned to %0d ns clock",
                   $time, GEN1_PIPE_CLK_PERIOD_NS);
          end
          last_accept_time = $time;
        end
      end

      if (GEN1_PIPE_WIDTH != DATA_WIDTH) begin
        $fatal(1, "Gen1 PIPE monitor expects %0d-bit data path, got %0d",
               GEN1_PIPE_WIDTH, DATA_WIDTH);
      end

      $display("[%0t] Gen1 monitor: %0d-bit PIPE, %0d bytes/cycle, %0d MT/s raw line rate with 8b/10b",
               $time, GEN1_PIPE_WIDTH, GEN1_PIPE_BYTES, GEN1_GT_PER_SEC);
    end
  endtask

  task automatic check_known_8b10b_symbols;
    reg [9:0] encoded_data;
    reg [9:0] encoded_k;
    begin
      encoded_data = '0;
      encoded_k    = '0;

      known_8b10b_datain = {1'b0, 8'h00};
      known_8b10b_dispin = 1'b0;
      #1;
      encoded_data = known_8b10b_encoded;
      if (known_8b10b_decoded != known_8b10b_datain ||
          known_8b10b_code_err || known_8b10b_disp_err) begin
        $fatal(1, "[%0t] 8b/10b D-symbol round-trip check failed", $time);
      end

      known_8b10b_datain = {1'b1, 8'hbc};
      known_8b10b_dispin = 1'b0;
      #1;
      encoded_k = known_8b10b_encoded;
      if (known_8b10b_decoded != known_8b10b_datain ||
          known_8b10b_code_err || known_8b10b_disp_err) begin
        $fatal(1, "[%0t] 8b/10b K28.5 round-trip check failed", $time);
      end

      if (encoded_data === encoded_k ||
          known_8b10b_enc_disp === 1'bx ||
          known_8b10b_dec_disp === 1'bx) begin
        $fatal(1, "[%0t] 8b/10b known-symbol check failed", $time);
      end
    end
  endtask

  initial begin
    $dumpfile("tb_pcie_datalink_layer.vcd");
    $dumpvars(0, tb_pcie_datalink_layer);
  end

  initial begin
    clk = 1'b0;
    forever #(GEN1_PIPE_CLK_PERIOD_NS/2) clk = ~clk;  // Gen1 32-bit PIPE clock: 62.5 MHz
  end

  initial begin
    $display("[%0t] Starting tb_pcie_datalink_layer", $time);

    rst = 1'b1;

    s_axis_tlpin_tdata   = '0;
    s_axis_tlpin_tkeep   = '0;
    s_axis_tlpin_tvalid  = 1'b0;
    s_axis_tlpin_tlast   = 1'b0;
    s_axis_tlpin_tuser   = '0;

    s_axis_phy2dllp_tdata  = '0;
    s_axis_phy2dllp_tkeep  = '0;
    s_axis_phy2dllp_tvalid = 1'b0;
    s_axis_phy2dllp_tlast  = 1'b0;
    s_axis_phy2dllp_tuser  = '0;

    s_axis_phy2tlp_tdata  = '0;
    s_axis_phy2tlp_tkeep  = '0;
    s_axis_phy2tlp_tvalid = 1'b0;
    s_axis_phy2tlp_tlast  = 1'b0;
    s_axis_phy2tlp_tuser  = '0;

    m_axis_tlpout_tready   = 1'b1;
    m_axis_dllp2phy_tready = 1'b1;
    m_axis_tlp2phy_tready  = 1'b1;

    phy_link_up        = 1'b0;
    idle_valid         = 1'b0;
    status_error_cor   = 1'b0;
    status_error_uncor = 1'b0;
    rx_cpl_stall       = 1'b0;

    repeat (10) @(posedge clk);
    rst = 1'b0;

    repeat (10) @(posedge clk);
    phy_link_up = 1'b1;
    idle_valid  = 1'b1;

    $display("[%0t] TEST 1: endpoint reset/link-up smoke", $time);

    repeat (50) @(posedge clk);
    check_no_x_phy_out();
    check_no_x_tlp_out();
    check_known_8b10b_symbols();

    $display("[%0t] TEST 1 passed", $time);

    $display("[%0t] TEST 2: application TLP into endpoint TX path", $time);
    send_tlp_frame(1, 32'h1111_0000);
    repeat (50) @(posedge clk);
    $display("[%0t] TEST 2 completed", $time);

    $display("[%0t] TEST 3: multi-beat TLP TX path to PIPE-facing stream", $time);
    send_tlp_frame(4, 32'h2222_0000);
    repeat (100) @(posedge clk);
    $display("[%0t] TEST 3 completed", $time);

    $display("[%0t] TEST 4: root-complex frame into endpoint RX path", $time);
    send_phy_frame(2, 32'h3333_0000, '0);
    repeat (100) @(posedge clk);
    $display("[%0t] TEST 4 completed", $time);

    $display("[%0t] TEST 5: PIPE-facing output backpressure", $time);
    m_axis_dllp2phy_tready = 1'b0;
    send_tlp_frame(4, 32'h4444_0000);
    repeat (20) @(posedge clk);
    m_axis_dllp2phy_tready = 1'b1;
    repeat (100) @(posedge clk);
    $display("[%0t] TEST 5 completed", $time);

    $display("[%0t] TEST 6: endpoint TLP output backpressure", $time);
    m_axis_tlpout_tready = 1'b0;
    send_phy_frame(4, 32'h5555_0000, '0);
    repeat (20) @(posedge clk);
    m_axis_tlpout_tready = 1'b1;
    repeat (100) @(posedge clk);
    $display("[%0t] TEST 6 completed", $time);

    $display("[%0t] TEST 7: reset during active traffic", $time);
    fork
      begin
        send_tlp_frame(16, 32'h6666_0000);
      end
      begin
        repeat (5) @(posedge clk);
        rst = 1'b1;
        repeat (5) @(posedge clk);
        rst = 1'b0;
      end
    join
    repeat (100) @(posedge clk);
    $display("[%0t] TEST 7 completed", $time);

    phy_link_up = 1'b1;
    idle_valid  = 1'b1;
    repeat (50) @(posedge clk);

    $display("[%0t] TEST 8: Gen1 PIPE-rate TLP input with 8b/10b monitor", $time);
    fork
      begin
        stream_tlp_full_rate(256);
      end
      begin
        check_gen1_tlp_input_rate(256);
      end
    join
    $display("[%0t] TEST 8 passed", $time);

    $display("");
    $display("===============================================");
    $display("Final scoreboard:");
    $display("  TLP input beats   = %0d", tlp_in_beats);
    $display("  TLP input frames  = %0d", tlp_in_frames);
    $display("  TLP output beats  = %0d", tlp_out_beats);
    $display("  TLP output frames = %0d", tlp_out_frames);
    $display("  PHY input beats   = %0d", phy_in_beats);
    $display("  PHY input frames  = %0d", phy_in_frames);
    $display("  PHY output beats  = %0d", phy_out_beats);
    $display("  PHY output frames = %0d", phy_out_frames);
    $display("  Gen1 encoded beats= %0d", gen1_encoded_beats);
    $display("===============================================");
    $display("");

    $display("[%0t] All fundamental pcie_datalink_layer tests completed", $time);
    $finish;
  end

endmodule
