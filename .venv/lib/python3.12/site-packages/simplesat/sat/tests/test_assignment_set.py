#!/usr/bin/env python
# -*- coding: utf-8 -*-

import unittest

from ..assignment_set import AssignmentSet


class TestAssignmentSet(unittest.TestCase):

    def test_starts_empty(self):
        AS = AssignmentSet()
        self.assertEqual(AS.num_assigned, 0)
        self.assertEqual(len(AS), 0)
        self.assertEqual({}, AS.get_changelog())
        self.assertEqual([], AS.keys())
        self.assertEqual([], AS.values())
        self.assertEqual([], AS.items())

    def test_num_assigned(self):
        AS = AssignmentSet()

        AS[1] = None
        self.assertEqual(AS.num_assigned, 0)

        AS[2] = True
        self.assertEqual(AS.num_assigned, 1)

        AS[1] = False
        self.assertEqual(AS.num_assigned, 2)

        AS[2] = None
        self.assertEqual(AS.num_assigned, 1)

        AS[2] = True
        self.assertEqual(AS.num_assigned, 2)

        del AS[1]
        self.assertEqual(AS.num_assigned, 1)

        AS[2] = False
        self.assertEqual(AS.num_assigned, 1)

        AS[2] = None
        self.assertEqual(AS.num_assigned, 0)

        del AS[2]
        self.assertEqual(AS.num_assigned, 0)

    def test_container(self):
        AS = AssignmentSet()

        AS[1] = True
        AS[2] = False

        self.assertIn(1, AS)
        self.assertNotIn(3, AS)

        AS[4] = None
        AS[3] = True
        AS[5] = None

        self.assertIn(3, AS)
        self.assertIn(5, AS)

        del AS[5]
        self.assertNotIn(5, AS)

        expected = [(1, True), (2, False), (3, True), (4, None)]

        manual_result = list(zip(AS.keys(), AS.values()))
        self.assertEqual(AS.items(), expected)
        self.assertEqual(manual_result, expected)
        self.assertEqual(len(AS), len(expected))

    def test_copy(self):

        AS = AssignmentSet()

        AS[1] = None
        AS[2] = True
        AS[3] = None
        AS[4] = False
        AS[5] = True

        expected = {
            1: None,
            2: True,
            3: None,
            4: False,
            5: True,
        }

        copied = AS.copy()

        self.assertIsNot(copied._data, AS._data)
        self.assertEqual(copied.to_dict(), expected)

        expected = {k: None for k, v in expected.items() if v is not None}

        self.assertIsNot(copied._orig, AS._orig)
        self.assertEqual(copied._orig, expected)

        self.assertEqual(copied.num_assigned, AS.num_assigned)

        del AS[2]
        self.assertIn(2, copied)

    def test_value(self):
        AS = AssignmentSet()

        AS[1] = False
        AS[2] = True
        AS[3] = None

        self.assertTrue(AS.value(-1))
        self.assertTrue(AS.value(2))

        self.assertFalse(AS.value(1))
        self.assertFalse(AS.value(-2))

        self.assertIs(AS.value(3), None)
        self.assertIs(AS.value(-3), None)

        del AS[2]
        self.assertIs(AS.value(-2), None)
        self.assertIs(AS.value(2), None)

        AS[1] = None
        self.assertIs(AS.value(-1), None)
        self.assertIs(AS.value(1), None)

        AS[3] = True
        self.assertIs(AS.value(-3), False)
        self.assertIs(AS.value(3), True)

        AS[3] = False
        self.assertIs(AS.value(-3), True)
        self.assertIs(AS.value(3), False)

    def test_getitem(self):
        AS = AssignmentSet()

        AS[1] = False
        AS[2] = True
        AS[3] = None

        self.assertFalse(AS[1])
        self.assertTrue(AS[2])
        self.assertIs(AS[3], None)

        with self.assertRaises(KeyError):
            AS[4]

        self.assertFalse(AS.get(1))
        self.assertTrue(AS.get(2))
        self.assertIs(AS.get(3), None)
        self.assertIs(AS.get(4), None)

    def test_changelog(self):

        AS = AssignmentSet()

        AS[1] = None

        expected = {}
        self.assertEqual(AS.get_changelog(), expected)

        AS[2] = True
        expected[2] = (None, True)
        self.assertEqual(AS.get_changelog(), expected)

        AS[2] = False
        expected[2] = (None, False)
        self.assertEqual(AS.get_changelog(), expected)

        del AS[2]
        del expected[2]
        self.assertEqual(AS.get_changelog(), expected)

        # Keep should preserve the log
        self.assertEqual(AS.get_changelog(), expected)
        self.assertEqual(AS.get_changelog(), expected)

        # Otherwise clear the log
        log = AS.consume_changelog()
        self.assertEqual(log, expected)
        self.assertEqual(AS.get_changelog(), {})

        # Test when something is already present
        AS[1] = False
        expected = {1: (None, False)}
        self.assertEqual(AS.get_changelog(), expected)

        del AS[1]
        expected = {}
        self.assertEqual(AS.get_changelog(), expected)
