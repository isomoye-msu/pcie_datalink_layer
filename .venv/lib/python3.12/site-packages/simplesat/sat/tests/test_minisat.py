import unittest

import mock
import six

from ..assignment_set import AssignmentSet
from ..clause import Clause
from ..minisat import MiniSATSolver


# TODO: Move all ZM01 related tests to a separate module.


def zm01_solver(add_conflict=False):
    """Create a solver with a non-trivial implication graph.

    The system is taken from Figure 2 in "Efficient Conflict Driven Learning in
    Boolean Satisfiability Solver", by Zhang, Madigan, Moskewicz, and Malik
    (2001).

    """
    s = MiniSATSolver()
    s.add_clause(Clause([-12, 6, -11]))
    s.add_clause(Clause([16, -11, 13]))
    s.add_clause(Clause([-2, 12, -16]))
    s.add_clause(Clause([-10, -4, 2]))
    s.add_clause(Clause([1, -8, 10]))
    s.add_clause(Clause([3, 10]))
    s.add_clause(Clause([-5, 10]))
    s.add_clause(Clause([18, 17, -1, -3, 5]))
    if add_conflict:
        s.add_clause(Clause([-18, -3, -19]))

    s.assignments = AssignmentSet({k: None for k in range(1, 20)})

    # Load up the assignments from lower decision levels. The call to
    # assume() will enter a new decision level and enqueue.
    s.assume(-6)
    s.enqueue(-17)
    s.assume(8)
    s.enqueue(-13)
    s.assume(4)
    s.enqueue(19)

    return s


class TestClause(unittest.TestCase):
    def test_rewatch(self):
        # Given
        c = Clause([1, -2, 5])
        assignments = AssignmentSet({1: False, 2: None, 5: None})

        # When
        unit = c.rewatch(assignments, -1)

        # Then
        self.assertIsNone(unit)
        six.assertCountEqual(self, c.lits, [5, -2, 1])

    def test_rewatch_true(self):
        # Given
        c = Clause([1, -2, 5])
        assignments = AssignmentSet({1: True, 2: None, 5: None})

        # When
        unit = c.rewatch(assignments, -1)

        # Then
        self.assertIsNone(unit)
        six.assertCountEqual(self, c.lits, [1, -2, 5])

    def test_rewatch_unit(self):
        # Given
        c = Clause([1, -2, 5])
        assignments = AssignmentSet({1: False, 2: True, 5: False})

        # When
        unit = c.rewatch(assignments, 2)

        # Then
        self.assertEqual(unit, 1)
        six.assertCountEqual(self, c.lits, [1, -2, 5])

    def test_calculate_reason(self):
        # Given
        c = Clause([1, -2, 5])

        # When / then
        reason = c.calculate_reason(1)
        six.assertCountEqual(self, reason, [2, -5])
        reason = c.calculate_reason(9)
        six.assertCountEqual(self, reason, [-1, 2, -5])


class TestMiniSATSolver(unittest.TestCase):

    @mock.patch.object(MiniSATSolver, 'enqueue')
    def test_add_empty_clause(self, mock_enqueue):
        # Given
        s = MiniSATSolver()

        # When
        s.add_clause([])

        # Then
        self.assertFalse(s.status)
        self.assertEqual(len(s.watches), 0)
        self.assertEqual(len(s.clauses), 0)
        self.assertFalse(mock_enqueue.called)

    @mock.patch.object(MiniSATSolver, 'enqueue')
    def test_add_unit_clause(self, mock_enqueue):
        # Given
        s = MiniSATSolver()

        # When
        s.add_clause([-1])

        # Then
        self.assertIsNone(s.status)
        self.assertEqual(len(s.watches), 0)
        self.assertEqual(len(s.clauses), 1)
        self.assertTrue(mock_enqueue.called)

    @mock.patch.object(MiniSATSolver, 'enqueue')
    def test_add_clause(self, mock_enqueue):
        # Given
        s = MiniSATSolver()
        lits = [-1, 2, 4]

        # When
        s.add_clause(lits)

        # Then
        self.assertIsNone(s.status)

        self.assertEqual(len(s.clauses), 1)
        clause = s.clauses[0]
        self.assertEqual(len(s.watches), 2)
        six.assertCountEqual(self, s.watches[1], [clause])
        six.assertCountEqual(self, s.watches[-2], [clause])

        self.assertEqual(len(s.clauses), 1)
        self.assertFalse(mock_enqueue.called)

    @mock.patch.object(MiniSATSolver, 'enqueue')
    def test_propagate_one_level(self, mock_enqueue):
        # Make one literal true, and check that the watch lists are updated
        # appropriately. We do only one assignment and all the clauses have
        # length 3, so there is no unit information.

        # Given
        s = MiniSATSolver()
        cl1 = Clause([1, 2, -5])
        cl2 = Clause([2, -4, 7])
        cl3 = Clause([-2, -5, 7])
        s.add_clause(cl1)
        s.add_clause(cl2)
        s.add_clause(cl3)

        s.assignments = AssignmentSet(
            {1: None, 2: None, 4: None, 5: None, 7: None}
        )

        # When
        s.assignments[2] = False  # Force 2 to be false.
        s.prop_queue.append(-2)
        conflict = s.propagate()

        # Then
        self._assertWatchesNotTrue(s.watches, s.assignments)
        self.assertFalse(mock_enqueue.called)
        self.assertIsNone(conflict)
        six.assertCountEqual(self, s.watches[-7], [cl2])
        six.assertCountEqual(self, s.watches[-1], [cl1])
        six.assertCountEqual(self, s.watches[2], [cl3])
        six.assertCountEqual(self, s.watches[4], [cl2])
        six.assertCountEqual(self, s.watches[5], [cl1, cl3])

    @mock.patch.object(MiniSATSolver, 'enqueue')
    def test_propagate_with_unit_info(self, mock_enqueue):
        # Make one literal true. Since there is one length-2 clause, this will
        # propagate one literal.

        # Given
        s = MiniSATSolver()
        cl1 = Clause([1, 2, -5])
        cl2 = Clause([2, -4])
        s.add_clause(cl1)
        s.add_clause(cl2)

        s.assignments = AssignmentSet({1: None, 2: None, 4: None, 5: None})

        # When
        s.assignments[2] = False  # Force 2 to be false.
        s.prop_queue.append(-2)
        conflict = s.propagate()

        # Then
        self._assertWatchesNotTrue(s.watches, s.assignments)
        self.assertEqual(mock_enqueue.call_count, 1)
        self.assertIsNone(conflict)
        six.assertCountEqual(self, s.watches[-2], [cl2])
        six.assertCountEqual(self, s.watches[-1], [cl1])
        six.assertCountEqual(self, s.watches[4], [cl2])
        six.assertCountEqual(self, s.watches[5], [cl1])

    def test_propagate_conflict(self):
        # Make one literal true, and cause a conflict in the unit propagation.

        # Given
        s = MiniSATSolver()
        cl1 = Clause([-1, 2])
        cl2 = Clause([-1, 2, 3, 4])
        s.add_clause(cl1)
        s.add_clause(cl2)

        s.assignments = AssignmentSet({1: True, 2: None, 3: None, 4: None})

        # When
        s.assignments[2] = False  # Force 2 to be false.
        s.prop_queue.append(-2)
        conflict = s.propagate()

        # Then
        self.assertEqual(conflict, cl1)
        # Assert that all clauses are still watched.
        six.assertCountEqual(self, s.watches[-3], [cl2])
        six.assertCountEqual(self, s.watches[-2], [cl1])
        six.assertCountEqual(self, s.watches[1], [cl1, cl2])

    def test_setup_does_not_overwrite_assignments(self):
        # Given
        s = MiniSATSolver()
        s.add_clause([-1])
        s.add_clause([1, 2, 3])
        expected_assignments = [(1, False), (2, None), (3, None)]

        # When
        s._setup_assignments()

        # Then
        self.assertEqual(s.assignments.items(), expected_assignments)

    def _assertWatchesNotTrue(self, watches, assignments):
        for watch, clauses in watches.items():
            if len(clauses) > 0:
                status = assignments[abs(watch)]
                self.assertIsNot(status, True)

    def test_enqueue(self):
        # Given
        s = MiniSATSolver()
        s.assignments = AssignmentSet({1: True, 2: None})

        # When / then
        status = s.enqueue(1)
        self.assertTrue(status)
        status = s.enqueue(-1)
        self.assertFalse(status)
        status = s.enqueue(2)
        self.assertTrue(status)
        six.assertCountEqual(self, s.prop_queue, [2])

    def test_propagation_with_queue(self):
        # Given
        s = MiniSATSolver()
        cl1 = Clause([1, 2])
        cl2 = Clause([1, 3, 4])
        s.add_clause(cl1)
        s.add_clause(cl2)
        s.assignments = AssignmentSet({1: None, 2: None, 3: None, 4: None})

        # When
        s.enqueue(-2)
        conflict = s.propagate()

        # Then
        self.assertIsNone(conflict)
        self.assertEqual(s.assignments.to_dict(),
                         {1: True, 2: False, 3: None, 4: None})
        self.assertEqual(s.trail, [-2, 1])
        six.assertCountEqual(self, s.watches[-1], [cl1, cl2])
        six.assertCountEqual(self, s.watches[-2], [cl1])
        six.assertCountEqual(self, s.watches[-3], [cl2])

    def test_propagation_with_queue_multiple_implications(self):
        # Given
        s = MiniSATSolver()
        cl1 = Clause([1, -2])
        cl2 = Clause([1,  2, -3])
        cl3 = Clause([1,  2,  3, -4])
        s.add_clause(cl1)
        s.add_clause(cl2)
        s.add_clause(cl3)
        s.assignments = AssignmentSet({1: None, 2: None, 3: None, 4: None})

        # When
        s.enqueue(-1)
        conflict = s.propagate()

        # Then
        self.assertIsNone(conflict)
        self.assertEqual(s.assignments.to_dict(),
                         {1: False, 2: False, 3: False, 4: False})
        self.assertEqual(s.trail, [-1, -2, -3, -4])

    def test_propagation_with_queue_conflicted(self):
        # Check that we can recover from a conflict that arises during unit
        # propagation (i.e. leave the watch list in a consistent state, and
        # return the appropriate conflict clause).

        # Given
        s = MiniSATSolver()
        cl1 = Clause([1, -2])
        cl2 = Clause([1,  2, -3])
        cl3 = Clause([1,  2,  3, -4])
        s.add_clause(cl1)
        s.add_clause(cl2)
        s.add_clause(cl3)
        s.assignments = AssignmentSet({1: None, 2: None, 3: None, 4: True})

        # When
        s.enqueue(-1)
        conflict = s.propagate()

        # Then
        self.assertIsNotNone(conflict)
        self.assertEqual(s.trail, [-1, -2, 3])
        six.assertCountEqual(self, s.watches[-3], [cl3])
        six.assertCountEqual(self, s.watches[-2], [cl2, cl3])
        six.assertCountEqual(self, s.watches[-1], [cl1])
        six.assertCountEqual(self, s.watches[2], [cl1])
        six.assertCountEqual(self, s.watches[3], [cl2])

    def test_propagate_zm01(self):
        # Test that the solver can replicate the implication graph of ZM01. For
        # details on the assignments, see that paper.

        # Given
        s = zm01_solver(add_conflict=True)

        # When
        s.assume(11)
        conflict = s.propagate()

        # Then
        self.assertIsNotNone(conflict)
        self.assertEqual(s.trail_lim, [0, 2, 4, 6])

        last = s.trail_lim[-1]
        six.assertCountEqual(self, s.trail[last:],
                             [11, -12, 16, -2, -10, 1, 3, -5, 18])

        expected = {
            1: True,
            2: False,
            3: True,
            5: False,
            10: False,
            11: True,
            12: False,
            16: True,
            18: True
        }
        for lit, val in expected.items():
            self.assertEqual(s.assignments[lit], val)

    def test_undo_one(self):
        # Given
        s = MiniSATSolver()
        s.trail = [1, 2, -3]
        s.assignments = AssignmentSet({1: None, 2: None, 3: True})

        # When
        s.undo_one()

        # Then
        self.assertEqual(s.assignments.to_dict(), {1: None, 2: None, 3: None})
        self.assertEqual(s.trail, [1, 2])

    def test_cancel(self):
        # Given
        s = MiniSATSolver()
        s.trail = [1, 2, -3, 4, 5, 6, -9, 10, 13]
        s.trail_lim = [0, 2, 4, 6]

        # When
        s.cancel()

        # Then
        self.assertEqual(s.decision_level, 3)
        self.assertEqual(s.trail, [1, 2, -3, 4, 5, 6])
        self.assertEqual(s.trail_lim, [0, 2, 4])

    def test_cancel_until(self):
        # Given
        s = MiniSATSolver()
        s.trail = [1, 2, -3, 4, 5, 6, -9, 10, 13]
        s.trail_lim = [0, 2, 4, 6]

        # When
        s.cancel_until(1)

        # Then
        self.assertEqual(s.decision_level, 1)
        self.assertEqual(s.trail_lim, [0])
        self.assertEqual(s.trail, [1, 2])

    def test_assume_cancel_roundtrip(self):
        # Given
        s = MiniSATSolver()
        s.assignments = AssignmentSet({1: None})

        # When / then
        s.assume(-1)
        self.assertFalse(s.assignments[1])
        self.assertEqual(s.decision_level, 1)
        self.assertEqual(s.trail, [-1])
        self.assertEqual(s.trail_lim, [0])

        # When / then
        s.cancel()
        self.assertIsNone(s.assignments[1])
        self.assertEqual(s.decision_level, 0)
        self.assertEqual(s.trail, [])
        self.assertEqual(s.trail_lim, [])

    def test_cancel_zm01(self):
        # Check that we can resolve a conflict on the implication graph of
        # ZM01, and that the watch lists are left in a consistent state
        # afterwards.

        # Given
        s = zm01_solver(add_conflict=True)

        # When
        s.assume(11)
        conflict = s.propagate()

        # Then
        self.assertIsNotNone(conflict)
        self.assertEqual(s.decision_level, 4)

        # When
        s.cancel()

        # Then
        self.assertEqual(s.decision_level, 3)
        for var in [1, 2, 5, 10, 11, 12, 16, 18]:
            self.assertIsNone(s.assignments[var])
            # NOTE: we never clear the assigning_clause dict
        for lit, clauses in s.watches.items():
            if len(clauses) > 2:
                self.assertNotEqual(s.assignments.value(-lit), False)

    def test_analyze_same_level(self):
        # Given
        s = MiniSATSolver()
        s.add_clause(Clause([1, 2]))
        s.add_clause(Clause([1, -2]))
        s.assume(-1)
        conflict = s.propagate()

        # When
        learned_clause, bt_level = s.analyze(conflict)

        # Then
        six.assertCountEqual(self, learned_clause.lits, [1])
        self.assertEqual(bt_level, 0)

    def test_analyze_lower_level(self):
        # Given
        s = MiniSATSolver()
        s.add_clause(Clause([1, -2, 3]))
        s.add_clause(Clause([1, 2]))
        s.assume(-3)
        s.assume(-1)
        conflict = s.propagate()

        # When
        learned_clause, bt_level = s.analyze(conflict)

        # Then
        six.assertCountEqual(self, learned_clause.lits, [1, 3])
        self.assertEqual(bt_level, 1)

    def test_analyze_conflict_zm01(self):
        # Given
        s = zm01_solver(add_conflict=True)
        s.assume(11)
        conflict = s.propagate()

        # When
        learned_clause, bt_level = s.analyze(conflict)

        # Then
        six.assertCountEqual(self, learned_clause.lits, [-8, 10, 17, -19])
        self.assertEqual(bt_level, 3)

    def test_record_learned_clause(self):
        # Given
        s = MiniSATSolver()
        s.levels = {1: 0, 2: 0, 3: 5, 4: 25}
        clause = Clause([2, 3, -4, 5])

        # When
        s.record(clause)

        # Then
        self.assertEqual(clause.lits, [5, -4, 3, 2])
        six.assertCountEqual(self, s.prop_queue, [5])

    def test_validation(self):
        # Given
        s = MiniSATSolver()
        cl1 = Clause([1, -2])
        cl2 = Clause([1,  2, -3])
        cl3 = Clause([1,  2,  3, -4])
        s.add_clause(cl1)
        s.add_clause(cl2)
        s.add_clause(cl3)
        solution = {1: False, 2: False, 3: False, 4: False}

        # When
        status = s.validate(solution)

        # Then
        self.assertTrue(status)

        # Given
        solution = {1: False, 2: True, 3: False, 4: True}

        # When
        status = s.validate(solution)

        # Then
        self.assertFalse(status)

        # Given
        solution = {1: False, 2: True, 3: False}

        # When
        status = s.validate(solution)

        # Then
        self.assertFalse(status)
