"""PeakRDL Markdown exporter."""

__authors__ = [
    "Marek Pikuła <marek at serenitycode.dev>",
    "Maciej Dudek <mdudek at antmicro.com>",
]

from collections import OrderedDict
from dataclasses import dataclass
from functools import reduce
from operator import mul
from pathlib import Path
from typing import List, Optional, Union

from markdownTable import markdownTable  # type:ignore
from systemrdl.messages import MessageHandler  # type: ignore
from systemrdl.node import (  # type: ignore
    AddressableNode,
    AddrmapNode,
    FieldNode,
    MemNode,
    Node,
    RegfileNode,
    RegNode,
    RootNode,
)


class MarkdownExporter:  # pylint: disable=too-few-public-methods
    """PeakRDL Markdown exporter main class."""

    @dataclass
    class GenStageOutput:
        """Generation stage output."""

        node: Node
        """Node on which generation has been performed."""

        table_row: "OrderedDict[str, Union[str, int]]"
        """Row for the parent table."""

        generated: str
        """Markdown generated during this stage."""

    @staticmethod
    def _heading(depth: int, title: str):
        """Generate Markdown heading of a given depth with newline envelope.

        Arguments:
            depth -- heading depth (number of hashes)
            title -- heading title

        Returns:
            Formatted Markdown heading.
        """
        return "\n" + "#" * depth + f" {title}\n\n"

    @staticmethod
    def _addrnode_info(node: AddressableNode):
        """Generate AddressableNode basic information dictionary."""
        ret: "OrderedDict[str, str]" = OrderedDict()

        set_index = False
        if node.is_array and node.current_idx is None:
            node.current_idx = [0]
            set_index = True
        ret["Absolute Address"] = f"0x{node.absolute_address:X}"
        ret["Base Offset"] = f"0x{node.raw_address_offset:X}"
        if node.is_array and node.array_dimensions is not None and set_index:
            ret["Size"] = f"0x{node.size * reduce(mul, node.array_dimensions, 1):X}"
        else:
            ret["Size"] = f"0x{node.size:X}"

        if node.is_array:
            ret["Array Dimensions"] = str(node.array_dimensions)
            ret["Array Stride"] = f"0x{node.array_stride:X}"
            ret["Total Size"] = f"0x{node.total_size:X}"

        return ret

    def _addrnode_info_md(self, node: AddressableNode) -> str:
        """Generate AddressableNode basic information as a Markdown list."""
        return "- " + "\n- ".join(
            f"{key}: {value}" for key, value in self._addrnode_info(node).items()
        )

    @staticmethod
    def _node_name_sanitized(node: Node) -> str:
        """Get the Node name as HTML without newlines.

        Needed for proper inclusion in tables.
        """
        name = node.get_html_name()
        if name is None:
            name = "—"
        else:
            name = name.replace("\n", "")
        return name

    def _addrnode_header(
        self, node: AddressableNode, msg: MessageHandler, heading_level: int
    ) -> str:
        """Get the AddressableNode header.

        Arguments:
            node -- node to generate the header for.
            msg -- message handler from top-level.
            heading_level -- Markdown heading level.
        """
        if isinstance(node, AddrmapNode):
            node_type_name = "address map"
        elif isinstance(node, RegfileNode):
            node_type_name = "register file"
        elif isinstance(node, MemNode):
            node_type_name = "memory"
        elif isinstance(node, RegNode):
            node_type_name = "register"
        else:
            node_type_name = "addressable node"
            msg.warning(f"Unsupported type of node ({node.__class__.__name__}).")

        ret = self._heading(heading_level, f"{node.inst_name} {node_type_name}")
        ret += self._addrnode_info_md(node) + "\n\n"
        desc = node.get_html_desc()
        if desc is not None:
            ret += desc + "\n\n"
        return ret

    def _addrnode_table_row(
        self, node: AddressableNode
    ) -> "OrderedDict[str, Union[str, int]]":
        """Generate AddressableNode table row.

        The "Offset" is an integer so that it can be formatted in the parent
        node.
        """
        offset = node.address_offset
        identifier = node.inst_name
        if node.is_array:
            assert node.current_idx is not None
            identifier += "".join(f"[{idx}]" for idx in node.current_idx)
        name = self._node_name_sanitized(node)

        table_row: "OrderedDict[str, Union[str, int]]" = OrderedDict()
        table_row["Offset"] = offset
        table_row["Identifier"] = identifier
        table_row["Name"] = name

        return table_row

    def export(  # pylint: disable=too-many-arguments
        self,
        node: Union[AddrmapNode, RootNode],
        output_path: str,
        input_files: Optional[List[str]] = None,
        rename: Optional[str] = None,
        depth: int = 0,
    ):
        """Export the `node` to generated Python interface file.

        Arguments:
            node -- node to export.
            input_files -- list of input files.
            output_path -- path to the exported file.
            rename -- name to rename the top-level to.
            depth -- depth of generation (0 means all)
        """
        # Get the top node.
        top = node.top if isinstance(node, RootNode) else node
        top_name = rename if rename is not None else node.inst_name

        generated_from = top_name
        if input_files is not None:
            generated_from += "\n  - " + "\n  - ".join(f for f in input_files)

        # Ensure proper format of the output path and that the directory exists.
        if not output_path.endswith(".md"):
            raise ValueError("The output file is not Markdown file.")
        Path(output_path).parent.mkdir(parents=True, exist_ok=True)

        # Run generation.
        gen = self._add_addrmap_regfile_mem(top, node.env.msg, depth - 1).generated

        # Write to the file.
        with open(output_path, "w", encoding="UTF-8") as output:
            output.write(
                "<!---\n"
                "Markdown description for SystemRDL register map.\n\n"
                f"Don't override. Generated from: {generated_from}\n"
                "-->\n"
            )
            output.write(gen)

    def _add_addrmap_regfile_mem(
        self,
        node: Union[AddrmapNode, RegfileNode, MemNode],
        msg: MessageHandler,
        depth: int,
    ) -> GenStageOutput:
        """Generate addrmap, regfile or memory.

        Arguments:
            node -- MemNode, RegfileNode or AddrmapNode.
            msg -- message handler from top-level.
            depth -- depth of generation left.

        Keyword Arguments:
            is_top -- if the current not is the top node. If True the
                specification is embedded as class member.

        Returns:
            Generated addrmap output.
        """
        members: List[MarkdownExporter.GenStageOutput] = []
        member_gen: str = ""
        # Don't unroll register arrays when they are inside memories.
        # Memories can contain hundreds of entires.
        not_memory = not isinstance(node, MemNode)
        for child in node.children(unroll=not_memory, skip_not_present=False):
            if isinstance(child, (AddrmapNode, RegfileNode, MemNode)):
                output = self._add_addrmap_regfile_mem(child, msg, depth - 1)
                member_gen += output.generated
                members.append(output)
            elif isinstance(child, RegNode):
                output = self._add_reg(child, msg)
                member_gen += output.generated
                members.append(output)
            else:
                msg.warning(
                    f"Unsupported type of node ({child.__class__.__name__}) "
                    f"for {'/'.join(child.get_path_segments())}."
                )

        gen: str = self._addrnode_header(node, msg, 2)

        if len(members) == 0:
            gen += "No supported members.\n"
        else:
            # Find the maximum width of the offset hex int and format the
            # offset for all members.
            base_addr_digits = max(
                map(lambda m: len(f'{m.table_row["Offset"]:X}'), members)
            )
            for member in members:
                member.table_row["Offset"] = (
                    f'0x{member.table_row["Offset"]:0{base_addr_digits}X}'
                )

            gen += (
                markdownTable([*map(lambda m: m.table_row, members)])
                .setParams(row_sep="markdown", quote=False)
                .getMarkdown()
            )

        gen += "\n"

        return MarkdownExporter.GenStageOutput(
            node,
            self._addrnode_table_row(node),
            gen + (member_gen if depth != 0 else ""),
        )

    def _add_reg(self, node: RegNode, msg: MessageHandler) -> GenStageOutput:
        """Generate register.

        Arguments:
            node -- RegNode.
            msg -- message handler from top-level.

        Returns:
            Generated register output.
        """
        field_gen: str = ""
        members: List[MarkdownExporter.GenStageOutput] = []
        for field in node.fields(skip_not_present=True):
            output = self._add_field(field, msg)
            field_gen += output.generated
            members.append(output)

        gen: str = self._addrnode_header(node, msg, 3)
        gen += (
            markdownTable([*map(lambda m: m.table_row, members)])
            .setParams(row_sep="markdown", quote=False)
            .getMarkdown()
        )
        gen += "\n"

        return MarkdownExporter.GenStageOutput(
            node, self._addrnode_table_row(node), gen + field_gen
        )

    def _add_field(
        self,
        node: FieldNode,
        msg: MessageHandler,  # pylint: disable=unused-argument
    ) -> GenStageOutput:
        """Generate field.

        Arguments:
            node -- FieldNode.
            msg -- message handler from top-level.

        Returns:
            Generated field output.
        """
        if node.msb == node.lsb:
            bits = str(node.msb)
        else:
            bits = f"{node.msb}:{node.lsb}"

        identifier = node.inst_name

        access = node.get_property("sw").name
        if node.get_property("onread") is not None:
            access += ", " + node.get_property("onread").name
        if node.get_property("onwrite") is not None:
            access += ", " + node.get_property("onwrite").name

        reset_value: str = node.get_property("reset", default="—")
        if isinstance(reset_value, int):
            reset = f"0x{reset_value:X}"
        else:
            reset = str(reset_value)

        name = self._node_name_sanitized(node)

        table_row: "OrderedDict[str, Union[str, int]]" = OrderedDict()
        table_row["Bits"] = bits
        table_row["Identifier"] = identifier
        table_row["Access"] = access
        table_row["Reset"] = reset
        table_row["Name"] = name

        gen = ""
        desc = node.get_html_desc()
        if desc is not None:
            gen = self._heading(4, f"{node.inst_name} field") + desc + "\n"

        return MarkdownExporter.GenStageOutput(node, table_row, gen)
