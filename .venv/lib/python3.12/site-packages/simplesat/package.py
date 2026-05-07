import abc
import six
import enum

from okonomiyaki.versions import EnpkgVersion


class ConstraintKinds(enum.Enum):
    install_requires = 'install_requires'
    conflicts = 'conflicts'
    provides = 'provides'


class IRepositoryInfo(six.with_metaclass(abc.ABCMeta)):
    @abc.abstractproperty
    def name(self):
        """ A name that uniquely indentifies a repository."""


class RepositoryInfo(IRepositoryInfo):
    def __init__(self, name):
        self._name = name
        self._key = (name,)
        self._hash = hash(self._key)

    @property
    def name(self):
        """A name that uniquely indentifies a repository."""
        return self._name

    def __hash__(self):
        return self._hash

    def __eq__(self, other):
        return self._key == other._key

    def __ne__(self, other):
        return self._key != other._key

    def __repr__(self):
        return "Repository(<{0.name}>)".format(self)


class PackageMetadata(object):
    """ PackageMetadata represents an immutable, versioned Python distribution
    and its relationship with other packages.
    """

    @classmethod
    def _from_pretty_string(cls, s):
        """ Create an instance from a pretty string.

        A pretty string looks as follows::

            'numpy 1.8.1-1; depends (MKL ^= 10.3)'

        Note
        ----
        Don't use this in production code, only meant to be used for testing.
        """
        # FIXME: local import to workaround circular imports
        from .constraints import PrettyPackageStringParser
        parser = PrettyPackageStringParser(EnpkgVersion.from_string)
        return parser.parse_to_package(s)

    def __init__(self, name, version, install_requires=None, conflicts=None,
                 provides=None):
        """ Return a new PackageMetdata object.

        Parameters
        ----------
        name : str
            The name of the Python distribution, e.g. "numpy"
        version : EnpkgVersion
            An EnpkgVersion object describing the version of this package.
        install_requires : tuple(tuple(str, tuple(tuple(str))))
            A tuple of tuples mapping distribution names to disjunctions of
            conjunctions of version constraints.

            For example, consider a package that depends on the following:
                - nose
                - six (> 1.2, <= 1.2.3), or >= 1.2.5-2
                    Written as intervals, (1.2, 1.2.3] or [1.2.5-2, \\infty)
                - MKL >= 10.1, < 11

            The constraint tuple representing this would be:
                (("MKL", ((">= 10.1", "< 11"),)),
                 ("nose", (("*",),)),
                 ("six", (("> 1.2", "<= 1.2.3"), (">= 1.2.5-2",)))
        conflicts : tuple(tuple(str, tuple(tuple(str))))
            A tuple of tuples mapping distribution names to disjunctions of
            conjunctions of version constraints.

            This works the same way as install_requires, but instead denotes
            packages that must *not* be installed with this package.
        provides :  tuple(tuple(str, tuple(tuple(str))))
            A tuple of tuples mapping package and virtual package names to
            disjunctions of conjunctions of version constraints.

            For example, consider a package ``numpy-nomkl`` which should be a
            drop-in replacement for the normal ``numpy`` or ``numeric``
            packages. ``numpy-nomkl`` would have the following `provides`:
                (("numpy", (("*",),)), ("numeric", (("*",),)))

            At this time, no version constraint is permitted for names
            specified in `provides`.
        """
        self._name = name
        self._provides = tuple(provides or ())
        self._version = version
        self._install_requires = install_requires or ()
        self._conflicts = conflicts or ()
        self._key = (name, version, self._install_requires, self._conflicts)
        self._hash = hash(self._key)

    @property
    def name(self):
        return self._name

    @property
    def provides(self):
        constraint_str = "*"
        this_pkg = ((self._name, ((constraint_str,),)),)
        return this_pkg + self._provides

    @property
    def version(self):
        return self._version

    @property
    def install_requires(self):
        return self._install_requires

    @property
    def conflicts(self):
        return self._conflicts

    def __repr__(self):
        return "{0}('{1}-{2}')".format(
            self.__class__.__name__, self._name, self._version)

    def __hash__(self):
        return self._hash

    def __eq__(self, other):
        try:
            return self._key == other._key
        except AttributeError:
            return NotImplemented

    def __ne__(self, other):
        try:
            return self._key != other._key
        except AttributeError:
            return NotImplemented


class RepositoryPackageMetadata(object):
    @classmethod
    def _from_pretty_string(cls, s, repository_info):
        package = PackageMetadata._from_pretty_string(s)
        return cls(package, repository_info)

    def __init__(self, package, repository_info):
        self._package = package
        self._repository_info = repository_info

        self._key = (package._key, repository_info)
        self._hash = hash(self._key)

    @property
    def name(self):
        return self._package.name

    @property
    def provides(self):
        return self._package.provides

    @property
    def version(self):
        return self._package.version

    @property
    def install_requires(self):
        return self._package.install_requires

    @property
    def conflicts(self):
        return self._package.conflicts

    @property
    def repository_info(self):
        return self._repository_info

    def __repr__(self):
        return (
            "RepositoryPackageMetadata('{pkg._name}-{pkg._version}'"
            ", repo={repository_info!r})".format(
                pkg=self._package, repository_info=self._repository_info))

    def __hash__(self):
        return self._hash

    def __eq__(self, other):
        try:
            return self._key == other._key
        except AttributeError:
            return NotImplemented

    def __ne__(self, other):
        try:
            return self._key != other._key
        except AttributeError:
            return NotImplemented
