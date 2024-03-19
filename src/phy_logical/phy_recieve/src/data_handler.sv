module data_handler
  import pcie_phy_pkg::*;
#(
    // TLP data width
    parameter int DATA_WIDTH    = 32,
    // TLP strobe width
    parameter int STRB_WIDTH    = DATA_WIDTH / 8,
    parameter int KEEP_WIDTH    = STRB_WIDTH,
    parameter int USER_WIDTH    = 1,
    parameter int MAX_NUM_LANES = 4
) (
    //clocks and resets
    input  logic clk_i,             // Clock signal
    input  logic rst_i,             // Reset signal
    input  logic phy_link_up_i,
    input  logic phy_fifo_empty_i,
    output logic phy_fifo_rd_en_o,
    //Dllp AXIS inputs
    //! @virtualbus master_axis_bus @dir out
    // output logic [             31:0] os_data_out_o   [MAX_NUM_LANES],
    // output logic [MAX_NUM_LANES-1:0] os_data_valid_o,
    // output logic [              3:0] os_d_k_out_o    [MAX_NUM_LANES],
    // output logic [              1:0] os_sync_header_o[MAX_NUM_LANES],

    // output logic [             31:0] tlp_dllp_data_out_o   [MAX_NUM_LANES],
    // output logic [MAX_NUM_LANES-1:0] tlp_dllp_data_valid_o,
    // output logic [              3:0] tlp_dllp_d_k_out_o    [MAX_NUM_LANES],
    // output logic [              1:0] tlp_dllp_sync_header_o[MAX_NUM_LANES],

    input logic        lane_reverse_i,
    input rate_speed_e curr_data_rate_i,

    input logic [( MAX_NUM_LANES* DATA_WIDTH)-1:0] data_i,
    input logic [               MAX_NUM_LANES-1:0] data_valid_i,
    input logic [           (4*MAX_NUM_LANES)-1:0] data_k_i,
    input logic [           (2*MAX_NUM_LANES)-1:0] sync_header_i,

    //Dllp AXIS inputs
    output logic [DATA_WIDTH-1:0] m_dllp_axis_tdata,
    output logic [KEEP_WIDTH-1:0] m_dllp_axis_tkeep,
    output logic                  m_dllp_axis_tvalid,
    output logic                  m_dllp_axis_tlast,
    output logic [USER_WIDTH-1:0] m_dllp_axis_tuser,
    input  logic                  m_dllp_axis_tready,

    //physical layer ordered sets AXIS inputs
    output logic [DATA_WIDTH-1:0] m_tlp_axis_tdata,
    output logic [KEEP_WIDTH-1:0] m_tlp_axis_tkeep,
    output logic                  m_tlp_axis_tvalid,
    output logic                  m_tlp_axis_tlast,
    output logic [USER_WIDTH-1:0] m_tlp_axis_tuser,
    input  logic                  m_tlp_axis_tready,


    input logic [5:0] pipe_width_i,
    input logic [5:0] num_active_lanes_i
);


  localparam int PipeWidthGen1 = 8;
  localparam int PipeWidthGen2 = 16;
  localparam int PipeWidthGen3 = 16;
  localparam int PipeWidthGen4 = 32;
  localparam int PipeWidthGen5 = 32;
  localparam int BytesPerTransfer = DATA_WIDTH / 8;
  localparam int MaxWordsPerTransaction = 512 / DATA_WIDTH;

  //data_handler mechanism enum
  typedef enum logic [4:0] {
    ST_IDLE,
    ST_TX,
    ST_CHECK_FRAME,
    ST_CHECK_END,
    ST_TX_TLP,
    ST_TX_DLLP
  } data_handler_state_e;


  data_handler_state_e                                    curr_state;
  data_handler_state_e                                    next_state;

  //axis signals
  logic                [                  DATA_WIDTH-1:0] data_handler_axis_tdata;
  logic                [                  KEEP_WIDTH-1:0] data_handler_axis_tkeep;
  logic                                                   data_handler_axis_tvalid;
  logic                                                   data_handler_axis_tlast;
  logic                [                  USER_WIDTH-1:0] data_handler_axis_tuser;
  logic                                                   data_handler_axis_tready;


  logic                [                  DATA_WIDTH-1:0] m_axis_tdata;
  logic                [                  KEEP_WIDTH-1:0] m_axis_tkeep;
  logic                                                   m_axis_tvalid;
  logic                                                   m_axis_tlast;
  logic                [                  USER_WIDTH-1:0] m_axis_tuser;
  logic                                                   m_axis_tready;

  logic                [( MAX_NUM_LANES* DATA_WIDTH)-1:0] data_c;
  logic                [( MAX_NUM_LANES* DATA_WIDTH)-1:0] data_r;
  logic                [               MAX_NUM_LANES-1:0] data_valid_c;
  logic                [               MAX_NUM_LANES-1:0] data_valid_r;
  logic                [           (4*MAX_NUM_LANES)-1:0] data_k_c;
  logic                [           (4*MAX_NUM_LANES)-1:0] data_k_r;
  logic                [           (2*MAX_NUM_LANES)-1:0] sync_header_c;
  logic                [           (2*MAX_NUM_LANES)-1:0] sync_header_r;



  logic                [                             5:0] word_count_c;
  logic                [                             5:0] word_count_r;

  logic                                                   is_dllp_c;
  logic                                                   is_dllp_r;
  logic                                                   is_tlp_c;
  logic                                                   is_tlp_r;
  logic                                                   skid_c;
  logic                                                   skid_r;
  logic                                                   ready_out;

  // logic                [                             1:0] sync_header_c            [MAX_NUM_LANES];
  // logic                [                             1:0] sync_header_r            [MAX_NUM_LANES];

  logic                                                   fifo_rd;

  always_ff @(posedge clk_i) begin : main_seq_block
    if (rst_i) begin
      curr_state <= ST_IDLE;
    end else begin
      curr_state <= next_state;
    end
    data_valid_r  <= data_valid_c;
    sync_header_r <= sync_header_c;
    data_k_r      <= data_k_c;
    data_r        <= data_c;
    is_tlp_r      <= is_tlp_c;
    is_dllp_r     <= is_dllp_c;
    word_count_r  <= word_count_c;
    skid_r        <= skid_c;
  end

  always_comb begin : lane_data_sync

    data_handler_axis_tdata  = '0;
    data_handler_axis_tkeep  = '0;
    data_handler_axis_tvalid = '0;
    data_handler_axis_tlast  = '0;
    data_handler_axis_tuser  = '0;


    // d_k_out_c                = d_k_out_r;
    // data_k_in_c              = data_k_in_r;
    // data_valid_c             = data_valid_r;
    // data_in_c                = data_in_r;
    is_tlp_c                 = is_tlp_r;
    is_dllp_c                = is_dllp_r;
    // pkt_count_c              = pkt_count_r;
    word_count_c             = word_count_r;
    next_state               = curr_state;
    data_valid_c             = data_valid_r;
    sync_header_c            = sync_header_r;
    data_k_c                 = data_k_r;
    data_c                   = data_r;
    // word_replacement_index_c = word_replacement_index_r;
    // replace_lane_c           = replace_lane_r;
    // ready_out                = '0;
    // complete_c               = complete_r;
    // data_out                 = '0;
    // lane_idx                 = '0;
    // data_k_out               = '0;
    phy_fifo_rd_en_o         = '0;
    skid_c                   = skid_r;
    case (curr_state)
      ST_IDLE: begin
        if (phy_link_up_i && !phy_fifo_empty_i) begin
          phy_fifo_rd_en_o = '1;
          next_state = ST_CHECK_FRAME;
          skid_c = '0;
        end
      end
      ST_CHECK_FRAME: begin
        if (curr_data_rate_i < gen3) begin
          data_c        = data_i >> 8;
          data_valid_c  = data_valid_i >> 1;
          data_k_c      = data_k_i >> 1;
          sync_header_c = sync_header_r;
          word_count_c  = '0;
          next_state    = ST_TX;
          if (data_i[7:0] == SDP) begin
            is_tlp_c = '1;
          end
          if (data_i[7:0] == STP) begin
            is_tlp_c = '1;
          end
        end
      end
      ST_TX: begin
        if (m_axis_tready) begin
          word_count_c             = word_count_r + 1'b1;
          data_c                   = data_r >> 32;
          data_valid_c             = data_valid_r >> 1;
          data_k_c                 = data_k_r >> 4;
          data_handler_axis_tdata  = data_r[31:0];
          data_handler_axis_tkeep  = '1;
          data_handler_axis_tvalid = '1;
          if (skid_r) begin
            data_handler_axis_tdata  = data_r[31:0];
            data_handler_axis_tkeep  = '1;
            data_handler_axis_tvalid = '1;
            data_c                   = data_i;
            data_valid_c             = data_valid_i;
            data_k_c                 = data_k_i;
            skid_c                   = '0;
          end
          if (word_count_r >= (512 / 32) - 1) begin
            next_state               = ST_CHECK_END;
            data_c                   = data_r;
            data_valid_c             = data_valid_r;
            data_k_c                 = data_k_r;
            data_handler_axis_tvalid = '0;
          end
          for (int i = 0; i < 4; i++) begin
            if (data_k_r[i] && data_r[8*i+:8] == ENDP) begin
              next_state = ST_IDLE;
              for (int k = '0; k < 4; k++) begin
                if (k >= i) begin
                  data_handler_axis_tkeep[k] = '0;
                  is_dllp_c                  = '0;
                  is_tlp_c                   = '0;
                end
              end
            end
          end
        end
      end
      ST_CHECK_END: begin
        if (!phy_fifo_empty_i) begin
          phy_fifo_rd_en_o = '1;
          skid_c           = '1;
          word_count_c     = '0;
          next_state       = ST_TX;
        end
      end
      ST_TX_TLP: begin
      end
      ST_TX_DLLP: begin
      end
      default: begin
      end
    endcase
  end



  //output register for axis fifo
  axis_register #(
      .DATA_WIDTH(DATA_WIDTH),
      .KEEP_ENABLE('1),
      .KEEP_WIDTH(KEEP_WIDTH),
      .LAST_ENABLE('1),
      .ID_ENABLE('0),
      .ID_WIDTH(1),
      .DEST_ENABLE('0),
      .DEST_WIDTH(1),
      .USER_ENABLE('1),
      .USER_WIDTH(USER_WIDTH),
      .REG_TYPE(SkidBuffer)
  ) axis_register_inst (
      .clk(clk_i),
      .rst(rst_i),
      .s_axis_tdata(data_handler_axis_tdata),
      .s_axis_tkeep(data_handler_axis_tkeep),
      .s_axis_tvalid(data_handler_axis_tvalid),
      .s_axis_tready(data_handler_axis_tready),
      .s_axis_tlast(data_handler_axis_tlast),
      .s_axis_tuser(data_handler_axis_tuser),
      .s_axis_tid('0),
      .s_axis_tdest('0),
      .m_axis_tdata(m_axis_tdata),
      .m_axis_tkeep(m_axis_tkeep),
      .m_axis_tvalid(m_axis_tvalid),
      .m_axis_tready(m_axis_tready),
      .m_axis_tlast(m_axis_tlast),
      .m_axis_tuser(m_axis_tuser),
      .m_axis_tid(),
      .m_axis_tdest()
  );


  assign m_dllp_axis_tdata = m_axis_tdata;
  assign m_dllp_axis_tkeep = m_axis_tkeep;
  assign m_dllp_axis_tvalid = m_axis_tvalid & is_dllp_r;
  assign m_dllp_axis_tlast = m_axis_tlast;
  assign m_dllp_axis_tuser = m_axis_tuser;
  assign m_axis_tready = (m_dllp_axis_tready & is_dllp_r) | (m_tlp_axis_tready & is_tlp_r);

  assign m_tlp_axis_tdata = m_axis_tdata;
  assign m_tlp_axis_tkeep = m_axis_tkeep;
  assign m_tlp_axis_tvalid = m_axis_tvalid & is_tlp_r;
  assign m_tlp_axis_tlast = m_axis_tlast;
  assign m_tlp_axis_tuser = m_axis_tuser;



  //   assign sync_header_o      = sync_header_r;
  //   assign s_dllp_axis_tready = ready_out & is_tlp_r;
  //   assign s_phy_axis_tready  = ready_out & is_dllp_r;
  //   assign data_valid_o       = data_valid_r;
  //   assign d_k_out_o          = d_k_out_r;
  //   assign data_out_o         = data_out_r;
  //   assign pipe_width_o       = pipe_width_r;

endmodule
