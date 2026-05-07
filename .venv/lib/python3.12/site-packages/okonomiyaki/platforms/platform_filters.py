from attr import attr, attributes
from attr.validators import instance_of, optional

from okonomiyaki.errors import OkonomiyakiError

from ._arch import Arch
from .epd_platform import EPDPlatform
from ._platform import OSKind, FamilyKind, NameKind


@attributes
class PlatformLabel(object):
    """
    A platform filter.
    """

    os_kind = attr(validator=optional(instance_of(OSKind)), default=None)
    """
    The most generic OS description
    """

    name_kind = attr(validator=optional(instance_of(NameKind)), default=None)
    """
    The most specific platform description
    """

    family_kind = attr(validator=optional(instance_of(FamilyKind)), default=None)
    """
    The 'kind' of platforms. For example, both debian and ubuntu distributions
    share the same kind, 'debian'.
    """

    arch = attr(validator=optional(instance_of(Arch)), default=None)
    """
    Actual architecture. May be None.
    """

    release = attr(validator=instance_of(str), default="")
    """
    The release string. May be empty
    """

    @classmethod
    def _from_legacy_string(cls, s):
        """ Create a filter from a simple pisi string, e.g. '64', 'win-32' or
        'all'.
        """
        def _epd_name_to_quadruplet(name):
            if name == "rh":
                return (OSKind.linux, NameKind.rhel, FamilyKind.rhel, "")
            else:
                platform = EPDPlatform.from_epd_string(name + "-32").platform
                return (
                    platform.os_kind, platform.name_kind, platform.family_kind,
                    platform.release
                )

        parts = s.split("-")
        if len(parts) == 2:
            name, bits = parts
            arch = Arch._from_bitwidth(bits)
            os, name, family, release = _epd_name_to_quadruplet(name)
            return cls(os, name, family, arch, release)
        elif len(parts) == 1:
            name = parts[0]
            if parts[0] == "all":
                return cls()
            elif parts[0] in ("32", "64"):
                arch = Arch._from_bitwidth(parts[0])
                return cls(arch=arch)
            else:
                arch = None
                os, name, family, release = _epd_name_to_quadruplet(name)
                return cls(os, name, family, arch, release)
        else:
            msg = "Invalid epd string: {0!r}".format(s)
            raise OkonomiyakiError(msg)

    def matches(self, platform):
        """ Returns True if the given platform matches this label."""
        if self.os_kind is not None and platform.os_kind != self.os_kind:
            return False

        if self.family_kind is not None and platform.family_kind != self.family_kind:
            return False

        if self.name_kind is not None and platform.name_kind != self.name_kind:
            return False

        if self.release and platform.release != self.release:
            return False

        if self.arch is not None and platform.arch != self.arch:
            return False

        return True


@attributes
class PlatformLiteral(object):
    label = attr(validator=instance_of(PlatformLabel))
    is_true = attr(validator=instance_of(bool), default=True)


@attributes
class PlatformFilter(object):
    platform_labels = attr(validator=instance_of(list))

    @classmethod
    def from_legacy_string(cls, s):
        """ Create a filter from a legacy pisi string, e.g. `!win'.
        """
        parts = [p.strip() for p in s.split(",")]
        literals = []
        for part in parts:
            if part.startswith("!"):
                label = PlatformLabel._from_legacy_string(part[1:])
                literal = PlatformLiteral(label, False)
            else:
                label = PlatformLabel._from_legacy_string(part)
                literal = PlatformLiteral(label, True)
            literals.append(literal)

        return cls(literals)

    def matches(self, platform):
        for platform_label in self.platform_labels:
            if (
                (platform_label.is_true
                 and not platform_label.label.matches(platform))
                or (not platform_label.is_true
                    and platform_label.label.matches(platform))
            ):
                return False

        return True
