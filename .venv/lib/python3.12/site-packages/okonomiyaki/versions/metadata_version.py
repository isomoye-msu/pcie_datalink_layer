import re

from okonomiyaki.errors import InvalidMetadataVersion


_VERSION_R = re.compile(r"(?P<major>\d+)\.(?P<minor>\d+)$")


class MetadataVersion(object):
    """ A simple MAJOR.MINOR version object for metadata versioning.
    """
    @classmethod
    def from_string(cls, s):
        """ Creates a new instance from a version string.
        """
        m = _VERSION_R.match(s)
        if m is None:
            raise InvalidMetadataVersion(s)
        else:
            d = m.groupdict()
            return cls(int(d["major"]), int(d["minor"]))

    def __init__(self, major, minor):
        self._major = major
        self._minor = minor

    @property
    def major(self):
        return self._major

    @property
    def minor(self):
        return self._minor

    @property
    def _key(self):
        return (self._major, self._minor)

    def __eq__(self, other):
        if not isinstance(other, self.__class__):
            return NotImplemented
        else:
            return self._key == other._key

    def __ne__(self, other):
        return not self == other

    def __lt__(self, other):
        if not isinstance(other, self.__class__):
            return NotImplemented
        else:
            return self._key < other._key

    def __le__(self, other):
        if not isinstance(other, self.__class__):
            return NotImplemented
        else:
            return self._key <= other._key

    def __ge__(self, other):
        if not isinstance(other, self.__class__):
            return NotImplemented
        else:
            return self._key >= other._key

    def __gt__(self, other):
        if not isinstance(other, self.__class__):
            return NotImplemented
        else:
            return self._key > other._key

    def __hash__(self):
        return hash(self._key)

    def __str__(self):
        return "{0}.{1}".format(self.major, self.minor)

    def __repr__(self):
        return "MetadataVersion({0}, {1})".format(self.major, self.minor)
