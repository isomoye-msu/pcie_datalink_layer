module gen1_scramble
  import pcie_phy_pkg::*;
(

    input  logic        clk_i,         //! 100MHz clock signal
    input  logic        rst_i,         //! Reset signal
    input  logic [31:0] data_in_i,
    input  logic        data_valid_i,
    output logic        data_valid_o,
    output logic [31:0] data_out_o,
    input  logic [ 3:0] data_k_in_i,
    input  logic [ 5:0] pipe_width_i,
    output logic [ 3:0] data_k_out_o
    // !Control
);

  //   logic [ 7:0] scrambled_data;
  logic [15:0] lfsr_c;
  logic [15:0] lfsr_r;
  logic [15:0] lfsr_out           [5];
  logic [ 3:0] scramble_reset;
  logic [ 3:0] disable_scrambling;
  logic [31:0] data_out_c;
  logic [31:0] data_out_r;
  logic [ 7:0] scrambled_data     [5];

  logic [ 3:0] data_k_swapped;
  logic [31:0] data_in_swapped;
  logic [ 7:0] byte_idx;
  logic [ 3:0] data_k_c;
  logic [ 3:0] data_k_r;



  assign lfsr_out[0] = lfsr_r;
  //   assign scrambled_data[0] = data_in_swapped[7:0];

  for (genvar i = 0; i < 4; i++) begin : gen_byte_scramble
    byte_scramble byte_scramble_inst (
        .disable_scrambling(disable_scrambling[0]),
        .lfsr_q(lfsr_out[i]),
        .lfsr_out(lfsr_out[i+1])
    );
  end


  always_ff @(posedge clk_i) begin : scramble_seq_block
    if (rst_i) begin
      lfsr_r       <= '1;
      data_valid_o <= '0;
    end else begin
      lfsr_r       <= lfsr_c;
      data_valid_o <= data_valid_i;
    end
    data_k_r   <= data_k_c;
    data_out_r <= data_out_c;
  end

  always_comb begin : scramble_comb_block
    scramble_reset     = '0;
    disable_scrambling = '0;
    data_out_c         = data_out_r;
    lfsr_c             = lfsr_r;
    data_in_swapped    = '0;
    data_k_swapped     = '0;

    if (scramble_reset != '0) begin
      lfsr_c = '1;
    end else if (data_valid_i) begin
      //select which lfsr advance to use based on pipewidth
      lfsr_c = lfsr_out[(pipe_width_i>>3)];
    end

    if (data_valid_i) begin
      data_out_c = data_in_i;
      for (int i = 0; i < 4; i++) begin
        byte_idx = ((pipe_width_i >> 3) - 1) - i;
        scrambled_data[i] = '0;
        if (i < (pipe_width_i >> 3)) begin
          //check if special symbol
          if (data_k_in_i[byte_idx]) begin
            disable_scrambling[i] = '1;
            //don't scramble
            data_out_c[byte_idx<<3+:8] = data_in_i[byte_idx<<3+:8];
            //check if comma
            if (data_in_i[i*8+:8] == COM && i == '0) begin
              //reset lfsr
              scramble_reset[i] = '1;
            end
          end else begin
            //scramble data
            data_out_c[byte_idx<<3+:8] = (data_in_i[byte_idx<<3+:8] ^ (data_t'({<<{lfsr_out[byte_idx]}})));
          end
          //update out
          // data_out_c[i*8+:8] = scrambled_data[i];
        end
      end
    end
  end

  assign data_out_o = data_out_r;

endmodule
