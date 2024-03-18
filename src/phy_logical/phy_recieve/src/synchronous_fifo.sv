module synchronous_fifo #(
    parameter int DEPTH = 8,
    parameter int DATA_WIDTH = 8
) (
    input  logic                  clk_i,
    input  logic                  rst_i,
    input  logic                  w_en_i,
    input  logic                  r_en_i,
    input  logic [DATA_WIDTH-1:0] data_in,
    output logic [DATA_WIDTH-1:0] data_out,
    output logic                  full_o,
    output logic                  empty_o
);

  logic [$clog2(DEPTH)-1:0] w_ptr;
  logic [$clog2(DEPTH)-1:0] r_ptr;
  logic [DATA_WIDTH-1:0] fifo[DEPTH];

  // Set Default values on reset.
  always @(posedge clk_i) begin
    if (rst_i) begin
      w_ptr <= 0;
      r_ptr <= 0;
      data_out <= 0;
    end
  end

  // To write data to FIFO
  always @(posedge clk_i) begin
    if (w_en_i & !full_o) begin
      fifo[w_ptr] <= data_in;
      w_ptr <= w_ptr + 1;
    end
  end

  // To read data from FIFO
  always @(posedge clk_i) begin
    if (r_en_i & !empty_o) begin
      data_out <= fifo[r_ptr];
      r_ptr <= r_ptr + 1;
    end
  end

  assign full_o  = ((w_ptr + 1'b1) == r_ptr);
  assign empty_o = (w_ptr == r_ptr);
endmodule
