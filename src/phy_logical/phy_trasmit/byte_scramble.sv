module byte_scramble (
    input  logic        disable_scrambling,
    input  logic [15:0] lfsr_q,
    output logic [15:0] lfsr_out
);


  always_comb begin : lfsr_computation
    if (disable_scrambling) begin
      lfsr_out = lfsr_q;
    end else begin
      lfsr_out[0]  = lfsr_q[8];
      lfsr_out[1]  = lfsr_q[9];
      lfsr_out[2]  = lfsr_q[10];
      lfsr_out[3]  = lfsr_q[8] ^ lfsr_q[11];
      lfsr_out[4]  = lfsr_q[8] ^ lfsr_q[9] ^ lfsr_q[12];
      lfsr_out[5]  = lfsr_q[8] ^ lfsr_q[9] ^ lfsr_q[10] ^ lfsr_q[13];
      lfsr_out[6]  = lfsr_q[9] ^ lfsr_q[10] ^ lfsr_q[11] ^ lfsr_q[14];
      lfsr_out[7]  = lfsr_q[10] ^ lfsr_q[11] ^ lfsr_q[12] ^ lfsr_q[15];
      lfsr_out[8]  = lfsr_q[0] ^ lfsr_q[11] ^ lfsr_q[12] ^ lfsr_q[13];
      lfsr_out[9]  = lfsr_q[1] ^ lfsr_q[12] ^ lfsr_q[13] ^ lfsr_q[14];
      lfsr_out[10] = lfsr_q[2] ^ lfsr_q[13] ^ lfsr_q[14] ^ lfsr_q[15];
      lfsr_out[11] = lfsr_q[3] ^ lfsr_q[14] ^ lfsr_q[15];
      lfsr_out[12] = lfsr_q[4] ^ lfsr_q[15];
      lfsr_out[13] = lfsr_q[5];
      lfsr_out[14] = lfsr_q[6];
      lfsr_out[15] = lfsr_q[7];
    end
  end



endmodule
