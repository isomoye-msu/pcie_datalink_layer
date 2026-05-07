from __future__ import absolute_import

import copy
import sys
import unittest

from six.moves import cPickle

from .. import DefaultOrderedDict


class TestDefaultOrderedDict(unittest.TestCase):
    def test_simple(self):
        # Given
        data = DefaultOrderedDict(list)

        # When
        data[1].append(1)
        data[0].append(0)

        # Then
        self.assertEqual(list(data.keys()), [1, 0])
        self.assertEqual(data[0], [0])
        self.assertEqual(data[1], [1])
        self.assertEqual(data[2], [])
        if sys.version_info[:2] < (3, 12):
            r_repr = (
                "DefaultOrderedDict(<class 'list'>, "
                "DefaultOrderedDict([(1, [1]), (0, [0]), (2, [])]))")
        else:
            r_repr = (
                "DefaultOrderedDict(<class 'list'>, "
                "DefaultOrderedDict({1: [1], 0: [0], 2: []}))")
        self.assertEqual(repr(data), r_repr)

    def test_pickling(self):
        # Given
        data = DefaultOrderedDict(list)
        data[1].append(1)
        data[0].append(0)

        # When
        s = cPickle.dumps(data)
        unpickled_data = cPickle.loads(s)

        # Then
        self.assertEqual(unpickled_data, data)
        self.assertIsInstance(unpickled_data, (DefaultOrderedDict,))

    def test_copy(self):
        # Given
        data = DefaultOrderedDict(list)
        data[1].append(1)

        # When
        data_copy = data.copy()

        # Then
        self.assertEqual(data, data_copy)
        self.assertIsInstance(data_copy, DefaultOrderedDict)

        # When
        # Check we don't do deep copy
        data[1].append(2)

        # Then
        self.assertEqual(data, data_copy)

        # When
        data.pop(1)
        self.assertEqual(data_copy[1], [1, 2])
        self.assertIsInstance(data_copy, (DefaultOrderedDict,))

    def test_deepcopy(self):
        # Given
        data = DefaultOrderedDict(list)
        data[1].append(1)

        # When
        data_copy = copy.deepcopy(data)

        # Then
        self.assertEqual(data, data_copy)
        self.assertIsInstance(data_copy, (DefaultOrderedDict,))

        # When
        data[1].append(2)

        # Then
        self.assertNotEqual(data_copy[1], data[1])
