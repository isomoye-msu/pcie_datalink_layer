# -*- coding: utf-8 -*-

from .policy import DefaultPolicy
from .undetermined_clause_policy import (
    LoggedUndeterminedClausePolicy, UndeterminedClausePolicy
)

InstalledFirstPolicy = LoggedUndeterminedClausePolicy

__all__ = [
    'DefaultPolicy',
    'LoggedUndeterminedClausePolicy',
    'UndeterminedClausePolicy',
    'InstalledFirstPolicy']
