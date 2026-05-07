import enum
import platform
import sys
import subprocess

from attr import attr, attributes
from attr.validators import instance_of

from okonomiyaki.errors import OkonomiyakiError
from okonomiyaki.versions import SemanticVersion
from ._arch import Arch, X86, ARM


@enum.unique
class OSKind(enum.Enum):
    darwin = 'Darwin'
    linux = 'Linux'
    solaris = 'Solaris'
    windows = 'Windows'


@enum.unique
class FamilyKind(enum.Enum):
    rhel = 'RedHat'
    debian = 'Debian'
    mac_os_x = 'Mac OS X'
    windows = 'Windows'
    solaris = 'Solaris'


@enum.unique
class NameKind(enum.Enum):
    unknown = 'Unknown distribution'
    centos = 'CentOS'
    debian = 'Debian'
    rhel = 'RedHat'
    ubuntu = 'Ubuntu'
    mac_os_x = 'Mac OS X'
    windows = 'Windows'
    solaris = 'Solaris'
    rocky = 'Rocky Linux'


@attributes(repr=False, frozen=True)
class Platform(object):
    """
    An generic platform representation.
    """

    os_kind = attr(validator=instance_of(OSKind))
    """
    The most generic OS description
    """

    name_kind = attr(validator=instance_of(NameKind))
    """
    The most specific platform description
    """

    family_kind = attr(validator=instance_of(FamilyKind))
    """
    The 'kind' of platforms. For example, both debian and ubuntu distributions
    share the same kind, 'debian'.
    """

    release = attr(validator=instance_of(str))
    """
    The release string. May be an empty string
    """

    arch = attr(validator=instance_of(Arch))
    """
    Actual architecture. The architecture is guessed from the running python.
    """

    machine = attr(validator=instance_of(Arch))
    """
    This is the CPU architecture of the host machine (e.g. for a
    32 bits python running on 64 bits Intel OS, machine will be an
    x86_64 arch, whereas arch will be an 'x86' arch)

    """

    @classmethod
    def from_running_python(cls):
        """ Guess the platform, using the running python to guess the
        architecture.
        """
        arch = Arch.from_running_python()
        return _guess_platform(arch)

    @classmethod
    def from_running_system(cls, arch_string=None):
        """ Guess the platform, with an optional architecture string.

        Parameters
        ----------
        arch_string: str, None
            If given, should be a valid architecture name (e.g. 'x86')
        """
        if arch_string is None:
            arch = Arch.from_running_system()
        else:
            arch = Arch.from_name(arch_string)
        return _guess_platform(arch)

    @classmethod
    def from_dict(cls, **kw):
        """ Create a Platfrom instace from dictionary values.

        Parameters
        ----------
        os_kind: str, OSKind
            The most generic OS description.

        name_kind: str, NameKind
            The most specific platform description.

        family_kind: str, FamilyKind
            The 'family' of platforms. For example, both debian and
            ubuntu distributions share the same kind, 'debian'.

        release: str
            The release string. May be an empty string.
        arch: str, Arch
             Actual architecture of the Python runtime
        machine: str, Arch
             This is the CPU architecture of the host machine
             (e.g. for a 32 bits python running on 64 bits Intel OS,
             machine will be an x86_64 arch, whereas arch will be an 'x86'
             arch)

        """
        os_kind, name_kind, family_kind, arch, machine = (
            kw['os_kind'], kw['name_kind'], kw['family_kind'], kw['arch'], kw['machine'])
        if isinstance(os_kind, str):
            os_kind = OSKind[os_kind]
        if isinstance(name_kind, str):
            name_kind = NameKind[name_kind]
        if isinstance(family_kind, str):
            family_kind = FamilyKind[family_kind]
        if isinstance(arch, str):
            arch = Arch.from_name(arch)
        if isinstance(machine, str):
            machine = Arch.from_name(machine)
        return cls(
            os_kind=os_kind,
            family_kind=family_kind,
            name_kind=name_kind,
            release=kw['release'],
            arch=arch,
            machine=machine)

    @property
    def family(self):
        return self.family_kind.name

    @property
    def name(self):
        return self.name_kind.name

    @property
    def os(self):
        return self.os_kind.name

    def __repr__(self):
        return (
            "Platform(os={0.os!r}, name={0.name!r}, family={0.family!r}, "
            "release='{0.release}', arch='{0.arch}', machine='{0.machine}')".format(self))

    def __str__(self):
        message = "{0.name_kind.value} {0.release} on {0.machine} using {0.arch} arch"
        return message.format(self)


def _guess_os_kind():
    if sys.platform == "win32":
        return OSKind.windows
    elif sys.platform == "darwin":
        return OSKind.darwin
    elif sys.platform.startswith("linux"):
        return OSKind.linux
    else:
        msg = "Could not guess platform from sys.platform: {0!r}"
        raise OkonomiyakiError(msg.format(sys.platform))


def _guess_platform_details(os_kind):
    if os_kind == OSKind.windows:
        return FamilyKind.windows, NameKind.windows, _windows_version()
    elif os_kind == OSKind.darwin:
        return FamilyKind.mac_os_x, NameKind.mac_os_x, _macos_release()
    elif os_kind == OSKind.linux:
        name, release, like = _linux_distribution()
        try:
            name_kind = NameKind[name]
        except KeyError:
            for name in like:
                try:
                    name_kind = NameKind[name]
                except KeyError:
                    continue
                else:
                    name_kind = NameKind.unknown
                    break
            else:
                raise OkonomiyakiError(
                    "Unsupported platform: {0!r}".format(name))

        if name_kind in (NameKind.ubuntu, NameKind.debian):
            family_kind = FamilyKind.debian
        elif name_kind in (NameKind.centos, NameKind.rhel, NameKind.rocky):
            family_kind = FamilyKind.rhel
        elif name_kind == NameKind.unknown and 'rhel' in like:
            family_kind = FamilyKind.rhel
        elif name_kind == NameKind.unknown and 'debian' in like:
            family_kind = FamilyKind.debian
        else:
            raise OkonomiyakiError("Unsupported platform: {0!r}".format(name))
        return family_kind, name_kind, release


def _guess_platform(arch):
    machine = Arch.from_running_system()
    if (machine == X86 and arch.bits == 64) or (machine == ARM and arch.bits == 64):
        raise OkonomiyakiError("Incompatible 32bit machine with a 64bit architecture")
    os_kind = _guess_os_kind()
    family_kind, name_kind, release = _guess_platform_details(os_kind)
    return Platform(os_kind, name_kind, family_kind, release, arch, machine)


def _linux_distribution():
    """ Get the linux distribution of the running system.

    """
    import distro
    name = distro.name()
    release = distro.version()
    like = distro.like().lower()
    name = name.split()[0]
    return name.lower(), release, like.split()


def _macos_release():
    release = platform.mac_ver()[0]
    if release == '10.16':
        # need to verify since sometimes python reports a compatibility version
        cmd = [
            sys.executable, '-sS', '-c',
            'import platform; print(platform.mac_ver()[0])']
        release = subprocess.check_output(
            cmd, env={"SYSTEM_VERSION_COMPAT": "0"},
            universal_newlines=True).strip()
    return release


def _windows_version():
    version, release, _, _ = platform.win32_ver()
    release = SemanticVersion.from_string(release)
    if release > SemanticVersion.from_string('10.0.22000'):
        version = '11'
    return version
