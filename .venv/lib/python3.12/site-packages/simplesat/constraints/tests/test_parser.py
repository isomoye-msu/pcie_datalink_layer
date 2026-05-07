import unittest

from okonomiyaki.versions import EnpkgVersion

from simplesat.constraints.kinds import (
    Any, EnpkgUpstreamMatch, Equal, GT, GEQ, LT, LEQ, Not
)
from simplesat.constraints.parser import (
    _RawConstraintsParser, _RawRequirementParser
)
from simplesat.errors import SolverException


V = EnpkgVersion.from_string


class Test_RawConstraintsParser(unittest.TestCase):
    def setUp(self):
        self.parser = _RawConstraintsParser()

    def _parse(self, s):
        return self.parser.parse(s, V)

    def test_empty(self):
        # Given
        constraints_string = ""

        # When
        constraints = self._parse(constraints_string)

        # Then
        self.assertEqual(constraints, (Any(),))

    def test_simple(self):
        # Given
        constraints_string = "> 1.2.0-1"
        r_constraints = (GT(V("1.2.0-1")),)

        # When
        constraints = self._parse(constraints_string)

        # Then
        self.assertEqual(constraints, r_constraints)

        # Given
        constraints_string = ">= 1.2.0-1"
        r_constraints = (GEQ(V("1.2.0-1")),)

        # When
        constraints = self._parse(constraints_string)

        # Then
        self.assertEqual(constraints, r_constraints)

        # Given
        constraints_string = "<= 1.2.0-1"
        r_constraints = (LEQ(V("1.2.0-1")),)

        # When
        constraints = self._parse(constraints_string)

        # Then
        self.assertEqual(constraints, r_constraints)

        # Given
        constraints_string = "< 1.2.0-1"
        r_constraints = (LT(V("1.2.0-1")),)

        # When
        constraints = self._parse(constraints_string)

        # Then
        self.assertEqual(constraints, r_constraints)

        # Given
        constraints_string = "^= 1.2.0-1"
        r_constraints = (EnpkgUpstreamMatch(V("1.2.0-1")),)

        # When
        constraints = self._parse(constraints_string)

        # Then
        self.assertEqual(constraints, r_constraints)

    def test_multiple(self):
        # Given
        constraints_string = ">= 1.2.0-1, < 1.4, != 1.3.8-1"
        r_constraints = (
            GEQ(V("1.2.0-1")), LT(V("1.4")), Not(V("1.3.8-1"))
        )

        # When
        constraints = self._parse(constraints_string)

        # Then
        self.assertEqual(constraints, r_constraints)

    def test_invalid_string(self):
        # Given
        constraints_string = ">= 1.2.0-1 123"

        # When/Then
        with self.assertRaises(SolverException):
            self._parse(constraints_string)


class Test_RawRequirementParser(unittest.TestCase):
    def setUp(self):
        self.parser = _RawRequirementParser()

    def _parse(self, s):
        return self.parser.parse(s, V)

    def test_simple(self):
        # Given
        requirement_string = "numpy == 1.8.1-1"
        r_constraints = {"numpy": tuple([Equal(V("1.8.1-1"))])}

        # When
        constraints = self._parse(requirement_string)

        # Then
        self.assertEqual(constraints, r_constraints)

    def test_multiple(self):
        # Given
        requirement_string = "numpy >= 1.8.1, numpy < 1.9.0"
        r_constraints = {"numpy": (GEQ(V("1.8.1-0")), LT(V("1.9.0")))}

        # When
        constraints = self._parse(requirement_string)

        # Then
        self.assertEqual(constraints, r_constraints)

    def test_multiple_names(self):
        # Given
        requirement_string = "numpy >= 1.8.1, scipy >= 0.14.0"
        r_constraints = {"numpy": (GEQ(V("1.8.1-0")),),
                         "scipy": (GEQ(V("0.14.0")),)}

        # When
        constraints = self._parse(requirement_string)

        # Then
        self.assertEqual(constraints, r_constraints)

    def test_no_version(self):
        # Given
        requirement_string = "numpy"
        r_constraints = {"numpy": tuple([Any()])}

        # When
        constraints = self._parse(requirement_string)

        # Then
        self.assertEqual(constraints, r_constraints)

        # Given
        requirement_string = "MKL == 10.3-1, numpy"
        r_constraints = {"numpy": tuple([Any()]),
                         "MKL": tuple([Equal(V("10.3-1"))])}

        # When
        constraints = self._parse(requirement_string)

        # Then
        self.assertEqual(constraints, r_constraints)

        # Given
        requirement_string = "scikits.statsmodels"
        r_constraints = {"scikits.statsmodels": tuple([Any()])}

        # When
        constraints = self._parse(requirement_string)

        # Then
        self.assertEqual(constraints, r_constraints)

        # Given
        requirement_string = "special_package.123"
        r_constraints = {"special_package.123": tuple([Any()])}

        # When
        constraints = self._parse(requirement_string)

        # Then
        self.assertEqual(constraints, r_constraints)

    def test_invalid(self):
        # Given
        requirement_string = "numpy >= "

        # When/Then
        with self.assertRaises(SolverException):
            self._parse(requirement_string)

        # Given
        requirement_string = "numpy-no-mkl"

        # When/Then
        with self.assertRaises(SolverException):
            self._parse(requirement_string)

        # Given
        requirement_string = "numpy mkl"

        # When/Then
        with self.assertRaises(SolverException):
            self._parse(requirement_string)
