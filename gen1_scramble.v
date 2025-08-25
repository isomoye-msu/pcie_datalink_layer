module gen1_scramble (
	clk_i,
	rst_i,
	data_in_i,
	data_valid_i,
	data_valid_o,
	data_out_o,
	data_k_in_i,
	pipe_width_i,
	data_k_out_o
);
	reg _sv2v_0;
	input wire clk_i;
	input wire rst_i;
	input wire [31:0] data_in_i;
	input wire data_valid_i;
	output wire data_valid_o;
	output wire [31:0] data_out_o;
	input wire [3:0] data_k_in_i;
	input wire [5:0] pipe_width_i;
	output wire [3:0] data_k_out_o;
	localparam signed [31:0] NumPipelines = 4;
	wire [15:0] lfsr_out [0:4];
	reg [15:0] lfsr_swapped [0:3];
	wire [15:0] temp_lfsr_in [0:3];
	wire [15:0] temp_lfsr_out [0:3];
	reg [531:0] D;
	reg [531:0] Q;
	assign lfsr_out[0] = Q[531-:16];
	genvar _gv_i_1;
	generate
		for (_gv_i_1 = 0; _gv_i_1 < 4; _gv_i_1 = _gv_i_1 + 1) begin : gen_byte_scramble
			localparam i = _gv_i_1;
			wire signed [31:0] pipe_idx;
			wire reset_byte_scrambler;
			assign pipe_idx = ((pipe_width_i >> 3) - 1) - i;
			assign reset_byte_scrambler = Q[192 + pipe_idx] || ((Q[195-:4] >> (pipe_width_i >> 3)) != {4 {1'sb0}});
			assign temp_lfsr_in[i] = (reset_byte_scrambler ? {16 {1'sb1}} : lfsr_out[i]);
			assign lfsr_out[i + 1] = (reset_byte_scrambler ? {16 {1'sb1}} : temp_lfsr_out[i]);
			byte_scramble byte_scramble_inst(
				.disable_scrambling(1'sb0),
				.lfsr_q(temp_lfsr_in[i]),
				.lfsr_out(temp_lfsr_out[i])
			);
		end
	endgenerate
	always @(posedge clk_i) begin : scramble_seq_block
		if (rst_i)
			Q <= 532'hffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
		else
			Q <= D;
	end
	always @(*) begin : scramble_comb_block
		if (_sv2v_0)
			;
		D = Q;
		D[195-:4] = 1'sb0;
		D[187-:4] = 1'sb0;
		D[531-:16] = lfsr_out[pipe_width_i >> 3];
		D[183-:4] = 1'sb0;
		D[32] = data_valid_i;
		if (data_valid_i) begin
			begin : sv2v_autoblock_1
				reg signed [31:0] pipeline_idx;
				for (pipeline_idx = 0; pipeline_idx < NumPipelines; pipeline_idx = pipeline_idx + 1)
					if (pipeline_idx == 0) begin
						D[52 + (pipeline_idx * 32)+:32] = data_in_i;
						D[36 + (pipeline_idx * 4)+:4] = data_k_in_i;
						D[32 + pipeline_idx] = data_valid_i;
						begin : sv2v_autoblock_2
							reg signed [31:0] lfsr_idx;
							for (lfsr_idx = 0; lfsr_idx < 5; lfsr_idx = lfsr_idx + 1)
								D[196 + (((pipeline_idx * 5) + lfsr_idx) * 16)+:16] = lfsr_out[lfsr_idx];
						end
					end
					else begin
						D[32 + pipeline_idx] = Q[31 + pipeline_idx];
						D[196 + (16 * (pipeline_idx * 5))+:80] = Q[196 + (16 * ((pipeline_idx - 1) * 5))+:80];
						D[52 + (pipeline_idx * 32)+:32] = Q[52 + ((pipeline_idx - 1) * 32)+:32];
						D[36 + (pipeline_idx * 4)+:4] = Q[36 + ((pipeline_idx - 1) * 4)+:4];
					end
			end
			if (Q[187-:4] != {4 {1'sb0}})
				D[191-:4] = 1'sb0;
			else if (Q[191-:4] != {4 {1'sb0}}) begin
				D[31-:32] = Q[31-:32] + (pipe_width_i >> 3);
				D[191-:4] = 1'sb1;
			end
			begin : sv2v_autoblock_3
				reg signed [31:0] byte_idx;
				for (byte_idx = 0; byte_idx < 4; byte_idx = byte_idx + 1)
					begin : sv2v_autoblock_4
						reg signed [31:0] pipe_idx;
						pipe_idx = ((pipe_width_i >> 3) - 1) - byte_idx;
						lfsr_swapped[byte_idx] = 1'sb0;
						if (byte_idx < (pipe_width_i >> 3)) begin
							if (Q[192 + (byte_idx + 1)] && (byte_idx == ((pipe_width_i >> 3) - 1)))
								D[531-:16] = 1'sb1;
							if (Q[180 + byte_idx] != 1'b0) begin
								D[515-:320] = Q[515-:320];
								D[531-:16] = lfsr_out[byte_idx];
								if (Q[52 + (byte_idx * 8)+:8] != 8'h1c) begin
									D[31-:32] = 1'sb0;
									begin : sv2v_autoblock_5
										reg signed [31:0] idx;
										for (idx = 0; idx < 4; idx = idx + 1)
											if ((idx >= byte_idx) && (idx < (pipe_width_i >> 3))) begin
												D[188 + idx] = 1'sb0;
												D[184 + idx] = 1'sb1;
											end
									end
								end
							end
							if ((Q[31-:32] + (byte_idx + 1)) > 32'd16) begin : sv2v_autoblock_6
								reg flag;
								flag = 1'sb0;
								begin : sv2v_autoblock_7
									reg signed [31:0] idx;
									for (idx = 0; idx < 4; idx = idx + 1)
										if ((idx < (pipe_width_i >> 3)) && (Q[40 + idx] && (Q[84 + (idx * 8)+:8] == 8'hbc)))
											flag = 1'sb1;
								end
								begin : sv2v_autoblock_8
									reg signed [31:0] idx;
									for (idx = 0; idx < 4; idx = idx + 1)
										if (((idx >= byte_idx) && (idx < (pipe_width_i >> 3))) && (flag == 1'b0)) begin
											D[31-:32] = 1'sb0;
											D[188 + idx] = 1'sb0;
											D[184 + idx] = 1'sb1;
										end
								end
							end
							if (Q[40 + byte_idx]) begin
								if (Q[84 + (byte_idx * 8)+:8] == 8'hbc) begin
									D[192 + (byte_idx + 1)] = 1'sb1;
									D[31-:32] = (pipe_width_i >> 3) - byte_idx;
									begin : sv2v_autoblock_9
										reg signed [31:0] d_idx;
										for (d_idx = 0; d_idx < 4; d_idx = d_idx + 1)
											if (d_idx >= byte_idx)
												D[188 + d_idx] = 1'sb1;
									end
								end
								if (Q[84 + (byte_idx * 8)+:8] == 8'h1c) begin
									D[180 + byte_idx] = 1'sb1;
									D[188 + byte_idx] = 1'sb1;
									D[531-:16] = lfsr_out[byte_idx];
								end
								else if (Q[84 + (byte_idx * 8)+:8] == 8'hf7)
									;
							end
							if (Q[183-:4] == {4 {1'sb0}}) begin : sv2v_autoblock_10
								reg [15:0] _sv2v_strm_4F0E5_inp;
								reg [15:0] _sv2v_strm_4F0E5_out;
								integer _sv2v_strm_4F0E5_idx;
								_sv2v_strm_4F0E5_inp = {lfsr_out[byte_idx]};
								for (_sv2v_strm_4F0E5_idx = 0; _sv2v_strm_4F0E5_idx <= 15; _sv2v_strm_4F0E5_idx = _sv2v_strm_4F0E5_idx + 1)
									_sv2v_strm_4F0E5_out[15 - _sv2v_strm_4F0E5_idx-:1] = _sv2v_strm_4F0E5_inp[_sv2v_strm_4F0E5_idx+:1];
								lfsr_swapped[byte_idx] = _sv2v_strm_4F0E5_out << 0;
							end
							else begin : sv2v_autoblock_11
								reg [15:0] _sv2v_strm_64F47_inp;
								reg [15:0] _sv2v_strm_64F47_out;
								integer _sv2v_strm_64F47_idx;
								_sv2v_strm_64F47_inp = {Q[196 + ((0 + byte_idx) * 16)+:16]};
								for (_sv2v_strm_64F47_idx = 0; _sv2v_strm_64F47_idx <= 15; _sv2v_strm_64F47_idx = _sv2v_strm_64F47_idx + 1)
									_sv2v_strm_64F47_out[15 - _sv2v_strm_64F47_idx-:1] = _sv2v_strm_64F47_inp[_sv2v_strm_64F47_idx+:1];
								lfsr_swapped[byte_idx] = _sv2v_strm_64F47_out << 0;
							end
							D[148 + (byte_idx * 8)+:8] = (((Q[188 + byte_idx] == 1'b0) || Q[184 + byte_idx]) && !Q[44 + byte_idx] ? Q[116 + (byte_idx * 8)+:8] ^ lfsr_swapped[byte_idx] : Q[116 + (byte_idx * 8)+:8]);
						end
					end
			end
		end
	end
	assign data_out_o = Q[148+:32];
	assign data_k_out_o = Q[48+:4];
	assign data_valid_o = Q[35];
	initial _sv2v_0 = 0;
endmodule