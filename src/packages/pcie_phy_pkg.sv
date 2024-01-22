package pcie_phy_pkg;



  localparam int FourtyEightMsTimeOut = 32'h2B71B00;  //temp value
  // localparam int TwentyFourMsTimeOut = 32'h015B8D80;  //temp value
  // localparam int TimeOutPeriod = 32'h0000DACA;
  localparam int SkidBuffer = 2;
  // localparam int TwentyFourMsTimeOut = (CLK_RATE * (24 ** 5));  //32'h015B8D80;  //temp value
  // localparam int TwoMsTimeOut = (CLK_RATE * (2 ** 5));  //32'h000B8D80;  //temp value
  localparam int SkidBuffer = 2;

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

  typedef union {
    ts2_symbol6_t ts2;
    ts1_symbol6_t ts1;
    logic [7:0]   whole;
  } ts_symbol6_union_t;

  typedef struct packed {logic [7:0] symbol;} ts_generic_symbol_t;


  typedef enum logic [7:0] {
    COM   = 8'hbc,  // K28.5
    STP   = 8'hfb,  // K27.7
    SDP   = 8'h5c,  // K28.2
    ENDP  = 8'hfd,  // K29.7
    EDB   = 8'hfe,  // K30.7
    PAD   = 8'hf7,  // K23.7
    SKP   = 8'h1c,  // K28.0
    FTS   = 8'h3c,  // K28.1
    IDL   = 8'h7c,  // K28.3
    EIE   = 8'hfc,  // K28.7
    RV2   = 8'h9c,  // K28.4
    RV3   = 8'hdc,  // K28.6
    TS1OS = 8'h1E

  } phy_layer_special_symbols_e;


  typedef struct packed {
    logic use_link_in;
    logic is_config_tsos;
    logic is_polling_tsos;
  } phy_user_t;


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

  typedef enum logic [2:0] {
    gen1_basic = 3'b0000_0001,
    gen2_basic = 3'b0000_0011,
    gen3_basic = 3'b0000_0111
  } rate_id_e;

  typedef enum logic [2:0] {
    gen1 = 3'b001,
    gen2 = 3'b011,
    gen3 = 3'b111
  } rate_speed_e;

  typedef struct packed {
    logic       speed_change;
    logic       autonomous_change;
    logic [1:0] rsvd5_6;
    rate_id_e   rate;
    logic       rsvd0;
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
        for (int i = 0; i < 10; i++) begin
          temp_os.ts_id[i] = TSOS;
        end
      end else if (rate_speed == gen3) begin
        temp_os.com        = TS1OS;
        temp_os.link_num   = link_num;
        temp_os.lane_num   = lane_num;
        temp_os.rate_id    = rate_id;
        temp_os.train_ctrl = train_ctrl;
        if (TSOS == TS1) begin
          temp_os.ts_s6.ts1 = ts_s6;
          temp_os.ts_s7     = ts_s7;
          temp_os.ts_s8     = ts_s8;
          temp_os.ts_s9     = ts_s9;
          for (int i = 0; i < 6; i++) begin
            temp_os.ts_id[i] = TSOS;
          end
        end else if (TSOS == TS1) begin
          temp_os.ts_s6 = TSOS;
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

  function automatic void gen_idle_gen3(output pcie_ordered_set_t tsos_out);
    begin
      pcie_ordered_set_t temp_os;
      temp_os = '0;
      for (int i = 0; i < 15; i++) begin
        temp_os[8*i+:8] = IDLE;
      end
      tsos_out = temp_os;
    end
  endfunction




  function static void gen_idle(output pcie_ordered_set_t idle_out);
    begin
      pcie_ordered_set_t temp_os;
      temp_os = '0;
      temp_os[8*0+:8] = COM;
      for (int i = 1; i < 4; i++) begin
        temp_os[8*i+:8] = IDL;
      end
      //temp_os[0] = COM;
      // temp_os[1] = IDL;
      // temp_os[2] = IDL;
      // temp_os[3] = IDL;
      temp_os[8*4+:8] = COM;
      for (int i = 5; i < 8; i++) begin
        temp_os[8*i+:8] = IDL;
      end
      temp_os[8*8+:8] = COM;
      for (int i = 9; i < 12; i++) begin
        temp_os[8*i+:8] = IDL;
      end
      temp_os[8*12+:8] = COM;
      for (int i = 13; i < 16; i++) begin
        temp_os[8*i+:8] = IDL;
      end
      // temp_os[8*8 +: 8] = COM;
      // temp_os[4] = COM;
      // temp_os[5] = IDL;
      // temp_os[6] = IDL;
      // temp_os[7] = IDL;
      // temp_os[8] = COM;
      // temp_os[9] =  IDL;
      // temp_os[10] = IDL;
      // temp_os[11] = IDL;
      // temp_os[12] = COM;
      // temp_os[13] = IDL;
      // temp_os[14] = IDL;
      // temp_os[15] = IDL;
      idle_out = temp_os;
    end
  endfunction


  function automatic pcie_ordered_set_t gen_sds_os();
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
      gen_sds_os  = temp_os;
    end
  endfunction

  // function automatic pcie_ordered_set_t gen3_eieos();
  //   begin
  //     pcie_ordered_set_t temp_os;
  //     temp_os = '0;
  //     for (int i = 0; i < 15; i++) begin
  //       //even
  //       if (i % 2) begin
  //         temp_os.symbols[i] = 8'h00;
  //       end  //odd
  //       else begin
  //         temp_os.symbols[i] = 8'hFF;
  //       end
  //     end
  //     gen3_eieos = temp_os;
  //   end
  // endfunction


  /* verilator lint_on WIDTHTRUNC */
endpackage
