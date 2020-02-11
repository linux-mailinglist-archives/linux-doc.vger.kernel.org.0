Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9FF8158731
	for <lists+linux-doc@lfdr.de>; Tue, 11 Feb 2020 02:02:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727599AbgBKBCo (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 10 Feb 2020 20:02:44 -0500
Received: from mail-pf1-f202.google.com ([209.85.210.202]:35341 "EHLO
        mail-pf1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727120AbgBKBCo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Feb 2020 20:02:44 -0500
Received: by mail-pf1-f202.google.com with SMTP id q1so6324816pfg.2
        for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2020 17:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=FCGShYhhgcnM7PF8/ijIsVVXLdpFwigYVMP37PnwTck=;
        b=EqgHqsJxa8C7fn+Wki1EguP3hB8hrPbXer3KQY4gcZM3fKrqEzRZ8NTHY5MnEIYZJB
         Bbn4aEd1g5VOEpmII9h0Ec0zV7vxNz/n06/mOIo62Blq/+WyIy3NgZQbB+kfZPBSWulq
         j3JJ6C94RC3QI4+oCb7MxiE43D7Pe7elDkjd2NuZlDHl4Q6FhO8EFkGygVB3suOVzlrS
         b3kDULf5xE5achu9xERnQX1+iLNqcQNFfc0ZsTYcUF+rrQ00a5Pr4cUR8elzlaTHCCLC
         z9u6SIQ+LoQTP8bYRb7fqNYQ3OqACuYnK55+lsNDJhfbO0ENbtUqIif94c+JqPwe9YlB
         oSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=FCGShYhhgcnM7PF8/ijIsVVXLdpFwigYVMP37PnwTck=;
        b=M7anUmj86SCqT4IOLJBdmPBtLxsOpmWlIToDk1F5Bt0Xb1fTmGgItrPaJTZ0vD16vb
         AxAgK099yD/rrnFzOxNljJBNKaAvyPNjqOzdohUYjllXTpqbK/xkHreIw31Yq/O5Jj+b
         qtdaXt3v/4TstjJp2IlsRY1ZesxsPcXRbfp/zgRfzNPt/qN4fx+J+9+JBF/N1cN64ykJ
         Xl9YgFeamiJyUzqcwjJWk1T0oivRoiozBeeTBASRSA313x+SNoSgl2Jutzyl4cInSgYg
         zmDp/LaN7g06AXoY/EPDIl5SvBI961mLeKJj2smmD+uK1e+uqxvOFLFAAtJP6ZgrwUTr
         XPoQ==
X-Gm-Message-State: APjAAAX3FttN5VdRAERodMTclPBG/CeSN0+9OjogKzsQ9D4HtRfUsd2U
        dUW/KRTPAQ33Bql7hkE7Pz9dOYhoIoJoWA==
X-Google-Smtp-Source: APXvYqxCByTRssGEeDlgq5LA62XXMvHAm0cbNRguxcdJFP14OSmy+8fUY9L+EKvGWgX12ZkT7VWIiqgFbLf5vQ==
X-Received: by 2002:a63:d94d:: with SMTP id e13mr4236681pgj.240.1581382963408;
 Mon, 10 Feb 2020 17:02:43 -0800 (PST)
Date:   Mon, 10 Feb 2020 17:02:29 -0800
Message-Id: <20200211010229.251757-1-davidgow@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
Subject: [PATCH] Documentation: kunit: Make the KUnit documentation less UML-specific
From:   David Gow <davidgow@google.com>
To:     brendanhiggins@google.com, skhan@linuxfoundation.org,
        corbet@lwn.net
Cc:     kunit-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        frowand.list@gmail.com, David Gow <davidgow@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Remove some of the outmoded "Why KUnit" rationale -- which focuses
significantly on UML -- and update the Getting Started guide to mention
running tests without the kunit_tool wrapper.

Signed-off-by: David Gow <davidgow@google.com>
---
This is an attempt at resolving some of the issues with the KUnit
documentation pointed out here:
https://lore.kernel.org/linux-kselftest/CABVgOSkiLi0UNijH1xTSvmsJEE5+ocCZ7nkzmKzxDLzzfqBSzQ@mail.gmail.com/

There's definitely room for further work on the KUnit documentation
(e.g., adding more information around the environment tests run in), but
this hopefully is better than nothing as a starting point.


 Documentation/dev-tools/kunit/index.rst | 60 ++++---------------
 Documentation/dev-tools/kunit/start.rst | 80 +++++++++++++++++++++----
 2 files changed, 78 insertions(+), 62 deletions(-)

diff --git a/Documentation/dev-tools/kunit/index.rst b/Documentation/dev-tools/kunit/index.rst
index d16a4d2c3a41..6064cd14dfad 100644
--- a/Documentation/dev-tools/kunit/index.rst
+++ b/Documentation/dev-tools/kunit/index.rst
@@ -17,63 +17,23 @@ What is KUnit?
 ==============
 
 KUnit is a lightweight unit testing and mocking framework for the Linux kernel.
-These tests are able to be run locally on a developer's workstation without a VM
-or special hardware.
 
 KUnit is heavily inspired by JUnit, Python's unittest.mock, and
 Googletest/Googlemock for C++. KUnit provides facilities for defining unit test
 cases, grouping related test cases into test suites, providing common
 infrastructure for running tests, and much more.
 
-Get started now: :doc:`start`
-
-Why KUnit?
-==========
-
-A unit test is supposed to test a single unit of code in isolation, hence the
-name. A unit test should be the finest granularity of testing and as such should
-allow all possible code paths to be tested in the code under test; this is only
-possible if the code under test is very small and does not have any external
-dependencies outside of the test's control like hardware.
-
-Outside of KUnit, there are no testing frameworks currently
-available for the kernel that do not require installing the kernel on a test
-machine or in a VM and all require tests to be written in userspace running on
-the kernel; this is true for Autotest, and kselftest, disqualifying
-any of them from being considered unit testing frameworks.
+KUnit consists of a kernel component, which provides a set of macros for easily
+writing unit tests. Tests written against KUnit will run on kernel boot if
+built-in, or when loaded if built as a module. These tests write out results to
+the kernel log in `TAP <https://testanything.org/>`_ format.
 
-KUnit addresses the problem of being able to run tests without needing a virtual
-machine or actual hardware with User Mode Linux. User Mode Linux is a Linux
-architecture, like ARM or x86; however, unlike other architectures it compiles
-to a standalone program that can be run like any other program directly inside
-of a host operating system; to be clear, it does not require any virtualization
-support; it is just a regular program.
+To make running these tests (and reading the results) easier, KUnit offsers
+:doc:`kunit_tool <kunit-tool>`, which builds a `User Mode Linux
+<http://user-mode-linux.sourceforge.net>`_ kernel, runs it, and parses the test
+results. This provides a quick way of running KUnit tests during development.
 
-Alternatively, kunit and kunit tests can be built as modules and tests will
-run when the test module is loaded.
-
-KUnit is fast. Excluding build time, from invocation to completion KUnit can run
-several dozen tests in only 10 to 20 seconds; this might not sound like a big
-deal to some people, but having such fast and easy to run tests fundamentally
-changes the way you go about testing and even writing code in the first place.
-Linus himself said in his `git talk at Google
-<https://gist.github.com/lorn/1272686/revisions#diff-53c65572127855f1b003db4064a94573R874>`_:
-
-	"... a lot of people seem to think that performance is about doing the
-	same thing, just doing it faster, and that is not true. That is not what
-	performance is all about. If you can do something really fast, really
-	well, people will start using it differently."
-
-In this context Linus was talking about branching and merging,
-but this point also applies to testing. If your tests are slow, unreliable, are
-difficult to write, and require a special setup or special hardware to run,
-then you wait a lot longer to write tests, and you wait a lot longer to run
-tests; this means that tests are likely to break, unlikely to test a lot of
-things, and are unlikely to be rerun once they pass. If your tests are really
-fast, you run them all the time, every time you make a change, and every time
-someone sends you some code. Why trust that someone ran all their tests
-correctly on every change when you can just run them yourself in less time than
-it takes to read their test log?
+Get started now: :doc:`start`
 
 How do I use it?
 ================
@@ -81,3 +41,5 @@ How do I use it?
 *   :doc:`start` - for new users of KUnit
 *   :doc:`usage` - for a more detailed explanation of KUnit features
 *   :doc:`api/index` - for the list of KUnit APIs used for testing
+*   :doc:`kunit-tool` - for more information on the kunit_tool helper script
+*   :doc:`faq` - for answers to some common questions about KUnit
diff --git a/Documentation/dev-tools/kunit/start.rst b/Documentation/dev-tools/kunit/start.rst
index 4e1d24db6b13..e1c5ce80ce12 100644
--- a/Documentation/dev-tools/kunit/start.rst
+++ b/Documentation/dev-tools/kunit/start.rst
@@ -9,11 +9,10 @@ Installing dependencies
 KUnit has the same dependencies as the Linux kernel. As long as you can build
 the kernel, you can run KUnit.
 
-KUnit Wrapper
-=============
-Included with KUnit is a simple Python wrapper that helps format the output to
-easily use and read KUnit output. It handles building and running the kernel, as
-well as formatting the output.
+Running tests with the KUnit Wrapper
+====================================
+Included with KUnit is a simple Python wrapper which runs tests under User Mode
+Linux, and formats the test results.
 
 The wrapper can be run with:
 
@@ -21,22 +20,42 @@ The wrapper can be run with:
 
 	./tools/testing/kunit/kunit.py run --defconfig
 
-For more information on this wrapper (also called kunit_tool) checkout the
+For more information on this wrapper (also called kunit_tool) check out the
 :doc:`kunit-tool` page.
 
 Creating a .kunitconfig
-=======================
-The Python script is a thin wrapper around Kbuild. As such, it needs to be
-configured with a ``.kunitconfig`` file. This file essentially contains the
-regular Kernel config, with the specific test targets as well.
-
+-----------------------
+If you want to run a specific set of tests (rather than those listed in the
+KUnit defconfig), you can provide Kconfig options in the ``.kunitconfig`` file.
+This file essentially contains the regular Kernel config, with the specific
+test targets as well. The ``.kunitconfig`` should also contain any other config
+options required by the tests.
+
+A good starting point for a ``.kunitconfig`` is the KUnit defconfig:
 .. code-block:: bash
 
 	cd $PATH_TO_LINUX_REPO
 	cp arch/um/configs/kunit_defconfig .kunitconfig
 
-Verifying KUnit Works
----------------------
+You can then add any other Kconfig options you wish, e.g.:
+.. code-block:: none
+
+        CONFIG_LIST_KUNIT_TEST=y
+
+:doc:`kunit_tool <kunit-tool>` will ensure that all config options set in
+``.kunitconfig`` are set in the kernel ``.config`` before running the tests.
+It'll warn you if you haven't included the dependencies of the options you're
+using.
+
+.. note::
+   Note that removing something from the ``.kunitconfig`` will not trigger a
+   rebuild of the ``.config`` file: the configuration is only updated if the
+   ``.kunitconfig`` is not a subset of ``.config``. This means that you can use
+   other tools (such as make menuconfig) to adjust other config options.
+
+
+Running the tests
+-----------------
 
 To make sure that everything is set up correctly, simply invoke the Python
 wrapper from your kernel repo:
@@ -62,6 +81,41 @@ followed by a list of tests that are run. All of them should be passing.
 	Because it is building a lot of sources for the first time, the
 	``Building KUnit kernel`` step may take a while.
 
+Running tests without the KUnit Wrapper
+=======================================
+
+If you'd rather not use the KUnit Wrapper (if, for example, you need to
+integrate with other systems, or use an architecture other than UML), KUnit can
+be included in any kernel, and the results read out and parsed manually.
+
+.. note::
+   KUnit is not designed for use in a production system, and it's possible that
+   tests may reduce the stability or security of the system.
+
+
+
+Configuring the kernel
+----------------------
+
+In order to enable KUnit itself, you simply need to enable the ``CONFIG_KUNIT``
+Kconfig option (it's under Kernel Hacking/Kernel Testing and Coverage in
+menuconfig). From there, you can enable any KUnit tests you want: they usually
+have config options ending in ``_KUNIT_TEST``.
+
+KUnit and KUnit tests can be compiled as modules: in this case the tests in a
+module will be run when the module is loaded.
+
+Running the tests
+-----------------
+
+Build and run your kernel as usual. Test output will be written to the kernel
+log in `TAP <https://testanything.org/>`_ format.
+
+.. note::
+   It's possible that there will be other lines and/or data interspersed in the
+   TAP output.
+
+
 Writing your first test
 =======================
 
-- 
2.25.0.341.g760bfbb309-goog

