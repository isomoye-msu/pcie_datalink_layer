import os
import os.path
import re
import shutil
import tempfile
import time
import zipfile

import zipfile2

from ._egg_info import (
    _SPEC_DEPEND_LOCATION, _SPEC_SUMMARY_LOCATION
)
from ._package_info import _PKG_INFO_LOCATION


class _EggBuilderNoPkgInfo(object):
    def __init__(self, egg_metadata, compress=True, cwd=None):
        self.cwd = cwd or os.getcwd()

        if compress is True:
            flag = zipfile.ZIP_DEFLATED
        else:
            flag = zipfile.ZIP_STORED

        self._egg_metadata = egg_metadata
        self._fp = zipfile2.ZipFile(self.path, "w", flag)

        # Write those now so that they are at the beginning of the file.
        self._write_metadata()

    def _write_metadata(self):
        self._write_spec_summary()
        self._write_spec_depend()

    @property
    def path(self):
        return os.path.join(self.cwd, self._egg_metadata.egg_name)

    def close(self):
        self._fp.close()

    def __enter__(self):
        return self

    def __exit__(self, *a, **kw):
        self.commit()

    def add_iterator(self, iterator):
        """
        Add the files specified by the given iterator.

        Parameters
        ----------
        iterator: iterator
            An iterator yielding (path, arcname) pairs.
        """
        for path, arcname in iterator:
            self._fp.write(path, arcname)

    def add_file(self, path, archive_prefix=""):
        """ Add the given file to the egg, under the given archive prefix."""
        arcname = os.path.join(archive_prefix, os.path.basename(path))
        self._fp.write(path, arcname)

    def add_file_as(self, path, archive_name):
        """ Add the given file to the egg, under the given archive name."""
        self._fp.write(path, archive_name)

    def add_data(self, data, archive_name, chmod=0o644):
        """ Write the given data as the given archive name."""
        if archive_name[-1] == "/":
            raise ValueError(
                "Invalid member name for data: '{}'".format(archive_name)
            )

        zinfo = zipfile.ZipInfo(
            filename=archive_name,
            date_time=time.localtime(time.time())[:6]
        )
        zinfo.compress_type = self._fp.compression
        zinfo.external_attr = chmod << 16
        self._fp.writestr(zinfo, data)

    def add_tree(self, directory, archive_prefix=""):
        """
        Add the given directory to the egg, under the given archive_prefix.

        Parameters
        ----------
        directory: path
            A path to a directory. Every file in this directory will be
            included, recursively.
        """
        for root, dirs, files in os.walk(directory):
            for item in dirs + files:
                path = os.path.join(root, item)
                name = os.path.join(archive_prefix,
                                    os.path.relpath(path, directory))
                self._fp.write(path, name)

    def commit(self):
        """ Commit the metadata, and close the file.
        """
        self.close()

    def _write_spec_depend(self):
        spec_depend_string = self._egg_metadata.spec_depend_string
        self.add_data(
            spec_depend_string.encode("ascii"), _SPEC_DEPEND_LOCATION)

    def _write_spec_summary(self):
        self.add_data(
            self._egg_metadata.summary.encode("utf8"),
            _SPEC_SUMMARY_LOCATION,
        )

    def _write_pkg_info(self):
        data = self._egg_metadata.pkg_info.to_string()
        self.add_data(data.encode("utf8"), _PKG_INFO_LOCATION)


class EggBuilder(_EggBuilderNoPkgInfo):
    """
    Class to build eggs from an install tree. This is mostly useful to
    build Enthought eggs for non-python packages (C/C++ libraries, etc...)
    """
    def __init__(self, egg_metadata, compress=True, cwd=None):
        if egg_metadata.pkg_info is None:
            msg = ("EggBuilder does not accept EggMetadata instances with "
                   "a None pkg_info attribute.")
            raise ValueError(msg)

        super(EggBuilder, self).__init__(egg_metadata, compress, cwd)

    def _write_metadata(self):
        super(EggBuilder, self)._write_metadata()
        self._write_pkg_info()


def _no_rename(f):
    return f


def _accept_anything(f, nameset):
    return True


class DefaultAcceptFilter(object):
    """ A simple filter that excludes a <name>.py[c|o] file if a <name>.so or
    <name>.pyd exists.
    """
    def __init__(self, funcs=None):
        self._r_compiled = re.compile(r'(.+)\.py(c|o)?$')
        self._funcs = funcs or tuple()

    def _filter_py(self, f, nameset):
        m = self._r_compiled.match(f)
        if m:
            so = m.group(1) + ".so"
            pyd = m.group(1) + ".pyd"
            if so in nameset or pyd in nameset:
                return False
            else:
                return True
        else:
            return True

    def __call__(self, arcname, nameset):
        acc = True
        for f in (self._filter_py,) + self._funcs:
            acc = acc and f(arcname, nameset)
        return acc


class EggRewriter(_EggBuilderNoPkgInfo):
    """ Class to create Enthought eggs from existing setuptools eggs.
    """
    def __init__(self, egg_metadata, egg, compress=True, cwd=None,
                 rename=None, accept=None, allow_overwrite=False):
        """ Create a new egg rewriter instance.

        Parameters
        ----------
        egg_metadata: EggMetadata
            The metadata to use to write Enthought metadata
        egg: str
            Path to the egg to start from. The path must be accessible for
            read.
        compress: bool
            Whether to compress the zipfile
        cwd: path
            The directory where to write the generated egg. If not
            specified, defaults to os.getcwd()
        rename: callable
            If defined, a callable of the form (archive_name, ) ->
            new_archive_name, to rename archive members from the original
            egg.
        accept: callable
            If defined, a callable of the form (archive_name, namelist) ->
            bool, returning True for archives to copy from the original
            egg. Namelist is a set of all the archives in the existing egg. By
            default, uses a DefaultFilter instance.
        allow_overwrite: bool
            By default, the egg creation will fail if one adds existing
            archives. If set to True, one can overwrite archive members
            already present in the source egg.

        Note
        ----
        When both rename and accept arguments are used, the filtre applies
        on the archive name *before* the renaming, i.e. on the archive
        name in the original egg.
        """
        super(EggRewriter, self).__init__(egg_metadata, compress, cwd)
        self._egg = egg
        self._rename = rename or _no_rename
        self._accept = accept or DefaultAcceptFilter()

        self._allow_overwrite = allow_overwrite

    def commit(self):
        self._copy_existing_content()
        super(EggRewriter, self).commit()

    def _copy_existing_content(self):
        with zipfile2.ZipFile(self._egg) as source:
            tempdir = tempfile.mkdtemp()
            try:
                nameset = set(source.namelist())
                for f in source.namelist():
                    arcname = self._rename(f)

                    if self._allow_overwrite:
                        if arcname in self._fp._filenames_set:
                            continue

                    if self._accept(f, nameset):
                        source_path = source.extract(f, tempdir)
                        self.add_file_as(source_path, arcname)
            finally:
                shutil.rmtree(tempdir)
