#!/usr/bin/env python
# -*- coding: utf-8 -*-
# flake8: noqa
from __future__ import absolute_import

import contextlib
import shutil
import tempfile

from .timed_context import timed_context
from .graph import connected_nodes, toposort, transitive_neighbors
from ._collections import DefaultOrderedDict


@contextlib.contextmanager
def mkdtemp():
    d = tempfile.mkdtemp()
    yield d
    shutil.rmtree(d)
