from simplesat.errors import SatisfiabilityError  # noqa
from .minisat import MiniSATSolver  # noqa


def is_satisfiable(rules):
    s = MiniSATSolver(rules)
    try:
        s.search()
        return True
    except SatisfiabilityError:
        return False
