module pcie_crc8 (
    input  [31:0] crcIn,
    input  [ 7:0] data,
    output [31:0] crcOut
);
assign crcOut[0] = crcIn[24] ^ crcIn[30] ^ data[0] ^ data[6];
    assign crcOut[1] = crcIn[24] ^ crcIn[25] ^ crcIn[30] ^ crcIn[31] ^ data[0] ^ data[1] ^ data[6] ^ data[7];
    assign crcOut[2] = crcIn[24] ^ crcIn[25] ^ crcIn[26] ^ crcIn[30] ^ crcIn[31] ^ data[0] ^ data[1] ^ data[2] ^ data[6] ^ data[7];
    assign crcOut[3] = crcIn[25] ^ crcIn[26] ^ crcIn[27] ^ crcIn[31] ^ data[1] ^ data[2] ^ data[3] ^ data[7];
    assign crcOut[4] = crcIn[24] ^ crcIn[26] ^ crcIn[27] ^ crcIn[28] ^ crcIn[30] ^ data[0] ^ data[2] ^ data[3] ^ data[4] ^ data[6];
    assign crcOut[5] = crcIn[24] ^ crcIn[25] ^ crcIn[27] ^ crcIn[28] ^ crcIn[29] ^ crcIn[30] ^ crcIn[31] ^ data[0] ^ data[1] ^ data[3] ^ data[4] ^ data[5] ^ data[6] ^ data[7];
    assign crcOut[6] = crcIn[25] ^ crcIn[26] ^ crcIn[28] ^ crcIn[29] ^ crcIn[30] ^ crcIn[31] ^ data[1] ^ data[2] ^ data[4] ^ data[5] ^ data[6] ^ data[7];
    assign crcOut[7] = crcIn[24] ^ crcIn[26] ^ crcIn[27] ^ crcIn[29] ^ crcIn[31] ^ data[0] ^ data[2] ^ data[3] ^ data[5] ^ data[7];
    assign crcOut[8] = crcIn[0] ^ crcIn[24] ^ crcIn[25] ^ crcIn[27] ^ crcIn[28] ^ data[0] ^ data[1] ^ data[3] ^ data[4];
    assign crcOut[9] = crcIn[1] ^ crcIn[25] ^ crcIn[26] ^ crcIn[28] ^ crcIn[29] ^ data[1] ^ data[2] ^ data[4] ^ data[5];
    assign crcOut[10] = crcIn[2] ^ crcIn[24] ^ crcIn[26] ^ crcIn[27] ^ crcIn[29] ^ data[0] ^ data[2] ^ data[3] ^ data[5];
    assign crcOut[11] = crcIn[3] ^ crcIn[24] ^ crcIn[25] ^ crcIn[27] ^ crcIn[28] ^ data[0] ^ data[1] ^ data[3] ^ data[4];
    assign crcOut[12] = crcIn[4] ^ crcIn[24] ^ crcIn[25] ^ crcIn[26] ^ crcIn[28] ^ crcIn[29] ^ crcIn[30] ^ data[0] ^ data[1] ^ data[2] ^ data[4] ^ data[5] ^ data[6];
    assign crcOut[13] = crcIn[5] ^ crcIn[25] ^ crcIn[26] ^ crcIn[27] ^ crcIn[29] ^ crcIn[30] ^ crcIn[31] ^ data[1] ^ data[2] ^ data[3] ^ data[5] ^ data[6] ^ data[7];
    assign crcOut[14] = crcIn[6] ^ crcIn[26] ^ crcIn[27] ^ crcIn[28] ^ crcIn[30] ^ crcIn[31] ^ data[2] ^ data[3] ^ data[4] ^ data[6] ^ data[7];
    assign crcOut[15] = crcIn[7] ^ crcIn[27] ^ crcIn[28] ^ crcIn[29] ^ crcIn[31] ^ data[3] ^ data[4] ^ data[5] ^ data[7];
    assign crcOut[16] = crcIn[8] ^ crcIn[24] ^ crcIn[28] ^ crcIn[29] ^ data[0] ^ data[4] ^ data[5];
    assign crcOut[17] = crcIn[9] ^ crcIn[25] ^ crcIn[29] ^ crcIn[30] ^ data[1] ^ data[5] ^ data[6];
    assign crcOut[18] = crcIn[10] ^ crcIn[26] ^ crcIn[30] ^ crcIn[31] ^ data[2] ^ data[6] ^ data[7];
    assign crcOut[19] = crcIn[11] ^ crcIn[27] ^ crcIn[31] ^ data[3] ^ data[7];
    assign crcOut[20] = crcIn[12] ^ crcIn[28] ^ data[4];
    assign crcOut[21] = crcIn[13] ^ crcIn[29] ^ data[5];
    assign crcOut[22] = crcIn[14] ^ crcIn[24] ^ data[0];
    assign crcOut[23] = crcIn[15] ^ crcIn[24] ^ crcIn[25] ^ crcIn[30] ^ data[0] ^ data[1] ^ data[6];
    assign crcOut[24] = crcIn[16] ^ crcIn[25] ^ crcIn[26] ^ crcIn[31] ^ data[1] ^ data[2] ^ data[7];
    assign crcOut[25] = crcIn[17] ^ crcIn[26] ^ crcIn[27] ^ data[2] ^ data[3];
    assign crcOut[26] = crcIn[18] ^ crcIn[24] ^ crcIn[27] ^ crcIn[28] ^ crcIn[30] ^ data[0] ^ data[3] ^ data[4] ^ data[6];
    assign crcOut[27] = crcIn[19] ^ crcIn[25] ^ crcIn[28] ^ crcIn[29] ^ crcIn[31] ^ data[1] ^ data[4] ^ data[5] ^ data[7];
    assign crcOut[28] = crcIn[20] ^ crcIn[26] ^ crcIn[29] ^ crcIn[30] ^ data[2] ^ data[5] ^ data[6];
    assign crcOut[29] = crcIn[21] ^ crcIn[27] ^ crcIn[30] ^ crcIn[31] ^ data[3] ^ data[6] ^ data[7];
    assign crcOut[30] = crcIn[22] ^ crcIn[28] ^ crcIn[31] ^ data[4] ^ data[7];
    assign crcOut[31] = crcIn[23] ^ crcIn[29] ^ data[5];
endmodule
