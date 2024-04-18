package pcie_phy_pkg;



  // localparam int FourtyEightMsTimeOut = 32'h2B71B00;  //temp value
  // localparam int TwentyFourMsTimeOut = 32'h015B8D80;  //temp value
  // localparam int TimeOutPeriod = 32'h0000DACA;
  localparam int SkidBuffer = 2;
  // localparam int TwentyFourMsTimeOut = (CLK_RATE * (24 ** 5));  //32'h015B8D80;  //temp value
  // localparam int TwoMsTimeOut = (CLK_RATE * (2 ** 5));  //32'h000B8D80;  //temp value

  /* verilator lint_off WIDTHTRUNC */
  typedef enum logic [7:0] {
    K28_0 = 8'b000_11100,
    K28_1 = 8'b001_11100,
    K28_2 = 8'b010_11100,
    K28_3 = 8'b011_11100,
    K28_4 = 8'b100_11100,
    K28_5 = 8'b101_11100,
    K28_6 = 8'b110_11100,
    K28_7 = 8'b111_11100,
    K23_7 = 8'b111_10111,
    K27_7 = 8'b111_11011,
    K29_7 = 8'b111_11101,
    K30_7 = 8'b111_11110
  } phy_special_k_e;


  typedef enum logic [7:0] {
    TS1      = 8'h4A,
    TS2      = 8'h45,
    SDS      = 8'hE1,
    PAD_     = 8'hf7,  // K23.7
    SDS_BODY = 8'h55,
    IDLE     = 8'h66
  } train_seq_e;

  //TS2 structs
  typedef struct packed {
    logic       req_equal;
    logic       quience_guarantee;
    logic [5:0] rsvd;
  } ts2_symbol6_t;

  //TS1 structs
  typedef struct packed {
    logic       use_preset;
    logic [3:0] trans_preset;
    logic       rst_eieos;
    logic [1:0] ec;
  } ts1_symbol6_t;

  typedef struct packed {
    logic [1:0] rsvd;
    logic [5:0] fs_pre_cursor;
  } ts1_symbol7_t;


  typedef struct packed {
    logic [1:0] rsvd;
    logic [5:0] lf_cursor_coef;
  } ts1_symbol8_t;

  typedef struct packed {
    logic       parity;
    logic       reject_coef;
    logic [5:0] post_cursor_coef;
  } ts1_symbol9_t;

  typedef union packed {
    ts2_symbol6_t ts2;
    ts1_symbol6_t ts1;
    logic [7:0]   whole;
  } ts_symbol6_union_t;

  typedef struct packed {
    logic [7:0] rx_preset;
    logic [7:0] tx_preset;
    logic [7:0] pre_cursor;
    logic [7:0] cursor_coef;
  } presets_coeff_t;


  typedef struct packed {logic [7:0] symbol;} ts_generic_symbol_t;


  typedef enum logic [7:0] {
    COM      = 8'hbc,  // K28.5
    STP      = 8'hfb,  // K27.7
    SDP      = 8'h5c,  // K28.2
    ENDP     = 8'hfd,  // K29.7
    EDB      = 8'hfe,  // K30.7
    PAD      = 8'hf7,  // K23.7
    SKP      = 8'h1c,  // K28.0
    FTS      = 8'h3c,  // K28.1
    IDL      = 8'h7c,  // K28.3
    EIE      = 8'hfc,  // K28.7
    RV2      = 8'h9c,  // K28.4
    RV3      = 8'hdc,  // K28.6
    TS1OS    = 8'h1E,
    TS2OS    = 8'h2D,
    EIOS     = 8'h66,
    EIEOS    = 8'h00,
    GEN3_SKP = 8'hAA,
    SKP_END  = 8'hE1


  } phy_layer_special_symbols_e;


  typedef enum logic [31:0] {
    GEN3_IDL = '0,
    GEN3_SDP = {16'h0, 8'b10101100, 8'b11110000},
    GEN3_EDB = {8'b11000000, 8'b11000000, 8'b11000000, 8'b11000000},
    GEN3_EDS = {8'h0, 8'b10010000, 8'b10000000, 8'b00011111}
  } gen3_special_symbols_e;

  typedef enum logic [63:0] {
    ReceiverpresetHintDSP    = 48'hAABBCCDD1122,
    // TransmitterPresetHintDSP = 64'h11AA22BB33CC44DD,
    ReceiverpresetHintUSP    = 48'h2211DDCCBBAA,
    TransmitterPresetHintUSP = 64'h11AA22BB33CC44DD

  } rx_tx_presets_e;

  typedef struct packed {
    logic use_link_in;
    logic is_config_tsos;
    logic is_polling_tsos;
  } phy_user_t;

  typedef struct packed {
    logic [3:0] tlp_len0;
    logic [3:0] rsvd;
  } gen_3_stp_byte0_t;

  typedef struct packed {
    logic fp;
    logic [6:0] tlp_len1;
  } gen_3_stp_byte1_t;

  typedef struct packed {
    logic [3:0] fcrc;
    logic [3:0] tlp_seq1;
  } gen_3_stp_byte2_t;

  typedef struct packed {logic [7:0] tlp_seq0;} gen_3_stp_byte3_t;

  typedef struct packed {
    gen_3_stp_byte0_t byte_3;
    gen_3_stp_byte2_t byte_2;
    gen_3_stp_byte1_t byte_1;
    gen_3_stp_byte0_t byte_0;
  } gen_3_stp_t;


  typedef enum logic [31:0] {
    lane0_seed = 24'h1DBFBC,
    lane1_seed = 24'h0607BB,
    lane2_seed = 24'h1EC760,
    lane3_seed = 24'h18C0DB,
    lane4_seed = 24'h010F12,
    lane5_seed = 24'h19CFC9,
    lane6_seed = 24'h0277CE,
    lane7_seed = 24'h1BB807

  } gen3_seed_values_e;

  logic [23:0] gen3_seed_values[8] = {
    lane7_seed, lane6_seed, lane5_seed, lane4_seed, lane3_seed, lane2_seed, lane1_seed, lane0_seed
  };

  typedef logic [7:0] data_t;

  logic [127:0] GEN3_SDS = {
    8'h55,
    8'h47,
    8'h4E,
    8'hC7,
    8'hCC,
    8'hC6,
    8'hC9,
    8'h25,
    8'h6E,
    8'hEC,
    8'h88,
    8'h7F,
    8'h80,
    8'h8D,
    8'h8B,
    8'h8E
  };

  typedef struct packed {
    logic [7:4] rsvd;
    logic       scramble;
    logic       loopback;
    logic       dis_link;
    logic       hot_rst;
  } training_ctrl_t;

  // Data Rate Identifier
  // Bit 0 – Reserved
  // Bit 1 – 2.5 GT/s Data Rate Supported. Must be set to 1b.
  // Bit 2 – 5.0 GT/s Data Rate Supported. Must be set to 1b if Bit 3 is 1b.
  // Bit 3 – 8.0 GT/s Data Rate Supported.
  // Bit 4:5 – Reserved.
  // Bit 6 – Autonomous Change/Selectable De-emphasis.
  // Downstream Ports: This bit is defined for use in the following LTSSM states: Polling.Active,
  // Configuration.LinkWidth.Start, and Loopback.Entry. In all other LTSSM states, it is
  // Reserved.
  // Upstream Ports: This bit is defined for use in the following LTSSM states: Polling.Active,
  // Configuration, Recovery, and Loopback.Entry. In all other LTSSM states, it is
  // Reserved.
  // Bit 7 – speed_change. This bit can be set to 1b only in the Recovery.RcvrLock LTSSM state. In
  // all other LTSSM states, it is Reserved.

  typedef enum logic [8:0] {
    gen1_basic = 5'b000_00010,
    gen2_basic = 5'b000_00110,
    gen3_basic = 5'b000_01110
  } rate_id_e;

  typedef enum logic [4:0] {
    gen1 = 5'b00001,
    gen2 = 5'b00011,
    gen3 = 5'b00111,
    gen4 = 5'b01111,
    gen5 = 5'b11111
  } rate_speed_e;

  typedef struct packed {
    logic        speed_change;
    logic        autonomous_change;
    rate_speed_e rate;
    logic        rsvd0;
  } rate_id_t;

  typedef struct packed {
    ts_generic_symbol_t [5:0]   ts_id;
    ts1_symbol9_t               ts_s9;
    ts1_symbol8_t               ts_s8;
    ts1_symbol7_t               ts_s7;
    ts_symbol6_union_t          ts_s6;
    training_ctrl_t             train_ctrl;
    rate_id_t                   rate_id;
    logic [7:0]                 n_fts;
    logic [7:0]                 lane_num;
    logic [7:0]                 link_num;
    phy_layer_special_symbols_e com;
  } pcie_tsos_t;


  typedef struct packed {
    ts2_symbol6_t ts6_sym;
    rate_id_t     rate_id;
    logic [7:0]   link_number;
    logic         set_speed_change;
    logic         set_lane;
    logic         set_link;
    logic         gen_idle;
    logic         gen_skp;
    logic         gen3_eieos;
    logic         gen2_eieos;
    logic         gen_ts2;
    logic         gen_ts1;
    logic         valid;
  } gen_os_struct_t;


  typedef struct packed {logic [7:0][15:0] symbols;} pcie_ordered_set_t;



  //     // TS1 Ordered Sets
  //     TS1_DATA_K28_5 = 8'h1C,   // TS1 Data: K28.5 (Start of TS1 Ordered Set)
  //     TS1_DATA_K28_7 = 8'h3C,   // TS1 Data: K28.7 (End of TS1 Ordered Set)

  //     // TS2 Ordered Sets
  //     TS2_DATA_K28_5 = 8'h5C,   // TS2 Data: K28.5 (Start of TS2 Ordered Set)
  //     TS2_DATA_K28_7 = 8'h7C,   // TS2 Data: K28.7 (End of TS2 Ordered Set)

  //     // TLP Prefix Ordered Set
  //     TLP_PREFIX = 8'hBC,        // TLP Prefix

  //     // TLP Header Ordered Set
  //     TLP_HEADER = 8'hFC         // TLP Header
  //   } pcie_ordered_set_e;
  function automatic logic [0:0] check_sdp(input logic [31:0] data_i);
    begin
      if ((data_i[15:0] == GEN3_SDP[15:0])) begin
        return '1;
      end else begin
        return '0;
      end
    end
  endfunction


  function automatic logic [0:0] check_stp(input logic [31:0] data_i);
    begin
      if ((data_i[3:0] == '1)) begin
        return '1;
      end else begin
        return '0;
      end
    end
  endfunction



  function static void gen_fcrc_parity(output logic [3:0] fcrc_out, output logic parity_out,
                                       input logic [10:0] tlp_length);
    begin
      fcrc_out[0] = tlp_length[10] ^ tlp_length[7] ^ tlp_length[6] ^ tlp_length[4] ^ tlp_length[2]
      ^ tlp_length[1] ^ tlp_length[0];
      fcrc_out[1] = tlp_length[10] ^ tlp_length[9] ^ tlp_length[7] ^ tlp_length[5] ^ tlp_length[4]
       ^ tlp_length[3] ^ tlp_length[2];
      fcrc_out[2] = tlp_length[9] ^ tlp_length[8] ^ tlp_length[6] ^ tlp_length[4] ^ tlp_length[3]
      ^ tlp_length[2] ^ tlp_length[1];
      fcrc_out[3] = tlp_length[8] ^ tlp_length[7] ^ tlp_length[5] ^ tlp_length[3] ^ tlp_length[2]
      ^ tlp_length[1] ^ tlp_length[0];
      parity_out = tlp_length[10] ^ tlp_length[9] ^ tlp_length[8] ^ tlp_length[7] ^ tlp_length[6]
      ^ tlp_length[5] ^ tlp_length[4] ^ tlp_length[3] ^ tlp_length[2] ^ tlp_length[1] ^ tlp_length[0]
      ^ fcrc_out[3] ^ fcrc_out[2] ^ fcrc_out[1] ^  fcrc_out[0];
    end
  endfunction




  function static void gen_tsos(
      output pcie_ordered_set_t tsos_out, input rate_speed_e rate_speed = gen1,
      input train_seq_e TSOS = TS1, input train_seq_e link_num = PAD_,
      input train_seq_e lane_num = PAD_, input rate_id_t rate_id = gen3_basic,
      input training_ctrl_t train_ctrl = '0, input ts_symbol6_union_t ts_s6 = TSOS,
      input ts1_symbol6_t ts_s7 = TSOS, input ts1_symbol6_t ts_s8 = TSOS,
      input ts1_symbol6_t ts_s9 = TSOS);
    begin

      pcie_tsos_t temp_os;
      temp_os = '0;
      if (rate_speed == gen1 || rate_speed == gen2) begin
        //integer i;
        temp_os.com        = COM;
        temp_os.link_num   = link_num;
        temp_os.lane_num   = lane_num;
        temp_os.rate_id    = rate_id;
        temp_os.train_ctrl = train_ctrl;
        temp_os.n_fts      = 8'h04;
        temp_os.ts_s6      = TSOS;
        temp_os.ts_s7      = TSOS;
        temp_os.ts_s7      = TSOS;
        temp_os.ts_s8      = TSOS;
        temp_os.ts_s9      = TSOS;
        for (int i = 0; i < 6; i++) begin
          temp_os.ts_id[i] = TSOS;
        end
      end else if (rate_speed == gen3) begin
        temp_os.link_num   = link_num;
        temp_os.lane_num   = lane_num;
        temp_os.rate_id    = rate_id;
        temp_os.train_ctrl = train_ctrl;
        temp_os.n_fts      = 8'h04;
        if (TSOS == TS1) begin
          temp_os.com       = TS1OS;
          temp_os.ts_s6.ts1 = ts_s6;
          temp_os.ts_s7     = ts_s7;
          temp_os.ts_s8     = ts_s8;
          temp_os.ts_s9     = ts_s9;
          for (int i = 0; i < 6; i++) begin
            temp_os.ts_id[i] = TSOS;
          end
        end else if (TSOS == TS2) begin
          temp_os.com   = TS2OS;
          temp_os.ts_s6 = ts_s6;
          temp_os.ts_s7 = TSOS;
          temp_os.ts_s8 = TSOS;
          temp_os.ts_s9 = TSOS;
          for (int i = 0; i < 6; i++) begin
            temp_os.ts_id[i] = TSOS;
          end
        end
      end
      //return
      tsos_out = temp_os;
    end
  endfunction


  function static void gen_eq_tsos(
      output pcie_ordered_set_t tsos_out, input rate_speed_e rate_speed = gen1,
      input train_seq_e TSOS = TS1, input train_seq_e link_num = PAD_,
      input train_seq_e lane_num = PAD_, input rate_id_t rate_id = gen3_basic,
      input training_ctrl_t train_ctrl = '0, input ts_symbol6_union_t ts_s6 = TSOS,
      input ts1_symbol6_t ts_s7 = TSOS, input ts1_symbol6_t ts_s8 = TSOS,
      input ts1_symbol6_t ts_s9 = TSOS);
    begin

      pcie_tsos_t temp_os;
      gen_tsos(temp_os,rate_speed,TSOS,link_num,lane_num,rate_id,train_ctrl,ts_s6,ts_s7,ts_s8,ts_s9);
      // temp_os            = '0;
      // temp_os.link_num   = link_num;
      // temp_os.lane_num   = lane_num;
      // temp_os.rate_id    = rate_id;
      // temp_os.train_ctrl = train_ctrl;
      // temp_os.n_fts      = 8'h04;
      // if (TSOS == TS1) begin
      //   temp_os.com       = TS1OS;
      //   temp_os.ts_s6.ts1 = ts_s6;
      //   temp_os.ts_s7     = ts_s7;
      //   temp_os.ts_s8     = ts_s8;
      //   temp_os.ts_s9     = ts_s9;
      //   for (int i = 0; i < 6; i++) begin
      //     temp_os.ts_id[i] = TSOS;
      //   end
      // end else if (TSOS == TS2) begin
      //   temp_os.com   = TS2OS;
      //   temp_os.ts_s6 = ts_s6;
      //   temp_os.ts_s7 = TSOS;
      //   temp_os.ts_s8 = TSOS;
      //   temp_os.ts_s9 = TSOS;
      //   for (int i = 0; i < 6; i++) begin
      //     temp_os.ts_id[i] = TSOS;
      //   end
      // end
      //return
      tsos_out = temp_os;
    end
  endfunction


  // function automatic void gen_idle_gen3(output pcie_ordered_set_t tsos_out);
  //   begin
  //     pcie_ordered_set_t temp_os;
  //     temp_os = '0;
  //     for (int i = 0; i < 15; i++) begin
  //       temp_os[8*i+:8] = IDLE;
  //     end
  //     tsos_out = temp_os;
  //   end
  // endfunction

  function automatic void gen_stp_gen3(output gen_3_stp_t stp_out, input logic fp_in,
                                       input logic [3:0] fcrc_in, input logic [10:0] tlp_length,
                                       input logic [31:0] dllp_frame_in);
    begin
      gen_3_stp_t temp_stp = '0;
      {temp_stp.byte_2, temp_stp.byte_3} = dllp_frame_in[15:0];
      temp_stp.byte_2.fcrc               = fcrc_in;
      temp_stp.byte_0.tlp_len0           = tlp_length[3:0];
      temp_stp.byte_0.rsvd               = '1;
      temp_stp.byte_1.tlp_len1           = tlp_length[10:4];
      temp_stp.byte_1.fp                 = fp_in;
      stp_out                            = temp_stp;
    end
  endfunction

  function automatic void get_tlp_len(output logic [7:0] length, input logic [31:0] data_i);
    begin
      gen_3_stp_t temp_stp = data_i;
      length = {temp_stp.byte_1.tlp_len1, temp_stp.byte_0.tlp_len0};
    end
  endfunction


  function static void gen_idle(output pcie_ordered_set_t idle_out);
    begin
      pcie_ordered_set_t temp_os;
      temp_os = '0;
      for (int i = 0; i < 16; i++) begin
        if (i[1:0] == '0) begin
          temp_os[8*i+:8] = COM;
        end else begin
          temp_os[8*i+:8] = IDL;
        end
      end
      idle_out = temp_os;
    end
  endfunction


  function automatic void gen_sds_os(output pcie_ordered_set_t sds_out);
    begin
      pcie_ordered_set_t temp_os;
      temp_os     = '0;
      temp_os[0]  = SDS;
      temp_os[1]  = SDS_BODY;
      temp_os[2]  = SDS_BODY;
      temp_os[3]  = SDS_BODY;
      temp_os[4]  = SDS_BODY;
      temp_os[5]  = SDS_BODY;
      temp_os[6]  = SDS_BODY;
      temp_os[7]  = SDS_BODY;
      temp_os[8]  = SDS_BODY;
      temp_os[9]  = SDS_BODY;
      temp_os[10] = SDS_BODY;
      temp_os[11] = SDS_BODY;
      temp_os[12] = SDS_BODY;
      temp_os[13] = SDS_BODY;
      temp_os[14] = SDS_BODY;
      temp_os[15] = SDS_BODY;
      sds_out     = temp_os;
    end
  endfunction

  function automatic pcie_ordered_set_t gen_skp(output pcie_ordered_set_t skp_out,
                                                input rate_speed_e rate_speed = gen1);
    begin
      pcie_ordered_set_t temp_os;
      temp_os = '0;
      if (rate_speed < gen3) begin
        for (int i = 0; i < 16; i++) begin
          if (i[1:0] == '0) begin
            temp_os[8*i+:8] = COM;
          end else begin
            temp_os[8*i+:8] = SKP;
          end
        end
      end else begin
        for (int i = 0; i < 15; i++) begin
          if (i < 11) begin
            temp_os[8*i+:8] = GEN3_SKP;
          end else if (i == 12) begin
            temp_os[8*i+:8] = SKP_END;
          end else begin
            temp_os[8*i+:8] = 8'hff;
          end
        end
      end
      skp_out = temp_os;
    end
  endfunction

  function automatic void gen_eios(output pcie_ordered_set_t idle_out,
                                   input rate_speed_e rate_speed = gen1);
    begin
      pcie_ordered_set_t temp_os;
      temp_os = '0;
      if (rate_speed < gen3) begin
        for (int i = 0; i < 16; i++) begin
          if (i[1:0] == '0) begin
            temp_os[8*i+:8] = COM;
          end else begin
            temp_os[8*i+:8] = IDL;
          end
        end
      end else begin
        for (int i = 0; i < 16; i++) begin
          temp_os[8*i+:8] = IDLE;
        end
      end
      idle_out = temp_os;
    end
  endfunction


  function automatic void gen_eieos(output pcie_ordered_set_t eieos_out,
                                    input rate_speed_e rate_speed = gen2);
    begin
      pcie_ordered_set_t temp_os;
      temp_os = '0;
      if (rate_speed == gen2) begin
        temp_os.symbols[7:0] = COM;
        for (int i = 1; i < 15; i++) begin
          temp_os[8*i+:8] = EIE;
        end
        temp_os[8*15+:8] = TS1;
      end else begin
        for (logic [7:0] i = 0; i < 16; i++) begin
          //even
          if (!i[0]) begin
            temp_os[i*8+:8] = 8'h00;
          end else begin
            temp_os[i*8+:8] = 8'hFF;
          end
        end
      end
      eieos_out = temp_os;
    end
  endfunction


  /* verilator lint_on WIDTHTRUNC */
endpackage
