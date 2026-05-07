#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import division, print_function

import unittest
from textwrap import dedent

from simplesat.test_utils import pool_and_repository_from_packages

from ..graph import (
    package_lit_dependency_graph, toposort, transitive_neighbors
)


class TestGraph(unittest.TestCase):

    maxDiff = None

    def test_transitive_neighbors(self):
        # Given
        graph = {
            0: [],
            1: [],
            2: [1],
            3: [0, 2],
            4: [1, 3],
            5: [0, 1, 2, 3, 4],
        }

        expected = {
            0: set(),
            1: set(),
            2: {1},
            3: {0, 1, 2},
            4: {0, 1, 2, 3},
            5: {0, 1, 2, 3, 4},
        }

        # When
        result = transitive_neighbors(graph)

        # Then
        self.assertEqual(result, expected)

        # Given
        graph = {
            0: [1],
            1: [0],
            2: [1],
            3: [3],
        }

        expected = {
            0: {0, 1},
            1: {0, 1},
            2: {0, 1},
            3: {3},
        }

        # When
        result = transitive_neighbors(graph)

        # Then
        self.assertEqual(result, expected)

    def test_toposort(self):
        # Given
        graph = {
            0: set(),
            1: set(),
            2: {1},
            3: {0, 2},
            4: {0},
            5: {1, 2},
            6: {3, 5},
        }

        expected = (
            {0, 1},
            {2, 4},
            {3, 5},
            {6}
        )

        # When
        result = tuple(toposort(graph))

        # Then
        self.assertEqual(expected, result)

    def test_toposort_cycle(self):
        # Given

        graph = {
            0: set(),
            1: set(), 2: {6},
            3: {0, 2},
            4: {0},
            5: {1, 2},
            6: {3, 5},
        }

        # When/Then
        with self.assertRaises(ValueError):
            tuple(toposort(graph))

    def test_toposort_cycle_with_pretty_print(self):
        # Given
        id2string = lambda x: bin(x)  # noqa
        graph = {
            0: set(),
            1: set(),
            2: {6},
            3: {0, 2},
            4: {0},
            5: {1, 2},
            6: {3, 5},
        }
        expected = dedent("""\
        Cyclic dependencies exist among these items:
        0b10 -> ['0b110']
        0b11 -> ['0b10']
        0b101 -> ['0b10']
        0b110 -> ['0b11', '0b101']""")

        # When
        with self.assertRaises(ValueError) as cm:
            tuple(toposort(graph, id2string=id2string))

        # Then
        message = cm.exception.args[0]
        self.assertEqual(message, expected)


class TestDependencyGraph(unittest.TestCase):

    def test_package_lit_dependency_graph(self):
        # Given
        package_def = dedent("""\
            A 0.0.0-1; depends (C ^= 0.0.0)
            A 3.0.0-1; depends (G ^= 1.0.0)
            B 0.0.0-1; depends (D ^= 0.0.0)
            B 1.0.0-1
            C 0.0.0-1
            D 0.0.0-1
            E 0.0.0-1; depends (A ^= 0.0.0)
            E 1.0.0-1; depends (I ^= 0.0.0, B ^= 1.0.0)
            F 0.0.0-1
            G 1.0.0-1
            I 0.0.0-1; depends (J ^= 0.0.0)
            J 0.0.0-1
            X 0.0.0-1; depends (A ^= 0.0.0, B ^= 0.0.0)
            X 1.0.0-1; depends (A ^= 3.0.0, B ^= 1.0.0)
            Y 0.0.0-1; depends (X ^= 0.0.0)
            Y 1.0.0-1
            Y 2.0.0-1; depends (F ^= 0.0.0)
            Y 3.0.0-1; depends (X ^= 1.0.0)
            Z 0.0.0-1; depends (E ^= 0.0.0)
            Z 1.0.0-1; depends (E ^= 1.0.0)
        """)

        expected = {
            1: {5},
            2: {10},
            3: {6},
            4: set(),
            5: set(),
            6: set(),
            7: {1},
            8: {11, 4},
            9: set(),
            10: set(),
            11: {12},
            12: set(),
            13: {1, 3},
            14: {2, 4},
            15: {13},
            16: set(),
            17: {9},
            18: {14},
            19: {7},
            20: {8},
        }

        # When
        pool, _ = pool_and_repository_from_packages(package_def)
        package_lits = pool.package_ids
        result = package_lit_dependency_graph(pool, package_lits)

        # Then
        self.assertEqual(expected, result)
