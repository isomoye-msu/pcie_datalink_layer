module gen3_byte_scramble (
    input  logic        disable_lfsr_advance,
    input  logic [23:0] lfsr_r,
    output logic [23:0] lfsr_out
);


  always_comb begin : lfsr_outomputation
    if (disable_lfsr_advance) begin
      lfsr_out = lfsr_r;
    end else begin
      lfsr_out[0]  = lfsr_r[15] ^ lfsr_r[17] ^ lfsr_r[19] ^ lfsr_r[21] ^ lfsr_r[22];
      lfsr_out[1]  = lfsr_r[16] ^ lfsr_r[18] ^ lfsr_r[20] ^ lfsr_r[22];
      lfsr_out[2]  = lfsr_r[15] ^ lfsr_r[22];
      lfsr_out[3]  = lfsr_r[16];
      lfsr_out[4]  = lfsr_r[17];
      lfsr_out[5]  = lfsr_r[15] ^ lfsr_r[17] ^ lfsr_r[18] ^ lfsr_r[19] ^ lfsr_r[21] ^ lfsr_r[22];
      lfsr_out[6]  = lfsr_r[16] ^ lfsr_r[18] ^ lfsr_r[19] ^ lfsr_r[20] ^ lfsr_r[22];
      lfsr_out[7]  = lfsr_r[17] ^ lfsr_r[19] ^ lfsr_r[20] ^ lfsr_r[21];
      lfsr_out[8]  = lfsr_r[0] ^ lfsr_r[15] ^ lfsr_r[17] ^ lfsr_r[18] ^ lfsr_r[19] ^ lfsr_r[20];
      lfsr_out[9]  = lfsr_r[1] ^ lfsr_r[16] ^ lfsr_r[18] ^ lfsr_r[19] ^ lfsr_r[20] ^ lfsr_r[21];
      lfsr_out[10] = lfsr_r[2] ^ lfsr_r[17] ^ lfsr_r[19] ^ lfsr_r[20] ^ lfsr_r[21] ^ lfsr_r[22];
      lfsr_out[11] = lfsr_r[3] ^ lfsr_r[18] ^ lfsr_r[20] ^ lfsr_r[21] ^ lfsr_r[22];
      lfsr_out[12] = lfsr_r[4] ^ lfsr_r[19] ^ lfsr_r[21] ^ lfsr_r[22];
      lfsr_out[13] = lfsr_r[5] ^ lfsr_r[20] ^ lfsr_r[22];
      lfsr_out[14] = lfsr_r[6] ^ lfsr_r[21];
      lfsr_out[15] = lfsr_r[7] ^ lfsr_r[22];
      lfsr_out[16] = lfsr_r[8] ^ lfsr_r[15] ^ lfsr_r[17] ^ lfsr_r[19] ^ lfsr_r[21] ^ lfsr_r[22];
      lfsr_out[17] = lfsr_r[9] ^ lfsr_r[16] ^ lfsr_r[18] ^ lfsr_r[20] ^ lfsr_r[22];
      lfsr_out[18] = lfsr_r[10] ^ lfsr_r[17] ^ lfsr_r[19] ^ lfsr_r[21];
      lfsr_out[19] = lfsr_r[11] ^ lfsr_r[18] ^ lfsr_r[20] ^ lfsr_r[22];
      lfsr_out[20] = lfsr_r[12] ^ lfsr_r[19] ^ lfsr_r[21];
      lfsr_out[21] = lfsr_r[13] ^ lfsr_r[15] ^ lfsr_r[17] ^ lfsr_r[19] ^ lfsr_r[20] ^ lfsr_r[21];
      lfsr_out[22] = lfsr_r[14] ^ lfsr_r[16] ^ lfsr_r[18] ^ lfsr_r[20] ^ lfsr_r[21] ^ lfsr_r[22];
    end
  end



endmodule
