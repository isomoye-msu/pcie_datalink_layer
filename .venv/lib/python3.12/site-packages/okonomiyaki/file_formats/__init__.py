"""
This sub-package contains the implementation of the various package file
formats we support at Enthought

At the moment, we only support the Enthought's egg format.
"""
# flake8: noqa
from ._egg_info import (
    Dependencies, EggMetadata, Requirement, egg_name, is_egg_name_valid,
    split_egg_name
)
from ._package_info import PackageInfo
from .egg import EggBuilder, EggRewriter
