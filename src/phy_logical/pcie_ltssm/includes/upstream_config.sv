always_comb begin : main_combo
  next_state             = curr_state;
  timer_c                = timer_r;
  error_c                = error_r;
  success_c              = success_r;
  lane_status_c          = lane_status_r;
  lanes_detected_c       = lanes_detected_r;
  ordered_set_sent_cnt_c = ordered_set_sent_cnt_r;
  axis_pkt_cnt_c         = axis_pkt_cnt_r;
  rst_cnt_c              = rst_cnt_r;
  //axis signals
  phy_axis_tdata         = '0;
  phy_axis_tkeep         = '0;
  phy_axis_tvalid        = '0;
  phy_axis_tlast         = '0;
  phy_axis_tuser         = '0;
  //training seq
  ordered_set_c          = ordered_set_r;
  case (curr_state)
    ST_IDLE: begin
      if (en_i) begin
        rate_id_e rate_id = gen3;
        if (recovery_i && !is_timeout_i) begin
          rate_id[6] = '1;
        end
        timer_c    = '0;
        next_state = ST_CONFIG_LINKWIDTH_START;
        gen_tsos(ordered_set_c, TS1,,, rate_id);
        ordered_set_sent_cnt_c = '0;
      end
    end
    //-----------------------------------------------------------
    //  Configuration.Linkwidth.Start
    //-----------------------------------------------------------
    ST_CONFIG_LINKWIDTH_START: begin
      timer_c = (timer_r >= TwentyFourMsTimeOut) ? TwentyFourMsTimeOut : timer_r + 1;
      if (phy_axis_tready) begin
        axis_pkt_cnt_c  = axis_pkt_cnt_r + 1;
        phy_axis_tdata  = ordered_set_r[32*axis_pkt_cnt_r+:32];
        phy_axis_tkeep  = '1;
        phy_axis_tvalid = '1;
        phy_axis_tlast  = '0;
        phy_axis_tuser  = 8'h01;
        if (axis_pkt_cnt_r == 8'h03) begin
          phy_axis_tlast = '1;
          axis_pkt_cnt_c = '0;
        end
        if (axis_pkt_cnt_r == 8'h00) begin
          if (|link_width_satisfied) begin
            ordered_set_sent_cnt_c = '0;
            phy_axis_tvalid = '0;
            axis_pkt_cnt_c = '0;
            next_state = ST_CONFIG_LINKWIDTH_ACCEPT;
            gen_tsos(ordered_set_c, TS1, link_selected, 0);
            timer_c = '0;
          end else if (timer_r >= TwentyFourMsTimeOut) begin
            error_c = '1;
            next_state = ST_WAIT_EN_LOW;
          end
        end
      end
    end
    //-----------------------------------------------------------
    //  Configuration.Linkwidth.Accept
    //-----------------------------------------------------------
    ST_CONFIG_LINKWIDTH_ACCEPT: begin
      timer_c = (timer_r >= TwoMsTimeOut) ? TwoMsTimeOut : timer_r + 1;
      if (phy_axis_tready) begin
        axis_pkt_cnt_c  = axis_pkt_cnt_r + 1;
        phy_axis_tdata  = ordered_set_r[32*axis_pkt_cnt_r+:32];
        phy_axis_tkeep  = '1;
        phy_axis_tvalid = '1;
        phy_axis_tlast  = '0;
        phy_axis_tuser  = 8'h03;
        if (axis_pkt_cnt_r == 8'h03) begin
          phy_axis_tlast = '1;
          axis_pkt_cnt_c = '0;
        end
        if (axis_pkt_cnt_r == 8'h0) begin
          if ((|link_lanes_formed) && (!(^link_lanes_formed))) begin
            phy_axis_tvalid = '0;
            axis_pkt_cnt_c = '0;
            timer_c = '0;
            next_state = ST_CONFIG_LANENUM_WAIT;
          end else if (timer_r >= TwoMsTimeOut) begin
            error_c = '1;
            axis_pkt_cnt_c = '0;
            next_state = ST_WAIT_EN_LOW;
          end
        end
      end
    end
    //-----------------------------------------------------------
    // Configuration.Lanenum.Accept
    //-----------------------------------------------------------
    ST_CONFIG_LANENUM_ACCEPT: begin
      if (phy_axis_tready) begin
        axis_pkt_cnt_c  = axis_pkt_cnt_r + 1;
        phy_axis_tdata  = ordered_set_r[32*axis_pkt_cnt_r+:32];
        phy_axis_tkeep  = '1;
        phy_axis_tvalid = '1;
        phy_axis_tlast  = '0;
        phy_axis_tuser  = 8'h03;
        if (axis_pkt_cnt_r == 8'h03) begin
          phy_axis_tlast = '1;
          axis_pkt_cnt_c = '0;
        end
        if (axis_pkt_cnt_r == 8'h00) begin
          if (|link_lanes_nums_match) begin
            gen_tsos(ordered_set_c, TS2, LINK_NUM, 0);
            next_state = ST_CONFIG_COMPLETE;
            axis_pkt_cnt_c = '0;
            phy_axis_tvalid = '0;
            timer_c = '0;
          end else if (|link_lane_reconfig) begin
            timer_c = '0;
            next_state = ST_CONFIG_LANENUM_WAIT;
          end
        end
      end
    end
    //-----------------------------------------------------------
    //  Configuration.Lanenum.Wait
    //-----------------------------------------------------------
    ST_CONFIG_LANENUM_WAIT: begin
      timer_c = (timer_r >= TwoMsTimeOut) ? TwoMsTimeOut : timer_r + 1;
      if (phy_axis_tready) begin
        axis_pkt_cnt_c  = axis_pkt_cnt_r + 1;
        phy_axis_tdata  = ordered_set_r[32*axis_pkt_cnt_r+:32];
        phy_axis_tkeep  = '1;
        phy_axis_tvalid = '1;
        phy_axis_tlast  = '0;
        phy_axis_tuser  = 8'h03;
        if (axis_pkt_cnt_r == 8'h03) begin
          phy_axis_tlast = '1;
          axis_pkt_cnt_c = '0;
        end
        if (axis_pkt_cnt_r == 8'h00) begin
          if (|ts1_lanenum_wait_satisfied) begin
            axis_pkt_cnt_c = '0;
            phy_axis_tvalid = '0;
            timer_c = '0;
            next_state = ST_CONFIG_LANENUM_ACCEPT;
          end else if (timer_r >= TwoMsTimeOut) begin
            error_c = '1;
            next_state = ST_WAIT_EN_LOW;
          end
        end
      end
    end
    //-----------------------------------------------------------
    //  Configuration.Complete
    //-----------------------------------------------------------
    ST_CONFIG_COMPLETE: begin
      timer_c = (timer_r >= TwoMsTimeOut) ? TwoMsTimeOut : timer_r + 1;
      if (phy_axis_tready) begin
        axis_pkt_cnt_c  = axis_pkt_cnt_r + 1;
        phy_axis_tdata  = ordered_set_r[32*axis_pkt_cnt_r+:32];
        phy_axis_tkeep  = '1;
        phy_axis_tvalid = '1;
        phy_axis_tlast  = '0;
        phy_axis_tuser  = 8'h03;
        if (axis_pkt_cnt_r == 8'h03) begin
          phy_axis_tlast = '1;
          axis_pkt_cnt_c = '0;
        end
        if (axis_pkt_cnt_r == 8'h00) begin
          if (&lane_num_formed) begin
            axis_pkt_cnt_c = '0;
            ordered_set_sent_cnt_c = '0;
            phy_axis_tvalid = '0;
            timer_c = '0;
            next_state = ST_CONFIG_IDLE;
            ordered_set_c = gen_sds_os();
          end else if (timer_r >= TwoMsTimeOut) begin
            error_c = '1;
            next_state = ST_WAIT_EN_LOW;
          end
        end
      end
    end
    //-----------------------------------------------------------
    //  Configuration.Idle
    //-----------------------------------------------------------
    ST_CONFIG_IDLE: begin
      timer_c = (timer_r >= TwoMsTimeOut) ? TwoMsTimeOut : timer_r + 1;
      if (phy_axis_tready) begin
        axis_pkt_cnt_c  = axis_pkt_cnt_r + 1;
        phy_axis_tdata  = ordered_set_r[32*axis_pkt_cnt_r+:32];
        phy_axis_tkeep  = '1;
        phy_axis_tvalid = '1;
        phy_axis_tlast  = '0;
        phy_axis_tuser  = 8'h03;
        if (axis_pkt_cnt_r == 8'h03) begin
          phy_axis_tlast = '1;
        end
        if (axis_pkt_cnt_r == 8'h00) begin
          gen_idle(ordered_set_c);
          if (single_idle_recieved) begin
            ordered_set_sent_cnt_c = ordered_set_sent_cnt_r + 1;
          end
          if (link_idle_satisfied && (ordered_set_sent_cnt_r >= 16)) begin
            success_c = '1;
            ordered_set_sent_cnt_c = '0;
            phy_axis_tvalid = '0;
            axis_pkt_cnt_c = '0;
            next_state = ST_WAIT_EN_LOW;
          end else if (timer_r >= TwoMsTimeOut) begin
            error_c = '1;
            next_state = ST_WAIT_EN_LOW;
          end
        end
      end
    end
    ST_WAIT_EN_LOW: begin
      if (!en_i) begin
        next_state = ST_IDLE;
        success_c = '0;
        error_c = '0;
      end
    end
    default: begin
    end
  endcase
end

//-----------------------------------------------------------
//  Lane based Ordered set handling logic
//-----------------------------------------------------------
for (genvar i = 0; i < MAX_NUM_LANES; i++) begin : gen_cnt_ordered_set
  logic [7:0] ts1_cnt;
  logic [7:0] ts2_cnt;

  //determine if TS1 req satisfied for lane by its count
  assign link_width_satisfied[i] = (ts1_cnt == 8'h2);
  //determine if TS1 req satisfied for lane by its count
  assign link_lanes_formed[i] = (ts1_cnt == 8'h2);
  //determine if TS1 req satisfied
  assign ts1_lanenum_wait_satisfied[i] = (ts1_cnt == 8'h2) | (ts2_cnt == 8'h2);
  assign link_lanes_nums_match[i] = (ts2_cnt == 8'h2);
  assign link_lane_reconfig[i] = (ts1_cnt == 8'h2);
  assign lane_num_formed[i] = lane_active_i[i] ? (ts2_cnt == 8'h8) : '1;
  //determine if TS1 req satisfied for lane by its count
  assign link_idle_satisfied[i] = (ts1_cnt == 8'h8);


  always_ff @(posedge clk_i) begin : cnt_ts1
    if (rst_i) begin
      //reset count and selected incoming link number
      ts1_cnt <= '0;
      ts2_cnt <= '0;
      link_selected <= '0;
      single_idle_recieved[i] <= '0;
    end else begin
      case (curr_state)
        ST_IDLE: begin
          ts1_cnt <= '0;
          ts2_cnt <= '0;
          single_idle_recieved[i] <= '0;
        end
        ST_CONFIG_LINKWIDTH_START: begin
          if (next_state != curr_state) begin
            ts1_cnt <= '0;
            ts2_cnt <= '0;
            single_idle_recieved[i] <= '0;
          end else
          //wait for incoming ts1-os...//skip if threshhold already reached
          if (ts1_valid_i[i] && (ts1_cnt != 8'h2)) begin
            //check that link number is not pad and that lane number is pad
            if (((link_num_i[i*8+:8] != PAD) && (lane_num_i[i*8+:8] == PAD))) begin
              //incrment ts1 count
              ts1_cnt <= ts1_cnt + 1;
            end else begin
              //reset ts1 cnt... this ensures that the TS1-OS are consecutive per the spec
              ts1_cnt <= '0;
            end
          end
          //check if consecutive TS1's satisfied for this lane
          if (link_width_satisfied[i]) begin
            //select link number by choosing lowest significanct lane satisfied
            //ignore all other lanes
            if ((i == 0) || (link_width_satisfied[i:0] == '0)) begin
              link_selected <= link_num_i[i];
            end
          end
        end
        ST_CONFIG_LINKWIDTH_ACCEPT: begin
          if (next_state != curr_state) begin
            ts1_cnt <= '0;
            ts2_cnt <= '0;
            single_idle_recieved[i] <= '0;
          end else
          //wait for incoming ts1-os...//skip if threshhold already reached
          if (ts1_valid_i[i] && (ts1_cnt != 8'h2)) begin
            //check that incoming link number matches the "link_selected"
            //that we are now transmitting and that lane number is different
            //from the one stored when we entered this state
            if (((link_num_i[i] == link_selected) &&
                (lane_num_i[i] != lane_num_transmitted_i[i]))) begin
              //increment count
              ts1_cnt <= ts1_cnt + 1;
            end else begin
              ts1_cnt <= '0;
            end
          end
        end
        ST_CONFIG_LANENUM_WAIT: begin
          if (next_state != curr_state) begin
            ts1_cnt <= '0;
            ts2_cnt <= '0;
            single_idle_recieved[i] <= '0;
          end else if (ts1_valid_i[i] && (ts1_cnt != 8'h2)) begin
            if (ts2_cnt != 8'h2) begin
              ts2_cnt <= '0;
            end
            if (((link_num_i[i] == link_selected) && (lane_num_i[i] != PAD))) begin
              ts1_cnt <= ts1_cnt + 1;
            end else begin
              ts1_cnt <= '0;
            end
          end else if (ts2_valid_i[i] && (ts2_cnt != 8'h2)) begin
            if (ts1_cnt != 8'h2) begin
              ts1_cnt <= '0;
            end
            ts2_cnt <= ts2_cnt + 1;
          end
        end
        ST_CONFIG_LANENUM_ACCEPT: begin
          if (next_state != curr_state) begin
            ts1_cnt <= '0;
            ts2_cnt <= '0;
            single_idle_recieved[i] <= '0;
          end else if (ts2_valid_i[i] && (ts2_cnt != 8'h2)) begin
            if (ts1_cnt != 8'h2) begin
              ts1_cnt <= '0;
            end
            if ((link_num_i[i] == link_selected) &&
              (lane_num_i[i] == lane_num_transmitted_i[i])) begin
              ts2_cnt <= ts2_cnt + 1;
            end else begin
              ts2_cnt <= '0;
            end
          end else if (ts1_valid_i[i] && (ts1_cnt != 8'h2)) begin
            if (ts2_cnt != 8'h2) begin
              ts2_cnt <= '0;
            end
            if ((link_num_i[i] == link_selected) && (lane_num_i[i] != PAD)) begin
              ts1_cnt <= ts1_cnt + 1;
            end else begin
              ts1_cnt <= '0;
            end
          end
        end
        ST_CONFIG_COMPLETE: begin
          if (next_state != curr_state) begin
            ts1_cnt <= '0;
            ts2_cnt <= '0;
            single_idle_recieved[i] <= '0;
          end else if (ts2_valid_i[i] && (ts2_cnt != 8'h8)) begin
            if ((link_num_i[i] == link_selected) &&
            (lane_num_i[i] == lane_num_transmitted_i[i]) ) begin
              ts2_cnt <= ts2_cnt + 1;
              ts1_cnt <= '0;
            end else begin
              ts1_cnt <= '0;
              ts2_cnt <= '0;
            end
          end
        end
        ST_CONFIG_IDLE: begin
          if (next_state != curr_state) begin
            ts1_cnt <= '0;
            ts2_cnt <= '0;
            single_idle_recieved[i] <= '0;
          end else
          //wait for incoming ts1-os...//skip if threshhold already reached
          if (idle_valid_i[i] && (ts1_cnt != 8'h8)) begin
            single_idle_recieved[i] <= '1;
            ts1_cnt <= ts1_cnt + 1;
          end else if (ts1_valid_i || ts2_valid_i) begin
            ts1_cnt <= '0;
          end
        end
        default: begin
        end
      endcase
    end
  end
end : gen_cnt_ordered_set
