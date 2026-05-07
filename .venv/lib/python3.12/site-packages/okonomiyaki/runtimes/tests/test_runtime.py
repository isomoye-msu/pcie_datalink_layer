import sys
import os.path
import unittest

from okonomiyaki.platforms import EPDPlatform
from okonomiyaki.versions import RuntimeVersion
from okonomiyaki.utils.testing import known_system

from ..runtime import PythonRuntime


NORM_EXEC_PREFIX = os.path.normpath(sys.exec_prefix)
NORM_EXECUTABLE = os.path.normpath(sys.executable)


class TestPythonRuntime(unittest.TestCase):

    @unittest.skipIf(
        not known_system(),
        'This test should be executed only on Enthought supported platforms')
    def test_simple_from_running_python(self):
        # When
        runtime_info = PythonRuntime.from_running_python()

        # Then
        self.assertEqual(runtime_info.prefix, NORM_EXEC_PREFIX)
        self.assertTrue(
            os.path.samefile(runtime_info.executable, NORM_EXECUTABLE))

    @unittest.skipIf(
        hasattr(sys, "pypy_version_info"),
        "This test is only supported on cpython")
    def test_from_prefix_and_platform(self):
        # Given
        prefix = u"/usr/local"
        platform = EPDPlatform.from_epd_string("rh5-64").platform
        version = RuntimeVersion.from_string("3.4.3+final.0")

        # When
        runtime = PythonRuntime.from_prefix_and_platform(
            prefix, platform, version)
        runtime_info = runtime._runtime_info

        # Then
        self.assertEqual(runtime.executable, prefix + "/bin/python3")
        self.assertEqual(runtime.prefix, prefix)
        self.assertEqual(runtime.scriptsdir, prefix + "/bin")
        self.assertEqual(
            runtime.site_packages,
            prefix + "/lib/python3.4/site-packages")

        self.assertEqual(str(runtime_info.version), "3.4.3+final.0")
        self.assertEqual(str(runtime_info.language_version), "3.4.3")

        # Given
        prefix = u"/usr/local"
        platform = EPDPlatform.from_epd_string("osx-64").platform
        version = RuntimeVersion.from_string("2.7.9+final.0")

        # When
        runtime = PythonRuntime.from_prefix_and_platform(
            prefix, platform, version)

        # Then
        self.assertEqual(runtime.prefix, prefix)
        self.assertEqual(runtime.scriptsdir, prefix + "/bin")
        self.assertEqual(
            runtime.site_packages,
            prefix + "/lib/python2.7/site-packages")

        # Given
        prefix = u"C:\\Python34"
        platform = EPDPlatform.from_epd_string("win-64").platform
        version = RuntimeVersion.from_string("3.4.3+final.0")

        # When
        runtime = PythonRuntime.from_prefix_and_platform(
            prefix, platform, version)

        # Then
        self.assertEqual(runtime.prefix, prefix)
        self.assertEqual(runtime.scriptsdir, prefix + "\\Scripts")
        self.assertEqual(
            runtime.site_packages, prefix + "\\Lib\\site-packages")

    def test_normalization(self):
        # Given
        prefix = u"/usr/local/bin/.."
        norm_prefix = u"/usr/local"
        platform = EPDPlatform.from_epd_string("osx-64").platform
        version = RuntimeVersion.from_string("2.7.9+final.0")

        # When
        runtime_info = PythonRuntime.from_prefix_and_platform(
            prefix, platform, version)

        # Then
        self.assertEqual(runtime_info.prefix, norm_prefix)
        self.assertEqual(runtime_info.scriptsdir, norm_prefix + "/bin")
        self.assertEqual(
            runtime_info.site_packages,
            norm_prefix + "/lib/python2.7/site-packages")
