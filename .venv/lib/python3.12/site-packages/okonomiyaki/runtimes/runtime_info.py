import abc

from attr import asdict, attr, attributes
from attr.validators import instance_of

from .common import _platform_string
from .runtime_metadata import JuliaRuntimeMetadataV1, PythonRuntimeMetadataV1
from okonomiyaki.errors import UnsupportedMetadata
from okonomiyaki.platforms import Platform
from okonomiyaki.utils import substitute_variable, substitute_variables
from okonomiyaki.versions import MetadataVersion, RuntimeVersion


@attributes
class IRuntimeInfo(metaclass=abc.ABCMeta):
    """ The metadata of a runtime package (i.e. the actual zipfile containing
    the runtime code).
    """
    metadata_version = attr(validator=instance_of(MetadataVersion))

    @classmethod
    def factory_from_metadata(cls, metadata, prefix, name):
        """ Creates a runtime info object of the appropriate class.

        The class is selected dynamically from the given metadata.
        """
        return runtime_info_from_metadata(metadata, prefix, name)

    @classmethod
    def factory_from_json_dict(cls, json_dict):
        """ Creates a runtime info object of the appropriate class.

        The class is selected dynamically from the given json dict.
        """
        return runtime_info_from_json(json_dict)

    @abc.abstractmethod
    def to_json_dict(self):
        """ Returns a json dict that can easily be serialized back into a
        file or buffer.
        """


@attributes
class IRuntimeInfoV1(IRuntimeInfo):
    # Note: the attributes in IRuntimeInfoV1 need to be synchronized with
    # IRuntimeMetadataV1
    implementation = attr(validator=instance_of(str))
    "The implementation (e.g. 'cpython')"

    version = attr(validator=instance_of(RuntimeVersion))
    """The implementation version, e.g. pypy 2.6.1 would report 2.6.1 as the
    'upstream' part."""

    language_version = attr(validator=instance_of(RuntimeVersion))
    """This is the 'language' version, e.g.  pypy 2.6.1 would report 2.7.10
    here."""

    platform = attr(validator=instance_of(Platform))
    "The platform on which this runtime may run."

    abi = attr(validator=instance_of(str))
    "The ABI of this runtime."

    build_revision = attr(validator=instance_of(str))
    """The internal version. Informative only, has no semantices and my be
    empty."""

    executable = attr(validator=instance_of(str))
    """Executable path. May be a templated variable.
    """

    paths = attr(validator=instance_of(tuple))
    """Directories to add to $PATH to have access to this runtime."""

    post_install = attr(validator=instance_of(tuple))
    """Command to execute as part of post installation."""

    prefix = attr(validator=instance_of(str))
    """ Full path to the installed prefix."""

    name = attr(validator=instance_of(str))

    _metadata_klass = None

    @classmethod
    def _from_json_dict(cls, data):
        metadata = cls._metadata_klass._from_json_dict(data)
        return cls._from_metadata(
            metadata, data["prefix"], data["name"]
        )

    @classmethod
    def _from_metadata(cls, metadata, prefix, name):
        return cls(*cls._from_metadata_impl(metadata, prefix, name))

    @classmethod
    def _from_metadata_impl(cls, metadata, prefix, name):
        implementation = metadata.implementation
        version = metadata.version
        language_version = metadata.language_version
        platform = metadata.platform
        abi = metadata.abi
        build_revision = metadata.build_revision

        variables = _compute_variables(metadata, prefix, name)

        executable = substitute_variable(
            metadata.executable, variables, template='curly_braces_only'
        )

        paths = tuple(
            substitute_variable(path, variables, template='curly_braces_only')
            for path in metadata.paths
        )
        post_install = tuple(
            substitute_variable(part, variables, template='curly_braces_only')
            for part in metadata.post_install
        )

        return (
            MetadataVersion.from_string("1.0"), implementation,
            version, language_version, platform, abi, build_revision,
            executable, paths, post_install, prefix, name
        )

    def to_json_dict(self):
        data_dict = asdict(self)
        for k in ("version", "metadata_version", "language_version"):
            data_dict[k] = str(data_dict[k])
        data_dict["platform"] = _platform_string(self.platform)

        return data_dict


class JuliaRuntimeInfoV1(IRuntimeInfoV1):
    """ Class representing the metadata of an installed julia runtime.
    """
    _metadata_klass = JuliaRuntimeMetadataV1


@attributes
class PythonRuntimeInfoV1(IRuntimeInfoV1):
    """ Class representing the metadata of an installed python runtime.
    """
    scriptsdir = attr(validator=instance_of(str))
    site_packages = attr(validator=instance_of(str))
    python_tag = attr(validator=instance_of(str))

    _metadata_klass = PythonRuntimeMetadataV1

    @classmethod
    def _from_metadata_impl(cls, metadata, prefix, name):
        args = super(PythonRuntimeInfoV1, cls)._from_metadata_impl(
            metadata, prefix, name
        )
        variables = _compute_variables(metadata, prefix, name)
        scriptsdir = substitute_variable(
            metadata.scriptsdir, variables, template='curly_braces_only'
        )
        site_packages = substitute_variable(
            metadata.site_packages, variables, template='curly_braces_only'
        )
        python_tag = substitute_variable(
            metadata.python_tag, variables, template='curly_braces_only'
        )

        return args + (scriptsdir, site_packages, python_tag)


_RUNTIME_INFO_JSON_FACTORY = {
    (MetadataVersion.from_string("1.0"), "pypy"): PythonRuntimeInfoV1,
    (MetadataVersion.from_string("1.0"), "cpython"): PythonRuntimeInfoV1,
    (MetadataVersion.from_string("1.0"), "julia"): JuliaRuntimeInfoV1,
}


def runtime_info_from_json(json_data):
    """ Create a runtime info instance from its json serialized state.
    """
    metadata_version = MetadataVersion.from_string(
        json_data["metadata_version"]
    )
    implementation = json_data["implementation"]
    key = (metadata_version, implementation)
    klass = _RUNTIME_INFO_JSON_FACTORY.get(key)
    if klass is None:
        msg = "Combination {0!r} is not supported".format(key)
        raise UnsupportedMetadata(metadata_version, msg)
    else:
        return klass._from_json_dict(json_data)


_RUNTIME_INFO_FACTORY = {}
for klass in (JuliaRuntimeInfoV1, PythonRuntimeInfoV1):
    _RUNTIME_INFO_FACTORY[klass._metadata_klass] = klass


def runtime_info_from_metadata(metadata, prefix, name):
    """ Create a runtime info instance from a runtime metadata instance, an
    (install) prefix and a runtime name.
    """
    klass = _RUNTIME_INFO_FACTORY.get(type(metadata))
    assert klass is not None
    return klass._from_metadata(metadata, prefix, name)


def _compute_variables(metadata, prefix, name):
    data = dict(
        (k.name, getattr(metadata, k.name)) for k in metadata.__attrs_attrs__)

    variables = dict(
        (k, v) for k, v in data.items() if isinstance(v, str))
    variables["prefix"] = prefix
    variables["name"] = name

    return substitute_variables(
        variables, variables, template='curly_braces_only')
