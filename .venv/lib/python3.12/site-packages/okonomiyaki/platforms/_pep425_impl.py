_PEP425_IMPL = '''\
from __future__ import absolute_import, print_function

import sys
import sysconfig
import subprocess


def get_config_var(var):
    try:
        return sysconfig.get_config_var(var)
    except IOError:
        return None


def get_impl_ver():
    """Return implementation version."""
    impl_ver = get_config_var("py_version_nodot")
    if not impl_ver or get_abbr_impl() == 'pp':
        impl_ver = ''.join(map(str, get_impl_version_info()))
    return impl_ver


def get_impl_version_info():
    """Return sys.version_info-like tuple for use in decrementing the minor
    version."""
    if get_abbr_impl() == 'pp':
        # as per https://github.com/pypa/pip/issues/2882
        return (sys.version_info[0], sys.pypy_version_info.major,
                sys.pypy_version_info.minor)
    else:
        return sys.version_info[0], sys.version_info[1]


def get_impl_tag():
    """
    Returns the Tag for this specific implementation.
    """
    return "{0}{1}".format(get_abbr_impl(), get_impl_ver())


def get_abbr_impl():
    """Return abbreviated implementation name."""
    if hasattr(sys, 'pypy_version_info'):
        pyimpl = 'pp'
    elif sys.platform.startswith('java'):
        pyimpl = 'jy'
    elif sys.platform == 'cli':
        pyimpl = 'ip'
    else:
        pyimpl = 'cp'
    return pyimpl


def get_flag(var, fallback, expected=True, warn=True):
    """Use a fallback method for determining SOABI flags if the needed config
    var is unset or unavailable."""
    val = get_config_var(var)
    if val is None:
        return fallback()
    return val == expected


def get_abi_tag():
    """Return the ABI tag based on SOABI (if available) or emulate SOABI
    (CPython 2, PyPy)."""
    soabi = get_config_var('SOABI')
    impl = get_abbr_impl()
    if not soabi and impl in ('cp', 'pp') and hasattr(sys, 'maxunicode'):
        d = ''
        m = ''
        u = ''
        if get_flag('Py_DEBUG',
                    lambda: hasattr(sys, 'gettotalrefcount'),
                    warn=(impl == 'cp')):
            d = 'd'
        if get_flag('WITH_PYMALLOC',
                    lambda: impl == 'cp',
                    warn=(impl == 'cp')):
            if sys.version_info < (3, 8):
                m = 'm'
        if get_flag('Py_UNICODE_SIZE',
                    lambda: sys.maxunicode == 0x10ffff,
                    expected=4,
                    warn=(impl == 'cp' and
                          sys.version_info < (3, 3))) \
                and sys.version_info < (3, 3):
            u = 'u'
        abi = '%s%s%s%s%s' % (impl, get_impl_ver(), d, m, u)
    elif soabi and soabi.startswith('cpython-'):
        abi = 'cp' + soabi.split('-')[1]
    elif soabi:
        abi = soabi.replace('.', '_').replace('-', '_')
    else:
        abi = None
    return abi


def _is_running_32bit():
    return sys.maxsize == 2147483647


def get_platform():
    """Return our platform name 'win32', 'linux_x86_64'"""
    try:
        import distutils.util
    except ImportError:
        import sysconfig
        result = sysconfig.get_platform().replace(".", "_").replace("-", "_")
    else:
        result = distutils.util.get_platform().replace('.', '_').replace('-', '_')
    if _is_running_32bit():
       # 32 bit Python program (running on a 64 bit Linux): pip should only
       # install and run 32 bit compiled extensions in that case.
       if result == "linux_x86_64":
           result = "linux_i686"
       elif result == "linux_aarch64":
           result = "linux_armv71"
    return result


if __name__ == "__main__":
    import argparse

    p = argparse.ArgumentParser()
    p.add_argument("--python-tag", action="store_true")
    p.add_argument("--abi-tag", action="store_true")
    p.add_argument("--platform-tag", action="store_true")
    ns = p.parse_args()

    if ns.abi_tag:
        print(get_abi_tag())
    elif ns.python_tag:
        print(get_impl_tag())
    elif ns.platform_tag:
        print(get_platform())
'''
