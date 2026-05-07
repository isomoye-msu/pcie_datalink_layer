"""
A SAT solver which follows the Minisat approach.

"""
from __future__ import absolute_import

from collections import defaultdict, deque, OrderedDict
import itertools

from six.moves import range

from simplesat.errors import SatisfiabilityError
from .assignment_set import AssignmentSet
from .clause import Clause
from .policy import DefaultPolicy
from simplesat.utils import timed_context
from simplesat.utils.graph import breadth_first_search


class UNSAT(object):

    """An unsatisfiable set of boolean clauses."""

    def __init__(self, conflict_clause, learned_clause, trails,
                 assigning_clauses):
        """
        Create a new UNSAT object.

        Parameters
        ----------
        conflict : Clause
            The clause which has been found to be unsatisfiable.
        learned_clause : Clause
            The implied change needed to satisfiy the conflict.

            This clause is always a learned clause and should always have
            exactly one literal associated with it; the conflicting assignment.
        trails : dict
            A mapping from clauses to the trail of clauses that generated them.
            Only learned clauses should have trails of non-zero length
        """

        self._conflict_clause = conflict_clause
        self._learned_clause = learned_clause
        self._clause_trails = trails
        self._assigning_clauses = assigning_clauses

        # A flattened version of `self._clause_trails`
        self._flat_clause_trails = {}

        # A mapping from clauses to the requirements that generated them
        self._clause_requirements = {}

        # The a list of lists representing "problems". These are the clauses
        # that we'll use to construct our paths, one per problem.
        self._conflict_details = []
        self._conflict_paths = []

        self._find_requirement_time = None
        with timed_context("Find Requirements") as self._find_requirement_time:
            # We'll look at the chain of clauses that led us to assign the
            # original value and then the chain of clauses that led us to want
            # to assign the opposite value
            assert len(learned_clause.lits) == 1
            self._implicand = -learned_clause[0]
            self._implicand_clause = assigning_clauses[abs(self._implicand)]
            assert self._implicand_clause is not None

            # The clauses that led us to our first assignment
            implicand_req_clauses = self.clause_requirements(
                self._implicand_clause)
            # The clauses we used to learn that the first assignment is invalid
            learned_req_clauses = self.clause_requirements(learned_clause)
            # The clause we were on when we discovered the conflict.
            conflicting_req_clauses = self.clause_requirements(conflict_clause)
            self._conflict_details.extend(
                implicand_req_clauses +
                learned_req_clauses +
                conflicting_req_clauses)

        # Figure out the paths for the conflict(s) we've found
        # These paths are a minimal series of related clauses that describe the
        # conflict(s).
        clauses = self._conflict_details
        end_clauses = self._end_clauses(clauses, implicand=self._implicand)
        paths = self._find_conflict_paths(end_clauses, clauses)
        self._conflict_paths.extend(paths)

    def _key(self, clause):
        return tuple(sorted(l for l in clause.lits))  # noqa

    def _find_conflict_paths(self, end_clauses, relevant_clauses):
        """ Return a tuple of paths representing conflicts between a set of
        clauses.

            See https://github.com/enthought/sat-solver/wiki/Unsatisfiability-Error-Messages
            for discussion about how best to implement this.
        """  # noqa
        # It's expensive to figure out which clauses are neighbors. This dict
        # maps ids to clauses containing that id. We can do this lookup for
        # each literal in a clause to get all of its neighbors.
        lit_to_clauses = defaultdict(set)
        for c in relevant_clauses:
            for lit in c:
                lit_to_clauses[abs(lit)].add(c)
        lit_to_clauses = dict(lit_to_clauses)

        def get_neighbors(clause):
            """ Return the set of clauses which have at least one variable in
            common with this one. """
            clause_sets = (lit_to_clauses[abs(lit)] for lit in clause)
            return sorted(set.union(*clause_sets), key=lambda c: c.lits)

        # If there aren't two end points then none of this makes any sense.
        # Just return what we have.
        if len(end_clauses) < 2:
            return (end_clauses,)

        ends = OrderedDict.fromkeys(end_clauses)
        ends = tuple(ends.keys())

        def jobs_in_path(path):
            return len([clause for clause in path
                        if clause.rule.reason.is_job])

        def tails(seq):
            for i in range(1, len(seq)):
                yield seq[i:]

        # Find a shortest path between each pair of end points if there is one
        raw_paths = list(itertools.chain.from_iterable(
            breadth_first_search(start, get_neighbors, rest)
            for start, rest in zip(ends, tails(ends))))

        # This is somewhat arbitrary, but for now we'll say that the best path
        # is the one with the most jobs in it.
        empty = (0, ())
        path_groups = itertools.groupby(
            sorted(raw_paths, key=jobs_in_path, reverse=True),
            key=jobs_in_path)
        equal_job_paths = tuple(next(path_groups, empty)[1])

        # Now start from the shortest and only include paths that include
        # something that we haven't seen before.
        seen_clauses = set()
        paths = []
        for path in sorted(equal_job_paths, key=len):
            p = set(path)
            if p - seen_clauses:
                seen_clauses.update(p)
                paths.append(path)

        return tuple(paths)

    def _end_clauses(self, relevant_clauses, implicand=None):
        """ Return the nodes which will serve as required points in our path.

        Given a bag of clauses, each possibly with rules and requirements
        attached, this pulls out the clauses whose rule came directly from a
        user request or whose variable contain the variable with the assignment
        conflict.
        """

        flat_clauses = set(
            c for c in relevant_clauses
            if c.rule and c.rule._requirements
            if implicand in c or c.rule.reason.is_job
        )
        roots = tuple(sorted(flat_clauses, key=self._key))
        return roots

    @property
    def rules(self):
        flat = (c.rule for path in self._conflict_paths for c in path)
        return tuple(OrderedDict.fromkeys(flat).keys())

    @property
    def requirements(self):
        # Every list of requirements start at a job, so only take the first one
        return tuple(OrderedDict.fromkeys(
            rule._requirements[0] for rule in self.rules))

    def clause_requirements(self, clause, ignore=None):
        """
        Return the user requirements that led to the creation of `clause`.

        If the clause hasn't been requested before, we search it and its
        parents recursively.
        """
        ignore = ignore or set()
        if clause in ignore:
            return []
        ignore.add(clause)
        if clause not in self._clause_requirements:
            # We haven't searched this clause before. Do so now.
            reqs = []
            if clause.rule and clause.rule._requirements:
                # This clause came directly from a rule that came from a
                # user requirement.
                reqs.append(clause)
            if clause.learned:
                # This clause is a learned synthesis of many other clauses. We
                # must follow them to find their requirements.
                trail = self.clause_trail(clause)
                reqs.extend(r for c in trail
                            for r in self.clause_requirements(c, ignore))
            # Memoize our result to avoid combinatorial explosion on recursive
            # calls
            self._clause_requirements[clause] = reqs
        return self._clause_requirements[clause]

    def clause_trail(self, clause, ignore=None):
        """
        Return the entire flattened list of clauses in this clause's trail.

        A learned clause has a "trail" of clauses which led to the learned
        clause being created. Clauses in this trail might also be learned
        clauses. This method recursively builds up all of non-learned clauses
        found by expanding and concatenating these trails.
        """
        ignore = ignore or set()
        if clause in ignore:
            return []
        ignore.add(clause)
        if clause not in self._flat_clause_trails:
            flat_trail = []
            if clause.learned:
                for t_clause in self._clause_trails[clause]:
                    if t_clause.learned:
                        flat_trail.extend(self.clause_trail(t_clause, ignore))
                    else:
                        flat_trail.append(t_clause)
                    ignore.add(t_clause)
            self._flat_clause_trails[clause] = flat_trail
        return self._flat_clause_trails[clause]

    def to_string(self, pool=None):
        # Build a string description of each conflict we've found
        return '\n'.join(
            self.string_from_clauses(clauses, pool=pool)
            for clauses in self._conflict_paths)

    def string_from_clauses(self, clauses, pool=None):
        details = OrderedDict()

        for clause in clauses:
            # Learned clauses have no meaningful explanation and thus, no Rule.
            # Instead, we grab the clauses from which it is derived.
            flat_clauses = self.clause_trail(clause) or (clause,)

            for clause in flat_clauses:
                # Add it to our set of clauses to include
                details.setdefault(self._key(clause), clause)

        reason = ["Conflicting requirements:"]
        for clause in details.values():
            if pool:
                reason.append(clause.rule.to_string(pool, unique=True))
            else:
                reason.append(str(clause.lits))

        return '\n'.join(reason) + '\n'


class MiniSATSolver(object):
    @classmethod
    def from_rules(cls, rules, policy=None):
        """
        Construct a SAT solver from a rules generator.

        Parameters
        ----------
        rules: RulesGenerator
        policy: IPolicy
            The policy to use for this SAT solver.

        Returns
        -------
        solver: MiniSATSolver.

        """
        solver = cls(policy)
        for rule in rules:
            solver.add_clause(rule.literals, rule=rule)
        solver._setup_assignments()
        return solver

    def __init__(self, policy=None):

        self.clauses = []
        self.watches = defaultdict(list)

        self.assignments = AssignmentSet()

        # The trail of clauses used to learn each new clause
        self.clause_trails = {}

        # A list of literals which become successively true (because of direct
        # assignment, or by unit propagation).
        self.levels = defaultdict(int)

        self.prop_queue = deque()

        # A list of all the decisions that we've made so far.
        self.trail = []

        # Keeps track of the independent assumptions so far. Each entry in
        # trail_lim is an index pointing to an assumption in trail. TODO:
        # Structure self.trail so that it keeps track of decisions per level.
        self.trail_lim = []

        # For each variable assignment, a reference to the clause that forced
        # this assignment.
        self.assigning_clauses = {}

        # Whether the system is satisfiable.
        self.status = None

        self._policy = policy or DefaultPolicy()

    def add_clause(self, clause, rule=None):
        """ Add a new clause to the solver.

        Parameters
        ----------
        clause : Clause
            The clause to add to the SAT problem
        rule : PackageRule
            An optional rule to associate with this clause. This is typically
            the rule from which the clause was derived.
        """
        # TODO: Do some simplifications, and check whether clause contains p
        # and -p at the same time.

        if not isinstance(clause, Clause):
            clause = Clause(clause, learned=False, rule=rule)

        if len(clause) == 0:
            # Clause is guaranteed to be false under the current variable
            # assignments.
            self.status = False
            return

        if len(clause) == 1:
            # Unit facts are enqueued.
            if not self.enqueue(clause[0], cause=clause):
                # Bail out if we've found a conflict
                conflict = UNSAT(
                    clause, clause,
                    self.clause_trails,
                    self.assigning_clauses)
                raise SatisfiabilityError(conflict)
        else:
            p, q = clause[:2]
            self.watches[-p].append(clause)
            self.watches[-q].append(clause)

        self.clauses.append(clause)

    def _setup_assignments(self):
        """Initialize assignments table.
        """
        variables = {abs(lit) for clause in self.clauses for lit in clause}
        assignments = self.assignments
        for variable in variables:
            if variable not in assignments:
                assignments[variable] = None

    def propagate(self):
        while len(self.prop_queue) > 0:
            lit = self.prop_queue.popleft()
            clauses = self.watches[lit]
            self.watches[lit] = []

            while len(clauses) > 0:
                clause = clauses.pop()
                unit = clause.rewatch(self.assignments, lit)

                # Re-insert in the appropriate watch list.
                self.watches[-clause.lits[1]].append(clause)

                # Deal with unit clauses.
                if unit is not None:
                    # TODO Refactor this to take into account the return value
                    # of enqueue().
                    if self.assignments.value(unit) is False:
                        # Conflict. Clear the queue and re-insert the remaining
                        # unwatched clauses into the watch list.
                        self.prop_queue.clear()
                        for remaining in clauses:
                            self.watches[lit].append(remaining)
                        return clause
                    else:
                        # Non-conflicting unit literal.
                        self.enqueue(unit, clause)

    def enqueue(self, lit, cause=None):
        """ Enqueue a new true literal. Return True if this assignment does not
        conflict with a previous assignment, otherwise False.

        Parameters
        ----------
        lit : literal (a signed integer)
            A literal to mark as True.
        cause : Clause
            An optional clause to associate with this assignment. This is
            typically the clause which forced the assignment via propagation.
        """
        status = self.assignments.value(lit)
        if status is not None:
            return status
        else:
            # New fact, store it.
            self.assignments[abs(lit)] = (lit > 0)

            self.prop_queue.append(lit)
            self.trail.append(lit)
            self.levels[abs(lit)] = self.decision_level
            self.assigning_clauses[abs(lit)] = cause
            return True

    def search(self):
        """ Return next solution or Raise SatisfiabilityError if unsatisfiable.
        """
        root_level = self.decision_level
        while True:
            conflict_clause = self.propagate()
            if conflict_clause is None:
                if self.number_assigned == self.number_variables:
                    # Model found.
                    return self.assignments.copy()  # Do something better...
                else:
                    # New variable decision.
                    p = self._policy.get_next_package_id(
                        self.assignments,
                        self.clauses,
                    )

                    self.assume(p)
            else:
                # Conflict!
                learned_clause, bt_level = self.analyze(conflict_clause)
                if root_level == self.decision_level:
                    conflict = UNSAT(
                        conflict_clause, learned_clause,
                        self.clause_trails,
                        self.assigning_clauses)
                    raise SatisfiabilityError(conflict)

                self.cancel_until(max(bt_level, root_level))
                self.record(learned_clause)

    def validate(self, solution_map):
        """Check whether a given set of assignments solves this SAT problem.
        """
        solution_literals = {variable if status else -variable
                             for variable, status in solution_map.items()}
        # True if any clause has no assigned literals and thus is undetermined
        has_unknown_clause = any(solution_literals.isdisjoint(clause.lits)
                                 for clause in self.clauses)
        return not has_unknown_clause

    def analyze(self, conflict):
        """ Produce a reason clause for a conflict.
        """
        p = None  # Will hold the UIP at the end of the search.

        # A tally of the number of literals encountered so far in the current
        # decision level, and downstream from the UIP.
        counter = 0
        # Variables that we've encountered during the search.
        seen = set()

        # Literals for the clause that we're learning.
        learned_lits = []
        # Level to backtrack to.
        btlevel = 0

        clause_trail = [conflict]

        while True:
            reason = conflict.calculate_reason(p)

            # Trace reason for current p.
            for lit in reason:
                var = abs(lit)
                if var not in seen:
                    seen.add(var)
                    if self.levels[var] == self.decision_level:
                        # A new literal on the current decision level.
                        counter += 1
                    else:
                        # At this point, we don't treat level 0 as
                        # special. Maybe that's a mistake...
                        learned_lits.append(-lit)
                        btlevel = max(btlevel, self.levels[var])

            # Select next literal to look at.
            while True:
                p = self.trail[-1]
                conflict = self.assigning_clauses[abs(p)]
                clause_trail.append(conflict)
                self.undo_one()
                if abs(p) in seen:
                    break

            counter -= 1
            if counter == 0:
                break

        learned_lits.append(-p)  # At this point p is the UIP.
        learned = Clause(learned_lits, learned=True)
        self.clause_trails[learned] = clause_trail
        return learned, btlevel

    def record(self, learned_clause):  # Needs test.
        """Drive the backtracking by adding a learned clause, which is unit by
        assumption.

        """
        # Reorder the learned clause, so that lits[0] is the asserting literal,
        # and lits[1] is the literal with highest decision level. This literal
        # will first become unbound by backtracking.
        lits = learned_clause.lits
        lits[0], lits[-1] = lits[-1], lits[0]

        # Index of the literal with the highest decision level.
        def key(arg):
            n, level = arg
            return level
        max_i = max(enumerate([self.levels.get(abs(lit), 0) for lit in lits]),
                    key=key)[0]
        if len(lits) >= 2:
            lits[1], lits[max_i] = lits[max_i], lits[1]

        self.add_clause(learned_clause)
        self.enqueue(learned_clause.lits[0], learned_clause)

    def undo_one(self):
        """Backtrack by one step.
        """
        p = self.trail.pop()
        v = abs(p)  # Underlying variable
        self.assignments[v] = None
        self.levels[v] = -1  # FIXME Why -1?

    def cancel_until(self, level):
        """Cancel all decisions up a given level.
        """
        while self.decision_level > level:
            self.cancel()

    def cancel(self):
        """Undo all decisions in the current decision level.
        """
        # Taken verbatim from Minisat paper.
        c = len(self.trail) - self.trail_lim.pop()
        for _ in range(c):
            self.undo_one()

    def assume(self, lit, cause=Clause([])):
        self.trail_lim.append(len(self.trail))  # FIXME: This is fishy.
        return self.enqueue(lit, cause=cause)

    @property
    def number_assigned(self):
        """ Return the number of currently assigned variables.
        """
        return self.assignments.num_assigned

    @property
    def number_variables(self):
        """ Return the number of variables in the SAT problem.
        """
        return len(self.assignments)

    @property
    def decision_level(self):
        """ Return the number of independent assumptions made so far.
        """
        return len(self.trail_lim)
