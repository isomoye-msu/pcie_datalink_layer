package pcie_phy_pkg;



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
    PAD = 8'hF7
  } train_seq_e;

  typedef struct packed {
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
    gen1 = 8'h01,
    gen2 = 8'h02,
    gen3 = 8'h04
  } rate_id_e;


  typedef struct packed {
    train_seq_e [15:6] ts_id;
    training_ctrl_t train_ctl;
    rate_id_e rate_id;
    logic [7:0] n_fts;
    logic [7:0] lane_num;
    logic [7:0] link_num;
    phy_special_k_e com;
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



  typedef enum logic [7:0] {
    PAT_GEN_HOME         = 8'h00,
    PAT_GEN_GEN12_SKP_1  = 8'h01,
    PAT_GEN_GEN12_SKP_2  = 8'h02,
    PAT_GEN_GEN12_PAT    = 8'h03,
    PAT_GEN_GEN3_EIEOS_1 = 8'h10,
    PAT_GEN_GEN3_EIEOS_2 = 8'h11,
    PAT_GEN_GEN3_EIEOS_3 = 8'h12,
    PAT_GEN_GEN3_EIEOS_4 = 8'h13,
    PAT_GEN_GEN3_PAT_ST  = 8'h14,
    PAT_GEN_GEN3_PAT_Z0  = 8'h15,
    PAT_GEN_GEN3_PAT_Z1  = 8'h16,
    PAT_GEN_GEN3_PAT_Z2  = 8'h17,
    PAT_GEN_GEN3_PAT_Z3  = 8'h18,
    PAT_GEN_GEN3_PAT_ST1 = 8'h19,
    PAT_GEN_GEN3_PAT_Z01 = 8'h1A,
    PAT_GEN_GEN3_PAT_Z11 = 8'h1B,
    PAT_GEN_GEN3_PAT_Z21 = 8'h1C,
    PAT_GEN_GEN3_PAT_Z4  = 8'h1D,
    PAT_GEN_GEN4_EIEOS_1 = 8'h20,
    PAT_GEN_GEN4_EIEOS_2 = 8'h21,
    PAT_GEN_GEN4_EIEOS_3 = 8'h22,
    PAT_GEN_GEN4_EIEOS_4 = 8'h23,
    PAT_GEN_GEN4_PAT_ST  = 8'h24,
    PAT_GEN_GEN4_PAT_Z0  = 8'h25,
    PAT_GEN_GEN4_PAT_Z1  = 8'h26,
    PAT_GEN_GEN4_SKP_0   = 8'h27,
    PAT_GEN_GEN4_SKP_1   = 8'h28,
    PAT_GEN_GEN4_SKP_2   = 8'h29,
    PAT_GEN_GEN4_SKP_3   = 8'h2A,
    PAT_GEN_GEN4_DAT_ST  = 8'h2B,
    PAT_GEN_GEN4_DAT_Z0  = 8'h2C,
    PAT_GEN_GEN4_DAT_Z1  = 8'h2D,
    PAT_GEN_GEN4_DAT_ED0 = 8'h2E,
    PAT_GEN_GEN4_DAT_ED1 = 8'h2F,
    PAT_GEN_GEN3_EIOS_1  = 8'h30,
    PAT_GEN_GEN3_EIOS_2  = 8'h31,
    PAT_GEN_GEN3_EIOS_3  = 8'h32,
    PAT_GEN_GEN3_EIOS_4  = 8'h33,
    PAT_GEN_GEN3_EIOS_5  = 8'h34

  } patterns_e;


  function automatic pcie_ordered_set_t gen_tsos(input train_seq_e TSOS,
  input train_seq_e link_num = PAD, input train_seq_e lane_num = PAD,
  rate_id_e rate_id = gen3);
    begin
      pcie_tsos_t temp_os;
      temp_os = '0;
      temp_os.com = TS1_K28_5;
      temp_os.link_num = link_num;
      temp_os.lane_num = lane_num;
      temp_os.rate_id = rate_id;
      for (int i = 0; i < 9; i++) begin
        temp_os.ts_id[i] = TSOS;
      end

      for (int i = 0; i < 15; i++) begin
        //even
        if (i % 2) begin
          temp_os.symbols[i] = 8'h00;
        end  //odd
        else begin
          temp_os.symbols[i] = 8'hFF;
        end
      end
      gen3_eieos = temp_os;
    end
  endfunction


  function automatic pcie_ordered_set_t gen3_eieos();
  begin
    pcie_ordered_set_t temp_os;
    temp_os = '0;
    for (int i = 0; i < 15; i++) begin
      //even
      if (i % 2) begin
        temp_os.symbols[i] = 8'h00;
      end  //odd
      else begin
        temp_os.symbols[i] = 8'hFF;
      end
    end
    gen3_eieos = temp_os;
  end
endfunction


  function automatic pcie_ordered_set_t gen3_eieos();
    begin
      pcie_ordered_set_t temp_os;
      temp_os = '0;
      for (int i = 0; i < 15; i++) begin
        //even
        if (i % 2) begin
          temp_os.symbols[i] = 8'h00;
        end  //odd
        else begin
          temp_os.symbols[i] = 8'hFF;
        end
      end
      gen3_eieos = temp_os;
    end
  endfunction

endpackage
