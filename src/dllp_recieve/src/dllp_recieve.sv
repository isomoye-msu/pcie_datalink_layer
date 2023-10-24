module dllp_recieve
  import pcie_datalink_pkg::*;
#(
    // Parameters
    parameter int DATA_WIDTH = 32,
    parameter int STRB_WIDTH = DATA_WIDTH / 8,
    parameter int KEEP_WIDTH = STRB_WIDTH,
    parameter int USER_WIDTH = 4,
    parameter int S_COUNT = 2,
    parameter int M_COUNT = 2,
    parameter int MAX_PAYLOAD_SIZE = 0,
    parameter int RX_FIFO_SIZE = 0
) (
    input logic clk_i,  // Clock signal
    input logic rst_i,  // Reset signal

    input pcie_dl_status_e link_status_i,
    input logic phy_link_up_i,

    /*
     * TLP AXIS inputs
     */
    input  logic [(S_COUNT*DATA_WIDTH)-1:0] s_axis_tdata_i,
    input  logic [(S_COUNT*KEEP_WIDTH)-1:0] s_axis_tkeep_i,
    input  logic [             S_COUNT-1:0] s_axis_tvalid_i,
    input  logic [             S_COUNT-1:0] s_axis_tlast_i,
    input  logic [(S_COUNT*USER_WIDTH)-1:0] s_axis_tuser_i,
    output logic [             S_COUNT-1:0] s_axis_tready_o,

    /*
      * TLP AXI output
      */
    output logic [(M_COUNT*DATA_WIDTH)-1:0] m_axis_tdata_o,
    output logic [(M_COUNT*KEEP_WIDTH)-1:0] m_axis_tkeep_o,
    output logic [             M_COUNT-1:0] m_axis_tvalid_o,
    output logic [             M_COUNT-1:0] m_axis_tlast_o,
    output logic [(M_COUNT*USER_WIDTH)-1:0] m_axis_tuser_o,
    input  logic [             M_COUNT-1:0] m_axis_tready_i,

    //tlp ack/nak
    output logic [11:0] seq_num_o,
    output logic        seq_num_vld_o,
    output logic        seq_num_acknack_o,
    //flow control values
    output logic        fc1_values_stored_o,
    output logic        fc2_values_stored_o,
    //Flow control
    output logic [ 7:0] tx_fc_ph_o,
    output logic [11:0] tx_fc_pd_o,
    output logic [ 7:0] tx_fc_nph_o,
    output logic [11:0] tx_fc_npd_o
);


  logic [DATA_WIDTH-1:0] s_axis_phy2tlp_tdata;
  logic [KEEP_WIDTH-1:0] s_axis_phy2tlp_tkeep;
  logic [         1-1:0] s_axis_phy2tlp_tvalid;
  logic [         1-1:0] s_axis_phy2tlp_tlast;
  logic [USER_WIDTH-1:0] s_axis_phy2tlp_tuser;
  logic [         1-1:0] s_axis_phy2tlp_tready;

  logic [DATA_WIDTH-1:0] s_axis_phy2dllp_tdata;
  logic [KEEP_WIDTH-1:0] s_axis_phy2dllp_tkeep;
  logic [         1-1:0] s_axis_phy2dllp_tvalid;
  logic [         1-1:0] s_axis_phy2dllp_tlast;
  logic [USER_WIDTH-1:0] s_axis_phy2dllp_tuser;
  logic [         1-1:0] s_axis_phy2dllp_tready;




  logic [DATA_WIDTH-1:0] m_axis_dllp2tlp_tdata;
  logic [KEEP_WIDTH-1:0] m_axis_dllp2tlp_tkeep;
  logic                  m_axis_dllp2tlp_tvalid;
  logic                  m_axis_dllp2tlp_tlast;
  logic [USER_WIDTH-1:0] m_axis_dllp2tlp_tuser;
  logic                  m_axis_dllp2tlp_tready;


  logic [DATA_WIDTH-1:0] m_axis_dllp2phy_tdata;
  logic [KEEP_WIDTH-1:0] m_axis_dllp2phy_tkeep;
  logic                  m_axis_dllp2phy_tvalid;
  logic                  m_axis_dllp2phy_tlast;
  logic [USER_WIDTH-1:0] m_axis_dllp2phy_tuser;
  logic                  m_axis_dllp2phy_tready;



  dllp_handler #(
      .DATA_WIDTH(DATA_WIDTH),
      .STRB_WIDTH(STRB_WIDTH),
      .KEEP_WIDTH(KEEP_WIDTH),
      .USER_WIDTH(USER_WIDTH)
  ) dllp_handler_inst (
      .clk_i(clk_i),
      .rst_i(rst_i),
      .phy_link_up_i(phy_link_up_i),
      .s_axis_tdata_i(s_axis_phy2dllp_tdata),
      .s_axis_tkeep_i(s_axis_phy2dllp_tkeep),
      .s_axis_tvalid_i(s_axis_phy2dllp_tvalid),
      .s_axis_tlast_i(s_axis_phy2dllp_tlast),
      .s_axis_tuser_i(s_axis_phy2dllp_tuser),
      .s_axis_tready_o(s_axis_phy2dllp_tready),
      .seq_num_o(seq_num_o),
      .seq_num_vld_o(seq_num_vld_o),
      .seq_num_acknack_o(seq_num_acknack_o),
      .fc1_values_stored_o(fc1_values_stored_o),
      .fc2_values_stored_o(fc2_values_stored_o),
      .tx_fc_ph_o(tx_fc_ph_o),
      .tx_fc_pd_o(tx_fc_pd_o),
      .tx_fc_nph_o(tx_fc_nph_o),
      .tx_fc_npd_o(tx_fc_npd_o)
  );


  dllp2tlp #(
      .DATA_WIDTH(DATA_WIDTH),
      .STRB_WIDTH(STRB_WIDTH),
      .KEEP_WIDTH(KEEP_WIDTH),
      .USER_WIDTH(USER_WIDTH),
      .M_COUNT(M_COUNT),
      .MAX_PAYLOAD_SIZE(MAX_PAYLOAD_SIZE),
      .RX_FIFO_SIZE(RX_FIFO_SIZE)
  ) dllp2tlp_inst (
      .clk_i          (clk_i),
      .rst_i          (rst_i),
      .link_status_i  (link_status_i),
      .s_axis_tdata_i (s_axis_phy2tlp_tdata),
      .s_axis_tkeep_i (s_axis_phy2tlp_tkeep),
      .s_axis_tvalid_i(s_axis_phy2tlp_tvalid),
      .s_axis_tlast_i (s_axis_phy2tlp_tlast),
      .s_axis_tuser_i (s_axis_phy2tlp_tuser),
      .s_axis_tready_o(s_axis_phy2tlp_tready),
      .m_axis_tdata_o ({m_axis_dllp2phy_tdata  ,m_axis_dllp2tlp_tdata }),
      .m_axis_tkeep_o ({m_axis_dllp2phy_tkeep  ,m_axis_dllp2tlp_tkeep }),
      .m_axis_tvalid_o({m_axis_dllp2phy_tvalid ,m_axis_dllp2tlp_tvalid  }),
      .m_axis_tlast_o ({m_axis_dllp2phy_tlast  ,m_axis_dllp2tlp_tlast }),
      .m_axis_tuser_o ({m_axis_dllp2phy_tuser  ,m_axis_dllp2tlp_tuser }),
      .m_axis_tready_i({m_axis_dllp2phy_tready ,m_axis_dllp2tlp_tready })
  );

  assign {s_axis_phy2tlp_tdata, s_axis_phy2dllp_tdata} = s_axis_tdata_i;
  assign {s_axis_phy2tlp_tkeep, s_axis_phy2dllp_tkeep} = s_axis_tkeep_i;
  assign {s_axis_phy2tlp_tvalid, s_axis_phy2dllp_tvalid} = s_axis_tvalid_i;
  assign {s_axis_phy2tlp_tlast, s_axis_phy2dllp_tlast} = s_axis_tlast_i;
  assign {s_axis_phy2tlp_tuser, s_axis_phy2dllp_tuser} = s_axis_tuser_i;
  assign s_axis_tready_o = {s_axis_phy2tlp_tready, s_axis_phy2dllp_tready};

  assign m_axis_tdata_o = {m_axis_dllp2tlp_tdata, m_axis_dllp2phy_tdata};
  assign m_axis_tkeep_o = {m_axis_dllp2tlp_tkeep, m_axis_dllp2phy_tkeep};
  assign m_axis_tvalid_o = {m_axis_dllp2tlp_tvalid, m_axis_dllp2phy_tvalid};
  assign m_axis_tlast_o = {m_axis_dllp2tlp_tlast, m_axis_dllp2phy_tlast};
  assign m_axis_tuser_o = {m_axis_dllp2tlp_tuser, m_axis_dllp2phy_tuser};
  assign {m_axis_dllp2tlp_tready, m_axis_dllp2phy_tready} = m_axis_tready_i;


endmodule
