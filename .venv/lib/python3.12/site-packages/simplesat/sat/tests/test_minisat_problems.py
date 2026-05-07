import unittest

from simplesat.examples.van_der_waerden import van_der_waerden
from simplesat.errors import SatisfiabilityError
from ..clause import Clause
from ..minisat import MiniSATSolver


class TestMinisatProblems(unittest.TestCase):
    """Run the Minisat solver on a range of test problems.
    """
    def test_unit_assignments_are_remembered(self):
        # Regression test for #31 (calling _setup_assignments() after
        # enqueueing unit clauses caused unit assignments to be erased).

        # Given
        s = MiniSATSolver()
        s.add_clause([1, 2, 3])
        s.add_clause([-1, 2, 3])
        s.add_clause([-2])
        s.add_clause([-3])
        s._setup_assignments()

        # Then
        with self.assertRaises(SatisfiabilityError):
            s.search()

    def test_no_assumptions(self):
        # A simple problem with only unit propagation, no assumptions (except
        # for the initial one), no backtracking, and no conflicts.

        # Given
        s = MiniSATSolver()
        cl1 = Clause([1, -2])
        cl2 = Clause([1,  2, -3])
        cl3 = Clause([1,  2,  3, -4])
        s.add_clause(cl1)
        s.add_clause(cl2)
        s.add_clause(cl3)
        s._setup_assignments()

        # When
        sol = s.search()

        # Then
        result = dict(sol.items())
        self.assertEqual(result, {1: True, 2: True, 3: True, 4: True})

    def test_one_assumption(self):
        # A simple problem with only unit propagation, where one additional
        # assumption needs to be made.

        # Given
        s = MiniSATSolver()
        cl1 = Clause([1, -2])
        cl3 = Clause([-1,  -2,  3, -4])
        s.add_clause(cl1)
        s.add_clause(cl3)
        s._setup_assignments()

        # When
        sol = s.search()

        # Then
        result = dict(sol.items())
        self.assertEqual(result, {1: True, 2: True, 3: True, 4: True})


def check_solution(clauses, solution):
    for clause in clauses:
        for lit in clause:
            if solution.value(lit):
                # Clause is satisfied.
                break
        else:
            # No true literal
            return False
    return True


class TestMinisatVanDerWaerden(unittest.TestCase):

    def test_van_der_waerden_solvable(self):
        # Given
        j, k, n = 3, 3, 8
        s = MiniSATSolver()
        clauses = van_der_waerden(j, k, n)
        for clause in clauses:
            s.add_clause(clause)
        s._setup_assignments()

        # When
        solution = s.search()

        # Then
        self.assertTrue(check_solution(s.clauses, solution),
                        msg='{} does not satisfy SAT problem'.format(solution))

    def test_van_der_waerden_not_solvable(self):
        # Given
        j, k, n = 3, 3, 9
        s = MiniSATSolver()
        clauses = van_der_waerden(j, k, n)
        for clause in clauses:
            s.add_clause(clause)
        s._setup_assignments()

        # Then
        with self.assertRaises(SatisfiabilityError):
            s.search()
