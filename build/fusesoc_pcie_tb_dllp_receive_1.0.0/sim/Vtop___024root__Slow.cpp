// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtop.h for the primary calling header

#include "verilated.h"
#include "verilated_dpi.h"

#include "Vtop__Syms.h"
#include "Vtop___024root.h"

// Parameter definitions for Vtop___024root
constexpr CData/*0:0*/ Vtop___024root::dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__KEEP_ENABLE;
constexpr CData/*0:0*/ Vtop___024root::dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__LAST_ENABLE;
constexpr CData/*0:0*/ Vtop___024root::dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__ID_ENABLE;
constexpr CData/*0:0*/ Vtop___024root::dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__DEST_ENABLE;
constexpr CData/*0:0*/ Vtop___024root::dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__USER_ENABLE;
constexpr CData/*0:0*/ Vtop___024root::dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__KEEP_ENABLE;
constexpr CData/*0:0*/ Vtop___024root::dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__LAST_ENABLE;
constexpr CData/*0:0*/ Vtop___024root::dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__ID_ENABLE;
constexpr CData/*0:0*/ Vtop___024root::dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__DEST_ENABLE;
constexpr CData/*0:0*/ Vtop___024root::dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__USER_ENABLE;
constexpr CData/*0:0*/ Vtop___024root::dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__KEEP_ENABLE;
constexpr CData/*0:0*/ Vtop___024root::dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__LAST_ENABLE;
constexpr CData/*0:0*/ Vtop___024root::dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__ID_ENABLE;
constexpr CData/*0:0*/ Vtop___024root::dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__DEST_ENABLE;
constexpr CData/*0:0*/ Vtop___024root::dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__USER_ENABLE;
constexpr CData/*0:0*/ Vtop___024root::dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__KEEP_ENABLE;
constexpr CData/*0:0*/ Vtop___024root::dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__LAST_ENABLE;
constexpr CData/*0:0*/ Vtop___024root::dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__ID_ENABLE;
constexpr CData/*0:0*/ Vtop___024root::dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__DEST_ENABLE;
constexpr CData/*0:0*/ Vtop___024root::dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__USER_ENABLE;
constexpr CData/*0:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__KEEP_ENABLE;
constexpr CData/*0:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__USER_ENABLE;
constexpr CData/*0:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__USER_BAD_FRAME_VALUE;
constexpr CData/*0:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__USER_BAD_FRAME_MASK;
constexpr CData/*0:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__KEEP_ENABLE;
constexpr CData/*0:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__LAST_ENABLE;
constexpr CData/*0:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__ID_ENABLE;
constexpr CData/*0:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__DEST_ENABLE;
constexpr CData/*0:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__USER_ENABLE;
constexpr CData/*0:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__KEEP_ENABLE;
constexpr CData/*0:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__LAST_ENABLE;
constexpr CData/*0:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__ID_ENABLE;
constexpr CData/*0:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__DEST_ENABLE;
constexpr CData/*0:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__USER_ENABLE;
constexpr CData/*0:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__KEEP_ENABLE;
constexpr CData/*0:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__LAST_ENABLE;
constexpr CData/*0:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__ID_ENABLE;
constexpr CData/*0:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__DEST_ENABLE;
constexpr CData/*0:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__USER_ENABLE;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__DATA_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__STRB_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__KEEP_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__USER_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__MAX_PAYLOAD_SIZE;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__RX_FIFO_SIZE;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__UserIsTlp;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__UserIsDllp;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__axis_user_demux_inst__DOT__DATA_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__axis_user_demux_inst__DOT__STRB_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__axis_user_demux_inst__DOT__KEEP_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__axis_user_demux_inst__DOT__USER_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__axis_user_demux_inst__DOT__MAX_PAYLOAD_SIZE;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__axis_user_demux_inst__DOT__RX_FIFO_SIZE;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__axis_user_demux_inst__DOT__UserIsTlp;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__axis_user_demux_inst__DOT__UserIsDllp;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__DATA_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__KEEP_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__ID_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__DEST_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__USER_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__REG_TYPE;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__DATA_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__KEEP_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__ID_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__DEST_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__USER_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__REG_TYPE;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp_handler_inst__DOT__DATA_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp_handler_inst__DOT__STRB_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp_handler_inst__DOT__KEEP_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp_handler_inst__DOT__USER_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp_handler_inst__DOT__UserIsDllp;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__DATA_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__KEEP_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__ID_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__DEST_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__USER_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__REG_TYPE;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp_fc_update_inst__DOT__CLK_RATE;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp_fc_update_inst__DOT__DATA_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp_fc_update_inst__DOT__STRB_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp_fc_update_inst__DOT__KEEP_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp_fc_update_inst__DOT__USER_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp_fc_update_inst__DOT__MAX_PAYLOAD_SIZE;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp_fc_update_inst__DOT__PdMinCredits;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp_fc_update_inst__DOT__ClockPeriodNs;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp_fc_update_inst__DOT__TwoMsTimeOut;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp_fc_update_inst__DOT__FcWaitPeriod;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__DATA_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__KEEP_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__ID_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__DEST_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__USER_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__REG_TYPE;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__DATA_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__STRB_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__KEEP_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__USER_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__MAX_PAYLOAD_SIZE;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__RX_FIFO_SIZE;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__PdMinCredits;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__FcWaitPeriod;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__TlpAxis;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__UserIsTlp;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__MaxTlpHdrSizeDW;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__MaxTlpTotalSizeDW;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__MinRxBufferSize;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__RamDataWidth;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__RamAddrWidth;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__DEPTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__DATA_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__KEEP_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__LAST_ENABLE;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__ID_ENABLE;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__ID_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__DEST_ENABLE;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__DEST_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__USER_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__RAM_PIPELINE;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__OUTPUT_FIFO_ENABLE;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__FRAME_FIFO;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__DROP_OVERSIZE_FRAME;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__DROP_BAD_FRAME;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__DROP_WHEN_FULL;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__MARK_WHEN_FULL;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__PAUSE_ENABLE;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__FRAME_PAUSE;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__ADDR_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__OUTPUT_FIFO_ADDR_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__KEEP_OFFSET;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__LAST_OFFSET;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__ID_OFFSET;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__DEST_OFFSET;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__USER_OFFSET;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__DATA_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__KEEP_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__ID_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__DEST_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__USER_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__REG_TYPE;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__DATA_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__KEEP_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__ID_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__DEST_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__USER_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__REG_TYPE;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__DATA_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__KEEP_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__ID_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__DEST_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__USER_WIDTH;
constexpr IData/*31:0*/ Vtop___024root::dllp_receive__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__REG_TYPE;


void Vtop___024root___ctor_var_reset(Vtop___024root* vlSelf);

Vtop___024root::Vtop___024root(Vtop__Syms* symsp, const char* v__name)
    : VerilatedModule{v__name}
    , vlSymsp{symsp}
 {
    // Reset structure values
    Vtop___024root___ctor_var_reset(this);
}

void Vtop___024root::__Vconfigure(bool first) {
    if (false && first) {}  // Prevent unused
}

Vtop___024root::~Vtop___024root() {
}
