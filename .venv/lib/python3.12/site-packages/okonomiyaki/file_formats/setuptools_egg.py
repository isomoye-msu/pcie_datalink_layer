import os.path
import re
import sys
import sysconfig
import warnings

from okonomiyaki.errors import OkonomiyakiError
from okonomiyaki.platforms import PythonImplementation
from ._egg_info import _guess_python_tag
from ._package_info import PackageInfo


_R_EGG_NAME = re.compile(r"""
        (?P<name>^[^.-]+)
        (-(?P<version>[^-]+))
        (-py(?P<pyver>(\d+\.\d+)))
        (-(?P<platform>.+))?
        \.egg$
""", re.VERBOSE)


def parse_filename(path):
    """
    Parse a setuptools egg.

    Returns
    -------
    name : str
        the egg name
    version : str
        the egg version
    python_version : str
        the python version
    platform : str or None
        the platform string, or None for platform-independent eggs.
    """
    m = _R_EGG_NAME.search(os.path.basename(path))
    if m:
        platform = m.group("platform")
        return (m.group("name"), m.group("version"), m.group("pyver"),
                platform)
    else:
        raise OkonomiyakiError("Invalid egg name: {0}".format(path))


def _get_default_setuptools_abi(platform_string, pyver):
    """ Try to guess the ABI for setuptools eggs from the platform_string
    and pyver parts.

    Parameters
    ----------
    platform_string: str
        The platform part of the setuptools egg filename as a string. If
        None, understood as a cross platform egg (pure python).
    pyver: str
        The python version
    """
    assert pyver in ("2.6", "2.7")

    if platform_string is None:
        return None
    else:
        if (platform_string.startswith("linux")
                or platform_string.startswith("win")
                or platform_string.startswith("macosx")):
            return 'cp{0}{1}m'.format(pyver[0], pyver[2])
        else:
            msg = "Platform string {0!r} not supported".format(platform_string)
            raise ValueError(msg)


_UNSPECIFIED = object()


def _guess_abi_from_python(python):
    # For legacy (aka legacy spec version info < 1.3), we know that pyver
    # can only be one of "2.X" with X in (5, 6, 7).
    #
    # In those cases, the mapping (platform pyver) -> ABI is unambiguous,
    # as we only ever used one ABI for a given python version/platform.
    if python.major >= 3 and python.minor >= 8:
        # Python 3.8 has removed the `m` from the abi tag
        return u"cp{0}{1}".format(python.major, python.minor)
    else:
        return u"cp{0}{1}m".format(python.major, python.minor)


def _guess_abi_from_running_python():
    try:
        soabi = sysconfig.get_config_var('SOABI')
    except IOError as e:  # pip issue #1074
        warnings.warn("{0}".format(e), RuntimeWarning)
        soabi = None

    if soabi and soabi.startswith('cpython-'):
        return 'cp' + soabi.split('-', 2)[1]
    else:
        return None


def _guess_abi(platform, python):
    if platform is None:
        return None
    if python is not None:
        if (python.major, python.minor) != sys.version_info[:2]:
            return _guess_abi_from_python(python)

    abi = _guess_abi_from_running_python()
    if abi is None:
        if python is not None:
            return _guess_abi_from_python(python)
        else:
            msg = ("Could not guess ABI, you need to specify the abi_tag "
                   "argument to from_egg, e.g. 'cp34m' for Enthought "
                   "CPython 3.4 runtimes")
            raise OkonomiyakiError(msg)
    else:
        return abi


class SetuptoolsEggMetadata(object):
    @classmethod
    def from_egg(cls, path, platform=None, python=_UNSPECIFIED,
                 abi_tag=_UNSPECIFIED):
        filename = os.path.basename(path)
        name, version, pyver, platform_string = parse_filename(filename)
        if platform is None and platform_string is not None:
            msg = ("Platform-specific egg detected: you need to specify a "
                   "platform argument that is not None to from_egg")
            raise OkonomiyakiError(msg)

        if python is _UNSPECIFIED:
            python = PythonImplementation.from_string(_guess_python_tag(pyver))

        if abi_tag is _UNSPECIFIED:
            abi_tag = _guess_abi(platform, python)
        else:
            abi_tag = abi_tag

        pkg_info = PackageInfo.from_egg(path)

        return cls(name, version, platform, python, abi_tag, pkg_info)

    def __init__(self, name, version, platform, python, abi_tag, pkg_info):
        """
        Parameters
        ----------
        name: str
            Package name
        version: str
            Version string
        platform: EPDPlatform
            An EPDPlatform instance, or None for cross-platform eggs
        python: PythonImplementation
            The PEP425 python tag, or None.
        abi_tag: str
            The PEP425 abi tag, or None.
        pkg_info: PackageInfo
            Instance representing the egg PKG-INFO.
        """
        self.name = name
        self.version = version

        self.platform = platform
        if isinstance(python, str):
            python = PythonImplementation.from_string(python)
        self.python = python
        self.abi_tag = abi_tag

        self._pkg_info = pkg_info

    @property
    def platform_tag(self):
        """ Platform tag following PEP425, except that no platform is
        represented as None and not 'any'."""
        if self.platform is None:
            return None
        else:
            return self.platform.pep425_tag

    @property
    def python_tag(self):
        if self.python is None:
            return None
        else:
            return self.python.pep425_tag

    @property
    def summary(self):
        return self._pkg_info.summary
