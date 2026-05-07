import os
import subprocess
import sys
import tempfile


from okonomiyaki.utils import decode_if_needed
from ._pep425_impl import _PEP425_IMPL


def _run_pep425(executable, flag):
    with tempfile.NamedTemporaryFile(mode='w', suffix='.py', delete=False) as handle:
        handle.write(_PEP425_IMPL)
    try:
        out = subprocess.check_output([executable, handle.name, flag]).strip()
    finally:
        os.remove(handle.name)
    return decode_if_needed(out)


def compute_abi_tag(python_executable=None):
    """ Compute the PEP425 abi tag for the given python executable.

    This will launch a subprocess.
    """
    if python_executable is None:
        python_executable = sys.executable
    return _run_pep425(python_executable, "--abi-tag")


def compute_python_tag(python_executable=None):
    """ Compute the PEP425 python tag for the given python executable.

    This will launch a subprocess.
    """
    if python_executable is None:
        python_executable = sys.executable
    return _run_pep425(python_executable, "--python-tag")


def compute_platform_tag(python_executable=None):
    """ Compute the PEP425 platform tag for the given python executable.

    This will launch a subprocess.
    """
    if python_executable is None:
        python_executable = sys.executable
    return _run_pep425(python_executable, "--platform-tag")
