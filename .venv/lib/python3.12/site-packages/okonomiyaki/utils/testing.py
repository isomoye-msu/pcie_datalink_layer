from okonomiyaki.errors import OkonomiyakiError


class Patcher(object):
    """ A dumb class to allow a mock.patch object to be used as a decorator and
    a context manager

    Typical usage::

        from unittest import mock
        import sys

        my_mock = Patcher(mock.patch("sys.platform", "win32"))

        @my_mock
        def func1():
            print(sys.platform)

        def func2():
            with my_mock:
                print(sys.platform)
    """
    def __init__(self, patcher):
        self._patcher = patcher

    def __call__(self, func):
        return self._patcher(func)

    def __enter__(self):
        return self._patcher.__enter__()

    def __exit__(self, *a, **kw):
        return self._patcher.__exit__(*a, **kw)


class MultiPatcher(object):
    """ Like Patcher, but applies a list of patchers.
    """
    def __init__(self, patchers):
        self._patchers = patchers

    def __call__(self, func):
        ret = func
        for patcher in self._patchers:
            ret = patcher(ret)
        return ret

    def __enter__(self):
        return [patcher.__enter__() for patcher in self._patchers]

    def __exit__(self, *a, **kw):
        for patcher in self._patchers:
            patcher.__exit__(*a, **kw)


def known_system():
    from okonomiyaki.platforms import Arch
    from okonomiyaki.platforms._platform import (
        _guess_os_kind, _guess_platform_details)
    try:
        Arch.from_running_system()
        os_kind = _guess_os_kind()
        _guess_platform_details(os_kind)
    except OkonomiyakiError:
        return False
    else:
        return True
