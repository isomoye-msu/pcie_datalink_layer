from .pep386 import IrrationalVersionError, NormalizedVersion


class PEP386WorkaroundVersion(object):
    """A version class that supports comparison, with an escape for
    versions not compatible with PEP386.

    When comparing two versions, 3 cases arise:

        * both are valid: we use the PEP386 comparison algo
        * both are invalid: we use string comparison
        * exactly one of them is valid: the valid one is always considered
          to be greather than the invalid one
    """
    @classmethod
    def from_string(cls, s):
        try:
            version = NormalizedVersion(s, error_on_huge_major_num=False)
            parts = version.parts
            return cls(parts)
        except IrrationalVersionError:
            parts = s.split(".")
            return cls(parts, is_worked_around=True)

    def __init__(self, parts, is_worked_around=False):
        self._parts = parts

        if is_worked_around:
            comparable_parts = tuple(parts)
        else:
            numdot = list(parts[0])
            while len(numdot) > 0 and numdot[-1] == 0:
                numdot.pop()

            prerel_parts = parts[1]
            # This is a workaround for the verlib.py implementation of
            # pep386.
            if prerel_parts[0] == "rc":
                prerel_parts = tuple(["c"] + list(prerel_parts[1:]))
            elif prerel_parts[0] == ".dev":
                # '`' sorts before 'a'. Explicit better than implicit you said
                # ?
                prerel_parts = tuple(['`'] + list(prerel_parts[1:]))

            comparable_parts = (tuple(numdot), prerel_parts, parts[2])

        self._comparable_parts = comparable_parts
        self._is_worked_around = is_worked_around

    @property
    def is_worked_around(self):
        return self._is_worked_around

    def __str__(self):
        if self._is_worked_around:
            return ".".join(self._parts)
        else:
            return NormalizedVersion.parts_to_str(self._parts)

    def __hash__(self):
        return hash(self._comparable_parts)

    def _cannot_compare(self, other):
        raise TypeError("cannot compare %s and %s"
                        % (type(self).__name__, type(other).__name__))

    def __eq__(self, other):
        if not isinstance(other, PEP386WorkaroundVersion):
            self._cannot_compare(other)
        return self._comparable_parts == other._comparable_parts

    def __ne__(self, other):
        return not self.__eq__(other)

    def __le__(self, other):
        if not isinstance(other, PEP386WorkaroundVersion):
            self._cannot_compare(other)
        if (self._is_worked_around and other._is_worked_around) \
           or (not self._is_worked_around and not other._is_worked_around):
            return self._comparable_parts <= other._comparable_parts
        elif self._is_worked_around:
            return True
        else:
            return False

    def __lt__(self, other):
        return self.__le__(other) and self.__ne__(other)

    def __ge__(self, other):
        return not self.__lt__(other)

    def __gt__(self, other):
        return not self.__le__(other)
