import io
import os.path
import shutil
import tempfile
import unittest

from .. import compute_sha256


class TestSha256(unittest.TestCase):
    def setUp(self):
        self.tempdir = tempfile.mkdtemp()

    def tearDown(self):
        shutil.rmtree(self.tempdir)

    def test_from_data(self):
        # Given
        data = b"asd" * 2 ** 16
        r_checksum = ("c0e8746b8586a3017f758e33e203fc6ccc2414584df216f49ce89a"
                      "58fdb0f257")

        # When
        checksum = compute_sha256(io.BytesIO(data))

        # Then
        self.assertEqual(checksum, r_checksum)

    def test_from_file(self):
        # Given
        data = b"asd" * 2 ** 16
        path = os.path.join(self.tempdir, "foo.bin")

        with open(path, "wb") as fp:
            fp.write(data)

        r_checksum = ("c0e8746b8586a3017f758e33e203fc6ccc2414584df216f49ce89a"
                      "58fdb0f257")

        # When
        checksum = compute_sha256(path)

        # Then
        self.assertEqual(checksum, r_checksum)
