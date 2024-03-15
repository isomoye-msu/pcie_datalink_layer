module descrambler
  import pcie_phy_pkg::*;
(

    input  logic               clk_i,             //! 100MHz clock signal
    input  logic               rst_i,             //! Reset signal
    input  logic        [ 7:0] lane_number,
    input  logic        [ 1:0] sync_header_i,
    input  rate_speed_e        curr_data_rate_i,
    input  logic        [31:0] data_in_i,
    input  logic               data_valid_i,
    output logic               data_valid_o,
    output logic        [31:0] data_out_o,
    input  logic        [ 3:0] data_k_in_i,
    input  logic        [ 5:0] pipe_width_i,
    output logic        [ 3:0] data_k_out_o,
    output logic        [ 1:0] sync_header_o
    // !Control
);


  logic [ 3:0] gen1_data_k;
  logic [31:0] gen1_data;
  logic        gen1_valid;

  logic [ 3:0] gen3_data_k;
  logic [31:0] gen3_data;
  logic        gen3_valid;



  gen3_descramble gen3_scramble_inst (
      .clk_i(clk_i),
      .rst_i(rst_i),
      .lane_number(lane_number),
      .sync_header_i(sync_header_i),
      .data_in_i(data_in_i),
      .data_valid_i(data_valid_i),
      .ltssm_polling_compliance_i('0),
      .data_valid_o(gen3_valid),
      .data_out_o(gen3_data),
      .data_k_in_i(data_k_in_i),
      .pipe_width_i(pipe_width_i),
      .data_k_out_o(gen3_data_k)
  );

  gen1_descramble gen1_scramble_inst (
      .clk_i(clk_i),
      .rst_i(rst_i),
      .data_in_i(data_in_i),
      .data_valid_i(data_valid_i),
      .data_valid_o(gen1_valid),
      .data_out_o(gen1_data),
      .data_k_in_i(data_k_in_i),
      .pipe_width_i(pipe_width_i),
      .data_k_out_o(gen1_data_k)
  );

  always_ff @(posedge clk_i) begin
    if (rst_i) begin
      sync_header_o <= '0;
      data_valid_o  <= '0;
      data_k_out_o  <= '0;
    end else begin
      sync_header_o <= sync_header_i;
      data_valid_o  <= data_valid_i;
      data_k_out_o  <= data_k_in_i;
    end
  end

  always_comb begin
    if (curr_data_rate_i < gen3) begin
      // data_k_out_o = gen1_data_k;
      data_out_o = gen1_data;
      // data_valid_o = gen1_valid;
    end else begin
      // data_k_out_o = gen3_data_k;
      data_out_o = gen3_data;
      // data_valid_o = gen3_valid;
    end
  end





endmodule
