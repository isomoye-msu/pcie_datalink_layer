class OkonomiyakiError(Exception):
    pass


class InvalidPackageFormat(OkonomiyakiError):
    pass


class UnsupportedMetadata(InvalidPackageFormat):
    def __init__(self, metadata_version, *a, **kw):
        self.metadata_version = metadata_version
        super(UnsupportedMetadata, self).__init__(*a, **kw)

    def __str__(self):
        if len(self.args) >= 1:
            return self.args[0]
        else:
            return "Unsupported metadata_version: {0!r}".format(
                str(self.metadata_version))


class InvalidEggName(InvalidPackageFormat):
    def __init__(self, egg_name):
        self.egg_name = egg_name
        msg = "Invalid egg name '{0}'".format(egg_name)
        super(InvalidEggName, self).__init__(msg)


class InvalidMetadata(InvalidPackageFormat):
    def __init__(self, message, *a, **kw):
        self.message = message
        super(InvalidMetadata, self).__init__(message, *a, **kw)

    def __str__(self):
        return self.message


class _undefined(object):
    def __repr__(self):
        return '<undefined>'


class InvalidMetadataField(InvalidMetadata):

    undefined = _undefined()

    def __init__(self, name, value, *a, **kw):
        self.name = name
        self.value = value
        if value is InvalidMetadataField.undefined:
            message = "Missing metadata field {0!r}".format(self.name)
        else:
            message = 'Invalid value for metadata field {0!r}: {1!r}'.format(
                name, value)
        super(InvalidMetadataField, self).__init__(message, *a, **kw)


class MissingMetadata(InvalidMetadata):
    pass


class InvalidRequirementString(InvalidPackageFormat):
    def __init__(self, requirement_string, add_msg=None):
        self.requirement_string = requirement_string
        msg = "Invalid requirement string {0!r}".format(requirement_string)
        if add_msg is not None:
            msg += ": {}".format(add_msg)
        super(InvalidRequirementString, self).__init__(msg)


class InvalidRequirementStringHyphen(InvalidRequirementString):
    def __init__(self, requirement_string):
        msg = "Package versions should be separated by whitespace instead of a hyphen."
        super(InvalidRequirementStringHyphen, self).__init__(requirement_string, add_msg=msg)


class InvalidVersion(OkonomiyakiError):
    def __init__(self, version_string, *a, **kw):
        self.version_string = version_string
        super(InvalidVersion, self).__init__(*a, **kw)

    def __str__(self):
        if len(self.args) >= 1:
            return self.args[0]
        else:
            return "Invalid version string format: {0!r}".format(
                str(self.version_string)
            )


class InvalidPEP440Version(InvalidVersion):
    pass


class InvalidEnpkgVersion(InvalidVersion):
    pass


class InvalidMetadataVersion(InvalidVersion):
    pass


class InvalidSemanticVersion(InvalidVersion):
    pass
