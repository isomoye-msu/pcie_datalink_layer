import unittest

from parameterized import parameterized

from okonomiyaki.file_formats import EggMetadata
from okonomiyaki.platforms import PlatformABI

from ..test_data import CP38_EGGS, CP27_EGGS, CP311_EGGS


class TestDummyEggs(unittest.TestCase):

    @parameterized.expand(CP38_EGGS)
    def test_cp38_egg_metadata_valid(self, filepath):
        # when
        metadata = EggMetadata.from_egg(filepath)
        filepath = filepath.lower()

        # then
        if 'mkl' in metadata.name:
            self.assertEqual(metadata.python_tag, None)
            self.assertEqual(metadata.abi_tag, None)
        else:
            self.assertEqual(metadata.python_tag, 'cp38')
            self.assertEqual(metadata.abi_tag, 'cp38')
        if 'osx_x86_64' in filepath:
            self.assertEqual(metadata.platform_tag, 'macosx_10_14_x86_64')
            self.assertEqual(metadata.platform_abi, PlatformABI(u'darwin'))
        elif 'win_x86_64' in filepath:
            self.assertEqual(metadata.platform_tag, 'win_amd64')
            self.assertEqual(metadata.platform_abi, PlatformABI(u'msvc2019'))
        else:
            self.assertEqual(metadata.platform_tag, 'linux_x86_64')
            self.assertEqual(metadata.platform_abi, PlatformABI(u'gnu'))

    @parameterized.expand(CP311_EGGS)
    def test_cp311_egg_metadata_valid(self, filepath):
        # when
        metadata = EggMetadata.from_egg(filepath)
        filepath = filepath.lower()

        # then
        if 'mkl' in metadata.name:
            self.assertEqual(metadata.python_tag, None)
            self.assertEqual(metadata.abi_tag, None)
        else:
            self.assertEqual(metadata.python_tag, 'cp311')
            self.assertEqual(metadata.abi_tag, 'cp311')
        if 'osx_x86_64' in filepath:
            self.assertEqual(metadata.platform_tag, 'macosx_12_0_x86_64')
            self.assertEqual(metadata.platform_abi, PlatformABI(u'darwin'))
        elif 'win_x86_64' in filepath:
            self.assertEqual(metadata.platform_tag, 'win_amd64')
            self.assertEqual(metadata.platform_abi, PlatformABI(u'msvc2022'))
        elif 'osx_arm64' in filepath:
            self.assertEqual(metadata.platform_tag, 'macosx_12_0_arm64')
            self.assertEqual(metadata.platform_abi, PlatformABI(u'darwin'))
        elif 'win_arm64' in filepath:
            self.assertEqual(metadata.platform_tag, 'win_arm64')
            self.assertEqual(metadata.platform_abi, PlatformABI(u'msvc2022'))
        elif 'rh8_arm64' in filepath:
            self.assertEqual(metadata.platform_tag, 'linux_aarch64')
            self.assertEqual(metadata.platform_abi, PlatformABI(u'gnu'))
        else:
            self.assertEqual(metadata.platform_tag, 'linux_x86_64')
            self.assertEqual(metadata.platform_abi, PlatformABI(u'gnu'))

    @parameterized.expand(CP27_EGGS)
    def test_cp27_egg_metadata_valid(self, filepath):
        # when
        metadata = EggMetadata.from_egg(filepath)
        filepath = filepath.lower()

        # then
        if 'mkl' in metadata.name:
            self.assertEqual(metadata.python_tag, None)
            self.assertEqual(metadata.abi_tag, None)
        else:
            self.assertIn(metadata.python_tag, 'cp27')
            self.assertIn(metadata.abi_tag, 'cp27m')
        if 'osx_x86_64' in filepath:
            self.assertEqual(metadata.platform_tag, 'macosx_10_6_x86_64')
            self.assertEqual(metadata.platform_abi, PlatformABI(u'darwin'))
        elif 'win_x86_64' in filepath:
            self.assertEqual(metadata.platform_tag, 'win_amd64')
            self.assertEqual(metadata.platform_abi, PlatformABI(u'msvc2008'))
        else:
            self.assertEqual(metadata.platform_tag, 'linux_x86_64')
            self.assertEqual(metadata.platform_abi, PlatformABI(u'gnu'))
