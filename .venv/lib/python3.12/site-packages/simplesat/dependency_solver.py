import collections
import itertools

import attr
import six

from simplesat.constraints import ConstraintModifiers
from simplesat.constraints.requirement import InstallRequirement
from simplesat.errors import (
    NoPackageFound, SatisfiabilityError, SatisfiabilityErrorWithHint,
    UnexpectedlySatisfiable)
from simplesat.pool import Pool
from simplesat.repository import Repository
from simplesat.request import JobType, Request
from simplesat.rules_generator import RulesGenerator
from simplesat.sat.policy import InstalledFirstPolicy
from simplesat.sat import MiniSATSolver
from simplesat.transaction import Transaction, InstallOperation
from simplesat.utils import timed_context, connected_nodes


def requirements_from_packages(packages):
    """
    Return a list of requirements, one to match each package in `packages`.

    Parameters
    ----------
    packages : iterable of PackageMetadata
        The packages for which to generate requirements.

    Returns
    -------
    tuple of Requirement
        The matching requirements.
    """
    R = InstallRequirement.from_package_string
    return tuple(R("{0.name}-{0.version}".format(package))
                 for package in packages)


def packages_from_requirements(packages, requirements, modifiers=None):
    """
    Return a new tuple that only contains packages explicitly mentioned
    in the requirements.

    Parameters
    ----------
    packages : iterable of PackageMetadata
        The packages available for inclusion in the result.
    requirements : list of Requirement
        The requirements used to identify relevant packages. All packages that
        satisfy any of the requirements will be included.
    modifiers : ConstraintModifiers, optional
        If not None, modify requirements before resolving packages.

    Returns
    -------
    Tuple of PackageMetadata
        A tuple containing the relevant packages.
    """
    pool = Pool((Repository(packages),), modifiers=modifiers)
    listed_packages = set()
    for requirement in requirements:
        listed_packages.update(pool.what_provides(requirement))
    return tuple(sorted(listed_packages, key=lambda p: p._key))


def packages_are_consistent(packages, modifiers=None):
    """
    Return True if all packages can be installed together.

    .. Note::
        This will return `False` if more than one version of a package is
        present because we only permit one at a time.

    Parameters
    ----------
    packages : iterable of PackageMetadata
        The packages to check for consistency.
    modifiers : ConstraintModifiers, optional
        If not None, modify requirements before resolving packages.

    Returns
    -------
    bool
        True if every package in `packages` can be installed
        simultaneously, otherwise False.
    """
    requirements = requirements_from_packages(packages)
    return requirements_are_satisfiable(
        packages, requirements, modifiers=modifiers)


def requirements_are_complete(packages, requirements, modifiers=None):
    """
    Return True if `requirements` includes all required transitive
    dependencies. I.e. it will report whether all the packages that are needed
    are explicitly required.

    Parameters
    ----------
    packages : iterable of PackageMetadata
        The packages available to draw from when satisfying requirements.
    requirements : iterable of Requirement
        The requirements used to identify relevent packages.
    modifiers : ConstraintModifiers, optional
        If not None, modify requirements before resolving packages.

    Returns
    -------
    bool
        True if the requirements specify all necessary packages.
    """
    packages = packages_from_requirements(
        packages, requirements, modifiers=modifiers)
    return requirements_are_satisfiable(
        packages, requirements, modifiers=modifiers)


def requirements_are_satisfiable(packages, requirements, modifiers=None):
    """ Determine if the `requirements` can be satisfied together.

    Parameters
    ----------
    packages : iterable of PackageMetadata
        The packages available to draw from when satisfying requirements.
    requirements : list of Requirement
        The requirements used to identify relevent packages.
    modifiers : ConstraintModifiers, optional
        If not None, modify requirements before resolving packages.

    Returns
    -------
    bool
        Return True if the `requirements` can be satisfied by the `packages`.
    """
    modifiers = modifiers or ConstraintModifiers()
    Result = collections.namedtuple("Result", "is_satisfiable message")

    request = Request(modifiers=modifiers)
    for requirement in requirements:
        request.install(requirement)
    repositories = (Repository(packages),)
    pool = Pool(repositories, modifiers=modifiers)

    try:
        DependencySolver(pool, repositories, []).solve(request)
        return Result(is_satisfiable=True, message="")
    except SatisfiabilityError as e:
        return Result(
            is_satisfiable=False, message=e.unsat.to_string(pool=pool)
        )


def satisfy_requirements(packages, requirements, modifiers=None):
    """ Find a collection of packages that satisfy the requirements.

    Parameters
    ----------
    packages : iterable of PackageMetadata
        The packages available to draw from when satisfying requirements.
    requirements : list of Requirement
        The requirements used to identify relevent packages.
    modifiers : ConstraintModifiers, optional
        If not None, modify requirements before resolving packages.

    Returns
    -------
    tuple of PackageMetadata
        Return a tuple of packages that together satisfy all of the
        `requirements`. The packages are in topological order.

    Raises
    ------
    SatisfiabilityError
        If the `requirements` cannot be satisfied using the `packages`.
    """
    request = Request(modifiers=modifiers)
    for requirement in requirements:
        request.install(requirement)
    repositories = (Repository(packages),)
    pool = Pool(repositories, modifiers=modifiers)
    transaction = DependencySolver(pool, repositories, []).solve(request)
    msg = ("""
        Unexpected operation in the transaction. This should never occur.
        Something in simplesat is broken.
        {!r}""")
    for op in transaction.operations:
        # Our installed repository was empty so everything should be an install
        # operation
        assert isinstance(op, InstallOperation), msg.format(op)
    packages = tuple(op.package for op in transaction.operations)
    return packages


def simplify_requirements(packages, requirements):
    """ Return a reduced, but equivalent set of requirements.

    Parameters
    ----------
    packages : iterable of PackageMetadata
        The packages available to draw from when satisfying requirements.
    requirements : list of Requirement
        The requirements used to identify relevent packages.

    Returns
    -------
    tuple of Requirement
        The reduced requirements.
    """

    needed_packages = packages_from_requirements(packages, requirements)
    pool = Pool([Repository(packages)])
    R = InstallRequirement.from_constraints
    dependencies = set(itertools.chain.from_iterable(
        pool.what_provides(R(con))
        for package in needed_packages
        for con in package.install_requires
    ))
    simple_requirements = requirements_from_packages(
        package
        for package in needed_packages
        if package not in dependencies
    )
    return simple_requirements


def minimal_unsatisfiable_subset(clauses, callback):
    """
    Given a set of clauses, find a minimal unsatisfiable subset (an
    unsatisfiable core)

    A set is a minimal unsatisfiable subset if no proper subset is
    unsatisfiable.  A set of clauses may have many minimal unsatisfiable
    subsets of different sizes.

    Parameters
    ----------
    clauses : seq
        Iterator over a set of clauses. Clause should follow the format
        expected by callback
    callback : callable
        A function of the form f: <clauses subset> -> bool, returning True if
        the given subset of clauses is satisfiable, False otherwise. It should
        follow the constraint A <= B iff (f(B) <= f(A)), with False < True.

    Note
    ----
    Function adapted from conda (conda.logic as of 4.0.5), itself implemented
    from http://www.slideshare.net/pvcpvc9/lecture17-31382688. The conda
    function mentions the following:

    We do a binary search on the clauses by splitting them in halves A and B.
    If A or B is UNSAT, we use that and repeat. Otherwise, we recursively check
    A, but each time we do a sat query, we include B, until we have a minimal
    subset A* of A such that A* U B is UNSAT. Then we find a minimal subset B*
    of B such that A* U B* is UNSAT. Then A* U B* will be a minimal
    unsatisfiable subset of the original set of clauses.

    Proof: If some proper subset S of A* U B* is UNSAT, then there is some
    clause c in A* U B* not in S. If c is in A*, then that means (A* - {c}) U
    B* is UNSAT, and hence (A* - {c}) U B is UNSAT, since it is a superset,
    which contradicts A* being the minimal subset of A with such property.
    Similarly, if c is in B, then A* U (B* - {c}) is UNSAT, but B* - {c} is a
    strict subset of B*, contradicting B* being the minimal subset of B with
    this property.
    """
    clauses = tuple(clauses)
    if callback(clauses):
        raise UnexpectedlySatisfiable()

    def split(s):
        """
        Split s into two roughly equal parts
        """
        s = tuple(s)
        size = len(s)
        return s[:size//2], s[size//2:]

    def minimal_unsat(clauses, include=()):
        """
        Return a minimal subset A of clauses such that A + include is
        unsatisfiable.

        Implicitly assumes that clauses + include is unsatisfiable.
        """
        # Base case: Since clauses + include is implicitly assumed to be
        # unsatisfiable, if clauses has only one element, it must be its own
        # minimal subset
        if len(clauses) == 1:
            return clauses

        A, B = split(clauses)

        # If one half is unsatisfiable (with include), we can discard the
        # other half.
        if not callback(A + include):
            return minimal_unsat(A, include)
        if not callback(B + include):
            return minimal_unsat(B, include)

        Astar = minimal_unsat(A, B + include)
        Bstar = minimal_unsat(B, Astar + include)
        return Astar + Bstar

    return minimal_unsat(clauses)


class DependencySolver(object):

    """
    Top-level class for resolving a package management scenario.

    The solver is configured at construction time with packages repositories
    and a :class:`Policy` and exposes an API for computing a
    :class:`Transaction` that describes what to do.

    Parameters
    ----------
    pool : Pool
        Pool against which to resolve Requirements.
    remote_repositories : list of Repository
        Repositories containing package available for installation.
    installed_repository : Repository
        Repository containing the packages which are currently installed.
    use_pruning : bool, optional
        When True, attempt to prune package operations that are not strictly
        necessary for meeting the requirements. Without this, packages whose
        assignments have changed as an artefact of the search process, but
        which are not needed for the solution will be modified.

        A typical example might be the installation of a dependency for a
        package that was proposed but later backtracked away.
    strict : bool, optional
        When true, behave more harshly when dealing with broken packages. INFO
        level log messages become WARNINGs and missing dependencies become
        errors rather than causing the package to be ignored.


    >>> from simplesat.constraints.package_parser import \\
    ...     pretty_string_to_package as P
    >>> numpy1921 = P('numpy 1.9.2-1; depends (MKL 10.2-1)')
    >>> mkl = P('MKL 10.3-1')
    >>> installed_repository = Repository([mkl])
    >>> remote_repository = Repository([mkl, numpy1921])
    >>> request = Request()
    >>> request.install(Requirement.from_string('numpy >= 1.9'))
    >>> request.allow_newer('MKL')
    >>> pool = Pool([installed_repo] + remote_repos)
    >>> pool.modifiers = request.modifiers
    >>> solver = DependencySolver(pool, remote_repos, installed_repo)
    >>> transaction = solver.solve(request)
    """

    def __init__(self, pool, remote_repositories, installed_repository,
                 use_pruning=True, strict=False):
        self._pool = pool
        self._installed_repository = installed_repository

        if isinstance(remote_repositories, Repository):
            raise ValueError(
                u"remote_repositories should be a sequence of "
                u"repositories, not a repository")

        self._remote_repositories = remote_repositories
        self._last_rules_time = timed_context("Generate Rules")
        self._last_solver_init_time = timed_context("Solver Init")
        self._last_solve_time = timed_context("SAT Solve")

        self.strict = strict
        self.use_pruning = use_pruning

    def solve(self, request):
        """Given a request return a Transaction that would satisfy it.

        Parameters
        ----------
        request : Request
            The request that should be satisifed.

        Returns
        -------
        Transaction
            The operations to apply to resolve the `request`.

        Raises
        ------
        SatisfiabilityError
            If no resolution is found.
        """
        request = _convert_upgrade_request_if_needed(
            request, self._remote_repositories, self._installed_repository
        )

        modifiers = request.modifiers
        self._pool.modifiers = modifiers if modifiers.targets else None
        with self._last_rules_time:
            init_rules_and_policy = self._create_rules_and_initialize_policy
            requirement_ids, rules, policy = init_rules_and_policy(
                request
            )
        with self._last_solver_init_time:
            sat_solver = MiniSATSolver.from_rules(rules, policy)
        with self._last_solve_time:
            solution = sat_solver.search()
        solution_ids = _solution_to_ids(solution)

        installed_package_ids = set(
            self._pool.package_id(p)
            for p in self._installed_repository
        )

        if self.use_pruning:
            root_ids = installed_package_ids.union(requirement_ids)
            solution_ids = _connected_packages(
                solution_ids, root_ids, self._pool
            )

        return Transaction(self._pool, solution_ids, installed_package_ids)

    def solve_with_hint(self, request):
        """Given a request return a Transaction that would satisfy it.

        If the solver cannot find a solution, it will raise a
        SatisfiabilityErrorWithHint exception, that contains enough information
        to give a human-readable error message.

        Parameters
        ----------
        request : Request
            The request that should be satisifed.

        Returns
        -------
        Transaction
            The operations to apply to resolve the `request`.

        Raises
        ------
        SatisfiabilityErrorWithHint
            If no resolution is found.
        """
        try:
            return self.solve(request)
        except SatisfiabilityError as exc:
            # XXX: we recompute the upgrade request here so that we get the
            # corresponding jobs to be used by minimal_unsatisfiable_subset.
            request = _convert_upgrade_request_if_needed(
                request, self._remote_repositories, self._installed_repository
            )

            def callback(jobs):
                callback_request = Request(modifiers=request.modifiers)
                for job in jobs:
                    callback_request.jobs.append(job)
                try:
                    self.solve(callback_request)
                    return True
                except SatisfiabilityError:
                    return False
            conflicting_jobs = minimal_unsatisfiable_subset(
                request.jobs, callback)
            raise SatisfiabilityErrorWithHint(exc.unsat, conflicting_jobs)

    def _create_rules_and_initialize_policy(self, request):
        pool = self._pool
        installed_repository = self._installed_repository

        all_requirement_ids = []

        soft_update_packages = set()
        for job in request.jobs:
            assert job.kind in (
                JobType.install, JobType.remove, JobType.hard_update,
                JobType.soft_update
            ), 'Unknown job kind: {}'.format(job.kind)

            requirement = job.requirement

            providers = tuple(pool.what_provides(
                requirement, use_modifiers=False))
            if len(providers) == 0:
                raise NoPackageFound(requirement, str(requirement))

            if job.kind == JobType.hard_update:
                # An update request *must* install the latest package version
                def key(package):
                    return (package.version, package in installed_repository)
                providers = [max(providers, key=key)]
            elif job.kind == JobType.soft_update:
                soft_update_packages.update((pkg for pkg in providers
                                            if pkg in installed_repository))

            all_requirement_ids.extend(pool.package_id(p) for p in providers)

        installed_package_ids = collections.OrderedDict()
        for package in installed_repository:
            package_id = pool.package_id(package)
            installed_package_ids[package_id] = package

        # Prefer the installed versions of all packages
        policy = InstalledFirstPolicy(
            pool, installed_repository,
            ignore_installed_packages=soft_update_packages)
        policy.add_requirements(all_requirement_ids)

        rules_generator = RulesGenerator(
            pool, request, installed_package_ids=installed_package_ids,
            strict=self.strict)

        return all_requirement_ids, list(rules_generator.iter_rules()), policy


def _convert_upgrade_request_if_needed(request, remote_repositories,
                                       installed_repository):

    if len(request.jobs) == 1 and request.jobs[0].kind == JobType.upgrade:
        upgrade_request = attr.assoc(request, jobs=[])
        remote_repository = Repository()
        for repository in remote_repositories:
            remote_repository.update(repository)

        latest_packages = []
        for package in installed_repository:
            candidates = remote_repository.find_packages(package.name)
            # candidates may be empty (e.g. when repository configuration
            # changed, and an installed package is coming from a repository not
            # configured in the remote list)
            if len(candidates) > 0:
                latest_packages.append(candidates[-1])

        for p in latest_packages:
            upgrade_request.install(
                InstallRequirement._from_string(
                    "{} == {}".format(p.name, p.version))
            )

        return upgrade_request
    else:
        return request


def _connected_packages(solution, root_ids, pool):
    """ Return packages in `solution` which are associated with `root_ids`. """

    # Our strategy is as follows:
    # ... -> pkg.install_requires -> pkg names -> ids -> _id_to_package -> ...

    def get_names(pkg_id):
        provides = pool.id_to_package(abs(pkg_id)).provides
        return tuple(name for name, _ in provides)

    root_names = {name for pkg_id in root_ids for name in get_names(pkg_id)}

    solution_name_to_id = {
        name: pkg_id
        for pkg_id in solution
        for name in get_names(pkg_id)
        if pkg_id > 0
    }

    solution_root_ids = set(
        pkg_id for name, pkg_id in six.iteritems(solution_name_to_id)
        if name in root_names
    )

    def neighborfunc(pkg_id):
        """ Given a pkg id, return the pkg ids of the immediate dependencies
        that appeared in our solution. """
        constraints = pool.id_to_package(pkg_id).install_requires
        neighbors = set(solution_name_to_id[name] for name, _ in constraints)
        return neighbors

    # Each package can root its own independent graph, so we must start at
    # each one individually
    should_include = set()
    for pkg_id in solution_root_ids:
        # We pass in `should_include` to avoid re-walking a subgraph
        nodes = connected_nodes(pkg_id, neighborfunc, should_include)
        should_include.update(nodes)
    assert should_include.issuperset(solution_root_ids)

    # In addition to all updates and additions to root ids, we must also keep
    # all packages newly *excluded* from root_ids
    connected = should_include.union(s for s in solution if abs(s) in root_ids)
    return connected


def _solution_to_ids(solution):
    # Return solution as list of signed integers.
    ids = (pkg_id if value else -pkg_id
           for pkg_id, value in six.iteritems(solution))
    return sorted(ids, key=lambda lit: abs(lit))
