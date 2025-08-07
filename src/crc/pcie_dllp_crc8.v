module pcie_dllp_crc8 (
    input  [15:0] crcIn,
    input  [ 7:0] data,
    output [15:0] crcOut
);
  int i;
  logic [15:0] crc;
  always_comb begin
    crc = crcIn ^ data;
    for (i = 0; i < 8; i++) begin
      if (crc[0] & 1) begin
        crc = (crc >> 1) ^ 16'hD008;
      end else begin
        crc = crc >> 1;

      end
    end
  end
  assign crcOut = crc;

endmodule
