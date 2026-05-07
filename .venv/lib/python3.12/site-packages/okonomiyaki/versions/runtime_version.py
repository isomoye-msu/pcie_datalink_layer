from .pep440 import PEP440Version


class RuntimeVersion(object):
    @classmethod
    def from_string(cls, s):
        return cls(PEP440Version.from_string(s))

    def __init__(self, pep440_version):
        self._pep440_version = pep440_version

    @property
    def major(self):
        return self._nums[0]

    @property
    def minor(self):
        if len(self._nums) < 2:
            return 0
        else:
            return self._nums[1]

    @property
    def micro(self):
        if len(self._nums) < 3:
            return 0
        else:
            return self._nums[2]

    @property
    def numpart(self):
        """Major.Minor.Micro as a string."""
        return "{0.major}.{0.minor}.{0.micro}".format(self)

    @property
    def normalized_string(self):
        return self._pep440_version.normalized_string

    @property
    def _nums(self):
        return self._pep440_version._parts[1]

    def _ensure_can_compare(self, other):
        if not isinstance(other, self.__class__):
            msg = "Cannot compare {0!r} and {1!r}"
            raise TypeError(msg.format(type(self), type(other)))

    def __str__(self):
        return str(self._pep440_version)

    def __repr__(self):
        return "{0}.from_string('{1!s}')".format(self.__class__.__name__, self)

    def __hash__(self):
        return hash(self._pep440_version)

    def __eq__(self, other):
        self._ensure_can_compare(other)
        return self._pep440_version == other._pep440_version

    def __ne__(self, other):
        self._ensure_can_compare(other)
        return self._pep440_version != other._pep440_version

    def __lt__(self, other):
        self._ensure_can_compare(other)
        return self._pep440_version < other._pep440_version

    def __le__(self, other):
        self._ensure_can_compare(other)
        return self._pep440_version <= other._pep440_version

    def __ge__(self, other):
        self._ensure_can_compare(other)
        return self._pep440_version >= other._pep440_version

    def __gt__(self, other):
        self._ensure_can_compare(other)
        return self._pep440_version > other._pep440_version
