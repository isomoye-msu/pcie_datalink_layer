import io
import posixpath
import re

import zipfile2

from attr import attr, attributes
from attr.validators import instance_of, optional

from okonomiyaki.errors import (
    InvalidRequirementString, InvalidRequirementStringHyphen,
    InvalidEggName, InvalidMetadataField,
    MissingMetadata, UnsupportedMetadata)
from okonomiyaki.platforms import (
    EPDPlatform, PlatformABI, PythonABI, PythonImplementation)
from okonomiyaki.utils import (
    compute_sha256, decode_if_needed, parse_assignments)
from okonomiyaki.versions import EnpkgVersion, MetadataVersion
from .legacy import (
    _guess_abi_tag, _guess_platform_abi, _guess_platform_tag, _guess_python_tag)
from ._blacklist import (
    EGG_PLATFORM_BLACK_LIST, EGG_PYTHON_TAG_BLACK_LIST,
    may_be_in_platform_blacklist, may_be_in_python_tag_blacklist,
    may_be_in_pkg_info_blacklist)
from ._package_info import (
    PackageInfo, _convert_if_needed, _keep_position, _read_pkg_info)


_EGG_NAME_RE = re.compile(r"""
    (?P<name>[\.\w]+)
    -
    (?P<version>[^-]+)
    -
    (?P<build>\d+)
    \.egg$""", re.VERBOSE)

EGG_INFO_PREFIX = "EGG-INFO"

# Those may need to be public, depending on how well we can hide their
# locations or not.
_INFO_JSON_LOCATION = posixpath.join(EGG_INFO_PREFIX, "info.json")
_SPEC_DEPEND_LOCATION = posixpath.join(EGG_INFO_PREFIX, "spec", "depend")
_SPEC_LIB_DEPEND_LOCATION = posixpath.join(EGG_INFO_PREFIX, "spec",
                                           "lib-depend")
_SPEC_SUMMARY_LOCATION = posixpath.join(EGG_INFO_PREFIX, "spec", "summary")
_USR_PREFIX_LOCATION = posixpath.join(EGG_INFO_PREFIX, "usr")

_TAG_METADATA_VERSION = "metadata_version"
_TAG_NAME = "name"
_TAG_VERSION = "version"
_TAG_BUILD = "build"
_TAG_ARCH = "arch"
_TAG_OSDIST = "osdist"
_TAG_PLATFORM = "platform"
_TAG_PYTHON = "python"
_TAG_PYTHON_PEP425_TAG = "python_tag"
_TAG_ABI_PEP425_TAG = "abi_tag"
_TAG_PLATFORM_PEP425_TAG = "platform_tag"
_TAG_PLATFORM_ABI = "platform_abi"
_TAG_PACKAGES = "packages"

M = MetadataVersion.from_string

_METADATA_VERSION_TO_KEYS = {
    M("1.1"): (
        _TAG_METADATA_VERSION, _TAG_NAME, _TAG_VERSION, _TAG_BUILD, _TAG_ARCH,
        _TAG_PLATFORM, _TAG_OSDIST, _TAG_PYTHON, _TAG_PACKAGES
    ),
}
_METADATA_VERSION_TO_KEYS[M("1.2")] = \
    _METADATA_VERSION_TO_KEYS[M("1.1")] + (_TAG_PYTHON_PEP425_TAG, )

_METADATA_VERSION_TO_KEYS[M("1.3")] = (
    _METADATA_VERSION_TO_KEYS[M("1.2")]
    + (_TAG_ABI_PEP425_TAG, _TAG_PLATFORM_PEP425_TAG)
)

_METADATA_VERSION_TO_KEYS[M("1.4")] = (
    _METADATA_VERSION_TO_KEYS[M("1.3")] + (_TAG_PLATFORM_ABI, )
)

_UNSUPPORTED = "unsupported"


def _are_compatible(left, right):
    """Return True if both arguments are compatible metadata versions.

    Parameters
    ----------
    left: MetadataVersion
    right: MetadataVersion
    """
    return left.major == right.major


def _highest_compatible(metadata_version):
    """ Returns the highest metadata version supporting that is compatible with
    the given version.
    """
    compatible_versions = [
        m for m in _METADATA_VERSION_TO_KEYS
        if _are_compatible(m, metadata_version)
    ]

    if len(compatible_versions) > 0:
        return max(compatible_versions)
    else:
        raise UnsupportedMetadata(metadata_version)


def split_egg_name(s):
    m = _EGG_NAME_RE.match(s)
    if m is None:
        raise InvalidEggName(s)
    else:
        name, version, build = m.groups()
        return name, version, int(build)


def parse_rawspec(spec_string):
    spec = parse_assignments(io.StringIO(spec_string.replace('\r', '')))

    metadata_version_string = spec.get(_TAG_METADATA_VERSION)
    if metadata_version_string is not None:
        metadata_version = MetadataVersion.from_string(metadata_version_string)
    else:
        metadata_version = None

    if metadata_version is None:
        raise InvalidMetadataField('metadata_version', metadata_version_string)
    elif metadata_version not in _METADATA_VERSION_TO_KEYS:
        metadata_version = _highest_compatible(metadata_version)

    res = {}

    keys = _METADATA_VERSION_TO_KEYS.get(metadata_version)
    for key in keys:
        try:
            res[key] = spec[key]
        except KeyError:
            raise InvalidMetadataField(key, InvalidMetadataField.undefined)

    for k, v in res.items():
        # Some values are not string-like, so filter on the type that needs
        # conversion
        if isinstance(v, bytes):
            res[k] = decode_if_needed(v)

    res[_TAG_PACKAGES] = [decode_if_needed(v) for v in res[_TAG_PACKAGES]]
    return res


def egg_name(name, version, build):
    """
    Return the egg filename (including the .egg extension) for the given
    arguments
    """
    return "{0}-{1}-{2}.egg".format(name, version, build)


def is_egg_name_valid(s):
    """
    Return True if the given string is a valid egg name (not including the
    .egg, e.g. 'Qt-4.8.5-2')
    """
    return _EGG_NAME_RE.match(s) is not None


_INVALID_REQUIREMENTS = {
    u"numpy-1.8.0": u"numpy 1.8.0",
}


def _translate_invalid_requirement(s):
    return _INVALID_REQUIREMENTS.get(s, s)


def text_attr(**kw):
    """ An attrs.attr-like descriptor to describe fields that must be unicode.
    """
    for k in ("validator", ):
        if k in kw:
            raise ValueError("Cannot pass '{0}' argument".format(k))
    return attr(validator=instance_of(str), **kw)


def text_or_none_attr(**kw):
    """ An attrs.attr-like descriptor to describe fields that must be unicode
    or None.
    """
    for k in ("validator", ):
        if k in kw:
            raise ValueError("Cannot pass '{0}' argument".format(k))
    return attr(validator=optional(instance_of(str)), **kw)


@attributes(frozen=True)
class Requirement(object):
    """
    Model for entries in the package metadata inside EGG-INFO/spec/depend
    """
    name = text_attr(default=u"")
    version_string = text_attr(default=u"")
    build_number = attr(-1, validator=instance_of(int))

    @property
    def strictness(self):
        if len(self.version_string) == 0:
            return 1
        elif self.build_number < 0:
            return 2
        else:
            return 3

    @classmethod
    def from_string(cls, s, strictness=2):
        """
        Create a Requirement from string following a name-version-build
        format.

        Parameters
        ----------
        s: text type
            Egg name, e.g. u'Qt-4.8.5-2'.
        strictness: int
            Control strictness of string representation
        """
        name, version, build = split_egg_name(u"{0}.egg".format(s))
        if strictness >= 3:
            build_number = build
        else:
            build_number = -1

        if strictness >= 2:
            version_string = version
        else:
            version_string = u""

        return cls(name=name, version_string=version_string,
                   build_number=build_number)

    @classmethod
    def from_spec_string(cls, s):
        """
        Create a Requirement from a spec string (as used in
        EGG-INFO/spec/depend).
        """
        s = _translate_invalid_requirement(s)
        parts = s.split()
        if len(parts) == 1:
            name = parts[0]
            if "-" in name:
                raise InvalidRequirementStringHyphen(name)
            return cls(name=name)
        elif len(parts) == 2:
            name, version = parts
            parts = version.split("-")
            if len(parts) == 2:
                upstream, build_number = parts
                build_number = int(build_number)
            else:
                upstream, build_number = version, -1
            return cls(name=name, version_string=upstream,
                       build_number=build_number)
        else:
            raise InvalidRequirementString(name)

    def __str__(self):
        if len(self.version_string) > 0:
            if self.build_number > 0:
                return u"{0} {1}-{2}".format(
                    self.name, self.version_string, self.build_number
                )
            else:
                return u"{0} {1}".format(self.name, self.version_string)
        else:
            return self.name


_METADATA_TEMPLATES = {
    M("1.1"): """\
metadata_version = '1.1'
name = {name!r}
version = {version!r}
build = {build}

arch = {arch!r}
platform = {platform!r}
osdist = {osdist!r}
python = {python!r}
packages = {packages}
""",
    M("1.2"): """\
metadata_version = '1.2'
name = {name!r}
version = {version!r}
build = {build}

arch = {arch!r}
platform = {platform!r}
osdist = {osdist!r}
python = {python!r}
python_tag = {python_tag!r}
packages = {packages}
""",
    M("1.3"): """\
metadata_version = '1.3'
name = {name!r}
version = {version!r}
build = {build}

arch = {arch!r}
platform = {platform!r}
osdist = {osdist!r}
python = {python!r}

python_tag = {python_tag!r}
abi_tag = {abi_tag!r}
platform_tag = {platform_tag!r}

packages = {packages}
""",
    M("1.4"): """\
metadata_version = '1.4'
name = {name!r}
version = {version!r}
build = {build}

arch = {arch!r}
platform = {platform!r}
osdist = {osdist!r}
python = {python!r}

python_tag = {python_tag!r}
abi_tag = {abi_tag!r}
platform_tag = {platform_tag!r}

platform_abi = {platform_abi!r}

packages = {packages}
"""
}


_METADATA_DEFAULT_VERSION_STRING = "1.4"
_METADATA_DEFAULT_VERSION = M(_METADATA_DEFAULT_VERSION_STRING)


def _epd_platform_from_raw_spec(raw_spec):
    """ Create an EPDPlatform instance from the metadata info returned by
    parse_rawspec.

    if no platform is defined ('platform' and 'osdist' set to None), then
    None is returned.
    """
    platform = raw_spec[_TAG_PLATFORM]
    osdist = raw_spec[_TAG_OSDIST]
    if platform is None and osdist is None:
        return None
    else:
        return EPDPlatform._from_spec_depend_data(
            platform=platform,
            osdist=osdist,
            arch_name=raw_spec[_TAG_ARCH],
            platform_abi=raw_spec.get(_TAG_PLATFORM_ABI, 'None'),
            platform_tag=raw_spec.get(_TAG_PLATFORM_PEP425_TAG, 'None'),
            python_version=raw_spec[_TAG_PYTHON])


@attributes
class LegacySpecDepend(object):
    """
    This models the EGG-INFO/spec/depend content.
    """
    # Name is taken from egg path, so may be upper case
    name = text_attr()
    """
    Egg name
    """

    version = text_attr()
    """
    Upstream version (as a string).
    """

    build = attr(validator=instance_of(int))
    """
    Build number
    """

    python = text_or_none_attr()
    """
    Python version
    """

    python_tag = text_or_none_attr()
    """
    Python tag (as defined in PEP 425).
    """

    abi_tag = text_or_none_attr()
    """
    ABI tag (as defined in PEP 425), except that 'none' is None.
    """

    platform_tag = text_or_none_attr()
    """
    Platform tag (as defined in PEP 425), except that 'any' is None.
    """

    platform_abi = text_or_none_attr()
    """
    Platform abi. None if no abi.
    """

    packages = attr(validator=instance_of(list))
    """
    List of dependencies for this egg
    """

    _epd_platform = attr(validator=optional(instance_of(EPDPlatform)))
    _metadata_version = attr(validator=instance_of(MetadataVersion))

    @classmethod
    def _from_data(cls, data, epd_platform):
        args = data.copy()
        args[_TAG_METADATA_VERSION] = M(
            args.get(_TAG_METADATA_VERSION, _METADATA_DEFAULT_VERSION_STRING))
        args[_TAG_PACKAGES] = [
            Requirement.from_spec_string(s)
            for s in args.get(_TAG_PACKAGES, [])]

        return cls(
            args["name"],
            args["version"],
            args["build"],
            args["python"],
            args["python_tag"],
            args["abi_tag"],
            args["platform_tag"],
            args["platform_abi"],
            args["packages"],
            epd_platform,
            args["metadata_version"],
        )

    @classmethod
    def from_egg(cls, path_or_file):
        sha256 = None
        if isinstance(path_or_file, str):
            if (
                may_be_in_platform_blacklist(path_or_file)
                or may_be_in_python_tag_blacklist(path_or_file)
            ):
                sha256 = compute_sha256(path_or_file)
        else:
            with _keep_position(path_or_file.fp):
                sha256 = compute_sha256(path_or_file.fp)
        return cls._from_egg(path_or_file, sha256)

    @classmethod
    def _from_egg(cls, path_or_file, sha256):
        def _create_spec_depend(zp):
            epd_platform_string = EGG_PLATFORM_BLACK_LIST.get(sha256)
            if epd_platform_string is None:
                epd_platform = None
            else:
                epd_platform = EPDPlatform.from_epd_string(epd_platform_string)

            try:
                spec_depend_string = zp.read(_SPEC_DEPEND_LOCATION).decode()
            except KeyError:
                msg = ("File {0!r} is not an Enthought egg (is missing {1})"
                       .format(path_or_file, _SPEC_DEPEND_LOCATION))
                raise MissingMetadata(msg)
            else:
                data, epd_platform = _normalized_info_from_string(
                    spec_depend_string, epd_platform, sha256
                )
                return cls._from_data(data, epd_platform)

        if isinstance(path_or_file, str):
            with zipfile2.ZipFile(path_or_file) as zp:
                return _create_spec_depend(zp)
        else:
            return _create_spec_depend(path_or_file)

    @classmethod
    def from_string(cls, spec_depend_string):
        data, epd_platform = _normalized_info_from_string(spec_depend_string)
        return cls._from_data(data, epd_platform)

    @property
    def arch(self):
        """
        Egg architecture.
        """
        epd_platform = self._epd_platform
        if epd_platform is None:
            return None
        else:
            return epd_platform.arch._legacy_name

    @property
    def egg_name(self):
        """
        Full egg name (including .egg extension).
        """
        return egg_name(self.name, self.version, self.build)

    @property
    def osdist(self):
        epd_platform = self._epd_platform
        if epd_platform is None:
            return None
        name = epd_platform.platform_name
        if name in ('osx', 'win'):
            return None
        elif name == 'sol':
            return 'Solaris 10'
        elif name.startswith('rh'):
            return 'RedHat_{}'.format(name[2:])

    @property
    def platform(self):
        """
        The legacy platform name (sys.platform).
        """
        epd_platform = self._epd_platform
        if epd_platform is None:
            return None
        name = epd_platform.platform_name
        if name == 'osx':
            return 'darwin'
        elif name == 'win':
            return 'win32'
        elif name == 'sol':
            return 'sunos5'
        elif name.startswith('rh'):
            return 'linux2'

    @property
    def metadata_version(self):
        return self._metadata_version

    @metadata_version.setter
    def metadata_version(self, value):
        self._metadata_version = value

    def _to_dict(self):
        raw_data = {
            _TAG_NAME: self.name,
            _TAG_VERSION: self.version,
            _TAG_BUILD: self.build,
            _TAG_ARCH: self.arch,
            _TAG_PLATFORM: self.platform,
            _TAG_OSDIST: self.osdist,
            _TAG_PACKAGES: [str(p) for p in self.packages],
            _TAG_PYTHON: self.python,
            _TAG_PYTHON_PEP425_TAG: self.python_tag,
            _TAG_ABI_PEP425_TAG: self.abi_tag,
            _TAG_PLATFORM_PEP425_TAG: self.platform_tag,
            _TAG_PLATFORM_ABI: self.platform_abi,
            _TAG_METADATA_VERSION: self.metadata_version
        }

        return raw_data

    def to_string(self):
        """
        Returns a string that is suitable for the depend file inside our
        legacy egg.
        """
        template = _METADATA_TEMPLATES.get(self.metadata_version, None)
        data = self._to_dict()

        # This is just to ensure the exact same string as the produced by the
        # legacy buildsystem
        if len(self.packages) == 0:
            data[_TAG_PACKAGES] = "[]"
        else:
            packages = self.packages
            data[_TAG_PACKAGES] = (
                u"[\n{0}\n]".format(
                    "\n".join("  '{0}',".format(p) for p in packages)
                )
            )
        return template.format(**data)


class Dependencies(object):
    """ Object storing the various dependencies for an egg.

    Each attribute is a tuple of Requirement instances.
    """
    def __init__(self, runtime=None, build=None):
        self.runtime = runtime or ()
        self.build = runtime or ()


def _metadata_version_to_tuple(metadata_version):
    """ Convert a metadata version string to a tuple for comparison."""
    return tuple(int(s) for s in metadata_version.split("."))


def _normalized_info_from_string(spec_depend_string, epd_platform=None,
                                 sha256=None):
    """ Return a 'normalized' dictionary from the given spec/depend string.

    Note: the name value is NOT lower-cased, so that the egg filename may
    rebuilt from the data.
    """
    raw_data = parse_rawspec(spec_depend_string)

    data = {}
    for k in (_TAG_METADATA_VERSION,
              _TAG_NAME, _TAG_VERSION, _TAG_BUILD,
              _TAG_ARCH, _TAG_OSDIST, _TAG_PLATFORM,
              _TAG_PYTHON, _TAG_PACKAGES):
        data[k] = raw_data[k]

    epd_platform = epd_platform or _epd_platform_from_raw_spec(raw_data)

    for k in (_TAG_ARCH, _TAG_PLATFORM, _TAG_OSDIST):
        data.pop(k)

    metadata_version = MetadataVersion.from_string(data[_TAG_METADATA_VERSION])

    python_tag = EGG_PYTHON_TAG_BLACK_LIST.get(sha256)
    if python_tag:
        data[_TAG_PYTHON_PEP425_TAG] = python_tag
    else:
        if metadata_version < M("1.2"):
            data[_TAG_PYTHON_PEP425_TAG] = _guess_python_tag(
                raw_data[_TAG_PYTHON])
        else:
            data[_TAG_PYTHON_PEP425_TAG] = raw_data[_TAG_PYTHON_PEP425_TAG]

    if metadata_version < M("1.3"):
        python_tag = data[_TAG_PYTHON_PEP425_TAG]
        data[_TAG_ABI_PEP425_TAG] = _guess_abi_tag(epd_platform, python_tag)
        data[_TAG_PLATFORM_PEP425_TAG] = _guess_platform_tag(epd_platform)
    else:
        data[_TAG_ABI_PEP425_TAG] = raw_data[_TAG_ABI_PEP425_TAG]
        data[_TAG_PLATFORM_PEP425_TAG] = raw_data[_TAG_PLATFORM_PEP425_TAG]

    if metadata_version < M("1.4"):
        python_tag = data[_TAG_PYTHON_PEP425_TAG]
        platform_abi = _guess_platform_abi(epd_platform, python_tag)
    else:
        platform_abi = raw_data[_TAG_PLATFORM_ABI]
    data[_TAG_PLATFORM_ABI] = platform_abi

    return data, epd_platform


_JSON_METADATA_VERSION = "metadata_version"
_JSON__RAW_NAME = "_raw_name"
_JSON_VERSION = "version"
_JSON_EPD_PLATFORM = "epd_platform"
_JSON_PYTHON_TAG = "python_tag"
_JSON_ABI_TAG = "abi_tag"
_JSON_PLATFORM_TAG = "platform_tag"
_JSON_PLATFORM_ABI_TAG = "platform_abi_tag"
_JSON_RUNTIME_DEPENDENCIES = "runtime_dependencies"
_JSON_SUMMARY = "summary"


class EggMetadata(object):
    """ Enthought egg metadata for format 1.x.
    """

    HIGHEST_SUPPORTED_METADATA_VERSION = _METADATA_DEFAULT_VERSION
    """ Highest supported metadata version (as a MetadataVersion object).

    If the parsed metadata is higher, it will not be possible to write back
    the metadata. If the parsed metadata version is not compatible (different
    major version), then parsing will raise an UnsupportedMetadata exception as
    well.
    """

    @staticmethod
    def _may_be_in_blacklist(path):
        return (
            may_be_in_platform_blacklist(path)
            or may_be_in_pkg_info_blacklist(path)
            or may_be_in_python_tag_blacklist(path)
        )

    @classmethod
    def from_egg(cls, path_or_file, strict=True):
        """ Create a EggMetadata instance from an existing Enthought egg.

        Parameters
        ----------
        path: str or file-like object.
            If a string, understood as the path to the egg. Otherwise,
            understood as a zipfile-like object.
        strict: bool
            If True, will fail if metadata cannot be decoded correctly (e.g.
            unicode errors in EGG-INFO/PKG-INFO). If false, will ignore those
            errors, at the risk of data loss.
        """
        sha256 = None
        if isinstance(path_or_file, str):
            if cls._may_be_in_blacklist(path_or_file):
                sha256 = compute_sha256(path_or_file)
        else:
            with _keep_position(path_or_file.fp):
                sha256 = compute_sha256(path_or_file.fp)
        return cls._from_egg(path_or_file, sha256, strict)

    @classmethod
    def from_json_dict(cls, json_dict, pkg_info):
        version = EnpkgVersion.from_string(json_dict[_JSON_VERSION])

        if json_dict[_JSON_PYTHON_TAG] is not None:
            python = PythonImplementation.from_string(json_dict[_JSON_PYTHON_TAG])
        else:
            python = None

        if json_dict[_JSON_EPD_PLATFORM] is None:
            epd_platform = None
        else:
            epd_platform = EPDPlatform.from_epd_string(json_dict[_JSON_EPD_PLATFORM])

        dependencies = Dependencies(tuple(json_dict[_JSON_RUNTIME_DEPENDENCIES]))
        metadata_version = MetadataVersion.from_string(
            json_dict[_JSON_METADATA_VERSION]
        )

        return cls(
            json_dict[_JSON__RAW_NAME], version, epd_platform, python,
            json_dict[_JSON_ABI_TAG], json_dict[_JSON_PLATFORM_ABI_TAG],
            dependencies, pkg_info, json_dict[_JSON_SUMMARY],
            metadata_version=metadata_version
        )

    @classmethod
    def _from_egg(cls, path_or_file, sha256, strict=True):
        def _read_summary(fp):
            summary_arcname = "EGG-INFO/spec/summary"
            try:
                summary = fp.read(summary_arcname)
            except KeyError:
                # the summary file may not exist for eggs built with
                # endist/repack
                summary = b""
            return summary.decode("utf8")

        def _compute_all_metadata(fp):
            summary = _read_summary(fp)
            pkg_info_data = _read_pkg_info(fp)
            if pkg_info_data is None:
                pkg_info_string = None
            else:
                pkg_info_string = _convert_if_needed(
                    pkg_info_data, sha256, strict
                )

            spec_depend = LegacySpecDepend._from_egg(fp, sha256)

            return summary, pkg_info_string, spec_depend

        if isinstance(path_or_file, str):
            with zipfile2.ZipFile(path_or_file) as zp:
                summary, pkg_info_string, spec_depend = _compute_all_metadata(zp)
        else:
            summary, pkg_info_string, spec_depend = _compute_all_metadata(
                path_or_file
            )

        return cls._from_spec_depend(spec_depend, pkg_info_string, summary)

    @classmethod
    def _from_spec_depend(cls, spec_depend, pkg_info, summary,
                          metadata_version=None):
        raw_name = spec_depend.name
        version = EnpkgVersion.from_upstream_and_build(
            spec_depend.version, spec_depend.build)
        python_tag = spec_depend.python_tag
        abi_tag = spec_depend.abi_tag
        platform_abi = spec_depend.platform_abi
        epd_platform = spec_depend._epd_platform
        dependencies = Dependencies(
            tuple(dep for dep in spec_depend.packages))
        metadata_version = metadata_version or spec_depend.metadata_version
        return cls(raw_name, version, epd_platform, python_tag, abi_tag,
                   platform_abi, dependencies, pkg_info, summary,
                   metadata_version)

    @classmethod
    def from_egg_metadata(cls, egg_metadata, **kw):
        """ Utility ctor to create a new EggMetadata instance from an existing
        one, potentially updating some metadata.

        Any keyword argument (except `egg_metadata`) is understood as an
        argument to EggMetadata.__init__.

        Parameters
        ----------
        egg_metadata: EggMetadata
        """
        passed_kw = {"raw_name": egg_metadata._raw_name}

        for k in (
            "version", "platform", "python", "abi_tag", "pkg_info", "summary",
            "metadata_version", "platform_abi",
        ):
            passed_kw[k] = getattr(egg_metadata, k)
        passed_kw["dependencies"] = Dependencies(
            egg_metadata.runtime_dependencies
        )

        passed_kw.update(**kw)

        return cls(**passed_kw)

    def __init__(self, raw_name, version, platform, python, abi_tag,
                 platform_abi, dependencies, pkg_info, summary,
                 metadata_version=None):
        """ EggMetadata instances encompass Enthought egg metadata.

        Note: the constructor is considered private, please use one of the
        from_* class methods.

        Parameters
        ----------
        raw_name: str
            The 'raw' name, i.e. the name value in spec/depend.
        version: EnpkgVersion
            The full version
        platform: EPDPlatform
            An EPDPlatform instance, or None for cross-platform eggs
        python: Python
            The python implementation
        abi_tag: str
            The ABI tag, e.g. 'cp27m'. May be None.
        platform_abi: str
            The platform abi, e.g. 'msvc2008', 'gnu', etc. May be None.
        dependencies: Dependencies
            A Dependencies instance.
        pkg_info: PackageInfo or str or None
            Instance modeling the PKG-INFO content of the egg. If a string is
            passed, it is assumed to be the PKG-INFO content, and is lazily
            parsed into a PackageInfo when pkg_info is accessed for the first
            time.
        summary: str
            The summary. Models the string in EGG-INFO/spec/summary. May
            be empty.
        """
        self._raw_name = raw_name
        self.version = version
        """ The version, as an EnpkgVersion instance."""

        self.platform = platform
        """ The platform, as a Platform instance."""

        if isinstance(python, str):
            python = PythonImplementation.from_string(python)
        self.python = python
        """ The python implementation."""

        if abi_tag is not None and isinstance(abi_tag, str):
            abi_tag = PythonABI(abi_tag)

        self.abi = abi_tag
        """ The ABI tag, following the PEP425 format, except that no ABI
        is sorted as None."""

        if (
                platform_abi is not None
                and isinstance(platform_abi, str)):
            platform_abi = PlatformABI(platform_abi)
        self.platform_abi = platform_abi

        self.runtime_dependencies = tuple(dependencies.runtime)
        """ List of runtime dependencies (as strings)."""

        self.metadata_version = metadata_version or _METADATA_DEFAULT_VERSION
        """ The version format of the underlying metadata."""

        self._pkg_info = pkg_info
        """ A PackageInfo instance modeling the underlying PKG-INFO. May
        be None for eggs without an PKG-INFO file."""

        self.summary = summary
        """ The summary string."""

    @property
    def abi_tag(self):
        if self.abi is None:
            return None
        else:
            return self.abi.pep425_tag

    @property
    def abi_tag_string(self):
        return PythonABI.pep425_tag_string(self.abi)

    @property
    def build(self):
        """ The build number."""
        return self.version.build

    @property
    def egg_basename(self):
        """ The egg "base name", i.e. the name part of the egg filename."""
        return self._raw_name

    @property
    def egg_name(self):
        """ The egg filename."""
        return self._spec_depend.egg_name

    @property
    def is_strictly_supported(self):
        """ Returns True if the given metadata_version is fully supported.

        A metadata_version is fully supported iff:
            - metadata_version.major ==
              EggMetadata.HIGHEST_SUPPORTED_METADATA_VERSION.major
            - and metadata_version.minor <=
              EggMetadata.HIGHEST_SUPPORTED_METADATA_VERSION.minor
        """
        max_supported = EggMetadata.HIGHEST_SUPPORTED_METADATA_VERSION
        return (
            _are_compatible(self.metadata_version, max_supported)
            and self.metadata_version.minor <= max_supported.minor
        )

    @property
    def kind(self):
        return "egg"

    @property
    def name(self):
        """ The package name."""
        return self._raw_name.lower().replace("-", "_")

    @property
    def pkg_info(self):
        if isinstance(self._pkg_info, str):
            self._pkg_info = PackageInfo.from_string(self._pkg_info)
        return self._pkg_info

    @property
    def platform_abi_tag(self):
        if self.platform_abi is None:
            return None
        else:
            return self.platform_abi.pep425_tag

    @property
    def platform_abi_tag_string(self):
        return PlatformABI.pep425_tag_string(self.platform_abi)

    @property
    def platform_tag(self):
        """ Platform tag following PEP425, except that no platform is
        represented as None and not 'any'."""
        if self.platform is None:
            return None
        else:
            return self.platform.pep425_tag

    @property
    def platform_tag_string(self):
        return EPDPlatform.pep425_tag_string(self.platform)

    @property
    def python_tag(self):
        if self.python is None:
            return None
        else:
            return self.python.pep425_tag

    @property
    def python_tag_string(self):
        return PythonImplementation.pep425_tag_string(self.python)

    @property
    def spec_depend_string(self):
        return self._spec_depend.to_string()

    @property
    def upstream_version(self):
        return str(self.version.upstream)

    @property
    def _python(self):
        if self.python is None:
            return None
        else:
            return u"{0}.{1}".format(self.python.major, self.python.minor)

    @property
    def _spec_depend(self):
        if not self.is_strictly_supported:
            msg = "Cannot write back metadata with unsupported version {0!r}"
            raise UnsupportedMetadata(
                self.metadata_version, msg.format(str(self.metadata_version))
            )
        args = {
            "name": self._raw_name,
            "version": self.upstream_version,
            "build": self.build,
            "python": self._python,
            "python_tag": self.python_tag,
            "abi_tag": self.abi_tag,
            "platform_tag": self.platform_tag,
            "platform_abi": self.platform_abi_tag,
            "packages": [str(p) for p in self.runtime_dependencies],
            "metadata_version": str(self.metadata_version),
        }
        return LegacySpecDepend._from_data(args, self.platform)

    # Public methods
    def dump(self, path):
        """ Write the metadata to the given path as a metadata egg.

        A metadata egg is a zipfile using the same structured as an egg, except
        that it only contains metadata.

        Parameters
        ----------
        path : str
            The path to write the zipped metadata into.
        """
        with zipfile2.ZipFile(path, "w", zipfile2.ZIP_DEFLATED) as zp:
            zp.writestr(
                _SPEC_DEPEND_LOCATION, self.spec_depend_string.encode())
            zp.writestr(
                _SPEC_SUMMARY_LOCATION, self.summary.encode())
            if self.pkg_info:
                self.pkg_info._dump_as_zip(zp)

    def to_json_dict(self):
        if self.platform is None:
            epd_platform = None
        else:
            epd_platform = str(self.platform)

        return {
            _JSON_METADATA_VERSION: str(self.metadata_version),
            _JSON__RAW_NAME: self._raw_name,
            _JSON_VERSION: str(self.version),
            _JSON_EPD_PLATFORM: epd_platform,
            _JSON_PYTHON_TAG: self.python_tag,
            _JSON_ABI_TAG: self.abi_tag,
            _JSON_PLATFORM_TAG: self.platform_tag,
            _JSON_PLATFORM_ABI_TAG: self.platform_abi_tag,
            _JSON_RUNTIME_DEPENDENCIES: [
                str(p) for p in self.runtime_dependencies],
            _JSON_SUMMARY: self.summary}

    # Protocol implementations
    def __eq__(self, other):
        if isinstance(other, self.__class__):
            return (
                self.spec_depend_string == other.spec_depend_string
                and self.summary == other.summary
                and self.pkg_info == other.pkg_info)
        else:
            raise TypeError(
                "Only equality between EggMetadata instances is supported")

    def __ne__(self, other):
        return not self == other
