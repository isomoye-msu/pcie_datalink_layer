# flake8: noqa
_JULIA_V1 = {
    "$schema": "http://json-schema.org/draft-04/schema#",
    "title": "PythonRuntimeMetadata v1.0",
    "description": "PythonRuntimeMetadata runtime/metadata.json schema.",
    "type": "object",
    "properties": {
        "metadata_version": {
            "description": "The metadata version.",
            "type": "string"
        },
        "implementation": {
            "description": "The implementation (e.g. cpython)",
            "type": "string"
        },
        "version": {
            "description": "The implementation version, e.g.  pypy 2.6.1 would report 2.6.1 as the 'upstream' part.",
            "type": "string"
        },
        "abi": {
            "description": "The runtime's ABI, e.g. 'msvc2008' or 'gnu'.",
            "type": "string"
        },
        "language_version": {
            "description": "This is the 'language' version, e.g.  pypy 2.6.1 would report 2.7.10 here.",
            "type": "string"
        },
        "platform": {
            "description": ("The platform string (as can be parsed by"
                            "EPDPlatform.from_epd_string"),
            "type": "string"
        },
        "build_revision": {
            "description": "Build revision (internal only).",
            "type": "string",
        },
        "executable": {
            "description": "The full path to the actual runtime executable.",
            "type": "string",
        },
        "paths": {
            "description": "The list of path to have access to this runtime.",
            "type": "array",
            "items": {"type": "string"},
        },
        "post_install": {
            "description": ("The command (as a list) to execute after "
                            "installation."),
            "type": "array",
            "items": {"type": "string"},
        },
    },
    "required": [
        "metadata_version",
        "implementation",
        "version",
        "abi",
        "language_version",
        "platform",
        "build_revision",
        "executable",
        "paths",
        "post_install",
    ]
}

_PYTHON_V1 = {
    "$schema": "http://json-schema.org/draft-04/schema#",
    "title": "PythonRuntimeMetadata v1.0",
    "description": "PythonRuntimeMetadata runtime/metadata.json schema.",
    "type": "object",
    "properties": {
        "metadata_version": {
            "description": "The metadata version.",
            "type": "string"
        },
        "implementation": {
            "description": "The implementation (e.g. cpython)",
            "type": "string"
        },
        "version": {
            "description": "The implementation version, e.g.  pypy 2.6.1 would report 2.6.1 as the 'upstream' part.",
            "type": "string"
        },
        "abi": {
            "description": "The runtime's ABI, e.g. 'msvc2008' or 'gnu'.",
            "type": "string"
        },
        "language_version": {
            "description": "This is the 'language' version, e.g.  pypy 2.6.1 would report 2.7.10 here.",
            "type": "string"
        },
        "platform": {
            "description": ("The platform string (as can be parsed by"
                            "EPDPlatform.from_epd_string"),
            "type": "string"
        },
        "build_revision": {
            "description": "Build revision (internal only).",
            "type": "string",
        },
        "executable": {
            "description": "The full path to the actual runtime executable.",
            "type": "string",
        },
        "paths": {
            "description": "The list of path to have access to this runtime.",
            "type": "array",
            "items": {"type": "string"},
        },
        "post_install": {
            "description": ("The command (as a list) to execute after "
                            "installation."),
            "type": "array",
            "items": {"type": "string"},
        },
        "scriptsdir": {
            "description": "Full path to scripts directory.",
            "type": "string",
        },
        "site_packages": {
            "description": "The full path to the python site packages.",
            "type": "string",
        },
        "python_tag": {
            "description": "The python tag, as defined in PEP 425.",
            "type": "string",
        },
    },
    "required": [
        "metadata_version",
        "implementation",
        "version",
        "abi",
        "language_version",
        "platform",
        "build_revision",
        "executable",
        "paths",
        "post_install",
        "scriptsdir",
        "site_packages",
        "python_tag",
    ]
}
