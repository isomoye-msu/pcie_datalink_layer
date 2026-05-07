import unittest
from textwrap import dedent

from simplesat import InstallRequirement, Repository
from simplesat.test_utils import packages_from_definition

from ..compute_dependencies import (compute_dependencies,
                                    compute_leaf_packages,
                                    compute_reverse_dependencies)


PACKAGE_DEF_0 = dedent("""\
    A 0.0.0-1; depends (B ^= 0.0.0)
    B 0.0.0-1; depends (D == 0.0.0-2)
    B 0.0.0-2; depends (D ^= 0.0.0)
    C 0.0.0-1; depends (E >= 1.0.0)
""")


PACKAGE_DEF_1 = dedent("""\
    D 0.0.0-2
    E 0.0.0-1
    E 1.0.0-1
    E 1.0.1-1
""")

PACKAGE_DEF_2 = dedent("""\
    B 0.0.0-1; depends (D == 0.0.0-2)
    C 0.0.0-1; depends (E >= 1.0.0)
""")


class TestComputeDependencies(unittest.TestCase):

    def setUp(self):
        repo_0 = Repository(packages_from_definition(PACKAGE_DEF_0))
        repo_1 = Repository(packages_from_definition(PACKAGE_DEF_1))
        self.repos = [repo_0, repo_1]

    def test_no_dependency(self):
        requirement = InstallRequirement._from_string('D == 0.0.0-2')
        expected_deps = set()
        deps = compute_dependencies(self.repos, requirement)
        self.assertEqual(deps, expected_deps)

    def test_simple_dependency(self):
        requirement = InstallRequirement._from_string('C *')
        expected_deps = packages_from_definition(
            """E 1.0.0-1
               E 1.0.1-1""")

        deps = compute_dependencies(self.repos, requirement)
        self.assertEqual(deps, set(expected_deps))

    def test_chained_requirements(self):
        requirement = InstallRequirement._from_string('A ^= 0.0.0')
        expected_deps = packages_from_definition(
            """B 0.0.0-1; depends (D == 0.0.0-2)
            B 0.0.0-2; depends (D ^= 0.0.0) """
        )

        deps = compute_dependencies(self.repos, requirement)
        self.assertEqual(deps, set(expected_deps))

    def test_chained_requirements_transitive(self):
        requirement = InstallRequirement._from_string('A ^= 0.0.0')
        expected_deps = packages_from_definition(
            """B 0.0.0-1; depends (D == 0.0.0-2)
            B 0.0.0-2; depends (D ^= 0.0.0)
            D 0.0.0-2 """
        )

        deps = compute_dependencies(self.repos, requirement, transitive=True)
        self.assertEqual(deps, set(expected_deps))


class TestComputeReverseDependencies(unittest.TestCase):

    def setUp(self):
        repo_0 = Repository(packages_from_definition(PACKAGE_DEF_0))
        repo_1 = Repository(packages_from_definition(PACKAGE_DEF_1))
        self.repos = [repo_0, repo_1]

    def test_no_dependency(self):
        requirement = InstallRequirement._from_string('A ^= 0.0.0')

        deps = compute_reverse_dependencies(self.repos, requirement)
        self.assertEqual(deps, set())

    def test_simple_dependency(self):
        requirement = InstallRequirement._from_string('E *')
        expected_deps = packages_from_definition(
            'C 0.0.0-1; depends (E >= 1.0.0)'
        )

        deps = compute_reverse_dependencies(self.repos, requirement)
        self.assertEqual(deps, set(expected_deps))

    def test_chained_dependencies(self):
        requirement = InstallRequirement._from_string('D ^= 0.0.0')
        expected_deps = packages_from_definition(
            """B 0.0.0-1; depends (D == 0.0.0-2)
            B 0.0.0-2; depends (D ^= 0.0.0)"""
        )
        deps = compute_reverse_dependencies(self.repos, requirement)
        self.assertEqual(deps, set(expected_deps))

    def test_chained_dependencies_transitive(self):
        requirement = InstallRequirement._from_string('D ^= 0.0.0')
        expected_deps = packages_from_definition(
            """A 0.0.0-1; depends (B ^= 0.0.0)
            B 0.0.0-1; depends (D == 0.0.0-2)
            B 0.0.0-2; depends (D ^= 0.0.0)"""
        )
        deps = compute_reverse_dependencies(self.repos, requirement,
                                            transitive=True)
        self.assertEqual(deps, set(expected_deps))


class TestComputeLeafPackages(unittest.TestCase):

    def setUp(self):
        repo_0 = Repository(packages_from_definition(PACKAGE_DEF_0))
        repo_1 = Repository(packages_from_definition(PACKAGE_DEF_1))
        repo_2 = Repository(packages_from_definition(PACKAGE_DEF_2))
        self.repos = [repo_0, repo_1, repo_2]

    def test_simple(self):
        expected_leaf_packages = packages_from_definition(
            """A 0.0.0-1; depends (B ^= 0.0.0)
            C 0.0.0-1; depends (E >= 1.0.0)
            E 0.0.0-1 """
        )
        leaf_packages = compute_leaf_packages(self.repos)

        self.assertEqual(leaf_packages, set(expected_leaf_packages))
