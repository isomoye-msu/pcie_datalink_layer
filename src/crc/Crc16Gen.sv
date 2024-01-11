module Crc16Gen (
    input logic [15:0] Data,
    input logic Complement,
    input logic [15:0] ShiftIn,
    output logic [15:0] ShiftChain,
    output logic [15:0] Crc,
    output logic [15:0] CombCrc
);
  // input Complement;
  // input [15:0] Data, ShiftIn;  // 16 bit  wide input data.
  // output [15:0] Crc, CombCrc, ShiftChain;  // 16 bit wide Crc value.

  // Registered CRC
  assign Crc             = {16{Complement}} ^ {ShiftIn[8],  ShiftIn[9],  ShiftIn[10], ShiftIn[11],
                                             ShiftIn[12], ShiftIn[13], ShiftIn[14], ShiftIn[15],
                                             ShiftIn[0],  ShiftIn[1],  ShiftIn[2],  ShiftIn[3],
                                             ShiftIn[4],  ShiftIn[5],  ShiftIn[6],  ShiftIn[7]};

  // Combinatorial CRC
  assign CombCrc         = {16{Complement}} ^ {ShiftChain[8],  ShiftChain[9],  ShiftChain[10], ShiftChain[11],
                                             ShiftChain[12], ShiftChain[13], ShiftChain[14], ShiftChain[15],
                                             ShiftChain[0],  ShiftChain[1],  ShiftChain[2],  ShiftChain[3],
                                             ShiftChain[4],  ShiftChain[5],  ShiftChain[6],  ShiftChain[7]};

  // LSB first
  logic [15:0] DtXorShift = { Data[8],  Data[9],  Data[10], Data[11], Data[12], Data[13], Data[14], Data[15],
                           Data[0],  Data[1],  Data[2],  Data[3],  Data[4],  Data[5],  Data[6],  Data[7]
                          } ^ ShiftIn;

  assign ShiftChain[00] = ^(DtXorShift & 16'hb111);
  assign ShiftChain[01] = ^(DtXorShift & 16'hd333);
  assign ShiftChain[02] = ^(DtXorShift & 16'ha666);
  assign ShiftChain[03] = ^(DtXorShift & 16'hfddd);
  assign ShiftChain[04] = ^(DtXorShift & 16'hfbba);
  assign ShiftChain[05] = ^(DtXorShift & 16'hf774);
  assign ShiftChain[06] = ^(DtXorShift & 16'heee8);
  assign ShiftChain[07] = ^(DtXorShift & 16'hddd0);
  assign ShiftChain[08] = ^(DtXorShift & 16'hbba0);
  assign ShiftChain[09] = ^(DtXorShift & 16'h7740);
  assign ShiftChain[10] = ^(DtXorShift & 16'hee80);
  assign ShiftChain[11] = ^(DtXorShift & 16'hdd00);
  assign ShiftChain[12] = ^(DtXorShift & 16'h0b11);
  assign ShiftChain[13] = ^(DtXorShift & 16'h1622);
  assign ShiftChain[14] = ^(DtXorShift & 16'h2c44);
  assign ShiftChain[15] = ^(DtXorShift & 16'h5888);

endmodule
