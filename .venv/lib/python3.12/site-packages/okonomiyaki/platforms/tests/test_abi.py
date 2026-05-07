import unittest

from parameterized import parameterized

from okonomiyaki.errors import OkonomiyakiError
from ..abi import default_abi

EXAMPLE_RUNTIMES = [
    ('osx_x86_64', 'cpython', '2.7.10+1', 'darwin'),
    ('rh5_x86_64', 'cpython', '2.7.10+1', 'gnu'),
    ('win_x86', 'cpython', '2.7.10+1', 'msvc2008'),
    ('win_x86', 'cpython', '3.4.3+1', 'msvc2010'),
    ('win_x86', 'cpython', '3.5.0+1', 'msvc2015'),
    ('win_x86', 'cpython', '3.6.0+1', 'msvc2015'),
    ('win_x86', 'cpython', '3.8.8+1', 'msvc2019'),
    ('osx_x86_64', 'pypy', '2.6.1+1', 'darwin'),
    ('rh5_x86_64', 'pypy', '2.6.1+1', 'gnu'),
    ('win_x86', 'pypy', '2.6.1+1', 'msvc2008'),
    ('osx_x86_64', 'julia', '0.3.11+1', 'darwin'),
    ('rh5_x86_64', 'julia', '0.3.11+1', 'gnu'),
    ('win_x86', 'julia', '0.3.11+1', 'mingw')]


class TestDefaultABI(unittest.TestCase):

    @parameterized.expand(sorted(EXAMPLE_RUNTIMES))
    def test_basics(self, platform, implementation, version, expected):
        # when
        abi = default_abi(platform, implementation, version)

        # then
        self.assertEqual(abi, expected)

    @parameterized.expand([
        ("win_x86", "pypy", "4.1.0+1"),
        ("rh5_x86_64", "r", "3.0.0+1")])
    def test_non_supported(self, *arguments):
        with self.assertRaises(OkonomiyakiError) as context:
            default_abi(*arguments)

        message = str(context.exception)
        self.assertNotIn('RuntimeVersion', message)
        if arguments[1] == 'r':
            self.assertIn('Unsupported implementation', message)
        else:
            self.assertIn('Platform', message)
