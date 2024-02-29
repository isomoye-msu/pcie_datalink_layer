#=============================================================
# 
# Copyright (c) 2016 Simon Southwell. All rights reserved.
#
# Date: 20th Sep 2016
#
# This file is part of the pcieVHost package.
#
# pcieVHost is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# pcieVHost is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with pcieVHost. If not, see <http://www.gnu.org/licenses/>.
#
# $Id: ltssm.c,v 1.2 2016/10/10 13:09:13 simon Exp $
# $Source: /home/simon/CVS/src/HDL/pcieVHost/src/ltssm.c,v $
#
#=============================================================
#
# Implements a PCIe LTSSM function. NB. IT IS NOT COMPLETE,
# and is meant only to be able to power up a link to L0. With 
# LTSSM_ABBREVIATED defined, sequence is shortened in various
# places, and timeouts reduced.
#
#=============================================================
# -------------------------------------------------------------------------
# INCLUDES
# -------------------------------------------------------------------------
import ltssm
import pcie
import pci_express
import enum

class ltssm_state(enum):
    LTSSM_DETECT = 0
    LTSSM_POLLING = 1
    LTSSM_CONFIG = 2
    LTSSM_RECOVERY = 3
    LTSSM_DISABLED = 4
    LTSSM_HOTRESET = 5
    LTSSM_LOOPBACK = 6
    LTSSM_L0 = 7
    LTSSM_L0s = 8
    LTSSM_L1 = 9
    LTSSM_L2 = 10
    
# -------------------------------------------------------------------------
# DEFINES
# -------------------------------------------------------------------------
# Assume a clock rate of 500MHz
class ltssm():
    
    def __init__(self):
        self.CLK_CYCLE_NS = 2
        self.CYCLES_1US = (1000 / CLK_CYCLE_NS)
        self.CYCLES_1MS = (1000 * CYCLES_1US)
        self.CYCLES_12MS = (12 * CYCLES_1MS)
        self.DEFAULT_N_FTS = 4
        self.DEFAULT_TS_CTL = 0
        self.DEFAULT_LINKNUM = 0
        self.ENABLE_LANENUMS = 0
        self.TS_CTL_HOT_RESET = 0x01
        self.TS_CTL_DISABLE = 0x02
        self.TS_CTL_LOOPBACK = 0x04
        self.TS_CTL_NO_SCRAMBLE = 0x08
        self.state = ltssm_state()
        self.LTSSM_ABBREVIATED = True
        self.PCIE_POLLING_ACTIVE_TX_COUNT = 16 if self.LTSSM_ABBREVIATED else 1024
        self.DEFAULT_DETECT_QUIET_TIMEOUT = 1500 if self.LTSSM_ABBREVIATED else CYLES_12MS
        self.DEFAULT_MAX_LINK_WIDTH = 16
        self.DEFAULT_MAX_LINK_WIDTH_MASK = ((1 << self.DEFAULT_MAX_LINK_WIDTH) - 1)
        self.DEFAULT_ENABLED_TESTS = 0
        self.DEFAULT_FORCE_TESTS = 0
        self.LTSSM_SET_MINIMUM = 0
        # -------------------------------------------------------------------------
        # STATICS
        # -------------------------------------------------------------------------
        # The array initialisations are quite gcc oriented, and may not be portable.
        # However, there are other things restricting the code to linux, so use for now.
        self.ltssm_linknum = [self.DEFAULT_LINKNUM] * ltssm.VP_MAX_NODES
        self.ltssm_ts_ctl = [self.DEFAULT_TS_CTL] * ltssm.VP_MAX_NODES
        self.ltssm_n_fts = [self.DEFAULT_N_FTS] * ltssm.VP_MAX_NODES
        self.ltssm_max_link_width = [self.DEFAULT_MAX_LINK_WIDTH] * ltssm.VP_MAX_NODES
        self.ltssm_max_link_mask = [self.DEFAULT_MAX_LINK_WIDTH_MASK] * ltssm.VP_MAX_NODES
        self.ltssm_detect_quiet_to = [self.DEFAULT_DETECT_QUIET_TIMEOUT] * ltssm.VP_MAX_NODES
        self.ltssm_enable_tests = [self.DEFAULT_ENABLED_TESTS] * ltssm.VP_MAX_NODES
        self.ltssm_force_tests = [self.DEFAULT_FORCE_TESTS] * ltssm.VP_MAX_NODES
        self.ltssm_tx_n_fts = [0] * ltssm.VP_MAX_NODES
        self.config_disable = [False] * ltssm.VP_MAX_NODES
        self.config_loopback = [False] * ltssm.VP_MAX_NODES
        self.polling_compliance = [False] * ltssm.VP_MAX_NODES
    # -------------------------------------------------------------------------
    # Detect()
    # -------------------------------------------------------------------------
    async def Detect(self,link_width, node):
        i = 0
        rcvr_idle_status = ctypes.c_uint32()
        self.ltssm_max_link_width[node] = link_width
        self.ltssm_max_link_mask[node] = ((1 << self.ltssm_max_link_width[node]) - 1) & 0xffff
        # Quiet
        self.log.info("---> Detect Quiet (node %d)" % node)
        # Loop until rcvr_idle_status indicates at least one lane not idle
        while i < self.ltssm_detect_quiet_to[node] and (rcvr_idle_status.value & ltssm_max_link_mask[node]) == ltssm_max_link_mask[node]:
            SendIdle(1, node)
            rcvr_idle_status.value = VRead(LINK_STATE, node)
            DebugVPrint("---> i=%d node=%d ltssm_detect_quiet_to[node]=%d rcvr_idle_status=0x%08x ltssm_max_link_mask[node]=0x%08x" %
                        (i, node, ltssm_detect_quiet_to[node], rcvr_idle_status.value, ltssm_max_link_mask[node]))
            i += 1
        # Active (If no rcvr detect, assume all 16 lanes are present)
        VPrint("---> Detect Active (node %d)" % node)
        rcvr_idle_status.value = VRead(LINK_STATE, node)
        VPrint("---> rcvr_idle_status = %x (node %d)" % (rcvr_idle_status.value & ltssm_max_link_mask[node], node))
        # Exit to polling
        return LTSSM_POLLING

    async def Polling(active_lanes, node):
        ts1_count = [0] * MAX_LINK_WIDTH
        ts2_count = [0] * MAX_LINK_WIDTH
        ts_status = TS_t()
        i = 0
        # Assumes here that what is on lane 0 is common to all lanes
        # Clear TS rx state
        ResetEventCount(TS1_ID, node)
        ResetEventCount(TS2_ID, node)
        # --- force compliance ---
        if not polling_compliance[node] and (ltssm_force_tests[node] & ENABLE_COMPLIANCE or (ltssm_enable_tests[node] & ENABLE_COMPLIANCE and (PcieRand(node) % 3) == 0)):
            VPrint("---> Polling Compliance (node %d)" % node)
            polling_compliance[node] = True
            VWrite(LINK_STATE, (1 << (PcieRand(node) % ltssm_max_link_width[node])) | ~ltssm_max_link_mask[node], 1, node)
            # This is a very nasty hack, of which I am appropriately ashamed.
            # It is an open loop delay long enough for endpoint to timeout in
            # polling.active and go to compliance for a while, before we
            # continue to polling.active.
            SendIdle((28000) // 4, node)
        # --- Active ---
        VPrint("---> Polling Active (node %d)" % node)
        i = 0
        VWrite(LINK_STATE, (~ltssm_max_link_mask[node]) & 0xffff, 1, node)
        while (ts1_count[0] < 8 and ts2_count[0] < 8) or i < PCIE_POLLING_ACTIVE_TX_COUNT:
            SendTs(TS1_ID, PAD, PAD, ltssm_n_fts[node], ltssm_ts_ctl[VP_MAX_NODES], False, node)
            ReadEventCount(TS1_ID, ts1_count, node)
            ReadEventCount(TS2_ID, ts2_count, node)
            ts_status = GetTS(0, node)
            if ts1_count[0] or ts2_count[0] or i:
                i += 1
            if (ts1_count[0] or ts2_count[0]) and (ts_status.linknum != PAD or ts_status.lanenum != PAD):
                ts1_count[0] = ts2_count[0] = 0
        # --- Config ---
        VPrint("---> Polling Config (node %d)" % node)
        i = 0
        ResetEventCount(TS2_ID, node)
        while ts2_count[0] < 8 or i < 16:
            SendTs(TS2_ID, PAD, PAD, ltssm_n_fts[node], ltssm_ts_ctl[VP_MAX_NODES], False, node)
            ReadEventCount(TS2_ID, ts2_count, node)
            ts_status = GetTS(0, node)
            if ts2_count[0] or i:
                i += 1
            if ts2_count[0] and (ts_status.linknum != PAD or ts_status.lanenum != PAD):
                ts2_count[0] = 0
                ResetEventCount(TS2_ID, node)
        active_lanes[0] = 0
        for i in range(MAX_LINK_WIDTH):
            active_lanes[0] |= (1 if ts2_count[i] else 0) << i
        VPrint("---> Active lanes = 0x%04x (node %d)" % (active_lanes[0], node))
        # Exit to configuration
        return LTSSM_CONFIG
    
    # -------------------------------------------------------------------------
    # Configuration()
    # -------------------------------------------------------------------------
    def Configuration(active_lanes, target_state, node):
        ts1_count = [0] * MAX_LINK_WIDTH
        ts2_count = [0] * MAX_LINK_WIDTH
        lnkwidth = 16 if (active_lanes & 0x8000) else 8 if (active_lanes & 0x80) else 4 if (active_lanes & 0x8) else 2 if (active_lanes & 0x2) else 1
        
        print(f"lnkwidth = {lnkwidth}")
        
        print(f"---> Configuration Start (node {node})")
        
        if config_disable[node] == False and ((ltssm_force_tests[node] & ENABLE_DISABLE) or ((ltssm_enable_tests[node] & ENABLE_DISABLE) and ((random.randint(0, 2)) == 0))):
            config_disable[node] = True
            print(f"---> Going to Disabled from Configuration Start (node {node})")
            return LTSSM_DISABLED
        
        if config_loopback[node] == False and ((ltssm_force_tests[node] & ENABLE_LOOPBACK) or ((ltssm_enable_tests[node] & ENABLE_LOOPBACK) and ((random.randint(0, 2)) == 0))):
            config_loopback[node] = True
            print(f"---> Going to Loopback from Configuration Start (node {node})")
            return LTSSM_LOOPBACK
        
        ResetEventCount(TS1_ID, node)
        
        while True:
            SendTs(TS1_ID, PAD, ltssm_linknum[node], ltssm_n_fts[node], ltssm_ts_ctl[VP_MAX_NODES], False, node)
            ReadEventCount(TS1_ID, ts1_count, node)
            ts_status = GetTS(0, node)
            
            if ts1_count[0] and ts_status.linknum == PAD:
                ts1_count[0] = 0
                ResetEventCount(TS1_ID, node)
            
            if ts1_count[0] >= 2 and ts_status.linknum == ltssm_linknum[node]:
                break
        
        print(f"---> Configuration Linkwidth Accept (node {node})")
        print(f"---> Configuration Lanenum Wait (node {node})")
        
        ResetEventCount(TS1_ID, node)
        
        while True:
            SendTs(TS1_ID, ENABLE_LANENUMS, ltssm_linknum[node], ltssm_n_fts[node], ltssm_ts_ctl[VP_MAX_NODES], False, node)
            
            for i in range(lnkwidth):
                ts_status = GetTS(i, node)
                ReadEventCount(TS1_ID, ts1_count, node)
                
                if ts_status.linknum != ltssm_linknum[node] or ts_status.lanenum != i:
                    ts1_count[0] = 0
                    ResetEventCount(TS1_ID, node)
            
            if ts1_count[0] >= 2:
                break
        
        print(f"---> Configuration Lanenum Accept (node {node})")
        
        ResetEventCount(TS1_ID, node)
        
        while True:
            SendTs(TS1_ID, ENABLE_LANENUMS, ltssm_linknum[node], ltssm_n_fts[node], ltssm_ts_ctl[VP_MAX_NODES], False, node)
            
            for i in range(lnkwidth):
                ts_status = GetTS(i, node)
                ReadEventCount(TS1_ID, ts1_count, node)
                
                if ts_status.linknum != ltssm_linknum[node] and ts_status.lanenum != i:
                    ts1_count[i] = 0
                    ResetEventCount(TS1_ID, node)
            
            if ts1_count[0] >= 2:
                break
        
        print(f"---> Configuration Complete (node {node})")
        
        ResetEventCount(TS2_ID, node)
        ts2_sendcount = 0
        
        while True:
            SendTs(TS2_ID, ENABLE_LANENUMS, ltssm_linknum[node], ltssm_n_fts[node], ltssm_ts_ctl[VP_MAX_NODES], False, node)
            
            if ts2_count[0]:
                ts2_sendcount += 1
            
            for i in range(lnkwidth):
                ts_status = GetTS(i, node)
                ReadEventCount(TS2_ID, ts2_count, node)
                
                if ts_status.linknum != ltssm_linknum[node] and ts_status.lanenum != i:
                    ts2_count[0] = 0
            
            if ts2_count[0] >= 8 and ts2_sendcount >= 16:
                break
        
        ltssm_tx_n_fts[node] = ts_status.n_fts
        
        print(f"---> Configuration Idle (node {node})")
        
        i = 0
        ResetEventCount(0, node)
        
        while True:
            SendIdle(1, node)
            ReadEventCount(0, ts2_count, node)
            
            if ts2_count[0]:
                i += 1
            
            print(f"--->i = {i} ts2_count[0] = {ts2_count[0]} (node {node})")
            
            if i >= 16 and ts2_count[0] >= 8:
                break
        
        print(f"---> Configuration exit to L0 (node {node})")
        
        return LTSSM_L0

    def TxL0s(target_state, active_lanes, ticks, node):
        print(f"---> TxL0s Entry (node {node})")
        
        SetTxDisabled(node)
        SendOs(IDL, node)
        
        VWrite(LINK_STATE, 0xffff, 1, node)
        
        print(f"---> TxL0s Idle: sleeping for {ticks} ticks (node {node})")
        
        SendIdle(ticks, node)
        
        print(f"---> TxL0s FTS (node {node})")
        
        VWrite(LINK_STATE, ~(active_lanes & ltssm_max_link_mask[node]) & 0xffff, 1, node)
        
        for i in range(ltssm_tx_n_fts[node]):
            SendOs(FTS, node)
        
        SendOs(SKP, node)
        
        SetTxEnabled(node)
        
        return LTSSM_L0

    def Recovery(target_state, node):
        ts1_count = [0] * MAX_LINK_WIDTH
        ts2_count = [0] * MAX_LINK_WIDTH
        idl_count = [0] * MAX_LINK_WIDTH
        change_config = False
        
        print(f"---> Recovery Lock (node {node})")
        
        ResetEventCount(TS1_ID, node)
        ResetEventCount(TS2_ID, node)
        
        if (random.randint(0, 15) & 0xf) == 0:
            change_config = True
        
        while True:
            SendTs(TS1_ID, ENABLE_LANENUMS, ltssm_linknum[node], ltssm_n_fts[node], ltssm_ts_ctl[VP_MAX_NODES], False, node)
            ReadEventCount(TS1_ID, ts1_count, node)
            ReadEventCount(TS2_ID, ts2_count, node)
            
            if ts1_count[0] >= 8 or ts2_count[0] >= 8:
                break
        
        if change_config:
            ltssm_n_fts[node] = random.randint(0, 251) + 4
        
        print(f"---> Recovery RcvrCfg (node {node})")
        
        ResetEventCount(IDL, node)
        ResetEventCount(TS2_ID, node)
        
        i = 0
        
        while True:
            SendTs(TS2_ID, ENABLE_LANENUMS, ltssm_linknum[node], ltssm_n_fts[node], ltssm_ts_ctl[VP_MAX_NODES], False, node)
            ReadEventCount(TS2_ID, ts2_count, node)
            ReadEventCount(IDL, idl_count, node)
            
            if idl_count[0] or ts2_count[0] == 0:
                i = 0
                ResetEventCount(IDL, node)
                ResetEventCount(TS2_ID, node)
            else:
                i += 1
            
            if ts2_count[0] >= 8 and i >= 16:
                break
        
        ts_status = GetTS(0, node)
        ltssm_tx_n_fts[node] = ts_status.n_fts
        
        if 0 and change_config:
            print(f"---> Leaving Recovery (node {node})")
            return LTSSM_CONFIG
        
        print(f"---> Recovery Idle (node {node})")
        
        i = 0
        ResetEventCount(0, node)
        
        while True:
            SendIdle(1, node)
            ReadEventCount(0, ts2_count, node)
            
            if ts2_count[0]:
                i += 1
            
            if i >= 16 and ts2_count[0] >= 8:
                break
        
        print(f"---> Leaving Recovery (node {node})")
        
        return LTSSM_L0

    def Disabled(node):
        idl_count = [0] * MAX_LINK_WIDTH
        
        print(f"---> Disabled (node {node})")
        
        ResetEventCount(IDL, node)
        
        for i in range(16):
            SendTs(TS1_ID, ENABLE_LANENUMS, ltssm_linknum[node], ltssm_n_fts[node], TS_CNTL_DISABLE_LINK, False, node)
        
        SendOs(IDL, node)
        
        VWrite(LINK_STATE, 0xffff, 1, node)
        
        while True:
            ReadEventCount(IDL, idl_count, node)
            SendIdle(1, node)
            
            if idl_count[0]:
                break
        
        rand_idle = 100
        
        print(f"---> Waiting for {rand_idle} ticks (node {node})")
        
        SendIdle(rand_idle, node)
        
        print(f"---> Leaving Disabled for Detect (node {node})")
        
        return LTSSM_DETECT

    def Loopback(node):
        ts1_count = [0] * MAX_LINK_WIDTH
        ts_status = None
        count = [0] * MAX_LINK_WIDTH
        
        print(f"---> Loopback (node {node})")
        
        ResetEventCount(TS1_ID, node)
        
        while True:
            SendTs(TS1_ID, ENABLE_LANENUMS, ltssm_linknum[node], ltssm_n_fts[node], TS_CTL_LOOPBACK, False, node)
            ReadEventCount(TS1_ID, count, node)
            ts_status = GetTS(0, node)
            
            print(f"count[0] = {count[0]} ts_status.control = {ts_status.control}")
            
            if count[0] > 0 and ts_status.control & TS_CNTL_LOOPBACK:
                break
        
        print(f"---> Loopback.Active (node {node})")
        
        for i in range(64):
            SendTs(TS1_ID, ENABLE_LANENUMS, ltssm_linknum[node], ltssm_n_fts[node], TS_CTL_LOOPBACK, False, node)
        
        print(f"---> Loopback.Exit (node {node})")
        
        ResetEventCount(IDL, node)
        
        SendOs(IDL, node)
        
        VWrite(LINK_STATE, 0xffff, 1, node)
        
        while True:
            ReadEventCount(IDL, count, node)
            SendIdle(1, node)
            
            if count[0]:
                break
        
        rand_idle = 1000
        
        print(f"---> Waiting for {rand_idle} ticks (node {node})")
        
        SendIdle(rand_idle, node)
        
        print(f"---> Leaving Loopback for Detect (node {node})")
        
        return LTSSM_DETECT

    def HotReset(HotResetTO, node):
        loops = HotResetTO
        
        if loops < 2:
            loops = 2
        
        for i in range(loops):
            SendTs(TS1_ID, 0, ltssm_linknum[node], ltssm_n_fts[node], TS_CNTL_HOT_RESET, False, node)
        
        return LTSSM_DETECT

    def L1(time_in_l1_param, node):
        time_in_l1 = time_in_l1_param
        
        if time_in_l1 < 30:
            time_in_l1 = 30
        
        VWrite(LINK_STATE, 0xffff, 1, node)
        SendIdle(time_in_l1, node)
        
        return LTSSM_RECOVERY

    def L2(time_in_l2_param, node):
        time_in_l2 = time_in_l2_param
        
        if time_in_l2 < 10:
            time_in_l2 = 10
        
        VWrite(LINK_STATE, 0xffff, 1, node)
        SendIdle(time_in_l2, node)
        
        return LTSSM_DETECT

    def LinkState(ltssm_state, target_state, link_width, node):
        active_lanes = 0
        
        if ltssm_state == LTSSM_DETECT:
            return Detect(link_width, node)
        elif ltssm_state == LTSSM_POLLING:
            return Polling(active_lanes, node)
        elif ltssm_state == LTSSM_CONFIG:
            return Configuration(active_lanes, target_state, node)
        elif ltssm_state == LTSSM_DISABLED:
            return Disabled(node)
        elif ltssm_state == LTSSM_LOOPBACK:
            return Loopback(node)
        elif ltssm_state == LTSSM_HOTRESET:
            return HotReset(LTSSM_SET_MINIMUM, node)
        elif ltssm_state == LTSSM_L1:
            return L1(LTSSM_SET_MINIMUM, node)
        elif ltssm_state == LTSSM_L2:
            return L2(LTSSM_SET_MINIMUM, node)
        elif ltssm_state == LTSSM_RECOVERY:
            return Recovery(target_state, node)
        elif ltssm_state == LTSSM_L0s:
            return TxL0s(target_state, active_lanes, 0, node)
        else:
            print(f"***Error: InitLink() reached unsupported or invalid LTSSM state ({ltssm_state})")
            VWrite(PVH_FATAL, 0, 0, node)
        
        return ltssm_state

    def InitLink(link_width, node):
        ltssm_state = LTSSM_DETECT
        
        while ltssm_state != LTSSM_L0:
            ltssm_state = LinkState(ltssm_state, LTSSM_L0, link_width, node)
            print(f"ltssm_state = {ltssm_state}")

    def ConfigLinkInit(cfg, node):
        ltssm_linknum[node] = ltssm_linknum[node] if cfg.ltssm_linknum == LINK_INIT_NO_CHANGE else cfg.ltssm_linknum & 0xff
        ltssm_n_fts[node] = ltssm_n_fts[node] if cfg.ltssm_n_fts == LINK_INIT_NO_CHANGE else cfg.ltssm_n_fts & 0xff
        ltssm_ts_ctl[node] = ltssm_ts_ctl[node] if cfg.ltssm_ts_ctl == LINK_INIT_NO_CHANGE else cfg.ltssm_ts_ctl & 0x1f
        ltssm_detect_quiet_to[node] = ltssm_detect_quiet_to[node] if cfg.ltssm_detect_quiet_to == LINK_INIT_NO_CHANGE else cfg.ltssm_detect_quiet_to
        ltssm_enable_tests[node] = ltssm_enable_tests[node] if cfg.ltssm_enable_tests == LINK_INIT_NO_CHANGE else cfg.ltssm_enable_tests
        ltssm_force_tests[node] = ltssm_force_tests[node] if cfg.ltssm_force_tests == LINK_INIT_NO_CHANGE else cfg.ltssm_force_tests


