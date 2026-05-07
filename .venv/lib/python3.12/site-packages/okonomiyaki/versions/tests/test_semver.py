import re
import unittest


from ..enpkg import EnpkgVersion
from ..semver import SemanticVersion, _PrereleaseParts
from okonomiyaki.errors import InvalidSemanticVersion


class TestSemanticVersion(unittest.TestCase):
    def test_hashing(self):
        # Given
        s1 = "1.0.0+001"

        # When
        v1 = SemanticVersion.from_string(s1)
        v2 = SemanticVersion.from_string(s1)

        # Then
        self.assertEqual(v1, v2)
        self.assertEqual(hash(v1), hash(v2))

    def test_roundtrip(self):
        # Given
        s1 = "1.0.0"

        # When
        v = SemanticVersion.from_string(s1)

        # Then
        self.assertEqual(str(v), s1)

        # Given
        s1 = "1.0.0-alpha"

        # When
        v = SemanticVersion.from_string(s1)

        # Then
        self.assertEqual(str(v), s1)

        # Given
        s1 = "1.0.0-alpha+001"

        # When
        v = SemanticVersion.from_string(s1)

        # Then
        self.assertEqual(str(v), s1)

        # Given
        s1 = "1.0.0+001"

        # When
        v = SemanticVersion.from_string(s1)

        # Then
        self.assertEqual(str(v), s1)

        # Given
        s1 = "1.0.0-0.3.7"

        # When
        v = SemanticVersion.from_string(s1)

        # Then
        self.assertEqual(str(v), s1)

    def test_comparison_simple(self):
        # Given
        version_strings = ["1.0.0", "2.0.0", "2.1.0", "2.1.1"]

        # When
        versions = [SemanticVersion.from_string(s) for s in version_strings]

        # Then
        self.assertTrue(
            versions[0] != versions[1] != versions[2] != versions[3]
        )
        self.assertTrue(versions[0] < versions[1] < versions[2] < versions[3])
        self.assertTrue(versions[3] > versions[2] > versions[1] > versions[0])
        self.assertTrue(
            versions[0] <= versions[1] <= versions[2] <= versions[3]
        )
        self.assertTrue(
            versions[3] >= versions[2] >= versions[1] >= versions[0]
        )

    def test_comparison_pre_release(self):
        # Given
        version_strings = [
            "1.0.0-0.3.7", "1.0.0-alpha", "1.0.0-alpha.1", "1.0.0-alpha.2",
            # Note the 2 digits, to ensure we compare correctly purely
            # numerical part
            "1.0.0-alpha.10",
            "1.0.0-beta",
            "1.0.0-rc",
            "1.0.0-rc.1",
            "1.0.0",
        ]

        # When
        versions = [SemanticVersion.from_string(s) for s in version_strings]

        # Then
        self.assertTrue(
            versions[0] < versions[1] < versions[2] < versions[3]
            < versions[4] < versions[5] < versions[6] < versions[7]
            < versions[8]
        )
        self.assertTrue(
            versions[0] <= versions[1] <= versions[2] <= versions[3]
            <= versions[4] <= versions[5] <= versions[6] <= versions[7]
            <= versions[8]
        )
        self.assertTrue(
            versions[8] >= versions[7] >= versions[6] >= versions[5]
            >= versions[4] >= versions[3] >= versions[2] >= versions[1]
            >= versions[0]
        )
        self.assertTrue(
            versions[8] > versions[7] > versions[6] > versions[5]
            > versions[4] > versions[3] > versions[2] > versions[1]
            > versions[0]
        )

        # Given
        s1 = "1.0.0-0.3.7"
        s2 = "1.0.0-0.3.7"

        # When
        v1 = SemanticVersion.from_string(s1)
        v2 = SemanticVersion.from_string(s2)

        # Then
        self.assertFalse(v1 < v2)
        self.assertFalse(v1 > v2)
        self.assertTrue(v1 <= v2)
        self.assertTrue(v1 >= v2)

    def test_comparison_build(self):
        # Given
        version_strings = ["1.0.0-alpha", "1.0.0-alpha+1", "1.0.0-alpha+2"]

        # When
        versions = [SemanticVersion.from_string(s) for s in version_strings]

        # Then
        self.assertTrue(versions[0] == versions[1] == versions[2])

        # Given
        version_strings = ["1.0.0-alpha+3", "1.0.0-beta+2", "1.0.0-rc+1"]

        # When
        versions = [SemanticVersion.from_string(s) for s in version_strings]

        # Then
        self.assertTrue(versions[0] < versions[1] < versions[2])

    def test_invalid_versions(self):
        # Given
        invalid_strings = (
            '1',
            'v1',
            '1.2.3.4',
            '1.2',
            '1.2.03',
            '1.2b3',
            '1.2.3b4',
            'v12.34.5',
            '1.2.3+4+5',
            '1.2.3-alpha.01+4+5',
        )

        # When/Then
        for v in invalid_strings:
            with self.assertRaises(InvalidSemanticVersion):
                SemanticVersion.from_string(v)

        # Given
        version_string = "1.2.03"
        r_output = re.compile(
            r"Invalid semantic version '1.2.03' \(Patch number "
            r"cannot have leading 0: '03'\)$"
        )

        # When/Then
        with self.assertRaisesRegex(InvalidSemanticVersion, r_output):
            SemanticVersion.from_string(version_string)

    def test_other_object(self):
        # Given
        v = SemanticVersion.from_string("1.2.3")
        other = EnpkgVersion.from_string("1.2.3-1")

        # Then
        self.assertFalse(v == other)
        self.assertTrue(v != other)

        # When/Then
        with self.assertRaises(TypeError):
            v >= other
        with self.assertRaises(TypeError):
            v <= other
        with self.assertRaises(TypeError):
            v < other
        with self.assertRaises(TypeError):
            v > other

        # Given
        v = SemanticVersion.from_string("1.2.3-alpha")

        # Then
        self.assertFalse(v == other)
        self.assertTrue(v != other)

        # When/Then
        with self.assertRaises(TypeError):
            v >= other
        with self.assertRaises(TypeError):
            v <= other
        with self.assertRaises(TypeError):
            v < other
        with self.assertRaises(TypeError):
            v > other


class Test_PreReleaseParts(unittest.TestCase):
    def test_empty_takes_precedence(self):
        # Given
        parts1 = _PrereleaseParts(tuple())
        parts2 = _PrereleaseParts(("alpha", "1"))

        # Then
        self.assertFalse(parts1 < parts2)
        self.assertFalse(parts1 <= parts2)
        self.assertTrue(parts1 >= parts2)
        self.assertTrue(parts1 > parts2)
        self.assertFalse(parts1 == parts2)
        self.assertTrue(parts1 != parts2)

    def test_numerical_vs_string(self):
        # Given
        parts1 = _PrereleaseParts(("alpha", "beta"))
        parts2 = _PrereleaseParts(("alpha", "1"))

        # Then
        self.assertFalse(parts1 < parts2)
        self.assertFalse(parts1 <= parts2)
        self.assertTrue(parts1 >= parts2)
        self.assertTrue(parts1 > parts2)
        self.assertFalse(parts1 == parts2)
        self.assertTrue(parts1 != parts2)

        # Given
        parts = [
            ("0", "3", "7"), ("alpha",), ("alpha", "1"), ("alpha", "2"),
            # Note the 2 digits, to ensure we compare correctly purely
            # numerical part
            ("alpha", "10"),
            ("beta",), ("rc",), ("rc", "1"), tuple()
        ]

        # Then
        for left, right in zip(parts[:-1], parts[1:]):
            left_parts = _PrereleaseParts(left)
            right_parts = _PrereleaseParts(right)
            self.assertTrue(left_parts < right_parts)
            self.assertTrue(left_parts <= right_parts)
            self.assertFalse(left_parts >= right_parts)
            self.assertFalse(left_parts > right_parts)
            self.assertFalse(left_parts == right_parts)
            self.assertTrue(left_parts != right_parts)

    def test_numerical_parts(self):
        # Given
        parts1 = _PrereleaseParts(("0", "3", "7"))
        parts2 = _PrereleaseParts(("0", "3", "7"))

        # Then
        self.assertFalse(parts1 < parts2)
        self.assertFalse(parts1 > parts2)
        self.assertTrue(parts1 <= parts2)
        self.assertTrue(parts1 >= parts2)
        self.assertTrue(parts1 == parts2)
        self.assertFalse(parts1 != parts2)

        # Given
        parts1 = _PrereleaseParts(("0", "3", "8"))
        parts2 = _PrereleaseParts(("0", "3", "7"))

        # Then
        self.assertFalse(parts1 < parts2)
        self.assertTrue(parts1 > parts2)
        self.assertFalse(parts1 <= parts2)
        self.assertTrue(parts1 >= parts2)
        self.assertFalse(parts1 == parts2)
        self.assertTrue(parts1 != parts2)
