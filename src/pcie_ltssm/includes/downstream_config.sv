always_comb begin : main_combo
  next_state                   = curr_state;
  timer_c                      = timer_r;
  error_c                      = error_r;
  success_c                    = success_r;
  lane_status_c                = lane_status_r;
  lanes_detected_c             = lanes_detected_r;
  ordered_set_sent_cnt_c       = ordered_set_sent_cnt_r;
  axis_pkt_cnt_c               = axis_pkt_cnt_r;
  transfer_timer_c             = transfer_timer_r;
  rst_cnt_c                    = rst_cnt_r;
  //axis signals
  phy_axis_tdata               = '0;
  phy_axis_tkeep               = '0;
  phy_axis_tvalid              = '0;
  phy_axis_tlast               = '0;
  phy_axis_tuser               = '0;
  //ordered set
  ordered_set_c                = ordered_set_r;
  //
  idle_to_rlock_transitioned_c = idle_to_rlock_transitioned_r;
  case (curr_state)
    ST_IDLE: begin
      if (en_i) begin
        timer_c = '0;
        next_state = ST_CONFIG_LINKWIDTH_START;
        gen_tsos(ordered_set_c,gen1, TS1);
        ordered_set_sent_cnt_c = '0;
        transfer_timer_c = '0;
        // if (recovery_i && !is_timeout_i) begin
        //   ordered_set_c.rate_id[6] = '1;
        // end
      end
    end
    //-----------------------------------------------------------
    //  Configuration.Linkwidth.Start
    //-----------------------------------------------------------
    ST_CONFIG_LINKWIDTH_START: begin
      //bounded counter for timeout scenario
      timer_c          = (timer_r >= TwentyFourMsTimeOut) ? TwentyFourMsTimeOut : timer_r + 1;
      transfer_timer_c = transfer_timer_r + 1;
      //packet accepted or empty
      if (phy_axis_tready) begin
        //increment packet frame counter
        axis_pkt_cnt_c  = axis_pkt_cnt_r + 1;
        //build axis packet
        phy_axis_tdata  = ordered_set_r[32*axis_pkt_cnt_r+:32];
        phy_axis_tkeep  = '1;
        phy_axis_tvalid = '1;
        phy_axis_tlast  = '0;
        phy_axis_tuser  = 8'h01;
        //check if last packet in frame
        if (axis_pkt_cnt_r == 8'h03) begin
          //assert last
          phy_axis_tlast = '1;
          //reset counter
          axis_pkt_cnt_c = '0;
        end
        //check if new frame
        if (axis_pkt_cnt_r == 8'h00) begin
          //check if pcie state continue scenario satisfied
          if (|link_width_satisfied) begin
            //reset ordered set sent counter
            ordered_set_sent_cnt_c = '0;
            //deassert valid
            phy_axis_tvalid        = '0;
            axis_pkt_cnt_c         = '0;
            //build next ordered set
            gen_tsos(ordered_set_c,gen1, TS1, train_seq_e'(link_selected));
            //reset timer
            timer_c = '0;
            //goto next pcie ltssm state
            next_state = ST_CONFIG_LINKWIDTH_ACCEPT;
          end  //check timeout counter
            else if (timer_r >= TwentyFourMsTimeOut) begin
            //assert error
            error_c    = '1;
            //goto detect
            next_state = ST_WAIT_EN_LOW;
          end
        end
      end
    end
    //-----------------------------------------------------------
    //  Configuration.Linkwidth.Accept
    //-----------------------------------------------------------
    ST_CONFIG_LINKWIDTH_ACCEPT: begin
      //bounded counter for timeout scenario
      timer_c          = (timer_r >= TwoMsTimeOut) ? TwoMsTimeOut : timer_r + 1;
      transfer_timer_c = transfer_timer_r + 1;
      //packet accepted or empty
      if (phy_axis_tready) begin
        //increment packet frame counter
        axis_pkt_cnt_c  = axis_pkt_cnt_r + 1;
        //build axis packet
        phy_axis_tdata  = ordered_set_r[32*axis_pkt_cnt_r+:32];
        phy_axis_tkeep  = '1;
        phy_axis_tvalid = '1;
        phy_axis_tlast  = '0;
        phy_axis_tuser  = 8'h03;
        //check if last packet in frame
        if (axis_pkt_cnt_r == 8'h03) begin
          phy_axis_tlast = '1;
          axis_pkt_cnt_c = '0;
        end
        //check if new frame
        if (axis_pkt_cnt_r == 8'h0) begin
          //check if pcie state continue scenario satisfied
          if ((|link_lanes_formed) && (!(^link_lanes_formed))) begin
            phy_axis_tvalid = '0;
            axis_pkt_cnt_c  = '0;
            timer_c         = '0;
            next_state      = ST_CONFIG_LANENUM_WAIT;
          end  //check timeout counter
            else if (timer_r >= TwoMsTimeOut) begin
            error_c        = '1;
            axis_pkt_cnt_c = '0;
            next_state     = ST_WAIT_EN_LOW;
          end
        end
      end
    end
    //-----------------------------------------------------------
    // Configuration.Lanenum.Accept
    //-----------------------------------------------------------
    ST_CONFIG_LANENUM_ACCEPT: begin
      //bounded counter for timeout scenario
      timer_c = (timer_r >= TwoMsTimeOut) ? TwoMsTimeOut : timer_r + 1;
      transfer_timer_c = transfer_timer_r + 1;
      //packet accepted or empty
      if (phy_axis_tready) begin
        axis_pkt_cnt_c  = axis_pkt_cnt_r + 1;
        //build axis packet
        phy_axis_tdata  = ordered_set_r[32*axis_pkt_cnt_r+:32];
        phy_axis_tkeep  = '1;
        phy_axis_tvalid = '1;
        phy_axis_tlast  = '0;
        phy_axis_tuser  = 8'h03;
        //check if last packet in frame
        if (axis_pkt_cnt_r == 8'h03) begin
          phy_axis_tlast = '1;
          axis_pkt_cnt_c = '0;
        end
        //check if first packet in frame
        if (axis_pkt_cnt_r == 8'h00) begin
          //check if lanes can be formed
          if (|link_lanes_nums_match) begin
            //build ts2 ordered set
            gen_tsos(ordered_set_c,gen1, TS2, train_seq_e'(LINK_NUM), train_seq_e'(0));
            axis_pkt_cnt_c  = '0;
            phy_axis_tvalid = '0;
            timer_c         = '0;
            //goto config complete
            next_state      = ST_CONFIG_COMPLETE;
          end  //check reconfiguration scenario
            else if (|link_lane_reconfig) begin
            timer_c    = '0;
            next_state = ST_CONFIG_LANENUM_WAIT;
          end  //check timeout counter
            else if (timer_r >= TwoMsTimeOut) begin
            //assert error
            error_c        = '1;
            //reset counter
            axis_pkt_cnt_c = '0;
            //goto detect
            next_state     = ST_WAIT_EN_LOW;
          end
        end
      end
    end
    //-----------------------------------------------------------
    //  Configuration.Lanenum.Wait
    //-----------------------------------------------------------
    ST_CONFIG_LANENUM_WAIT: begin
      //bounded timeout counter increment
      timer_c = (timer_r >= TwoMsTimeOut) ? TwoMsTimeOut : timer_r + 1;
      transfer_timer_c = transfer_timer_r + 1;
      //packet accepted or empty
      if (phy_axis_tready) begin
        //increment packet count
        axis_pkt_cnt_c  = axis_pkt_cnt_r + 1;
        //build axis packet
        phy_axis_tdata  = ordered_set_r[32*axis_pkt_cnt_r+:32];
        phy_axis_tkeep  = '1;
        phy_axis_tvalid = '1;
        phy_axis_tlast  = '0;
        phy_axis_tuser  = 8'h03;
        //check if last packet in frame
        if (axis_pkt_cnt_r == 8'h03) begin
          //assert last
          phy_axis_tlast = '1;
          axis_pkt_cnt_c = '0;
        end
        //check if first packet in frame or last packet in frame has been sent
        if (axis_pkt_cnt_r == 8'h00) begin
          //check if lane wait exit scenario satisfied
          if (|ts1_lanenum_wait_satisfied) begin
            axis_pkt_cnt_c  = '0;
            phy_axis_tvalid = '0;
            timer_c         = '0;
            //goto lanenum accept
            next_state      = ST_CONFIG_LANENUM_ACCEPT;
          end  //check timeout counter
            else if (timer_r >= TwoMsTimeOut) begin
            //assert error
            error_c    = '1;
            //goto detect
            next_state = ST_WAIT_EN_LOW;
          end
        end
      end
    end
    //-----------------------------------------------------------
    //  Configuration.Complete
    //-----------------------------------------------------------
    ST_CONFIG_COMPLETE: begin
      //bounded timeout counter
      timer_c = (timer_r >= TwoMsTimeOut) ? TwoMsTimeOut : timer_r + 1;
      transfer_timer_c = transfer_timer_r + 1;
      //packet sent or empty
      if (phy_axis_tready) begin
        //increment packet counter
        axis_pkt_cnt_c  = axis_pkt_cnt_r + 1;
        //build axis pkt
        phy_axis_tdata  = ordered_set_r[32*axis_pkt_cnt_r+:32];
        phy_axis_tkeep  = '1;
        phy_axis_tvalid = '1;
        phy_axis_tlast  = '0;
        phy_axis_tuser  = 8'h03;
        //check if last pkt in frame
        if (axis_pkt_cnt_r == 8'h03) begin
          phy_axis_tlast = '1;
          axis_pkt_cnt_c = '0;
        end
        //check if first pkt in frame or last pkt is sent
        if (axis_pkt_cnt_r == 8'h00) begin
          //check exit scenario
          if (&lane_num_formed) begin
            //decrement counts
            axis_pkt_cnt_c = '0;
            ordered_set_sent_cnt_c = '0;
            phy_axis_tvalid = '0;
            timer_c = '0;
            //build idle ordered set
            gen_idle(ordered_set_c);
            //goto config idle
            next_state = ST_CONFIG_IDLE;
          end  //check timeout counter
            else if (timer_r >= TwoMsTimeOut) begin
            //assert error
            error_c = '1;
            //goto idle
            next_state = ST_WAIT_EN_LOW;
          end
        end
      end
    end
    //-----------------------------------------------------------
    //  Configuration.Idle
    //-----------------------------------------------------------
    ST_CONFIG_IDLE: begin
      //bounded timeout counter
      timer_c = (timer_r >= TwoMsTimeOut) ? TwoMsTimeOut : timer_r + 1;
      transfer_timer_c = transfer_timer_r + 1;
      //pkt empty
      if (phy_axis_tready) begin
        //increment pkt cnt
        axis_pkt_cnt_c  = axis_pkt_cnt_r + 1;
        //build axis pkt
        phy_axis_tdata  = ordered_set_r[32*axis_pkt_cnt_r+:32];
        phy_axis_tkeep  = '1;
        phy_axis_tvalid = '1;
        phy_axis_tlast  = '0;
        phy_axis_tuser  = 8'h03;
        //check if pkt is last
        if (axis_pkt_cnt_r == 8'h03) begin
          //reset pkt count
          axis_pkt_cnt_c = '0;
          //assert last
          phy_axis_tlast = '1;
        end
        //check last pkt sent
        if (axis_pkt_cnt_r == 8'h00) begin
          //check if idle recieved
          if (single_idle_recieved) begin
            //start counting idle OS sent
            ordered_set_sent_cnt_c = ordered_set_sent_cnt_r + 1;
          end
          //check if number of idle OS recieved and idle OS sent
          if (link_idle_satisfied && (ordered_set_sent_cnt_r >= 16)) begin
            //assert success.. tells ltssm hierarchy to move to its next state
            success_c = '1;
            //reset counters
            ordered_set_sent_cnt_c = '0;
            //deassert valid
            phy_axis_tvalid = '0;
            axis_pkt_cnt_c = '0;
            //increment idle_to_rlock_transitioned_c
            idle_to_rlock_transitioned_c = idle_to_rlock_transitioned_r + 1;
            //goto wait for ena low
            next_state = ST_WAIT_EN_LOW;
          end  //check timeout counter
            else if (timer_r >= TwoMsTimeOut) begin
            //deassert valid
            phy_axis_tvalid = '0;
            idle_to_rlock_transitioned_c = '1;
            //assert error
            error_c = '1;
            //goto wait low
            next_state = ST_WAIT_EN_LOW;
          end
        end
      end
    end
    ST_WAIT_EN_LOW: begin
      //wait until enable is low
      if (!en_i) begin
        //go back to idle
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
//  Lane based Ordered-Sets handling logic
//-----------------------------------------------------------
for (genvar i = 0; i < MAX_NUM_LANES; i++) begin : gen_cnt_ordered_set
  logic [7:0] ts1_cnt;
  logic [7:0] ts2_cnt;
  logic [7:0] lane_in_save;
  logic first_ts1;
  //determine if TS1 req satisfied for lane by its count
  assign link_width_satisfied[i] = (ts1_cnt == 8'h2);
  //determine if TS1 req satisfied for lane by its count
  assign link_lanes_formed[i] = (ts1_cnt == 8'h2);
  //determine if TS1 req satisfied
  assign ts1_lanenum_wait_satisfied[i] = (ts1_cnt == 8'h2);
  assign link_lanes_nums_match[i] = (ts1_cnt == 8'h2);
  assign link_lane_reconfig[i] = (ts1_cnt == 8'h2);
  assign lane_num_formed[i] = lane_active_i[i] ? (ts2_cnt == 8'h8) : '1;
  //determine if TS1 req satisfied for lane by its count
  assign link_idle_satisfied[i] = (ts1_cnt == 8'h8);
  always_ff @(posedge clk_i) begin : cnt_ts1
    if (rst_i) begin
      //reset count and selected incoming link number
      ts1_cnt <= '0;
      ts2_cnt <= '0;
      first_ts1 <= '0;
      link_selected <= '0;
      lane_in_save <= '0;
      single_idle_recieved[i] <= '0;
    end else begin
      case (curr_state)
        ST_IDLE: begin
          ts1_cnt <= '0;
          ts2_cnt <= '0;
          first_ts1 <= '0;
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
            if (((link_num_i[i*8+:8] == PAD) && (lane_num_i[i*8+:8] == PAD))) begin
              first_ts1 <= '1;
            end
            //check that link number is not pad and that lane number is pad
            if ((link_num_i[i*8+:8] != PAD) && (lane_num_i[i*8+:8] == PAD) && first_ts1) begin
              //incrment ts1 count
              ts1_cnt <= ts1_cnt + 1;
            end else begin
              //reset ts1 cnt... this ensures that the TS1-OS are consecutive per the spec
              ts1_cnt <= '0;
            end
          end
          //check if consecutive TS1's satisfied for this lane
          if (link_width_satisfied[i]) begin
            //select link number by choosing lowest significant lane satisfied
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
            if ((link_num_i[i] == link_selected)) begin
              //increment count
              ts1_cnt <= ts1_cnt + 1;
              lane_in_save <= link_num_i[i];
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
            if (((link_num_i[i] != PAD) && (lane_num_i[i] != lane_in_save))) begin
              ts1_cnt <= ts1_cnt + 1;
            end else begin
              ts1_cnt <= '0;
            end
          end
        end
        ST_CONFIG_LANENUM_ACCEPT: begin
          if (next_state != curr_state) begin
            ts1_cnt <= '0;
            ts2_cnt <= '0;
            single_idle_recieved[i] <= '0;
          end else if (ts1_valid_i[i] && (ts1_cnt != 8'h2)) begin
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
            (lane_num_i[i] == lane_num_transmitted_i[i]) &&
            rate_id_i == gen3) begin
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
          //using ts1_cnt as idle count
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
