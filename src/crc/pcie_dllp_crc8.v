module pcie_dllp_crc8 (
    input  [15:0] crcIn,
    input  [ 7:0] data,
    output [15:0] crcOut
);
  integer i;
  reg [15:0] crc [8:0];
  always @(*) begin
    crc[0] = crcIn ^ data;
    for (i = 0; i < 8; i = i+1) begin
      if (crc[i] & 1) begin
        crc[i+1] = (crc[i] >> 1) ^ 16'hD008;
      end else begin
        crc[i+1] = crc[i] >> 1;

      end
    end
  end
  assign crcOut = crc[8];

endmodule
