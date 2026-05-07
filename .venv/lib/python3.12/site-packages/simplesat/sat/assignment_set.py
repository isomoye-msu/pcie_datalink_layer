#!/usr/bin/env python
# -*- coding: utf-8 -*-

import six


class AssignmentSet(object):

    """A collection of literals and their assignments."""

    def __init__(self, assignments=None):
        # Changelog is a dict of id -> (original value, new value)
        # FIXME: Verify that we really need ordering here
        self._data = {}
        self._orig = {}
        self._seen = set()
        self._cached_changelog = None
        self._assigned_ids = set()
        self.new_keys = set()
        for k, v in (assignments or {}).items():
            self[k] = v

    def __setitem__(self, key, value):

        abskey = abs(key)

        if abskey not in self._seen:
            self.new_keys.add(abskey)

        if value is None:
            del self[key]
        else:
            self._update_diff(key, value)
            self._data[key] = value
            self._data[-key] = not value
            self._assigned_ids.add(abs(key))

        self._seen.add(abskey)

    def __delitem__(self, key):
        self._seen.discard(abs(key))
        if key not in self._data:
            return
        self._update_diff(key, None)
        del self._data[key]
        del self._data[-key]
        self._assigned_ids.discard(abs(key))

    def __getitem__(self, key):
        val = self._data.get(key)
        if val is None and abs(key) not in self._seen:
            raise KeyError(key)
        return val

    def get(self, key, default=None):
        return self._data.get(key, default)

    def __len__(self):
        return len(self._seen)

    def __iter__(self):
        return iter(self.keys())

    def __contains__(self, key):
        return abs(key) in self._seen

    def items(self):
        return sorted(
            (k, self._data.get(k))
            for k in self._seen)

    def iteritems(self):
        return iter(self.items())

    def keys(self):
        return [k for k, _ in self.items()]

    def values(self):
        return [v for _, v in self.items()]

    def _update_diff(self, key, value):
        # This must be called before _data is updated
        if key < 0 and value is not None:
            key = -key
            value = not value
        prev = self._data.get(key)
        self._orig.setdefault(key, prev)
        # If a value changes, dump the cached changelog
        self._cached_changelog = None

    def get_changelog(self):
        if self._cached_changelog is None:
            self._cached_changelog = {
                key: (old, new)
                for key, old in six.iteritems(self._orig)
                for new in [self._data.get(key)]
                if new != old
            }
        return self._cached_changelog

    def consume_changelog(self):
        old = self.get_changelog()
        self._orig = {}
        self._cached_changelog = {}
        self.new_keys.clear()
        return old

    def copy(self):
        new = AssignmentSet()
        new._data = self._data.copy()
        new._orig = self._orig.copy()
        new._seen = self._seen.copy()
        new._assigned_ids = self._assigned_ids.copy()
        new.new_keys = self.new_keys.copy()
        return new

    def to_dict(self):
        return dict(self.items())

    def value(self, lit):
        """ Return the value of literal. """
        return self._data.get(lit)

    @property
    def num_assigned(self):
        return len(self._assigned_ids)

    @property
    def assigned_ids(self):
        return self._assigned_ids

    @property
    def unassigned_ids(self):
        return self._seen.difference(self._assigned_ids)
