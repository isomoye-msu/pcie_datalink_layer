#!/usr/bin/env python
# -*- coding: utf-8 -*-

from timeit import default_timer


class timed_context(object):

    def __init__(self, description):
        self.description = description
        self.elapsed = float('NaN')

    def __enter__(self):
        self.start = default_timer()
        return self

    def __exit__(self, type, value, traceback):
        self.elapsed = default_timer() - self.start

    def __str__(self):
        if self.elapsed is None:
            return "Context {} has not been run".format(self.description)
        return "ELAPSED : {} : {}".format(self.description, self.elapsed)

    def pretty(self, fmt="ELAPSED : {description} : {elapsed}"):
        return fmt.format(description=self.description, elapsed=self.elapsed)
