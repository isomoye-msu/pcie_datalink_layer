// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vtb_pcie_datalink_layer.h for the primary calling header

#ifndef VERILATED_VTB_PCIE_DATALINK_LAYER_PCIE_CONFIG_REG_PKG_H_
#define VERILATED_VTB_PCIE_DATALINK_LAYER_PCIE_CONFIG_REG_PKG_H_  // guard

#include "verilated.h"
#include "Vtb_pcie_datalink_layer_pcie_config_reg_pkg.h"


class Vtb_pcie_datalink_layer__Syms;
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Fcache_line_size_register___05Fin_t__struct__0 {
    CData/*7:0*/ __PVT__next;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Fcache_line_size_register___05Fin_t__struct__0& rhs) const {
        return __PVT__next == rhs.__PVT__next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Fcache_line_size_register___05Fin_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Fcache_line_size_register___05Fin_t__struct__0& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Fcache_line_size_register___05Fin_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Flatency_timer_register___05Fin_t__struct__0 {
    CData/*7:0*/ __PVT__next;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Flatency_timer_register___05Fin_t__struct__0& rhs) const {
        return __PVT__next == rhs.__PVT__next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Flatency_timer_register___05Fin_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Flatency_timer_register___05Fin_t__struct__0& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Flatency_timer_register___05Fin_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Finterrupt_line_register___05Fin_t__struct__0 {
    CData/*7:0*/ __PVT__next;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Finterrupt_line_register___05Fin_t__struct__0& rhs) const {
        return __PVT__next == rhs.__PVT__next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Finterrupt_line_register___05Fin_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Finterrupt_line_register___05Fin_t__struct__0& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Finterrupt_line_register___05Fin_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Finterrupt_pin_register___05Fin_t__struct__0 {
    CData/*7:0*/ __PVT__next;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Finterrupt_pin_register___05Fin_t__struct__0& rhs) const {
        return __PVT__next == rhs.__PVT__next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Finterrupt_pin_register___05Fin_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Finterrupt_pin_register___05Fin_t__struct__0& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Finterrupt_pin_register___05Fin_t__struct__0> : public std::true_type {};




struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Fin_t__struct__0 {
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Fcache_line_size_register___05Fin_t__struct__0 __PVT__cache_line_size_register;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Flatency_timer_register___05Fin_t__struct__0 __PVT__latency_timer_register;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Finterrupt_line_register___05Fin_t__struct__0 __PVT__interrupt_line_register;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Finterrupt_pin_register___05Fin_t__struct__0 __PVT__interrupt_pin_register;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Fin_t__struct__0& rhs) const {
        return __PVT__cache_line_size_register == rhs.__PVT__cache_line_size_register
            && __PVT__latency_timer_register == rhs.__PVT__latency_timer_register
            && __PVT__interrupt_line_register == rhs.__PVT__interrupt_line_register
            && __PVT__interrupt_pin_register == rhs.__PVT__interrupt_pin_register;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Fin_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Fin_t__struct__0& rhs) const {
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
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Fin_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_2___05FBAR___05Fin_t__struct__0 {
    IData/*31:0*/ __PVT__next;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_2___05FBAR___05Fin_t__struct__0& rhs) const {
        return __PVT__next == rhs.__PVT__next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_2___05FBAR___05Fin_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_2___05FBAR___05Fin_t__struct__0& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_2___05FBAR___05Fin_t__struct__0> : public std::true_type {};

struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_2___05Fin_t__struct__0 {
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_2___05FBAR___05Fin_t__struct__0 __PVT__BAR;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_2___05Fin_t__struct__0& rhs) const {
        return __PVT__BAR == rhs.__PVT__BAR;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_2___05Fin_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_2___05Fin_t__struct__0& rhs) const {
        if (__PVT__BAR < rhs.__PVT__BAR) return true;
        if (rhs.__PVT__BAR < __PVT__BAR) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_2___05Fin_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_3___05FBAR___05Fin_t__struct__0 {
    IData/*31:0*/ __PVT__next;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_3___05FBAR___05Fin_t__struct__0& rhs) const {
        return __PVT__next == rhs.__PVT__next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_3___05FBAR___05Fin_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_3___05FBAR___05Fin_t__struct__0& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_3___05FBAR___05Fin_t__struct__0> : public std::true_type {};

struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_3___05Fin_t__struct__0 {
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_3___05FBAR___05Fin_t__struct__0 __PVT__BAR;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_3___05Fin_t__struct__0& rhs) const {
        return __PVT__BAR == rhs.__PVT__BAR;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_3___05Fin_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_3___05Fin_t__struct__0& rhs) const {
        if (__PVT__BAR < rhs.__PVT__BAR) return true;
        if (rhs.__PVT__BAR < __PVT__BAR) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_3___05Fin_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_4___05FBAR___05Fin_t__struct__0 {
    IData/*31:0*/ __PVT__next;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_4___05FBAR___05Fin_t__struct__0& rhs) const {
        return __PVT__next == rhs.__PVT__next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_4___05FBAR___05Fin_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_4___05FBAR___05Fin_t__struct__0& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_4___05FBAR___05Fin_t__struct__0> : public std::true_type {};

struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_4___05Fin_t__struct__0 {
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_4___05FBAR___05Fin_t__struct__0 __PVT__BAR;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_4___05Fin_t__struct__0& rhs) const {
        return __PVT__BAR == rhs.__PVT__BAR;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_4___05Fin_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_4___05Fin_t__struct__0& rhs) const {
        if (__PVT__BAR < rhs.__PVT__BAR) return true;
        if (rhs.__PVT__BAR < __PVT__BAR) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_4___05Fin_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_5___05FBAR___05Fin_t__struct__0 {
    IData/*31:0*/ __PVT__next;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_5___05FBAR___05Fin_t__struct__0& rhs) const {
        return __PVT__next == rhs.__PVT__next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_5___05FBAR___05Fin_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_5___05FBAR___05Fin_t__struct__0& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_5___05FBAR___05Fin_t__struct__0> : public std::true_type {};

struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_5___05Fin_t__struct__0 {
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_5___05FBAR___05Fin_t__struct__0 __PVT__BAR;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_5___05Fin_t__struct__0& rhs) const {
        return __PVT__BAR == rhs.__PVT__BAR;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_5___05Fin_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_5___05Fin_t__struct__0& rhs) const {
        if (__PVT__BAR < rhs.__PVT__BAR) return true;
        if (rhs.__PVT__BAR < __PVT__BAR) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_5___05Fin_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fcardbus_cis_pointer___05Fword___05Fin_t__struct__0 {
    IData/*31:0*/ __PVT__next;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcardbus_cis_pointer___05Fword___05Fin_t__struct__0& rhs) const {
        return __PVT__next == rhs.__PVT__next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcardbus_cis_pointer___05Fword___05Fin_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcardbus_cis_pointer___05Fword___05Fin_t__struct__0& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fcardbus_cis_pointer___05Fword___05Fin_t__struct__0> : public std::true_type {};

struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fcardbus_cis_pointer___05Fin_t__struct__0 {
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fcardbus_cis_pointer___05Fword___05Fin_t__struct__0 __PVT__word;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcardbus_cis_pointer___05Fin_t__struct__0& rhs) const {
        return __PVT__word == rhs.__PVT__word;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcardbus_cis_pointer___05Fin_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcardbus_cis_pointer___05Fin_t__struct__0& rhs) const {
        if (__PVT__word < rhs.__PVT__word) return true;
        if (rhs.__PVT__word < __PVT__word) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fcardbus_cis_pointer___05Fin_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Finterrupt_line___05Fin_t__struct__0 {
    CData/*7:0*/ __PVT__next;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Finterrupt_line___05Fin_t__struct__0& rhs) const {
        return __PVT__next == rhs.__PVT__next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Finterrupt_line___05Fin_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Finterrupt_line___05Fin_t__struct__0& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Finterrupt_line___05Fin_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Finterrupt_pin___05Fin_t__struct__0 {
    CData/*7:0*/ __PVT__next;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Finterrupt_pin___05Fin_t__struct__0& rhs) const {
        return __PVT__next == rhs.__PVT__next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Finterrupt_pin___05Fin_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Finterrupt_pin___05Fin_t__struct__0& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Finterrupt_pin___05Fin_t__struct__0> : public std::true_type {};


struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Fin_t__struct__0 {
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Finterrupt_line___05Fin_t__struct__0 __PVT__interrupt_line;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Finterrupt_pin___05Fin_t__struct__0 __PVT__interrupt_pin;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Fin_t__struct__0& rhs) const {
        return __PVT__interrupt_line == rhs.__PVT__interrupt_line
            && __PVT__interrupt_pin == rhs.__PVT__interrupt_pin;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Fin_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Fin_t__struct__0& rhs) const {
        if (__PVT__interrupt_line < rhs.__PVT__interrupt_line) return true;
        if (rhs.__PVT__interrupt_line < __PVT__interrupt_line) return false;
        if (__PVT__interrupt_pin < rhs.__PVT__interrupt_pin) return true;
        if (rhs.__PVT__interrupt_pin < __PVT__interrupt_pin) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Fin_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_error_status_register___05Flane_error___05Fin_t__struct__0 {
    CData/*4:0*/ __PVT__next;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_error_status_register___05Flane_error___05Fin_t__struct__0& rhs) const {
        return __PVT__next == rhs.__PVT__next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_error_status_register___05Flane_error___05Fin_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_error_status_register___05Flane_error___05Fin_t__struct__0& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_error_status_register___05Flane_error___05Fin_t__struct__0> : public std::true_type {};

struct Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_error_status_register___05Fin_t__struct__0 {
    Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_error_status_register___05Flane_error___05Fin_t__struct__0 __PVT__lane_error;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_error_status_register___05Fin_t__struct__0& rhs) const {
        return __PVT__lane_error == rhs.__PVT__lane_error;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_error_status_register___05Fin_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_error_status_register___05Fin_t__struct__0& rhs) const {
        if (__PVT__lane_error < rhs.__PVT__lane_error) return true;
        if (rhs.__PVT__lane_error < __PVT__lane_error) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_error_status_register___05Fin_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fdownstream_tx_preset___05Fin_t__struct__0 {
    CData/*3:0*/ __PVT__next;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fdownstream_tx_preset___05Fin_t__struct__0& rhs) const {
        return __PVT__next == rhs.__PVT__next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fdownstream_tx_preset___05Fin_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fdownstream_tx_preset___05Fin_t__struct__0& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fdownstream_tx_preset___05Fin_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fdownstream_rx_preset_hint___05Fin_t__struct__0 {
    CData/*2:0*/ __PVT__next;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fdownstream_rx_preset_hint___05Fin_t__struct__0& rhs) const {
        return __PVT__next == rhs.__PVT__next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fdownstream_rx_preset_hint___05Fin_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fdownstream_rx_preset_hint___05Fin_t__struct__0& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fdownstream_rx_preset_hint___05Fin_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fupstream_tx_preset___05Fin_t__struct__0 {
    CData/*3:0*/ __PVT__next;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fupstream_tx_preset___05Fin_t__struct__0& rhs) const {
        return __PVT__next == rhs.__PVT__next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fupstream_tx_preset___05Fin_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fupstream_tx_preset___05Fin_t__struct__0& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fupstream_tx_preset___05Fin_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fupstream_rx_preset_hint___05Fin_t__struct__0 {
    CData/*2:0*/ __PVT__next;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fupstream_rx_preset_hint___05Fin_t__struct__0& rhs) const {
        return __PVT__next == rhs.__PVT__next;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fupstream_rx_preset_hint___05Fin_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fupstream_rx_preset_hint___05Fin_t__struct__0& rhs) const {
        if (__PVT__next < rhs.__PVT__next) return true;
        if (rhs.__PVT__next < __PVT__next) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fupstream_rx_preset_hint___05Fin_t__struct__0> : public std::true_type {};




struct Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fin_t__struct__0 {
    Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fdownstream_tx_preset___05Fin_t__struct__0 __PVT__downstream_tx_preset;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fdownstream_rx_preset_hint___05Fin_t__struct__0 __PVT__downstream_rx_preset_hint;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fupstream_tx_preset___05Fin_t__struct__0 __PVT__upstream_tx_preset;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fupstream_rx_preset_hint___05Fin_t__struct__0 __PVT__upstream_rx_preset_hint;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fin_t__struct__0& rhs) const {
        return __PVT__downstream_tx_preset == rhs.__PVT__downstream_tx_preset
            && __PVT__downstream_rx_preset_hint == rhs.__PVT__downstream_rx_preset_hint
            && __PVT__upstream_tx_preset == rhs.__PVT__upstream_tx_preset
            && __PVT__upstream_rx_preset_hint == rhs.__PVT__upstream_rx_preset_hint;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fin_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fin_t__struct__0& rhs) const {
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
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fin_t__struct__0> : public std::true_type {};









struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fin_t__struct__0 {
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Fin_t__struct__0 __PVT__byte_offset_0C;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_2___05Fin_t__struct__0 __PVT__base_ddress_register_2;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_3___05Fin_t__struct__0 __PVT__base_ddress_register_3;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_4___05Fin_t__struct__0 __PVT__base_ddress_register_4;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_5___05Fin_t__struct__0 __PVT__base_ddress_register_5;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fcardbus_cis_pointer___05Fin_t__struct__0 __PVT__cardbus_cis_pointer;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Fin_t__struct__0 __PVT__byte_offset_3C;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_error_status_register___05Fin_t__struct__0 __PVT__lane_error_status_register;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fin_t__struct__0 __PVT__lane_eq_ctrl_register;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fin_t__struct__0& rhs) const {
        return __PVT__byte_offset_0C == rhs.__PVT__byte_offset_0C
            && __PVT__base_ddress_register_2 == rhs.__PVT__base_ddress_register_2
            && __PVT__base_ddress_register_3 == rhs.__PVT__base_ddress_register_3
            && __PVT__base_ddress_register_4 == rhs.__PVT__base_ddress_register_4
            && __PVT__base_ddress_register_5 == rhs.__PVT__base_ddress_register_5
            && __PVT__cardbus_cis_pointer == rhs.__PVT__cardbus_cis_pointer
            && __PVT__byte_offset_3C == rhs.__PVT__byte_offset_3C
            && __PVT__lane_error_status_register == rhs.__PVT__lane_error_status_register
            && __PVT__lane_eq_ctrl_register == rhs.__PVT__lane_eq_ctrl_register;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fin_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fin_t__struct__0& rhs) const {
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
        if (__PVT__lane_error_status_register < rhs.__PVT__lane_error_status_register) return true;
        if (rhs.__PVT__lane_error_status_register < __PVT__lane_error_status_register) return false;
        if (__PVT__lane_eq_ctrl_register < rhs.__PVT__lane_eq_ctrl_register) return true;
        if (rhs.__PVT__lane_eq_ctrl_register < __PVT__lane_eq_ctrl_register) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fin_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_00___05FVendor_ID___05Fout_t__struct__0 {
    SData/*15:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_00___05FVendor_ID___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_00___05FVendor_ID___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_00___05FVendor_ID___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_00___05FVendor_ID___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_00___05FDevice_ID___05Fout_t__struct__0 {
    SData/*15:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_00___05FDevice_ID___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_00___05FDevice_ID___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_00___05FDevice_ID___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_00___05FDevice_ID___05Fout_t__struct__0> : public std::true_type {};


struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_00___05Fout_t__struct__0 {
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_00___05FVendor_ID___05Fout_t__struct__0 __PVT__Vendor_ID;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_00___05FDevice_ID___05Fout_t__struct__0 __PVT__Device_ID;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_00___05Fout_t__struct__0& rhs) const {
        return __PVT__Vendor_ID == rhs.__PVT__Vendor_ID
            && __PVT__Device_ID == rhs.__PVT__Device_ID;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_00___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_00___05Fout_t__struct__0& rhs) const {
        if (__PVT__Vendor_ID < rhs.__PVT__Vendor_ID) return true;
        if (rhs.__PVT__Vendor_ID < __PVT__Vendor_ID) return false;
        if (__PVT__Device_ID < rhs.__PVT__Device_ID) return true;
        if (rhs.__PVT__Device_ID < __PVT__Device_ID) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_00___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fbus_master_enable___05Fout_t__struct__0 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fbus_master_enable___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fbus_master_enable___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fbus_master_enable___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fbus_master_enable___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fspecial_cycle_enable___05Fout_t__struct__0 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fspecial_cycle_enable___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fspecial_cycle_enable___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fspecial_cycle_enable___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fspecial_cycle_enable___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fmemory_write_invalidate___05Fout_t__struct__0 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fmemory_write_invalidate___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fmemory_write_invalidate___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fmemory_write_invalidate___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fmemory_write_invalidate___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fvga_palette_snoop___05Fout_t__struct__0 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fvga_palette_snoop___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fvga_palette_snoop___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fvga_palette_snoop___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fvga_palette_snoop___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fparity_error_response___05Fout_t__struct__0 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fparity_error_response___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fparity_error_response___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fparity_error_response___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fparity_error_response___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fidsel_step_wait_cycle_control___05Fout_t__struct__0 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fidsel_step_wait_cycle_control___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fidsel_step_wait_cycle_control___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fidsel_step_wait_cycle_control___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fidsel_step_wait_cycle_control___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05FSERR_Enable___05Fout_t__struct__0 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05FSERR_Enable___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05FSERR_Enable___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05FSERR_Enable___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05FSERR_Enable___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Ffast_b2b_transactions_enable___05Fout_t__struct__0 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Ffast_b2b_transactions_enable___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Ffast_b2b_transactions_enable___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Ffast_b2b_transactions_enable___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Ffast_b2b_transactions_enable___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Finterrupt_disable___05Fout_t__struct__0 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Finterrupt_disable___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Finterrupt_disable___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Finterrupt_disable___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Finterrupt_disable___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Frsvd___05Fout_t__struct__0 {
    CData/*7:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Frsvd___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Frsvd___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Frsvd___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Frsvd___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Finterrupt_status___05Fout_t__struct__0 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Finterrupt_status___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Finterrupt_status___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Finterrupt_status___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Finterrupt_status___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fcapabilities_list___05Fout_t__struct__0 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fcapabilities_list___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fcapabilities_list___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fcapabilities_list___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fcapabilities_list___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fsixtysix_mhz_capable___05Fout_t__struct__0 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fsixtysix_mhz_capable___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fsixtysix_mhz_capable___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fsixtysix_mhz_capable___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fsixtysix_mhz_capable___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Ffast_b2b_transactions_capable___05Fout_t__struct__0 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Ffast_b2b_transactions_capable___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Ffast_b2b_transactions_capable___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Ffast_b2b_transactions_capable___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Ffast_b2b_transactions_capable___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fmaster_data_parity_error___05Fout_t__struct__0 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fmaster_data_parity_error___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fmaster_data_parity_error___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fmaster_data_parity_error___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fmaster_data_parity_error___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fdevsel_timing___05Fout_t__struct__0 {
    CData/*1:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fdevsel_timing___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fdevsel_timing___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fdevsel_timing___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fdevsel_timing___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fsignaled_target_abort___05Fout_t__struct__0 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fsignaled_target_abort___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fsignaled_target_abort___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fsignaled_target_abort___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fsignaled_target_abort___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Freceived_target_abort___05Fout_t__struct__0 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Freceived_target_abort___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Freceived_target_abort___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Freceived_target_abort___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Freceived_target_abort___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Freceived_master_abort___05Fout_t__struct__0 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Freceived_master_abort___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Freceived_master_abort___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Freceived_master_abort___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Freceived_master_abort___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fsignaled_system_error___05Fout_t__struct__0 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fsignaled_system_error___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fsignaled_system_error___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fsignaled_system_error___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fsignaled_system_error___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fdetected_parity_error___05Fout_t__struct__0 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fdetected_parity_error___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fdetected_parity_error___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fdetected_parity_error___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fdetected_parity_error___05Fout_t__struct__0> : public std::true_type {};





















struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fout_t__struct__0 {
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fbus_master_enable___05Fout_t__struct__0 __PVT__bus_master_enable;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fspecial_cycle_enable___05Fout_t__struct__0 __PVT__special_cycle_enable;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fmemory_write_invalidate___05Fout_t__struct__0 __PVT__memory_write_invalidate;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fvga_palette_snoop___05Fout_t__struct__0 __PVT__vga_palette_snoop;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fparity_error_response___05Fout_t__struct__0 __PVT__parity_error_response;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fidsel_step_wait_cycle_control___05Fout_t__struct__0 __PVT__idsel_step_wait_cycle_control;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05FSERR_Enable___05Fout_t__struct__0 __PVT__SERR_Enable;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Ffast_b2b_transactions_enable___05Fout_t__struct__0 __PVT__fast_b2b_transactions_enable;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Finterrupt_disable___05Fout_t__struct__0 __PVT__interrupt_disable;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Frsvd___05Fout_t__struct__0 __PVT__rsvd;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Finterrupt_status___05Fout_t__struct__0 __PVT__interrupt_status;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fcapabilities_list___05Fout_t__struct__0 __PVT__capabilities_list;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fsixtysix_mhz_capable___05Fout_t__struct__0 __PVT__sixtysix_mhz_capable;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Ffast_b2b_transactions_capable___05Fout_t__struct__0 __PVT__fast_b2b_transactions_capable;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fmaster_data_parity_error___05Fout_t__struct__0 __PVT__master_data_parity_error;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fdevsel_timing___05Fout_t__struct__0 __PVT__devsel_timing;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fsignaled_target_abort___05Fout_t__struct__0 __PVT__signaled_target_abort;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Freceived_target_abort___05Fout_t__struct__0 __PVT__received_target_abort;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Freceived_master_abort___05Fout_t__struct__0 __PVT__received_master_abort;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fsignaled_system_error___05Fout_t__struct__0 __PVT__signaled_system_error;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fdetected_parity_error___05Fout_t__struct__0 __PVT__detected_parity_error;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fout_t__struct__0& rhs) const {
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
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fout_t__struct__0& rhs) const {
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
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_08___05FRevision_ID___05Fout_t__struct__0 {
    CData/*7:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_08___05FRevision_ID___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_08___05FRevision_ID___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_08___05FRevision_ID___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_08___05FRevision_ID___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_08___05FClass_Code___05Fout_t__struct__0 {
    IData/*23:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_08___05FClass_Code___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_08___05FClass_Code___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_08___05FClass_Code___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_08___05FClass_Code___05Fout_t__struct__0> : public std::true_type {};


struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_08___05Fout_t__struct__0 {
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_08___05FRevision_ID___05Fout_t__struct__0 __PVT__Revision_ID;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_08___05FClass_Code___05Fout_t__struct__0 __PVT__Class_Code;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_08___05Fout_t__struct__0& rhs) const {
        return __PVT__Revision_ID == rhs.__PVT__Revision_ID
            && __PVT__Class_Code == rhs.__PVT__Class_Code;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_08___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_08___05Fout_t__struct__0& rhs) const {
        if (__PVT__Revision_ID < rhs.__PVT__Revision_ID) return true;
        if (rhs.__PVT__Revision_ID < __PVT__Revision_ID) return false;
        if (__PVT__Class_Code < rhs.__PVT__Class_Code) return true;
        if (rhs.__PVT__Class_Code < __PVT__Class_Code) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_08___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Fcache_line_size_register___05Fout_t__struct__0 {
    CData/*7:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Fcache_line_size_register___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Fcache_line_size_register___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Fcache_line_size_register___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Fcache_line_size_register___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Flatency_timer_register___05Fout_t__struct__0 {
    CData/*7:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Flatency_timer_register___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Flatency_timer_register___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Flatency_timer_register___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Flatency_timer_register___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Finterrupt_line_register___05Fout_t__struct__0 {
    CData/*7:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Finterrupt_line_register___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Finterrupt_line_register___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Finterrupt_line_register___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Finterrupt_line_register___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Finterrupt_pin_register___05Fout_t__struct__0 {
    CData/*7:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Finterrupt_pin_register___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Finterrupt_pin_register___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Finterrupt_pin_register___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Finterrupt_pin_register___05Fout_t__struct__0> : public std::true_type {};




struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Fout_t__struct__0 {
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Fcache_line_size_register___05Fout_t__struct__0 __PVT__cache_line_size_register;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Flatency_timer_register___05Fout_t__struct__0 __PVT__latency_timer_register;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Finterrupt_line_register___05Fout_t__struct__0 __PVT__interrupt_line_register;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Finterrupt_pin_register___05Fout_t__struct__0 __PVT__interrupt_pin_register;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Fout_t__struct__0& rhs) const {
        return __PVT__cache_line_size_register == rhs.__PVT__cache_line_size_register
            && __PVT__latency_timer_register == rhs.__PVT__latency_timer_register
            && __PVT__interrupt_line_register == rhs.__PVT__interrupt_line_register
            && __PVT__interrupt_pin_register == rhs.__PVT__interrupt_pin_register;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Fout_t__struct__0& rhs) const {
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
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_address_register_0___05Fregion_type___05Fout_t__struct__0 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_address_register_0___05Fregion_type___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_address_register_0___05Fregion_type___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_address_register_0___05Fregion_type___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_address_register_0___05Fregion_type___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_address_register_0___05Flocatable___05Fout_t__struct__0 {
    CData/*1:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_address_register_0___05Flocatable___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_address_register_0___05Flocatable___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_address_register_0___05Flocatable___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_address_register_0___05Flocatable___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_address_register_0___05Fprefetchable___05Fout_t__struct__0 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_address_register_0___05Fprefetchable___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_address_register_0___05Fprefetchable___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_address_register_0___05Fprefetchable___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_address_register_0___05Fprefetchable___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_address_register_0___05Fbase_adress___05Fout_t__struct__0 {
    IData/*27:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_address_register_0___05Fbase_adress___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_address_register_0___05Fbase_adress___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_address_register_0___05Fbase_adress___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_address_register_0___05Fbase_adress___05Fout_t__struct__0> : public std::true_type {};




struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_address_register_0___05Fout_t__struct__0 {
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_address_register_0___05Fregion_type___05Fout_t__struct__0 __PVT__region_type;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_address_register_0___05Flocatable___05Fout_t__struct__0 __PVT__locatable;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_address_register_0___05Fprefetchable___05Fout_t__struct__0 __PVT__prefetchable;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_address_register_0___05Fbase_adress___05Fout_t__struct__0 __PVT__base_adress;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_address_register_0___05Fout_t__struct__0& rhs) const {
        return __PVT__region_type == rhs.__PVT__region_type
            && __PVT__locatable == rhs.__PVT__locatable
            && __PVT__prefetchable == rhs.__PVT__prefetchable
            && __PVT__base_adress == rhs.__PVT__base_adress;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_address_register_0___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_address_register_0___05Fout_t__struct__0& rhs) const {
        if (__PVT__region_type < rhs.__PVT__region_type) return true;
        if (rhs.__PVT__region_type < __PVT__region_type) return false;
        if (__PVT__locatable < rhs.__PVT__locatable) return true;
        if (rhs.__PVT__locatable < __PVT__locatable) return false;
        if (__PVT__prefetchable < rhs.__PVT__prefetchable) return true;
        if (rhs.__PVT__prefetchable < __PVT__prefetchable) return false;
        if (__PVT__base_adress < rhs.__PVT__base_adress) return true;
        if (rhs.__PVT__base_adress < __PVT__base_adress) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_address_register_0___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_1___05Fregion_type___05Fout_t__struct__0 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_1___05Fregion_type___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_1___05Fregion_type___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_1___05Fregion_type___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_1___05Fregion_type___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_1___05Flocatable___05Fout_t__struct__0 {
    CData/*1:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_1___05Flocatable___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_1___05Flocatable___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_1___05Flocatable___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_1___05Flocatable___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_1___05Fprefetchable___05Fout_t__struct__0 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_1___05Fprefetchable___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_1___05Fprefetchable___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_1___05Fprefetchable___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_1___05Fprefetchable___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_1___05Fbase_adress___05Fout_t__struct__0 {
    IData/*27:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_1___05Fbase_adress___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_1___05Fbase_adress___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_1___05Fbase_adress___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_1___05Fbase_adress___05Fout_t__struct__0> : public std::true_type {};




struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_1___05Fout_t__struct__0 {
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_1___05Fregion_type___05Fout_t__struct__0 __PVT__region_type;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_1___05Flocatable___05Fout_t__struct__0 __PVT__locatable;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_1___05Fprefetchable___05Fout_t__struct__0 __PVT__prefetchable;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_1___05Fbase_adress___05Fout_t__struct__0 __PVT__base_adress;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_1___05Fout_t__struct__0& rhs) const {
        return __PVT__region_type == rhs.__PVT__region_type
            && __PVT__locatable == rhs.__PVT__locatable
            && __PVT__prefetchable == rhs.__PVT__prefetchable
            && __PVT__base_adress == rhs.__PVT__base_adress;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_1___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_1___05Fout_t__struct__0& rhs) const {
        if (__PVT__region_type < rhs.__PVT__region_type) return true;
        if (rhs.__PVT__region_type < __PVT__region_type) return false;
        if (__PVT__locatable < rhs.__PVT__locatable) return true;
        if (rhs.__PVT__locatable < __PVT__locatable) return false;
        if (__PVT__prefetchable < rhs.__PVT__prefetchable) return true;
        if (rhs.__PVT__prefetchable < __PVT__prefetchable) return false;
        if (__PVT__base_adress < rhs.__PVT__base_adress) return true;
        if (rhs.__PVT__base_adress < __PVT__base_adress) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_1___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_2___05FBAR___05Fout_t__struct__0 {
    IData/*31:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_2___05FBAR___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_2___05FBAR___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_2___05FBAR___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_2___05FBAR___05Fout_t__struct__0> : public std::true_type {};

struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_2___05Fout_t__struct__0 {
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_2___05FBAR___05Fout_t__struct__0 __PVT__BAR;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_2___05Fout_t__struct__0& rhs) const {
        return __PVT__BAR == rhs.__PVT__BAR;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_2___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_2___05Fout_t__struct__0& rhs) const {
        if (__PVT__BAR < rhs.__PVT__BAR) return true;
        if (rhs.__PVT__BAR < __PVT__BAR) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_2___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_3___05FBAR___05Fout_t__struct__0 {
    IData/*31:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_3___05FBAR___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_3___05FBAR___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_3___05FBAR___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_3___05FBAR___05Fout_t__struct__0> : public std::true_type {};

struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_3___05Fout_t__struct__0 {
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_3___05FBAR___05Fout_t__struct__0 __PVT__BAR;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_3___05Fout_t__struct__0& rhs) const {
        return __PVT__BAR == rhs.__PVT__BAR;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_3___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_3___05Fout_t__struct__0& rhs) const {
        if (__PVT__BAR < rhs.__PVT__BAR) return true;
        if (rhs.__PVT__BAR < __PVT__BAR) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_3___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_4___05FBAR___05Fout_t__struct__0 {
    IData/*31:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_4___05FBAR___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_4___05FBAR___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_4___05FBAR___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_4___05FBAR___05Fout_t__struct__0> : public std::true_type {};

struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_4___05Fout_t__struct__0 {
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_4___05FBAR___05Fout_t__struct__0 __PVT__BAR;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_4___05Fout_t__struct__0& rhs) const {
        return __PVT__BAR == rhs.__PVT__BAR;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_4___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_4___05Fout_t__struct__0& rhs) const {
        if (__PVT__BAR < rhs.__PVT__BAR) return true;
        if (rhs.__PVT__BAR < __PVT__BAR) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_4___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_5___05FBAR___05Fout_t__struct__0 {
    IData/*31:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_5___05FBAR___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_5___05FBAR___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_5___05FBAR___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_5___05FBAR___05Fout_t__struct__0> : public std::true_type {};

struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_5___05Fout_t__struct__0 {
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_5___05FBAR___05Fout_t__struct__0 __PVT__BAR;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_5___05Fout_t__struct__0& rhs) const {
        return __PVT__BAR == rhs.__PVT__BAR;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_5___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_5___05Fout_t__struct__0& rhs) const {
        if (__PVT__BAR < rhs.__PVT__BAR) return true;
        if (rhs.__PVT__BAR < __PVT__BAR) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_5___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fcardbus_cis_pointer___05Fword___05Fout_t__struct__0 {
    IData/*31:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcardbus_cis_pointer___05Fword___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcardbus_cis_pointer___05Fword___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcardbus_cis_pointer___05Fword___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fcardbus_cis_pointer___05Fword___05Fout_t__struct__0> : public std::true_type {};

struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fcardbus_cis_pointer___05Fout_t__struct__0 {
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fcardbus_cis_pointer___05Fword___05Fout_t__struct__0 __PVT__word;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcardbus_cis_pointer___05Fout_t__struct__0& rhs) const {
        return __PVT__word == rhs.__PVT__word;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcardbus_cis_pointer___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcardbus_cis_pointer___05Fout_t__struct__0& rhs) const {
        if (__PVT__word < rhs.__PVT__word) return true;
        if (rhs.__PVT__word < __PVT__word) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fcardbus_cis_pointer___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_2C___05FVendor_ID___05Fout_t__struct__0 {
    SData/*15:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_2C___05FVendor_ID___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_2C___05FVendor_ID___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_2C___05FVendor_ID___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_2C___05FVendor_ID___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_2C___05FDevice_ID___05Fout_t__struct__0 {
    SData/*15:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_2C___05FDevice_ID___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_2C___05FDevice_ID___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_2C___05FDevice_ID___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_2C___05FDevice_ID___05Fout_t__struct__0> : public std::true_type {};


struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_2C___05Fout_t__struct__0 {
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_2C___05FVendor_ID___05Fout_t__struct__0 __PVT__Vendor_ID;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_2C___05FDevice_ID___05Fout_t__struct__0 __PVT__Device_ID;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_2C___05Fout_t__struct__0& rhs) const {
        return __PVT__Vendor_ID == rhs.__PVT__Vendor_ID
            && __PVT__Device_ID == rhs.__PVT__Device_ID;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_2C___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_2C___05Fout_t__struct__0& rhs) const {
        if (__PVT__Vendor_ID < rhs.__PVT__Vendor_ID) return true;
        if (rhs.__PVT__Vendor_ID < __PVT__Vendor_ID) return false;
        if (__PVT__Device_ID < rhs.__PVT__Device_ID) return true;
        if (rhs.__PVT__Device_ID < __PVT__Device_ID) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_2C___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_pointer___05Fcapabilities_ptr___05Fout_t__struct__0 {
    CData/*7:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_pointer___05Fcapabilities_ptr___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_pointer___05Fcapabilities_ptr___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_pointer___05Fcapabilities_ptr___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_pointer___05Fcapabilities_ptr___05Fout_t__struct__0> : public std::true_type {};

struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_pointer___05Fout_t__struct__0 {
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_pointer___05Fcapabilities_ptr___05Fout_t__struct__0 __PVT__capabilities_ptr;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_pointer___05Fout_t__struct__0& rhs) const {
        return __PVT__capabilities_ptr == rhs.__PVT__capabilities_ptr;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_pointer___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_pointer___05Fout_t__struct__0& rhs) const {
        if (__PVT__capabilities_ptr < rhs.__PVT__capabilities_ptr) return true;
        if (rhs.__PVT__capabilities_ptr < __PVT__capabilities_ptr) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_pointer___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Finterrupt_line___05Fout_t__struct__0 {
    CData/*7:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Finterrupt_line___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Finterrupt_line___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Finterrupt_line___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Finterrupt_line___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Finterrupt_pin___05Fout_t__struct__0 {
    CData/*7:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Finterrupt_pin___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Finterrupt_pin___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Finterrupt_pin___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Finterrupt_pin___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Fmin_gnt___05Fout_t__struct__0 {
    CData/*7:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Fmin_gnt___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Fmin_gnt___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Fmin_gnt___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Fmin_gnt___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Fmax_lat___05Fout_t__struct__0 {
    CData/*7:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Fmax_lat___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Fmax_lat___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Fmax_lat___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Fmax_lat___05Fout_t__struct__0> : public std::true_type {};




struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Fout_t__struct__0 {
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Finterrupt_line___05Fout_t__struct__0 __PVT__interrupt_line;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Finterrupt_pin___05Fout_t__struct__0 __PVT__interrupt_pin;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Fmin_gnt___05Fout_t__struct__0 __PVT__min_gnt;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Fmax_lat___05Fout_t__struct__0 __PVT__max_lat;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Fout_t__struct__0& rhs) const {
        return __PVT__interrupt_line == rhs.__PVT__interrupt_line
            && __PVT__interrupt_pin == rhs.__PVT__interrupt_pin
            && __PVT__min_gnt == rhs.__PVT__min_gnt
            && __PVT__max_lat == rhs.__PVT__max_lat;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Fout_t__struct__0& rhs) const {
        if (__PVT__interrupt_line < rhs.__PVT__interrupt_line) return true;
        if (rhs.__PVT__interrupt_line < __PVT__interrupt_line) return false;
        if (__PVT__interrupt_pin < rhs.__PVT__interrupt_pin) return true;
        if (rhs.__PVT__interrupt_pin < __PVT__interrupt_pin) return false;
        if (__PVT__min_gnt < rhs.__PVT__min_gnt) return true;
        if (rhs.__PVT__min_gnt < __PVT__min_gnt) return false;
        if (__PVT__max_lat < rhs.__PVT__max_lat) return true;
        if (rhs.__PVT__max_lat < __PVT__max_lat) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fcapabilities_id___05Fout_t__struct__0 {
    CData/*7:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fcapabilities_id___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fcapabilities_id___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fcapabilities_id___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fcapabilities_id___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fnext_cap_ptr___05Fout_t__struct__0 {
    CData/*7:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fnext_cap_ptr___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fnext_cap_ptr___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fnext_cap_ptr___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fnext_cap_ptr___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fversion___05Fout_t__struct__0 {
    CData/*2:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fversion___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fversion___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fversion___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fversion___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fpme_clock___05Fout_t__struct__0 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fpme_clock___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fpme_clock___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fpme_clock___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fpme_clock___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fdev_spec_init___05Fout_t__struct__0 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fdev_spec_init___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fdev_spec_init___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fdev_spec_init___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fdev_spec_init___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Faux_current___05Fout_t__struct__0 {
    CData/*2:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Faux_current___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Faux_current___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Faux_current___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Faux_current___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fd1_support___05Fout_t__struct__0 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fd1_support___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fd1_support___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fd1_support___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fd1_support___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fd2_support___05Fout_t__struct__0 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fd2_support___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fd2_support___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fd2_support___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fd2_support___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fpme_support___05Fout_t__struct__0 {
    CData/*4:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fpme_support___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fpme_support___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fpme_support___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fpme_support___05Fout_t__struct__0> : public std::true_type {};









struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fout_t__struct__0 {
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fcapabilities_id___05Fout_t__struct__0 __PVT__capabilities_id;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fnext_cap_ptr___05Fout_t__struct__0 __PVT__next_cap_ptr;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fversion___05Fout_t__struct__0 __PVT__version;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fpme_clock___05Fout_t__struct__0 __PVT__pme_clock;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fdev_spec_init___05Fout_t__struct__0 __PVT__dev_spec_init;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Faux_current___05Fout_t__struct__0 __PVT__aux_current;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fd1_support___05Fout_t__struct__0 __PVT__d1_support;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fd2_support___05Fout_t__struct__0 __PVT__d2_support;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fpme_support___05Fout_t__struct__0 __PVT__pme_support;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fout_t__struct__0& rhs) const {
        return __PVT__capabilities_id == rhs.__PVT__capabilities_id
            && __PVT__next_cap_ptr == rhs.__PVT__next_cap_ptr
            && __PVT__version == rhs.__PVT__version
            && __PVT__pme_clock == rhs.__PVT__pme_clock
            && __PVT__dev_spec_init == rhs.__PVT__dev_spec_init
            && __PVT__aux_current == rhs.__PVT__aux_current
            && __PVT__d1_support == rhs.__PVT__d1_support
            && __PVT__d2_support == rhs.__PVT__d2_support
            && __PVT__pme_support == rhs.__PVT__pme_support;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fout_t__struct__0& rhs) const {
        if (__PVT__capabilities_id < rhs.__PVT__capabilities_id) return true;
        if (rhs.__PVT__capabilities_id < __PVT__capabilities_id) return false;
        if (__PVT__next_cap_ptr < rhs.__PVT__next_cap_ptr) return true;
        if (rhs.__PVT__next_cap_ptr < __PVT__next_cap_ptr) return false;
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
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fpower_state___05Fout_t__struct__0 {
    CData/*1:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fpower_state___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fpower_state___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fpower_state___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fpower_state___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fpme_enable___05Fout_t__struct__0 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fpme_enable___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fpme_enable___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fpme_enable___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fpme_enable___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fdata_select___05Fout_t__struct__0 {
    CData/*3:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fdata_select___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fdata_select___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fdata_select___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fdata_select___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fdata_scale___05Fout_t__struct__0 {
    CData/*1:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fdata_scale___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fdata_scale___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fdata_scale___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fdata_scale___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fpme_status___05Fout_t__struct__0 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fpme_status___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fpme_status___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fpme_status___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fpme_status___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fb2_b3_support___05Fout_t__struct__0 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fb2_b3_support___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fb2_b3_support___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fb2_b3_support___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fb2_b3_support___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fbus_pwr_clk_ctrl_en___05Fout_t__struct__0 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fbus_pwr_clk_ctrl_en___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fbus_pwr_clk_ctrl_en___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fbus_pwr_clk_ctrl_en___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fbus_pwr_clk_ctrl_en___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fdata___05Fout_t__struct__0 {
    CData/*7:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fdata___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fdata___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fdata___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fdata___05Fout_t__struct__0> : public std::true_type {};








struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fout_t__struct__0 {
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fpower_state___05Fout_t__struct__0 __PVT__power_state;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fpme_enable___05Fout_t__struct__0 __PVT__pme_enable;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fdata_select___05Fout_t__struct__0 __PVT__data_select;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fdata_scale___05Fout_t__struct__0 __PVT__data_scale;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fpme_status___05Fout_t__struct__0 __PVT__pme_status;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fb2_b3_support___05Fout_t__struct__0 __PVT__b2_b3_support;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fbus_pwr_clk_ctrl_en___05Fout_t__struct__0 __PVT__bus_pwr_clk_ctrl_en;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fdata___05Fout_t__struct__0 __PVT__data;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fout_t__struct__0& rhs) const {
        return __PVT__power_state == rhs.__PVT__power_state
            && __PVT__pme_enable == rhs.__PVT__pme_enable
            && __PVT__data_select == rhs.__PVT__data_select
            && __PVT__data_scale == rhs.__PVT__data_scale
            && __PVT__pme_status == rhs.__PVT__pme_status
            && __PVT__b2_b3_support == rhs.__PVT__b2_b3_support
            && __PVT__bus_pwr_clk_ctrl_en == rhs.__PVT__bus_pwr_clk_ctrl_en
            && __PVT__data == rhs.__PVT__data;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fout_t__struct__0& rhs) const {
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
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05Fcapabilities_id___05Fout_t__struct__0 {
    CData/*7:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05Fcapabilities_id___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05Fcapabilities_id___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05Fcapabilities_id___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05Fcapabilities_id___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05Fnext_cap_ptr___05Fout_t__struct__0 {
    CData/*7:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05Fnext_cap_ptr___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05Fnext_cap_ptr___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05Fnext_cap_ptr___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05Fnext_cap_ptr___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05Fcapability_version___05Fout_t__struct__0 {
    CData/*3:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05Fcapability_version___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05Fcapability_version___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05Fcapability_version___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05Fcapability_version___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05Fdevice_port_type___05Fout_t__struct__0 {
    CData/*3:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05Fdevice_port_type___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05Fdevice_port_type___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05Fdevice_port_type___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05Fdevice_port_type___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05Fslot_implemented___05Fout_t__struct__0 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05Fslot_implemented___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05Fslot_implemented___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05Fslot_implemented___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05Fslot_implemented___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05Finterrupt_msg_number___05Fout_t__struct__0 {
    CData/*4:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05Finterrupt_msg_number___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05Finterrupt_msg_number___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05Finterrupt_msg_number___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05Finterrupt_msg_number___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05FUndefined___05Fout_t__struct__0 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05FUndefined___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05FUndefined___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05FUndefined___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05FUndefined___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05FRsvdP___05Fout_t__struct__0 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05FRsvdP___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05FRsvdP___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05FRsvdP___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05FRsvdP___05Fout_t__struct__0> : public std::true_type {};








struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05Fout_t__struct__0 {
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05Fcapabilities_id___05Fout_t__struct__0 __PVT__capabilities_id;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05Fnext_cap_ptr___05Fout_t__struct__0 __PVT__next_cap_ptr;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05Fcapability_version___05Fout_t__struct__0 __PVT__capability_version;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05Fdevice_port_type___05Fout_t__struct__0 __PVT__device_port_type;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05Fslot_implemented___05Fout_t__struct__0 __PVT__slot_implemented;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05Finterrupt_msg_number___05Fout_t__struct__0 __PVT__interrupt_msg_number;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05FUndefined___05Fout_t__struct__0 __PVT__Undefined;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05FRsvdP___05Fout_t__struct__0 __PVT__RsvdP;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05Fout_t__struct__0& rhs) const {
        return __PVT__capabilities_id == rhs.__PVT__capabilities_id
            && __PVT__next_cap_ptr == rhs.__PVT__next_cap_ptr
            && __PVT__capability_version == rhs.__PVT__capability_version
            && __PVT__device_port_type == rhs.__PVT__device_port_type
            && __PVT__slot_implemented == rhs.__PVT__slot_implemented
            && __PVT__interrupt_msg_number == rhs.__PVT__interrupt_msg_number
            && __PVT__Undefined == rhs.__PVT__Undefined
            && __PVT__RsvdP == rhs.__PVT__RsvdP;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05Fout_t__struct__0& rhs) const {
        if (__PVT__capabilities_id < rhs.__PVT__capabilities_id) return true;
        if (rhs.__PVT__capabilities_id < __PVT__capabilities_id) return false;
        if (__PVT__next_cap_ptr < rhs.__PVT__next_cap_ptr) return true;
        if (rhs.__PVT__next_cap_ptr < __PVT__next_cap_ptr) return false;
        if (__PVT__capability_version < rhs.__PVT__capability_version) return true;
        if (rhs.__PVT__capability_version < __PVT__capability_version) return false;
        if (__PVT__device_port_type < rhs.__PVT__device_port_type) return true;
        if (rhs.__PVT__device_port_type < __PVT__device_port_type) return false;
        if (__PVT__slot_implemented < rhs.__PVT__slot_implemented) return true;
        if (rhs.__PVT__slot_implemented < __PVT__slot_implemented) return false;
        if (__PVT__interrupt_msg_number < rhs.__PVT__interrupt_msg_number) return true;
        if (rhs.__PVT__interrupt_msg_number < __PVT__interrupt_msg_number) return false;
        if (__PVT__Undefined < rhs.__PVT__Undefined) return true;
        if (rhs.__PVT__Undefined < __PVT__Undefined) return false;
        if (__PVT__RsvdP < rhs.__PVT__RsvdP) return true;
        if (rhs.__PVT__RsvdP < __PVT__RsvdP) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Flink_control_3_register___05Fperform_equalization___05Fout_t__struct__0 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flink_control_3_register___05Fperform_equalization___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flink_control_3_register___05Fperform_equalization___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flink_control_3_register___05Fperform_equalization___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Flink_control_3_register___05Fperform_equalization___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Flink_control_3_register___05Flink_eq_req_intr_en___05Fout_t__struct__0 {
    CData/*0:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flink_control_3_register___05Flink_eq_req_intr_en___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flink_control_3_register___05Flink_eq_req_intr_en___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flink_control_3_register___05Flink_eq_req_intr_en___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Flink_control_3_register___05Flink_eq_req_intr_en___05Fout_t__struct__0> : public std::true_type {};


struct Vtb_pcie_datalink_layer_pcie_config_reg___05Flink_control_3_register___05Fout_t__struct__0 {
    Vtb_pcie_datalink_layer_pcie_config_reg___05Flink_control_3_register___05Fperform_equalization___05Fout_t__struct__0 __PVT__perform_equalization;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Flink_control_3_register___05Flink_eq_req_intr_en___05Fout_t__struct__0 __PVT__link_eq_req_intr_en;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flink_control_3_register___05Fout_t__struct__0& rhs) const {
        return __PVT__perform_equalization == rhs.__PVT__perform_equalization
            && __PVT__link_eq_req_intr_en == rhs.__PVT__link_eq_req_intr_en;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flink_control_3_register___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flink_control_3_register___05Fout_t__struct__0& rhs) const {
        if (__PVT__perform_equalization < rhs.__PVT__perform_equalization) return true;
        if (rhs.__PVT__perform_equalization < __PVT__perform_equalization) return false;
        if (__PVT__link_eq_req_intr_en < rhs.__PVT__link_eq_req_intr_en) return true;
        if (rhs.__PVT__link_eq_req_intr_en < __PVT__link_eq_req_intr_en) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Flink_control_3_register___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_error_status_register___05Flane_error___05Fout_t__struct__0 {
    CData/*4:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_error_status_register___05Flane_error___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_error_status_register___05Flane_error___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_error_status_register___05Flane_error___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_error_status_register___05Flane_error___05Fout_t__struct__0> : public std::true_type {};

struct Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_error_status_register___05Fout_t__struct__0 {
    Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_error_status_register___05Flane_error___05Fout_t__struct__0 __PVT__lane_error;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_error_status_register___05Fout_t__struct__0& rhs) const {
        return __PVT__lane_error == rhs.__PVT__lane_error;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_error_status_register___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_error_status_register___05Fout_t__struct__0& rhs) const {
        if (__PVT__lane_error < rhs.__PVT__lane_error) return true;
        if (rhs.__PVT__lane_error < __PVT__lane_error) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_error_status_register___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fdownstream_tx_preset___05Fout_t__struct__0 {
    CData/*3:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fdownstream_tx_preset___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fdownstream_tx_preset___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fdownstream_tx_preset___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fdownstream_tx_preset___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fdownstream_rx_preset_hint___05Fout_t__struct__0 {
    CData/*2:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fdownstream_rx_preset_hint___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fdownstream_rx_preset_hint___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fdownstream_rx_preset_hint___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fdownstream_rx_preset_hint___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fupstream_tx_preset___05Fout_t__struct__0 {
    CData/*3:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fupstream_tx_preset___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fupstream_tx_preset___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fupstream_tx_preset___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fupstream_tx_preset___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fupstream_rx_preset_hint___05Fout_t__struct__0 {
    CData/*2:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fupstream_rx_preset_hint___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fupstream_rx_preset_hint___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fupstream_rx_preset_hint___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fupstream_rx_preset_hint___05Fout_t__struct__0> : public std::true_type {};




struct Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fout_t__struct__0 {
    Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fdownstream_tx_preset___05Fout_t__struct__0 __PVT__downstream_tx_preset;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fdownstream_rx_preset_hint___05Fout_t__struct__0 __PVT__downstream_rx_preset_hint;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fupstream_tx_preset___05Fout_t__struct__0 __PVT__upstream_tx_preset;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fupstream_rx_preset_hint___05Fout_t__struct__0 __PVT__upstream_rx_preset_hint;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fout_t__struct__0& rhs) const {
        return __PVT__downstream_tx_preset == rhs.__PVT__downstream_tx_preset
            && __PVT__downstream_rx_preset_hint == rhs.__PVT__downstream_rx_preset_hint
            && __PVT__upstream_tx_preset == rhs.__PVT__upstream_tx_preset
            && __PVT__upstream_rx_preset_hint == rhs.__PVT__upstream_rx_preset_hint;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fout_t__struct__0& rhs) const {
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
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fout_t__struct__0> : public std::true_type {};
struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fextended_capabilities___05Fext_cap___05Fout_t__struct__0 {
    IData/*31:0*/ __PVT__value;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fextended_capabilities___05Fext_cap___05Fout_t__struct__0& rhs) const {
        return __PVT__value == rhs.__PVT__value;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fextended_capabilities___05Fext_cap___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fextended_capabilities___05Fext_cap___05Fout_t__struct__0& rhs) const {
        if (__PVT__value < rhs.__PVT__value) return true;
        if (rhs.__PVT__value < __PVT__value) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fextended_capabilities___05Fext_cap___05Fout_t__struct__0> : public std::true_type {};

struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fextended_capabilities___05Fout_t__struct__0 {
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fextended_capabilities___05Fext_cap___05Fout_t__struct__0 __PVT__ext_cap;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fextended_capabilities___05Fout_t__struct__0& rhs) const {
        return __PVT__ext_cap == rhs.__PVT__ext_cap;
    }
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fextended_capabilities___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fextended_capabilities___05Fout_t__struct__0& rhs) const {
        if (__PVT__ext_cap < rhs.__PVT__ext_cap) return true;
        if (rhs.__PVT__ext_cap < __PVT__ext_cap) return false;
        return false;
    }
};
template <>
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fextended_capabilities___05Fout_t__struct__0> : public std::true_type {};





















struct Vtb_pcie_datalink_layer_pcie_config_reg___05Fout_t__struct__0 {
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_00___05Fout_t__struct__0 __PVT__byte_offset_00;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_04___05Fout_t__struct__0 __PVT__byte_offset_04;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_08___05Fout_t__struct__0 __PVT__byte_offset_08;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_0C___05Fout_t__struct__0 __PVT__byte_offset_0C;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_address_register_0___05Fout_t__struct__0 __PVT__base_address_register_0;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_1___05Fout_t__struct__0 __PVT__base_ddress_register_1;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_2___05Fout_t__struct__0 __PVT__base_ddress_register_2;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_3___05Fout_t__struct__0 __PVT__base_ddress_register_3;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_4___05Fout_t__struct__0 __PVT__base_ddress_register_4;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbase_ddress_register_5___05Fout_t__struct__0 __PVT__base_ddress_register_5;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fcardbus_cis_pointer___05Fout_t__struct__0 __PVT__cardbus_cis_pointer;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_2C___05Fout_t__struct__0 __PVT__byte_offset_2C;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_pointer___05Fout_t__struct__0 __PVT__capabilities_pointer;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fbyte_offset_3C___05Fout_t__struct__0 __PVT__byte_offset_3C;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_mngt_pointer___05Fout_t__struct__0 __PVT__capabilities_power_mngt_pointer;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fpower_management_pointer___05Fout_t__struct__0 __PVT__power_management_pointer;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fcapabilities_power_na_pointer___05Fout_t__struct__0 __PVT__capabilities_power_na_pointer;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Flink_control_3_register___05Fout_t__struct__0 __PVT__link_control_3_register;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_error_status_register___05Fout_t__struct__0 __PVT__lane_error_status_register;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Flane_eq_ctrl_register___05Fout_t__struct__0 __PVT__lane_eq_ctrl_register;
    Vtb_pcie_datalink_layer_pcie_config_reg___05Fextended_capabilities___05Fout_t__struct__0 __PVT__extended_capabilities;

    bool operator==(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fout_t__struct__0& rhs) const {
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
    bool operator!=(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fout_t__struct__0& rhs) const {
        return !(*this == rhs);
    }

    bool operator<(const Vtb_pcie_datalink_layer_pcie_config_reg___05Fout_t__struct__0& rhs) const {
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
struct VlIsCustomStruct<Vtb_pcie_datalink_layer_pcie_config_reg___05Fout_t__struct__0> : public std::true_type {};

class alignas(VL_CACHE_LINE_BYTES) Vtb_pcie_datalink_layer_pcie_config_reg_pkg final {
  public:

    // INTERNAL VARIABLES
    Vtb_pcie_datalink_layer__Syms* vlSymsp;
    const char* vlNamep;

    // CONSTRUCTORS
    Vtb_pcie_datalink_layer_pcie_config_reg_pkg();
    ~Vtb_pcie_datalink_layer_pcie_config_reg_pkg();
    void ctor(Vtb_pcie_datalink_layer__Syms* symsp, const char* namep);
    void dtor();
    VL_UNCOPYABLE(Vtb_pcie_datalink_layer_pcie_config_reg_pkg);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
