import unittest

from ..pep440 import _MIN, _MAX, PEP440Version
from okonomiyaki.errors import InvalidPEP440Version

V = PEP440Version.from_string


class TestMinMax(unittest.TestCase):
    def test_min(self):
        self.assertFalse(_MIN == 1)
        self.assertFalse(_MIN == _MAX)
        self.assertFalse(_MIN == "0")
        self.assertTrue(_MIN == _MIN)

        self.assertTrue(_MIN != 1)
        self.assertTrue(_MIN != _MAX)
        self.assertTrue(_MIN != "0")
        self.assertFalse(_MIN != _MIN)

        self.assertTrue(_MIN < 1)
        self.assertTrue(_MIN < _MAX)
        self.assertTrue(_MIN < "0")
        self.assertFalse(_MIN < _MIN)

        self.assertTrue(_MIN <= 1)
        self.assertTrue(_MIN <= _MAX)
        self.assertTrue(_MIN <= "0")
        self.assertTrue(_MIN <= _MIN)

        self.assertFalse(_MIN >= 1)
        self.assertFalse(_MIN >= _MAX)
        self.assertFalse(_MIN >= "0")
        self.assertTrue(_MIN >= _MIN)

        self.assertFalse(_MIN > 1)
        self.assertFalse(_MIN > _MAX)
        self.assertFalse(_MIN > "0")
        self.assertFalse(_MIN > _MIN)

    def test_max(self):
        self.assertFalse(_MAX == _MIN)
        self.assertFalse(_MAX == 1)
        self.assertFalse(_MAX == "0")
        self.assertTrue(_MAX == _MAX)

        self.assertTrue(_MAX != _MIN)
        self.assertTrue(_MAX != 1)
        self.assertTrue(_MAX != "0")
        self.assertFalse(_MAX != _MAX)

        self.assertFalse(_MAX < 1)
        self.assertFalse(_MAX < _MIN)
        self.assertFalse(_MAX < "0")
        self.assertFalse(_MAX < _MAX)

        self.assertFalse(_MAX <= 1)
        self.assertFalse(_MAX <= _MIN)
        self.assertFalse(_MAX <= "0")
        self.assertTrue(_MAX <= _MAX)

        self.assertTrue(_MAX >= 1)
        self.assertTrue(_MAX >= _MIN)
        self.assertTrue(_MAX >= "0")
        self.assertTrue(_MAX >= _MAX)

        self.assertTrue(_MAX > 1)
        self.assertTrue(_MAX > _MIN)
        self.assertTrue(_MAX > "0")
        self.assertFalse(_MAX > _MAX)


class TestPEP440Version(unittest.TestCase):
    def test_normalized_string(self):
        # Given
        version_strings = (
            ("1.0.0", "1"),
            ("1!1.0.0", "1!1"),
            ("1.0.0.dev1", "1.dev1"),
            ("2!1.0.0rc2.post2.dev1", "2!1rc2.post2.dev1"),
            ("2!1.0.0rc2.post2.dev1+1.2a", "2!1rc2.post2.dev1+1.2a"),
        )

        # When/Then
        for version_string, normalized in version_strings:
            version = V(version_string)
            self.assertEqual(version.normalized_string, normalized)

    def test_string(self):
        # Given
        version_strings = (
            "1.0.0",
            "1!1.0.0",
            "1.0.0.dev1",
            "2!1.0.0rc2.post2.dev1",
            "2!1.0.0rc2.post2.dev1+1.2a",
        )

        # When/Then
        for version_string in version_strings:
            self.assertEqual(str(V(version_string)), version_string)

    def test_comparison(self):
        self.assertTrue(V("1.2.0") == V("1.2"))
        self.assertFalse(V("1.2.0") == V("1.2.3"))
        self.assertTrue(V("1.2.0") != V("1.2.3"))
        self.assertTrue(V("1.2.0") < V("1.2.3"))
        self.assertFalse(V("1.2.3") < V("1.2.0"))
        self.assertTrue(V("1.2.0") <= V("1.2.3"))
        self.assertFalse(V("1.2.3") <= V("1.2.0"))
        self.assertTrue(V("1.2.0") >= V("1.2.0"))
        self.assertTrue(V("1.2.3") >= V("1.2.0"))
        self.assertFalse(V("1.2.0") >= V("1.2.3"))
        self.assertFalse(V("1.2.0rc1") >= V("1.2.0"))
        self.assertTrue(V("1.0") > V("1.0b2"))
        self.assertTrue(V("1.0") > V("1.0rc2"))
        self.assertTrue(V("1.0rc2") > V("1.0rc1"))
        self.assertTrue(V("1.0rc4") > V("1.0rc1"))

        self.assertTrue(
            V('1.0') > V('1.0rc2') > V('1.0rc1') > V('1.0b2') > V('1.0b1')
            > V('1.0a2') > V('1.0a1')
        )
        self.assertTrue(
            V('1.0.0') > V('1.0.0rc2') > V('1.0.0rc1') > V('1.0.0b2')
            > V('1.0.0b1') > V('1.0.0a2') > V('1.0.0a1')
        )
        self.assertTrue(
            V('1.0') < V('1.0.post456.dev623')
        )

        self.assertTrue(
            V('1.0.post456.dev623') < V('1.0.post456') < V('1.0.post1234')
        )

        self.assertTrue(
            V('1.0.dev7')
            < V('1.0.dev18')
            < V('1.0.dev456')
            < V('1.0.dev1234')
            < V('1.0a1')
            < V('1.0a2.dev456')
            < V('1.0a2')
            # e.g. need to do a quick post release on 1.0a2
            < V('1.0a2.post1.dev456')
            < V('1.0a2.post1')
            < V('1.0b1.dev456')
            < V('1.0b2')
            < V('1.0rc1.dev456')
            < V('1.0rc1')
            < V('1.0rc1+1')
            < V('1.0rc1+1.1')
            < V('1.0rc2')
            < V('1.0')
            < V('1.0+1')
            < V('1.0+1.1')
            # development version of a post release
            < V('1.0.post456.dev623')
            < V('1.0.post456.dev623+1')
            < V('1.0.post456.dev623+1.1')
            < V('1.0.post456')
            < V('1.0.post456+a.1')
            < V('1.0.post456+1')
            < V('1.0.post456+1.1')
        )

        self.assertLessEqual(V('1.2.0rc1'), V('1.2.0'))
        self.assertGreater(V('1.0'), V('1.0rc2'))
        self.assertGreater(V('1.0'), V('1.0rc2'))
        self.assertGreater(V('1.0rc2'), V('1.0rc1'))
        self.assertGreater(V('1.0rc4'), V('1.0rc1'))

    def test_hashing(self):
        # Given
        v1 = V("1.2.0")
        v2 = V("1.2.0")

        # When/Then
        self.assertEqual(hash(v1), hash(v2))

    def test_repr(self):
        # Given
        v1 = V("1.2.0")

        # When
        result = repr(v1)

        # Then
        self.assertEqual(result, "PEP440Version.from_string('1.2.0')")
        self.assertEqual(eval(result), v1)

    def test_invalid(self):
        # Given
        left = V("1.0")
        right = "1.0"

        # When/Then
        with self.assertRaises(TypeError):
            left == right
        with self.assertRaises(TypeError):
            left != right
        with self.assertRaises(TypeError):
            left < right
        with self.assertRaises(TypeError):
            left <= right
        with self.assertRaises(TypeError):
            left >= right
        with self.assertRaises(TypeError):
            left > right

        # When/Then
        with self.assertRaises(InvalidPEP440Version):
            V("a")
