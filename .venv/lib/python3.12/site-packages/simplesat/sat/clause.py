from __future__ import absolute_import

from collections import OrderedDict


class Constraint(object):
    pass


class Clause(Constraint):

    def __init__(self, lits, learned=False, rule=None):
        """
        Create a new Clause.

        Parameters
        ----------
        lits : list of literals
            The literals in this clause.
        learned : bool
            A flag indicated whether this clause was learned during solving.
        rule : PackageRule
            A package rule associated with the clause. Typically the rule from
            which this clause was created.
        """
        self.learned = learned
        self.rule = rule
        # This maintains the ordering while removing duplicate values
        self.lits = list(OrderedDict.fromkeys(lits).keys())

    def rewatch(self, assignments, lit):
        """Find a new literal to watch.

        The running assumption is that watched literals should either be True
        or not assigned (None). If a watched literal becomes False, a new watch
        must be found. When this is not possible, the other watched literal
        is necessarily True (unit information).

        Returns
        -------
        unit_information: Literal or None
            A literal which has become true under the current assignments.

        Note that this method does not check whether unit propagation leads to
        a conflict.

        """
        # Internal assumption: the watched literals are the first elements of
        # lits. If necessary, this method will re-order some of the literals to
        # keep this assumption.
        lits = self.lits
        assert -lit in lits[:2]

        if lits[0] == -lit:
            lits[0], lits[1] = lits[1], -lit

        if assignments.value(lits[0]) is True:
            # This clause has been satisfied, add it back to the watch list. No
            # unit information can be deduced.
            return None

        # Look for another literal to watch, and switch it with lit[1] to keep
        # the assumption on the watched literals in place.
        for n, other in enumerate(lits[2:]):
            if assignments.value(other) is not False:
                # Found a new literal that could serve as a watch.
                lits[1], lits[n + 2] = other, -lit
                return None

        # Clause is unit under assignment. Return the literal that can be
        # propagated.
        return lits[0]

    def calculate_reason(self, p=None):
        """For a conflicting clause, return the reason for propagating p.

        For example, if the clause is x \\/ y \\/ z, then the reason for
        propagating x is -y /\\ -z. By convention, f the literal p does not
        occur in the clause, the negative of the whole clause is returned.

        """
        # TODO: We can speed this up if we can guarantee that we'll only ask
        # for the reason of the first literal, as is the case in the Minisat
        # paper.
        return [-lit for lit in self.lits if lit != p]

    def __len__(self):
        return len(self.lits)

    def __getitem__(self, s):
        return self.lits[s]

    def __repr__(self):
        return "Clause({}, learned={})".format(self.lits, self.learned)

    def __lt__(self, other):
        raise TypeError("no ordering relation is defined for clauses")
