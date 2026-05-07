"""
Most of the code below is adapted from pkg-info 1.2.1

We support 1.0, 1.1, 1.2, 2.0, 2.1, 2.2, 2.3, 2.4
"""
import contextlib
import io
import os
import os.path
import warnings
import textwrap

import zipfile2

from okonomiyaki.utils import compute_sha256
from okonomiyaki.errors import OkonomiyakiError
from ._blacklist import EGG_PKG_INFO_BLACK_LIST, may_be_in_pkg_info_blacklist
from ._wheel_info import WheelInfo


_PKG_INFO_LOCATION = "EGG-INFO/PKG-INFO"
_PKG_INFO_CANDIDATES = (
    _PKG_INFO_LOCATION,
    "EGG-INFO/PKG-INFO.bak",
)

PKG_INFO_ENCODING = 'utf-8'

HEADER_ATTRS_1_0 = (  # PEP 241
    ('Metadata-Version', 'metadata_version', False),
    ('Name', 'name', False),
    ('Version', 'version', False),
    ('Platform', 'platform', True),
    ('Supported-Platform', 'supported_platform', True),
    ('Summary', 'summary', False),
    ('Description', 'description', False),
    ('Keywords', 'keywords', False),
    ('Home-Page', 'home_page', False),
    ('Author', 'author', False),
    ('Author-email', 'author_email', False),
    ('License', 'license', False),
)

HEADER_ATTRS_1_1 = HEADER_ATTRS_1_0 + (  # PEP 314
    ('Classifier', 'classifiers', True),
    ('Download-URL', 'download_url', False),
    ('Requires', 'requires', True),
    ('Provides', 'provides', True),
    ('Obsoletes', 'obsoletes', True),
)

HEADER_ATTRS_1_2 = HEADER_ATTRS_1_1 + (  # PEP 345
    ('Maintainer', 'maintainer', False),
    ('Maintainer-email', 'maintainer_email', False),
    ('Requires-Python', 'requires_python', False),
    ('Requires-External', 'requires_external', True),
    ('Requires-Dist', 'requires_dist', True),
    ('Provides-Dist', 'provides_dist', True),
    ('Obsoletes-Dist', 'obsoletes_dist', True),
    ('Project-URL', 'project_urls', True),
)

# 2.0 not formalized, but seen in wheels produced by wheel as recent as 0.30.0.
# See PEP 426, and the PyPI pkginfo project.
# According to PEP 426, version 2.0 has now been withdrawn in favor of version 2.1.
HEADER_ATTRS_2_0 = HEADER_ATTRS_1_2

HEADER_ATTRS_2_1 = HEADER_ATTRS_1_2 + (  # PEP 566
    ('Description-Content-Type', 'description_content_type', False),
    ('Provides-Extra', 'provides_extra', True),
    # Setuptools is broken and produces License-File for metadata >= 2.1
    # Note that we parse the info in but will not export it unless
    # metadata is 2.4
    ('License-File', 'license_file', True),
)

HEADER_ATTRS_2_2 = HEADER_ATTRS_2_1 + (  # PEP 643
    ('Dynamic', 'dynamic', True),)

HEADER_ATTRS_2_3 = HEADER_ATTRS_2_2  # PEP 685

HEADER_ATTRS_2_4 = HEADER_ATTRS_2_2 + (  # PEP 639
    ('License-Expression', 'license_expression', False),)

HEADER_ATTRS = {
    (1, 0): HEADER_ATTRS_1_0,
    (1, 1): HEADER_ATTRS_1_1,
    (1, 2): HEADER_ATTRS_1_2,
    (2, 0): HEADER_ATTRS_2_0,
    (2, 1): HEADER_ATTRS_2_1,
    (2, 2): HEADER_ATTRS_2_2,
    (2, 3): HEADER_ATTRS_2_3,
    (2, 4): HEADER_ATTRS_2_4,
}


MAX_SUPPORTED_VERSION = max(HEADER_ATTRS.keys())


class PackageInfo(object):
    """ Class modeling the PKG-INFO content.
    """
    @classmethod
    def from_path(cls, path, strict=True):
        if path.endswith(".egg"):
            return cls.from_egg(path, strict)
        elif path.endswith(".whl"):
            return cls.from_wheel(path, strict)
        else:
            raise OkonomiyakiError(
                u"Unrecognized package extension: '{}'".format(
                    os.path.splitext(path)[1]
                )
            )

    @classmethod
    def from_wheel(cls, path_or_file, strict=True):
        if isinstance(path_or_file, str):
            wheel_info = WheelInfo.from_path(path_or_file)

            with zipfile2.ZipFile(path_or_file) as fp:
                data = _read_pkg_info_wheel(fp, (wheel_info.name, wheel_info.version))
        else:
            # path_or_file assumed to be a ZipFile instance
            data = _read_pkg_info_wheel(path_or_file)

        if data is None:
            msg = "No METADATA archive found in wheel file"
            raise OkonomiyakiError(msg)

        data = _convert_if_needed(data, None, strict)
        return cls.from_string(data)

    @classmethod
    def from_egg(cls, path_or_file, strict=True):
        """ Create a PackageInfo instance from an existing egg.

        Parameters
        ----------
        path: str or file-like object.
            If a string, understood as the path to the egg. Otherwise,
            understood as a zipfile-like object.
        """
        sha256 = None
        if isinstance(path_or_file, str):
            if may_be_in_pkg_info_blacklist(path_or_file):
                sha256 = compute_sha256(path_or_file)
        else:
            with _keep_position(path_or_file.fp):
                sha256 = compute_sha256(path_or_file.fp)
        return cls._from_egg(path_or_file, sha256, strict)

    @classmethod
    def _from_egg(cls, path_or_file, sha256, strict=True):
        if isinstance(path_or_file, str):
            with zipfile2.ZipFile(path_or_file) as fp:
                data = _read_pkg_info(fp)
        else:
            data = _read_pkg_info(path_or_file)

        if data is None:
            msg = "No PKG-INFO metadata found"
            raise OkonomiyakiError(msg)

        data = _convert_if_needed(data, sha256, strict)
        return cls.from_string(data)

    @classmethod
    def from_string(cls, s):
        if not isinstance(s, str):
            raise ValueError("Expected text value, got {0!r}".format(type(s)))
        fp = io.StringIO(s)
        msg = _parse(fp)
        kw = {}

        if 'Metadata-Version' in msg:
            metadata_version = _get(msg, 'Metadata-Version')
        else:
            metadata_version = "2.1"  # Default metadata version

        _ensure_supported_version(metadata_version)
        metadata_version_info = _string_to_version_info(metadata_version)
        attributes = HEADER_ATTRS[metadata_version_info]

        for header_name, attr_name, multiple in attributes:
            if attr_name == 'metadata_version':
                continue

            if header_name in msg:
                if header_name == "Keywords":
                    if msg != "UNKNOWN":
                        value = _collapse_leading_ws(
                            header_name, msg.get(header_name))
                        kw[attr_name] = tuple(value.split())
                elif multiple:
                    values = _get_all(msg, header_name)
                    if values != ["UNKNOWN"]:
                        kw[attr_name] = values
                else:
                    value = _get(msg, header_name)
                    if value != 'UNKNOWN':
                        kw[attr_name] = value

        if metadata_version_info >= (2, 1):
            msg_body = msg.get_payload()
            if msg_body is not None and msg_body != '':
                if 'description' in kw:
                    warnings.warn(
                        'Description defined with header and in body '
                        'of metadata. Using description with header.',
                        RuntimeWarning
                    )
                else:
                    kw['description'] = msg_body

        if metadata_version_info >= (2, 4):
            if 'License' in kw and 'License-Expression' in kw:
                warnings.warn(
                    'As of Metadata 2.4, License and License-Expression are mutually exclusive. '
                    'License field is ignored',
                    RuntimeWarning)
                del kw['License']
        elif 'License-File' in kw:
            warnings.warn(
                'License-File was introduced in Metadata 2.4. '
                'The value is parsed because setuptools adds it to Metadata 2.1. '
                'The field will not be exported unless export Metadata >= 2.4')

        name = kw.pop("name")
        version = kw.pop("version")
        return cls(metadata_version, name, version, **kw)

    def __init__(
            self, metadata_version, name, version, platform=None,
            supported_platform=None, summary="", description="",
            keywords=None, home_page="", download_url="", author="",
            author_email="", license="", classifiers=None, requires=None,
            provides=None, obsoletes=None, maintainer="",
            maintainer_email="", requires_python=None,
            requires_external=None, requires_dist=None,
            provides_dist=None, obsoletes_dist=None, project_urls=None,
            description_content_type="", provides_extra=None,
            dynamic=None, license_file=None, license_expression=None):
        _ensure_supported_version(metadata_version)

        self.metadata_version = metadata_version

        # version 1.0
        self.name = name
        self.version = str(version)
        self.platform = platform or ()
        self.supported_platform = supported_platform or ()
        self.summary = summary
        self.description = description
        self.keywords = keywords or ()
        self.home_page = home_page
        self.download_url = download_url
        self.author = author
        self.author_email = author_email
        self.license = license

        # version 1.1
        self.classifiers = classifiers or ()
        self.requires = requires or ()
        self.provides = provides or ()
        self.obsoletes = obsoletes or ()

        # version 1.2
        self.maintainer = maintainer or ""
        self.maintainer_email = maintainer_email or ""
        self.requires_python = requires_python or ()
        self.requires_external = requires_external or ()
        self.requires_dist = requires_dist or ()
        self.provides_dist = provides_dist or ()
        self.obsoletes_dist = obsoletes_dist or ()
        self.project_urls = project_urls or ()

        # version 2.1
        self.description_content_type = description_content_type or ""
        self.provides_extra = provides_extra or ()

        # version 2.2
        self.dynamic = dynamic or ()

        # version 2.4
        self.license_file = license_file or ()
        self.license_expression = license_expression or ()

    def to_string(self, metadata_version_info=None, description_field=True):
        if metadata_version_info is None:
            metadata_version = self.metadata_version
            metadata_version_info = _string_to_version_info(self.metadata_version)
        else:
            metadata_version = '.'.join(str(_) for _ in metadata_version_info)
            _ensure_supported_version(metadata_version)

        s = io.StringIO()
        self._write_field(s, 'Metadata-Version', metadata_version)
        self._write_field(s, 'Name', self.name)
        self._write_field(s, 'Version', self.version)
        self._write_field(s, 'Summary', self.summary)
        self._write_field(s, 'Home-page', self.home_page)
        self._write_field(s, 'Author', self.author)
        self._write_field(s, 'Author-email', self.author_email)

        if metadata_version_info >= (1, 2):
            if self.maintainer:
                self._write_field(s, 'Maintainer', self.maintainer)
            if self.maintainer_email:
                self._write_field(s, 'Maintainer-email', self.maintainer_email)

        self._write_field(s, 'License', self.license)

        if metadata_version_info >= (1, 1):
            self._write_field(s, 'Download-URL', self.download_url)

        if metadata_version_info >= (1, 2):
            self._write_list(s, 'Project-URL', self.project_urls)

        if metadata_version_info >= (2, 1):
            self._write_field(s, 'Description-Content-Type', self.description_content_type)

        description = _rfc822_escape(self.description)
        if description_field:
            # Description as a metadata field
            self._write_field(s, 'Description', description)

        keywords = ' '.join(self.keywords)
        if keywords:
            self._write_field(s, 'Keywords', keywords)
        self._write_list(s, 'Platform', self.platform)
        self._write_list(s, 'Supported Platforms', self.supported_platform)

        if metadata_version_info >= (1, 1):
            self._write_list(s, 'Classifier', self.classifiers)

        if metadata_version_info == (1, 1):
            # These fields are deprecated in 1.2
            # and changed to the corresponding field names in section below.
            self._write_list(s, 'Requires', self.requires)
            self._write_list(s, 'Provides', self.provides)
            self._write_list(s, 'Obsoletes', self.obsoletes)

        elif metadata_version_info >= (1, 2):
            self._write_field(s, 'Requires-Python', self.requires_python)
            self._write_list(s, 'Requires-External', self.requires_external)

            if metadata_version_info >= (2, 1):
                self._write_list(s, 'Provides-Extra', self.provides_extra)

            self._write_list(s, 'Requires-Dist', self.requires_dist)
            self._write_list(s, 'Provides-Dist', self.provides_dist)
            self._write_list(s, 'Obsoletes-Dist', self.obsoletes_dist)

        if metadata_version_info >= (2, 4):
            self._write_list(s, 'License-File', self.license_file)
            self._write_list(s, 'License-Expression', self.license_expression)

        if not description_field:
            # Description as metadata body
            self._write_description(s, description)

        return s.getvalue()

    def _dump_as_zip(self, zp, metadata_version_info=None):
        zp.writestr(
            _PKG_INFO_LOCATION,
            self.to_string(metadata_version_info).encode(PKG_INFO_ENCODING))

    def _write_field(self, s, name, value):
        if value and value != 'UNKNOWN':
            value = '%s: %s\n' % (name, value)
            s.write(value)

    def _write_description(self, s, value):
        if value:
            s.write('\n')
            # FIXME I am not sure why the first line is like this
            value = textwrap.dedent(' ' * 8 + value)
            s.write(value)

    def _write_list(self, s, name, values):
        for value in values:
            self._write_field(s, name, value)

    # Protocol implementations
    def __eq__(self, other):
        if isinstance(other, self.__class__):
            return (
                self.metadata_version == other.metadata_version
                and self.to_string() == other.to_string())
        elif other is None:
            # We special-case None because EggMetadata.pkg_info may be None,
            # and we want to support foo.pkg_info == foo2.pkg_info when one may
            # be None
            return False
        else:
            raise TypeError(
                "Only equality between PackageInfo instances is supported")

    def __ne__(self, other):
        return not self == other


def _string_to_version_info(metadata_version):
    return tuple(int(i) for i in metadata_version.split("."))


def _ensure_supported_version(metadata_version):
    metadata_version_info = _string_to_version_info(metadata_version)
    if metadata_version_info not in HEADER_ATTRS:
        msg = ("Unsupported PKG-INFO metadata format: {0!r}"
               .format(metadata_version))
        raise OkonomiyakiError(msg)


def _parse(fp):
    from email.parser import Parser
    return Parser().parse(fp)


def _must_decode(value):  # pragma NO COVER
    if type(value) is bytes:
        try:
            return value.decode('utf-8')
        except UnicodeDecodeError:
            return value.decode('latin1')
    return value


def _get(msg, header):
    return _collapse_leading_ws(header, msg.get(header))


def _get_all(msg, header):
    return [_collapse_leading_ws(header, x) for x in msg.get_all(header)]


def _collapse_leading_ws(header, txt):
    """
    ``Description`` header must preserve newlines; all others need not
    """
    if header.lower() == 'description':  # preserve newlines
        lines = [x[8:] if x.startswith(' ' * 8) else x
                 for x in txt.strip().splitlines()]
        # Append a line to be char-by-char compatible with distutils
        lines.append('')
        return '\n'.join(lines)
    else:
        return ' '.join([x.strip() for x in txt.splitlines()])


def _convert_if_needed(data, sha256, strict):
    """ sha256 may be None, in which case it is assumed no special handling
    through black list is needed.
    """
    decoded_data = EGG_PKG_INFO_BLACK_LIST.get(sha256)
    if decoded_data is None:
        if strict:
            return data.decode(PKG_INFO_ENCODING)
        else:
            return data.decode(PKG_INFO_ENCODING, 'replace')
    else:
        return decoded_data


def _read_pkg_info_wheel(fp, name_version=None):
    """ Read the METADATA content in the possible locations for a wheel, and
    return the decoded content.

    If no pkg info data is found, return None.

    Parameters
    ----------
    fp : ZipFile
    name_or_version: tuple or None
        If not None, assumed to be (name, version) pair. If known,
        significantly speed up finding the metadata archive name.
    """
    if name_version is None:
        for arcname in fp.namelist():
            parts = arcname.split("/")
            if (
                len(parts) == 2
                and parts[0].endswith(".dist-info")
                and parts[1] == "METADATA"
            ):
                candidate = arcname
                break
        else:
            return None
    else:
        name, version = name_version
        dist_info = "{0}-{1}.dist-info".format(name, version)
        candidate = "{0}/METADATA".format(dist_info)

    try:
        return fp.read(candidate)
    except KeyError:
        return None


def _read_pkg_info(fp):
    """ Read the PKG-INFO content in the possible locations, and return
    the decoded content.

    If no PKG-INFO is found, return None.
    """
    for candidate in _PKG_INFO_CANDIDATES:
        try:
            return fp.read(candidate)
        except KeyError:
            pass
    return None


@contextlib.contextmanager
def _keep_position(fp):
    pos = fp.tell()
    try:
        fp.seek(0)
        yield
    finally:
        fp.seek(pos)


# Copied from distutils.util
def _rfc822_escape(header):
    """Return a version of the string escaped for inclusion in an
    RFC-822 header, by ensuring there are 8 spaces space after each newline.
    """
    lines = header.split('\n')
    header = ('\n' + 8 * ' ').join(lines)
    return header
