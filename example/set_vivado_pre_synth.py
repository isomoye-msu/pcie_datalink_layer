#!/usr/bin/env python3
from pathlib import Path
import sys

if len(sys.argv) != 2:
    raise SystemExit("usage: set_vivado_pre_synth.py <pre_synth_tcl>")

pre_tcl = Path(sys.argv[1]).as_posix()

# Common generated Vivado Tcl filenames to try
candidates = [
    Path("edalize_build.tcl"),
    Path("vivado.tcl"),
    Path("build.tcl"),
]

target_file = None
for c in candidates:
    if c.exists():
        target_file = c
        break

if target_file is None:
    raise SystemExit(
        "Could not find generated Vivado Tcl file "
        "(looked for edalize_build.tcl, vivado.tcl, build.tcl)"
    )

text = target_file.read_text()

hook_line = (
    f'set_property STEPS.SYNTH_DESIGN.TCL.PRE "{pre_tcl}" [get_runs synth_1]\n'
)

if hook_line not in text:
    text += "\n# Inserted by FuseSoC pre_build hook\n" + hook_line

target_file.write_text(text)
print(f"Patched {target_file} with pre-synth Tcl hook: {pre_tcl}")