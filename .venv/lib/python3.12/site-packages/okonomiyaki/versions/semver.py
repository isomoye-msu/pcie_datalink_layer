import re

from okonomiyaki.errors import InvalidSemanticVersion


_SEMVER_R = re.compile(r"""
    (?P<major>\d+)
    \.
    (?P<minor>\d+)
    \.
    (?P<patch>\d+)
    (?P<pre_release>-[0-9a-zA-Z-\.]+)?
    (?P<build>\+[0-9a-zA-Z-\.]+)?
    $
""", flags=re.VERBOSE)


_PART_R = re.compile("[0-9a-zA-Z-]+")


def _ensure_no_leading_zero(value, name):
    if len(value) > 1 and value.startswith("0"):
        msg = "{0} number cannot have leading 0: {1!r}".format(name, value)
        raise ValueError(msg)


def _parse_pre_release(s):
    if s is not None:
        # Remove `-` or `+`
        without_prefix_s = s[1:]
        return tuple(part for part in without_prefix_s.split("."))
    else:
        return None


def _parse_build(s):
    return _parse_pre_release(s)


def _convert_pre_release(part):
    try:
        value = int(part)
    except ValueError:
        return part
    else:
        _ensure_no_leading_zero(part, "Pre release part")
        return value


class _PrereleaseParts(object):
    """ Private class used to compare the pre release and build parts. We need
    this as an empty tuple need to compare greated than any non empty tuple.
    """
    def __init__(self, parts):
        self._comparable_parts = tuple(_convert_pre_release(p) for p in parts)

    def _compare_parts(self, left_parts, right_parts):
        for left, right in zip(left_parts, right_parts):
            if left == right:
                continue
            else:
                is_left_int = isinstance(left, int)
                is_right_int = isinstance(right, int)
                if is_left_int:
                    if is_right_int:
                        return left < right
                    else:
                        return True
                else:
                    if is_right_int:
                        return False
                    else:
                        return left < right
        return len(left_parts) < len(right_parts)

    def __hash__(self):
        return hash(self._comparable_parts)

    def __eq__(self, other):
        assert isinstance(other, self.__class__)
        return self._comparable_parts == other._comparable_parts

    def __ne__(self, other):
        return not (self == other)

    def __lt__(self, other):
        assert isinstance(other, self.__class__)
        if self._comparable_parts == other._comparable_parts:
            return False
        elif len(self._comparable_parts) == 0:
            return False
        elif len(other._comparable_parts) == 0:
            return True
        else:
            return self._compare_parts(
                self._comparable_parts, other._comparable_parts
            )

    def __le__(self, other):
        return self == other or self < other

    def __gt__(self, other):
        return not (self <= other)

    def __ge__(self, other):
        return not (self < other)


class SemanticVersion(object):
    """ 'Semver' 2.0 implementation.

    This class takes care of parsing and comparing semver objects.
    """
    @classmethod
    def from_string(cls, s):
        m = _SEMVER_R.match(s)

        if m is None:
            raise InvalidSemanticVersion(s)
        else:
            d = m.groupdict()

            major = d["major"]
            minor = d["minor"]
            patch = d["patch"]

            pre_release = _parse_pre_release(d["pre_release"])

            build = _parse_build(d["build"])

            try:
                _ensure_no_leading_zero(major, "Major")
                _ensure_no_leading_zero(minor, "Minor")
                _ensure_no_leading_zero(patch, "Patch")

                return cls(int(major), int(minor), int(patch), pre_release, build)
            except ValueError as exc:
                msg = "Invalid semantic version '{0}' ({1})".format(
                    s, str(exc)
                )
                raise InvalidSemanticVersion(s, msg)

    def __init__(self, major, minor, patch, pre_release=None, build=None):
        """ Private constructor, use one of the from_ ctors instead.
        """
        self.major = major
        self.minor = minor
        self.patch = patch
        self.pre_release = pre_release or tuple()
        self.build = build or tuple()

        # We cache _comparable_parts to avoid paying the relatively high cost
        # of parsing the pre release parts for versions objects that won't be
        # compared.
        self._comparable_parts_value = None

    @property
    def _comparable_parts(self):
        if self._comparable_parts_value is None:
            self._comparable_parts_value = (
                self.major, self.minor, self.patch,
                _PrereleaseParts(self.pre_release),
            )
        return self._comparable_parts_value

    def __hash__(self):
        return hash(self._comparable_parts)

    def __eq__(self, other):
        if not isinstance(other, self.__class__):
            return False
        else:
            return self._comparable_parts == other._comparable_parts

    def __ne__(self, other):
        return not self == other

    def __lt__(self, other):
        if not isinstance(other, self.__class__):
            return NotImplemented
        else:
            return self._comparable_parts < other._comparable_parts

    def __le__(self, other):
        if not isinstance(other, self.__class__):
            return NotImplemented
        else:
            return self._comparable_parts <= other._comparable_parts

    def __gt__(self, other):
        if not isinstance(other, self.__class__):
            return NotImplemented
        else:
            return self._comparable_parts > other._comparable_parts

    def __ge__(self, other):
        if not isinstance(other, self.__class__):
            return NotImplemented
        else:
            return self._comparable_parts >= other._comparable_parts

    def __str__(self):
        s = "{0}.{1}.{2}".format(self.major, self.minor, self.patch)
        if len(self.pre_release) > 0:
            s += "-" + ".".join(str(v) for v in self.pre_release)
        if len(self.build) > 0:
            s += "+" + ".".join(str(v) for v in self.build)
        return s

    def __repr__(self):
        return "SemanticVersion('{0}')".format(self)
