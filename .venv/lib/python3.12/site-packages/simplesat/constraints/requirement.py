import re

import six

from okonomiyaki.versions import EnpkgVersion

from simplesat.errors import (
    InvalidConstraint, InvalidDependencyString, SolverException
)

from .kinds import Any, Equal
from .multi import MultiConstraints
from .parser import (
    _RawConstraintsParser, _RawRequirementParser,
    _DISTRIBUTION_NAME_R, _VERSION_R
)


_FULL_PACKAGE_RC = re.compile(
    (
        f"(?P<name>{_DISTRIBUTION_NAME_R})"
        r"(?:-|\s+)"
        f"(?P<version>{_VERSION_R})$"
    ), re.VERBOSE)


def parse_package_full_name(full_name):
    """
    Parse a package full name (e.g. 'numpy-1.6.0-1') into a (name,
    version_string) pair.
    """
    m = _FULL_PACKAGE_RC.match(full_name)
    if m:
        return m.group("name"), m.group("version")
    else:
        msg = "Invalid package full name {0!r}".format(full_name)
        raise SolverException(msg)


def _first(iterable):
    return six.next(iter(iterable))


class Requirement(object):
    """Requirements instances represent a 'package requirement', that is a
    package + version constraints.

    Arguments
    ---------
    name: str
        PackageInfo name
    specs: seq
        Sequence of constraints
    """

    @classmethod
    def from_constraints(cls, constraint_tuple):
        """ Return a Requirement object from a PackageMetadata constraint
        tuple.

        Parameters
        ----------
        constraints : constraints tuple
            A 2-tuple of constraints where the first element is the
            distribution name, and the second is a tuple of tuple of string,
            representing a disjuntion of conjunctions of version ranges, e.g.
            ``('nose', (('< 1.4', '>= 1.3'),))``.


            >>> Requirement.from_constraints((
            ...     'nose', ( # disjunction
            ...         ('< 1.4', '>= 1.3'),  # conjunction
            ...     )
            ... ))
            Requirement('nose < 1.4-0, >= 1.3-0')

        Returns
        -------
        Requirement
            A Requirement that matches the given constraints.

        Raises
        ------
        InvalidConstraint
            If there is more than one conjunction. In less formal terms, we do
            not currently support the OR operator.
        InvalidConstraint
            If the constraint tuple has the wrong shape.
        """
        try:
            name, disjunction = constraint_tuple
        except ValueError:
            msg = "Invalid constraint tuple: {}"
            raise InvalidConstraint(msg.format(constraint_tuple))

        if len(disjunction) > 1:
            msg = "Disjunction (OR) is not yet supported in constraints: {}"
            raise InvalidConstraint(msg.format(disjunction))

        parse = _RawConstraintsParser().parse

        def insert_star(conjunction):
            return conjunction if len(conjunction) > 0 else ("*",)

        constraints = tuple(
            constraint
            for conjunction in disjunction
            for constraint_str in insert_star(conjunction)
            for constraint in parse(constraint_str, EnpkgVersion.from_string))

        return cls(name, constraints)

    def to_constraints(self):
        """ Return a constraint tuple as described by :meth:`from_constraints`.
        """
        name = self.name

        parts = []
        for constraint in self._constraints._constraints:
            if not isinstance(constraint, Any):
                parts.append(str(constraint))
            else:
                parts.append('*')
        return (name, (tuple(parts),))

    @classmethod
    def _from_string(cls, string,
                     version_factory=EnpkgVersion.from_string):
        """ Creates a requirement from a requirement string.

        Parameters
        ----------
        string : str
            The requirement string, e.g. 'MKL >= 10.3, MKL < 11.0'
        version_factory : callable, optional
            A function from version strings to version objects.

        Returns
        -------
        Requirement
            A requirement matching the `string`.

        Raises
        ------
        InvalidDependencyString
            If the string refers to more than one package.
        """
        parser = _RawRequirementParser()
        named_constraints = parser.parse(string, version_factory)
        if len(named_constraints) > 1:
            names = named_constraints.keys()
            msg = "Multiple package name for constraint: {0!r}".format(names)
            raise InvalidDependencyString(msg)
        assert len(named_constraints) > 0
        name = _first(named_constraints.keys())
        return cls(name, named_constraints[name])

    @classmethod
    def from_package_string(cls, package_string,
                            version_factory=EnpkgVersion.from_string):
        """ Creates a requirement from a package full version.

        Parameters
        ----------
        package_string : str
            The package string, e.g. 'numpy-1.8.1-1'
        version_factory : callable, optional
            A function from version strings to version objects.

        Returns
        -------
        Requirement
            A requirement matching the exact package and version in
            `package_string`.
        """
        name, version_string = parse_package_full_name(package_string)
        version = version_factory(version_string)
        return cls(name, (Equal(version),))

    def __init__(self, name, constraints=None):
        self.name = name
        self._constraints = MultiConstraints(constraints)

    def matches(self, version_candidate):
        """ Returns True if the given version matches this set of
        requirements, False otherwise.

        Parameters
        ----------
        version_candidate : obj
            A valid version object (must match the version factory of the
            requirement instance).
        """
        return self._constraints.matches(version_candidate)

    def __eq__(self, other):
        return (self.name == other.name and
                self._constraints == other._constraints)

    def __ne__(self, other):
        return not (self == other)

    def __hash__(self):
        return hash((self.name, self._constraints))

    def __str__(self):
        name, constraints = self.to_constraints()
        parts = [
            constraint
            for conjunction in constraints
            for constraint in conjunction
            if constraint != '*'
        ]

        if len(parts) == 0:
            return self.name
        else:
            return self.name + " " + ", ".join(parts)

    def __repr__(self):
        return "{}('{}')".format(self.__class__.__name__, self)

    @property
    def has_any_version_constraint(self):
        """ True if there is any version constraint."""
        constraints = self._constraints._constraints
        if len(constraints) == 0:
            return False
        elif len(constraints) == 1:
            constraint = six.next(iter(constraints))
            if isinstance(constraint, Any):
                return False
        return True


class InstallRequirement(Requirement):
    """ A Requirement that describes packages to be installed. """


class ConflictRequirement(Requirement):
    """ A Requirement that describes packages which must not be installed. """
