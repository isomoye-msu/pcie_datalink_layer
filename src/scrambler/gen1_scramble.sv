module gen1_scramble
  import pcie_phy_pkg::*;
(

    input  logic        clk_i,         //! 100MHz clock signal
    input  logic        rst_i,         //! Reset signal
    input  logic [31:0] data_in_i,
    input  logic        data_valid_i,
    output logic        data_valid_o,
    output logic [31:0] data_out_o,
    input  logic [ 3:0] data_k_in_i,
    input  logic [ 5:0] pipe_width_i,
    output logic [ 3:0] data_k_out_o
    // !Control
);


  localparam int NumPipelines = 4;
  //   logic [ 7:0] scrambled_data;
  // logic [15:0] lfsr_c;
  // logic [15:0] lfsr_r;
  logic [15:0] lfsr_out[5];
  logic [15:0] lfsr_swapped[4];
  logic [15:0] temp_lfsr_in[4];
  logic [15:0] temp_lfsr_out[4];
  // logic [ 3:0] scramble_reset;
  // logic [ 3:0] disable_scrambling;
  // logic [ 3:0] disable_scrambling_r;
  // logic [ 3:0] special_k_disable_scrambling;
  // logic [31:0] data_out_c                   [NumPipelines];
  // logic [31:0] data_out_r                   [NumPipelines];
  // logic [ 7:0] scrambled_data               [           5];

  // logic [ 3:0] data_k_swapped;
  // logic [31:0] data_in_swapped;
  // logic [ 3:0] data_k_c                     [NumPipelines];
  // logic [ 3:0] data_k_r                     [NumPipelines];

  // logic [31:0] byte_cnt_c;
  // logic [31:0] byte_cnt_r;

  // logic [ 3:0] os_complete_c;
  // logic [ 3:0] os_complete_r;

  typedef struct {
    logic [15:0]                        lfsr_in;
    logic [NumPipelines-1:0][4:0][15:0] lfsr_out;
    logic [4:0]                         scramble_reset;
    logic [4:0]                         disable_scrambling;
    logic [4:0]                         stop_scrambling;
    logic [4:0]                         skp_os;
    logic [NumPipelines-1:0][31:0]      data;
    logic [NumPipelines-1:0][4:0]       data_k;
    logic [NumPipelines-1:0]            data_valid;
    // logic [NumPipelines-1:0][4:0][15:0] lfsr_out;
    logic [31:0]                        byte_cnt;
  } gen1_scambler_t;


  gen1_scambler_t D, Q;


  assign lfsr_out[0] = Q.lfsr_in;

  for (genvar i = 0; i < 4; i++) begin : gen_byte_scramble
    int   pipe_idx;
    logic reset_byte_scrambler;
    assign pipe_idx = ((pipe_width_i >> 3) - 1) - i;
    assign reset_byte_scrambler = Q.scramble_reset[pipe_idx] || (
    (Q.scramble_reset >> (pipe_width_i >> 3) ) != '0);

    assign temp_lfsr_in[i] = reset_byte_scrambler ? '1 : lfsr_out[i];
    assign lfsr_out[i+1] = reset_byte_scrambler || Q.skp_os[i]? '1 : temp_lfsr_out[i];
    byte_scramble byte_scramble_inst (
        .disable_scrambling('0),
        .lfsr_q            (temp_lfsr_in[i]),
        .lfsr_out          (temp_lfsr_out[i])
    );
  end


  always_ff @(posedge clk_i) begin : scramble_seq_block
    if (rst_i) begin
      Q <= '{lfsr_in: '1, default: 'd0};
    end else begin
      Q <= D;
    end
  end


  always_comb begin : scramble_comb_block
    // scramble_reset     = '0;
    // disable_scrambling = disable_scrambling_r;
    D                 = Q;
    D.scramble_reset  = '0;
    D.stop_scrambling = '0;
    D.lfsr_in         = lfsr_out[(pipe_width_i>>3)];
    D.skp_os          = '0;
    D.data_valid[0]   = data_valid_i;


    if (data_valid_i) begin

      // if(Q.skp_os != '0) begin
      //   D.lfsr = Q.lfsr;
      // end
      for (int pipeline_idx = 0; pipeline_idx < NumPipelines; pipeline_idx++) begin
        if (pipeline_idx == 0) begin
          D.data[pipeline_idx] = data_in_i;
          D.data_k[pipeline_idx] = data_k_in_i;
          D.data_valid[pipeline_idx] = data_valid_i;
          // D.lfsr_out[pipeline_idx] = lfsr_out;
          for (int lfsr_idx = 0; lfsr_idx < 5; lfsr_idx++) begin
            D.lfsr_out[pipeline_idx][lfsr_idx] = lfsr_out[lfsr_idx];
          end
          // D.lfsr_out[pipeline_idx] = lfsr_out;
        end else begin
          // D.lfsr_out[pipeline_idx] = Q.lfsr_out[pipeline_idx-1];
          D.data_valid[pipeline_idx] = Q.data_valid[pipeline_idx-1];
          D.lfsr_out[pipeline_idx]   = Q.lfsr_out[pipeline_idx-1];
          D.data[pipeline_idx]       = Q.data[pipeline_idx-1];
          D.data_k[pipeline_idx]     = Q.data_k[pipeline_idx-1];
        end
      end

      if (Q.stop_scrambling != '0) begin
        D.disable_scrambling = '0;
      end else if (Q.disable_scrambling != '0) begin
        D.byte_cnt = Q.byte_cnt + (pipe_width_i >> 3);
        D.disable_scrambling = '1;
      end

      //for each byte
      for (int byte_idx = 0; byte_idx < 4; byte_idx++) begin
        int pipe_idx;
        pipe_idx = ((pipe_width_i >> 3) - 1) - byte_idx;
        lfsr_swapped[byte_idx] = '0;

        if (byte_idx < (pipe_width_i >> 3)) begin
          //---------------------------------------------------------------------
          //first stage...


          //handle case where lfsr out is reset needs to be reset at next
          // if ((Q.scramble_reset[byte_idx+1]) && (byte_idx == (pipe_width_i >> 3) - 1)) begin
          //   D.lfsr_in = '1;
          // end
          if (Q.skp_os[byte_idx] != '0) begin
            //skip scrambler advance
            // D.lfsr_out = Q.lfsr_out;
            // D.lfsr_in  = lfsr_out[byte_idx];
            if ((Q.data[0][byte_idx*8+:8] != SKP)) begin
              // D.skp_os   = '0;
              D.byte_cnt = '0;
              for (int idx = 0; idx < 4; idx++) begin
                if (idx >= byte_idx && idx < (pipe_width_i >> 3)) begin
                  D.disable_scrambling[idx] = '0;
                  D.stop_scrambling[idx] = '1;
                end
              end
            end
          end

          if ((Q.byte_cnt + (byte_idx + 1)) > 32'd16) begin
            logic flag;
            flag = '0;

            //check to see if previous special k is flag
            for (int idx = 0; idx < 4; idx++) begin
              if (idx < (pipe_width_i >> 3) && (Q.data_k[1][idx] && Q.data[1][idx*8+:8] == COM)) begin
                flag = '1;
              end
            end
            // D.disable_scrambling[byte_idx] = '0;
            // D.stop_scrambling              = '1;
            //check for end of ordered set
            for (int idx = 0; idx < 4; idx++) begin
              if (idx >= byte_idx && (idx < (pipe_width_i >> 3)) && (flag == '0)) begin
                D.byte_cnt = '0;
                D.disable_scrambling[idx] = '0;
                D.stop_scrambling[idx] = '1;
              end
            end
          end  //special case where we know that the very next byte is unscrambled
          // else if ((Q.byte_cnt + (byte_idx + 1)) > 32'd14) begin
          //   logic flag;
          //   flag = '0;
          //   //check to see if previous special k is flag
          //   for (int idx = 0; idx < 4; idx++) begin
          //     if (((idx <= byte_idx) && idx < (pipe_width_i >> 3)) &&
          //     (Q.data_k[0][idx] && Q.data[0][idx*8+:8] == COM)) begin
          //       flag = '1;
          //     end
          //   end
          //   for (int idx = 0; idx < 4; idx++) begin
          //     if (idx >= byte_idx && (idx < (pipe_width_i >> 3)) && (flag == '0)) begin
          //       D.byte_cnt = '0;
          //       // D.disable_scrambling[idx] = '0;
          //       D.stop_scrambling[idx] = '1;
          //     end
          //   end
          // end

          //---------------------------------------------------------------------
          //second stage
          //check if special symbol
          if (Q.data_k[1][byte_idx]) begin
            //default to scrambling on
            // D.stop_scrambling[idx] = '1;
            // if (Q.disable_scrambling << (4 - byte_idx) == '0) begin
            //   //disable this index and all subsequent
            //   for (int idx = 0; idx < 4; idx++) begin
            //     if (idx >= byte_idx) begin
            //       D.disable_scrambling[idx] = '1;
            //     end
            //   end
            // end
            //check if comma
            if (Q.data[1][byte_idx*8+:8] == COM) begin
              D.scramble_reset[byte_idx+1] = '1;
              D.byte_cnt = (pipe_width_i >> 3) - (byte_idx);
              for (int d_idx = 0; d_idx < 4; d_idx++) begin
                if (d_idx >= byte_idx) begin
                  D.disable_scrambling[d_idx] = '1;
                  // D.stop_scrambling[idx]    = '1;
                end
              end
              // D.scramble_reset[byte_idx] = '1;
              // D.byte_cnt                 = byte_idx;
            end
            if (Q.data[1][byte_idx*8+:8] == SKP) begin
              D.skp_os[byte_idx]             = '1;
              D.disable_scrambling[byte_idx] = '1;
              D.lfsr_in                      = lfsr_out[byte_idx];
            end  //special k that is not pad... disable scrambling for now
          else if (Q.data[1][byte_idx*8+:8] == PAD_) begin
            end
          end


          // if (Q.data_k[2][byte_idx]) begin
          //   if (Q.data[2][byte_idx*8+:8] == SKP) begin
          //     D.skp_os[byte_idx] = '1;
          //     // D.disable_scrambling[byte_idx] = '1;
          //     // D.lfsr_in                      = lfsr_out[byte_idx];
          //   end  //special k that is not pad... disable scrambling for now
          // end

          //third stage
          if (Q.skp_os == '0) begin
            lfsr_swapped[byte_idx] = ({<<{lfsr_out[byte_idx]}});
          end else begin
            lfsr_swapped[byte_idx] = ({<<{Q.lfsr_out[0][byte_idx]}});
          end

          D.data[NumPipelines-1][byte_idx*8+:8] = ((Q.disable_scrambling[byte_idx] == '0 || (
          Q.stop_scrambling[byte_idx]))) && !Q.data_k[NumPipelines-2][byte_idx]? 
      ( Q.data[NumPipelines-2][byte_idx*8+:8] ^ lfsr_swapped[byte_idx]): Q.data[NumPipelines-2][byte_idx*8+:8];
        end
      end
    end
  end

  assign data_out_o   = Q.data[NumPipelines-1];
  assign data_k_out_o = Q.data_k[NumPipelines-1];
  assign data_valid_o = Q.data_valid[NumPipelines-1];

endmodule
