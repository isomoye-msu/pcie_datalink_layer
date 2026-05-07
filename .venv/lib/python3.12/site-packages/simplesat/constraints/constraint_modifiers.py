#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import division, print_function

from collections import OrderedDict

from attr import attr, attributes, asdict
from attr.validators import instance_of
import six

from okonomiyaki.versions import EnpkgVersion
from simplesat.constraints.kinds import (
    Any, EnpkgUpstreamMatch, Equal, Not, GEQ, GT, LEQ, LT,
)
from simplesat.constraints.requirement import InstallRequirement


MAX_BUILD = 999999999  # Nine nines... I guess


def Any_(_version):
    # This just eats the 'version' argument
    return Any()


def LEQ_LEAST_UPPER_BOUND(version):
    new_version = EnpkgVersion.from_upstream_and_build(
        str(version.upstream), MAX_BUILD)
    return LEQ(new_version)


ALLOW_NEWER_MAP = {
    Any: Any_,
    Equal: GEQ,
    Not: Not,
    GEQ: GEQ,
    GT: GT,
    LEQ: Any_,
    LT: Any_,
    EnpkgUpstreamMatch: GEQ,
}

ALLOW_OLDER_MAP = {
    Any: Any_,
    Equal: LEQ,
    Not: Not,
    GEQ: Any_,
    GT: Any_,
    LEQ: LEQ,
    LT: LT,
    EnpkgUpstreamMatch: LEQ_LEAST_UPPER_BOUND,
}

ALLOW_ANY_MAP = {
    Any: Any_,
    Equal: Any_,
    Not: Not,
    GEQ: Any_,
    GT: Any_,
    LEQ: Any_,
    LT: Any_,
    EnpkgUpstreamMatch: Any_,
}


def as_set(container):
    """ Return a set from an iterable, being careful not to disassemble
    strings.
        >>> iterable_to_set(['foo'])
        set(['foo'])
        >>> iterable_to_set('foo')
        set(['foo'])
    """
    if isinstance(container, six.string_types):
        container = (container,)
    return set(container)


_coerced_set = dict(default=(), converter=as_set,
                    validator=instance_of(set))


@attributes
class ConstraintModifiers(object):
    allow_newer = attr(**_coerced_set)
    allow_any = attr(**_coerced_set)
    allow_older = attr(**_coerced_set)

    def asdict(self):
        return {k: sorted(v) for k, v in six.iteritems(asdict(self))}

    def update(self, other_modifiers):
        """ Update modifiers with values from ConstraintModifiers instance. """
        self.allow_any.update(other_modifiers.allow_any)
        self.allow_newer.update(other_modifiers.allow_newer)
        self.allow_older.update(other_modifiers.allow_older)

    def remove(self, packages):
        """ Remove all modifiers related to `packages`.

        Parameters
        ----------
        packages : an iterable of strings
            The package names that should be completely removed.
        """
        disallowed = (type(b""), type(u""))
        if isinstance(packages, disallowed):
            raise TypeError("`packages` should be a collection, not a string.")
        packages = set(packages)
        self.allow_any.difference_update(packages)
        self.allow_newer.difference_update(packages)
        self.allow_older.difference_update(packages)

    @property
    def targets(self):
        return set.union(self.allow_newer, self.allow_any, self.allow_older)


def _modify_install_requirement(requirement, modifiers):
    """If any of the modifier rules apply, return a new Requirement with
    modified constraints, otherwise return the original requirement.
    """

    name = requirement.name
    original_constraints = constraints = requirement._constraints._constraints
    type_maps = (
        (modifiers.allow_older or (), ALLOW_OLDER_MAP),
        (modifiers.allow_newer or (), ALLOW_NEWER_MAP),
        (modifiers.allow_any or (), ALLOW_ANY_MAP),
    )

    modified = False
    for names, type_map in type_maps:
        if name in names:
            modified = True
            constraints = _modify_constraints(constraints, type_map)

    if modified and constraints != original_constraints:
        # Remove duplicate constraints
        constraints = tuple(OrderedDict.fromkeys(constraints).keys())
        return InstallRequirement(name, constraints)

    return requirement


def _modify_constraints(constraints, type_map):
    return tuple(
        type_map[type(c)](getattr(c, 'version', None))
        for c in constraints
    )


def modify_requirement(requirement, modifiers):
    if isinstance(requirement, InstallRequirement):
        return _modify_install_requirement(requirement, modifiers)
    elif requirement.has_any_version_constraint:
        new_r = _modify_install_requirement(requirement, modifiers)
        msg = "Only identity modifications are defined for {}"
        class_name = requirement.__class__.__name__
        if new_r is not requirement:
            raise NotImplementedError(msg.format(class_name))
    return requirement
