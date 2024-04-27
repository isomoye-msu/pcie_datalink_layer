module os_generator
  import pcie_phy_pkg::*;
#(
    parameter int CLK_RATE      = 100,             //!Clock speed in MHz, Defualt is 100
    parameter int MAX_NUM_LANES = 4,               //! Maximum number of lanes module can support
    // TLP data width
    parameter int DATA_WIDTH    = 32,              //! AXIS data width
    // TLP keep width
    parameter int KEEP_WIDTH    = DATA_WIDTH / 8,
    parameter int USER_WIDTH    = 4
    // parameter int LINK_NUM      = 0,
    // parameter int IS_UPSTREAM   = 0,                  //downstream by default
    // parameter int CROSSLINK_EN  = 0,                  //crosslink not supported
    // parameter int UPCONFIG_EN   = 0                   //upconfig not supported
) (
    //clocks and resets
    input  logic                                               clk_i,             // Clock signal
    input  logic                                               rst_i,             // Reset signal
    //gen os control signals
    input  gen_os_struct_t                                     gen_os_ctrl_i,
    input  rate_speed_e                                        curr_data_rate_i,
    input  logic                                               send_ltssm_os_i,
    output logic                                               os_sent_o,
    input  pcie_ordered_set_t                                  ordered_set_i,
    input  presets_coeff_t    [             MAX_NUM_LANES-1:0] preset_i,
    //! @virtualbus master_axis_bus @dir out
    output logic              [(DATA_WIDTH*MAX_NUM_LANES)-1:0] m_axis_tdata,
    output logic              [(KEEP_WIDTH*MAX_NUM_LANES)-1:0] m_axis_tkeep,
    output logic                                               m_axis_tvalid,
    output logic                                               m_axis_tlast,
    output logic              [(USER_WIDTH*MAX_NUM_LANES)-1:0] m_axis_tuser,
    input  logic                                               m_axis_tready
    //! @end

);

  typedef enum logic [7:0] {
    ST_IDLE,
    ST_BUILD,
    ST_SEND
  } os_gen_state_e;


  os_gen_state_e                                  curr_state;
  os_gen_state_e                                  next_state;

  logic          [                           7:0] axis_pkt_cnt_c;
  logic          [                           7:0] axis_pkt_cnt_r;

  logic          [                           7:0] os_pkt_cnt_c;
  logic          [                           7:0] os_pkt_cnt_r;

  logic          [(USER_WIDTH*MAX_NUM_LANES)-1:0] special_k_c;
  logic          [(USER_WIDTH*MAX_NUM_LANES)-1:0] special_k_r;

  pcie_tsos_t    [             MAX_NUM_LANES-1:0] ordered_set_c;
  pcie_tsos_t    [             MAX_NUM_LANES-1:0] ordered_set_r;
  //! internal_axis_signals
  logic          [(DATA_WIDTH*MAX_NUM_LANES)-1:0] ltssm_axis_tdata;
  logic          [(KEEP_WIDTH*MAX_NUM_LANES)-1:0] ltssm_axis_tkeep;
  logic                                           ltssm_axis_tvalid;
  logic                                           ltssm_axis_tlast;
  logic          [(USER_WIDTH*MAX_NUM_LANES)-1:0] ltssm_axis_tuser;
  logic                                           ltssm_axis_tready;
  logic                                           os_sent_c;


  // pcie_tsos_t        [             MAX_NUM_LANES-1:0] ordered_set_i;


  //! main sequential block
  always_ff @(posedge clk_i) begin : main_seq
    if (rst_i) begin
      curr_state <= ST_IDLE;
    end else begin
      curr_state <= next_state;
    end
    //non-resetable
    ordered_set_r  <= ordered_set_c;
    os_sent_o      <= os_sent_c;
    axis_pkt_cnt_r <= axis_pkt_cnt_c;
    os_pkt_cnt_r   <= os_pkt_cnt_c;
    special_k_r    <= special_k_c;
  end


  always_comb begin : send_ordered_set
    pcie_tsos_t temp_os;
    axis_pkt_cnt_c    = axis_pkt_cnt_r;
    os_pkt_cnt_c      = os_pkt_cnt_r;
    //axis signals
    ltssm_axis_tdata  = '0;
    ltssm_axis_tkeep  = '0;
    ltssm_axis_tvalid = '0;
    ltssm_axis_tlast  = '0;
    ltssm_axis_tuser  = '0;
    // ordered_set_tx_in_process_c = ordered_set_tx_in_process_r;
    next_state        = curr_state;
    //ordered set
    ordered_set_c     = ordered_set_r;
    os_sent_c         = '0;
    temp_os           = ordered_set_r;
    special_k_c       = special_k_r;
    case (curr_state)
      ST_IDLE: begin
        if (gen_os_ctrl_i.valid) begin
          for (int i = 0; i < MAX_NUM_LANES; i++) begin
            ordered_set_c[i] = ordered_set_i;
          end
          // ordered_set_c = ordered_set_i;
          axis_pkt_cnt_c = '0;
          next_state    = ST_BUILD;
        end
      end
      ST_BUILD: begin
        os_pkt_cnt_c   = 32'd3;
        special_k_c    = '0;
        special_k_c[0] = '1;
        axis_pkt_cnt_c = '0;
        if ((gen_os_ctrl_i.gen_ts1 || gen_os_ctrl_i.gen_ts2)) begin
          for (int i = 0; i < MAX_NUM_LANES; i++) begin
            if (gen_os_ctrl_i.set_lane) begin
              ordered_set_c[i].lane_num = i;
            end
            if (ordered_set_r[i].ts_s6.ts1.ec != '0) begin
              ordered_set_c[i].ts_s6.ts1.trans_preset =
              preset_i[i].lane_equal_reg.downstream_tx_preset;
            end
          end
        end

        if (gen_os_ctrl_i.gen_idle) begin
          special_k_c  = '1;
          os_pkt_cnt_c = 32'd1;
        end
        next_state = ST_SEND;
      end
      ST_SEND: begin
        //packet accepted or empty
        if (ltssm_axis_tready) begin
          //increment packet count
          axis_pkt_cnt_c = axis_pkt_cnt_r + 1;
          //build axis packet
          for (int i = 0; i < MAX_NUM_LANES; i++) begin
            ltssm_axis_tdata[32*i+:32] = ordered_set_r[i][32*axis_pkt_cnt_r+:32];
          end
          ltssm_axis_tuser  = special_k_r[USER_WIDTH*axis_pkt_cnt_r+:USER_WIDTH];
          ltssm_axis_tkeep  = '1;
          ltssm_axis_tvalid = '1;
          ltssm_axis_tlast  = '0;
          if (axis_pkt_cnt_r >= os_pkt_cnt_r) begin
            next_state       = ST_IDLE;
            //assert last
            ltssm_axis_tlast = '1;
            os_sent_c        = '1;
            axis_pkt_cnt_c   = '0;
          end

        end
      end
      default: begin
      end
    endcase

  end


  //axi-stream output register instance
  axis_register #(
      .DATA_WIDTH(DATA_WIDTH * MAX_NUM_LANES),
      .KEEP_ENABLE('1),
      .KEEP_WIDTH(KEEP_WIDTH * MAX_NUM_LANES),
      .LAST_ENABLE('1),
      .ID_ENABLE('0),
      .ID_WIDTH(1),
      .DEST_ENABLE('0),
      .DEST_WIDTH(1),
      .USER_ENABLE('1),
      .USER_WIDTH(USER_WIDTH * MAX_NUM_LANES),
      .REG_TYPE(SkidBuffer)
  ) axis_register_inst (
      .clk(clk_i),
      .rst(rst_i),
      .s_axis_tdata(ltssm_axis_tdata),
      .s_axis_tkeep(ltssm_axis_tkeep),
      .s_axis_tvalid(ltssm_axis_tvalid),
      .s_axis_tready(ltssm_axis_tready),
      .s_axis_tlast(ltssm_axis_tlast),
      .s_axis_tuser(ltssm_axis_tuser),
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

  // assign os_sent_o = os_sent_r;



endmodule
