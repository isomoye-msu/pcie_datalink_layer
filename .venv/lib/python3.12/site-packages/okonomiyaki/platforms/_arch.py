import platform
import sys

import enum

from attr import attr, attributes
from attr.validators import instance_of

from okonomiyaki.errors import OkonomiyakiError


@enum.unique
class ArchitectureKind(enum.Enum):
    x86 = 'x86'
    x86_64 = 'x86_64'
    arm = 'arm'
    arm64 = 'arm64'


_KIND_TO_BITWIDTHS = {
    ArchitectureKind.x86: 32,
    ArchitectureKind.x86_64: 64,
    ArchitectureKind.arm: 32,
    ArchitectureKind.arm64: 64,
}

_32BIT_NAMES = {
    'x86': ArchitectureKind.x86,
    'i386': ArchitectureKind.x86,
    'i686': ArchitectureKind.x86,

    'arm': ArchitectureKind.arm,
    'ARM': ArchitectureKind.arm,
    'armv7': ArchitectureKind.arm,
    'ARMv7': ArchitectureKind.arm,
    'AArch32': ArchitectureKind.arm,
    'aarch32': ArchitectureKind.arm,
}

_64BIT_NAMES = {
    'amd64': ArchitectureKind.x86_64,
    'AMD64': ArchitectureKind.x86_64,
    'x86_64': ArchitectureKind.x86_64,
    'x86-64': ArchitectureKind.x86_64,

    'arm64': ArchitectureKind.arm64,
    'ARM64': ArchitectureKind.arm64,
    'armv8': ArchitectureKind.arm64,
    'ARMv8': ArchitectureKind.arm64,
    'armv9': ArchitectureKind.arm64,
    'ARMv9': ArchitectureKind.arm64,
    'AArch64': ArchitectureKind.arm64,
    'aarch64': ArchitectureKind.arm64,
}
_32ON64 = {
    'amd64': ArchitectureKind.x86,
    'AMD64': ArchitectureKind.x86,
    'x86_64': ArchitectureKind.x86,
    'x86-64': ArchitectureKind.x86,

    'arm64': ArchitectureKind.arm,
    'ARM64': ArchitectureKind.arm,
    'armv8': ArchitectureKind.arm,
    'ARMv8': ArchitectureKind.arm,
    'armv9': ArchitectureKind.arm,
    'ARMv9': ArchitectureKind.arm,
    'AArch64': ArchitectureKind.arm,
    'aarch64': ArchitectureKind.arm,
}

_NORMALIZED_NAMES = {}
_NORMALIZED_NAMES.update(_64BIT_NAMES)
_NORMALIZED_NAMES.update(_32BIT_NAMES)


@attributes(frozen=True)
class Arch(object):
    """ A normalized architecture representation.
    """
    _kind = attr(validator=instance_of(ArchitectureKind))

    @classmethod
    def _from_bitwidth(cls, bitwidth):
        if bitwidth == "32":
            return cls(ArchitectureKind.x86)
        elif bitwidth == "64":
            return cls(ArchitectureKind.x86_64)
        else:
            msg = "Invalid bits width: {0!r}".format(bitwidth)
            raise OkonomiyakiError(msg)

    @classmethod
    def from_name(cls, name):
        kind = _NORMALIZED_NAMES.get(name)
        if kind is None:
            raise OkonomiyakiError(
                "Unsupported/unrecognized architecture: {0!r}".format(name)
            )
        else:
            return cls(kind)

    @classmethod
    def from_running_python(cls):
        machine = platform.machine()
        if machine not in _NORMALIZED_NAMES:
            raise OkonomiyakiError("Unknown machine type {0!r}".format(machine))
        elif sys.maxsize > 2 ** 32:
            return Arch(_64BIT_NAMES[machine])
        elif machine in _32BIT_NAMES:
            return Arch(_32BIT_NAMES[machine])
        else:
            # We have a 32bit python running on a 64bit machine:
            return Arch(_32ON64[machine])

    @classmethod
    def from_running_system(cls):
        if platform.system() == 'Darwin' and 'RELEASE_ARM64' in platform.uname().version:
            return Arch.from_name('arm64')
        else:
            return Arch.from_name(platform.machine())

    @property
    def bits(self):
        """
        Actual architecture bits (e.g. 32), as an int.
        """
        return _KIND_TO_BITWIDTHS[self._kind]

    @property
    def name(self):
        """ The normalized architecture name."""
        return self._kind.name

    @property
    def _arch_bits(self):
        # Used by EPDPlatform
        return str(self.bits)

    @property
    def _legacy_name(self):
        # Used for translating the arch into EGG-INFO/spec/depend (old
        # 'platform' entry)
        if self._kind == ArchitectureKind.x86_64:
            return "amd64"
        else:
            return self.name

    def __str__(self):
        return self.name


X86 = Arch(ArchitectureKind.x86)
X86_64 = Arch(ArchitectureKind.x86_64)
ARM = Arch(ArchitectureKind.arm)
ARM64 = Arch(ArchitectureKind.arm64)
