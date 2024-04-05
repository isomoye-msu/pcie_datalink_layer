module lane_management
  import pcie_phy_pkg::*;
#(
    // TLP data width
    parameter int DATA_WIDTH    = 32,
    // TLP strobe width
    parameter int STRB_WIDTH    = DATA_WIDTH / 8,
    parameter int KEEP_WIDTH    = STRB_WIDTH,
    parameter int USER_WIDTH    = 4,
    parameter int MAX_NUM_LANES = 4
) (
    //clocks and resets
    input  logic                  clk_i,               // Clock signal
    input  logic                  rst_i,               // Reset signal
    input  logic                  phy_link_up_i,
    //Dllp AXIS inputs
    input  logic [DATA_WIDTH-1:0] s_dllp_axis_tdata,
    input  logic [KEEP_WIDTH-1:0] s_dllp_axis_tkeep,
    input  logic                  s_dllp_axis_tvalid,
    input  logic                  s_dllp_axis_tlast,
    input  logic [USER_WIDTH-1:0] s_dllp_axis_tuser,
    output logic                  s_dllp_axis_tready,

    //physical layer ordered sets AXIS inputs
    input  logic [DATA_WIDTH-1:0] s_phy_axis_tdata,
    input  logic [KEEP_WIDTH-1:0] s_phy_axis_tkeep,
    input  logic                  s_phy_axis_tvalid,
    input  logic                  s_phy_axis_tlast,
    input  logic [USER_WIDTH-1:0] s_phy_axis_tuser,
    output logic                  s_phy_axis_tready,

    input  logic                                           lane_reverse_i,
    input  rate_speed_e                                    curr_data_rate_i,
    output logic        [( MAX_NUM_LANES* DATA_WIDTH)-1:0] data_out_o,
    output logic        [               MAX_NUM_LANES-1:0] data_valid_o,
    output logic        [           (4*MAX_NUM_LANES)-1:0] d_k_out_o,
    output logic        [           (2*MAX_NUM_LANES)-1:0] sync_header_o,
    output logic        [                             5:0] pipe_width_o,
    input  logic        [                             5:0] num_active_lanes_i
);



  localparam int PipeWidthGen1 = 8;
  localparam int PipeWidthGen2 = 16;
  localparam int PipeWidthGen3 = 16;
  localparam int PipeWidthGen4 = 32;
  localparam int PipeWidthGen5 = 32;
  localparam int BytesPerTransfer = DATA_WIDTH / 8;
  localparam int MaxWordsPerTransaction = 512 / DATA_WIDTH;


  //retry mechanism enum
  typedef enum logic [4:0] {
    ST_IDLE,
    ST_LANE_MNGT_PHY,
    ST_LANE_MNGT_DATA,
    ST_LANE_MNGT_TX_PHY,
    ST_LANE_MNGT_TX_DATA,
    ST_LANE_MNGT_TX_GEN1,
    ST_LANE_MNGT_TX_GEN2,
    ST_LANE_MNGT_TX_GEN3,
    ST_LANE_MNGT_TX_GEN4,
    ST_LANE_MNGT_TX_GEN5
  } lane_mngt_state_e;


  lane_mngt_state_e                     curr_state;
  lane_mngt_state_e                     next_state;
  //   logic [5:0] pipe_width_o;
  logic             [              4:0] sync_width_c;
  logic             [              4:0] sync_width_r;


  logic             [              4:0] sync_count_c;
  logic             [              4:0] sync_count_r;
  logic             [              4:0] sync_width;
  logic             [              4:0] sync_count;
  logic             [              4:0] axis_sync_c;
  logic             [              4:0] axis_sync_r;
  logic             [              5:0] pipe_width_c;
  logic             [              5:0] pipe_width_r;
  logic             [              5:0] pkt_count_c;
  logic             [              5:0] pkt_count_r;

  logic             [              5:0] word_count_c;
  logic             [              5:0] word_count_r;
  logic             [             31:0] data_out_c               [MAX_NUM_LANES];
  logic             [             31:0] data_out_r               [MAX_NUM_LANES];
  logic             [             31:0] lane_replacement_byte_c;
  logic             [             31:0] lane_replacement_byte_r;
  logic             [MAX_NUM_LANES-1:0] data_valid_c;
  logic             [MAX_NUM_LANES-1:0] data_valid_r;
  logic             [              3:0] d_k_out_c                [MAX_NUM_LANES];
  logic             [              3:0] d_k_out_r                [MAX_NUM_LANES];

  logic                                 is_ordered_set;
  logic                                 is_data;
  logic                                 ready_out;

  logic             [              1:0] sync_header_c            [MAX_NUM_LANES];
  logic             [              1:0] sync_header_r            [MAX_NUM_LANES];


  logic             [            511:0] data_in_c;
  logic             [            511:0] data_in_r;
  logic             [     (512/8) -1:0] data_k_in_c;
  logic             [     (512/8) -1:0] data_k_in_r;
  logic             [              1:0] word_replacement_index_c;
  logic             [              1:0] word_replacement_index_r;
  logic                                 is_phy_c;
  logic                                 is_phy_r;
  logic                                 is_dllp_c;
  logic                                 is_dllp_r;
  logic                                 replace_lane_c;
  logic                                 replace_lane_r;
  logic                                 complete_c;
  logic                                 complete_r;
  logic             [             31:0] data_out;
  logic             [              3:0] data_k_out;
  logic             [              7:0] lane_idx;
  logic             [              7:0] lane_shift_idx;
  logic             [              7:0] pipewidth_shift_idx;


  assign is_ordered_set = s_phy_axis_tvalid & s_phy_axis_tready;
  assign is_data        = s_dllp_axis_tvalid & s_dllp_axis_tready;


  always_ff @(posedge clk_i) begin : main_seq_block
    if (rst_i) begin
      pipe_width_r <= PipeWidthGen1;
      sync_count_r <= '0;
      sync_width_r <= '0;
      // sync_header_r <= '0;
      axis_sync_r  <= '0;
      data_valid_r <= '0;
      curr_state   <= ST_IDLE;
    end else begin
      pipe_width_r <= pipe_width_c;
      sync_count_r <= sync_count_c;
      sync_width_r <= sync_width_c;
      axis_sync_r  <= axis_sync_c;
      data_valid_r <= data_valid_c;
      curr_state   <= next_state;
    end
    d_k_out_r                <= d_k_out_c;
    data_in_r                <= data_in_c;
    is_phy_r                 <= is_phy_c;
    is_dllp_r                <= is_dllp_c;
    pkt_count_r              <= pkt_count_c;
    word_count_r             <= word_count_c;
    lane_replacement_byte_r  <= lane_replacement_byte_c;
    word_replacement_index_r <= word_replacement_index_c;
    replace_lane_r           <= replace_lane_c;
    complete_r               <= complete_c;
    sync_header_r            <= sync_header_c;
    data_out_r               <= data_out_c;
    data_k_in_r              <= data_k_in_c;
    // for (int i = 0; i < MAX_NUM_LANES; i++) begin
    //   sync_header_r[i] <= sync_header_c[i];
    //   data_out_r[i]    <= data_out_c[i];
    // end
  end


  always_comb begin : data_rate_block
    pipe_width_c = pipe_width_r;
    sync_width_c = sync_width_r;
    case (curr_data_rate_i)
      gen1: begin
        pipe_width_c = PipeWidthGen1;
      end
      gen2: begin
        pipe_width_c = PipeWidthGen2;
      end
      gen3: begin
        pipe_width_c = PipeWidthGen3;
        sync_width_c = 5'd16;
      end
      gen4: begin
        pipe_width_c = PipeWidthGen4;
        sync_width_c = 5'd8;
      end
      gen5: begin
        pipe_width_c = PipeWidthGen5;
        sync_width_c = 5'd4;
      end
      default: begin
        pipe_width_c = PipeWidthGen1;
        sync_width_c = 5'd16;
      end
    endcase
  end

  always_comb begin : sync_header_combo_block
    sync_count_c  = sync_count_r;
    sync_header_c = sync_header_r;
    if (curr_data_rate_i >= gen3) begin
      //increment count only if valid transaction
      if (is_phy_r || is_dllp_r) begin
        sync_count_c = sync_count_r >= sync_width_r ? '0 : sync_count_r + 1'b1;
      end
    end else begin
      sync_count_c = '0;
    end
    //per lane sync header output
    for (int i = 0; i < MAX_NUM_LANES; i++) begin
      if (sync_count_r == '0 && (curr_data_rate_i >= gen3)) begin
        sync_header_c[i] = is_phy_r ? 2'b10 : 2'b01;
      end
    end
  end


  always_comb begin : lane_data_sync
    d_k_out_c                = d_k_out_r;
    data_k_in_c              = data_k_in_r;
    data_out_c               = data_out_r;
    data_valid_c             = '0;
    data_in_c                = data_in_r;
    is_dllp_c                = is_dllp_r;
    is_phy_c                 = is_phy_r;
    lane_replacement_byte_c  = lane_replacement_byte_r;
    pkt_count_c              = pkt_count_r;
    word_count_c             = word_count_r;
    next_state               = curr_state;
    word_replacement_index_c = word_replacement_index_r;
    replace_lane_c           = replace_lane_r;
    ready_out                = '0;
    complete_c               = complete_r;
    data_out                 = '0;
    lane_idx                 = '0;
    data_k_out               = '0;
    pipewidth_shift_idx      = (pipe_width_r >> 3) - 1;
    lane_shift_idx           = (num_active_lanes_i >> 1);
    case (curr_state)
      ST_IDLE: begin
        if (s_phy_axis_tvalid) begin
          pkt_count_c             = '0;
          word_count_c            = '0;
          lane_replacement_byte_c = pipe_width_r;
          is_dllp_c               = '0;
          is_phy_c                = '1;
          next_state              = ST_LANE_MNGT_PHY;
        end else if (s_dllp_axis_tvalid) begin
          pkt_count_c             = '0;
          word_count_c            = '0;
          lane_replacement_byte_c = pipe_width_r;
          next_state              = ST_LANE_MNGT_DATA;
          is_dllp_c               = '1;
          is_phy_c                = '0;
        end
      end
      ST_LANE_MNGT_PHY: begin
        ready_out = '1;
        replace_lane_c = '0;
        complete_c = '0;
        if (s_phy_axis_tvalid && s_phy_axis_tready) begin
          pkt_count_c = pkt_count_r + 1'b1;
          for (int i = 0; i < 4; i++) begin
            data_in_c[(i*8)+(pkt_count_r*32)+:8] = s_phy_axis_tkeep[i] ?
            s_phy_axis_tdata[i*8+:8] : (curr_data_rate_i >= gen3) ?  8'hf7 : '0;
            if (s_phy_axis_tuser[i+1]) begin
              data_k_in_c[(pkt_count_r*4)+i] = '1;
            end
          end
          if ((pkt_count_r >= MaxWordsPerTransaction) || s_phy_axis_tlast) begin
            complete_c = s_phy_axis_tlast;
            next_state = ST_LANE_MNGT_TX_PHY;
            if (s_phy_axis_tuser[0] != '0) begin
              replace_lane_c = '1;
            end
            word_replacement_index_c = (pipe_width_r) > 32'd16 ? '0 : 5'd1;
            if (pipe_width_r == 8'd32) begin
              lane_replacement_byte_c  = 4'd2;
              word_replacement_index_c = '0;
            end else if (pipe_width_r == 8'd16) begin
              lane_replacement_byte_c  = 4'd0;
              word_replacement_index_c = 4'd1;
            end else if (pipe_width_r == 8'd8) begin
              lane_replacement_byte_c  = 4'd0;
              word_replacement_index_c = 4'd2;
            end
          end
        end

      end
      ST_LANE_MNGT_DATA: begin
        ready_out = '1;
        if (s_dllp_axis_tvalid && s_dllp_axis_tready) begin
          pkt_count_c = pkt_count_r + 1'b1;
          for (int i = 0; i < 4; i++) begin
            data_in_c[(i<<3)+(pkt_count_r<<5)+:8] = s_dllp_axis_tkeep[i] ?
                s_dllp_axis_tdata[i<<3+:8] : (curr_data_rate_i >= gen3) ? 8'hf7 : '0;
            if (s_dllp_axis_tuser[i]) begin
              data_k_in_c[(pkt_count_r*4)+i] = '1;
            end
          end
          if ((pkt_count_r >= MaxWordsPerTransaction) || s_dllp_axis_tlast) begin
            complete_c = s_dllp_axis_tlast;
            next_state = ST_LANE_MNGT_TX_DATA;
          end
        end
      end
      ST_LANE_MNGT_TX_DATA: begin
        word_count_c = word_count_r + 1'b1;
        data_in_c    = data_in_r >> (num_active_lanes_i << pipewidth_shift_idx);
        data_k_in_c  = data_k_in_r >> num_active_lanes_i;
        if (word_count_r >= ((pkt_count_r << 5) / (num_active_lanes_i << pipewidth_shift_idx))) begin
          next_state   = complete_r ? ST_IDLE : ST_LANE_MNGT_DATA;
          pkt_count_c  = '0;
          word_count_c = '0;
          is_dllp_c    = '0;
          is_phy_c     = '0;
        end
        for (int lane = 0; lane < MAX_NUM_LANES; lane++) begin
          data_out   = curr_data_rate_i >= gen3 ? 32'hf7f7f7f7 : '0;
          data_k_out = '0;
          if (lane < num_active_lanes_i) begin
            data_valid_c[lane] = '1;
            for (int byte_idx = 0; byte_idx < 4; byte_idx++) begin
              lane_idx = ((pipe_width_r >> 3) - 1 - byte_idx);
              if (byte_idx < (pipe_width_r >> 3)) begin
                data_out[byte_idx<<3+:8] = data_in_r[((lane)<<3)+((lane_idx<<3)*num_active_lanes_i)+:8];
                data_k_out[byte_idx] = data_k_in_r[((lane))+(lane_idx*num_active_lanes_i)+:1];
              end
            end
          end
          d_k_out_c[lane]  = data_k_out;
          data_out_c[lane] = data_out;
        end
      end
      ST_LANE_MNGT_TX_PHY: begin
        word_count_c = word_count_r + 1'b1;
        data_in_c    = data_in_r >> pipe_width_r;
        data_k_in_c  = data_k_in_r >> (pipe_width_r>>3);
        if (word_count_r >= ((pkt_count_r << (3 - (pipe_width_r >> 3))) - 1)) begin
          next_state   = complete_r ? ST_IDLE : ST_LANE_MNGT_PHY;
          pkt_count_c  = '0;
          word_count_c = '0;
          is_dllp_c    = '0;
          is_phy_c     = '0;
        end
        for (logic [7:0] lane = 0; lane < MAX_NUM_LANES; lane = lane + 1) begin
          data_out   = curr_data_rate_i >= gen3 ? 32'hf7f7f7f7 : '0;
          data_k_out = '0;
          if (lane < num_active_lanes_i) begin
            data_valid_c[lane] = '1;
            for (int byte_idx = 0; byte_idx < 4; byte_idx++) begin
              if (byte_idx < (pipewidth_shift_idx + 1)) begin
                lane_idx = (pipewidth_shift_idx - byte_idx);
                data_k_out[byte_idx] = data_k_in_r[byte_idx];
                if((replace_lane_r && word_replacement_index_r == word_count_r) &&
                (lane_replacement_byte_r == lane_idx)) begin
                  data_out[byte_idx<<3+:8] = lane_reverse_i ? num_active_lanes_i - lane : lane;
                end else begin
                  data_out[byte_idx<<3+:8] = data_in_r[(lane_idx)<<3+:8];
                end
              end
            end
          end
          d_k_out_c[lane]  = data_k_out;
          data_out_c[lane] = data_out;
        end
      end
      default: begin
      end
    endcase
  end


  always_comb begin : flatten_decrambler
    for (int i = 0; i < MAX_NUM_LANES; i++) begin
      data_out_o[32*i+:32]  = data_out_r[i];
      data_valid_o[i]       = data_valid_r[i];
      d_k_out_o[4*i+:4]     = d_k_out_r[i];
      sync_header_o[2*i+:2] = sync_header_r[i];
    end
  end


  // assign sync_header_o      = sync_header_r;
  assign s_dllp_axis_tready = ready_out & is_dllp_r;
  assign s_phy_axis_tready  = ready_out & is_phy_r;
  // assign data_valid_o       = data_valid_r;
  // assign d_k_out_o          = d_k_out_r;
  // assign data_out_o         = data_out_r;
  assign pipe_width_o       = pipe_width_r;

endmodule
