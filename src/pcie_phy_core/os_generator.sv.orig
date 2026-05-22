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
    input  logic                                               link_up_i,
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
    ST_SEND,
    ST_SKP
  } os_gen_state_e;


  // os_gen_state_e                                  curr_state;
  // os_gen_state_e                                  D.state;

  // logic          [                           7:0] D.axis_pkt_cnt;
  // logic          [                           7:0] Q.axis_pkt_cnt;

  // logic          [                           7:0] os_pkt_cnt_c;
  // logic          [                           7:0] Q.os_pkt_cnt;

  // logic          [(USER_WIDTH*8)-1:0] D.special_k;
  // logic          [(USER_WIDTH*8)-1:0] Q.special_k;

  // pcie_tsos_t    [             MAX_NUM_LANES-1:0] D.ordered_set;
  // pcie_tsos_t    [             MAX_NUM_LANES-1:0] Q.ordered_set;
  //! internal_axis_signals
  logic [(DATA_WIDTH*MAX_NUM_LANES)-1:0] ltssm_axis_tdata;
  logic [(KEEP_WIDTH*MAX_NUM_LANES)-1:0] ltssm_axis_tkeep;
  logic                                  ltssm_axis_tvalid;
  logic                                  ltssm_axis_tlast;
  logic [(USER_WIDTH*MAX_NUM_LANES)-1:0] ltssm_axis_tuser;
  logic                                  ltssm_axis_tready;
  // logic                                           D.os_sent;


  typedef struct {
    os_gen_state_e                  state;
    logic [7:0]                     axis_pkt_cnt;
    logic [7:0]                     os_pkt_cnt;
    logic [(USER_WIDTH*8)-1:0]      special_k;
    pcie_tsos_t [MAX_NUM_LANES-1:0] ordered_set;
    pcie_tsos_t                     temp_ordered_set;
    logic                           os_sent;
    logic [31:0]                    skp_cnt;
    gen_os_struct_t                 gen_os_ctrl;

  } os_gen_t;

  os_gen_t Q, D;

  // pcie_tsos_t        [             MAX_NUM_LANES-1:0] ordered_set_i;


  //! main sequential block
  always_ff @(posedge clk_i) begin : main_seq
    if (rst_i) begin
      Q <= '{
          state: ST_IDLE,
          ordered_set: pcie_tsos_t'('0),
          temp_ordered_set: pcie_tsos_t'('0),
          gen_os_ctrl: gen_os_struct_t'(00),
          default: 'd0
      };
      // curr_state     <= ST_IDLE;
      // Q.ordered_set  <= '0;
      // os_sent_o      <= '0;
      // Q.axis_pkt_cnt <= '0;
      // Q.os_pkt_cnt   <= '0;
      // Q.special_k    <= '0;
    end else begin
      Q <= D;
      // curr_state     <= D.state;
      // Q.ordered_set  <= D.ordered_set;
      // os_sent_o      <= D.os_sent;
      // Q.axis_pkt_cnt <= D.axis_pkt_cnt;
      // Q.os_pkt_cnt   <= os_pkt_cnt_c;
      // Q.special_k    <= D.special_k;
    end
    //non-resetable
  end

  assign os_sent_o = D.os_sent;

  always_comb begin : send_ordered_set
    pcie_tsos_t temp_os;
    D                 = Q;
    // D.axis_pkt_cnt    = Q.axis_pkt_cnt;
    // os_pkt_cnt_c      = Q.os_pkt_cnt;
    //axis signals
    ltssm_axis_tdata  = '0;
    ltssm_axis_tkeep  = '0;
    ltssm_axis_tvalid = '0;
    ltssm_axis_tlast  = '0;
    ltssm_axis_tuser  = '0;
    // ordered_set_tx_in_process_c = ordered_set_tx_in_process_r;
    // D.state        = curr_state;
    //ordered set
    // D.ordered_set     = Q.ordered_set;
    D.os_sent         = '0;
    temp_os           = Q.ordered_set;


    if (link_up_i) begin
      D.skp_cnt = Q.skp_cnt + 1;
    end


    // D.special_k       = Q.special_k;
    case (Q.state)
      ST_IDLE: begin
        if (gen_os_ctrl_i.valid) begin
          D.skp_cnt = '0;
          for (int i = 0; i < MAX_NUM_LANES; i++) begin
            D.ordered_set[i] = ordered_set_i;
          end
          D.temp_ordered_set = ordered_set_i;
          // D.ordered_set = ordered_set_i;
          D.axis_pkt_cnt     = '0;
          D.gen_os_ctrl      = gen_os_ctrl_i;
          D.state            = ST_BUILD;
        end
        if (Q.skp_cnt >= 32'hB0) begin
          D.skp_cnt = '0;
          D.state   = ST_SKP;
        end
      end
      ST_SKP: begin
        if (ltssm_axis_tready) begin
          ltssm_axis_tdata = 32'h1c1c1cbc;
          ltssm_axis_tuser = '1;
          ltssm_axis_tkeep = '1;
          ltssm_axis_tvalid = '1;
          ltssm_axis_tlast = '1;
          D.state = ST_IDLE;
        end
      end
      ST_BUILD: begin
        D.os_pkt_cnt   = 32'd3;
        D.special_k    = '0;
        D.special_k[0] = '1;
        D.axis_pkt_cnt = '0;
        if ((gen_os_ctrl_i.gen_ts1 || gen_os_ctrl_i.gen_ts2)) begin
          for (int i = 0; i < MAX_NUM_LANES; i++) begin
            if (Q.ordered_set[i].link_num == PAD_) begin
              D.special_k[1] = '1;
            end

            if (gen_os_ctrl_i.set_lane) begin
              D.ordered_set[i].lane_num = i;
            end else begin
              D.special_k[2] = '1;
            end

            // if (Q.ordered_set[i].ts_s6.ts1.ec != '0) begin
            //   D.ordered_set[i].ts_s6.ts1.trans_preset =
            //   preset_i[i].lane_equal_reg.downstream_tx_preset;
            // end
          end
        end

        if (gen_os_ctrl_i.gen_idle) begin
          D.special_k = '0;
          // os_pkt_cnt_c = 32'd1;
        end

        if (gen_os_ctrl_i.gen_eios) begin
          D.special_k = '1;
        end
        D.state = ST_SEND;
      end
      ST_SEND: begin
        //packet accepted or empty
        if (ltssm_axis_tready) begin
          //increment packet count
          D.axis_pkt_cnt = Q.axis_pkt_cnt + 1;
          //build axis packet
          for (int i = 0; i < MAX_NUM_LANES; i++) begin
            ltssm_axis_tdata[32*i+:32] = Q.ordered_set[i][32*Q.axis_pkt_cnt+:32];
          end
          ltssm_axis_tuser  = Q.special_k[USER_WIDTH*Q.axis_pkt_cnt+:USER_WIDTH];
          ltssm_axis_tkeep  = '1;
          ltssm_axis_tvalid = '1;
          ltssm_axis_tlast  = '0;
          if (Q.axis_pkt_cnt >= Q.os_pkt_cnt) begin
            //this hack allows for streamin uninterrupted ordered sets
            //required by the GTP/GTX transievers
            if (Q.gen_os_ctrl == gen_os_ctrl_i && !send_ltssm_os_i
            && (ordered_set_i == Q.temp_ordered_set)) begin

            end else begin
              D.state = ST_IDLE;
            end
            //assert last
            ltssm_axis_tlast = '1;
            D.os_sent        = '1;
            D.axis_pkt_cnt   = '0;
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
      .clk          (clk_i),
      .rst          (rst_i),
      .s_axis_tdata (ltssm_axis_tdata),
      .s_axis_tkeep (ltssm_axis_tkeep),
      .s_axis_tvalid(ltssm_axis_tvalid),
      .s_axis_tready(ltssm_axis_tready),
      .s_axis_tlast (ltssm_axis_tlast),
      .s_axis_tuser (ltssm_axis_tuser),
      .s_axis_tid   ('0),
      .s_axis_tdest ('0),
      .m_axis_tdata (m_axis_tdata),
      .m_axis_tkeep (m_axis_tkeep),
      .m_axis_tvalid(m_axis_tvalid),
      .m_axis_tready(m_axis_tready),
      .m_axis_tlast (m_axis_tlast),
      .m_axis_tuser (m_axis_tuser),
      .m_axis_tid   (),
      .m_axis_tdest ()
  );

  // assign os_sent_o = os_sent_r;



endmodule
