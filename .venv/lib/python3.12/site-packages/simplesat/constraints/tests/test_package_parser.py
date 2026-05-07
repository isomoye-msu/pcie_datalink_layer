import unittest

from okonomiyaki.versions import EnpkgVersion

from simplesat.constraints.package_parser import (
    PrettyPackageStringParser, package_to_pretty_string)
from simplesat.constraints.requirement import Requirement
from simplesat.package import PackageMetadata
from simplesat.errors import InvalidConstraint


V = EnpkgVersion.from_string


class TestPrettyPackageStringParser(unittest.TestCase):
    def test_invalid_formats(self):
        # Given
        parse = PrettyPackageStringParser(V).parse
        package_string = ""
        r_message = "Invalid preamble: "

        # Then
        with self.assertRaisesRegex(ValueError, r_message):
            parse(package_string)

        # Given
        package_string = "numpy"
        r_message = "Invalid preamble: 'numpy'"

        # Then
        with self.assertRaisesRegex(ValueError, r_message):
            parse(package_string)

        # Given
        package_string = "numpy1.8.0-1"
        r_message = ("Invalid preamble: ")

        # Then
        with self.assertRaisesRegex(ValueError, r_message):
            parse(package_string)

        # Given
        package_string = "numpy 1.8.0-1 depends (nose >= 1.3.2)"
        r_message = ("Invalid preamble: ")

        # Then
        with self.assertRaisesRegex(ValueError, r_message):
            parse(package_string)

        # Given
        package_string = "numpy; depends (nose >= 1.3.2)"
        r_message = ("Invalid preamble: ")

        # Then
        with self.assertRaisesRegex(ValueError, r_message):
            parse(package_string)

        # Given
        package_string = "numpy 1.8.0-1; disparages (nose >= 1.3.2)"
        r_message = ("Invalid package string. "
                     "Unknown constraint kind: 'disparages'")

        # When
        with self.assertRaisesRegex(ValueError, r_message):
            parse(package_string)

    def test_depends_simple(self):
        # Given
        parse = PrettyPackageStringParser(V).parse
        package_string = "numpy 1.8.0-1; depends (nose == 1.3.4-1)"

        # When
        package = parse(package_string)
        name = package['distribution']
        version = package['version']
        install_requires = dict(package['install_requires'])

        # Then
        self.assertEqual(name, "numpy")
        self.assertEqual(version, V("1.8.0-1"))
        self.assertTrue("nose" in install_requires)
        self.assertEqual(install_requires["nose"], (('== 1.3.4-1',),))

    def test_conflicts_simple(self):
        # Given
        parse = PrettyPackageStringParser(V).parse
        package_string = "numpy 1.8.0-1; conflicts (browsey ^= 1.3.0)"

        # When
        package = parse(package_string)
        name = package['distribution']
        version = package['version']
        conflicts = dict(package['conflicts'])

        # Then
        self.assertEqual(name, "numpy")
        self.assertEqual(version, V("1.8.0-1"))
        self.assertTrue("browsey" in conflicts)
        self.assertEqual(conflicts["browsey"], (('^= 1.3.0',),))

    def test_unversioned(self):
        # Given
        parse = PrettyPackageStringParser(V).parse
        package_string = "numpy 1.8.0-1; depends (nose, matplotlib == 1.3.2-1)"

        # When
        package = parse(package_string)
        name = package['distribution']
        version = package['version']
        install_requires = dict(package['install_requires'])

        # Then
        self.assertEqual(name, "numpy")
        self.assertEqual(version, V("1.8.0-1"))
        self.assertTrue("nose" in install_requires)
        self.assertEqual(install_requires["nose"], (('',),))
        self.assertEqual(install_requires["matplotlib"], (('== 1.3.2-1',),))

        # Given
        package_string = "numpy 1.8.0-1; depends (nose *, zope == 1.3.2-1)"

        # When
        package = parse(package_string)
        name = package['distribution']
        version = package['version']
        install_requires = dict(package['install_requires'])

        # Then
        self.assertEqual(name, "numpy")
        self.assertEqual(version, V("1.8.0-1"))
        self.assertTrue("nose" in install_requires)
        self.assertEqual(install_requires["nose"], (('*',),))
        self.assertEqual(install_requires["zope"], (('== 1.3.2-1',),))

    def test_special_characters(self):
        # Given
        parse = PrettyPackageStringParser(V).parse
        package_string = "shiboken_debug 1.2.2-5"

        # When
        package = parse(package_string)
        name = package['distribution']
        version = package['version']

        # Then
        self.assertEqual(name, "shiboken_debug")
        self.assertEqual(version, V("1.2.2-5"))

        # Given
        parse = PrettyPackageStringParser(V).parse
        package_string = '; '.join((
            "scikits.image 0.10.0-1",
            "depends (scipy ^= 0.14.0, pil, zope.distribution *)"
        ))
        r_install_requires = (
            ('pil', (('',),)),
            ('scipy', (('^= 0.14.0',),)),
            ('zope.distribution', (('*',),))
        )

        # When
        package = parse(package_string)
        name = package['distribution']
        version = package['version']
        install_requires = package['install_requires']

        # Then
        self.assertEqual(name, "scikits.image")
        self.assertEqual(version, V("0.10.0-1"))
        self.assertEqual(install_requires, r_install_requires)

    def test_multiple(self):
        # Given
        parse = PrettyPackageStringParser(V).parse
        package_string = "numpy 1.8.0-1; depends (nose => 1.3, nose < 1.4)"

        # When
        package = parse(package_string)
        name = package['distribution']
        version = package['version']
        install_requires = dict(package['install_requires'])

        # Then
        self.assertEqual(name, "numpy")
        self.assertEqual(version, V("1.8.0-1"))
        self.assertIn("nose", install_requires)
        self.assertEqual(install_requires["nose"], (('=> 1.3', '< 1.4'),))

    def test_no_constraints(self):
        # Given
        parse = PrettyPackageStringParser(V).parse
        package_string = "numpy 1.8.0-1"

        # When
        package = parse(package_string)
        name = package['distribution']
        version = package['version']

        # Then
        self.assertEqual(name, "numpy")
        self.assertEqual(version, V("1.8.0-1"))
        self.assertEqual(len(package), 2)

    def test_complicated(self):
        # Given
        parse = PrettyPackageStringParser(V).parse
        package_string = '; '.join((
            "bokeh 0.2.0-3",
            "depends (numpy ^= 1.8.0, MKL == 10.3, requests >= 0.2)",
            # Intentional typo
            "conflits (bokeh-git, requests ^= 0.2.5, requests > 0.4)",
        ))
        r_message = ("Invalid package string. "
                     "Unknown constraint kind: 'conflits'")

        # Then
        with self.assertRaisesRegex(ValueError, r_message):
            parse(package_string)

        # Given
        package_string = '; '.join((
            "bokeh_git 0.2.0-3",
            "install_requires (zope *, numpy ^= 1.8.0, requests >= 0.2)",
            "conflicts (requests ^= 0.2.5, requests > 0.4, bokeh)",
            "provides (webplot ^= 0.1, bokeh)",
        ))
        r_install_requires = (
            ("numpy", (("^= 1.8.0",),)),
            ("requests", ((">= 0.2",),)),
            ("zope", (("*",),)))
        r_conflicts = (
            ("bokeh", (('',),)),
            ("requests", (("^= 0.2.5", "> 0.4"),)))
        r_provides = (
            ("bokeh", (('',),)),
            ("webplot", (("^= 0.1",),)))

        # When
        package = parse(package_string)
        name = package['distribution']
        version = package['version']
        install_requires = package['install_requires']
        conflicts = package['conflicts']
        provides = package['provides']

        # Then
        self.assertEqual(name, "bokeh_git")
        self.assertEqual(version, V("0.2.0-3"))
        self.assertEqual(install_requires, r_install_requires)
        self.assertEqual(conflicts, r_conflicts)
        self.assertEqual(provides, r_provides)


class TestPackagePrettyString(unittest.TestCase):

    def test_simple(self):
        # Given
        package = PackageMetadata(u"numpy", V("1.8.1-1"))
        r_pretty_string = u"numpy 1.8.1-1"

        # When
        pretty_string = package_to_pretty_string(package)

        # Then
        self.assertEqual(pretty_string, r_pretty_string)

    def test_install_requires(self):
        # Given
        install_requires = (("MKL", (("== 10.3-1",),)),)
        package = PackageMetadata(u"numpy", V("1.8.1-1"), install_requires)

        r_pretty_string = u"numpy 1.8.1-1; install_requires (MKL == 10.3-1)"

        # When
        pretty_string = package_to_pretty_string(package)

        # Then
        self.assertEqual(pretty_string, r_pretty_string)

        # Given
        install_requires = (("nose", (("",),)),)
        package = PackageMetadata(u"numpy", V("1.8.1-1"), install_requires)

        r_pretty_string = "numpy 1.8.1-1; install_requires (nose)"

        # When
        pretty_string = package_to_pretty_string(package)

        # Then
        self.assertEqual(pretty_string, r_pretty_string)

    def test_conflicts(self):
        # Given
        conflicts = (("MKL", (("== 10.3-1",),)),)
        package = PackageMetadata(u"numpy", V("1.8.1-1"), conflicts=conflicts)

        r_pretty_string = u"numpy 1.8.1-1; conflicts (MKL == 10.3-1)"

        # When
        pretty_string = package_to_pretty_string(package)

        # Then
        self.assertEqual(pretty_string, r_pretty_string)

        # Given
        conflicts = (("nose", (("",),)),)
        package = PackageMetadata(u"numpy", V("1.8.1-1"), conflicts=conflicts)

        r_pretty_string = "numpy 1.8.1-1; conflicts (nose)"

        # When
        pretty_string = package_to_pretty_string(package)

        # Then
        self.assertEqual(pretty_string, r_pretty_string)

    def test_provides(self):
        # Given
        provides = ((u"dance", ((u">= 10.3-1",),)),)
        package = PackageMetadata(u"zumba", V("1.8.1-1"), provides=provides)

        r_pretty_string = u"zumba 1.8.1-1; provides (dance >= 10.3-1)"

        # When
        pretty_string = package_to_pretty_string(package)

        # Then
        self.assertEqual(pretty_string, r_pretty_string)

        # Given
        provides = (("cardio", (("*",),)),)
        package = PackageMetadata(u"zumba", V("1.8.1-1"), provides=provides)

        r_pretty_string = "zumba 1.8.1-1; provides (cardio *)"

        # When
        pretty_string = package_to_pretty_string(package)

        # Then
        self.assertEqual(pretty_string, r_pretty_string)

    def test_complicated(self):
        # Given
        install_requires = (
            ("numpy", (("^= 1.8.0",),)),
            ("requests", ((">= 0.2",),)),
            ("zope", (("*",),)))
        conflicts = (
            ("bokeh", (('',),)),
            ("requests", ((">= 0.2.5", "< 0.4"),)))
        provides = (
            ("bokeh", (('*',),)),)
        package = PackageMetadata(
            u"bokeh_git", V("0.2.0-3"),
            install_requires=install_requires,
            conflicts=conflicts,
            provides=provides)

        r_pretty_string = '; '.join((
            "bokeh_git 0.2.0-3",
            "install_requires (numpy ^= 1.8.0, requests >= 0.2, zope *)",
            "conflicts (bokeh, requests >= 0.2.5, requests < 0.4)",
            "provides (bokeh *)",
        ))

        # When
        pretty_string = package_to_pretty_string(package)

        # Then
        self.assertEqual(pretty_string, r_pretty_string)


class TestToPackage(unittest.TestCase):

    def test_simple(self):
        # Given
        s = u"zope.deprecated_ 2"
        parser = PrettyPackageStringParser(V)

        # When
        package = parser.parse_to_package(s)

        # Then
        self.assertEqual(package.name, "zope.deprecated_")
        self.assertEqual(package.version, V('2'))
        self.assertEqual(package.install_requires, ())

    def test_with_depends(self):
        # Given
        s = u"numpy 1.8.1; depends (MKL ^= 10.3)"
        parser = PrettyPackageStringParser(V)

        # When
        package = parser.parse_to_package(s)

        # Then
        self.assertEqual(package.name, "numpy")
        self.assertEqual(package.version, V('1.8.1'))
        self.assertEqual(package.install_requires, (("MKL", (("^= 10.3",),)),))

    def test_with_conflicts(self):
        # Given
        s = u"numpy 1.8.1; conflicts (MKL <= 10.3)"
        parser = PrettyPackageStringParser(V)

        # When
        package = parser.parse_to_package(s)

        # Then
        self.assertEqual(package.name, "numpy")
        self.assertEqual(package.version, V('1.8.1'))
        self.assertEqual(package.conflicts, (("MKL", (("<= 10.3",),)),))

    def test_with_provides(self):
        # Given
        s = u"numpy 1.8.1-4; provides (numeric)"
        parser = PrettyPackageStringParser(V)

        # When
        package = parser.parse_to_package(s)

        # Then
        self.assertEqual(package.name, "numpy")
        self.assertEqual(package.version, V('1.8.1-4'))
        self.assertEqual(package.provides,
                         (('numpy', (('*',),)),
                          ("numeric", (("",),))))

    def test_complicated(self):
        # Given
        install_requires = (
            ("numpy", (("^= 1.8.0",),)),
            ("requests", ((">= 0.2",),)),
            ("zope", (("*",),)))
        conflicts = (
            ("bokeh", (('',),)),
            ("requests", ((">= 0.2.5", "< 0.4"),)))
        provides = (
            ("bokeh", (('*',),)),)
        expected = PackageMetadata(
            u"bokeh_git", V("0.2.0-3"),
            install_requires=install_requires,
            conflicts=conflicts,
            provides=provides)
        parser = PrettyPackageStringParser(V)

        # When
        s = '; '.join((
            "bokeh_git 0.2.0-3",
            "install_requires (numpy ^= 1.8.0, requests >= 0.2, zope *)",
            "conflicts (bokeh, requests >= 0.2.5, requests < 0.4)",
            "provides (bokeh *)",
        ))
        result = parser.parse_to_package(s)

        # Then
        self.assertEqual(result, expected)


class TestParseScaryPackages(unittest.TestCase):

    # NOTE: gathered with 'scripts/index_to_scary_package_strings.py'
    SCARY_PACKAGE_STRINGS = """
        7z 9.20-1
        wb 19-4
        qt 2.5-1
        pytz 19-4
        ply 214-1
        _pylor 8a-0
        pylor_ 4-2
        sympy 210-1
        pycdf 210-3
        zdaemon 210-4
        argparse 210-5
        setupdocs 214-2
        z3c.amf 3.0a1-1
        traitsgui 210-2
        ua2.djfab 0.1a1-1
        z3ext.seo 2.0b8-1
        tw2.core 1.2.0a1-1
        lck.i18n 1.2.0a1-1
        tw2.jquery 1.2.0a1-1
        p01.fswidget 1.0b2-1
        multiprocessing 214-2
        z3ext.content 2.0b1-1
        webapp2_static 1.0b2-1
        z3c.offlinepack 1.0b4-1
        js.jquery_jqote2 1.0b3-1
        p01.recipe.setup 1.0a3-1
        js.jquery_jqote2 0.1a1-1
        z3c.checkversions 0.1a2-1
        z3ext.preferences 1.0b7-1
        js.jquery_jqote2 2.0b11-1
        z3c.repoexternals 1.0b1-1
        js.jquery_jqote2 1.2.0a1-1
        py_1digit_checksum 1.0b2-1
        sphinxjp.themes.s6 4.5b1-1
        z3c.layer.ready2go 0.1b8-1
        z3ext.content.forms 1.2.0a1-1
        z3ext.portlets.recent 0.1.0a2-1
        o2w_cache_invalidator 1.2.0a1-1
        z3c.setuptools_mercurial 1.0b1-1
        isotoma.depends.plone4_1 1.0b4-1
        z3c.setuptools_mercurial 1.7b5-1
        isotoma.depends.plone4_1 1.0a1-1
        z3c.setuptools_mercurial 1.0a2-1
        example.rtsubsites_theme 1.0rc4-1
        isotoma.depends.zope2_13_8 2.0b7-1
        isotoma.depends.plone4_1 1.5.0b1-1
        isotoma.depends.zope2_13_8 1.2b1-1
        isotoma.depends.zope2_13_8 1.7b4-1
        z3c.setuptools_mercurial 2.0.1b1-1
        c2.search.customdescription 2.0b2-1
        isotoma.depends.zope2_13_8 1.3rc5-1
        tiddlywebplugins.sqlalchemy2 1.0b2-1
        products.zope_hotfix_20110622 0.1a1-1
        plonetheme.greenearththeme3_0 2.0b9-1
        plonetheme.greenearththeme3_0 0.1a1-1
        products.zope_hotfix_20110622 3.0a1-1
        plonetheme.greenearththeme3_0 1.0b3-1
        products.zope_hotfix_20111024 0.2a1-1
        isotoma.depends.plone4_1 4.3.0.dev80-1
        isotoma.recipe.zope2instance 1.2.0a1-1
        products.zope_hotfix_20111024 0.1b12-1
        products.zope_hotfix_20111024 2.1.1a1-1
        products.zope_hotfix_20111024 1.2.0a1-1
        d51.django.virtualenv.test_runner 1.0b1-1
        products.zope_hotfix_cve_2010_3198 0.1a1-1
        products.zope_hotfix_cve_2010_1104 1.0a5-1
        products.zope_hotfix_cve_2011_3587 2.0b4-1
        d51.django.virtualenv.test_runner 1.0rc11-1
        d51.django.virtualenv.test_runner 1.2.0a1-1
        products.zope_hotfix_cve_2011_3587 0.8.0b1-1
        collective.z3cform.datagridfield_demo 2.0b9-1
        collective.z3cform.datagridfield_demo 1.2.0a1-1
        collective.z3cform.datagridfield_demo 2.5.4rc-1
        collective.z3cform.datagridfield_demo 1.3a7.1-1
        products.zope_hotfix_cve_2010_3198 4.3.0.dev80-1
        collective.z3cform.datagridfield_demo 4.3.0.dev29-1
        collective.blueprint.translationlinker 0.10.2.dev4396-1
        trytond_account_invoice_line_standalone 0.10.2.dev4365-1
        pyf.components.postprocess.email_sender 0.12.0.dev4791-1
        pyf.components.consumers.xhtmlpdfwriter 0.12.0.dev4716-1
        trytond_purchase_invoice_line_standalone 0.12.0.dev4681-1
        experimental.daterangeindexoptimisations 0.11.0.dev4622-1
        trytond_purchase_invoice_line_standalone 0.12.4.dev4948-1
        harobed.paster_template.advanced_package 0.13.0.dev5015-1
        trytond_purchase_invoice_line_standalone 0.11.0.dev4638-1
        trytond_purchase_invoice_line_standalone 2.0.4.dev25071-1
        trytond_purchase_invoice_line_standalone 0.11.0.dev4629-1
        harobed.paster_template.advanced_package 2.0.4.dev25079-1
        harobed.paster_template.advanced_package 0.12.0.dev4690-1
        trytond_purchase_invoice_line_standalone 0.11.0.dev4670-1
        trytond_purchase_invoice_line_standalone 0.11.0.dev4647-1
        trytond_purchase_invoice_line_standalone 2.0.4.dev25079-1
        trytond_purchase_invoice_line_standalone 0.3.1.dev0-20160104
        trytond_purchase_invoice_line_standalone 0.3.0.dev0-20151222
        data_analysis_common_reader_writers_addon 0.3.0.dev0-20151217
        """.strip().splitlines()

    UNACCEPTABLE_PACKAGE_STRINGS = """
        foo a909
        barbar-242 1.2.3
        baz!bizz 0.2.5-dev1
        twobars 1.3-4-6
        .startswithadot 1.2-3
        endwithadot. 2.3-4
        .startendwithdot. 4.5.6-7
        versionstartswithoutnum .2.4.5-4
        versioneendswithadot 2.3.-2
        buildhasadot 2.3.4-2.3
        """.strip().splitlines()

    def test_pretty_package_parse(self):
        # Given
        parser = PrettyPackageStringParser(EnpkgVersion.from_string)
        package_strings = self.SCARY_PACKAGE_STRINGS

        # When
        for package_string in package_strings:
            package = parser.parse_to_package(package_string)
            expected = tuple(package_string.split())
            result = (package.name, str(package.version))

            # Then
            self.assertEqual(expected, result)

        # Given
        package_strings = self.UNACCEPTABLE_PACKAGE_STRINGS

        # When
        for package_string in package_strings:
            # Then
            with self.assertRaises(ValueError):
                parser.parse_to_package(package_string)

    def test_requirement_parsing(self):
        # Given
        package_strings = self.SCARY_PACKAGE_STRINGS

        # When
        for package_string in package_strings:
            name, version = package_string.split()
            expected = name + ' == ' + version
            result = str(Requirement._from_string(expected))

            # Then
            self.assertEqual(expected, result)

        # Given
        package_strings = self.UNACCEPTABLE_PACKAGE_STRINGS

        # When
        for package_string in package_strings:
            name, version = package_string.split()
            requirement_string = name + ' == ' + version
            # Then
            with self.assertRaises(InvalidConstraint):
                Requirement._from_string(requirement_string)
