import re
import sys

from attr import attributes, attr
from attr.validators import instance_of

from okonomiyaki.errors import InvalidMetadataField


_KIND_TO_ABBREVIATED = {
    u"cpython": u"cp",
    u"python": u"py",
    u"pypy": u"pp",
    u"ironpython": u"ip",
    u"jython": u"jy",
}

_ABBREVIATED_TO_KIND = dict((v, k) for k, v in _KIND_TO_ABBREVIATED.items())

_TAG_RE = re.compile(r"""
    (?P<interpreter>([^\d]+))
    (?P<version>([\d_]+))
""", flags=re.VERBOSE)

_ABI_NONE = u'none'
_PYTHON_TAG_NONE = u'none'


@attributes
class PythonABI(object):
    """ An object representation of python ABI as defined in PEP 425.
    """
    pep425_tag = attr(validator=instance_of(str))

    @staticmethod
    def pep425_tag_string(abi):
        if abi is None:
            return _ABI_NONE
        else:
            return abi.pep425_tag


class PythonImplementation(object):
    @staticmethod
    def pep425_tag_string(implementation):
        if implementation is None:
            # an extension of PEP 425, to signify the egg will work on any
            # python version (mostly non-python eggs)
            return _PYTHON_TAG_NONE
        else:
            return implementation.pep425_tag

    @classmethod
    def from_running_python(cls):
        s = _abbreviated_implementation() + _implementation_version()
        return cls.from_string(s)

    @classmethod
    def from_string(cls, s):
        generic_exc = InvalidMetadataField('python_tag', s)
        m = _TAG_RE.match(s)
        if m is None:
            raise generic_exc
        else:
            d = m.groupdict()
            kind = d["interpreter"]
            version = d["version"]
            if '_' in version:
                major, minor = map(int, version.split('_'))
                return cls(kind, major, minor)
            elif 1 < len(version) < 4:
                major = int(version[0])
                minor = int(version[1:])
                return cls(kind, major, minor)
            else:
                raise generic_exc

    def __init__(self, kind, major, minor):
        self.kind = _ABBREVIATED_TO_KIND.get(kind, kind)
        self.major = major
        self.minor = minor

    @property
    def abbreviated_implementation(self):
        return _KIND_TO_ABBREVIATED.get(self.kind, self.kind)

    @property
    def pep425_tag(self):
        """ PEP425-compliant python tag string. """
        return str(self)

    def __str__(self):
        return "{0.abbreviated_implementation}{0.major}{0.minor}".format(self)


def _abbreviated_implementation():
    """Return abbreviated implementation name."""
    if sys.platform.startswith('java'):
        pyimpl = 'jy'
    elif sys.platform == 'cli':
        pyimpl = 'ip'
    elif hasattr(sys, 'pypy_version_info'):
        pyimpl = 'pp'
    else:
        pyimpl = 'cp'
    return pyimpl


def _implementation_version():
    """Return implementation version."""
    return ''.join(map(str, sys.version_info[:2]))
