"""
peakrdl-python is a tool to generate Python Register Access Layer (RAL) from SystemRDL
Copyright (C) 2021 - 2023

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.

Defined the compiler classes that are used
"""
from typing import Any
from systemrdl import RDLCompiler
from systemrdl.udp import UDPDefinition
from systemrdl.component import Field, Reg, Regfile, Mem, Addrmap
from systemrdl.node import FieldNode, RegNode, RegfileNode, MemNode, AddrmapNode
from systemrdl.node import Node

from .safe_name_utility import is_safe_field_name, is_safe_memory_name, is_safe_addrmap_name, \
    is_safe_regfile_name, is_safe_register_name


def compiler_with_udp_registers(**kwargs: Any) -> RDLCompiler:
    """
    Factory function to create an instance of the systemRDL compiler with the UDP registrations
    """
    rdlc = RDLCompiler(**kwargs)
    rdlc.register_udp(PythonHideUDP)
    rdlc.register_udp(PythonInstNameUDP)

    return rdlc


class PythonInstNameUDP(UDPDefinition):
    """
    Definition of the class for the ``python_inst_name`` systemRDL property used by peakrdl-python
    """
    name = "python_inst_name"
    valid_components = {Field, Reg, Regfile, Mem, Addrmap}
    valid_type = str

    def validate(self, node: Node, value: str) -> None:
        if isinstance(node, FieldNode):
            if not is_safe_field_name(node, value):
                self.msg.error(
                    f"{value} is not a safe node name for a field as it clashes with a python "
                    f"keyword or attribute of a peakrdl-python field",
                    self.get_src_ref(node)
                )
        elif isinstance(node, RegNode):
            if not is_safe_register_name(node, value):
                self.msg.error(
                    f"{value} is not a safe node name for a register as it clashes with a python "
                    f"keyword or attribute of a peakrdl-python register",
                    self.get_src_ref(node)
                )
        elif isinstance(node, RegfileNode):
            if not is_safe_regfile_name(node, value):
                self.msg.error(
                    f"{value} is not a safe node name for a regfile as it clashes with a python "
                    f"keyword or attribute of a peakrdl-python regfile",
                    self.get_src_ref(node)
                )
        elif isinstance(node, AddrmapNode):
            if not is_safe_addrmap_name(node, value):
                self.msg.error(
                    f"{value} is not a safe node name for a addrmap as it clashes with a python "
                    f"keyword or attribute of a peakrdl-python addrmap",
                    self.get_src_ref(node)
                )
        elif isinstance(node, MemNode):
            if not is_safe_memory_name(node, value):
                self.msg.error(
                    f"{value} is not a safe node name for a Memory as it clashes with a python "
                    f"keyword or attribute of a peakrdl-python memory",
                    self.get_src_ref(node)
                )
        else:
            self.msg.error(
                f"unhandled type for property {type(node)}",
                self.get_src_ref(node)
            )


class PythonHideUDP(UDPDefinition):
    """
    Definition of the class for the ``python_hide`` systemRDL property used by peakrdl-python
    """
    name = "python_hide"
    valid_components = {Field, Reg, Regfile, Mem, Addrmap}
    valid_type = bool
