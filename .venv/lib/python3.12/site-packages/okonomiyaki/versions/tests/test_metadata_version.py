import unittest

from okonomiyaki.errors import InvalidMetadataVersion

from .. import MetadataVersion


class TestMetadataVersion(unittest.TestCase):
    def test_simple(self):
        # Given
        s = "1.0"

        # When
        v = MetadataVersion.from_string(s)

        # Then
        self.assertEqual(v.major, 1)
        self.assertEqual(v.minor, 0)

    def test_comparison(self):
        # Given
        version_strings = ("0.4", "0.7", "1.0", "1.2", "2.0")
        versions = tuple(
            MetadataVersion.from_string(s) for s in version_strings
        )

        # When/Then
        for left, right in zip(versions[:-1], versions[1:]):
            self.assertTrue(left < right)
            self.assertTrue(left <= right)
            self.assertFalse(left > right)
            self.assertFalse(left >= right)

    def test_equal_hash(self):
        # Given
        s = "1.0"

        # When
        v1 = MetadataVersion.from_string(s)
        v2 = MetadataVersion.from_string(s)

        # Then
        self.assertTrue(v1 == v2)
        self.assertFalse(v1 != v2)
        self.assertEqual(hash(v1), hash(v2))

        # Given
        s1 = "1.0"
        s2 = "1.1"

        # When
        v1 = MetadataVersion.from_string(s1)
        v2 = MetadataVersion.from_string(s2)

        # Then
        self.assertTrue(v1 != v2)
        self.assertFalse(v1 == v2)

    def test_invalid(self):
        # Given
        s = "1"

        # When/Then
        with self.assertRaises(InvalidMetadataVersion):
            MetadataVersion.from_string(s)

        # Given
        s = "1.0"

        # When
        v = MetadataVersion.from_string(s)

        # Then
        self.assertFalse(v == 2)
