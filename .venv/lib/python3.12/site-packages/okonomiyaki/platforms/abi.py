from attr import attributes, attr
from attr.validators import instance_of

from okonomiyaki.errors import OkonomiyakiError
from okonomiyaki.versions import RuntimeVersion

from .epd_platform import EPDPlatform
from ._platform import OSKind


_PLATFORM_ABI_NONE = u'none'


@attributes
class PlatformABI(object):
    pep425_tag = attr(validator=instance_of(str))

    @staticmethod
    def pep425_tag_string(abi):
        if abi is None:
            return _PLATFORM_ABI_NONE
        else:
            return abi.pep425_tag


def _default_cpython_abi(platform, implementation_version):
    msg = (
        "Unsupported combo of {0!r} and cpython version {1!s}".
        format(platform, implementation_version))

    if platform.os_kind == OSKind.darwin:
        return u"darwin"
    elif platform.os_kind == OSKind.linux:
        return u"gnu"
    elif platform.os_kind == OSKind.windows:
        abi = None
        if implementation_version.major == 2:
            abi = u"msvc2008"
        elif implementation_version.major == 3:
            if implementation_version.minor <= 2:
                abi = u"msvc2008"
            elif implementation_version.minor <= 4:
                abi = u"msvc2010"
            elif implementation_version.minor <= 6:
                abi = u"msvc2015"
            elif implementation_version.minor <= 8:
                abi = u"msvc2019"
            else:
                abi = u"msvc2022"

        if abi is None:
            raise OkonomiyakiError(msg)

        return abi
    else:
        raise OkonomiyakiError(msg)


def default_abi(platform, implementation, implementation_version):
    """ Returns the default abi for the given platform and python
    implementation.

    Parameters
    ----------
    platform : Platform or str
        The platform to get the default abi for
    implementation: str
        The language implementation (e.g. 'cpython', 'julia')
    implementation_version : RuntimeVersion or str
        The runtime version.

    Note
    ----
    For arguments accepting both object and str arguments, the str is
    automatically converted into an instance of the corresponding class.
    """
    if isinstance(implementation_version, str):
        implementation_version = RuntimeVersion.from_string(
            implementation_version)
    if isinstance(platform, str):
        epd_platform = EPDPlatform.from_epd_string(
            platform, implementation_version)
        platform = epd_platform.platform

    msg = "Unsupported platform/version combo for {0!r}: {1!r}/{2!r}".format(
        implementation, platform, str(implementation_version))

    if implementation == "cpython":
        return _default_cpython_abi(platform, implementation_version)
    elif implementation == "pypy":
        if platform.os_kind == OSKind.windows:
            if implementation_version <= RuntimeVersion.from_string("4.1"):
                return u"msvc2008"
            else:
                raise OkonomiyakiError(msg)
        elif platform.os_kind == OSKind.linux:
            return u"gnu"
        elif platform.os_kind == OSKind.darwin:
            return u"darwin"
        else:
            raise OkonomiyakiError(msg)
    elif implementation in ("ironpython", "jython"):
        if implementation_version == RuntimeVersion.from_string("2.7"):
            return _default_cpython_abi(platform, implementation_version)
        else:
            OkonomiyakiError(msg)
    elif implementation == "julia":
        if platform.os_kind == OSKind.windows:
            return u"mingw"
        elif platform.os_kind == OSKind.linux:
            return u"gnu"
        elif platform.os_kind == OSKind.darwin:
            return u"darwin"
        else:
            raise OkonomiyakiError(msg)
    else:
        raise OkonomiyakiError(
            "Unsupported implementation: {0!r}".format(implementation))
