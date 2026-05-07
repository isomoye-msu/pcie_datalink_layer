import unittest

from parameterized import parameterized

from okonomiyaki.errors import OkonomiyakiError
from .._arch import X86, X86_64, ARM, ARM64
from .._platform import Platform, OSKind, NameKind, FamilyKind

from .common import (
    mock_x86, mock_x86_64,
    mock_arm, mock_arm64)
from .common import (
    mock_centos_3_5, mock_centos_5_8, mock_machine_invalid,
    mock_centos_6_3, mock_osx_10_7, mock_solaris,
    mock_osx_12_6, mock_ubuntu_raring, mock_windows_7,
    mock_windows_10, mock_windows_11, mock_mydistro_2_8,
    mock_rocky_8_8, mock_apple_silicon)


class TestPlatformRunningPython(unittest.TestCase):

    @parameterized.expand([
        (mock_x86, X86), (mock_x86_64, X86_64)])
    @mock_windows_7
    def test_windows7(self, machine, arch):
        # When
        with machine:
            platform = Platform.from_running_python()

        # Then
        self.assertEqual(platform.os, 'windows')
        self.assertEqual(platform.name, 'windows')
        self.assertEqual(platform.family, 'windows')
        self.assertEqual(platform.release, '7')
        self.assertEqual(
            str(platform), f'Windows 7 on {arch} using {arch} arch')

    @parameterized.expand([
        (mock_x86, X86), (mock_x86_64, X86_64),
        (mock_arm, ARM), (mock_arm64, ARM64)])
    @mock_windows_10
    def test_windows10(self, machine, arch):
        # When
        with machine:
            platform = Platform.from_running_python()

        # Then
        self.assertEqual(platform.os, 'windows')
        self.assertEqual(platform.name, 'windows')
        self.assertEqual(platform.family, 'windows')
        self.assertEqual(platform.release, '10')
        self.assertEqual(
            str(platform), f'Windows 10 on {arch} using {arch} arch')

    @parameterized.expand([
        (mock_x86, X86), (mock_x86_64, X86_64),
        (mock_arm, ARM), (mock_arm64, ARM64)])
    @mock_windows_11
    def test_windows11(self, machine, arch):
        # When
        with machine:
            platform = Platform.from_running_python()

        # Then
        self.assertEqual(platform.os, 'windows')
        self.assertEqual(platform.name, 'windows')
        self.assertEqual(platform.family, 'windows')
        self.assertEqual(platform.release, '11')
        self.assertEqual(
            str(platform), f'Windows 11 on {arch} using {arch} arch')

    @parameterized.expand([
        (mock_x86_64, X86_64),
        (mock_arm64, ARM64)])
    @mock_apple_silicon
    def test_apple_silicon(self, machine, arch):
        # When
        with machine:
            platform = Platform.from_running_python()

        # Then
        self.assertEqual(platform.os, 'darwin')
        self.assertEqual(platform.name, 'mac_os_x')
        self.assertEqual(platform.family, 'mac_os_x')
        self.assertEqual(platform.release, '22.6.0')
        self.assertEqual(
            str(platform), f'Mac OS X 22.6.0 on {arch} using {arch} arch')

    @parameterized.expand([
        (mock_x86, X86), (mock_x86_64, X86_64)])
    @mock_osx_10_7
    def test_osx_10_7(self, machine, arch):
        # When
        with machine:
            platform = Platform.from_running_python()

        # Then
        self.assertEqual(platform.os, 'darwin')
        self.assertEqual(platform.name, 'mac_os_x')
        self.assertEqual(platform.family, 'mac_os_x')
        self.assertEqual(
            str(platform), f'Mac OS X 10.7.5 on {arch} using {arch} arch')

    @parameterized.expand([
        (mock_x86, X86), (mock_x86_64, X86_64),
        (mock_arm, ARM), (mock_arm64, ARM64)])
    @mock_osx_12_6
    def test_osx_12(self, machine, arch):
        # When
        with machine:
            platform = Platform.from_running_python()

        # Then
        self.assertEqual(platform.os, 'darwin')
        self.assertEqual(platform.name, 'mac_os_x')
        self.assertEqual(platform.family, 'mac_os_x')
        self.assertEqual(
            str(platform), f'Mac OS X 12.6.5 on {arch} using {arch} arch')

    @mock_solaris
    @mock_x86_64
    def test_solaris(self):
        # When/Then
        with self.assertRaises(OkonomiyakiError):
            Platform.from_running_python()

    @parameterized.expand([
        (mock_x86, X86), (mock_x86_64, X86_64)])
    @mock_centos_3_5
    def test_centos_3_5(self, machine, arch):
        # When
        with machine:
            platform = Platform.from_running_python()

        # Then
        self.assertEqual(platform.os, 'linux')
        self.assertEqual(platform.name, 'centos')
        self.assertEqual(platform.family, 'rhel')
        self.assertEqual(platform.release, '3.5')
        self.assertEqual(
            str(platform), f'CentOS 3.5 on {arch} using {arch} arch')

    @parameterized.expand([
        (mock_x86, X86), (mock_x86_64, X86_64)])
    @mock_centos_5_8
    def test_centos_5_8(self, machine, arch):
        # When
        with machine:
            platform = Platform.from_running_python()

        # Then
        self.assertEqual(platform.os, 'linux')
        self.assertEqual(platform.name, 'centos')
        self.assertEqual(platform.family, 'rhel')
        self.assertEqual(platform.release, '5.8')
        self.assertEqual(str(platform), f'CentOS 5.8 on {arch} using {arch} arch')
        self.assertEqual(
            repr(platform),
            "Platform(os='linux', name='centos', family='rhel', release='5.8', "
            f"arch='{arch}', machine='{arch}')")

    @parameterized.expand([
        (mock_x86, X86), (mock_x86_64, X86_64)])
    @mock_centos_6_3
    def test_centos_6_3(self, machine, arch):
        # When
        with machine:
            platform = Platform.from_running_python()

        # Then
        self.assertEqual(platform.os, 'linux')
        self.assertEqual(platform.name, 'centos')
        self.assertEqual(platform.family, 'rhel')
        self.assertEqual(platform.release, '6.3')
        self.assertEqual(str(platform), f'CentOS 6.3 on {arch} using {arch} arch')

    @parameterized.expand([
        (mock_x86, X86), (mock_x86_64, X86_64),
        (mock_arm, ARM), (mock_arm64, ARM64)])
    @mock_rocky_8_8
    def test_rocky_8_8(self, machine, arch):
        # When
        with machine:
            platform = Platform.from_running_python()

        # Then
        self.assertEqual(platform.os, 'linux')
        self.assertEqual(platform.name, 'rocky')
        self.assertEqual(platform.family, 'rhel')
        self.assertEqual(platform.release, '8.8')
        self.assertEqual(str(platform), f'Rocky Linux 8.8 on {arch} using {arch} arch')

    @parameterized.expand([
        (mock_x86, X86), (mock_x86_64, X86_64)])
    @mock_mydistro_2_8
    def test_mydistro_2_8(self, machine, arch):
        # When
        with machine:
            platform = Platform.from_running_python()

        # Then
        self.assertEqual(platform.os, 'linux')
        self.assertEqual(platform.name, 'unknown')
        self.assertEqual(platform.family, 'rhel')
        self.assertEqual(platform.release, '2.8')
        self.assertEqual(str(platform), f'Unknown distribution 2.8 on {arch} using {arch} arch')

    @mock_centos_6_3
    @mock_machine_invalid
    def test_centos_6_3_invalid(self):
        # When/Then
        with self.assertRaises(OkonomiyakiError):
            Platform.from_running_python()

    @mock_ubuntu_raring
    @mock_x86
    def test_ubuntu_raring(self):
        # When
        platform = Platform.from_running_python()

        # Then
        self.assertEqual(platform.os, "linux")
        self.assertEqual(platform.name, "ubuntu")
        self.assertEqual(platform.family, "debian")
        self.assertEqual(str(platform), "Ubuntu 13.04 on x86 using x86 arch")
        self.assertEqual(
            repr(platform),
            "Platform(os='linux', name='ubuntu', family='debian', release='13.04', "
            "arch='x86', machine='x86')")


class TestPlatformRunningSystem(unittest.TestCase):

    @parameterized.expand([
        (mock_x86, X86, (X86, None)), (mock_x86_64, X86_64, (X86_64, X86, None))])
    @mock_windows_7
    def test_windows7(self, machine, machine_arch, archs):
        # When
        with machine:
            for arch in archs:
                platform = Platform.from_running_system(
                    None if arch is None else f'{arch}')

                # Then
                self.assertEqual(platform.os, 'windows')
                self.assertEqual(platform.machine.name, f'{machine_arch}')
                if arch is None:
                    self.assertEqual(platform.arch.name, f'{machine_arch}')
                else:
                    self.assertEqual(platform.arch.name, f'{arch}')

    @parameterized.expand([
        (mock_x86, X86, (X86, None)), (mock_x86_64, X86_64, (X86_64, X86, None)),
        (mock_arm, ARM, (ARM, X86, None)), (mock_arm64, ARM64, (ARM64, ARM, X86_64, X86, None))])
    @mock_windows_10
    def test_windows10(self, machine, machine_arch, archs):
        # When
        with machine:
            for arch in archs:
                platform = Platform.from_running_system(
                    None if arch is None else f'{arch}')

                # Then
                self.assertEqual(platform.os, 'windows')
                self.assertEqual(platform.machine.name, f'{machine_arch}')
                if arch is None:
                    self.assertEqual(platform.arch.name, f'{machine_arch}')
                else:
                    self.assertEqual(platform.arch.name, f'{arch}')


class TestPlatform(unittest.TestCase):

    @mock_windows_7
    def test_hashing(self):
        # Given
        with mock_x86:
            win32_1 = Platform.from_running_system()
            win32_2 = Platform.from_running_system()
        with mock_x86_64:
            win64 = Platform.from_running_system()

        # When/Then
        self.assertEqual(win32_1, win32_2)
        self.assertNotEqual(win32_1, win64)
        self.assertEqual(hash(win32_1), hash(win32_1))
        self.assertTrue(win32_1 == win32_2)
        self.assertFalse(win32_1 != win32_2)
        self.assertTrue(win32_1 != win64)
        self.assertFalse(win32_1 == win64)

        self.assertNotEqual(win32_1, None)

    @parameterized.expand([
        (OSKind.linux, NameKind.rocky, FamilyKind.rhel, X86, X86_64),
        (OSKind.linux, NameKind.rocky, FamilyKind.rhel, X86, X86),
        (OSKind.linux, NameKind.rocky, FamilyKind.rhel, X86, ARM64),
        (OSKind.linux, NameKind.rocky, FamilyKind.rhel, ARM64, ARM64),
        ('linux', 'rocky', 'rhel', 'x86', 'x86_64'),
        ('linux', 'rocky', 'rhel', 'x86', 'x86'),
        ('linux', 'rocky', 'rhel', 'x86', 'arm64'),
        ('linux', 'rocky', 'rhel', 'arm64', 'arm64')])
    def test_from_dict(self, os, name, family, arch, machine):
        # Given
        dictionary = {
            'os_kind': os,
            'name_kind': name,
            'family_kind': family,
            'release': '8.9',
            'arch': arch,
            'machine': machine}

        # When
        platform = Platform.from_dict(**dictionary)

        # Then
        self.assertEqual(platform.os, 'linux')
        self.assertEqual(platform.name, 'rocky')
        self.assertEqual(platform.family, 'rhel')
        self.assertEqual(platform.release, '8.9')
        self.assertEqual(str(platform), f'Rocky Linux 8.9 on {machine} using {arch} arch')
