module ordered_set_handler
  import pcie_phy_pkg::*;
#(
    parameter int CLK_RATE   = 100,             //!Clock speed in MHz, Defualt is 100
    // parameter int MAX_NUM_LANES = 4,                  //! Maximum number of lanes module can support
    // TLP data width
    parameter int DATA_WIDTH = 32,              //! AXIS data width
    // TLP keep width
    parameter int KEEP_WIDTH = DATA_WIDTH / 8,
    parameter int USER_WIDTH = 4
    // parameter int LINK_NUM      = 0,
    // parameter int IS_UPSTREAM   = 0,                  //downstream by default
    // parameter int CROSSLINK_EN  = 0,                  //crosslink not supported
    // parameter int UPCONFIG_EN   = 0                   //upconfig not supported
) (
    //clocks and resets
    input  logic                     clk_i,             // Clock signal
    input  logic                     rst_i,             // Reset signal
    input  logic              [ 1:0] sync_header_i,
    input  rate_speed_e              curr_data_rate_i,
    input  logic              [31:0] data_in_i,
    input  logic                     data_valid_i,
    input  logic              [ 3:0] data_k_in_i,
    input  logic              [ 5:0] pipe_width_i,
    output pcie_ordered_set_t        ordered_set_o,
    // output logic              [ 7:0] link_num_o,
    // output logic              [ 7:0] lane_num_o,
    // output logic              [ 7:0] nfts_o,
    // output ts_symbol6_union_t        symbol6_o,
    // output training_ctrl_t           training_ctrl_o,
    // output rate_id_t                 rate_id_o,
    output logic                     idle_valid_o,
    output logic                     ts1_valid_o,
    output logic                     ts2_valid_o,
    output logic                     eieos_valid_o


);

  localparam int MaxWordsPerOrderedSet = 16;
  localparam int MaxBytesPerOrderedSet = MaxWordsPerOrderedSet * 4;
  localparam int MaxBytesPerPacket = DATA_WIDTH / 8;

  typedef enum logic [7:0] {
    ST_IDLE,
    ST_RX_GEN1,
    ST_RX_GEN1_OVRFL,
    ST_RX_IDLE_GEN1,
    ST_RX_GEN3,
    ST_RX_GEN3_SKP,
    ST_RX_GEN3_SKP_LAST,
    ST_RX_FULL_GEN1,
    ST_SEND
  } os_decode_state_e;


  os_decode_state_e                   curr_state;
  os_decode_state_e                   next_state;

  logic              [           7:0] axis_pkt_cnt_c;
  logic              [           7:0] axis_pkt_cnt_r;

  pcie_ordered_set_t                  ordered_set_c;
  pcie_ordered_set_t                  ordered_set_r;

  pcie_ordered_set_t                  ordered_set_out_c;
  pcie_ordered_set_t                  ordered_set_out_r;

  logic                               check_ordered_set_c;
  logic                               check_ordered_set_r;
  logic                               idle_valid_c;
  logic                               ts1_valid;
  logic                               ts2_valid;
  logic                               eieos_valid;


  logic              [           7:0] skp0_c;
  logic              [           7:0] skp0_r;
  logic              [           7:0] skp1_c;
  logic              [           7:0] skp1_r;
  logic              [           7:0] skp2_c;
  logic              [           7:0] skp2_r;
  logic              [           7:0] skp3_c;
  logic              [           7:0] skp3_r;

  pcie_tsos_t                         training_set;

  logic              [           7:0] packets_per_words;
  logic              [           7:0] byte_shift;
  logic              [           7:0] byte_index;
  logic              [DATA_WIDTH-1:0] data_swapped;
  logic                               pkt_full;
  logic              [           7:0] word_index;

  logic              [          31:0] data_store_c;
  logic              [          31:0] data_store_r;

  assign ordered_set_o = ordered_set_out_r;
  assign pkt_full = (axis_pkt_cnt_r + byte_shift)>= MaxWordsPerOrderedSet;  //axis_pkt_cnt_r >= packets_per_words - 1;


  //! main sequential block
  always_ff @(posedge clk_i) begin : main_seq
    if (rst_i) begin
      curr_state          <= ST_IDLE;
      check_ordered_set_r <= '0;
      idle_valid_o        <= '0;
      ts1_valid_o         <= '0;
      ts2_valid_o         <= '0;
      eieos_valid_o       <= '0;
      ordered_set_r       <= '0;
      idle_valid_o        <= '0;
      ts1_valid_o         <= '0;
      ts2_valid_o         <= '0;
      eieos_valid_o       <= '0;
      axis_pkt_cnt_r      <= '0;
      skp0_r              <= '0;
      skp1_r              <= '0;
      skp2_r              <= '0;
      skp3_r              <= '0;
      ordered_set_out_r   <= '0;
    end else begin
      curr_state          <= next_state;
      ordered_set_r       <= ordered_set_c;
      idle_valid_o        <= idle_valid_c;
      ts1_valid_o         <= ts1_valid;
      ts2_valid_o         <= ts2_valid;
      eieos_valid_o       <= eieos_valid;
      axis_pkt_cnt_r      <= axis_pkt_cnt_c;
      skp0_r              <= skp0_c;
      skp1_r              <= skp1_c;
      skp2_r              <= skp2_c;
      skp3_r              <= skp3_c;
      ordered_set_out_r   <= ordered_set_out_c;
      check_ordered_set_r <= check_ordered_set_c;
    end
    //non-resetable
    data_store_r <= data_store_c;
    // ordered_set_r  <= ordered_set_c;
    // idle_valid_o   <= idle_valid_c;
    // ts1_valid_o    <= ts1_valid;
    // ts2_valid_o    <= ts2_valid;
    // eieos_valid_o  <= eieos_valid;
    // axis_pkt_cnt_r <= axis_pkt_cnt_c;
    // skp0_r         <= skp0_c;
    // skp1_r         <= skp1_c;
    // skp2_r         <= skp2_c;
    // skp3_r         <= skp3_c;
  end


  always_comb begin : send_ordered_set
    pcie_tsos_t temp_os;
    axis_pkt_cnt_c      = axis_pkt_cnt_r;
    next_state          = curr_state;
    //ordered set
    ordered_set_c       = ordered_set_r;
    check_ordered_set_c = '0;
    idle_valid_c        = '0;
    temp_os             = ordered_set_r;
    skp0_c              = skp0_r;
    skp1_c              = skp1_r;
    skp2_c              = skp2_r;
    skp3_c              = skp3_r;
    data_swapped        = '0;
    byte_shift          = pipe_width_i >> 3;
    byte_index          = (byte_shift - 1'b1);
    word_index          = axis_pkt_cnt_r * byte_shift;
    packets_per_words   = MaxWordsPerOrderedSet - ((byte_shift) << 2);
    data_store_c        = data_store_r;
    // for (int i = 0; i < MaxBytesPerPacket; i++) begin
    //   if ((pipe_width_i >> 3) == (1 << i)) begin
    //     packets_per_words = MaxBytesPerPacket >> i;
    //   end
    // end
    if (data_valid_i) begin
      data_swapped = ordered_set_r[32*word_index[7:2]+:32];
      // int offset = word_index[1:0] ;
      for (int i = 0; i < 4; i++) begin
        int offset;
        offset = word_index[1:0] + i;
        if (i < byte_shift) begin
          data_swapped[8*offset+:8] = data_in_i[8*(byte_index-i)+:8];
        end
      end
      // ordered_set_c[32*word_index[7:2]+:32] = data_swapped;
    end
    case (curr_state)
      ST_IDLE: begin
        if (data_valid_i) begin
          data_store_c = data_in_i;
          if (curr_data_rate_i < gen3) begin
            idle_valid_c = '1;
            for (int i = 0; i < 4; i++) begin
              if (i < byte_shift) begin
                if (data_k_in_i[i] != '0 || data_in_i[i*8+:8] != '0 ||
                (data_store_r[i*8+:8] != '0)) begin
                  idle_valid_c = '0;
                end
              end
            end
            // if (data_k_in_i == '0 && data_in_i == '0 &&
            // (data_store_r == '0)) begin
            //   idle_valid_c = '1;
            // end
            for (int i = 0; i < 4; i++) begin
              if (i < byte_shift) begin
                if ((data_k_in_i[i]) && data_in_i[i*8+:8] == COM) begin
                  ordered_set_c[31:0] = data_in_i >> 8 * i;
                  next_state = ST_RX_GEN1;
                  axis_pkt_cnt_c = byte_shift - i;
                end else if ((!data_k_in_i[i]) && data_in_i[i*8+:8] == '0) begin
                  // idle_valid_c = '1;
                end
              end
            end
            // if ((data_k_in_i[byte_index]) && data_swapped[byte_index*8+:8] == COM) begin
            //   next_state = ST_RX_GEN1;
            //   axis_pkt_cnt_c = 1'b1;
          end else begin
            if ((sync_header_i == 2'b10)) begin
              if (ordered_set_c[7:0] == GEN3_SKP) begin
                next_state = ST_RX_GEN3_SKP;
                axis_pkt_cnt_c = 1'b1;
              end else begin
                axis_pkt_cnt_c = 1'b1;
                next_state = ST_RX_GEN3;
              end
            end
          end
        end
      end
      ST_RX_IDLE_GEN1: begin
        if (data_valid_i) begin
          axis_pkt_cnt_c = axis_pkt_cnt_r + 1'b1;
          if (data_swapped[7:0] != '0) begin
            next_state = ST_IDLE;
          end
          if (pkt_full) begin
            next_state = ST_IDLE;
            if (data_swapped[7:0] == '0) begin
              next_state   = ST_IDLE;
              idle_valid_c = '1;
            end
          end
        end
      end
      ST_RX_GEN1: begin
        if (data_valid_i) begin
          axis_pkt_cnt_c = axis_pkt_cnt_r + byte_shift;
          if (pkt_full) begin
            check_ordered_set_c = '1;
            ordered_set_out_c   = ordered_set_c;
            axis_pkt_cnt_c      = '0;
            if (data_k_in_i > 1) begin
              axis_pkt_cnt_c = 1'b1;
              data_store_c = data_in_i >> 8;
              next_state = ST_RX_GEN1_OVRFL;
            end else begin
              next_state = ST_IDLE;
            end
          end
          for (int i = 0; i < 4; i++) begin
            if (i < byte_shift) begin
              ordered_set_c[(axis_pkt_cnt_r+i)*8+:8] = data_in_i[8*i+:8];
              if (data_k_in_i[i] && (data_in_i[8*i+:8] == IDL)) begin
                check_ordered_set_c = '0;
                axis_pkt_cnt_c      = '0;
                idle_valid_c        = '1;
                next_state          = ST_IDLE;
              end
              if ((data_k_in_i[i]) && data_in_i[i*8+:8] == COM) begin
                ordered_set_c[7:0] = data_in_i >> 8 * i;
                next_state = ST_RX_GEN1;
                axis_pkt_cnt_c = byte_shift - i;
              end
              // if ((data_k_in_i[i]) && !(data_in_i[i*8+:8] inside {COM, PAD_, IDL})) begin
              //   check_ordered_set_c = '0;
              //   next_state = ST_IDLE;
              // end
            end
          end
        end
      end
      ST_RX_GEN1_OVRFL: begin
        if (data_valid_i) begin
          next_state = ST_RX_GEN1;
          axis_pkt_cnt_c = axis_pkt_cnt_r + byte_shift;
          ordered_set_c[7:0] = data_store_r[7:0];
          for (int i = 0; i < 4; i++) begin
            if (i < byte_shift) begin
              if (data_k_in_i[i] && (data_in_i[8*i+:8] == IDL)) begin
                check_ordered_set_c = '0;
                idle_valid_c        = '1;
                // axis_pkt_cnt_c      = '0;
                next_state          = ST_IDLE;
              end else begin
                ordered_set_c[(axis_pkt_cnt_r+i)*8+:8] = data_in_i[8*i+:8];
              end
            end
          end
        end

      end
      ST_RX_GEN3: begin
        if (data_valid_i) begin
          axis_pkt_cnt_c = axis_pkt_cnt_r + 1'b1;
          if (pkt_full) begin
            check_ordered_set_c = '1;
            ordered_set_out_c   = ordered_set_c;
            axis_pkt_cnt_c      = '0;
            next_state          = ST_IDLE;
          end
        end
      end
      ST_RX_GEN3_SKP: begin
        //This is assuming a byte width of 32... will not work otherwise
        //once the SKP_END symbols is seen capture the three other bytes
        if (data_valid_i) begin
          axis_pkt_cnt_c = axis_pkt_cnt_r + 1'b1;
          if (pkt_full) begin
            axis_pkt_cnt_c = '0;
            next_state     = ST_IDLE;
          end
          if ((data_swapped[7:0] == SKP_END)) begin
            axis_pkt_cnt_c = '0;
            next_state     = ST_IDLE;
          end
          // for (int i = 0; i < 4; i++) begin
          //   if (i < byte_shift) begin
          //     if ((data_swapped[7:0] == SKP_END) && (i == 8'd0)) begin
          //       axis_pkt_cnt_c = '0;
          //       next_state     = ST_IDLE;
          //     end
          //   end
          // end
        end
      end
      default: begin
      end
    endcase
  end

  //this block exists to allow the state machine to return to idle and recieve
  //new packets
  always_comb begin : check_ordered_set
    ts1_valid   = '0;
    ts2_valid   = '0;
    eieos_valid = '0;
    // idle_valid_c = '0;
    // buffered_ordered_set_c = buffered_ordered_set_r;
    if (check_ordered_set_r) begin
      // buffered_ordered_set_c = ordered_set_r;
      ts1_valid   = '1;
      ts2_valid   = '1;
      eieos_valid = '1;
      // idle_valid_c = '1;
      //data rate based checks
      if (curr_data_rate_i < gen3) begin
        if (ordered_set_r[8*7+:8] != TS1) begin
          ts1_valid = '0;
        end
        if (ordered_set_r[8*7+:8] != TS2) begin
          ts2_valid = '0;
        end
        // //check for TS1 or TS2
        // for (int i = 7; i < 9; i++) begin
        //   if (ordered_set_r[8*i+:8] != TS1) begin
        //     ts1_valid = '0;
        //   end
        //   if (ordered_set_r[8*i+:8] != TS2) begin
        //     ts2_valid = '0;
        //   end
        // end
        if (curr_data_rate_i == gen1) begin
          //check for IDL
          if (ordered_set_r[23:8] != {IDL, IDL}) begin
            // idle_valid_c = '0;
          end
          // for (int i = 1; i < 4; i++) begin
          //   if (ordered_set_r[8*i+:8] != IDL) begin
          //     idle_valid_c = '0;
          //   end
          // end
        end
        if (curr_data_rate_i == gen2) begin
          //check for gen 2 eios
          if (ordered_set_r[15:0] != {EIOS, EIOS}) begin
            // idle_valid_c = '0;
          end
          // for (int i = 0; i < 4; i++) begin
          //   if (ordered_set_r[8*i+:8] != EIOS) begin
          //     idle_valid_c = '0;
          //   end
          // end
        end
        //check for eieos gen 1
        for (int i = 1; i < 4; i++) begin
          if (ordered_set_r[8*i+:8] != EIE) begin
            eieos_valid = '0;
          end
        end
      end else begin
        //check for TS1 or TS2
        if (ordered_set_r[7:0] != TS1OS) begin
          ts1_valid = '0;
        end
        if (ordered_set_r[7:0] != TS2OS) begin
          ts2_valid = '0;
        end
        // for (int i = 7; i < 9; i++) begin
        //   if (ordered_set_r[8*i+:8] != TS1) begin
        //     ts1_valid = '0;
        //   end
        //   if (ordered_set_r[8*i+:8] != TS2) begin
        //     ts2_valid = '0;
        //   end
        // end
        //check for gen3 eieos
        if (ordered_set_r[31:0] != 32'h00FF00FF) begin
          eieos_valid = '0;
        end
        // for (logic [7:0] i = 1; i < 4; i++) begin
        //   if (i[0]) begin
        //     if (ordered_set_r[8*i+:8] != 8'hFF) begin
        //       eieos_valid = '0;
        //     end
        //   end else begin
        //     if (ordered_set_r[8*i+:8] != 8'h00) begin
        //       eieos_valid = '0;
        //     end
        //   end
        // end
      end
    end
  end
endmodule
