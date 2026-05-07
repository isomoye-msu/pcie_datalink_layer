import enum

from attr import attr, attributes, Factory
from attr.validators import instance_of, optional

from .constraints import Requirement, ConstraintModifiers


@enum.unique
class JobType(enum.Enum):
    install = 1
    remove = 2
    soft_update = 3
    hard_update = 4
    upgrade = 5


@attributes
class _Job(object):
    requirement = attr(validator=optional(instance_of(Requirement)))
    kind = attr(validator=instance_of(JobType))

    def __attrs_post_init__(self):
        if self.requirement is None and self.kind != JobType.upgrade:
            raise ValueError(
                u"_Job requirement cannot be none if kind != {}".format(
                    JobType.upgrade
                )
            )

    def __str__(self):
        return u"{} {}".format(self.kind.name, self.requirement)


@attributes
class Request(object):
    """
    A proposed change to the state of the installed repository.

    The Request is built up from :class:`Requirement` objects and
    ad-hoc package constraint modifiers.

    Parameters
    ----------
    modifiers : ConstraintModifiers, optional
        The contraint modifiers are used to relax constraints when deciding
        on which packages meet a requirement.


    >>> from simplesat.request import Request
    >>> from simplesat.constraints import Requirement
    >>> request = Request()
    >>> recent_mkl = Requirement.from_string('MKL >= 11.0')
    >>> request.install(recent_mkl)
    >>> request.jobs
    [_Job(requirement=Requirement('MKL >= 11.0-0'), kind=<JobType.install: 1>)]
    >>> request.modifiers
    ConstraintModifiers(allow_newer=set(), allow_any=set(), allow_older=set())
    >>> request.allow_newer('MKL')
    >>> request.modifiers.asdict()
    {'allow_older': [], 'allow_any': ['MKL'], 'allow_newer': []}
    """

    modifiers = attr(default=Factory(ConstraintModifiers),
                     validator=instance_of(ConstraintModifiers))
    jobs = attr(default=Factory(list))

    def install(self, requirement):
        self._add_job(requirement, JobType.install)

    def remove(self, requirement):
        self._add_job(requirement, JobType.remove)

    def upgrade(self):
        self._add_job(None, JobType.upgrade)

    def hard_update(self, requirement):
        self._add_job(requirement, JobType.hard_update)

    def soft_update(self, requirement):
        self._add_job(requirement, JobType.soft_update)

    def allow_newer(self, package_name):
        self.modifiers.allow_newer.add(package_name)

    def allow_any(self, package_name):
        self.modifiers.allow_any.add(package_name)

    def allow_older(self, package_name):
        self.modifiers.allow_older.add(package_name)

    def _add_job(self, requirement, job_type):
        if len(self.jobs) > 0:
            if (
                    any(job.kind == JobType.upgrade for job in self.jobs)
                    or job_type is JobType.upgrade
            ):
                raise ValueError(
                    u"Requests with upgrade job can only have one job")
        self.jobs.append(_Job(requirement, job_type))
