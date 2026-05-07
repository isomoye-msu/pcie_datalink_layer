import unittest

from ..pep386_workaround import PEP386WorkaroundVersion


class TestPEP386Workaround(unittest.TestCase):
    def test_correct_equal(self):
        # Given
        left = PEP386WorkaroundVersion.from_string("1.3.0")
        right = PEP386WorkaroundVersion.from_string("1.3.0")

        # When/Then
        self.assertEqual(left, right)
        self.assertTrue(left == right)
        self.assertFalse(left != right)
        self.assertTrue(left <= right)
        self.assertTrue(left >= right)
        self.assertFalse(left < right)
        self.assertFalse(left > right)

        self.assertIs(left.is_worked_around, False)
        self.assertIs(right.is_worked_around, False)

    def test_hashing(self):
        # Given version string without workaround
        s = "1.3.0"

        # When
        v1 = PEP386WorkaroundVersion.from_string(s)
        v2 = PEP386WorkaroundVersion.from_string(s)

        # Then
        self.assertEqual(v1, v2)
        self.assertEqual(hash(v1), hash(v2))

        # Given version string with workaround
        s = "0.9.8j"

        # When
        v1 = PEP386WorkaroundVersion.from_string(s)
        v2 = PEP386WorkaroundVersion.from_string(s)

        # Then
        self.assertEqual(v1, v2)
        self.assertEqual(hash(v1), hash(v2))

    def test_correct_greater(self):
        # Given
        left = PEP386WorkaroundVersion.from_string("1.2.0")
        right = PEP386WorkaroundVersion.from_string("1.3.0")

        # When/Then
        self.assertFalse(left == right)
        self.assertTrue(left != right)
        self.assertTrue(left <= right)
        self.assertFalse(left >= right)
        self.assertTrue(left < right)
        self.assertFalse(left > right)

        # Given
        left = PEP386WorkaroundVersion.from_string("1.3.0rc2")
        right = PEP386WorkaroundVersion.from_string("1.3.0")

        # When/Then
        self.assertFalse(left == right)
        self.assertTrue(left != right)
        self.assertTrue(left <= right)
        self.assertFalse(left >= right)
        self.assertTrue(left < right)
        self.assertFalse(left > right)

    def test_correct_lesser(self):
        # Given
        left = PEP386WorkaroundVersion.from_string("1.3.0")
        right = PEP386WorkaroundVersion.from_string("1.2.0")

        # When/Then
        self.assertFalse(left == right)
        self.assertTrue(left != right)
        self.assertFalse(left <= right)
        self.assertTrue(left >= right)
        self.assertFalse(left < right)
        self.assertTrue(left > right)

        # Given
        left = PEP386WorkaroundVersion.from_string("1.3.0")
        right = PEP386WorkaroundVersion.from_string("1.3.0rc2")

        # When/Then
        self.assertFalse(left == right)
        self.assertTrue(left != right)
        self.assertFalse(left <= right)
        self.assertTrue(left >= right)
        self.assertFalse(left < right)
        self.assertTrue(left > right)

    def test_correct_series(self):
        # Given
        version_strings = ("1.1.0", "1.2.0.dev1", "1.2.0a1", "1.2.0a2",
                           "1.2.0b1", "1.2.0c1",
                           "1.2.0rc2", "1.2.0")
        versions = tuple(PEP386WorkaroundVersion.from_string(v) for v in
                         version_strings)

        # When/Then
        self.assertTrue(versions[0] < versions[1] < versions[2] < versions[3]
                        < versions[4] < versions[5] < versions[6] < versions[7])
        self.assertTrue(versions[7] > versions[6] > versions[5] > versions[4]
                        > versions[3] > versions[2] > versions[1] > versions[0])

    def test_incorrect_equal(self):
        # Given
        left = PEP386WorkaroundVersion.from_string("2010k")
        right = PEP386WorkaroundVersion.from_string("2010k")

        # When/Then
        self.assertEqual(left, right)
        self.assertTrue(left == right)
        self.assertFalse(left != right)
        self.assertTrue(left <= right)
        self.assertTrue(left >= right)
        self.assertFalse(left < right)
        self.assertFalse(left > right)
        self.assertIs(left.is_worked_around, True)
        self.assertIs(right.is_worked_around, True)

    def test_incorrect_greater(self):
        # Given
        left = PEP386WorkaroundVersion.from_string("2010i")
        right = PEP386WorkaroundVersion.from_string("2010k")

        # When/Then
        self.assertFalse(left == right)
        self.assertTrue(left != right)
        self.assertTrue(left <= right)
        self.assertFalse(left >= right)
        self.assertTrue(left < right)
        self.assertFalse(left > right)

    def test_incorrect_lesser(self):
        # Given
        left = PEP386WorkaroundVersion.from_string("2010k")
        right = PEP386WorkaroundVersion.from_string("2010i")

        # When/Then
        self.assertFalse(left == right)
        self.assertTrue(left != right)
        self.assertFalse(left <= right)
        self.assertTrue(left >= right)
        self.assertFalse(left < right)
        self.assertTrue(left > right)

    def test_correct_incorrect(self):
        # Given
        left = PEP386WorkaroundVersion.from_string("1.3.0")
        right = PEP386WorkaroundVersion.from_string("1.4.0k")

        # When/Then
        self.assertNotEqual(left, right)
        self.assertFalse(left == right)
        self.assertTrue(left != right)
        self.assertFalse(left <= right)
        self.assertTrue(left >= right)
        self.assertFalse(left < right)
        self.assertTrue(left > right)

        # Given
        left = PEP386WorkaroundVersion.from_string("1.4.0k")
        right = PEP386WorkaroundVersion.from_string("1.3.0")

        # When/Then
        self.assertNotEqual(left, right)
        self.assertFalse(left == right)
        self.assertTrue(left != right)
        self.assertTrue(left <= right)
        self.assertFalse(left >= right)
        self.assertTrue(left < right)
        self.assertFalse(left > right)

    def test_roundtrip_workedaround(self):
        # Given
        version_strings = (
            ("2011g", True),
            ("0.9.0rc2", False),
            ("1.0b1.post10", False),
            ("1.0b1.post10.f", True),
            ("1.0b1.post10.dev1", False),
            ("0.1.post1", False),
            ("0.1.post10", False),
        )

        # When/Then
        for r_version_string, r_is_worked_around in version_strings:
            version = PEP386WorkaroundVersion.from_string(r_version_string)

            if r_is_worked_around:
                self.assertTrue(version._is_worked_around)
            else:
                self.assertFalse(version._is_worked_around)
            self.assertEqual(str(version), r_version_string)


class TestTrailingZeros(unittest.TestCase):
    def test_leading_zeros(self):
        # Given
        left = PEP386WorkaroundVersion.from_string("0.9.8")
        right = PEP386WorkaroundVersion.from_string("1.0.1")

        # When/Then
        self.assertTrue(left < right)
        self.assertTrue(left <= right)
        self.assertFalse(left > right)
        self.assertFalse(left >= right)

    def test_round_trip(self):
        # Given
        version_string = "1.3.0"

        # When
        version = PEP386WorkaroundVersion.from_string(version_string)

        # Then
        self.assertEqual(str(version), version_string)

    def test_simple(self):
        # Given
        left = PEP386WorkaroundVersion.from_string("1.3.0")
        right = PEP386WorkaroundVersion.from_string("1.3")

        # When/Then
        self.assertEqual(left, right)
        self.assertTrue(left == right)
        self.assertFalse(left < right)
        self.assertTrue(left <= right)
        self.assertFalse(left > right)
        self.assertTrue(left >= right)

        # Given
        left = PEP386WorkaroundVersion.from_string("1.0.0")
        right = PEP386WorkaroundVersion.from_string("1")

        # When/Then
        self.assertEqual(left, right)
        self.assertTrue(left == right)
        self.assertFalse(left < right)
        self.assertTrue(left <= right)
        self.assertFalse(left > right)
        self.assertTrue(left >= right)

    def test_all_zeros(self):
        # Given
        version_string = "0.0.0"

        # When
        v = PEP386WorkaroundVersion.from_string(version_string)

        # Then
        self.assertEqual(str(v), version_string)


class TestOldCases(unittest.TestCase):
    def test_single_number(self):
        # Given
        version_string = "214"
        r_version = PEP386WorkaroundVersion.from_string("214.0.0")

        # When
        version = PEP386WorkaroundVersion.from_string(version_string)

        # Then
        self.assertEqual(version, r_version)
        self.assertEqual(str(version), version_string)

    def test_dev_tag_without_number(self):
        # Given
        version_string = "1.0.0.dev"

        # When
        version = PEP386WorkaroundVersion.from_string(version_string)

        # Then
        self.assertTrue(version.is_worked_around)
        self.assertEqual(str(version), version_string)
