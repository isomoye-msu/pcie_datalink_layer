import abc

import six


def pkg_id_to_version(pool, package_id):
    return pool.id_to_package(package_id).version


class IPolicy(six.with_metaclass(abc.ABCMeta)):

    def __init__(self, *args):
        pass

    @abc.abstractmethod
    def add_requirements(self, package_ids):
        """ Submit packages to the policy for consideration.
        """

    @abc.abstractmethod
    def get_next_package_id(self, assignments, clauses):
        """ Returns a undecided variable (i.e. integer > 0) for the given sets
        of assignments and clauses.

        Parameters
        ----------
        assignments : AssignmentSet
            The current assignments of each literal. Keys are variables
            (integer > 0) and values are one of (True, False, None).
        clauses : List of Clause
            The collection of Clause objects to satisfy.
        """


class DefaultPolicy(IPolicy):

    def add_requirements(self, assignments):
        pass

    def get_next_package_id(self, assignments, *_):
        # Given a dictionary of partial assignments, get an undecided variable
        # to be decided next.
        undecided = (
            package_id for package_id, status in six.iteritems(assignments)
            if status is None
        )
        return next(undecided)
