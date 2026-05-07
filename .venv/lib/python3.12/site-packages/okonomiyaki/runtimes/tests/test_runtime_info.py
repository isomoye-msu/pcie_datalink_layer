import os.path
import sys
import unittest

from okonomiyaki.utils.test_data import (
    JULIA_DEFAULT_0_3_11_RH5_X86_64, JULIA_DEFAULT_0_3_11_WIN_X86_64,
    PYTHON_CPYTHON_2_7_10_RH5_X86_64, PYTHON_CPYTHON_2_7_10_WIN_X86_64)
from ..runtime_metadata import IRuntimeMetadata
from ..runtime_info import IRuntimeInfo


class TestPythonRuntimeInfoV1(unittest.TestCase):
    def test_simple(self):
        # Given
        name = u"test"
        prefix = os.path.abspath(os.path.join(u"foo", u"bar"))

        if sys.platform == "win32":
            path = PYTHON_CPYTHON_2_7_10_WIN_X86_64
            r_executable = os.path.join(prefix, "python.exe")
        else:
            path = PYTHON_CPYTHON_2_7_10_RH5_X86_64
            r_executable = os.path.join(prefix, "bin", "python")

        metadata = IRuntimeMetadata.factory_from_path(path)

        # When
        runtime_info = IRuntimeInfo.factory_from_metadata(
            metadata, prefix, name)

        # Then
        self.assertEqual(runtime_info.prefix, prefix)
        self.assertEqual(runtime_info.name, name)
        self.assertEqual(
            os.path.realpath(runtime_info.executable),
            os.path.realpath(r_executable))

    def test_dollar_in_prefix(self):
        # Given
        name = u"test"
        prefix = os.path.abspath(os.path.join(u"$foo", u"bar$"))

        if sys.platform == "win32":
            path = PYTHON_CPYTHON_2_7_10_WIN_X86_64
            r_executable = os.path.join(prefix, "python.exe")
        else:
            path = PYTHON_CPYTHON_2_7_10_RH5_X86_64
            r_executable = os.path.join(prefix, "bin", "python")

        metadata = IRuntimeMetadata.factory_from_path(path)

        # When
        runtime_info = IRuntimeInfo.factory_from_metadata(
            metadata, prefix, name)

        # Then
        self.assertEqual(runtime_info.prefix, prefix)
        self.assertEqual(runtime_info.name, name)
        self.assertEqual(
            os.path.realpath(runtime_info.executable),
            os.path.realpath(r_executable))

    def test_json_round_trip(self):
        # Given
        path = PYTHON_CPYTHON_2_7_10_RH5_X86_64
        metadata = IRuntimeMetadata.factory_from_path(path)
        name = u"test"
        prefix = os.path.abspath(os.path.join(u"foo", u"bar"))

        r_runtime_info = IRuntimeInfo.factory_from_metadata(
            metadata, prefix, name)

        # When
        runtime_info = IRuntimeInfo.factory_from_json_dict(
            r_runtime_info.to_json_dict())

        # Then
        self.assertEqual(runtime_info, r_runtime_info)


class TestJuliaRuntimeInfoV1(unittest.TestCase):
    def test_simple(self):
        # Given
        name = u"test"
        prefix = os.path.abspath(os.path.join(u"foo", u"bar"))

        if sys.platform == "win32":
            path = JULIA_DEFAULT_0_3_11_WIN_X86_64
            r_executable = os.path.join(prefix, "bin", "julia.exe")
        else:
            path = JULIA_DEFAULT_0_3_11_RH5_X86_64
            r_executable = os.path.join(prefix, "bin", "julia")

        metadata = IRuntimeMetadata.factory_from_path(path)

        # When
        runtime_info = IRuntimeInfo.factory_from_metadata(
            metadata, prefix, name)

        # Then
        self.assertEqual(runtime_info.prefix, prefix)
        self.assertEqual(runtime_info.name, name)
        self.assertEqual(
            os.path.realpath(runtime_info.executable),
            os.path.realpath(r_executable))

    def test_json_round_trip(self):
        # Given
        path = JULIA_DEFAULT_0_3_11_RH5_X86_64
        metadata = IRuntimeMetadata.factory_from_path(path)
        name = u"test"
        prefix = os.path.abspath(os.path.join(u"foo", u"bar"))

        r_runtime_info = IRuntimeInfo.factory_from_metadata(
            metadata, prefix, name)

        # When
        runtime_info = IRuntimeInfo.factory_from_json_dict(
            r_runtime_info.to_json_dict())

        # Then
        self.assertEqual(runtime_info, r_runtime_info)
