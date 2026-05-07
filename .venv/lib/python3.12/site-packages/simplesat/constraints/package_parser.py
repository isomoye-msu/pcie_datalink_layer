import re
from collections import defaultdict

from simplesat.package import PackageMetadata, ConstraintKinds
from .parser import _DISTRIBUTION_R, _VERSION_R, _WS_R


_WS_RS = _WS_R
_MAYBE_WS_RS = " *"
_DISTRIBUTION_RS = "(?P<distribution>{})".format(_DISTRIBUTION_R)
_VERSION_RS = "(?P<version>{})".format(_VERSION_R)
_CONSTRAINT_RS = "(?P<constraint>[^,]*)"

CONSTRAINT_BLOCK_RC = re.compile(r"(?P<kind>\w+)\s*\((?P<constraints>.*?)\)")  # noqa
PACKAGE_RC = re.compile(_DISTRIBUTION_RS + _WS_RS + _VERSION_RS)
CONSTRAINT_RC = re.compile(_DISTRIBUTION_RS + _MAYBE_WS_RS + _CONSTRAINT_RS)

CONSTRAINT_SYNONYMS = {
    'depends': ConstraintKinds.install_requires,
    'install_requires': ConstraintKinds.install_requires,
    'conflicts': ConstraintKinds.conflicts,
    'provides': ConstraintKinds.provides,
}


class PrettyPackageStringParser(object):

    def __init__(self, version_factory):
        self._version_factory = version_factory

    def parse(self, pretty_string):
        """Return the dict representation of the pretty package string.

        Pretty package strings are of the form::

            numpy 1.8.1-1; install_requires (MKL == 10.3, nose ^= 1.3.4); conflicts (numeric); provides (numeric)  # noqa
        """
        pretty_string = pretty_string.strip()
        pkg = {}

        try:
            preamble, constraints_blocks = pretty_string.split(";", 1)
        except ValueError:
            preamble = pretty_string
            constraints_blocks = ''

        for match in CONSTRAINT_BLOCK_RC.finditer(constraints_blocks):
            kind = match.group('kind')
            constraints_str = match.group('constraints')
            if kind not in CONSTRAINT_SYNONYMS:
                msg = "Invalid package string. Unknown constraint kind: {!r}"
                raise ValueError(msg.format(kind))
            kind = CONSTRAINT_SYNONYMS[kind].value
            constraints = defaultdict(lambda: [[]])
            for match in CONSTRAINT_RC.finditer(constraints_str):
                dist = match.group('distribution')
                constraint_str = match.group('constraint')
                constraints[dist][0].append(constraint_str)
            pkg[kind] = constraints

        # Turn constraints into immutable nested tuples
        pkg = {
            kind: tuple(sorted(
                (dist, tuple(tuple(clist) for clist in constraints))
                for dist, constraints in dist_constraints.items()
            ))
            for kind, dist_constraints in pkg.items()
        }

        distribution, version = _parse_preamble(preamble)
        pkg["distribution"] = distribution
        pkg["version"] = self._version_factory(version)

        return pkg

    def parse_to_package(self, package_string):
        """ Parse the given pretty package string.

        Parameters
        ----------
        package_string : str
            The pretty package string, e.g.
            "numpy 1.8.1-1; depends (MKL == 10.3, nose ^= 1.3.4)"

        Returns
        -------
        package : PackageMetadata
        """
        pkg_dict = self.parse(package_string)
        distribution = pkg_dict.pop('distribution')
        version = pkg_dict.pop('version')
        return PackageMetadata(distribution, version, **pkg_dict)


def constraints_to_pretty_strings(constraint_tuples):
    """ Convert a sequence of constraint tuples as used in PackageMetadata to a
    list of pretty constraint strings.

    Parameters
    ----------
    constraint_tuples : tuple of constraint
        Sequence of constraint tuples, e.g. (("MKL", (("< 11", ">= 10.1"),)),)
    """
    flat_strings = [
        "{} {}".format(dist, constraint_string).strip()
        for dist, disjunction in constraint_tuples
        for conjunction in disjunction
        for constraint_string in conjunction
    ]
    return flat_strings


def package_to_pretty_string(package):
    """ Given a PackageMetadata instance, returns a pretty string."""
    template = "{0.name} {0.version}"
    constraint_kinds = (
        (ConstraintKinds.install_requires, package.install_requires),
        (ConstraintKinds.conflicts, package.conflicts),
        (ConstraintKinds.provides, package.provides),
    )
    for constraint_kind, constraints in constraint_kinds:
        # FIXME: perhaps 'provides' just shouldn't include the package name
        if constraint_kind == ConstraintKinds.provides:
            constraints = tuple((dist, disjunction)
                                for dist, disjunction in constraints
                                if dist != package.name)
        if len(constraints) > 0:
            string = ', '.join(constraints_to_pretty_strings(constraints))
            template += "; {} ({})".format(constraint_kind.value, string)
    return template.format(package)


def _parse_preamble(preamble):
    msg = "Invalid preamble: {0!r}".format(preamble)
    match = PACKAGE_RC.match(preamble)
    if not match:
        raise ValueError(msg)
    if match.span()[-1] != len(preamble):
        msg = msg + ", {!r}".format(match.group(0))
        raise ValueError(msg)
    groups = match.groupdict()
    return groups['distribution'], groups['version']
