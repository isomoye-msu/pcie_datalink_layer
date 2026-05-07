"""
Useful code to compare solver behaviour with PHP's Composer. Obviously
don't use this in enstaller itself.
"""
import collections
import json

from ..constraints import InstallRequirement
from ..constraints.kinds import (
    Any, EnpkgUpstreamMatch, Equal, GEQ, GT, LEQ, LT
)
from ..request import JobType

# We ignore alpha/rc/etc... as composer does not allow to combine those with
# patch versions, which we use to emulate build numbers.
_TO_NORMALIZE = {
    "1.0a3": "1.0.0",
    "1.0b1": "1.0.0",
    "2010o": "2010.15.0.0",
    "2011n": "2011.14.0.0",
    "2011g": "2011.7.0.0",
    "0.14.1rc1": "0.14.1.0",
    "0.11rc1": "0.11.0.0",
    "0.9.0rc2": "0.9.0",
    "2.3b1.dev4669": "2.3.0",
    "1.2.dev213": "1.2.0",
    "0.4.2.dev2": "0.4.2",
}


JOB_KIND_TO_PHP_METHOD = {
    JobType.install: "install",
    JobType.remove: "remove",
}


def repository_to_composer_json_dict(repository):
    """ Generator of composer-compatible dict representation of an enstaller
    Repository's entries.

    Assuming the string returned by this function is written into the file
    'repository.json' file, you can load it as follows w/ Composer::

        $json_string = file_get_contents("remote.json");
        $packages = JsonFile::parseJson($json_string);

        $repository = new ArrayRepository();
        $loader = new ArrayLoader();

        foreach ($packages as $packageData) {
            $package = $loader->load($packageData):
            $repository.addPackage($package);
        }

    Parameters
    ----------
    repository : Repository
        The repository to convert
    """
    for package in repository:
        version_normalized = _normalize_php_version(package.version)
        requires = [InstallRequirement.from_constraints(p) for
                    p in package.install_requires]
        yield {
            "name": package.name,
            "version": _fix_php_version(package.version),
            "version_normalized": version_normalized,
            "require": _requirements_to_php_dict(requires),
        }


def request_to_php_parts(request):
    parts = []
    for job in request.jobs:
        name, php_constraints = _requirement_to_php_constraints(
            job.requirement
        )
        parts.append((JOB_KIND_TO_PHP_METHOD[job.kind], name, php_constraints))
    return parts


def scenario_to_php_template_variables(scenario, remote_definition,
                                       installed_definition):

    remote_repository = scenario.remote_repositories[0]
    with open(remote_definition, "wt") as fp:
        entries_iterator = repository_to_composer_json_dict(remote_repository)
        fp.write(json.dumps(list(entries_iterator), indent=4))

    installed_repository = scenario.installed_repository
    with open(installed_definition, "wt") as fp:
        entries_iterator = repository_to_composer_json_dict(
            installed_repository)
        fp.write(json.dumps(list(entries_iterator), indent=4))

    return {"remote_definition": remote_definition,
            "installed_definition": installed_definition,
            "request_parts": request_to_php_parts(scenario.request)}


def _fix_php_version(version):
    """ 'Normalize' an EnpkgVersion to a valid composer version
    string.
    """
    return str(version)


def _normalize_php_version(version):
    """ 'Normalize' an EnpkgVersion to a valid normalized composer version
    string.
    """
    upstream = str(version.upstream)
    upstream = _TO_NORMALIZE.get(upstream, upstream)
    while upstream.count(".") < 3:
        upstream += ".0"
    return "{0}-patch{1}".format(upstream, version.build)


def _normalize_php_version_constraint(version):
    """ 'Normalize' an EnpkgVersion to a valid normalized composer version
    string when used in constraints.
    """
    upstream = str(version.upstream)
    upstream = _TO_NORMALIZE.get(upstream, upstream)
    while upstream.count(".") < 3:
        upstream += ".0"

    if version.build == 0:
        return upstream
    else:
        return "{0}-patch{1}".format(upstream, version.build)


def _requirement_to_php_constraints(requirement):
    constraint_to_string = {
        GEQ: ">=",
        GT: ">",
        LEQ: "<=",
        LT: "<",
    }
    constraint_types = tuple(constraint_to_string.keys())
    parts = []
    for constraint in requirement._constraints._constraints:
        if isinstance(constraint, constraint_types):
            constraint_string = constraint_to_string[constraint.__class__]
            version = _normalize_php_version_constraint(constraint.version)
            parts.append(" ".join((constraint_string, version)))
        elif isinstance(constraint, Any):
            parts.append("*")
        else:
            raise ValueError("Unsupported constraint: %s" % constraint)

    return requirement.name, ", ".join(parts)


def _requirement_to_php_string(requirement):
    """ Convert an enstaller requirement into a composer constraint string.
    """
    parts = []
    for constraint in requirement._constraints._constraints:
        if isinstance(constraint, EnpkgUpstreamMatch):
            normalized = _normalize_php_version_constraint(constraint.version)
            parts.append("~{0}".format(normalized))
        elif isinstance(constraint, Any):
            parts.append("*")
        elif isinstance(constraint, Equal):
            normalized = _normalize_php_version_constraint(constraint.version)
            parts.append("{0}".format(normalized))
        else:
            raise NotImplementedError(constraint)
    return ", ".join(parts)


def _requirements_to_php_dict(requirements):
    """ Convert a list of requirements into a mapping
    name -> composer_requirement_string

    Parameters
    ----------
    requirements : seq
        Iterable of Requirement instances.
    """
    php_dict = collections.defaultdict(list)
    for requirement in requirements:
        php_dict[requirement.name].append(
            _requirement_to_php_string(requirement))

    return dict((k, ", ".join(v)) for k, v in php_dict.items())
