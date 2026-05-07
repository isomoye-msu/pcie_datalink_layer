import argparse
import sys

import zipfile2

from okonomiyaki.file_formats import EggMetadata
from okonomiyaki.versions import MetadataVersion


def _metadata_from_path(path, sha256):
    if sha256 is None:
        return EggMetadata.from_egg(path)
    else:
        return EggMetadata._from_egg(path, sha256)


def pkg_info(ns):
    metadata = _metadata_from_path(ns.path, ns.sha256)

    if metadata.pkg_info is None:
        print("No PKG-INFO")
        sys.exit(-1)
    else:
        print(metadata.pkg_info.to_string().rstrip())


def spec_depend(ns):
    metadata = _metadata_from_path(ns.path, ns.sha256)

    if ns.metadata_version is not None:
        metadata.metadata_version = MetadataVersion.from_string(
            ns.metadata_version
        )
    print(metadata.spec_depend_string.rstrip())


def show_index(ns):
    with zipfile2.ZipFile(ns.path) as zp:
        entries = sorted(zp.namelist())

    for entry in entries:
        print(entry)


def summary(ns):
    metadata = _metadata_from_path(ns.path, ns.sha256)
    print(metadata.summary.rstrip())


def main(argv=None):
    argv = argv or sys.argv[1:]

    p = argparse.ArgumentParser(
        description="description: query Enthought egg metadata."
    )
    subparsers = p.add_subparsers()

    spec_depend_p = subparsers.add_parser(
        "spec-depend",
        help="Show spec/depend metadata"
    )
    spec_depend_p.add_argument("path")
    spec_depend_p.add_argument(
        "--metadata-version",
        help="If given, the metadata version to use to output the spec/depend"
    )
    spec_depend_p.add_argument(
        "--sha256",
        help="Inject the given sha256 instead of calculating it from the "
             "given egg"
    )
    spec_depend_p.set_defaults(func=spec_depend)

    pkg_info_p = subparsers.add_parser(
        "pkg-info",
        help="Show PKG-INFO metadata"
    )
    pkg_info_p.add_argument("path")
    pkg_info_p.add_argument(
        "--sha256",
        help="Inject the given sha256 instead of calculating it from the "
             "given egg"
    )
    pkg_info_p.set_defaults(func=pkg_info)

    summary_p = subparsers.add_parser(
        "summary", help="Show spec/summary"
    )
    summary_p.add_argument("path")
    summary_p.add_argument(
        "--sha256",
        help="Inject the given sha256 instead of calculating it from the "
             "given egg"
    )
    summary_p.set_defaults(func=summary)

    index_p = subparsers.add_parser(
        "show-index", help="Show the egg content"
    )
    index_p.add_argument("path")
    index_p.add_argument(
        "--sha256",
        help="Inject the given sha256 instead of calculating it from the "
             "given egg"
    )
    index_p.set_defaults(func=show_index)

    ns = p.parse_args(argv)
    if hasattr(ns, 'func'):
        ns.func(ns)
    else:
        p.print_help()
