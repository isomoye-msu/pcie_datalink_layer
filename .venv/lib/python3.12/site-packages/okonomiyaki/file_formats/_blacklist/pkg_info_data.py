# coding=utf-8
# flake8: noqa
import os.path


B3_1_4_1 = u"""\
Metadata-Version: 1.0
Name: b3
Version: 1.4.1
Summary: BigBrotherBot (B3) is a cross-platform, cross-game game administration bot. Features in-game administration of game servers, multiple user access levels, and database storage. Currently include parsers for Call of Duty 1 to 5, Urban Terror (ioUrT), World of Padman, ETpro, Smokin' Guns, BFBC2(beta)
Home-page: http://www.bigbrotherbot.net
Author: Michael Thornton (ThorN), Tim ter Laak (ttlogic), Mark Weirath (xlr8or), Thomas Léveil (Courgette)
Author-email: info@bigbrotherbot.net
License: GPL
Description: Big Brother Bot B3 is a complete and total server administration package for online games. B3 is designed primarily to keep your server free from the derelicts of online gaming, but offers more, much more. With the stock configuration files, B3 will will keep your server free from offensive language, and team killers alike. A completely automated and customizable warning system will warn the offending players that this type of behavior is not allowed on your server, and ultimately kick, and or ban them for a predetermined time limit.
        
        B3 was designed to be easily ported to other online games. Currently, B3 is in production for the Call of Duty series, Urban Terror (ioUrT), etpro, World of Padman and Smokin' Guns since these games are based on the Quake III Arena engine, conversion to any game using the engine should be easy. Connecting B3 to the FrostBite engine for Battle Field Bad Company 2 is currently under development.
        
        Plugins provide much of the functionality for B3. These plugins can easily be configured. An SDK will be provided to make your own plugins.
        
Platform: UNKNOWN
Classifier: Development Status :: 4 - Beta
Classifier: Development Status :: 5 - Production/Stable
Classifier: Environment :: Console
Classifier: Intended Audience :: System Administrators
Classifier: License :: OSI Approved :: GNU General Public License (GPL)
Classifier: Natural Language :: English
Classifier: Operating System :: OS Independent
Classifier: Programming Language :: Python
Classifier: Topic :: System :: Logging
Classifier: Topic :: Utilities

"""

DBLATEX_0_3_1_1 = u"""\
Metadata-Version: 1.0
Name: dblatex
Version: 0.3.1.1
Summary: DocBook to LaTeX/ConTeXt Publishing
Home-page: http://dblatex.sf.net
Author: Benoît Guillon
Author-email: marsgui@users.sourceforge.net
License: GPL Version 2 or later
Description: 
               dblatex is a program that transforms your SGML/XML DocBook documents to
               DVI, PostScript or PDF by translating them into pure LaTeX as a first
               process.  MathML 2.0 markups are supported, too. It started as a clone
               of DB2LaTeX.
               
Platform: UNKNOWN
Classifier: Operating System :: OS Independent
Classifier: Topic :: Text Processing :: Markup :: XML
Classifier: License :: OSI Approved :: GNU General Public License (GPL)

"""

FULLSTATE_0_1 = u"""\
Metadata-Version: 1.0
Name: fullstate
Version: 0.1
Summary: Minimalistic prevayler-like memory based data structure with ACID
Home-page: http://code.google.com/p/fullstate/
Author: Eino Mäkitalo
Author-email: eino.makitalo@gmail.com
License: MIT License
Description: UNKNOWN
Platform: Any
Classifier: License :: OSI Approved :: MIT License
Classifier: Development Status :: 4 - Beta
Classifier: Programming Language :: Python :: 2.6
Classifier: Programming Language :: Python :: 3

"""

LASTSOUL_1_0_1 = u"""\
Metadata-Version: 1.1
Name: lastSoul
Version: 1.0.1
Summary: Python (not yet)full scale client for IONIS's students (EPITECH/EPITA/etc)
Home-page: https://bitbucket.org/lastmikoi/lastsoul
Author: Mickaël FALCK
Author-email: lastmikoi+py@gmail.com
License: GNU General Public License v3 (GPLv3)
Description: Python (not yet)full scale client for IONIS's students (EPITECH/EPITA/etc)
        ----------------------------------------
        
        Features :
        - Connection to netsoul server and authentification using config file
        - Configuration generator script
        - Multithreaded queuing system for processing in and out operations without blocking calls.
        - Advanced handling with registration system of function called when regexp match with input
        - Severals UI:
          * Raw command mode : allow to type commands directly to the server while being authed
          * PyQt Interface : with multi-tab, and userlist support
          * ncurses Interface : with user tracking
        
Keywords: netsoul,ncurses,pyqt,epitech,ionis
Platform: UNKNOWN
Classifier: Programming Language :: Python :: 3
Classifier: License :: OSI Approved :: GNU General Public License v3 (GPLv3)
Classifier: Operating System :: OS Independent
Classifier: Development Status :: 4 - Beta
Classifier: Environment :: X11 Applications :: Qt
Classifier: Environment :: Console :: Curses
Classifier: Environment :: Console
Classifier: Intended Audience :: End Users/Desktop
Classifier: Topic :: Communications :: Chat
Requires: PyQT

"""

MEDIALOG_BOARDFILE_1_3_2 = u"""\
Metadata-Version: 1.0
Name: medialog.boardfile
Version: 1.3.2
Summary: Boardfile content type
Home-page: http://medialog.no
Author: Espen Moe-Nilssen
Author-email: espen@medialog.no
License: GPL
Description: .. contents::
        
        .. Medialog Boardfile
           -----
            
        - Content type for uploading of documents that needs to be approved by many persons.
        - The workflow is called "Multiapprove workflow"
        - After installing you can set the group that can approve in /portal_workflow (default to "Reviewers")
        - Reviewer is also added to portal_catalog index, so it is possible to make a smart folder showing only objects the current user has not approved
        - Content that nobody has looked at for a certain time automatically gets published if nobody has "rejected" it.
        - You will have to add clockserver after [instance] in your buildout, something like: 
        
        zope-conf-additional =
        <clock-server>
            method /mysite/@@tick
            period 120
            host localhost
            user admin
            password mypassword
        </clock-server>
        
        Please note, this product is still in the making
        
        
        
        Espen Moe-Nilssen <espen at medialog dot no>, author
        Change history
        **************
        
        Changelog
        =========
        
        1.1 (2010-06-06)
        ----------------
        - Automatic publishing now happens n days after submit, in case a document is rejected and then submitted again.
        - Validator for year (2010-2050)
        
        1.0 (2010-06-06)
        ----------------
        
        - Alfa version
        - Created recipe with ZopeSkel
        - Added content type "Boardfile"
        - Added browser views
        - Added workflow "multiapprove workflow" so all "Reviewers" can "approve" or "reject" the boardfile
        - Added time based trasaction... the "Boardfile" gets published after "n" days if none of the "Reviewers" has "rejected" it.
        - Added "Boardfile-listing" view. 
          Warning: This will give you an error if you use it on a folder containing something else than "Boardfiles", so it is in "skins" dir and not in ues.
        
        To do: 
        =======
        - Change time to "creation date", it should take 20 days from creation, not from "last transaction in history".
        - Far to much code in "browser"... could need some help here.
        - Time before the transaction is now about 14 minutes (for testing), will change to 20 days.
        
        
        
        [Espen Moe-Nilssen]
        
        Detailed Documentation
        **********************
        
        Introduction
        ============
        
        This is a full-blown functional test. The emphasis here is on testing what
        the user may input and see, and the system is largely tested as a black box.
        We use PloneTestCase to set up this test as well, so we have a full Plone site
        to play with. We *can* inspect the state of the portal, e.g. using 
        self.portal and self.folder, but it is often frowned upon since you are not
        treating the system as a black box. Also, if you, for example, log in or set
        roles using calls like self.setRoles(), these are not reflected in the test
        browser, which runs as a separate session.
        
        Being a doctest, we can tell a story here.
        
        First, we must perform some setup. We use the testbrowser that is shipped
        with Five, as this provides proper Zope 2 integration. Most of the 
        documentation, though, is in the underlying zope.testbrower package.
        
            >>> from Products.Five.testbrowser import Browser
            >>> browser = Browser()
            >>> portal_url = self.portal.absolute_url()
        
        The following is useful when writing and debugging testbrowser tests. It lets
        us see all error messages in the error_log.
        
            >>> self.portal.error_log._ignored_exceptions = ()
        
        With that in place, we can go to the portal front page and log in. We will
        do this using the default user from PloneTestCase:
        
            >>> from Products.PloneTestCase.setup import portal_owner, default_password
        
            >>> browser.open(portal_url)
        
        We have the login portlet, so let's use that.
        
            >>> browser.getControl(name='__ac_name').value = portal_owner
            >>> browser.getControl(name='__ac_password').value = default_password
            >>> browser.getControl(name='submit').click()
        
        Here, we set the value of the fields on the login form and then simulate a
        submit click.
        
        We then test that we are still on the portal front page:
        
            >>> browser.url == portal_url
            True
        
        And we ensure that we get the friendly logged-in message:
        
            >>> "You are now logged in" in browser.contents
            True
        
        
        -*- extra stuff goes here -*-
        The Publication content type
        ===============================
        
        In this section we are tesing the Publication content type by performing
        basic operations like adding, updadating and deleting Publication content
        items.
        
        Adding a new Publication content item
        --------------------------------
        
        We use the 'Add new' menu to add a new content item.
        
            >>> browser.getLink('Add new').click()
        
        Then we select the type of item we want to add. In this case we select
        'Publication' and click the 'Add' button to get to the add form.
        
            >>> browser.getControl('Publication').click()
            >>> browser.getControl(name='form.button.Add').click()
            >>> 'Publication' in browser.contents
            True
        
        Now we fill the form and submit it.
        
            >>> browser.getControl(name='title').value = 'Publication Sample'
            >>> browser.getControl('Save').click()
            >>> 'Changes saved' in browser.contents
            True
        
        And we are done! We added a new 'Publication' content item to the portal.
        
        Updating an existing Publication content item
        ---------------------------------------
        
        Let's click on the 'edit' tab and update the object attribute values.
        
            >>> browser.getLink('Edit').click()
            >>> browser.getControl(name='title').value = 'New Publication Sample'
            >>> browser.getControl('Save').click()
        
        We check that the changes were applied.
        
            >>> 'Changes saved' in browser.contents
            True
            >>> 'New Publication Sample' in browser.contents
            True
        
        Removing a/an Publication content item
        --------------------------------
        
        If we go to the home page, we can see a tab with the 'New Publication
        Sample' title in the global navigation tabs.
        
            >>> browser.open(portal_url)
            >>> 'New Publication Sample' in browser.contents
            True
        
        Now we are going to delete the 'New Publication Sample' object. First we
        go to the contents tab and select the 'New Publication Sample' for
        deletion.
        
            >>> browser.getLink('Contents').click()
            >>> browser.getControl('New Publication Sample').click()
        
        We click on the 'Delete' button.
        
            >>> browser.getControl('Delete').click()
            >>> 'Item(s) deleted' in browser.contents
            True
        
        So, if we go back to the home page, there is no longer a 'New Publication
        Sample' tab.
        
            >>> browser.open(portal_url)
            >>> 'New Publication Sample' in browser.contents
            False
        
        Adding a new Publication content item as contributor
        ------------------------------------------------
        
        Not only site managers are allowed to add Publication content items, but
        also site contributors.
        
        Let's logout and then login as 'contributor', a portal member that has the
        contributor role assigned.
        
            >>> browser.getLink('Log out').click()
            >>> browser.open(portal_url)
            >>> browser.getControl(name='__ac_name').value = 'contributor'
            >>> browser.getControl(name='__ac_password').value = default_password
            >>> browser.getControl(name='submit').click()
            >>> browser.open(portal_url)
        
        We use the 'Add new' menu to add a new content item.
        
            >>> browser.getLink('Add new').click()
        
        We select 'Publication' and click the 'Add' button to get to the add form.
        
            >>> browser.getControl('Publication').click()
            >>> browser.getControl(name='form.button.Add').click()
            >>> 'Publication' in browser.contents
            True
        
        Now we fill the form and submit it.
        
            >>> browser.getControl(name='title').value = 'Publication Sample'
            >>> browser.getControl('Save').click()
            >>> 'Changes saved' in browser.contents
            True
        
        Done! We added a new Publication content item logged in as contributor.
        
        Finally, let's login back as manager.
        
            >>> browser.getLink('Log out').click()
            >>> browser.open(portal_url)
            >>> browser.getControl(name='__ac_name').value = portal_owner
            >>> browser.getControl(name='__ac_password').value = default_password
            >>> browser.getControl(name='submit').click()
            >>> browser.open(portal_url)
        
        
        
        The Boardfile content type
        ===============================
        
        In this section we are tesing the Boardfile content type by performing
        basic operations like adding, updadating and deleting Boardfile content
        items.
        
        Adding a new Boardfile content item
        --------------------------------
        
        We use the 'Add new' menu to add a new content item.
        
            >>> browser.getLink('Add new').click()
        
        Then we select the type of item we want to add. In this case we select
        'Boardfile' and click the 'Add' button to get to the add form.
        
            >>> browser.getControl('Boardfile').click()
            >>> browser.getControl(name='form.button.Add').click()
            >>> 'Boardfile' in browser.contents
            True
        
        Now we fill the form and submit it.
        
            >>> browser.getControl(name='title').value = 'Boardfile Sample'
            >>> browser.getControl('Save').click()
            >>> 'Changes saved' in browser.contents
            True
        
        And we are done! We added a new 'Boardfile' content item to the portal.
        
        Updating an existing Boardfile content item
        ---------------------------------------
        
        Let's click on the 'edit' tab and update the object attribute values.
        
            >>> browser.getLink('Edit').click()
            >>> browser.getControl(name='title').value = 'New Boardfile Sample'
            >>> browser.getControl('Save').click()
        
        We check that the changes were applied.
        
            >>> 'Changes saved' in browser.contents
            True
            >>> 'New Boardfile Sample' in browser.contents
            True
        
        Removing a/an Boardfile content item
        --------------------------------
        
        If we go to the home page, we can see a tab with the 'New Boardfile
        Sample' title in the global navigation tabs.
        
            >>> browser.open(portal_url)
            >>> 'New Boardfile Sample' in browser.contents
            True
        
        Now we are going to delete the 'New Boardfile Sample' object. First we
        go to the contents tab and select the 'New Boardfile Sample' for
        deletion.
        
            >>> browser.getLink('Contents').click()
            >>> browser.getControl('New Boardfile Sample').click()
        
        We click on the 'Delete' button.
        
            >>> browser.getControl('Delete').click()
            >>> 'Item(s) deleted' in browser.contents
            True
        
        So, if we go back to the home page, there is no longer a 'New Boardfile
        Sample' tab.
        
            >>> browser.open(portal_url)
            >>> 'New Boardfile Sample' in browser.contents
            False
        
        Adding a new Boardfile content item as contributor
        ------------------------------------------------
        
        Not only site managers are allowed to add Boardfile content items, but
        also site contributors.
        
        Let's logout and then login as 'contributor', a portal member that has the
        contributor role assigned.
        
            >>> browser.getLink('Log out').click()
            >>> browser.open(portal_url)
            >>> browser.getControl(name='__ac_name').value = 'contributor'
            >>> browser.getControl(name='__ac_password').value = default_password
            >>> browser.getControl(name='submit').click()
            >>> browser.open(portal_url)
        
        We use the 'Add new' menu to add a new content item.
        
            >>> browser.getLink('Add new').click()
        
        We select 'Boardfile' and click the 'Add' button to get to the add form.
        
            >>> browser.getControl('Boardfile').click()
            >>> browser.getControl(name='form.button.Add').click()
            >>> 'Boardfile' in browser.contents
            True
        
        Now we fill the form and submit it.
        
            >>> browser.getControl(name='title').value = 'Boardfile Sample'
            >>> browser.getControl('Save').click()
            >>> 'Changes saved' in browser.contents
            True
        
        Done! We added a new Boardfile content item logged in as contributor.
        
        Finally, let's login back as manager.
        
            >>> browser.getLink('Log out').click()
            >>> browser.open(portal_url)
            >>> browser.getControl(name='__ac_name').value = portal_owner
            >>> browser.getControl(name='__ac_password').value = default_password
            >>> browser.getControl(name='submit').click()
            >>> browser.open(portal_url)
        
        
        
        
        Contributors
        ************
        
        Espen Moe-Nilssen - Author
        
        
        Download
        ********
        
Platform: UNKNOWN
Classifier: Framework :: Plone
Classifier: Intended Audience :: Developers
Classifier: License :: OSI Approved :: GNU General Public License (GPL)

"""

MEDIALOG_BOARDFILE_1_6_1 = u"""\
Metadata-Version: 1.0
Name: medialog.boardfile
Version: 1.6.1
Summary: Boardfile content type
Home-page: http://medialog.no
Author: Espen Moe-Nilssen
Author-email: espen@medialog.no
License: GPL
Description: .. contents::
        
        .. Medialog Boardfile
           -----
            
        - Content type for uploading of documents that needs to be approved by many persons.
        - The workflow is called "Multiapprove workflow"
        - After installing you can set the group that can approve in /portal_workflow (default to "Reviewers")
        - Reviewer is also added to portal_catalog index, so it is possible to make a smart folder showing only objects the current user has not approved
        - Content that nobody has looked at for a certain time automatically gets published if nobody has "rejected" it.
        - You will have to add clockserver after [instance] in your buildout, something like: 
        
        zope-conf-additional =
        
        <clock-server>
            method /mysite/@@tick
            period 120
            host localhost
            user admin
            password mypassword
        
        </clock-server>
        
        Please note, this product is still in the making
        
        
        
        Espen Moe-Nilssen <espen at medialog dot no>, author
        Change history
        **************
        
        Changelog
        =========
        
        1.6 (2010-06-06)
        ----------------
        - Changed Delivareable field to Float
        
        1.1 (2010-06-06)
        ----------------
        - Automatic publishing now happens n days after submit, in case a document is rejected and then submitted again.
        - Validator for year (2010-2050)
        
        1.0 (2010-06-06)
        ----------------
        
        - Alfa version
        - Created recipe with ZopeSkel
        - Added content type "Boardfile"
        - Added browser views
        - Added workflow "multiapprove workflow" so all "Reviewers" can "approve" or "reject" the boardfile
        - Added time based trasaction... the "Boardfile" gets published after "n" days if none of the "Reviewers" has "rejected" it.
        - Added "Boardfile-listing" view. 
          Warning: This will give you an error if you use it on a folder containing something else than "Boardfiles", so it is in "skins" dir and not in ues.
        
        To do: 
        =======
        - Change time to "creation date", it should take 20 days from creation, not from "last transaction in history".
        - Far to much code in "browser"... could need some help here.
        - Time before the transaction is now about 14 minutes (for testing), will change to 20 days.
        
        
        
        [Espen Moe-Nilssen]
        
        Detailed Documentation
        **********************
        
        Introduction
        ============
        
        This is a full-blown functional test. The emphasis here is on testing what
        the user may input and see, and the system is largely tested as a black box.
        We use PloneTestCase to set up this test as well, so we have a full Plone site
        to play with. We *can* inspect the state of the portal, e.g. using 
        self.portal and self.folder, but it is often frowned upon since you are not
        treating the system as a black box. Also, if you, for example, log in or set
        roles using calls like self.setRoles(), these are not reflected in the test
        browser, which runs as a separate session.
        
        Being a doctest, we can tell a story here.
        
        First, we must perform some setup. We use the testbrowser that is shipped
        with Five, as this provides proper Zope 2 integration. Most of the 
        documentation, though, is in the underlying zope.testbrower package.
        
            >>> from Products.Five.testbrowser import Browser
            >>> browser = Browser()
            >>> portal_url = self.portal.absolute_url()
        
        The following is useful when writing and debugging testbrowser tests. It lets
        us see all error messages in the error_log.
        
            >>> self.portal.error_log._ignored_exceptions = ()
        
        With that in place, we can go to the portal front page and log in. We will
        do this using the default user from PloneTestCase:
        
            >>> from Products.PloneTestCase.setup import portal_owner, default_password
        
            >>> browser.open(portal_url)
        
        We have the login portlet, so let's use that.
        
            >>> browser.getControl(name='__ac_name').value = portal_owner
            >>> browser.getControl(name='__ac_password').value = default_password
            >>> browser.getControl(name='submit').click()
        
        Here, we set the value of the fields on the login form and then simulate a
        submit click.
        
        We then test that we are still on the portal front page:
        
            >>> browser.url == portal_url
            True
        
        And we ensure that we get the friendly logged-in message:
        
            >>> "You are now logged in" in browser.contents
            True
        
        
        -*- extra stuff goes here -*-
        The Publication content type
        ===============================
        
        In this section we are tesing the Publication content type by performing
        basic operations like adding, updadating and deleting Publication content
        items.
        
        Adding a new Publication content item
        --------------------------------
        
        We use the 'Add new' menu to add a new content item.
        
            >>> browser.getLink('Add new').click()
        
        Then we select the type of item we want to add. In this case we select
        'Publication' and click the 'Add' button to get to the add form.
        
            >>> browser.getControl('Publication').click()
            >>> browser.getControl(name='form.button.Add').click()
            >>> 'Publication' in browser.contents
            True
        
        Now we fill the form and submit it.
        
            >>> browser.getControl(name='title').value = 'Publication Sample'
            >>> browser.getControl('Save').click()
            >>> 'Changes saved' in browser.contents
            True
        
        And we are done! We added a new 'Publication' content item to the portal.
        
        Updating an existing Publication content item
        ---------------------------------------
        
        Let's click on the 'edit' tab and update the object attribute values.
        
            >>> browser.getLink('Edit').click()
            >>> browser.getControl(name='title').value = 'New Publication Sample'
            >>> browser.getControl('Save').click()
        
        We check that the changes were applied.
        
            >>> 'Changes saved' in browser.contents
            True
            >>> 'New Publication Sample' in browser.contents
            True
        
        Removing a/an Publication content item
        --------------------------------
        
        If we go to the home page, we can see a tab with the 'New Publication
        Sample' title in the global navigation tabs.
        
            >>> browser.open(portal_url)
            >>> 'New Publication Sample' in browser.contents
            True
        
        Now we are going to delete the 'New Publication Sample' object. First we
        go to the contents tab and select the 'New Publication Sample' for
        deletion.
        
            >>> browser.getLink('Contents').click()
            >>> browser.getControl('New Publication Sample').click()
        
        We click on the 'Delete' button.
        
            >>> browser.getControl('Delete').click()
            >>> 'Item(s) deleted' in browser.contents
            True
        
        So, if we go back to the home page, there is no longer a 'New Publication
        Sample' tab.
        
            >>> browser.open(portal_url)
            >>> 'New Publication Sample' in browser.contents
            False
        
        Adding a new Publication content item as contributor
        ------------------------------------------------
        
        Not only site managers are allowed to add Publication content items, but
        also site contributors.
        
        Let's logout and then login as 'contributor', a portal member that has the
        contributor role assigned.
        
            >>> browser.getLink('Log out').click()
            >>> browser.open(portal_url)
            >>> browser.getControl(name='__ac_name').value = 'contributor'
            >>> browser.getControl(name='__ac_password').value = default_password
            >>> browser.getControl(name='submit').click()
            >>> browser.open(portal_url)
        
        We use the 'Add new' menu to add a new content item.
        
            >>> browser.getLink('Add new').click()
        
        We select 'Publication' and click the 'Add' button to get to the add form.
        
            >>> browser.getControl('Publication').click()
            >>> browser.getControl(name='form.button.Add').click()
            >>> 'Publication' in browser.contents
            True
        
        Now we fill the form and submit it.
        
            >>> browser.getControl(name='title').value = 'Publication Sample'
            >>> browser.getControl('Save').click()
            >>> 'Changes saved' in browser.contents
            True
        
        Done! We added a new Publication content item logged in as contributor.
        
        Finally, let's login back as manager.
        
            >>> browser.getLink('Log out').click()
            >>> browser.open(portal_url)
            >>> browser.getControl(name='__ac_name').value = portal_owner
            >>> browser.getControl(name='__ac_password').value = default_password
            >>> browser.getControl(name='submit').click()
            >>> browser.open(portal_url)
        
        
        
        The Boardfile content type
        ===============================
        
        In this section we are tesing the Boardfile content type by performing
        basic operations like adding, updadating and deleting Boardfile content
        items.
        
        Adding a new Boardfile content item
        --------------------------------
        
        We use the 'Add new' menu to add a new content item.
        
            >>> browser.getLink('Add new').click()
        
        Then we select the type of item we want to add. In this case we select
        'Boardfile' and click the 'Add' button to get to the add form.
        
            >>> browser.getControl('Boardfile').click()
            >>> browser.getControl(name='form.button.Add').click()
            >>> 'Boardfile' in browser.contents
            True
        
        Now we fill the form and submit it.
        
            >>> browser.getControl(name='title').value = 'Boardfile Sample'
            >>> browser.getControl('Save').click()
            >>> 'Changes saved' in browser.contents
            True
        
        And we are done! We added a new 'Boardfile' content item to the portal.
        
        Updating an existing Boardfile content item
        ---------------------------------------
        
        Let's click on the 'edit' tab and update the object attribute values.
        
            >>> browser.getLink('Edit').click()
            >>> browser.getControl(name='title').value = 'New Boardfile Sample'
            >>> browser.getControl('Save').click()
        
        We check that the changes were applied.
        
            >>> 'Changes saved' in browser.contents
            True
            >>> 'New Boardfile Sample' in browser.contents
            True
        
        Removing a/an Boardfile content item
        --------------------------------
        
        If we go to the home page, we can see a tab with the 'New Boardfile
        Sample' title in the global navigation tabs.
        
            >>> browser.open(portal_url)
            >>> 'New Boardfile Sample' in browser.contents
            True
        
        Now we are going to delete the 'New Boardfile Sample' object. First we
        go to the contents tab and select the 'New Boardfile Sample' for
        deletion.
        
            >>> browser.getLink('Contents').click()
            >>> browser.getControl('New Boardfile Sample').click()
        
        We click on the 'Delete' button.
        
            >>> browser.getControl('Delete').click()
            >>> 'Item(s) deleted' in browser.contents
            True
        
        So, if we go back to the home page, there is no longer a 'New Boardfile
        Sample' tab.
        
            >>> browser.open(portal_url)
            >>> 'New Boardfile Sample' in browser.contents
            False
        
        Adding a new Boardfile content item as contributor
        ------------------------------------------------
        
        Not only site managers are allowed to add Boardfile content items, but
        also site contributors.
        
        Let's logout and then login as 'contributor', a portal member that has the
        contributor role assigned.
        
            >>> browser.getLink('Log out').click()
            >>> browser.open(portal_url)
            >>> browser.getControl(name='__ac_name').value = 'contributor'
            >>> browser.getControl(name='__ac_password').value = default_password
            >>> browser.getControl(name='submit').click()
            >>> browser.open(portal_url)
        
        We use the 'Add new' menu to add a new content item.
        
            >>> browser.getLink('Add new').click()
        
        We select 'Boardfile' and click the 'Add' button to get to the add form.
        
            >>> browser.getControl('Boardfile').click()
            >>> browser.getControl(name='form.button.Add').click()
            >>> 'Boardfile' in browser.contents
            True
        
        Now we fill the form and submit it.
        
            >>> browser.getControl(name='title').value = 'Boardfile Sample'
            >>> browser.getControl('Save').click()
            >>> 'Changes saved' in browser.contents
            True
        
        Done! We added a new Boardfile content item logged in as contributor.
        
        Finally, let's login back as manager.
        
            >>> browser.getLink('Log out').click()
            >>> browser.open(portal_url)
            >>> browser.getControl(name='__ac_name').value = portal_owner
            >>> browser.getControl(name='__ac_password').value = default_password
            >>> browser.getControl(name='submit').click()
            >>> browser.open(portal_url)
        
        
        
        
        Contributors
        ************
        
        Espen Moe-Nilssen - Author
        
        
        Download
        ********
        
Platform: UNKNOWN
Classifier: Framework :: Plone
Classifier: Intended Audience :: Developers
Classifier: License :: OSI Approved :: GNU General Public License (GPL)

"""

MEDIALOG_POPUPWORKFLOW_0_6 = u"""\
Metadata-Version: 1.0
Name: medialog.popupworkflow
Version: 0.6
Summary: A workflow with a state that opens documents in an overlay
Home-page: http://svn.plone.org/svn/collective/medialog.popupworkflow/
Author: Espen Moe-Nilssen
Author-email: espen@medialog.no
License: GPL
Description: What is this?
        =============
        
        This Plone product gives you a new'popup_workflow so you can "publish an item for pop-up effect when clicking on it in the navigation menu or wherever the state class  is shown (like in folder_listing, tableview, )
        The popup effect is disabled when logged in (so its possible to edit content "the normal way")
        
        
        How-to
        ==================
        - Install collective.prettyphoto
        - Install medialog.popupworkflow (in that order)
        - Change workflow of a folder or content type or everything to "Popup workflow"
        - Supported content types: folder (collective.gallery, Product.Maps, collective.truegallery), FormFolder, Page)
        - "Change state of some content to Popup Publish". For security reasons, the "change view menu is now disabled". You will need to "Normal Publish" it to change view.
        – Log out, or use another browser
        - Click on that item in the navigation portlet
        
        If you uninstall the product, you should uninstall or reinstall collective.prettyphoto
        
        
        Credits
        ====
        Nathan van Gheem, whose products and help inspired me to make this.
        
        
        Authors
        =======
        
        This product was developed by Espen Moe-Nilssen espen at medialog dot no
        Changelog
        =========
        
        
        0.6
        __________________
        - Added more views (document, formgen, page)
        - Put a condition on js so it is possible to edit content
        - disabled "view" menu when content is in "popup state", to prevent changing to a view that doesnt support pop-up
        
        
        0.5
        __________________
        - basically everything is working now, but needs product from trunk (truegallery)
        - Skin register fixed
        – Works with maps, truegallery and collective.gallery
        - Worflow guard usin getLayout instead of layout.
         
        
        0.4
        ------------------
        - guard etc. updated
        - javascript and placeit script OK
        
        
        0.3.0 (2010-08-16)
        ------------------
        - Added view for Maps (location and Map view). You will need to customize this to use it (go to portal skins, popupworkflow and press customize on it)
        - Changed script so it doesn mess up with TinyMCE javascript
        - Guard on "Popup Publish" not on gallery, plonetrueallery, maps, location
        
        Need help on getting the right view into the javascript (now, only one view  for folders can be used at a time.... the one you make an alias for in /portal_types/folder, like
        [place] [@@galleryplaceview]
        [place] [mapsplaceview]
        
        
        0.1.0 (2010-08-14)
        ------------------
        
        * Initial release
        
        
Keywords: plone  workflow  popup
Platform: UNKNOWN
Classifier: Framework :: Plone
Classifier: Programming Language :: Python

"""

MEDIALOG_SUBSKINS_4_1B1 = u"""\
Metadata-Version: 1.0
Name: medialog.subskins
Version: 4.1b1
Summary: An installable theme and theming tool for Plone 4
Home-page: http://svn.plone.org/svn/collective/medialog.subskins
Author: Espen Moe-Nilssen
Author-email: espen@medialog.no
License: GPL
Description: Introduction
        ============
        Dont upgrade a working site to version 4.1.
        I dont have the time to make an upgrade profile.
        
        
        Changelog
        =========
        
        4.1b1
        ----------
        Added brosho plugin - http://demos.usejquery.com/brosho-plugin/
        
        4.0b7
        - Changes in #content (#content li > #xontent-core li etc.)
        
        4.0b6
        - Changed viewlet definitions etc. due to change in Plone Classic theme
        
        4.0b5
        - changed all "content classes" " to #content ( https://dev.plone.org/plone/ticket/10231 )
        - small fixes on round corners portlets
        
        4.0b4
        - added two round corners portlets
        - added a lot of extras
          grad on columns
          navbackground
          portletsbackground
        - fixed nameing
        - added images 
          round corners and page curl
        
        4.0b3
        - checked and validated all css files 
        - added a lot of "extra selections" to tweak site
        - added a few more images
        - added extra file "members.css" to overrule members.css while developing
        - Changes in control panel (Product.PloneSubSkins). 
          It now includes "next" buttons to "walk through the options"
        
        4.0b2
        - added support for colorized images,
        - added another multiselct option for small tweaks
        - Added a lot of new layout options
        - Removed a lot of images that are not longer needed.
        - Most of selections now uses the new "colorize" option instead of images
        
        4.0
        medialog.subskins for plone 4
        
        
        Things I want to include / Links worth checking out:
        ============
        
        http://snipt.net/public/tag/css
        http://devsnippets.com/article/40-new-high-quality-icon-set-for-elegant-designs.html
        http://demos.usejquery.com/brosho-plugin/
        
        
        Changelog
        =========
        
        If you upgrade, please upgrade  Products.PloneSubSkins >= 4.2
        
        
        Changelog
        =========
        
        4.1b1
        ----------
        Added brosho plugin - http://demos.usejquery.com/brosho-plugin/
        
        
        4.0b8
        ----------
        Added field for extra css
        Fixed "authoring" css, the margins 
        You should upgrade to "PloneSubSkins 4.2 to enable "extra css" from the control panel
        
        4.0b7
        – Changes in #content (#content li > #xontent-core li etc.)
        
        4.0b6
        - Changed viewlet definitions etc. due to change in Plone Classic theme
        
        4.0b5
        - changed all "content classes" " to #content ( https://dev.plone.org/plone/ticket/10231 )
        - small fixes on round corners portlets
        
        4.0b4
        - added two round corners portlets
        - added a lot of extras
          grad on columns
          navbackground
          portletsbackground
        - fixed nameing
        - added images 
          round corners and page curl
        
        4.0b3
        - checked and validated all css files 
        - added a lot of "extra selections" to tweak site
        - added a few more images
        - added extra file "members.css" to overrule members.css while developing
        - Changes in control panel (Product.PloneSubSkins). 
          It now includes "next" buttons to "walk through the options"
        
        4.0b2
        - added support for colorized images,
        - added another multiselct option for small tweaks
        - Added a lot of new layout options
        - Removed a lot of images that are not longer needed.
        - Most of selections now uses the new "colorize" option instead of images
        
        4.0
        medialog.subskins for plone 4
        
        
        Things I want to include / Links worth checking out:
        ============
        
        http://snipt.net/public/tag/css
        http://devsnippets.com/article/40-new-high-quality-icon-set-for-elegant-designs.html
        
        
        Changelog
        =========
        
        4.0b8
        ----------
        Added field for extra css
        Fixed "authoring" css, the margins 
        You should upgrade to "PloneSubSkins 4.2 to enable "extra css" from the control panel
        
        _____
        
        This product does not change like others, so whatever written here will make little sence.
        Every release will have:
        More colorchemes, selections and/or changes in css - trying to make the look better)
        
        Please look at http://subskins.medialog.no to understand the product
Keywords: web zope plone theme theming tool
Platform: UNKNOWN
Classifier: Framework :: Plone
Classifier: Programming Language :: Python
Classifier: Topic :: Software Development :: Libraries :: Python Modules

"""


PYMULTINEST_0_1 = u"""\
Metadata-Version: 1.0
Name: pymultinest
Version: 0.1
Summary: Access modules for MultiNest and APEMoST
Home-page: http://johannesbuchner.github.com/PyMultiNest/
Author: Johannes Buchner
Author-email: johannes.buchner.acad [ät] gmx.com
License: GPLv3
Description: UNKNOWN
Platform: UNKNOWN

"""


PYSIDE_1_0_7_PKG_INFO = u"""\
Metadata-Version: 1.0
Name: PySide
Version: 1.0.7qt474
Summary: Python bindings for the Qt cross-platform application and UI framework
Home-page: http://www.pyside.org
Author: PySide Team
Author-email: contact@pyside.org
License: LGPL
Description: PySide is the Nokia-sponsored Python Qt bindings project, providing access to
        not only the complete Qt 4.7 framework but also Qt Mobility, as well as to
        generator tools for rapidly generating bindings for any C++ libraries.
        
        The PySide project is developed in the open, with all facilities you’d expect
        from any modern OSS project such as all code in a git repository [1], an open
        Bugzilla [2] for reporting bugs, and an open design process [3]. We welcome
        any contribution without requiring a transfer of copyright.
        
        =======
        Changes
        =======
        
        1.0.7 (released 21.09.2011)
        ===========================
        
        Bug fixes
        ---------
        
        - 996 Missing dependencies for QtWebKit in buildscripts for Fedora
        - 986 Documentation links
        - 985 Provide versioned pyside-docs zip file to help packagers
        - 981 QSettings docs should empathize the behavior changes of value() on different platforms
        - 902 Expose Shiboken functionality through a Python module
        - 997 QDeclarativePropertyMap doesn’t work.
        - 994 QIODevice.readData must use qmemcpy instead of qstrncpy
        - 989 Pickling QColor fails
        - 987 Disconnecting a signal that has not been connected
        - 973 shouldInterruptJavaScript slot override is never called
        - 966 QX11Info.display() missing
        - 959 can’t pass QVariant to the QtWebkit bridge
        - 1006 Segfault in QLabel init
        - 1002 Segmentation fault on PySide/Spyder exit
        - 998 Segfault with Spyder after switching to another app
        - 995 QDeclarativeView.itemAt returns faulty reference. (leading to SEGFAULT)
        - 990 Segfault when trying to disconnect a signal that is not connected
        - 975 Possible memory leak
        - 991 The __repr__ of various types is broken
        - 988 The type supplied with currentChanged signal in QTabWidget has changed in 1.0.6
        
        1.0.6 (released 22.08.2011)
        ===========================
        
        Major changes
        -------------
        
        - New documentation layout;
        - Fixed some regressions from the last release (1.0.5);
        - Optimizations during anonymous connection;
        
        Bug fixes
        ---------
        
        - 972 anchorlayout.py of graphicsview example raised a unwriteable memory exception when exits
        - 953 Segfault when QObject is garbage collected after QTimer.singeShot
        - 951 ComponentComplete not called on QDeclarativeItem subclass
        - 965 Segfault in QtUiTools.QUiLoader.load
        - 958 Segmentation fault with resource files
        - 944 Segfault on QIcon(None).pixmap()
        - 941 Signals with QtCore.Qt types as arguments has invalid signatures
        - 964 QAbstractItemView.moveCursor() method is missing
        - 963 What’s This not displaying QTableWidget column header information as in Qt Designer
        - 961 QColor.__repr__/__str__ should be more pythonic
        - 960 QColor.__reduce__ is incorrect for HSL colors
        - 950 implement Q_INVOKABLE
        - 940 setAttributeArray/setUniformValueArray do not take arrays
        - 931 isinstance() fails with Signal instances
        - 928 100’s of QGraphicItems with signal connections causes slowdown
        - 930 Documentation mixes signals and functions.
        - 923 Make QScriptValue (or QScriptValueIterator) implement the Python iterator protocol
        - 922 QScriptValue’s repr() should give some information about its data
        - 900 QtCore.Property as decorator
        - 895 jQuery version is outdated, distribution code de-duplication breaks documentation search
        - 731 Can’t specify more than a single ’since’ argument
        - 983 copy.deepcopy raises SystemError with QColor
        - 947 NETWORK_ERR during interaction QtWebKit window with server
        - 873 Deprecated methods could emit DeprecationWarning
        - 831 PySide docs would have a “Inherited by” list for each class
        
        1.0.5 (released 22.07.2011)
        ===========================
        
        Major changes
        -------------
        
        - Widgets present on “ui” files are exported in the root widget, check PySide ML thread for more information[1];
        - pyside-uic generate menubars without parent on MacOS plataform;
        - Signal connection optimizations;
        
        Bug fixes
        ---------
        
        - 892 Segfault when destructing QWidget and QApplication has event filter installed
        - 407 Crash while multiple inheriting with QObject and native python class
        - 939 Shiboken::importModule must verify if PyImport_ImportModule succeeds
        - 937 missing pid method in QProcess
        - 927 Segfault on QThread code.
        - 925 Segfault when passing a QScriptValue as QObject or when using .toVariant() on a QScriptValue
        - 905 QtGui.QHBoxLayout.setMargin function call is created by pyside-uic, but this is not available in the pyside bindings
        - 904 Repeatedly opening a QDialog with Qt.WA_DeleteOnClose set crashes PySide
        - 899 Segfault with ‘QVariantList’ Property.
        - 893 Shiboken leak reference in the parent control
        - 878 Shiboken may generate incompatible modules if a new class is added.
        - 938 QTemporaryFile JPEG problem
        - 934 A __getitem__ of QByteArray behaves strange
        - 929 pkg-config files do not know about Python version tags
        - 926 qmlRegisterType does not work with QObject
        - 924 Allow QScriptValue to be accessed via []
        - 921 Signals not automatically disconnected on object destruction
        - 920 Cannot use same slot for two signals
        - 919 Default arguments on QStyle methods not working
        - 915 QDeclarativeView.scene().addItem(x) make the x object invalid
        - 913 Widgets inside QTabWidget are not exported as members of the containing widget
        - 910 installEventFilter() increments reference count on target object
        - 907 pyside-uic adds MainWindow.setMenuBar(self.menubar) to the generated code under OS X
        - 903 eventFilter in ItemDelegate
        - 897 QObject.property() and QObject.setProperty() methods fails for user-defined properties
        - 896 QObject.staticMetaObject() is missing
        - 916 Missing info about when is possible to use keyword arguments in docs [was: QListWidgetItem's constructor ignores text parameter]
        - 890 Add signal connection example for valueChanged(int) on QSpinBox to the docs
        - 821 Mapping interface for QPixmapCache
        - 909 Deletion of QMainWindow/QApplication leads to segmentation fault
        
        ==========
        References
        ==========
        
        - [1] http://qt.gitorious.org/pyside
        - [2] http://bugs.openbossa.org/
        - [3] http://www.pyside.org/docs/pseps/psep-0001.html
        - [4] http://developer.qt.nokia.com/wiki/PySideDownloads
        
Keywords: Qt
Platform: UNKNOWN
Classifier: Development Status :: 4 - Beta
Classifier: Environment :: Console
Classifier: Environment :: MacOS X
Classifier: Environment :: X11 Applications :: Qt
Classifier: Intended Audience :: Developers
Classifier: License :: OSI Approved :: GNU Library or Lesser General Public License (LGPL)
Classifier: Operating System :: MacOS :: MacOS X
Classifier: Operating System :: POSIX
Classifier: Operating System :: POSIX :: Linux
Classifier: Programming Language :: C++
Classifier: Programming Language :: Python
Classifier: Programming Language :: Python :: 2
Classifier: Topic :: Database
Classifier: Topic :: Software Development
Classifier: Topic :: Software Development :: Code Generators
Classifier: Topic :: Software Development :: Libraries :: Application Frameworks
Classifier: Topic :: Software Development :: User Interfaces
Classifier: Topic :: Software Development :: Widget Sets
"""

PYSIDE_1_0_8_PKG_INFO = u"""\
Metadata-Version: 1.0
Name: PySide
Version: 1.0.8qt474
Summary: Python bindings for the Qt cross-platform application and UI framework
Home-page: http://www.pyside.org
Author: PySide Team
Author-email: contact@pyside.org
License: LGPL
Description: ============
        About PySide
        ============
        
        PySide is the Nokia-sponsored Python Qt bindings project, providing access to
        not only the complete Qt 4.7 framework but also Qt Mobility, as well as to
        generator tools for rapidly generating bindings for any C++ libraries.
        
        The PySide project is developed in the open, with all facilities you’d expect
        from any modern OSS project such as all code in a git repository [1], an open
        Bugzilla [2] for reporting bugs, and an open design process [3]. We welcome
        any contribution without requiring a transfer of copyright.
        
        =======
        Changes
        =======
        
        1.0.8 (2011-10-21)
        ==================
        
        Major changes
        -------------
        
        - Experimental Python3.2 support
        - Qt4.8 beta support
        - Bug Fixes
        
        Bug fixes
        ---------
        
        - 1022 RuntimeError: maximum recursion depth exceeded while getting the str of an object
        - 1019 Overriding QWidget.show or QWidget.hide do not work
        - 944 Segfault on QIcon(None).pixmap()
        
        1.0.7 (2011-09-21)
        ==================
        
        Bug fixes
        ---------
        
        - 996 Missing dependencies for QtWebKit in buildscripts for Fedora
        - 986 Documentation links
        - 985 Provide versioned pyside-docs zip file to help packagers
        - 981 QSettings docs should empathize the behavior changes of value() on different platforms
        - 902 Expose Shiboken functionality through a Python module
        - 997 QDeclarativePropertyMap doesn’t work.
        - 994 QIODevice.readData must use qmemcpy instead of qstrncpy
        - 989 Pickling QColor fails
        - 987 Disconnecting a signal that has not been connected
        - 973 shouldInterruptJavaScript slot override is never called
        - 966 QX11Info.display() missing
        - 959 can’t pass QVariant to the QtWebkit bridge
        - 1006 Segfault in QLabel init
        - 1002 Segmentation fault on PySide/Spyder exit
        - 998 Segfault with Spyder after switching to another app
        - 995 QDeclarativeView.itemAt returns faulty reference. (leading to SEGFAULT)
        - 990 Segfault when trying to disconnect a signal that is not connected
        - 975 Possible memory leak
        - 991 The __repr__ of various types is broken
        - 988 The type supplied with currentChanged signal in QTabWidget has changed in 1.0.6
        
        1.0.6 (2011-08-22)
        ==================
        
        Major changes
        -------------
        
        - New documentation layout;
        - Fixed some regressions from the last release (1.0.5);
        - Optimizations during anonymous connection;
        
        Bug fixes
        ---------
        
        - 972 anchorlayout.py of graphicsview example raised a unwriteable memory exception when exits
        - 953 Segfault when QObject is garbage collected after QTimer.singeShot
        - 951 ComponentComplete not called on QDeclarativeItem subclass
        - 965 Segfault in QtUiTools.QUiLoader.load
        - 958 Segmentation fault with resource files
        - 944 Segfault on QIcon(None).pixmap()
        - 941 Signals with QtCore.Qt types as arguments has invalid signatures
        - 964 QAbstractItemView.moveCursor() method is missing
        - 963 What’s This not displaying QTableWidget column header information as in Qt Designer
        - 961 QColor.__repr__/__str__ should be more pythonic
        - 960 QColor.__reduce__ is incorrect for HSL colors
        - 950 implement Q_INVOKABLE
        - 940 setAttributeArray/setUniformValueArray do not take arrays
        - 931 isinstance() fails with Signal instances
        - 928 100’s of QGraphicItems with signal connections causes slowdown
        - 930 Documentation mixes signals and functions.
        - 923 Make QScriptValue (or QScriptValueIterator) implement the Python iterator protocol
        - 922 QScriptValue’s repr() should give some information about its data
        - 900 QtCore.Property as decorator
        - 895 jQuery version is outdated, distribution code de-duplication breaks documentation search
        - 731 Can’t specify more than a single ’since’ argument
        - 983 copy.deepcopy raises SystemError with QColor
        - 947 NETWORK_ERR during interaction QtWebKit window with server
        - 873 Deprecated methods could emit DeprecationWarning
        - 831 PySide docs would have a “Inherited by” list for each class
        
        1.0.5 (2011-07-22)
        ==================
        
        Major changes
        -------------
        
        - Widgets present on “ui” files are exported in the root widget, check PySide ML thread for more information[1];
        - pyside-uic generate menubars without parent on MacOS plataform;
        - Signal connection optimizations;
        
        Bug fixes
        ---------
        
        - 892 Segfault when destructing QWidget and QApplication has event filter installed
        - 407 Crash while multiple inheriting with QObject and native python class
        - 939 Shiboken::importModule must verify if PyImport_ImportModule succeeds
        - 937 missing pid method in QProcess
        - 927 Segfault on QThread code.
        - 925 Segfault when passing a QScriptValue as QObject or when using .toVariant() on a QScriptValue
        - 905 QtGui.QHBoxLayout.setMargin function call is created by pyside-uic, but this is not available in the pyside bindings
        - 904 Repeatedly opening a QDialog with Qt.WA_DeleteOnClose set crashes PySide
        - 899 Segfault with ‘QVariantList’ Property.
        - 893 Shiboken leak reference in the parent control
        - 878 Shiboken may generate incompatible modules if a new class is added.
        - 938 QTemporaryFile JPEG problem
        - 934 A __getitem__ of QByteArray behaves strange
        - 929 pkg-config files do not know about Python version tags
        - 926 qmlRegisterType does not work with QObject
        - 924 Allow QScriptValue to be accessed via []
        - 921 Signals not automatically disconnected on object destruction
        - 920 Cannot use same slot for two signals
        - 919 Default arguments on QStyle methods not working
        - 915 QDeclarativeView.scene().addItem(x) make the x object invalid
        - 913 Widgets inside QTabWidget are not exported as members of the containing widget
        - 910 installEventFilter() increments reference count on target object
        - 907 pyside-uic adds MainWindow.setMenuBar(self.menubar) to the generated code under OS X
        - 903 eventFilter in ItemDelegate
        - 897 QObject.property() and QObject.setProperty() methods fails for user-defined properties
        - 896 QObject.staticMetaObject() is missing
        - 916 Missing info about when is possible to use keyword arguments in docs [was: QListWidgetItem's constructor ignores text parameter]
        - 890 Add signal connection example for valueChanged(int) on QSpinBox to the docs
        - 821 Mapping interface for QPixmapCache
        - 909 Deletion of QMainWindow/QApplication leads to segmentation fault
        
        ==========
        References
        ==========
        
        - [1] http://qt.gitorious.org/pyside
        - [2] http://bugs.openbossa.org/
        - [3] http://www.pyside.org/docs/pseps/psep-0001.html
        - [4] http://developer.qt.nokia.com/wiki/PySideDownloads
        
Keywords: Qt
Platform: UNKNOWN
Classifier: Development Status :: 4 - Beta
Classifier: Environment :: Console
Classifier: Environment :: MacOS X
Classifier: Environment :: X11 Applications :: Qt
Classifier: Intended Audience :: Developers
Classifier: License :: OSI Approved :: GNU Library or Lesser General Public License (LGPL)
Classifier: Operating System :: MacOS :: MacOS X
Classifier: Operating System :: POSIX
Classifier: Operating System :: POSIX :: Linux
Classifier: Programming Language :: C++
Classifier: Programming Language :: Python
Classifier: Programming Language :: Python :: 2
Classifier: Topic :: Database
Classifier: Topic :: Software Development
Classifier: Topic :: Software Development :: Code Generators
Classifier: Topic :: Software Development :: Libraries :: Application Frameworks
Classifier: Topic :: Software Development :: User Interfaces
Classifier: Topic :: Software Development :: Widget Sets
"""

PYSIDE_1_0_9_PKG_INFO = u"""\
Metadata-Version: 1.0
Name: PySide
Version: 1.0.9qt474
Summary: Python bindings for the Qt cross-platform application and UI framework
Home-page: http://www.pyside.org
Author: PySide Team
Author-email: contact@pyside.org
License: LGPL
Description: ============
        About PySide
        ============
        
        PySide is the Nokia-sponsored Python Qt bindings project, providing access to
        not only the complete Qt 4.7 framework but also Qt Mobility, as well as to
        generator tools for rapidly generating bindings for any C++ libraries.
        
        The PySide project is developed in the open, with all facilities you’d expect
        from any modern OSS project such as all code in a git repository [1], an open
        Bugzilla [2] for reporting bugs, and an open design process [3]. We welcome
        any contribution without requiring a transfer of copyright.
        
        =======
        Changes
        =======
        
        1.0.9 (2011-11-29)
        ==================
        
        Bug fixes
        ---------
        
        - 1058 Strange code in PySide/QtUiTools/glue/plugins.h
        - 1057 valgrind detected “Conditional jump or move depends on uninitialised value”
        - 1052 PySideConfig.cmake contains an infinite loop due to missing default for SHIBOKEN_PYTHON_SUFFIX
        - 1048 QGridLayout.itemAtPosition() crashes when it should return None
        - 1037 shiboken fails to build against python 3.2 (both normal and -dbg) on i386 (and others)
        - 1036 Qt.KeyboardModifiers always evaluates to zero
        - 1033 QDialog.DialogCode instances and return value from QDialog.exec_ hash to different values
        - 1031 QState.parentState() or QState.machine() causes python crash at exit
        - 1029 qmlRegisterType Fails to Increase the Ref Count
        - 1028 QWidget winId missing
        - 1016 Calling of Q_INVOKABLE method returning not QVariant is impossible…
        - 1013 connect to QSqlTableModel.primeInsert() causes crash
        - 1012 FTBFS with hardening flags enabled
        - 1011 PySide Cygwin patch
        - 1010 Shiboken Cygwin patch
        - 1009 GeneratorRunner Cygwin patch
        - 1008 ApiExtractor Cygwin patch
        - 891 ApiExtractor doesn’t support doxygen as backend to doc generation.
        
        1.0.8 (2011-10-21)
        ==================
        
        Major changes
        -------------
        
        - Experimental Python3.2 support
        - Qt4.8 beta support
        - Bug Fixes
        
        Bug fixes
        ---------
        
        - 1022 RuntimeError: maximum recursion depth exceeded while getting the str of an object
        - 1019 Overriding QWidget.show or QWidget.hide do not work
        - 944 Segfault on QIcon(None).pixmap()
        
        1.0.7 (2011-09-21)
        ==================
        
        Bug fixes
        ---------
        
        - 996 Missing dependencies for QtWebKit in buildscripts for Fedora
        - 986 Documentation links
        - 985 Provide versioned pyside-docs zip file to help packagers
        - 981 QSettings docs should empathize the behavior changes of value() on different platforms
        - 902 Expose Shiboken functionality through a Python module
        - 997 QDeclarativePropertyMap doesn’t work.
        - 994 QIODevice.readData must use qmemcpy instead of qstrncpy
        - 989 Pickling QColor fails
        - 987 Disconnecting a signal that has not been connected
        - 973 shouldInterruptJavaScript slot override is never called
        - 966 QX11Info.display() missing
        - 959 can’t pass QVariant to the QtWebkit bridge
        - 1006 Segfault in QLabel init
        - 1002 Segmentation fault on PySide/Spyder exit
        - 998 Segfault with Spyder after switching to another app
        - 995 QDeclarativeView.itemAt returns faulty reference. (leading to SEGFAULT)
        - 990 Segfault when trying to disconnect a signal that is not connected
        - 975 Possible memory leak
        - 991 The __repr__ of various types is broken
        - 988 The type supplied with currentChanged signal in QTabWidget has changed in 1.0.6
        
        1.0.6 (2011-08-22)
        ==================
        
        Major changes
        -------------
        
        - New documentation layout;
        - Fixed some regressions from the last release (1.0.5);
        - Optimizations during anonymous connection;
        
        Bug fixes
        ---------
        
        - 972 anchorlayout.py of graphicsview example raised a unwriteable memory exception when exits
        - 953 Segfault when QObject is garbage collected after QTimer.singeShot
        - 951 ComponentComplete not called on QDeclarativeItem subclass
        - 965 Segfault in QtUiTools.QUiLoader.load
        - 958 Segmentation fault with resource files
        - 944 Segfault on QIcon(None).pixmap()
        - 941 Signals with QtCore.Qt types as arguments has invalid signatures
        - 964 QAbstractItemView.moveCursor() method is missing
        - 963 What’s This not displaying QTableWidget column header information as in Qt Designer
        - 961 QColor.__repr__/__str__ should be more pythonic
        - 960 QColor.__reduce__ is incorrect for HSL colors
        - 950 implement Q_INVOKABLE
        - 940 setAttributeArray/setUniformValueArray do not take arrays
        - 931 isinstance() fails with Signal instances
        - 928 100’s of QGraphicItems with signal connections causes slowdown
        - 930 Documentation mixes signals and functions.
        - 923 Make QScriptValue (or QScriptValueIterator) implement the Python iterator protocol
        - 922 QScriptValue’s repr() should give some information about its data
        - 900 QtCore.Property as decorator
        - 895 jQuery version is outdated, distribution code de-duplication breaks documentation search
        - 731 Can’t specify more than a single ’since’ argument
        - 983 copy.deepcopy raises SystemError with QColor
        - 947 NETWORK_ERR during interaction QtWebKit window with server
        - 873 Deprecated methods could emit DeprecationWarning
        - 831 PySide docs would have a “Inherited by” list for each class
        
        1.0.5 (2011-07-22)
        ==================
        
        Major changes
        -------------
        
        - Widgets present on “ui” files are exported in the root widget, check PySide ML thread for more information[1];
        - pyside-uic generate menubars without parent on MacOS plataform;
        - Signal connection optimizations;
        
        Bug fixes
        ---------
        
        - 892 Segfault when destructing QWidget and QApplication has event filter installed
        - 407 Crash while multiple inheriting with QObject and native python class
        - 939 Shiboken::importModule must verify if PyImport_ImportModule succeeds
        - 937 missing pid method in QProcess
        - 927 Segfault on QThread code.
        - 925 Segfault when passing a QScriptValue as QObject or when using .toVariant() on a QScriptValue
        - 905 QtGui.QHBoxLayout.setMargin function call is created by pyside-uic, but this is not available in the pyside bindings
        - 904 Repeatedly opening a QDialog with Qt.WA_DeleteOnClose set crashes PySide
        - 899 Segfault with ‘QVariantList’ Property.
        - 893 Shiboken leak reference in the parent control
        - 878 Shiboken may generate incompatible modules if a new class is added.
        - 938 QTemporaryFile JPEG problem
        - 934 A __getitem__ of QByteArray behaves strange
        - 929 pkg-config files do not know about Python version tags
        - 926 qmlRegisterType does not work with QObject
        - 924 Allow QScriptValue to be accessed via []
        - 921 Signals not automatically disconnected on object destruction
        - 920 Cannot use same slot for two signals
        - 919 Default arguments on QStyle methods not working
        - 915 QDeclarativeView.scene().addItem(x) make the x object invalid
        - 913 Widgets inside QTabWidget are not exported as members of the containing widget
        - 910 installEventFilter() increments reference count on target object
        - 907 pyside-uic adds MainWindow.setMenuBar(self.menubar) to the generated code under OS X
        - 903 eventFilter in ItemDelegate
        - 897 QObject.property() and QObject.setProperty() methods fails for user-defined properties
        - 896 QObject.staticMetaObject() is missing
        - 916 Missing info about when is possible to use keyword arguments in docs [was: QListWidgetItem's constructor ignores text parameter]
        - 890 Add signal connection example for valueChanged(int) on QSpinBox to the docs
        - 821 Mapping interface for QPixmapCache
        - 909 Deletion of QMainWindow/QApplication leads to segmentation fault
        
        ==========
        References
        ==========
        
        - [1] http://qt.gitorious.org/pyside
        - [2] http://bugs.openbossa.org/
        - [3] http://www.pyside.org/docs/pseps/psep-0001.html
        - [4] http://developer.qt.nokia.com/wiki/PySideDownloads
        
Keywords: Qt
Platform: UNKNOWN
Classifier: Development Status :: 4 - Beta
Classifier: Environment :: Console
Classifier: Environment :: MacOS X
Classifier: Environment :: X11 Applications :: Qt
Classifier: Intended Audience :: Developers
Classifier: License :: OSI Approved :: GNU Library or Lesser General Public License (LGPL)
Classifier: Operating System :: MacOS :: MacOS X
Classifier: Operating System :: POSIX
Classifier: Operating System :: POSIX :: Linux
Classifier: Programming Language :: C++
Classifier: Programming Language :: Python
Classifier: Programming Language :: Python :: 2
Classifier: Topic :: Database
Classifier: Topic :: Software Development
Classifier: Topic :: Software Development :: Code Generators
Classifier: Topic :: Software Development :: Libraries :: Application Frameworks
Classifier: Topic :: Software Development :: User Interfaces
Classifier: Topic :: Software Development :: Widget Sets
"""

PYSIDE_1_1_0_PKG_INFO = u"""\
Metadata-Version: 1.0
Name: PySide
Version: 1.1.0qt474
Summary: Python bindings for the Qt cross-platform application and UI framework
Home-page: http://www.pyside.org
Author: PySide Team
Author-email: contact@pyside.org
License: LGPL
Description: ============
        About PySide
        ============
        
        PySide is the Nokia-sponsored Python Qt bindings project, providing access to
        not only the complete Qt 4.7 framework but also Qt Mobility, as well as to
        generator tools for rapidly generating bindings for any C++ libraries.
        
        The PySide project is developed in the open, with all facilities you’d expect
        from any modern OSS project such as all code in a git repository [1], an open
        Bugzilla [2] for reporting bugs, and an open design process [3]. We welcome
        any contribution without requiring a transfer of copyright.
        
        =======
        Changes
        =======
        
        1.1.0 (2012-01-02)
        ==================
        
        Major changes
        -------------
        
        - New type converter scheme
        
        Bug fixes
        ---------
        
        - 1010 Shiboken Cygwin patch
        - 1034 Error compiling PySide with Python 3.2.2 32bit on Windows
        - 1040 pyside-uic overwriting attributes before they are being used
        - 1053 pyside-lupdate used with .pro files can't handle Windows paths that contain spaces
        - 1060 Subclassing of QUiLoader leads to "Internal C++ object already deleted" exception
        - 1063 Bug writing to files using "QTextStream + QFile + QTextEdit" on Linux
        - 1069 QtCore.QDataStream silently fails on writing Python string
        - 1077 Application exit crash when call QSyntaxHighlighter.document()
        - 1082 OSX binary links are broken
        - 1083 winId returns a PyCObject making it impossible to compare two winIds
        - 1084 Crash (segfault) when writing unicode string on socket
        - 1091 PixmapFragment and drawPixmapFragments are not bound
        - 1095 No examples for shiboken tutorial
        - 1097 QtGui.QShortcut.setKey requires QKeySequence
        - 1101 Report invalid function signatures in typesystem
        - 902 Expose Shiboken functionality through a Python module
        - 969 viewOptions of QAbstractItemView error
        
        1.0.9 (2011-11-29)
        ==================
        
        Bug fixes
        ---------
        
        - 1058 Strange code in PySide/QtUiTools/glue/plugins.h
        - 1057 valgrind detected “Conditional jump or move depends on uninitialised value”
        - 1052 PySideConfig.cmake contains an infinite loop due to missing default for SHIBOKEN_PYTHON_SUFFIX
        - 1048 QGridLayout.itemAtPosition() crashes when it should return None
        - 1037 shiboken fails to build against python 3.2 (both normal and -dbg) on i386 (and others)
        - 1036 Qt.KeyboardModifiers always evaluates to zero
        - 1033 QDialog.DialogCode instances and return value from QDialog.exec_ hash to different values
        - 1031 QState.parentState() or QState.machine() causes python crash at exit
        - 1029 qmlRegisterType Fails to Increase the Ref Count
        - 1028 QWidget winId missing
        - 1016 Calling of Q_INVOKABLE method returning not QVariant is impossible…
        - 1013 connect to QSqlTableModel.primeInsert() causes crash
        - 1012 FTBFS with hardening flags enabled
        - 1011 PySide Cygwin patch
        - 1010 Shiboken Cygwin patch
        - 1009 GeneratorRunner Cygwin patch
        - 1008 ApiExtractor Cygwin patch
        - 891 ApiExtractor doesn’t support doxygen as backend to doc generation.
        
        1.0.8 (2011-10-21)
        ==================
        
        Major changes
        -------------
        
        - Experimental Python3.2 support
        - Qt4.8 beta support
        - Bug Fixes
        
        Bug fixes
        ---------
        
        - 1022 RuntimeError: maximum recursion depth exceeded while getting the str of an object
        - 1019 Overriding QWidget.show or QWidget.hide do not work
        - 944 Segfault on QIcon(None).pixmap()
        
        1.0.7 (2011-09-21)
        ==================
        
        Bug fixes
        ---------
        
        - 996 Missing dependencies for QtWebKit in buildscripts for Fedora
        - 986 Documentation links
        - 985 Provide versioned pyside-docs zip file to help packagers
        - 981 QSettings docs should empathize the behavior changes of value() on different platforms
        - 902 Expose Shiboken functionality through a Python module
        - 997 QDeclarativePropertyMap doesn’t work.
        - 994 QIODevice.readData must use qmemcpy instead of qstrncpy
        - 989 Pickling QColor fails
        - 987 Disconnecting a signal that has not been connected
        - 973 shouldInterruptJavaScript slot override is never called
        - 966 QX11Info.display() missing
        - 959 can’t pass QVariant to the QtWebkit bridge
        - 1006 Segfault in QLabel init
        - 1002 Segmentation fault on PySide/Spyder exit
        - 998 Segfault with Spyder after switching to another app
        - 995 QDeclarativeView.itemAt returns faulty reference. (leading to SEGFAULT)
        - 990 Segfault when trying to disconnect a signal that is not connected
        - 975 Possible memory leak
        - 991 The __repr__ of various types is broken
        - 988 The type supplied with currentChanged signal in QTabWidget has changed in 1.0.6
        
        1.0.6 (2011-08-22)
        ==================
        
        Major changes
        -------------
        
        - New documentation layout;
        - Fixed some regressions from the last release (1.0.5);
        - Optimizations during anonymous connection;
        
        Bug fixes
        ---------
        
        - 972 anchorlayout.py of graphicsview example raised a unwriteable memory exception when exits
        - 953 Segfault when QObject is garbage collected after QTimer.singeShot
        - 951 ComponentComplete not called on QDeclarativeItem subclass
        - 965 Segfault in QtUiTools.QUiLoader.load
        - 958 Segmentation fault with resource files
        - 944 Segfault on QIcon(None).pixmap()
        - 941 Signals with QtCore.Qt types as arguments has invalid signatures
        - 964 QAbstractItemView.moveCursor() method is missing
        - 963 What’s This not displaying QTableWidget column header information as in Qt Designer
        - 961 QColor.__repr__/__str__ should be more pythonic
        - 960 QColor.__reduce__ is incorrect for HSL colors
        - 950 implement Q_INVOKABLE
        - 940 setAttributeArray/setUniformValueArray do not take arrays
        - 931 isinstance() fails with Signal instances
        - 928 100’s of QGraphicItems with signal connections causes slowdown
        - 930 Documentation mixes signals and functions.
        - 923 Make QScriptValue (or QScriptValueIterator) implement the Python iterator protocol
        - 922 QScriptValue’s repr() should give some information about its data
        - 900 QtCore.Property as decorator
        - 895 jQuery version is outdated, distribution code de-duplication breaks documentation search
        - 731 Can’t specify more than a single ’since’ argument
        - 983 copy.deepcopy raises SystemError with QColor
        - 947 NETWORK_ERR during interaction QtWebKit window with server
        - 873 Deprecated methods could emit DeprecationWarning
        - 831 PySide docs would have a “Inherited by” list for each class
        
        1.0.5 (2011-07-22)
        ==================
        
        Major changes
        -------------
        
        - Widgets present on “ui” files are exported in the root widget, check PySide ML thread for more information[1];
        - pyside-uic generate menubars without parent on MacOS plataform;
        - Signal connection optimizations;
        
        Bug fixes
        ---------
        
        - 892 Segfault when destructing QWidget and QApplication has event filter installed
        - 407 Crash while multiple inheriting with QObject and native python class
        - 939 Shiboken::importModule must verify if PyImport_ImportModule succeeds
        - 937 missing pid method in QProcess
        - 927 Segfault on QThread code.
        - 925 Segfault when passing a QScriptValue as QObject or when using .toVariant() on a QScriptValue
        - 905 QtGui.QHBoxLayout.setMargin function call is created by pyside-uic, but this is not available in the pyside bindings
        - 904 Repeatedly opening a QDialog with Qt.WA_DeleteOnClose set crashes PySide
        - 899 Segfault with ‘QVariantList’ Property.
        - 893 Shiboken leak reference in the parent control
        - 878 Shiboken may generate incompatible modules if a new class is added.
        - 938 QTemporaryFile JPEG problem
        - 934 A __getitem__ of QByteArray behaves strange
        - 929 pkg-config files do not know about Python version tags
        - 926 qmlRegisterType does not work with QObject
        - 924 Allow QScriptValue to be accessed via []
        - 921 Signals not automatically disconnected on object destruction
        - 920 Cannot use same slot for two signals
        - 919 Default arguments on QStyle methods not working
        - 915 QDeclarativeView.scene().addItem(x) make the x object invalid
        - 913 Widgets inside QTabWidget are not exported as members of the containing widget
        - 910 installEventFilter() increments reference count on target object
        - 907 pyside-uic adds MainWindow.setMenuBar(self.menubar) to the generated code under OS X
        - 903 eventFilter in ItemDelegate
        - 897 QObject.property() and QObject.setProperty() methods fails for user-defined properties
        - 896 QObject.staticMetaObject() is missing
        - 916 Missing info about when is possible to use keyword arguments in docs [was: QListWidgetItem's constructor ignores text parameter]
        - 890 Add signal connection example for valueChanged(int) on QSpinBox to the docs
        - 821 Mapping interface for QPixmapCache
        - 909 Deletion of QMainWindow/QApplication leads to segmentation fault
        
        ==========
        References
        ==========
        
        - [1] http://qt.gitorious.org/pyside
        - [2] http://bugs.openbossa.org/
        - [3] http://www.pyside.org/docs/pseps/psep-0001.html
        - [4] http://developer.qt.nokia.com/wiki/PySideDownloads
        
Keywords: Qt
Platform: UNKNOWN
Classifier: Development Status :: 4 - Beta
Classifier: Environment :: Console
Classifier: Environment :: MacOS X
Classifier: Environment :: X11 Applications :: Qt
Classifier: Intended Audience :: Developers
Classifier: License :: OSI Approved :: GNU Library or Lesser General Public License (LGPL)
Classifier: Operating System :: MacOS :: MacOS X
Classifier: Operating System :: POSIX
Classifier: Operating System :: POSIX :: Linux
Classifier: Programming Language :: C++
Classifier: Programming Language :: Python
Classifier: Programming Language :: Python :: 2
Classifier: Topic :: Database
Classifier: Topic :: Software Development
Classifier: Topic :: Software Development :: Code Generators
Classifier: Topic :: Software Development :: Libraries :: Application Frameworks
Classifier: Topic :: Software Development :: User Interfaces
Classifier: Topic :: Software Development :: Widget Sets
"""

SHRINK_1_1_1 = u"""\
Metadata-Version: 1.1
Name: shrink
Version: 1.1.1
Summary: Command line tool for minification of css and javascript files
Home-page: https://bitbucket.org/jeronimoalbi/shrink
Author: Jerónimo José Albi
Author-email: albi@wienfluss.net
License: BSD License
Description: ========
         Shrink
        ========
        
        Shrink is a command for concatenating and compressing css stylesheets and
        javascript files making them smaller.
        Shrinking (or minifying) these files reduces the number of request that are
        made after a page load and also the size of these requests.
        
        This command depends on `YUI Compressor`_ for compression, and runs with
        Python 2.5 and above, including Python 3.
        
        Install
        =======
        
        Shrink can be easily installed from pypi by running::
        
          $ pip install shrink
        
        After install is good to display script information and options::
        
          $ shrink -h
        
        .. _YUI Compressor: http://developer.yahoo.com/yui/compressor/
        
        Config file
        ===========
        
        ``INI`` style files are used to know which files will be minified, set some
        global options and also to know which files will be joined before
        minification.
        
        A good starting point to get familiar with Shrink config file format is to
        read the example shrink config file. To create an example file run::
        
          $ shrink --example-cfg
        
        This command creates a file called ``example_shrink.cfg`` in current folder.
        
        Config file format
        ==================
        
        Config file has a section for each individual file that can be generated,
        and on top it also has a special section called ``DEFAULT`` where global
        options are defined.
        
        Global ``DEFAULT`` options:
        
         * ``base_dir`` defines a base directory used as prefix to find static files.
           This value can be referenced in any other section using the python variable
           notation ``%(base_dir)s``.
         * ``hash_dir`` defines a folder where ``shrink.sha1`` file is stored. See
           `Shrink hash file`_ for more info. By default, this file is stored in the
           same folder where shrink config file is located.
         * ``arg.*`` defines default values for some command line argumens. Supported
           arguments are ``arg.java_bin`` and ``arg.yui_jar``.
           The values given here are overriden by the ones given during runtime as
           command line arguments.
        
        Each file section has some options that are used during join, compression and
        hashing of a file. These file section options are:
        
         * ``source_directory`` value defines the folder where file(s) listed in
           ``source_files`` are located.
         * ``source_files`` value can be a single file name, or a list of file names.
           When a list of names is given, each file in list is concatenated (from top
           to down) into a single file before compression.
         * ``destination_directory`` value sets output directory for the minified file
           By default minified file is generated in source directory.
         * ``destination_file`` value is the name for the minified file.
         * ``hash`` is a boolean value. When it is true destination file is included
           during shrink hash generation. See `Shrink hash file`_.
         * ``compress`` is a boolean value. Destination file is not compressed when
           this value is false. By default compression is done for destination
           files.
           This option is useful when is desirable to join many files without
           compressing them because they are already compressed.
        
        For example, a section for minifying a file called ``sample-file.js`` could
        be written as::
        
          [sample-single-file-js]
          source_directory = %(base_dir)s/js
          destination_file = sample-file.min.js
          source_files = sample-file.js
        
        Final minified file name would be ``sample-file.min.js``.
        
        Many files can also be specified to be joined into a single file before
        compression by writing a section like::
        
          [sample-multiple-file-css]
          source_directory = %(base_dir)s/css
          destination_file = sample-multiple-file.min.css
          source_files =
              sample-file1.css
              sample-file2.css
              sample-file3.css
        
        Generated file name is given by ``destination_file`` value.
        
        Minimize css and js files
        =========================
        
        To minify all files, run::
        
          $ shrink -f example_shrink.cfg all
        
        This will use ``yuicompressor.jar`` and the ``example_shrink.cfg`` file in
        current directory to compress all files.
        
        In case that minification is not desired for all files, is also possible to
        minify individual files, or a group of files (See `Section groups`_), by
        using the name(s) of each section instead of ``all`` as argument.
        
        To list available sections, run::
        
          $ shrink -f example_shrink.cfg -l
        
        Section groups
        --------------
        
        Instead of running script with ``sample-single-file-js`` and
        ``sample-multiple-file-css`` as arguments is possible to define a group like::
        
          [sample-group]
          group =
              sample-single-file-js
              sample-multiple-file-css
        
        And then run minifier script with ``sample-group`` as the only parameter.
        
        Shrink hash file
        ----------------
        
        After minification Shrink can create a file containing a SHA1 hash. The file
        is created when at least one section in config file has ``hash = true``. Hash
        is created using the contents of all destination files in these sections.
        
        This is useful to know when some files changed, and to reload static css and
        javascript files without using a timestamp or version number.
        Sometime can be desirable to reload modified static files without increasing
        application version. In these cases the hash can be used as request parameter
        instead of version number.
        
        Deployment notes
        ================
        
        It can happen your application stop working or have unespected results when
        it is deployed with minified css and javascript files.
        Many times some of these problems are is easy avoid by having present the
        following notes during ``shrink.cfg`` setup:
        
         * The order of the source files in each config section must be the same as
           the one in your HTML templates.
         * CSS files normally contains URLs which are relative to the location of
           the file where they are declared. So for these cases the location for
           destination file must be the same as the one for source files.
           Some javascript files might define some path or URL that might also be
           relative to a file location.
         * Check that all files wich are NOT minified are being included in your
           HTML template.
        
        
        =========
        Changelog
        =========
        
        1.1.1 - 2012-09-21
        ==================
        
         * Setup argument use_2to3 is now enabled only for python 3 series
         * Added ``Deployment notes`` to README file
         * Added read permissions to generated files for group and others
        
        1.1.0 - 2012-07-31
        ==================
        
         * Added python 3 support
         * Updated documentation
         * Added initial files for unit testing
        
        1.0.1 - 2012-07-19
        ==================
        
         * Added --hash-dir argument to allow changing hash file dir during runtime
         * Added ``compress`` INI file option to avoid compressing destination file
         * Added --example-cfg argument to create an example_shrink.cfg file in
           current folder
        
        1.0.0 - 2012-07-11
        ==================
        
         * Added --version argument
         * Added SHA1 hashing support (``hash = true`` in any file section)
         * Added --hash-all argument to generae SHA1 hash using all files contents
        
Keywords: minify javascript css yuicompressor
Platform: OS Independent
Classifier: Environment :: Console
Classifier: Intended Audience :: Developers
Classifier: License :: OSI Approved :: BSD License
Classifier: Operating System :: OS Independent
Classifier: Programming Language :: Python
Classifier: Programming Language :: Python :: 2.5
Classifier: Programming Language :: Python :: 2.6
Classifier: Programming Language :: Python :: 2.7
Classifier: Programming Language :: Python :: 3
Classifier: Programming Language :: Python :: 3.2
Classifier: Topic :: Utilities

"""

# egg's sha256 to correcty decoded PKG_INFO content
_EGG_PKG_INFO_BLACK_LIST = {
    "PySide-1.0.7-1.egg": {
        "ca0903cc398aa69da1939be22bac52941ac2d8dd0a197eb2c449fdddd6339f80":
            PYSIDE_1_0_7_PKG_INFO,
        "946211c1f20f01bb5a29ec8783acd74a5ed234b3ced88a5256861077b2f1c34d":
            PYSIDE_1_0_7_PKG_INFO,
    },
    "PySide-1.0.8-1.egg": {
        "79174bb334fddb06a970e8e61f78c94d90259ca10dd85f88516c02bf4f135f45":
            PYSIDE_1_0_8_PKG_INFO,
    },
    "PySide-1.0.8-2.egg": {
        "79174bb334fddb06a970e8e61f78c94d90259ca10dd85f88516c02bf4f135f45":
            PYSIDE_1_0_8_PKG_INFO,
    },
    "PySide-1.0.9-1.egg": {
        "8d880887fb8155329888decdd8fc1fdbce1a214da9a98206a64f0ee57b554279":
            PYSIDE_1_0_9_PKG_INFO,
        "8d1ff3f8713c84cc8aa36cbac49051b094ecb2863b8dfa1b5ccd737ae82c14a8":
            PYSIDE_1_0_9_PKG_INFO,
    },
    "PySide-1.1.0-2.egg": {
        "16644aaaa1d2447677634d6dfe8fc5f9890be731641c4f46448646d1c409c656":
            PYSIDE_1_1_0_PKG_INFO,
        "c0a73ef8843e0934287e57d0812b2b9024587bb034f6146ce0999207366edc4d":
            PYSIDE_1_1_0_PKG_INFO,
    },
    "PySide-1.1.0-3.egg": {
        "5eff70cfb464c2d531e6f93f7601e8ef8255b3a1ab4dd533826cfdcd5b962b60":
            PYSIDE_1_1_0_PKG_INFO,
        "afb7402aa38ccef4ed5d0233807bb6611b59e24106fc27f6d271b11cf9562454":
            PYSIDE_1_1_0_PKG_INFO,
    },
    'b3-1.4.1-1.egg': {
        '6a7dd49c1aa26da4cbd5d572582b3a0502bbfc03aa5ec6ad87e89ddc40d1e89d':
            B3_1_4_1
    },
    'dblatex-0.3.1.1-1.egg': {
        'e697499a97633da710ed9577c1a2bb4ff24b1e0449adfa37ef129c42178b94ca':
            DBLATEX_0_3_1_1
    },
    'fullstate-0.1-1.egg': {
        '7f49e77753b229a38efa87f57f026a693b20ce081e7a83b109f7b701c28a64f0':
            FULLSTATE_0_1
    },
    'lastSoul-1.0.1-1.egg': {
        '6d3a578219bc37e7fff9bd34bc98e68d6e792923424ba4bb9cb00edbe6f40db8':
            LASTSOUL_1_0_1
    },
    'medialog.boardfile-1.3.2-1.egg': {
        '7da751d687b8115501375b13e52a246fa994951182c2ecd3d4a486bf06168af1':
            MEDIALOG_BOARDFILE_1_3_2
    },
    'medialog.boardfile-1.6.1-1.egg': {
        'ab9e029caf273e4a251d3686425cd4225e1b97682749acc7a82dc1fd15dbd060':
            MEDIALOG_BOARDFILE_1_6_1
    },
    'medialog.popupworkflow-0.6-1.egg': {
        '60718ccd49e97c1f783ef1eb435ba1740d38d9388c0a0f17679675fba7e79871':
            MEDIALOG_POPUPWORKFLOW_0_6
    },
    'medialog.subskins-4.1b1-1.egg': {
        'affce0b43af99e443da0d1f4227ad570af53f96f908cd4d3ec43ac468e69195e':
            MEDIALOG_SUBSKINS_4_1B1
    },
    'pymultinest-0.1-1.egg': {
        '39d153880646a0f0cdc569a92cfa57a020d60cef25f75205451600896766f1ce':
            PYMULTINEST_0_1
    },
    'shrink-1.1.1-1.egg': {
        '23e182c540565b1e74baafcc140be2b1fe37ab82226a52a4e6b73d4f7be8fe63':
            SHRINK_1_1_1
    },
}


EGG_PKG_INFO_BLACK_LIST = dict(
    (checksum, pkg_info_data)
    for egg in _EGG_PKG_INFO_BLACK_LIST.values()
    for checksum, pkg_info_data in egg.items()
)


def may_be_in_pkg_info_blacklist(path):
    """ Returns True if the given egg path may be in the PKG INFO blacklist.
    """
    return os.path.basename(path) in _EGG_PKG_INFO_BLACK_LIST
