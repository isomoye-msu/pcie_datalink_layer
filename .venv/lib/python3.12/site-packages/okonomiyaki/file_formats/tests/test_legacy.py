import unittest

from parameterized import parameterized

from okonomiyaki.platforms import EPDPlatform
from ..legacy import _guess_platform_abi, _guess_abi_tag


class TestGuessPlatformABI(unittest.TestCase):

    #: Known platforms that at some point have been uploaded into an EDS
    #: server.
    CONFIGURATIONS = [
        ('cp27', 'osx_x86', 'darwin'),
        ('cp27', 'osx_x86_64', 'darwin'),
        ('cp27', 'rh5_x86', 'gnu'),
        ('cp27', 'rh5_x86_64', 'gnu'),
        ('cp27', 'win_x86', 'msvc2008'),
        ('cp27', 'win_x86_64', 'msvc2008'),
        ('cp30', 'osx_x86', 'darwin'),
        ('cp30', 'osx_x86_64', 'darwin'),
        ('cp30', 'rh5_x86', 'gnu'),
        ('cp30', 'rh5_x86_64', 'gnu'),
        ('cp30', 'win_x86', 'msvc2008'),
        ('cp30', 'win_x86_64', 'msvc2008'),
        ('cp31', 'osx_x86', 'darwin'),
        ('cp31', 'osx_x86_64', 'darwin'),
        ('cp31', 'rh5_x86', 'gnu'),
        ('cp31', 'rh5_x86_64', 'gnu'),
        ('cp31', 'win_x86', 'msvc2008'),
        ('cp31', 'win_x86_64', 'msvc2008'),
        ('cp32', 'osx_x86', 'darwin'),
        ('cp32', 'osx_x86_64', 'darwin'),
        ('cp32', 'rh5_x86', 'gnu'),
        ('cp32', 'rh5_x86_64', 'gnu'),
        ('cp32', 'win_x86', 'msvc2008'),
        ('cp32', 'win_x86_64', 'msvc2008'),
        ('cp33', 'osx_x86', 'darwin'),
        ('cp33', 'osx_x86_64', 'darwin'),
        ('cp33', 'rh5_x86', 'gnu'),
        ('cp33', 'rh5_x86_64', 'gnu'),
        ('cp33', 'win_x86', 'msvc2010'),
        ('cp33', 'win_x86_64', 'msvc2010'),
        ('cp34', 'osx_x86', 'darwin'),
        ('cp34', 'osx_x86_64', 'darwin'),
        ('cp34', 'rh5_x86', 'gnu'),
        ('cp34', 'rh5_x86_64', 'gnu'),
        ('cp34', 'win_x86', 'msvc2010'),
        ('cp34', 'win_x86_64', 'msvc2010'),
        ('cp36', 'osx_x86', 'darwin'),
        ('cp36', 'osx_x86_64', 'darwin'),
        ('cp36', 'rh6_x86', 'gnu'),
        ('cp36', 'rh6_x86_64', 'gnu'),
        ('cp36', 'rh7_x86', 'gnu'),
        ('cp36', 'rh7_x86_64', 'gnu'),
        ('cp36', 'win_x86', 'msvc2015'),
        ('cp36', 'win_x86_64', 'msvc2015'),
        ('cp38', 'osx_x86', 'darwin'),
        ('cp38', 'osx_x86_64', 'darwin'),
        ('cp38', 'rh7_x86', 'gnu'),
        ('cp38', 'rh7_x86_64', 'gnu'),
        ('cp38', 'win_x86', 'msvc2019'),
        ('cp38', 'win_x86_64', 'msvc2019'),
        ('ip27', 'osx_x86', 'darwin'),
        ('ip27', 'osx_x86_64', 'darwin'),
        ('ip27', 'rh5_x86', 'gnu'),
        ('ip27', 'rh5_x86_64', 'gnu'),
        ('ip27', 'win_x86', 'msvc2008'),
        ('ip27', 'win_x86_64', 'msvc2008'),
        ('jy27', 'osx_x86', 'darwin'),
        ('jy27', 'osx_x86_64', 'darwin'),
        ('jy27', 'rh5_x86', 'gnu'),
        ('jy27', 'rh5_x86_64', 'gnu'),
        ('jy27', 'win_x86', 'msvc2008'),
        ('jy27', 'win_x86_64', 'msvc2008'),
        ('pp27', 'osx_x86', 'darwin'),
        ('pp27', 'osx_x86_64', 'darwin'),
        ('pp27', 'rh5_x86', 'gnu'),
        ('pp27', 'rh5_x86_64', 'gnu'),
        ('pp27', 'win_x86', 'msvc2008'),
        ('pp27', 'win_x86_64', 'msvc2008')]

    @parameterized.expand(sorted(CONFIGURATIONS))
    def test_known_cases(self, tag, platform, expected):
        # given
        epd_platform = EPDPlatform.from_string(platform)

        # when
        result = _guess_platform_abi(epd_platform, tag)

        # then
        self.assertEqual(
            result, expected,
            msg="{} gives {} instead of {}".format(
                (tag, platform), result, expected))

    def test_no_platform(self):
        # Given
        platform = None
        python_tag = "cp27"

        # When
        abi = _guess_platform_abi(platform, python_tag)

        # Then
        self.assertIsNone(abi)

        # Given
        python_tag = "cp34"

        # When
        abi = _guess_platform_abi(platform, python_tag)

        # Then
        self.assertIsNone(abi)

    def test_no_python_implementation(self):
        # Given
        platform = EPDPlatform.from_epd_string("rh5-64")

        # When
        abi = _guess_platform_abi(platform, None)

        # Then
        self.assertEqual(abi, "gnu")

        # Given
        platform = EPDPlatform.from_epd_string("osx-64")

        # When
        abi = _guess_platform_abi(platform, None)

        # Then
        self.assertEqual(abi, "darwin")

        # Given
        platform = EPDPlatform.from_epd_string("win-64")

        # When
        abi = _guess_platform_abi(platform, None)

        # Then
        self.assertEqual(abi, "msvc2008")


class TestGuessABITag(unittest.TestCase):

    #: Known platforms that at some point have been uploaded into an EDS
    #: server. Note that only cpython and pypy implementations are
    #: supported
    CONFIGURATIONS = [
        ('cp27', 'osx_x86', 'cp27m'),
        ('cp27', 'osx_x86_64', 'cp27m'),
        ('cp27', 'rh5_x86', 'cp27m'),
        ('cp27', 'rh5_x86_64', 'cp27m'),
        ('cp27', 'win_x86', 'cp27m'),
        ('cp27', 'win_x86_64', 'cp27m'),
        ('cp30', 'osx_x86', 'cp30m'),
        ('cp30', 'osx_x86_64', 'cp30m'),
        ('cp30', 'rh5_x86', 'cp30m'),
        ('cp30', 'rh5_x86_64', 'cp30m'),
        ('cp30', 'win_x86', 'cp30m'),
        ('cp30', 'win_x86_64', 'cp30m'),
        ('cp31', 'osx_x86', 'cp31m'),
        ('cp31', 'osx_x86_64', 'cp31m'),
        ('cp31', 'rh5_x86', 'cp31m'),
        ('cp31', 'rh5_x86_64', 'cp31m'),
        ('cp31', 'win_x86', 'cp31m'),
        ('cp31', 'win_x86_64', 'cp31m'),
        ('cp32', 'osx_x86', 'cp32m'),
        ('cp32', 'osx_x86_64', 'cp32m'),
        ('cp32', 'rh5_x86', 'cp32m'),
        ('cp32', 'rh5_x86_64', 'cp32m'),
        ('cp32', 'win_x86', 'cp32m'),
        ('cp32', 'win_x86_64', 'cp32m'),
        ('cp33', 'osx_x86', 'cp33m'),
        ('cp33', 'osx_x86_64', 'cp33m'),
        ('cp33', 'rh5_x86', 'cp33m'),
        ('cp33', 'rh5_x86_64', 'cp33m'),
        ('cp33', 'win_x86', 'cp33m'),
        ('cp33', 'win_x86_64', 'cp33m'),
        ('cp34', 'osx_x86', 'cp34m'),
        ('cp34', 'osx_x86_64', 'cp34m'),
        ('cp34', 'rh5_x86', 'cp34m'),
        ('cp34', 'rh5_x86_64', 'cp34m'),
        ('cp34', 'win_x86', 'cp34m'),
        ('cp34', 'win_x86_64', 'cp34m'),
        ('cp36', 'osx_x86', 'cp36m'),
        ('cp36', 'osx_x86_64', 'cp36m'),
        ('cp36', 'rh6_x86', 'cp36m'),
        ('cp36', 'rh6_x86_64', 'cp36m'),
        ('cp36', 'rh7_x86', 'cp36m'),
        ('cp36', 'rh7_x86_64', 'cp36m'),
        ('cp36', 'win_x86', 'cp36m'),
        ('cp36', 'win_x86_64', 'cp36m'),
        ('cp38', 'osx_x86', 'cp38'),
        ('cp38', 'osx_x86_64', 'cp38'),
        ('cp38', 'rh7_x86', 'cp38'),
        ('cp38', 'rh7_x86_64', 'cp38'),
        ('cp38', 'win_x86', 'cp38'),
        ('cp38', 'win_x86_64', 'cp38'),
        ('pp27', 'osx_x86', 'cp27m'),
        ('pp27', 'osx_x86_64', 'cp27m'),
        ('pp27', 'rh5_x86', 'cp27m'),
        ('pp27', 'rh5_x86_64', 'cp27m'),
        ('pp27', 'win_x86', 'cp27m'),
        ('pp27', 'win_x86_64', 'cp27m')]

    @parameterized.expand(sorted(CONFIGURATIONS))
    def test_known_cases(self, tag, platform, expected):
        # given
        epd_platform = EPDPlatform.from_string(platform)

        # when
        result = _guess_abi_tag(epd_platform, tag)

        # then
        self.assertEqual(
            result, expected,
            msg="{} gives {} instead of {}".format(
                (tag, platform), result, expected))

    @parameterized.expand(
        [('cp27',), ('cp30',), ('cp31',), ('cp34',), ('cp36',), ('cp38',)])
    def test_no_platform(self, python_tag):
        # When
        abi = _guess_abi_tag(None, python_tag)

        # Then
        self.assertIsNone(abi)

    @parameterized.expand(
        [('rh5-64',), ('rh6-64',), ('rh7-64',), ('win-32',), ('win-64',), ('osx-64',)])
    def test_no_python_implementation(self, platform_tag):
        # Given
        platform = EPDPlatform.from_epd_string(platform_tag)

        # When
        abi = _guess_abi_tag(platform, None)

        # Then
        self.assertIsNone(abi)
