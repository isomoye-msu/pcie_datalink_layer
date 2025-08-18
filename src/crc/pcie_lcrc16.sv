module pcie_lcrc16 (
    input  [31:0] crcIn,
    input  [31:0] data,
    output [31:0] crcOut
);

  logic [31:0] temp_crc;
  always_comb begin

    temp_crc = 32'd0;

    temp_crc[0] = data[3] ^ data[5] ^ data[6] ^ data[9] ^ data[15] ^ crcIn[16] ^ crcIn[22] ^ crcIn[25] ^ crcIn[26] ^ crcIn[28];
    temp_crc[1] = data[2] ^ data[3] ^ data[4] ^ data[6] ^ data[8] ^ data[9] ^ data[14] ^ data[15] ^ crcIn[16] ^ 
crcIn[17] ^ crcIn[22] ^ crcIn[23] ^ crcIn[25] ^ crcIn[27] ^ crcIn[28] ^ crcIn[29];
    temp_crc[2] = data[1] ^ data[2] ^ data[6] ^ data[7] ^ data[8] ^ data[9] ^ data[13] ^ data[14] ^ data[15] ^ 
crcIn[16] ^ crcIn[17] ^ crcIn[18] ^ crcIn[22] ^ crcIn[23] ^ crcIn[24] ^ crcIn[25] ^ crcIn[29] ^ crcIn[30];
    temp_crc[3] = data[0] ^ data[1] ^ data[5] ^ data[6] ^ data[7] ^ data[8] ^ data[12] ^ data[13] ^ data[14] ^ 
crcIn[17] ^ crcIn[18] ^ crcIn[19] ^ crcIn[23] ^ crcIn[24] ^ crcIn[25] ^ crcIn[26] ^ crcIn[30] ^ crcIn[31];
    temp_crc[4] = data[0] ^ data[3] ^ data[4] ^ data[7] ^ data[9] ^ data[11] ^ data[12] ^ data[13] ^ data[15] ^ 
crcIn[16] ^ crcIn[18] ^ crcIn[19] ^ crcIn[20] ^ crcIn[22] ^ crcIn[24] ^ crcIn[27] ^ crcIn[28] ^ crcIn[31];
    temp_crc[5] = data[2] ^ data[5] ^ data[8] ^ data[9] ^ data[10] ^ data[11] ^ data[12] ^ data[14] ^ data[15] 
^ crcIn[16] ^ crcIn[17] ^ crcIn[19] ^ crcIn[20] ^ crcIn[21] ^ crcIn[22] ^ crcIn[23] ^ crcIn[26] ^ 
crcIn[29];
    temp_crc[6] = data[1] ^ data[4] ^ data[7] ^ data[8] ^ data[9] ^ data[10] ^ data[11] ^ data[13] ^ data[14] ^ 
crcIn[17] ^ crcIn[18] ^ crcIn[20] ^ crcIn[21] ^ crcIn[22] ^ crcIn[23] ^ crcIn[24] ^ crcIn[27] ^ crcIn[30];
    temp_crc[7] = data[0] ^ data[5] ^ data[7] ^ data[8] ^ data[10] ^ data[12] ^ data[13] ^ data[15] ^ crcIn[16] 
^ crcIn[18] ^ crcIn[19] ^ crcIn[21] ^ crcIn[23] ^ crcIn[24] ^ crcIn[26] ^ crcIn[31];
    temp_crc[8] = data[3] ^ data[4] ^ data[5] ^ data[7] ^ data[11] ^ data[12] ^ data[14] ^ data[15] ^ crcIn[16] 
^ crcIn[17] ^ crcIn[ 19] ^ crcIn[20] ^ crcIn[24] ^ crcIn[26] ^ crcIn[27] ^ crcIn[28];
    temp_crc[9] = data[2] ^ data[3] ^ data[4] ^ data[6] ^ data[10] ^ data[11] ^ data[13] ^ data[14] ^ crcIn[17] 
^ crcIn[18] ^ crcIn[20] ^ crcIn[21] ^ crcIn[25] ^ crcIn[27] ^ crcIn[28] ^ crcIn[29];
    temp_crc[10] = data[1] ^ data[2] ^ data[6] ^ data[10] ^ data[12] ^ data[13] ^ data[15] ^ crcIn[16] ^ crcIn[18] 
^ crcIn[19] ^ crcIn[21] ^ crcIn[25] ^ crcIn[29] ^ crcIn[30];
    temp_crc[11] = data[0] ^ data[1] ^ data[3] ^ data[6] ^ data[11] ^ data[12] ^ data[14] ^ data[15] ^ crcIn[16] 
^ crcIn[17] ^ crcIn[19] ^ crcIn[20] ^ crcIn[25] ^ crcIn[28] ^ crcIn[30] ^ crcIn[31];
    temp_crc[12] = data[0] ^ data[2] ^ data[3] ^ data[6] ^ data[9] ^ data[10] ^ data[11] ^ data[13] ^ data[14] ^ 
data[15] ^ crcIn[16] ^ crcIn[17] ^ crcIn[18] ^ crcIn[20] ^ crcIn[21] ^ crcIn[22] ^ crcIn[25] ^ crcIn[28] 
^ crcIn[29] ^ crcIn[31];
    temp_crc[13] = data[1] ^ data[2] ^ data[5] ^ data[8] ^ data[9] ^ data[10] ^ data[12] ^ data[13] ^ data[14] ^ 
crcIn[17] ^ crcIn[18] ^ crcIn[19] ^ crcIn[21] ^ crcIn[22] ^ crcIn[23] ^ crcIn[26] ^ crcIn[29] ^ crcIn[30];
    temp_crc[14] = data[0] ^ data[1] ^ data[4] ^ data[7] ^ data[8] ^ data[9] ^ data[11] ^ data[12] ^ data[13] ^ 
crcIn[18] ^ crcIn[19] ^ crcIn[20] ^ crcIn[22] ^ crcIn[23] ^ crcIn[24] ^ crcIn[27] ^ crcIn[30] ^ crcIn[31];
    temp_crc[15] = data[0] ^ data[3] ^ data[6] ^ data[7] ^ data[8] ^ data[10] ^ data[11] ^ data[12] ^ crcIn[19] ^ 
crcIn[20] ^ crcIn[21] ^ crcIn[23] ^ crcIn[24] ^ crcIn[25] ^ crcIn[28] ^ crcIn[31];
    temp_crc[16] = data[2] ^ data[3] ^ data[7] ^ data[10] ^ data[11] ^ data[15] ^ crcIn[0] ^ crcIn[16] ^ crcIn[20] 
^ crcIn[21] ^ crcIn[24] ^ crcIn[28] ^ crcIn[29];
    temp_crc[17] = data[1] ^ data[2] ^ data[6] ^ data[9] ^ data[10] ^ data[14] ^ crcIn[1] ^ crcIn[17] ^ crcIn[21] ^ 
crcIn[22] ^ crcIn[25] ^ crcIn[29] ^ crcIn[30];
    temp_crc[18] = data[0] ^ data[1] ^ data[5] ^ data[8] ^ data[9] ^ data[13] ^ crcIn[2] ^ crcIn[18] ^ crcIn[22] ^ 
crcIn[23] ^ crcIn[26] ^ crcIn[30] ^ crcIn[31];
    temp_crc[19] = data[0] ^ data[4] ^ data[7] ^ data[8] ^ data[12] ^ crcIn[3] ^ crcIn[19] ^ crcIn[23] ^ crcIn[24] ^ crcIn[27] ^ crcIn[31];
    temp_crc[20] = data[3] ^ data[6] ^ data[7] ^ data[11] ^ crcIn[4] ^ crcIn[20] ^ crcIn[24] ^ crcIn[25] ^ crcIn[28];
    temp_crc[21] = data[2] ^ data[5] ^ data[6] ^ data[10] ^ crcIn[5] ^ crcIn[21] ^ crcIn[25] ^ crcIn[26] ^ crcIn[29];
    temp_crc[22] = data[1] ^ data[3] ^ data[4] ^ data[6] ^ data[15] ^ crcIn[6] ^ crcIn[16] ^ crcIn[25] ^ crcIn[27] ^ crcIn[28] ^ crcIn[30];
    temp_crc[23] = data[0] ^ data[2] ^ data[6] ^ data[9] ^ data[14] ^ data[15] ^ crcIn[7] ^ crcIn[16] ^ crcIn[17] ^ 
crcIn[22] ^ crcIn[25] ^ crcIn[29] ^ crcIn[31];
    temp_crc[24] = data[1] ^ data[5] ^ data[8] ^ data[13] ^ data[14] ^ crcIn[8] ^ crcIn[17] ^ crcIn[18] ^ crcIn[23] ^ crcIn[26] ^ crcIn[30];
    temp_crc[25] = data[0] ^ data[4] ^ data[7] ^ data[12] ^ data[13] ^ crcIn[9] ^ crcIn[18] ^ crcIn[19] ^ crcIn[24] ^ crcIn[27] ^ crcIn[31];
    temp_crc[26] = data[5] ^ data[9] ^ data[11] ^ data[12] ^ data[15] ^ crcIn[10] ^ crcIn[16] ^ crcIn[19] ^ crcIn[20] ^ crcIn[22] ^ crcIn[26];
    temp_crc[27] = data[4] ^ data[8] ^ data[10] ^ data[11] ^ data[14] ^ crcIn[11] ^ crcIn[17] ^ crcIn[20] ^ crcIn[21] ^ crcIn[23] ^ crcIn[27];
    temp_crc[28] = data[3] ^ data[7] ^ data[9] ^ data[10] ^ data[13] ^ crcIn[12] ^ crcIn[18] ^ crcIn[21] ^ crcIn[22] ^ crcIn[24] ^ crcIn[28];
    temp_crc[29] = data[2] ^ data[6] ^ data[8] ^ data[9] ^ data[12] ^ crcIn[13] ^ crcIn[19] ^ crcIn[22] ^ crcIn[23] ^ crcIn[25] ^ crcIn[29];
    temp_crc[30] = data[1] ^ data[5] ^ data[7] ^ data[8] ^ data[11] ^ crcIn[14] ^ crcIn[20] ^ crcIn[23] ^ crcIn[24] ^ crcIn[26] ^ crcIn[30];
    temp_crc[31] = data[0] ^ data[4] ^ data[6] ^ data[7] ^ data[10] ^ crcIn[15] ^ crcIn[21] ^ crcIn[24] ^ crcIn[25] ^ crcIn[27] ^ crcIn[31];

  end
  assign crcOut = temp_crc;
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
//   assign temp_crc[0] = crcIn[16] ^ crcIn[22] ^ crcIn[25] ^ crcIn[26] ^ crcIn[28] ^ data[0] ^ data[6] ^ data[9] ^ data[10] ^ data[12];
//   assign temp_crc[1] = crcIn[16] ^ crcIn[17] ^ crcIn[22] ^ crcIn[23] ^ crcIn[25] ^ crcIn[27] ^ crcIn[28] ^ crcIn[29] ^ data[0] ^ data[1] ^ data[6] ^ data[7] ^ data[9] ^ data[11] ^ data[12] ^ data[13];
//   assign temp_crc[2] = crcIn[16] ^ crcIn[17] ^ crcIn[18] ^ crcIn[22] ^ crcIn[23] ^ crcIn[24] ^ crcIn[25] ^ crcIn[29] ^ crcIn[30] ^ data[0] ^ data[1] ^ data[2] ^ data[6] ^ data[7] ^ data[8] ^ data[9] ^ data[13] ^ data[14];
//   assign temp_crc[3] = crcIn[17] ^ crcIn[18] ^ crcIn[19] ^ crcIn[23] ^ crcIn[24] ^ crcIn[25] ^ crcIn[26] ^ crcIn[30] ^ crcIn[31] ^ data[1] ^ data[2] ^ data[3] ^ data[7] ^ data[8] ^ data[9] ^ data[10] ^ data[14] ^ data[15];
//   assign temp_crc[4] = crcIn[16] ^ crcIn[18] ^ crcIn[19] ^ crcIn[20] ^ crcIn[22] ^ crcIn[24] ^ crcIn[27] ^ crcIn[28] ^ crcIn[31] ^ data[0] ^ data[2] ^ data[3] ^ data[4] ^ data[6] ^ data[8] ^ data[11] ^ data[12] ^ data[15];
//   assign temp_crc[5] = crcIn[16] ^ crcIn[17] ^ crcIn[19] ^ crcIn[20] ^ crcIn[21] ^ crcIn[22] ^ crcIn[23] ^ crcIn[26] ^ crcIn[29] ^ data[0] ^ data[1] ^ data[3] ^ data[4] ^ data[5] ^ data[6] ^ data[7] ^ data[10] ^ data[13];
//   assign temp_crc[6] = crcIn[17] ^ crcIn[18] ^ crcIn[20] ^ crcIn[21] ^ crcIn[22] ^ crcIn[23] ^ crcIn[24] ^ crcIn[27] ^ crcIn[30] ^ data[1] ^ data[2] ^ data[4] ^ data[5] ^ data[6] ^ data[7] ^ data[8] ^ data[11] ^ data[14];
//   assign temp_crc[7] = crcIn[16] ^ crcIn[18] ^ crcIn[19] ^ crcIn[21] ^ crcIn[23] ^ crcIn[24] ^ crcIn[26] ^ crcIn[31] ^ data[0] ^ data[2] ^ data[3] ^ data[5] ^ data[7] ^ data[8] ^ data[10] ^ data[15];
//   assign temp_crc[8] = crcIn[16] ^ crcIn[17] ^ crcIn[19] ^ crcIn[20] ^ crcIn[24] ^ crcIn[26] ^ crcIn[27] ^ crcIn[28] ^ data[0] ^ data[1] ^ data[3] ^ data[4] ^ data[8] ^ data[10] ^ data[11] ^ data[12];
//   assign temp_crc[9] = crcIn[17] ^ crcIn[18] ^ crcIn[20] ^ crcIn[21] ^ crcIn[25] ^ crcIn[27] ^ crcIn[28] ^ crcIn[29] ^ data[1] ^ data[2] ^ data[4] ^ data[5] ^ data[9] ^ data[11] ^ data[12] ^ data[13];
//   assign temp_crc[10] = crcIn[16] ^ crcIn[18] ^ crcIn[19] ^ crcIn[21] ^ crcIn[25] ^ crcIn[29] ^ crcIn[30] ^ data[0] ^ data[2] ^ data[3] ^ data[5] ^ data[9] ^ data[13] ^ data[14];
//   assign temp_crc[11] = crcIn[16] ^ crcIn[17] ^ crcIn[19] ^ crcIn[20] ^ crcIn[25] ^ crcIn[28] ^ crcIn[30] ^ crcIn[31] ^ data[0] ^ data[1] ^ data[3] ^ data[4] ^ data[9] ^ data[12] ^ data[14] ^ data[15];
//   assign temp_crc[12] = crcIn[16] ^ crcIn[17] ^ crcIn[18] ^ crcIn[20] ^ crcIn[21] ^ crcIn[22] ^ crcIn[25] ^ crcIn[28] ^ crcIn[29] ^ crcIn[31] ^ data[0] ^ data[1] ^ data[2] ^ data[4] ^ data[5] ^ data[6] ^ data[9] ^ data[12] ^ data[13] ^ data[15];
//   assign temp_crc[13] = crcIn[17] ^ crcIn[18] ^ crcIn[19] ^ crcIn[21] ^ crcIn[22] ^ crcIn[23] ^ crcIn[26] ^ crcIn[29] ^ crcIn[30] ^ data[1] ^ data[2] ^ data[3] ^ data[5] ^ data[6] ^ data[7] ^ data[10] ^ data[13] ^ data[14];
//   assign temp_crc[14] = crcIn[18] ^ crcIn[19] ^ crcIn[20] ^ crcIn[22] ^ crcIn[23] ^ crcIn[24] ^ crcIn[27] ^ crcIn[30] ^ crcIn[31] ^ data[2] ^ data[3] ^ data[4] ^ data[6] ^ data[7] ^ data[8] ^ data[11] ^ data[14] ^ data[15];
//   assign temp_crc[15] = crcIn[19] ^ crcIn[20] ^ crcIn[21] ^ crcIn[23] ^ crcIn[24] ^ crcIn[25] ^ crcIn[28] ^ crcIn[31] ^ data[3] ^ data[4] ^ data[5] ^ data[7] ^ data[8] ^ data[9] ^ data[12] ^ data[15];
//   assign temp_crc[16] = crcIn[0] ^ crcIn[16] ^ crcIn[20] ^ crcIn[21] ^ crcIn[24] ^ crcIn[28] ^ crcIn[29] ^ data[0] ^ data[4] ^ data[5] ^ data[8] ^ data[12] ^ data[13];
//   assign temp_crc[17] = crcIn[1] ^ crcIn[17] ^ crcIn[21] ^ crcIn[22] ^ crcIn[25] ^ crcIn[29] ^ crcIn[30] ^ data[1] ^ data[5] ^ data[6] ^ data[9] ^ data[13] ^ data[14];
//   assign temp_crc[18] = crcIn[2] ^ crcIn[18] ^ crcIn[22] ^ crcIn[23] ^ crcIn[26] ^ crcIn[30] ^ crcIn[31] ^ data[2] ^ data[6] ^ data[7] ^ data[10] ^ data[14] ^ data[15];
//   assign temp_crc[19] = crcIn[3] ^ crcIn[19] ^ crcIn[23] ^ crcIn[24] ^ crcIn[27] ^ crcIn[31] ^ data[3] ^ data[7] ^ data[8] ^ data[11] ^ data[15];
//   assign temp_crc[20] = crcIn[4] ^ crcIn[20] ^ crcIn[24] ^ crcIn[25] ^ crcIn[28] ^ data[4] ^ data[8] ^ data[9] ^ data[12];
//   assign temp_crc[21] = crcIn[5] ^ crcIn[21] ^ crcIn[25] ^ crcIn[26] ^ crcIn[29] ^ data[5] ^ data[9] ^ data[10] ^ data[13];
//   assign temp_crc[22] = crcIn[6] ^ crcIn[16] ^ crcIn[25] ^ crcIn[27] ^ crcIn[28] ^ crcIn[30] ^ data[0] ^ data[9] ^ data[11] ^ data[12] ^ data[14];
//   assign temp_crc[23] = crcIn[7] ^ crcIn[16] ^ crcIn[17] ^ crcIn[22] ^ crcIn[25] ^ crcIn[29] ^ crcIn[31] ^ data[0] ^ data[1] ^ data[6] ^ data[9] ^ data[13] ^ data[15];
//   assign temp_crc[24] = crcIn[8] ^ crcIn[17] ^ crcIn[18] ^ crcIn[23] ^ crcIn[26] ^ crcIn[30] ^ data[1] ^ data[2] ^ data[7] ^ data[10] ^ data[14];
//   assign temp_crc[25] = crcIn[9] ^ crcIn[18] ^ crcIn[19] ^ crcIn[24] ^ crcIn[27] ^ crcIn[31] ^ data[2] ^ data[3] ^ data[8] ^ data[11] ^ data[15];
//   assign temp_crc[26] = crcIn[10] ^ crcIn[16] ^ crcIn[19] ^ crcIn[20] ^ crcIn[22] ^ crcIn[26] ^ data[0] ^ data[3] ^ data[4] ^ data[6] ^ data[10];
//   assign temp_crc[27] = crcIn[11] ^ crcIn[17] ^ crcIn[20] ^ crcIn[21] ^ crcIn[23] ^ crcIn[27] ^ data[1] ^ data[4] ^ data[5] ^ data[7] ^ data[11];
//   assign temp_crc[28] = crcIn[12] ^ crcIn[18] ^ crcIn[21] ^ crcIn[22] ^ crcIn[24] ^ crcIn[28] ^ data[2] ^ data[5] ^ data[6] ^ data[8] ^ data[12];
//   assign temp_crc[29] = crcIn[13] ^ crcIn[19] ^ crcIn[22] ^ crcIn[23] ^ crcIn[25] ^ crcIn[29] ^ data[3] ^ data[6] ^ data[7] ^ data[9] ^ data[13];
//   assign temp_crc[30] = crcIn[14] ^ crcIn[20] ^ crcIn[23] ^ crcIn[24] ^ crcIn[26] ^ crcIn[30] ^ data[4] ^ data[7] ^ data[8] ^ data[10] ^ data[14];
//   assign temp_crc[31] = crcIn[15] ^ crcIn[21] ^ crcIn[24] ^ crcIn[25] ^ crcIn[27] ^ crcIn[31] ^ data[5] ^ data[8] ^ data[9] ^ data[11] ^ data[15];
// endmodule

// //`endif  // CRC_V_
