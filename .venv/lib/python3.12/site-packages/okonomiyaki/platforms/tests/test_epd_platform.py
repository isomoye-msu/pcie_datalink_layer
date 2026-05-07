import unittest

from parameterized import parameterized

from okonomiyaki.errors import OkonomiyakiError
from okonomiyaki.versions import RuntimeVersion

from .. import EPDPlatform
from ..epd_platform import EPD_PLATFORM_SHORT_NAMES, applies
from .._arch import X86, X86_64, ARM64
from .._platform import OSKind, FamilyKind, NameKind

from .common import (
    mock_centos_5_8, mock_centos_6_3, mock_rocky_8_8, mock_darwin,
    mock_machine_x86, mock_machine_x86_64, mock_solaris,
    mock_ubuntu_raring, mock_x86, mock_x86_64, mock_arm64,
    mock_centos_7_6, mock_windows_10, mock_windows_11, mock_windows_7)


class TestEPDPlatform(unittest.TestCase):

    def setUp(self):
        items = [
            platform + '-{0}'.format(arch)
            for arch in ('x86', 'x86_64')
            for platform in ('osx', 'win', 'rh5')]
        items = [
            platform + '-x86_64'
            for platform in ('rh6', 'rh7', 'rh8')]
        items = [
            platform + '-arm64'
            for platform in ('rh8', 'win', 'osx')]
        items += EPD_PLATFORM_SHORT_NAMES
        self.platform_strings = tuple(items)

    def test_pep425_is_unicode(self):
        # given
        strings = list(self.platform_strings)
        # Do not know the right pep425 tag for these
        strings.remove('sol-32')
        strings.remove('sol-64')

        # When/Then
        for platform_string in strings:
            platform = EPDPlatform.from_string(platform_string)
            self.assertIsInstance(platform.pep425_tag, str)

    def test_platform_name_is_unicode(self):
        # When/Then
        for platform_string in self.platform_strings:
            platform = EPDPlatform.from_string(platform_string)
            self.assertIsInstance(platform.platform_name, str)

    def test_str_is_unicode(self):
        # When/Then
        for platform_string in self.platform_strings:
            platform = EPDPlatform.from_string(platform_string)
            self.assertIsInstance(str(platform), str)

    def test_over_complete_strings(self):
        # When/Then
        with self.assertRaises(OkonomiyakiError):
            EPDPlatform.from_string('win_x86-64')

    @parameterized.expand([
        ('osx-32', 'osx', X86),
        ('osx-64', 'osx', X86_64),
        ('rh3-32', 'rh3', X86),
        ('rh3-64', 'rh3', X86_64),
        ('rh5-32', 'rh5', X86),
        ('rh5-64', 'rh5', X86_64),
        ('rh6-64', 'rh6', X86_64),
        ('rh7-64', 'rh7', X86_64),
        ('sol-32', 'sol', X86),
        ('sol-64', 'sol', X86_64),
        ('win-32', 'win', X86),
        ('win-64', 'win', X86_64)])
    def test_epd_platform_from_legacy_short_names(self, short, name, arch):
        # When
        epd_platform = EPDPlatform.from_string(short)

        # Then
        self.assertEqual(epd_platform.arch, arch)
        self.assertEqual(epd_platform.platform_name, name)

    @parameterized.expand([
        ('i386', X86), ('x86', X86), ('i686', X86),
        ('amd64', X86_64), ('x86_64', X86_64), ('AMD64', X86_64),
        ('arm64', ARM64), ('aarch64', ARM64)])
    def test_epd_platform_from_string_new_names(self, arch, expected):
        # When
        epd_platform = EPDPlatform.from_string(f'rh8-{arch}')

        # Then
        self.assertEqual(epd_platform.arch, expected)
        self.assertEqual(epd_platform.platform_name, 'rh8')

    @parameterized.expand([
        ('3.6.5+6', 'osx-64', '10.6'),
        ('3.6.5+6', 'win-64', ''),
        ('3.8.8+2', 'osx-x86_64', '10.14'),
        ('3.8.8+2', 'win-x86_64', '10'),
        ('3.11.2+5', 'osx-x86_64', '12.0'),
        ('3.11.2+5', 'osx-arm64', '12.0'),
        ('3.11.2+5', 'win-x86_64', '10'),
        ('3.11.2+5', 'win-arm64', '11')])
    def test_epd_platform_from_string_with_runtime_version(
            self, version, platform, release):
        # given
        version = RuntimeVersion.from_string(version)

        # when/then
        epd_platform = EPDPlatform.from_string(platform, version)
        self.assertEqual(epd_platform.platform.release, release)

    @parameterized.expand([
        (mock_x86, X86), (mock_x86_64, X86_64), (mock_arm64, ARM64)])
    @mock_darwin
    def test_from_running_python_darwin(self, machine, arch):
        # When
        with machine:
            epd_platform = EPDPlatform.from_running_python()

        # Then
        self.assertEqual(str(epd_platform), f'osx_{arch}')

    @parameterized.expand([
        (mock_x86, None, X86),
        (mock_x86, 'x86', X86),
        (mock_x86_64, None, X86_64),
        (mock_x86_64, 'amd64', X86_64),
        (mock_x86_64, 'x86', X86)])
    @mock_windows_7
    def test_from_running_system_windows_7(self, machine, arch, expected):
        with machine:
            epd_platform = EPDPlatform.from_running_system(arch)
            self.assertEqual(str(epd_platform), f'win_{expected}')

    @parameterized.expand([
        (mock_x86, None, X86),
        (mock_x86, 'x86', X86),
        (mock_x86_64, None, X86_64),
        (mock_x86_64, 'amd64', X86_64),
        (mock_x86_64, 'x86', X86)])
    @mock_windows_10
    def test_from_running_system_windows_10(self, machine, arch, expected):
        with machine:
            epd_platform = EPDPlatform.from_running_system(arch)
            self.assertEqual(str(epd_platform), f'win_{expected}')

    @parameterized.expand([
        (mock_x86, None, X86),
        (mock_x86, 'x86', X86),
        (mock_x86_64, None, X86_64),
        (mock_x86_64, 'amd64', X86_64),
        (mock_arm64, 'arm64', ARM64),
        (mock_x86_64, 'x86', X86)])
    @mock_windows_11
    def test_from_running_system_windows_11(self, machine, arch, expected):
        with machine:
            epd_platform = EPDPlatform.from_running_system(arch)
            self.assertEqual(str(epd_platform), f'win_{expected}')

    @parameterized.expand([
        (mock_windows_7,), (mock_windows_10,), (mock_windows_11,)])
    def test_from_running_system_windows_invalid(self, machine):
        with machine:
            with mock_machine_x86:
                with self.assertRaises(OkonomiyakiError):
                    EPDPlatform.from_running_system('AMD64')

    @parameterized.expand([
        (mock_x86, None, X86),
        (mock_x86, 'x86', X86),
        (mock_x86_64, None, X86_64),
        (mock_x86_64, 'amd64', X86_64),
        (mock_arm64, 'arm64', ARM64),
        (mock_x86_64, 'x86', X86)])
    @mock_darwin
    def test_from_running_system_darwin(self, machine, arch, expected):
        with machine:
            # When/Then
            epd_platform = EPDPlatform.from_running_system(arch)
            self.assertEqual(str(epd_platform), f'osx_{expected}')

    @parameterized.expand([
        (mock_x86, None, X86),
        (mock_x86, 'x86', X86),
        (mock_x86_64, None, X86_64),
        (mock_x86_64, 'amd64', X86_64),
        (mock_x86_64, 'x86', X86)])
    @mock_centos_5_8
    def test_from_running_system_centos_5(self, machine, arch, expected):
        with machine:
            # When/Then
            epd_platform = EPDPlatform.from_running_system(arch)
            self.assertEqual(str(epd_platform), f'rh5_{expected}')

    @parameterized.expand([
        (mock_x86, None, X86),
        (mock_x86, 'x86', X86),
        (mock_x86_64, None, X86_64),
        (mock_x86_64, 'amd64', X86_64),
        (mock_x86_64, 'x86', X86)])
    @mock_centos_6_3
    def test_from_running_system_centos_6(self, machine, arch, expected):
        with machine:
            # When/Then
            epd_platform = EPDPlatform.from_running_system(arch)
            self.assertEqual(str(epd_platform), f'rh6_{expected}')

    @parameterized.expand([
        (mock_x86, None, X86),
        (mock_x86, 'x86', X86),
        (mock_x86_64, None, X86_64),
        (mock_x86_64, 'amd64', X86_64),
        (mock_x86_64, 'x86', X86)])
    @mock_centos_7_6
    def test_from_running_system_centos_7(self, machine, arch, expected):
        with machine:
            # When/Then
            epd_platform = EPDPlatform.from_running_system(arch)
            self.assertEqual(str(epd_platform), f'rh7_{expected}')

    @parameterized.expand([
        (mock_x86, None, X86),
        (mock_x86, 'x86', X86),
        (mock_x86_64, None, X86_64),
        (mock_arm64, 'arm64', ARM64),
        (mock_x86_64, 'amd64', X86_64),
        (mock_x86_64, 'x86', X86)])
    @mock_rocky_8_8
    def test_from_running_system_rocky_8(self, machine, arch, expected):
        with machine:
            # When/Then
            epd_platform = EPDPlatform.from_running_system(arch)
            self.assertEqual(str(epd_platform), f'rh8_{expected}')

    @parameterized.expand([
        (mock_centos_5_8,),
        (mock_centos_6_3,),
        (mock_centos_7_6,)])
    def test_from_running_system_centos_invalid(self, os):
        with mock_machine_x86:
            with os:
                # When/Then
                with self.assertRaises(OkonomiyakiError):
                    EPDPlatform.from_running_system('x86_64')
                with self.assertRaises(OkonomiyakiError):
                    EPDPlatform.from_running_system('arm64')

        with mock_machine_x86_64:
            with os:
                # When/Then
                with self.assertRaises(OkonomiyakiError):
                    EPDPlatform.from_running_system('arm64')

    @parameterized.expand([
        ('rh5_x86', None, 'linux_i686'),
        ('rh5_x86_64', None, 'linux_x86_64'),
        ('osx_x86', None, 'macosx_10_6_i386'),
        ('osx_x86', '3.8.9+1', 'macosx_10_14_i386'),
        ('osx_x86_64', None, 'macosx_10_6_x86_64'),
        ('osx_x86_64', '3.8.9+1', 'macosx_10_14_x86_64'),
        ('osx_x86_64', '3.11.2+1', 'macosx_12_0_x86_64'),
        ('win_x86', None, 'win32'),
        ('win_x86_64', None, 'win_amd64'),
        ('win_x86_64', '3.9.1', 'win_amd64')])
    def test_pep425_tag(self, platform_tag, version, expected):
        # Given
        if version is not None:
            runtime_version = RuntimeVersion.from_string(version)
        else:
            runtime_version = None
        epd_platform = EPDPlatform.from_string(platform_tag, runtime_version)

        # When/Then
        self.assertEqual(epd_platform.pep425_tag, expected)

    @parameterized.expand([
        ('linux2', None, 'i686', 'linux_i686', 'cp36', 'gnu'),
        ('linux2', 'RedHat_3', 'i386', 'linux_i386', 'cp27', 'gnu'),
        ('linux2', 'RedHat_5', 'x86', 'linux_i686', 'cp27', 'gnu'),
        ('linux2', 'RedHat_5', 'amd64', 'linux_x86_64', 'cp27', 'gnu'),
        ('linux2', 'RedHat_6', 'amd64', 'linux_x86_64', 'cp36', 'gnu'),
        ('linux2', 'RedHat_7', 'amd64', 'linux_x86_64', 'cp38', 'gnu'),
        ('linux2', 'RedHat_8', 'amd64', 'linux_x86_64', 'cp311', 'gnu'),
        ('linux2', 'RedHat_8', 'aarch64', 'linux_aarch64', 'cp311', 'gnu'),
        ('darwin', None, 'x86', 'osx_10_6_x86', 'cp27', 'darwin'),
        ('darwin', None, 'amd64', 'osx_10_6_x86_64', 'cp27', 'darwin'),
        ('darwin', None, 'amd64', 'osx_10_9_x86_64', 'cp36', 'darwin'),
        ('darwin', None, 'amd64', 'osx_10_14_x86_64', 'cp38', 'darwin'),
        ('darwin', None, 'amd64', 'osx_12_0_x86_64', 'cp311', 'darwin'),
        ('darwin', None, 'arm64', 'osx_12_0_x86_64', 'cp311', 'darwin'),
        ('win32', None, 'x86', 'win32', 'cp27', 'msvc2008'),
        ('win32', None, 'amd64', 'win_amd64', 'cp27', 'msvc2008'),
        ('win32', None, 'x86', 'win32', 'cp36', 'msvc2015'),
        ('win32', None, 'amd64', 'win_amd64', 'cp36', 'msvc2015'),
        ('win32', None, 'x86', 'win32', 'cp38', 'msvc2019'),
        ('win32', None, 'arm64', 'win32', 'cp311', 'msvc2022'),
        ('win32', None, 'arm64', 'win_arm64', 'cp311', 'msvc2022'),
        ('win32', None, 'amd64', 'win32', 'cp311', 'msvc2022'),
        ('win32', None, 'amd64', 'win_amd64', 'cp311', 'msvc2022'),
        ('win32', None, 'amd64', 'win_amd64', 'cp38', 'msvc2019')])
    def test_from_spec_depend_data(
            self, platform, osdist, arch_name,
            platform_tag, python_version, platform_abi):
        # when
        epd_platform = EPDPlatform._from_spec_depend_data(
            platform, osdist, arch_name,
            platform_tag, python_version, platform_abi)

        # then
        if 'aarch' in arch_name or 'arm64' in arch_name:
            self.assertEqual(epd_platform.arch, ARM64)
        elif 'amd64' in arch_name:
            self.assertEqual(epd_platform.arch, X86_64)
        else:
            self.assertEqual(epd_platform.arch, X86)
        if 'linux' in platform:
            self.assertIn('linux', epd_platform.pep425_tag)
        elif 'win32' in platform:
            self.assertIn('win', epd_platform.pep425_tag)
        elif 'darwin' in platform:
            self.assertIn('osx', epd_platform.pep425_tag)

    @mock_solaris
    def test_guess_solaris_unsupported(self):
        with self.assertRaises(OkonomiyakiError):
            EPDPlatform.from_running_system()

    def test_guess_linux2_unsupported(self):
        with mock_ubuntu_raring:
            with self.assertRaises(OkonomiyakiError):
                EPDPlatform.from_running_system()

    def test_from_epd_platform_string(self):
        # Given
        epd_platform_string = 'rh5-x86'

        # When
        epd_platform = EPDPlatform.from_string(epd_platform_string)

        # Then
        platform = epd_platform.platform
        self.assertEqual(platform.os_kind, OSKind.linux)
        self.assertEqual(platform.family_kind, FamilyKind.rhel)
        self.assertEqual(platform.name_kind, NameKind.rhel)
        self.assertEqual(platform.arch, X86)
        self.assertEqual(platform.machine, X86)

        # Given
        epd_platform_string = 'win-x86'

        # When
        epd_platform = EPDPlatform.from_string(epd_platform_string)

        # Then
        platform = epd_platform.platform
        self.assertEqual(platform.os_kind, OSKind.windows)
        self.assertEqual(platform.family_kind, FamilyKind.windows)
        self.assertEqual(platform.name_kind, NameKind.windows)
        self.assertEqual(platform.arch, X86)
        self.assertEqual(platform.machine, X86)

        # Given
        epd_platform_string = 'osx-x86_64'

        # When
        epd_platform = EPDPlatform.from_string(epd_platform_string)
        platform = epd_platform.platform

        # Then
        self.assertEqual(platform.os_kind, OSKind.darwin)
        self.assertEqual(platform.family_kind, FamilyKind.mac_os_x)
        self.assertEqual(platform.name_kind, NameKind.mac_os_x)
        self.assertEqual(platform.arch, X86_64)
        self.assertEqual(platform.machine, X86_64)

    def test_from_epd_platform_string_invalid(self):
        # Given
        # Invalid bitwidth
        epd_platform_string = 'linux-32-1'

        # When/Then
        with self.assertRaises(OkonomiyakiError):
            EPDPlatform.from_string(epd_platform_string)

        # Given
        # Invalid bitwidth
        epd_platform_string = 'osx-63'

        # When/Then
        with self.assertRaises(OkonomiyakiError):
            EPDPlatform.from_string(epd_platform_string)

        # Given
        # Invalid platform basename
        epd_platform_string = 'netbsd-32'

        # When/Then
        with self.assertRaises(OkonomiyakiError):
            EPDPlatform.from_string(epd_platform_string)

    @parameterized.expand([
        ('linux_i686', 'rh8_x86'),
        ('linux_i386', 'rh8_x86'),
        ('linux_x86_64', 'rh8_x86_64'),
        ('manylinux1_x86_64', 'rh5_x86_64'),
        ('manylinux2010_x86_64', 'rh6_x86_64'),
        ('linux_aarch64', 'rh8_arm64'),
        ('win32', 'win_x86'),
        ('win_amd64', 'win_x86_64'),
        ('win_arm64', 'win_arm64'),
        ('macosx_10_6_x86_64', 'osx_x86_64'),
        ('macosx_12_0_arm64', 'osx_arm64')
    ])
    def test_from_platform_tag(self, platform_tag, epd_string):
        # When/Then
        platform = EPDPlatform._from_platform_tag(platform_tag, default_linux='rh8')
        self.assertEqual(str(platform), epd_string)

    def test_from_platform_tag_invalid(self):
        # When/Then
        with self.assertRaises(NotImplementedError):
            EPDPlatform._from_platform_tag('openbsd_i386')

        with self.assertRaises(NotImplementedError):
            EPDPlatform._from_platform_tag('manylinux_2_8_x86_64')

        with self.assertRaises(ValueError):
            EPDPlatform._from_platform_tag('manylinux2014_x86_64')

        with self.assertRaises(ValueError):
            EPDPlatform._from_platform_tag('any')

        with self.assertRaises(ValueError):
            EPDPlatform._from_platform_tag(None)


class TestEPDPlatformApplies(unittest.TestCase):

    @parameterized.expand([
        ('64', 'rh5-64', True),
        ('32', 'rh5-64', False),
        ('64', 'rh5-32', False)])
    def test_arch_only(self, platform, to, result):
        # When
        s = applies(platform, to)

        # Then
        self.assertIs(s, result)

    @mock_centos_5_8
    def test_no_arch(self):
        with mock_x86:
            self.assertTrue(applies('rh5', 'current'))
            self.assertFalse(applies('!rh5', 'current'))

        platform = EPDPlatform.from_string('rh5-x86_64')
        self.assertTrue(applies('rh5', platform))
        self.assertFalse(applies('!rh5', platform))
        self.assertFalse(applies('rh5-32', platform))

    @mock_centos_5_8
    def test_all(self):
        with mock_x86:
            self.assertTrue(applies('all', 'current'))
            self.assertFalse(applies('!all', 'current'))
        platform = EPDPlatform.from_string('rh5-x86_64')
        self.assertTrue(applies('all', platform))
        self.assertFalse(applies('!all', platform))

    @mock_centos_5_8
    def test_current_linux(self):
        with mock_x86:
            for expected_supported in ('rh5', 'rh'):
                self.assertTrue(applies(expected_supported, 'current'))
                self.assertFalse(applies('!' + expected_supported, 'current'))

            for expected_unsupported in ('win', 'win-32', 'osx', 'rh6', 'rh3'):
                self.assertFalse(applies(expected_unsupported, 'current'))
                self.assertTrue(applies('!' + expected_unsupported, 'current'))

            self.assertTrue(applies('win,rh', 'current'))
            self.assertFalse(applies('win,osx', 'current'))
            self.assertTrue(applies('!win,osx', 'current'))
            self.assertFalse(applies('!rh,osx', 'current'))
            self.assertTrue(applies('rh5-32', 'current'))
            self.assertFalse(applies('!rh5-32', 'current'))

        with mock_x86_64:
            self.assertTrue(applies('rh5-64', 'current'))
            self.assertFalse(applies('!rh5-64', 'current'))

    @mock_windows_7
    @mock_x86
    def test_current_windows_7(self):
        for platform in ('rh5', 'rh', 'osx-32'):
            self.assertFalse(applies(platform, 'current'))
        for platform in ('win', 'win-32'):
            self.assertTrue(applies(platform, 'current'))

    @mock_windows_10
    @mock_x86
    def test_current_windows_10(self):
        for platform in ('rh5', 'rh', 'osx-32'):
            self.assertFalse(applies(platform, 'current'))
        for platform in ('win', 'win-32'):
            self.assertTrue(applies(platform, 'current'))

    @mock_windows_11
    @mock_x86
    def test_current_windows_11_x86(self):
        for platform in ('rh5', 'rh', 'osx-32'):
            self.assertFalse(applies(platform, 'current'))
        for platform in ('win', 'win-32'):
            self.assertTrue(applies(platform, 'current'))

    @mock_windows_11
    @mock_x86_64
    def test_current_windows_11_x86_64(self):
        for platform in ('rh5', 'rh', 'osx-32'):
            self.assertFalse(applies(platform, 'current'))
        for platform in ('win', 'win-64', 'win-x86_64'):
            self.assertTrue(applies(platform, 'current'))

    @mock_windows_11
    @mock_arm64
    def test_current_windows_11_arm(self):
        for platform in ('rh5', 'rh', 'osx-32'):
            self.assertFalse(applies(platform, 'current'))
        for platform in ('win', 'win-arm64'):
            self.assertTrue(applies(platform, 'current'))

    @mock_darwin
    @mock_arm64
    def test_current_darwin(self):
        for platform in ('rh5', 'rh', 'osx-64', 'osx-x86_64', 'win'):
            self.assertFalse(applies(platform, 'current'))
        for platform in ('osx', 'osx-arm64'):
            self.assertTrue(applies(platform, 'current'))

    @mock_centos_5_8
    @mock_x86
    def test_applies_rh(self):
        self.assertTrue(applies('rh5-32', 'rh5'))
        self.assertTrue(applies('rh5-64', 'rh5'))
        self.assertFalse(applies('win-64', 'rh5'))
        self.assertFalse(applies('rh6-64', 'rh5'))
        self.assertTrue(applies('rh5-32', 'rh'))
        self.assertTrue(applies('rh6-32', 'rh'))
        self.assertFalse(applies('win-32', 'rh'))
