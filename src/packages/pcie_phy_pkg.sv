package pcie_phy_pkg;


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
    TS1 = 8'h4A,
    TS2 = 8'h45,
    SDS = 8'hE1,
    PAD_  = 8'hf7,  // K23.7
    SDS_BODY = 8'h55,
    IDLE = 8'h66
  } train_seq_e;

  typedef enum logic [7:0] {
    COM  = 8'hbc,  // K28.5
    STP  = 8'hfb,  // K27.7
    SDP  = 8'h5c,  // K28.2
    ENDP = 8'hfd,  // K29.7
    EDB  = 8'hfe,  // K30.7
    PAD  = 8'hf7,  // K23.7
    SKP  = 8'h1c,  // K28.0
    FTS  = 8'h3c,  // K28.1
    IDL  = 8'h7c,  // K28.3
    EIE  = 8'hfc,  // K28.7
    RV2  = 8'h9c,  // K28.4
    RV3  = 8'hdc   // K28.6

  } phy_layer_special_symbols_e;



  typedef struct packed {
    logic use_link_in;
    logic is_config_tsos;
    logic is_polling_tsos;
  } phy_user_t;


  typedef struct packed {
    logic [7:4] rsvd;
    logic scramble;
    logic loopback;
    logic dis_link;
    logic hot_rst;
  } training_ctrl_t;

  typedef enum logic [7:0] {
    gen1 = 8'h02,
    gen2 = 8'h06,
    gen3 = 8'h0E
  } rate_id_e;


  typedef struct packed {
    train_seq_e [9:0] ts_id;
    training_ctrl_t train_ctl;
    rate_id_e rate_id;
    logic [7:0] n_fts;
    logic [7:0] lane_num;
    logic [7:0] link_num;
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


  function static pcie_ordered_set_t gen_tsos(
      input train_seq_e TSOS = TS1, input train_seq_e link_num = PAD_,
      input train_seq_e lane_num = PAD_, rate_id_e rate_id = gen3);
    begin
      pcie_tsos_t temp_os;
      //integer i;
      temp_os = '0;
      temp_os.com = COM;
      temp_os.link_num = link_num;
      temp_os.lane_num = lane_num;
      temp_os.rate_id = rate_id;
      //tsos
      temp_os.ts_id[0] = TSOS;
      temp_os.ts_id[1] = TSOS;
      temp_os.ts_id[2] = TSOS;
      temp_os.ts_id[3] = TSOS;
      temp_os.ts_id[4] = TSOS;
      temp_os.ts_id[5] = TSOS;
      temp_os.ts_id[6] = TSOS;
      temp_os.ts_id[7] = TSOS;
      temp_os.ts_id[8] = TSOS;
      temp_os.ts_id[9] = TSOS;
      //return
      gen_tsos = temp_os;
    end
  endfunction

  function automatic pcie_ordered_set_t gen_idle_gen3();
    begin
      pcie_ordered_set_t temp_os;
      temp_os = '0;
      for(int i = 0; i <15 ; i++) begin
        temp_os[8*i +: 8] = IDLE;
      end
      // temp_os.symbols[0] = IDLE;
      // temp_os.symbols[1] = IDLE;
      // temp_os.symbols[2] = IDLE;
      // temp_os.symbols[3] = IDLE;
      // temp_os.symbols[4] = IDLE;
      // temp_os.symbols[5] = IDLE;
      // temp_os.symbols[6] = IDLE;
      // temp_os.symbols[7] = IDLE;
      // temp_os.symbols[8] = IDLE;
      // temp_os.symbols[9] = IDLE;
      // temp_os.symbols[10] = IDLE;
      // temp_os.symbols[11] = IDLE;
      // temp_os.symbols[12] = IDLE;
      // temp_os.symbols[13] = IDLE;
      // temp_os.symbols[14] = IDLE;
      // temp_os.symbols[15] = IDLE;
      gen_idle_gen3 = temp_os;
    end
  endfunction




  function automatic pcie_ordered_set_t gen_idle();
    begin
      pcie_ordered_set_t temp_os;
      temp_os = '0;
      temp_os[0] = COM;
      temp_os[1] = IDL;
      temp_os[2] = IDL;
      temp_os[3] = IDL;
      temp_os[4] = COM;
      temp_os[5] = IDL;
      temp_os[6] = IDL;
      temp_os[7] = IDL;
      temp_os[8] = COM;
      temp_os[9] = IDL;
      temp_os[10] = IDL;
      temp_os[11] = IDL;
      temp_os[12] = COM;
      temp_os[13] = IDL;
      temp_os[14] = IDL;
      temp_os[15] = IDL;
      gen_idle = temp_os;
    end
  endfunction


  function automatic pcie_ordered_set_t gen_sds_os();
    begin
      pcie_ordered_set_t temp_os;
      temp_os = '0;
      temp_os[0] = SDS;
      temp_os[1] = SDS_BODY;
      temp_os[2] = SDS_BODY;
      temp_os[3] = SDS_BODY;
      temp_os[4] = SDS_BODY;
      temp_os[5] = SDS_BODY;
      temp_os[6] = SDS_BODY;
      temp_os[7] = SDS_BODY;
      temp_os[8] = SDS_BODY;
      temp_os[9] = SDS_BODY;
      temp_os[10] = SDS_BODY;
      temp_os[11] = SDS_BODY;
      temp_os[12] = SDS_BODY;
      temp_os[13] = SDS_BODY;
      temp_os[14] = SDS_BODY;
      temp_os[15] = SDS_BODY;
      gen_sds_os = temp_os;
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
