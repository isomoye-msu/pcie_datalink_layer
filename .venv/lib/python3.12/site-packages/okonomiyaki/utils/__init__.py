import hashlib

from .misc import (
    parse_assignments, substitute_variable, substitute_variables, tempdir,
    decode_if_needed, encode_if_needed)


def compute_md5(path):
    """Compute the md5 checksum of the given path.

    Avoids reading the whole file in RAM, and computes the md5 in chunks.

    Parameters
    ----------
    path: str or file object
        If a string, assumed to be the path to the file to be checksumed. If a
        file object, checksum will start at the current file position.
    """
    return _compute_hash(path, hashlib.md5())


def compute_sha256(path):
    """Compute the sha256 checksum of the given path.

    Avoids reading the whole file in RAM, and computes the sha256 in chunks.

    Parameters
    ----------
    path: str or file object
        If a string, assumed to be the path to the file to be checksumed. If a
        file object, checksum will start at the current file position.
    """
    return _compute_hash(path, hashlib.sha256())


def _compute_hash(path, m):
    block_size = 256 * 1024

    def _compute_checksum(fp):
        while True:
            data = fp.read(block_size)
            m.update(data)
            if len(data) < block_size:
                break
        return m.hexdigest()

    if isinstance(path, str):
        with open(path, "rb") as fp:
            return _compute_checksum(fp)
    else:
        return _compute_checksum(path)


__all__ = [
    "compute_md5", "decode_if_needed", "encode_if_needed", "parse_assignments",
    "substitute_variable", "substitute_variables", "tempdir"
]
