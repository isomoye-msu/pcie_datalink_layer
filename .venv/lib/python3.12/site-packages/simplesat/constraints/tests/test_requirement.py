import unittest
from collections import OrderedDict

from okonomiyaki.versions import EnpkgVersion

from simplesat.errors import (
    InvalidConstraint, InvalidDependencyString
)

from ..kinds import Equal
from ..multi import MultiConstraints
from ..requirement import InstallRequirement, parse_package_full_name
from ..constraint_modifiers import ConstraintModifiers, modify_requirement


R = InstallRequirement._from_string
V = EnpkgVersion.from_string


class TestRequirementFromConstraint(unittest.TestCase):

    def test_comparison(self):
        # Given
        constraints0 = ("numpy", ((">= 1.8.1-3", "< 1.9.0"),))
        constraints1 = ("numpy", ((">= 1.8.1-3", "< 1.9.1"),))

        # When
        requirement0 = InstallRequirement.from_constraints(constraints0)
        requirement1 = InstallRequirement.from_constraints(constraints1)

        # Then
        self.assertTrue(requirement0 != requirement1)

    def test_hashing(self):
        # Given
        constraints0 = ("numpy", ((">= 1.8.1-3", "< 1.9.1"),))

        # When
        requirement0 = InstallRequirement.from_constraints(constraints0)
        requirement1 = InstallRequirement.from_constraints(constraints0)

        # Then
        self.assertEqual(requirement0, requirement1)
        self.assertEqual(hash(requirement0), hash(requirement1))

    def test_any(self):
        # Given
        constraints0 = ("numpy", ((),))

        # When
        requirement = InstallRequirement.from_constraints(constraints0)

        # Then
        self.assertTrue(requirement.matches(V("1.8.1-2")))
        self.assertTrue(requirement.matches(V("1.8.1-3")))
        self.assertTrue(requirement.matches(V("1.8.2-1")))
        self.assertTrue(requirement.matches(V("1.9.0-1")))
        self.assertEqual(
            requirement,
            InstallRequirement.from_constraints(("numpy", (("*",),)))
        )

    def test_simple(self):
        # Given
        constraints0 = ("numpy", ((">= 1.8.1-3", "< 1.9.0"),))

        # When
        requirement = InstallRequirement.from_constraints(constraints0)

        # Then
        self.assertFalse(requirement.matches(V("1.8.1-2")))
        self.assertTrue(requirement.matches(V("1.8.1-3")))
        self.assertTrue(requirement.matches(V("1.8.2-1")))
        self.assertFalse(requirement.matches(V("1.9.0-1")))

    def test_multiple_fails(self):
        # Given
        constraints0 = (("numpy", ((">= 1.8.1-3",),)),
                        ("scipy", (("< 1.9.0",),)))

        # Then
        with self.assertRaises(InvalidConstraint):
            InstallRequirement.from_constraints(constraints0)

    def test_disjunction_fails(self):
        constraints0 = ("numpy", (("< 1.8.0",), (">= 1.8.1-3",)))

        # Then
        with self.assertRaises(InvalidConstraint):
            InstallRequirement.from_constraints(constraints0)

    def test_has_any_version_constraint(self):
        # Given
        requirements = [
            (("numpy", ((),)), False),
            (("numpy", (("*",),)), False),
            (("numpy", (("< 1.8.1",),)), True),
            (("numpy", (("== 1.8.1-1",),)), True),
            (("numpy", (("^= 1.8.1",),)), True),
        ]

        # When/Then
        for pretty_string, has_any_version_constraint in requirements:
            requirement = InstallRequirement.from_constraints(pretty_string)
            self.assertEqual(
                requirement.has_any_version_constraint,
                has_any_version_constraint
            )


class TestRequirementFromString(unittest.TestCase):
    def test_comparison(self):
        # Given
        requirement_string1 = "numpy >= 1.8.1-3, numpy < 1.9.0"
        requirement_string2 = "numpy >= 1.8.1-3, numpy < 1.9.1"

        # When
        requirement1 = R(requirement_string1)
        requirement2 = R(requirement_string2)

        # Then
        self.assertTrue(requirement1 != requirement2)

    def test_hashing(self):
        # Given
        requirement_string = "numpy >= 1.8.1-3, numpy < 1.9.0"

        # When
        requirement1 = R(requirement_string)
        requirement2 = R(requirement_string)

        # Then
        self.assertEqual(requirement1, requirement2)
        self.assertEqual(hash(requirement1), hash(requirement2))

    def test_any(self):
        # Given
        requirement_string = "numpy"
        r_requirement = InstallRequirement.from_constraints(
            ("numpy", (("*",),)))
        r_requirement_empty = InstallRequirement.from_constraints(
            ("numpy", ((),)))

        # When
        requirement = R(requirement_string)

        # Then
        self.assertTrue(requirement.matches(V("1.8.1-2")))
        self.assertTrue(requirement.matches(V("1.8.1-3")))
        self.assertTrue(requirement.matches(V("1.8.2-1")))
        self.assertTrue(requirement.matches(V("1.9.0-1")))
        self.assertEqual(requirement, r_requirement)
        self.assertEqual(requirement, r_requirement_empty)
        self.assertEqual(r_requirement, r_requirement_empty)

        # Given
        requirement_string = "numpy *"

        # When
        requirement = R(requirement_string)

        # Then
        self.assertEqual(requirement, r_requirement)
        self.assertEqual(requirement, r_requirement_empty)
        self.assertEqual(r_requirement, r_requirement_empty)

    def test_simple(self):
        # Given
        requirement_string = "numpy >= 1.8.1-3, numpy < 1.9.0"

        # When
        requirement = R(requirement_string)

        # Then
        self.assertFalse(requirement.matches(V("1.8.1-2")))
        self.assertTrue(requirement.matches(V("1.8.1-3")))
        self.assertTrue(requirement.matches(V("1.8.2-1")))
        self.assertFalse(requirement.matches(V("1.9.0-1")))

    def test_multiple_fails(self):
        # Given
        requirement_string = "numpy >= 1.8.1-3, scipy < 1.9.0"

        # When
        with self.assertRaises(InvalidDependencyString):
            R(requirement_string)

    def test_from_package_string(self):
        # Given
        package_s = "numpy-1.8.1-1"

        # When
        requirement = InstallRequirement.from_package_string(package_s)

        # Then
        self.assertEqual(requirement.name, "numpy")
        self.assertEqual(requirement._constraints,
                         MultiConstraints([Equal(V("1.8.1-1"))]))

    def test_has_any_version_constraint(self):
        # Given
        requirements = [
            ("numpy", False),
            ("numpy < 1.8.1", True),
            ("numpy == 1.8.1-1", True),
            ("numpy ^= 1.8.1", True),
        ]

        # When/Then
        for pretty_string, has_any_version_constraint in requirements:
            requirement = R(pretty_string)
            self.assertEqual(
                requirement.has_any_version_constraint,
                has_any_version_constraint
            )


class TestParsePackageFullName(unittest.TestCase):

    def test_simple(self):
        # Given
        for package_s in ("numpy-1.8.1-1", "numpy 1.8.1-1"):

            # When
            name, version = parse_package_full_name(package_s)

            # Then
            self.assertEqual(name, "numpy")
            self.assertEqual(version, "1.8.1-1")


class TestRequirement(unittest.TestCase):
    def test_repr(self):
        # Given
        constraints = (
            "numpy", (("^= 1.8.0",),)
        )
        r_repr = "InstallRequirement('numpy ^= 1.8.0')"

        # When
        requirement = InstallRequirement.from_constraints(constraints)

        # Then
        self.assertMultiLineEqual(repr(requirement), r_repr)

        # Given
        constraints = (
            "numpy", ((">= 1.8.0", "< 1.10.0"),)
        )
        r_repr = "InstallRequirement('numpy >= 1.8.0-0, < 1.10.0-0')"

        # When
        requirement = InstallRequirement.from_constraints(constraints)

        # Then
        self.assertMultiLineEqual(repr(requirement), r_repr)

        # Given
        constraints = (
            "numpy", ((">= 1.8.0-0", "< 1.10.0-0"),)
        )
        r_repr = "InstallRequirement('numpy >= 1.8.0-0, < 1.10.0-0')"

        # When
        requirement = InstallRequirement.from_constraints(constraints)

        # Then
        self.assertMultiLineEqual(repr(requirement), r_repr)


class TestRequirementModification(unittest.TestCase):

    CONSTRAINTS = (
        # Greater than
        "> 1.1.1-1", ">= 1.1.1-1",
        # Less than
        "< 1.1.1-1", "<= 1.1.1-1",
        # Equality
        "^= 1.1.1", "== 1.1.1-1", "!= 1.1.1-1", "*")

    TARGETS = {
        'allow_newer': (
            # Greater than
            "> 1.1.1-1", ">= 1.1.1-1",
            # Less than
            "*", "*",
            # Equality
            ">= 1.1.1", ">= 1.1.1-1", "!= 1.1.1-1", "*"),
        'allow_older': (
            # Greater than
            "*", "*",
            # Less than
            "< 1.1.1-1", "<= 1.1.1-1",
            # Equality
            "<= 1.1.1-999999999", "<= 1.1.1-1", "!= 1.1.1-1", "*"),
        'allow_any': ("*", "*", "*", "*", "*", "*", "!= 1.1.1-1", "*"),
    }

    def test_modify_single(self):
        for mode in ('allow_newer', 'allow_older', 'allow_any'):
            modifiers = self._make_modifiers(**{mode: 'A'})
            for before_c, after_c in zip(self.CONSTRAINTS, self.TARGETS[mode]):
                before = 'A ' + before_c
                after = 'A ' + after_c
                self.assertModification(before, after, modifiers)

    def test_modify_multi(self):
        # When the constraints are all together as a single requirement
        requirement_strings = ('A ' + c for c in self.CONSTRAINTS)
        before = ', '.join(requirement_strings)

        for mode in ('allow_newer', 'allow_older', 'allow_any'):
            target_requirement_strings = ('A ' + c for c in self.TARGETS[mode])
            after = ', '.join(self._stable_unique(target_requirement_strings))
            modifiers = self._make_modifiers(**{mode: 'A'})
            self.assertModification(before, after, modifiers)

    def test_newer_older_is_any(self):
        # When
        modifiers = self._make_modifiers(allow_newer='A', allow_older='A')
        targets_any = self.TARGETS['allow_any']
        for before_c, after_c in zip(self.CONSTRAINTS, targets_any):
            before = 'A ' + before_c
            after = 'A ' + after_c
            self.assertModification(before, after, modifiers)

    def test_collapse_multiple_any(self):
        # Given
        requirement = R("MKL >= 1.2.1-2, MKL != 2.3.1-1, MKL < 1.4")
        expected = R("MKL, MKL != 2.3.1-1")

        # When
        modifiers = ConstraintModifiers(allow_any='MKL')
        modified = modify_requirement(requirement, modifiers)
        constraints = modified._constraints._constraints

        # Then
        self.assertEqual(2, len(constraints))
        self.assertEqual(expected, modified)

    def _stable_unique(self, sequence):
        return tuple(OrderedDict.fromkeys(sequence).keys())

    def _make_modifiers(self, **kw):
        default = {
            'allow_any': ("B",),
            'allow_older': ("B",),
            'allow_any': ("B",),
        }
        default.update(**kw)
        return ConstraintModifiers(**default)

    def assertModification(self, before, after, modifiers):
        before_r = R(before)
        expected = R(after)
        result = modify_requirement(before_r, modifiers)
        msg = ("""
            before: {}
            expected: {}
            result: {}
            modifiers: {}
        """).format(before_r, expected, result, modifiers.asdict())
        self.assertEqual(expected, result, msg=msg)
