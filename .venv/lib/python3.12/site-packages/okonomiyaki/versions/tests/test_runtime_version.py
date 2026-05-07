import unittest

from ..runtime_version import RuntimeVersion

V = RuntimeVersion.from_string


# We don't test much here, the idea being that most of the underlying
# comparison is tested in the underlying implementation of RuntimeVersion
class TestRuntimeVersion(unittest.TestCase):
    def test_major_minor_micro(self):
        # Given
        s = "1.2.1"

        # When
        v = V(s)

        # Then
        self.assertEqual((v.major, v.minor, v.micro), (1, 2, 1))
        self.assertEqual(v.numpart, "1.2.1")

        # Given
        s = "1.2.0"

        # When
        v = V(s)

        # Then
        self.assertEqual((v.major, v.minor, v.micro), (1, 2, 0))
        self.assertEqual(v.numpart, "1.2.0")

        # Given
        s = "1.0.0"

        # When
        v = V(s)

        # Then
        self.assertEqual((v.major, v.minor, v.micro), (1, 0, 0))
        self.assertEqual(v.numpart, "1.0.0")

    def test_hashing(self):
        v1 = V("1.2.0")
        v2 = V("1.2.0")

        self.assertEqual(hash(v1), hash(v2))

    def test_str(self):
        self.assertEqual(str(V("1.2.0")), "1.2.0")
        self.assertEqual(V("1.2.0").normalized_string, "1.2")

    def test_repr(self):
        # given
        v1 = V("1.2.0")

        # when
        result = repr(v1)

        # then
        self.assertEqual(result, "RuntimeVersion.from_string('1.2.0')")
        self.assertEqual(eval(result), v1)

    def test_simple(self):
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

        with self.assertRaises(TypeError):
            self.assertTrue(V("1.2.0") == "1.2")
