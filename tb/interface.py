# ==========================================================================
#
#  Morgan State University
#  Open Hardware Acceleration Lab (HAL-O)
#
#!  Project:   Open-Source PCIe Endpoint Controller.
#   File:      interface.py
#   Author:    HAL-O
#   Created:   10/1/25
#
#!  Description:
#!   Module implements a retry management FIFO. Stores TLPs as axis frames.
#!   Module resets read and write pointer after every frame allowing for retransmission
#!   as long as data is not overwritten.
#
#
#   Project:
#     This file is part of the PCIe Gen1/Gen2 Endpoint Controller project.
#     Developed as an open-source, synthesizable Verilog RTL IP core, this
#     project provides FPGA designers and researchers with an educational
#     and extensible platform for high-speed interconnect design.
#
#   Institutional Acknowledgement:
#    - Project oversight and research guidance provided by the CEAMLS
#      (Center for Equitable AI & Machine Learning Systems) Director.
#
#   Notes:
#     - Compliant with PCIe Base Specification (Gen1: 2.5 GT/s,
#       Gen2: 5.0 GT/s).
# 
#   License: MIT License
# 
# ==========================================================================

class interface(Bus):

    def __init__(self, entity, name, signals,
            optional_signals=[], bus_separator="_", array_idx=None):
        Bus.__init__(self, entity, name, signals, optional_signals,
                bus_separator, array_idx)


def sformatf(fmt, *args):
    return fmt % args


def cat(*args):
    ret = ""
    for a in args:
        ret += a

    return ret



async def wait(cond, ev):
    if not callable(cond):
        raise Exception("wait expects the first arguments to be callable")

    while True:
        if cond():
            break
        else:
            await ev.wait()
            ev.clear()

# Each letter matches a pair:
#   1. Regex to parse that value from string
#   2. Lambda function to convert the value
RE_FORMATS = {
    "d": [re.compile(r'^(-?[0-9_]+)$'), lambda s: int(s, 10), '-'],
    "h": [re.compile(r'^(0x[0-9a-fA-F_]+)$'), lambda s: int(s, 16), '0x'],
    "b": [re.compile(r'^([01_]+)$'), lambda s: int(s, 2), ''],
    "o": [re.compile(r'^([0-7_]+)$'), lambda s: int(s, 8), 'o'],
    "f": [re.compile(r'^(-?[0-9]*\.?[0-9]*)$'), float, '-'],
    "s": [re.compile(r'^(\w+)$'), lambda s: s, '']
}


def get_regex_list(formats):
    acc = ""
    re_format = re.compile("^%([dshbfo])$")
    results = []
    for char in formats:
        acc += char
        if len(acc) == 2:
            match = re_format.match(acc)
            if match:
                if match[1] in RE_FORMATS:
                    results.append(RE_FORMATS[match[1]])
                    acc = ""
                else:
                    raise Exception("Format spec {} not supported".format(match))
            else:
                acc = acc[1]  # Discard 1st character out of 2
    return results