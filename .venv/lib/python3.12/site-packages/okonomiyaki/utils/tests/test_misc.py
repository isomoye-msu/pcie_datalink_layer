import textwrap
import unittest
from io import StringIO

from okonomiyaki.errors import OkonomiyakiError
from ..misc import parse_assignments, substitute_variables, substitute_variable


class TestParseAssignments(unittest.TestCase):
    def test_parse_simple(self):
        r_data = {"name": "dummy", "OsDist": None}

        s = textwrap.dedent("""\
        name = "dummy"
        OsDist = None
        """)

        data = parse_assignments(StringIO(s))
        self.assertEqual(data, r_data)

    def test_parse_simple_invalid_file(self):
        with self.assertRaises(OkonomiyakiError):
            parse_assignments(StringIO("1 + 2"))


class TestSubstitute(unittest.TestCase):
    def test_simple(self):
        # Given
        data = {
            "foo": "${yolo}",
            "bar": "${yolo}/bin",
        }

        variables = {
            "yolo": "/foo/bar",
        }

        r_data = {
            "foo": "/foo/bar",
            "bar": "/foo/bar/bin",
        }

        # When
        rendered_standard = substitute_variables(data, variables)
        rendered_curly_only = substitute_variables(
            data, variables, template='curly_braces_only'
        )

        # Then
        self.assertEqual(rendered_standard, r_data)
        self.assertEqual(rendered_curly_only, r_data)

    def test_recursive(self):
        # Given
        data = {
            "foo": "${yolo}",
            "bar": "${foo}/bin",
        }

        variables = {
            "yolo": "/foo/bar",
        }
        variables.update(data)

        r_data = {
            "foo": "/foo/bar",
            "bar": "/foo/bar/bin",
        }

        # When
        variables_standard = substitute_variables(variables, variables)
        variables_curly_only = substitute_variables(
            variables, variables
        )
        rendered_standard = substitute_variables(data, variables_standard)
        rendered_curly_only = substitute_variables(
            data, variables_curly_only, template='curly_braces_only'
        )

        # Then
        self.assertEqual(rendered_standard, r_data)
        self.assertEqual(rendered_curly_only, r_data)

    def test_escape(self):
        # Given
        data = {
            "foo": "$${yolo}",
            "bar": "$${foo}/bin",
        }

        variables = {
            "yolo": "/foo/bar",
        }
        variables.update(data)

        r_data = {
            "foo": "$${yolo}",
            "bar": "$${foo}/bin",
        }
        r_foo_ignore_escape = "$${yolo}"
        r_foo_escape = "${yolo}"

        # When
        variables = substitute_variables(
            variables, variables, template="curly_braces_only"
        )
        rendered = substitute_variables(
            data, variables, template="curly_braces_only"
        )
        render_foo_ignore_escape = substitute_variable(
            data["foo"], variables, template="curly_braces_only",
            ignore_escape=True
        )
        render_foo_escape = substitute_variable(
            data["foo"], variables, template="curly_braces_only"
        )

        # Then
        self.assertEqual(rendered, r_data)
        self.assertEqual(render_foo_ignore_escape, r_foo_ignore_escape)
        self.assertEqual(render_foo_escape, r_foo_escape)

    def test_without_curly_braces(self):
        # Given
        data = {
            "foo": "$yolo",
            "bar": "$foo/bin",
        }

        variables = {
            "yolo": "/foo/bar",
        }
        variables.update(data)

        r_data = {
            "foo": "$yolo",
            "bar": "$foo/bin",
        }

        # When
        variables = substitute_variables(
            variables, variables, template="curly_braces_only"
        )
        rendered = substitute_variables(
            data, variables, template="curly_braces_only"
        )

        # Then
        self.assertEqual(rendered, r_data)

    def test_empty_substitution(self):
        # Given
        # Empty variable name is invalid
        data = {
            "foo": "${}yolo",
            "bar": "/bin",
        }

        variables = {
            "yolo": "/foo/bar",
        }
        variables.update(data)

        # When/Then
        with self.assertRaises(ValueError):
            variables = substitute_variables(
                variables, variables, template="curly_braces_only"
            )
            substitute_variables(
                data, variables, template="curly_braces_only"
            )

    def test_invalid_substitution(self):
        # Given
        # idpattern = r'[_a-z][_a-z0-9]*'
        # Characters not matching idpattern are invalid
        data = {
            "foo": "${yo-lo}",
            "bar": "/bin",
        }

        variables = {
            "yo-lo": "/foo/bar",
        }
        variables.update(data)

        # When/Then
        with self.assertRaises(ValueError):
            variables = substitute_variables(
                variables, variables, template="curly_braces_only"
            )
            substitute_variables(
                data, variables, template="curly_braces_only"
            )

    def test_key_error_substitution(self):
        # Given
        # Nonexistent variable name gives key error
        data = {
            "foo": "${nonexistent}yolo",
            "bar": "/bin",
        }

        variables = {
            "yolo": "/foo/bar",
        }
        variables.update(data)

        # When/Then
        with self.assertRaises(KeyError):
            variables = substitute_variables(
                variables, variables, template="curly_braces_only"
            )
            substitute_variables(
                data, variables, template="curly_braces_only"
            )
