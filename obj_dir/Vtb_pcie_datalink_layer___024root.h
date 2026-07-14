// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vtb_pcie_datalink_layer.h for the primary calling header

#ifndef VERILATED_VTB_PCIE_DATALINK_LAYER___024ROOT_H_
#define VERILATED_VTB_PCIE_DATALINK_LAYER___024ROOT_H_  // guard

#include "verilated.h"
#include "Vtb_pcie_datalink_layer___024root.h"
#include "Vtb_pcie_datalink_layer_pcie_config_reg_pkg.h"
class Vtb_pcie_datalink_layer_pcie_tlp_pkg;


class Vtb_pcie_datalink_layer__Syms;
struct Vtb_pcie_datalink_layer_tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__fsm_struct_t__struct__0 {
    CData/*4:0*/ __PVT__state;
    VlWide<4>/*127:0*/ __PVT__tlp_hdr;
    IData/*31:0*/ __PVT__word_count;
    VlWide<4>/*127:0*/ __PVT__cpl_tlp;
    CData/*7:0*/ __PVT__cfg_bus_number;
    CData/*4:0*/ __PVT__cfg_device_number;
    CData/*2:0*/ __PVT__cfg_function_number;
    IData/*31:0*/ __PVT__tlp_dw0;
    CData/*0:0*/ __PVT__tlp_is_3dw;
    CData/*0:0*/ __PVT__tlp_is_sop;
    CData/*0:0*/ __PVT__tlp_is_pd;
    CData/*0:0*/ __PVT__tlp_is_eop;
    VlWide<8>/*255:0*/ __PVT__tlp_data;
    IData/*31:0*/ __PVT__length;

    bool operator==(const Vtb_pcie_datalink_layer_tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__fsm_struct_t__struct__0& rhs) const {
        return __PVT__state == rhs.__PVT__state
            && __PVT__tlp_hdr == rhs.__PVT__tlp_hdr
            && __PVT__word_count == rhs.__PVT__word_count
            && __PVT__cpl_tlp == rhs.__PVT__cpl_tlp
            && __PVT__cfg_bus_number == rhs.__PVT__cfg_bus_number
            && __PVT__cfg_device_number == rhs.__PVT__cfg_device_number
            && __PVT__cfg_function_number == rhs.__PVT__cfg_function_number
            && __PVT__tlp_dw0 == rhs.__PVT__tlp_dw0
            && __PVT__tlp_is_3dw == rhs.__PVT__tlp_is_3dw
            && __PVT__tlp_is_sop == rhs.__PVT__tlp_is_sop
            && __PVT__tlp_is_pd == rhs.__PVT__tlp_is_pd
            && __PVT__tlp_is_eop == rhs.__PVT__tlp_is_eop
            && __PVT__tlp_data == rhs.__PVT__tlp_data
            && __PVT__length == rhs.__PVT__length;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__fsm_struct_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__fsm_struct_t__struct__0& rhs) const {
        if (__PVT__state < rhs.__PVT__state) return true;
        if (rhs.__PVT__state < __PVT__state) return false;
        if (__PVT__tlp_hdr < rhs.__PVT__tlp_hdr) return true;
        if (rhs.__PVT__tlp_hdr < __PVT__tlp_hdr) return false;
        if (__PVT__word_count < rhs.__PVT__word_count) return true;
        if (rhs.__PVT__word_count < __PVT__word_count) return false;
        if (__PVT__cpl_tlp < rhs.__PVT__cpl_tlp) return true;
        if (rhs.__PVT__cpl_tlp < __PVT__cpl_tlp) return false;
        if (__PVT__cfg_bus_number < rhs.__PVT__cfg_bus_number) return true;
        if (rhs.__PVT__cfg_bus_number < __PVT__cfg_bus_number) return false;
        if (__PVT__cfg_device_number < rhs.__PVT__cfg_device_number) return true;
        if (rhs.__PVT__cfg_device_number < __PVT__cfg_device_number) return false;
        if (__PVT__cfg_function_number < rhs.__PVT__cfg_function_number) return true;
        if (rhs.__PVT__cfg_function_number < __PVT__cfg_function_number) return false;
        if (__PVT__tlp_dw0 < rhs.__PVT__tlp_dw0) return true;
        if (rhs.__PVT__tlp_dw0 < __PVT__tlp_dw0) return false;
        if (__PVT__tlp_is_3dw < rhs.__PVT__tlp_is_3dw) return true;
        if (rhs.__PVT__tlp_is_3dw < __PVT__tlp_is_3dw) return false;
        if (__PVT__tlp_is_sop < rhs.__PVT__tlp_is_sop) return true;
        if (rhs.__PVT__tlp_is_sop < __PVT__tlp_is_sop) return false;
        if (__PVT__tlp_is_pd < rhs.__PVT__tlp_is_pd) return true;
        if (rhs.__PVT__tlp_is_pd < __PVT__tlp_is_pd) return false;
        if (__PVT__tlp_is_eop < rhs.__PVT__tlp_is_eop) return true;
        if (rhs.__PVT__tlp_is_eop < __PVT__tlp_is_eop) return false;
        if (__PVT__tlp_data < rhs.__PVT__tlp_data) return true;
        if (rhs.__PVT__tlp_data < __PVT__tlp_data) return false;
        if (__PVT__length < rhs.__PVT__length) return true;
        if (rhs.__PVT__length < __PVT__length) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__fsm_struct_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb_t__struct__0 {
    CData/*0:0*/ __PVT__byte_offset_00;
    CData/*0:0*/ __PVT__byte_offset_04;
    CData/*0:0*/ __PVT__byte_offset_08;
    CData/*0:0*/ __PVT__byte_offset_0C;
    CData/*0:0*/ __PVT__base_address_register_0;
    CData/*0:0*/ __PVT__base_ddress_register_1;
    CData/*0:0*/ __PVT__base_ddress_register_2;
    CData/*0:0*/ __PVT__base_ddress_register_3;
    CData/*0:0*/ __PVT__base_ddress_register_4;
    CData/*0:0*/ __PVT__base_ddress_register_5;
    CData/*0:0*/ __PVT__cardbus_cis_pointer;
    CData/*0:0*/ __PVT__byte_offset_2C;
    CData/*0:0*/ __PVT__capabilities_pointer;
    CData/*0:0*/ __PVT__byte_offset_3C;
    CData/*0:0*/ __PVT__capabilities_power_mngt_pointer;
    CData/*0:0*/ __PVT__power_management_pointer;
    CData/*0:0*/ __PVT__capabilities_power_na_pointer;
    CData/*0:0*/ __PVT__link_control_3_register;
    CData/*0:0*/ __PVT__lane_error_status_register;
    CData/*0:0*/ __PVT__lane_eq_ctrl_register;
    CData/*0:0*/ __PVT__extended_capabilities;

    bool operator==(const Vtb_pcie_datalink_layer_tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb_t__struct__0& rhs) const {
        return __PVT__byte_offset_00 == rhs.__PVT__byte_offset_00
            && __PVT__byte_offset_04 == rhs.__PVT__byte_offset_04
            && __PVT__byte_offset_08 == rhs.__PVT__byte_offset_08
            && __PVT__byte_offset_0C == rhs.__PVT__byte_offset_0C
            && __PVT__base_address_register_0 == rhs.__PVT__base_address_register_0
            && __PVT__base_ddress_register_1 == rhs.__PVT__base_ddress_register_1
            && __PVT__base_ddress_register_2 == rhs.__PVT__base_ddress_register_2
            && __PVT__base_ddress_register_3 == rhs.__PVT__base_ddress_register_3
            && __PVT__base_ddress_register_4 == rhs.__PVT__base_ddress_register_4
            && __PVT__base_ddress_register_5 == rhs.__PVT__base_ddress_register_5
            && __PVT__cardbus_cis_pointer == rhs.__PVT__cardbus_cis_pointer
            && __PVT__byte_offset_2C == rhs.__PVT__byte_offset_2C
            && __PVT__capabilities_pointer == rhs.__PVT__capabilities_pointer
            && __PVT__byte_offset_3C == rhs.__PVT__byte_offset_3C
            && __PVT__capabilities_power_mngt_pointer == rhs.__PVT__capabilities_power_mngt_pointer
            && __PVT__power_management_pointer == rhs.__PVT__power_management_pointer
            && __PVT__capabilities_power_na_pointer == rhs.__PVT__capabilities_power_na_pointer
            && __PVT__link_control_3_register == rhs.__PVT__link_control_3_register
            && __PVT__lane_error_status_register == rhs.__PVT__lane_error_status_register
            && __PVT__lane_eq_ctrl_register == rhs.__PVT__lane_eq_ctrl_register
            && __PVT__extended_capabilities == rhs.__PVT__extended_capabilities;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb_t__struct__0& rhs) const {
        if (__PVT__byte_offset_00 < rhs.__PVT__byte_offset_00) return true;
        if (rhs.__PVT__byte_offset_00 < __PVT__byte_offset_00) return false;
        if (__PVT__byte_offset_04 < rhs.__PVT__byte_offset_04) return true;
        if (rhs.__PVT__byte_offset_04 < __PVT__byte_offset_04) return false;
        if (__PVT__byte_offset_08 < rhs.__PVT__byte_offset_08) return true;
        if (rhs.__PVT__byte_offset_08 < __PVT__byte_offset_08) return false;
        if (__PVT__byte_offset_0C < rhs.__PVT__byte_offset_0C) return true;
        if (rhs.__PVT__byte_offset_0C < __PVT__byte_offset_0C) return false;
        if (__PVT__base_address_register_0 < rhs.__PVT__base_address_register_0) return true;
        if (rhs.__PVT__base_address_register_0 < __PVT__base_address_register_0) return false;
        if (__PVT__base_ddress_register_1 < rhs.__PVT__base_ddress_register_1) return true;
        if (rhs.__PVT__base_ddress_register_1 < __PVT__base_ddress_register_1) return false;
        if (__PVT__base_ddress_register_2 < rhs.__PVT__base_ddress_register_2) return true;
        if (rhs.__PVT__base_ddress_register_2 < __PVT__base_ddress_register_2) return false;
        if (__PVT__base_ddress_register_3 < rhs.__PVT__base_ddress_register_3) return true;
        if (rhs.__PVT__base_ddress_register_3 < __PVT__base_ddress_register_3) return false;
        if (__PVT__base_ddress_register_4 < rhs.__PVT__base_ddress_register_4) return true;
        if (rhs.__PVT__base_ddress_register_4 < __PVT__base_ddress_register_4) return false;
        if (__PVT__base_ddress_register_5 < rhs.__PVT__base_ddress_register_5) return true;
        if (rhs.__PVT__base_ddress_register_5 < __PVT__base_ddress_register_5) return false;
        if (__PVT__cardbus_cis_pointer < rhs.__PVT__cardbus_cis_pointer) return true;
        if (rhs.__PVT__cardbus_cis_pointer < __PVT__cardbus_cis_pointer) return false;
        if (__PVT__byte_offset_2C < rhs.__PVT__byte_offset_2C) return true;
        if (rhs.__PVT__byte_offset_2C < __PVT__byte_offset_2C) return false;
        if (__PVT__capabilities_pointer < rhs.__PVT__capabilities_pointer) return true;
        if (rhs.__PVT__capabilities_pointer < __PVT__capabilities_pointer) return false;
        if (__PVT__byte_offset_3C < rhs.__PVT__byte_offset_3C) return true;
        if (rhs.__PVT__byte_offset_3C < __PVT__byte_offset_3C) return false;
        if (__PVT__capabilities_power_mngt_pointer < rhs.__PVT__capabilities_power_mngt_pointer) return true;
        if (rhs.__PVT__capabilities_power_mngt_pointer < __PVT__capabilities_power_mngt_pointer) return false;
        if (__PVT__power_management_pointer < rhs.__PVT__power_management_pointer) return true;
        if (rhs.__PVT__power_management_pointer < __PVT__power_management_pointer) return false;
        if (__PVT__capabilities_power_na_pointer < rhs.__PVT__capabilities_power_na_pointer) return true;
        if (rhs.__PVT__capabilities_power_na_pointer < __PVT__capabilities_power_na_pointer) return false;
        if (__PVT__link_control_3_register < rhs.__PVT__link_control_3_register) return true;
        if (rhs.__PVT__link_control_3_register < __PVT__link_control_3_register) return false;
        if (__PVT__lane_error_status_register < rhs.__PVT__lane_error_status_register) return true;
        if (rhs.__PVT__lane_error_status_register < __PVT__lane_error_status_register) return false;
        if (__PVT__lane_eq_ctrl_register < rhs.__PVT__lane_eq_ctrl_register) return true;
        if (rhs.__PVT__lane_eq_ctrl_register < __PVT__lane_eq_ctrl_register) return false;
        if (__PVT__extended_capabilities < rhs.__PVT__extended_capabilities) return true;
        if (rhs.__PVT__extended_capabilities < __PVT__extended_capabilities) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer___struct__1 {
    CData/*0:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__1& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__1& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__1& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__1> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__2 {
    CData/*0:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__2& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__2& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__2& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__2> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__3 {
    CData/*0:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__3& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__3& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__3& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__3> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__4 {
    CData/*0:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__4& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__4& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__4& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__4> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__5 {
    CData/*0:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__5& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__5& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__5& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__5> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__6 {
    CData/*0:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__6& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__6& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__6& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__6> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__7 {
    CData/*0:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__7& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__7& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__7& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__7> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__8 {
    CData/*0:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__8& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__8& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__8& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__8> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__9 {
    CData/*0:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__9& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__9& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__9& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__9> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__10 {
    CData/*7:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__10& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__10& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__10& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__10> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__11 {
    CData/*0:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__11& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__11& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__11& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__11> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__12 {
    CData/*0:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__12& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__12& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__12& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__12> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__13 {
    CData/*0:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__13& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__13& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__13& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__13> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__14 {
    CData/*0:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__14& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__14& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__14& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__14> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__15 {
    CData/*0:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__15& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__15& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__15& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__15> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__16 {
    CData/*1:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__16& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__16& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__16& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__16> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__17 {
    CData/*0:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__17& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__17& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__17& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__17> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__18 {
    CData/*0:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__18& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__18& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__18& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__18> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__19 {
    CData/*0:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__19& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__19& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__19& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__19> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__20 {
    CData/*0:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__20& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__20& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__20& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__20> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__21 {
    CData/*0:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__21& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__21& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__21& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__21> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__0 {
    Vtb_pcie_datalink_layer___struct__1 __PVT__bus_master_enable;
    Vtb_pcie_datalink_layer___struct__2 __PVT__special_cycle_enable;
    Vtb_pcie_datalink_layer___struct__3 __PVT__memory_write_invalidate;
    Vtb_pcie_datalink_layer___struct__4 __PVT__vga_palette_snoop;
    Vtb_pcie_datalink_layer___struct__5 __PVT__parity_error_response;
    Vtb_pcie_datalink_layer___struct__6 __PVT__idsel_step_wait_cycle_control;
    Vtb_pcie_datalink_layer___struct__7 __PVT__SERR_Enable;
    Vtb_pcie_datalink_layer___struct__8 __PVT__fast_b2b_transactions_enable;
    Vtb_pcie_datalink_layer___struct__9 __PVT__interrupt_disable;
    Vtb_pcie_datalink_layer___struct__10 __PVT__rsvd;
    Vtb_pcie_datalink_layer___struct__11 __PVT__interrupt_status;
    Vtb_pcie_datalink_layer___struct__12 __PVT__capabilities_list;
    Vtb_pcie_datalink_layer___struct__13 __PVT__sixtysix_mhz_capable;
    Vtb_pcie_datalink_layer___struct__14 __PVT__fast_b2b_transactions_capable;
    Vtb_pcie_datalink_layer___struct__15 __PVT__master_data_parity_error;
    Vtb_pcie_datalink_layer___struct__16 __PVT__devsel_timing;
    Vtb_pcie_datalink_layer___struct__17 __PVT__signaled_target_abort;
    Vtb_pcie_datalink_layer___struct__18 __PVT__received_target_abort;
    Vtb_pcie_datalink_layer___struct__19 __PVT__received_master_abort;
    Vtb_pcie_datalink_layer___struct__20 __PVT__signaled_system_error;
    Vtb_pcie_datalink_layer___struct__21 __PVT__detected_parity_error;

    bool operator==(const Vtb_pcie_datalink_layer___struct__0& rhs) const {
        return __PVT__bus_master_enable == rhs.__PVT__bus_master_enable
            && __PVT__special_cycle_enable == rhs.__PVT__special_cycle_enable
            && __PVT__memory_write_invalidate == rhs.__PVT__memory_write_invalidate
            && __PVT__vga_palette_snoop == rhs.__PVT__vga_palette_snoop
            && __PVT__parity_error_response == rhs.__PVT__parity_error_response
            && __PVT__idsel_step_wait_cycle_control == rhs.__PVT__idsel_step_wait_cycle_control
            && __PVT__SERR_Enable == rhs.__PVT__SERR_Enable
            && __PVT__fast_b2b_transactions_enable == rhs.__PVT__fast_b2b_transactions_enable
            && __PVT__interrupt_disable == rhs.__PVT__interrupt_disable
            && __PVT__rsvd == rhs.__PVT__rsvd
            && __PVT__interrupt_status == rhs.__PVT__interrupt_status
            && __PVT__capabilities_list == rhs.__PVT__capabilities_list
            && __PVT__sixtysix_mhz_capable == rhs.__PVT__sixtysix_mhz_capable
            && __PVT__fast_b2b_transactions_capable == rhs.__PVT__fast_b2b_transactions_capable
            && __PVT__master_data_parity_error == rhs.__PVT__master_data_parity_error
            && __PVT__devsel_timing == rhs.__PVT__devsel_timing
            && __PVT__signaled_target_abort == rhs.__PVT__signaled_target_abort
            && __PVT__received_target_abort == rhs.__PVT__received_target_abort
            && __PVT__received_master_abort == rhs.__PVT__received_master_abort
            && __PVT__signaled_system_error == rhs.__PVT__signaled_system_error
            && __PVT__detected_parity_error == rhs.__PVT__detected_parity_error;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__0& rhs) const {
        if (__PVT__bus_master_enable < rhs.__PVT__bus_master_enable) return true;
        if (rhs.__PVT__bus_master_enable < __PVT__bus_master_enable) return false;
        if (__PVT__special_cycle_enable < rhs.__PVT__special_cycle_enable) return true;
        if (rhs.__PVT__special_cycle_enable < __PVT__special_cycle_enable) return false;
        if (__PVT__memory_write_invalidate < rhs.__PVT__memory_write_invalidate) return true;
        if (rhs.__PVT__memory_write_invalidate < __PVT__memory_write_invalidate) return false;
        if (__PVT__vga_palette_snoop < rhs.__PVT__vga_palette_snoop) return true;
        if (rhs.__PVT__vga_palette_snoop < __PVT__vga_palette_snoop) return false;
        if (__PVT__parity_error_response < rhs.__PVT__parity_error_response) return true;
        if (rhs.__PVT__parity_error_response < __PVT__parity_error_response) return false;
        if (__PVT__idsel_step_wait_cycle_control < rhs.__PVT__idsel_step_wait_cycle_control) return true;
        if (rhs.__PVT__idsel_step_wait_cycle_control < __PVT__idsel_step_wait_cycle_control) return false;
        if (__PVT__SERR_Enable < rhs.__PVT__SERR_Enable) return true;
        if (rhs.__PVT__SERR_Enable < __PVT__SERR_Enable) return false;
        if (__PVT__fast_b2b_transactions_enable < rhs.__PVT__fast_b2b_transactions_enable) return true;
        if (rhs.__PVT__fast_b2b_transactions_enable < __PVT__fast_b2b_transactions_enable) return false;
        if (__PVT__interrupt_disable < rhs.__PVT__interrupt_disable) return true;
        if (rhs.__PVT__interrupt_disable < __PVT__interrupt_disable) return false;
        if (__PVT__rsvd < rhs.__PVT__rsvd) return true;
        if (rhs.__PVT__rsvd < __PVT__rsvd) return false;
        if (__PVT__interrupt_status < rhs.__PVT__interrupt_status) return true;
        if (rhs.__PVT__interrupt_status < __PVT__interrupt_status) return false;
        if (__PVT__capabilities_list < rhs.__PVT__capabilities_list) return true;
        if (rhs.__PVT__capabilities_list < __PVT__capabilities_list) return false;
        if (__PVT__sixtysix_mhz_capable < rhs.__PVT__sixtysix_mhz_capable) return true;
        if (rhs.__PVT__sixtysix_mhz_capable < __PVT__sixtysix_mhz_capable) return false;
        if (__PVT__fast_b2b_transactions_capable < rhs.__PVT__fast_b2b_transactions_capable) return true;
        if (rhs.__PVT__fast_b2b_transactions_capable < __PVT__fast_b2b_transactions_capable) return false;
        if (__PVT__master_data_parity_error < rhs.__PVT__master_data_parity_error) return true;
        if (rhs.__PVT__master_data_parity_error < __PVT__master_data_parity_error) return false;
        if (__PVT__devsel_timing < rhs.__PVT__devsel_timing) return true;
        if (rhs.__PVT__devsel_timing < __PVT__devsel_timing) return false;
        if (__PVT__signaled_target_abort < rhs.__PVT__signaled_target_abort) return true;
        if (rhs.__PVT__signaled_target_abort < __PVT__signaled_target_abort) return false;
        if (__PVT__received_target_abort < rhs.__PVT__received_target_abort) return true;
        if (rhs.__PVT__received_target_abort < __PVT__received_target_abort) return false;
        if (__PVT__received_master_abort < rhs.__PVT__received_master_abort) return true;
        if (rhs.__PVT__received_master_abort < __PVT__received_master_abort) return false;
        if (__PVT__signaled_system_error < rhs.__PVT__signaled_system_error) return true;
        if (rhs.__PVT__signaled_system_error < __PVT__signaled_system_error) return false;
        if (__PVT__detected_parity_error < rhs.__PVT__detected_parity_error) return true;
        if (rhs.__PVT__detected_parity_error < __PVT__detected_parity_error) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__0> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__23 {
    CData/*7:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__23& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__23& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__23& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__23> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__24 {
    CData/*7:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__24& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__24& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__24& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__24> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__25 {
    CData/*7:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__25& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__25& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__25& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__25> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__26 {
    CData/*7:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__26& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__26& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__26& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__26> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__22 {
    Vtb_pcie_datalink_layer___struct__23 __PVT__cache_line_size_register;
    Vtb_pcie_datalink_layer___struct__24 __PVT__latency_timer_register;
    Vtb_pcie_datalink_layer___struct__25 __PVT__interrupt_line_register;
    Vtb_pcie_datalink_layer___struct__26 __PVT__interrupt_pin_register;

    bool operator==(const Vtb_pcie_datalink_layer___struct__22& rhs) const {
        return __PVT__cache_line_size_register == rhs.__PVT__cache_line_size_register
            && __PVT__latency_timer_register == rhs.__PVT__latency_timer_register
            && __PVT__interrupt_line_register == rhs.__PVT__interrupt_line_register
            && __PVT__interrupt_pin_register == rhs.__PVT__interrupt_pin_register;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__22& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__22& rhs) const {
        if (__PVT__cache_line_size_register < rhs.__PVT__cache_line_size_register) return true;
        if (rhs.__PVT__cache_line_size_register < __PVT__cache_line_size_register) return false;
        if (__PVT__latency_timer_register < rhs.__PVT__latency_timer_register) return true;
        if (rhs.__PVT__latency_timer_register < __PVT__latency_timer_register) return false;
        if (__PVT__interrupt_line_register < rhs.__PVT__interrupt_line_register) return true;
        if (rhs.__PVT__interrupt_line_register < __PVT__interrupt_line_register) return false;
        if (__PVT__interrupt_pin_register < rhs.__PVT__interrupt_pin_register) return true;
        if (rhs.__PVT__interrupt_pin_register < __PVT__interrupt_pin_register) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__22> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__28 {
    IData/*31:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__28& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__28& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__28& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__28> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__27 {
    Vtb_pcie_datalink_layer___struct__28 __PVT__BAR;

    bool operator==(const Vtb_pcie_datalink_layer___struct__27& rhs) const {
        return __PVT__BAR == rhs.__PVT__BAR;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__27& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__27& rhs) const {
        if (__PVT__BAR < rhs.__PVT__BAR) return true;
        if (rhs.__PVT__BAR < __PVT__BAR) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__27> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__30 {
    IData/*31:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__30& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__30& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__30& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__30> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__29 {
    Vtb_pcie_datalink_layer___struct__30 __PVT__BAR;

    bool operator==(const Vtb_pcie_datalink_layer___struct__29& rhs) const {
        return __PVT__BAR == rhs.__PVT__BAR;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__29& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__29& rhs) const {
        if (__PVT__BAR < rhs.__PVT__BAR) return true;
        if (rhs.__PVT__BAR < __PVT__BAR) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__29> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__32 {
    IData/*31:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__32& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__32& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__32& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__32> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__31 {
    Vtb_pcie_datalink_layer___struct__32 __PVT__BAR;

    bool operator==(const Vtb_pcie_datalink_layer___struct__31& rhs) const {
        return __PVT__BAR == rhs.__PVT__BAR;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__31& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__31& rhs) const {
        if (__PVT__BAR < rhs.__PVT__BAR) return true;
        if (rhs.__PVT__BAR < __PVT__BAR) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__31> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__34 {
    IData/*31:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__34& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__34& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__34& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__34> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__33 {
    Vtb_pcie_datalink_layer___struct__34 __PVT__BAR;

    bool operator==(const Vtb_pcie_datalink_layer___struct__33& rhs) const {
        return __PVT__BAR == rhs.__PVT__BAR;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__33& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__33& rhs) const {
        if (__PVT__BAR < rhs.__PVT__BAR) return true;
        if (rhs.__PVT__BAR < __PVT__BAR) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__33> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__36 {
    IData/*31:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__36& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__36& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__36& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__36> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__35 {
    Vtb_pcie_datalink_layer___struct__36 __PVT__word;

    bool operator==(const Vtb_pcie_datalink_layer___struct__35& rhs) const {
        return __PVT__word == rhs.__PVT__word;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__35& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__35& rhs) const {
        if (__PVT__word < rhs.__PVT__word) return true;
        if (rhs.__PVT__word < __PVT__word) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__35> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__38 {
    CData/*7:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__38& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__38& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__38& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__38> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__39 {
    CData/*7:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__39& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__39& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__39& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__39> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__37 {
    Vtb_pcie_datalink_layer___struct__38 __PVT__interrupt_line;
    Vtb_pcie_datalink_layer___struct__39 __PVT__interrupt_pin;

    bool operator==(const Vtb_pcie_datalink_layer___struct__37& rhs) const {
        return __PVT__interrupt_line == rhs.__PVT__interrupt_line
            && __PVT__interrupt_pin == rhs.__PVT__interrupt_pin;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__37& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__37& rhs) const {
        if (__PVT__interrupt_line < rhs.__PVT__interrupt_line) return true;
        if (rhs.__PVT__interrupt_line < __PVT__interrupt_line) return false;
        if (__PVT__interrupt_pin < rhs.__PVT__interrupt_pin) return true;
        if (rhs.__PVT__interrupt_pin < __PVT__interrupt_pin) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__37> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__41 {
    CData/*2:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__41& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__41& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__41& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__41> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__42 {
    CData/*0:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__42& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__42& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__42& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__42> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__43 {
    CData/*0:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__43& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__43& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__43& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__43> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__44 {
    CData/*2:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__44& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__44& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__44& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__44> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__45 {
    CData/*0:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__45& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__45& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__45& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__45> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__46 {
    CData/*0:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__46& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__46& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__46& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__46> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__47 {
    CData/*4:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__47& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__47& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__47& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__47> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__40 {
    Vtb_pcie_datalink_layer___struct__41 __PVT__version;
    Vtb_pcie_datalink_layer___struct__42 __PVT__pme_clock;
    Vtb_pcie_datalink_layer___struct__43 __PVT__dev_spec_init;
    Vtb_pcie_datalink_layer___struct__44 __PVT__aux_current;
    Vtb_pcie_datalink_layer___struct__45 __PVT__d1_support;
    Vtb_pcie_datalink_layer___struct__46 __PVT__d2_support;
    Vtb_pcie_datalink_layer___struct__47 __PVT__pme_support;

    bool operator==(const Vtb_pcie_datalink_layer___struct__40& rhs) const {
        return __PVT__version == rhs.__PVT__version
            && __PVT__pme_clock == rhs.__PVT__pme_clock
            && __PVT__dev_spec_init == rhs.__PVT__dev_spec_init
            && __PVT__aux_current == rhs.__PVT__aux_current
            && __PVT__d1_support == rhs.__PVT__d1_support
            && __PVT__d2_support == rhs.__PVT__d2_support
            && __PVT__pme_support == rhs.__PVT__pme_support;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__40& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__40& rhs) const {
        if (__PVT__version < rhs.__PVT__version) return true;
        if (rhs.__PVT__version < __PVT__version) return false;
        if (__PVT__pme_clock < rhs.__PVT__pme_clock) return true;
        if (rhs.__PVT__pme_clock < __PVT__pme_clock) return false;
        if (__PVT__dev_spec_init < rhs.__PVT__dev_spec_init) return true;
        if (rhs.__PVT__dev_spec_init < __PVT__dev_spec_init) return false;
        if (__PVT__aux_current < rhs.__PVT__aux_current) return true;
        if (rhs.__PVT__aux_current < __PVT__aux_current) return false;
        if (__PVT__d1_support < rhs.__PVT__d1_support) return true;
        if (rhs.__PVT__d1_support < __PVT__d1_support) return false;
        if (__PVT__d2_support < rhs.__PVT__d2_support) return true;
        if (rhs.__PVT__d2_support < __PVT__d2_support) return false;
        if (__PVT__pme_support < rhs.__PVT__pme_support) return true;
        if (rhs.__PVT__pme_support < __PVT__pme_support) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__40> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__49 {
    CData/*1:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__49& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__49& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__49& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__49> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__50 {
    CData/*0:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__50& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__50& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__50& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__50> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__51 {
    CData/*3:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__51& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__51& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__51& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__51> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__52 {
    CData/*1:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__52& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__52& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__52& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__52> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__53 {
    CData/*0:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__53& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__53& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__53& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__53> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__54 {
    CData/*0:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__54& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__54& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__54& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__54> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__55 {
    CData/*0:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__55& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__55& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__55& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__55> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__56 {
    CData/*7:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__56& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__56& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__56& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__56> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__48 {
    Vtb_pcie_datalink_layer___struct__49 __PVT__power_state;
    Vtb_pcie_datalink_layer___struct__50 __PVT__pme_enable;
    Vtb_pcie_datalink_layer___struct__51 __PVT__data_select;
    Vtb_pcie_datalink_layer___struct__52 __PVT__data_scale;
    Vtb_pcie_datalink_layer___struct__53 __PVT__pme_status;
    Vtb_pcie_datalink_layer___struct__54 __PVT__b2_b3_support;
    Vtb_pcie_datalink_layer___struct__55 __PVT__bus_pwr_clk_ctrl_en;
    Vtb_pcie_datalink_layer___struct__56 __PVT__data;

    bool operator==(const Vtb_pcie_datalink_layer___struct__48& rhs) const {
        return __PVT__power_state == rhs.__PVT__power_state
            && __PVT__pme_enable == rhs.__PVT__pme_enable
            && __PVT__data_select == rhs.__PVT__data_select
            && __PVT__data_scale == rhs.__PVT__data_scale
            && __PVT__pme_status == rhs.__PVT__pme_status
            && __PVT__b2_b3_support == rhs.__PVT__b2_b3_support
            && __PVT__bus_pwr_clk_ctrl_en == rhs.__PVT__bus_pwr_clk_ctrl_en
            && __PVT__data == rhs.__PVT__data;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__48& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__48& rhs) const {
        if (__PVT__power_state < rhs.__PVT__power_state) return true;
        if (rhs.__PVT__power_state < __PVT__power_state) return false;
        if (__PVT__pme_enable < rhs.__PVT__pme_enable) return true;
        if (rhs.__PVT__pme_enable < __PVT__pme_enable) return false;
        if (__PVT__data_select < rhs.__PVT__data_select) return true;
        if (rhs.__PVT__data_select < __PVT__data_select) return false;
        if (__PVT__data_scale < rhs.__PVT__data_scale) return true;
        if (rhs.__PVT__data_scale < __PVT__data_scale) return false;
        if (__PVT__pme_status < rhs.__PVT__pme_status) return true;
        if (rhs.__PVT__pme_status < __PVT__pme_status) return false;
        if (__PVT__b2_b3_support < rhs.__PVT__b2_b3_support) return true;
        if (rhs.__PVT__b2_b3_support < __PVT__b2_b3_support) return false;
        if (__PVT__bus_pwr_clk_ctrl_en < rhs.__PVT__bus_pwr_clk_ctrl_en) return true;
        if (rhs.__PVT__bus_pwr_clk_ctrl_en < __PVT__bus_pwr_clk_ctrl_en) return false;
        if (__PVT__data < rhs.__PVT__data) return true;
        if (rhs.__PVT__data < __PVT__data) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__48> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__58 {
    CData/*0:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__58& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__58& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__58& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__58> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__59 {
    CData/*0:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__59& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__59& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__59& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__59> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__57 {
    Vtb_pcie_datalink_layer___struct__58 __PVT__perform_equalization;
    Vtb_pcie_datalink_layer___struct__59 __PVT__link_eq_req_intr_en;

    bool operator==(const Vtb_pcie_datalink_layer___struct__57& rhs) const {
        return __PVT__perform_equalization == rhs.__PVT__perform_equalization
            && __PVT__link_eq_req_intr_en == rhs.__PVT__link_eq_req_intr_en;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__57& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__57& rhs) const {
        if (__PVT__perform_equalization < rhs.__PVT__perform_equalization) return true;
        if (rhs.__PVT__perform_equalization < __PVT__perform_equalization) return false;
        if (__PVT__link_eq_req_intr_en < rhs.__PVT__link_eq_req_intr_en) return true;
        if (rhs.__PVT__link_eq_req_intr_en < __PVT__link_eq_req_intr_en) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__57> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__61 {
    CData/*4:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__61& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__61& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__61& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__61> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__60 {
    Vtb_pcie_datalink_layer___struct__61 __PVT__lane_error;

    bool operator==(const Vtb_pcie_datalink_layer___struct__60& rhs) const {
        return __PVT__lane_error == rhs.__PVT__lane_error;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__60& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__60& rhs) const {
        if (__PVT__lane_error < rhs.__PVT__lane_error) return true;
        if (rhs.__PVT__lane_error < __PVT__lane_error) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__60> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__63 {
    CData/*3:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__63& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__63& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__63& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__63> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__64 {
    CData/*2:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__64& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__64& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__64& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__64> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__65 {
    CData/*3:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__65& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__65& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__65& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__65> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__66 {
    CData/*2:0*/ __PVT__next;
    CData/*0:0*/ __PVT__load_next;

    bool operator==(const Vtb_pcie_datalink_layer___struct__66& rhs) const {
        return __PVT__next == rhs.__PVT__next
            && __PVT__load_next == rhs.__PVT__load_next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__66& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__66& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        if (__PVT__load_next < rhs.__PVT__load_next) return true;
        if (rhs.__PVT__load_next < __PVT__load_next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__66> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__62 {
    Vtb_pcie_datalink_layer___struct__63 __PVT__downstream_tx_preset;
    Vtb_pcie_datalink_layer___struct__64 __PVT__downstream_rx_preset_hint;
    Vtb_pcie_datalink_layer___struct__65 __PVT__upstream_tx_preset;
    Vtb_pcie_datalink_layer___struct__66 __PVT__upstream_rx_preset_hint;

    bool operator==(const Vtb_pcie_datalink_layer___struct__62& rhs) const {
        return __PVT__downstream_tx_preset == rhs.__PVT__downstream_tx_preset
            && __PVT__downstream_rx_preset_hint == rhs.__PVT__downstream_rx_preset_hint
            && __PVT__upstream_tx_preset == rhs.__PVT__upstream_tx_preset
            && __PVT__upstream_rx_preset_hint == rhs.__PVT__upstream_rx_preset_hint;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__62& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__62& rhs) const {
        if (__PVT__downstream_tx_preset < rhs.__PVT__downstream_tx_preset) return true;
        if (rhs.__PVT__downstream_tx_preset < __PVT__downstream_tx_preset) return false;
        if (__PVT__downstream_rx_preset_hint < rhs.__PVT__downstream_rx_preset_hint) return true;
        if (rhs.__PVT__downstream_rx_preset_hint < __PVT__downstream_rx_preset_hint) return false;
        if (__PVT__upstream_tx_preset < rhs.__PVT__upstream_tx_preset) return true;
        if (rhs.__PVT__upstream_tx_preset < __PVT__upstream_tx_preset) return false;
        if (__PVT__upstream_rx_preset_hint < rhs.__PVT__upstream_rx_preset_hint) return true;
        if (rhs.__PVT__upstream_rx_preset_hint < __PVT__upstream_rx_preset_hint) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__62> : public std::true_type {};

struct Vtb_pcie_datalink_layer_tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo_t__struct__0 {
    Vtb_pcie_datalink_layer___struct__0 __PVT__byte_offset_04;
    Vtb_pcie_datalink_layer___struct__22 __PVT__byte_offset_0C;
    Vtb_pcie_datalink_layer___struct__27 __PVT__base_ddress_register_2;
    Vtb_pcie_datalink_layer___struct__29 __PVT__base_ddress_register_3;
    Vtb_pcie_datalink_layer___struct__31 __PVT__base_ddress_register_4;
    Vtb_pcie_datalink_layer___struct__33 __PVT__base_ddress_register_5;
    Vtb_pcie_datalink_layer___struct__35 __PVT__cardbus_cis_pointer;
    Vtb_pcie_datalink_layer___struct__37 __PVT__byte_offset_3C;
    Vtb_pcie_datalink_layer___struct__40 __PVT__capabilities_power_mngt_pointer;
    Vtb_pcie_datalink_layer___struct__48 __PVT__power_management_pointer;
    Vtb_pcie_datalink_layer___struct__57 __PVT__link_control_3_register;
    Vtb_pcie_datalink_layer___struct__60 __PVT__lane_error_status_register;
    Vtb_pcie_datalink_layer___struct__62 __PVT__lane_eq_ctrl_register;

    bool operator==(const Vtb_pcie_datalink_layer_tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo_t__struct__0& rhs) const {
        return __PVT__byte_offset_04 == rhs.__PVT__byte_offset_04
            && __PVT__byte_offset_0C == rhs.__PVT__byte_offset_0C
            && __PVT__base_ddress_register_2 == rhs.__PVT__base_ddress_register_2
            && __PVT__base_ddress_register_3 == rhs.__PVT__base_ddress_register_3
            && __PVT__base_ddress_register_4 == rhs.__PVT__base_ddress_register_4
            && __PVT__base_ddress_register_5 == rhs.__PVT__base_ddress_register_5
            && __PVT__cardbus_cis_pointer == rhs.__PVT__cardbus_cis_pointer
            && __PVT__byte_offset_3C == rhs.__PVT__byte_offset_3C
            && __PVT__capabilities_power_mngt_pointer == rhs.__PVT__capabilities_power_mngt_pointer
            && __PVT__power_management_pointer == rhs.__PVT__power_management_pointer
            && __PVT__link_control_3_register == rhs.__PVT__link_control_3_register
            && __PVT__lane_error_status_register == rhs.__PVT__lane_error_status_register
            && __PVT__lane_eq_ctrl_register == rhs.__PVT__lane_eq_ctrl_register;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo_t__struct__0& rhs) const {
        if (__PVT__byte_offset_04 < rhs.__PVT__byte_offset_04) return true;
        if (rhs.__PVT__byte_offset_04 < __PVT__byte_offset_04) return false;
        if (__PVT__byte_offset_0C < rhs.__PVT__byte_offset_0C) return true;
        if (rhs.__PVT__byte_offset_0C < __PVT__byte_offset_0C) return false;
        if (__PVT__base_ddress_register_2 < rhs.__PVT__base_ddress_register_2) return true;
        if (rhs.__PVT__base_ddress_register_2 < __PVT__base_ddress_register_2) return false;
        if (__PVT__base_ddress_register_3 < rhs.__PVT__base_ddress_register_3) return true;
        if (rhs.__PVT__base_ddress_register_3 < __PVT__base_ddress_register_3) return false;
        if (__PVT__base_ddress_register_4 < rhs.__PVT__base_ddress_register_4) return true;
        if (rhs.__PVT__base_ddress_register_4 < __PVT__base_ddress_register_4) return false;
        if (__PVT__base_ddress_register_5 < rhs.__PVT__base_ddress_register_5) return true;
        if (rhs.__PVT__base_ddress_register_5 < __PVT__base_ddress_register_5) return false;
        if (__PVT__cardbus_cis_pointer < rhs.__PVT__cardbus_cis_pointer) return true;
        if (rhs.__PVT__cardbus_cis_pointer < __PVT__cardbus_cis_pointer) return false;
        if (__PVT__byte_offset_3C < rhs.__PVT__byte_offset_3C) return true;
        if (rhs.__PVT__byte_offset_3C < __PVT__byte_offset_3C) return false;
        if (__PVT__capabilities_power_mngt_pointer < rhs.__PVT__capabilities_power_mngt_pointer) return true;
        if (rhs.__PVT__capabilities_power_mngt_pointer < __PVT__capabilities_power_mngt_pointer) return false;
        if (__PVT__power_management_pointer < rhs.__PVT__power_management_pointer) return true;
        if (rhs.__PVT__power_management_pointer < __PVT__power_management_pointer) return false;
        if (__PVT__link_control_3_register < rhs.__PVT__link_control_3_register) return true;
        if (rhs.__PVT__link_control_3_register < __PVT__link_control_3_register) return false;
        if (__PVT__lane_error_status_register < rhs.__PVT__lane_error_status_register) return true;
        if (rhs.__PVT__lane_error_status_register < __PVT__lane_error_status_register) return false;
        if (__PVT__lane_eq_ctrl_register < rhs.__PVT__lane_eq_ctrl_register) return true;
        if (rhs.__PVT__lane_eq_ctrl_register < __PVT__lane_eq_ctrl_register) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer___struct__68 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__68& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__68& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__68& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__68> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__69 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__69& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__69& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__69& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__69> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__70 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__70& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__70& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__70& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__70> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__71 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__71& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__71& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__71& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__71> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__72 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__72& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__72& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__72& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__72> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__73 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__73& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__73& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__73& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__73> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__74 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__74& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__74& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__74& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__74> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__75 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__75& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__75& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__75& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__75> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__76 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__76& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__76& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__76& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__76> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__77 {
    CData/*7:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__77& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__77& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__77& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__77> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__78 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__78& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__78& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__78& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__78> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__79 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__79& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__79& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__79& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__79> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__80 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__80& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__80& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__80& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__80> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__81 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__81& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__81& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__81& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__81> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__82 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__82& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__82& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__82& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__82> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__83 {
    CData/*1:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__83& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__83& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__83& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__83> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__84 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__84& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__84& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__84& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__84> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__85 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__85& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__85& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__85& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__85> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__86 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__86& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__86& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__86& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__86> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__87 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__87& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__87& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__87& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__87> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__88 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__88& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__88& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__88& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__88> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__67 {
    Vtb_pcie_datalink_layer___struct__68 __PVT__bus_master_enable;
    Vtb_pcie_datalink_layer___struct__69 __PVT__special_cycle_enable;
    Vtb_pcie_datalink_layer___struct__70 __PVT__memory_write_invalidate;
    Vtb_pcie_datalink_layer___struct__71 __PVT__vga_palette_snoop;
    Vtb_pcie_datalink_layer___struct__72 __PVT__parity_error_response;
    Vtb_pcie_datalink_layer___struct__73 __PVT__idsel_step_wait_cycle_control;
    Vtb_pcie_datalink_layer___struct__74 __PVT__SERR_Enable;
    Vtb_pcie_datalink_layer___struct__75 __PVT__fast_b2b_transactions_enable;
    Vtb_pcie_datalink_layer___struct__76 __PVT__interrupt_disable;
    Vtb_pcie_datalink_layer___struct__77 __PVT__rsvd;
    Vtb_pcie_datalink_layer___struct__78 __PVT__interrupt_status;
    Vtb_pcie_datalink_layer___struct__79 __PVT__capabilities_list;
    Vtb_pcie_datalink_layer___struct__80 __PVT__sixtysix_mhz_capable;
    Vtb_pcie_datalink_layer___struct__81 __PVT__fast_b2b_transactions_capable;
    Vtb_pcie_datalink_layer___struct__82 __PVT__master_data_parity_error;
    Vtb_pcie_datalink_layer___struct__83 __PVT__devsel_timing;
    Vtb_pcie_datalink_layer___struct__84 __PVT__signaled_target_abort;
    Vtb_pcie_datalink_layer___struct__85 __PVT__received_target_abort;
    Vtb_pcie_datalink_layer___struct__86 __PVT__received_master_abort;
    Vtb_pcie_datalink_layer___struct__87 __PVT__signaled_system_error;
    Vtb_pcie_datalink_layer___struct__88 __PVT__detected_parity_error;

    bool operator==(const Vtb_pcie_datalink_layer___struct__67& rhs) const {
        return __PVT__bus_master_enable == rhs.__PVT__bus_master_enable
            && __PVT__special_cycle_enable == rhs.__PVT__special_cycle_enable
            && __PVT__memory_write_invalidate == rhs.__PVT__memory_write_invalidate
            && __PVT__vga_palette_snoop == rhs.__PVT__vga_palette_snoop
            && __PVT__parity_error_response == rhs.__PVT__parity_error_response
            && __PVT__idsel_step_wait_cycle_control == rhs.__PVT__idsel_step_wait_cycle_control
            && __PVT__SERR_Enable == rhs.__PVT__SERR_Enable
            && __PVT__fast_b2b_transactions_enable == rhs.__PVT__fast_b2b_transactions_enable
            && __PVT__interrupt_disable == rhs.__PVT__interrupt_disable
            && __PVT__rsvd == rhs.__PVT__rsvd
            && __PVT__interrupt_status == rhs.__PVT__interrupt_status
            && __PVT__capabilities_list == rhs.__PVT__capabilities_list
            && __PVT__sixtysix_mhz_capable == rhs.__PVT__sixtysix_mhz_capable
            && __PVT__fast_b2b_transactions_capable == rhs.__PVT__fast_b2b_transactions_capable
            && __PVT__master_data_parity_error == rhs.__PVT__master_data_parity_error
            && __PVT__devsel_timing == rhs.__PVT__devsel_timing
            && __PVT__signaled_target_abort == rhs.__PVT__signaled_target_abort
            && __PVT__received_target_abort == rhs.__PVT__received_target_abort
            && __PVT__received_master_abort == rhs.__PVT__received_master_abort
            && __PVT__signaled_system_error == rhs.__PVT__signaled_system_error
            && __PVT__detected_parity_error == rhs.__PVT__detected_parity_error;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__67& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__67& rhs) const {
        if (__PVT__bus_master_enable < rhs.__PVT__bus_master_enable) return true;
        if (rhs.__PVT__bus_master_enable < __PVT__bus_master_enable) return false;
        if (__PVT__special_cycle_enable < rhs.__PVT__special_cycle_enable) return true;
        if (rhs.__PVT__special_cycle_enable < __PVT__special_cycle_enable) return false;
        if (__PVT__memory_write_invalidate < rhs.__PVT__memory_write_invalidate) return true;
        if (rhs.__PVT__memory_write_invalidate < __PVT__memory_write_invalidate) return false;
        if (__PVT__vga_palette_snoop < rhs.__PVT__vga_palette_snoop) return true;
        if (rhs.__PVT__vga_palette_snoop < __PVT__vga_palette_snoop) return false;
        if (__PVT__parity_error_response < rhs.__PVT__parity_error_response) return true;
        if (rhs.__PVT__parity_error_response < __PVT__parity_error_response) return false;
        if (__PVT__idsel_step_wait_cycle_control < rhs.__PVT__idsel_step_wait_cycle_control) return true;
        if (rhs.__PVT__idsel_step_wait_cycle_control < __PVT__idsel_step_wait_cycle_control) return false;
        if (__PVT__SERR_Enable < rhs.__PVT__SERR_Enable) return true;
        if (rhs.__PVT__SERR_Enable < __PVT__SERR_Enable) return false;
        if (__PVT__fast_b2b_transactions_enable < rhs.__PVT__fast_b2b_transactions_enable) return true;
        if (rhs.__PVT__fast_b2b_transactions_enable < __PVT__fast_b2b_transactions_enable) return false;
        if (__PVT__interrupt_disable < rhs.__PVT__interrupt_disable) return true;
        if (rhs.__PVT__interrupt_disable < __PVT__interrupt_disable) return false;
        if (__PVT__rsvd < rhs.__PVT__rsvd) return true;
        if (rhs.__PVT__rsvd < __PVT__rsvd) return false;
        if (__PVT__interrupt_status < rhs.__PVT__interrupt_status) return true;
        if (rhs.__PVT__interrupt_status < __PVT__interrupt_status) return false;
        if (__PVT__capabilities_list < rhs.__PVT__capabilities_list) return true;
        if (rhs.__PVT__capabilities_list < __PVT__capabilities_list) return false;
        if (__PVT__sixtysix_mhz_capable < rhs.__PVT__sixtysix_mhz_capable) return true;
        if (rhs.__PVT__sixtysix_mhz_capable < __PVT__sixtysix_mhz_capable) return false;
        if (__PVT__fast_b2b_transactions_capable < rhs.__PVT__fast_b2b_transactions_capable) return true;
        if (rhs.__PVT__fast_b2b_transactions_capable < __PVT__fast_b2b_transactions_capable) return false;
        if (__PVT__master_data_parity_error < rhs.__PVT__master_data_parity_error) return true;
        if (rhs.__PVT__master_data_parity_error < __PVT__master_data_parity_error) return false;
        if (__PVT__devsel_timing < rhs.__PVT__devsel_timing) return true;
        if (rhs.__PVT__devsel_timing < __PVT__devsel_timing) return false;
        if (__PVT__signaled_target_abort < rhs.__PVT__signaled_target_abort) return true;
        if (rhs.__PVT__signaled_target_abort < __PVT__signaled_target_abort) return false;
        if (__PVT__received_target_abort < rhs.__PVT__received_target_abort) return true;
        if (rhs.__PVT__received_target_abort < __PVT__received_target_abort) return false;
        if (__PVT__received_master_abort < rhs.__PVT__received_master_abort) return true;
        if (rhs.__PVT__received_master_abort < __PVT__received_master_abort) return false;
        if (__PVT__signaled_system_error < rhs.__PVT__signaled_system_error) return true;
        if (rhs.__PVT__signaled_system_error < __PVT__signaled_system_error) return false;
        if (__PVT__detected_parity_error < rhs.__PVT__detected_parity_error) return true;
        if (rhs.__PVT__detected_parity_error < __PVT__detected_parity_error) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__67> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__90 {
    CData/*7:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__90& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__90& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__90& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__90> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__91 {
    CData/*7:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__91& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__91& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__91& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__91> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__92 {
    CData/*7:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__92& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__92& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__92& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__92> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__93 {
    CData/*7:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__93& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__93& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__93& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__93> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__89 {
    Vtb_pcie_datalink_layer___struct__90 __PVT__cache_line_size_register;
    Vtb_pcie_datalink_layer___struct__91 __PVT__latency_timer_register;
    Vtb_pcie_datalink_layer___struct__92 __PVT__interrupt_line_register;
    Vtb_pcie_datalink_layer___struct__93 __PVT__interrupt_pin_register;

    bool operator==(const Vtb_pcie_datalink_layer___struct__89& rhs) const {
        return __PVT__cache_line_size_register == rhs.__PVT__cache_line_size_register
            && __PVT__latency_timer_register == rhs.__PVT__latency_timer_register
            && __PVT__interrupt_line_register == rhs.__PVT__interrupt_line_register
            && __PVT__interrupt_pin_register == rhs.__PVT__interrupt_pin_register;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__89& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__89& rhs) const {
        if (__PVT__cache_line_size_register < rhs.__PVT__cache_line_size_register) return true;
        if (rhs.__PVT__cache_line_size_register < __PVT__cache_line_size_register) return false;
        if (__PVT__latency_timer_register < rhs.__PVT__latency_timer_register) return true;
        if (rhs.__PVT__latency_timer_register < __PVT__latency_timer_register) return false;
        if (__PVT__interrupt_line_register < rhs.__PVT__interrupt_line_register) return true;
        if (rhs.__PVT__interrupt_line_register < __PVT__interrupt_line_register) return false;
        if (__PVT__interrupt_pin_register < rhs.__PVT__interrupt_pin_register) return true;
        if (rhs.__PVT__interrupt_pin_register < __PVT__interrupt_pin_register) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__89> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__95 {
    IData/*31:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__95& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__95& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__95& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__95> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__94 {
    Vtb_pcie_datalink_layer___struct__95 __PVT__BAR;

    bool operator==(const Vtb_pcie_datalink_layer___struct__94& rhs) const {
        return __PVT__BAR == rhs.__PVT__BAR;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__94& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__94& rhs) const {
        if (__PVT__BAR < rhs.__PVT__BAR) return true;
        if (rhs.__PVT__BAR < __PVT__BAR) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__94> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__97 {
    IData/*31:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__97& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__97& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__97& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__97> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__96 {
    Vtb_pcie_datalink_layer___struct__97 __PVT__BAR;

    bool operator==(const Vtb_pcie_datalink_layer___struct__96& rhs) const {
        return __PVT__BAR == rhs.__PVT__BAR;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__96& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__96& rhs) const {
        if (__PVT__BAR < rhs.__PVT__BAR) return true;
        if (rhs.__PVT__BAR < __PVT__BAR) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__96> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__99 {
    IData/*31:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__99& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__99& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__99& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__99> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__98 {
    Vtb_pcie_datalink_layer___struct__99 __PVT__BAR;

    bool operator==(const Vtb_pcie_datalink_layer___struct__98& rhs) const {
        return __PVT__BAR == rhs.__PVT__BAR;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__98& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__98& rhs) const {
        if (__PVT__BAR < rhs.__PVT__BAR) return true;
        if (rhs.__PVT__BAR < __PVT__BAR) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__98> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__101 {
    IData/*31:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__101& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__101& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__101& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__101> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__100 {
    Vtb_pcie_datalink_layer___struct__101 __PVT__BAR;

    bool operator==(const Vtb_pcie_datalink_layer___struct__100& rhs) const {
        return __PVT__BAR == rhs.__PVT__BAR;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__100& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__100& rhs) const {
        if (__PVT__BAR < rhs.__PVT__BAR) return true;
        if (rhs.__PVT__BAR < __PVT__BAR) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__100> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__103 {
    IData/*31:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__103& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__103& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__103& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__103> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__102 {
    Vtb_pcie_datalink_layer___struct__103 __PVT__word;

    bool operator==(const Vtb_pcie_datalink_layer___struct__102& rhs) const {
        return __PVT__word == rhs.__PVT__word;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__102& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__102& rhs) const {
        if (__PVT__word < rhs.__PVT__word) return true;
        if (rhs.__PVT__word < __PVT__word) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__102> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__105 {
    CData/*7:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__105& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__105& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__105& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__105> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__106 {
    CData/*7:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__106& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__106& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__106& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__106> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__104 {
    Vtb_pcie_datalink_layer___struct__105 __PVT__interrupt_line;
    Vtb_pcie_datalink_layer___struct__106 __PVT__interrupt_pin;

    bool operator==(const Vtb_pcie_datalink_layer___struct__104& rhs) const {
        return __PVT__interrupt_line == rhs.__PVT__interrupt_line
            && __PVT__interrupt_pin == rhs.__PVT__interrupt_pin;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__104& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__104& rhs) const {
        if (__PVT__interrupt_line < rhs.__PVT__interrupt_line) return true;
        if (rhs.__PVT__interrupt_line < __PVT__interrupt_line) return false;
        if (__PVT__interrupt_pin < rhs.__PVT__interrupt_pin) return true;
        if (rhs.__PVT__interrupt_pin < __PVT__interrupt_pin) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__104> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__108 {
    CData/*2:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__108& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__108& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__108& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__108> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__109 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__109& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__109& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__109& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__109> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__110 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__110& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__110& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__110& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__110> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__111 {
    CData/*2:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__111& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__111& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__111& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__111> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__112 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__112& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__112& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__112& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__112> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__113 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__113& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__113& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__113& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__113> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__114 {
    CData/*4:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__114& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__114& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__114& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__114> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__107 {
    Vtb_pcie_datalink_layer___struct__108 __PVT__version;
    Vtb_pcie_datalink_layer___struct__109 __PVT__pme_clock;
    Vtb_pcie_datalink_layer___struct__110 __PVT__dev_spec_init;
    Vtb_pcie_datalink_layer___struct__111 __PVT__aux_current;
    Vtb_pcie_datalink_layer___struct__112 __PVT__d1_support;
    Vtb_pcie_datalink_layer___struct__113 __PVT__d2_support;
    Vtb_pcie_datalink_layer___struct__114 __PVT__pme_support;

    bool operator==(const Vtb_pcie_datalink_layer___struct__107& rhs) const {
        return __PVT__version == rhs.__PVT__version
            && __PVT__pme_clock == rhs.__PVT__pme_clock
            && __PVT__dev_spec_init == rhs.__PVT__dev_spec_init
            && __PVT__aux_current == rhs.__PVT__aux_current
            && __PVT__d1_support == rhs.__PVT__d1_support
            && __PVT__d2_support == rhs.__PVT__d2_support
            && __PVT__pme_support == rhs.__PVT__pme_support;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__107& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__107& rhs) const {
        if (__PVT__version < rhs.__PVT__version) return true;
        if (rhs.__PVT__version < __PVT__version) return false;
        if (__PVT__pme_clock < rhs.__PVT__pme_clock) return true;
        if (rhs.__PVT__pme_clock < __PVT__pme_clock) return false;
        if (__PVT__dev_spec_init < rhs.__PVT__dev_spec_init) return true;
        if (rhs.__PVT__dev_spec_init < __PVT__dev_spec_init) return false;
        if (__PVT__aux_current < rhs.__PVT__aux_current) return true;
        if (rhs.__PVT__aux_current < __PVT__aux_current) return false;
        if (__PVT__d1_support < rhs.__PVT__d1_support) return true;
        if (rhs.__PVT__d1_support < __PVT__d1_support) return false;
        if (__PVT__d2_support < rhs.__PVT__d2_support) return true;
        if (rhs.__PVT__d2_support < __PVT__d2_support) return false;
        if (__PVT__pme_support < rhs.__PVT__pme_support) return true;
        if (rhs.__PVT__pme_support < __PVT__pme_support) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__107> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__116 {
    CData/*1:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__116& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__116& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__116& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__116> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__117 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__117& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__117& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__117& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__117> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__118 {
    CData/*3:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__118& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__118& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__118& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__118> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__119 {
    CData/*1:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__119& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__119& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__119& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__119> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__120 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__120& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__120& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__120& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__120> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__121 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__121& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__121& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__121& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__121> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__122 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__122& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__122& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__122& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__122> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__123 {
    CData/*7:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__123& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__123& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__123& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__123> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__115 {
    Vtb_pcie_datalink_layer___struct__116 __PVT__power_state;
    Vtb_pcie_datalink_layer___struct__117 __PVT__pme_enable;
    Vtb_pcie_datalink_layer___struct__118 __PVT__data_select;
    Vtb_pcie_datalink_layer___struct__119 __PVT__data_scale;
    Vtb_pcie_datalink_layer___struct__120 __PVT__pme_status;
    Vtb_pcie_datalink_layer___struct__121 __PVT__b2_b3_support;
    Vtb_pcie_datalink_layer___struct__122 __PVT__bus_pwr_clk_ctrl_en;
    Vtb_pcie_datalink_layer___struct__123 __PVT__data;

    bool operator==(const Vtb_pcie_datalink_layer___struct__115& rhs) const {
        return __PVT__power_state == rhs.__PVT__power_state
            && __PVT__pme_enable == rhs.__PVT__pme_enable
            && __PVT__data_select == rhs.__PVT__data_select
            && __PVT__data_scale == rhs.__PVT__data_scale
            && __PVT__pme_status == rhs.__PVT__pme_status
            && __PVT__b2_b3_support == rhs.__PVT__b2_b3_support
            && __PVT__bus_pwr_clk_ctrl_en == rhs.__PVT__bus_pwr_clk_ctrl_en
            && __PVT__data == rhs.__PVT__data;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__115& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__115& rhs) const {
        if (__PVT__power_state < rhs.__PVT__power_state) return true;
        if (rhs.__PVT__power_state < __PVT__power_state) return false;
        if (__PVT__pme_enable < rhs.__PVT__pme_enable) return true;
        if (rhs.__PVT__pme_enable < __PVT__pme_enable) return false;
        if (__PVT__data_select < rhs.__PVT__data_select) return true;
        if (rhs.__PVT__data_select < __PVT__data_select) return false;
        if (__PVT__data_scale < rhs.__PVT__data_scale) return true;
        if (rhs.__PVT__data_scale < __PVT__data_scale) return false;
        if (__PVT__pme_status < rhs.__PVT__pme_status) return true;
        if (rhs.__PVT__pme_status < __PVT__pme_status) return false;
        if (__PVT__b2_b3_support < rhs.__PVT__b2_b3_support) return true;
        if (rhs.__PVT__b2_b3_support < __PVT__b2_b3_support) return false;
        if (__PVT__bus_pwr_clk_ctrl_en < rhs.__PVT__bus_pwr_clk_ctrl_en) return true;
        if (rhs.__PVT__bus_pwr_clk_ctrl_en < __PVT__bus_pwr_clk_ctrl_en) return false;
        if (__PVT__data < rhs.__PVT__data) return true;
        if (rhs.__PVT__data < __PVT__data) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__115> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__125 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__125& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__125& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__125& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__125> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__126 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__126& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__126& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__126& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__126> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__124 {
    Vtb_pcie_datalink_layer___struct__125 __PVT__perform_equalization;
    Vtb_pcie_datalink_layer___struct__126 __PVT__link_eq_req_intr_en;

    bool operator==(const Vtb_pcie_datalink_layer___struct__124& rhs) const {
        return __PVT__perform_equalization == rhs.__PVT__perform_equalization
            && __PVT__link_eq_req_intr_en == rhs.__PVT__link_eq_req_intr_en;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__124& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__124& rhs) const {
        if (__PVT__perform_equalization < rhs.__PVT__perform_equalization) return true;
        if (rhs.__PVT__perform_equalization < __PVT__perform_equalization) return false;
        if (__PVT__link_eq_req_intr_en < rhs.__PVT__link_eq_req_intr_en) return true;
        if (rhs.__PVT__link_eq_req_intr_en < __PVT__link_eq_req_intr_en) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__124> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__128 {
    CData/*4:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__128& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__128& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__128& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__128> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__127 {
    Vtb_pcie_datalink_layer___struct__128 __PVT__lane_error;

    bool operator==(const Vtb_pcie_datalink_layer___struct__127& rhs) const {
        return __PVT__lane_error == rhs.__PVT__lane_error;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__127& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__127& rhs) const {
        if (__PVT__lane_error < rhs.__PVT__lane_error) return true;
        if (rhs.__PVT__lane_error < __PVT__lane_error) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__127> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__130 {
    CData/*3:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__130& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__130& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__130& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__130> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__131 {
    CData/*2:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__131& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__131& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__131& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__131> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__132 {
    CData/*3:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__132& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__132& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__132& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__132> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__133 {
    CData/*2:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer___struct__133& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__133& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__133& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__133> : public std::true_type {};

struct Vtb_pcie_datalink_layer___struct__129 {
    Vtb_pcie_datalink_layer___struct__130 __PVT__downstream_tx_preset;
    Vtb_pcie_datalink_layer___struct__131 __PVT__downstream_rx_preset_hint;
    Vtb_pcie_datalink_layer___struct__132 __PVT__upstream_tx_preset;
    Vtb_pcie_datalink_layer___struct__133 __PVT__upstream_rx_preset_hint;

    bool operator==(const Vtb_pcie_datalink_layer___struct__129& rhs) const {
        return __PVT__downstream_tx_preset == rhs.__PVT__downstream_tx_preset
            && __PVT__downstream_rx_preset_hint == rhs.__PVT__downstream_rx_preset_hint
            && __PVT__upstream_tx_preset == rhs.__PVT__upstream_tx_preset
            && __PVT__upstream_rx_preset_hint == rhs.__PVT__upstream_rx_preset_hint;
    }
    bool operator!=(const Vtb_pcie_datalink_layer___struct__129& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer___struct__129& rhs) const {
        if (__PVT__downstream_tx_preset < rhs.__PVT__downstream_tx_preset) return true;
        if (rhs.__PVT__downstream_tx_preset < __PVT__downstream_tx_preset) return false;
        if (__PVT__downstream_rx_preset_hint < rhs.__PVT__downstream_rx_preset_hint) return true;
        if (rhs.__PVT__downstream_rx_preset_hint < __PVT__downstream_rx_preset_hint) return false;
        if (__PVT__upstream_tx_preset < rhs.__PVT__upstream_tx_preset) return true;
        if (rhs.__PVT__upstream_tx_preset < __PVT__upstream_tx_preset) return false;
        if (__PVT__upstream_rx_preset_hint < rhs.__PVT__upstream_rx_preset_hint) return true;
        if (rhs.__PVT__upstream_rx_preset_hint < __PVT__upstream_rx_preset_hint) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer___struct__129> : public std::true_type {};

struct Vtb_pcie_datalink_layer_tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage_t__struct__0 {
    Vtb_pcie_datalink_layer___struct__67 __PVT__byte_offset_04;
    Vtb_pcie_datalink_layer___struct__89 __PVT__byte_offset_0C;
    Vtb_pcie_datalink_layer___struct__94 __PVT__base_ddress_register_2;
    Vtb_pcie_datalink_layer___struct__96 __PVT__base_ddress_register_3;
    Vtb_pcie_datalink_layer___struct__98 __PVT__base_ddress_register_4;
    Vtb_pcie_datalink_layer___struct__100 __PVT__base_ddress_register_5;
    Vtb_pcie_datalink_layer___struct__102 __PVT__cardbus_cis_pointer;
    Vtb_pcie_datalink_layer___struct__104 __PVT__byte_offset_3C;
    Vtb_pcie_datalink_layer___struct__107 __PVT__capabilities_power_mngt_pointer;
    Vtb_pcie_datalink_layer___struct__115 __PVT__power_management_pointer;
    Vtb_pcie_datalink_layer___struct__124 __PVT__link_control_3_register;
    Vtb_pcie_datalink_layer___struct__127 __PVT__lane_error_status_register;
    Vtb_pcie_datalink_layer___struct__129 __PVT__lane_eq_ctrl_register;

    bool operator==(const Vtb_pcie_datalink_layer_tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage_t__struct__0& rhs) const {
        return __PVT__byte_offset_04 == rhs.__PVT__byte_offset_04
            && __PVT__byte_offset_0C == rhs.__PVT__byte_offset_0C
            && __PVT__base_ddress_register_2 == rhs.__PVT__base_ddress_register_2
            && __PVT__base_ddress_register_3 == rhs.__PVT__base_ddress_register_3
            && __PVT__base_ddress_register_4 == rhs.__PVT__base_ddress_register_4
            && __PVT__base_ddress_register_5 == rhs.__PVT__base_ddress_register_5
            && __PVT__cardbus_cis_pointer == rhs.__PVT__cardbus_cis_pointer
            && __PVT__byte_offset_3C == rhs.__PVT__byte_offset_3C
            && __PVT__capabilities_power_mngt_pointer == rhs.__PVT__capabilities_power_mngt_pointer
            && __PVT__power_management_pointer == rhs.__PVT__power_management_pointer
            && __PVT__link_control_3_register == rhs.__PVT__link_control_3_register
            && __PVT__lane_error_status_register == rhs.__PVT__lane_error_status_register
            && __PVT__lane_eq_ctrl_register == rhs.__PVT__lane_eq_ctrl_register;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage_t__struct__0& rhs) const {
        if (__PVT__byte_offset_04 < rhs.__PVT__byte_offset_04) return true;
        if (rhs.__PVT__byte_offset_04 < __PVT__byte_offset_04) return false;
        if (__PVT__byte_offset_0C < rhs.__PVT__byte_offset_0C) return true;
        if (rhs.__PVT__byte_offset_0C < __PVT__byte_offset_0C) return false;
        if (__PVT__base_ddress_register_2 < rhs.__PVT__base_ddress_register_2) return true;
        if (rhs.__PVT__base_ddress_register_2 < __PVT__base_ddress_register_2) return false;
        if (__PVT__base_ddress_register_3 < rhs.__PVT__base_ddress_register_3) return true;
        if (rhs.__PVT__base_ddress_register_3 < __PVT__base_ddress_register_3) return false;
        if (__PVT__base_ddress_register_4 < rhs.__PVT__base_ddress_register_4) return true;
        if (rhs.__PVT__base_ddress_register_4 < __PVT__base_ddress_register_4) return false;
        if (__PVT__base_ddress_register_5 < rhs.__PVT__base_ddress_register_5) return true;
        if (rhs.__PVT__base_ddress_register_5 < __PVT__base_ddress_register_5) return false;
        if (__PVT__cardbus_cis_pointer < rhs.__PVT__cardbus_cis_pointer) return true;
        if (rhs.__PVT__cardbus_cis_pointer < __PVT__cardbus_cis_pointer) return false;
        if (__PVT__byte_offset_3C < rhs.__PVT__byte_offset_3C) return true;
        if (rhs.__PVT__byte_offset_3C < __PVT__byte_offset_3C) return false;
        if (__PVT__capabilities_power_mngt_pointer < rhs.__PVT__capabilities_power_mngt_pointer) return true;
        if (rhs.__PVT__capabilities_power_mngt_pointer < __PVT__capabilities_power_mngt_pointer) return false;
        if (__PVT__power_management_pointer < rhs.__PVT__power_management_pointer) return true;
        if (rhs.__PVT__power_management_pointer < __PVT__power_management_pointer) return false;
        if (__PVT__link_control_3_register < rhs.__PVT__link_control_3_register) return true;
        if (rhs.__PVT__link_control_3_register < __PVT__link_control_3_register) return false;
        if (__PVT__lane_error_status_register < rhs.__PVT__lane_error_status_register) return true;
        if (rhs.__PVT__lane_error_status_register < __PVT__lane_error_status_register) return false;
        if (__PVT__lane_eq_ctrl_register < rhs.__PVT__lane_eq_ctrl_register) return true;
        if (rhs.__PVT__lane_eq_ctrl_register < __PVT__lane_eq_ctrl_register) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage_t__struct__0> : public std::true_type {};

class alignas(VL_CACHE_LINE_BYTES) Vtb_pcie_datalink_layer___024root final {
  public:
    // CELLS
    Vtb_pcie_datalink_layer_pcie_config_reg_pkg* __PVT__pcie_config_reg_pkg;
    Vtb_pcie_datalink_layer_pcie_tlp_pkg* __PVT__pcie_tlp_pkg;

    // DESIGN SPECIFIC STATE
    // Anonymous structures to workaround compiler member-count bugs
    struct {
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__clk;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__rst;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__s_axis_tlpin_tkeep;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__s_axis_tlpin_tvalid;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__s_axis_tlpin_tlast;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__s_axis_tlpin_tuser;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__m_axis_tlpout_tready;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__s_axis_phy2dllp_tkeep;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__s_axis_phy2dllp_tvalid;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__s_axis_phy2dllp_tlast;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__s_axis_phy2dllp_tuser;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__s_axis_phy2dllp_tready;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__m_axis_dllp2phy_tready;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__s_axis_phy2tlp_tkeep;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__s_axis_phy2tlp_tvalid;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__s_axis_phy2tlp_tlast;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__s_axis_phy2tlp_tuser;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__s_axis_phy2tlp_tready;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__m_axis_tlp2phy_tkeep;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__m_axis_tlp2phy_tvalid;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__m_axis_tlp2phy_tlast;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__m_axis_tlp2phy_tuser;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__m_axis_tlp2phy_tready;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__phy_link_up;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__bus_num;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__status_error_cor;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__status_error_uncor;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__rx_cpl_stall;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__idle_valid;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__seq_num_vld;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__seq_num_acknack;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__init_ack;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__ack_nack;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__ack_nack_vld;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__ack_seq_num;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__fc1_values_stored;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__fc2_values_stored;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__fc2_values_sent;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__fc2_values_stored_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_ready;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__tlp_ready;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_tkeep;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_tvalid;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_tlast;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_tuser;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_tready;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__rx_tlp_ready;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__s_axil_awvalid;
        CData/*2:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__s_axil_awprot;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__s_axil_wvalid;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__s_axil_bready;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__s_axil_bvalid;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__s_axil_arvalid;
        CData/*2:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__s_axil_arprot;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__s_axil_rready;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__s_axil_rvalid;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__tlp_axis_tvalid;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__cfg_axis_tvalid;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__skid_axis_tready;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tkeep_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tvalid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tlast_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tid_reg;
    };
    struct {
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tdest_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tuser_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__cfg_fifo_inst__DOT__s_axis_tid;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__cfg_fifo_inst__DOT__s_axis_tdest;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__cfg_fifo_inst__DOT__genblk1__DOT__s_axis_tready_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__cfg_fifo_inst__DOT__genblk1__DOT__m_axis_tkeep_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__cfg_fifo_inst__DOT__genblk1__DOT__m_axis_tvalid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__cfg_fifo_inst__DOT__genblk1__DOT__m_axis_tlast_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__cfg_fifo_inst__DOT__genblk1__DOT__m_axis_tid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__cfg_fifo_inst__DOT__genblk1__DOT__m_axis_tdest_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__cfg_fifo_inst__DOT__genblk1__DOT__m_axis_tuser_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__cfg_fifo_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__cfg_fifo_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__cfg_fifo_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__cfg_fifo_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__cfg_fifo_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__cfg_fifo_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__tlp_fifo_inst__DOT__s_axis_tid;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__tlp_fifo_inst__DOT__s_axis_tdest;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__tlp_fifo_inst__DOT__genblk1__DOT__s_axis_tready_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__tlp_fifo_inst__DOT__genblk1__DOT__m_axis_tkeep_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__tlp_fifo_inst__DOT__genblk1__DOT__m_axis_tvalid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__tlp_fifo_inst__DOT__genblk1__DOT__m_axis_tlast_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__tlp_fifo_inst__DOT__genblk1__DOT__m_axis_tid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__tlp_fifo_inst__DOT__genblk1__DOT__m_axis_tdest_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__tlp_fifo_inst__DOT__genblk1__DOT__m_axis_tuser_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__tlp_fifo_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__tlp_fifo_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__tlp_fifo_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__tlp_fifo_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__tlp_fifo_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__tlp_fifo_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__s_axis_tkeep;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__s_axis_tvalid;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__s_axis_tlast;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__s_axis_tuser;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tkeep_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tvalid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tlast_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tdest_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tuser_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__skid_axis_tready;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__tlp_strb;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__tlp_valid;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__tlp_eop;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__tlp_sop;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tkeep_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tvalid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tlast_reg;
    };
    struct {
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tdest_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tuser_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__rst;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__s_axil_awready;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__s_axil_wready;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__s_axil_arready;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__cpuif_req;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__cpuif_req_is_wr;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__cpuif_rd_ack;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__cpuif_wr_ack;
        CData/*1:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_n_in_flight;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_prev_was_rd;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_arvalid;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_ar_accept;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_awvalid;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_wvalid;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_wstrb;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_aw_accept;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_resp_acked;
        CData/*1:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_resp_wptr;
        CData/*1:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_resp_rptr;
        CData/*4:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__curr_state;
        CData/*4:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_state;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__fc_start_c;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__fc_start_r;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_nullified_c;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_nullified_r;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_c;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cplh_r;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_nph_c;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_nph_r;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_ph_c;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_ph_r;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_c;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_npd_r;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_pd_c;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_pd_r;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_c;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_is_cpld_r;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__skid_axis_tready;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pipeline_axis_tready;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pipeline_stg2_axis_tready;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_axis_tvalid;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_axis_tlast;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_axis_tuser;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_axis_tready;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__ph_credits_consumed_c;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__ph_credits_consumed_r;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__nph_credits_consumed_c;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__nph_credits_consumed_r;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__cplh_credits_consumed_c;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__cplh_credits_consumed_r;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__s_axis_tready_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__m_axis_tkeep_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__m_axis_tvalid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__m_axis_tlast_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__m_axis_tid_reg;
    };
    struct {
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__m_axis_tdest_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__m_axis_tuser_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__s_axis_tready_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tkeep_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tvalid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tlast_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tdest_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tuser_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tkeep_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tvalid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tlast_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tdest_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tuser_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__s_axis_tid;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__s_axis_tdest;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__pause_req;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__wr_ptr_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__wr_ptr_commit_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__rd_ptr_reg;
        CData/*1:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_tvalid_pipe_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__empty;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__full_wr;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__s_frame_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__drop_frame_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__mark_frame_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__send_frame_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__depth_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__depth_commit_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__overflow_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__bad_frame_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__good_frame_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__fc_axis_tkeep;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__fc_axis_tvalid;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__fc_axis_tlast;
        CData/*4:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__curr_state;
        CData/*4:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__next_state;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__start_ack_c;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__start_ack_r;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tkeep_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tvalid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tlast_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tid_reg;
    };
    struct {
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tdest_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tuser_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg;
        CData/*2:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__curr_state;
        CData/*2:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__next_state;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tlp_nullified_c;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tlp_nullified_r;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_tlp_ready_c;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_tlp_ready_r;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__skid_s_axis_tready;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_ph_c;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_ph_r;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_nph_c;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_nph_r;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_cplh_c;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_cplh_r;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__update_fc_c;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__update_fc_r;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__fc1_np_stored_c;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__fc1_np_stored_r;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__fc1_p_stored_c;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__fc1_p_stored_r;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__fc1_c_stored_c;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__fc1_c_stored_r;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__fc2_np_stored_c;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__fc2_np_stored_r;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__fc2_p_stored_c;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__fc2_p_stored_r;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__fc2_c_stored_c;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__fc2_c_stored_r;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__first_feature_exchange_dllp_received_r;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__first_feature_exchange_dllp_received_c;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__s_axis_tready_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tkeep_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tvalid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tlast_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tdest_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tuser_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg;
        CData/*2:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__curr_state;
        CData/*2:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__next_state;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__dllp_valid;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_valid;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__first_tlp_valid_c;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__first_tlp_valid_r;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__s_axis_tready_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__m_axis_tkeep_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__m_axis_tvalid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__m_axis_tlast_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__m_axis_tid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__m_axis_tdest_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__m_axis_tuser_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg;
    };
    struct {
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__s_axis_tready_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__m_axis_tkeep_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__m_axis_tvalid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__m_axis_tlast_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__m_axis_tid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__m_axis_tdest_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__m_axis_tuser_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__update_fc_i;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__m_axis_retry_tkeep;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__m_axis_retry_tvalid;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__m_axis_retry_tlast;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__m_axis_retry_tuser;
        CData/*2:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_complete;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__curr_state;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__next_state;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__skid_axis_tready;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__pipeline_axis_tready;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_axis_tkeep;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_axis_tvalid;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_axis_tlast;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_nullified_c;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_nullified_r;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__ph_credits_consumed_c;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__ph_credits_consumed_r;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__nph_credits_consumed_c;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__nph_credits_consumed_r;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cplh_credits_consumed_c;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cplh_credits_consumed_r;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__ph_credit_limit_c;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__ph_credit_limit_r;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__nph_credit_limit_c;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__nph_credit_limit_r;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk1__DOT__has_nph_credit;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk2__DOT__has_nph_credit;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk2__DOT__has_npd_credit;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk3__DOT__has_ph_credit;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk4__DOT__has_ph_credit;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk4__DOT__has_pd_credit;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk5__DOT__has_cplh_credit;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk6__DOT__has_cplh_credit;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk6__DOT__has_cpld_credit;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_output_register_inst__DOT__genblk1__DOT__s_axis_tready_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_output_register_inst__DOT__genblk1__DOT__m_axis_tkeep_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_output_register_inst__DOT__genblk1__DOT__m_axis_tvalid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_output_register_inst__DOT__genblk1__DOT__m_axis_tlast_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_output_register_inst__DOT__genblk1__DOT__m_axis_tid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_output_register_inst__DOT__genblk1__DOT__m_axis_tdest_reg;
        CData/*2:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_output_register_inst__DOT__genblk1__DOT__m_axis_tuser_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_output_register_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_output_register_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_output_register_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_output_register_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_output_register_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg;
    };
    struct {
        CData/*2:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_output_register_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_flow_inst__DOT__genblk1__DOT__s_axis_tready_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_flow_inst__DOT__genblk1__DOT__m_axis_tkeep_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_flow_inst__DOT__genblk1__DOT__m_axis_tvalid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_flow_inst__DOT__genblk1__DOT__m_axis_tlast_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_flow_inst__DOT__genblk1__DOT__m_axis_tid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_flow_inst__DOT__genblk1__DOT__m_axis_tdest_reg;
        CData/*2:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_flow_inst__DOT__genblk1__DOT__m_axis_tuser_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_flow_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_flow_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_flow_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_flow_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_flow_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg;
        CData/*2:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_flow_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__s_axis_tready_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__m_axis_tkeep_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__m_axis_tvalid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__m_axis_tlast_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__m_axis_tid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__m_axis_tdest_reg;
        CData/*2:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__m_axis_tuser_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg;
        CData/*2:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg;
        CData/*2:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__tlp_curr_state;
        CData/*2:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__tlp_next_state;
        CData/*2:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__retry_ack_c;
        CData/*2:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__retry_ack_r;
        CData/*2:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__retry_ready;
        CData/*2:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__mutex_flag;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__retry_index_c;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__retry_index_r;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT____Vcellout__gen_retry_axis_fifo__BRA__0__KET____DOT__axis_retry_fifo_inst__m_axis_tlast;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT____Vcellout__gen_retry_axis_fifo__BRA__1__KET____DOT__axis_retry_fifo_inst__m_axis_tlast;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT____Vcellout__gen_retry_axis_fifo__BRA__2__KET____DOT__axis_retry_fifo_inst__m_axis_tlast;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__2__KET____DOT__axis_retry_fifo_inst__DOT__s_axis_tvalid;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__1__KET____DOT__axis_retry_fifo_inst__DOT__s_axis_tvalid;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__0__KET____DOT__axis_retry_fifo_inst__DOT__s_axis_tvalid;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__s_axis_tkeep;
        CData/*1:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__s_axis_tvalid;
        CData/*1:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__s_axis_tready;
        CData/*1:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__s_axis_tlast;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__s_axis_tuser;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__s_axis_tkeep_reg;
        CData/*1:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__s_axis_tvalid_reg;
        CData/*1:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__s_axis_tlast_reg;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__s_axis_tuser_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__m_axis_tkeep_int;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__m_axis_tvalid_int;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__m_axis_tready_int_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__m_axis_tlast_int;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__m_axis_tdest_int;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__m_axis_tuser_int;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__current_s_tid;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__m_axis_tkeep_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__m_axis_tvalid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__m_axis_tlast_reg;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__m_axis_tdest_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__m_axis_tuser_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__temp_m_axis_tkeep_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__temp_m_axis_tvalid_reg;
    };
    struct {
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__temp_m_axis_tlast_reg;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__temp_m_axis_tdest_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__temp_m_axis_tuser_reg;
        CData/*1:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__request;
        CData/*1:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__acknowledge;
        CData/*1:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_reg;
        CData/*1:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_next;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_valid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_valid_next;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_encoded_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_encoded_next;
        CData/*1:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__mask_reg;
        CData/*1:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__input_unencoded;
        CData/*2:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__error_c;
        CData/*2:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__error_r;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__next_retry_index_c;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__next_retry_index_r;
        CData/*2:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__retry_valid_c;
        CData/*2:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__retry_valid_r;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__free_retry_c;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__free_retry_r;
        CData/*2:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__retrys_c;
        CData/*2:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__retrys_r;
        CData/*2:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__retry_index_flag;
        CData/*2:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__0__KET____DOT__curr_state;
        CData/*2:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__0__KET____DOT__next_state;
        CData/*1:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__0__KET____DOT__replay_cnt_c;
        CData/*1:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__0__KET____DOT__replay_cnt_r;
        CData/*2:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__1__KET____DOT__curr_state;
        CData/*2:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__1__KET____DOT__next_state;
        CData/*1:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__1__KET____DOT__replay_cnt_c;
        CData/*1:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__1__KET____DOT__replay_cnt_r;
        CData/*2:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__2__KET____DOT__curr_state;
        CData/*2:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__2__KET____DOT__next_state;
        CData/*1:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__2__KET____DOT__replay_cnt_c;
        CData/*1:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__2__KET____DOT__replay_cnt_r;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tkeep;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tvalid;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tlast;
        CData/*4:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__curr_state;
        CData/*4:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__next_state;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__update_fc_c;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__update_fc_r;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__s_axis_tready_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tkeep_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tvalid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tlast_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tdest_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tuser_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tkeep_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tvalid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tlast_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tdest_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tuser_reg;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__s_axis_tkeep;
        CData/*1:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__s_axis_tvalid;
        CData/*1:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__s_axis_tready;
        CData/*1:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__s_axis_tlast;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__s_axis_tuser;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__s_axis_tkeep_reg;
        CData/*1:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__s_axis_tvalid_reg;
        CData/*1:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__s_axis_tlast_reg;
    };
    struct {
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__s_axis_tuser_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__m_axis_tkeep_int;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__m_axis_tvalid_int;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__m_axis_tready_int_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__m_axis_tlast_int;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__m_axis_tdest_int;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__m_axis_tuser_int;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__current_s_tid;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__m_axis_tkeep_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__m_axis_tvalid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__m_axis_tlast_reg;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__m_axis_tdest_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__m_axis_tuser_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__temp_m_axis_tkeep_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__temp_m_axis_tvalid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__temp_m_axis_tlast_reg;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__temp_m_axis_tdest_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__temp_m_axis_tuser_reg;
        CData/*1:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__request;
        CData/*1:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__acknowledge;
        CData/*1:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__grant_reg;
        CData/*1:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__grant_next;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__grant_valid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__grant_valid_next;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__grant_encoded_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__grant_encoded_next;
        CData/*1:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__mask_reg;
        CData/*1:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__input_unencoded;
        CData/*2:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__s_axis_tvalid;
        CData/*2:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__s_axis_tready;
        CData/*2:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__s_axis_tlast;
        CData/*2:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__s_axis_tvalid_reg;
        CData/*2:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__s_axis_tlast_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__m_axis_tkeep_int;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__m_axis_tvalid_int;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__m_axis_tready_int_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__m_axis_tlast_int;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__m_axis_tdest_int;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__m_axis_tuser_int;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__current_s_tid;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__m_axis_tkeep_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__m_axis_tvalid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__m_axis_tlast_reg;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__m_axis_tdest_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__m_axis_tuser_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__temp_m_axis_tkeep_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__temp_m_axis_tvalid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__temp_m_axis_tlast_reg;
        CData/*7:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__temp_m_axis_tdest_reg;
        CData/*3:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__temp_m_axis_tuser_reg;
        CData/*2:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__request;
        CData/*2:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__acknowledge;
        CData/*2:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_reg;
        CData/*2:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_next;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_valid_reg;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_valid_next;
        CData/*1:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_encoded_reg;
        CData/*1:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__grant_encoded_next;
        CData/*1:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__request_index;
        CData/*2:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__mask_reg;
        CData/*2:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__input_unencoded;
        CData/*2:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__next_state;
        CData/*2:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__curr_state;
        CData/*6:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__link_state;
    };
    struct {
        CData/*1:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__link_status_c;
        CData/*1:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__link_status_r;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__init_flow_control_c;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__init_flow_control_r;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__soft_reset_r;
        CData/*0:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_datalink_init_inst__DOT__soft_reset_c;
        CData/*7:0*/ __Vfunc_send_fc_init__3__hdrfc;
        CData/*7:0*/ __Vfunc_send_fc_init__4__hdrfc;
        CData/*7:0*/ __Vfunc_set_ack_nack__5__dllp_type;
        CData/*7:0*/ __Vtask_get_fc_values__6__hdr_fc_out;
        CData/*7:0*/ __Vtask_get_fc_values__7__hdr_fc_out;
        CData/*7:0*/ __Vtask_get_fc_values__8__hdr_fc_out;
        CData/*7:0*/ __Vtask_get_fc_values__9__hdr_fc_out;
        CData/*7:0*/ __Vtask_get_fc_values__10__hdr_fc_out;
        CData/*7:0*/ __Vtask_get_fc_values__11__hdr_fc_out;
        CData/*7:0*/ __Vtask_get_fc_values__12__hdr_fc_out;
        CData/*7:0*/ __Vtask_get_fc_values__13__hdr_fc_out;
        CData/*7:0*/ __Vtask_get_fc_values__14__hdr_fc_out;
        CData/*0:0*/ __VdfgRegularize_h6e95ff9d_0_0;
        CData/*0:0*/ __VdfgRegularize_h6e95ff9d_0_4;
        CData/*0:0*/ __VdfgRegularize_h6e95ff9d_0_5;
        CData/*0:0*/ __VdfgRegularize_h6e95ff9d_0_6;
        CData/*4:0*/ __VdfgRegularize_h6e95ff9d_0_8;
        CData/*4:0*/ __VdfgRegularize_h6e95ff9d_0_9;
        CData/*4:0*/ __VdfgRegularize_h6e95ff9d_0_10;
        CData/*4:0*/ __VdfgRegularize_h6e95ff9d_0_11;
        CData/*4:0*/ __VdfgRegularize_h6e95ff9d_0_12;
        CData/*0:0*/ __VdfgRegularize_h6e95ff9d_0_13;
        CData/*4:0*/ __VdfgRegularize_h6e95ff9d_0_14;
        CData/*4:0*/ __VdfgRegularize_h6e95ff9d_0_15;
        CData/*4:0*/ __VdfgRegularize_h6e95ff9d_0_16;
        CData/*4:0*/ __VdfgRegularize_h6e95ff9d_0_17;
        CData/*4:0*/ __VdfgRegularize_h6e95ff9d_0_18;
        CData/*4:0*/ __VdfgRegularize_h6e95ff9d_0_19;
        CData/*4:0*/ __VdfgRegularize_h6e95ff9d_0_20;
        CData/*4:0*/ __VdfgRegularize_h6e95ff9d_0_21;
        CData/*4:0*/ __VdfgRegularize_h6e95ff9d_0_22;
        CData/*4:0*/ __VdfgRegularize_h6e95ff9d_0_23;
        CData/*4:0*/ __VdfgRegularize_h6e95ff9d_0_24;
        CData/*4:0*/ __VdfgRegularize_h6e95ff9d_0_25;
        CData/*4:0*/ __VdfgRegularize_h6e95ff9d_0_26;
        CData/*4:0*/ __VdfgRegularize_h6e95ff9d_0_27;
        CData/*0:0*/ __VdfgRegularize_h6e95ff9d_0_29;
        CData/*0:0*/ __VdfgRegularize_h6e95ff9d_0_39;
        CData/*0:0*/ __VdfgRegularize_h6e95ff9d_0_40;
        CData/*0:0*/ __VdfgRegularize_h6e95ff9d_0_41;
        CData/*0:0*/ __VdfgRegularize_h6e95ff9d_0_43;
        CData/*0:0*/ __VdfgRegularize_h6e95ff9d_0_44;
        CData/*0:0*/ __VdfgRegularize_h6e95ff9d_0_48;
        CData/*0:0*/ __VdfgRegularize_h6e95ff9d_0_50;
        CData/*0:0*/ __VdfgRegularize_h6e95ff9d_0_52;
        CData/*0:0*/ __VdfgRegularize_h6e95ff9d_0_54;
        CData/*0:0*/ __VdfgRegularize_h6e95ff9d_0_57;
        CData/*0:0*/ __VdfgRegularize_h6e95ff9d_0_58;
        CData/*0:0*/ __VdfgRegularize_h6e95ff9d_0_59;
        CData/*0:0*/ __VdfgRegularize_h6e95ff9d_0_61;
        CData/*0:0*/ __VdfgRegularize_h6e95ff9d_0_63;
        CData/*0:0*/ __VdfgRegularize_h6e95ff9d_0_64;
        CData/*0:0*/ __VdfgRegularize_h6e95ff9d_0_80;
        CData/*0:0*/ __VdfgRegularize_h6e95ff9d_0_81;
        CData/*0:0*/ __VdfgRegularize_h6e95ff9d_0_82;
        CData/*0:0*/ __VdfgRegularize_h6e95ff9d_0_83;
        CData/*0:0*/ __VdfgRegularize_h6e95ff9d_0_88;
        CData/*0:0*/ __VdfgRegularize_h6e95ff9d_0_89;
    };
    struct {
        CData/*0:0*/ __VdfgRegularize_h6e95ff9d_0_90;
        CData/*0:0*/ __VdfgRegularize_h6e95ff9d_0_91;
        CData/*0:0*/ __VdfgRegularize_h6e95ff9d_0_99;
        CData/*0:0*/ __VdfgRegularize_h6e95ff9d_0_100;
        CData/*0:0*/ __VdfgRegularize_h6e95ff9d_0_116;
        CData/*0:0*/ __VdlySet__tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_pipe_reg__v0;
        CData/*0:0*/ __VdlySet__tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_pipe_reg__v1;
        CData/*0:0*/ __VstlFirstIteration;
        CData/*0:0*/ __VstlPhaseResult;
        CData/*0:0*/ __Vtrigprevexpr___TOP__tb_pcie_datalink_layer__DOT__clk__0;
        CData/*0:0*/ __Vtrigprevexpr___TOP__tb_pcie_datalink_layer__DOT__rst__0;
        CData/*0:0*/ __VactPhaseResult;
        CData/*0:0*/ __VnbaPhaseResult;
        SData/*11:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__seq_num;
        SData/*8:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__cpuif_addr;
        SData/*8:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_araddr;
        SData/*8:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_awaddr;
        SData/*15:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_transmit_seq_c;
        SData/*15:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_transmit_seq_r;
        SData/*15:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_expected_seq_num_c;
        SData/*15:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__next_expected_seq_num_r;
        SData/*11:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__ackd_transmit_seq_c;
        SData/*15:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__ackd_transmit_seq_r;
        SData/*15:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp_crc_out;
        SData/*15:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp_lcrc32d32;
        SData/*11:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pd_credits_consumed_c;
        SData/*11:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pd_credits_consumed_r;
        SData/*11:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__npd_credits_consumed_c;
        SData/*11:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__npd_credits_consumed_r;
        SData/*11:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__cpld_credits_consumed_c;
        SData/*11:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__cpld_credits_consumed_r;
        SData/*15:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_lcrc_c;
        SData/*15:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_lcrc_r;
        SData/*15:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__timer_c;
        SData/*15:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__timer_r;
        SData/*15:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc4;
        SData/*15:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__crc_in_c;
        SData/*15:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__crc_in_r;
        SData/*15:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__next_transmit_seq_r;
        SData/*11:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__ackd_transmit_seq_c;
        SData/*11:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__ackd_transmit_seq_r;
        SData/*11:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_pd_c;
        SData/*11:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_pd_r;
        SData/*11:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_npd_c;
        SData/*11:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_npd_r;
        SData/*11:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_cpld_c;
        SData/*11:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__tx_fc_cpld_r;
        SData/*15:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc4;
        SData/*11:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__next_transmit_seq_c;
        SData/*11:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__next_transmit_seq_r;
        SData/*15:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__dllp_crc_out;
        SData/*15:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__dllp_lcrc32d32;
        SData/*11:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__pd_credits_consumed_c;
        SData/*11:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__pd_credits_consumed_r;
        SData/*11:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__npd_credits_consumed_c;
        SData/*11:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__npd_credits_consumed_r;
        SData/*11:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cpld_credits_consumed_c;
        SData/*11:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cpld_credits_consumed_r;
        SData/*11:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__pd_credit_limit_c;
        SData/*11:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__pd_credit_limit_r;
        SData/*11:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cpld_credit_limit_c;
        SData/*11:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cpld_credit_limit_r;
        SData/*11:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__npd_credit_limit_c;
        SData/*11:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__npd_credit_limit_r;
    };
    struct {
        SData/*11:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cplh_credit_limit_c;
        SData/*11:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__cplh_credit_limit_r;
        SData/*15:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk2__DOT__data_credits_required;
        SData/*15:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk4__DOT__data_length;
        SData/*15:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk4__DOT__data_credits_required;
        SData/*15:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk6__DOT__data_length;
        SData/*15:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__main_seq__DOT__unnamedblk6__DOT__data_credits_required;
        SData/*15:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__s_axis_tid;
        SData/*15:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__s_axis_tdest;
        SData/*15:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__s_axis_tid_reg;
        SData/*15:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__s_axis_tdest_reg;
        SData/*8:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__m_axis_tid_reg;
        SData/*8:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__temp_m_axis_tid_reg;
        SData/*11:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__store_seq_c;
        SData/*11:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__store_seq_r;
        SData/*11:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__seq_num_out;
        QData/*35:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__ack_seq_mem_c;
        QData/*35:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__ack_seq_mem_r;
        SData/*15:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_lcrc_c;
        SData/*15:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_lcrc_r;
        SData/*15:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_c;
        SData/*15:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__seq_count_r;
        SData/*15:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__fc2_count_c;
        SData/*15:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__fc2_count_r;
        SData/*15:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__idle_count_c;
        SData/*15:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__idle_count_r;
        SData/*15:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc4;
        SData/*15:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__s_axis_tid;
        SData/*15:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__s_axis_tdest;
        SData/*15:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__s_axis_tid_reg;
        SData/*15:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__s_axis_tdest_reg;
        SData/*8:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__m_axis_tid_reg;
        SData/*8:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__temp_m_axis_tid_reg;
        SData/*11:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__s_axis_tkeep;
        SData/*11:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__s_axis_tuser;
        SData/*11:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__s_axis_tkeep_reg;
        SData/*11:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__s_axis_tuser_reg;
        SData/*9:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__m_axis_tid_reg;
        SData/*9:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__temp_m_axis_tid_reg;
        SData/*11:0*/ __Vfunc_send_fc_init__3__datafc;
        SData/*11:0*/ __Vfunc_send_fc_init__4__datafc;
        SData/*11:0*/ __Vfunc_set_ack_nack__5__seq_num;
        SData/*11:0*/ __Vtask_get_fc_values__6__data_fc_out;
        SData/*11:0*/ __Vtask_get_fc_values__7__data_fc_out;
        SData/*11:0*/ __Vtask_get_fc_values__8__data_fc_out;
        SData/*11:0*/ __Vtask_get_fc_values__9__data_fc_out;
        SData/*11:0*/ __Vtask_get_fc_values__10__data_fc_out;
        SData/*11:0*/ __Vtask_get_fc_values__11__data_fc_out;
        SData/*11:0*/ __Vtask_get_fc_values__12__data_fc_out;
        SData/*11:0*/ __Vtask_get_fc_values__13__data_fc_out;
        SData/*11:0*/ __Vtask_get_fc_values__14__data_fc_out;
        SData/*11:0*/ __Vfunc_get_ack_nack_seq__15__Vfuncout;
        SData/*11:0*/ __Vfunc_get_ack_nack_seq__16__Vfuncout;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__s_axis_tlpin_tdata;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__s_axis_phy2dllp_tdata;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__s_axis_phy2tlp_tdata;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__m_axis_tlp2phy_tdata;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_tdata;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__tlp_dw0;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tdata_reg;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__cfg_fifo_inst__DOT__genblk1__DOT__m_axis_tdata_reg;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__cfg_fifo_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__tlp_fifo_inst__DOT__genblk1__DOT__m_axis_tdata_reg;
    };
    struct {
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__tlp_fifo_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__s_axis_tdata;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tdata_reg;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__tlp_dw0;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__tlp_byte_swapped;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__tlp_tdata;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tdata_reg;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__cpuif_wr_biten;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_wdata;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_from_tlp_c;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_from_tlp_r;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_c;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__crc_calculated_r;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__lcrc32d32;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp_lcrc_r;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__word_count_c;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__word_count_r;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__m_axis_tdata_reg;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_stage_2_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tdata_reg;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tdata_reg;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__data;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__pcie_lcrc32_inst__DOT__crcOut;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__tlp_crc16_inst__DOT__crcOut;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__j;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__fc_axis_tdata;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tdata_reg;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__m_axis_tdata_reg;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__m_axis_tdata_reg;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__tlp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__m_axis_tdata_reg;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__axis_user_demux_inst__DOT__dllp_axis_register_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__m_axis_retry_tdata;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_axis_tdata;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__crc_tlp_axis_tdata;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__crc_in_c;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__dllp_lcrc_c;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__crc_in_r;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__dllp_lcrc_r;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__lcrc32d32;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_dw0;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_output_register_inst__DOT__genblk1__DOT__m_axis_tdata_reg;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_output_register_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_flow_inst__DOT__genblk1__DOT__m_axis_tdata_reg;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_flow_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__m_axis_tdata_reg;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__axis_input_skid_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__pcie_lcrc32_inst__DOT__crcOut;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__tlp2dllp_inst__DOT__tlp_crc16_inst__DOT__crcOut;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__m_axis_tdata_int;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__i;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__m_axis_tdata_reg;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__temp_m_axis_tdata_reg;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__0__KET____DOT__retry_timer_c;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__0__KET____DOT__retry_timer_r;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__1__KET____DOT__retry_timer_c;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__1__KET____DOT__retry_timer_r;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__2__KET____DOT__retry_timer_c;
    };
    struct {
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_management_inst__DOT__gen_retry_counters__BRA__2__KET____DOT__retry_timer_r;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__fc_axis_tdata;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__m_axis_tdata_reg;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__axis_register_pipeline_inst__DOT__genblk1__DOT__temp_m_axis_tdata_reg;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__m_axis_tdata_int;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__i;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__m_axis_tdata_reg;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__temp_m_axis_tdata_reg;
        VlWide<3>/*95:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__s_axis_tdata;
        IData/*23:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__s_axis_tid;
        IData/*23:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__s_axis_tdest;
        VlWide<3>/*95:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__s_axis_tdata_reg;
        IData/*23:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__s_axis_tid_reg;
        IData/*23:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__s_axis_tdest_reg;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__m_axis_tdata_int;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__i;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__m_axis_tdata_reg;
        IData/*31:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__temp_m_axis_tdata_reg;
        IData/*31:0*/ __Vfunc_gen_cpld__0__data_in;
        IData/*31:0*/ __Vfunc_gen_cpl__1__data_in;
        IData/*31:0*/ __VdfgRegularize_h6e95ff9d_0_49;
        IData/*31:0*/ __VdfgRegularize_h6e95ff9d_0_62;
        IData/*31:0*/ __VactIterCount;
        VlWide<6>/*164:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__D;
        VlWide<6>/*164:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_mux_inst__DOT__Q;
        VlWide<4>/*127:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT____VlemCall_1__gen_cpld;
        VlWide<4>/*127:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT____VlemCall_0__gen_cpl;
        VlWide<14>/*424:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__D;
        VlWide<14>/*424:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_decode_inst__DOT__Q;
        QData/*47:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT____VlemCall_3__send_fc_init;
        QData/*47:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT____VlemCall_2__send_fc_init;
        QData/*47:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT____VlemCall_1__send_fc_init;
        QData/*47:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT____VlemCall_0__set_ack_nack;
        QData/*47:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dll_packet_r;
        QData/*47:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__dll_packet_c;
        QData/*47:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__dll_packet_r;
        VlWide<7>/*200:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__2__KET____DOT__axis_retry_fifo_inst__DOT__D;
        VlWide<7>/*200:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__2__KET____DOT__axis_retry_fifo_inst__DOT__Q;
        VlWide<7>/*200:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__1__KET____DOT__axis_retry_fifo_inst__DOT__D;
        VlWide<7>/*200:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__1__KET____DOT__axis_retry_fifo_inst__DOT__Q;
        VlWide<7>/*200:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__0__KET____DOT__axis_retry_fifo_inst__DOT__D;
        VlWide<7>/*200:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__gen_retry_axis_fifo__BRA__0__KET____DOT__axis_retry_fifo_inst__DOT__Q;
        QData/*63:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__s_axis_tdata;
        QData/*63:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__s_axis_tdata_reg;
        QData/*47:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT____VlemCall_7__send_fc_init;
        QData/*47:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT____VlemCall_6__send_fc_init;
        QData/*47:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT____VlemCall_5__send_fc_init;
        QData/*47:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT____VlemCall_4__send_fc_init;
        QData/*47:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT____VlemCall_3__send_fc_init;
        QData/*47:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT____VlemCall_2__send_fc_init;
        QData/*47:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT____VlemCall_1__send_fc_init;
        QData/*47:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT____VlemCall_0__send_fc_init;
        QData/*47:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dll_packet_r;
        QData/*63:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__s_axis_tdata;
        QData/*63:0*/ tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__s_axis_tdata_reg;
        VlWide<4>/*127:0*/ __Vfunc_gen_cpld__0__tlp_hdr_in;
        VlWide<4>/*127:0*/ __Vfunc_gen_cpl__1__tlp_hdr_in;
        QData/*47:0*/ __Vfunc_send_fc_init__2__unnamedblk1__DOT__dll_packet;
        QData/*47:0*/ __Vfunc_send_fc_init__3__unnamedblk1__DOT__dll_packet;
        QData/*47:0*/ __Vfunc_send_fc_init__4__unnamedblk1__DOT__dll_packet;
        QData/*47:0*/ __Vfunc_set_ack_nack__5__temp_dllp;
        QData/*47:0*/ __Vtask_get_fc_values__6__flow_control_in;
        QData/*47:0*/ __Vtask_get_fc_values__7__flow_control_in;
        QData/*47:0*/ __Vtask_get_fc_values__8__flow_control_in;
    };
    struct {
        QData/*47:0*/ __Vtask_get_fc_values__9__flow_control_in;
        QData/*47:0*/ __Vtask_get_fc_values__10__flow_control_in;
        QData/*47:0*/ __Vtask_get_fc_values__11__flow_control_in;
        QData/*47:0*/ __Vtask_get_fc_values__12__flow_control_in;
        QData/*47:0*/ __Vtask_get_fc_values__13__flow_control_in;
        QData/*47:0*/ __Vtask_get_fc_values__14__flow_control_in;
        QData/*47:0*/ __Vfunc_get_ack_nack_seq__15__ack_nack_in;
        QData/*47:0*/ __Vfunc_get_ack_nack_seq__16__ack_nack_in;
        QData/*47:0*/ __Vfunc_send_fc_init__17__unnamedblk1__DOT__dll_packet;
        QData/*47:0*/ __Vfunc_send_fc_init__18__unnamedblk1__DOT__dll_packet;
        QData/*47:0*/ __Vfunc_send_fc_init__19__unnamedblk1__DOT__dll_packet;
        QData/*47:0*/ __Vfunc_send_fc_init__20__unnamedblk1__DOT__dll_packet;
        QData/*47:0*/ __Vfunc_send_fc_init__21__unnamedblk1__DOT__dll_packet;
        QData/*47:0*/ __Vfunc_send_fc_init__22__unnamedblk1__DOT__dll_packet;
        QData/*47:0*/ __Vfunc_send_fc_init__23__unnamedblk1__DOT__dll_packet;
        QData/*47:0*/ __Vfunc_send_fc_init__24__unnamedblk1__DOT__dll_packet;
        QData/*40:0*/ __VdlyVal__tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_pipe_reg__v0;
        QData/*40:0*/ __VdlyVal__tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_pipe_reg__v1;
        VlUnpacked<CData/*0:0*/, 2> tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_resp_is_wr;
        VlUnpacked<CData/*0:0*/, 2> tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_resp_err;
        VlUnpacked<IData/*31:0*/, 2> tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__axil_resp_rdata;
        VlUnpacked<IData/*31:0*/, 21> tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__readback_array;
        VlUnpacked<QData/*40:0*/, 1> tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__mem;
        VlUnpacked<QData/*40:0*/, 2> tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp2tlp_inst__DOT__dllp2tlp_fifo_inst__DOT__m_axis_pipe_reg;
        VlUnpacked<SData/*15:0*/, 9> tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT__crc;
        VlUnpacked<SData/*15:0*/, 9> tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT__crc;
        VlUnpacked<SData/*15:0*/, 9> tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT__crc;
        VlUnpacked<SData/*15:0*/, 9> tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_fc_update_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT__crc;
        VlUnpacked<SData/*15:0*/, 9> tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_3__DOT__crc;
        VlUnpacked<SData/*15:0*/, 9> tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_2__DOT__crc;
        VlUnpacked<SData/*15:0*/, 9> tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_1__DOT__crc;
        VlUnpacked<SData/*15:0*/, 9> tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__dllp_handler_inst__DOT__pcie_datalink_crc_inst__DOT__crc_inst_0__DOT__crc;
        VlUnpacked<IData/*31:0*/, 3> tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__retry_axis_tdata;
        VlUnpacked<CData/*3:0*/, 3> tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__retry_axis_tkeep;
        VlUnpacked<CData/*0:0*/, 3> tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__retry_axis_tvalid;
        VlUnpacked<CData/*0:0*/, 3> tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__retry_axis_tlast;
        VlUnpacked<CData/*3:0*/, 3> tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__retry_axis_tuser;
        VlUnpacked<CData/*0:0*/, 3> tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__retry_transmit_inst__DOT__retry_axis_tready;
        VlUnpacked<CData/*0:0*/, 1> tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__stage_valid;
        VlUnpacked<CData/*0:0*/, 1> tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__stage_enc;
        VlUnpacked<CData/*0:0*/, 1> tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_inst__DOT__stage_valid;
        VlUnpacked<CData/*0:0*/, 1> tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_transmit_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_inst__DOT__stage_enc;
        VlUnpacked<SData/*15:0*/, 9> tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_3__DOT__crc;
        VlUnpacked<SData/*15:0*/, 9> tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_2__DOT__crc;
        VlUnpacked<SData/*15:0*/, 9> tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_1__DOT__crc;
        VlUnpacked<SData/*15:0*/, 9> tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__pcie_flow_ctrl_init_inst__DOT__dllp_crc_inst__DOT__crc_inst_0__DOT__crc;
        VlUnpacked<CData/*0:0*/, 1> tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__stage_valid;
        VlUnpacked<CData/*0:0*/, 1> tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__stage_enc;
        VlUnpacked<CData/*0:0*/, 1> tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_inst__DOT__stage_valid;
        VlUnpacked<CData/*0:0*/, 1> tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__tlp_arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_inst__DOT__stage_enc;
        VlUnpacked<CData/*1:0*/, 2> tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__stage_valid;
        VlUnpacked<CData/*1:0*/, 2> tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_masked__DOT__stage_enc;
        VlUnpacked<CData/*1:0*/, 2> tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_inst__DOT__stage_valid;
        VlUnpacked<CData/*1:0*/, 2> tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__arbiter_mux_inst__DOT__arb_inst__DOT__priority_encoder_inst__DOT__stage_enc;
        VlUnpacked<QData/*63:0*/, 1> __VstlTriggered;
        VlUnpacked<QData/*63:0*/, 1> __VactTriggered;
        VlUnpacked<QData/*63:0*/, 1> __VnbaTriggered;
        VlUnpacked<CData/*0:0*/, 4> __Vm_traceActivity;
    };
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fout_t__struct__0 tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__hwif_out;
    Vtb_pcie_datalink_layer_tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__fsm_struct_t__struct__0 tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__D;
    Vtb_pcie_datalink_layer_tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__fsm_struct_t__struct__0 tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_handler_inst__DOT__Q;
    Vtb_pcie_datalink_layer_tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb_t__struct__0 tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__decoded_reg_strb;
    Vtb_pcie_datalink_layer_tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo_t__struct__0 tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_combo;
    Vtb_pcie_datalink_layer_tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage_t__struct__0 tb_pcie_datalink_layer__DOT__pcie_datalink_layer_inst__DOT__dllp_receive_inst__DOT__pcie_cfg_wrapper_inst__DOT__pcie_config_reg_inst__DOT__field_storage;

    // INTERNAL VARIABLES
    Vtb_pcie_datalink_layer__Syms* vlSymsp;
    const char* vlNamep;

    // CONSTRUCTORS
    Vtb_pcie_datalink_layer___024root(Vtb_pcie_datalink_layer__Syms* symsp, const char* namep);
    ~Vtb_pcie_datalink_layer___024root();
    VL_UNCOPYABLE(Vtb_pcie_datalink_layer___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
