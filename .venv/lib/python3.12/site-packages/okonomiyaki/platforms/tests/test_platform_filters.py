import unittest

from .._arch import Arch
from ..epd_platform import EPDPlatform
from .._platform import OSKind, NameKind, FamilyKind, Platform
from ..platform_filters import PlatformFilter, PlatformLabel, PlatformLiteral

LABEL_WINDOWS_ANY = PlatformLabel()
LABEL_WINDOWS_ANY.os_kind = OSKind.windows

LABEL_OSX_32 = PlatformLabel()
LABEL_OSX_32.os_kind = OSKind.darwin
LABEL_OSX_32.arch = Arch.from_name("x86")


def _platform_from_epd_string(s):
    return EPDPlatform.from_epd_string(s).platform


RH5_32 = _platform_from_epd_string("rh5-32")
RH5_X86_64 = _platform_from_epd_string("rh5-64")
OSX_32 = _platform_from_epd_string("osx-32")
WIN_X86_64 = _platform_from_epd_string("win-64")

UBUNTU_12_10_X32 = Platform(
    OSKind.linux, NameKind.ubuntu, FamilyKind.debian, "12.10",
    Arch.from_name("x86"), Arch.from_name("x86"),
)
UBUNTU_14_04_X32 = Platform(
    OSKind.linux, NameKind.ubuntu, FamilyKind.debian, "14.04",
    Arch.from_name("x86"), Arch.from_name("x86"),
)
UBUNTU_14_04_X64 = Platform(
    OSKind.linux, NameKind.ubuntu, FamilyKind.debian, "14.04",
    Arch.from_name("x86_64"), Arch.from_name("x86_64")
)


class TestPlatformLabel(unittest.TestCase):
    def test_bitwidth_only(self):
        # Given
        label = PlatformLabel(arch=Arch.from_name("x86"))

        # When/Then
        self.assertTrue(label.matches(RH5_32))
        self.assertFalse(label.matches(RH5_X86_64))
        self.assertTrue(label.matches(OSX_32))
        self.assertFalse(label.matches(WIN_X86_64))

    def test_os(self):
        # Given
        label = PlatformLabel(os_kind=OSKind.windows)

        # When/Then
        self.assertFalse(label.matches(RH5_32))
        self.assertFalse(label.matches(RH5_X86_64))
        self.assertFalse(label.matches(OSX_32))
        self.assertTrue(label.matches(WIN_X86_64))

    def test_name(self):
        # Given
        label = PlatformLabel(name_kind=NameKind.centos)

        # When/Then
        self.assertFalse(label.matches(RH5_32))
        self.assertFalse(label.matches(RH5_X86_64))
        self.assertFalse(label.matches(OSX_32))
        self.assertFalse(label.matches(WIN_X86_64))

    def test_specific(self):
        # Given
        label = PlatformLabel(
            name_kind=NameKind.ubuntu, arch=Arch.from_name("x86"),
            release="14.04"
        )

        # When/Then
        self.assertFalse(label.matches(RH5_32))
        self.assertFalse(label.matches(RH5_X86_64))
        self.assertFalse(label.matches(OSX_32))
        self.assertFalse(label.matches(WIN_X86_64))
        self.assertFalse(label.matches(UBUNTU_12_10_X32))
        self.assertTrue(label.matches(UBUNTU_14_04_X32))
        self.assertFalse(label.matches(UBUNTU_14_04_X64))

    def test_from_legacy_string(self):
        # Given
        label = PlatformLabel._from_legacy_string("rh")

        # When/Then
        self.assertTrue(label.matches(RH5_32))
        self.assertTrue(label.matches(RH5_X86_64))
        self.assertFalse(label.matches(OSX_32))
        self.assertFalse(label.matches(WIN_X86_64))
        self.assertFalse(label.matches(UBUNTU_12_10_X32))
        self.assertFalse(label.matches(UBUNTU_14_04_X32))
        self.assertFalse(label.matches(UBUNTU_14_04_X64))

        # Given
        label = PlatformLabel._from_legacy_string("rh6")

        # When/Then
        self.assertFalse(label.matches(RH5_32))
        self.assertFalse(label.matches(RH5_X86_64))
        self.assertFalse(label.matches(OSX_32))
        self.assertFalse(label.matches(WIN_X86_64))
        self.assertFalse(label.matches(UBUNTU_12_10_X32))
        self.assertFalse(label.matches(UBUNTU_14_04_X32))
        self.assertFalse(label.matches(UBUNTU_14_04_X64))

        # Given
        label = PlatformLabel._from_legacy_string("win-64")

        # When/Then
        self.assertFalse(label.matches(RH5_32))
        self.assertFalse(label.matches(RH5_X86_64))
        self.assertFalse(label.matches(OSX_32))
        self.assertTrue(label.matches(WIN_X86_64))
        self.assertFalse(label.matches(UBUNTU_12_10_X32))
        self.assertFalse(label.matches(UBUNTU_14_04_X32))
        self.assertFalse(label.matches(UBUNTU_14_04_X64))

        # Given
        label = PlatformLabel._from_legacy_string("64")

        # When/Then
        self.assertFalse(label.matches(RH5_32))
        self.assertTrue(label.matches(RH5_X86_64))
        self.assertFalse(label.matches(OSX_32))
        self.assertTrue(label.matches(WIN_X86_64))
        self.assertFalse(label.matches(UBUNTU_12_10_X32))
        self.assertFalse(label.matches(UBUNTU_14_04_X32))
        self.assertTrue(label.matches(UBUNTU_14_04_X64))

        # Given
        label = PlatformLabel._from_legacy_string("all")

        # When/Then
        self.assertTrue(label.matches(RH5_32))
        self.assertTrue(label.matches(RH5_X86_64))
        self.assertTrue(label.matches(OSX_32))
        self.assertTrue(label.matches(WIN_X86_64))
        self.assertTrue(label.matches(UBUNTU_12_10_X32))
        self.assertTrue(label.matches(UBUNTU_14_04_X32))
        self.assertTrue(label.matches(UBUNTU_14_04_X64))


class TestPlatformFilter(unittest.TestCase):
    def test_simple(self):
        # Given
        literals = [PlatformLiteral(LABEL_WINDOWS_ANY, False),
                    PlatformLiteral(LABEL_OSX_32, False)]

        # When
        filtre = PlatformFilter(literals)

        # Then
        self.assertTrue(filtre.matches(RH5_X86_64))

    def test_from_pisi_string_simple(self):
        # Given
        legacy_string = "all"

        # When
        filtre = PlatformFilter.from_legacy_string(legacy_string)

        # Then
        self.assertTrue(filtre.matches(RH5_32))
        self.assertTrue(filtre.matches(RH5_X86_64))
        self.assertTrue(filtre.matches(OSX_32))
        self.assertTrue(filtre.matches(WIN_X86_64))
        self.assertTrue(filtre.matches(UBUNTU_12_10_X32))
        self.assertTrue(filtre.matches(UBUNTU_14_04_X32))
        self.assertTrue(filtre.matches(UBUNTU_14_04_X64))

        # Given
        legacy_string = "!all"

        # When
        filtre = PlatformFilter.from_legacy_string(legacy_string)

        # Then
        self.assertFalse(filtre.matches(RH5_32))
        self.assertFalse(filtre.matches(RH5_X86_64))
        self.assertFalse(filtre.matches(OSX_32))
        self.assertFalse(filtre.matches(WIN_X86_64))
        self.assertFalse(filtre.matches(UBUNTU_12_10_X32))
        self.assertFalse(filtre.matches(UBUNTU_14_04_X32))
        self.assertFalse(filtre.matches(UBUNTU_14_04_X64))

        # Given
        legacy_string = "win"

        # When
        filtre = PlatformFilter.from_legacy_string(legacy_string)

        # Then
        self.assertFalse(filtre.matches(RH5_32))
        self.assertFalse(filtre.matches(RH5_X86_64))
        self.assertFalse(filtre.matches(OSX_32))
        self.assertTrue(filtre.matches(WIN_X86_64))
        self.assertFalse(filtre.matches(UBUNTU_12_10_X32))
        self.assertFalse(filtre.matches(UBUNTU_14_04_X32))

    def test_from_pisi_string_composite(self):
        # Given
        legacy_string = "!win,!osx"

        # When
        filtre = PlatformFilter.from_legacy_string(legacy_string)

        # Then
        self.assertTrue(filtre.matches(RH5_32))
        self.assertTrue(filtre.matches(RH5_X86_64))
        self.assertFalse(filtre.matches(OSX_32))
        self.assertFalse(filtre.matches(WIN_X86_64))
        self.assertTrue(filtre.matches(UBUNTU_12_10_X32))
        self.assertTrue(filtre.matches(UBUNTU_14_04_X32))
        self.assertTrue(filtre.matches(UBUNTU_14_04_X64))
