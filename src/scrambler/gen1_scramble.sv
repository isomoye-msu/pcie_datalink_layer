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
  logic [15:0] lfsr_out             [5];
  logic [ 3:0] scramble_reset;
  logic [ 3:0] disable_scrambling;
  logic [ 3:0] disable_scrambling_r;
  logic [31:0] data_out_c;
  logic [31:0] data_out_r;
  logic [ 7:0] scrambled_data       [5];

  logic [ 3:0] data_k_swapped;
  logic [31:0] data_in_swapped;
  logic [ 3:0] data_k_c;
  logic [ 3:0] data_k_r;

  logic [31:0] byte_cnt_c;
  logic [31:0] byte_cnt_r;



  assign lfsr_out[0]  = lfsr_r;
  assign data_k_out_o = '0;
  //   assign scrambled_data[0] = data_in_swapped[7:0];

  for (genvar i = 0; i < 4; i++) begin : gen_byte_scramble
    byte_scramble byte_scramble_inst (
        .disable_scrambling(disable_scrambling[0] & data_valid_i),
        .lfsr_q(lfsr_out[i]),
        .lfsr_out(lfsr_out[i+1])
    );
  end


  always_ff @(posedge clk_i) begin : scramble_seq_block
    if (rst_i) begin
      lfsr_r               <= '1;
      data_valid_o         <= '0;
      disable_scrambling_r <= '0;
      byte_cnt_r <= '0;
    end else begin
      lfsr_r               <= lfsr_c;
      data_valid_o         <= data_valid_i;
      disable_scrambling_r <= disable_scrambling;
      byte_cnt_r <= byte_cnt_c;
    end
    data_k_r   <= data_k_c;
    data_out_r <= data_out_c;
  end


  for (genvar byte_ = 0; byte_ < 4; byte_++) begin : gen_xor_scramble
    always_comb begin : scramble_comb_block
      disable_scrambling[byte_] = disable_scrambling_r[byte_];
      scramble_reset[byte_] = '0;
      data_out_c[byte_*8+:8] =  disable_scrambling_r == '0 ? 
      (data_in_i[byte_*8+:8] ^ lfsr_out[byte_]): data_in_i[byte_*8+:8];
      if (byte_ < (pipe_width_i >> 3)) begin
        //check if special symbol
        if (data_valid_i & data_k_in_i[byte_]) begin
          disable_scrambling[byte_] = '1;
          //check if comma
          if (data_in_i[7:0] == COM) begin
            //reset lfsr
            scramble_reset[byte_]  = '1;
            data_out_c[byte_*8+:8] = data_in_i[byte_*8+:8];
          end 
          // else if (! (data_in_i[byte_*8+:8] inside{PAD_,TS1,TS2,IDL})) begin
          //   disable_scrambling[byte_] = '0;
          // end
          // disable_scrambling[i] = '1;
        end
      end
    end


  end
  always_comb begin : scramble_comb_block
    // scramble_reset     = '0;
    // disable_scrambling = disable_scrambling_r;
    // data_out_c         = data_out_r;
    lfsr_c = lfsr_r;

    if (scramble_reset != '0) begin
      lfsr_c = '1;
    end else begin
      //select which lfsr advance to use based on pipewidth
      lfsr_c = lfsr_out[(pipe_width_i>>3)];
    end

    // if ('1) begin
    // data_out_c = data_in_i;
    // for (int i = 0; i < 4; i++) begin
    //   logic [7:0] byte_idx;
    //   byte_idx = ((pipe_width_i >> 3) - 1) - i;
    //   scrambled_data[i] = '0;
    //   data_out_c[byte_idx<<3+:8] = (data_in_i[byte_idx<<3+:8] ^ (24'({<<{lfsr_out[byte_idx]}})));
    //   if (i < (pipe_width_i >> 3)) begin
    //     //check if special symbol
    //     if (data_valid_i & data_k_in_i[byte_idx]) begin
    //       if (data_in_i[byte_idx*8+:8] != PAD_) begin
    //         disable_scrambling = '0;
    //       end
    //       disable_scrambling[i] = '1;

    //       //don't scramble
    //       data_out_c[byte_idx*8+:8] = data_in_i[byte_idx*8+:8];
    //       //check if comma
    //       if (data_in_i[byte_idx*8+:8] == COM) begin
    //         //reset lfsr
    //         scramble_reset[i]  = '1;
    //         disable_scrambling = '1;
    //       end
    //     end else if (disable_scrambling[byte_idx] & data_valid_i) begin
    //       data_out_c[byte_idx*8+:8] = data_in_i[byte_idx*8+:8];
    //     end else begin
    //       //scramble data
    //       data_out_c[byte_idx<<3+:8] = (data_in_i[byte_idx<<3+:8]
    //         ^ (24'({<<{lfsr_out[byte_idx]}})));
    //     end
    //     //update out
    //     // data_out_c[i*8+:8] = scrambled_data[i];
    //   end
    // end
  end
  // end

  assign data_out_o = data_out_r;

endmodule
