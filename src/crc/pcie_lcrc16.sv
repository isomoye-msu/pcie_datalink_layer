module pcie_lcrc16 (
    input  [31:0] crcIn,
    input  [31:0] data,
    output [31:0] crcOut,
    input  [ 1:0] select
);

  reg [31:0] crc_out8;
  reg [31:0] crc_out16;
  reg [31:0] crc_out24;
  reg [31:0] crc_out32;

  pcie_crc8 pcie_crc8_inst0 (
      .crcIn (crcIn),
      .data  (data[7:0]),
      .crcOut(crc_out8)
  );

  pcie_crc8 pcie_crc8_inst1 (
      .crcIn (crc_out8),
      .data  (data[15:8]),
      .crcOut(crc_out16)
  );

  pcie_crc8 pcie_crc8_inst2 (
      .crcIn (crc_out16),
      .data  (data[23:16]),
      .crcOut(crc_out24)
  );

  pcie_crc8 pcie_crc8_inst3 (
      .crcIn (crc_out24),
      .data  (data[31:24]),
      .crcOut(crc_out32)
  );

  // always_comb begin
  //   crcOut = 32'h0;
  //   case (select)
  //     2'b00: begin
  //       crcOut = crc_out8;
  //     end
  //     2'b01: begin
  //       crcOut = crc_out8;
  //     end
  //     2'b10: begin
  //       crcOut = crc_out8;
  //     end
  //     2'b11: begin
  //       crcOut = crc_out8;
  //     end
  //     default: begin
  //       crcOut = 32'h0;
  //     end
  //   endcase
  // end
  assign crcOut = select == 2'b00 ? crc_out8 :
                  select == 2'b01 ? crc_out16 :
                  select == 2'b10 ? crc_out24 :
                  select == 2'b11 ? crc_out32 : 32'h0;

endmodule
// // vim: ts=4 sw=4 expandtab

// // THIS IS GENERATED VERILOG CODE.
// // https://bues.ch/h/crcgen
// // 
// // This code is Public Domain.
// // Permission to use, copy, modify, and/or distribute this software for any
// // purpose with or without fee is hereby granted.
// // 
// // THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
// // WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
// // MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
// // SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER
// // RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT,
// // NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE
// // USE OR PERFORMANCE OF THIS SOFTWARE.

// //`ifndef CRC_V_
// //`define CRC_V_

// // CRC polynomial coefficients: x^32 + x^26 + x^23 + x^22 + x^16 + x^12 + x^11 + x^10 + x^8 + x^7 + x^5 + x^4 + x^2 + x + 1
// //                              0x4C11DB7 (hex)
// // CRC width:                   32 bits
// // CRC shift direction:         left (big endian)
// // Input word width:            16 bits

// module pcie_lcrc16 (
//     input  [31:0] crcIn,
//     input  [15:0] data,
//     output [31:0] crcOut
// );
//   assign crcOut[0] = crcIn[16] ^ crcIn[22] ^ crcIn[25] ^ crcIn[26] ^ crcIn[28] ^ data[0] ^ data[6] ^ data[9] ^ data[10] ^ data[12];
//   assign crcOut[1] = crcIn[16] ^ crcIn[17] ^ crcIn[22] ^ crcIn[23] ^ crcIn[25] ^ crcIn[27] ^ crcIn[28] ^ crcIn[29] ^ data[0] ^ data[1] ^ data[6] ^ data[7] ^ data[9] ^ data[11] ^ data[12] ^ data[13];
//   assign crcOut[2] = crcIn[16] ^ crcIn[17] ^ crcIn[18] ^ crcIn[22] ^ crcIn[23] ^ crcIn[24] ^ crcIn[25] ^ crcIn[29] ^ crcIn[30] ^ data[0] ^ data[1] ^ data[2] ^ data[6] ^ data[7] ^ data[8] ^ data[9] ^ data[13] ^ data[14];
//   assign crcOut[3] = crcIn[17] ^ crcIn[18] ^ crcIn[19] ^ crcIn[23] ^ crcIn[24] ^ crcIn[25] ^ crcIn[26] ^ crcIn[30] ^ crcIn[31] ^ data[1] ^ data[2] ^ data[3] ^ data[7] ^ data[8] ^ data[9] ^ data[10] ^ data[14] ^ data[15];
//   assign crcOut[4] = crcIn[16] ^ crcIn[18] ^ crcIn[19] ^ crcIn[20] ^ crcIn[22] ^ crcIn[24] ^ crcIn[27] ^ crcIn[28] ^ crcIn[31] ^ data[0] ^ data[2] ^ data[3] ^ data[4] ^ data[6] ^ data[8] ^ data[11] ^ data[12] ^ data[15];
//   assign crcOut[5] = crcIn[16] ^ crcIn[17] ^ crcIn[19] ^ crcIn[20] ^ crcIn[21] ^ crcIn[22] ^ crcIn[23] ^ crcIn[26] ^ crcIn[29] ^ data[0] ^ data[1] ^ data[3] ^ data[4] ^ data[5] ^ data[6] ^ data[7] ^ data[10] ^ data[13];
//   assign crcOut[6] = crcIn[17] ^ crcIn[18] ^ crcIn[20] ^ crcIn[21] ^ crcIn[22] ^ crcIn[23] ^ crcIn[24] ^ crcIn[27] ^ crcIn[30] ^ data[1] ^ data[2] ^ data[4] ^ data[5] ^ data[6] ^ data[7] ^ data[8] ^ data[11] ^ data[14];
//   assign crcOut[7] = crcIn[16] ^ crcIn[18] ^ crcIn[19] ^ crcIn[21] ^ crcIn[23] ^ crcIn[24] ^ crcIn[26] ^ crcIn[31] ^ data[0] ^ data[2] ^ data[3] ^ data[5] ^ data[7] ^ data[8] ^ data[10] ^ data[15];
//   assign crcOut[8] = crcIn[16] ^ crcIn[17] ^ crcIn[19] ^ crcIn[20] ^ crcIn[24] ^ crcIn[26] ^ crcIn[27] ^ crcIn[28] ^ data[0] ^ data[1] ^ data[3] ^ data[4] ^ data[8] ^ data[10] ^ data[11] ^ data[12];
//   assign crcOut[9] = crcIn[17] ^ crcIn[18] ^ crcIn[20] ^ crcIn[21] ^ crcIn[25] ^ crcIn[27] ^ crcIn[28] ^ crcIn[29] ^ data[1] ^ data[2] ^ data[4] ^ data[5] ^ data[9] ^ data[11] ^ data[12] ^ data[13];
//   assign crcOut[10] = crcIn[16] ^ crcIn[18] ^ crcIn[19] ^ crcIn[21] ^ crcIn[25] ^ crcIn[29] ^ crcIn[30] ^ data[0] ^ data[2] ^ data[3] ^ data[5] ^ data[9] ^ data[13] ^ data[14];
//   assign crcOut[11] = crcIn[16] ^ crcIn[17] ^ crcIn[19] ^ crcIn[20] ^ crcIn[25] ^ crcIn[28] ^ crcIn[30] ^ crcIn[31] ^ data[0] ^ data[1] ^ data[3] ^ data[4] ^ data[9] ^ data[12] ^ data[14] ^ data[15];
//   assign crcOut[12] = crcIn[16] ^ crcIn[17] ^ crcIn[18] ^ crcIn[20] ^ crcIn[21] ^ crcIn[22] ^ crcIn[25] ^ crcIn[28] ^ crcIn[29] ^ crcIn[31] ^ data[0] ^ data[1] ^ data[2] ^ data[4] ^ data[5] ^ data[6] ^ data[9] ^ data[12] ^ data[13] ^ data[15];
//   assign crcOut[13] = crcIn[17] ^ crcIn[18] ^ crcIn[19] ^ crcIn[21] ^ crcIn[22] ^ crcIn[23] ^ crcIn[26] ^ crcIn[29] ^ crcIn[30] ^ data[1] ^ data[2] ^ data[3] ^ data[5] ^ data[6] ^ data[7] ^ data[10] ^ data[13] ^ data[14];
//   assign crcOut[14] = crcIn[18] ^ crcIn[19] ^ crcIn[20] ^ crcIn[22] ^ crcIn[23] ^ crcIn[24] ^ crcIn[27] ^ crcIn[30] ^ crcIn[31] ^ data[2] ^ data[3] ^ data[4] ^ data[6] ^ data[7] ^ data[8] ^ data[11] ^ data[14] ^ data[15];
//   assign crcOut[15] = crcIn[19] ^ crcIn[20] ^ crcIn[21] ^ crcIn[23] ^ crcIn[24] ^ crcIn[25] ^ crcIn[28] ^ crcIn[31] ^ data[3] ^ data[4] ^ data[5] ^ data[7] ^ data[8] ^ data[9] ^ data[12] ^ data[15];
//   assign crcOut[16] = crcIn[0] ^ crcIn[16] ^ crcIn[20] ^ crcIn[21] ^ crcIn[24] ^ crcIn[28] ^ crcIn[29] ^ data[0] ^ data[4] ^ data[5] ^ data[8] ^ data[12] ^ data[13];
//   assign crcOut[17] = crcIn[1] ^ crcIn[17] ^ crcIn[21] ^ crcIn[22] ^ crcIn[25] ^ crcIn[29] ^ crcIn[30] ^ data[1] ^ data[5] ^ data[6] ^ data[9] ^ data[13] ^ data[14];
//   assign crcOut[18] = crcIn[2] ^ crcIn[18] ^ crcIn[22] ^ crcIn[23] ^ crcIn[26] ^ crcIn[30] ^ crcIn[31] ^ data[2] ^ data[6] ^ data[7] ^ data[10] ^ data[14] ^ data[15];
//   assign crcOut[19] = crcIn[3] ^ crcIn[19] ^ crcIn[23] ^ crcIn[24] ^ crcIn[27] ^ crcIn[31] ^ data[3] ^ data[7] ^ data[8] ^ data[11] ^ data[15];
//   assign crcOut[20] = crcIn[4] ^ crcIn[20] ^ crcIn[24] ^ crcIn[25] ^ crcIn[28] ^ data[4] ^ data[8] ^ data[9] ^ data[12];
//   assign crcOut[21] = crcIn[5] ^ crcIn[21] ^ crcIn[25] ^ crcIn[26] ^ crcIn[29] ^ data[5] ^ data[9] ^ data[10] ^ data[13];
//   assign crcOut[22] = crcIn[6] ^ crcIn[16] ^ crcIn[25] ^ crcIn[27] ^ crcIn[28] ^ crcIn[30] ^ data[0] ^ data[9] ^ data[11] ^ data[12] ^ data[14];
//   assign crcOut[23] = crcIn[7] ^ crcIn[16] ^ crcIn[17] ^ crcIn[22] ^ crcIn[25] ^ crcIn[29] ^ crcIn[31] ^ data[0] ^ data[1] ^ data[6] ^ data[9] ^ data[13] ^ data[15];
//   assign crcOut[24] = crcIn[8] ^ crcIn[17] ^ crcIn[18] ^ crcIn[23] ^ crcIn[26] ^ crcIn[30] ^ data[1] ^ data[2] ^ data[7] ^ data[10] ^ data[14];
//   assign crcOut[25] = crcIn[9] ^ crcIn[18] ^ crcIn[19] ^ crcIn[24] ^ crcIn[27] ^ crcIn[31] ^ data[2] ^ data[3] ^ data[8] ^ data[11] ^ data[15];
//   assign crcOut[26] = crcIn[10] ^ crcIn[16] ^ crcIn[19] ^ crcIn[20] ^ crcIn[22] ^ crcIn[26] ^ data[0] ^ data[3] ^ data[4] ^ data[6] ^ data[10];
//   assign crcOut[27] = crcIn[11] ^ crcIn[17] ^ crcIn[20] ^ crcIn[21] ^ crcIn[23] ^ crcIn[27] ^ data[1] ^ data[4] ^ data[5] ^ data[7] ^ data[11];
//   assign crcOut[28] = crcIn[12] ^ crcIn[18] ^ crcIn[21] ^ crcIn[22] ^ crcIn[24] ^ crcIn[28] ^ data[2] ^ data[5] ^ data[6] ^ data[8] ^ data[12];
//   assign crcOut[29] = crcIn[13] ^ crcIn[19] ^ crcIn[22] ^ crcIn[23] ^ crcIn[25] ^ crcIn[29] ^ data[3] ^ data[6] ^ data[7] ^ data[9] ^ data[13];
//   assign crcOut[30] = crcIn[14] ^ crcIn[20] ^ crcIn[23] ^ crcIn[24] ^ crcIn[26] ^ crcIn[30] ^ data[4] ^ data[7] ^ data[8] ^ data[10] ^ data[14];
//   assign crcOut[31] = crcIn[15] ^ crcIn[21] ^ crcIn[24] ^ crcIn[25] ^ crcIn[27] ^ crcIn[31] ^ data[5] ^ data[8] ^ data[9] ^ data[11] ^ data[15];
// endmodule

// //`endif  // CRC_V_
