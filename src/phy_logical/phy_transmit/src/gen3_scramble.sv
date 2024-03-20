module gen3_scramble
  import pcie_phy_pkg::*;
(

    input  logic        clk_i,                       //! 100MHz clock signal
    input  logic        rst_i,                       //! Reset signal
    input  logic [ 7:0] lane_number,
    input  logic [ 1:0] sync_header_i,
    input  logic [31:0] data_in_i,
    input  logic        data_valid_i,
    output logic        data_valid_o,
    output logic [31:0] data_out_o,
    input  logic        ltssm_polling_compliance_i,
    input  logic [ 3:0] data_k_in_i,
    input  logic [ 5:0] pipe_width_i,
    output logic [ 3:0] data_k_out_o
    // !Control
);

  //   logic [ 7:0] scrambled_data;
  logic [23:0] lfsr_c;
  logic [23:0] lfsr_r;
  logic [23:0] lfsr_out             [5];
  logic [ 3:0] scramble_reset;
  logic [ 3:0] disable_lfsr_advance;
  logic [31:0] data_out_o_c;
  logic [31:0] data_out_o_r;
  logic [ 7:0] scrambled_data       [5];

  logic [ 3:0] data_k_swapped;
  logic [31:0] data_in_swapped;
  logic [ 7:0] byte_idx;
  logic [ 3:0] data_k_c;
  logic [ 3:0] data_k_r;
  logic        is_os_c;
  logic        is_os_r;
  logic        ts1_ts2_c;
  logic        ts1_ts2_r;
  logic [ 3:0] is_eieos_c;
  logic [ 3:0] is_eieos_r;
  logic [ 3:0] is_skp_c;
  logic [ 3:0] is_skp_r;
  logic [ 3:0] ts_detected;
  logic [ 3:0] eieos_detected;
  logic [ 3:0] skip_detected;

  assign lfsr_out[0] = lfsr_r;
  //   assign scrambled_data[0] = data_in_swapped[7:0];

  for (genvar i = 0; i < 4; i++) begin : gen_byte_scramble
    gen3_byte_scramble byte_scramble_inst (
        .disable_lfsr_advance(disable_lfsr_advance[0]),
        .lfsr_r(lfsr_out[i]),
        .lfsr_out(lfsr_out[i+1])
    );
  end


  always_ff @(posedge clk_i) begin : scramble_seq_block
    if (rst_i) begin
      lfsr_r       <= gen3_seed_values[lane_number[2:0]];
      data_valid_o <= '0;
      is_os_r      <= '0;
      ts1_ts2_r    <= '0;
      is_eieos_r   <= '0;
      is_skp_r     <= '0;
    end else begin
      lfsr_r       <= lfsr_c;
      data_valid_o <= data_valid_i;
      is_os_r      <= is_os_c;
      ts1_ts2_r    <= ts1_ts2_c;
      is_eieos_r   <= is_eieos_c;
      is_skp_r     <= is_skp_c;
    end
    data_k_r     <= data_k_c;
    data_out_o_r <= data_out_o_c;
  end

  always_comb begin : sync_header_decode
    is_os_c = is_os_r;
    ts1_ts2_c = ts1_ts2_r;
    is_eieos_c = is_eieos_r;
    if (data_valid_i) begin
      ts1_ts2_c  = ts_detected != '0;
      is_eieos_c = eieos_detected != '0;
      is_skp_c   = skip_detected != '0;
      case (sync_header_i)
        2'b10: begin
          is_os_c = '1;
        end
        2'b01: begin
          is_os_c    = '0;
          ts1_ts2_c  = '0;
          is_eieos_c = '0;
          is_skp_c   = '0;
        end
        default: begin

        end
      endcase
    end
  end


  // The two bits of the Sync Header are not scrambled and do not advance the LFSR.
  // 
  // All 16 Symbols of an Electrical Idle Exit Ordered Set (EIEOS) bypass scrambling. The
  // scrambling LFSR is initialized after the last Symbol of an EIEOS is transmitted, and the
  // descrambling LFSR is initialized after the last Symbol of an EIEOS is received.
  // 
  // TS1 and TS2 Ordered Sets:
  // 
  // Symbol 0 of a TS1 or TS2 Ordered Set bypasses scrambling.
  // Symbols 1-13 are scrambled.
  // Symbols 14 and 15 bypass scrambling if required for DC Balance, but they are scrambled if
  // not required for DC Balance.
  //  All 16 Symbols of a Fast Training Sequence (FTS) Ordered Set bypass scrambling.
  // 213PCI EXPRESS BASE SPECIFICATION, REV. 3.0
  //  All 16 Symbols of a Start of Data Stream (SDS) Ordered Set bypass scrambling.
  //  All 16 Symbols of an Electrical Idle Ordered Set (EIOS) bypass scrambling.
  //  All Symbols of a SKP Ordered Set bypass scrambling.
  // 5
  //  Transmitters advance their LFSR for all Symbols of all Ordered Sets except for the SKP
  // Ordered Set. The LFSR is not advanced for any Symbols of a SKP Ordered Set.
  //  Receivers evaluate Symbol 0 of Ordered Set Blocks to determine whether to advance their
  // LFSR. If Symbol 0 of the Block is SKP (see Section 4.2.7.2), then the LFSR is not advanced for
  // any Symbol of the Block. Otherwise, the LFSR is advanced for all Symbols of the Block.
  //  All 16 Symbols of a Data Block are scrambled and advance the scrambler.
  // 10
  //  For Symbols that need to be scrambled, the least significant bit is scrambled first and the most
  // significant bit is scrambled last.
  always_comb begin : scramble_comb_block
    scramble_reset       = '0;
    disable_lfsr_advance = '0;
    data_out_o_c         = data_out_o_r;
    lfsr_c               = lfsr_r;
    if (scramble_reset != '0) begin
      lfsr_c = gen3_seed_values[lane_number[2:0]];
    end else if (data_valid_i) begin
      //select which lfsr advance to use based on pipewidth
      lfsr_c = lfsr_out[(pipe_width_i>>3)];
    end
    for (int i = 0; i < 4; i++) begin
      byte_idx          = ((pipe_width_i >> 3) - 1) - i;
      scrambled_data[i] = '0;
      ts_detected[i]    = '0;
      eieos_detected[i] = '0;
      skip_detected[i]  = '0;
      //check if special symbol
      if (is_os_c) begin
        //check if EIEOS
        if (data_in_i[i*8+:8] == EIEOS) begin
          //reset lfsr
          scramble_reset[i] = '1;
          eieos_detected[i] = '1;
          scrambled_data[i] = data_in_i[byte_idx*8+:8];
        end else if (data_in_i[byte_idx*8+:8] inside {TS1OS, TS2OS}) begin
          ts_detected[i] = '1;
          //   disable_lfsr_advance[i] = '1;
          scrambled_data[i] = data_in_i[byte_idx*8+:8];
        end else if (data_in_i[byte_idx*8+:8] == GEN3_SKP || is_skp_c) begin
          disable_lfsr_advance[i] = '1;
          scrambled_data[i] = data_in_i[byte_idx*8+:8];
          skip_detected[i] = '1;
        end else begin
          //scramble data
          scrambled_data[i] = (data_in_i[byte_idx*8+:8] ^ (data_t'({<<{lfsr_out[byte_idx]}})));
        end
      end else begin
        //scramble data
        scrambled_data[i] = (data_in_i[byte_idx*8+:8] ^ (data_t'({<<{lfsr_out[byte_idx]}})));
      end
      //update out
      data_out_o_c[i*8+:8] = scrambled_data[i];
    end
  end
  assign data_out_o = data_out_o_r;
endmodule
