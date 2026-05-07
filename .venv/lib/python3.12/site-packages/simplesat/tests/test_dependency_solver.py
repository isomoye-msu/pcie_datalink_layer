import textwrap
import unittest

import six

from simplesat.constraints import ConstraintModifiers, Requirement
from simplesat.errors import NoPackageFound, UnexpectedlySatisfiable
from simplesat.test_utils import packages_from_definition

from ..dependency_solver import (
    minimal_unsatisfiable_subset, requirements_are_satisfiable
)


R = Requirement._from_string


class TestRequirementsAreSatistifiable(unittest.TestCase):
    def test_simple(self):
        # Given
        packages_definition = textwrap.dedent("""
        MKL 10.3-1
        MKL 11.4.1-1
        numpy 1.9.2-1; depends (MKL == 10.3-1)
        numpy 1.10.4-1; depends (MKL == 11.4.1-1)
        """)
        packages = packages_from_definition(packages_definition)

        # When/Then
        requirements = [R("numpy")]
        result = requirements_are_satisfiable(packages,  requirements)
        self.assertTrue(result.is_satisfiable)

        # When/Then
        requirements = [R("numpy < 1.10")]
        result = requirements_are_satisfiable(packages,  requirements)
        self.assertTrue(result.is_satisfiable)

        # When/Then
        requirements = [R("numpy < 1.10"), R("MKL >= 11")]
        result = requirements_are_satisfiable(packages,  requirements)
        self.assertFalse(result.is_satisfiable)

        # When/Then
        requirements = [R("numpy > 1.10"), R("MKL >= 11")]
        result = requirements_are_satisfiable(packages,  requirements)
        self.assertTrue(result.is_satisfiable)

    def test_raises_if_unresolvable_requirement(self):
        # Given
        packages_definition = textwrap.dedent("""
        MKL 11.4.1-1;
        numpy 1.10.4-1; depends (MKL == 11.4.1-1)
        """)
        packages = packages_from_definition(packages_definition)

        requirements = [R("foo")]

        # When/Then
        with self.assertRaises(NoPackageFound):
            requirements_are_satisfiable(packages,  requirements)

    def test_constraint_modifiers(self):
        # Given
        packages_definition = textwrap.dedent("""
        MKL 10.3-1
        MKL 11.4.1-1
        numpy 1.9.2-1; depends (MKL == 10.3-1)
        numpy 1.10.4-1; depends (MKL == 11.4.1-1)
        """)
        packages = packages_from_definition(packages_definition)

        requirements = [
            Requirement._from_string("numpy < 1.10"),
            Requirement._from_string("MKL >= 11")
        ]
        modifiers = ConstraintModifiers(allow_newer=("MKL",))

        # When/Then
        result = requirements_are_satisfiable(packages, requirements)
        self.assertFalse(result.is_satisfiable)
        result = requirements_are_satisfiable(
            packages, requirements, modifiers)
        self.assertTrue(result.is_satisfiable)


def requirements_from_definition(s):
    return [R(line) for line in s.splitlines() if line.strip()]


class TestMinUnsat(unittest.TestCase):
    def test_simple(self):
        # Given
        packages_definition = textwrap.dedent("""\
        MKL 10.3-1
        MKL 11.4.1-1
        numpy 1.9.2-1; depends (MKL == 10.3-1)
        numpy 1.10.4-1; depends (MKL == 11.4.1-1)
        """)
        packages = packages_from_definition(packages_definition)

        def callback(requirements):
            return requirements_are_satisfiable(
                packages, requirements).is_satisfiable

        r_min_unsat = [
            Requirement._from_string("numpy < 1.10"),
            Requirement._from_string("MKL >= 11")
        ]

        # When
        requirements = [
            Requirement._from_string("numpy < 1.10"),
            Requirement._from_string("MKL >= 11")
        ]
        min_unsat = minimal_unsatisfiable_subset(requirements, callback)

        # Then
        six.assertCountEqual(self, min_unsat, r_min_unsat)

    def test_conflicting_dependencies(self):
        # Given
        packages_definition = textwrap.dedent("""
        MKL 10.3-1
        MKL 11.4.1-1
        numpy 1.9.2-1; depends (MKL == 10.3-1)
        numpy 1.10.4-1; depends (MKL == 11.4.1-1)
        scipy 0.16.0-1; depends (MKL == 10.3-1, numpy ^= 1.9.2)
        scipy 0.17.0-1; depends (MKL == 11.4.1-1, numpy ^= 1.10.4)
        """)
        packages = packages_from_definition(packages_definition)

        def callback(requirements):
            return requirements_are_satisfiable(
                packages, requirements).is_satisfiable

        r_min_unsat = [
            Requirement._from_string("MKL < 11"),
            Requirement._from_string("scipy >= 0.17.0"),
        ]

        # When
        requirements = [
            Requirement._from_string("MKL < 11"),
            Requirement._from_string("numpy"),
            Requirement._from_string("scipy >= 0.17.0"),
        ]
        min_unsat = minimal_unsatisfiable_subset(requirements, callback)

        # Then
        six.assertCountEqual(self, min_unsat, r_min_unsat)

    def test_conflicting_dependencies2(self):
        # Given
        packages_definition = textwrap.dedent("""
        libgfortran 3.0.0-2
        MKL 10.3-1
        MKL 11.1.4-1
        numpy 1.7.1-1; depends (MKL == 10.3-1)
        numpy 1.9.2-3; depends (MKL == 11.1.4-1)
        pandas 0.12.0-1; depends (numpy ^= 1.7.1, python_dateutil)
        python_dateutil 2.4.2-2; depends (six ^= 1.10.0)
        pytz 2014.9.0-1
        six 1.10.0-1
        """)
        packages = packages_from_definition(packages_definition)

        requirements_definition = textwrap.dedent("""
        libgfortran == 3.0.0-2
        MKL == 11.1.4-1
        numpy == 1.9.2-3
        pandas == 0.12.0-1
        python_dateutil == 2.4.2-2
        pytz == 2014.9.0-1
        six == 1.10.0-1
        """)
        requirements = requirements_from_definition(requirements_definition)

        def callback(requirements):
            return requirements_are_satisfiable(
                packages, requirements).is_satisfiable

        r_min_unsat = [R("MKL == 11.1.4-1"), R("pandas == 0.12.0-1")]

        # When
        min_unsat = minimal_unsatisfiable_subset(requirements, callback)

        # Then
        six.assertCountEqual(self, min_unsat, r_min_unsat)

    def test_more_than_2_clauses(self):
        # Given
        packages_definition = textwrap.dedent("""
        A 1.0-1; provides (X)
        B 1.0-1; provides (X, Y, Z)
        C 1.0-1; provides (Y)
        D 1.0-1; provides (Y, Z)
        P 1.0-1; depends (X)
        Q 1.0-1; depends (Y); conflicts (A ^= 1.0)
        R 1.0-1; depends (Z); conflicts (B ^= 1.0)
        """)
        packages = packages_from_definition(packages_definition)

        requirements_definition = textwrap.dedent("""
        P
        Q
        R
        """)
        requirements = requirements_from_definition(requirements_definition)

        def callback(requirements):
            return requirements_are_satisfiable(
                packages, requirements).is_satisfiable

        r_min_unsat = [R("P"), R("Q"), R("R")]

        # When
        min_unsat = minimal_unsatisfiable_subset(requirements, callback)

        # Then
        six.assertCountEqual(self, min_unsat, r_min_unsat)

    def test_raises_unexpectedly_satisfiable(self):
        # Given
        packages_definition = textwrap.dedent("""
        MKL 11.1.4-1
        numpy 1.9.2-3; depends (MKL == 11.1.4-1)
        """)
        packages = packages_from_definition(packages_definition)

        requirements_definition = textwrap.dedent("""
        MKL == 11.1.4-1
        numpy == 1.9.2-3
        """)
        requirements = requirements_from_definition(requirements_definition)

        def callback(requirements):
            return requirements_are_satisfiable(packages, requirements)

        # When/Then
        with self.assertRaises(UnexpectedlySatisfiable):
            minimal_unsatisfiable_subset(requirements, callback)
