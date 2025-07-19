`timescale 1ns / 1ps

/*
** Clock Domain Crossing Register (One Byte FIFO)
**
** Reset input width must be long enough to be detected by the slowest clock.
*/

module synchronous_fifo #(
    parameter int DEPTH = 3,
    parameter int DATA_WIDTH = 8
) (

    input reset,  // asynchronous active-high reset

    input clk_in,  // write clock
    input we,  // active-high write enable
    input [DATA_WIDTH-1:0] din,  // 8-bit data-in
    output busy,  // active-high buffer full

    input clk_out,  // read clock
    input re,  // active-high read enable
    output [DATA_WIDTH-1:0] dout,  // 8-bit data-out
    output ready  // active-high data ready flag
);

  // - - -
  // data register

  // 8-bit register
  reg [7:0] data = 8'd0;
  always @(posedge clk_in) begin
    if (reset) data <= 8'd0;
    else if (we) data <= din;
  end
  assign dout = data;

  // - - - 
  // cross clock domain ready/busy handshaking

  reg rdy = 1'b0;
  reg bsy = 1'b0;
  reg [DEPTH-1:0] rdy_q = 3'd0;
  reg [DEPTH-1:0] bsy_q = 3'd0;

  always @(posedge clk_in) rdy_q <= {rdy_q[1:0], rdy};
  wire read_event = rdy_q[2:1] == 2'b10;

  always @(posedge clk_in) begin
    if (reset || read_event) bsy <= 1'b0;
    else if (we) bsy <= 1'b1;
  end

  always @(posedge clk_out) bsy_q <= {bsy_q[1:0], bsy};
  wire write_event = bsy_q[2:1] == 2'b01;

  always @(posedge clk_out) begin
    if (reset || re) rdy <= 1'b0;
    else if (write_event) rdy <= 1'b1;
  end

  assign ready = rdy;
  assign busy  = bsy;

endmodule
