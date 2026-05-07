from collections import OrderedDict

from attr import attr, attributes

from .constraints import InstallRequirement
from simplesat.utils.graph import toposort, package_lit_dependency_graph


@attributes
class Operation(object):
    package = attr()


@attributes
class UpdateOperation(Operation):
    source = attr()


@attributes
class InstallOperation(Operation):
    pass


@attributes
class RemoveOperation(Operation):
    pass


class Transaction(object):

    def __init__(self, pool, decisions, installed_package_ids):
        self._pool = pool
        self._local_packages = {
            self._package_key(package_id): package_id
            for package_id in installed_package_ids
        }
        self.operations = self._safe_operations(
            decisions, installed_package_ids)
        self.pretty_operations = self._as_pretty_operations(self.operations)

    def __iter__(self):
        return iter(self.operations)

    def __str__(self):
        return self.to_string(self.operations)

    def _package_key(self, package_id):
        package = self._pool.id_to_package(package_id)
        return (package.name, package.version)

    @staticmethod
    def to_string(operations):
        lines = []
        for operation in operations:
            if isinstance(operation, InstallOperation):
                lines.append("Installing:\n\t{}".format(operation.package))
            elif isinstance(operation, UpdateOperation):
                lines.append(
                    "Updating:\n\t{}\n\t{}".format(operation.source,
                                                   operation.package)
                )
            elif isinstance(operation, RemoveOperation):
                lines.append("Removing\n\t{}".format(operation.package))
            else:
                msg = "Unknown operation: {!r}".format(operation)
                raise ValueError(msg)

        return "\n".join(lines)

    def to_simple_string(self):
        S = "{0.name} ({0.version})".format
        lines = []
        for operation in self.operations:
            if isinstance(operation, InstallOperation):
                lines.append("Installing {}".format(S(operation.package)))
            elif isinstance(operation, UpdateOperation):
                lines.append(
                    "Updating {} to {}".format(S(operation.source),
                                               S(operation.package))
                )
            elif isinstance(operation, RemoveOperation):
                lines.append("Removing {}".format(S(operation.package)))
            else:
                msg = "Unknown operation: {!r}".format(operation)
                raise ValueError(msg)

        return "\n".join(lines)

    def _as_pretty_operations(self, operations):
        pkg_to_ops = OrderedDict((op.package, [op]) for op in operations)

        for pkg in reversed(tuple(pkg_to_ops.keys())):
            if pkg in pkg_to_ops:
                for update in self._find_other_providers(pkg):
                    pkg_to_ops[pkg] += pkg_to_ops.pop(update, [])

        combine = self._merge_operations
        return [combine(ops) for ops in pkg_to_ops.values()]

    def _merge_operations(self, ops):
        if len(ops) == 1:
            return ops[0]
        rank = (InstallOperation, RemoveOperation)
        first, second = sorted(ops, key=lambda o: rank.index(o.__class__))
        return UpdateOperation(first.package, second.package)

    def _key_to_pretty_string(self, package_id):
        if package_id > 0:
            return '{0}-{1}'.format(*self._package_key(package_id))
        else:
            return '-({0}-{1})'.format(
                *self._package_key(abs(package_id)))

    def _safe_operations(self, decisions, installed_package_ids):
        graph = package_lit_dependency_graph(self._pool, decisions,
                                             closed=True)
        removals = []
        installs = []
        # This builds from the bottom (no dependencies) up
        for group in toposort(graph, self._key_to_pretty_string):
            # Sort the set of independent packages for determinism
            for package_id in sorted(group, key=abs):
                assert package_id in decisions
                if package_id < 0 and -package_id in installed_package_ids:
                    removals.append(-package_id)
                elif (package_id > 0 and
                      package_id not in installed_package_ids):
                    installs.append(package_id)

        install_operations = []
        remove_operations = []

        # Installations should happen bottom up
        for package_id in installs:
            # The solver may suggest removing a currently installed package and
            # installing another version of that same package from a different
            # repo. Filter out operations which would install the same version
            # of a currently installed package and discard the associated
            # remove operation.
            key = self._package_key(package_id)
            preferred_id = self._local_packages.get(key, package_id)

            if preferred_id != package_id:
                # Because we are not installing the remote package, do not
                # remove original version
                if preferred_id in removals:
                    removals.remove(preferred_id)
            else:
                package = self._pool.id_to_package(package_id)
                install_operations.append(InstallOperation(package))

        # Removals should happen top down
        for package_id in reversed(removals):
            package = self._pool.id_to_package(package_id)
            remove_operations.append(RemoveOperation(package))

        return remove_operations + install_operations

    def _find_other_providers(self, package):
        # NOTE: this assumes that the name of the package is also the name of
        # the thing that is being provided. This is not always true. Consider
        # that apache2 and nginx can both provide "webserver", etc.
        requirement = InstallRequirement._from_string(package.name)
        return [
            p for p in self._pool.what_provides(requirement) if p != package
        ]
