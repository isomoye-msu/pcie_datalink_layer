""" Implementation of a subset of PEP440.

Implementation adapted from the distlib.version package
"""
import re

from okonomiyaki.errors import InvalidPEP440Version


PEP440_VERSION_RE = re.compile(r'^v?(\d+!)?(\d+(\.\d+)*)((a|b|rc)(\d+))?'
                               r'(\.(post)(\d+))?(\.(dev)(\d+))?'
                               r'(\+([a-zA-Z\d]+(\.[a-zA-Z\d]+)?))?$')


class _Min(object):
    def __hash__(self):
        return hash(self.__class__)

    def __eq__(self, other):
        return other.__class__ == self.__class__

    def __ne__(self, other):
        return other.__class__ != self.__class__

    def __lt__(self, other):
        return other.__class__ != self.__class__

    def __le__(self, other):
        return True

    def __ge__(self, other):
        return other.__class__ == self.__class__

    def __gt__(self, other):
        return False


class _Max(object):
    def __hash__(self):
        return hash(self.__class__)

    def __eq__(self, other):
        return other.__class__ == self.__class__

    def __ne__(self, other):
        return other.__class__ != self.__class__

    def __lt__(self, other):
        return False

    def __le__(self, other):
        return other.__class__ == self.__class__

    def __ge__(self, other):
        return True

    def __gt__(self, other):
        return other.__class__ != self.__class__


_MIN = _Min()
_MAX = _Max()


class PEP440Version(object):
    """ A PEP440-compliant version object.

    Note: replacements are not supported yet.
    """
    @classmethod
    def from_string(cls, s):
        m = PEP440_VERSION_RE.match(s)
        if not m:
            raise InvalidPEP440Version(s)
        groups = m.groups()
        nums = tuple(int(v) for v in groups[1].split('.'))

        if not groups[0]:
            epoch = 0
        else:
            epoch = int(groups[0][:-1])
        pre = groups[4:6]
        post = groups[7:9]
        dev = groups[10:12]
        local = groups[13]
        if pre == (None, None):
            pre = ()
        else:
            pre = pre[0], int(pre[1])
        if post == (None, None):
            post = ()
        else:
            post = post[0], int(post[1])
        if dev == (None, None):
            dev = ()
        else:
            dev = dev[0], int(dev[1])
        if local is None:
            local = ()
        else:
            parts = []
            for part in local.split('.'):
                # to ensure that numeric compares as > lexicographic, avoid
                # comparing them directly, but encode a tuple which ensures
                # correct sorting
                if part.isdigit():
                    part = (1, int(part))
                else:
                    part = (0, part)
                parts.append(part)
            local = tuple(parts)

        if not pre:
            if not post and dev:
                # before pre-release
                pre = (_MIN,)
            else:
                pre = (_MAX,)

        if not post:
            post = (_MIN,)
        if not dev:
            dev = (_MAX,)

        return cls(epoch, nums, pre, post, dev, local)

    def __init__(self, epoch, nums, pre, post, dev, local):
        self._release_clause = nums

        nums = _strip_trailing_zeros(nums)

        self._parts = (epoch, nums, pre, post, dev, local)

        # Caching of the corresponding properties
        self._normalized_string = None
        self._string = None

    @property
    def normalized_string(self):
        """ 'normalized' string, i.e. 0 in the numerical part are stripped.
        """
        if self._normalized_string is None:
            self._normalized_string = self._compute_string(*self._parts)
        return self._normalized_string

    def __hash__(self):
        return hash(self._parts)

    def _ensure_compatible(self, other):
        if type(self) != type(other):  # noqa
            raise TypeError('cannot compare %r and %r' % (self, other))

    def _compute_string(self, epoch, nums, pre, post, dev, local):
        s = ""
        if epoch:
            s += str(epoch) + "!"
        s += ".".join(str(i) for i in nums)
        if pre and pre[0] not in (_MIN, _MAX):
            s += pre[0] + str(pre[1])
        if post and post[0] not in (_MIN, _MAX):
            s += ".post" + str(post[1])
        if dev and dev[0] not in (_MIN, _MAX):
            s += ".dev" + str(dev[1])
        if local:
            s += "+" + ".".join(str(part[1]) for part in local)
        return s

    def __eq__(self, other):
        self._ensure_compatible(other)
        return self._parts == other._parts

    def __ne__(self, other):
        self._ensure_compatible(other)
        return self._parts != other._parts

    def __lt__(self, other):
        self._ensure_compatible(other)
        return self._parts < other._parts

    def __le__(self, other):
        self._ensure_compatible(other)
        return self._parts <= other._parts

    def __ge__(self, other):
        self._ensure_compatible(other)
        return self._parts >= other._parts

    def __gt__(self, other):
        self._ensure_compatible(other)
        return self._parts > other._parts

    def __repr__(self):
        return "{0}.from_string('{1!s}')".format(self.__class__.__name__, self)

    def __str__(self):
        if self._string is None:
            nums = self._release_clause
            epoch, _, pre, post, dev, local = self._parts
            self._string = self._compute_string(
                epoch, nums, pre, post, dev, local
            )
        return self._string


def _strip_trailing_zeros(nums):
    while len(nums) > 1 and nums[-1] == 0:
        nums = nums[:-1]
    return nums
