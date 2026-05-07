# coding=utf-8
import os
import shutil
import stat
import sys
import tempfile
import textwrap
import unittest
import zipfile2
import os.path as op

from okonomiyaki.platforms import EPDPlatform
from okonomiyaki.utils import compute_md5
from okonomiyaki.versions import EnpkgVersion
from ..egg import EggBuilder, EggRewriter
from .._egg_info import Dependencies, EggMetadata, LegacySpecDepend
from .._package_info import PackageInfo
from .common import PIP_PKG_INFO, TRAITS_SETUPTOOLS_EGG


ZIP_SOFTLINK_ATTRIBUTE_MAGIC = 0xA1ED0000


class TestEggBuilder(unittest.TestCase):
    def setUp(self):
        self.d = tempfile.mkdtemp()

    def tearDown(self):
        shutil.rmtree(self.d)

    def test_simple(self):
        r_files = [
            "EGG-INFO/PKG-INFO",
            "EGG-INFO/spec/depend",
            "EGG-INFO/spec/summary",
        ]
        r_spec_depend = """\
metadata_version = '1.1'
name = 'Qt_debug'
version = '4.8.5'
build = 2

arch = 'x86'
platform = 'linux2'
osdist = 'RedHat_5'
python = '2.7'
packages = []
"""

        spec_depend = LegacySpecDepend.from_string(r_spec_depend)
        pkg_info = PackageInfo("1.1", "Qt_debug", "4.8.5")
        metadata = EggMetadata._from_spec_depend(spec_depend, pkg_info, "")

        with EggBuilder(metadata, cwd=self.d) as fp:
            pass

        egg_path = op.join(self.d, "Qt_debug-4.8.5-2.egg")
        self.assertTrue(op.exists(egg_path))

        with zipfile2.ZipFile(egg_path, "r") as fp:
            self.assertEqual(set(fp.namelist()), set(r_files))
            self.assertMultiLineEqual(fp.read("EGG-INFO/spec/depend").decode(),
                                      r_spec_depend)

    def test_unicode_pkg_info(self):
        r_files = [
            "EGG-INFO/PKG-INFO",
            "EGG-INFO/spec/depend",
            "EGG-INFO/spec/summary",
        ]
        r_spec_depend = """\
metadata_version = '1.1'
name = 'Qt_debug'
version = '4.8.5'
build = 2

arch = 'x86'
platform = 'linux2'
osdist = 'RedHat_5'
python = '2.7'
packages = []
"""
        r_description = r_summary = u"Un petit peu de français"

        spec_depend = LegacySpecDepend.from_string(r_spec_depend)
        pkg_info = PackageInfo("1.1", "Qt_debug", "4.8.5",
                               description=r_description)
        metadata = EggMetadata._from_spec_depend(spec_depend, pkg_info,
                                                 r_summary)

        with EggBuilder(metadata, cwd=self.d) as fp:
            pass

        egg_path = op.join(self.d, "Qt_debug-4.8.5-2.egg")
        self.assertTrue(op.exists(egg_path))

        with zipfile2.ZipFile(egg_path, "r") as fp:
            self.assertEqual(set(fp.namelist()), set(r_files))
            self.assertMultiLineEqual(fp.read("EGG-INFO/spec/depend").decode(),
                                      r_spec_depend)

        metadata = EggMetadata.from_egg(egg_path)
        self.assertMultiLineEqual(metadata.summary, r_summary)

        pkg_info = PackageInfo.from_egg(egg_path)
        self.assertMultiLineEqual(pkg_info.description.rstrip(), r_description)

    def _create_fake_metadata(self):
        pkg_info = PackageInfo.from_string(PIP_PKG_INFO)
        pkg_info.version = u"4.8.6"
        pkg_info.name = u"Qt_debug"

        version = EnpkgVersion.from_upstream_and_build(pkg_info.version, 1)
        platform = EPDPlatform.from_epd_string("rh5-32")
        dependencies = Dependencies((), ())

        return EggMetadata(
            pkg_info.name, version, platform, u"cp27", u"cp27m", u"gnu",
            dependencies, pkg_info, pkg_info.summary
        )

    def test_reject_no_pkg_info(self):
        # Given
        version = EnpkgVersion.from_string("4.8.4-1")
        platform = EPDPlatform.from_epd_string("rh5-64")
        dependencies = Dependencies((), ())

        metadata = EggMetadata("foo", version, platform, "cp27",
                               u"cp27m", u"gnu", dependencies, None, "")

        # When/Then
        with self.assertRaises(ValueError):
            EggBuilder(metadata)

    def test_simple_with_tree(self):
        # Given
        r_files = [
            "EGG-INFO/PKG-INFO",
            "EGG-INFO/spec/depend",
            "EGG-INFO/spec/summary",
            "EGG-INFO/usr/bin/",
            "EGG-INFO/usr/bin/exe",
        ]

        tree = os.path.join(self.d, "usr")
        exe = os.path.join(tree, "bin", "exe")
        os.makedirs(os.path.dirname(exe))
        with open(exe, "wb") as fp:
            fp.write(b"some fake executable")

        metadata = self._create_fake_metadata()

        # When
        with EggBuilder(metadata, cwd=self.d) as fp:
            fp.add_tree(tree, "EGG-INFO/usr")

        # Then
        egg_path = os.path.join(self.d, "Qt_debug-4.8.6-1.egg")
        self.assertTrue(os.path.exists(egg_path))

        with zipfile2.ZipFile(egg_path, "r") as fp:
            self.assertEqual(set(fp.namelist()), set(r_files))

    def test_add_file(self):
        # Given
        r_files = [
            "EGG-INFO/PKG-INFO",
            "EGG-INFO/spec/depend",
            "EGG-INFO/spec/summary",
            "exe",
        ]

        tree = os.path.join(self.d, "usr")
        exe = os.path.join(tree, "bin", "exe")
        os.makedirs(os.path.dirname(exe))
        with open(exe, "wb") as fp:
            fp.write(b"some fake executable")

        metadata = self._create_fake_metadata()

        # When
        with EggBuilder(metadata, cwd=self.d) as fp:
            fp.add_file(exe)

        # Then
        egg_path = os.path.join(self.d, "Qt_debug-4.8.6-1.egg")
        self.assertTrue(os.path.exists(egg_path))

        with zipfile2.ZipFile(egg_path, "r") as fp:
            self.assertEqual(set(fp.namelist()), set(r_files))

        # Given
        r_files = [
            "EGG-INFO/PKG-INFO",
            "EGG-INFO/spec/depend",
            "EGG-INFO/spec/summary",
            "bin/exe",
        ]

        # When
        with EggBuilder(metadata, cwd=self.d) as fp:
            fp.add_file(exe, "bin")

        # Then
        egg_path = os.path.join(self.d, "Qt_debug-4.8.6-1.egg")
        self.assertTrue(os.path.exists(egg_path))

        with zipfile2.ZipFile(egg_path, "r") as fp:
            self.assertEqual(set(fp.namelist()), set(r_files))

        # Given
        r_files = [
            "EGG-INFO/PKG-INFO",
            "EGG-INFO/spec/depend",
            "EGG-INFO/spec/summary",
            "foo.exe",
        ]

        # When
        with EggBuilder(metadata, cwd=self.d) as fp:
            fp.add_file_as(exe, "foo.exe")

        # Then
        egg_path = os.path.join(self.d, "Qt_debug-4.8.6-1.egg")
        self.assertTrue(os.path.exists(egg_path))

        with zipfile2.ZipFile(egg_path, "r") as fp:
            self.assertEqual(set(fp.namelist()), set(r_files))

        # Given
        r_files = [
            "EGG-INFO/PKG-INFO",
            "EGG-INFO/spec/depend",
            "EGG-INFO/spec/summary",
            "foo.exe",
        ]

        # When
        with EggBuilder(metadata, cwd=self.d) as fp:
            fp.add_data(b"data", "foo.exe")

        # Then
        egg_path = os.path.join(self.d, "Qt_debug-4.8.6-1.egg")
        self.assertTrue(os.path.exists(egg_path))

        with zipfile2.ZipFile(egg_path, "r") as fp:
            self.assertEqual(set(fp.namelist()), set(r_files))
            self.assertEqual(fp.read("foo.exe"), b"data")

    def test_simple_with_iterator(self):
        # Given
        r_files = [
            "EGG-INFO/PKG-INFO",
            "EGG-INFO/spec/depend",
            "EGG-INFO/spec/summary",
            "EGG-INFO/usr/bin/exe",
        ]

        tree = os.path.join(self.d, "usr")
        exe = os.path.join(tree, "bin", "exe")
        os.makedirs(os.path.dirname(exe))
        with open(exe, "wb") as fp:
            fp.write(b"some fake executable")

        metadata = self._create_fake_metadata()

        def it():
            yield (exe, "EGG-INFO/usr/bin/exe")

        # When
        with EggBuilder(metadata, cwd=self.d) as fp:
            fp.add_iterator(it())

        # Then
        egg_path = os.path.join(self.d, "Qt_debug-4.8.6-1.egg")
        self.assertTrue(os.path.exists(egg_path))

        with zipfile2.ZipFile(egg_path, "r") as fp:
            self.assertEqual(set(fp.namelist()), set(r_files))

    def test_files_are_readable(self):
        # Given
        metadata = self._create_fake_metadata()
        r_prefix = os.path.join(self.d, "prefix")

        # When
        with EggBuilder(metadata, cwd=self.d) as fp:
            pass

        egg_path = os.path.join(self.d, "Qt_debug-4.8.6-1.egg")

        with zipfile2.ZipFile(egg_path, "r") as fp:
            fp.extractall(
                r_prefix, preserve_permissions=zipfile2.PERMS_PRESERVE_SAFE
            )

        # Then
        # Files are readable for everybody
        for archive in (
            "EGG-INFO/PKG-INFO",
            "EGG-INFO/spec/depend",
            "EGG-INFO/spec/summary",
        ):
            pkg_info = os.path.join(r_prefix, archive)
            self.assertTrue(os.path.exists(pkg_info))
            perms = stat.S_IMODE(os.stat(pkg_info).st_mode)
            if sys.platform == "win32":
                self.assertEqual(perms, 0o666)
            else:
                self.assertEqual(perms, 0o644)

    def test_add_data(self):
        # Given
        metadata = self._create_fake_metadata()

        # When/Then
        # Ensure we don't create "directories" w/ data
        with self.assertRaises(ValueError):
            with EggBuilder(metadata, cwd=self.d) as fp:
                fp.add_data(b"data", "EGG-INFO/")


class TestEggRewriter(unittest.TestCase):
    def setUp(self):
        self.prefix = tempfile.mkdtemp()

    def tearDown(self):
        shutil.rmtree(self.prefix)

    def assertSameArchive(self, first, second, arcname):
        with zipfile2.ZipFile(first) as first_fp:
            with zipfile2.ZipFile(second) as second_fp:
                first_info = first_fp.getinfo(arcname)
                second_info = second_fp.getinfo(arcname)

                is_one_symlink = (
                    first_info.external_attr == ZIP_SOFTLINK_ATTRIBUTE_MAGIC
                    or second_info.external_attr == ZIP_SOFTLINK_ATTRIBUTE_MAGIC
                )
                if is_one_symlink:
                    self.assertEqual(
                        first_info.external_attr,
                        second_info.external_attr
                    )

                self.assertEqual(
                    first_fp.read(first_info),
                    second_fp.read(second_info),
                )

    def assertFileContentEqual(self, first, second):
        self.assertEqual(compute_md5(first), compute_md5(second))

    def _spec_depend_string(self):
        return textwrap.dedent("""\
            metadata_version = '1.3'
            name = 'traits'
            version = '4.5.0'
            build = 2

            arch = 'x86'
            platform = 'linux2'
            osdist = 'RedHat_5'
            python = '2.7'

            python_tag = 'cp27'
            abi_tag = 'cp27m'
            platform_tag = 'linux_i686'

            packages = []
            """)

    def _create_metadata(self, spec_depend_string):
        spec_depend = LegacySpecDepend.from_string(spec_depend_string)
        pkg_info = None
        summary = ""
        metadata = EggMetadata._from_spec_depend(
            spec_depend, pkg_info,
            summary
        )

        return metadata

    def test_simple(self):
        # Given
        egg = TRAITS_SETUPTOOLS_EGG

        original_members = (
            "EGG-INFO/",
            "EGG-INFO/dependency_links.txt",
            "EGG-INFO/native_libs.txt",
            "EGG-INFO/not-zip-safe",
            "EGG-INFO/pbr.json",
            "EGG-INFO/PKG-INFO",
            "EGG-INFO/SOURCES.txt",
            "EGG-INFO/top_level.txt"
        )
        r_namelist = original_members + (
            "EGG-INFO/spec/depend",
            "EGG-INFO/spec/summary",
        )

        r_spec_depend = self._spec_depend_string()
        metadata = self._create_metadata(r_spec_depend)

        # When
        with EggRewriter(metadata, egg, cwd=self.prefix) as rewriter:
            pass

        # Then
        target_egg = rewriter.path
        self.assertTrue(os.path.exists(target_egg))

        with zipfile2.ZipFile(target_egg) as fp:
            namelist = fp.namelist()
            spec_depend = fp.read("EGG-INFO/spec/depend").decode()

        self.assertCountEqual(namelist, r_namelist)
        # Ensure we don't overwrite the existing PKG-INFO
        self.assertSameArchive(egg, target_egg, "EGG-INFO/PKG-INFO")
        self.assertMultiLineEqual(spec_depend, r_spec_depend)

    def test_overwrite(self):
        # Given
        egg = TRAITS_SETUPTOOLS_EGG

        r_spec_depend = self._spec_depend_string()
        metadata = self._create_metadata(r_spec_depend)

        with open(__file__, "rb") as fp:
            r_new_content = fp.read()

        # When/Then
        with self.assertRaises(ValueError):
            with EggRewriter(metadata, egg, cwd=self.prefix) as rewriter:
                rewriter.add_file_as(__file__, "EGG-INFO/pbr.json")

        # When
        with EggRewriter(metadata, egg, cwd=self.prefix,
                         allow_overwrite=True) as rewriter:
            rewriter.add_file_as(__file__, "EGG-INFO/pbr.json")

        # Then
        with zipfile2.ZipFile(rewriter.path) as fp:
            new_content = fp.read("EGG-INFO/pbr.json")
        self.assertEqual(new_content, r_new_content)

    def test_accept_remove_py(self):
        # Given
        path = TRAITS_SETUPTOOLS_EGG
        egg = os.path.join(self.prefix, os.path.basename(path))
        shutil.copy(path, egg)

        with zipfile2.ZipFile(egg, "a") as zp:
            zp.writestr("traits/_ctraits.py", b"")
            zp.writestr("traits/_ctraits.so", b"")

        r_spec_depend = self._spec_depend_string()
        metadata = self._create_metadata(r_spec_depend)

        def accept(path, nameset):
            return path != "EGG-INFO/pbr.json"

        # When
        with EggRewriter(metadata, egg, accept=accept,
                         cwd=self.prefix) as rewriter:
            pass

        # Then
        with zipfile2.ZipFile(rewriter.path) as fp:
            self.assertFalse("EGG-INFO/pbr.json" in fp._filenames_set)

    def test_accept(self):
        # Given
        egg = TRAITS_SETUPTOOLS_EGG

        r_spec_depend = self._spec_depend_string()
        metadata = self._create_metadata(r_spec_depend)

        def accept(path, nameset):
            return path != "EGG-INFO/pbr.json"

        # When
        with EggRewriter(metadata, egg, accept=accept,
                         cwd=self.prefix) as rewriter:
            pass

        # Then
        with zipfile2.ZipFile(rewriter.path) as fp:
            self.assertFalse("EGG-INFO/pbr.json" in fp._filenames_set)

    def test_rename(self):
        # Given
        egg = TRAITS_SETUPTOOLS_EGG

        r_spec_depend = self._spec_depend_string()
        metadata = self._create_metadata(r_spec_depend)

        def rename(arcname):
            if arcname == "EGG-INFO/pbr.json":
                return "EGG-INFO/pbr.json.bak"
            else:
                return arcname

        # When
        with EggRewriter(metadata, egg, rename=rename,
                         cwd=self.prefix) as rewriter:
            pass

        # Then
        with zipfile2.ZipFile(rewriter.path) as fp:
            self.assertFalse("EGG-INFO/pbr.json" in fp._filenames_set)
            content = fp.read("EGG-INFO/pbr.json.bak")

        with zipfile2.ZipFile(egg) as fp:
            r_content = fp.read("EGG-INFO/pbr.json")

        self.assertEqual(content, r_content)

    def test_accept_and_rename(self):
        # Given
        egg = TRAITS_SETUPTOOLS_EGG

        old_arcname = "EGG-INFO/pbr.json"
        new_arcname = "EGG-INFO/pbr.json.bak"

        r_spec_depend = self._spec_depend_string()
        metadata = self._create_metadata(r_spec_depend)

        def rename(arcname):
            if arcname == old_arcname:
                return new_arcname
            else:
                return arcname

        def accept(arcname, nameset):
            if arcname == old_arcname:
                return False
            else:
                return True

        # When
        with EggRewriter(metadata, egg, rename=rename, accept=accept,
                         cwd=self.prefix) as rewriter:
            pass

        # Then
        with zipfile2.ZipFile(rewriter.path) as fp:
            self.assertFalse(old_arcname in fp._filenames_set)
            self.assertFalse(new_arcname in fp._filenames_set)

        # Given
        def rename(arcname):
            if arcname == old_arcname:
                return new_arcname
            else:
                return arcname

        def accept(arcname, nameset):
            if arcname == new_arcname:
                return False
            else:
                return True

        # When
        with EggRewriter(metadata, egg, rename=rename, accept=accept,
                         cwd=self.prefix) as rewriter:
            pass

        # Then
        with zipfile2.ZipFile(rewriter.path) as fp:
            self.assertFalse("EGG-INFO/pbr.json" in fp._filenames_set)
            self.assertTrue("EGG-INFO/pbr.json.bak" in fp._filenames_set)
