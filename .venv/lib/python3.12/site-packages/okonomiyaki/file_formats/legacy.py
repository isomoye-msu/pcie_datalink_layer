""" Various functions to guess metadata for old eggs that did not define those
metadata.
"""
import re

from okonomiyaki.errors import InvalidMetadataField
from okonomiyaki.platforms import PythonImplementation, default_abi
from okonomiyaki.versions import RuntimeVersion

# To parse the python field in our index and spec/depend
_PYVER_RE = re.compile(r"(?P<major>\d+)\.(?P<minor>\d+)")

# To parse python_tag
_TAG_RE = re.compile(r"""
    (?P<interpreter>(cp|pp|cpython|py))
    (?P<version>([\d_]+))
""", flags=re.VERBOSE)


def _guess_abi_tag(epd_platform, python_tag):
    """ Guess the ABI tag from the epd_platform and python_tag.
    """
    if python_tag is None:
        # No python tag, so should only be a "pure binary" egg, i.e.
        # an egg containing no python code and no python C extensions.
        return None

    if epd_platform is None:
        # No platform, so should only be a "pure python" egg, i.e.
        # an egg containing no C extension.
        return None

    # For legacy (aka legacy spec version info < 1.3), we know that pyver
    # can only be one of "2.X" with X in (5, 6, 7).
    #
    # In those cases, the mapping (platform pyver) -> ABI is unambiguous,
    # as we only ever used one ABI for a given python version/platform.
    pyver = RuntimeVersion.from_string(_python_tag_to_python(python_tag))
    if pyver >= RuntimeVersion.from_string('3.8'):
        return u"cp{0}{1}".format(pyver.major, pyver.minor)
    else:
        return u"cp{0}{1}m".format(pyver.major, pyver.minor)


def _guess_platform_abi(epd_platform, python_tag):
    """ Guess platform_abi from the given platform and implementation.

    May be None.

    Parameters
    ----------
    epd_platform: EPDPlatform or None
        The platform to guess for
    python_tag: str or None
        e.g. `cp27`.
    """

    if python_tag is None:
        # All our eggs so far have been python 2-only (we don't really care
        # about things < 2.7
        implementation = PythonImplementation.from_string("cp27")
    else:
        implementation = PythonImplementation.from_string(python_tag)

    if epd_platform is None:
        return None
    elif implementation.kind == "python":
        return None
    else:
        implementation_version = "{0}.{1}".format(
            implementation.major, implementation.minor)
        return default_abi(
            epd_platform.platform, implementation.kind, implementation_version)


def _guess_platform_tag(epd_platform):
    """ Guess the platform tag from the given epd_platform.

    Parameters
    ----------
    epd_platform : EPDPlatform or None
    """
    if epd_platform is None:
        return None
    else:
        return epd_platform.pep425_tag


def _guess_python_tag(major_minor):
    """ Compute the python_tag entry from the python value.  The returned value
    may be None.

    Parameters
    ----------
    major_minor : str or None
        The python version in M.N format (e.g. `2.7`)

    Note
    ----
    This should only be used for backward compatiblity reason
    """
    if major_minor in (None, ""):
        return None
    else:
        m = _PYVER_RE.search(major_minor)
        if m is None:
            raise InvalidMetadataField('python', major_minor)
        else:
            major = m.groupdict()["major"]
            minor = m.groupdict()["minor"]

            return u"cp" + major + minor


def _python_tag_to_python(python_tag):
    # This converts only python version we currently intent to support in
    # metadata version 1.x.
    if python_tag is None:
        return None

    generic_exc = InvalidMetadataField('python_tag', python_tag)

    m = _TAG_RE.match(python_tag)
    if m is None:
        raise generic_exc
    else:
        d = m.groupdict()
        version = d["version"]
        if len(version) == 1:
            if version == "2":
                return "2.7"
            else:
                raise generic_exc
        elif len(version) == 2:
            return "{0}.{1}".format(version[0], version[1])
        else:
            raise generic_exc
