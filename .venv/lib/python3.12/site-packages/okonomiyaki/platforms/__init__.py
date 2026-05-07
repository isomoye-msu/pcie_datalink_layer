# flake8: noqa
from .abi import PlatformABI, default_abi
from .epd_platform import EPDPlatform, applies
from ._platform import Platform, OSKind, FamilyKind, NameKind
from ._arch import X86, X86_64, ARM64, Arch
from .pep425 import compute_abi_tag, compute_python_tag, compute_platform_tag
from .python_implementation import PythonABI, PythonImplementation


__all__ = [
    'X86', 'X86_64', 'ARM64', 'EPDPlatform', 'Platform', 'PythonImplementation',
    'default_abi','Arch'
]
