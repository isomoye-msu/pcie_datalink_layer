import os.path
import shutil
import sys
import tempfile
import textwrap
import unittest

import testfixtures

from okonomiyaki.file_formats import EggMetadata, PackageInfo
from okonomiyaki.utils.test_data import NOSE_1_3_4_RH5_X86_64
from okonomiyaki._cli import main


class TestMain(unittest.TestCase):
    maxDiff = None

    def setUp(self):
        self.tempdir = tempfile.mkdtemp()

    def tearDown(self):
        shutil.rmtree(self.tempdir)

    def test_spec_depend(self):
        # Given
        egg = NOSE_1_3_4_RH5_X86_64

        r_output = textwrap.dedent("""\
        metadata_version = '1.3'
        name = 'nose'
        version = '1.3.4'
        build = 1

        arch = 'amd64'
        platform = 'linux2'
        osdist = 'RedHat_5'
        python = '2.7'

        python_tag = 'cp27'
        abi_tag = 'cp27m'
        platform_tag = 'linux_x86_64'

        packages = []
        """)

        # When
        with testfixtures.OutputCapture() as capture:
            main(["spec-depend", egg])

        # Then
        self.assertMultiLineEqual(capture.output.getvalue(), r_output)

    def test_pkg_info(self):
        # Given
        egg = NOSE_1_3_4_RH5_X86_64

        r_output = PackageInfo.from_egg(egg).to_string()

        # When
        with testfixtures.OutputCapture() as capture:
            main(["pkg-info", egg])

        # Then
        self.assertMultiLineEqual(capture.output.getvalue(), r_output)

    def test_summary(self):
        # Given
        egg = NOSE_1_3_4_RH5_X86_64

        r_output = textwrap.dedent("""\
        Extends the Python Unittest module with additional disocvery and running
        options
        """)

        # When
        with testfixtures.OutputCapture() as capture:
            main(["summary", egg])

        # Then
        self.assertMultiLineEqual(capture.output.getvalue(), r_output)

    def test_no_pkg_info(self):
        # Given
        path = os.path.join(
            self.tempdir, os.path.basename(NOSE_1_3_4_RH5_X86_64)
        )
        m = EggMetadata.from_egg(NOSE_1_3_4_RH5_X86_64)
        m._pkg_info = None
        m.dump(path)

        # When/Then
        with testfixtures.OutputCapture() as capture:
            with self.assertRaises(SystemExit) as exc:
                main(["pkg-info", path])
            if sys.version_info < (2, 7):
                code = exc.exception
            else:
                code = exc.exception.code
            self.assertEqual(code, -1)

        capture.compare("No PKG-INFO")
