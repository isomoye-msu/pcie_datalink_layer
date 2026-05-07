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

utility functions for turning potentially unsafe names from the system RDL and making them safe
"""
import keyword
from typing import Union, Optional
from collections.abc import Callable
from dataclasses import dataclass

from systemrdl.node import RegNode
from systemrdl.node import FieldNode
from systemrdl.node import AddrmapNode
from systemrdl.node import RegfileNode
from systemrdl.node import MemNode
from systemrdl.node import RootNode
from systemrdl.node import Node

from .lib import RegReadOnly
from .lib import RegWriteOnly
from .lib import RegReadWrite

from .lib.memory import MemoryReadOnly
from .lib.memory import MemoryWriteOnly
from .lib.memory import MemoryReadWrite

from .lib import RegFile
from .lib import AddressMap
from .lib.base import Base


def _build_class_method_list(peakrld_python_class: type[Base]) -> list[str]:
    return list(filter(lambda x: not x[0] == '_', dir(peakrld_python_class)))


# the lists of methods to avoid for all the classes are pre-built to optimise the time taken
# in the tests
addr_map_method_list = _build_class_method_list(AddressMap)
reg_file_method_list = _build_class_method_list(RegFile)
mem_read_write_method_list = _build_class_method_list(MemoryReadWrite)
mem_write_only_method_list = _build_class_method_list(MemoryWriteOnly)
mem_read_only_method_list = _build_class_method_list(MemoryReadOnly)
reg_read_only_method_list = _build_class_method_list(RegReadOnly)
reg_write_only_method_list = _build_class_method_list(RegWriteOnly)
reg_read_write_method_list = _build_class_method_list(RegReadWrite)


def _python_name_checks(instance_name: str) -> bool:
    """

    Args:
        instance_name:

    Returns:

    """
    if not isinstance(instance_name, str):
        raise TypeError(f'instance name is not a string got {type(instance_name)}')

    if instance_name in keyword.kwlist:
        return False

    if instance_name[0] == '_':
        return False

    return True


def is_safe_field_name(node: FieldNode, proposed_name: Optional[str] = None) -> bool:
    """
    takes in instance name for a systemRDL node and determines if it safe for use in PeakRDL-Python
    there are three for an unsafe name:
    1) it must not be a python keyword
    2) it must not start `_`
    3) it must not clash with the attributes of the PeakRDL-Python auto generated class

    Args:
        node: A System RDL Field Node
        proposed_name (str): proposed node name to check, leave as None to use the name from the
                             systemRDL code

    Returns: True if safe to use

    """
    if not isinstance(node, FieldNode):
        raise TypeError(f'node should be a FieldNode but got {type(node)}')

    if proposed_name is not None:
        if not isinstance(proposed_name, str):
            raise TypeError(f'proposed_name should be a str but got {type(proposed_name)}')
    else:
        proposed_name = node.inst_name

    if _python_name_checks(proposed_name) is False:
        return False

    parent_node = node.parent

    if not isinstance(parent_node, RegNode):
        raise TypeError(f'parent node should be a RegNode but got {type(parent_node)}')

    # next determine the base class that will get used, the criteria:
    # 1) is ReadOnly, WriteOnly, ReadWrite
    if parent_node.has_sw_readable and parent_node.has_sw_writable:
        method_list = reg_read_write_method_list
    elif not parent_node.has_sw_readable and parent_node.has_sw_writable:
        method_list = reg_write_only_method_list
    elif parent_node.has_sw_readable and not parent_node.has_sw_writable:
        method_list = reg_read_only_method_list
    else:
        raise RuntimeError

    if proposed_name in method_list:
        return False

    return True


def is_safe_register_name(node: RegNode, proposed_name: Optional[str] = None) -> bool:
    """
    takes in instance name for a systemRDL node and determines if it safe for use in PeakRDL-Python
    there are three for an unsafe name:
    1) it must not be a python keyword
    2) it must not start `_`
    3) it must not clash with the attributes of the PeakRDL-Python auto generated class

    Args:
        node: A System RDL Register Node
        proposed_name (str): proposed node name to check, leave as None to use the name from the
                     systemRDL code

    Returns: True if safe to use

    """
    # pylint: disable=too-many-branches
    if not isinstance(node, RegNode):
        raise TypeError(f'node should be a RegNode but got {type(node)}')

    if proposed_name is not None:
        if not isinstance(proposed_name, str):
            raise TypeError(f'proposed_name should be a str but got {type(proposed_name)}')
    else:
        proposed_name = node.inst_name

    if _python_name_checks(proposed_name) is False:
        return False

    parent_node = node.parent

    if isinstance(parent_node, AddrmapNode):
        method_list = addr_map_method_list
    elif isinstance(parent_node, RegfileNode):
        method_list = reg_file_method_list
    elif isinstance(parent_node, MemNode):
        if parent_node.is_sw_readable and parent_node.is_sw_writable:
            method_list = mem_read_write_method_list
        elif not parent_node.is_sw_readable and parent_node.is_sw_writable:
            method_list = mem_write_only_method_list
        elif parent_node.is_sw_readable and not parent_node.is_sw_writable:
            method_list = mem_read_only_method_list
        else:
            raise RuntimeError('Code should never get here')
    else:
        raise TypeError(f'Unhandled type: {type(parent_node)}')

    if proposed_name in method_list:
        return False

    return True


def is_safe_memory_name(node: MemNode, proposed_name: Optional[str] = None) -> bool:
    """
    takes in instance name for a systemRDL node and determines if it safe for use in PeakRDL-Python
    there are three for an unsafe name:
    1) it must not be a python keyword
    2) it must not start `_`
    3) it must not clash with the attributes of the PeakRDL-Python auto generated class

    Args:
        node: A System RDL Memory Node
        proposed_name (str): proposed node name to check, leave as None to use the name from the
                     systemRDL code

    Returns: True if safe to use

    """
    if not isinstance(node, MemNode):
        raise TypeError(f'node should be a MemNode but got {type(node)}')

    if proposed_name is not None:
        if not isinstance(proposed_name, str):
            raise TypeError(f'proposed_name should be a str but got {type(proposed_name)}')
    else:
        proposed_name = node.inst_name

    if _python_name_checks(proposed_name) is False:
        return False

    parent_node = node.parent

    if isinstance(parent_node, AddrmapNode):
        method_list = addr_map_method_list
    elif isinstance(parent_node, RegfileNode):
        method_list = reg_file_method_list
    else:
        raise TypeError(f'Unhandled type: {type(parent_node)}')

    if proposed_name in method_list:
        return False

    return True


def is_safe_regfile_name(node: RegfileNode, proposed_name: Optional[str] = None) -> bool:
    """
    takes in instance name for a systemRDL node and determines if it safe for use in PeakRDL-Python
    there are three for an unsafe name:
    1) it must not be a python keyword
    2) it must not start `_`
    3) it must not clash with the attributes of the PeakRDL-Python auto generated class

    Args:
        node: A System RDL Register File
        proposed_name (str): proposed node name to check, leave as None to use the name from the
                     systemRDL code

    Returns: True if safe to use

    """
    if not isinstance(node, RegfileNode):
        raise TypeError(f'node should be a RegfileNode but got {type(node)}')

    if proposed_name is not None:
        if not isinstance(proposed_name, str):
            raise TypeError(f'proposed_name should be a str but got {type(proposed_name)}')
    else:
        proposed_name = node.inst_name

    if _python_name_checks(proposed_name) is False:
        return False

    parent_node = node.parent

    if isinstance(parent_node, AddrmapNode):
        method_list = addr_map_method_list
    elif isinstance(parent_node, RegfileNode):
        method_list = reg_file_method_list
    else:
        raise TypeError(f'Unhandled type: {type(parent_node)}')

    if proposed_name in method_list:
        return False

    return True


def is_safe_addrmap_name(node: AddrmapNode, proposed_name: Optional[str] = None) -> bool:
    """
    takes in instance name for a systemRDL node and determines if it safe for use in PeakRDL-Python
    there are three for an unsafe name:
    1) it must not be a python keyword
    2) it must not start `_`
    3) it must not clash with the attributes of the PeakRDL-Python auto generated class

    Args:
        node: A System RDL Address Map
        proposed_name (str): proposed node name to check, leave as None to use the name from the
                     systemRDL code

    Returns: True if safe to use

    """
    if not isinstance(node, AddrmapNode):
        raise TypeError(f'node should be a AddrmapNode but got {type(node)}')

    if proposed_name is not None:
        if not isinstance(proposed_name, str):
            raise TypeError(f'proposed_name should be a str but got {type(proposed_name)}')
    else:
        proposed_name = node.inst_name

    if _python_name_checks(proposed_name) is False:
        return False

    if proposed_name in addr_map_method_list:
        return False

    return True


@dataclass()
class _NodeProcessingScheme:
    safe_func: Union[Callable[[RegNode, Optional[str]], bool],
                     Callable[[FieldNode, Optional[str]], bool],
                     Callable[[RegfileNode, Optional[str]], bool],
                     Callable[[AddrmapNode, Optional[str]], bool],
                     Callable[[MemNode, Optional[str]], bool]
    ]
    prefix: str


_node_processing: dict[type[Node], _NodeProcessingScheme] = {
    RegNode: _NodeProcessingScheme(is_safe_register_name, 'register'),
    FieldNode: _NodeProcessingScheme(is_safe_field_name, 'field'),
    RegfileNode: _NodeProcessingScheme(is_safe_regfile_name, 'regfile'),
    AddrmapNode: _NodeProcessingScheme(is_safe_addrmap_name, 'addrmap'),
    MemNode: _NodeProcessingScheme(is_safe_memory_name, 'memory')}


def safe_node_name(node: Union[RegNode,
                               FieldNode,
                               RegfileNode,
                               AddrmapNode,
                               MemNode]) -> str:
    """
    Generate the safe name for a node to avoid name clashes in the generated python

    Args:
        node: as node from the compiled systemRDL


    Returns: python name to use

    """

    # the node has an overridden name
    if 'python_inst_name' in node.list_properties():
        node_name = node.get_property('python_inst_name')
    else:

        node_type = type(node)

        node_name = node.inst_name
        if not _node_processing[node_type].safe_func(node, None):  # type: ignore[arg-type]
            name_pre: str = _node_processing[node_type].prefix
            node_name = name_pre + '_' + node_name

            # check the proposed name will not clash with name already used by the parent
            if node.parent is not None:
                names_to_avoid = [child.inst_name for child in node.parent.children(unroll=False)]
                index = 0
                while node_name in names_to_avoid:
                    node_name = name_pre + '_' + str(index) + '_' + node_name
                    index += 1

    if not isinstance(node, FieldNode):
        if node.is_array:
            if node.current_idx is not None:
                # the format should be node_name[idx0,idx1]
                node_name += '[' + ','.join(str(x) for x in node.current_idx) + ']'

    return node_name


def get_python_path_segments(node: Union[RegNode,
                                         FieldNode,
                                         RegfileNode,
                                         AddrmapNode,
                                         MemNode]) -> list[str]:
    """
    Behaves similarly to the get_path_segments method of a system RDL node but names are converted
    using the following pattern:
    *

    Args:
        node:

    Returns:

    """

    def node_segment(child_node: Union[RegNode,
                                       FieldNode,
                                       RegfileNode,
                                       AddrmapNode,
                                       MemNode],
                     child_list: list[str]) -> list[str]:
        if isinstance(child_node.parent, RootNode):
            return child_list
        child_node_safe_name = safe_node_name(child_node)
        child_list.insert(0, child_node_safe_name)
        if child_node.parent is None:
            raise RuntimeError('parent node is None')
        if not isinstance(child_node.parent, (RegNode,FieldNode,RegfileNode,AddrmapNode,MemNode)):
            raise TypeError(f'child_node.parent not a handled type, got {type(child_node.parent)}')
        return node_segment(child_node.parent, child_list=child_list)

    return node_segment(node, [])
