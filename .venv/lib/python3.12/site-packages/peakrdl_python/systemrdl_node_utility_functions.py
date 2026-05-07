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

A set of utility functions that perform supplementary processing on a node in a compiled
system RDL dataset.
"""
from typing import Optional, Protocol, Union
from collections.abc import Iterable
from itertools import filterfalse

import textwrap

from systemrdl.node import Node
from systemrdl.node import RegNode
from systemrdl.node import RootNode
from systemrdl.node import AddressableNode
from systemrdl.node import FieldNode
from systemrdl.node import MemNode
from systemrdl.node import SignalNode
from systemrdl.node import AddrmapNode
from systemrdl.node import RegfileNode
from systemrdl.component import Component
from systemrdl.rdltypes.user_enum import UserEnumMeta
from systemrdl import RDLListener, WalkerAction, RDLWalker


class HideNodeCallback(Protocol):
    """
    Callback function that determines whether a node should be hidden or not, this is intended
    to be used with the RegEX check on the node name
    """
    # pylint: disable=too-few-public-methods
    def __call__(self, node: Node) -> bool:
        pass


def get_fully_qualified_type_name(node: Node) -> str:
    """
    Returns the fully qualified class type name, i.e. with scope prefix
    """
    scope_path = node.inst.get_scope_path(scope_separator='_')

    inst_type_name = node.inst.type_name
    if inst_type_name is None:
        inst_type_name = node.inst_name

    if (scope_path == '') or (scope_path is None):
        return inst_type_name

    return scope_path + '_' + inst_type_name


def hide_based_on_property(node: Node, show_hidden: bool) -> bool:
    """
    Used to determine if a node should be hidden based on the ''python_hide'' User Defined Property

    Args:
        node: a system RDL node
        show_hidden: a boolean to indicate that the property should be ingored

    Returns:
        True if the node should be hidden
    """
    return node.get_property('python_hide', default=False) and not show_hidden


def get_dependent_component(node: Union[AddressableNode, RootNode],
                            hide_node_callback: HideNodeCallback) -> Iterable[Node]:
    """
    iterable of nodes that have a component which is used by a
    descendant, this list is de-duplicated and reversed to components
    are declared before their parents who use them

    Args:
        node: node to be analysed
        hide_node_callback: callback to determine if the node should be hidden


    """
    class UniqueComponents(RDLListener):
        """
        class intended to be used as part of the walker/listener protocol to find all the items
        non-hidden nodes
        """

        def __init__(self, hide_node_callback: HideNodeCallback) -> None:
            super().__init__()

            self.__hide_node_callback = hide_node_callback
            self.__components_needed: list[Component] = []
            self.nodes: list[Node] = []


        def enter_Reg(self, node: RegNode) -> Optional[WalkerAction]:
            if self.__hide_node_callback(node):
                return WalkerAction.SkipDescendants

            if node.inst in self.__components_needed:
                return WalkerAction.SkipDescendants

            self.__components_needed.append(node.inst)
            self.nodes.append(node)
            return WalkerAction.Continue

        def enter_Mem(self, node: MemNode) -> Optional[WalkerAction]:
            if self.__hide_node_callback(node):
                return WalkerAction.SkipDescendants

            if node.inst in self.__components_needed:
                return WalkerAction.SkipDescendants

            self.__components_needed.append(node.inst)
            self.nodes.append(node)
            return WalkerAction.Continue

        def enter_Field(self, node: FieldNode) -> Optional[WalkerAction]:
            if self.__hide_node_callback(node):
                return WalkerAction.SkipDescendants

            if node.inst in self.__components_needed:
                return WalkerAction.SkipDescendants

            self.__components_needed.append(node.inst)
            self.nodes.append(node)
            return WalkerAction.Continue

        def enter_Addrmap(self, node: AddrmapNode) -> Optional[WalkerAction]:
            if self.__hide_node_callback(node):
                return WalkerAction.SkipDescendants

            if node.inst in self.__components_needed:
                return WalkerAction.SkipDescendants

            self.__components_needed.append(node.inst)
            self.nodes.append(node)
            return WalkerAction.Continue

        def enter_Regfile(self, node: RegfileNode) -> Optional[WalkerAction]:
            if self.__hide_node_callback(node):
                return WalkerAction.SkipDescendants

            if node.inst in self.__components_needed:
                return WalkerAction.SkipDescendants

            self.__components_needed.append(node.inst)
            self.nodes.append(node)
            return WalkerAction.Continue

    unique_component_walker = UniqueComponents(hide_node_callback=hide_node_callback)
    # running the walker populated the blocks with all the address maps in within the
    # top block, including the top_block itself
    RDLWalker(unroll=True).walk(node, unique_component_walker, skip_top=False)

    return reversed(unique_component_walker.nodes)


def get_table_block(node: Node) -> str:
    """
    Converts the documentation for a systemRDL node into a nicely formatted table that can be
    inserted into the docstring of the class

    Args:
        node: node to be analysed

    Returns:
        A string that represents a sphinx table
    """
    row_break = '+--------------+' \
                '-------------------------------------------------------------------------+'
    if ('name' in node.list_properties()) or ('desc' in node.list_properties()):
        table_strs = [row_break,
                      '| SystemRDL    |'
                      ' Value                                                                   |',
                      '| Field        |'
                      '                                                                         |',
                      '+==============+'
                      '=========================================================================+']
        if 'name' in node.list_properties():
            table_strs.append("| Name         | .. raw:: html".ljust(88, ' ') + ' |')
            table_strs.append("|              | ".ljust(88, ' ') + ' |')
            html_name = node.get_html_name()
            if html_name is None:
                raise ValueError('html name should not be None')
            name_rows = textwrap.wrap(html_name, width=88,
                                      initial_indent="|              |      ",
                                      subsequent_indent="|              |      ")
            for name_row in name_rows:
                table_strs.append(name_row.ljust(88, ' ') + ' |')
            table_strs.append(row_break)

        if 'desc' in node.list_properties():
            table_strs.append("| Description  | .. raw:: html".ljust(88, ' ') + ' |')
            table_strs.append("|              | ".ljust(88, ' ') + ' |')
            html_desc = node.get_html_desc()
            if html_desc is None:
                raise ValueError('html name should not be None')
            desc_rows = textwrap.wrap(html_desc, width=88,
                                      initial_indent="|              |      ",
                                      subsequent_indent="|              |      ")
            for desc_row in desc_rows:
                table_strs.append(desc_row.ljust(88, ' ') + ' |')
            table_strs.append(row_break)

        return_string = '\n'.join(table_strs)
    else:
        return_string = ''

    return return_string


def get_field_bitmask_int(node: FieldNode) -> int:
    """
    Integer bitmask for a field

    Args:
        node: node to be analysed

    Returns:
        bitmask as a string prefixed by 0x

    """

    if not isinstance(node, FieldNode):
        raise TypeError(f'node is not a {type(FieldNode)} got {type(node)}')

    return sum(2 ** x for x in range(node.low, node.high + 1))


def get_field_bitmask_hex_string(node: FieldNode) -> str:
    """
    Hexadecimal bitmask for a field

    Args:
        node: node to be analysed

    Returns:
        bitmask as a string prefixed by 0x

    """
    if not isinstance(node, FieldNode):
        raise TypeError(f'node is not a {type(FieldNode)} got {type(node)}')
    bitmask = get_field_bitmask_int(node)
    return f'0x{bitmask:X}'


def get_field_inv_bitmask_hex_string(node: FieldNode) -> str:
    """
    Hexadecimal for the inverse bitmask for a field

    Args:
        node: node to be analysed

    Returns:
        inverse bitmask as a string prefixed by 0x

    """
    if not isinstance(node, FieldNode):
        raise TypeError(f'node is not a {type(FieldNode)} got {type(node)}')
    if not isinstance(node.parent, RegNode):
        raise TypeError(f'node.parent is not a {type(RegNode)} got {type(node)}')
    reg_bitmask = (2 ** (node.parent.size * 8)) - 1
    inv_bitmask = reg_bitmask ^ get_field_bitmask_int(node)
    return f'0x{inv_bitmask:X}'


def get_field_max_value_hex_string(node: FieldNode) -> str:
    """
    Hexadecimal for the maximum value that can be represented in a field

    Args:
        node: node to be analysed

    Returns:
        bitmask as a string prefixed by 0x

    """
    if not isinstance(node, FieldNode):
        raise TypeError(f'node is not a {type(FieldNode)} got {type(node)}')
    max_value = ((2 ** (node.high - node.low + 1)) - 1)
    return f'0x{max_value:X}'


def uses_enum(node: AddressableNode) -> bool:
    """
    analyses a node to determine if there are any enumerations used by descendant fields

    Args:
        node: node to analysed

    Returns: True if there are enumeration used, otherwise False
    """
    for child_node in node.descendants():
        if isinstance(child_node, FieldNode):
            if 'encode' in child_node.list_properties():
                return_value = True
                break
    else:
        return_value = False

    return return_value


def get_reg_max_value_hex_string(node: RegNode) -> str:
    """
    Hexadecimal for the maximum value that can be represented in a register

    Args:
        node: node to be analysed

    Returns:
        bitmask as a string prefixed by 0x

    """
    if not isinstance(node, RegNode):
        raise TypeError(f'node is not a {type(RegNode)} got {type(node)}')

    max_value = ((2 ** (node.size * 8)) - 1)
    return f'0x{max_value:X}'

def get_reg_fields(node: RegNode, hide_node_callback: HideNodeCallback) -> Iterable[FieldNode]:
    """
    Iterable that yields all the fields from the reg node

    Args:
        node: node to be analysed
        hide_node_callback: callback to determine if the node should be hidden

    Yields:
        fields

    """
    if not isinstance(node, RegNode):
        raise TypeError(f'node is not a {type(RegNode)} got {type(node)}')

    return filterfalse(hide_node_callback, node.fields())


def get_reg_writable_fields(node: RegNode,
                            hide_node_callback: HideNodeCallback) -> Iterable[FieldNode]:
    """
    Iterable that yields all the writable fields from the reg node

    Args:
        node: node to be analysed
        hide_node_callback: callback to determine if the node should be hidden

    Yields:
        writeable fields

    """
    if not isinstance(node, RegNode):
        raise TypeError(f'node is not a {type(RegNode)} got {type(node)}')

    return filter(lambda x: x.is_sw_writable,
                  get_reg_fields(node=node, hide_node_callback=hide_node_callback))


def get_reg_readable_fields(node: RegNode,
                            hide_node_callback: HideNodeCallback) -> Iterable[FieldNode]:
    """
    Iterable that yields all the readable fields from the reg node

    Args:
        node: node to be analysed
        hide_node_callback: callback to determine if the node should be hidden

    Yields:
        readable fields

    """
    if not isinstance(node, RegNode):
        raise TypeError(f'node is not a {type(RegNode)} got {type(node)}')

    return filter(lambda x: x.is_sw_readable,
                  get_reg_fields(node=node, hide_node_callback=hide_node_callback))


def uses_memory(node: AddressableNode) -> bool:
    """
    analyses a node to determine if there are any memories used by descendants

    Args:
        node: node to analysed

    Returns: True if there are memories used
    """
    for child_node in node.descendants():
        if isinstance(child_node, MemNode):
            return_value = True
            break
    else:
        return_value = False

    return return_value


def get_memory_max_entry_value_hex_string(node: MemNode) -> str:
    """
    Hexadecimal for the maximum value that can be represented in a register

    Args:
        node: node to be analysed

    Returns:
        bitmask as a string prefixed by 0x

    """
    if not isinstance(node, MemNode):
        raise TypeError(f'node is not a {type(MemNode)} got {type(node)}')

    max_value = ((2 ** (node.get_property('memwidth'))) - 1)
    return f'0x{max_value:X}'


def get_memory_width_bytes(node: MemNode) -> int:
    """
    width of the memory in bytes

    Args:
        node: node to be analysed

    Returns:
        width in bytes

    """
    if not isinstance(node, MemNode):
        raise TypeError(f'node is not a {type(MemNode)} got {type(node)}')

    return node.size // node.get_property('mementries')


def get_field_default_value(node: FieldNode) -> Optional[int]:
    """
    Default (reset) value of the field.
    None if the field is not reset or if the reset value is a signal that can be in an unknown
    state
    """
    if not isinstance(node, FieldNode):
        raise TypeError(f'node is not a {type(FieldNode)} got {type(node)}')

    value = node.get_property('reset')

    if value is None:
        return None

    if isinstance(value, int):

        return value

    if isinstance(value, (FieldNode, SignalNode)):
        # if the node resets to an external external signal or value of another field, there is no
        # knowledge the code can have of this state and it gets treated as None
        return None

    raise TypeError(f'unhandled type for field default type={type(value)}')


def get_enum_values(enum: UserEnumMeta) -> list[int]:
    """

    Args:
        enum: a field enum

    Returns: A list of all the values for an enum

    """
    if not isinstance(enum, UserEnumMeta):
        raise TypeError(f'node is not a {type(UserEnumMeta)} got {type(enum)}')

    return [e.value for e in enum]


def get_properties_to_include(node: Node, udp_to_include: Optional[list[str]]) -> list[str]:
    """


    Args:
        node: the system rdl node to examine the properties of
        udp_to_include: list of property names to include in the system rdl

    Returns:
        list of properties
    """
    if udp_to_include is None:
        return []
    nodal_properties = node.list_properties(include_udp=True, include_native=False)
    return list(filter(lambda x: x in udp_to_include, nodal_properties))
