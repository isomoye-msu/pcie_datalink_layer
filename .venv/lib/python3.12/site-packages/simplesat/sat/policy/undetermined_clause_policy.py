#!/usr/bin/env python
# -*- coding: utf-8 -*-

import six

from .policy import IPolicy, pkg_id_to_version
from .policy_logger import LoggedPolicy


class UndeterminedClausePolicy(IPolicy):

    """ An IPolicy that gathers all undetermined packages from clauses whose
    truth value is not yet known and suggests them in descending order by
    package version number. """

    def __init__(self, pool, installed_repository,
                 ignore_installed_packages=None):
        if ignore_installed_packages is None:
            ignore_installed_packages = set()
        self._pool = pool

        by_version = six.functools.partial(pkg_id_to_version, self._pool)
        installed_packages = set(installed_repository)
        prefer_installed_pkgs = installed_packages - ignore_installed_packages
        self._prefer_installed_pkg_ids = sorted(
            (pool.package_id(pkg) for pkg in prefer_installed_pkgs),
            key=by_version)

        self._decision_set = set()
        self._requirements = set()
        self._all_ids = set()

    def add_requirements(self, package_ids):
        self._requirements.update(package_ids)

    def get_next_package_id(self, assignments, clauses):
        """Get the next unassigned package.
        """
        if assignments.new_keys:
            self._refresh_decision_set(assignments, clauses)

        candidate_id = None
        best = self._best_candidate

        candidate_id = self._best_sorted_candidate(
            self._prefer_installed_pkg_ids, assignments)

        if candidate_id is None:
            candidate_id = best(self._requirements, assignments)

        if candidate_id is None:
            candidate_id = best(self._decision_set, assignments, update=True)

        if candidate_id is None:
            self._refresh_decision_set(assignments, clauses)
            candidate_id = best(self._decision_set, assignments)

        if candidate_id is None:
            candidate_id = best(self._all_ids, assignments)

        assert assignments.get(candidate_id) is None, \
            "Trying to assign to a variable which is already assigned."

        return candidate_id

    def _without_assigned(self, package_ids, assignments):
        return package_ids.difference(assignments.assigned_ids)

    def _best_sorted_candidate(self, package_ids, assignments):
        for p_id in package_ids:
            if p_id not in assignments.assigned_ids:
                return p_id

    def _best_candidate(self, package_ids, assignments, update=False):
        by_version = six.functools.partial(pkg_id_to_version, self._pool)
        unassigned = self._without_assigned(package_ids, assignments)
        if update:
            package_ids.clear()
            package_ids.update(unassigned)
        try:
            return max(unassigned, key=by_version)
        except ValueError:
            return None

    def _refresh_decision_set(self, assignments, clauses):
        assignments.consume_changelog()

        all_ids = {abs(l) for c in clauses for l in c.lits}  # noqa
        all_ids.update(self._prefer_installed_pkg_ids)
        self._all_ids = all_ids

        unsatisfied_clauses = {
            clause for clause in clauses
            if not any(assignments.value(l) for l in clause.lits)  # noqa
        }
        self._decision_set.clear()
        self._decision_set.update(
            abs(lit)
            for clause in unsatisfied_clauses
            for lit in clause.lits
        )
        self._decision_set.difference_update(assignments.assigned_ids)


LoggedUndeterminedClausePolicy = LoggedPolicy(UndeterminedClausePolicy)
