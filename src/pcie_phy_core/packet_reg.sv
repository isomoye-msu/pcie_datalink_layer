module packet_reg #(
    parameter int FWFT_MODE = "TRUE",  // "TRUE"  - first word fall-trrough" mode
    // "FALSE" - normal fifo mode

    parameter int DEPTH = 8,  // max elements count == DEPTH, DEPTH MUST be power of 2

    parameter int DATA_W = 32  // data field width
) (
    input logic clk_i,
    input logic rst_i,

    // input port
    input w_req,
    input [DATA_W-1:0] w_data,

    // output port
    input r_req,
    output logic [DATA_W-1:0] r_data,

    // helper ports
    output logic [DEPTH_W-1:0] cnt = '0,
    output logic empty,
    output logic full


);

  // elements counter width, extra bit to store
  // "fifo full" state, see cnt[] variable comments
  localparam DEPTH_W = $clog2(DEPTH + 1);


  // lifo data
  logic [DEPTH-1:0][DATA_W-1:0] data = '0;

  // data output buffer for normal fifo mode
  logic [DATA_W-1:0] data_buf = '0;

  // cnt[] vector always holds lifo elements count
  // data[cnt[]] points to the first empty lifo slot
  // when lifo is full data[cnt[]] points "outside" of data[]

  // filtered requests
  logic w_req_f;
  assign w_req_f = w_req && ~full;

  logic r_req_f;
  assign r_req_f = r_req && ~empty;

  typedef enum logic [3:0] {
    ST_IDLE,
    ST_READOUT
  } lifo_st_e;


  lifo_st_e state;


  always_ff @(posedge clk_i) begin
    if (rst_i) begin
      data <= '0;
      cnt[DEPTH_W-1:0] <= '0;
      data_buf[DATA_W-1:0] <= '0;
      empty <= '1;
      state <= ST_IDLE;
    end
    case (state)
      ST_IDLE: begin
        if (w_req) begin
          empty <= '0;
          data[cnt[DEPTH_W-1:0]] <= w_data[DATA_W-1:0];
          cnt[DEPTH_W-1:0] <= cnt[DEPTH_W-1:0] + 1'b1;
        end
        if (r_req) begin
          state <= ST_READOUT;
        end
      end
      ST_READOUT: begin
        for (i = (DEPTH - 1); i > 0; i--) begin
          data[i-1] <= data[i];
        end
        cnt[DEPTH_W-1:0]   <= cnt[DEPTH_W-1:0] - 1'b1;
        r_data[DATA_W-1:0] <= data[0];
        if (cnt <= 32'b0) begin
          empty <= '1;
          state <= ST_IDLE;
        end
      end
      default: begin

      end
    endcase

  end



endmodule
