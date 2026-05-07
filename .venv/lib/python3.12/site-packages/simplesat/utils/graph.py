#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import division, print_function

from collections import defaultdict, deque

import six
import itertools

from simplesat.constraints.requirement import InstallRequirement


def toposort(nodes_to_edges, id2string=None):
    """Return an iterator over topologically sorted groups of nodes.

    Output is a list of sets in
    topological order. The first set consists of items with no dependences,
    each subsequent set consists of items that depend upon items in the
    preceeding sets.


    Parameters
    ----------
    nodes_to_edges : dict from node to set(node)
        A directed graph expressed as a dictionary of edges whose keys are
        nodes and values are all of the nodes on which the key depends.

        For example, if node 1 depends on 2, we have ``{1: {2}, 2: set()}``.
    id2string: function
        A function to convert package id to user frendly strings for the error
        messages.

    Yields
    ------
    set of nodes
        Each yielded set contains nodes which depend only on nodes that have
        already been yielded in a previous set. The first set contains the
        nodes with no outgoing edges.

    Raises
    ------
    ValueError
        If the graph contains cyclic dependencies.


    >>> print '\\n'.join(repr(sorted(x)) for x in toposort2({
        ...     2: set([11]),
        ...     9: set([11,8]),
        ...     10: set([11,3]),
        ...     11: set([7,5]),
        ...     8: set([7,3]),
        ...     }))
    {3, 5, 7}
    {8, 11}
    {2, 9, 10}

    """

    data = {k: v.copy() for k, v in six.iteritems(nodes_to_edges)}

    # Ignore self dependencies.
    for k, v in six.iteritems(data):
        v.discard(k)

    # Find all items that don't depend on anything.
    extra_items_in_deps = set(
        itertools.chain.from_iterable(six.itervalues(data)))
    extra_items_in_deps.difference_update(set(six.iterkeys(data)))

    # Add empty dependences where needed
    data.update({item: set() for item in extra_items_in_deps})

    while True:
        ordered = set(item for item, dep in six.iteritems(data) if not dep)
        if not ordered:
            break
        yield ordered
        data = {item: (dep - ordered)
                for item, dep in six.iteritems(data)
                if item not in ordered}
    if data:
        if id2string is None:
            id2string = repr
        msg = "Cyclic dependencies exist among these items:\n{}"
        cyclic = []
        for key, value in data.items():
            line = id2string(key) + ' -> ' + str([id2string(x) for x in value])
            cyclic.append(line)
        raise ValueError(msg.format('\n'.join(cyclic)))


def package_lit_dependency_graph(pool, package_lits, closed=True):
    """
    Return a dict of nodes to edges, suitable for use with :func:`toposort`.

    Parameters
    ----------
    pool : Pool
        The pool to use when resolving package literals to packages.
    package_lits : iterable of int
        The package literals to build the dependency graph for.
        These can be positive or negative. The sign will be maintained.
    closed : bool, optional
        If True, only include edges to packages dependencies that are
        themselves in `package_lits`. No package literals that are not in
        `package_lits` will appear in the graph.

    Returns
    -------
    nodes_to_edges : dict
        A dict of package_literals to sets of package_literals, as described in
        :func:`toposort`.
    """

    package_lits = tuple(package_lits)
    package_id_map = {abs(p): p for p in package_lits}
    packages = {package_id: pool.id_to_package(abs(package_id))
                for package_id in package_lits}

    R = InstallRequirement.from_constraints
    nodes_to_edges = {package_id: set() for package_id in package_lits}

    for package_lit, package in packages.items():
        for constraints in package.install_requires:
            deps = pool.what_provides(R(constraints))
            nodes_to_edges[package_lit].update(
                dep_lit for dep_lit in (
                    package_id_map.get(dep_id, dep_id)
                    for dep_id in (pool.package_id(dep) for dep in deps)
                    if (not closed or dep_id in package_id_map)
                )
            )

    return dict(nodes_to_edges)


def transitive_neighbors(nodes_to_edges):
    """ Return the set of all reachable nodes for each node in the
    nodes_to_edges adjacency dict. """
    trans = defaultdict(set)
    for node in nodes_to_edges.keys():
        _transitive(node, nodes_to_edges, trans)
    return dict(trans)


def _transitive(node, nodes_to_edges, trans):
    trans = trans if trans is not None else defaultdict(set)
    if node in trans:
        return trans
    neighbors = nodes_to_edges[node]
    trans[node].update(neighbors)
    for neighbor in neighbors:
        _transitive(neighbor, nodes_to_edges, trans)
        trans[node].update(trans[neighbor])
    return trans


def connected_nodes(node, neighbor_func, visited=None):
    """ Recursively build up a set of nodes connected to `node` by following
    neighbors as given by `neighbor_func(node)`, i.e. "flood fill."


    >>> def neighbor_func(node):
    ...     return {-node, min(node+1, 5)}
    >>> connected_nodes(0, neighbor_func)
    {-5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5}
    """
    visited = set() if visited is None else visited
    queue = set([node])
    while queue:
        node = queue.pop()
        visited.add(node)
        neighbors = neighbor_func(node) - visited
        queue.update(neighbors)
    return visited


def backtrack(end, start, visited):
    """ Return a tuple of nodes from `start` to `end` by recursively looking up
    the current node in `visited`. `visited` is a dictionary of one-way edges
    between nodes.
    """
    path = [end]
    node = end
    while node != start:
        node = visited[node]
        path.append(node)
    return tuple(reversed(path))


def breadth_first_search(start, neighbor_func, targets,
                         target_func=None, visited=None):
    """
    Return an iterable of paths from `start` to each reachable terminal node
    `end`.

    Parameters
    ----------
    start : node
        The starting point of the search
    neighbor_func : callable
        Returns the neighbors of a node
    targets : set
        The nodes we're searching for. The search terminates when each member
        of `targets` has been encountered at least once, but only path is
        returned per target.
    target_func : callable, optional
        If given, then `target_func` is applied to node and the result
        is used to determine if `node` is a target via
        ``target_func(node) in targets``.
    visited : dict, optional
        If given, it will be used to track the current path. You can use it to
        directly inspect the search path after calling breadth_first_search().

    Yields
    ------
    path : tuple of nodes
        A path from node `start` to some node `end` such that
        `terminate_func(end)` is in `targets`, by following neighbors as given
        by `neighborfunc(node)`::

            >>> start = 0
            >>> targets = {10, 4}
            >>> def target_func(node):
            ...     return node*2
            >>> def neighbor_func(node):
            ...     return [node + 1]
            >>> tuple(breadth_first_search(
            ...     start, neighbor_func, targets, target_func))
            ((0, 1, 2), (0, 1, 2, 3, 4, 5))
    """
    queue = deque([start])
    visited = {} if visited is None else visited
    visited[start] = None
    targets = set(targets)
    while queue:
        node = queue.popleft()
        found = target_func(node) if target_func else node
        if found in targets:
            # We found an important node. Yield the path to this node.
            targets.remove(found)
            yield backtrack(node, start, visited)
        if not targets:
            # There are no more important nodes, we're done.
            break
        for neighbor in neighbor_func(node):
            if neighbor in visited:
                continue
            queue.append(neighbor)
            visited[neighbor] = node
