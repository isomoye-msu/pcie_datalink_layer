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
    input logic               clk_i,             // Clock signal
    input logic               rst_i,             // Reset signal
    input logic        [ 1:0] sync_header_i,
    input rate_speed_e        curr_data_rate_i,
    input logic        [31:0] data_in_i,
    input logic               data_valid_i,
    input logic        [ 3:0] data_k_in_i,
    input logic        [ 5:0] pipe_width_i,

    output logic              [7:0] link_num_o,
    output logic              [7:0] lane_num_o,
    output logic              [7:0] nfts_o,
    output ts_symbol6_union_t       symbol6_o,
    output training_ctrl_t          training_ctrl_o,
    output rate_id_t                rate_id_o,
    output logic                    idle_valid_o,
    output logic                    ts1_valid_o,
    output logic                    ts2_valid_o,
    output logic                    eieos_valid_o


);


  typedef enum logic [7:0] {
    ST_IDLE,
    ST_RX_GEN1,
    ST_RX_GEN3,
    ST_RX_GEN3_SKP,
    ST_RX_GEN3_SKP_LAST,
    ST_RX_FULL_GEN1,
    ST_SEND
  } os_decode_state_e;


  os_decode_state_e        curr_state;
  os_decode_state_e        next_state;

  logic              [7:0] axis_pkt_cnt_c;
  logic              [7:0] axis_pkt_cnt_r;

  pcie_ordered_set_t       ordered_set_c;
  pcie_ordered_set_t       ordered_set_r;

  logic                    check_ordered_set_c;
  logic                    check_ordered_set_r;

  pcie_ordered_set_t       buffered_ordered_set_c;
  pcie_ordered_set_t       buffered_ordered_set_r;

  logic                    idle_valid_c;
  logic                    ts1_valid;
  logic                    ts2_valid;
  logic                    eieos_valid;


  logic              [7:0] skp0_c;
  logic              [7:0] skp0_r;
  logic              [7:0] skp1_c;
  logic              [7:0] skp1_r;
  logic              [7:0] skp2_c;
  logic              [7:0] skp2_r;
  logic              [7:0] skp3_c;
  logic              [7:0] skp3_r;
  //! internal_axis_signals
  //   logic              [DATA_WIDTH-1:0] ltssm_axis_tdata;
  //   logic              [KEEP_WIDTH-1:0] ltssm_axis_tkeep;
  //   logic                               ltssm_axis_tvalid;
  //   logic                               ltssm_axis_tlast;
  //   logic              [USER_WIDTH-1:0] ltssm_axis_tuser;
  //   logic                               ltssm_axis_tready;
  pcie_tsos_t              training_set;
  assign training_set    = buffered_ordered_set_r;

  assign link_num_o      = training_set.link_num;
  assign lane_num_o      = training_set.lane_num;
  assign nfts_o          = training_set.n_fts;
  assign training_ctrl_o = training_set.train_ctrl;
  assign rate_id_o       = training_set.rate_id;
  assign symbol6_o       = training_set.ts_s6;


  logic [7:0] byte_index;



  //! main sequential block
  always_ff @(posedge clk_i) begin : main_seq
    if (rst_i) begin
      curr_state <= ST_IDLE;
      check_ordered_set_r <= '0;
      idle_valid_o <= '0;
      ts1_valid_o <= '0;
      ts2_valid_o <= '0;
      eieos_valid_o <= '0;
    end else begin
      curr_state <= next_state;
      check_ordered_set_r <= check_ordered_set_c;
    end
    //non-resetable
    ordered_set_r          <= ordered_set_c;
    idle_valid_o           <= idle_valid_c;
    ts1_valid_o            <= ts1_valid;
    ts2_valid_o            <= ts2_valid;
    eieos_valid_o          <= eieos_valid;
    axis_pkt_cnt_r         <= axis_pkt_cnt_c;
    buffered_ordered_set_r <= buffered_ordered_set_c;
    skp0_r                 <= skp0_c;
    skp1_r                 <= skp1_c;
    skp2_r                 <= skp2_c;
    skp3_r                 <= skp3_c;
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
    byte_index          = ((pipe_width_i >> 3) - 1'b1);
    case (curr_state)
      ST_IDLE: begin
        if (data_valid_i) begin
          if (curr_data_rate_i < gen3) begin
            if ((data_k_in_i[byte_index]) && data_in_i[(8*byte_index)+:8] inside {COM}) begin
              next_state = ST_RX_GEN1;
              axis_pkt_cnt_c = 1'b1;
              for (int i = 0; i < 4; i++) begin
                if (i < byte_index + 1) begin
                  ordered_set_c[8*i+:8] = data_in_i[8*(byte_index-i)+:8];
                end
              end
            end
          end else begin
            if ((sync_header_i == 2'b10)) begin
              for (int i = 0; i < 4; i++) begin
                if (i < byte_index + 1) begin
                  ordered_set_c[8*i+:8] = data_in_i[8*(byte_index-i)+:8];
                end
              end
              if (data_in_i[(8*byte_index)+:8] == GEN3_SKP) begin
                next_state = ST_RX_GEN3_SKP;
                axis_pkt_cnt_c = 1'b1;
              end
              if (data_in_i[(8*byte_index)+:8] inside {TS1OS, TS2OS, EIOS, EIEOS}) begin
                axis_pkt_cnt_c = 1'b1;
                next_state = ST_RX_GEN3;
              end
            end
          end
        end
      end
      ST_RX_GEN1: begin
        if (data_valid_i) begin
          axis_pkt_cnt_c = axis_pkt_cnt_r + 1'b1;
          for (int i = 0; i < 4; i++) begin
            if (i < byte_index + 1) begin
              ordered_set_c[(8*i) + (axis_pkt_cnt_r*pipe_width_i)+:8] =
                 data_in_i[8*(byte_index-i)+:8];
            end
          end
          if (pipe_width_i == 8'd16) begin
            if ((data_k_in_i[1]) && data_in_i[(8*1)+:8] inside {IDL}
            || (data_k_in_i[0]) && data_in_i[(8*0)+:8] inside {IDL}) begin
              idle_valid_c   = '1;
              axis_pkt_cnt_c = '0;
              next_state     = ST_IDLE;
            end else begin
              next_state = ST_RX_FULL_GEN1;
            end
          end else begin
            if (axis_pkt_cnt_r >= 8'd3) begin
              if ((data_k_in_i[0]) && data_in_i[(8*0)+:8] == IDL
              && ordered_set_r[8*1 +:8]  == IDL && ordered_set_r[8*2 +:8]  == IDL) begin
                idle_valid_c   = '1;
                axis_pkt_cnt_c = '0;
                next_state     = ST_IDLE;
              end else begin
                next_state = ST_RX_FULL_GEN1;
              end
            end
          end
        end
      end
      ST_RX_FULL_GEN1: begin
        if (data_valid_i) begin
          axis_pkt_cnt_c = axis_pkt_cnt_r + 1'b1;
          for (int i = 0; i < 4; i++) begin
            if (i < byte_index + 1) begin
              ordered_set_c[(8*i) + (axis_pkt_cnt_r*pipe_width_i)+:8] =
                 data_in_i[8*(byte_index-i)+:8];
            end
          end
          if (pipe_width_i == 8'd16 && axis_pkt_cnt_r >= 8'd7) begin
            check_ordered_set_c = '1;
            axis_pkt_cnt_c      = '0;
            next_state          = ST_IDLE;
          end else begin
            if (axis_pkt_cnt_r >= 8'd15) begin
              check_ordered_set_c = '1;
              axis_pkt_cnt_c      = '0;
              next_state          = ST_IDLE;
            end
          end
        end
      end
      ST_RX_GEN3: begin
        if (data_valid_i) begin
          axis_pkt_cnt_c = axis_pkt_cnt_r + 1'b1;
          for (int i = 0; i < 4; i++) begin
            if (i < byte_index + 1) begin
              ordered_set_c[(8*i) + (axis_pkt_cnt_r*pipe_width_i)+:8] =
                 data_in_i[8*(byte_index-i)+:8];
            end
          end
          if (pipe_width_i == 8'd32 && axis_pkt_cnt_r >= 8'd3) begin
            check_ordered_set_c = '1;
            axis_pkt_cnt_c      = '0;
            next_state          = ST_IDLE;
          end else if (pipe_width_i == 8'd16 && axis_pkt_cnt_r >= 8'd7) begin
            check_ordered_set_c = '1;
            axis_pkt_cnt_c      = '0;
            next_state          = ST_IDLE;
          end else begin
            if (axis_pkt_cnt_r >= 8'd15) begin
              //bad tlp
              check_ordered_set_c = '1;
              axis_pkt_cnt_c      = '0;
              next_state          = ST_IDLE;
            end
          end
        end
      end
      ST_RX_GEN3_SKP: begin
        if (data_valid_i) begin
          axis_pkt_cnt_c = axis_pkt_cnt_r + 1'b1;
          for (int i = 0; i < 4; i++) begin
            if (i < byte_index + 1) begin
              ordered_set_c[(8*i) + (axis_pkt_cnt_r*pipe_width_i)+:8] =
                 data_in_i[8*(byte_index-i)+:8];
              if ((data_in_i[8*(byte_index-i)+:8] == SKP_END) && ((byte_index - i) == 8'd0)) begin
                skp0_c         = data_in_i[8*(byte_index-2)+:8];
                skp1_c         = data_in_i[8*(byte_index-1)+:8];
                skp2_c         = data_in_i[8*(byte_index-0)+:8];
                axis_pkt_cnt_c = '0;
                next_state     = ST_IDLE;
              end
            end
          end
        end
      end
      default: begin
      end
    endcase
  end

  //this block exists to allow the state machine to return to idle and recieve
  //new packets
  always_comb begin : check_ordered_set
    ts1_valid              = '0;
    ts2_valid              = '0;
    eieos_valid            = '0;
    buffered_ordered_set_c = buffered_ordered_set_r;
    if (check_ordered_set_r) begin
      buffered_ordered_set_c = ordered_set_r;
      ts1_valid              = '1;
      ts2_valid              = '1;
      eieos_valid            = '1;
      for (int i = 7; i < 15; i++) begin
        if (buffered_ordered_set_c[8*i+:8] != TS1) begin
          ts1_valid = '0;
        end
        if (buffered_ordered_set_c[8*i+:8] != TS2) begin
          ts2_valid &= '0;
        end
      end
      for (int i = 1; i < 15; i++) begin
        if (buffered_ordered_set_c[8*i+:8] != EIE || buffered_ordered_set_c[8*15+:8] != TS1) begin
          eieos_valid = '0;
        end
      end
    end
  end

  //   //axi-stream output register instance
  //   axis_register #(
  //       .DATA_WIDTH(DATA_WIDTH),
  //       .KEEP_ENABLE('1),
  //       .KEEP_WIDTH(KEEP_WIDTH),
  //       .LAST_ENABLE('1),
  //       .ID_ENABLE('0),
  //       .ID_WIDTH(1),
  //       .DEST_ENABLE('0),
  //       .DEST_WIDTH(1),
  //       .USER_ENABLE('1),
  //       .USER_WIDTH(USER_WIDTH),
  //       .REG_TYPE(SkidBuffer)
  //   ) axis_register_inst (
  //       .clk(clk_i),
  //       .rst(rst_i),
  //       .s_axis_tdata(ltssm_axis_tdata),
  //       .s_axis_tkeep(ltssm_axis_tkeep),
  //       .s_axis_tvalid(ltssm_axis_tvalid),
  //       .s_axis_tready(ltssm_axis_tready),
  //       .s_axis_tlast(ltssm_axis_tlast),
  //       .s_axis_tuser(ltssm_axis_tuser),
  //       .s_axis_tid('0),
  //       .s_axis_tdest('0),
  //       .m_axis_tdata(m_axis_tdata),
  //       .m_axis_tkeep(m_axis_tkeep),
  //       .m_axis_tvalid(m_axis_tvalid),
  //       .m_axis_tready(m_axis_tready),
  //       .m_axis_tlast(m_axis_tlast),
  //       .m_axis_tuser(m_axis_tuser),
  //       .m_axis_tid(),
  //       .m_axis_tdest()
  //   );

  // assign os_sent_o = os_sent_r;



endmodule
