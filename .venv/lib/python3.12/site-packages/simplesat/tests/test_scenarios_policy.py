import os.path
from unittest import TestCase

import six

from simplesat.errors import NoPackageFound, SatisfiabilityError
from simplesat.dependency_solver import DependencySolver
from simplesat.pool import Pool
from simplesat.test_utils import Scenario
from simplesat.transaction import (
    InstallOperation, RemoveOperation, UpdateOperation
)


def _pretty_operation(op):
    if isinstance(op, InstallOperation):
        s = "{} {}".format(op.package.name, op.package.version)
        return "InstallOperation(package={0})".format(s)
    if isinstance(op, RemoveOperation):
        s = "{} {}".format(op.package.name, op.package.version)
        return "RemoveOperation(package={0})".format(s)
    if isinstance(op, UpdateOperation):
        s0 = "{} {}".format(op.package.name, op.package.version)
        s1 = "{} {}".format(op.source.name, op.source.version)
        return "UpdateOperation(package={0}, source={1})".format(s0, s1)
    return str(op)


def _pkg_delta(operations, scenario_operations):
    pkg_delta = {}
    for p in operations:
        name = p.package.name
        pkg_delta.setdefault(name, [None, None])[0] = p
    for p in scenario_operations:
        name = p.package.name
        pkg_delta.setdefault(name, [None, None])[1] = p
    for n, v in list(six.iteritems(pkg_delta)):
        if _pretty_operation(v[0]) == _pretty_operation(v[1]):
            pkg_delta.pop(n)
    return pkg_delta


def _pretty_delta(pkg_delta):
    lines = []
    for k, v in sorted(pkg_delta.items()):
        lines.append(k)
        lines.append("  SOLVER  : {0}".format(_pretty_operation(v[0])))
        lines.append("  SCENARIO: {0}".format(_pretty_operation(v[1])))
        lines.append("")
    return '\n'.join(lines)


class ScenarioTestAssistant(object):

    def setUp(self):
        self.maxDiff = None

    def _check_solution(self, filename, prefer_installed=True):
        # Test that the solution described in the scenario file matches with
        # what the SAT solver computes.

        # Given
        scenario = Scenario.from_yaml(
            os.path.join(os.path.dirname(__file__), filename)
        )
        request = scenario.request

        # When
        pool = Pool(scenario.remote_repositories)
        pool.add_repository(scenario.installed_repository)

        solver = DependencySolver(
            pool, scenario.remote_repositories, scenario.installed_repository,
        )

        # Then
        try:
            transaction = solver.solve(request)
        except SatisfiabilityError as failure:
            self.assertFailureEqual(pool, failure, scenario)
        else:
            if scenario.failed:
                msg = "Solver unexpectedly succeeded, but {0}"
                self.fail(msg.format(scenario.failure['raw']))
            self.assertEqualOperations(transaction.operations,
                                       scenario.operations)
            if (scenario.pretty_operations or
                    transaction.operations != transaction.pretty_operations):
                self.assertEqualOperations(transaction.pretty_operations,
                                           scenario.pretty_operations)

    def assertFailureEqual(self, pool, failure, scenario):
        if not scenario.failed:
            msg = "Solver unexpectedly failed"
            if failure.unsat:
                reason = failure.unsat.to_string(pool=pool)
                msg += ":\n{0}".format(reason)
            self.fail(msg)

        result = [str(r) for r in failure.unsat.requirements]
        expected = scenario.failure['requirements']
        self.assertEqual(expected, result)

        result = failure.unsat.to_string(pool=pool)
        expected = scenario.failure['raw']
        self.assertMultiLineEqual(expected, result)

    def assertEqualOperations(self, operations, scenario_operations):
        pairs = zip(operations, scenario_operations)
        delta = _pretty_delta(_pkg_delta(operations, scenario_operations))
        for i, (left, right) in enumerate(pairs):
            left_s = "{0} {1}".format(left.package.name,
                                      left.package.version)
            right_s = "{0} {1}".format(right.package.name,
                                       right.package.version)
            if left_s != right_s:
                _pretty_delta(_pkg_delta(operations, scenario_operations))
                msg = "Item {0!r}: {1!r} vs {2!r}\n{3}".format(
                    i, left_s, right_s, delta)
                self.fail(msg)

            if type(left) is not type(right):
                msg = "Item {0!r} differ in kinds: {1!r} vs {2!r}\n{3}"
                self.fail(msg.format(i, left, right, delta))

        if len(operations) != len(scenario_operations):
            self.fail("Length of operations differ.\n{0}".format(delta))


class TestNoInstallSet(ScenarioTestAssistant, TestCase):

    def test_one_directly_implied_requirement(self):
        self._check_solution("one_directly_implied_requirement.yaml")

    def test_directly_implied_solution(self):
        self._check_solution("directly_implied_solution.yaml")

    def test_simple_numpy(self):
        self._check_solution("simple_numpy.yaml")

    def test_ipython(self):
        self._check_solution("ipython.yaml")

    def test_iris(self):
        self._check_solution("iris.yaml")

    def test_no_candidate(self):
        with self.assertRaises(NoPackageFound):
            self._check_solution("no_candidate.yaml")

    def test_three_way_conflict(self):
        self._check_solution("three_way_conflict.yaml")

    def test_conflicting_single_package_dependencies(self):
        self._check_solution("broken_metadata_self_conflict.yaml")

    def test_simple_provides(self):
        self._check_solution("simple_provides.yaml")

    def test_multiple_provides(self):
        self._check_solution("multiple_provides.yaml")

    def test_conflict_by_provides(self):
        self._check_solution("conflict_by_provides.yaml")


class TestInstallSet(ScenarioTestAssistant, TestCase):

    def test_simple_update_single(self):
        self._check_solution("simple_update_single.yaml")

    def test_update_single(self):
        self._check_solution("update_single.yaml")

    def test_no_prefer_installed(self):
        self._check_solution("no_prefer_installed.yaml",
                             prefer_installed=False)

    def test_update_all(self):
        self._check_solution("update_all.yaml")

    def test_update_all_conflict(self):
        self._check_solution("update_all_conflict.yaml")

    def test_update_all_noop(self):
        self._check_solution("update_all_noop.yaml")

    def test_ipython_upgrade(self):
        self._check_solution("ipython_upgrade.yaml")

    def test_simple_numpy(self):
        self._check_solution("simple_numpy_installed.yaml")

    def test_simple_numpy_installed_upgrade(self):
        self._check_solution("simple_numpy_installed_upgrade.yaml")

    def test_soft_update_with_deps(self):
        self._check_solution("soft_update_with_deps.yaml")

    def test_installed_pkg_missing_in_remote(self):
        self._check_solution("installed_pkg_missing_in_remote.yaml")

    def test_installed_pkg_missing_in_remote_not_requested(self):
        self._check_solution(
            "installed_pkg_missing_in_remote_not_requested.yaml"
        )

    def test_numpy_downgrade(self):
        self._check_solution("numpy_downgrade.yaml")

    def test_complex_numpy_downgrade(self):
        # Regression test for infinite loop in policy
        self._check_solution("complex_numpy_downgrade.yaml")

    def test_ipython(self):
        self._check_solution("ipython_with_installed.yaml")

    # This is currently handled using marked packages
    def test_blocked_upgrade(self):
        self._check_solution("preserve_marked_conflict.yaml")

    # This is currently handled using marked packages
    def test_blocked_downgrade(self):
        self._check_solution("preserve_marked_conflict_downgrade.yaml")

    def test_remove_no_reverse_dependencies(self):
        self._check_solution("simple_numpy_removed.yaml")

    def test_remove_reverse_dependencies(self):
        self._check_solution("remove_reverse_dependencies.yaml")

    def test_preserve_marked_packages(self):
        self._check_solution("preserve_marked.yaml")

    def test_remove_marked_packages(self):
        self._check_solution("remove_marked_package.yaml")

    def test_update_reverse_dependencies(self):
        self._check_solution(
            "update_reverse_dependencies.yaml",
            prefer_installed=True
        )

    def test_update_reverse_dependencies_no_prefer_installed(self):
        self._check_solution(
            "update_reverse_dependencies_no_prefer_installed.yaml",
            prefer_installed=False
        )

    def test_multiple_jobs(self):
        self._check_solution("multiple_jobs.yaml")

    def test_conflicts_simple(self):
        self._check_solution("explicit_conflict.yaml")

    def test_upgrade_conflict(self):
        self._check_solution("pil_pillow_upgrade_conflict.yaml")

    def test_downgrade_conflict(self):
        self._check_solution("pillow_pil_downgrade_conflict.yaml")

    def test_epd_full_conflict(self):
        self._check_solution("epd_full_conflict.yaml")

    def test_constraint_modifiers(self):
        self._check_solution('constraint_modifiers.yaml')
