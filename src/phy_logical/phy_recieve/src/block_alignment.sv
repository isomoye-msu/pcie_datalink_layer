module block_alignment
  import pcie_phy_pkg::*;
#(
    // TLP data width
    parameter int DATA_WIDTH    = 32,
    // TLP strobe width
    parameter int STRB_WIDTH    = DATA_WIDTH / 8,
    parameter int KEEP_WIDTH    = STRB_WI1DTH,
    parameter int USER_WIDTH    = 1,
    parameter int MAX_NUM_LANES = 4
) (
    //clocks and resets
    input  logic                     clk_i,                            // Clock signal
    input  logic                     rst_i,                            // Reset signal
    input  logic                     phy_link_up_i,
    //Dllp AXIS inputs
    //! @virtualbus master_axis_bus @dir out
    output logic [             31:0] os_data_out_o   [MAX_NUM_LANES],
    output logic [MAX_NUM_LANES-1:0] os_data_valid_o,
    output logic [              3:0] os_d_k_out_o    [MAX_NUM_LANES],
    output logic [              1:0] os_sync_header_o[MAX_NUM_LANES],

    output logic [             31:0] tlp_dllp_data_out_o   [MAX_NUM_LANES],
    output logic [MAX_NUM_LANES-1:0] tlp_dllp_data_valid_o,
    output logic [              3:0] tlp_dllp_d_k_out_o    [MAX_NUM_LANES],
    output logic [              1:0] tlp_dllp_sync_header_o[MAX_NUM_LANES],

    //! @end
    //physical layer ordered sets AXIS inputs
    //! @virtualbus master_axis_bus @dir out
    output logic [DATA_WIDTH-1:0] m_ordered_set_axis_tdata [MAX_NUM_LANES],
    output logic [KEEP_WIDTH-1:0] m_ordered_set_axis_tkeep [MAX_NUM_LANES],
    output logic                  m_ordered_set_axis_tvalid[MAX_NUM_LANES],
    output logic                  m_ordered_set_axis_tlast [MAX_NUM_LANES],
    output logic [USER_WIDTH-1:0] m_ordered_set_axis_tuser [MAX_NUM_LANES],
    input  logic                  m_ordered_set_axis_tready[MAX_NUM_LANES],
    //! @end

    input logic                            lane_reverse_i,
    input rate_speed_e                     curr_data_rate_i,
    input logic        [             31:0] data_in_i         [MAX_NUM_LANES],
    input logic        [MAX_NUM_LANES-1:0] data_valid_i,
    input logic        [              3:0] d_k_in_i          [MAX_NUM_LANES],
    input logic        [              1:0] sync_header_i     [MAX_NUM_LANES],
    input logic        [              5:0] pipe_width_i,
    input logic        [              5:0] num_active_lanes_i
);



  localparam int PipeWidthGen1 = 8;
  localparam int PipeWidthGen2 = 16;
  localparam int PipeWidthGen3 = 16;
  localparam int PipeWidthGen4 = 32;
  localparam int PipeWidthGen5 = 32;
  localparam int BytesPerTransfer = DATA_WIDTH / 8;
  localparam int MaxWordsPerTransaction = 512 / DATA_WIDTH;

  typedef enum logic [4:0] {
    ST_IDLE,
    ST_SEND_OS,
    ST_SEND_DATA
  } data_mux_st_e;


  block_alignment_st_e                     curr_state;
  block_alignment_st_e                     next_state;


  logic                [             31:0] os_data_out_c            [MAX_NUM_LANES];
  logic                [             31:0] os_data_out_r            [MAX_NUM_LANES];
  logic                [MAX_NUM_LANES-1:0] os_data_valid_c;
  logic                [MAX_NUM_LANES-1:0] os_data_valid_r;
  logic                [              3:0] os_d_k_out_c             [MAX_NUM_LANES];
  logic                [              3:0] os_d_k_out_r;
  logic                [              1:0] os_sync_header_c;
  logic                [              1:0] os_sync_header_r;



  logic                [             31:0] tlp_dllp_data_out_c      [MAX_NUM_LANES];
  logic                [             31:0] tlp_dllp_data_out_r      [MAX_NUM_LANES];
  logic                [MAX_NUM_LANES-1:0] tlp_dllp_data_valid_c;
  logic                [MAX_NUM_LANES-1:0] tlp_dllp_data_valid_r;
  logic                [              3:0] tlp_dllp_d_k_out_c       [MAX_NUM_LANES];
  logic                [              3:0] tlp_dllp_d_k_out_r;
  logic                [              1:0] tlp_dllp_sync_header_c;
  logic                [              1:0] tlp_dllp_sync_header_r;


  //   logic [5:0] pipe_width_o;
  logic                [              4:0] sync_width_c;
  logic                [              4:0] sync_width_r;


  logic                [              4:0] sync_count_c;
  logic                [              4:0] sync_count_r;
  logic                [              4:0] sync_width;
  logic                [              4:0] sync_count;
  logic                [              4:0] axis_sync_c;
  logic                [              4:0] axis_sync_r;
  logic                [              5:0] pipe_width_c;
  logic                [              5:0] pipe_width_r;
  logic                [              5:0] pkt_count_c;
  logic                [              5:0] pkt_count_r;

  logic                [              5:0] word_count_c;
  logic                [              5:0] word_count_r;
  logic                [             31:0] data_out_c               [MAX_NUM_LANES];
  logic                [             31:0] data_out_r               [MAX_NUM_LANES];
  logic                [             31:0] lane_replacement_byte_c;
  logic                [             31:0] lane_replacement_byte_r;
  logic                [MAX_NUM_LANES-1:0] data_valid_c;
  logic                [MAX_NUM_LANES-1:0] data_valid_r;
  logic                [              3:0] d_k_out_c                [MAX_NUM_LANES];
  logic                [              3:0] d_k_out_r                [MAX_NUM_LANES];

  logic                                    is_ordered_set;
  logic                                    is_data;
  logic                                    ready_out;

  logic                [              1:0] sync_header_c            [MAX_NUM_LANES];
  logic                [              1:0] sync_header_r            [MAX_NUM_LANES];


  logic                [            511:0] data_in_c;
  logic                [            511:0] data_in_r;
  logic                [     (512/8) -1:0] data_k_in_c;
  logic                [     (512/8) -1:0] data_k_in_r;
  logic                [              1:0] word_replacement_index_c;
  logic                [              1:0] word_replacement_index_r;
  logic                [  MAX_NUM_LANES-1] is_ordered_set_c;
  logic                [  MAX_NUM_LANES-1] is_ordered_set_r;
  logic                [  MAX_NUM_LANES-1] is_data_c;
  logic                [  MAX_NUM_LANES-1] is_data_r;
  logic                                    replace_lane_c;
  logic                                    replace_lane_r;
  logic                                    complete_c;
  logic                                    complete_r;
  logic                [             31:0] data_out;
  logic                [              3:0] data_k_out;
  logic                [              7:0] lane_idx;

  logic                [MAX_NUM_LANES-1:0] lane_valid;
  logic                [MAX_NUM_LANES-1:0] lane_last;


  assign is_ordered_set = s_phy_axis_tvalid & s_phy_axis_tready;
  assign is_data        = s_dllp_axis_tvalid & s_dllp_axis_tready;


  always_ff @(posedge clk_i) begin : main_seq_block
    if (rst_i) begin
      os_data_valid_r       <= '0;
      tlp_dllp_data_valid_r <= '0;
    end else begin
      os_data_valid_r       <= os_data_valid_c;
      tlp_dllp_data_valid_r <= tlp_dllp_data_valid_c;
    end
    is_ordered_set_r       <= is_ordered_set_c;
    is_data_r              <= is_data_c;

    os_data_out_r          <= os_data_out_c;
    os_d_k_out_r           <= os_d_k_out_c;
    os_sync_header_r       <= os_sync_header_c;

    tlp_dllp_data_out_r    <= tlp_dllp_data_out_c;
    tlp_dllp_d_k_out_r     <= tlp_dllp_d_k_out_c;
    tlp_dllp_sync_header_r <= tlp_dllp_sync_header_c;

    // d_k_out_r              <= d_k_out_c;
    // data_out_r             <= data_out_c;
    // data_k_in_r            <= data_k_in_c;
  end


  //   always_comb begin : data_rate_block
  //     pipe_width_c = pipe_width_r;
  //     sync_width_c = sync_width_r;
  //     case (curr_data_rate_i)
  //       gen1: begin
  //         pipe_width_c = PipeWidthGen1;
  //       end
  //       gen2: begin
  //         pipe_width_c = PipeWidthGen2;
  //       end
  //       gen3: begin
  //         pipe_width_c = PipeWidthGen3;
  //         sync_width_c = 5'd16;
  //       end
  //       gen4: begin
  //         pipe_width_c = PipeWidthGen4;
  //         sync_width_c = 5'd8;
  //       end
  //       gen5: begin
  //         pipe_width_c = PipeWidthGen5;
  //         sync_width_c = 5'd4;
  //       end
  //       default: begin
  //         pipe_width_c = PipeWidthGen1;
  //         sync_width_c = 5'd16;
  //       end
  //     endcase
  //   end

  //   always_comb begin : sync_header_combo_block
  //     sync_count_c  = sync_count_r;
  //     sync_header_c = sync_header_r;
  //     if (curr_data_rate_i >= gen3) begin
  //       //increment count only if valid transaction
  //       if (is_ordered_set_r || is_data_r) begin
  //         if (sync_count == sync_width) begin
  //           sync_count_c = '0;
  //         end else begin
  //           sync_count_c = sync_count_r + 1'b1;
  //         end
  //       end
  //     end else begin
  //       sync_count_c = '0;
  //     end
  //     //per lane sync header output
  //     for (int i = 0; i < MAX_NUM_LANES; i++) begin
  //       if (sync_count == '0 && (curr_data_rate_i >= gen3)) begin
  //         sync_header_c[i] = is_ordered_set_r ? 2'b10 : 2'b01;
  //       end
  //     end
  //   end


  always_comb begin : block_alignment_combinational_logic
    data_in_c        = data_in_r;
    is_ordered_set_c = is_ordered_set_r;
    for (int lane = 0; lane < MAX_NUM_LANES; lane++) begin
      for (byte_ = 0; byte_ < 4; byte_++) begin

      end
      if (data_valid_i[i]) begin
        if ((curr_data_rate_i >= gen3)) begin
          if (sync_header_i[lane] == 2'b10) begin
            m_ordered_set_axis_tdata[lane] = data_in_i[lane] >> (32 - pipe_width_i);
            m_ordered_set_axis_tvalid = '1;
            next_state = ST_SEND_OS;
          end else if (sync_header_i[lane] == 2'b01) begin
            next_state = ST_SEND_DATA;
            lane_valid[lane] = '1;
          end else begin
            //misalligned data.. do nothing. wait for realignment
          end
        end else begin

        end
      end
    end
  end



  for (genvar lane = 0; lane < MAX_NUM_LANES; lane++) begin : gen_block_alignment
    data_mux_st_e       curr_state;
    data_mux_st_e       next_state;
    logic         [5:0] pkt_count_c;
    logic         [5:0] pkt_count_r;

    always_ff @(posedge clk_i) begin : data_mux_seq_block
      if (rst_i) begin
        curr_state  <= ST_IDLE;
        pkt_count_r <= '0;
      end else begin
        curr_state  <= next_state;
        pkt_count_r <= pkt_count_c;
      end
    end


    always_comb begin : data_mux_combo_block
      next_state                   = curr_state;
      pkt_count_c                  = pkt_count_r;
      tlp_dllp_data_valid_c[lane]  = '0;
      os_data_valid_c[lane]        = '0;
      tlp_dllp_data_out_c[lane]    = data_in_i[lane];
      os_data_out_c[lane]          = data_in_i[lane];
      os_d_k_out_c[lane]           = d_k_in_i[lane];
      tlp_dllp_d_k_out_c[lane]     = d_k_in_i[lane];
      os_sync_header_c[lane]       = sync_header_i[lane];
      tlp_dllp_sync_header_c[lane] = sync_header_i[lane];
      case (curr_state)
        ST_IDLE: begin
          //ready not respected on the axis buses
          if (data_valid_i[lane]) begin
            if ((curr_data_rate_i >= gen3)) begin
              if (sync_header_i[lane] == 2'b10) begin
                // m_ordered_set_axis_tdata[lane] = data_in_i[lane] >> (32 - pipe_width_i);
                os_data_valid_c = '1;
                next_state = ST_SEND_OS;
              end else if (sync_header_i[lane] == 2'b01) begin
                next_state = ST_SEND_DATA;
                tlp_dllp_data_valid_c[lane] = '1;
              end else begin
                //misalligned data.. do nothing. wait for realignment
              end
            end else begin
              // if(d_k_in_i[lane] >> ((pipe_width_r >>3)-1) && data_in_i[lane] >> (8 * ))

            end
          end
        end
        ST_SEND_DATA: begin
          if (data_valid_i[lane]) begin
            if ((curr_data_rate_i >= gen3)) begin
              if (sync_header_i[lane] == 2'b10) begin
                m_ordered_set_axis_tdata[lane] = data_in_i[lane] >> (32 - pipe_width_i);
                m_ordered_set_axis_tvalid = '1;
                next_state = ST_SEND_OS;
              end else if (sync_header_i[lane] == 2'b01) begin
                next_state = ST_SEND_DATA;
                lane_valid[lane] = '1;
              end else begin
                //misalligned data.. do nothing. wait for realignment
              end
            end else begin

            end
          end
        end

        ST_SEND_OS: begin

        end

        default: begin

        end
      endcase
    end



  end



  always_comb begin : lane_data_sync
    d_k_out_c                = d_k_out_r;
    data_k_in_c              = data_k_in_r;
    data_out_c               = data_out_r;
    data_valid_c             = '0;
    // data_in_c                = data_in_r;
    is_data_c                = is_data_r;
    is_ordered_set_c         = is_ordered_set_r;
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
    case (curr_state)
      ST_IDLE: begin
        if (da)
          if (s_phy_axis_tvalid) begin
            pkt_count_c             = '0;
            word_count_c            = '0;
            lane_replacement_byte_c = pipe_width_r;
            is_data_c               = '0;
            is_ordered_set_c        = '1;
            next_state              = ST_LANE_MNGT_PHY;
          end else if (s_dllp_axis_tvalid) begin
            pkt_count_c             = '0;
            word_count_c            = '0;
            lane_replacement_byte_c = pipe_width_r;
            next_state              = ST_LANE_MNGT_DATA;
            is_data_c               = '1;
            is_ordered_set_c        = '0;
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
          end
          if ((pkt_count_r >= MaxWordsPerTransaction) || s_phy_axis_tlast) begin
            complete_c = s_phy_axis_tlast;
            next_state = ST_LANE_MNGT_TX_PHY;
            if (s_phy_axis_tuser != '0) begin
              replace_lane_c = '1;
            end
            word_replacement_index_c = (pipe_width_r) > 32'd16 ? '0 : 5'd1;
            if (pipe_width_r == 8'd32) begin
              lane_replacement_byte_c  = 4'd2;
              word_replacement_index_c = '0;
            end else if (pipe_width_r == 8'd16) begin
              lane_replacement_byte_c  = 4'd0;
              word_replacement_index_c = 4'd1;
            end else if (pipe_width_r == 8'd16) begin
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
            data_in_c[(i*8)+(pkt_count_r*32)+:8] = s_dllp_axis_tkeep[i] ?
                s_dllp_axis_tdata[i*8+:8] : (curr_data_rate_i >= gen3) ? 8'hf7 : '0;
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
        data_in_c = data_in_r >> (num_active_lanes_i * (pipe_width_r));
        data_k_in_c = data_k_in_r >> num_active_lanes_i;
        if (word_count_r >= ((pkt_count_r * 32) / (num_active_lanes_i * pipe_width_r))) begin
          next_state       = complete_r ? ST_IDLE : ST_LANE_MNGT_DATA;
          pkt_count_c      = '0;
          word_count_c     = '0;
          is_data_c        = '0;
          is_ordered_set_c = '0;
        end
        for (int lane = 0; lane < MAX_NUM_LANES; lane++) begin
          data_out   = curr_data_rate_i >= gen3 ? 32'hf7f7f7f7 : '0;
          data_k_out = '0;
          if (lane < num_active_lanes_i) begin
            data_valid_c[lane] = '1;
            for (int byte_idx = 0; byte_idx < 4; byte_idx++) begin
              lane_idx = ((pipe_width_r >> 3) - 1 - byte_idx);
              if (byte_idx < (pipe_width_r >> 3)) begin
                data_out[byte_idx*8+:8] = data_in_r[((lane)*8)+(lane_idx*8*num_active_lanes_i)+:8];
                data_k_out[byte_idx] = data_k_in_r[((lane)*1)+(lane_idx*1*num_active_lanes_i)+:1];
              end
            end
          end
          d_k_out_c[lane]  = data_k_out;
          data_out_c[lane] = data_out;
        end
      end
      ST_LANE_MNGT_TX_PHY: begin
        word_count_c = word_count_r + 1'b1;
        data_in_c = (data_in_r >> ((pipe_width_r)));
        if (word_count_r >= ((pkt_count_r * 32) / ((pipe_width_r)) - 1)) begin
          next_state       = complete_r ? ST_IDLE : ST_LANE_MNGT_PHY;
          pkt_count_c      = '0;
          word_count_c     = '0;
          is_data_c        = '0;
          is_ordered_set_c = '0;
        end
        for (logic [7:0] lane = 0; lane < MAX_NUM_LANES; lane = lane + 1) begin
          data_out = curr_data_rate_i >= gen3 ? 32'hf7f7f7f7 : '0;
          if (lane < num_active_lanes_i) begin
            data_valid_c[lane] = '1;
            for (int byte_idx = 0; byte_idx < 4; byte_idx++) begin
              if (byte_idx < (pipe_width_r >> 3)) begin
                lane_idx = ((pipe_width_r >> 3) - 1 - byte_idx);
                if((replace_lane_r && word_replacement_index_r == word_count_r) &&
                (lane_replacement_byte_r == lane_idx)) begin
                  data_out[byte_idx*8+:8] = lane_reverse_i ? num_active_lanes_i - lane : lane;
                end else begin
                  data_out[byte_idx*8+:8] = data_in_r[(lane_idx)*8+:8];
                end
              end
            end
          end
          d_k_out_c[lane]  = '0;
          data_out_c[lane] = data_out;
        end
      end
      default: begin
      end
    endcase
  end


  assign sync_header_o      = sync_header_r;
  assign s_dllp_axis_tready = ready_out & is_data_r;
  assign s_phy_axis_tready  = ready_out & is_ordered_set_r;
  assign data_valid_o       = data_valid_r;
  assign d_k_out_o          = d_k_out_r;
  assign data_out_o         = data_out_r;
  assign pipe_width_o       = pipe_width_r;

endmodule
