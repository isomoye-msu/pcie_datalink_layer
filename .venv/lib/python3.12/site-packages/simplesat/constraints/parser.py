import collections
import re

import six

from simplesat.constraints.kinds import (
    Any, EnpkgUpstreamMatch, Equal, GEQ, GT, LEQ, LT, Not
)

from simplesat.errors import InvalidConstraint


# NOTE: The _DISTRIBUTION_R regex is based on PEP508. Additionally, we remove
# the '-' because it breaks too many other things to do otherwise. We must also
# permit a leading or trailling underscore because of names like
# `_distribute_remove` re.Scanner seems to ignore (?i), so we have to write
# case-insensitivity into the regex manually.
_DISTRIBUTION_NAME_R = r"(?!\.)(?:\.?\w+)+(?<!\.)"
_DISTRIBUTION_R = "({})".format(_DISTRIBUTION_NAME_R)
_VERSION_R = r"((?=\d){}(?:-\w+)?$)".format(_DISTRIBUTION_NAME_R)
_EQUAL_R = r"=="
_GEQ_R = r">="
_GT_R = r">"
_LEQ_R = r"<="
_LT_R = r"<"
_NOT_R = r"!="
_ENPKG_UPSTREAM_MATCH_R = r"\^="
_ANY_R = r"\*"
_WS_R = r" +"

_CONSTRAINTS_SCANNER = re.Scanner([
    (_VERSION_R, lambda scanner, token: VersionToken(token)),
    (_EQUAL_R, lambda scanner, token: EqualToken(token)),
    (_GEQ_R, lambda scanner, token: GEQToken(token)),
    (_GT_R, lambda scanner, token: GTToken(token)),
    (_LEQ_R, lambda scanner, token: LEQToken(token)),
    (_LT_R, lambda scanner, token: LTToken(token)),
    (_NOT_R, lambda scanner, token: NotToken(token)),
    (_ENPKG_UPSTREAM_MATCH_R,
        lambda scanner, token: EnpkgUpstreamMatchToken(token)),
    (_ANY_R, lambda scanner, token: AnyToken(token)),
    (_WS_R, lambda scanner, token: None),
])

_REQUIREMENTS_SCANNER = re.Scanner([
    (_VERSION_R, lambda scanner, token: VersionToken(token)),
    (_DISTRIBUTION_R, lambda scanner, token: DistributionNameToken(token)),
    (_EQUAL_R, lambda scanner, token: EqualToken(token)),
    (_GEQ_R, lambda scanner, token: GEQToken(token)),
    (_GT_R, lambda scanner, token: GTToken(token)),
    (_LEQ_R, lambda scanner, token: LEQToken(token)),
    (_LT_R, lambda scanner, token: LTToken(token)),
    (_NOT_R, lambda scanner, token: NotToken(token)),
    (_ENPKG_UPSTREAM_MATCH_R,
        lambda scanner, token: EnpkgUpstreamMatchToken(token)),
    (_ANY_R, lambda scanner, token: AnyToken(token)),
    (_WS_R, lambda scanner, token: None),
])


class Token(object):
    kind = None

    def __init__(self, value=None):
        self.value = value


class CommaToken(Token):
    kind = "comma"


class DistributionNameToken(Token):
    kind = "distribution_name"


class AnyToken(Token):
    kind = "any"


class VersionToken(Token):
    kind = "version"


class ComparisonToken(Token):
    kind = "comparison"


class LEQToken(ComparisonToken):
    kind = "leq"


class LTToken(ComparisonToken):
    kind = "lt"


class GEQToken(ComparisonToken):
    kind = "geq"


class GTToken(ComparisonToken):
    kind = "gt"


class EnpkgUpstreamMatchToken(ComparisonToken):
    kind = "enpkg_upstream"


class EqualToken(ComparisonToken):
    kind = "equal"


class NotToken(ComparisonToken):
    kind = "not"


_OPERATOR_TO_SPEC = {
    EnpkgUpstreamMatchToken: EnpkgUpstreamMatch,
    EqualToken: Equal,
    GEQToken: GEQ,
    GTToken: GT,
    LEQToken: LEQ,
    LTToken: LT,
    NotToken: Not,
}


def _spec_factory(comparison_token):
    klass = _OPERATOR_TO_SPEC.get(comparison_token.__class__, None)
    if klass is None:
        msg = "Unsupported comparison token {0!r}".format(comparison_token)
        raise InvalidConstraint(msg)
    else:
        return klass


def _tokenize(scanner, requirement_string):
    requirement_string = requirement_string.strip()

    if len(requirement_string) == 0:
        return [[AnyToken()]]
    else:
        tokens = []

        for part in requirement_string.split(","):
            scanned, remaining = scanner.scan(part.strip())
            if len(remaining) > 0:
                msg = "{0!r}"
                for tok in scanned:
                    if isinstance(tok, DistributionNameToken):
                        msg += "(distribution name: {0!r})".format(tok.value)
                    if isinstance(tok, VersionToken):
                        msg += "(version: {0!r})".format(tok.value)
                msg += "(unparsed {0!r})".format(remaining)
                raise InvalidConstraint(msg.format(requirement_string))
            elif len(scanned) > 0:
                tokens.append(scanned)
        return tokens


def _operator_factory(operator, version, version_factory):
    operator = _spec_factory(operator)
    version = version_factory(version.value)
    return operator(version)


class _RawConstraintsParser(object):
    """A simple parser for requirement strings."""
    def __init__(self):
        self._scanner = _CONSTRAINTS_SCANNER

    def parse(self, requirement_string, version_factory):
        def compute_constraint(requirement_block):
            if len(requirement_block) == 2:
                operator, version = requirement_block
                return _operator_factory(operator, version, version_factory)
            elif len(requirement_block) == 1:
                assert isinstance(requirement_block[0], AnyToken)
                return Any()
            else:
                msg = "{0!r}".format(requirement_string)
                raise InvalidConstraint(msg)

        constraints = []
        tokens_blocks = _tokenize(self._scanner, requirement_string)

        for requirement_block in tokens_blocks:
            constraints.append(compute_constraint(requirement_block))

        return tuple(constraints)


class _RawRequirementParser(object):
    """A simple parser for requirement strings."""
    def __init__(self):
        self._scanner = _REQUIREMENTS_SCANNER

    def parse(self, requirement_string, version_factory):
        def compute_constraint(requirement_block):
            msg = "{0!r}".format(requirement_string)

            if len(requirement_block) == 3:
                distribution, operator, version = requirement_block
                if not isinstance(distribution, DistributionNameToken):
                    raise InvalidConstraint(msg + ' (bad distribution name)')
                if not isinstance(version, VersionToken):
                    raise InvalidConstraint(msg + ' (bad version)')
                name = distribution.value
                op = _operator_factory(operator, version, version_factory)
                return name, (op,)
            elif len(requirement_block) == 2:
                distribution, operator = requirement_block
                name = distribution.value
                if isinstance(operator, AnyToken):
                    return name, (Any(),)
                else:
                    raise InvalidConstraint(msg)
            elif len(requirement_block) == 1:
                name = requirement_block[0].value
                return name, (Any(),)
            else:
                raise InvalidConstraint(msg)

        named_constraints = collections.defaultdict(list)
        tokens_blocks = _tokenize(self._scanner, requirement_string)

        for requirement_block in tokens_blocks:
            name, constraint = compute_constraint(requirement_block)
            named_constraints[name].extend(constraint)

        return dict(
            (name, tuple(constraints))
            for name, constraints in six.iteritems(named_constraints)
        )
