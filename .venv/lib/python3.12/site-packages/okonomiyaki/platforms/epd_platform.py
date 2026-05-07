import re
import warnings
from collections import defaultdict

from attr import attributes, attr
from attr.validators import instance_of

from okonomiyaki.versions import RuntimeVersion
from okonomiyaki.errors import OkonomiyakiError, InvalidPEP440Version
from ._arch import Arch, ArchitectureKind, X86, X86_64, ARM64
from ._platform import OSKind, FamilyKind, NameKind, Platform

# the string used in EGG-INFO/spec/depend. Only used during normalization
# operations.
_X86_64_LEGACY_SPEC = "amd64"

# Those lists are redundant with legacy spec. We check the consistency in our
# unit-tests
_ARCHBITS_TO_ARCH = {
    "32": ArchitectureKind.x86.name,
    "64": _X86_64_LEGACY_SPEC,
}

# Historically supported platform names for EDP
PLATFORM_NAMES = (
    "osx",
    "rh3",
    "rh5",
    "rh6",
    "rh7",
    "rh8",
    "sol",
    "win",
)

# Legacy lis to short names do not update!
EPD_PLATFORM_SHORT_NAMES = (
    "osx-32",
    "osx-64",
    "rh3-32",
    "rh3-64",
    "rh5-32",
    "rh5-64",
    "rh6-64",
    "rh7-64",
    "sol-32",
    "sol-64",
    "win-32",
    "win-64",
)

# Historical/Default mappings from os, python and arch to platform tuples
_RH2EPD = {
    'rh8': (OSKind.linux, NameKind.rhel, FamilyKind.rhel, '8.8'),
    'rh7': (OSKind.linux, NameKind.rhel, FamilyKind.rhel, '7.1'),
    'rh6': (OSKind.linux, NameKind.rhel, FamilyKind.rhel, '6.5'),
    'rh5': (OSKind.linux, NameKind.rhel, FamilyKind.rhel, '5.8'),
    'rh3': (OSKind.linux, NameKind.rhel, FamilyKind.rhel, '3.8'),
}
_OSX2EPD = {
    ('3.11', X86_64): (OSKind.darwin, NameKind.mac_os_x, FamilyKind.mac_os_x, '12.0'),
    ('3.11', None): (OSKind.darwin, NameKind.mac_os_x, FamilyKind.mac_os_x, '12.0'),
    ('3.11', ARM64): (OSKind.darwin, NameKind.mac_os_x, FamilyKind.mac_os_x, '12.0'),
    ('3.8', X86_64): (OSKind.darwin, NameKind.mac_os_x, FamilyKind.mac_os_x, '10.14'),
    ('3.8', X86): (OSKind.darwin, NameKind.mac_os_x, FamilyKind.mac_os_x, '10.14'),
    ('3.8', None): (OSKind.darwin, NameKind.mac_os_x, FamilyKind.mac_os_x, '10.14'),
    (None, None): (OSKind.darwin, NameKind.mac_os_x, FamilyKind.mac_os_x, '10.6'),
}
_WIN2EPD = {
    ('3.11', X86_64): (OSKind.windows, NameKind.windows, FamilyKind.windows, '10'),
    ('3.11', X86): (OSKind.windows, NameKind.windows, FamilyKind.windows, '10'),
    ('3.11', None): (OSKind.windows, NameKind.windows, FamilyKind.windows, '10'),
    ('3.11', ARM64): (OSKind.windows, NameKind.windows, FamilyKind.windows, '11'),
    ('3.8', X86_64): (OSKind.windows, NameKind.windows, FamilyKind.windows, '10'),
    ('3.8', X86): (OSKind.windows, NameKind.windows, FamilyKind.windows, '10'),
    ('3.8', None): (OSKind.windows, NameKind.windows, FamilyKind.windows, '10'),
    (None, None): (OSKind.windows, NameKind.windows, FamilyKind.windows, ''),
}

VALID_PLATFORMS_FILTER = PLATFORM_NAMES + ("all", "rh",)

_EPD_PLATFORM_STRING_RE = re.compile(r"""
    ^
    (?P<os>[^-_]+)
    [_-]
    (?P<arch>[^-]+)
    $
    """, flags=re.VERBOSE)

_LINUX_TAG_R = re.compile(r"^linux_(?P<arch>\S+)$")
_MANYLINUX_TAG_R = re.compile(r"^manylinux(?P<label>\d+)_(?P<arch>\S+)$")
_MACOSX_TAG_R = re.compile(r"^macosx_([^_]+)_([^_]+)_(?P<arch>\S+)$")
_WINDOWS_TAG_R = re.compile(r"^win_*(?P<arch>\S+)$")

_ANY_PLATFORM_STRING = 'any'


def platform_validator():
    def wrapper(inst, attr, value):
        instance_of(Platform)(inst, attr, value)
        if not _is_supported(value):
            raise OkonomiyakiError(
                "Platform {0} not supported by EPD".format(value))
    return wrapper


@attributes(frozen=True)
class EPDPlatform(object):
    """
    An sane Canopy/EPD platform representation.

    Example::

        epd_platform = EPDPlatform.from_epd_string("rh5-32")
        assert epd.name == "rh5"
        assert epd.arch_bits == "32"
        assert epd.arch == "x86"
    """

    platform = attr(validator=platform_validator())
    """
    Main name of the platform (e.g. 'rh5')
    """

    @staticmethod
    def pep425_tag_string(platform):
        if platform is None:
            return _ANY_PLATFORM_STRING
        else:
            return platform.pep425_tag

    @classmethod
    def from_running_python(cls):
        """
        Attempt to create an EPDPlatform instance based on the running
        python. May raise an OkonomiyakiError exception
        """
        return cls(Platform.from_running_python())

    @classmethod
    def from_running_system(cls, arch_name=None):
        """
        Attempt to create an EPDPlatform instance based on the running platform.
        May raise an OkonomiyakiError exception

        Parameters
        ----------
        arch_name: str, None
            If given, must be a valid architecture string (e.g. 'x86'). If
            None, will be guessed from the running platform.
        """
        platform = Platform.from_running_system(arch_name)
        return cls(platform)

    @classmethod
    def from_string(cls, s, runtime_version=None):
        """ Create a new instance from an epd platform string.

        Parameters:
        s : string
           The platform string e.g. win-32. New, more explicit
           architecture names are also supported, e.g. 'win-x86' or
           'win-x86_64' are supported.
        runtime_version: RuntimeVersion
           Passing the runtime version will result in more precise Platform
           description taking into account the historical records of the
           Enthought python runtime releases.
        """
        m = _EPD_PLATFORM_STRING_RE.match(s)
        if m is None:
            raise OkonomiyakiError("Invalid epd string: {0}".format(s))
        else:
            d = m.groupdict()
            platform_name = d["os"]
            arch_bits = d["arch"]
            try:
                arch_name = _ARCHBITS_TO_ARCH[arch_bits]
            except KeyError:
                arch = machine = Arch.from_name(arch_bits)
            else:
                arch = machine = Arch.from_name(arch_name)
            os, name, family, release = _epd_name_and_python_to_quadruplet(
                platform_name, runtime_version, arch)
            platform = Platform(os, name, family, release, arch, machine)
            return cls(platform)

    @classmethod
    def from_epd_string(cls, s, runtime_version=None):
        """
        Create a new instance from an epd platform string (e.g. 'win-32')

        DEPRECATED: use from_string instead.
        """
        warnings.warn(
            "Deprecated: use EPDPlatform.from_string instead",
            DeprecationWarning)
        return cls.from_string(s, runtime_version)

    @classmethod
    def _from_spec_depend_data(
            cls, platform, osdist, arch_name,
            platform_tag, python_version, platform_abi):
        msg = ("Unrecognized platform/osdist combination: {0!r}/{1!r}"
               .format(platform, osdist))
        arch = Arch.from_name(arch_name)
        if platform == "darwin":
            epd_name = "osx"
        elif platform == "win32":
            epd_name = "win"
        elif platform.startswith("linux"):
            if osdist == "RedHat_3":
                epd_name = "rh3"
            elif osdist in (None, "RedHat_5"):
                epd_name = "rh5"
            elif osdist == "RedHat_6":
                epd_name = "rh6"
            elif osdist == "RedHat_7":
                epd_name = "rh7"
            elif osdist == "RedHat_8":
                epd_name = "rh8"
            else:
                raise ValueError(msg)
        else:
            raise ValueError(msg)

        if python_version is not None:
            try:
                python_version = RuntimeVersion.from_string(python_version)
            except InvalidPEP440Version:
                python_version = None

        os_kind, name_kind, family_kind, release = _epd_name_and_python_to_quadruplet(
            epd_name, python_version, arch)

        if 'osx' in platform_tag.lower():
            release = '.'.join(platform_tag.split('_')[1:3])

        platform = Platform(
            os_kind=os_kind, name_kind=name_kind, family_kind=family_kind,
            release=release, arch=arch, machine=arch)
        return cls(platform)

    @classmethod
    def _from_platform_tag(cls, platform_tag, default_linux='rh5'):
        """
        Attempt to create an EPDPlatform instance from a PEP 425 platform tag.

        Note that on linux systems when it is not possible to establish
        clib compatibility the default_linux variable is used
        """
        if platform_tag is None or platform_tag == _ANY_PLATFORM_STRING:
            raise ValueError(
                "Invalid platform_tag for platform: '{}'".format(platform_tag))
        else:
            if platform_tag.startswith('manylinux'):
                m = _MANYLINUX_TAG_R.match(platform_tag)
                if m is None:
                    raise NotImplementedError(
                        "Unsupported platform '{0}'".format(platform_tag))
                arch = m.group('arch')
                label = m.group('label')
                if label == '1':
                    epd_string = f'rh5_{Arch.from_name(arch)}'
                elif label == '2010':
                    epd_string = f'rh6_{Arch.from_name(arch)}'
                else:
                    raise ValueError(
                        "Unsupported tag '{0}'".format(platform_tag))
            elif platform_tag.startswith('linux'):
                m = _LINUX_TAG_R.match(platform_tag)
                arch = m.group('arch')
                epd_string = f'{default_linux}_{Arch.from_name(arch)}'
            elif platform_tag.startswith('macosx'):
                m = _MACOSX_TAG_R.match(platform_tag)
                arch = m.group('arch')
                epd_string = f'osx_{Arch.from_name(arch)}'
            elif platform_tag.startswith('win'):
                m = _WINDOWS_TAG_R.match(platform_tag)
                arch = m.group('arch')
                if arch == '32':
                    epd_string = 'win_x86'
                else:
                    epd_string = f'win_{Arch.from_name(arch)}'
            else:
                raise NotImplementedError(
                    "Unsupported platform '{0}'".format(platform_tag))

            return cls.from_epd_string(epd_string)

    @property
    def arch(self):
        return self.platform.arch

    @property
    def arch_bits(self):
        """
        The number of bits (as a string) of this epd platform.
        """
        return self.arch._arch_bits

    @property
    def pep425_tag(self):
        msg = "Cannot generate pep425 tag for platform {0!r}"

        platform = self.platform
        if platform.os_kind == OSKind.darwin:
            release = platform.release.replace('.', '_')
            if platform.arch == X86:
                return 'macosx_{}_i386'.format(release)
            elif platform.arch == X86_64:
                return 'macosx_{}_x86_64'.format(release)
            elif platform.arch == ARM64:
                return 'macosx_{}_arm64'.format(release)
            else:
                raise OkonomiyakiError(msg.format(platform))
        elif platform.os_kind == OSKind.linux:
            if platform.arch == X86:
                return 'linux_i686'
            elif platform.arch == X86_64:
                return 'linux_x86_64'
            elif platform.arch == ARM64:
                return 'linux_aarch64'
            else:
                raise OkonomiyakiError(msg.format(platform))
        elif platform.os_kind == OSKind.windows:
            if platform.arch == X86:
                return 'win32'
            elif platform.arch == X86_64:
                return 'win_amd64'
            elif platform.arch == ARM64:
                return 'win_arm64'
            else:
                raise OkonomiyakiError(msg.format(platform))
        else:
            raise OkonomiyakiError(msg.format(platform))

    @property
    def platform_name(self):
        os_kind = self.platform.os_kind
        if os_kind == OSKind.windows:
            return 'win'
        elif os_kind == OSKind.darwin:
            return 'osx'
        elif os_kind == OSKind.linux:
            family_kind = self.platform.family_kind
            release = self.platform.release
            if family_kind == FamilyKind.rhel:
                major = release.split('.')[0]
                if major in ('3', '5', '6', '7', '8'):
                    base = f'rh{major}'
                else:
                    msg = ('Unsupported rhel release: {0!r}'.format(release))
                    raise OkonomiyakiError(msg)
                return base
            else:
                msg = 'Unsupported distribution: {0!r}'.format(family_kind)
                raise OkonomiyakiError(msg)
        elif os_kind == OSKind.solaris:
            return 'sol'
        else:
            msg = 'Unsupported OS: {0!r}'.format(self.platform.name)
            raise OkonomiyakiError(msg)

    def __str__(self):
        return '{0.platform_name}_{0.arch}'.format(self)

    def __eq__(self, other):
        if not isinstance(other, self.__class__):
            return False
        return self.platform == other.platform

    def __ne__(self, other):
        if not isinstance(other, self.__class__):
            return True
        return not (self.platform == other.platform)

    def __hash__(self):
        return hash(self.platform)


def applies(platform_string, to='current'):
    """ Returns True if the given platform string applies to the platform
    specified by 'to'."""

    def _parse_component(component):
        component = component.strip()
        parts = component.split("-", 1)
        if len(parts) == 1:
            if parts[0] in VALID_PLATFORMS_FILTER:
                return parts[0], None
            elif parts[0] in _ARCHBITS_TO_ARCH:
                return "all", parts[0]
            else:
                raise ValueError(
                    "Invalid filter string: '{}'".format(component))
        elif len(parts) == 2:
            try:
                arch_name = _ARCHBITS_TO_ARCH[parts[1]]
            except KeyError:
                arch = Arch.from_name(parts[1])
            else:
                arch = Arch.from_name(arch_name)
            return parts[0], arch
        else:
            raise ValueError(
                "Invalid filter string: '{}'".format(component))

    def _are_compatible(short_left, short_right):
        return short_left == short_right or \
            short_left == "rh" and short_right.startswith("rh") \
            or short_right == "rh" and short_left.startswith("rh") \
            or short_left == "all"

    if isinstance(to, str):
        if to == 'current':
            full = EPDPlatform.from_running_system()
            to_platform = full.platform_name
            to_arch = full.arch
        elif '-' in to:
            full = EPDPlatform.from_epd_string(to)
            to_platform = full.platform_name
            to_arch = full.arch
        else:
            if not (to in PLATFORM_NAMES or to == 'rh'):
                raise ValueError("Invalid 'to' argument: {0!r}".format(to))
            to_platform = to
            to_arch = None
    else:
        to_platform = to.platform_name
        to_arch = to.arch
    conditions = []

    platform_string = platform_string.strip()
    if platform_string.startswith("!"):
        invert = True
        platform_string = platform_string[1:]
    else:
        invert = False

    platform_strings = [s for s in platform_string.split(",")]
    for platform_string in platform_strings:
        short, arch = _parse_component(platform_string)
        if _are_compatible(short, to_platform):
            if arch is None:
                conditions.append(True)
            elif arch in _ARCHBITS_TO_ARCH:
                conditions.append(arch in str(to_arch) or to_arch is None)
            else:
                conditions.append(arch == to_arch or to_arch is None)
        else:
            conditions.append(False)

    if invert:
        return not any(conditions)
    else:
        return any(conditions)


def _epd_name_and_python_to_quadruplet(name, runtime_version=None, arch=None):
    py38 = RuntimeVersion.from_string('3.8')
    py311 = RuntimeVersion.from_string('3.11')
    if name in _RH2EPD:
        return _RH2EPD[name]
    elif name == 'osx':
        if runtime_version is None:
            return _OSX2EPD[(None, None)]
        elif runtime_version >= py311:
            return _OSX2EPD[('3.11', arch)]
        elif runtime_version >= py38:
            return _OSX2EPD[('3.8', arch)]
        else:
            return _OSX2EPD[(None, None)]
    elif name == "sol":
        return (OSKind.solaris, NameKind.solaris, FamilyKind.solaris, "")
    elif name == "win":
        if runtime_version is None:
            return _WIN2EPD[(None, None)]
        elif runtime_version >= py311:
            return _WIN2EPD[('3.11', arch)]
        elif runtime_version >= py38:
            return _WIN2EPD[('3.8', arch)]
        else:
            return _WIN2EPD[(None, None)]
    else:
        msg = "Invalid epd platform string name: {0!r}".format(name)
        raise OkonomiyakiError(msg)


def _is_supported(platform):
    intel = (
        platform.arch in (X86, X86_64)
        and platform.machine in (X86, X86_64))
    arm64 = (platform.arch == ARM64 and platform.machine == ARM64)
    if platform.os_kind == OSKind.windows:
        return intel or arm64
    if platform.os_kind == OSKind.darwin:
        return intel or arm64
    if platform.os_kind == OSKind.solaris:
        return intel
    if platform.os_kind == OSKind.linux:
        if platform.family_kind != FamilyKind.rhel:
            return False
        parts = platform.release.split(".")
        PARTS2ARCHS = defaultdict(lambda x: False)
        PARTS2ARCHS.update({
            '3': intel,
            '5': intel,
            '6': intel,
            '7': intel,
            '8': intel or arm64})
        return PARTS2ARCHS[parts[0]]

    return False
