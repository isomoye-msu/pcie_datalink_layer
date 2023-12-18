
module tb_dllp_handler;


  // Parameters
  localparam int DATA_WIDTH = 32;
  localparam int STRB_WIDTH = DATA_WIDTH / 8;
  localparam int KEEP_WIDTH = STRB_WIDTH;
  localparam int USER_WIDTH = 4;
  localparam int S_COUNT = 1;
  localparam int M_COUNT = 1;
  localparam int TLP_SEG_COUNT = 0;
  localparam int TX_SEQ_NUM_COUNT = 0;
  localparam int TX_SEQ_NUM_WIDTH = 0;
  localparam int RAM_DATA_WIDTH = 32;
  localparam int RAM_ADDR_WIDTH = 12;
  localparam int RETRY_TLP_SIZE = 3;

  //Ports
  reg  clk;
  reg  rst;
  reg  [1:0] link_status;
  reg [DATA_WIDTH-1:0] s_axis_tdata;
  reg [KEEP_WIDTH-1:0] s_axis_tkeep;
  reg [   S_COUNT-1:0] s_axis_tvalid;
  reg [   S_COUNT-1:0] s_axis_tlast;
  reg [USER_WIDTH-1:0] s_axis_tuser;
  wire [   S_COUNT-1:0] s_axis_tready;
  wire [11:0] seq_num;
  wire  seq_num_vld;
  wire  seq_num_acknack;
  wire  fc1_values_stored;
  wire  fc2_values_stored;
  wire [ 7:0] tx_fc_ph;
  wire [11:0] tx_fc_pd;
  wire [ 7:0] tx_fc_nph;
  wire [11:0] tx_fc_npd;

  dllp_handler #(
      .DATA_WIDTH(DATA_WIDTH),
      .STRB_WIDTH(STRB_WIDTH),
      .KEEP_WIDTH(KEEP_WIDTH),
      .USER_WIDTH(USER_WIDTH),
      .S_COUNT(S_COUNT),
      .TLP_SEG_COUNT(TLP_SEG_COUNT),
      .TX_SEQ_NUM_COUNT(TX_SEQ_NUM_COUNT),
      .TX_SEQ_NUM_WIDTH(TX_SEQ_NUM_WIDTH),
      .RAM_DATA_WIDTH(RAM_DATA_WIDTH),
      .RAM_ADDR_WIDTH(RAM_ADDR_WIDTH)
  ) dllp_handler_inst (
      .clk_i(clk),
      .rst_i(rst),
      .link_status_i(link_status),
      .s_axis_tdata_i(s_axis_tdata),
      .s_axis_tkeep_i(s_axis_tkeep),
      .s_axis_tvalid_i(s_axis_tvalid),
      .s_axis_tlast_i(s_axis_tlast),
      .s_axis_tuser_i(s_axis_tuser),
      .s_axis_tready_o(s_axis_tready),
      .seq_num_o(seq_num),
      .seq_num_vld_o(seq_num_vld),
      .seq_num_acknack_o(seq_num_acknack),
      .fc1_values_stored_o(fc1_values_stored),
      .fc2_values_stored_o(fc2_values_stored),
      .tx_fc_ph_o(tx_fc_ph),
      .tx_fc_pd_o(tx_fc_pd),
      .tx_fc_nph_o(tx_fc_nph),
      .tx_fc_npd_o(tx_fc_npd)
  );

  //always #5  clk = ! clk ;

endmodule
