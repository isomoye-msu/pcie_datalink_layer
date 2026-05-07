import unittest

from parameterized import parameterized

from okonomiyaki.errors import OkonomiyakiError
from .._arch import Arch, X86, X86_64, ARM, ARM64
from .common import (
    mock_machine_invalid, mock_x86, mock_x86_64, mock_x86_on_x86_64, mock_arm, mock_arm64,
    mock_apple_silicon, mock_darwin, mock_linux, mock_windows)


class TestArch(unittest.TestCase):

    def test_simple(self):
        # Given
        name = "x86"
        bits = 32

        # When
        arch = Arch.from_name(name)

        # Then
        self.assertEqual(arch.name, name)
        self.assertEqual(arch.bits, bits)
        self.assertEqual(str(arch), arch.name)
        self.assertEqual(repr(arch), "Arch(_kind=<ArchitectureKind.x86: 'x86'>)")

    @parameterized.expand([
        ('x86', 32), ('x86_64', 64), ('arm', 32), ('arm64', 64)])
    def test_from_name(self, name, bits):
        # When
        arch = Arch.from_name(name)

        # Then
        self.assertEqual(arch.name, name)
        self.assertEqual(arch.bits, bits)

        # Given
        name = "x86_64"

        # When
        arch = Arch.from_name(name)

        # Then
        self.assertEqual(arch.name, name)
        self.assertEqual(arch.bits, 64)

    @parameterized.expand([
        ('i386', X86), ('i686', X86), ('amd64', X86_64), ('AMD64', X86_64),
        ('x86-64', X86_64), ('ARM', ARM), ('armv7', ARM), ('ARMv7', ARM),
        ('AArch32', ARM), ('AArch64', ARM64), ('ARM64', ARM64), ('armv8', ARM64),
        ('ARMv8', ARM64), ('ARMv9', ARM64), ('ARMv9', ARM64), ('AArch64', ARM64),
        ('aarch64', ARM64)])
    def test_from_unnormalized_names(self, name, expected):
        # When
        arch = Arch.from_name(name)

        # Then
        self.assertEqual(arch, expected)

    def test_invalid(self):
        # Given/When/Then
        with self.assertRaises(OkonomiyakiError):
            Arch.from_name('myCPU')

    @parameterized.expand([
        (mock_x86, X86), (mock_x86_on_x86_64, X86), (mock_x86_64, X86_64),
        (mock_arm, ARM), (mock_arm64, ARM64)])
    def test_from_running_python(self, machine, expected):
        # When
        with machine:
            arch = Arch.from_running_python()

        # Then
        self.assertEqual(arch, expected)

    def test_from_running_python_invalid(self):
        # Given/When/Then
        with mock_machine_invalid:
            with self.assertRaises(OkonomiyakiError):
                Arch.from_running_python()

    @parameterized.expand([
        (mock_apple_silicon, mock_arm64, ARM64),
        (mock_apple_silicon, mock_x86_64, X86_64),
        (mock_darwin, mock_x86_64, X86_64),
        (mock_linux, mock_arm64, ARM64),
        (mock_linux, mock_x86_64, X86_64),
        (mock_linux, mock_arm, ARM),
        (mock_linux, mock_arm64, ARM64),
        (mock_windows, mock_arm64, ARM64),
        (mock_windows, mock_x86_64, X86_64),
        (mock_windows, mock_arm, ARM),
        (mock_windows, mock_arm64, ARM64)])
    def test_from_running_system(self, uname, machine, expected):
        # When
        with uname:
            with machine:
                arch = Arch.from_running_system()

        # Then
        self.assertEqual(arch, expected)

    def test_from_running_system_invalid(self):
        # Given/When/Then
        with mock_machine_invalid:
            with self.assertRaises(OkonomiyakiError):
                Arch.from_running_system()

    def test__legacy_name(self):
        # Given
        name = "x86_64"

        # When
        arch = Arch.from_name(name)

        # Then
        self.assertEqual(arch._legacy_name, "amd64")
