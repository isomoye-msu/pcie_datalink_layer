//! @title dllp_handler
//! @author Idris Somoye
//! Module handles datalink packets received from the physical layer
//! intended for the datalink layer. Datalink packets are decoded and replies are sent to
//! the physical layer through the phy master axis bus.
module dllp_handler
  import pcie_datalink_pkg::*;
#(
    // TLP data width
    parameter int DATA_WIDTH = 32,
    // TLP strobe width
    parameter int STRB_WIDTH = DATA_WIDTH / 8,
    parameter int KEEP_WIDTH = STRB_WIDTH,
    parameter int USER_WIDTH = 4
) (
    //clocks and resets
    input  logic                  clk_i,                // Clock signal
    input  logic                  rst_i,                // Reset signal
    input  logic                  phy_link_up_i,
    //PHY AXIS inputs
    input  logic [DATA_WIDTH-1:0] s_axis_tdata,
    input  logic [KEEP_WIDTH-1:0] s_axis_tkeep,
    input  logic                  s_axis_tvalid,
    input  logic                  s_axis_tlast,
    input  logic [USER_WIDTH-1:0] s_axis_tuser,
    output logic                  s_axis_tready,
    //tlp ack/nak
    output logic [          11:0] seq_num_o,
    output logic                  seq_num_vld_o,
    output logic                  seq_num_acknack_o,
    //flow control values
    output logic                  fc1_values_stored_o,
    output logic                  fc2_values_stored_o,
    //Flow control
    output logic [           7:0] tx_fc_ph_o,
    output logic [          11:0] tx_fc_pd_o,
    output logic [           7:0] tx_fc_nph_o,
    output logic [          11:0] tx_fc_npd_o,
    output logic [           7:0] tx_fc_cplh_o,
    output logic [          11:0] tx_fc_cpld_o,
    output logic                  update_fc_o
);

  localparam int UserIsDllp = 0;

  //tlp to dllp fsm emum
  typedef enum logic [2:0] {
    ST_IDLE,
    ST_CHECK_CRC,
    ST_PROCESS_DLLP,
    ST_DLL_RX_DATA,
    ST_TLP_EOP
  } dll_rx_st_e;

  dll_rx_st_e                   curr_state;
  dll_rx_st_e                   next_state;
  dllp_union_t                  dll_packet_c;
  dllp_union_t                  dll_packet_r;
  //crc helper signals
  logic        [          15:0] crc_in_c;
  logic        [          15:0] crc_in_r;
  logic        [          15:0] crc_out;
  //tlp nulled
  logic                         tlp_nullified_c;
  logic                         tlp_nullified_r;
  logic                         tx_tlp_ready_c;
  logic                         tx_tlp_ready_r;
  //transmit sequence logic
  logic        [          15:0] next_transmit_seq_c;
  logic        [          15:0] next_transmit_seq_r;
  logic        [          11:0] ackd_transmit_seq_c;
  logic        [          11:0] ackd_transmit_seq_r;
  //s axis skid buffer
  logic        [DATA_WIDTH-1:0] skid_s_axis_tdata;
  logic        [KEEP_WIDTH-1:0] skid_s_axis_tkeep;
  logic                         skid_s_axis_tvalid;
  logic                         skid_s_axis_tlast;
  logic        [USER_WIDTH-1:0] skid_s_axis_tuser;
  logic                         skid_s_axis_tready;
  //Flow control
  logic        [           7:0] tx_fc_ph_c;
  logic        [           7:0] tx_fc_ph_r;
  logic        [          11:0] tx_fc_pd_c;
  logic        [          11:0] tx_fc_pd_r;
  logic        [           7:0] tx_fc_nph_c;
  logic        [           7:0] tx_fc_nph_r;
  logic        [          11:0] tx_fc_npd_c;
  logic        [          11:0] tx_fc_npd_r;
  logic        [           7:0] tx_fc_cplh_c;
  logic        [           7:0] tx_fc_cplh_r;
  logic        [          11:0] tx_fc_cpld_c;
  logic        [          11:0] tx_fc_cpld_r;
  logic                         update_fc_c;
  logic                         update_fc_r;
  //fc1 vals
  logic                         fc1_np_stored_c;
  logic                         fc1_np_stored_r;
  logic                         fc1_p_stored_c;
  logic                         fc1_p_stored_r;
  logic                         fc1_c_stored_c;
  logic                         fc1_c_stored_r;
  //fc2 vals
  logic                         fc2_np_stored_c;
  logic                         fc2_np_stored_r;
  logic                         fc2_p_stored_c;
  logic                         fc2_p_stored_r;
  logic                         fc2_c_stored_c;
  logic                         fc2_c_stored_r;
  logic                [          15:0] crc_reversed;

  assign fc1_values_stored_o = fc1_np_stored_r & fc1_p_stored_r & fc1_c_stored_r;
  assign fc2_values_stored_o = fc2_np_stored_r & fc2_p_stored_r & fc2_c_stored_r;

  always_comb begin : byteswap
    crc_reversed = ~crc_in_r;
    // for (int i = 0; i < 8; i++) begin
    //   crc_reversed[i]   = ~crc_in_r[7-i];
    //   crc_reversed[i+8] = ~crc_in_r[15-i];
    // end
  end

  always @(posedge clk_i) begin : main_seq
    if (rst_i) begin
      curr_state          <= ST_IDLE;
      next_transmit_seq_r <= '0;
      dll_packet_r        <= '0;
      //crc signals
      crc_in_r            <= '0;
      //flow control
      tx_fc_ph_r          <= '0;
      tx_fc_pd_r          <= '0;
      tx_fc_nph_r         <= '0;
      tx_fc_npd_r         <= '0;
      tx_fc_cplh_r        <= '0;
      tx_fc_cpld_r        <= '0;
      //capture signals
      fc1_np_stored_r     <= '0;
      fc1_p_stored_r      <= '0;
      fc1_c_stored_r      <= '0;
      fc2_np_stored_r     <= '0;
      fc2_p_stored_r      <= '0;
      fc2_c_stored_r      <= '0;
      update_fc_r         <= '0;
    end else begin
      curr_state          <= next_state;
      next_transmit_seq_r <= next_transmit_seq_c;
      dll_packet_r        <= dll_packet_c;
      //crc signals
      crc_in_r            <= crc_in_c;
      //flow control
      tx_fc_ph_r          <= tx_fc_ph_c;
      tx_fc_pd_r          <= tx_fc_pd_c;
      tx_fc_nph_r         <= tx_fc_nph_c;
      tx_fc_npd_r         <= tx_fc_npd_c;
      tx_fc_cplh_r        <= tx_fc_cplh_c;
      tx_fc_cpld_r        <= tx_fc_cpld_c;
      //capture signals
      fc1_np_stored_r     <= fc1_np_stored_c;
      fc1_p_stored_r      <= fc1_p_stored_c;
      fc1_c_stored_r      <= fc1_c_stored_c;
      fc2_np_stored_r     <= fc2_np_stored_c;
      fc2_p_stored_r      <= fc2_p_stored_c;
      fc2_c_stored_r      <= fc2_c_stored_c;
      update_fc_r         <= update_fc_c;
    end
  end


  always_comb begin : main_combo
    next_state          = curr_state;
    next_transmit_seq_c = next_transmit_seq_r;
    dll_packet_c        = dll_packet_r;
    skid_s_axis_tready  = '0;
    //crc signals
    crc_in_c            = crc_in_r;
    //ack_nack signals
    seq_num_o           = '0;
    seq_num_vld_o       = '0;
    seq_num_acknack_o   = '0;
    //flow control
    tx_fc_ph_c          = tx_fc_ph_r;
    tx_fc_pd_c          = tx_fc_pd_r;
    tx_fc_nph_c         = tx_fc_nph_r;
    tx_fc_npd_c         = tx_fc_npd_r;
    tx_fc_cplh_c        = tx_fc_cplh_r;
    tx_fc_cpld_c        = tx_fc_cpld_r;
    update_fc_c         = '0;
    //capture signals
    fc1_np_stored_c     = fc1_np_stored_r;
    fc1_p_stored_c      = fc1_p_stored_r;
    fc1_c_stored_c      = fc1_c_stored_r;
    fc2_np_stored_c     = fc2_np_stored_r;
    fc2_p_stored_c      = fc2_p_stored_r;
    fc2_c_stored_c      = fc2_c_stored_r;
    case (curr_state)
      ST_IDLE: begin
        if (phy_link_up_i) begin
          skid_s_axis_tready = '1;
          if (skid_s_axis_tvalid && skid_s_axis_tuser[UserIsDllp]) begin
            dll_packet_c = skid_s_axis_tdata;
            crc_in_c     = crc_out;
            next_state   = ST_CHECK_CRC;
          end
        end
      end
      ST_CHECK_CRC: begin
        skid_s_axis_tready = '1;
        if (skid_s_axis_tvalid && skid_s_axis_tuser[UserIsDllp]) begin
          if (crc_reversed == skid_s_axis_tdata[15:0]) begin
            //process tlp
            next_state = ST_PROCESS_DLLP;
          end
          else begin
            next_state = ST_IDLE;
          end
        end
      end
      ST_PROCESS_DLLP: begin
        //drop ready and process tlp... a little inefficient since we reduce bandwidth
        //but this should not be a bottleneck
        casez (dll_packet_r.generic.dllp_type)
          Ack: begin
            seq_num_o         = get_ack_nack_seq(dll_packet_r.ack_nack);
            seq_num_vld_o     = '1;
            seq_num_acknack_o = '1;
          end
          Nak: begin
            seq_num_o     = get_ack_nack_seq(dll_packet_r.ack_nack);
            seq_num_vld_o = '1;
          end
          PM_Enter_L1: begin
            //not implemented
          end
          PM_Enter_L23: begin
            //not implemented
          end
          PM_Actv_St_Req_L1: begin
            //not implemented
          end
          PM_Request_Ack: begin
            //not implemented
          end
          Vendor_Specific: begin
            //not implemented
          end
          InitFC1_P: begin
            get_fc_values(tx_fc_ph_c, tx_fc_pd_c, dll_packet_r.flow_control);
            fc1_p_stored_c = '1;
          end
          InitFC1_NP: begin
            get_fc_values(tx_fc_nph_c, tx_fc_npd_c, dll_packet_r.flow_control);
            fc1_np_stored_c = '1;
          end
          InitFC1_Cpl: begin
            get_fc_values(tx_fc_cplh_c, tx_fc_cpld_c, dll_packet_r.flow_control);
            fc1_c_stored_c = '1;
          end
          InitFC2_P: begin
            get_fc_values(tx_fc_ph_c, tx_fc_pd_c, dll_packet_r.flow_control);
            fc2_p_stored_c = '1;
          end
          InitFC2_NP: begin
            get_fc_values(tx_fc_nph_c, tx_fc_npd_c, dll_packet_r.flow_control);
            fc2_np_stored_c = '1;
          end
          InitFC2_Cpl: begin
            get_fc_values(tx_fc_cplh_c, tx_fc_cpld_c, dll_packet_r.flow_control);
            fc2_c_stored_c = '1;
            update_fc_c = '1;
          end
          UpdateFC_P: begin
            get_fc_values(tx_fc_ph_c, tx_fc_pd_c, dll_packet_r.flow_control);
            update_fc_c = '1;
          end
          UpdateFC_NP: begin
            get_fc_values(tx_fc_nph_c, tx_fc_npd_c, dll_packet_r.flow_control);
            update_fc_c = '1;
          end
          UpdateFC_Cpl: begin
            get_fc_values(tx_fc_cplh_c, tx_fc_cpld_c, dll_packet_r.flow_control);
            update_fc_c = '1;
          end
          default: begin
          end
        endcase
        next_state = ST_IDLE;
      end
      default: begin
      end
    endcase
  end

  pcie_datalink_crc pcie_datalink_crc_inst (
      .crcIn ('1),
      .data  (skid_s_axis_tdata),
      .crcOut(crc_out)
  );

  //axis skid buffer
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
      .s_axis_tdata(s_axis_tdata),
      .s_axis_tkeep(s_axis_tkeep),
      .s_axis_tvalid(s_axis_tvalid),
      .s_axis_tready(s_axis_tready),
      .s_axis_tlast(s_axis_tlast),
      .s_axis_tid('0),
      .s_axis_tdest('0),
      .s_axis_tuser(s_axis_tuser),
      .m_axis_tdata(skid_s_axis_tdata),
      .m_axis_tkeep(skid_s_axis_tkeep),
      .m_axis_tvalid(skid_s_axis_tvalid),
      .m_axis_tready(skid_s_axis_tready),
      .m_axis_tlast(skid_s_axis_tlast),
      .m_axis_tid(),
      .m_axis_tdest(),
      .m_axis_tuser(skid_s_axis_tuser)
  );

  assign tx_fc_ph_o   = tx_fc_ph_r;
  assign tx_fc_pd_o   = tx_fc_pd_r;
  assign tx_fc_nph_o  = tx_fc_nph_r;
  assign tx_fc_npd_o  = tx_fc_npd_r;
  assign tx_fc_cplh_o = tx_fc_cplh_r;
  assign tx_fc_cpld_o = tx_fc_cpld_r;
  assign update_fc_o  = update_fc_r;

endmodule
