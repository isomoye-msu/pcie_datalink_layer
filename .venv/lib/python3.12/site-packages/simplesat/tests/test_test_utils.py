import os.path
import sys
import textwrap

import attr
import six

from ..constraints import ConflictRequirement, InstallRequirement
from ..package import RepositoryInfo, RepositoryPackageMetadata
from ..request import _Job, JobType
from ..test_utils import Scenario, parse_package_list, repository_factory
from ..utils import mkdtemp

if sys.version_info[0] == 2:
    import unittest2 as unittest
else:
    import unittest


P = RepositoryPackageMetadata._from_pretty_string
CR = ConflictRequirement._from_string
IR = InstallRequirement._from_string


class TestRepositoryFactory(unittest.TestCase):
    def test_simple(self):
        # Given
        package_strings = [
            u"MKL 10.3-1",
            u"numpy 1.8.1-1; depends (MKL ^= 10.3)",
            u"numpy 1.8.1-2; depends (MKL ^= 10.3)",
        ]
        repository_packages = [
            "MKL 10.3-1",
            "numpy 1.8.1-2",
        ]
        repository_info = RepositoryInfo(u"acme/loony")
        r_numpy = P(
            u"numpy 1.8.1-2; depends (MKL ^= 10.3)", repository_info,
        )

        # When
        packages = dict(parse_package_list(package_strings))
        repository = repository_factory(repository_packages, repository_info,
                                        packages)

        # Then
        self.assertEqual(len(repository), 2)
        self.assertEqual(len(repository.find_packages("numpy")), 1)

        numpy = repository.find_packages("numpy")[0]
        self.assertEqual(numpy, r_numpy)


class TestScenario(unittest.TestCase):
    def test_simple(self):
        # Given
        yaml = six.StringIO(textwrap.dedent("""\
        packages:
            - MKL 10.3-1
            - numpy 1.8.1-1; depends (MKL ^= 10.3)
            - numpy 1.8.1-2; depends (MKL ^= 10.3)

        remote:
            - MKL 10.3-1
            - numpy 1.8.1-2

        request:
            - operation: install
              requirement: numpy
        """))
        r_jobs = [_Job(IR("numpy"), JobType.install)]

        # When
        scenario = Scenario.from_yaml(yaml)

        # Then
        self.assertEqual(len(scenario.remote_repositories), 1)
        remote_repository = scenario.remote_repositories[0]
        self.assertEqual(len(remote_repository), 2)

        self.assertEqual(len(scenario.installed_repository), 0)

        jobs = scenario.request.jobs
        self.assertEqual(jobs, r_jobs)

    def test_from_filename(self):
        # Given
        data = textwrap.dedent("""\
        packages:
            - MKL 10.3-1
            - numpy 1.8.1-1; depends (MKL ^= 10.3)
            - numpy 1.8.1-2; depends (MKL ^= 10.3)

        remote:
            - MKL 10.3-1
            - numpy 1.8.1-2

        request:
            - operation: install
              requirement: numpy
        """)
        r_jobs = [_Job(IR("numpy"), JobType.install)]

        # When
        with mkdtemp() as d:
            path = os.path.join(d, "scenario.yaml")
            with open(path, "wt") as fp:
                fp.write(data)
            scenario = Scenario.from_yaml(path)

        # Then
        self.assertEqual(len(scenario.remote_repositories), 1)
        remote_repository = scenario.remote_repositories[0]
        self.assertEqual(len(remote_repository), 2)

        self.assertEqual(len(scenario.installed_repository), 0)

        jobs = scenario.request.jobs
        self.assertEqual(jobs, r_jobs)

    def test_simple_marked(self):
        # Given
        yaml = six.StringIO(textwrap.dedent("""\
        packages:
            - MKL 10.3-1

        remote:
            - MKL 10.3-1

        installed:
            - MKL 10.3-1

        marked:
            - MKL
        """))
        r_jobs = [_Job(IR("MKL"), JobType.install)]

        # When
        scenario = Scenario.from_yaml(yaml)

        # Then
        jobs = scenario.request.jobs
        self.assertEqual(jobs, r_jobs)

    def test_modify_marked(self):
        # Given
        yaml = six.StringIO(textwrap.dedent("""\
        packages:
            - MKL 10.3-1

        remote:
            - MKL 10.3-1

        installed:
            - MKL 10.3-1

        marked:
            - MKL

        request:
            - operation: remove
              requirement: MKL
        """))
        r_jobs = [_Job(CR("MKL"), JobType.remove)]

        # When
        scenario = Scenario.from_yaml(yaml)

        # Then
        jobs = scenario.request.jobs
        self.assertEqual(jobs, r_jobs)

    def test_load_modifiers(self):
        # Given
        yaml = six.StringIO(textwrap.dedent("""\
        packages:
            - MKL 10.3-1

        modifiers:
            allow_newer: [MKL]
            allow_older:
                - numpy
            allow_any:
                - pyzmq
                - pandas

        request:
            - operation: install
              requirement: numpy
        """))
        expected = {
            'allow_newer': set(['MKL']),
            'allow_older': set(['numpy']),
            'allow_any': set(['pyzmq', 'pandas']),
        }

        # When
        scenario = Scenario.from_yaml(yaml)

        # Then
        constraints = attr.asdict(scenario.request.modifiers, recurse=False)
        self.assertEqual(constraints, expected)
