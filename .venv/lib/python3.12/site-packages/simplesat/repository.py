from __future__ import absolute_import

import bisect
import operator
import six

from .errors import NoPackageFound
from simplesat.constraints.requirement import Requirement


class Repository(object):
    """
    A Repository is a set of packages that knows about which package it
    contains.

    It also supports the iterator protocol. Iteration is guaranteed to be
    deterministic and independent of the order in which packages have been
    added.

    Parameters
    ----------
    packages : list of PackageMetadata
        The packages available in this repository.


    >>> from simplesat.constraints.package_parser import \\
    ...     pretty_string_to_package as P
    >>> mkl = P('MKL 10.3-1')
    >>> numpy1921 = P('numpy 1.9.2-1; depends (MKL)')
    >>> numpy1922 = P('numpy 1.9.2-2; depends (MKL, libgfortran)')
    >>> repository = Repository([mkl, numpy1922])
    >>> repository.add_package(numpy1921)
    >>> assert list(repository) == some_pkgs + [another_one]
    >>> numpies = repository.find_packages['numpy']
    >>> assert numpies == [numpy1921, numpy1922]
    """
    def __init__(self, packages=None):
        self._name_to_packages = {}
        self._default_factory = lambda: []
        # Sorted list of keys in self._name_to_packages, to keep iteration
        # over a repository reproducible
        self._names = []

        packages = packages or []
        for package in packages:
            self.add_package(package)

    def __len__(self):
        return sum(
            len(packages)
            for packages in six.itervalues(self._name_to_packages)
        )

    def __contains__(self, package_metadata):
        if package_metadata.name in self._name_to_packages:
            return (
                package_metadata
                in self._name_to_packages[package_metadata.name]
            )
        else:
            return False

    def __iter__(self):
        for name in self._names:
            for package in self._name_to_packages[name]:
                yield package

    def add_package(self, package_metadata):
        """ Add the given package to this repository.

        Parameters
        ----------
        package : PackageMetadata
            The package metadata to add. May be a subclass of PackageMetadata.

        Note
        ----
        If the same package is added multiple times to a repository, every copy
        will be available when calling find_package or when iterating.
        """
        if package_metadata.name not in self._name_to_packages:
            bisect.insort(self._names, package_metadata.name)

        self._name_to_packages.setdefault(
            package_metadata.name, self._default_factory()
        )
        self._name_to_packages[package_metadata.name].append(package_metadata)
        # Fixme: this should not be that costly as long as we don't have
        # many versions for a given package.
        self._name_to_packages[package_metadata.name].sort(
            key=operator.attrgetter("version")
        )

    def find_package(self, name, version):
        """Search for the first match of a package with the given name and
        version.

        Parameters
        ----------
        name : str
            The package name to look for.
        version : EnpkgVersion
            The version to look for.

        Returns
        -------
        package : PackageMetadata
            The corresponding metadata.
        """
        candidates = self._name_to_packages.get(name, self._default_factory())
        for candidate in candidates:
            if candidate.version == version:
                return candidate
        package_string = '{0}-{1}'.format(name, str(version))
        raise NoPackageFound(
            Requirement.from_package_string(package_string),
            "Package '{0}' not found".format(package_string),
        )

    def find_packages(self, name):
        """ Returns an iterable of package metadata with the given name, sorted
        from lowest to highest version.

        Parameters
        ----------
        name : str
            The package's name

        Returns
        -------
        packages : iterable
            Iterable of PackageMetadata instances (order is from lower to
            higher version)
        """
        return tuple(self._name_to_packages.get(name, self._default_factory()))

    def update(self, iterable):
        """ Add the packages from the given iterable into this repository.

        Parameters
        ----------
        """
        for package in iterable:
            self.add_package(package)
