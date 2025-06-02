module pcie_dllp_crc8 (
    input  [15:0] crcIn,
    input  [ 7:0] data,
    output [15:0] crcOut
);
  assign crcOut[0] = crcIn[8] ^ crcIn[12] ^ crcIn[13] ^ crcIn[14] ^ data[0] ^ data[4] ^ data[5] ^ data[6];
  assign crcOut[1] = crcIn[8] ^ crcIn[9] ^ crcIn[12] ^ crcIn[15] ^ data[0] ^ data[1] ^ data[4] ^ data[7];
  assign crcOut[2] = crcIn[8] ^ crcIn[9] ^ crcIn[10] ^ crcIn[12] ^ crcIn[14] ^ data[0] ^ data[1] ^ data[2] ^ data[4] ^ data[6];
  assign crcOut[3] = crcIn[9] ^ crcIn[10] ^ crcIn[11] ^ crcIn[13] ^ crcIn[15] ^ data[1] ^ data[2] ^ data[3] ^ data[5] ^ data[7];
  assign crcOut[4] = crcIn[8] ^ crcIn[10] ^ crcIn[11] ^ crcIn[13] ^ data[0] ^ data[2] ^ data[3] ^ data[5];
  assign crcOut[5] = crcIn[8] ^ crcIn[9] ^ crcIn[11] ^ crcIn[13] ^ data[0] ^ data[1] ^ data[3] ^ data[5];
  assign crcOut[6] = crcIn[9] ^ crcIn[10] ^ crcIn[12] ^ crcIn[14] ^ data[1] ^ data[2] ^ data[4] ^ data[6];
  assign crcOut[7] = crcIn[8] ^ crcIn[10] ^ crcIn[11] ^ crcIn[12] ^ crcIn[14] ^ crcIn[15] ^ data[0] ^ data[2] ^ data[3] ^ data[4] ^ data[6] ^ data[7];
  assign crcOut[8] = crcIn[0] ^ crcIn[8] ^ crcIn[9] ^ crcIn[11] ^ crcIn[14] ^ crcIn[15] ^ data[0] ^ data[1] ^ data[3] ^ data[6] ^ data[7];
  assign crcOut[9] = crcIn[1] ^ crcIn[9] ^ crcIn[10] ^ crcIn[12] ^ crcIn[15] ^ data[1] ^ data[2] ^ data[4] ^ data[7];
  assign crcOut[10] = crcIn[2] ^ crcIn[8] ^ crcIn[10] ^ crcIn[11] ^ crcIn[12] ^ crcIn[14] ^ data[0] ^ data[2] ^ data[3] ^ data[4] ^ data[6];
  assign crcOut[11] = crcIn[3] ^ crcIn[8] ^ crcIn[9] ^ crcIn[11] ^ crcIn[14] ^ crcIn[15] ^ data[0] ^ data[1] ^ data[3] ^ data[6] ^ data[7];
  assign crcOut[12] = crcIn[4] ^ crcIn[8] ^ crcIn[9] ^ crcIn[10] ^ crcIn[13] ^ crcIn[14] ^ crcIn[15] ^ data[0] ^ data[1] ^ data[2] ^ data[5] ^ data[6] ^ data[7];
  assign crcOut[13] = crcIn[5] ^ crcIn[9] ^ crcIn[10] ^ crcIn[11] ^ crcIn[14] ^ crcIn[15] ^ data[1] ^ data[2] ^ data[3] ^ data[6] ^ data[7];
  assign crcOut[14] = crcIn[6] ^ crcIn[10] ^ crcIn[11] ^ crcIn[12] ^ crcIn[15] ^ data[2] ^ data[3] ^ data[4] ^ data[7];
  assign crcOut[15] = crcIn[7] ^ crcIn[11] ^ crcIn[12] ^ crcIn[13] ^ data[3] ^ data[4] ^ data[5];
endmodule
