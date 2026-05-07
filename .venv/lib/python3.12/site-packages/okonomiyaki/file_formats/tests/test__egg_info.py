import os
import os.path as op
import shutil
import tempfile
import textwrap
import zipfile2
import unittest
from unittest import mock

from .._egg_info import (
    Requirement, EggMetadata, LegacySpecDepend, parse_rawspec,
    split_egg_name)
from .common import (
    BROKEN_MCCABE_EGG, DATA_EGGS, ENSTALLER_EGG, ETS_EGG,
    FAKE_MEDIALOG_BOARDFILE_1_6_1_EGG, FAKE_MEDIALOG_BOARDFILE_1_6_1_PKG_INFO,
    MKL_EGG, NUMEXPR_2_2_2_EGG, PYMULTINEST_EGG, _OSX64APP_EGG,
    PYSIDE_1_0_3_EGG, XZ_5_2_0_EGG)
from okonomiyaki.errors import (
    InvalidEggName, InvalidMetadataField, MissingMetadata, UnsupportedMetadata,
    InvalidRequirementStringHyphen)
from okonomiyaki.utils import tempdir
from okonomiyaki.utils.test_data import (
    MKL_10_3_RH5_X86_64, NOSE_1_3_4_RH6_X86_64, NOSE_1_3_4_RH5_X86_64)
from okonomiyaki.platforms import EPDPlatform, PlatformABI
from okonomiyaki.versions import EnpkgVersion, MetadataVersion


M = MetadataVersion.from_string


class TestRequirement(unittest.TestCase):
    def test_str(self):
        dependency = Requirement(name=u"numpy")
        r_str = "numpy"

        self.assertEqual(r_str, str(dependency))

        dependency = Requirement(name=u"numpy", version_string=u"1.7.1")
        r_str = "numpy 1.7.1"

        self.assertEqual(r_str, str(dependency))

        dependency = Requirement(name=u"numpy", version_string=u"1.7.1",
                                 build_number=1)
        r_str = "numpy 1.7.1-1"

        self.assertEqual(r_str, str(dependency))

        dependency = Requirement(u"numpy", u"1.7.1", 1)
        r_str = "numpy 1.7.1-1"

        self.assertEqual(r_str, str(dependency))

    def test_from_spec_string(self):
        dependency = Requirement.from_spec_string(u"numpy")
        self.assertEqual(dependency.name, "numpy")
        self.assertEqual(dependency.version_string, "")
        self.assertEqual(dependency.build_number, -1)
        self.assertEqual(dependency.strictness, 1)

        dependency = Requirement.from_spec_string(u"numpy 1.7.1")
        self.assertEqual(dependency.name, "numpy")
        self.assertEqual(dependency.version_string, "1.7.1")
        self.assertEqual(dependency.build_number, -1)
        self.assertEqual(dependency.strictness, 2)

        dependency = Requirement.from_spec_string(u"numpy 1.7.1-2")
        self.assertEqual(dependency.name, "numpy")
        self.assertEqual(dependency.version_string, "1.7.1")
        self.assertEqual(dependency.build_number, 2)
        self.assertEqual(dependency.strictness, 3)

        with self.assertRaisesRegex(
                InvalidRequirementStringHyphen,
                "Invalid requirement string {0!r}:"
                " Package versions should be separated by whitespace"
                " instead of a hyphen.".format(u"numpy-1.7.1-2")):
            Requirement.from_spec_string(u"numpy-1.7.1-2")

    def test_from_string(self):
        dependency = Requirement.from_string(u"numpy-1.7.1-2", 3)
        self.assertEqual(dependency.name, "numpy")
        self.assertEqual(dependency.version_string, "1.7.1")
        self.assertEqual(dependency.build_number, 2)

        dependency = Requirement.from_string(u"numpy-1.7.1-2", 2)
        self.assertEqual(dependency.name, "numpy")
        self.assertEqual(dependency.version_string, "1.7.1")
        self.assertEqual(dependency.build_number, -1)

        dependency = Requirement.from_string(u"numpy-1.7.1-2", 1)
        self.assertEqual(dependency.name, "numpy")
        self.assertEqual(dependency.version_string, "")
        self.assertEqual(dependency.build_number, -1)

        self.assertRaises(InvalidEggName, lambda:
                          Requirement.from_string(u"numpy"))
        self.assertRaises(InvalidEggName, lambda:
                          Requirement.from_string(u"numpy 1.7.1"))


class TestLegacySpecDepend(unittest.TestCase):
    def test_create_from_egg1(self):
        egg = op.join(DATA_EGGS, "Cython-0.19.1-1.egg")
        self._test_create_from_egg(egg)

    def test_create_from_egg2(self):
        egg = op.join(DATA_EGGS, "ets-4.3.0-3.egg")
        self._test_create_from_egg(egg)

    def _test_create_from_egg(self, egg_path):
        with zipfile2.ZipFile(egg_path, "r") as zp:
            r_spec_depend = zp.read("EGG-INFO/spec/depend").decode()

        spec_depend = LegacySpecDepend.from_egg(egg_path)

        self.maxDiff = 4096
        self.assertMultiLineEqual(spec_depend.to_string(), r_spec_depend)

    def test_from_string(self):
        # Given
        r_depend = """\
metadata_version = '1.1'
name = 'Qt_debug'
version = '4.8.5'
build = 2

arch = 'x86'
platform = 'linux2'
osdist = 'RedHat_5'
python = '2.7'
packages = [
  'Qt 4.8.5',
]
"""

        # When
        depend = LegacySpecDepend.from_string(r_depend)

        # Then
        self.assertMultiLineEqual(depend.to_string(), r_depend)
        self.assertEqual(depend.packages,
                         [Requirement.from_spec_string(u"Qt 4.8.5")])

    def test_to_string(self):
        # Given
        r_depend = """\
metadata_version = '1.2'
name = 'Qt_debug'
version = '4.8.5'
build = 2

arch = 'x86'
platform = 'linux2'
osdist = 'RedHat_5'
python = None
python_tag = None
packages = []
"""

        # When
        depend = LegacySpecDepend.from_string(r_depend)

        # Then
        self.assertMultiLineEqual(depend.to_string(), r_depend)
        self.assertEqual(depend.packages, [])

    def test_windows_platform(self):
        r_depend = """\
metadata_version = "1.1"
name= "Qt_debug"
version = "4.8.5"
build = 2

arch = 'x86'
platform = 'win32'
osdist = None

python = "2.7"
packages = [
]
"""
        depend = LegacySpecDepend.from_string(r_depend)

        # Then
        self.assertEqual(depend.arch, "x86")
        self.assertEqual(depend.platform, "win32")
        self.assertIsNone(depend.osdist)
        self.assertEqual(depend.platform_abi, "msvc2008")

    def test_format_1_3(self):
        r_depend = """\
metadata_version = "1.3"
name= "numpy_debug"
version = "1.9.2"
build = 3

arch = 'x86'
platform = 'win32'
osdist = None

python = "2.7"
python_tag = "cp27"
abi_tag = "cp27m"
platform_tag = "win32"

packages = [
]
"""
        depend = LegacySpecDepend.from_string(r_depend)

        # Then
        self.assertEqual(depend._metadata_version, M("1.3"))
        self.assertEqual(depend.python_tag, "cp27")
        self.assertEqual(depend.abi_tag, "cp27m")
        self.assertEqual(depend.platform_tag, "win32")
        self.assertEqual(depend.platform_abi, "msvc2008")

    def test_format_1_4(self):
        r_depend = """\
metadata_version = "1.4"
name= "numpy_debug"
version = "1.9.2"
build = 3

arch = 'x86'
platform = 'win32'
osdist = None

python = "2.7"
python_tag = "cp27"
abi_tag = "cp27m"
platform_tag = "win32"

platform_abi = "msvc2008"

packages = [
]
"""
        depend = LegacySpecDepend.from_string(r_depend)

        # Then
        self.assertEqual(depend._metadata_version, M("1.4"))
        self.assertEqual(depend.python_tag, "cp27")
        self.assertEqual(depend.abi_tag, "cp27m")
        self.assertEqual(depend.platform_tag, "win32")
        self.assertEqual(depend.platform_abi, "msvc2008")

    def test_unsupported_metadata_version(self):
        # Given
        unsupported = MetadataVersion(
            EggMetadata.HIGHEST_SUPPORTED_METADATA_VERSION.major + 1, 0
        )

        s = textwrap.dedent("""\
            metadata_version = "{0}"

            name = "foo"
            version = "1.0"
            build = 1

            arch = "amd64"
            platform = "darwin"
            osdist = None

            python = "2.7"

            abi_tag = "none"
            platform_tag = "macosx_10_6_i386"
            python_tag = "cp27"

            packages = []""".format(str(unsupported)))

        # When/Then
        with self.assertRaises(UnsupportedMetadata):
            LegacySpecDepend.from_string(s)

    def test_error_python_to_python_tag(self):
        # Given
        s = textwrap.dedent("""\
            metadata_version = "1.1"

            name = "foo"
            version = "1.0"
            build = 1

            arch = "amd64"
            platform = "darwin"
            osdist = None

            python = "a.7"

            packages = []""")

        # When/Then
        with self.assertRaisesRegex(
            InvalidMetadataField,
            r"^Invalid value for metadata field 'python': u?'a.7'"
        ) as exc:
            LegacySpecDepend.from_string(s)

        self.assertEqual(exc.exception.name, "python")
        self.assertEqual(exc.exception.value, "a.7")

    def test_blacklisted_platform(self):
        # Given
        egg = XZ_5_2_0_EGG
        sha256sum = ("ca5f2c417dd9f6354db3c2999edb441382ed11c7a034"
                     "ade1839d1871a78ab2e8")

        # When
        with mock.patch(
            "okonomiyaki.file_formats._egg_info.compute_sha256",
            return_value=sha256sum
        ):
            spec_depend = LegacySpecDepend.from_egg(egg)

        # Then
        self.assertEqual(spec_depend._epd_platform.pep425_tag, "win32")

        # When
        with mock.patch(
            "okonomiyaki.file_formats._egg_info.compute_sha256",
            return_value=sha256sum
        ):
            with zipfile2.ZipFile(egg) as zp:
                spec_depend = LegacySpecDepend.from_egg(zp)

        # Then
        self.assertEqual(spec_depend._epd_platform.pep425_tag, "win32")

    def test_missing_spec_depend(self):
        # When/Then
        with tempdir() as d:
            path = os.path.join(d, 'egg-5.1-1.egg')
            with zipfile2.ZipFile(path, "w") as zp:
                zp.writestr("dummy", b"")

            with self.assertRaises(MissingMetadata):
                LegacySpecDepend.from_egg(path)


class TestLegacySpecDependAbi(unittest.TestCase):
    def test_default_no_python_egg(self):
        # Given
        spec_depend_string = """\
metadata_version = '1.1'
name = 'MKL'
version = '10.3'
build = 1

arch = 'amd64'
platform = 'darwin'
osdist = None
python = None
packages = []
"""

        # When
        spec_depend = LegacySpecDepend.from_string(spec_depend_string)

        # Then
        self.assertIsNone(spec_depend.abi_tag, None)
        self.assertEqual(spec_depend.platform_abi, "darwin")

    def test_default_pure_python_egg(self):
        # Given
        spec_depend_string = """\
metadata_version = '1.1'
name = 'nose'
version = '1.3.4'
build = 1

arch = 'amd64'
platform = 'darwin'
osdist = None
python = '2.7'
packages = []
"""

        # When
        spec_depend = LegacySpecDepend.from_string(spec_depend_string)

        # Then
        self.assertEqual(spec_depend.abi_tag, "cp27m")
        self.assertEqual(spec_depend.platform_abi, "darwin")

    def test_default_extension_python_egg(self):
        # Given
        spec_depend_string = """\
metadata_version = '1.1'
name = 'numpy'
version = '1.9.2'
build = 1

arch = 'amd64'
platform = 'darwin'
osdist = None
python = '2.7'
packages = [
  'MKL 10.3-1',
]
"""

        # When
        spec_depend = LegacySpecDepend.from_string(spec_depend_string)

        # Then
        self.assertEqual(spec_depend.abi_tag, "cp27m")
        self.assertEqual(spec_depend.platform_abi, "darwin")

    def test_default_no_python_egg_windows(self):
        # Given
        spec_depend_string = """\
metadata_version = '1.1'
name = 'MKL'
version = '11.1.4'
build = 1

arch = 'amd64'
platform = 'win32'
osdist = 'Windows'
python = None
packages = [
]
"""

        # When
        spec_depend = LegacySpecDepend.from_string(spec_depend_string)

        # Then
        self.assertIsNone(spec_depend.abi_tag)
        self.assertEqual(spec_depend.platform_abi, "msvc2008")

    def test_default_pure_python_egg_pypi(self):
        # Given
        spec_depend_string = """\
metadata_version = '1.1'
name = 'numpydoc'
version = '0.4'
build = 1

arch = None
platform = None
osdist = None
python = '2.7'
packages = [
  'sphinx',
]
"""

        # When
        spec_depend = LegacySpecDepend.from_string(spec_depend_string)

        # Then
        self.assertIsNone(spec_depend.abi_tag)
        self.assertIsNone(spec_depend.platform_abi)

    def test_to_string(self):
        # Given
        r_spec_depend_string = """\
metadata_version = '1.3'
name = 'nose'
version = '1.3.4'
build = 1

arch = 'amd64'
platform = 'darwin'
osdist = None
python = '2.7'

python_tag = 'cp27'
abi_tag = 'cp27m'
platform_tag = 'macosx_10_6_x86_64'

packages = []
"""

        spec_depend_string = """\
metadata_version = '1.1'
name = 'nose'
version = '1.3.4'
build = 1

arch = 'amd64'
platform = 'darwin'
osdist = None
python = '2.7'
packages = []
"""

        # When
        spec_depend = LegacySpecDepend.from_string(spec_depend_string)
        # A bit of an hack, but this is the only way to force a specific
        # metadata version for to_string for now
        spec_depend._metadata_version = M("1.3")
        spec_depend_string = spec_depend.to_string()

        # Then
        self.assertMultiLineEqual(spec_depend_string, r_spec_depend_string)


class TestLegacySpecDependPlatform(unittest.TestCase):
    def test_default_win_64(self):
        # Given
        spec_depend_string = """\
metadata_version = '1.1'
name = 'MKL'
version = '10.3'
build = 1

arch = 'amd64'
platform = 'win32'
osdist = None

python = None
packages = []
"""

        # When
        spec_depend = LegacySpecDepend.from_string(spec_depend_string)

        # Then
        self.assertEqual(spec_depend.platform_tag, "win_amd64")

    def test_default_win_32(self):
        # Given
        spec_depend_string = """\
metadata_version = '1.1'
name = 'MKL'
version = '10.3'
build = 1

arch = 'i386'
platform = 'win32'
osdist = None

python = None
packages = []
"""

        # When
        spec_depend = LegacySpecDepend.from_string(spec_depend_string)

        # Then
        self.assertEqual(spec_depend.platform_tag, "win32")

    def test_default_rh5_32(self):
        # Given
        spec_depend_string = """\
metadata_version = '1.1'
name = 'MKL'
version = '10.3'
build = 1

arch = 'i386'
platform = 'linux2'
osdist = 'RedHat_5'

python = None
packages = []
"""

        # When
        spec_depend = LegacySpecDepend.from_string(spec_depend_string)

        # Then
        self.assertEqual(spec_depend.platform_tag, "linux_i686")

    def test_default_rh5_64(self):
        # Given
        spec_depend_string = """\
metadata_version = '1.1'
name = 'MKL'
version = '10.3'
build = 1

arch = 'amd64'
platform = 'linux2'
osdist = 'RedHat_5'

python = None
packages = []
"""

        # When
        spec_depend = LegacySpecDepend.from_string(spec_depend_string)

        # Then
        self.assertEqual(spec_depend.platform_tag, "linux_x86_64")

    def test_default_all_none(self):
        # Given
        spec_depend_string = """\
metadata_version = '1.1'
name = 'MKL'
version = '10.3'
build = 1

arch = None
platform = None
osdist = None
python = None
packages = []
"""

        # When
        spec_depend = LegacySpecDepend.from_string(spec_depend_string)

        # Then
        self.assertIsNone(spec_depend.platform_tag)


class TestEggName(unittest.TestCase):
    def test_split_egg_name(self):
        egg_name = "numpy-1.7.1-1.egg"
        r_name = "numpy"
        r_version = "1.7.1"
        r_build = 1

        self.assertEqual(split_egg_name(egg_name)[0], r_name)
        self.assertEqual(split_egg_name(egg_name)[1], r_version)
        self.assertEqual(split_egg_name(egg_name)[2], r_build)

    def test_split_egg_name_invalid(self):
        self.assertRaises(InvalidEggName,
                          lambda: split_egg_name("numpy-1.7.1-1"))
        self.assertRaises(InvalidEggName,
                          lambda: split_egg_name("numpy-1.6.1"))


class TestParseRawspec(unittest.TestCase):
    def test_simple_unsupported(self):
        # Given
        spec_string = "metadata_version = '1.0'"

        # When/Then
        with self.assertRaisesRegex(
            InvalidMetadataField, r"^Missing metadata field 'name'"
        ):
            parse_rawspec(spec_string)

    def test_simple_1_2(self):
        r_spec = {'arch': 'x86',
                  'build': 1,
                  'metadata_version': "1.2",
                  'name': 'Cython',
                  'osdist': 'RedHat_5',
                  'packages': [],
                  'platform': 'linux2',
                  'python': '2.7',
                  'python_tag': 'cp27',
                  'version': '0.19.1'}

        spec_s = """\
metadata_version = '1.2'
name = 'Cython'
version = '0.19.1'
build = 1

arch = 'x86'
platform = 'linux2'
osdist = 'RedHat_5'
python = '2.7'
python_tag = 'cp27'
packages = []
"""
        spec = parse_rawspec(spec_s)
        self.assertEqual(spec, r_spec)

    def test_simple_1_1(self):
        r_spec = {'arch': 'x86',
                  'build': 1,
                  'metadata_version': "1.1",
                  'name': 'Cython',
                  'osdist': 'RedHat_5',
                  'packages': [],
                  'platform': 'linux2',
                  'python': '2.7',
                  'version': '0.19.1'}

        spec_s = """\
metadata_version = '1.1'
name = 'Cython'
version = '0.19.1'
build = 1

arch = 'x86'
platform = 'linux2'
osdist = 'RedHat_5'
python = '2.7'
packages = []
"""
        spec = parse_rawspec(spec_s)
        self.assertEqual(spec, r_spec)

    def test_with_dependencies(self):
        r_spec = {'arch': 'x86',
                  'build': 1,
                  'metadata_version': "1.1",
                  'name': 'pandas',
                  'osdist': 'RedHat_5',
                  'packages': ['numpy 1.7.1', 'python_dateutil'],
                  'platform': 'linux2',
                  'python': '2.7',
                  'version': '0.12.0'}

        spec_s = """\
metadata_version = '1.1'
name = 'pandas'
version = '0.12.0'
build = 1

arch = 'x86'
platform = 'linux2'
osdist = 'RedHat_5'
python = '2.7'
packages = [
  'numpy 1.7.1',
  'python_dateutil',
]
"""

        self.assertEqual(r_spec, parse_rawspec(spec_s))

    def test_with_none(self):
        r_spec = {'arch': 'x86',
                  'build': 1,
                  'metadata_version': "1.1",
                  'name': 'pandas',
                  'osdist': None,
                  'packages': ['numpy 1.7.1', 'python_dateutil'],
                  'platform': None,
                  'python': None,
                  'version': '0.12.0'}

        spec_s = """\
metadata_version = '1.1'
name = 'pandas'
version = '0.12.0'
build = 1

arch = 'x86'
platform = None
osdist = None
python = None
packages = [
  'numpy 1.7.1',
  'python_dateutil',
]
"""

        self.assertEqual(r_spec, parse_rawspec(spec_s))

    def test_invalid_spec_strings(self):
        # Given a spec_string without metadata_version
        spec_s = """\
name = 'pandas'
version = '0.12.0'
build = 1

arch = 'x86'
platform = None
osdist = None
python = None
packages = [
  'numpy 1.7.1',
  'python_dateutil',
]
"""

        # When/Then
        with self.assertRaisesRegex(
            InvalidMetadataField,
            r"^Invalid value for metadata field 'metadata_version': None"
        ):
            parse_rawspec(spec_s)

        # Given a spec_string without some other metadata in >= 1.1
        spec_s = """\
metadata_version = '1.1'
name = 'pandas'
version = '0.12.0'
build = 1

arch = 'x86'
osdist = None
python = None
packages = [
  'numpy 1.7.1',
  'python_dateutil',
]
"""

        # When/Then
        with self.assertRaisesRegex(
            InvalidMetadataField, r"^Missing metadata field 'platform'"
        ):
            parse_rawspec(spec_s)

        # Given a spec_string without some other metadata in >= 1.2
        spec_s = """\
metadata_version = '1.2'
name = 'pandas'
version = '0.12.0'
build = 1

arch = 'x86'
osdist = None
platform = None
python = None
packages = [
  'numpy 1.7.1',
  'python_dateutil',
]
"""

        # When/Then
        with self.assertRaisesRegex(
            InvalidMetadataField, r"^Missing metadata field 'python_tag'"
        ):
            parse_rawspec(spec_s)


class TestEggMetadata(unittest.TestCase):
    def setUp(self):
        self.tempdir = tempfile.mkdtemp()

    def tearDown(self):
        shutil.rmtree(self.tempdir)

    def test_simple(self):
        # Given
        egg = ENSTALLER_EGG

        # When
        metadata = EggMetadata.from_egg(egg)

        # Then
        self.assertEqual(metadata.name, "enstaller")

        # When
        with zipfile2.ZipFile(egg) as zp:
            metadata = EggMetadata.from_egg(zp)

        # Then
        self.assertEqual(metadata.name, "enstaller")
        self.assertEqual(
            metadata.metadata_version,
            MetadataVersion.from_string("1.1")
        )
        self.assertEqual(metadata.metadata_version, M("1.1"))
        self.assertEqual(metadata.abi_tag, None)
        self.assertEqual(metadata.abi_tag_string, 'none')
        self.assertEqual(metadata.platform_tag, None)
        self.assertEqual(metadata.platform_tag_string, 'any')
        self.assertEqual(metadata.python_tag, None)
        self.assertEqual(metadata.python_tag_string, 'none')
        self.assertEqual(metadata.platform_abi_tag, None)
        self.assertEqual(metadata.platform_abi_tag_string, 'none')

    def test_simple_non_python_egg(self):
        # Given
        egg = MKL_EGG

        # When
        metadata = EggMetadata.from_egg(egg)

        # Then
        self.assertEqual(metadata.egg_basename, "MKL")
        self.assertEqual(metadata.name, "mkl")

        self.assertEqual(metadata.metadata_version, M("1.1"))
        self.assertEqual(metadata.abi_tag, None)
        self.assertEqual(metadata.abi_tag_string, 'none')
        self.assertEqual(metadata.platform_tag, 'macosx_10_6_x86_64')
        self.assertEqual(metadata.platform_tag_string, 'macosx_10_6_x86_64')
        self.assertEqual(metadata.platform_abi, PlatformABI(u'darwin'))
        self.assertEqual(metadata.platform_abi_tag, u'darwin')
        self.assertEqual(metadata.platform_abi_tag_string, u'darwin')
        self.assertEqual(metadata.python_tag, None)
        self.assertEqual(metadata.python_tag_string, 'none')
        self.assertEqual(metadata.runtime_dependencies, tuple())

    def _override_spec_depend(self, egg, spec_depend_string):
        new_egg = os.path.join(self.tempdir, os.path.basename(egg))
        with zipfile2.ZipFile(egg) as zi:
            to_copy = set(zi.namelist()) - set(("EGG-INFO/spec/depend",))
            with zipfile2.ZipFile(new_egg, "w") as zo:
                for archive in to_copy:
                    fp = zi.open(archive)
                    try:
                        zo.writestr(archive, fp.read())
                    finally:
                        fp.close()

                zo.writestr("EGG-INFO/spec/depend", spec_depend_string)

        return new_egg

    def test_platform_abi(self):
        # Given
        spec_depend = textwrap.dedent("""\
            metadata_version = '1.4'
            name = 'Qt'
            version = '4.8.7'
            build = 4

            arch = 'amd64'
            platform = 'win32'
            osdist = None
            python = None

            python_tag = None
            abi_tag = None
            platform_tag = 'win_amd64'

            platform_abi = 'msvc2010'

            packages = []""")

        r_spec_depend = textwrap.dedent("""\
            metadata_version = '1.4'
            name = 'Qt'
            version = '4.8.7'
            build = 4

            arch = 'amd64'
            platform = 'win32'
            osdist = None
            python = None

            python_tag = None
            abi_tag = None
            platform_tag = 'win_amd64'

            platform_abi = 'msvc2015'

            packages = []
        """)

        egg = self._override_spec_depend(ENSTALLER_EGG, spec_depend)

        # When
        metadata = EggMetadata.from_egg(egg)

        # Then
        self.assertEqual(metadata.name, "qt")
        self.assertEqual(metadata.metadata_version, M("1.4"))
        self.assertIs(metadata.is_strictly_supported, True)
        self.assertEqual(metadata.platform_abi_tag, u"msvc2010")
        self.assertEqual(metadata.platform_abi_tag_string, u"msvc2010")

        # When
        metadata.platform_abi = None

        # Then
        self.assertIs(metadata.platform_abi, None)
        self.assertEqual(metadata.platform_abi_tag_string, "none")

        # When
        metadata.platform_abi = PlatformABI(u"msvc2015")

        # Then
        self.assertMultiLineEqual(
            metadata._spec_depend.to_string(), r_spec_depend
        )

    def test_platform_abi_no_python(self):
        # Given
        spec_depend = textwrap.dedent("""\
            metadata_version = '1.3'

            name = 'PythonDoc'
            version = '2.7.3'
            build = 1

            arch = 'amd64'
            platform = 'win32'
            osdist = None
            python = None

            platform_tag = 'win_amd64'
            abi_tag = 'cp27m'
            python_tag = 'py27'

            packages = [
              'appinst',
            ]
        """)

        egg = self._override_spec_depend(ENSTALLER_EGG, spec_depend)

        # When
        metadata = EggMetadata.from_egg(egg)

        # Then
        self.assertEqual(metadata.name, "pythondoc")
        self.assertEqual(metadata.metadata_version, M("1.3"))
        self.assertIs(metadata.is_strictly_supported, True)
        self.assertIsNone(metadata.platform_abi)
        self.assertEqual(metadata.platform_abi_tag_string, "none")

    def test_support_higher_compatible_version(self):
        # Given
        spec_depend = textwrap.dedent("""\
            metadata_version = '1.5'
            name = 'enstaller'
            version = '4.5.0'
            build = 1

            arch = None
            platform = None
            osdist = None
            python = None

            python_tag = None
            abi_tag = None
            platform_tag = None

            platform_abi = None

            packages = []""")

        egg = self._override_spec_depend(ENSTALLER_EGG, spec_depend)

        # When
        metadata = EggMetadata.from_egg(egg)

        # Then
        self.assertEqual(metadata.name, "enstaller")
        self.assertEqual(metadata.metadata_version, M("1.5"))
        self.assertIs(metadata.is_strictly_supported, False)

        # When/Then
        with self.assertRaises(UnsupportedMetadata):
            metadata._spec_depend

    def test_support_lower_compatible_version(self):
        # Given
        spec_depend = textwrap.dedent("""\
            metadata_version = '1.1'
            name = 'nose'
            version = '1.3.4'
            build = 1

            arch = 'amd64'
            platform = 'linux2'
            osdist = 'RedHat_6'
            python = '2.7'
            packages = []\n""")

        egg = NOSE_1_3_4_RH6_X86_64
        metadata = EggMetadata.from_egg(egg)

        # When
        metadata = EggMetadata.from_egg_metadata(
            metadata, metadata_version=M("1.1")
        )

        # Then
        self.assertEqual(metadata.name, "nose")
        self.assertEqual(metadata.metadata_version, M("1.1"))
        self.assertMultiLineEqual(
            metadata._spec_depend.to_string(), spec_depend
        )

    def test_from_cross_platform_egg(self):
        # Given
        egg = ENSTALLER_EGG

        # When
        metadata = EggMetadata.from_egg(egg)

        # Then
        self.assertEqual(metadata.egg_name, os.path.basename(egg))
        self.assertEqual(metadata.kind, "egg")
        self.assertEqual(metadata.name, "enstaller")
        self.assertEqual(metadata.version, EnpkgVersion.from_string("4.5.0-1"))
        self.assertEqual(metadata.build, 1)
        self.assertEqual(metadata.upstream_version, "4.5.0")
        self.assertIsNone(metadata.python_tag)
        self.assertEqual(metadata.metadata_version, M("1.1"))

    def test_from_platform_egg(self):
        # Given
        egg = ETS_EGG
        r_runtime_dependencies = (
            Requirement.from_spec_string(u'apptools 4.2.0-2'),
            Requirement.from_spec_string(u'blockcanvas 4.0.3-1'),
            Requirement.from_spec_string(u'casuarius 1.1-1'),
            Requirement.from_spec_string(u'chaco 4.3.0-2'),
            Requirement.from_spec_string(u'codetools 4.1.0-2'),
            Requirement.from_spec_string(u'enable 4.3.0-5'),
            Requirement.from_spec_string(u'enaml 0.6.8-2'),
            Requirement.from_spec_string(u'encore 0.3-1'),
            Requirement.from_spec_string(u'envisage 4.3.0-2'),
            Requirement.from_spec_string(u'etsdevtools 4.0.2-1'),
            Requirement.from_spec_string(u'etsproxy 0.1.2-1'),
            Requirement.from_spec_string(u'graphcanvas 4.0.2-1'),
            Requirement.from_spec_string(u'mayavi 4.3.0-3'),
            Requirement.from_spec_string(u'pyface 4.3.0-2'),
            Requirement.from_spec_string(u'scimath 4.1.2-2'),
            Requirement.from_spec_string(u'traits 4.3.0-2'),
            Requirement.from_spec_string(u'traitsui 4.3.0-2'),
        )

        # When
        metadata = EggMetadata.from_egg(egg)

        # Then
        self.assertEqual(metadata.egg_name, os.path.basename(egg))
        self.assertEqual(metadata.kind, "egg")
        self.assertEqual(metadata.name, "ets")
        self.assertEqual(
            metadata.version, EnpkgVersion.from_string("4.3.0-3")
        )
        self.assertEqual(metadata.build, 3)
        self.assertEqual(metadata.upstream_version, "4.3.0")
        self.assertEqual(metadata.metadata_version, M("1.1"))
        self.assertEqual(
            metadata.platform, EPDPlatform.from_epd_string("rh5-32")
        )
        self.assertEqual(metadata.abi_tag, 'cp27m')
        self.assertEqual(metadata.abi_tag_string, 'cp27m')
        self.assertEqual(metadata.platform_tag, 'linux_i686')
        self.assertEqual(metadata.platform_tag_string, 'linux_i686')
        self.assertEqual(metadata.python_tag, 'cp27')
        self.assertEqual(metadata.python_tag_string, 'cp27')
        self.assertEqual(metadata.runtime_dependencies, r_runtime_dependencies)

    def test_to_spec_string(self):
        # Given
        egg = ETS_EGG
        r_spec_depend_string = textwrap.dedent("""\
        metadata_version = '1.1'
        name = 'ets'
        version = '4.3.0'
        build = 3

        arch = 'x86'
        platform = 'linux2'
        osdist = 'RedHat_5'
        python = '2.7'
        packages = [
          'apptools 4.2.0-2',
          'blockcanvas 4.0.3-1',
          'casuarius 1.1-1',
          'chaco 4.3.0-2',
          'codetools 4.1.0-2',
          'enable 4.3.0-5',
          'enaml 0.6.8-2',
          'encore 0.3-1',
          'envisage 4.3.0-2',
          'etsdevtools 4.0.2-1',
          'etsproxy 0.1.2-1',
          'graphcanvas 4.0.2-1',
          'mayavi 4.3.0-3',
          'pyface 4.3.0-2',
          'scimath 4.1.2-2',
          'traits 4.3.0-2',
          'traitsui 4.3.0-2',
        ]
        """)

        # When
        metadata = EggMetadata.from_egg(egg)

        # Then
        self.assertMultiLineEqual(
            metadata.spec_depend_string, r_spec_depend_string
        )
        self.assertEqual(metadata.pkg_info.name, "ets")
        self.assertEqual(
            metadata.pkg_info.summary, "Enthought Tool Suite meta-project"
        )
        self.assertEqual(
            metadata.summary,
            "components to construct custom scientific applications\n"
        )

    def test_no_pkg_info(self):
        # Given
        egg = _OSX64APP_EGG

        # When
        metadata = EggMetadata.from_egg(egg)

        # Then
        self.assertEqual(metadata.name, "_osx64app")
        self.assertIsNone(metadata.pkg_info)

        # When
        with zipfile2.ZipFile(egg) as fp:
            metadata = EggMetadata.from_egg(fp)

        # Then
        self.assertEqual(metadata.name, "_osx64app")
        self.assertIsNone(metadata.pkg_info)

    def test_blacklisted_python_tag(self):
        # Given
        egg = PYSIDE_1_0_3_EGG
        sha256sum = ("5af973a78c53bfa4fe843992bc86207d5c945b06f7df576e64"
                     "463a743a558fb1")
        # When
        with mock.patch(
            "okonomiyaki.file_formats._egg_info.compute_sha256",
            return_value=sha256sum
        ):
            metadata = EggMetadata.from_egg(egg)

        # Then
        self.assertEqual(metadata.python_tag, "cp27")
        self.assertEqual(metadata.abi_tag, "cp27m")

        # When
        with mock.patch(
            "okonomiyaki.file_formats._egg_info.compute_sha256",
            return_value=sha256sum
        ):
            with zipfile2.ZipFile(egg) as zp:
                metadata = EggMetadata.from_egg(zp)

        # Then
        self.assertEqual(metadata.python_tag, "cp27")

    def test_blacklisted_platform(self):
        # Given
        egg = XZ_5_2_0_EGG
        sha256sum = ("ca5f2c417dd9f6354db3c2999edb441382ed11c7a034"
                     "ade1839d1871a78ab2e8")

        # When
        with mock.patch(
            "okonomiyaki.file_formats._egg_info.compute_sha256",
            return_value=sha256sum
        ):
            metadata = EggMetadata.from_egg(egg)

        # Then
        self.assertEqual(metadata.platform_tag, "win32")

        # When
        with mock.patch(
            "okonomiyaki.file_formats._egg_info.compute_sha256",
            return_value=sha256sum
        ):
            with zipfile2.ZipFile(egg) as zp:
                metadata = EggMetadata.from_egg(zp)

        # Then
        self.assertEqual(metadata.platform_tag, "win32")

        # Given
        egg = BROKEN_MCCABE_EGG

        # When
        with mock.patch(
            "okonomiyaki.file_formats._egg_info.compute_sha256",
        ) as mocked_compute_sha256:
            metadata = EggMetadata.from_egg(egg)

        # Then
        self.assertFalse(mocked_compute_sha256.called)

    def test_blacklisted_pkg_info(self):
        # Given
        egg = FAKE_MEDIALOG_BOARDFILE_1_6_1_EGG
        mock_sha256 = ("ab9e029caf273e4a251d3686425cd4225e1b97682749acc7a82d"
                       "c1fd15dbd060")

        # When
        with mock.patch(
            "okonomiyaki.file_formats._egg_info.compute_sha256",
            return_value=mock_sha256
        ):
            metadata = EggMetadata.from_egg(egg)

        # Then
        self.maxDiff = None
        pkg_info = metadata.pkg_info
        self.assertEqual(pkg_info.metadata_version, "1.0")
        self.assertEqual(pkg_info.name, "medialog.boardfile")
        self.assertMultiLineEqual(
            pkg_info.description, FAKE_MEDIALOG_BOARDFILE_1_6_1_PKG_INFO
        )

        # When
        with mock.patch(
            "okonomiyaki.file_formats._egg_info.compute_sha256",
            return_value=mock_sha256
        ):
            with zipfile2.ZipFile(egg) as zp:
                metadata = EggMetadata.from_egg(zp)

        # Then
        pkg_info = metadata.pkg_info
        self.assertEqual(pkg_info.metadata_version, "1.0")
        self.assertEqual(pkg_info.name, "medialog.boardfile")
        self.assertMultiLineEqual(
            pkg_info.description, FAKE_MEDIALOG_BOARDFILE_1_6_1_PKG_INFO
        )

        # Given
        # An egg not in the blacklist
        egg = BROKEN_MCCABE_EGG

        # When
        with mock.patch(
            "okonomiyaki.file_formats._egg_info.compute_sha256",
        ) as mocked_compute_sha256:
            EggMetadata.from_egg(egg)

        # Then
        self.assertFalse(mocked_compute_sha256.called)

    def test_fixed_requirement(self):
        # Given
        egg = NUMEXPR_2_2_2_EGG

        # When
        metadata = EggMetadata.from_egg(egg)

        # Then
        self.assertEqual(
            tuple(str(r) for r in metadata.runtime_dependencies),
            ("MKL 10.3", "numpy 1.8.0")
        )

    def test_strictness(self):
        # Given
        egg = PYMULTINEST_EGG

        # When/Then
        with self.assertRaises(UnicodeDecodeError):
            EggMetadata.from_egg(egg)

        # When
        metadata = EggMetadata.from_egg(egg, strict=False)

        # Then
        self.assertEqual(
            metadata.pkg_info.author_email,
            u"johannes.buchner.acad [\ufffdt] gmx.com",
        )

    def test_dump_simple(self):
        # Given
        egg = ENSTALLER_EGG
        r_metadata = EggMetadata.from_egg(egg)

        path = os.path.join(self.tempdir, "foo.zip")

        # When
        r_metadata.dump(path)

        # Then
        metadata = EggMetadata.from_egg(path)
        self.assertEqual(metadata, r_metadata)

    def test_dump_blacklisted(self):
        self.maxDiff = None

        # Given
        egg = FAKE_MEDIALOG_BOARDFILE_1_6_1_EGG
        mock_sha256 = (
            "ab9e029caf273e4a251d3686425cd4225e1b97682749acc7a82dc1fd15dbd060"
        )

        with mock.patch(
            "okonomiyaki.file_formats._egg_info.compute_sha256",
            return_value=mock_sha256
        ):
            r_metadata = EggMetadata.from_egg(egg)

        path = os.path.join(self.tempdir, "foo.zip")

        # When
        r_metadata.dump(path)

        # Then
        metadata = EggMetadata.from_egg(path)
        self.assertMultiLineEqual(
            metadata.pkg_info.description,
            FAKE_MEDIALOG_BOARDFILE_1_6_1_PKG_INFO
        )
        self.assertEqual(metadata, r_metadata)

    def test_dump_blacklisted_platform(self):
        # Given
        egg = XZ_5_2_0_EGG
        mock_sha256 = (
            "ca5f2c417dd9f6354db3c2999edb441382ed11c7a034ade1839d1871a78ab2e8"
        )

        with mock.patch(
            "okonomiyaki.file_formats._egg_info.compute_sha256",
            return_value=mock_sha256
        ):
            r_metadata = EggMetadata.from_egg(egg)

        path = os.path.join(self.tempdir, "foo.zip")

        # When
        r_metadata.dump(path)

        # Then
        metadata = EggMetadata.from_egg(path)
        self.assertEqual(metadata.platform_tag, "win32")

    def test_to_json_dict(self):
        # Given
        egg = NOSE_1_3_4_RH5_X86_64
        metadata = EggMetadata.from_egg(egg)

        r_json_dict = {
            "metadata_version": u"1.3",
            "_raw_name": u"nose",
            "version": u"1.3.4-1",
            "epd_platform": u"rh5_x86_64",
            "python_tag": u"cp27",
            "abi_tag": u"cp27m",
            "platform_tag": u"linux_x86_64",
            "platform_abi_tag": u"gnu",
            "runtime_dependencies": [],
            "summary": (
                u"Extends the Python Unittest module with additional "
                "disocvery and running\noptions\n"
            )
        }

        # When
        json_dict = metadata.to_json_dict()

        # Then
        self.assertEqual(json_dict, r_json_dict)

    def test_from_json_dict(self):
        # Given
        egg = NOSE_1_3_4_RH5_X86_64
        r_metadata = EggMetadata.from_egg(egg)

        json_dict = {
            "metadata_version": u"1.3",
            "_raw_name": u"nose",
            "version": u"1.3.4-1",
            "epd_platform": u"rh5_x86_64",
            "python_tag": u"cp27",
            "abi_tag": u"cp27m",
            "platform_tag": u"linux_x86_64",
            "platform_abi_tag": u"gnu",
            "runtime_dependencies": [],
            "summary": (
                u"Extends the Python Unittest module with additional "
                "disocvery and running\noptions\n"
            )
        }

        # When
        metadata = EggMetadata.from_json_dict(json_dict, r_metadata.pkg_info)

        # Then
        self.assertEqual(metadata, r_metadata)

    def _test_roundtrip(self, egg):
        r_metadata = EggMetadata.from_egg(egg)
        metadata = EggMetadata.from_json_dict(
            r_metadata.to_json_dict(), r_metadata.pkg_info
        )

        self.assertEqual(metadata, r_metadata)

    def test_mkl_roundtrip(self):
        self._test_roundtrip(MKL_10_3_RH5_X86_64)
