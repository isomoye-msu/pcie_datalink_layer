import unittest
from unittest import mock

from parameterized import parameterized

from okonomiyaki.errors import InvalidMetadataField
from ..python_implementation import PythonABI, PythonImplementation


class TestPythonImplementation(unittest.TestCase):

    @parameterized.expand([
        ('2', '7', 'cp27'), ('3', '8', 'cp38'),
        ('4', '15', 'cp415'), ('3', '11', 'cp311')])
    def test_creation(self, major, minor, r_tag):
        # Given
        kind = 'cpython'

        # When
        tag = PythonImplementation(kind, major, minor)

        # Then
        self.assertEqual(tag.abbreviated_implementation, 'cp')
        self.assertEqual(str(tag), r_tag)
        self.assertIsInstance(str(tag), str)

    def test_from_running_python(self):
        # When
        with mock.patch(
                'okonomiyaki.platforms.python_implementation.'
                '_abbreviated_implementation',
                return_value='cp'):
            with mock.patch('sys.version_info', (2, 7, 9, 'final', 0)):
                py = PythonImplementation.from_running_python()

        # Then
        self.assertEqual(py.pep425_tag, 'cp27')

        # When
        with mock.patch('sys.pypy_version_info', 'pypy 1.9', create=True):
            with mock.patch('sys.version_info', (2, 7, 9, 'final', 0)):
                py = PythonImplementation.from_running_python()

        # Then
        self.assertEqual(py.pep425_tag, 'pp27')

        # When
        with mock.patch('sys.platform', 'java 1.7', create=True):
            with mock.patch('sys.version_info', (2, 7, 9, 'final', 0)):
                py = PythonImplementation.from_running_python()

        # Then
        self.assertEqual(py.pep425_tag, 'jy27')

        # When
        with mock.patch('sys.platform', 'cli', create=True):
            with mock.patch('sys.version_info', (2, 7, 9, 'final', 0)):
                py = PythonImplementation.from_running_python()

        # Then
        self.assertEqual(py.pep425_tag, 'ip27')

    @parameterized.expand([
        ('cpython', 'cp'), ('python', 'py'),
        ('pypy', 'pp'), ('dummy', 'dummy')])
    def test_abbreviations(self, kind, r_abbreviated):
        # Given
        major = 2
        minor = 7

        # When
        tag = PythonImplementation(kind, major, minor)

        # Then
        self.assertEqual(tag.abbreviated_implementation, r_abbreviated)

    @parameterized.expand([
        (2, 7, 'cp27'), (3, 8, 'cp38'),
        (3, 4, 'cpython34'), (4, 5, 'cp4_5'),
        (24, 7, 'cp24_7'), (4, 15, 'cp415'), (3, 11, 'cp311')])
    def test_from_string(self, major, minor, tag_string):
        # When
        tag = PythonImplementation.from_string(tag_string)

        # Then
        self.assertEqual(tag.kind, 'cpython')
        self.assertEqual(tag.major, major)
        if minor is not None:
            self.assertEqual(tag.minor, minor)

    @parameterized.expand([('cp2',), ('py3',), ('cp',), ('pp4567',)])
    def test_from_string_errors(self, data):
        # When/Then
        message = r"^Invalid value for metadata field 'python_tag': '{}'$"
        with self.assertRaisesRegex(
                InvalidMetadataField, message.format(data)):
            PythonImplementation.from_string(data)


class TestPythonABI(unittest.TestCase):

    def test_pep425_tag_string_none(self):
        # Given
        abi_tag = None

        # When
        abi_tag_string = PythonABI.pep425_tag_string(abi_tag)

        # Then
        self.assertEqual(abi_tag_string, 'none')
        self.assertIsInstance(abi_tag_string, str)

    def test_pep425_tag_string(self):
        # Given
        abi_tag = PythonABI('cp27m')

        # When
        abi_tag_string = PythonABI.pep425_tag_string(abi_tag)

        # Then
        self.assertEqual(abi_tag_string, 'cp27m')
        self.assertIsInstance(abi_tag_string, str)
