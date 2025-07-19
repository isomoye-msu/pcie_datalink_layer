module synchronous_lifo #(
    parameter int FWFT_MODE = "TRUE",  // "TRUE"  - first word fall-trrough" mode
    // "FALSE" - normal fifo mode

    parameter int DEPTH = 8,  // max elements count == DEPTH, DEPTH MUST be power of 2

    parameter int DATA_W = 32,  // data field width
    localparam DEPTH_W = $clog2(DEPTH + 1)
) (
    input logic clk,
    input logic nrst,

    // input port
    input w_req,
    input [DATA_W-1:0] w_data,

    // output port
    input r_req,
    output logic [DATA_W-1:0] r_data,

    // helper ports
    output logic [DEPTH_W-1:0] cnt,
    output logic empty,
    output logic full


);

  typedef enum logic [3:0] {
    ST_IDLE,
    ST_READOUT
  } lifo_st_e;

  // cnt[] vector always holds lifo elements count
  // data[cnt[]] points to the first empty lifo slot
  // when lifo is full data[cnt[]] points "outside" of data[]

  // filtered requests
  logic w_req_f;
  assign w_req_f = w_req && ~full;

  logic r_req_f;
  assign r_req_f = r_req && ~empty;

  logic [31:0] LFSRregister;



  typedef struct {



    // lifo data
    logic [DEPTH-1:0][DATA_W-1:0] data = '0;

    // data output buffer for normal fifo mode
    logic [DATA_W-1:0] data_buf = '0;

    lifo_st_e state;

    logic [DEPTH_W-1:0] cnt;


    logic empty;
    logic [DATA_W-1:0] r_data;

  } lifo_t;

  lifo_t D, Q;


  integer i;
  always_ff @(posedge clk) begin
    if (!nrst) begin
      Q <= '{state: ST_IDLE, empty: '1, default: 'd0};
    end else begin
      Q <= D;
    end
  end

  assign r_data = Q.empty ? {1'b1,LFSRregister} : Q.r_data;
  assign cnt    = Q.cnt;
  assign empty  = Q.empty;

  always_comb begin
    D = Q;
    case (Q.state)
      ST_IDLE: begin
        if (w_req) begin
          D.empty              = '0;
          D.r_data[DATA_W-1:0] = '0;
          D.data[cnt]          = w_data[DATA_W-1:0];
          D.cnt                = Q.cnt + 1'b1;
        end
        if (r_req && Q.cnt > 0) begin
          D.state = ST_READOUT;
        end
      end
      ST_READOUT: begin
        D.cnt                = Q.cnt - 1'b1;
        D.r_data[DATA_W-1:0] = Q.data[0];
        for (i = (DEPTH - 1); i > 0; i--) begin
          D.data[i-1] = Q.data[i];
        end
        if (Q.cnt == '0) begin
          D.empty = '1;
          D.cnt   = '0;
          D.state = ST_IDLE;
        end
      end
      default: begin
      end
    endcase
  end


  lfsr # (
    .seed('1)
  )
  lfsr_inst (
    .LFSRregister(LFSRregister),
    .clk(clk)
  );



endmodule



// //------------------------------------------------------------------------------
// // lifo.sv
// // Konstantin Pavlov, pavlovconst@gmail.com
// //------------------------------------------------------------------------------

// // INFO ------------------------------------------------------------------------
// //  Single-clock LIFO buffer implementation, also known as "stack"
// //
// //  Features:
// //  - single clock operation
// //  - configurable depth and data width
// //  - one write- and one read- port in "FWFT" or "normal" mode
// //  - protected against overflow and underflow
// //  - simultaneous read and write operations supported if not full and not empty
// //  - only read operation is performed when (full && r_req && w_req)
// //  - only write operation is performed when (empty && r_req && w_req)
// //
// //  See also "fifo_Single_clock_reg_*.sv" modules for similar FIFO buffer implementation


// /* --- INSTANTIATION TEMPLATE BEGIN ---

// lifo #(
//   .FWFT_MODE( "TRUE" ),
//   .DEPTH( 8 ),
//   .DATA_W( 32 )
// ) LF1 (
//   .clk( clk ),
//   .nrst( 1'b1 ),

//   .w_req(  ),
//   .w_data(  ),

//   .r_req(  ),
//   .r_data(  ),

//   .cnt(  ),
//   .empty(  ),
//   .full(  )
// );

// --- INSTANTIATION TEMPLATE END ---*/

// module synchronous_lifo #(
//     parameter int FWFT_MODE = "TRUE",  // "TRUE"  - first word fall-trrough" mode
//                                    // "FALSE" - normal fifo mode

//    parameter int DEPTH = 8,  // max elements count == DEPTH, DEPTH MUST be power of 2

//    parameter int DATA_W = 32  // data field width
// ) (

//     input clk,
//     input nrst, // inverted reset

//     // input port
//     input w_req,
//     input [DATA_W-1:0] w_data,

//     // output port
//     input r_req,
//     output logic [DATA_W-1:0] r_data,

//     // helper ports
//     output logic [DEPTH_W-1:0] cnt = '0,
//     output logic empty,
//     output logic full,

//     output logic fail
// );

//   // elements counter width, extra bit to store
//   // "fifo full" state, see cnt[] variable comments
//   localparam DEPTH_W = $clog2(DEPTH + 1);


//   // lifo data
//   logic [DEPTH-1:0][DATA_W-1:0] data = '0;

//   // data output buffer for normal fifo mode
//   logic [DATA_W-1:0] data_buf = '0;

//   // cnt[] vector always holds lifo elements count
//   // data[cnt[]] points to the first empty lifo slot
//   // when lifo is full data[cnt[]] points "outside" of data[]

//   // filtered requests
//   logic w_req_f;
//   assign w_req_f = w_req && ~full;

//   logic r_req_f;
//   assign r_req_f = r_req && ~empty;


//   integer i;
//   always_ff @(posedge clk) begin
//     if (~nrst) begin
//       data <= '0;
//       cnt <= '0;
//       data_buf[DATA_W-1:0] <= '0;
//     end else begin
//       unique case ({
//         w_req_f, r_req_f
//       })
//         2'b00: ;  // nothing

//         2'b01: begin  // reading out
//           for (i = (DEPTH - 1); i > 0; i--) begin
//             data[i-1] <= data[i];
//           end
//           cnt <= cnt - 1'b1;
//         end

//         2'b10: begin  // writing in
//           data[cnt] <= w_data[DATA_W-1:0];
//           cnt <= cnt + 1'b1;
//         end

//         2'b11: begin  // simultaneously reading and writing
//           data[cnt-1] <= w_data[DATA_W-1:0];
//           // data counter does not change here
//         end
//       endcase

//       // data buffer works only for normal lifo mode
//       if (r_req_f) begin
//         data_buf[DATA_W-1:0] <= data[0];
//       end
//     end
//   end


//   always_comb begin
//     empty = (cnt == '0);
//     full  = (cnt == DEPTH);

//     if (FWFT_MODE == "TRUE") begin
//       if (~empty) begin
//         r_data[DATA_W-1:0] = data[0];  // first-word fall-through mode
//       end else begin
//         r_data[DATA_W-1:0] = '0;
//       end
//     end else begin
//       r_data[DATA_W-1:0] = data_buf[DATA_W-1:0];  // normal mode
//     end

//     fail = (empty && r_req) || (full && w_req);
//   end

// endmodule
