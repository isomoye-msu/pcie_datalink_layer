import collections
from unittest import mock

from okonomiyaki.utils.testing import MultiPatcher, Patcher

# OS mocking
# XXX: We need to patch platform.uname as well, as that function is cached, and
# the result depend on sys.platform value.
uname_result = collections.namedtuple(
    "uname_result",
    "system node release version machine "
    "processor")
mock_darwin = MultiPatcher([
    mock.patch("sys.platform", "darwin"),
    # These value are there to mask the running system values
    mock.patch(
        "platform.uname",
        lambda: uname_result(
            "Darwin", "localhost", "11.4.2",
            "Darwin Kernel Version 11.4.2 bla bla",
            "x86_64", "i386")),
    mock.patch("platform.mac_ver", lambda: ("11.4.2", ("", "", ""), "x86_64"))])
mock_apple_silicon = MultiPatcher([
    mock.patch("sys.platform", "darwin"),
    # These value are there to mask the running system values
    mock.patch(
        "platform.uname",
        lambda: uname_result(
            "Darwin", "localhost", "22.6.0",
            "Darwin Kernel Version 22.6.0 bla bla",
            "RELEASE_ARM64_BLABLA", "arm64")),
    mock.patch("platform.mac_ver", lambda: ("22.6.0", ("", "", ""), "arm64"))])
mock_linux = MultiPatcher([
    mock.patch("sys.platform", "linux2"),
    # These value are there to mask the running system values
    mock.patch(
        "platform.uname",
        lambda: uname_result(
            "Linux", "localhost", "2.6.19-308.el5",
            "#1 SMP Tue Feb 21 20:06:06 EST 2012",
            "x86_64", "x86_64"))])
mock_solaris = MultiPatcher([
    mock.patch("sys.platform", "sunos5"),
    # These value are there to mask the running system values
    mock.patch(
        "platform.uname",
        lambda: uname_result(
            "Solaris", "localhost", "fake", "fake", "x86_64", "x86_64"))])
mock_windows = MultiPatcher([
    mock.patch("sys.platform", "win32"),
    # These value are there to mask the running system values
    mock.patch(
        "platform.uname",
        lambda: uname_result(
            'Windows', 'localhost', '7', '6.1.7601',
            'x86', ('x86 Family 6 Model 4 5 Stepping 7, GenuineIntel')))])
mock_osx_12_6_arm64 = MultiPatcher([
    mock.patch("sys.platform", "darwin"),
    mock.patch(
        "platform.uname",
        lambda: uname_result(
            "Darwin", "localhost", "12.6.5",
            "Darwin Kernel Version 12.6.5 bla bla",
            "x86_64", "i386")),
    mock.patch("platform.mac_ver", lambda: ("12.6.5", ("", "", ""), "arm64"))])
mock_machine_invalid = MultiPatcher([
    mock.patch("sys.platform", "darwin"),
    mock.patch("platform.machine", lambda: "PyCPU"),
    mock.patch(
        "platform.uname",
        lambda: uname_result(
            "MyOS", "localhost", "12.6.5",
            "Super Kernel Version 3 bla bla",
            "PyCPU", "123"))])


def _mock_linux_distribution(info):
    return MultiPatcher([
        mock_linux,
        mock.patch("distro.linux_distribution", lambda: info[:3]),
        mock.patch("distro.name", lambda: info[0]),
        mock.patch("distro.version", lambda: info[1]),
        mock.patch("distro.like", lambda: info[3])])


mock_centos_3_5 = _mock_linux_distribution(("CentOS", "3.5", "Final", "rhel fedora"))
mock_centos_5_8 = _mock_linux_distribution(("CentOS", "5.8", "Final", "rhel fedora"))
mock_centos_6_3 = _mock_linux_distribution(("CentOS", "6.3", "Final", "rhel fedora"))
mock_centos_7_0 = _mock_linux_distribution(("CentOS", "7.0", "Final", "rhel fedora"))
mock_centos_7_6 = _mock_linux_distribution(("CentOS Linux", "7.6.1810", "Core", "rhel fedora"))
mock_mydistro_2_8 = _mock_linux_distribution(("MyDistro", "2.8", "Final", "rhel fedora"))
mock_rocky_8_8 = _mock_linux_distribution(("Rocky Linux", "8.8", "Green Obsidian", "rhel fedora"))
mock_ubuntu_raring = _mock_linux_distribution(("Ubuntu", "13.04", "raring", "debian"))

mock_windows_7 = MultiPatcher([
    mock.patch("sys.platform", "win32"),
    mock.patch(
        "platform.uname",
        lambda: uname_result(
            'Windows', 'localhost', '7', '6.1.7601',
            'x86', ('x86 Family 6 Model 4 5 Stepping 7, GenuineIntel'))),
    mock.patch("platform.win32_ver",
               lambda: ("7", "6.1.7601", "SP1", "Multiprocessor Free"))
])

mock_windows_10 = MultiPatcher([
    mock.patch("sys.platform", "win32"),
    mock.patch(
        "platform.uname",
        lambda: uname_result(
            'Windows', 'localhost', '10', '120000',
            'x86_64', ('x86 Family 6 Model 4 5 Stepping 7, GenuineIntel'))),
    mock.patch("platform.win32_ver",
               lambda: ('10', '10.0.19041', 'SP0', 'Multiprocessor Free'))
])

mock_windows_11 = MultiPatcher([
    mock.patch("sys.platform", "win32"),
    mock.patch(
        "platform.uname",
        lambda: uname_result(
            'Windows', 'localhost', '11', '120000',
            'x86_64', ('x86 Family 6 Model 4 5 Stepping 7, GenuineIntel'))),
    mock.patch("platform.win32_ver",
               lambda: ('10', '10.0.22621', 'SP0', 'Multiprocessor Free'))
])

mock_osx_10_7 = MultiPatcher([
    mock.patch("sys.platform", "darwin"),
    mock.patch(
        "platform.uname",
        lambda: uname_result(
            "Darwin", "localhost", "10.7.5",
            "Darwin Kernel Version 10.7.5 bla bla",
            "x86_64", "i386")),
    mock.patch("platform.mac_ver", lambda: ("10.7.5", ("", "", ""), "x86_64")),
])

mock_osx_12_6 = MultiPatcher([
    mock.patch("sys.platform", "darwin"),
    mock.patch(
        "platform.uname",
        lambda: uname_result(
            "Darwin", "localhost", "12.6.5",
            "Darwin Kernel Version 12.6.5 bla bla",
            "x86_64", "i386")),
    mock.patch("platform.mac_ver", lambda: ("12.6.5", ("", "", ""), "x86_64")),
])


# Architecture mocking
def mock_machine(machine):
    return Patcher(mock.patch("platform.machine", lambda: machine))


mock_machine_x86 = Patcher(mock_machine("x86"))
mock_architecture_32bit = Patcher(mock.patch("sys.maxsize", 2**32 - 1))
mock_machine_x86_64 = Patcher(mock_machine("x86_64"))
mock_machine_arm64 = Patcher(mock_machine("arm64"))
mock_machine_arm = Patcher(mock_machine("arm"))
mock_architecture_64bit = Patcher(mock.patch("sys.maxsize", 2**64 - 1))
mock_x86 = MultiPatcher([mock_machine_x86, mock_architecture_32bit])
mock_x86_64 = MultiPatcher([mock_machine_x86_64, mock_architecture_64bit])
mock_arm64 = MultiPatcher([mock_machine_arm64, mock_architecture_64bit])
mock_arm = MultiPatcher([mock_machine_arm, mock_architecture_32bit])
mock_machine_armv71 = Patcher(mock_machine("ARMv7"))
# A 32 bits python process on a 64 bits OS
mock_x86_on_x86_64 = MultiPatcher(
    [mock_machine_x86_64, mock_architecture_32bit])
