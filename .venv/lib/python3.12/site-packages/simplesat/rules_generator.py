import enum
from collections import OrderedDict, deque
import logging

from .constraints import ConflictRequirement, InstallRequirement
from .errors import (
    MissingConflicts, MissingInstallRequires, NoPackageFound, SolverException
)
from .request import JobType


logger = logging.getLogger(__name__)

INDENT = 4


class RuleType(enum.Enum):
    internal_allow_update = 1
    job_install = 2
    job_remove = 3
    job_update = 4
    package_requires = 7
    package_conflicts = 8
    package_same_name = 10
    package_installed = 12
    package_broken = 100

    internal = 256

    @property
    def is_job(self):
        return self in (
            RuleType.job_install,
            RuleType.job_remove,
            RuleType.job_update
        )


class PackageRule(object):
    @classmethod
    def _from_string(cls, rule_string, pool):
        """
        Creates a PackageRule from a rule string, e.g.
            '-numpy-1.6.0 | numpy-1.7.0'

        Because package full name -> id is not 1-to-1 mapping, this may fail
        when a package has multiple ids. This is mostly used for testing, to
        write reference rules a bit more easily.
        """
        packages_string = (s.strip() for s in rule_string.split("|"))
        package_literals = []
        for package_string in packages_string:
            if package_string.startswith("-"):
                positive = False
                package_string = package_string[1:]
            else:
                positive = True

            requirement = InstallRequirement.from_package_string(
                package_string)
            package_candidates = pool.what_provides(requirement)
            if len(package_candidates) == 0:
                msg = "No candidate for package {0!r}".format(package_string)
                raise NoPackageFound(requirement, msg)
            elif len(package_candidates) > 1:
                msg = "> 1 candidate for package {0!r} requirement, cannot " \
                      "create rule from it" % package_string
                raise SolverException(msg)
            else:
                _id = pool.package_id(package_candidates[0])
                if positive:
                    package_literals.append(_id)
                else:
                    package_literals.append(-_id)
        return cls(package_literals, None, requirements=(requirement,))

    def __init__(self, literals, reason, requirements=None):
        self.literals = tuple(sorted(literals))
        self._reason = RuleType(reason)
        assert isinstance(requirements, (tuple, type(None)))
        self._requirements = requirements or ()

    @property
    def is_assertion(self):
        return len(self.literals) == 1

    @property
    def reason(self):
        return self._reason

    def _pretty_literals(self, pool, literals, sign=True, unique=False):
        parts = (pool.id_to_string(literal) for literal in literals)
        if not sign:
            parts = (p[1:] for p in parts)
        if unique:
            parts = OrderedDict.fromkeys(parts).keys()
        return " | ".join(parts)

    def to_string(self, pool, unique=False):
        s = self._pretty_literals(pool, self.literals, unique=unique)

        if self._reason == RuleType.job_install:
            rule_desc = "Install command rule ({})".format(s)
        elif self._reason == RuleType.job_update:
            rule_desc = "Update to latest command rule ({})".format(s)
        elif self._reason == RuleType.job_remove:
            rule_desc = "Remove command rule ({})".format(s)
        elif self._reason == RuleType.package_same_name:
            s = self._pretty_literals(
                pool, (abs(i) for i in self.literals), unique=unique)
            rule_desc = "Can only install one of: ({})".format(s)
        elif self._reason == RuleType.package_installed:
            parts = [pool.id_to_string(abs(literal))
                     for literal in self.literals]
            s = " | ".join(parts)
            rule_desc = "Should install one of: ({})".format(s)
        elif self._reason == RuleType.package_requires:
            source_ids = [abs(self.literals[0])]
            source = self._pretty_literals(pool, source_ids, unique=unique)
            source = source[1:]  # trim off +/- sign
            s = self._pretty_literals(pool, self.literals[1:], unique=unique)
            rule_desc = "{} requires ({})".format(source, s)
        elif self._reason == RuleType.package_conflicts:
            left_ids, right_ids = self.literals[0:1], self.literals[1:]
            left = self._pretty_literals(pool, left_ids, sign=False)
            right = self._pretty_literals(pool, (abs(i) for i in right_ids))
            rule_desc = "{} conflicts with {}".format(left, right)
        elif self._reason == RuleType.package_broken:
            package_id = self.literals[0]
            # Trim the sign
            package_str = pool.id_to_string(abs(package_id))
            msg = "{} was ignored because it depends on missing packages"
            rule_desc = msg.format(package_str)
        else:
            rule_desc = s

        if self._requirements:
            reqs = ' <- '.join("'{}'".format(r) for r in self._requirements)
            rule_desc = "Requirements: {reqs}\n{indent}{rule}".format(
                reqs=reqs, rule=rule_desc, indent=" " * INDENT)

        return rule_desc

    def __eq__(self, other):
        return (isinstance(other, self.__class__) and
                self.literals == other.literals)

    def __ne__(self, other):
        return not (self == other)

    def __hash__(self):
        return hash(self.literals)


class RulesGenerator(object):
    def __init__(self, pool, request,
                 installed_package_ids=None, strict=False):
        self._rules_set = OrderedDict()
        self._pool = pool

        self.request = request
        self.installed_package_ids = installed_package_ids or OrderedDict()
        self.added_package_ids = set()
        self.strict = strict

    def iter_rules(self):
        """
        Return an iterator over each created rule.
        """
        self.added_package_ids = set()
        # This attaches the job requirement to the created rule. We need
        # to run it first because duplicated rules are ignored. Otherwise,
        # we'll end up keeping the rule instance that doesn't know it should be
        # associated with a job.
        self._add_job_rules()
        for package in self.installed_package_ids.values():
            self._add_installed_package_rules(package)
            self._add_package_rules(package)
        return self._rules_set

    # ------------------------------
    # API to create individual rules
    # ------------------------------
    def _create_dependency_rule(self, package, install_requires, reason,
                                requirements=None):
        """
        Create the rule for the install_requires of a package.

        This dependency is of the form (-A | R1 | R2 | R3) where R* are
        the set of packages provided by the dependency requirement.

        Parameters
        ----------
        package: PackageMetadata
            The package with a requirement
        install_requires: sequence
            Sequence of packages that fulfill the requirement.
        reason: RuleType
            A valid PackageRule.reason value
        requirements: tuple of Requirement
            Optional requirements explaining the rule's origin.

        Returns
        -------
        rule: PackageRule or None
        """
        literals = [-self._pool.package_id(package)]

        for dependency in install_requires:
            if dependency != package:
                literals.append(self._pool.package_id(dependency))

        return PackageRule(literals, reason, requirements=requirements)

    def _create_conflicts_rule(self, issuer, provider,
                               reason, requirements=None):
        """
        Return a conflict rule between issuer and provider or None if issuer ==
        provider.

        The rule is of the form (-A | -B)

        Parameters
        ----------
        issuer: PackageMetadata
            Package declaring the conflict
        provider: PackageMetadata
            Package causing the conflict
        reason: RuleType
            One of PackageRule.reason
        requirements: tuple of Requirement
            Optional requirements explaining the rule's origin.

        Returns
        -------
        rule: PackageRule or None
        """
        if issuer != provider:
            return PackageRule([-self._pool.package_id(issuer),
                                -self._pool.package_id(provider)],
                               reason, requirements=requirements)
        else:
            return None

    def _create_install_one_of_rule(self, packages, reason, requirements=None):
        """
        Creates a rule to Install one of the given packages.

        The rule is of the form (A | B | C)

        Parameters
        ----------
        packages: sequence
            List of packages to choose from
        reason: RuleType
            One of PackageRule.reason
        requirements: tuple of Requirement
            Optional requirements explaining the rule's origin.

        Returns
        -------
        rule: PackageRule
        """
        literals = [self._pool.package_id(p) for p in packages]
        return PackageRule(literals, reason, requirements=requirements)

    def _create_remove_rule(self, package, reason, requirements=None):
        """
        Create the rule to remove a package.

        For a package A, the rule is simply (-A)

        Parameters
        ----------
        package: PackageMetadata
            The package with a requirement
        reason: RuleType
            One of PackageRule.reason
        requirements: tuple of Requirement
            Optional requirements explaining the rule's origin.

        Returns
        -------
        rule: PackageRule
        """
        return PackageRule((-self._pool.package_id(package),), reason,
                           requirements=requirements)

    # -------------------------------------------------
    # API to assemble individual rules from requirement
    # -------------------------------------------------
    def _add_rule(self, rule, rule_type):
        """
        Add the given rule to the internal rules set.

        Does nothing if the rule is None.

        Parameters
        ----------
        rule: PackageRule or None
            The rule to add
        rule_type: RuleType
            Rule's type
        """
        if rule is not None and rule not in self._rules_set:
            self._rules_set[rule] = None

    def _add_install_requires_rules(self, package, work_queue, requirements):
        all_dependency_candidates = []
        for constraints in package.install_requires:
            pkg_requirement = InstallRequirement.from_constraints(constraints)
            dependency_candidates = self._pool.what_provides(pkg_requirement)

            # We add our new requirement to the stack of requirements we've
            # gathered so far for these rules.
            combined_requirements = (
                requirements + (pkg_requirement,)
                if requirements is not None
                else None)

            if not dependency_candidates:
                pkg_msg = "'{0.name} {0.version}'"
                if hasattr(package, 'repository_info'):
                    pkg_msg += " from '{0.repository_info.name}'"
                pkg_str = pkg_msg.format(package)
                req_str = str(pkg_requirement)
                msg = ("Blocking package {0!s}: no candidates found for"
                       " dependency {1!r}").format(pkg_str, req_str)
                if self.strict:
                    # We only raise an exception if this comes directly from a
                    # job requirement. Unfortunately, we don't track that
                    # explicitly because we push all of the work through a
                    # queue. As a proxy, we can examine the associated
                    # requirements directly. Everything is rooted in a job, so
                    # if there's only one requirement, that must be it.
                    if len(requirements) == 1:
                        raise MissingInstallRequires(pkg_requirement, msg)
                    else:
                        logger.warning(msg)
                else:
                    logger.info(msg)

                rule = self._create_remove_rule(
                    package, RuleType.package_broken,
                    requirements=combined_requirements,
                )
                self._add_rule(rule, "package")
                return

            rule = self._create_dependency_rule(
                package, dependency_candidates, RuleType.package_requires,
                combined_requirements)
            self._add_rule(rule, "package")
            # We're "buffering" this so that we don't queue up any dependencies
            # unless they are all successfully processed
            all_dependency_candidates.extend(
                (candidate, combined_requirements)
                for candidate in dependency_candidates)
        work_queue.extend(all_dependency_candidates)

    def _add_conflicts_rules(self, package, requirements):
        """
        Create rules for each of the known conflicts with `package`.
        """

        # Conflicts due to same-name
        pkg_requirement = ConflictRequirement._from_string(package.name)
        obsolete_providers = self._pool.what_provides(pkg_requirement)
        # We add our new requirement to the stack of requirements we've
        # gathered so far for these rules.
        combined_requirements = (
            requirements + (pkg_requirement,)
            if requirements is not None
            else None)
        for provider in obsolete_providers:
            if provider != package and provider.name == package.name:
                reason = RuleType.package_same_name
                rule = self._create_conflicts_rule(
                    package, provider, reason, combined_requirements)
                self._add_rule(rule, "package")

        # Explicit conflicts in package metadata
        for constraints in package.conflicts:
            pkg_requirement = ConflictRequirement.from_constraints(constraints)
            conflict_providers = self._pool.what_provides(pkg_requirement)
            combined_requirements = (
                requirements + (pkg_requirement,)
                if requirements is not None
                else None)

            if not conflict_providers:
                pkg_msg = "'{0.name} {0.version}'"
                if hasattr(package, 'repository_info'):
                    pkg_msg += " from '{0.repository_info.name}'"
                pkg_str = pkg_msg.format(package)
                req_str = str(pkg_requirement)
                msg = ("No candidates found for requirement {0!r}, needed"
                       " for conflict with {1!s}").format(req_str, pkg_str)
                if self.strict:
                    # We only raise an exception if this comes directly from a
                    # job requirement. Unfortunately, we don't track that
                    # explicitly because we push all of the work through a
                    # queue. As a proxy, we can examine the associated
                    # requirements directly.
                    if len(requirements) == 1:
                        raise MissingConflicts(pkg_requirement, msg)
                    else:
                        logger.warning(msg)
                else:
                    # We just ignore missing constraints. They don't break
                    # anything.
                    logger.info(msg)

            for provider in conflict_providers:
                rule = self._create_conflicts_rule(
                    package, provider, RuleType.package_conflicts,
                    requirements=combined_requirements)
                self._add_rule(rule, "package")

    def _add_package_rules(self, package, requirements=None):
        """
        Create all the rules required to satisfy installing the given package.
        """
        work_queue = deque()
        work_queue.append((package, requirements))

        while len(work_queue) > 0:
            p, requirements = work_queue.popleft()
            p_id = self._pool.package_id(p)
            if p_id not in self.added_package_ids:
                self.added_package_ids.add(p_id)
                # We have to pass along our history-stack of requirements so
                # that they can be attached to the rules generated from here.
                self._add_install_requires_rules(p, work_queue, requirements)
                self._add_conflicts_rules(p, requirements)

    def _add_install_job_rules(self, job):
        packages = self._pool.what_provides(
            job.requirement, use_modifiers=False)
        if len(packages) > 0:
            for package in packages:
                # This is an optimization to avoid iterating over the installed
                # packages again.
                package_id = self._pool.package_id(package)
                if package_id not in self.installed_package_ids:
                    # Rules created directly from a job requirement have no
                    # other requirements in their history-stack
                    self._add_package_rules(
                        package, requirements=(job.requirement,))

            rule = self._create_install_one_of_rule(
                packages, RuleType.job_install,
                requirements=(job.requirement,))
            self._add_rule(rule, "job")
        else:
            raise NoPackageFound(job.requirement, str(job.requirement))

    def _add_remove_job_rules(self, job):
        packages = self._pool.what_provides(
            job.requirement, use_modifiers=False)
        for package in packages:
            rule = self._create_remove_rule(
                package, RuleType.job_remove, requirements=(job.requirement,))
            self._add_rule(rule, "job")

    def _add_update_job_rules(self, job):
        """
        Create rules that force the update of the package by requiring all of
        the standard rules then adding an additional rule for just the most
        recent version.
        """
        packages = self._pool.what_provides(
            job.requirement, use_modifiers=False)
        if len(packages) == 0:
            return

        # An update request *must* install the latest package version
        def key(package):
            package_id = self._pool.package_id(package)
            installed = package_id in self.installed_package_ids
            return (package.version, installed)
        package = max(packages, key=key)
        self._add_package_rules(package, requirements=(job.requirement,))
        rule = PackageRule(
            (self._pool.package_id(package),),
            RuleType.job_update,
            requirements=(job.requirement,),
        )
        self._add_rule(rule, "job")

    def _add_installed_package_rules(self, package):
        packages_all_versions = self._pool.name_to_packages(package.name)
        for other in packages_all_versions:
            self._add_package_rules(other)

    def _add_job_rules(self):
        for job in self.request.jobs:
            if job.kind in (JobType.install, JobType.soft_update):
                self._add_install_job_rules(job)
            elif job.kind == JobType.remove:
                self._add_remove_job_rules(job)
            elif job.kind == JobType.hard_update:
                self._add_update_job_rules(job)
            else:
                msg = "Job kind {0!r} not supported".format(job.kind)
                raise NotImplementedError(msg)
