module bram_sp #(
       //=============
       // Parameters
       //=============
       parameter int RAM_DATA_WIDTH = 32,
       parameter int RAM_ADDR_WIDTH = 4
   ) (
       //========
       // Ports
       //========
       input  wire                      clk,
       input  wire                      rst,
       input  wire                      wr,
       input  wire [RAM_ADDR_WIDTH-1:0] addr,
       input  wire [RAM_DATA_WIDTH-1:0] data_in,
       output reg  [RAM_DATA_WIDTH-1:0] data_out
   );

   //=========
   // Memory
   //=========
   reg [RAM_DATA_WIDTH-1:0] mem [(2**RAM_ADDR_WIDTH)];

   //===================
   // Read/Write Logic
   //===================
   always @(posedge clk) begin
      if (`ifdef ACTIVE_LOW_RST !rst `else rst `endif) begin
         data_out <= {RAM_DATA_WIDTH{1'b0}};
      end
      else begin
         data_out <= mem[addr];
         if (wr) begin
            mem[addr] <= data_in;
         end
      end
   end
endmodule
