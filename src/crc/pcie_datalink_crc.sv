// vim: ts=4 sw=4 expandtab

// THIS IS GENERATED VERILOG CODE.
// https://bues.ch/h/crcgen
// 
// This code is Public Domain.
// Permission to use, copy, modify, and/or distribute this software for any
// purpose with or without fee is hereby granted.
// 
// THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
// WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
// MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
// SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER
// RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT,
// NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE
// USE OR PERFORMANCE OF THIS SOFTWARE.

`ifndef CRC_V_
`define CRC_V_

// CRC polynomial coefficients: x^16 + x^12 + x^11 + x^10 + x^8 + x^7 + x^5 + x^4 + x^2 + x + 1
//                              0x1DB7 (hex)
// CRC width:                   16 bits
// CRC shift direction:         left (big endian)
// Input word width:            32 bits
module pcie_datalink_crc (
    input  [15:0] crcIn,
    input  [31:0] data,
    output [15:0] crcOut
);

  logic [15:0] crc0;
  logic [15:0] crc1;
  logic [15:0] crc2;
  logic [15:0] crc3;
  reg [15:0] crc4;

  pcie_dllp_crc8 crc_inst_0 (
      .crcIn (crcIn),
      .data  (data[7:0]),
      .crcOut(crc0)
  );

  pcie_dllp_crc8 crc_inst_1 (
      .crcIn (crc0),
      .data  (data[15:8]),
      .crcOut(crc1)
  );

  pcie_dllp_crc8 crc_inst_2 (
      .crcIn (crc1),
      .data  (data[23:16]),
      .crcOut(crc2)
  );

  pcie_dllp_crc8 crc_inst_3 (
      .crcIn (crc2),
      .data  (data[31:24]),
      .crcOut(crc3)
  );



//   always @(*) begin
//     for (int i = 0; i < 8; i++) begin
//       crc4[i]   = crc3[7-i];
//       crc4[i+8] = crc3[15-i];
//     end
//   end

  assign crcOut = crc3;

endmodule

`endif  // CRC_V_
