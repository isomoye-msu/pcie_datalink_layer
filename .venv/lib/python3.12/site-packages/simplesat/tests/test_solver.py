import io
import textwrap
import unittest

from okonomiyaki.versions import EnpkgVersion

from simplesat.constraints import (
    ConstraintModifiers, PrettyPackageStringParser, InstallRequirement
)
from simplesat.dependency_solver import (
    DependencySolver, packages_are_consistent,
    requirements_from_packages, packages_from_requirements,
    requirements_are_satisfiable, requirements_are_complete,
    satisfy_requirements, simplify_requirements,
)
from simplesat.errors import (
    MissingInstallRequires, SatisfiabilityError, SatisfiabilityErrorWithHint
)
from simplesat.pool import Pool
from simplesat.repository import Repository
from simplesat.request import Request
from simplesat.test_utils import Scenario
from simplesat.transaction import (
    InstallOperation, RemoveOperation, UpdateOperation
)


R = InstallRequirement._from_string
P = PrettyPackageStringParser(EnpkgVersion.from_string).parse_to_package


class SolverHelpersMixin(object):
    def setUp(self):
        self.repository = Repository()
        self.installed_repository = Repository()

        self._package_parser = PrettyPackageStringParser(
            EnpkgVersion.from_string
        )

    def package_factory(self, s):
        return self._package_parser.parse_to_package(s)

    def resolve(self, request, strict=False):
        pool = Pool([self.repository, self.installed_repository])
        solver = DependencySolver(
            pool, [self.repository], self.installed_repository,
            use_pruning=False, strict=strict
        )
        return solver.solve(request)

    def resolve_with_hint(self, request, strict=False):
        pool = Pool([self.repository, self.installed_repository])
        solver = DependencySolver(
            pool, [self.repository], self.installed_repository,
            use_pruning=False, strict=strict
        )
        return solver.solve_with_hint(request)

    def assertEqualOperations(self, operations, r_operations):
        self.assertEqual(operations, r_operations)


class TestSolver(SolverHelpersMixin, unittest.TestCase):
    def test_simple_install(self):
        # Given
        mkl = self.package_factory(u"mkl 10.3-1")
        self.repository.add_package(mkl)

        r_operations = [InstallOperation(mkl)]

        request = Request()
        request.install(R("mkl"))

        # When
        transaction = self.resolve(request)

        # Then
        self.assertEqualOperations(transaction.operations, r_operations)

    def test_multiple_installs(self):
        # Given
        mkl = self.package_factory(u"mkl 10.3-1")
        libgfortran = self.package_factory(u"libgfortran 3.0.0-2")

        r_operations = [
            InstallOperation(libgfortran),
            InstallOperation(mkl),
        ]

        self.repository.add_package(mkl)
        self.repository.add_package(libgfortran)

        request = Request()
        request.install(R("mkl"))
        request.install(R("libgfortran"))

        # When
        transaction = self.resolve(request)

        # Then
        self.assertEqualOperations(transaction.operations, r_operations)

    def test_simple_dependency(self):
        # Given
        mkl = self.package_factory(u"mkl 10.3-1")
        libgfortran = self.package_factory(u"libgfortran 3.0.0-2")
        numpy = self.package_factory(
            u"numpy 1.9.2-1; depends (mkl == 10.3-1, libgfortran ^= 3.0.0)"
        )

        r_operations = [
            # libgfortran sorts before mkl
            InstallOperation(libgfortran),
            InstallOperation(mkl),
            InstallOperation(numpy),
        ]

        self.repository.add_package(mkl)
        self.repository.add_package(libgfortran)
        self.repository.add_package(numpy)

        request = Request()
        request.install(R("numpy"))

        # When
        transaction = self.resolve(request)

        # Then
        self.assertEqualOperations(transaction.operations, r_operations)

    def test_already_installed(self):
        # Given
        mkl1 = self.package_factory(u"mkl 10.3-1")
        mkl2 = self.package_factory(u"mkl 10.3-2")

        r_operations = []

        self.repository.add_package(mkl1)
        self.repository.add_package(mkl2)
        self.installed_repository.add_package(mkl1)

        # When
        request = Request()
        request.install(R("mkl"))

        transaction = self.resolve(request)

        # Then
        self.assertEqualOperations(transaction.operations, r_operations)

        # Given
        r_operations = [
            RemoveOperation(mkl1),
            InstallOperation(mkl2),
        ]
        r_pretty_operations = [
            UpdateOperation(mkl2, mkl1),
        ]

        # When
        request = Request()
        request.install(R("mkl > 10.3-1"))

        # When
        transaction = self.resolve(request)

        # Then
        self.assertEqualOperations(transaction.operations, r_operations)
        self.assertEqualOperations(
            transaction.pretty_operations, r_pretty_operations)

    def test_requirements_are_satisfiable(self):
        # Given
        scenario = Scenario.from_yaml(io.StringIO(u"""
                packages:
                    - MKL 10.2-1
                    - MKL 10.3-1
                    - numpy 1.7.1-1; depends (MKL == 10.3-1)
                    - numpy 1.8.1-1; depends (MKL == 10.3-1)

                request:
                    - operation: "install"
                      requirement: "numpy"
        """))
        packages = tuple(p for r in scenario.remote_repositories for p in r)
        requirements = [job.requirement for job in scenario.request.jobs]

        # When
        result = requirements_are_satisfiable(packages, requirements)

        # Then
        self.assertTrue(result.is_satisfiable)
        self.assertEqual(result.message, "")

    def test_requirements_are_not_satisfiable(self):
        # Given
        scenario = Scenario.from_yaml(io.StringIO(u"""
            packages:
                - MKL 10.2-1
                - MKL 10.3-1
                - numpy 1.7.1-1; depends (MKL == 10.3-1)
                - numpy 1.8.1-1; depends (MKL == 10.3-1)

            request:
                - operation: "install"
                  requirement: "numpy"
                - operation: "install"
                  requirement: "MKL != 10.3-1"
        """))
        r_msg = textwrap.dedent("""\
        Conflicting requirements:
        Requirements: 'numpy' <- 'MKL == 10.3-1' <- 'MKL'
            Can only install one of: (+MKL-10.3-1 | +MKL-10.2-1)
        Requirements: 'numpy' <- 'MKL == 10.3-1'
            numpy-1.8.1-1 requires (+MKL-10.3-1)
        Requirements: 'numpy'
            Install command rule (+numpy-1.7.1-1 | +numpy-1.8.1-1)
        """)
        packages = tuple(p for r in scenario.remote_repositories for p in r)
        requirements = [job.requirement for job in scenario.request.jobs]

        # When
        result = requirements_are_satisfiable(packages, requirements)

        # Then
        self.assertFalse(result.is_satisfiable)
        self.assertMultiLineEqual(result.message, r_msg)

    def test_requirements_are_complete(self):
        # Given
        scenario = Scenario.from_yaml(io.StringIO(u"""
            packages:
                - MKL 10.3-1
                - numpy 1.8.1-1; depends (MKL == 10.3-1)

            request:
                - operation: install
                  requirement: numpy ^= 1.8.1
                - operation: install
                  requirement: MKL == 10.3-1
        """))
        packages = tuple(p for r in scenario.remote_repositories for p in r)

        # When
        requirements = [job.requirement for job in scenario.request.jobs]
        result = requirements_are_complete(packages, requirements)

        # Then
        self.assertTrue(result.is_satisfiable)
        self.assertEqual(result.message, "")

    def test_requirements_are_not_complete(self):
        # Given
        scenario = Scenario.from_yaml(io.StringIO(u"""
            packages:
                - MKL 10.3-1
                - numpy 1.8.1-1; depends (MKL == 10.3-1)

            request:
                - operation: install
                  requirement: numpy
        """))
        r_msg = textwrap.dedent("""\
        Conflicting requirements:
        Requirements: 'numpy' <- 'MKL == 10.3-1'
            +numpy-1.8.1-1 was ignored because it depends on missing packages
        Requirements: 'numpy'
            Install command rule (+numpy-1.8.1-1)
        """)
        packages = tuple(p for r in scenario.remote_repositories for p in r)

        # When
        requirements = [job.requirement for job in scenario.request.jobs]
        result = requirements_are_complete(packages, requirements)

        # Then
        self.assertFalse(result.is_satisfiable)
        self.assertMultiLineEqual(result.message, r_msg)

    def test_packages_from_requirements(self):
        # Given
        requirements = (
            R(u'MKL == 10.3-1'),
            R(u'numpy == 1.9.1-1'),
            R(u'numpy == 1.9.1-2'),
            R(u'numpy == 1.9.1-3'),
        )
        expected = (
            P(u'MKL 10.3-1'),
            P(u'numpy 1.9.1-1; depends (MKL == 10.3-1)'),
            P(u'numpy 1.9.1-2; depends (MKL)'),
            P(u'numpy 1.9.1-3'),
        )

        # When
        repository = packages_from_requirements(expected, requirements)

        # Then
        result = tuple(repository)
        self.assertEqual(result, expected)

    def test_requirements_from_packages(self):
        # Given
        packages = (
            P(u'MKL 10.3-1'),
            P(u'numpy 1.9.1-1; depends (MKL == 10.3-1)'),
            P(u'numpy 1.9.1-2; depends (MKL)'),
            P(u'numpy 1.9.1-3'),
        )
        expected = (
            R(u'MKL == 10.3-1'),
            R(u'numpy == 1.9.1-1'),
            R(u'numpy == 1.9.1-2'),
            R(u'numpy == 1.9.1-3'),
        )

        # When
        result = requirements_from_packages(packages)

        # Then
        self.assertEqual(result, expected)

    def test_packages_are_consistent(self):
        # Given
        scenario = Scenario.from_yaml(io.StringIO(u"""
            packages:
                - MKL 10.3-1
                - numpy 1.8.1-1; depends (MKL == 10.3-1)
        """))

        # When
        packages = tuple(p for r in scenario.remote_repositories for p in r)
        result = packages_are_consistent(packages)

        # Then
        self.assertTrue(result)

    def test_repository_is_not_consistent(self):
        # Given
        scenario = Scenario.from_yaml(io.StringIO(u"""
            packages:
                - numpy 1.8.1-1; depends (MKL == 10.3-1)
        """))
        r_msg = textwrap.dedent("""\
        Conflicting requirements:
        Requirements: 'numpy == 1.8.1-1' <- 'MKL == 10.3-1'
            +numpy-1.8.1-1 was ignored because it depends on missing packages
        Requirements: 'numpy == 1.8.1-1'
            Install command rule (+numpy-1.8.1-1)
        """)

        # When
        packages = tuple(p for r in scenario.remote_repositories for p in r)
        result = packages_are_consistent(packages)

        # Then
        self.assertFalse(result.is_satisfiable)
        self.assertMultiLineEqual(result.message, r_msg)

    def test_missing_direct_dependency_fails(self):
        # Given
        numpy192 = self.package_factory(u"numpy 1.9.2-1")
        numpy200 = self.package_factory(u"numpy 2.0.0-1; depends (missing)")

        self.repository.add_package(numpy192)
        self.repository.add_package(numpy200)

        # When
        request = Request()
        request.install(R("numpy >= 2.0"))

        # Then
        with self.assertRaises(SatisfiabilityError):
            self.resolve(request)

    def test_missing_indirect_dependency_fails(self):
        # Given
        mkl = self.package_factory(u"MKL 10.3-1; depends (MISSING)")
        numpy192 = self.package_factory(u"numpy 1.9.2-1")
        numpy200 = self.package_factory(u"numpy 2.0.0-1; depends (MKL)")

        self.repository.add_package(mkl)
        self.repository.add_package(numpy192)
        self.repository.add_package(numpy200)

        # When
        request = Request()
        request.install(R("numpy >= 2.0"))

        # Then
        with self.assertRaises(SatisfiabilityError):
            self.resolve(request)

    def test_satisfy_requirements(self):
        requirements = (
            R(u'B ^= 1.0.0'),
            R(u'E'),
        )

        packages = (
            P(u"A 0.0.1-1;"),
            P(u"A 1.0.0-1;"),
            P(u"A 2.0.0-1;"),
            P(u"A 2.1.0-1;"),
            P(u"B 1.0.0-1; depends (A ^= 1.0, A != 2.1.0-1)"),
            P(u"B 2.0.0-1; depends (A != 2.1.0-1)"),
            P(u"C 1.0.0-1; depends (B > 2.0.0-1)"),
            P(u"D 1.0.0-1;"),
            P(u"E 1.0.0-1; depends (C > 2.0, D < 1.0)"),
        )

        modifiers = ConstraintModifiers(
            allow_newer=[u'A'],
            allow_older=[u'B'],
            allow_any=[u'C', u'D'],
        )

        # When
        result = satisfy_requirements(
            packages, requirements, modifiers=modifiers)
        expected = tuple(packages[i] for i in (2, 7, 4, 6, 8))

        # Then
        self.assertEqual(result, expected)

    def test_satisfy_requirements_fail(self):
        requirements = (
            R(u'B ^= 1.0.0'),
            R(u'E'),
        )

        packages = (
            P(u"A 0.0.1-1;"),
            P(u"A 1.0.0-1;"),
            P(u"A 2.0.0-1;"),
            P(u"A 2.1.0-1;"),
            P(u"B 1.0.0-1; depends (A ^= 1.0, A != 2.1.0-1)"),
            P(u"B 2.0.0-1; depends (A != 2.1.0-1)"),
            P(u"C 1.0.0-1; depends (B > 2.0.0-1)"),
            P(u"D 1.0.0-1;"),
            P(u"E 1.0.0-1; depends (C > 2.0, D < 1.0)"),
            P(u"F 1.0.0-1; depends (NONEXISTENT)"),
        )

        modifiers = ConstraintModifiers(
            allow_newer=[u'A'],
            allow_any=[u'C', u'D'],
        )

        # When / Then
        with self.assertRaises(SatisfiabilityError):
            satisfy_requirements(packages, requirements, modifiers=modifiers)

        with self.assertRaises(SatisfiabilityError):
            requirements = (R(u'F'),)
            satisfy_requirements(packages, requirements, modifiers=modifiers)

    def test_simplify_requirements(self):

        # Given
        requirements = (
            R(u'MKL == 10.3-1'),
            R(u'mismatch == 1.2.3-5'),
            R(u'numpy == 1.9.1-1'),
        )
        packages = (
            P(u'MKL 10.3-1'),
            P(u'numpy 1.9.1-1; depends (MKL == 10.3-1, mismatch == 1.2.3-4)'),
            P(u'mismatch 1.2.3-5'),
            P(u'unused 1.2.3-0'),
        )

        # When
        result = simplify_requirements(packages, requirements)
        expected = requirements[1:]

        # Then
        self.assertEqual(result, expected)

    def test_strange_key_error_bug_on_failure(self):
        # Given
        mkl = self.package_factory(u'MKL 10.3-1')
        libgfortran = self.package_factory(u'libgfortran 3.0.0-2')
        numpy192 = self.package_factory(
            u"numpy 1.9.2-1; depends (libgfortran ^= 3.0.0, MKL == 10.3-1)")
        numpy200 = self.package_factory(
            u"numpy 2.0.0-1; depends (nonexistent)")
        request = Request()

        # When
        for pkg in (mkl, libgfortran, numpy192, numpy200):
            self.repository.add_package(pkg)
        request.install(R("numpy >= 2.0"))

        # Then
        with self.assertRaises(SatisfiabilityError):
            self.resolve(request)

    def test_missing_dependency_strict(self):
        # Given
        mkl = self.package_factory(u'MKL 10.3-1')
        libgfortran = self.package_factory(u'libgfortran 3.0.0-2')
        numpy192 = self.package_factory(
            u"numpy 1.9.2-1; depends (libgfortran ^= 3.0.0, MKL == 10.3-1)")
        numpy200 = self.package_factory(
            u"numpy 2.0.0-1; depends (nonexistent)")
        request = Request()

        # When
        for pkg in (mkl, libgfortran, numpy192, numpy200):
            self.repository.add_package(pkg)
        request.install(R("numpy == 2.0.0-1"))

        # Then
        with self.assertRaises(MissingInstallRequires):
            self.resolve(request, strict=True)

    def test_upgrade_simple(self):
        # Given
        mkl_11_3_1 = P(u"mkl 11.3.1-1")
        mkl_2017_0_1_1 = P(u"mkl 2017.0.1-1")
        mkl_2017_0_1_2 = P(u"mkl 2017.0.1-2")

        numpy_1_10_4 = P(u"numpy 1.10.4-1; depends (mkl ^= 11.3.1)")
        numpy_1_11_3 = P(u"numpy 1.11.3-1; depends (mkl ^= 2017.0.1)")

        scipy_0_17_1 = P(
            u"scipy 0.17.1-1; depends (mkl ^= 11.3.1, numpy ^= 1.10.4)")
        scipy_0_18_1 = P(
            u"scipy 0.18.1-1; depends (mkl ^= 2017.0.1, numpy ^= 1.11.3)")

        self.repository.update([
            mkl_11_3_1, mkl_2017_0_1_1, mkl_2017_0_1_2, numpy_1_10_4,
            numpy_1_11_3, scipy_0_17_1, scipy_0_18_1
        ])
        self.installed_repository.update(
            [mkl_11_3_1, numpy_1_10_4, scipy_0_17_1])

        r_operations = [
            RemoveOperation(scipy_0_17_1),
            RemoveOperation(numpy_1_10_4),
            RemoveOperation(mkl_11_3_1),
            InstallOperation(mkl_2017_0_1_2),
            InstallOperation(numpy_1_11_3),
            InstallOperation(scipy_0_18_1),
        ]

        # When
        request = Request()
        request.upgrade()

        transaction = self.resolve(request)

        # Then
        self.assertEqualOperations(transaction.operations, r_operations)

    def test_upgrade_fail(self):
        # Given
        mkl_11_3_1 = P(u"mkl 11.3.1-1")
        mkl_2017_0_1_1 = P(u"mkl 2017.0.1-1")
        mkl_2017_0_1_2 = P(u"mkl 2017.0.1-2")

        numpy_1_10_4 = P(u"numpy 1.10.4-1; depends (mkl ^= 11.3.1)")

        scipy_0_17_1 = P(
            u"scipy 0.17.1-1; depends (mkl ^= 11.3.1, numpy ^= 1.10.4)")

        self.repository.update([
            mkl_11_3_1, mkl_2017_0_1_1, mkl_2017_0_1_2, numpy_1_10_4,
            scipy_0_17_1
        ])
        self.installed_repository.update(
            [mkl_11_3_1, numpy_1_10_4, scipy_0_17_1])

        # When/Then
        request = Request()
        request.upgrade()

        with self.assertRaises(SatisfiabilityError):
            self.resolve(request)

    def test_upgrade_no_candidate(self):
        # Given
        mkl_11_3_1 = P(u"mkl 11.3.1-1")
        mkl_2017_0_1_1 = P(u"mkl 2017.0.1-1")
        mkl_2017_0_1_2 = P(u"mkl 2017.0.1-2")

        numpy_1_10_4 = P(u"numpy 1.10.4-1; depends (mkl ^= 11.3.1)")

        scipy_0_17_1 = P(
            u"scipy 0.17.1-1; depends (mkl ^= 11.3.1, numpy ^= 1.10.4)")

        gnureadline_6_3 = P(u"gnureadline 6.3-1")

        # gnureadline is not available in the remote repository
        self.repository.update([
            mkl_11_3_1, mkl_2017_0_1_1, mkl_2017_0_1_2, numpy_1_10_4,
            scipy_0_17_1
        ])
        self.installed_repository.update(
            [mkl_11_3_1, numpy_1_10_4, scipy_0_17_1])
        self.installed_repository.update([gnureadline_6_3])

        # When/Then
        request = Request()
        request.upgrade()

        with self.assertRaises(SatisfiabilityError):
            self.resolve(request)

    def test_up_to_date_package_choices(self):
        # Given
        packages = u"""
            envisage 4.7.2-1; depends (apptools ^= 4.4.0, traits ^= 5.1.1)
            apptools 4.4.0-12; depends (traitsui ^= 6.0.0)
            apptools 4.4.0-14; depends (traitsui ^= 6.1.1)
            traitsui 6.0.0-3; depends (traits ^= 5.1.0)
            traitsui 6.0.0-4; depends (traits ^= 5.1.1)
            traitsui 6.1.1-1; depends (traits ^= 5.1.1)
            traits 5.1.0-1
            traits 5.1.1-1
        """
        for package in packages.strip().splitlines():
            self.repository.add_package(P(package.strip()))

        # When
        request = Request()
        request.install(R("envisage"))
        transaction = self.resolve(request)
        packages = {
            operation.package.name: str(operation.package.version)
            for operation in transaction.operations
        }

        # Then
        expected_packages = {
            "traits": "5.1.1-1",
            "traitsui": "6.1.1-1",
            "apptools": "4.4.0-14",
            "envisage": "4.7.2-1",
        }
        self.assertEqual(packages, expected_packages)


class TestSolverWithHint(SolverHelpersMixin, unittest.TestCase):
    def test_no_conflict(self):
        # Given
        mkl_2017_0_1_1 = P(u"mkl 2017.0.1-1")
        numpy_1_11_3 = P(u"numpy 1.11.3-1; depends (mkl ^= 2017.0.1)")
        scipy_0_18_1 = P(
            u"scipy 0.18.1-1; depends (mkl ^= 2017.0.1, numpy ^= 1.11.3)")

        r_operations = [
            InstallOperation(mkl_2017_0_1_1),
            InstallOperation(numpy_1_11_3),
            InstallOperation(scipy_0_18_1),
        ]

        self.repository.update([mkl_2017_0_1_1, numpy_1_11_3, scipy_0_18_1])

        request = Request()
        request.install(R(u"scipy >= 0.18.0"))
        request.install(R(u"numpy >= 1.10.0"))

        # When
        transaction = self.resolve_with_hint(request)

        # Then
        self.assertEqualOperations(transaction.operations, r_operations)

    def test_direct_dependency_conflict(self):
        # Given
        mkl_11_3_1 = P(u"mkl 11.3.1-1")
        mkl_2017_0_1_1 = P(u"mkl 2017.0.1-1")
        numpy_1_11_3 = P(u"numpy 1.11.3-1; depends (mkl ^= 2017.0.1)")
        scipy_0_18_1 = P(
            u"scipy 0.18.1-1; depends (mkl ^= 2017.0.1, numpy ^= 1.11.3)")

        self.repository.update([
            mkl_11_3_1, mkl_2017_0_1_1, numpy_1_11_3, scipy_0_18_1,
        ])

        request = Request()
        request.install(R(u"scipy >= 0.18.0"))
        request.install(R(u"numpy >= 1.10.0"))
        # MKL < 12 conflicts with scipy >= 0.18.0
        request.install(R(u"mkl < 12"))

        r_hint_pretty_string = textwrap.dedent(u"""\
            The following jobs are conflicting:
                install numpy >= 1.10.0-0
                install mkl < 12-0""")

        # When/Then
        with self.assertRaises(SatisfiabilityErrorWithHint) as ctx:
            self.resolve_with_hint(request)

        self.assertMultiLineEqual(
            ctx.exception.hint_pretty_string, r_hint_pretty_string)

    def test_upgrade_fail(self):
        # Given
        mkl_11_3_1 = P(u"mkl 11.3.1-1")
        mkl_2017_0_1_1 = P(u"mkl 2017.0.1-1")
        mkl_2017_0_1_2 = P(u"mkl 2017.0.1-2")

        numpy_1_10_4 = P(u"numpy 1.10.4-1; depends (mkl ^= 11.3.1)")

        scipy_0_17_1 = P(
            u"scipy 0.17.1-1; depends (mkl ^= 11.3.1, numpy ^= 1.10.4)")

        self.repository.update([
            mkl_11_3_1, mkl_2017_0_1_1, mkl_2017_0_1_2, numpy_1_10_4,
            scipy_0_17_1
        ])
        self.installed_repository.update(
            [mkl_11_3_1, numpy_1_10_4, scipy_0_17_1])

        r_hint_pretty_string = textwrap.dedent(u"""\
            The following jobs are conflicting:
                install mkl == 2017.0.1-2
                install numpy == 1.10.4-1""")

        # When/Then
        request = Request()
        request.upgrade()

        with self.assertRaises(SatisfiabilityErrorWithHint) as ctx:
            self.resolve_with_hint(request)

        self.assertMultiLineEqual(
            ctx.exception.hint_pretty_string, r_hint_pretty_string)
