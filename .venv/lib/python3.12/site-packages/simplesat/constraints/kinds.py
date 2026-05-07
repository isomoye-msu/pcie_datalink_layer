import abc

import six

from okonomiyaki.versions import EnpkgVersion


class IConstraint(six.with_metaclass(abc.ABCMeta)):
    @abc.abstractmethod
    def matches(self, version):
        """Returns True if the version object matches this constraint.

        Parameters
        ==========
        version : Version
            A version object
        """


class Any(IConstraint):
    def matches(self, candidate_version):
        return True

    def __str__(self):
        return ""

    def __eq__(self, other):
        return self.__class__ == other.__class__

    def __ne__(self, other):
        return not (self == other)

    def __hash__(self):
        return hash(self.__class__)


class IVersionConstraint(IConstraint):
    def __init__(self, version):
        self.version = version

    def __eq__(self, other):
        return (
            self.__class__ == other.__class__ and
            self.version == other.version
        )

    def __ne__(self, other):
        return not (self == other)

    def __hash__(self):
        return hash(self.version)


class Equal(IVersionConstraint):
    def __str__(self):
        return "== " + str(self.version)

    def matches(self, candidate_version):
        return self.version == candidate_version


class Not(IVersionConstraint):
    def __str__(self):
        return "!= " + str(self.version)

    def matches(self, candidate_version):
        return self.version != candidate_version


class GEQ(IVersionConstraint):
    def __str__(self):
        return ">= " + str(self.version)

    def matches(self, candidate_version):
        return candidate_version >= self.version


class GT(IVersionConstraint):
    def __str__(self):
        return "> " + str(self.version)

    def matches(self, candidate_version):
        return candidate_version > self.version


class LEQ(IVersionConstraint):
    def __str__(self):
        return "<= " + str(self.version)

    def matches(self, candidate_version):
        return candidate_version <= self.version


class LT(IVersionConstraint):
    def __str__(self):
        return "< " + str(self.version)

    def matches(self, candidate_version):
        return candidate_version < self.version


class EnpkgUpstreamMatch(IVersionConstraint):
    def __init__(self, version):
        if not isinstance(version, EnpkgVersion):
            raise ValueError(
                "Invalid type for {0!r}: {1!r}".format(version, type(version))
            )
        super(EnpkgUpstreamMatch, self).__init__(version)

    def __str__(self):
        return "^= " + str(self.version.upstream)

    def matches(self, candidate_version):
        return candidate_version.upstream == self.version.upstream
